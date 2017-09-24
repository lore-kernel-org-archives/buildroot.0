From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 24 Sep 2017 17:20:37 +0200
Subject: [Buildroot] [git commit] lua-datafile: new package
Message-ID: <20170924151731.9C5CF80FF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f8e41394d36178f27ba1b9dba9f1d67b77f6db6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in                      |  1 +
 package/lua-datafile/Config.in         |  7 +++++++
 package/lua-datafile/lua-datafile.hash |  2 ++
 package/lua-datafile/lua-datafile.mk   | 13 +++++++++++++
 4 files changed, 23 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 8a75780..f7b3ad5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -579,6 +579,7 @@ menu "Lua libraries/modules"
 	source "package/lua-coatpersistent/Config.in"
 	source "package/lua-csnappy/Config.in"
 	source "package/lua-curl/Config.in"
+	source "package/lua-datafile/Config.in"
 	source "package/lua-ev/Config.in"
 	source "package/lua-flu/Config.in"
 	source "package/lua-iconv/Config.in"
diff --git a/package/lua-datafile/Config.in b/package/lua-datafile/Config.in
new file mode 100644
index 0000000..e65406e
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
index 0000000..83c346e
--- /dev/null
+++ b/package/lua-datafile/lua-datafile.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 37a33079c3476477f19de14bebd664635a39a57dd05a2709c3a402cbc1e79a6b  datafile-0.4-1.src.rock
diff --git a/package/lua-datafile/lua-datafile.mk b/package/lua-datafile/lua-datafile.mk
new file mode 100644
index 0000000..75aef52
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
