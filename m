From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Jan 2020 21:24:44 +0100
Subject: [Buildroot] [git commit] package/erlang-p1-mqtree: new package
Message-ID: <20200106201550.9A06C8EE4B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e7f86fa9a0484658d4c71c88ab5db095b331e77f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/erlang-p1-mqtree/Config.in             |  7 +++++++
 package/erlang-p1-mqtree/erlang-p1-mqtree.hash |  3 +++
 package/erlang-p1-mqtree/erlang-p1-mqtree.mk   | 13 +++++++++++++
 5 files changed, 25 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 606ee1a87c..d7d4b30815 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1264,6 +1264,7 @@ F:	package/erlang-jose/
 F:	package/erlang-lager/
 F:	package/erlang-p1-cache-tab/
 F:	package/erlang-p1-iconv/
+F:	package/erlang-p1-mqtree/
 F:	package/erlang-p1-oauth2/
 F:	package/erlang-p1-sip/
 F:	package/erlang-p1-stringprep/
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
index 0000000000..43e98d0699
--- /dev/null
+++ b/package/erlang-p1-mqtree/erlang-p1-mqtree.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 034d564e92ca8e9d66668548ea510d2cf9fdbad40609622a87374aa907110884 erlang-p1-mqtree-1.0.5.tar.gz
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 LICENSE
diff --git a/package/erlang-p1-mqtree/erlang-p1-mqtree.mk b/package/erlang-p1-mqtree/erlang-p1-mqtree.mk
new file mode 100644
index 0000000000..bd5f28237c
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
+ERLANG_P1_MQTREE_DEPENDENCIES = erlang-p1-utils
+
+$(eval $(rebar-package))
