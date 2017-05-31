From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Wed, 31 May 2017 18:35:42 +0200
Subject: [Buildroot] [PATCH v2 1/4] erlang-jiffy: New package
Message-ID: <20170531163545.23552-1-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

JSON NIFs for Erlang.
https://github.com/davisp/jiffy

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>

---
Changes v1 -> v2:
  - Fix license info (suggested by Thomas)
  - Add an entry to the DEVELOPERS file
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/erlang-jiffy/Config.in         | 10 ++++++++++
 package/erlang-jiffy/erlang-jiffy.hash |  2 ++
 package/erlang-jiffy/erlang-jiffy.mk   | 13 +++++++++++++
 5 files changed, 27 insertions(+)
 create mode 100644 package/erlang-jiffy/Config.in
 create mode 100644 package/erlang-jiffy/erlang-jiffy.hash
 create mode 100644 package/erlang-jiffy/erlang-jiffy.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a8fa14365c..231e73323b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -861,6 +861,7 @@ F:	package/python-libconfig/
 N:	Johan Oudinet <johan.oudinet@gmail.com>
 F:	package/ejabberd/
 F:	package/erlang-goldrush/
+F:	package/erlang-jiffy/
 F:	package/erlang-lager/
 F:	package/erlang-p1-cache-tab/
 F:	package/erlang-p1-iconv/
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
index 0000000000..4c2195af48
--- /dev/null
+++ b/package/erlang-jiffy/erlang-jiffy.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# erlang-jiffy
+#
+################################################################################
+
+ERLANG_JIFFY_VERSION = 0.14.8
+ERLANG_JIFFY_SITE = $(call github,davisp,jiffy,$(ERLANG_JIFFY_VERSION))
+ERLANG_JIFFY_LICENSE = MIT (core), BSD-3-Clause (Google double \
+conversion library), BSD-3-Clause (tests)
+ERLANG_JIFFY_LICENSE_FILES = LICENSE
+
+$(eval $(rebar-package))
-- 
2.11.0
