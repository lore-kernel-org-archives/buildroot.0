Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D6DC3DA41
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 20:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25C4583EF1;
	Wed, 10 Jul 2024 20:17:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G2Yhis6H2YGc; Wed, 10 Jul 2024 20:17:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C435683EE3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C435683EE3;
	Wed, 10 Jul 2024 20:17:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1892F1BF599
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 20:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4291F803D1
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 20:17:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KYBF53EJmdu7 for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 20:17:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47DB681F8E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47DB681F8E
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 20:17:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 342AE820FD; Wed, 10 Jul 2024 20:17:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Jul 2024 22:13:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0cde01e17bb03aee44b5ccb1549eaf6dec7f3ca5
X-Git-Newrev: c1b4c8af0bca62267b29e6ee4759bede0086e28f
X-Patchwork-Hint: ignore
Message-Id: <20240710201710.342AE820FD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/onevpl-intel-gpu: rename package
 to intel-vpl-gpu-rt
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
Content-Type: multipart/mixed; boundary="===============3764690733675684787=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3764690733675684787==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c1b4c8af0bca62267b29e6ee4759bede0086e28f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream renamed the package and moved the github repo:
https://github.com/intel/vpl-gpu-rt/commit/74dbcc6240e8315ad927f642a5d733e6a515a1d4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                                          |  8 ++++++++
 DEVELOPERS                                                |  2 +-
 package/Config.in                                         |  2 +-
 package/{onevpl-intel-gpu => intel-vpl-gpu-rt}/Config.in  | 13 +++++++------
 .../intel-vpl-gpu-rt.hash}                                |  2 +-
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk              | 15 +++++++++++++++
 package/onevpl-intel-gpu/onevpl-intel-gpu.mk              | 15 ---------------
 7 files changed, 33 insertions(+), 24 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 9dd5bdd2eb..a5f7638415 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2024.08"
 
+config BR2_PACKAGE_ONEVPL_INTEL_GPU
+	bool "onevpl-intel-gpu has been renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_INTEL_VPL_GPU_RT
+	help
+	  The onevpl-intel-gpu package has been renamed to
+	  intel-vpl-gpu-rt.
+
 config BR2_PACKAGE_CGIC
 	bool "cgic has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 0e971b9beb..abef581075 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -385,6 +385,7 @@ F:	package/intel-gmmlib/
 F:	package/intel-mediadriver/
 F:	package/intel-mediasdk/
 F:	package/intel-microcode/
+F:	package/intel-vpl-gpu-rt/
 F:	package/jsoncpp/
 F:	package/kodi*
 F:	package/lame/
@@ -455,7 +456,6 @@ F:	package/mjpg-streamer/
 F:	package/mpg123/
 F:	package/ntp/
 F:	package/nut/
-F:	package/onevpl-intel-gpu/
 F:	package/opus/
 F:	package/pciutils/
 F:	package/perl-crypt-openssl-guess/
diff --git a/package/Config.in b/package/Config.in
index 6406fd410a..8dc8b5ed5d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1664,6 +1664,7 @@ menu "Graphics"
 	source "package/intel-gmmlib/Config.in"
 	source "package/intel-mediadriver/Config.in"
 	source "package/intel-mediasdk/Config.in"
+	source "package/intel-vpl-gpu-rt/Config.in"
 	source "package/irrlicht/Config.in"
 	source "package/jasper/Config.in"
 	source "package/jbig2dec/Config.in"
@@ -1710,7 +1711,6 @@ menu "Graphics"
 	source "package/libvpl/Config.in"
 	source "package/libwpe/Config.in"
 	source "package/menu-cache/Config.in"
-	source "package/onevpl-intel-gpu/Config.in"
 	source "package/opencl-clhpp/Config.in"
 	source "package/opencv3/Config.in"
 	source "package/opencv4/Config.in"
