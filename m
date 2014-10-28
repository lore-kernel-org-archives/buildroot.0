From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue, 28 Oct 2014 14:33:43 +0100
Subject: [Buildroot] [PATCH 06/15] erlang-p1-yaml: new package.
In-Reply-To: <1414503232-28314-1-git-send-email-johan.oudinet@gmail.com>
References: <1414503232-28314-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <1414503232-28314-7-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/Config.in                        |  1 +
 package/erlang-p1-yaml/Config.in         |  6 ++++++
 package/erlang-p1-yaml/erlang-p1-yaml.mk | 13 +++++++++++++
 3 files changed, 20 insertions(+)
 create mode 100644 package/erlang-p1-yaml/Config.in
 create mode 100644 package/erlang-p1-yaml/erlang-p1-yaml.mk

diff --git a/package/Config.in b/package/Config.in
index 3e25766..6035713 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -396,6 +396,7 @@ if BR2_PACKAGE_ERLANG
 menu "Erlang libraries/modules"
 	source "package/erlang-goldrush/Config.in"
 	source "package/erlang-lager/Config.in"
+	source "package/erlang-p1-yaml/Config.in"
 	source "package/erlang-p1-zlib/Config.in"
 endmenu
 endif
diff --git a/package/erlang-p1-yaml/Config.in b/package/erlang-p1-yaml/Config.in
new file mode 100644
index 0000000..423ef3f
--- /dev/null
+++ b/package/erlang-p1-yaml/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_ERLANG_P1_YAML
+	bool "erlang-p1-yaml"
+	depends on BR2_PACKAGE_ERLANG
+	select BR2_PACKAGE_LIBYAML
+	help
+	  Erlang wrapper for libyaml C library
diff --git a/package/erlang-p1-yaml/erlang-p1-yaml.mk b/package/erlang-p1-yaml/erlang-p1-yaml.mk
new file mode 100644
index 0000000..990c3a7
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
+ERLANG_P1_YAML_DEPENDENCIES = erlang libyaml
+
+$(eval $(rebar-package))
-- 
2.1.0
