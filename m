From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Sep 2017 22:06:18 +0200
Subject: [Buildroot] [git commit] wsapi-xavante: new package
Message-ID: <20170902200654.4FF2080E40@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=064b47503343d4c20f496a480a7fca80ff3b5ec6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Thomas: add to DEVELOPERS file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/wsapi-xavante/Config.in          | 13 +++++++++++++
 package/wsapi-xavante/wsapi-xavante.hash |  2 ++
 package/wsapi-xavante/wsapi-xavante.mk   | 12 ++++++++++++
 5 files changed, 29 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ff9d17d..91da321 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -618,6 +618,7 @@ F:	package/qemu/
 F:	package/sdl2_mixer/
 F:	package/sdl2_net/
 F:	package/tekui/
+F:	package/wsapi-xavante/
 F:	utils/scancpan
 
 N:	Frank Hunleth <fhunleth@troodon-software.com>
diff --git a/package/Config.in b/package/Config.in
index 2f7042a..bb94ae8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -606,6 +606,7 @@ menu "Lua libraries/modules"
 	source "package/rings/Config.in"
 	source "package/turbolua/Config.in"
 	source "package/wsapi/Config.in"
+	source "package/wsapi-xavante/Config.in"
 	source "package/xavante/Config.in"
 endmenu
 endif
diff --git a/package/wsapi-xavante/Config.in b/package/wsapi-xavante/Config.in
new file mode 100644
index 0000000..3e494bb
--- /dev/null
+++ b/package/wsapi-xavante/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_WSAPI_XAVANTE
+	bool "wsapi-xavante"
+	# Runtime dependencies
+	select BR2_PACKAGE_COXPCALL
+	select BR2_PACKAGE_RINGS
+	select BR2_PACKAGE_WSAPI
+	select BR2_PACKAGE_XAVANTE
+	help
+	  WSAPI is an API that abstracts the web server from Lua web
+	  applications. This is the rock that contains the Xavante
+	  adapter and launcher.
+
+	  http://keplerproject.github.com/wsapi/
diff --git a/package/wsapi-xavante/wsapi-xavante.hash b/package/wsapi-xavante/wsapi-xavante.hash
new file mode 100644
index 0000000..9e8132d
--- /dev/null
+++ b/package/wsapi-xavante/wsapi-xavante.hash
@@ -0,0 +1,2 @@
+# locally computed hash
+sha256 b30b171e3d4d6fd7e129f14576e1cfc5adf00c0780ef8350f2f9e6f1d4259346  wsapi-xavante-1.6.1-1.src.rock
diff --git a/package/wsapi-xavante/wsapi-xavante.mk b/package/wsapi-xavante/wsapi-xavante.mk
new file mode 100644
index 0000000..937d204
--- /dev/null
+++ b/package/wsapi-xavante/wsapi-xavante.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# wsapi-xavante
+#
+################################################################################
+
+WSAPI_XAVANTE_VERSION_MAJOR = 1.6.1
+WSAPI_XAVANTE_VERSION = $(WSAPI_XAVANTE_VERSION_MAJOR)-1
+WSAPI_XAVANTE_SUBDIR = wsapi-$(WSAPI_XAVANTE_VERSION_MAJOR)
+WSAPI_XAVANTE_LICENSE = MIT
+
+$(eval $(luarocks-package))
