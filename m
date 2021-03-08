From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 08 Mar 2021 07:44:43 -0000
Subject: [Buildroot] [git commit] package/ubus: bump version to d1d9ddf
Message-ID: <20210308072133.B567A81607@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1510a61f69757823b6c314b6ea957c897d446f86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- change download url to https

- update homepage url (the old one redirects to legacy read only
  OpenWrt wiki system)

- update license file hash (ubusd_acl.h - license unrelated source
  code changes only)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ubus/Config.in | 2 +-
 package/ubus/ubus.hash | 4 ++--
 package/ubus/ubus.mk   | 5 +++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/ubus/Config.in b/package/ubus/Config.in
index 28bf8e9ae4..391893e808 100644
--- a/package/ubus/Config.in
+++ b/package/ubus/Config.in
@@ -19,7 +19,7 @@ config BR2_PACKAGE_UBUS
 	  * Select BR2_PACKAGE_LUA_5_1 if you want to have Lua
 	    support.
 
-	  https://wiki.openwrt.org/doc/techref/ubus
+	  https://openwrt.org/docs/techref/ubus
 
 if BR2_PACKAGE_UBUS
 
diff --git a/package/ubus/ubus.hash b/package/ubus/ubus.hash
index 1fcea36851..15e67b53ed 100644
--- a/package/ubus/ubus.hash
+++ b/package/ubus/ubus.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  011566b2be426f572d397b44a7c12baa50a9b949232e5a6075eba613e1c3f7ae  ubus-34c6e818e431cc53478a0f7c7c1eca07d194d692-br1.tar.gz
-sha256  f53187f011575f6ec6c529136fd4658d67e674227c80b7b72c99b3654454ae7f  ubusd_acl.h
+sha256  0d2abb7212ad1ac0ac641d52f62e212bb090a1bbaeae975a78f44ab08d3e3c23  ubus-d1d9ddf98d39b0bdc055060fb962335439445690-br1.tar.gz
+sha256  a3caa6c0e90c87b7c97c2ac3d0c0d416082ef777215faec2e9b24ea6e68f6988  ubusd_acl.h
diff --git a/package/ubus/ubus.mk b/package/ubus/ubus.mk
index 5fb57ead01..09668f7dd2 100644
--- a/package/ubus/ubus.mk
+++ b/package/ubus/ubus.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-UBUS_VERSION = 34c6e818e431cc53478a0f7c7c1eca07d194d692
-UBUS_SITE = git://git.openwrt.org/project/ubus.git
+UBUS_VERSION = d1d9ddf98d39b0bdc055060fb962335439445690
+UBUS_SITE = https://git.openwrt.org/project/ubus.git
+UBUS_SITE_METHOD = git
 
 UBUS_LICENSE = LGPL-2.1
 UBUS_LICENSE_FILES = ubusd_acl.h
