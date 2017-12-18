From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Dec 2017 10:01:50 +0100
Subject: [Buildroot] [git commit] iproute2: fix build with threads support
 disabled
Message-ID: <20171218090428.79560834E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a8a9c33d107af7923651945a1b276260bd84a0ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

iproute2 renamed the configure script generated file to config.mk.
Update the berkeleydb disable code.

Fixes:
http://autobuild.buildroot.net/results/46d/46da1142806fb524326994585cec6de9f7f3f480/
http://autobuild.buildroot.net/results/3aa/3aa028fe9e730335d2af00d5969b674a3d9f640b/

Cc: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/iproute2/iproute2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index b75349d..c01917d 100644
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
 
