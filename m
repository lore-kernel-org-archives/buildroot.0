From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 15 Jun 2009 13:52:54 +0000
Subject: [Buildroot] [git commit] dmraid must now require lvm2 and not dm
Message-ID: <20090620051954.894BE777D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9cf1786bf043b2e5dd7247a31786cd4efb0f982e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


As device-mapper has moved to lvm2, dmraid must now require lvm2.

Signed-off-by: Nigel Kukard <nkukard@lbsd.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dmraid/Config.in |    2 +-
 package/dmraid/dmraid.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dmraid/Config.in b/package/dmraid/Config.in
index 44025e1..7d6ecfb 100644
--- a/package/dmraid/Config.in
+++ b/package/dmraid/Config.in
@@ -4,7 +4,7 @@ comment "dmraid has no inherent support for AVR32"
 config BR2_PACKAGE_DMRAID
 	bool "dmraid"
 	depends on BR2_LARGEFILE
-	select BR2_PACKAGE_DM
+	select BR2_PACKAGE_LVM2
 	help
 	  dmraid discovers, activates, deactivates and displays properties
 	  of software RAID sets (eg, ATARAID) and contained DOS partitions.
diff --git a/package/dmraid/dmraid.mk b/package/dmraid/dmraid.mk
index 1b18f3b..93d6561 100644
--- a/package/dmraid/dmraid.mk
+++ b/package/dmraid/dmraid.mk
@@ -9,7 +9,7 @@ DMRAID_SITE:=http://people.redhat.com/~heinzm/sw/dmraid/src
 DMRAID_SUBDIR:=$(DMRAID_VERSION)
 # lib and tools race with parallel make
 DMRAID_MAKE = $(MAKE1)
-DMRAID_DEPENDENCIES:=dm
+DMRAID_DEPENDENCIES:=lvm2
 DMRAID_INSTALL_STAGING:=yes
 
 $(eval $(call AUTOTARGETS,package,dmraid))
-- 
1.6.0.6
