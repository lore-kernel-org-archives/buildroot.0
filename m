Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283E6CD8C92
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:06:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6532A854E5;
	Tue,  9 Jun 2026 13:06:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wYUW6FAPU30u; Tue,  9 Jun 2026 13:06:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 401D285EC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010365;
	bh=cNb18C8YoHdLYvuUZhiSn4c06VP2Rkbim6cT9G0YYeo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DTFPt72Q4cFMZKxo0z/+niIKtr+QEse006/p2Z688OilbuZdQSKMIi2aldUDoXCaG
	 o3KAqwFCMglALhfwnM1qR6qSldp+r46xTu0qcrLH6T6Sduim6uzvWAiIm0SBElsW4X
	 s4dYEy3Q3w4Qw03G8NeDP1RFEEBuUACE4uAmyw3LvCCG7jtkTwJMoyOqL1qGYk+Wuk
	 g91TYGL2EVBFNqTi3d9Yn3kTdLMrsR6XXMboiAY4mXdg8QDWG/mUCj30RlFXwLY49U
	 OZ1Ns+pcKMtLHg6vlf5dTARRMLYNd/Zk2WZK2FP08WQbvosUo6khhuXMMQFg2xq7w6
	 z+NZqjDjAArIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 401D285EC2;
	Tue,  9 Jun 2026 13:06:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D44E82EE
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43E54426D6
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hEOjOXySuhgn for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2952C426F5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2952C426F5
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5926687E79; Tue,  9 Jun 2026 13:01:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 22:48:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ff4243147d54f37521b0af252695459f36d4350d
X-Git-Newrev: 1607ed75dbe6981bf2d270b30ed68136463c1b3e
X-Patchwork-Hint: ignore
Message-Id: <20260609130124.5926687E79@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/stellarium: add extra downloads
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1607ed75dbe6981bf2d270b30ed68136463c1b3e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Building Stellarium includes the download of external tarballs during
configure.

This fails with host-cmake during configure stage:

CMake Error at md4c-subbuild/md4c-populate-prefix/src/md4c-populate-stamp/download-md4c-populate.cmake:163 (message):
  Each download failed!

    error: downloading 'https://github.com/mity/md4c/archive/refs/tags/release-0.5.2.tar.gz' failed
          status_code: 1
          status_string: "Unsupported protocol"
          log:
          --- LOG BEGIN ---
          Protocol "https" not supported

  closing connection #-1

due to buildroot commit f87138339b17bc2b1d84c59ea176abb941413550 which
disabled SSL support for host-cmake.

This patch uses _EXTRA_DOWNLOADS to provide these tarball to allow
offline builds.

No autobuilder error was recorded, the build error can be reproduced
with this defconfig:

BR2_x86_64=y
BR2_x86_corei7=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE=y
BR2_FORCE_HOST_BUILD=y
BR2_PACKAGE_STELLARIUM=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
BR2_PACKAGE_MESA3D_OPENGL_GLX=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_XORG7=y

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/stellarium/stellarium.hash |  4 ++++
 package/stellarium/stellarium.mk   | 14 ++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/package/stellarium/stellarium.hash b/package/stellarium/stellarium.hash
index 67e053eff7..4298c3dcde 100644
--- a/package/stellarium/stellarium.hash
+++ b/package/stellarium/stellarium.hash
@@ -1,4 +1,8 @@
 # From https://github.com/Stellarium/stellarium/releases
 sha256  e376e0dc28eae0f7c4b3686fed9c2129c69a87a371b33e24bd79559a5142d613  stellarium-25.4.tar.xz
+# From https://github.com/Stellarium/stellarium/blob/v25.4/CMakeLists.txt#L849
+sha256  55d0111d48fb11883aaee91465e642b8b640775a4d6993c2d0e7a8092758ef21  release-0.5.2.tar.gz
+# From https://github.com/Stellarium/stellarium/blob/v25.4/plugins/LensDistortionEstimator/src/CMakeLists.txt
+sha256  6e899e297485e457ec1bf84844de29921aeef674f9d5caf60277df45dca6ff76  v2.9.0.tar.gz
 # Locally computed
 sha256  3aeeb5bb98bf7041ab82cffe15efa28ac58ee2bdf162b71301f5c192be631259  COPYING
diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index 660d518860..8d915b094f 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -9,6 +9,20 @@ STELLARIUM_SOURCE = stellarium-$(STELLARIUM_VERSION).tar.xz
 STELLARIUM_SITE = https://github.com/Stellarium/stellarium/releases/download/v$(STELLARIUM_VERSION)
 STELLARIUM_LICENSE = GPL-2.0+
 STELLARIUM_LICENSE_FILES = COPYING
+
+STELLARIUM_EXTRA_DOWNLOADS = \
+	https://github.com/mity/md4c/archive/refs/tags/release-0.5.2.tar.gz \
+	https://github.com/stevengj/nlopt/archive/refs/tags/v2.9.0.tar.gz
+
+# Prevent stellarium from downloading stuff during its configure step
+define STELLARIUM_COPY_EXTRA_DOWNLOADS
+	mkdir -p $(@D)/_deps/md4c-subbuild/md4c-populate-prefix/src/
+	cp $(STELLARIUM_DL_DIR)/release-0.5.2.tar.gz $(@D)/_deps/md4c-subbuild/md4c-populate-prefix/src/
+	mkdir -p $(@D)/_deps/nlopt-subbuild/nlopt-populate-prefix/src/
+	cp $(STELLARIUM_DL_DIR)/v2.9.0.tar.gz $(@D)/_deps/nlopt-subbuild/nlopt-populate-prefix/src/
+endef
+STELLARIUM_POST_EXTRACT_HOOKS += STELLARIUM_COPY_EXTRA_DOWNLOADS
+
 STELLARIUM_DEPENDENCIES = \
 	qt5base \
 	qt5charts \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
