From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon, 12 Jan 2015 10:32:11 +0100
Subject: [Buildroot] [PATCH v6 07/16] erlang-p1-yaml: new package.
In-Reply-To: <1421055140-5092-1-git-send-email-johan.oudinet@gmail.com>
References: <1421055140-5092-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <1421055140-5092-8-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/Config.in                        |  1 +
 package/erlang-p1-yaml/Config.in         |  7 +++++++
 package/erlang-p1-yaml/erlang-p1-yaml.mk | 13 +++++++++++++
 3 files changed, 21 insertions(+)
 create mode 100644 package/erlang-p1-yaml/Config.in
 create mode 100644 package/erlang-p1-yaml/erlang-p1-yaml.mk

diff --git a/package/Config.in b/package/Config.in
index 883c3ac..6dca5f7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -402,6 +402,7 @@ if BR2_PACKAGE_ERLANG
 menu "Erlang libraries/modules"
 	source "package/erlang-goldrush/Config.in"
 	source "package/erlang-lager/Config.in"
+	source "package/erlang-p1-yaml/Config.in"
 	source "package/erlang-p1-zlib/Config.in"
 endmenu
 endif
diff --git a/package/erlang-p1-yaml/Config.in b/package/erlang-p1-yaml/Config.in
new file mode 100644
index 0000000..25c9b02
--- /dev/null
+++ b/package/erlang-p1-yaml/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_ERLANG_P1_YAML
+	bool "erlang-p1-yaml"
+	select BR2_PACKAGE_LIBYAML
+	help
+	  Erlang wrapper for libyaml C library
+
+	  https://github.com/processone/p1_yaml
diff --git a/package/erlang-p1-yaml/erlang-p1-yaml.mk b/package/erlang-p1-yaml/erlang-p1-yaml.mk
new file mode 100644
index 0000000..346e398
--- /dev/null
+++ b/package/erlang-p1-yaml/erlang-p1-yaml.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# erlang-p1-yaml
+#
+################################################################################
+
+ERLANG_P1_YAML_VERSION = 236b943
+ERLANG_P1_YAML_SITE = $(call github,processone,p1_yaml,$(ERLANG_P1_YAML_VERSION))
+ERLANG_P1_YAML_LICENSE = Apache-2.0
+ERLANG_P1_YAML_LICENSE_FILES = COPYING
+ERLANG_P1_YAML_DEPENDENCIES = libyaml
+
+$(eval $(rebar-package))
-- 
2.1.0
