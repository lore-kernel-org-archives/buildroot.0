Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC30C71136
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 08:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F06A6146D;
	Thu, 12 Jun 2025 08:39:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N6QOW_CyOqyt; Thu, 12 Jun 2025 08:39:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8757761220
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8757761220;
	Thu, 12 Jun 2025 08:39:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B96C1E0
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 190A7406C9
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MSMHWR7iZkEm for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 08:38:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67E2140794
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67E2140794
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 59BF6811D1; Thu, 12 Jun 2025 08:38:33 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 7 Jun 2025 21:44:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dba2912be3096ae815c03aa4552dbcbc9cd46f0a
X-Git-Newrev: d2a82364ac923df26cfcd30edd3d755d90923323
X-Patchwork-Hint: ignore
Message-Id: <20250612083833.59BF6811D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opencl-icd-loader: new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d2a82364ac923df26cfcd30edd3d755d90923323
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This adds the OpenCL installable client driver (ICD) loader
which provides the 'libOpenCL.so' shared library needed to
run OpenCL programs.

Mesa3D can offer opencl implementations (such as rusticl),
but it does not provide 'libOpenCL.so'.

Without it, programs like 'clinfo' fail to build not
finding 'libOpenCL.so'.

see:
https://github.com/KhronosGroup/OpenCL-ICD-Loader

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
[Julien: add Medhi in DEVELOPERS for this package]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                       |  1 +
 package/Config.in                                |  1 +
 package/opencl-icd-loader/Config.in              | 12 ++++++++++++
 package/opencl-icd-loader/opencl-icd-loader.hash |  3 +++
 package/opencl-icd-loader/opencl-icd-loader.mk   | 22 ++++++++++++++++++++++
 5 files changed, 39 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ccfc8d4e0d..7031087157 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -913,6 +913,7 @@ F:	package/docopt-cpp/
 
 N:	El Mehdi YOUNES <elmehdi.younes@smile.fr>
 F:	package/opencl-headers/
+F:	package/opencl-icd-loader/
 
 N:	Eloi Bail <eloi.bail@savoirfairelinux.com>
 F:	package/bayer2rgb-neon/
diff --git a/package/Config.in b/package/Config.in
index 508cca23fc..10f6856dea 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1789,6 +1789,7 @@ menu "Graphics"
 	source "package/menu-cache/Config.in"
 	source "package/opencl-clhpp/Config.in"
 	source "package/opencl-headers/Config.in"
+	source "package/opencl-icd-loader/Config.in"
 	source "package/opencv3/Config.in"
 	source "package/opencv4/Config.in"
 	source "package/opencv4-contrib/Config.in"
diff --git a/package/opencl-icd-loader/Config.in b/package/opencl-icd-loader/Config.in
new file mode 100644
index 0000000000..405dc5401a
--- /dev/null
+++ b/package/opencl-icd-loader/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_OPENCL_ICD_LOADER
+	bool "OpenCL-ICD-Loader"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_HAS_LIBOPENCL
+	select BR2_PACKAGE_OPENCL_HEADERS
+	help
+	  OpenCL defines an Installable Client Driver (ICD) mechanism to
+	  allow developers to build applications against an Installable
+	  Client Driver loader (ICD loader) rather than linking their
+	  applications against a specific OpenCL implementation.
+
+	  https://github.com/KhronosGroup/OpenCL-ICD-Loader
diff --git a/package/opencl-icd-loader/opencl-icd-loader.hash b/package/opencl-icd-loader/opencl-icd-loader.hash
new file mode 100644
index 0000000000..da9f75b63a
--- /dev/null
+++ b/package/opencl-icd-loader/opencl-icd-loader.hash
@@ -0,0 +1,3 @@
+# locally generated
+sha256  95f2f0cda375b13d2760290df044ebea9c6ff954a7d7faa0867422442c9174dc  OpenCL-ICD-Loader-2024.10.24.tar.gz
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/opencl-icd-loader/opencl-icd-loader.mk b/package/opencl-icd-loader/opencl-icd-loader.mk
new file mode 100644
index 0000000000..cb3d7e462d
--- /dev/null
+++ b/package/opencl-icd-loader/opencl-icd-loader.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# opencl-icd-loader
+#
+################################################################################
+
+# The opencl-headers, opencl-icd-loader, and opencl-clhpp packages
+# must always be updated together to compatible versions.
+# Version desynchronization may result in build or runtime errors.
+# When updating one of them, make sure to check and update the others.
+OPENCL_ICD_LOADER_VERSION = 2024.10.24
+OPENCL_ICD_LOADER_SOURCE = OpenCL-ICD-Loader-$(OPENCL_ICD_LOADER_VERSION).tar.gz
+OPENCL_ICD_LOADER_SITE = $(call github,KhronosGroup,OpenCL-ICD-Loader,v$(OPENCL_ICD_LOADER_VERSION))
+OPENCL_ICD_LOADER_LICENSE = Apache-2.0
+OPENCL_ICD_LOADER_LICENSE_FILES = LICENSE
+OPENCL_ICD_LOADER_INSTALL_STAGING = YES
+
+OPENCL_ICD_LOADER_DEPENDENCIES = opencl-headers
+
+OPENCL_ICD_LOADER_CONF_OPTS += -DOPENCL_ICD_LOADER_HEADERS_DIR=$(STAGING_DIR)/usr/include
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
