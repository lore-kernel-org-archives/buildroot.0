From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon,  6 Jan 2020 17:11:10 +0100
Subject: [Buildroot] [PATCH 17/22] erlang-p1-mqtree: New package
In-Reply-To: <20200106161115.16524-1-johan.oudinet@gmail.com>
References: <20200106161115.16524-1-johan.oudinet@gmail.com>
Message-ID: <20200106161115.16524-18-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/Config.in                              |  1 +
 package/erlang-p1-mqtree/Config.in             |  7 +++++++
 package/erlang-p1-mqtree/erlang-p1-mqtree.hash |  2 ++
 package/erlang-p1-mqtree/erlang-p1-mqtree.mk   | 13 +++++++++++++
 4 files changed, 23 insertions(+)
 create mode 100644 package/erlang-p1-mqtree/Config.in
 create mode 100644 package/erlang-p1-mqtree/erlang-p1-mqtree.hash
 create mode 100644 package/erlang-p1-mqtree/erlang-p1-mqtree.mk

diff --git a/package/Config.in b/package/Config.in
index 15e9348502..760e3fd4f0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -585,6 +585,7 @@ menu "Erlang libraries/modules"
 	source "package/erlang-lager/Config.in"
 	source "package/erlang-p1-cache-tab/Config.in"
 	source "package/erlang-p1-iconv/Config.in"
+	source "package/erlang-p1-mqtree/Config.in"
 	source "package/erlang-p1-oauth2/Config.in"
 	source "package/erlang-p1-sip/Config.in"
 	source "package/erlang-p1-stringprep/Config.in"
diff --git a/package/erlang-p1-mqtree/Config.in b/package/erlang-p1-mqtree/Config.in
new file mode 100644
index 0000000000..4e2d58c256
--- /dev/null
+++ b/package/erlang-p1-mqtree/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_ERLANG_P1_MQTREE
+	bool "erlang-p1-mqtree"
+	select BR2_PACKAGE_ERLANG_P1_UTILS
+	help
+	  Index tree for MQTT topic filters.
+
+	  https://github.com/processone/mqtree
diff --git a/package/erlang-p1-mqtree/erlang-p1-mqtree.hash b/package/erlang-p1-mqtree/erlang-p1-mqtree.hash
new file mode 100644
index 0000000000..6e1d5c7809
--- /dev/null
+++ b/package/erlang-p1-mqtree/erlang-p1-mqtree.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 034d564e92ca8e9d66668548ea510d2cf9fdbad40609622a87374aa907110884 erlang-p1-mqtree-1.0.5.tar.gz
diff --git a/package/erlang-p1-mqtree/erlang-p1-mqtree.mk b/package/erlang-p1-mqtree/erlang-p1-mqtree.mk
new file mode 100644
index 0000000000..2154e742ed
--- /dev/null
+++ b/package/erlang-p1-mqtree/erlang-p1-mqtree.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# erlang-p1-mqtree
+#
+################################################################################
+
+ERLANG_P1_MQTREE_VERSION = 1.0.5
+ERLANG_P1_MQTREE_SITE = $(call github,processone,mqtree,$(ERLANG_P1_MQTREE_VERSION))
+ERLANG_P1_MQTREE_LICENSE = Apache-2.0
+ERLANG_P1_MQTREE_LICENSE_FILES = LICENSE
+ERLANG_P1_MQTREE_DEPENDENCIES = erlang erlang-p1-utils
+
+$(eval $(rebar-package))
-- 
2.20.1
