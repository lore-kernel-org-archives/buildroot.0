From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 31 Mar 2011 22:46:06 +0200
Subject: [Buildroot] [git commit master 1/1] rsync: bump version
Message-ID: <20110331204622.7E2B081D42@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=06002a58b53e27da33b2e32697e07058b5f3b9b8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2011-1097 and various other issues, see NEWS for details:

http://rsync.samba.org/ftp/rsync/src/rsync-3.0.8-NEWS

At the same time get rid of unneeded install / install-strip handling.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/rsync/rsync.mk |   10 +---------
 1 files changed, 1 insertions(+), 9 deletions(-)

diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index 5ffbfbb..5030fae 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -4,19 +4,11 @@
 #
 #############################################################
 
-RSYNC_VERSION := 3.0.7
+RSYNC_VERSION := 3.0.8
 RSYNC_SOURCE := rsync-$(RSYNC_VERSION).tar.gz
 RSYNC_SITE := http://rsync.samba.org/ftp/rsync/src
 RSYNC_INSTALL_STAGING = NO
-RSYNC_INSTALL_TARGET = YES
 RSYNC_CONF_OPT = $(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug)
-ifeq ($(BR2_ENABLE_DEBUG),y)
-RSYNC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) INSTALLCMD='./install-sh -c' \
-			  install
-else
-RSYNC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) INSTALLCMD='./install-sh -c' \
-			  STRIPPROG="$(TARGET_STRIP)" install-strip
-endif
 RSYNC_CONF_OPT = --with-included-popt
 
 $(eval $(call AUTOTARGETS,package,rsync))
-- 
1.7.3.4
