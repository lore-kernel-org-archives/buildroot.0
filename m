From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 4 Aug 2011 21:22:19 +0200
Subject: [Buildroot] [git commit] package: mark liboil + swfdec as deprecated
Message-ID: <20110804192914.3FFC78B73C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d49286740aaeacb413dd0aa8822ff06d164ebb27
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

They are dead upstream, and will be removed during 2011.11 cycle unless
someone speaks up.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                             |    2 ++
 package/liboil/Config.in            |    1 +
 package/multimedia/swfdec/Config.in |    1 +
 3 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index 46dc488..caeff38 100644
--- a/CHANGES
+++ b/CHANGES
@@ -30,6 +30,8 @@
 	libroxml, libyaml, live555, mxml, orc, rsyslog, sredird,
 	statserial, stunnel, ti-utils, uboot-tools, yajl
 
+	Deprecated packages: liboil, swfdec
+
 	Removed packages: hal
 
 	Issues resolved (http://bugs.uclibc.org):
diff --git a/package/liboil/Config.in b/package/liboil/Config.in
index 0acbbfc..ad7a3d8 100644
--- a/package/liboil/Config.in
+++ b/package/liboil/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBOIL
 	bool "liboil"
+	depends on BR2_DEPRECATED
 	help
 	  Library of simple functions that are optimized for various CPUs.
 
diff --git a/package/multimedia/swfdec/Config.in b/package/multimedia/swfdec/Config.in
index bc1c73a..46119fc 100644
--- a/package/multimedia/swfdec/Config.in
+++ b/package/multimedia/swfdec/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SWFDEC
 	bool "swfdec"
+	depends on BR2_DEPRECATED
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	select BR2_PACKAGE_LIBOIL
-- 
1.7.3.4
