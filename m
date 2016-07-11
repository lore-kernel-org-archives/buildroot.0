From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 12 Jul 2016 00:16:27 +0200
Subject: [Buildroot] [PATCH 04/12 v8] package/eudev: fix configure options
In-Reply-To: <cover.1468274498.git.yann.morin.1998@free.fr>
References: <cover.1468274498.git.yann.morin.1998@free.fr>
Message-ID: <68e73e2f3ac706797f43901c923cf59f5e9e7640.1468274498.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--enable-libkmod does not exist, but there's --enable-kmod.

Also, add --enable-blkid to the list of options, since we already depend
on it (from util-linux).

Also do not align \ for line continuations.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/eudev/eudev.mk | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index e3d3d63..0fe96e8 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -14,13 +14,14 @@ EUDEV_INSTALL_STAGING = YES
 # mq_getattr is in librt
 EUDEV_CONF_ENV += LIBS=-lrt
 
-EUDEV_CONF_OPTS =		\
-	--disable-manpages	\
-	--sbindir=/sbin		\
-	--libexecdir=/lib	\
-	--with-firmware-path=/lib/firmware	\
-	--disable-introspection			\
-	--enable-libkmod
+EUDEV_CONF_OPTS = \
+	--disable-manpages \
+	--sbindir=/sbin \
+	--libexecdir=/lib \
+	--with-firmware-path=/lib/firmware \
+	--disable-introspection \
+	--enable-kmod \
+	--enable-blkid
 
 EUDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux kmod
 EUDEV_PROVIDES = udev
-- 
2.7.4
