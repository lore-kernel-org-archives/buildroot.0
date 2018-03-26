From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Mar 2018 14:49:25 +0200
Subject: [Buildroot] [git commit] package/eudev: don't forcibly link with
 -lrt
Message-ID: <20180326125143.2987083C1D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eaa63edbee8b8bfdac3fcbd84573220c607e0662
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This was carried over from udev back when it were an separate package,
but was not even needed by eudev 1.3 when we introduced it back in 2014
(937a95449ec: eudev: new package).

Drop it now.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/eudev/eudev.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index d08b9bb0c9..11dc93762b 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -10,9 +10,6 @@ EUDEV_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 EUDEV_LICENSE_FILES = COPYING
 EUDEV_INSTALL_STAGING = YES
 
-# mq_getattr is in librt
-EUDEV_CONF_ENV += LIBS=-lrt
-
 EUDEV_CONF_OPTS = \
 	--disable-manpages \
 	--sbindir=/sbin \
