From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Feb 2015 10:23:18 +0100
Subject: [Buildroot] [git commit] erlang-p1-utils: new package.
Message-ID: <20150203092417.BF44B80E25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=74a8d57cca556c0b66b0b31a90d47a5670de604c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                          |    1 +
 package/erlang-p1-utils/Config.in          |    6 ++++++
 package/erlang-p1-utils/erlang-p1-utils.mk |   13 +++++++++++++
 3 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 9eb2087..c0512fe 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -401,6 +401,7 @@ if BR2_PACKAGE_ERLANG
 menu "Erlang libraries/modules"
 	source "package/erlang-goldrush/Config.in"
 	source "package/erlang-lager/Config.in"
+	source "package/erlang-p1-utils/Config.in"
 	source "package/erlang-p1-xml/Config.in"
 	source "package/erlang-p1-yaml/Config.in"
 	source "package/erlang-p1-zlib/Config.in"
diff --git a/package/erlang-p1-utils/Config.in b/package/erlang-p1-utils/Config.in
new file mode 100644
index 0000000..a82e5f7
--- /dev/null
+++ b/package/erlang-p1-utils/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_ERLANG_P1_UTILS
+	bool "erlang-p1-utils"
+	help
+	  Set of small Erlang libraries
+
+	  https://github.com/processone/p1_utils
diff --git a/package/erlang-p1-utils/erlang-p1-utils.mk b/package/erlang-p1-utils/erlang-p1-utils.mk
new file mode 100644
index 0000000..0e63031
--- /dev/null
+++ b/package/erlang-p1-utils/erlang-p1-utils.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# erlang-p1-utils
+#
+################################################################################
+
+ERLANG_P1_UTILS_VERSION = 940f42d
+ERLANG_P1_UTILS_SITE = $(call github,processone,p1_utils,$(ERLANG_P1_UTILS_VERSION))
+ERLANG_P1_UTILS_LICENSE = GPLv2+
+ERLANG_P1_UTILS_LICENSE_FILES = COPYING
+ERLANG_P1_UTILS_INSTALL_STAGING = YES
+
+$(eval $(rebar-package))
