From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Feb 2015 10:23:11 +0100
Subject: [Buildroot] [git commit] erlang-p1-zlib: new package.
Message-ID: <20150203092417.A1E3E80E25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=80137e0e7d173106a6bebac63447a7625692bcd5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                        |    1 +
 package/erlang-p1-zlib/Config.in         |    7 +++++++
 package/erlang-p1-zlib/erlang-p1-zlib.mk |   13 +++++++++++++
 3 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 691af64..2fa3750 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -401,6 +401,7 @@ if BR2_PACKAGE_ERLANG
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
