Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 644FDC36010
	for <buildroot@archiver.kernel.org>; Mon,  7 Apr 2025 19:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 286FD40BD6;
	Mon,  7 Apr 2025 19:19:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XPoHmByDCvtj; Mon,  7 Apr 2025 19:19:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 648C140C39
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 648C140C39;
	Mon,  7 Apr 2025 19:19:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 474851DE
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 19:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 390B040C39
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 19:19:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zH7z5rBnil5o for <buildroot@buildroot.org>;
 Mon,  7 Apr 2025 19:19:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.146;
 helo=smtpcmd13146.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3A29040BD6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A29040BD6
Received: from smtpcmd13146.aruba.it (smtpcmd13146.aruba.it [62.149.156.146])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A29040BD6
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 19:19:11 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 1rzwuTK0X6z5Z1rzxuceNO; Mon, 07 Apr 2025 21:19:09 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>, Petr Vorel <petr.vorel@gmail.com>
Date: Mon,  7 Apr 2025 21:19:07 +0200
Message-Id: <20250407191908.260835-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJ8VZucdr8sTLUA8gZnT3WhC9d5GjE4+JJux5LZEz4MLoFvksZoDUZBpbUWM4p/U99Ka+KPcUm1QpWWJRAU+qdDS9PApM6IpnZ9ZQPdAt2KsDpKuRmi2
 cB0HRuh8t06j0iLFHSbIGYTuBRmhSZrUoepa7TOnqMYJslHeLFXyvBhT8uqcEGkik1FV1xRQSmhHlZ/mkWzrzG3Jsk7ctcvX/Ynbe8BWW8UphAPJDZNbufUT
 ZENPanR6mvMZsSzkbdZLAYBJ9i5dq830hV/4KQMdSz6NraGSd62iEv92hcYy+qCfFnJ1hIDaF6d3kwgd77CvykI5pVN2Q6hF1uRlAUaC2g2gY6YMw8pKeF2m
 OJR7ixMn
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1744053549; bh=4paj1/s+Ho8PYLjmRiJ7RAGr/5FES7+zmSRROiXiNNM=;
 h=From:To:Subject:Date:MIME-Version;
 b=N5OwVlRYLe/RCORluVQtWjvL8EO2QK4TpqdqUylrhYn1DxHn4LW1ZgUu/J2owiWP3
 tWUbkw4cb6pnqopncjEUbrzIrHIlfqnUuI25JmjLoJqRN3umwSTW6/aXeQl23KTxcb
 cKOVJnG2STJC7VdVB1uyfjfMCIwJGY+s2VfhlBcMcsGQvnig7xJmd/VBejUIX0iFDa
 SkbdMnD4vjlzbtnGsaORv1zZT33+VD9lv3B90U4XaDiPfK/BmADFkJ2WoRNWv30dzK
 jgEoHfSdFDvwquIOS40Pu9LLkFF6z1AIe6bzGaUS48OcdiECxCAuvJ09nUYI4Kb5cp
 H2LY1IIc3EEzw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=N5OwVlRY
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.110
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For release note, see:
https://hg.mozilla.org/projects/nss/diff/997c76f8a94c85b05ce85c9ae0ba3b3d600c26f3/doc/rst/releases/nss_3_110.rst

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 9244a0000d..9b9252e77f 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_109_RTM/src/SHA256SUMS
-sha256  bea46c256118cd8910202f05339627d75291f13b80054527df58419b9d29c18b  nss-3.109.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_110_RTM/src/SHA256SUMS
+sha256  9cd610c40422a07771b9b45166be2d052ea2f00b605a7928129e1f2071b3ae27  nss-3.110.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 959d2ccbaf..8dd994deb6 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.109
+LIBNSS_VERSION = 3.110
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
