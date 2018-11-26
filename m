From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon, 26 Nov 2018 12:08:03 +0100
Subject: [Buildroot] [PATCH 11/15] erlang-p1-stun: Bump to version 1.0.25
In-Reply-To: <20181126110807.31431-1-johan.oudinet@gmail.com>
References: <20181126110807.31431-1-johan.oudinet@gmail.com>
Message-ID: <20181126110807.31431-12-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 ...-remove-dependencies-from-rebar-config.patch# | 16 ++++++++++++++++
 package/erlang-p1-stun/erlang-p1-stun.hash       |  2 +-
 package/erlang-p1-stun/erlang-p1-stun.mk         |  2 +-
 3 files changed, 18 insertions(+), 2 deletions(-)
 create mode 100644 package/erlang-p1-stun/#0001-remove-dependencies-from-rebar-config.patch#

diff --git a/package/erlang-p1-stun/#0001-remove-dependencies-from-rebar-config.patch# b/package/erlang-p1-stun/#0001-remove-dependencies-from-rebar-config.patch#
new file mode 100644
index 0000000000..b228edafa7
--- /dev/null
+++ b/package/erlang-p1-stun/#0001-remove-dependencies-from-rebar-config.patch#
@@ -0,0 +1,16 @@
+Without this patch, dependencies would be downloaded and compiled
+by rebar at build time.
+
+diff --git a/rebar.config b/rebar.config
+index f02ea40..d0af863 100644
+--- a/rebar.config
++++ b/rebar.config
+@@ -22,8 +22,5 @@
+
+ {erl_opts, [debug_info, {i, "include"}]}.
+
+-{deps, [{fast_tls, ".*", {git, "https://github.com/processone/fast_tls", {tag, "1.0.17"}}},
+-      {p1_utils, ".*", {git, "https://github.com/processone/p1_utils", {tag, "1.0.10"}}}]}.
+-
+ {cover_enabled, true}.
+ {cover_export_enabled, true}.
diff --git a/package/erlang-p1-stun/erlang-p1-stun.hash b/package/erlang-p1-stun/erlang-p1-stun.hash
index ee32834e34..7400a276a0 100644
--- a/package/erlang-p1-stun/erlang-p1-stun.hash
+++ b/package/erlang-p1-stun/erlang-p1-stun.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 8efe2f47c2460b1e0d68a680dcfcd938a2bc98c85abb5b100c15246fe6a25506 erlang-p1-stun-1.0.16.tar.gz
+sha256 a5a59ae3c75290029aa062ef19ecd52b8377959a8eb7352bd2a62c4ff1dd0613 erlang-p1-stun-1.0.25.tar.gz
diff --git a/package/erlang-p1-stun/erlang-p1-stun.mk b/package/erlang-p1-stun/erlang-p1-stun.mk
index 42bbc758e5..32bdd4f245 100644
--- a/package/erlang-p1-stun/erlang-p1-stun.mk
+++ b/package/erlang-p1-stun/erlang-p1-stun.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_STUN_VERSION = 1.0.16
+ERLANG_P1_STUN_VERSION = 1.0.25
 ERLANG_P1_STUN_SITE = $(call github,processone,stun,$(ERLANG_P1_STUN_VERSION))
 ERLANG_P1_STUN_LICENSE = Apache-2.0
 ERLANG_P1_STUN_LICENSE_FILES = LICENSE.txt
-- 
2.17.1
