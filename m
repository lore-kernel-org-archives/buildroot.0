From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Oct 2013 12:09:30 +0100
Subject: [Buildroot] [git commit] package/opkg: bumping version to 0.2.0
Message-ID: <20131027111258.3393C9BC05@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fb74bc78fbd2ab89baa05960fd13267392d0e399
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
 package/opkg/opkg.mk |   12 +++++++-----
 1 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
index f183d6e..c57bd7f 100644
--- a/package/opkg/opkg.mk
+++ b/package/opkg/opkg.mk
@@ -4,14 +4,16 @@
 #
 ################################################################################
 
-OPKG_VERSION = 635
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
