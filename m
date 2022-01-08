Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57898C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 18:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F2218143A;
	Sat,  8 Jan 2022 18:05:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RWQkgYT8bMZk; Sat,  8 Jan 2022 18:05:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65ECD81750;
	Sat,  8 Jan 2022 18:05:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6C2AA1BF593
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48CE04011F
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:04:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AwwV_Za5qbQq for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 18:04:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 627C640127
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 18:04:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9D162832CE; Sat,  8 Jan 2022 17:58:45 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 19:04:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 203f0a917d2f726f7af241025c10663c01ae5c53
X-Git-Newrev: f8b6d3931ffdb83833590ba596d595e661b0156c
X-Patchwork-Hint: ignore
Message-Id: <20220108175845.9D162832CE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ti-sgx-um: make it a provider of
 libgbm
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

commit: https://git.buildroot.net/buildroot/commit/?id=f8b6d3931ffdb83833590ba596d595e661b0156c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The OpenGL ES implementation provides a libgbm implementation, so
provide the corresponding virtual package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ti-sgx-um/Config.in    | 5 +++++
 package/ti-sgx-um/ti-sgx-um.mk | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/ti-sgx-um/Config.in b/package/ti-sgx-um/Config.in
index b97469a364..2dea104b58 100644
--- a/package/ti-sgx-um/Config.in
+++ b/package/ti-sgx-um/Config.in
@@ -15,6 +15,8 @@ config BR2_PACKAGE_TI_SGX_UM
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBDRM_OMAP
 	select BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_HAS_LIBGBM
+	select BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
 	select BR2_PACKAGE_HAS_LIBGLES
 	select BR2_PACKAGE_HAS_POWERVR
 	select BR2_PACKAGE_LIBFFI
@@ -31,6 +33,9 @@ if BR2_PACKAGE_TI_SGX_UM
 config BR2_PACKAGE_PROVIDES_LIBEGL
 	default "ti-sgx-um"
 
+config BR2_PACKAGE_PROVIDES_LIBGBM
+	default "ti-sgx-um"
+
 config BR2_PACKAGE_PROVIDES_LIBGLES
 	default "ti-sgx-um"
 
diff --git a/package/ti-sgx-um/ti-sgx-um.mk b/package/ti-sgx-um/ti-sgx-um.mk
index 0a1d46c384..aeee90686b 100644
--- a/package/ti-sgx-um/ti-sgx-um.mk
+++ b/package/ti-sgx-um/ti-sgx-um.mk
@@ -11,7 +11,7 @@ TI_SGX_UM_SITE_METHOD = git
 TI_SGX_UM_LICENSE = TI TSPA License
 TI_SGX_UM_LICENSE_FILES = TI-Linux-Graphics-DDK-UM-Manifest.doc
 TI_SGX_UM_INSTALL_STAGING = YES
-TI_SGX_UM_PROVIDES = libegl libgles powervr
+TI_SGX_UM_PROVIDES = libegl libgbm libgles powervr
 TI_SGX_UM_TARGET=ti335x
 
 # ti-sgx-um is a egl/gles provider only if libdrm is installed
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
