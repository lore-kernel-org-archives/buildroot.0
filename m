From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Apr 2019 22:41:29 +0200
Subject: [Buildroot] [git commit] package/weston: bump to version 6.0.0
Message-ID: <20190422204109.DBE0F812EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e9532035053d48e59c6e12d84f36e974ae17647a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The autotools build system is in the process of being deprecated and
replaced with meson for weston. Because of this we need to pass the
--enable-autotools flag when running configure to enable autotools
builds.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/weston/weston.hash | 10 +++++-----
 package/weston/weston.mk   |  5 +++--
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/weston/weston.hash b/package/weston/weston.hash
index 799d371dc0..d761600961 100644
--- a/package/weston/weston.hash
+++ b/package/weston/weston.hash
@@ -1,7 +1,7 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2018-August/039359.html
-md5 752a04ce3c65af4884cfac4e57231bdb  weston-5.0.0.tar.xz
-sha1 56b42b1fbea9e120a8127736328e4c71ac781a57  weston-5.0.0.tar.xz
-sha256 15a23423bcfa45e31e1dedc0cd524ba71e2930df174fde9c99b71a537c4e4caf  weston-5.0.0.tar.xz
-sha512 b6f97eca014ea47f3de0c5ddd89712f896cd66423d0eb499e1d88d35aab616cef1e735ebb8e0cefd8b60085314b6ec3d56b39d7c4776188bb56d58efc84a52cf  weston-5.0.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2019-March/040356.html
+md5 7c634e262f8a464a076c97fd50ad36b3  weston-6.0.0.tar.xz
+sha1 feac9d9a77037580f39c0085a08a3c17a62dced0  weston-6.0.0.tar.xz
+sha256 546323a90607b3bd7f48809ea9d76e64cd09718102f2deca6d95aa59a882e612  weston-6.0.0.tar.xz
+sha512 127ab64b689f202acca4d9461e4decfd42357e4bbb63493af257b3b20b693a8ab4207b3c6b97663cefeed200505aad5f32b6a064db2e53fa1e201877613b394f  weston-6.0.0.tar.xz
 # locally computed
 sha256 0f0de7b7b1f65870139c95dde7abc19ed305631ae7c5d37c386db40cde108632  weston-rel_imx_4.9.51_8mq_ga.tar.gz
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 7fbe39b98e..152ffe1cf7 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -10,7 +10,7 @@ WESTON_SITE = https://source.codeaurora.org/external/imx/weston-imx
 WESTON_SITE_METHOD = git
 WESTON_AUTORECONF = YES
 else
-WESTON_VERSION = 5.0.0
+WESTON_VERSION = 6.0.0
 WESTON_SITE = http://wayland.freedesktop.org/releases
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 endif
@@ -26,7 +26,8 @@ WESTON_CONF_OPTS = \
 	--disable-headless-compositor \
 	--disable-colord \
 	--disable-devdocs \
-	--disable-setuid-install
+	--disable-setuid-install \
+	--enable-autotools
 
 WESTON_MAKE_OPTS = \
 	WAYLAND_PROTOCOLS_DATADIR=$(STAGING_DIR)/usr/share/wayland-protocols
