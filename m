Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B857CC54E4A
	for <buildroot@archiver.kernel.org>; Thu,  7 Mar 2024 19:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AA1182D2F;
	Thu,  7 Mar 2024 19:52:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bLsUmwQC7PQh; Thu,  7 Mar 2024 19:52:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EB0882D49
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EB0882D49;
	Thu,  7 Mar 2024 19:52:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 624DB1BF399
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 19:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A3FD41B84
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 19:52:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cOqrqpsOVp_6 for <buildroot@lists.busybox.net>;
 Thu,  7 Mar 2024 19:52:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.217;
 helo=smtpcmd01-g.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A9B4E41B83
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9B4E41B83
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A9B4E41B83
 for <buildroot@buildroot.org>; Thu,  7 Mar 2024 19:52:37 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id iJn8rKWhJHsqHiJn8r6JUg; Thu, 07 Mar 2024 20:52:35 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu,  7 Mar 2024 20:52:33 +0100
Message-Id: <20240307195233.2186701-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfPqYrBcfokbCs3P4M8PksNUXxT/udKm0uuj2Yp0tVTNJDovvzDFvKixKiGO4NGPDAtTxF+1jvkksxO6ZymBjT5qpZ63TLcCD8e8QqS0Vg70upeGTRQGd
 e/KTB8ZhZNyXNEraWLswjCUwP4lbt66ThtSMdeXyKEh2jISek5aBGFFr0vsIO46+CL0TZ6ACIFIucvMfjqoUXOLevv+INEMRQUgYwhieet1tFttqpxE+4JsC
 +r6ONlemkN1qnQok4sIanrmXjT0Srur44diLbzX/iIFMhJ9cluk5tGVifc6QEfpJLGSEKwpjBMNLnY9ux//NagOF+8NltNkmh8k+vSw9Alo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1709841155; bh=+tpWKF8D7g96h08qLf0FnOfuaGVqGYm1QcP8KbDlnks=;
 h=From:To:Subject:Date:MIME-Version;
 b=AxtImN03irE0XNHynK10Ij9WlNiH/hkLo8dMwmRW8uHEW+cFUWpvurEsVDbe2a9LC
 R2I26smKaiPiimp02CboYXsh/vALQ1AdvfzQPGcUcdd+3gb7ThFrjhVFbOZgRwuWnN
 CcSDLbNM0Ozz9Zb7TGRcwAG37/StYpuP4KBliahYp6+TAer5VMJOeJqgrw8z0gbr/G
 tc15BhQwxr/2n40tEgUMh7YN4BSj67GGrjnesrdn/T5DibwVNlv/igSLi1IdE5XA7e
 bAWQ0j9DCDL4K046q0fmX6cgUyIncqs3SzqqDHOIL6w4MGDfh03AfnxyY5dYuUAbAe
 eMJ3JjsB9vjLA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=AxtImN03
Subject: [Buildroot] [PATCH] package/mmc-utils: bump version to 2024-03-05
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/06f972f95f4f2e0e7504b1fa069b89695b7377ef

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/mmc-utils/mmc-utils.hash | 2 +-
 package/mmc-utils/mmc-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mmc-utils/mmc-utils.hash b/package/mmc-utils/mmc-utils.hash
index cd9d13324f..2c1bb86066 100644
--- a/package/mmc-utils/mmc-utils.hash
+++ b/package/mmc-utils/mmc-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  84be5003ae83b4fdb0279a693f320fd472aebd14908a1ac16bda4f675e92ad40  mmc-utils-80271e9a6fd0db9cb3a85d024664da886e94315c-br1.tar.gz
+sha256  83b1bd7602b0c8d05a8ff2f842d80fa7c9a0b084b7159bb9eed796b0075b94d1  mmc-utils-e1281d4de9166b7254ba30bb58f9191fc2c9e7fb-br1.tar.gz
 sha256  4207d81122a02555f78c5a11b61c83a331ee03dc933e1ef9dd932ef9b434d12d  README
diff --git a/package/mmc-utils/mmc-utils.mk b/package/mmc-utils/mmc-utils.mk
index ef4d97c1ca..48c347d846 100644
--- a/package/mmc-utils/mmc-utils.mk
+++ b/package/mmc-utils/mmc-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MMC_UTILS_VERSION = 80271e9a6fd0db9cb3a85d024664da886e94315c
+MMC_UTILS_VERSION = e1281d4de9166b7254ba30bb58f9191fc2c9e7fb
 MMC_UTILS_SITE = https://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git
 MMC_UTILS_SITE_METHOD = git
 MMC_UTILS_LICENSE = GPL-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
