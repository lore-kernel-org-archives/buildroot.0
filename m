Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8463C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 07:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8176A403E7;
	Wed, 27 Jul 2022 07:17:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8176A403E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QFcXSEqyG5Vy; Wed, 27 Jul 2022 07:17:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59F28403CA;
	Wed, 27 Jul 2022 07:17:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59F28403CA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BB1161BF3A0
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2F8280D5A
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:17:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2F8280D5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SO6KBwg2cnrx for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 07:17:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2D3D80CE0
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 07:17:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2D3D80CE0
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3B63A86430; Wed, 27 Jul 2022 07:03:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 09:07:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3f6dbcb2f2b9e21e7546ab456f4bcd7ca6025093
X-Git-Newrev: 2ae78f1c794c145486baf5c39703443207fead4c
X-Patchwork-Hint: ignore
Message-Id: <20220727070324.3B63A86430@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opencl-clhpp: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=2ae78f1c794c145486baf5c39703443207fead4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

opencl-clhpp are the OpenCL API C++ bindings

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/opencl-clhpp/Config.in         | 14 ++++++++++++++
 package/opencl-clhpp/opencl-clhpp.hash |  3 +++
 package/opencl-clhpp/opencl-clhpp.mk   | 28 ++++++++++++++++++++++++++++
 5 files changed, 47 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 70dd167d91..e2feb1d957 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1104,6 +1104,7 @@ F:	package/libeXosip2/
 F:	package/libolm/
 F:	package/libosip2/
 F:	package/ocrad/
+F:	package/opencl-clhpp/
 F:	package/opusfile/
 F:	package/restclient-cpp/
 F:	package/tesseract-ocr/
diff --git a/package/Config.in b/package/Config.in
index 3e6d763cd9..b0837d254a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1569,6 +1569,7 @@ menu "Graphics"
 	source "package/libvips/Config.in"
 	source "package/libwpe/Config.in"
 	source "package/menu-cache/Config.in"
+	source "package/opencl-clhpp/Config.in"
 	source "package/opencv3/Config.in"
 	source "package/opencv4/Config.in"
 	source "package/opengl/Config.in"
diff --git a/package/opencl-clhpp/Config.in b/package/opencl-clhpp/Config.in
new file mode 100644
index 0000000000..59110ec262
--- /dev/null
+++ b/package/opencl-clhpp/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_OPENCL_CLHPP
+	bool "opencl-clhpp"
+	# header only library, so there is no build per-se, but
+	# packages depending on us will need C++ support
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_HAS_LIBOPENCL
+	help
+	  opencl-clhpp are the OpenCL API C++ bindings
+
+	  http://github.khronos.org/OpenCL-CLHPP/
+
+comment "opencl-clhpp needs a toolchain w/ C++"
+	depends on BR2_PACKAGE_HAS_LIBOPENCL
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/opencl-clhpp/opencl-clhpp.hash b/package/opencl-clhpp/opencl-clhpp.hash
new file mode 100644
index 0000000000..27b27cd80c
--- /dev/null
+++ b/package/opencl-clhpp/opencl-clhpp.hash
@@ -0,0 +1,3 @@
+# Locally Computed
+sha256  869456032e60787eed9fceaeaf6c6cb4452bc0ff97e0f5a271510145a1c8f4d4  opencl-clhpp-2.0.16.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/opencl-clhpp/opencl-clhpp.mk b/package/opencl-clhpp/opencl-clhpp.mk
new file mode 100644
index 0000000000..ab52d80547
--- /dev/null
+++ b/package/opencl-clhpp/opencl-clhpp.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# opencl-clhpp
+#
+################################################################################
+
+OPENCL_CLHPP_VERSION = 2.0.16
+OPENCL_CLHPP_SITE = $(call github,KhronosGroup,OpenCL-CLHPP,v$(OPENCL_CLHPP_VERSION))
+OPENCL_CLHPP_LICENSE = Apache-2.0
+OPENCL_CLHPP_LICENSE_FILES = LICENSE.txt
+OPENCL_CLHPP_INSTALL_STAGING = YES
+
+# OpenCL_CLHPP is a header-only library
+OPENCL_CLHPP_INSTALL_TARGET = NO
+
+# This package has a CMake build system, and it checks for C++11
+# compliant compiler, but all we need to do is install two headers, so
+# let's do it manually.
+OPENCL_CLHPP_HEADERS = cl2.hpp opencl.hpp
+
+define OPENCL_CLHPP_INSTALL_STAGING_CMDS
+	$(foreach header,$(OPENCL_CLHPP_HEADERS), \
+		$(INSTALL) -D -m 0644 $(@D)/include/CL/$(header) \
+			$(STAGING_DIR)/usr/include/CL/$(header)
+	)
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
