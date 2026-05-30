Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD545CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 20:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B8FA85054;
	Sat, 30 May 2026 20:36:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ihVxMUtRNGyt; Sat, 30 May 2026 20:36:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3F1285059
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780173405;
	bh=vMHKvSE0fy46Yd5OLMZV32uBdAl3y/32a1TII7935As=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ArUHxk4nL2VfItmO0jWwVyaGYpcBfpzRNAS32JSbXPlOVtP9go/lbbJAG1p0O2F+b
	 Bxp0UNWAyr9xRsst1PWemqWKKbI3tAhMk5oyRo8mx62JC2ss6rhyjv6PigTqw1gQxX
	 MokddbpqWCmN3O+mFBP0brhGAxPKhzcRTG3ASPmqHQfYjvhnLq8WpcCLGzceRxTttm
	 sS9e9ksCruk+w3R17r+h1v+oQf0iug3ujeVZUgpp5fIcu6u1JhvXult/qEMVM/AQQr
	 la/cdBhRtoEJgBxS+Bq/qpHdRaI+qV/5ZhoP+GdnVr20tQobv/T2M67Hz6tQX7oc63
	 7LOxjCfycVNfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3F1285059;
	Sat, 30 May 2026 20:36:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 73763F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 648AF85050
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:36:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MZghyHqDCgbS for <buildroot@buildroot.org>;
 Sat, 30 May 2026 20:36:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87C1B8504F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87C1B8504F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:36:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5815C87596; Sat, 30 May 2026 20:36:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 22:35:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8e2238ccce83623c575446f11a84cc2712cdd225
X-Git-Newrev: 646ea396c14b0da0016f42eba2b147c8767e6dfb
X-Patchwork-Hint: ignore
Message-Id: <20260530203629.5815C87596@busybox.osuosl.org>
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/646ea396c14b0da0016f42eba2b147c8767e6dfb
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
index 48dadfec61..12a8f7aaa5 100644
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
