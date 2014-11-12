From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 12 Nov 2014 01:26:00 +0100
Subject: [Buildroot] [PATCH 14/24 v3] erlang-p1-zlib: new package.
In-Reply-To: <cover.1415751395.git.yann.morin.1998@free.fr>
References: <cover.1415751395.git.yann.morin.1998@free.fr>
Message-ID: <9037eacccda288b0f7f03836a744ccb514315173.1415751395.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Johan Oudinet <johan.oudinet@gmail.com>

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in                        |  1 +
 package/erlang-p1-zlib/Config.in         |  5 +++++
 package/erlang-p1-zlib/erlang-p1-zlib.mk | 13 +++++++++++++
 3 files changed, 19 insertions(+)
 create mode 100644 package/erlang-p1-zlib/Config.in
 create mode 100644 package/erlang-p1-zlib/erlang-p1-zlib.mk

diff --git a/package/Config.in b/package/Config.in
index c2c0381..f394e7d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -395,6 +395,7 @@ if BR2_PACKAGE_ERLANG
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
1.9.1
