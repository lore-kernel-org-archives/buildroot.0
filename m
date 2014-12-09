From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue,  9 Dec 2014 15:34:15 +0100
Subject: [Buildroot] [PATCH v4 10/17] erlang-p1-utils: new package.
In-Reply-To: <1418135662-773-1-git-send-email-johan.oudinet@gmail.com>
References: <1418135662-773-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <1418135662-773-11-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/Config.in                          |  1 +
 package/erlang-p1-utils/Config.in          |  5 +++++
 package/erlang-p1-utils/erlang-p1-utils.mk | 14 ++++++++++++++
 3 files changed, 20 insertions(+)
 create mode 100644 package/erlang-p1-utils/Config.in
 create mode 100644 package/erlang-p1-utils/erlang-p1-utils.mk

diff --git a/package/Config.in b/package/Config.in
index f9503ad..93b7bcb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -396,6 +396,7 @@ if BR2_PACKAGE_ERLANG
 menu "Erlang libraries/modules"
 	source "package/erlang-goldrush/Config.in"
 	source "package/erlang-lager/Config.in"
+	source "package/erlang-p1-utils/Config.in"
 	source "package/erlang-p1-xml/Config.in"
 	source "package/erlang-p1-yaml/Config.in"
 	source "package/erlang-p1-zlib/Config.in"
diff --git a/package/erlang-p1-utils/Config.in b/package/erlang-p1-utils/Config.in
new file mode 100644
index 0000000..a544eed
--- /dev/null
+++ b/package/erlang-p1-utils/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_ERLANG_P1_UTILS
+	bool "erlang-p1-utils"
+	depends on BR2_PACKAGE_ERLANG
+	help
+	  Set of small Erlang libraries
diff --git a/package/erlang-p1-utils/erlang-p1-utils.mk b/package/erlang-p1-utils/erlang-p1-utils.mk
new file mode 100644
index 0000000..23e2c63
--- /dev/null
+++ b/package/erlang-p1-utils/erlang-p1-utils.mk
@@ -0,0 +1,14 @@
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
+ERLANG_P1_UTILS_DEPENDENCIES = erlang
+ERLANG_P1_UTILS_INSTALL_STAGING = YES
+
+$(eval $(rebar-package))
-- 
2.1.0
