From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 Dec 2020 23:24:34 +0100
Subject: [Buildroot] [git commit] package/erlang-p1-sip: bump version to
 1.0.38
Message-ID: <20201203092229.265208361A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=26da19b7c5eb548e7ab958b319dcd38a541e1640
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

upstream is finally using include_lib to include libraries. Adapt the patch
accordingly.

The hash of the license file has changed, due to:

-Copyright 2002-2019 ProcessOne SARL
+Copyright 2002-2020 ProcessOne SARL

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/erlang-p1-sip/0001-correct-include.patch | 31 ++++++++++++++++++++++++
 package/erlang-p1-sip/0001-fix-includes.patch    | 19 ---------------
 package/erlang-p1-sip/erlang-p1-sip.hash         |  4 +--
 package/erlang-p1-sip/erlang-p1-sip.mk           |  2 +-
 4 files changed, 34 insertions(+), 22 deletions(-)

diff --git a/package/erlang-p1-sip/0001-correct-include.patch b/package/erlang-p1-sip/0001-correct-include.patch
new file mode 100644
index 0000000000..90d68b5184
--- /dev/null
+++ b/package/erlang-p1-sip/0001-correct-include.patch
@@ -0,0 +1,31 @@
+From 5ad4f871df7cbbc973708cb7380c3410b20bde1c Mon Sep 17 00:00:00 2001
+From: Philipp Huebner <debalance@debian.org>
+Date: Tue, 1 Dec 2020 23:07:51 +0100
+Subject: [PATCH] correct include
+
+This part of the code was moved into it's own project and was packaged
+separately by me. To make the build process work, this small fix is
+necessary.
+
+Author: Philipp Huebner <debalance@debian.org>
+Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
+---
+ src/esip_socket.erl | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/esip_socket.erl b/src/esip_socket.erl
+index 4154faa..db5fa92 100644
+--- a/src/esip_socket.erl
++++ b/src/esip_socket.erl
+@@ -37,7 +37,7 @@
+ 
+ -include("esip.hrl").
+ -include("esip_lib.hrl").
+--include_lib("stun/include/stun.hrl").
++-include_lib("p1_stun/include/stun.hrl").
+ 
+ -define(TCP_SEND_TIMEOUT, 15000).
+ -define(CONNECT_TIMEOUT, 20000).
+-- 
+2.28.0
+
diff --git a/package/erlang-p1-sip/0001-fix-includes.patch b/package/erlang-p1-sip/0001-fix-includes.patch
deleted file mode 100644
index 80e2ab36c2..0000000000
--- a/package/erlang-p1-sip/0001-fix-includes.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Description: correct include
- This part of the code was moved into it's own project and was packaged
- separately by me. To make the build process work, this small fix is
- necessary.
-Author: Philipp Huebner <debalance@debian.org>
-
-Index: erlang-p1-sip/src/esip_socket.erl
-===================================================================
---- erlang-p1-sip.orig/src/esip_socket.erl
-+++ erlang-p1-sip/src/esip_socket.erl
-@@ -22,7 +22,7 @@
- 
- -include("esip.hrl").
- -include("esip_lib.hrl").
---include("stun.hrl").
-+-include_lib("p1_stun/include/stun.hrl").
- 
- -define(TCP_SEND_TIMEOUT, 15000).
- -define(CONNECT_TIMEOUT, 20000).
diff --git a/package/erlang-p1-sip/erlang-p1-sip.hash b/package/erlang-p1-sip/erlang-p1-sip.hash
index 70b20f95dc..e52371e404 100644
--- a/package/erlang-p1-sip/erlang-p1-sip.hash
+++ b/package/erlang-p1-sip/erlang-p1-sip.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 4c8dbba1dfcbb16a300fea5fd75f5ab2a145f011fa1ebff37e31e1672a9bc285 erlang-p1-sip-1.0.30.tar.gz
-sha256 6e68ca4488fcdacf80ea0a3f5a6a294d48c2d8dc9de520cc3d6b3f3c1bc12847 LICENSE.txt
+sha256  b46349a7077d8e5f36a216ada4a5c0b51ef3d66005606beb0ea3962069f215a7  erlang-p1-sip-1.0.38.tar.gz
+sha256  6cd4871db940d055cf272c12c10e0c08febdc94362e404390758fde34b4ce01a  LICENSE.txt
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
