From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 20:32:37 +0200
Subject: [Buildroot] [git commit] package/eudev: libgudev is no longer
	provided by eudev
Message-ID: <20160715183413.9A20B82257@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=69c8a50ca4cfc8e2e67d7099e021c7d60dba518f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libgudev is now provided by the the eponym package libgudev.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/eudev/eudev.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 0fe96e8..6c61660 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -42,13 +42,6 @@ else
 EUDEV_CONF_OPTS += --disable-hwdb
 endif
 
-ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
-EUDEV_CONF_OPTS += --enable-gudev
-EUDEV_DEPENDENCIES += libglib2
-else
-EUDEV_CONF_OPTS += --disable-gudev
-endif
-
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 EUDEV_CONF_OPTS += --enable-selinux
 EUDEV_DEPENDENCIES += libselinux
