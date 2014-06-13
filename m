From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Jun 2014 01:02:25 +0200
Subject: [Buildroot] [PATCH 01/20 RFC] package/xbmc: remove spurious
	build-dependency on udev
In-Reply-To: <cover.1402699915.git.yann.morin.1998@free.fr>
References: <cover.1402699915.git.yann.morin.1998@free.fr>
Message-ID: <b7f903149e4e4674f34460828cf953b728fb17db.1402699915.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

CEC support with libcec needs udev, but it is the responsibility
of libcec to have proper build-dependencies, not XBMC.

So, just remove the spurious dependency on udev in XBMC.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
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
1.8.3.2
