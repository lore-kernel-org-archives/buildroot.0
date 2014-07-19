From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jul 2014 18:01:52 +0200
Subject: [Buildroot] [git commit] package/xbmc: remove spurious
	build-dependency on udev
Message-ID: <20140719160431.88DCF9D25A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=910300950b72feeaec46f3c278f7b4170485f9f8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CEC support with libcec needs udev, but it is the responsibility
of libcec to have proper build-dependencies, not XBMC.

So, just remove the spurious dependency on udev in XBMC.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xbmc/xbmc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
