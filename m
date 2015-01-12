From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon, 12 Jan 2015 10:32:10 +0100
Subject: [Buildroot] [PATCH v6 06/16] erlang-p1-zlib: new package.
In-Reply-To: <1421055140-5092-1-git-send-email-johan.oudinet@gmail.com>
References: <1421055140-5092-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <1421055140-5092-7-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>

---
Changes v5 -> v6:  (Thomas)
  - add dependency to zlib.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/Config.in                        |  1 +
 package/erlang-p1-zlib/Config.in         |  7 +++++++
 package/erlang-p1-zlib/erlang-p1-zlib.mk | 13 +++++++++++++
 3 files changed, 21 insertions(+)
 create mode 100644 package/erlang-p1-zlib/Config.in
 create mode 100644 package/erlang-p1-zlib/erlang-p1-zlib.mk

diff --git a/package/Config.in b/package/Config.in
index fb1a060..883c3ac 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -402,6 +402,7 @@ if BR2_PACKAGE_ERLANG
 menu "Erlang libraries/modules"
 	source "package/erlang-goldrush/Config.in"
 	source "package/erlang-lager/Config.in"
+	source "package/erlang-p1-zlib/Config.in"
 endmenu
 endif
 	source "package/guile/Config.in"
diff --git a/package/erlang-p1-zlib/Config.in b/package/erlang-p1-zlib/Config.in
new file mode 100644
index 0000000..b7e48a1
--- /dev/null
+++ b/package/erlang-p1-zlib/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_ERLANG_P1_ZLIB
+	bool "erlang-p1-zlib"
+	select BR2_PACKAGE_ZLIB
+	help
+	  Erlang interface to zlib
+
+	  https://github.com/processone/zlib
diff --git a/package/erlang-p1-zlib/erlang-p1-zlib.mk b/package/erlang-p1-zlib/erlang-p1-zlib.mk
new file mode 100644
index 0000000..4ba3332
--- /dev/null
+++ b/package/erlang-p1-zlib/erlang-p1-zlib.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# erlang-p1-zlib
+#
+################################################################################
+
+ERLANG_P1_ZLIB_VERSION = 52e82bb
+ERLANG_P1_ZLIB_SITE = $(call github,processone,zlib,$(ERLANG_P1_ZLIB_VERSION))
+ERLANG_P1_ZLIB_LICENSE = GPLv2+
+ERLANG_P1_ZLIB_LICENSE_FILES = COPYING
+ERLANG_P1_ZLIB_DEPENDENCIES = zlib
+
+$(eval $(rebar-package))
-- 
2.1.0
