From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Fri, 22 Jan 2016 20:10:59 -0500
Subject: [Buildroot] [PATCH 06/18] erlang-fast_tls: new package
In-Reply-To: <1453511471-28519-1-git-send-email-fhunleth@troodon-software.com>
References: <1453511471-28519-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <1453511471-28519-7-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package is used by the newer versions of the ejabberd dependencies.
---
 package/Config.in                          |  1 +
 package/erlang-fast_tls/Config.in          |  7 +++++++
 package/erlang-fast_tls/erlang-fast_tls.mk | 14 ++++++++++++++
 3 files changed, 22 insertions(+)
 create mode 100644 package/erlang-fast_tls/Config.in
 create mode 100644 package/erlang-fast_tls/erlang-fast_tls.mk

diff --git a/package/Config.in b/package/Config.in
index 09c2b40..a560784 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -471,6 +471,7 @@ menu "Erlang libraries/modules"
 	source "package/erlang-goldrush/Config.in"
 	source "package/erlang-lager/Config.in"
 	source "package/erlang-p1-cache-tab/Config.in"
+	source "package/erlang-fast_tls/Config.in"
 	source "package/erlang-p1-iconv/Config.in"
 	source "package/erlang-p1-sip/Config.in"
 	source "package/erlang-p1-stringprep/Config.in"
diff --git a/package/erlang-fast_tls/Config.in b/package/erlang-fast_tls/Config.in
new file mode 100644
index 0000000..a303e85
--- /dev/null
+++ b/package/erlang-fast_tls/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_ERLANG_FAST_TLS
+	bool "erlang-fast_tls"
+	select BR2_PACKAGE_OPENSSL
+	help
+	  TLS / SSL OpenSSL-based native driver for Erlang / Elixir
+
+	  https://github.com/processone/fast_tls
diff --git a/package/erlang-fast_tls/erlang-fast_tls.mk b/package/erlang-fast_tls/erlang-fast_tls.mk
new file mode 100644
index 0000000..17be01b
--- /dev/null
+++ b/package/erlang-fast_tls/erlang-fast_tls.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# erlang-fast_tls
+#
+################################################################################
+
+ERLANG_FAST_TLS_VERSION = 1.0.0
+ERLANG_FAST_TLS_SITE = $(call github,processone,fast_tls,$(ERLANG_FAST_TLS_VERSION))
+ERLANG_FAST_TLS_LICENSE = Apache-2.0
+ERLANG_FAST_TLS_LICENSE_FILES = LICENSE.txt
+ERLANG_FAST_TLS_INSTALL_STAGING = YES
+ERLANG_FAST_TLS_DEPENDENCIES = openssl
+
+$(eval $(rebar-package))
-- 
2.5.0
