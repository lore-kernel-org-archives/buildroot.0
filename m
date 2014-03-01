From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 16:54:53 +0100
Subject: [Buildroot] [git commit] lpty: new package
Message-ID: <20140301155501.16686972C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8bfb7c2df64ec670052a761ba3c7361f01e9584a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in      |    1 +
 package/lpty/Config.in |    8 ++++++++
 package/lpty/lpty.mk   |   13 +++++++++++++
 3 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 410971d..fa9aaa0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -376,6 +376,7 @@ source "package/dado/Config.in"
 source "package/lbase64/Config.in"
 source "package/ljsyscall/Config.in"
 source "package/lpeg/Config.in"
+source "package/lpty/Config.in"
 source "package/lrandom/Config.in"
 source "package/lua-cjson/Config.in"
 source "package/lua-coat/Config.in"
diff --git a/package/lpty/Config.in b/package/lpty/Config.in
new file mode 100644
index 0000000..5e7ad14
--- /dev/null
+++ b/package/lpty/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LPTY
+	bool "lpty"
+	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
+	help
+	  A simple facility for lua to control other programs via
+	  PTYs.
+
+	  http://www.tset.de/lpty/
diff --git a/package/lpty/lpty.mk b/package/lpty/lpty.mk
new file mode 100644
index 0000000..0c3b7f9
--- /dev/null
+++ b/package/lpty/lpty.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# lpty
+#
+################################################################################
+
+LPTY_VERSION_UPSTREAM = 1.0.1
+LPTY_VERSION = $(LPTY_VERSION_UPSTREAM)-1
+LPTY_SUBDIR  = lpty-$(LPTY_VERSION)
+LPTY_LICENSE = MIT
+LPTY_LICENSE_FILES = $(LPTY_SUBDIR)/doc/LICENSE
+
+$(eval $(luarocks-package))
