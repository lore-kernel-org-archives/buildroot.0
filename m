From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed,  7 Oct 2009 22:08:35 +0200
Subject: [Buildroot] [PATCH 12/14] rsync: bump version
In-Reply-To: <d97ecb658b37edf74a168fa361436b5be821395c.1254945750.git.rep.dot.nop@gmail.com>
References: <cover.1254945750.git.rep.dot.nop@gmail.com>
	<4acf0a418a2f34c50249d56c6e76b8dba7076302.1254945750.git.rep.dot.nop@gmail.com>
	<8ddd0fbdd88acec5c801c93ce830b1ad04536118.1254945750.git.rep.dot.nop@gmail.com>
	<b1a1dc13edb6053d271297a4ac369d848c5f5749.1254945750.git.rep.dot.nop@gmail.com>
	<a576ef52cd1f156525fd2d327f1e7da466257be2.1254945750.git.rep.dot.nop@gmail.com>
	<df7563b3e1a87daa6f42ade2c505fecc014aa2a2.1254945750.git.rep.dot.nop@gmail.com>
	<382fdbb8e5e36dd9348dfd57b9267862ef8d2ead.1254945750.git.rep.dot.nop@gmail.com>
	<53e08690da5a307328d4d5dc7d53865215ced09f.1254945750.git.rep.dot.nop@gmail.com>
	<b01a751a32bbd1ac0bb43898ed65a6c7afd9e0c7.1254945750.git.rep.dot.nop@gmail.com>
	<ec988dfe40afe8381a2263eeaae1bd2f8ffd9014.1254945750.git.rep.dot.nop@gmail.com>
	<f77d7f5dd82b8b3945e77fd9351619fa260cff98.1254945750.git.rep.dot.nop@gmail.com>
	<d97ecb658b37edf74a168fa361436b5be821395c.1254945750.git.rep.dot.nop@gmail.com>
Message-ID: <730af4752b8da4a9b2a2b1583987899fa3eef334.1254945750.git.rep.dot.nop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Bump version to 3.0.6.
  autoreconf is off per default, so no need to specify it.
  Use config.cache (fix the incorrect package instead).
  Pass ENABLE_DEBUG setting to configure.

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 package/rsync/rsync.mk |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index e24a38c..dbe442a 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -4,13 +4,13 @@
 #
 #############################################################
 
-RSYNC_VERSION:=3.0.5
+RSYNC_VERSION:=3.0.6
 RSYNC_SOURCE:=rsync-$(RSYNC_VERSION).tar.gz
-RSYNC_SITE:=http://rsync.samba.org/ftp/rsync/src
-RSYNC_AUTORECONF:=no
-RSYNC_USE_CONFIG_CACHE:=no
+RSYNC_SITE:=http://rsync.samba.org/ftp/rsync
+#RSYNC_USE_CONFIG_CACHE:=no
 RSYNC_INSTALL_STAGING:=NO
 RSYNC_INSTALL_TARGET:=YES
+RSYNC_CONF_OPT=$(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug)
 ifeq ($(BR2_ENABLE_DEBUG),y)
 RSYNC_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) INSTALLCMD='./install-sh -c' \
 			  install
-- 
1.6.3.3
