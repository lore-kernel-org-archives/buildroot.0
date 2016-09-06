From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Sep 2016 21:41:59 +0200
Subject: [Buildroot] [git commit] package/terminology: remove elementary
	dependency
Message-ID: <20160906195112.0A92F82267@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e50e1b72aa19b035da026a7999a09e5eaa1c112e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

elementary is now provided by efl package, so remove elementary package
dependency.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/terminology/Config.in      | 1 -
 package/terminology/terminology.mk | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/terminology/Config.in b/package/terminology/Config.in
index c574af7..f367ce5 100644
--- a/package/terminology/Config.in
+++ b/package/terminology/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_TERMINOLOGY
 	bool "terminology"
 	depends on BR2_PACKAGE_EFL
-	select BR2_PACKAGE_ELEMENTARY
 	help
 	  Terminology is an EFL terminal emulator with some extra
 	  bells and whistles.
diff --git a/package/terminology/terminology.mk b/package/terminology/terminology.mk
index d6c41d7..86b51c5 100644
--- a/package/terminology/terminology.mk
+++ b/package/terminology/terminology.mk
@@ -10,7 +10,7 @@ TERMINOLOGY_SITE = https://download.enlightenment.org/rel/apps/terminology
 TERMINOLOGY_LICENSE = BSD-2c
 TERMINOLOGY_LICENSE_FILES = COPYING
 
-TERMINOLOGY_DEPENDENCIES = efl elementary host-pkgconf
+TERMINOLOGY_DEPENDENCIES = efl host-pkgconf
 TERMINOLOGY_CONF_OPTS = --with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc
 
 $(eval $(autotools-package))
