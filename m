From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue, 28 Oct 2014 14:33:42 +0100
Subject: [Buildroot] [PATCH 05/15] erlang-p1-zlib: new package.
In-Reply-To: <1414503232-28314-1-git-send-email-johan.oudinet@gmail.com>
References: <1414503232-28314-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <1414503232-28314-6-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/Config.in                        |  1 +
 package/erlang-p1-zlib/Config.in         |  5 +++++
 package/erlang-p1-zlib/erlang-p1-zlib.mk | 13 +++++++++++++
 3 files changed, 19 insertions(+)
 create mode 100644 package/erlang-p1-zlib/Config.in
 create mode 100644 package/erlang-p1-zlib/erlang-p1-zlib.mk

diff --git a/package/Config.in b/package/Config.in
index b3b67a8..3e25766 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -396,6 +396,7 @@ if BR2_PACKAGE_ERLANG
 menu "Erlang libraries/modules"
 	source "package/erlang-goldrush/Config.in"
 	source "package/erlang-lager/Config.in"
+	source "package/erlang-p1-zlib/Config.in"
 endmenu
 endif
 	source "package/haserl/Config.in"
diff --git a/package/erlang-p1-zlib/Config.in b/package/erlang-p1-zlib/Config.in
new file mode 100644
index 0000000..3d4f455
--- /dev/null
+++ b/package/erlang-p1-zlib/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_ERLANG_P1_ZLIB
+	bool "erlang-p1-zlib"
+	depends on BR2_PACKAGE_ERLANG
+	help
+	  Erlang interface to zlib
diff --git a/package/erlang-p1-zlib/erlang-p1-zlib.mk b/package/erlang-p1-zlib/erlang-p1-zlib.mk
new file mode 100644
index 0000000..84ecb35
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
+ERLANG_P1_ZLIB_DEPENDENCIES = erlang
+
+$(eval $(rebar-package))
-- 
2.1.0
