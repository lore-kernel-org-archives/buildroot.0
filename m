From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Feb 2015 10:23:13 +0100
Subject: [Buildroot] [git commit] erlang-p1-yaml: new package.
Message-ID: <20150203092417.AA92980E25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a43adff2d333979f53af0385d034d144429071bc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                        |    1 +
 package/erlang-p1-yaml/Config.in         |    7 +++++++
 package/erlang-p1-yaml/erlang-p1-yaml.mk |   13 +++++++++++++
 3 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 2fa3750..4344de8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -401,6 +401,7 @@ if BR2_PACKAGE_ERLANG
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
