From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 18:31:35 +0100
Subject: [Buildroot] [git commit] package/tvheadend: do not line-up variables
Message-ID: <20140329173147.86AAF9C42A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5e829e5f9a7ea3c425859cc08a3a7880b1e41b8e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tvheadend/tvheadend.mk |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 4cfcf90..250c4bb 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION           = 6482d33ba90848018c530018e5c38992b8ac921c
-TVHEADEND_SITE              = git://github.com/tvheadend/tvheadend.git
-TVHEADEND_LICENSE           = GPLv3+
-TVHEADEND_LICENSE_FILES     = LICENSE
-TVHEADEND_DEPENDENCIES      = host-pkgconf host-python openssl
+TVHEADEND_VERSION = 6482d33ba90848018c530018e5c38992b8ac921c
+TVHEADEND_SITE = git://github.com/tvheadend/tvheadend.git
+TVHEADEND_LICENSE = GPLv3+
+TVHEADEND_LICENSE_FILES = LICENSE
+TVHEADEND_DEPENDENCIES = host-pkgconf host-python openssl
 
 ifeq ($(BR2_PACKAGE_AVAHI),y)
-TVHEADEND_DEPENDENCIES     += avahi
+TVHEADEND_DEPENDENCIES += avahi
 endif
 
 #----------------------------------------------------------------------------
@@ -20,7 +20,7 @@ endif
 # package, so it has a list of pre-scanned tunner configurations.
 # For buildroot, we add a patch that avoids doing that, but uses the
 # scan files installed by the dtv-scan-tables package
-TVHEADEND_DEPENDENCIES     += dtv-scan-tables
+TVHEADEND_DEPENDENCIES += dtv-scan-tables
 
 define TVHEADEND_CONFIGURE_CMDS
 	(cd $(@D);				\
