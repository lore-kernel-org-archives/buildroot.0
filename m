Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A41C5C83F12
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 17:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C03141526;
	Tue, 29 Aug 2023 17:03:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C03141526
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rOfHXSkq5GHo; Tue, 29 Aug 2023 17:03:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B80494158D;
	Tue, 29 Aug 2023 17:03:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B80494158D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1F2F31BF97E
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 17:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19480610EF
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 17:03:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19480610EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i3Up2_SepHp9 for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 17:03:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCA306113B
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 17:03:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCA306113B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 980798649A; Tue, 29 Aug 2023 17:03:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 29 Aug 2023 18:54:01 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: bf041313f95cfd3b592621c875d7dfdf5c7f4d86
X-Git-Newrev: e25f6feace525e022d5bf220814c662f168f1dea
X-Patchwork-Hint: ignore
Message-Id: <20230829170309.980798649A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/tpm2-tss:
 security bump version to 3.2.2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e25f6feace525e022d5bf220814c662f168f1dea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 598bfea96d9114ede3d04926f56d24e7b57db8af)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
