From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 5 Jun 2010 21:41:32 +0200
Subject: [Buildroot] [git commit master] package/config: also add gconfig
	change to patch
Message-ID: <20100605194212.179CF12F56E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=fa11d8d8306646714b81f56a04ecde07f3aec623
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/config/kconfig-to-buildroot2.patch |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/config/kconfig-to-buildroot2.patch b/package/config/kconfig-to-buildroot2.patch
index 877caba..db72ea8 100644
--- a/package/config/kconfig-to-buildroot2.patch
+++ b/package/config/kconfig-to-buildroot2.patch
@@ -17,7 +17,7 @@ Index: config/Makefile
 ===================================================================
 --- config.orig/Makefile
 +++ config/Makefile
-@@ -124,10 +124,17 @@
+@@ -124,10 +124,21 @@
  ifeq ($(MAKECMDGOALS),menuconfig)
  	hostprogs-y += mconf
  endif
@@ -35,6 +35,10 @@ Index: config/Makefile
  ifeq ($(MAKECMDGOALS),gconfig)
  	gconf-target := 1
  endif
++ifeq ($(findstring gconf,$(MAKECMDGOALS)),gconf)
++	gconf-target := 1
++endif
++
 Index: config/README.buildroot2
 ===================================================================
 --- /dev/null
-- 
1.6.3.3
