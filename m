From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Oct 2019 21:42:13 +0200
Subject: [Buildroot] [git commit] package/suricata: fix build without geoip
Message-ID: <20191007194927.3A38A8A35E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9bab165ccbacdf94955eadda8b5e24233560af53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/a7a34f760ae5fe0922fdb720b8234dbcd85ed222

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-configure.ac-fix-disable-geoip.patch      | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/suricata/0002-configure.ac-fix-disable-geoip.patch b/package/suricata/0002-configure.ac-fix-disable-geoip.patch
new file mode 100644
index 0000000000..7dae57a875
--- /dev/null
+++ b/package/suricata/0002-configure.ac-fix-disable-geoip.patch
@@ -0,0 +1,33 @@
+From 4e8b006cdd30e43f3ab11296710170488fd5b5de Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 6 Oct 2019 09:53:23 +0200
+Subject: [PATCH] configure.ac: fix --disable-geoip
+
+$enableval should be used to know if the user has passed --enable-geoip
+or --disable-geoip
+
+Fixes:
+ - http://autobuild.buildroot.org/results/a7a34f760ae5fe0922fdb720b8234dbcd85ed222
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream status: https://github.com/OISF/suricata/pull/4278
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 3df576d54..fa671024d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2143,7 +2143,7 @@
+   # libmaxminddb
+     AC_ARG_ENABLE(geoip,
+ 	        AS_HELP_STRING([--enable-geoip],[Enable GeoIP support]),
+-	        [ enable_geoip="yes"],
++	        [ enable_geoip="$enableval"],
+ 	        [ enable_geoip="no"])
+     AC_ARG_ENABLE(libgeoip,
+     AS_HELP_STRING([--disable-libgeoip], [Disable libgeoip support]),
+-- 
+2.23.0
+
