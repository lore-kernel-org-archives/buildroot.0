From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon,  6 Jan 2020 17:11:08 +0100
Subject: [Buildroot] [PATCH 15/22] erlang-jose: New package
In-Reply-To: <20200106161115.16524-1-johan.oudinet@gmail.com>
References: <20200106161115.16524-1-johan.oudinet@gmail.com>
Message-ID: <20200106161115.16524-16-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/Config.in                    |  1 +
 package/erlang-jose/Config.in        |  7 +++++++
 package/erlang-jose/erlang-jose.hash |  2 ++
 package/erlang-jose/erlang-jose.mk   | 13 +++++++++++++
 4 files changed, 23 insertions(+)
 create mode 100644 package/erlang-jose/Config.in
 create mode 100644 package/erlang-jose/erlang-jose.hash
 create mode 100644 package/erlang-jose/erlang-jose.mk

diff --git a/package/Config.in b/package/Config.in
index 0c4698f601..52d556c5ee 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -580,6 +580,7 @@ menu "Erlang libraries/modules"
 	source "package/erlang-eimp/Config.in"
 	source "package/erlang-goldrush/Config.in"
 	source "package/erlang-jiffy/Config.in"
+	source "package/erlang-jose/Config.in"
 	source "package/erlang-lager/Config.in"
 	source "package/erlang-p1-cache-tab/Config.in"
 	source "package/erlang-p1-iconv/Config.in"
diff --git a/package/erlang-jose/Config.in b/package/erlang-jose/Config.in
new file mode 100644
index 0000000000..8e7f2209b2
--- /dev/null
+++ b/package/erlang-jose/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_ERLANG_JOSE
+	bool "erlang-jose"
+	select BR2_PACKAGE_ERLANG_BASE64URL
+	help
+	  JSON Object Signing and Encryption (JOSE) for Erlang and Elixir.
+
+	  https://github.com/potatosalad/erlang-jose
diff --git a/package/erlang-jose/erlang-jose.hash b/package/erlang-jose/erlang-jose.hash
new file mode 100644
index 0000000000..3b1f18504e
--- /dev/null
+++ b/package/erlang-jose/erlang-jose.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 d55a9d3a1697833fed555a21f1aeb2727af88193995cb6ffa945d4b6749d0e8d erlang-jose-1.9.0.tar.gz
diff --git a/package/erlang-jose/erlang-jose.mk b/package/erlang-jose/erlang-jose.mk
new file mode 100644
index 0000000000..18d66d7204
--- /dev/null
+++ b/package/erlang-jose/erlang-jose.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# erlang-jose
+#
+################################################################################
+
+ERLANG_JOSE_VERSION = 1.9.0
+ERLANG_JOSE_SITE = $(call github,potatosalad,erlang-jose,$(ERLANG_JOSE_VERSION))
+ERLANG_JOSE_LICENSE = MIT
+ERLANG_JOSE_LICENSE_FILES = LICENSE.md
+ERLANG_JOSE_DEPENDENCIES = erlang erlang-base64url
+
+$(eval $(rebar-package))
-- 
2.20.1
