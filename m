From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue,  3 Mar 2015 10:17:28 +0100
Subject: [Buildroot] [RFC v3 23/30] gpsd: add support for per-package
	staging directory
In-Reply-To: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
References: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1425374255-6827-24-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pass the TARGET_LDFLAGS variable.

Also use $(STAGINGNOPKG_DIR) instead of $(STAGING_DIR) because now the
STAGING_DIR variable point to the per-package staging directory.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/gpsd/gpsd.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 3e6411b..62fd207 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -14,12 +14,12 @@ GPSD_DEPENDENCIES = host-scons host-pkgconf
 
 GPSD_LDFLAGS = $(TARGET_LDFLAGS)
 
-GPSD_SCONS_ENV = $(TARGET_CONFIGURE_OPTS)
+GPSD_SCONS_ENV = $(TARGET_CONFIGURE_OPTS) LINKFLAGS="$(TARGET_LDFLAGS)"
 
 GPSD_SCONS_OPTS = \
 	arch=$(ARCH)\
 	prefix=/usr\
-	sysroot=$(STAGING_DIR)\
+	sysroot=$(STAGINGNOPKG_DIR) \
 	strip=no\
 	python=no
 
-- 
2.3.1
