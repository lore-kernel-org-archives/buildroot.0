From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 14 Jan 2020 17:37:56 +0100
Subject: [Buildroot] [PATCH 1/2] package/lua-livr: new package
Message-ID: <20200114163757.29642-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in              |  1 +
 package/lua-livr/Config.in     |  7 +++++++
 package/lua-livr/lua-livr.hash |  3 +++
 package/lua-livr/lua-livr.mk   | 12 ++++++++++++
 4 files changed, 23 insertions(+)
 create mode 100644 package/lua-livr/Config.in
 create mode 100644 package/lua-livr/lua-livr.hash
 create mode 100644 package/lua-livr/lua-livr.mk

diff --git a/package/Config.in b/package/Config.in
index ac59182c8..e18bf40cd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -634,6 +634,7 @@ menu "Lua libraries/modules"
 	source "package/lua-gd/Config.in"
 	source "package/lua-http/Config.in"
 	source "package/lua-iconv/Config.in"
+	source "package/lua-livr/Config.in"
 	source "package/lua-lpeg-patterns/Config.in"
 	source "package/lua-lunitx/Config.in"
 	source "package/lua-markdown/Config.in"
diff --git a/package/lua-livr/Config.in b/package/lua-livr/Config.in
new file mode 100644
index 000000000..76fd1c754
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
index 000000000..a891420b4
--- /dev/null
+++ b/package/lua-livr/lua-livr.hash
@@ -0,0 +1,3 @@
+# computed by luarocks/buildroot
+sha256 a3890301ed5f393b585cab26ac944eddc9df41bfa2ab87c11785925193453493  lua-livr-0.2.1-1.src.rock
+sha256 8f09089acf52cfabcc2a44ec3a492dc261e0ae9df3c618f43b33805e696e02d8  lua-LIVR-0.2.1/COPYRIGHT
diff --git a/package/lua-livr/lua-livr.mk b/package/lua-livr/lua-livr.mk
new file mode 100644
index 000000000..25034b897
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
-- 
2.20.1
