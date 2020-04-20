From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 20 Apr 2020 18:34:02 +0200
Subject: [Buildroot] [PATCH v3, 1/1] package/odhcp6c: bump to version
 f575351cbb3defc0bf52680c9082912a6c264374
Message-ID: <20200420163402.1026751-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch to official openwrt site instead of sbyx github fork which is not
up to date anymore. This bump will fix build with musl 1.2.0 thanks to
https://git.openwrt.org/?p=project/odhcp6c.git;a=commit;h=49305e6847efa43e008d0bebdc176e1833120947

Also update indentation of hash file (two spaces)

Fixes:
 - http://autobuild.buildroot.org/results/fcd89dd076887e9b590ffa672decf2c84a6d57f8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v2 -> v3 (after review of Baruch Siach):
 - Use https transport

Changes v1 -> v2:
 - Fix version in title

 package/odhcp6c/Config.in    | 2 +-
 package/odhcp6c/odhcp6c.hash | 4 ++--
 package/odhcp6c/odhcp6c.mk   | 5 +++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/odhcp6c/Config.in b/package/odhcp6c/Config.in
index 97ea4b44ef..ca3a2f6424 100644
--- a/package/odhcp6c/Config.in
+++ b/package/odhcp6c/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_ODHCP6C
 	  odhcp6c is a minimal DHCPv6 and RA-client for use in
 	  embedded Linux systems, especially routers.
 
-	  https://github.com/sbyx/odhcp6c
+	  https://git.openwrt.org/project/odhcp6c.git
diff --git a/package/odhcp6c/odhcp6c.hash b/package/odhcp6c/odhcp6c.hash
index 8b16fa98bb..2ac4a68219 100644
--- a/package/odhcp6c/odhcp6c.hash
+++ b/package/odhcp6c/odhcp6c.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 6d472320ccfa2e57197596869507f2a4bf9900a502939404bf0c033dceeadf5f odhcp6c-d2e247d8d87ecf8c60fcf0acdad05667bd379521.tar.gz
-sha256 e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4 COPYING
+sha256  e715c1408982152306c65f1c3ce7c58fb6f15fa8f9626c266819119239f32418  odhcp6c-f575351cbb3defc0bf52680c9082912a6c264374.tar.gz
+sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/odhcp6c/odhcp6c.mk b/package/odhcp6c/odhcp6c.mk
index 3b4e7580a2..c7f214ff7a 100644
--- a/package/odhcp6c/odhcp6c.mk
+++ b/package/odhcp6c/odhcp6c.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-ODHCP6C_VERSION = d2e247d8d87ecf8c60fcf0acdad05667bd379521
-ODHCP6C_SITE = $(call github,sbyx,odhcp6c,$(ODHCP6C_VERSION))
+ODHCP6C_VERSION = f575351cbb3defc0bf52680c9082912a6c264374
+ODHCP6C_SITE = https://git.openwrt.org/project/odhcp6c.git
+ODHCP6C_SITE_METHOD = git
 ODHCP6C_LICENSE = GPL-2.0
 ODHCP6C_LICENSE_FILES = COPYING
 
-- 
2.25.1
