From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Jan 2018 22:32:56 +0100
Subject: [Buildroot] [git commit] erlang-p1-yaml: Bump to version 1.0.12
Message-ID: <20180117213347.7C96983F1D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9764e28af06684d65c365d86a0291b3d5e39321a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adapt the patch that removes rebar dependencies to version changes.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../erlang-p1-yaml/0001-remove-dependencies-from-rebar-config.patch   | 4 ++--
 package/erlang-p1-yaml/erlang-p1-yaml.hash                            | 2 +-
 package/erlang-p1-yaml/erlang-p1-yaml.mk                              | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/erlang-p1-yaml/0001-remove-dependencies-from-rebar-config.patch b/package/erlang-p1-yaml/0001-remove-dependencies-from-rebar-config.patch
index facfc2c..4dfdb92 100644
--- a/package/erlang-p1-yaml/0001-remove-dependencies-from-rebar-config.patch
+++ b/package/erlang-p1-yaml/0001-remove-dependencies-from-rebar-config.patch
@@ -4,14 +4,14 @@ by rebar at build time.
 Signed-off-by: Christophe Romain <cromain@process-one.net>
 
 diff --git a/rebar.config b/rebar.config
-index 68ffdeb..651a829 100644
+index e09d08d..651a829 100644
 --- a/rebar.config
 +++ b/rebar.config
 @@ -24,8 +24,6 @@
  {port_env, [{"CFLAGS", "$CFLAGS"}, {"LDFLAGS", "$LDFLAGS -lyaml"}]}.
  {port_specs, [{"priv/lib/fast_yaml.so", ["c_src/fast_yaml.c"]}]}.
 
--{deps, [{p1_utils, ".*", {git, "git://github.com/processone/p1_utils", {tag, "1.0.7"}}}]}.
+-{deps, [{p1_utils, ".*", {git, "git://github.com/processone/p1_utils", {tag, "1.0.10"}}}]}.
 -
  {clean_files, ["c_src/fast_yaml.gcda", "c_src/fast_yaml.gcno"]}.
 
diff --git a/package/erlang-p1-yaml/erlang-p1-yaml.hash b/package/erlang-p1-yaml/erlang-p1-yaml.hash
index 5b8956d..24282e6 100644
--- a/package/erlang-p1-yaml/erlang-p1-yaml.hash
+++ b/package/erlang-p1-yaml/erlang-p1-yaml.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 bf225023168873affd2c67a2ce5c6c81c3db0c7df4f0caa113f23770c7b04e05 erlang-p1-yaml-1.0.9.tar.gz
+sha256 5a6499a47cdd1f753a527cb8b79074312354063535adc0ca0fd7f72c2a015e3a erlang-p1-yaml-1.0.12.tar.gz
diff --git a/package/erlang-p1-yaml/erlang-p1-yaml.mk b/package/erlang-p1-yaml/erlang-p1-yaml.mk
index d8865e0..de138a9 100644
--- a/package/erlang-p1-yaml/erlang-p1-yaml.mk
+++ b/package/erlang-p1-yaml/erlang-p1-yaml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_YAML_VERSION = 1.0.9
+ERLANG_P1_YAML_VERSION = 1.0.12
 ERLANG_P1_YAML_SITE = $(call github,processone,fast_yaml,$(ERLANG_P1_YAML_VERSION))
 ERLANG_P1_YAML_LICENSE = Apache-2.0
 ERLANG_P1_YAML_LICENSE_FILES = LICENSE.txt
