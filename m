From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Thu, 26 Nov 2020 18:42:53 +0100
Subject: [Buildroot] [PATCH 10/18] package/erlang-p1-acme: bump version to
 1.0.9
In-Reply-To: <20201126174301.411219-1-johan.oudinet@gmail.com>
References: <20201126174301.411219-1-johan.oudinet@gmail.com>
Message-ID: <20201126174301.411219-10-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The rebar.config.script file adds a dependency to base64url package. Since we remove
all rebar dependencies, add a patch to remove such dependency. Otherwise rebar would
try to download it during the build.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 ...ipt-remove-extra-dependency-to-base6.patch | 26 +++++++++++++++++++
 package/erlang-p1-acme/erlang-p1-acme.hash    |  4 +--
 package/erlang-p1-acme/erlang-p1-acme.mk      |  2 +-
 3 files changed, 29 insertions(+), 3 deletions(-)
 create mode 100644 package/erlang-p1-acme/0001-rebar.config.script-remove-extra-dependency-to-base6.patch

diff --git a/package/erlang-p1-acme/0001-rebar.config.script-remove-extra-dependency-to-base6.patch b/package/erlang-p1-acme/0001-rebar.config.script-remove-extra-dependency-to-base6.patch
new file mode 100644
index 0000000000..a27730e23c
--- /dev/null
+++ b/package/erlang-p1-acme/0001-rebar.config.script-remove-extra-dependency-to-base6.patch
@@ -0,0 +1,26 @@
+From a2422fdf4097d1f5f8c8f88bbe08b9a0f3c35fe6 Mon Sep 17 00:00:00 2001
+From: Johan Oudinet <johan.oudinet@gmail.com>
+Date: Wed, 25 Nov 2020 22:38:22 +0100
+Subject: [PATCH] rebar.config.script: remove extra dependency to base64url
+
+Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
+---
+ rebar.config.script | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/rebar.config.script b/rebar.config.script
+index a63895e..41b2970 100644
+--- a/rebar.config.script
++++ b/rebar.config.script
+@@ -62,7 +62,7 @@ Cfg2 = case IsRebar3 of
+                [{plugin_dir, filename:join([filename:dirname(SCRIPT),"plugins"])},
+                 {plugins, [override_deps_versions]}] ++
+                 ModCfg(CONFIG, [deps], fun(V) ->
+-                   V ++ [{base64url, ".*", {git, "git://github.com/dvv/base64url.git", {tag, "v1.0"}}}]
++                   V
+                 end, [])
+        end,
+ 
+-- 
+2.29.2
+
diff --git a/package/erlang-p1-acme/erlang-p1-acme.hash b/package/erlang-p1-acme/erlang-p1-acme.hash
index 036cb923bd..af13e88b1a 100644
--- a/package/erlang-p1-acme/erlang-p1-acme.hash
+++ b/package/erlang-p1-acme/erlang-p1-acme.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 556a9628c323a5a83116ed78599c891f74447b0bac237c095e776c7009089656 erlang-p1-acme-1.0.1.tar.gz
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 LICENSE.txt
+sha256  e17ba49f45b72200470bc2f176b315bec1028d07a4817859052f98c0a7259632  erlang-p1-acme-1.0.9.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-p1-acme/erlang-p1-acme.mk b/package/erlang-p1-acme/erlang-p1-acme.mk
index ae77d4a580..21c155e206 100644
--- a/package/erlang-p1-acme/erlang-p1-acme.mk
+++ b/package/erlang-p1-acme/erlang-p1-acme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_ACME_VERSION = 1.0.1
+ERLANG_P1_ACME_VERSION = 1.0.9
 ERLANG_P1_ACME_SITE = $(call github,processone,p1_acme,$(ERLANG_P1_ACME_VERSION))
 ERLANG_P1_ACME_LICENSE = Apache-2.0
 ERLANG_P1_ACME_LICENSE_FILES = LICENSE.txt
-- 
2.25.1
