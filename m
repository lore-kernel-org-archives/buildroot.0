From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 Feb 2020 15:12:05 +0100
Subject: [Buildroot] [git commit] package/lua-livr-extra: new package
Message-ID: <20200202140115.8BA0A88308@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=59dbd33496d1176b49e38e06580a1b6d0be27838
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                          |  1 +
 package/lua-livr-extra/Config.in           |  7 +++++++
 package/lua-livr-extra/lua-livr-extra.hash |  3 +++
 package/lua-livr-extra/lua-livr-extra.mk   | 12 ++++++++++++
 4 files changed, 23 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 452b283670..711613fb4a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -651,6 +651,7 @@ menu "Lua libraries/modules"
 	source "package/lua-http/Config.in"
 	source "package/lua-iconv/Config.in"
 	source "package/lua-livr/Config.in"
+	source "package/lua-livr-extra/Config.in"
 	source "package/lua-lpeg-patterns/Config.in"
 	source "package/lua-lunitx/Config.in"
 	source "package/lua-markdown/Config.in"
diff --git a/package/lua-livr-extra/Config.in b/package/lua-livr-extra/Config.in
new file mode 100644
index 0000000000..0850622923
--- /dev/null
+++ b/package/lua-livr-extra/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LUA_LIVR_EXTRA
+	bool "lua-livr-extra"
+	select BR2_PACKAGE_LUA_LIVR # runtime
+	help
+	  more LIVR rules.
+
+	  https://fperrad.frama.io/lua-LIVR-extra
diff --git a/package/lua-livr-extra/lua-livr-extra.hash b/package/lua-livr-extra/lua-livr-extra.hash
new file mode 100644
index 0000000000..cb7cf898bc
--- /dev/null
+++ b/package/lua-livr-extra/lua-livr-extra.hash
@@ -0,0 +1,3 @@
+# computed by luarocks/buildroot
+sha256 42fef357db3e05e32112ddebcd4296f040a825dfac77ff2fa03aedbdcdaac729  lua-livr-extra-0.1.1-1.src.rock
+sha256 96751dc604608ecf2357d1599bc2d2e9f56382793a6c218dc98d460759adbf07  lua-LIVR-extra-0.1.1/COPYRIGHT
diff --git a/package/lua-livr-extra/lua-livr-extra.mk b/package/lua-livr-extra/lua-livr-extra.mk
new file mode 100644
index 0000000000..0a6378dbf5
--- /dev/null
+++ b/package/lua-livr-extra/lua-livr-extra.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# lua-livr-extra
+#
+################################################################################
+
+LUA_LIVR_EXTRA_VERSION = 0.1.1-1
+LUA_LIVR_EXTRA_NAME_UPSTREAM = lua-LIVR-extra
+LUA_LIVR_EXTRA_LICENSE = MIT
+LUA_LIVR_EXTRA_LICENSE_FILES = $(LUA_LIVR_EXTRA_SUBDIR)/COPYRIGHT
+
+$(eval $(luarocks-package))
