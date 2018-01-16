From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue, 16 Jan 2018 15:06:46 +0100
Subject: [Buildroot] [PATCH 11/14] erlang-p1-stun: Bump to version 1.0.16
In-Reply-To: <20180116140649.7381-1-johan.oudinet@gmail.com>
References: <20180116140649.7381-1-johan.oudinet@gmail.com>
Message-ID: <20180116140649.7381-12-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adapt the patch that removes rebar dependencies to version changes.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 .../erlang-p1-stun/0001-remove-dependencies-from-rebar-config.patch | 6 +++---
 package/erlang-p1-stun/erlang-p1-stun.hash                          | 2 +-
 package/erlang-p1-stun/erlang-p1-stun.mk                            | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/erlang-p1-stun/0001-remove-dependencies-from-rebar-config.patch b/package/erlang-p1-stun/0001-remove-dependencies-from-rebar-config.patch
index 30101359f4..7e6b4b5345 100644
--- a/package/erlang-p1-stun/0001-remove-dependencies-from-rebar-config.patch
+++ b/package/erlang-p1-stun/0001-remove-dependencies-from-rebar-config.patch
@@ -2,15 +2,15 @@ Without this patch, dependencies would be downloaded and compiled
 by rebar at build time.
 
 diff --git a/rebar.config b/rebar.config
-index 94ee830..d0af863 100644
+index f02ea40..d0af863 100644
 --- a/rebar.config
 +++ b/rebar.config
 @@ -22,9 +22,6 @@
 
  {erl_opts, [debug_info, {i, "include"}]}.
 
--{deps, [{fast_tls, ".*", {git, "https://github.com/processone/fast_tls", {tag, "1.0.11"}}},
--	{p1_utils, ".*", {git, "https://github.com/processone/p1_utils", {tag, "1.0.7"}}}]}.
+-{deps, [{fast_tls, ".*", {git, "https://github.com/processone/fast_tls", {tag, "1.0.17"}}},
+-	{p1_utils, ".*", {git, "https://github.com/processone/p1_utils", {tag, "1.0.10"}}}]}.
 -
  {cover_enabled, true}.
  {cover_export_enabled, true}.
diff --git a/package/erlang-p1-stun/erlang-p1-stun.hash b/package/erlang-p1-stun/erlang-p1-stun.hash
index 893bc30e0b..ee32834e34 100644
--- a/package/erlang-p1-stun/erlang-p1-stun.hash
+++ b/package/erlang-p1-stun/erlang-p1-stun.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 75aac56fa770b3b4ea2d32e63706d2b8d56f8e0db54243acffa7448f4256864e erlang-p1-stun-1.0.10.tar.gz
+sha256 8efe2f47c2460b1e0d68a680dcfcd938a2bc98c85abb5b100c15246fe6a25506 erlang-p1-stun-1.0.16.tar.gz
diff --git a/package/erlang-p1-stun/erlang-p1-stun.mk b/package/erlang-p1-stun/erlang-p1-stun.mk
index 5116c15284..42bbc758e5 100644
--- a/package/erlang-p1-stun/erlang-p1-stun.mk
+++ b/package/erlang-p1-stun/erlang-p1-stun.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_STUN_VERSION = 1.0.10
+ERLANG_P1_STUN_VERSION = 1.0.16
 ERLANG_P1_STUN_SITE = $(call github,processone,stun,$(ERLANG_P1_STUN_VERSION))
 ERLANG_P1_STUN_LICENSE = Apache-2.0
 ERLANG_P1_STUN_LICENSE_FILES = LICENSE.txt
-- 
2.14.1
