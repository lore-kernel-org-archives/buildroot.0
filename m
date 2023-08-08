Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B621AEC8737
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 700E281382;
	Thu,  7 Sep 2023 15:18:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 700E281382
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g-qt3QisBe82; Thu,  7 Sep 2023 15:18:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A17CE831B4;
	Thu,  7 Sep 2023 15:18:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A17CE831B4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 178401BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B90B341E34
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B90B341E34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WeQlJ5hiMtx2 for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1CE0D41DB1
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CE0D41DB1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 154C986A1F; Thu,  7 Sep 2023 14:51:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 8 Aug 2023 19:15:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c50e9c21f0444b064bc257fcc0d3073fee945623
X-Git-Newrev: ac65841defece904e91afe1fb51419084c993dba
X-Patchwork-Hint: ignore
Message-Id: <20230907145128.154C986A1F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/onevpl-intel-gpu: new package
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
Content-Type: multipart/mixed; boundary="===============1081374772377523088=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1081374772377523088==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ac65841defece904e91afe1fb51419084c993dba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/onevpl-intel-gpu/Config.in             | 23 +++++++++++++++++++++++
 package/onevpl-intel-gpu/onevpl-intel-gpu.hash |  3 +++
 package/onevpl-intel-gpu/onevpl-intel-gpu.mk   | 13 +++++++++++++
 5 files changed, 41 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index eb703d52c7..7b6010a556 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -418,6 +418,7 @@ F:	package/mpg123/
 F:	package/ntp/
 F:	package/nut/
 F:	package/onevpl/
+F:	package/onevpl-intel-gpu/
 F:	package/opus/
 F:	package/pciutils/
 F:	package/perl-crypt-openssl-guess/
diff --git a/package/Config.in b/package/Config.in
index 58e653dcd9..1617f7488a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1643,6 +1643,7 @@ menu "Graphics"
 	source "package/libwpe/Config.in"
 	source "package/menu-cache/Config.in"
 	source "package/onevpl/Config.in"
+	source "package/onevpl-intel-gpu/Config.in"
 	source "package/opencl-clhpp/Config.in"
 	source "package/opencv3/Config.in"
 	source "package/opencv4/Config.in"
diff --git a/package/onevpl-intel-gpu/Config.in b/package/onevpl-intel-gpu/Config.in
new file mode 100644
index 0000000000..11a1c60a0f
--- /dev/null
+++ b/package/onevpl-intel-gpu/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_ONEVPL_INTEL_GPU
+	bool "onevpl-intel-gpu"
+	depends on BR2_PACKAGE_ONEVPL_ARCH_SUPPORTS # onevpl
+	depends on BR2_INSTALL_LIBSTDCPP # onevpl
+	depends on !BR2_STATIC_LIBS # onevpl
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # onevpl
+	depends on BR2_TOOLCHAIN_HAS_SYNC_1 # intel-mediadriver
+	depends on BR2_TOOLCHAIN_HAS_THREADS # onevpl
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # intel-mediadriver
+	select BR2_PACKAGE_INTEL_MEDIADRIVER # runtime
+	select BR2_PACKAGE_LIBVA
+	select BR2_PACKAGE_ONEVPL
+	help
+	  Intel® oneVPL GPU Runtime is a Runtime implementation of
+	  oneVPL API for Intel Gen GPUs, starting with Tiger Lake.
+
+	  https://github.com/oneapi-src/oneVPL-intel-gpu
+
+comment "onevpl-intel-gpu needs a toolchain w/ dynamic library, gcc >= 7, C++, NPTL"
+	depends on BR2_PACKAGE_ONEVPL_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_1
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
+		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/onevpl-intel-gpu/onevpl-intel-gpu.hash b/package/onevpl-intel-gpu/onevpl-intel-gpu.hash
new file mode 100644
index 0000000000..fa8e96959b
--- /dev/null
+++ b/package/onevpl-intel-gpu/onevpl-intel-gpu.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  51052b2cb0c1d0e628aa1e04b19ffdcd5098993c6c368045a79d87d21ca4ebe5  onevpl-intel-gpu-23.3.1.tar.gz
+sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/onevpl-intel-gpu/onevpl-intel-gpu.mk b/package/onevpl-intel-gpu/onevpl-intel-gpu.mk
new file mode 100644
index 0000000000..33b32b5d94
--- /dev/null
+++ b/package/onevpl-intel-gpu/onevpl-intel-gpu.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# onevpl-intel-gpu
+#
+################################################################################
+
+ONEVPL_INTEL_GPU_VERSION = 23.3.1
+ONEVPL_INTEL_GPU_SITE = $(call github,oneapi-src,oneVPL-intel-gpu,intel-onevpl-$(ONEVPL_INTEL_GPU_VERSION))
+ONEVPL_INTEL_GPU_LICENSE = MIT
+ONEVPL_INTEL_GPU_LICENSE_FILES = LICENSE
+ONEVPL_INTEL_GPU_DEPENDENCIES = libva onevpl
+
+$(eval $(cmake-package))

--===============1081374772377523088==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1081374772377523088==--
