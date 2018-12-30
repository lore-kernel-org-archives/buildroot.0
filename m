From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 15:15:45 +0100
Subject: [Buildroot] [git commit] package/luaposix: bump version to 34.0.4
Message-ID: <20181230141336.55533812C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d84f84029b96e08784957e27f4ce17252f36b2b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version has a new dependency on lua-std-normalize.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Acked-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luaposix/Config.in     | 1 +
 package/luaposix/luaposix.hash | 2 +-
 package/luaposix/luaposix.mk   | 4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/luaposix/Config.in b/package/luaposix/Config.in
index 91abcb9e32..176c7656b4 100644
--- a/package/luaposix/Config.in
+++ b/package/luaposix/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LUAPOSIX
 	bool "luaposix"
 	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
+	select BR2_PACKAGE_LUA_STD_NORMALIZE # runtime
 	# "bit32" is included in Lua 5.2+. luajit has an equivalent
 	# "bit" module, but since it has a different name, luaposix
 	# doesn't find it.
diff --git a/package/luaposix/luaposix.hash b/package/luaposix/luaposix.hash
index b3984c1d15..a13cb4a9eb 100644
--- a/package/luaposix/luaposix.hash
+++ b/package/luaposix/luaposix.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 ba0bc343783fc33958cd02a68cdbfd65430152d9f297f7ed92678b1a305bd5d7  luaposix-34.0.1.tar.gz
+sha256 eb6e7322da3013bdb3d524f68df4f5510a2efd805c06bf7cc27be6611eab7483  luaposix-34.0.4.tar.gz
diff --git a/package/luaposix/luaposix.mk b/package/luaposix/luaposix.mk
index 779e707ce8..f4679929c0 100644
--- a/package/luaposix/luaposix.mk
+++ b/package/luaposix/luaposix.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LUAPOSIX_VERSION = 34.0.1
-LUAPOSIX_SITE = $(call github,luaposix,luaposix,release-v$(LUAPOSIX_VERSION))
+LUAPOSIX_VERSION = 34.0.4
+LUAPOSIX_SITE = $(call github,luaposix,luaposix,v$(LUAPOSIX_VERSION))
 LUAPOSIX_LICENSE = MIT
 LUAPOSIX_LICENSE_FILES = LICENSE
 LUAPOSIX_DEPENDENCIES = luainterpreter host-lua
