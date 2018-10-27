From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Oct 2018 22:59:15 +0200
Subject: [Buildroot] [git commit] gpsd: disable documentation
Message-ID: <20181027205754.C3F7582980@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c0deed8eed0a4e4cd0380b7bcaa54d0056f6df46
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/cbdb4cc34080714082f044fde7e069e6ab5a0e8e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gpsd/gpsd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index b8eea8bf24..ade2d2a163 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -19,6 +19,7 @@ GPSD_SCONS_ENV = $(TARGET_CONFIGURE_OPTS)
 
 GPSD_SCONS_OPTS = \
 	arch=$(ARCH)\
+	manbuild=no \
 	prefix=/usr\
 	sysroot=$(STAGING_DIR)\
 	strip=no\
