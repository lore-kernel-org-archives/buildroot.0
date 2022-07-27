Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C1D4C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 07:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F938403E2;
	Wed, 27 Jul 2022 07:17:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F938403E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vxF3_uS4EHGN; Wed, 27 Jul 2022 07:17:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D614A403E9;
	Wed, 27 Jul 2022 07:17:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D614A403E9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BF1461BF3A0
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2FB880D9A
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:17:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2FB880D9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G6Rrk8ab4yWF for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 07:17:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB39680D1D
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 07:17:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB39680D1D
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 488B18640A; Wed, 27 Jul 2022 07:03:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 09:09:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2ae78f1c794c145486baf5c39703443207fead4c
X-Git-Newrev: 4e3688901857c8a96d25dfce8acf8c489fd09441
X-Patchwork-Hint: ignore
Message-Id: <20220727070324.488B18640A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/clpeak: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=4e3688901857c8a96d25dfce8acf8c489fd09441
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

clpeak is a tool that profiles OpenCL devices to find
their peak capacities

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/clpeak/Config.in   | 15 +++++++++++++++
 package/clpeak/clpeak.hash |  3 +++
 package/clpeak/clpeak.mk   | 13 +++++++++++++
 5 files changed, 33 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e2feb1d957..82e5c200e8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1094,6 +1094,7 @@ F:	board/friendlyarm/nanopi-r2s/
 F:	configs/freescale_imx8mmevk_defconfig
 F:	configs/friendlyarm_nanopi_r2s_defconfig
 F:	package/cctz/
+F:	package/clpeak/
 F:	package/faad2/
 F:	package/fdk-aac/
 F:	package/hawktracer/
diff --git a/package/Config.in b/package/Config.in
index b0837d254a..afdc563c2d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -91,6 +91,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/bpftool/Config.in"
 	source "package/cache-calibrator/Config.in"
 	source "package/clinfo/Config.in"
+	source "package/clpeak/Config.in"
 	source "package/coremark/Config.in"
 	source "package/coremark-pro/Config.in"
 	source "package/dacapo/Config.in"
diff --git a/package/clpeak/Config.in b/package/clpeak/Config.in
new file mode 100644
index 0000000000..c83297549c
--- /dev/null
+++ b/package/clpeak/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_CLPEAK
+	bool "clpeak"
+	depends on BR2_PACKAGE_HAS_LIBOPENCL
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	select BR2_PACKAGE_OPENCL_CLHPP
+	help
+	  clpeak is a tool that profiles OpenCL devices
+	  to find their peak capacities
+
+	  https://github.com/krrishnarraj/clpeak
+
+comment "clpeak needs an OpenCL provider, a toolchain w/ C++, gcc >= 4.8"
+	depends on !BR2_PACKAGE_HAS_LIBOPENCL \
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/clpeak/clpeak.hash b/package/clpeak/clpeak.hash
new file mode 100644
index 0000000000..3db2a2ca6b
--- /dev/null
+++ b/package/clpeak/clpeak.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  7bc7beba6b3307290650abc4f13fe9389b271c1a64601fa333461516950d745b  clpeak-1.1.2.tar.gz
+sha256  88d9b4eb60579c191ec391ca04c16130572d7eedc4a86daa58bf28c6e14c9bcd  LICENSE
diff --git a/package/clpeak/clpeak.mk b/package/clpeak/clpeak.mk
new file mode 100644
index 0000000000..616a02c0b4
--- /dev/null
+++ b/package/clpeak/clpeak.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# clpeak
+#
+################################################################################
+
+CLPEAK_VERSION = 1.1.2
+CLPEAK_SITE = $(call github,krrishnarraj,clpeak,$(CLPEAK_VERSION))
+CLPEAK_LICENSE = Unlicense
+CLPEAK_LICENSE_FILES = LICENSE
+CLPEAK_DEPENDENCIES = libopencl opencl-clhpp
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