diff --git a/package/onevpl-intel-gpu/Config.in b/package/intel-vpl-gpu-rt/Config.in
similarity index 69%
rename from package/onevpl-intel-gpu/Config.in
rename to package/intel-vpl-gpu-rt/Config.in
index 740e954ee5..da26ea6aa5 100644
--- a/package/onevpl-intel-gpu/Config.in
+++ b/package/intel-vpl-gpu-rt/Config.in
@@ -1,5 +1,5 @@
-config BR2_PACKAGE_ONEVPL_INTEL_GPU
-	bool "onevpl-intel-gpu"
+config BR2_PACKAGE_INTEL_VPL_GPU_RT
+	bool "intel-vpl-gpu-rt"
 	depends on BR2_x86_64 # intel-mediadriver
 	depends on BR2_PACKAGE_LIBVPL_ARCH_SUPPORTS # libvpl
 	depends on BR2_INSTALL_LIBSTDCPP # libvpl
@@ -12,12 +12,13 @@ config BR2_PACKAGE_ONEVPL_INTEL_GPU
 	select BR2_PACKAGE_LIBVA
 	select BR2_PACKAGE_LIBVPL
 	help
-	  Intel® oneVPL GPU Runtime is a Runtime implementation of
-	  oneVPL API for Intel Gen GPUs, starting with Tiger Lake.
+	  Intel® Video Processing Library (Intel® VPL) GPU Runtime is a
+	  Runtime implementation of Intel® VPL API for Intel Gen GPUs,
+	  starting with Tiger Lake.
 
-	  https://github.com/oneapi-src/oneVPL-intel-gpu
+	  https://github.com/intel/vpl-gpu-rt
 
-comment "onevpl-intel-gpu needs a toolchain w/ dynamic library, gcc >= 7, C++, NPTL"
+comment "intel-vpl-gpu-rt needs a toolchain w/ dynamic library, gcc >= 7, C++, NPTL"
 	depends on BR2_x86_64
 	depends on BR2_PACKAGE_LIBVPL_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_1
diff --git a/package/onevpl-intel-gpu/onevpl-intel-gpu.hash b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
similarity index 80%
rename from package/onevpl-intel-gpu/onevpl-intel-gpu.hash
rename to package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
index 59b1c5a23c..6b57b4674c 100644
--- a/package/onevpl-intel-gpu/onevpl-intel-gpu.hash
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b261d87d91a56a6a462f6a129ddd97945a49637995ee6aa67ebd9b26c0a3c1a0  onevpl-intel-gpu-24.2.1.tar.gz
+sha256  b261d87d91a56a6a462f6a129ddd97945a49637995ee6aa67ebd9b26c0a3c1a0  intel-vpl-gpu-rt-24.2.1.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
new file mode 100644
index 0000000000..e3ca68926e
--- /dev/null
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# intel-vpl-gpu-rt
+#
+################################################################################
+
+INTEL_VPL_GPU_RT_VERSION = 24.2.1
+INTEL_VPL_GPU_RT_SITE = $(call github,intel,vpl-gpu-rt,intel-onevpl-$(INTEL_VPL_GPU_RT_VERSION))
+INTEL_VPL_GPU_RT_LICENSE = MIT
+INTEL_VPL_GPU_RT_LICENSE_FILES = LICENSE
+INTEL_VPL_GPU_RT_CPE_ID_VENDOR = intel
+INTEL_VPL_GPU_RT_CPE_ID_PRODUCT = onevpl_gpu_runtime
+INTEL_VPL_GPU_RT_DEPENDENCIES = libva libvpl
+
+$(eval $(cmake-package))
diff --git a/package/onevpl-intel-gpu/onevpl-intel-gpu.mk b/package/onevpl-intel-gpu/onevpl-intel-gpu.mk
deleted file mode 100644
index a68e628182..0000000000
--- a/package/onevpl-intel-gpu/onevpl-intel-gpu.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# onevpl-intel-gpu
-#
-################################################################################
-
-ONEVPL_INTEL_GPU_VERSION = 24.2.1
-ONEVPL_INTEL_GPU_SITE = $(call github,oneapi-src,oneVPL-intel-gpu,intel-onevpl-$(ONEVPL_INTEL_GPU_VERSION))
-ONEVPL_INTEL_GPU_LICENSE = MIT
-ONEVPL_INTEL_GPU_LICENSE_FILES = LICENSE
-ONEVPL_INTEL_GPU_CPE_ID_VENDOR = intel
-ONEVPL_INTEL_GPU_CPE_ID_PRODUCT = onevpl_gpu_runtime
-ONEVPL_INTEL_GPU_DEPENDENCIES = libva libvpl
-
-$(eval $(cmake-package))

--===============3764690733675684787==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3764690733675684787==--
