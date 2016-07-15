From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 19:40:10 +0200
Subject: [Buildroot] [git commit] package/eudev: fix configure options
Message-ID: <20160715183413.8B9227FC6B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df8525530f004c52c602031800c9242b49e6b5a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--enable-libkmod does not exist, but there's --enable-kmod.

Also, add --enable-blkid to the list of options, since we already depend
on it (from util-linux).

Also do not align \ for line continuations.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
