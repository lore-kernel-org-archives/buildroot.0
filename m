Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B417CD98D6
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 16:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEDED415AE;
	Fri, 12 Jun 2026 16:05:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gYxWDTNkWiHd; Fri, 12 Jun 2026 16:05:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1007B415B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781280312;
	bh=PcPoPXZAALErBO1wfo+tG9vS+x0rlmM7UboLttqslJY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dWMaF+CDow6WXdT5oaS7ItJqK+4500YtxxdCcXK9zaiDhGoVSBU+5DYeSVylXdBh+
	 ZVdbVT8fAABr9srA2vl9+Q4cZWt/6U7V1UueBOtKc+dqrJSlakIwjakDOXx4NXwdfi
	 8u7UGHuJnwQ4WNxexnMxaVBxAhvS69wVoc4wEseOyEBpjjdw8dBqKIwbN0saW6HYWN
	 rV9YW9tRLPEeiIiAyHApzGK7H+IX+pSMYT5cL37gUhrtk4s9mNRxAUZ3evuNg6MRzo
	 IS3VN9cSowOQGw6H2eKtksJTvO0mCAhlwO9MNdFXBHiuVmWtePOAdW36wSmcGAPSVQ
	 /Qm7Jx1Yxv8XQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1007B415B8;
	Fri, 12 Jun 2026 16:05:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E8AB1F4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF083406F8
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:05:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a5MVDAmlWp6C for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 16:05:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A1A5400C4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A1A5400C4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:05:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B9E188113; Fri, 12 Jun 2026 16:04:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jun 2026 18:04:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1bc9c830144a71c18f63422f98bc99675c34c62b
X-Git-Newrev: ef2c002141e1beda2c648c049c60c5504ae1920e
X-Patchwork-Hint: ignore
Message-Id: <20260612160448.0B9E188113@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dbus: bump to version 1.16.2
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ef2c002141e1beda2c648c049c60c5504ae1920e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Migrate from autotools to meson.

The COPYING file now points to separate license texts under LICENSES/
instead of embedding them [1], so update DBUS_LICENSE_FILES and
hashes. Expand DBUS_LICENSE for the AFL-2.0 dbus/dbus-arch-deps.h.in
header and the bundled TCL/pycrypto-origin code used by the library.

Drop the stale optional xlib_libSM dependency: the meson build only
checks for x11 for X11 autolaunch support.

[1] https://gitlab.freedesktop.org/dbus/dbus/-/commit/272928bbbffbfb7a147e32695dd5500ff1b62933

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Fiona:
 - include LicenseRef-CMakeScripts and LicenseRef-GAP in DBUS_LICENSE
   and DBUS_LICENSE_FILES
 - include link to the primary COPYING split in commit message
]
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/dbus/dbus.hash |  14 +++++--
 package/dbus/dbus.mk   | 104 ++++++++++++++++++++++++++++++-------------------
 2 files changed, 76 insertions(+), 42 deletions(-)

diff --git a/package/dbus/dbus.hash b/package/dbus/dbus.hash
index a06ba50ccd..3e4ee0d3e8 100644
--- a/package/dbus/dbus.hash
+++ b/package/dbus/dbus.hash
@@ -1,7 +1,15 @@
 # Locally calculated after checking pgp signature
-# https://dbus.freedesktop.org/releases/dbus/dbus-1.14.10.tar.xz.asc
+# https://dbus.freedesktop.org/releases/dbus/dbus-1.16.2.tar.xz.asc
 # using key 36EC5A6448A4F5EF79BEFE98E05AE1478F814C4F
-sha256  ba1f21d2bd9d339da2d4aa8780c09df32fea87998b73da24f49ab9df1e36a50f  dbus-1.14.10.tar.xz
+sha256  0ba2a1a4b16afe7bceb2c07e9ce99a8c2c3508e5dec290dbb643384bd6beb7e2  dbus-1.16.2.tar.xz
 
 # Locally calculated
