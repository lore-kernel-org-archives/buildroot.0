Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A911FC3ABBF
	for <buildroot@archiver.kernel.org>; Wed,  7 May 2025 18:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AF8D83323;
	Wed,  7 May 2025 18:44:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FAAPmXrbFE08; Wed,  7 May 2025 18:44:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42B5483B38
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42B5483B38;
	Wed,  7 May 2025 18:44:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DD5FF439
 for <buildroot@buildroot.org>; Wed,  7 May 2025 18:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE83D83C49
 for <buildroot@buildroot.org>; Wed,  7 May 2025 18:44:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k717Yny6heJy for <buildroot@buildroot.org>;
 Wed,  7 May 2025 18:44:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.133;
 helo=smtpdh18-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1252683323
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1252683323
Received: from smtpdh18-2.aruba.it (smtpdh18-2.aruba.it [62.149.155.133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1252683323
 for <buildroot@buildroot.org>; Wed,  7 May 2025 18:44:47 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id Cjl7ui7rBWAxHCjl7u3GZI; Wed, 07 May 2025 20:44:45 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed,  7 May 2025 20:44:44 +0200
Message-Id: <20250507184444.1936957-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfFyd2Gfw/sH1Y6BqWo/30cQjvZ5N3p0smmpDMcXJXzHOYK4Cmed0YREe8DndBfZF5qcAdJUqn7QnCAC3OrHpJUnB8QPmOna8W17Gy3XNAvnsuYXACpaP
 y6YpCc0sA/91NPpNYFZVqNX7qjXsbt+EASSTFJ448FFQFBPpHpfuj/5NtgoITls3MkPvQBHulaWlt9UjIFt6CWL5BedWhjDXDd7oE1R8Yj9BW4CHGfWye4Yt
 l4gr5A+xHAMqcFPk6IpWvZIj7HzNQJo4Riew73W8toRtjIcSpErFsztFmWLrfMwtAqCj4fkpKyuuW+4uocOdhA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1746643485; bh=ThU27J0coENfW+ecZfGwPtO1Bk34pMsFXwZwBusYw1w=;
 h=From:To:Subject:Date:MIME-Version;
 b=VR0ETnaX44RnPO3Lg2FiQ3r36t7oXY+cFo99Qi03ooTKvq/OjusLvUW7x9dxpApzd
 uMwuoYKdsyA8YODX8qtuala7FDa1sB1xISt/bGHz6UnXMvz7ec4vYNmB10ZhX8uf3K
 Miv0VUwAFeBl1RClVW/LJQeM0Ip32hu1Lry3Z7L4GZI2ZW8ib0nTWdEhhKdk6rm+Ln
 fH+R3NELIkgJisMRwNk1l4gnN6TIWvLgZsSGLq3SwNZmbVyIlmgcZxegBCIRkpgFe4
 xCVESJafRGhy4TmH6xp7R0uvSJ+gm1h06URX0Z4/zrSIicDUKCpo/aQsvyVBBTZ9Jq
 ns+vdSNjZ0HcQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=VR0ETnaX
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.111
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
https://hg-edge.mozilla.org/projects/nss/file/tip/doc/rst/releases/nss_3_111.rst

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 9b9252e77f..03e91e4212 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_110_RTM/src/SHA256SUMS
-sha256  9cd610c40422a07771b9b45166be2d052ea2f00b605a7928129e1f2071b3ae27  nss-3.110.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_111_RTM/src/SHA256SUMS
+sha256  5a4d5a44e91ef03cdc0c4897cf616e3c92f4e590ea835d3e0ccad8b005bd73c6  nss-3.111.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 8dd994deb6..9e848aa332 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.110
+LIBNSS_VERSION = 3.111
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
