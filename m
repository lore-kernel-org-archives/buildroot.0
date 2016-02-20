From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 19:21:24 +0100
Subject: [Buildroot] [git commit] erlang-p1-yaml: bump to version 1.0.0
Message-ID: <20160302202755.1F3C380203@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ab8937ba5d449be46af3b6e0041364e1968a9a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
[Thomas: add dependency on erlang-p1-utils, as noticed by Romain
Naour.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang-p1-yaml/Config.in         | 1 +
 package/erlang-p1-yaml/erlang-p1-yaml.mk | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-yaml/Config.in b/package/erlang-p1-yaml/Config.in
index 25c9b02..2ab78d1 100644
--- a/package/erlang-p1-yaml/Config.in
+++ b/package/erlang-p1-yaml/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_ERLANG_P1_YAML
 	bool "erlang-p1-yaml"
+	select BR2_PACKAGE_ERLANG_P1_UTILS
 	select BR2_PACKAGE_LIBYAML
 	help
 	  Erlang wrapper for libyaml C library
diff --git a/package/erlang-p1-yaml/erlang-p1-yaml.mk b/package/erlang-p1-yaml/erlang-p1-yaml.mk
index 6f7c977..22fcda4 100644
--- a/package/erlang-p1-yaml/erlang-p1-yaml.mk
+++ b/package/erlang-p1-yaml/erlang-p1-yaml.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-ERLANG_P1_YAML_VERSION = e1f081e
+ERLANG_P1_YAML_VERSION = 1.0.0
 ERLANG_P1_YAML_SITE = $(call github,processone,p1_yaml,$(ERLANG_P1_YAML_VERSION))
 ERLANG_P1_YAML_LICENSE = Apache-2.0
 ERLANG_P1_YAML_LICENSE_FILES = COPYING
-ERLANG_P1_YAML_DEPENDENCIES = libyaml
+ERLANG_P1_YAML_DEPENDENCIES = libyaml erlang-p1-utils
 
 $(eval $(rebar-package))
