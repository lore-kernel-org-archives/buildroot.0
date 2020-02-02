From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 Feb 2020 15:12:05 +0100
Subject: [Buildroot] [git commit] package/lua-livr: new package
Message-ID: <20200202140115.85746882E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=48709a5c39d9a52397d58880df03e80be2d25312
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in              |  1 +
 package/lua-livr/Config.in     |  7 +++++++
 package/lua-livr/lua-livr.hash |  3 +++
 package/lua-livr/lua-livr.mk   | 12 ++++++++++++
 4 files changed, 23 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index d1b31d63fb..452b283670 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -650,6 +650,7 @@ menu "Lua libraries/modules"
 	source "package/lua-gd/Config.in"
 	source "package/lua-http/Config.in"
 	source "package/lua-iconv/Config.in"
+	source "package/lua-livr/Config.in"
 	source "package/lua-lpeg-patterns/Config.in"
 	source "package/lua-lunitx/Config.in"
 	source "package/lua-markdown/Config.in"
diff --git a/package/lua-livr/Config.in b/package/lua-livr/Config.in
new file mode 100644
index 0000000000..76fd1c7543
--- /dev/null
+++ b/package/lua-livr/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LUA_LIVR
+	bool "lua-livr"
+	help
+	  Lightweight validator supporting Language Independent
+	  Validation Rules Specification (LIVR).
+
+	  https://fperrad.frama.io/lua-LIVR
diff --git a/package/lua-livr/lua-livr.hash b/package/lua-livr/lua-livr.hash
new file mode 100644
index 0000000000..a891420b49
--- /dev/null
+++ b/package/lua-livr/lua-livr.hash
@@ -0,0 +1,3 @@
+# computed by luarocks/buildroot
+sha256 a3890301ed5f393b585cab26ac944eddc9df41bfa2ab87c11785925193453493  lua-livr-0.2.1-1.src.rock
+sha256 8f09089acf52cfabcc2a44ec3a492dc261e0ae9df3c618f43b33805e696e02d8  lua-LIVR-0.2.1/COPYRIGHT
diff --git a/package/lua-livr/lua-livr.mk b/package/lua-livr/lua-livr.mk
new file mode 100644
index 0000000000..25034b897b
--- /dev/null
+++ b/package/lua-livr/lua-livr.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# lua-livr
+#
+################################################################################
+
+LUA_LIVR_VERSION = 0.2.1-1
+LUA_LIVR_NAME_UPSTREAM = lua-LIVR
+LUA_LIVR_LICENSE = MIT
+LUA_LIVR_LICENSE_FILES = $(LUA_LIVR_SUBDIR)/COPYRIGHT
+
+$(eval $(luarocks-package))
