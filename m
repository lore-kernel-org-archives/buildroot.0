From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 22:09:59 +0200
Subject: [Buildroot] [git commit] package/libxkbcommon: bump version to 1.0.1
Message-ID: <20200919200135.357FB7F9D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1791bc30a5b19bb52366375d03e66348242ff25a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details see [1].

- disable enable-xkbregistry (as suggested by documentation [3] and
  to avoid libxml2 dependency)

[1] https://lists.freedesktop.org/archives/wayland-devel/2020-September/041596.html
[2] https://lists.freedesktop.org/archives/wayland-devel/2020-September/041609.html
[3] https://github.com/xkbcommon/libxkbcommon/blob/master/PACKAGING

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libxkbcommon/libxkbcommon.hash | 8 +++-----
 package/libxkbcommon/libxkbcommon.mk   | 7 +++++--
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/libxkbcommon/libxkbcommon.hash b/package/libxkbcommon/libxkbcommon.hash
index 5d4c3af10a..c643f1c4ac 100644
--- a/package/libxkbcommon/libxkbcommon.hash
+++ b/package/libxkbcommon/libxkbcommon.hash
@@ -1,7 +1,5 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2020-January/041133.html
-md5 2d9ad3a46b317138b5e72a91cf105451  libxkbcommon-0.10.0.tar.xz
-sha1 d8f956f4bc5382d5d8e0e4dd590c4f090e0e985a  libxkbcommon-0.10.0.tar.xz
-sha256 57c3630cdc38fb4734cd57fa349e92244f5ae3862813e533cedbd86721a0b6f2  libxkbcommon-0.10.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2020-September/041609.html
+sha256  ab68b25341c99f2218d7cf3dad459c1827f411219901ade05bbccbdb856b6c8d  libxkbcommon-1.0.1.tar.xz
 
 # License file:
-sha256 086caee279449369d41c1157911ec7696e707b93feba7280de757d3c470b2dfb LICENSE
+sha256  086caee279449369d41c1157911ec7696e707b93feba7280de757d3c470b2dfb  LICENSE
diff --git a/package/libxkbcommon/libxkbcommon.mk b/package/libxkbcommon/libxkbcommon.mk
index 3923d69c8d..bf1bd058cb 100644
--- a/package/libxkbcommon/libxkbcommon.mk
+++ b/package/libxkbcommon/libxkbcommon.mk
@@ -4,14 +4,17 @@
 #
 ################################################################################
 
-LIBXKBCOMMON_VERSION = 0.10.0
+LIBXKBCOMMON_VERSION = 1.0.1
 LIBXKBCOMMON_SITE = http://xkbcommon.org/download
 LIBXKBCOMMON_SOURCE = libxkbcommon-$(LIBXKBCOMMON_VERSION).tar.xz
 LIBXKBCOMMON_LICENSE = MIT/X11
 LIBXKBCOMMON_LICENSE_FILES = LICENSE
 LIBXKBCOMMON_INSTALL_STAGING = YES
 LIBXKBCOMMON_DEPENDENCIES = host-bison host-flex
-LIBXKBCOMMON_CONF_OPTS = -Denable-docs=false -Denable-wayland=false
+LIBXKBCOMMON_CONF_OPTS = \
+	-Denable-docs=false \
+	-Denable-wayland=false \
+	-Denable-xkbregistry=false
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
 LIBXKBCOMMON_CONF_OPTS += -Denable-x11=true
