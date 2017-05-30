From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue, 30 May 2017 16:52:07 +0200
Subject: [Buildroot] [PATCH 12/16] erlang-p1-yaml: bump to version 1.0.9
In-Reply-To: <20170530145211.15320-1-johan.oudinet@gmail.com>
References: <20170530145211.15320-1-johan.oudinet@gmail.com>
Message-ID: <20170530145211.15320-13-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 .../0001-remove-dependencies-from-rebar-config.patch   | 18 ++++++++++++++++++
 package/erlang-p1-yaml/erlang-p1-yaml.hash             |  2 +-
 package/erlang-p1-yaml/erlang-p1-yaml.mk               |  6 +++---
 3 files changed, 22 insertions(+), 4 deletions(-)
 create mode 100644 package/erlang-p1-yaml/0001-remove-dependencies-from-rebar-config.patch

diff --git a/package/erlang-p1-yaml/0001-remove-dependencies-from-rebar-config.patch b/package/erlang-p1-yaml/0001-remove-dependencies-from-rebar-config.patch
new file mode 100644
index 0000000000..facfc2c200
--- /dev/null
+++ b/package/erlang-p1-yaml/0001-remove-dependencies-from-rebar-config.patch
@@ -0,0 +1,18 @@
+Without this patch, dependencies would be downloaded and compiled
+by rebar at build time.
+
+Signed-off-by: Christophe Romain <cromain@process-one.net>
+
+diff --git a/rebar.config b/rebar.config
+index 68ffdeb..651a829 100644
+--- a/rebar.config
++++ b/rebar.config
+@@ -24,8 +24,6 @@
+ {port_env, [{"CFLAGS", "$CFLAGS"}, {"LDFLAGS", "$LDFLAGS -lyaml"}]}.
+ {port_specs, [{"priv/lib/fast_yaml.so", ["c_src/fast_yaml.c"]}]}.
+
+-{deps, [{p1_utils, ".*", {git, "git://github.com/processone/p1_utils", {tag, "1.0.7"}}}]}.
+-
+ {clean_files, ["c_src/fast_yaml.gcda", "c_src/fast_yaml.gcno"]}.
+
+ {cover_enabled, true}.
diff --git a/package/erlang-p1-yaml/erlang-p1-yaml.hash b/package/erlang-p1-yaml/erlang-p1-yaml.hash
index 0e11e45003..5b8956d7b5 100644
--- a/package/erlang-p1-yaml/erlang-p1-yaml.hash
+++ b/package/erlang-p1-yaml/erlang-p1-yaml.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 8eaaddda056f1ebb515a5456ba2be855e5b71b9b6eb35788527f39c6600ac6b4 erlang-p1-yaml-1.0.0.tar.gz
+sha256 bf225023168873affd2c67a2ce5c6c81c3db0c7df4f0caa113f23770c7b04e05 erlang-p1-yaml-1.0.9.tar.gz
diff --git a/package/erlang-p1-yaml/erlang-p1-yaml.mk b/package/erlang-p1-yaml/erlang-p1-yaml.mk
index 22fcda43f8..d8865e0d42 100644
--- a/package/erlang-p1-yaml/erlang-p1-yaml.mk
+++ b/package/erlang-p1-yaml/erlang-p1-yaml.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-ERLANG_P1_YAML_VERSION = 1.0.0
-ERLANG_P1_YAML_SITE = $(call github,processone,p1_yaml,$(ERLANG_P1_YAML_VERSION))
+ERLANG_P1_YAML_VERSION = 1.0.9
+ERLANG_P1_YAML_SITE = $(call github,processone,fast_yaml,$(ERLANG_P1_YAML_VERSION))
 ERLANG_P1_YAML_LICENSE = Apache-2.0
-ERLANG_P1_YAML_LICENSE_FILES = COPYING
+ERLANG_P1_YAML_LICENSE_FILES = LICENSE.txt
 ERLANG_P1_YAML_DEPENDENCIES = libyaml erlang-p1-utils
 
 $(eval $(rebar-package))
-- 
2.11.0
