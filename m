From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 17 Dec 2017 23:48:23 +0200
Subject: [Buildroot] [PATCH 1/2] iproute2: fix build with threads support
 disabled
Message-ID: <12bbbd716a1599907414d2a419430a7ad10e5520.1513547304.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

iproute2 renamed the configure script generated file to config.mk.
Update the berkeleydb disable code.

Fixes:
http://autobuild.buildroot.net/results/46d/46da1142806fb524326994585cec6de9f7f3f480/
http://autobuild.buildroot.net/results/3aa/3aa028fe9e730335d2af00d5969b674a3d9f640b/

Cc: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/iproute2/iproute2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index b75349dbce70..c01917dffef0 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -42,7 +42,7 @@ ifeq ($(BR2_PACKAGE_BERKELEYDB_COMPAT185)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
 IPROUTE2_DEPENDENCIES += berkeleydb
 else
 define IPROUTE2_DISABLE_ARPD
-	echo "HAVE_BERKELEY_DB:=n" >> $(@D)/Config
+	echo "HAVE_BERKELEY_DB:=n" >> $(@D)/config.mk
 endef
 endif
 
-- 
2.15.1
