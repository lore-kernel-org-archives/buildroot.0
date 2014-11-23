From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Nov 2014 09:42:42 +0100
Subject: [Buildroot] [git commit] dillo: needs iconv
Message-ID: <20141123084342.968B77FE3C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a79bcdba81215778f67b358324e174d91e3f32e4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 http://autobuild.buildroot.net/results/4a7/4a765a66bea1ecf4ec5e4da00b847bc931071132/

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dillo/Config.in |    1 +
 package/dillo/dillo.mk  |    2 ++
 2 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/dillo/Config.in b/package/dillo/Config.in
index 8d3cbb1..5c2cc62 100644
--- a/package/dillo/Config.in
+++ b/package/dillo/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_DILLO
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # fltk fork()
 	select BR2_PACKAGE_FLTK
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  Dillo is a multi-platform graphical web browser known
 	  for its speed and small footprint.
diff --git a/package/dillo/dillo.mk b/package/dillo/dillo.mk
index bce23b0..d6fc746 100644
--- a/package/dillo/dillo.mk
+++ b/package/dillo/dillo.mk
@@ -17,6 +17,8 @@ DILLO_DEPENDENCIES = fltk
 
 DILLO_CONF_ENV = ac_cv_path_FLTK_CONFIG=$(STAGING_DIR)/usr/bin/fltk-config
 
+DILLO_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	DILLO_CONF_OPTS += --enable-ssl
 	DILLO_DEPENDENCIES += openssl
