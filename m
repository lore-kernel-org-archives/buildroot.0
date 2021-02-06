From: Petr Vorel <petr.vorel@gmail.com>
Date: Sat,  6 Feb 2021 18:56:40 +0000
Subject: [Buildroot] [PATCH 1/1] package/iputils: update path for tftpd
Message-ID: <20210206185640.140214-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tftpd has been installed into /usr/sbin in 20210202
(in upstream commit 8d1420f tftpd: install into sbindir).

Thus remove hook which expected it in /usr/bin and tried to move it into
/usr/sbin.

Fixes:
 - http://autobuild.buildroot.net/results/3d142a705f07d496b1342e04094cd03ce7d92994
 - http://autobuild.buildroot.net/results/dae643b2d23d74b5f91225d00e85c350861a0e8a
 - http://autobuild.buildroot.net/results/dcfcb082bc188e7f990e280c3fd5d971f32cc048

Fixes: ea422f9950 ("package/iputils: bump version to 20210202")

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Sorry for introducing regression.

Kind regards,
Petr

 package/iputils/iputils.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 0273e295d6..1ee64dabe4 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -84,11 +84,6 @@ endif
 ifeq ($(BR2_PACKAGE_IPUTILS_TFTPD),y)
 IPUTILS_CONF_OPTS += -DBUILD_TFTPD=true
 
-define IPUTILS_MOVE_TFTPD_BINARY
-	mv $(TARGET_DIR)/usr/bin/tftpd $(TARGET_DIR)/usr/sbin/tftpd
-endef
-IPUTILS_POST_INSTALL_TARGET_HOOKS += IPUTILS_MOVE_TFTPD_BINARY
-
 else
 IPUTILS_CONF_OPTS += -DBUILD_TFTPD=false
 endif
-- 
2.30.0
