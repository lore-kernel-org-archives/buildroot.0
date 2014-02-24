From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 24 Feb 2014 08:34:59 +0100
Subject: [Buildroot] [PATCH 23/24] lpty: new package
In-Reply-To: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
References: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1393227301-14874-24-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in      |    1 +
 package/lpty/Config.in |    7 +++++++
 package/lpty/lpty.mk   |   13 +++++++++++++
 3 files changed, 21 insertions(+)
 create mode 100644 package/lpty/Config.in
 create mode 100644 package/lpty/lpty.mk

diff --git a/package/Config.in b/package/Config.in
index 7cb32be..2bc3cc9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -373,6 +373,7 @@ source "package/lbase64/Config.in"
 source "package/ljlinenoise/Config.in"
 source "package/ljsyscall/Config.in"
 source "package/lpeg/Config.in"
+source "package/lpty/Config.in"
 source "package/lrandom/Config.in"
 source "package/lua-cjson/Config.in"
 source "package/lua-coat/Config.in"
diff --git a/package/lpty/Config.in b/package/lpty/Config.in
new file mode 100644
index 0000000..0cd6850
--- /dev/null
+++ b/package/lpty/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LPTY
+	bool "lpty"
+	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
+	help
+	  A simple facility for lua to control other programs via PTYs.
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
-- 
1.7.9.5
