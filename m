From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue, 16 Jan 2018 15:06:47 +0100
Subject: [Buildroot] [PATCH 12/14] erlang-p1-sip: Bump to version 1.0.17
In-Reply-To: <20180116140649.7381-1-johan.oudinet@gmail.com>
References: <20180116140649.7381-1-johan.oudinet@gmail.com>
Message-ID: <20180116140649.7381-13-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adapt the patch that removes rebar dependencies to version changes.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 .../0002-remove-dependencies-from-rebar-config.patch           | 10 +++++-----
 package/erlang-p1-sip/erlang-p1-sip.hash                       |  2 +-
 package/erlang-p1-sip/erlang-p1-sip.mk                         |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/erlang-p1-sip/0002-remove-dependencies-from-rebar-config.patch b/package/erlang-p1-sip/0002-remove-dependencies-from-rebar-config.patch
index 5fe86d900f..da86076988 100644
--- a/package/erlang-p1-sip/0002-remove-dependencies-from-rebar-config.patch
+++ b/package/erlang-p1-sip/0002-remove-dependencies-from-rebar-config.patch
@@ -4,16 +4,16 @@ by rebar at build time.
 Signed-off-by: Christophe Romain <cromain@process-one.net>
 
 diff --git a/rebar.config b/rebar.config
-index fbc69a1..6250420 100644
+index ed93134..5b32788 100644
 --- a/rebar.config
 +++ b/rebar.config
-@@ -29,10 +29,6 @@
+@@ -31,10 +31,6 @@
 
  {port_specs, [{"priv/lib/esip_drv.so", ["c_src/esip_codec.c"]}]}.
 
--{deps, [{stun, ".*", {git, "https://github.com/processone/stun", {tag, "1.0.10"}}},
--	{fast_tls, ".*", {git, "https://github.com/processone/fast_tls", {tag, "1.0.11"}}},
--	{p1_utils, ".*", {git, "https://github.com/processone/p1_utils", {tag, "1.0.7"}}}]}.
+-{deps, [{stun, ".*", {git, "https://github.com/processone/stun", {tag, "1.0.16"}}},
+-	{fast_tls, ".*", {git, "https://github.com/processone/fast_tls", {tag, "1.0.17"}}},
+-	{p1_utils, ".*", {git, "https://github.com/processone/p1_utils", {tag, "1.0.10"}}}]}.
 -
  {clean_files, ["c_src/esip_codec.gcda", "c_src/esip_codec.gcno"]}.
 
diff --git a/package/erlang-p1-sip/erlang-p1-sip.hash b/package/erlang-p1-sip/erlang-p1-sip.hash
index 2ea7bc8ec4..4d41b9884c 100644
--- a/package/erlang-p1-sip/erlang-p1-sip.hash
+++ b/package/erlang-p1-sip/erlang-p1-sip.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 2c6ed00220ead631a4755000ad9f118d79c8c4d41aa7c98bd27365a8345f9a5d erlang-p1-sip-1.0.11.tar.gz
+sha256 6ac36594921561d0d5502bb824b7408223a3f53560a9d2fa4b0f685c0441baf0 erlang-p1-sip-1.0.17.tar.gz
diff --git a/package/erlang-p1-sip/erlang-p1-sip.mk b/package/erlang-p1-sip/erlang-p1-sip.mk
index 0f4b33e2d1..a9f572df2d 100644
--- a/package/erlang-p1-sip/erlang-p1-sip.mk
+++ b/package/erlang-p1-sip/erlang-p1-sip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_SIP_VERSION = 1.0.11
+ERLANG_P1_SIP_VERSION = 1.0.17
 ERLANG_P1_SIP_SITE = $(call github,processone,esip,$(ERLANG_P1_SIP_VERSION))
 ERLANG_P1_SIP_LICENSE = Apache-2.0
 ERLANG_P1_SIP_LICENSE_FILES = LICENSE.txt
-- 
2.14.1
