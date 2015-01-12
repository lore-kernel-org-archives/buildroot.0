From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon, 12 Jan 2015 10:32:14 +0100
Subject: [Buildroot] [PATCH v6 10/16] erlang-p1-tls: new package.
In-Reply-To: <1421055140-5092-1-git-send-email-johan.oudinet@gmail.com>
References: <1421055140-5092-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <1421055140-5092-11-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/Config.in                      |  1 +
 package/erlang-p1-tls/Config.in        |  6 ++++++
 package/erlang-p1-tls/erlang-p1-tls.mk | 13 +++++++++++++
 3 files changed, 20 insertions(+)
 create mode 100644 package/erlang-p1-tls/Config.in
 create mode 100644 package/erlang-p1-tls/erlang-p1-tls.mk

diff --git a/package/Config.in b/package/Config.in
index 2879ad0..bdb4263 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -402,6 +402,7 @@ if BR2_PACKAGE_ERLANG
 menu "Erlang libraries/modules"
 	source "package/erlang-goldrush/Config.in"
 	source "package/erlang-lager/Config.in"
+	source "package/erlang-p1-tls/Config.in"
 	source "package/erlang-p1-utils/Config.in"
 	source "package/erlang-p1-xml/Config.in"
 	source "package/erlang-p1-yaml/Config.in"
diff --git a/package/erlang-p1-tls/Config.in b/package/erlang-p1-tls/Config.in
new file mode 100644
index 0000000..42c6a3e
--- /dev/null
+++ b/package/erlang-p1-tls/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_ERLANG_P1_TLS
+	bool "erlang-p1-tls"
+	help
+	  Erlang interface to OpenSSL
+
+	  https://github.com/processone/tls
diff --git a/package/erlang-p1-tls/erlang-p1-tls.mk b/package/erlang-p1-tls/erlang-p1-tls.mk
new file mode 100644
index 0000000..d6e5801
--- /dev/null
+++ b/package/erlang-p1-tls/erlang-p1-tls.mk
@@ -0,0 +1,13 @@
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
+ERLANG_P1_TLS_INSTALL_STAGING = YES
+
+$(eval $(rebar-package))
-- 
2.1.0