-sha256  e61807cd1c32ff4e7bd5b4b61dd21997c6dc5642cf19316124fe38d50e1f9fa3  COPYING
+sha256  150e5d08e1cb5e62b65967d7931acad2c42d98ec1bbb584bebb01921cbc853c2  COPYING
+sha256  7ecc7db84298adb05d2cf10339c63a5315a1c5c270a68d97d7d40a53b508ccde  LICENSES/AFL-2.0.txt
+sha256  93bb4f7417aa775bab9026cc3d0af28aeb64451fc5a8ec651876785edd8eaf9b  LICENSES/AFL-2.1.txt
+sha256  aaf135472f81c5b4a0dca9367e5bb5e9750032b5bebe5442b36e4c0a47430df3  LICENSES/GPL-2.0-or-later.txt
+sha256  a4c1387064fda4c22bfca364b606eb4e0421efa37cad27c040a3d7ca7186d522  LICENSES/LicenseRef-CMakeScripts.txt
+sha256  cf4bc4c56dd0837f3d53b8c1467e0d7dbb95223de8bcfe83a4981c318a738ae3  LICENSES/LicenseRef-GAP.txt
+sha256  2cb8f4f410f0ffc5dcfbadd188e20c859fdbb161e616cf2f3d34dfbf8c740547  LICENSES/LicenseRef-pycrypto-orig.txt
+sha256  b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0cc0  LICENSES/MIT.txt
+sha256  36fc2d8a56a2a014ded51e298a7e63635eb4ec62e8bedb99c82b892542ac5e7d  LICENSES/TCL.txt
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 7b97c7604d..ef7cc767ad 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -6,11 +6,26 @@
 
 # When updating dbus, check if there are changes in session.conf and
 # system.conf, and update the versions in the dbus-broker package accordingly.
-DBUS_VERSION = 1.14.10
+DBUS_VERSION = 1.16.2
 DBUS_SOURCE = dbus-$(DBUS_VERSION).tar.xz
 DBUS_SITE = https://dbus.freedesktop.org/releases/dbus
-DBUS_LICENSE = AFL-2.1 or GPL-2.0+ (library, tools), GPL-2.0+ (tools)
-DBUS_LICENSE_FILES = COPYING
+DBUS_LICENSE = \
+	AFL-2.0 or GPL-2.0+ (dbus/dbus-arch-deps.h.in), \
+	AFL-2.1 or GPL-2.0+ (library, daemon, some tools), \
+	GPL-2.0+ (some tools), MIT (some files), \
+	Public Domain (dbus-sha), TCL (dbus-hash), \
+	LicenseRef-CMakeScripts (cmake/modules/FindGLIB2.cmake), \
+	LicenseRef-GAP (dbus/versioninfo.rc.in)
+DBUS_LICENSE_FILES = \
+	COPYING \
+	LICENSES/AFL-2.0.txt \
+	LICENSES/AFL-2.1.txt \
+	LICENSES/GPL-2.0-or-later.txt \
+	LICENSES/LicenseRef-CMakeScripts.txt \
+	LICENSES/LicenseRef-GAP.txt \
+	LICENSES/LicenseRef-pycrypto-orig.txt \
+	LICENSES/MIT.txt \
+	LICENSES/TCL.txt
 DBUS_CPE_ID_VENDOR = freedesktop
 DBUS_INSTALL_STAGING = YES
 
@@ -27,56 +42,59 @@ DBUS_DEPENDENCIES = host-pkgconf expat
 DBUS_SELINUX_MODULES = dbus
 
 DBUS_CONF_OPTS = \
-	--with-dbus-user=dbus \
-	--disable-tests \
-	--disable-asserts \
-	--disable-xml-docs \
-	--disable-doxygen-docs \
-	--with-system-socket=/run/dbus/system_bus_socket \
-	--with-system-pid-file=/run/dbus-daemon.pid \
-	--with-session-socket-dir=/tmp \
-	--runstatedir=/run
-
-ifeq ($(BR2_STATIC_LIBS),y)
-DBUS_CONF_OPTS += LIBS='-pthread'
-endif
+	-Dapparmor=disabled \
+	-Dasserts=false \
+	-Ddbus_user=dbus \
+	-Ddoxygen_docs=disabled \
+	-Dducktype_docs=disabled \
+	-Dinstalled_tests=false \
+	-Dintrusive_tests=false \
+	-Dlaunchd=disabled \
+	-Dmodular_tests=disabled \
+	-Dqt_help=disabled \
+	-Druntime_dir=/run \
+	-Dsession_socket_dir=/tmp \
+	-Dsystem_pid_file=/run/dbus-daemon.pid \
+	-Dsystem_socket=/run/dbus/system_bus_socket \
+	-Dxml_docs=disabled
 
 ifeq ($(BR2_microblaze),y)
 # microblaze toolchain doesn't provide inotify_rm_* but does have sys/inotify.h
