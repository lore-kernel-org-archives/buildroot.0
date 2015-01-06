From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue,  6 Jan 2015 15:03:07 +0100
Subject: [Buildroot] [PATCH v5 09/16] erlang-p1-utils: new package.
In-Reply-To: <1420552994-657-1-git-send-email-johan.oudinet@gmail.com>
References: <1420552994-657-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <1420552994-657-10-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/Config.in                          |  1 +
 package/erlang-p1-utils/Config.in          |  6 ++++++
 package/erlang-p1-utils/erlang-p1-utils.mk | 13 +++++++++++++
 3 files changed, 20 insertions(+)
 create mode 100644 package/erlang-p1-utils/Config.in
 create mode 100644 package/erlang-p1-utils/erlang-p1-utils.mk

diff --git a/package/Config.in b/package/Config.in
index da4330c..2a869e0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -399,6 +399,7 @@ if BR2_PACKAGE_ERLANG
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
-- 
2.1.0
