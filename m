From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Thu, 26 Nov 2020 18:42:58 +0100
Subject: [Buildroot] [PATCH 15/18] package/erlang-p1-sip: bump version to
 1.0.38
In-Reply-To: <20201126174301.411219-1-johan.oudinet@gmail.com>
References: <20201126174301.411219-1-johan.oudinet@gmail.com>
Message-ID: <20201126174301.411219-15-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

upstream is finally using include_lib to include libraries. Adapt the patch
accordingly.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-sip/0001-fix-includes.patch | 4 ++--
 package/erlang-p1-sip/erlang-p1-sip.hash      | 4 ++--
 package/erlang-p1-sip/erlang-p1-sip.mk        | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/erlang-p1-sip/0001-fix-includes.patch b/package/erlang-p1-sip/0001-fix-includes.patch
index 80e2ab36c2..82a685ed8d 100644
--- a/package/erlang-p1-sip/0001-fix-includes.patch
+++ b/package/erlang-p1-sip/0001-fix-includes.patch
@@ -8,11 +8,11 @@ Index: erlang-p1-sip/src/esip_socket.erl
 ===================================================================
 --- erlang-p1-sip.orig/src/esip_socket.erl
 +++ erlang-p1-sip/src/esip_socket.erl
-@@ -22,7 +22,7 @@
+@@ -37,7 +37,7 @@
  
  -include("esip.hrl").
  -include("esip_lib.hrl").
---include("stun.hrl").
+--include_lib("stun/include/stun.hrl").
 +-include_lib("p1_stun/include/stun.hrl").
  
  -define(TCP_SEND_TIMEOUT, 15000).
diff --git a/package/erlang-p1-sip/erlang-p1-sip.hash b/package/erlang-p1-sip/erlang-p1-sip.hash
index 70b20f95dc..dec283661e 100644
--- a/package/erlang-p1-sip/erlang-p1-sip.hash
+++ b/package/erlang-p1-sip/erlang-p1-sip.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 4c8dbba1dfcbb16a300fea5fd75f5ab2a145f011fa1ebff37e31e1672a9bc285 erlang-p1-sip-1.0.30.tar.gz
-sha256 6e68ca4488fcdacf80ea0a3f5a6a294d48c2d8dc9de520cc3d6b3f3c1bc12847 LICENSE.txt
+sha256  b46349a7077d8e5f36a216ada4a5c0b51ef3d66005606beb0ea3962069f215a7  erlang-p1-sip-1.0.38.tar.gz
+sha256  6e68ca4488fcdacf80ea0a3f5a6a294d48c2d8dc9de520cc3d6b3f3c1bc12847  LICENSE.txt
diff --git a/package/erlang-p1-sip/erlang-p1-sip.mk b/package/erlang-p1-sip/erlang-p1-sip.mk
index f7f10caf94..2d2f0110c3 100644
--- a/package/erlang-p1-sip/erlang-p1-sip.mk
+++ b/package/erlang-p1-sip/erlang-p1-sip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_SIP_VERSION = 1.0.30
+ERLANG_P1_SIP_VERSION = 1.0.38
 ERLANG_P1_SIP_SITE = $(call github,processone,esip,$(ERLANG_P1_SIP_VERSION))
 ERLANG_P1_SIP_LICENSE = Apache-2.0
 ERLANG_P1_SIP_LICENSE_FILES = LICENSE.txt
-- 
2.25.1
