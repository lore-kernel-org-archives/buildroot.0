Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58987E748E9
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 16:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EAAC821A3;
	Sun,  1 Oct 2023 16:32:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EAAC821A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zFk-EmLkF_Wb; Sun,  1 Oct 2023 16:32:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AFEC821A6;
	Sun,  1 Oct 2023 16:32:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AFEC821A6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A55DA1BF5A2
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 16:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49AA5418DF
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 16:31:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49AA5418DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4amEVcfUheZC for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 16:31:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 157DB4180B
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 16:31:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 157DB4180B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 01CC683DB9; Sun,  1 Oct 2023 16:31:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Oct 2023 18:31:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 43da0b8f78c890750a84d5085ba8163d51876c52
X-Git-Newrev: 4947445f278c1ca4476ca48220a5c1a7fb8ff9d4
X-Patchwork-Hint: ignore
Message-Id: <20231001163134.01CC683DB9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/spirv-headers: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4947445f278c1ca4476ca48220a5c1a7fb8ff9d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These headers are required to build the pacakge spirv-tools which is
requried by mesa3d for building rusticl:

https://docs.mesa3d.org/rusticl.html

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/spirv-headers/Config.in          |  6 ++++++
 package/spirv-headers/spirv-headers.hash |  3 +++
 package/spirv-headers/spirv-headers.mk   | 15 +++++++++++++++
 5 files changed, 26 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c1d9577ba5..c45e7315da 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2650,6 +2650,7 @@ N:	Sebastian Weyer <sebastian.weyer@smile.fr>
 F:      package/amlogic-boot-fip/
 F:	package/nushell/
 F:	package/rust-bindgen/
+F:	package/spirv-headers/
 F:	support/testing/tests/package/sample_nu.nu
 F:	support/testing/tests/package/test_nu.py
 
diff --git a/package/Config.in b/package/Config.in
index d6364f976a..d673f0616d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -370,6 +370,7 @@ comment "Graphic libraries"
 	source "package/sdl2_mixer/Config.in"
 	source "package/sdl2_net/Config.in"
 	source "package/sdl2_ttf/Config.in"
+	source "package/spirv-headers/Config.in"
 	source "package/tk/Config.in"
 	source "package/vulkan-headers/Config.in"
 	source "package/vulkan-loader/Config.in"
diff --git a/package/spirv-headers/Config.in b/package/spirv-headers/Config.in
new file mode 100644
index 0000000000..fd20f301d4
--- /dev/null
+++ b/package/spirv-headers/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_SPIRV_HEADERS
+	bool "spirv-headers"
+	help
+	  Machine-readable files for the SPIR-V Registry
+
+	  https://www.khronos.org/registry/spir-v
diff --git a/package/spirv-headers/spirv-headers.hash b/package/spirv-headers/spirv-headers.hash
new file mode 100644
index 0000000000..136f3df733
--- /dev/null
+++ b/package/spirv-headers/spirv-headers.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  32b4c6ae6a2fa9b56c2c17233c8056da47e331f76e117729925825ea3e77a739  spirv-headers-1.3.261.1.tar.gz
+sha256  9b243f6f0bf44e295ff411a0f7b7642d1d0dff7cdc42507e9f7206f439e51b5a  LICENSE
diff --git a/package/spirv-headers/spirv-headers.mk b/package/spirv-headers/spirv-headers.mk
new file mode 100644
index 0000000000..3ab506e0db
--- /dev/null
+++ b/package/spirv-headers/spirv-headers.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# spirv-headers
+#
+################################################################################
+
+SPIRV_HEADERS_VERSION = 1.3.261.1
+SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,sdk-$(SPIRV_HEADERS_VERSION))
+SPIRV_HEADERS_LICENSE = MIT
+SPIRV_HEADERS_LICENSE_FILES = LICENSE
+
+SPIRV_HEADERS_INSTALL_STAGING = YES
+SPIRV_HEADERS_INSTALL_TARGET = NO
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
