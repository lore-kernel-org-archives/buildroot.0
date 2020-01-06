From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon,  6 Jan 2020 17:11:09 +0100
Subject: [Buildroot] [PATCH 16/22] erlang-idna: New package
In-Reply-To: <20200106161115.16524-1-johan.oudinet@gmail.com>
References: <20200106161115.16524-1-johan.oudinet@gmail.com>
Message-ID: <20200106161115.16524-17-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/Config.in                    |  1 +
 package/erlang-idna/Config.in        |  6 ++++++
 package/erlang-idna/erlang-idna.hash |  2 ++
 package/erlang-idna/erlang-idna.mk   | 13 +++++++++++++
 4 files changed, 22 insertions(+)
 create mode 100644 package/erlang-idna/Config.in
 create mode 100644 package/erlang-idna/erlang-idna.hash
 create mode 100644 package/erlang-idna/erlang-idna.mk

diff --git a/package/Config.in b/package/Config.in
index 52d556c5ee..15e9348502 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -579,6 +579,7 @@ menu "Erlang libraries/modules"
 	source "package/erlang-base64url/Config.in"
 	source "package/erlang-eimp/Config.in"
 	source "package/erlang-goldrush/Config.in"
+	source "package/erlang-idna/Config.in"
 	source "package/erlang-jiffy/Config.in"
 	source "package/erlang-jose/Config.in"
 	source "package/erlang-lager/Config.in"
diff --git a/package/erlang-idna/Config.in b/package/erlang-idna/Config.in
new file mode 100644
index 0000000000..de7116689a
--- /dev/null
+++ b/package/erlang-idna/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_ERLANG_IDNA
+	bool "erlang-idna"
+	help
+	  A pure Erlang IDNA implementation that follows RFC5891.
+
+	  https://github.com/benoitc/erlang-idna
diff --git a/package/erlang-idna/erlang-idna.hash b/package/erlang-idna/erlang-idna.hash
new file mode 100644
index 0000000000..8750eee9f5
--- /dev/null
+++ b/package/erlang-idna/erlang-idna.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 d57e20ee88018ff0431e0275e91ada5915782870c9981fc798bcd05589031d6f erlang-idna-6.0.0.tar.gz
diff --git a/package/erlang-idna/erlang-idna.mk b/package/erlang-idna/erlang-idna.mk
new file mode 100644
index 0000000000..6fe83fa2ed
--- /dev/null
+++ b/package/erlang-idna/erlang-idna.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# erlang-idna
+#
+################################################################################
+
+ERLANG_IDNA_VERSION = 6.0.0
+ERLANG_IDNA_SITE = $(call github,benoitc,erlang-idna,$(ERLANG_IDNA_VERSION))
+ERLANG_IDNA_LICENSE = MIT
+ERLANG_IDNA_LICENSE_FILES = LICENSE
+ERLANG_IDNA_DEPENDENCIES = erlang
+
+$(eval $(rebar-package))
-- 
2.20.1
