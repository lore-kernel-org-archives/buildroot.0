From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Sat,  5 Oct 2013 20:58:42 +0200
Subject: [Buildroot] [PATCH] package/opkg: bumping version to 0.2.0
Message-ID: <1380999522-2915-1-git-send-email-c.schoenert@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carsten Schoenert <c.schoenert@gmail.com>

opkg has released a new version v0.2.0. The opkg community is also on
the way to switching completely from subversion to git.
The current git repository is placed on Bitbucket and will probably move
once again if there will be find a new home for the project.
https://bitbucket.org/opkg/opkg

The new version 0.2.0 is almost a bugfixing release with a lot of small
changes.
This patch is adding the license info too.

Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
---
 package/opkg/opkg.mk | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
index 5846433..c57bd7f 100644
--- a/package/opkg/opkg.mk
+++ b/package/opkg/opkg.mk
@@ -4,15 +4,16 @@
 #
 ################################################################################
 
-OPKG_VERSION = 635
-OPKG_SOURCE = opkg-$(OPKG_VERSION).tar.gz
-OPKG_SITE = http://opkg.googlecode.com/svn/trunk/
-OPKG_SITE_METHOD = svn
+OPKG_VERSION = v0.2.0
+OPKG_SOURCE = $(OPKG_VERSION).tar.bz2
+OPKG_SITE = https://bitbucket.org/opkg/opkg/get
+# Uses PKG_CHECK_MODULES() in configure.ac
+OPKG_DEPENDENCIES = host-pkgconf
+OPKG_LICENSE = GPLv2+
+OPKG_LICENSE_FILES = COPYING
 OPKG_INSTALL_STAGING = YES
 OPKG_CONF_OPT = --disable-curl
 OPKG_AUTORECONF = YES
-# Uses PKG_CHECK_MODULES() in configure.ac
-OPKG_DEPENDENCIES = host-pkgconf
 
 # Ensure directory for lockfile exists
 define OPKG_CREATE_LOCKDIR
-- 
1.8.4.rc3
