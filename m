From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed, 25 Sep 2013 21:09:55 -0400
Subject: [Buildroot] [PATCH v2] jq: new package
Message-ID: <1380157795-1854-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

jq is like sed for JSON data - you can use it to slice and filter
and map and transform structured data with the same ease that sed,
awk, grep and friends let you play with text.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

---

The package description is as per the author - not my words.

v1 -> v2: changed SITE to be more like the github example in the buildroot user manual.
---
 package/Config.in    |    1 +
 package/jq/Config.in |    8 ++++++++
 package/jq/jq.mk     |   13 +++++++++++++
 3 files changed, 22 insertions(+)
 create mode 100644 package/jq/Config.in
 create mode 100644 package/jq/jq.mk

diff --git a/package/Config.in b/package/Config.in
index 1dd60d1..ce18ec7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -108,6 +108,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/grep/Config.in"
 endif
 source "package/intltool/Config.in"
+source "package/jq/Config.in"
 source "package/make/Config.in"
 source "package/libtool/Config.in"
 source "package/m4/Config.in"
diff --git a/package/jq/Config.in b/package/jq/Config.in
new file mode 100644
index 0000000..9329b2f
--- /dev/null
+++ b/package/jq/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_JQ
+	bool "jq"
+	help
+	  jq is like sed for JSON data - you can use it to slice and filter
+	  and map and transform structured data with the same ease that sed,
+	  awk, grep and friends let you play with text.
+
+	  http://stedolan.github.io/jq/
diff --git a/package/jq/jq.mk b/package/jq/jq.mk
new file mode 100644
index 0000000..59cea9c
--- /dev/null
+++ b/package/jq/jq.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# jq
+#
+################################################################################
+
+JQ_VERSION = 1.3
+JQ_SITE = http://github.com/stedolan/jq/tarball/jq-$(JQ_VERSION)
+JQ_AUTORECONF = YES
+JQ_LICENSE = jq license
+JQ_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
1.7.9.5
