Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFC2C282D1
	for <buildroot@archiver.kernel.org>; Thu,  6 Mar 2025 23:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 990D580B84;
	Thu,  6 Mar 2025 23:49:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AMb1wsza4SdE; Thu,  6 Mar 2025 23:49:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD80D80B63
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD80D80B63;
	Thu,  6 Mar 2025 23:49:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DDD3695F
 for <buildroot@buildroot.org>; Thu,  6 Mar 2025 23:49:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D514D400D7
 for <buildroot@buildroot.org>; Thu,  6 Mar 2025 23:49:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gt9BoX7pdLiU for <buildroot@buildroot.org>;
 Thu,  6 Mar 2025 23:49:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.132;
 helo=smtpcmd04132.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EF95E400CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF95E400CE
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EF95E400CE
 for <buildroot@buildroot.org>; Thu,  6 Mar 2025 23:49:23 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id qKxstksPANbHHqKxstk30n; Fri, 07 Mar 2025 00:49:20 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri,  7 Mar 2025 00:49:19 +0100
Message-Id: <20250306234919.140543-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfM/wyffjN6lX8EVAcefFn/lH857Wmt3IbwGPF4RomUV5Im1bcNXlWGTEjSCZ+U9bzfqImcs011yHN5I3CR/hHw6/R54F0sflsBG1N7cRL1LheFyjhHvP
 9pSIBgg4oSwtXhRCIuZdL6liUuV0inGBp4LAV6lcsawal1TzPvw5NVCEGU2+gqIQIoCXBL/5pokd5e7sgaixNFl7TnWP+Q0NxgHIVn3IrH7Hi6AY9YflfXlP
 rI1A22Gt9c2ZisJqbuoll465XvSLWBK47j6i9eKOBdBQbbXlo4Yt+JqwayLPMEsDNgjdFueHpgr5ZiZRL3eiZg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1741304960; bh=H58RW24hrsIz1wkPJ+0YxDslB8qs8UET4EC61xq5j/w=;
 h=From:To:Subject:Date:MIME-Version;
 b=DSvycVYsCg42ZE8kcnero/k5/41Q/xCFOoTS/lVN0PvqoRizHpmko6sehedDnPRcT
 NjwhOxtbo/6j9KblNsWTpD1kfU1WBEyGwGxTSF2wQSnEfXbpD9JqiwrLevopErPuMV
 XNhQR59Q97gwNmXiHNYB0XqvYE+mk29iVPBVXmJiLV4wvbHNavreX2Mmx/g3uRRSY0
 +YjgjVPA5t8T3XUzQIUWP5Dnc+qhvuhTT5+wwbd+T8UzF1a8HdbV4dXjYt9E4u1NfY
 mWrkqhF5znCy/2DG9Xn3JhOvZTIsGy46qahn9vNkUmpKoRdSwI2V8PQldWX6Kb7ayz
 qVD2oYr0BrSPQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=DSvycVYs
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.109
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
https://hg.mozilla.org/projects/nss/diff/82eb56300e9d8e1e65312acc8ed11b26de8de222/doc/rst/releases/nss_3_109.rst

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 0f73002243..9244a0000d 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_108_RTM/src/SHA256SUMS
-sha256  a0f6fcb5dbadc1635b43827517a979e3a6d005d0788527802a6b31e2c5f66eec  nss-3.108.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_109_RTM/src/SHA256SUMS
+sha256  bea46c256118cd8910202f05339627d75291f13b80054527df58419b9d29c18b  nss-3.109.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 9a5afeaf4f..959d2ccbaf 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.108
+LIBNSS_VERSION = 3.109
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
