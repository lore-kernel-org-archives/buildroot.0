From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu,  9 Jun 2016 11:33:34 +0200
Subject: [Buildroot] [PATCH] package/luvi: bump to version 2.7.2
In-Reply-To: <20160609093335.9216-1-joerg.krause@embedded.rocks>
References: <20160609093335.9216-1-joerg.krause@embedded.rocks>
Message-ID: <20160609093335.9216-3-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Version bump includes fetched patch from upstream, so remove it.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/luvi/luvi.hash | 3 +--
 package/luvi/luvi.mk   | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/luvi/luvi.hash b/package/luvi/luvi.hash
index 7aa099f..313aef6 100644
--- a/package/luvi/luvi.hash
+++ b/package/luvi/luvi.hash
@@ -1,3 +1,2 @@
 # Locally calculated
-sha256  1177fcc69b1bd74696d7f106e1632462b7331ef7816bbcada91a530ef19235ea  luvi-src-v2.7.0.tar.gz
-sha256  0269504ebd6fe73948bd2314199e686701c6de882fab84a48b8317c0671e84c5  35c3961d10d3f9e3752102ea8e8bb8c187b32241.patch
+sha256  74d52e99174af46aebcf30e26bf5783df8fa3117f54792391bfef4d9c79c4e60  luvi-src-v2.7.2.tar.gz
diff --git a/package/luvi/luvi.mk b/package/luvi/luvi.mk
index c5cfed6..7506a8b 100644
--- a/package/luvi/luvi.mk
+++ b/package/luvi/luvi.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-LUVI_VERSION = v2.7.0
+LUVI_VERSION = v2.7.2
 LUVI_SOURCE = luvi-src-$(LUVI_VERSION).tar.gz
 LUVI_SITE = https://github.com/luvit/luvi/releases/download/$(LUVI_VERSION)
 LUVI_LICENSE = Apache-2.0
 LUVI_LICENSE_FILES = LICENSE.txt
 LUVI_DEPENDENCIES = libuv luajit luv host-luajit
-LUVI_PATCH = https://github.com/luvit/luvi/commit/35c3961d10d3f9e3752102ea8e8bb8c187b32241.patch
 
 # Dispatch all architectures of LuaJIT
 ifeq ($(BR2_i386),y)
-- 
2.8.3
