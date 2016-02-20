From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 18:38:10 +0100
Subject: [Buildroot] [git commit] erlang-fast_tls: new package
Message-ID: <20160302202754.8428D7FF3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc7257b264a9fbbe4eb236ed318a697ca11b87b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package is used by the newer versions of the ejabberd dependencies.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                          |  1 +
 package/erlang-fast_tls/Config.in          |  8 ++++++++
 package/erlang-fast_tls/erlang-fast_tls.mk | 14 ++++++++++++++
 3 files changed, 23 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 8aa6bb5..422978f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -471,6 +471,7 @@ menu "Interpreter languages and scripting"
 	source "package/erlang/Config.in"
 if BR2_PACKAGE_ERLANG
 menu "Erlang libraries/modules"
+	source "package/erlang-fast_tls/Config.in"
 	source "package/erlang-goldrush/Config.in"
 	source "package/erlang-lager/Config.in"
 	source "package/erlang-p1-cache-tab/Config.in"
diff --git a/package/erlang-fast_tls/Config.in b/package/erlang-fast_tls/Config.in
new file mode 100644
index 0000000..3bf52a1
--- /dev/null
+++ b/package/erlang-fast_tls/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_ERLANG_FAST_TLS
+	bool "erlang-fast_tls"
+	select BR2_PACKAGE_ERLANG_P1_UTILS
+	select BR2_PACKAGE_OPENSSL
+	help
+	  TLS / SSL OpenSSL-based native driver for Erlang / Elixir
+
+	  https://github.com/processone/fast_tls
diff --git a/package/erlang-fast_tls/erlang-fast_tls.mk b/package/erlang-fast_tls/erlang-fast_tls.mk
new file mode 100644
index 0000000..63c55c5
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
+ERLANG_FAST_TLS_DEPENDENCIES = openssl erlang-p1-utils
+
+$(eval $(rebar-package))
