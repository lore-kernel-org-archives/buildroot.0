From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 6 Apr 2010 07:43:03 +0200
Subject: [Buildroot] [git commit master] radvd: bump version
Message-ID: <20100406054428.EEF638B6CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=07f155c174d87caba320e746cf36592180fbfe78
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1489

Signed-off-by: Alexander Clouter <alex@digriz.org.uk>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                 |    1 +
 package/radvd/Config.in |    1 +
 package/radvd/radvd.mk  |    6 +-----
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/CHANGES b/CHANGES
index a105773..34f47a0 100644
--- a/CHANGES
+++ b/CHANGES
@@ -43,6 +43,7 @@
 	#1441: Add binutils 2.20.1
 	#1447: Package installation on target with debug symbols is broken
 	#1459: Misc QA fixes
+	#1489: radvd update to 1.6
 
 2010.02, Release February 26th, 2010:
 
diff --git a/package/radvd/Config.in b/package/radvd/Config.in
index 072aed4..c7753f0 100644
--- a/package/radvd/Config.in
+++ b/package/radvd/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_RADVD
 	bool "radvd"
 	select BR2_PACKAGE_FLEX
+	select BR2_PACKAGE_FLEX_LIBFL
 	depends on BR2_INET_IPV6
 	help
 	  IPv6 Router Advertisement Daemon.
diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index defcf4b..fdc52ac 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -3,14 +3,10 @@
 # radvd
 #
 #############################################################
-RADVD_VERSION:=1.5
+RADVD_VERSION:=1.6
 RADVD_SOURCE:=radvd-$(RADVD_VERSION).tar.gz
 RADVD_SITE:=http://www.litech.org/radvd/dist/
-RADVD_AUTORECONF:=no
-RADVD_INSTALL_STAGING:=no
-RADVD_INSTALL_TARGET:=YES
 RADVD_DEPENDENCIES:=flex host-flex
-RADVD_MAKE:=$(MAKE1)
 RADVD_CONF_OPT:= --program-prefix=''
 
 $(eval $(call AUTOTARGETS,package,radvd))
-- 
1.6.3.3
