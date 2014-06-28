From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 28 Jun 2014 07:33:52 -0300
Subject: [Buildroot] [PATCH] radvd: bump to version 1.14
Message-ID: <1403951632-13338-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/radvd/radvd.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index a42d858..ecca879 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -4,12 +4,10 @@
 #
 ################################################################################
 
-RADVD_VERSION = 1.13
+RADVD_VERSION = 1.14
 RADVD_SOURCE = radvd-$(RADVD_VERSION).tar.xz
 RADVD_SITE = http://www.litech.org/radvd/dist
 RADVD_DEPENDENCIES = host-bison flex libdaemon host-flex host-pkgconf
-# clock_gettime() requires -lrt when linking against glibc older than 2.17
-RADVD_CONF_ENV = LIBS=-lrt
 
 define RADVD_INSTALL_INITSCRIPT
 	$(INSTALL) -m 0755 package/radvd/S50radvd $(TARGET_DIR)/etc/init.d
-- 
1.8.5.5
