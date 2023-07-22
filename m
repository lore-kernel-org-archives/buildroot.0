Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 005D7EB64DA
	for <buildroot@archiver.kernel.org>; Sat, 22 Jul 2023 08:03:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 724EF83638;
	Sat, 22 Jul 2023 08:03:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 724EF83638
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yy1np25PobjG; Sat, 22 Jul 2023 08:03:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CCF383595;
	Sat, 22 Jul 2023 08:03:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CCF383595
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F8F81BF2A5
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 08:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11C10822BF
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 08:03:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11C10822BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qN0ieIrnx0oc for <buildroot@lists.busybox.net>;
 Sat, 22 Jul 2023 08:03:18 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D1AF082281
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 08:03:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1AF082281
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4E82BA4C066D
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 10:03:14 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43252)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qN7a6-0002zE-05
 for buildroot@buildroot.org; Sat, 22 Jul 2023 10:03:14 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 22 Jul 2023 10:03:13 +0200
Message-Id: <20230722080313.3515304-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690012994;
 bh=068yNHLgwAcciMpNsfx2uThcOyA+RLzsJxWjOdiP4Qs=;
 h=From:To:Subject:Date:From;
 b=eFSJNcsOeALPDJ8up7fOr893+GFnBFJZP7bu1u6ycU0aBSaRpqVhKEULEc/pEClVe
 /h1sTmTNBXFYvgRNfPhJnK7Gkcxw2zaZ5Qf4QIGCbdMISt0dOd4SU6Dg9L/xveGQTi
 UvYrbvdg/Co/k7M2synShHxZS3lj28KrcqmwTtLOkl0wP80V8acV3um3DG/LH7qnBp
 l0gMI5syQUne6tb//fPm3/SgXV7smGTKUMNjTv8Pq2EBNFjWggoV8fl8uzOS9y8nZB
 Xk5K1Fk0SaapvS7ku0gZ1xmiAdYVhnSI2sbcL+eF52uXZeZAHKvJTFvWjE/o/zCVLN
 rJaGbqYunJIxw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=eFSJNcsO
Subject: [Buildroot] [PATCH 1/1] package/tpm2-tss: security bump version to
 3.2.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes CVE-2023-22745.

Changelog:
https://github.com/tpm2-software/tpm2-tss/blob/3.2.x/CHANGELOG.md

Changed the ac_cv_prog variables due to an upstream commit which changed
the detection of groupadd/useradd:
https://github.com/tpm2-software/tpm2-tss/commit/7fde604383c62fc764a1e060dff48fc06f79860b

Buildroot commit a85f5f2a412db894fdf548e10d12e7c56eda9107 bumped
tpm2-pkcs11 to 1.8.0 which includes a commit bumping the required
version of tpm2-tss to >= 3.2
https://github.com/tpm2-software/tpm2-pkcs11/commit/940b661e330cac0ecc7d4db5d3626ef828ecdda8

Fixes:
http://autobuild.buildroot.net/results/6fd/6fddfee6f852ce835c5d1178e6913b6ab1b3fe50/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/tpm2-tss/tpm2-tss.hash | 2 +-
 package/tpm2-tss/tpm2-tss.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/tpm2-tss/tpm2-tss.hash b/package/tpm2-tss/tpm2-tss.hash
index b6eb3c1f97..c9fa4e6ae0 100644
--- a/package/tpm2-tss/tpm2-tss.hash
+++ b/package/tpm2-tss/tpm2-tss.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  8900a6603f74310b749b65f23c3461cde6e2a23a5f61058b21004c25f9cf19e8  tpm2-tss-3.1.0.tar.gz
+sha256  ba9e52117f254f357ff502e7d60fce652b3bfb26327d236bbf5ab634235e40f1  tpm2-tss-3.2.2.tar.gz
 sha256  18c1bf4b1ba1fb2c4ffa7398c234d83c0d55475298e470ae1e5e3a8a8bd2e448  LICENSE
diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
index 060883c377..10d605fc65 100644
--- a/package/tpm2-tss/tpm2-tss.mk
+++ b/package/tpm2-tss/tpm2-tss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TPM2_TSS_VERSION = 3.1.0
+TPM2_TSS_VERSION = 3.2.2
 TPM2_TSS_SITE = https://github.com/tpm2-software/tpm2-tss/releases/download/$(TPM2_TSS_VERSION)
 TPM2_TSS_LICENSE = BSD-2-Clause
 TPM2_TSS_LICENSE_FILES = LICENSE
@@ -26,7 +26,8 @@ TPM2_TSS_CONF_OPTS = \
 	ac_cv_prog_result_setfacl=yes \
 	ac_cv_prog_systemd_sysusers=no \
 	ac_cv_prog_systemd_tmpfiles=no \
-	ac_cv_prog_result_useradd=yes \
+	ac_cv_prog_useradd=yes \
+	ac_cv_prog_groupadd=yes \
 	--with-crypto=ossl \
 	--disable-doxygen-doc \
 	--disable-defaultflags
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
