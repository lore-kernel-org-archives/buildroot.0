From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 24 Nov 2010 22:43:24 +0100
Subject: [Buildroot] [git commit master 1/1] gpsd: needs host-pkg-config for
	proper qt bindings support
Message-ID: <20101124214437.9B9EC8E147@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6ba25ba606c05a03387c5c1df413f701ecca3ed7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gpsd/gpsd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 6c24991..35e2c7d 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -22,7 +22,7 @@ endif
 ifeq ($(BR2_PACKAGE_QT_NETWORK),y)
 	GPSD_CONF_ENV += QMAKE="$(QT_QMAKE)"
 	GPSD_CONF_OPT += --enable-libQgpsmm
-	GPSD_DEPENDENCIES += qt
+	GPSD_DEPENDENCIES += qt host-pkg-config
 else
 	GPSD_CONF_OPT += --disable-libQgpsmm
 endif
-- 
1.7.2.2
