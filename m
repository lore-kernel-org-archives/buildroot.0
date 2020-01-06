From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon,  6 Jan 2020 17:11:13 +0100
Subject: [Buildroot] [PATCH 20/22] erlang-p1-acme: New package
In-Reply-To: <20200106161115.16524-1-johan.oudinet@gmail.com>
References: <20200106161115.16524-1-johan.oudinet@gmail.com>
Message-ID: <20200106161115.16524-21-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/Config.in                          |  1 +
 package/erlang-p1-acme/Config.in           | 10 ++++++++++
 package/erlang-p1-acme/erlang-p1-acme.hash |  2 ++
 package/erlang-p1-acme/erlang-p1-acme.mk   | 14 ++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/erlang-p1-acme/Config.in
 create mode 100644 package/erlang-p1-acme/erlang-p1-acme.hash
 create mode 100644 package/erlang-p1-acme/erlang-p1-acme.mk

diff --git a/package/Config.in b/package/Config.in
index 7914571ffb..436216338a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -583,6 +583,7 @@ menu "Erlang libraries/modules"
 	source "package/erlang-jiffy/Config.in"
 	source "package/erlang-jose/Config.in"
 	source "package/erlang-lager/Config.in"
+	source "package/erlang-p1-acme/Config.in"
 	source "package/erlang-p1-cache-tab/Config.in"
 	source "package/erlang-p1-iconv/Config.in"
 	source "package/erlang-p1-mqtree/Config.in"
diff --git a/package/erlang-p1-acme/Config.in b/package/erlang-p1-acme/Config.in
new file mode 100644
index 0000000000..2cd1985a4b
--- /dev/null
+++ b/package/erlang-p1-acme/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_ERLANG_P1_ACME
+	bool "erlang-p1-acme"
+	select BR2_PACKAGE_ERLANG_IDNA
+	select BR2_PACKAGE_ERLANG_JIFFY
+	select BR2_PACKAGE_ERLANG_JOSE
+	select BR2_PACKAGE_ERLANG_P1_YCONF
+	help
+	  ACME client library for Erlang.
+
+	  https://github.com/processone/p1_acme
diff --git a/package/erlang-p1-acme/erlang-p1-acme.hash b/package/erlang-p1-acme/erlang-p1-acme.hash
new file mode 100644
index 0000000000..6809ed6c4f
--- /dev/null
+++ b/package/erlang-p1-acme/erlang-p1-acme.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 556a9628c323a5a83116ed78599c891f74447b0bac237c095e776c7009089656 erlang-p1-acme-1.0.1.tar.gz
diff --git a/package/erlang-p1-acme/erlang-p1-acme.mk b/package/erlang-p1-acme/erlang-p1-acme.mk
new file mode 100644
index 0000000000..b57885cc3f
--- /dev/null
+++ b/package/erlang-p1-acme/erlang-p1-acme.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# erlang-p1-acme
+#
+################################################################################
+
+ERLANG_P1_ACME_VERSION = 1.0.1
+ERLANG_P1_ACME_SITE = $(call github,processone,p1_acme,$(ERLANG_P1_ACME_VERSION))
+ERLANG_P1_ACME_LICENSE = Apache-2.0
+ERLANG_P1_ACME_LICENSE_FILES = LICENSE.txt
+ERLANG_P1_ACME_DEPENDENCIES = erlang erlang-idna erlang-jiffy erlang-jose \
+erlang-p1-yconf
+
+$(eval $(rebar-package))
-- 
2.20.1
