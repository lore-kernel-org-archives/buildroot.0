From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Thu,  9 Dec 2010 10:55:09 +0100
Subject: [Buildroot] [PATCH 11/16] rsync: avoid using non reevaluated
	$(TARGET_DIR) in RSYNC_INSTALL_TARGET_OPT
In-Reply-To: <1291888514-31385-1-git-send-email-llandwerlin@gmail.com>
References: <1291888514-31385-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1291888514-31385-12-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/rsync/rsync.mk |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index e1bb28e..5ffbfbb 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -4,19 +4,19 @@
 #
 #############################################################
 
-RSYNC_VERSION:=3.0.7
-RSYNC_SOURCE:=rsync-$(RSYNC_VERSION).tar.gz
-RSYNC_SITE:=http://rsync.samba.org/ftp/rsync/src
-RSYNC_INSTALL_STAGING:=NO
-RSYNC_INSTALL_TARGET:=YES
-RSYNC_CONF_OPT=$(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug)
+RSYNC_VERSION := 3.0.7
+RSYNC_SOURCE := rsync-$(RSYNC_VERSION).tar.gz
+RSYNC_SITE := http://rsync.samba.org/ftp/rsync/src
+RSYNC_INSTALL_STAGING = NO
+RSYNC_INSTALL_TARGET = YES
+RSYNC_CONF_OPT = $(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug)
 ifeq ($(BR2_ENABLE_DEBUG),y)
-RSYNC_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) INSTALLCMD='./install-sh -c' \
+RSYNC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) INSTALLCMD='./install-sh -c' \
 			  install
 else
-RSYNC_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) INSTALLCMD='./install-sh -c' \
+RSYNC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) INSTALLCMD='./install-sh -c' \
 			  STRIPPROG="$(TARGET_STRIP)" install-strip
 endif
-RSYNC_CONF_OPT:=--with-included-popt
+RSYNC_CONF_OPT = --with-included-popt
 
 $(eval $(call AUTOTARGETS,package,rsync))
-- 
1.7.2.3
