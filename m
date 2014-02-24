From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 24 Feb 2014 08:34:51 +0100
Subject: [Buildroot] [PATCH 15/24] lrandom: new package
In-Reply-To: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
References: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1393227301-14874-16-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in          |    1 +
 package/lrandom/Config.in  |    8 ++++++++
 package/lrandom/lrandom.mk |   15 +++++++++++++++
 3 files changed, 24 insertions(+)
 create mode 100644 package/lrandom/Config.in
 create mode 100644 package/lrandom/lrandom.mk

diff --git a/package/Config.in b/package/Config.in
index f9124d7..32fd6f6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -373,6 +373,7 @@ source "package/lbase64/Config.in"
 source "package/ljlinenoise/Config.in"
 source "package/ljsyscall/Config.in"
 source "package/lpeg/Config.in"
+source "package/lrandom/Config.in"
 source "package/lua-cjson/Config.in"
 source "package/lua-ev/Config.in"
 source "package/lua-iconv/Config.in"
diff --git a/package/lrandom/Config.in b/package/lrandom/Config.in
new file mode 100644
index 0000000..661707d
--- /dev/null
+++ b/package/lrandom/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LRANDOM
+	bool "lrandom"
+	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
+	help
+	  A library for generating random numbers
+	  based on the Mersenne Twister
+
+	  http://www.tecgraf.puc-rio.br/~lhf/ftp/lua/#lrandom
diff --git a/package/lrandom/lrandom.mk b/package/lrandom/lrandom.mk
new file mode 100644
index 0000000..0035791
--- /dev/null
+++ b/package/lrandom/lrandom.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# lrandom
+#
+################################################################################
+
+ifeq ($(BR2_PACKAGE_LUA_5_2),y)
+LRANDOM_VERSION = 20120430.52-1
+else
+LRANDOM_VERSION = 20120430.51-1
+endif
+LRANDOM_SUBDIR  = random
+LRANDOM_LICENSE = Public domain
+
+$(eval $(luarocks-package))
-- 
1.7.9.5
