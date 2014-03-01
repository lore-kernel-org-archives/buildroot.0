From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 16:15:04 +0100
Subject: [Buildroot] [git commit] lrandom: new package
Message-ID: <20140301151519.B4DD7903EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f21def8f635980d588271f180d120d26b9918785
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in          |    1 +
 package/lrandom/Config.in  |    8 ++++++++
 package/lrandom/lrandom.mk |   15 +++++++++++++++
 3 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 932015b..684d756 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -376,6 +376,7 @@ source "package/dado/Config.in"
 source "package/lbase64/Config.in"
 source "package/ljsyscall/Config.in"
 source "package/lpeg/Config.in"
+source "package/lrandom/Config.in"
 source "package/lua-cjson/Config.in"
 source "package/lua-ev/Config.in"
 source "package/lua-msgpack-native/Config.in"
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
