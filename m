From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon,  6 Jan 2020 17:11:07 +0100
Subject: [Buildroot] [PATCH 14/22] erlang-base64url: New package
In-Reply-To: <20200106161115.16524-1-johan.oudinet@gmail.com>
References: <20200106161115.16524-1-johan.oudinet@gmail.com>
Message-ID: <20200106161115.16524-15-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/Config.in                              |  1 +
 package/erlang-base64url/Config.in             |  6 ++++++
 package/erlang-base64url/erlang-base64url.hash |  2 ++
 package/erlang-base64url/erlang-base64url.mk   | 13 +++++++++++++
 4 files changed, 22 insertions(+)
 create mode 100644 package/erlang-base64url/Config.in
 create mode 100644 package/erlang-base64url/erlang-base64url.hash
 create mode 100644 package/erlang-base64url/erlang-base64url.mk

diff --git a/package/Config.in b/package/Config.in
index 894284c650..0c4698f601 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -576,6 +576,7 @@ menu "Interpreter languages and scripting"
 	source "package/erlang/Config.in"
 if BR2_PACKAGE_ERLANG
 menu "Erlang libraries/modules"
+	source "package/erlang-base64url/Config.in"
 	source "package/erlang-eimp/Config.in"
 	source "package/erlang-goldrush/Config.in"
 	source "package/erlang-jiffy/Config.in"
diff --git a/package/erlang-base64url/Config.in b/package/erlang-base64url/Config.in
new file mode 100644
index 0000000000..7883fa3831
--- /dev/null
+++ b/package/erlang-base64url/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_ERLANG_BASE64URL
+	bool "erlang-base64url"
+	help
+	  URL safe base64-compatible codec.
+
+	  https://github.com/dvv/base64url
diff --git a/package/erlang-base64url/erlang-base64url.hash b/package/erlang-base64url/erlang-base64url.hash
new file mode 100644
index 0000000000..8d3d9e1961
--- /dev/null
+++ b/package/erlang-base64url/erlang-base64url.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 7ef7210effd25ac1f82f190fcfaef53e49d7bc40bb94112c4aa07266c32a851b erlang-base64url-1.0.1.tar.gz
diff --git a/package/erlang-base64url/erlang-base64url.mk b/package/erlang-base64url/erlang-base64url.mk
new file mode 100644
index 0000000000..bf8cffcbba
--- /dev/null
+++ b/package/erlang-base64url/erlang-base64url.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# erlang-base64url
+#
+################################################################################
+
+ERLANG_BASE64URL_VERSION = 1.0.1
+ERLANG_BASE64URL_SITE = $(call github,dvv,base64url,$(ERLANG_BASE64URL_VERSION))
+ERLANG_BASE64URL_LICENSE = MIT
+ERLANG_BASE64URL_LICENSE_FILES = LICENSE.txt
+ERLANG_BASE64URL_DEPENDENCIES = erlang
+
+$(eval $(rebar-package))
-- 
2.20.1
