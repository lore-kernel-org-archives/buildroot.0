From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon,  6 Jan 2020 17:11:12 +0100
Subject: [Buildroot] [PATCH 19/22] erlang-p1-yconf: New package
In-Reply-To: <20200106161115.16524-1-johan.oudinet@gmail.com>
References: <20200106161115.16524-1-johan.oudinet@gmail.com>
Message-ID: <20200106161115.16524-20-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/Config.in                            |  1 +
 package/erlang-p1-yconf/Config.in            |  5 +++++
 package/erlang-p1-yconf/erlang-p1-yconf.hash |  2 ++
 package/erlang-p1-yconf/erlang-p1-yconf.mk   | 13 +++++++++++++
 4 files changed, 21 insertions(+)
 create mode 100644 package/erlang-p1-yconf/Config.in
 create mode 100644 package/erlang-p1-yconf/erlang-p1-yconf.hash
 create mode 100644 package/erlang-p1-yconf/erlang-p1-yconf.mk

diff --git a/package/Config.in b/package/Config.in
index 853961ee87..7914571ffb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -596,6 +596,7 @@ menu "Erlang libraries/modules"
 	source "package/erlang-p1-xml/Config.in"
 	source "package/erlang-p1-xmpp/Config.in"
 	source "package/erlang-p1-yaml/Config.in"
+	source "package/erlang-p1-yconf/Config.in"
 	source "package/erlang-p1-zlib/Config.in"
 endmenu
 endif
diff --git a/package/erlang-p1-yconf/Config.in b/package/erlang-p1-yconf/Config.in
new file mode 100644
index 0000000000..3777ebbe14
--- /dev/null
+++ b/package/erlang-p1-yconf/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_ERLANG_P1_YCONF
+	bool "erlang-p1-yconf"
+	select BR2_PACKAGE_ERLANG_P1_YAML
+	help
+	  YAML configuration processor.
diff --git a/package/erlang-p1-yconf/erlang-p1-yconf.hash b/package/erlang-p1-yconf/erlang-p1-yconf.hash
new file mode 100644
index 0000000000..4aca2f5ad3
--- /dev/null
+++ b/package/erlang-p1-yconf/erlang-p1-yconf.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 94724bde03c976cdf51d0d43eece73c70381ef60a9dd7e49292d194c0beaeb53 erlang-p1-yconf-1.0.1.tar.gz
diff --git a/package/erlang-p1-yconf/erlang-p1-yconf.mk b/package/erlang-p1-yconf/erlang-p1-yconf.mk
new file mode 100644
index 0000000000..bd6fb8ba64
--- /dev/null
+++ b/package/erlang-p1-yconf/erlang-p1-yconf.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# erlang-p1-yconf
+#
+################################################################################
+
+ERLANG_P1_YCONF_VERSION = 1.0.1
+ERLANG_P1_YCONF_SITE = $(call github,processone,yconf,$(ERLANG_P1_YCONF_VERSION))
+ERLANG_P1_YCONF_LICENSE = Apache-2.0
+ERLANG_P1_YCONF_LICENSE_FILES = LICENSE
+ERLANG_P1_YCONF_DEPENDENCIES = erlang erlang-p1-yaml
+
+$(eval $(rebar-package))
-- 
2.20.1
