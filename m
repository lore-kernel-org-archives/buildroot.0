From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Apr 2016 09:42:56 +0200
Subject: [Buildroot] [git commit] luvi: bump to version 2.7.0
Message-ID: <20160415074301.D77F781E71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9656f0d598daef9eddb0f2d95abc4d5a973426db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch from upstream [1] to fix CMake build error when building with option
"WithSharedLibluv=ON".

[1]
https://github.com/luvit/luvi/commit/35c3961d10d3f9e3752102ea8e8bb8c187b32241

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luvi/luvi.hash | 3 ++-
 package/luvi/luvi.mk   | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/luvi/luvi.hash b/package/luvi/luvi.hash
index 6f95dac..7aa099f 100644
--- a/package/luvi/luvi.hash
+++ b/package/luvi/luvi.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256  a8b4aecf4c1d781614fe187b6afcb2dc7462fcd6e76a3f38cbfd0a8244c01582  luvi-src-v2.6.1.tar.gz
+sha256  1177fcc69b1bd74696d7f106e1632462b7331ef7816bbcada91a530ef19235ea  luvi-src-v2.7.0.tar.gz
+sha256  0269504ebd6fe73948bd2314199e686701c6de882fab84a48b8317c0671e84c5  35c3961d10d3f9e3752102ea8e8bb8c187b32241.patch
diff --git a/package/luvi/luvi.mk b/package/luvi/luvi.mk
index 305ff4f..c5cfed6 100644
--- a/package/luvi/luvi.mk
+++ b/package/luvi/luvi.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-LUVI_VERSION = v2.6.1
+LUVI_VERSION = v2.7.0
 LUVI_SOURCE = luvi-src-$(LUVI_VERSION).tar.gz
 LUVI_SITE = https://github.com/luvit/luvi/releases/download/$(LUVI_VERSION)
 LUVI_LICENSE = Apache-2.0
 LUVI_LICENSE_FILES = LICENSE.txt
 LUVI_DEPENDENCIES = libuv luajit luv host-luajit
+LUVI_PATCH = https://github.com/luvit/luvi/commit/35c3961d10d3f9e3752102ea8e8bb8c187b32241.patch
 
 # Dispatch all architectures of LuaJIT
 ifeq ($(BR2_i386),y)
