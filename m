From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 28 Mar 2014 01:00:27 +0100
Subject: [Buildroot] [PATCH 10/10] package/tvheadend: do not line-up
	variables
In-Reply-To: <cover.1395964430.git.yann.morin.1998@free.fr>
References: <cover.1395964430.git.yann.morin.1998@free.fr>
Message-ID: <4f298ad3beb7ace204437c079c353fa641fe14ae.1395964430.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/tvheadend/tvheadend.mk | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

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
-- 
1.8.3.2
