From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 24 Feb 2014 08:34:48 +0100
Subject: [Buildroot] [PATCH 12/24] luajson: new package
In-Reply-To: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
References: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1393227301-14874-13-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in          |    1 +
 package/luajson/Config.in  |    8 ++++++++
 package/luajson/luajson.mk |   13 +++++++++++++
 3 files changed, 22 insertions(+)
 create mode 100644 package/luajson/Config.in
 create mode 100644 package/luajson/luajson.mk

diff --git a/package/Config.in b/package/Config.in
index 5f3ef17..e65d71d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -382,6 +382,7 @@ source "package/luacrypto/Config.in"
 source "package/luaexpat/Config.in"
 source "package/luaexpatutils/Config.in"
 source "package/luafilesystem/Config.in"
+source "package/luajson/Config.in"
 source "package/luaposix/Config.in"
 source "package/luasec/Config.in"
 source "package/luasocket/Config.in"
diff --git a/package/luajson/Config.in b/package/luajson/Config.in
new file mode 100644
index 0000000..9be7d25
--- /dev/null
+++ b/package/luajson/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LUAJSON
+	bool "luajson"
+	select BR2_PACKAGE_LPEG
+	help
+	  LuaJSON is a customizable JSON decoder/encoder
+	  using LPEG for parsing.
+
+	  http://github.com/harningt/luajson
diff --git a/package/luajson/luajson.mk b/package/luajson/luajson.mk
new file mode 100644
index 0000000..88db6b0
--- /dev/null
+++ b/package/luajson/luajson.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# luajson
+#
+################################################################################
+
+LUAJSON_VERSION_UPSTREAM = 1.3.2
+LUAJSON_VERSION = $(LUAJSON_VERSION_UPSTREAM)-1
+LUAJSON_SUBDIR  = luajson
+LUAJSON_LICENSE = MIT
+LUAJSON_LICENSE_FILES = $(LUAJSON_SUBDIR)/LICENSE
+
+$(eval $(luarocks-package))
-- 
1.7.9.5
