From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Oct 2017 22:03:18 +0200
Subject: [Buildroot] [git commit] lua-fifo: new package
Message-ID: <20171003195624.89EAC8110C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fbb48301ad2cd3ad19005f618907af211beeb348
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in              |  1 +
 package/lua-fifo/Config.in     |  6 ++++++
 package/lua-fifo/lua-fifo.hash |  2 ++
 package/lua-fifo/lua-fifo.mk   | 14 ++++++++++++++
 4 files changed, 23 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 2381878..c2c0901 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -583,6 +583,7 @@ menu "Lua libraries/modules"
 	source "package/lua-curl/Config.in"
 	source "package/lua-datafile/Config.in"
 	source "package/lua-ev/Config.in"
+	source "package/lua-fifo/Config.in"
 	source "package/lua-flu/Config.in"
 	source "package/lua-iconv/Config.in"
 	source "package/lua-markdown/Config.in"
diff --git a/package/lua-fifo/Config.in b/package/lua-fifo/Config.in
new file mode 100644
index 0000000..5715b6b
--- /dev/null
+++ b/package/lua-fifo/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LUA_FIFO
+	bool "lua-fifo"
+	help
+	  A lua library/'class' that implements a FIFO.
+
+	  https://github.com/daurnimator/fifo.lua
diff --git a/package/lua-fifo/lua-fifo.hash b/package/lua-fifo/lua-fifo.hash
new file mode 100644
index 0000000..bab3728
--- /dev/null
+++ b/package/lua-fifo/lua-fifo.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 53dea24ad658614a0254dcb10296a1a0fc5357315ada5724d6362f54c32b4c20  fifo-0.2-0.src.rock
diff --git a/package/lua-fifo/lua-fifo.mk b/package/lua-fifo/lua-fifo.mk
new file mode 100644
index 0000000..875b895
--- /dev/null
+++ b/package/lua-fifo/lua-fifo.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# lua-fifo
+#
+################################################################################
+
+LUA_FIFO_VERSION_UPSTREAM =0.2
+LUA_FIFO_VERSION =$(LUA_FIFO_VERSION_UPSTREAM)-0
+LUA_FIFO_NAME_UPSTREAM = fifo
+LUA_FIFO_SUBDIR = fifo.lua-$(LUA_FIFO_VERSION_UPSTREAM)
+LUA_FIFO_LICENSE = MIT
+LUA_FIFO_LICENSE_FILES = $(LUA_FIFO_SUBDIR)/LICENSE
+
+$(eval $(luarocks-package))
