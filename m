From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 24 Sep 2017 09:59:26 +0200
Subject: [Buildroot] [PATCH 3/9] lua-datafile: new package
In-Reply-To: <20170924075932.5990-1-francois.perrad@gadz.org>
References: <20170924075932.5990-1-francois.perrad@gadz.org>
Message-ID: <20170924075932.5990-3-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                      |  1 +
 package/lua-datafile/Config.in         |  7 +++++++
 package/lua-datafile/lua-datafile.hash |  2 ++
 package/lua-datafile/lua-datafile.mk   | 13 +++++++++++++
 4 files changed, 23 insertions(+)
 create mode 100644 package/lua-datafile/Config.in
 create mode 100644 package/lua-datafile/lua-datafile.hash
 create mode 100644 package/lua-datafile/lua-datafile.mk

diff --git a/package/Config.in b/package/Config.in
index 119beabab..767614c7d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -575,6 +575,7 @@ menu "Lua libraries/modules"
 	source "package/lua-coatpersistent/Config.in"
 	source "package/lua-csnappy/Config.in"
 	source "package/lua-curl/Config.in"
+	source "package/lua-datafile/Config.in"
 	source "package/lua-ev/Config.in"
 	source "package/lua-flu/Config.in"
 	source "package/lua-iconv/Config.in"
diff --git a/package/lua-datafile/Config.in b/package/lua-datafile/Config.in
new file mode 100644
index 000000000..e65406ed8
--- /dev/null
+++ b/package/lua-datafile/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LUA_DATAFILE
+	bool "lua-datafile"
+	help
+	  datafile is a library for avoiding hardcoded paths
+	  when loading resource files in Lua modules.
+
+	  https://github.com/hishamhm/datafile
diff --git a/package/lua-datafile/lua-datafile.hash b/package/lua-datafile/lua-datafile.hash
new file mode 100644
index 000000000..83c346eae
--- /dev/null
+++ b/package/lua-datafile/lua-datafile.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 37a33079c3476477f19de14bebd664635a39a57dd05a2709c3a402cbc1e79a6b  datafile-0.4-1.src.rock
diff --git a/package/lua-datafile/lua-datafile.mk b/package/lua-datafile/lua-datafile.mk
new file mode 100644
index 000000000..75aef5290
--- /dev/null
+++ b/package/lua-datafile/lua-datafile.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# lua-datafile
+#
+################################################################################
+
+LUA_DATAFILE_VERSION = 0.4-1
+LUA_DATAFILE_NAME_UPSTREAM = datafile
+LUA_DATAFILE_SUBDIR = datafile
+LUA_DATAFILE_LICENSE = MIT
+LUA_DATAFILE_LICENSE_FILES = $(LUA_DATAFILE_SUBDIR)/LICENSE
+
+$(eval $(luarocks-package))
-- 
2.11.0