-DBUS_CONF_OPTS += --disable-inotify
+DBUS_CONF_OPTS += -Dinotify=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
-DBUS_CONF_OPTS += --enable-selinux
+DBUS_CONF_OPTS += -Dselinux=enabled
 DBUS_DEPENDENCIES += libselinux
 else
-DBUS_CONF_OPTS += --disable-selinux
+DBUS_CONF_OPTS += -Dselinux=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_AUDIT)$(BR2_PACKAGE_LIBCAP_NG),yy)
-DBUS_CONF_OPTS += --enable-libaudit
+DBUS_CONF_OPTS += -Dlibaudit=enabled
 DBUS_DEPENDENCIES += audit libcap-ng
 else
-DBUS_CONF_OPTS += --disable-libaudit
+DBUS_CONF_OPTS += -Dlibaudit=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
-DBUS_CONF_OPTS += --with-x
+DBUS_CONF_OPTS += -Dx11_autolaunch=enabled
 DBUS_DEPENDENCIES += xlib_libX11
-ifeq ($(BR2_PACKAGE_XLIB_LIBSM),y)
-DBUS_DEPENDENCIES += xlib_libSM
-endif
 else
-DBUS_CONF_OPTS += --without-x
+DBUS_CONF_OPTS += -Dx11_autolaunch=disabled
 endif
 
 ifeq ($(BR2_INIT_SYSTEMD),y)
 DBUS_CONF_OPTS += \
-	--enable-systemd \
-	--with-systemdsystemunitdir=/usr/lib/systemd/system
+	-Dsystemd=enabled \
+	-Dsystemd_system_unitdir=/usr/lib/systemd/system \
+	-Dsystemd_user_unitdir=/usr/lib/systemd/user \
+	-Duser_session=true
 DBUS_DEPENDENCIES += systemd
 else
-DBUS_CONF_OPTS += --disable-systemd
+DBUS_CONF_OPTS += \
+	-Dsystemd=disabled \
+	-Duser_session=false
 endif
 
 # fix rebuild (dbus makefile errors out if /var/lib/dbus is a symlink)
@@ -122,14 +140,22 @@ endef
 
 HOST_DBUS_DEPENDENCIES = host-pkgconf host-expat
 HOST_DBUS_CONF_OPTS = \
-	--with-dbus-user=dbus \
-	--disable-tests \
-	--disable-asserts \
-	--disable-selinux \
-	--disable-xml-docs \
-	--disable-doxygen-docs \
-	--disable-systemd \
-	--without-x
+	-Dapparmor=disabled \
+	-Dasserts=false \
+	-Ddbus_user=dbus \
+	-Ddoxygen_docs=disabled \
+	-Dducktype_docs=disabled \
+	-Dinstalled_tests=false \
+	-Dintrusive_tests=false \
+	-Dlaunchd=disabled \
+	-Dlibaudit=disabled \
+	-Dmodular_tests=disabled \
+	-Dqt_help=disabled \
+	-Dselinux=disabled \
+	-Dsystemd=disabled \
+	-Duser_session=false \
+	-Dx11_autolaunch=disabled \
+	-Dxml_docs=disabled
 
 # dbus for the host
 DBUS_HOST_INTROSPECT = $(HOST_DBUS_DIR)/introspect.xml
@@ -139,5 +165,5 @@ HOST_DBUS_GEN_INTROSPECT = \
 
 HOST_DBUS_POST_INSTALL_HOOKS += HOST_DBUS_GEN_INTROSPECT
 
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
+$(eval $(meson-package))
+$(eval $(host-meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
