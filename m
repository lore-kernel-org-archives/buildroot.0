From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 19 Jul 2014 15:56:08 +0200
Subject: [Buildroot] [PATCH 01/20 v3] package/xbmc: remove spurious
	build-dependency on udev
In-Reply-To: <cover.1405777634.git.yann.morin.1998@free.fr>
References: <cover.1405777634.git.yann.morin.1998@free.fr>
Message-ID: <9f0233c669c85c57e45bb3575a3c44702eafeada.1405777634.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CEC support with libcec needs udev, but it is the responsibility
of libcec to have proper build-dependencies, not XBMC.

So, just remove the spurious dependency on udev in XBMC.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xbmc/xbmc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index 1d458d4..45be990 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -130,7 +130,7 @@ XBMC_CONF_OPT += --disable-avahi
 endif
 
 ifeq ($(BR2_PACKAGE_XBMC_LIBCEC),y)
-XBMC_DEPENDENCIES += libcec udev
+XBMC_DEPENDENCIES += libcec
 XBMC_CONF_OPT += --enable-libcec
 else
 XBMC_CONF_OPT += --disable-libcec
-- 
1.9.1
