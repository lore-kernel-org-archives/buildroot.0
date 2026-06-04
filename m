Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980ADCD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FD9560A9C;
	Fri,  5 Jun 2026 12:39:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WpsjqI5cy8Vh; Fri,  5 Jun 2026 12:39:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74D1E60DC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663186;
	bh=C3WiYNIQ2b7hmC9YQMX6aRqlDb+wt02C72jSScCU3lg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OlAKLMYlb1tONTGDLSMlZHldzBp5CjG6WPN0zSuHSz7B8eAXD3A7RjK9B1Sfz3pAk
	 I01/ijdQ8Qe811mWgu2MIl5rUnf3brwyaUlLDdFUEw6UX+lDOaruTFcaxev6mG1ZXh
	 LeTW5mtj830Rs8rvgeMmYX7t08qlH5Jec4JtXMdXn+QcF/AoGPtkFpnUkCZYMMY8dm
	 fQCjrHSoHx0wJwX//nLKsHF84cuhyIImuKpQM+BsJB2pd9jHOSK+/s7Czh+JIlLohY
	 b7G/VDbYfQZwO9hzGxMEBYcdQ1H+37+7L4/nB7znTPBS6XZFAytabcjpAoie8OW3P3
	 TB2PcnnhbDR3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74D1E60DC2;
	Fri,  5 Jun 2026 12:39:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 044A5F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2F3881FD3
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qL7uSRJy-7AR for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4488D81F87
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4488D81F87
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6E33C836B6; Fri,  5 Jun 2026 12:38:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 11:35:46 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 6f6a77b233ea21631cec5663fdd1f0e7a78ddb05
X-Git-Newrev: cd1c5871d17743898cf0cad6d7dd56d6e4fa8061
X-Patchwork-Hint: ignore
Message-Id: <20260605123835.6E33C836B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/efl: re-add
 patches to fix drm-related build errors
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cd1c5871d17743898cf0cad6d7dd56d6e4fa8061
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Buildroot commit c7a1b73f1758855e47c188c38617dd309b2c2428 removed
patches 0001-ecore_evas-engines-drm-meson.build-use-gl_deps-as-en.patch
and 0002-ecore_evas-engines-drm-meson.build-fix-gl_drm-includ.patch.

This defconfig

BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_EFL=y
BR2_PACKAGE_EFL_DRM=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
BR2_PACKAGE_MESA3D_OPENGL_GLX=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_LUAJIT=y

is broken now during configure stage

output/build/efl-1.28.1/src/modules/ecore_evas/engines/drm/meson.build:6:18:
 ERROR: Unknown variable "engine_gl_drm".

which is fixed by former patch 0001.

Later a build error occurs which is fixed by former patch 0002.

The error was not yet caught by the autobuilders.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 526b89cfd883073c048e32cabe4597e2c83084bd)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...engines-drm-meson.build-use-gl_deps-as-en.patch | 37 +++++++++++++++++++++
 ...engines-drm-meson.build-fix-gl_drm-includ.patch | 38 ++++++++++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/package/efl/0009-ecore_evas-engines-drm-meson.build-use-gl_deps-as-en.patch b/package/efl/0009-ecore_evas-engines-drm-meson.build-use-gl_deps-as-en.patch
new file mode 100644
index 0000000000..dd6ac1ae25
--- /dev/null
+++ b/package/efl/0009-ecore_evas-engines-drm-meson.build-use-gl_deps-as-en.patch
@@ -0,0 +1,37 @@
+From 00833baac6935bd1e3e9856211bc165c5b02a7bd Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sat, 1 Aug 2020 02:25:47 +0200
+Subject: [PATCH] ecore_evas/engines/drm/meson.build: use "gl_deps" as engine
+ dependencies
+
+Meson trigger an error since "engine_gl_drm" variable doesn't exist.
+
+src/modules/ecore_evas/engines/drm/meson.build:10:2: ERROR: Unknown variable "engine_gl_drm".
+
+Instead use "gl_deps" as engine dependencies.
+
+Upstream: https://sourceforge.net/p/enlightenment/mailman/message/37075016/
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+[Bernd: added Upstream: tag]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/modules/ecore_evas/engines/drm/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/modules/ecore_evas/engines/drm/meson.build b/src/modules/ecore_evas/engines/drm/meson.build
+index 58071010d0..0741d7fccd 100644
+--- a/src/modules/ecore_evas/engines/drm/meson.build
++++ b/src/modules/ecore_evas/engines/drm/meson.build
+@@ -3,7 +3,7 @@ engine_deps = [ecore_drm2, ecore_input, eeze, elput, libdrm, engine_drm]
+ 
+ if get_option('opengl') != 'none'
+   config_h.set('BUILD_ECORE_EVAS_GL_DRM', '1')
+-  engine_deps += [engine_gl_drm]
++  engine_deps += [gl_deps]
+ endif
+ 
+ engine_include_dir += include_directories(join_paths('..', '..', '..', 'evas', 'engines', 'drm'))
+-- 
+2.31.1
+
diff --git a/package/efl/0010-ecore_evas-engines-drm-meson.build-fix-gl_drm-includ.patch b/package/efl/0010-ecore_evas-engines-drm-meson.build-fix-gl_drm-includ.patch
new file mode 100644
index 0000000000..e71a1705c0
--- /dev/null
+++ b/package/efl/0010-ecore_evas-engines-drm-meson.build-fix-gl_drm-includ.patch
@@ -0,0 +1,38 @@
+From a21e71cc2284a19a34c913aff757e656e3a8c14a Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sat, 1 Aug 2020 01:01:00 +0200
+Subject: [PATCH] ecore_evas/engines/drm/meson.build: fix "gl_drm" include
+ directory
+
+The Evas_Engine_GL_Drm.h file is in "gl_drm" directory, not "drm".
+
+../src/modules/ecore_evas/engines/drm/ecore_evas_drm.c:23:11: fatal error: Evas_Engine_GL_Drm.h: No such file or directory
+   23 | # include <Evas_Engine_GL_Drm.h>
+      |           ^~~~~~~~~~~~~~~~~~~~~~
+compilation terminated.
+
+Upstream: https://sourceforge.net/p/enlightenment/mailman/message/37075004/
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+[Bernd: added Upstream: tag]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/modules/ecore_evas/engines/drm/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/modules/ecore_evas/engines/drm/meson.build b/src/modules/ecore_evas/engines/drm/meson.build
+index 0741d7fccd..edda1abd71 100644
+--- a/src/modules/ecore_evas/engines/drm/meson.build
++++ b/src/modules/ecore_evas/engines/drm/meson.build
+@@ -6,7 +6,7 @@ if get_option('opengl') != 'none'
+   engine_deps += [gl_deps]
+ endif
+ 
+-engine_include_dir += include_directories(join_paths('..', '..', '..', 'evas', 'engines', 'drm'))
++engine_include_dir += include_directories(join_paths('..', '..', '..', 'evas', 'engines', 'gl_drm'))
+ 
+ shared_module(mod_full_name, engine_src,
+   include_directories : config_dir + [engine_include_dir],
+-- 
+2.31.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
