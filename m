From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue, 30 May 2017 16:52:05 +0200
Subject: [Buildroot] [PATCH 10/16] erlang-p1-sip: bump to version 1.0.11
In-Reply-To: <20170530145211.15320-1-johan.oudinet@gmail.com>
References: <20170530145211.15320-1-johan.oudinet@gmail.com>
Message-ID: <20170530145211.15320-11-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

License changed to Apache-2.0.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 .../0002-remove-dependencies-from-rebar-config.patch | 20 ++++++++++++++++++++
 package/erlang-p1-sip/erlang-p1-sip.hash             |  2 +-
 package/erlang-p1-sip/erlang-p1-sip.mk               |  8 ++++----
 3 files changed, 25 insertions(+), 5 deletions(-)
 create mode 100644 package/erlang-p1-sip/0002-remove-dependencies-from-rebar-config.patch

diff --git a/package/erlang-p1-sip/0002-remove-dependencies-from-rebar-config.patch b/package/erlang-p1-sip/0002-remove-dependencies-from-rebar-config.patch
new file mode 100644
index 0000000000..5fe86d900f
--- /dev/null
+++ b/package/erlang-p1-sip/0002-remove-dependencies-from-rebar-config.patch
@@ -0,0 +1,20 @@
+Without this patch, dependencies would be downloaded and compiled
+by rebar at build time.
+
+Signed-off-by: Christophe Romain <cromain@process-one.net>
+
+diff --git a/rebar.config b/rebar.config
+index fbc69a1..6250420 100644
+--- a/rebar.config
++++ b/rebar.config
+@@ -29,10 +29,6 @@
+
+ {port_specs, [{"priv/lib/esip_drv.so", ["c_src/esip_codec.c"]}]}.
+
+-{deps, [{stun, ".*", {git, "https://github.com/processone/stun", {tag, "1.0.10"}}},
+-	{fast_tls, ".*", {git, "https://github.com/processone/fast_tls", {tag, "1.0.11"}}},
+-	{p1_utils, ".*", {git, "https://github.com/processone/p1_utils", {tag, "1.0.7"}}}]}.
+-
+ {clean_files, ["c_src/esip_codec.gcda", "c_src/esip_codec.gcno"]}.
+
+ {cover_enabled, true}.
diff --git a/package/erlang-p1-sip/erlang-p1-sip.hash b/package/erlang-p1-sip/erlang-p1-sip.hash
index 74382cca9a..2ea7bc8ec4 100644
--- a/package/erlang-p1-sip/erlang-p1-sip.hash
+++ b/package/erlang-p1-sip/erlang-p1-sip.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 2d6dfad997931668eb83a0cb127ccca8c51f8a383d76f9dea393c0b3a4eabae7 erlang-p1-sip-1.0.0.tar.gz
+sha256 2c6ed00220ead631a4755000ad9f118d79c8c4d41aa7c98bd27365a8345f9a5d erlang-p1-sip-1.0.11.tar.gz
diff --git a/package/erlang-p1-sip/erlang-p1-sip.mk b/package/erlang-p1-sip/erlang-p1-sip.mk
index b589721eb9..0f4b33e2d1 100644
--- a/package/erlang-p1-sip/erlang-p1-sip.mk
+++ b/package/erlang-p1-sip/erlang-p1-sip.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-ERLANG_P1_SIP_VERSION = 1.0.0
-ERLANG_P1_SIP_SITE = $(call github,processone,p1_sip,$(ERLANG_P1_SIP_VERSION))
-ERLANG_P1_SIP_LICENSE = GPL-2.0 with OpenSSL exception
-ERLANG_P1_SIP_LICENSE_FILES = COPYING
+ERLANG_P1_SIP_VERSION = 1.0.11
+ERLANG_P1_SIP_SITE = $(call github,processone,esip,$(ERLANG_P1_SIP_VERSION))
+ERLANG_P1_SIP_LICENSE = Apache-2.0
+ERLANG_P1_SIP_LICENSE_FILES = LICENSE.txt
 ERLANG_P1_SIP_DEPENDENCIES = erlang-p1-stun erlang-p1-tls erlang-p1-utils
 ERLANG_P1_SIP_INSTALL_STAGING = YES
 
-- 
2.11.0
