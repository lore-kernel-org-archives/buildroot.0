From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue, 28 Oct 2014 14:33:46 +0100
Subject: [Buildroot] [PATCH 09/15] erlang-p1-tls: new package.
In-Reply-To: <1414503232-28314-1-git-send-email-johan.oudinet@gmail.com>
References: <1414503232-28314-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <1414503232-28314-10-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/Config.in                      |  1 +
 package/erlang-p1-tls/Config.in        |  5 +++++
 package/erlang-p1-tls/erlang-p1-tls.mk | 14 ++++++++++++++
 3 files changed, 20 insertions(+)
 create mode 100644 package/erlang-p1-tls/Config.in
 create mode 100644 package/erlang-p1-tls/erlang-p1-tls.mk

diff --git a/package/Config.in b/package/Config.in
index addb2b6..cbf05e2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -396,6 +396,7 @@ if BR2_PACKAGE_ERLANG
 menu "Erlang libraries/modules"
 	source "package/erlang-goldrush/Config.in"
 	source "package/erlang-lager/Config.in"
+	source "package/erlang-p1-tls/Config.in"
 	source "package/erlang-p1-utils/Config.in"
 	source "package/erlang-p1-xml/Config.in"
 	source "package/erlang-p1-yaml/Config.in"
diff --git a/package/erlang-p1-tls/Config.in b/package/erlang-p1-tls/Config.in
new file mode 100644
index 0000000..1aa53bc
--- /dev/null
+++ b/package/erlang-p1-tls/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_ERLANG_P1_TLS
+	bool "erlang-p1-tls"
+	depends on BR2_PACKAGE_ERLANG
+	help
+	  Erlang interface to OpenSSL
diff --git a/package/erlang-p1-tls/erlang-p1-tls.mk b/package/erlang-p1-tls/erlang-p1-tls.mk
new file mode 100644
index 0000000..a884377
--- /dev/null
+++ b/package/erlang-p1-tls/erlang-p1-tls.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# erlang-p1-tls
+#
+################################################################################
+
+ERLANG_P1_TLS_VERSION = 53f0478
+ERLANG_P1_TLS_SITE = $(call github,processone,tls,$(ERLANG_P1_TLS_VERSION))
+ERLANG_P1_TLS_LICENSE = GPLv2+
+ERLANG_P1_TLS_LICENSE_FILES = COPYING
+ERLANG_P1_TLS_DEPENDENCIES = erlang
+ERLANG_P1_TLS_INSTALL_STAGING = YES
+
+$(eval $(rebar-package))
-- 
2.1.0
