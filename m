From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue, 30 May 2017 16:52:08 +0200
Subject: [Buildroot] [PATCH 13/16] erlang-jiffy: New package
In-Reply-To: <20170530145211.15320-1-johan.oudinet@gmail.com>
References: <20170530145211.15320-1-johan.oudinet@gmail.com>
Message-ID: <20170530145211.15320-14-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

JSON NIFs for Erlang.
https://github.com/davisp/jiffy

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/Config.in                      |  1 +
 package/erlang-jiffy/Config.in         | 10 ++++++++++
 package/erlang-jiffy/erlang-jiffy.hash |  2 ++
 package/erlang-jiffy/erlang-jiffy.mk   | 12 ++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/erlang-jiffy/Config.in
 create mode 100644 package/erlang-jiffy/erlang-jiffy.hash
 create mode 100644 package/erlang-jiffy/erlang-jiffy.mk

diff --git a/package/Config.in b/package/Config.in
index 7991353f99..2b53add300 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -510,6 +510,7 @@ menu "Interpreter languages and scripting"
 if BR2_PACKAGE_ERLANG
 menu "Erlang libraries/modules"
 	source "package/erlang-goldrush/Config.in"
+	source "package/erlang-jiffy/Config.in"
 	source "package/erlang-lager/Config.in"
 	source "package/erlang-p1-cache-tab/Config.in"
 	source "package/erlang-p1-iconv/Config.in"
diff --git a/package/erlang-jiffy/Config.in b/package/erlang-jiffy/Config.in
new file mode 100644
index 0000000000..d65f42c9fd
--- /dev/null
+++ b/package/erlang-jiffy/Config.in
@@ -0,0 +1,10 @@
+comment "erlang-jiffy needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
+config BR2_PACKAGE_ERLANG_JIFFY
+	bool "erlang-jiffy"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  JSON NIFs for Erlang.
+
+	  https://github.com/davisp/jiffy
diff --git a/package/erlang-jiffy/erlang-jiffy.hash b/package/erlang-jiffy/erlang-jiffy.hash
new file mode 100644
index 0000000000..1f83e2789c
--- /dev/null
+++ b/package/erlang-jiffy/erlang-jiffy.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 7d1054c475c82c626de3ad57201a7fc51da38667c8a7502149eb751edc6b601d erlang-jiffy-0.14.8.tar.gz
diff --git a/package/erlang-jiffy/erlang-jiffy.mk b/package/erlang-jiffy/erlang-jiffy.mk
new file mode 100644
index 0000000000..af53ecbe75
--- /dev/null
+++ b/package/erlang-jiffy/erlang-jiffy.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# erlang-jiffy
+#
+################################################################################
+
+ERLANG_JIFFY_VERSION = 0.14.8
+ERLANG_JIFFY_SITE = $(call github,davisp,jiffy,$(ERLANG_JIFFY_VERSION))
+ERLANG_JIFFY_LICENSE = MIT
+ERLANG_JIFFY_LICENSE_FILES = LICENSE
+
+$(eval $(rebar-package))
-- 
2.11.0
