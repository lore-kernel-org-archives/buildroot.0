From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jul 2012 18:25:42 +0200
Subject: [Buildroot] [git commit branch/next] gpsd: disable Python support
Message-ID: <20120802195300.F14628E8F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b04d89b02291021472f2f3f13b3e6f42a09d7998
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The Python support is not cross-compile friendly (uses host compiler,
installs in wrong location, etc.) and nobody needs it at the moment,
so leave that to the first person who will need Python support for
gpsd.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gpsd/gpsd.mk |    9 ++-------
 1 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index e96d979..190732f 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -20,7 +20,8 @@ GPSD_SCONS_OPTS = \
 	prefix=/usr\
 	chrpath=no\
 	sysroot=$(STAGING_DIR)\
-	strip=no
+	strip=no\
+	python=no
 
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 	GPSD_DEPENDENCIES += ncurses
@@ -29,12 +30,6 @@ else
 	GPSD_SCONS_OPTS += ncurses=no
 endif
 
-ifeq ($(BR2_PACKAGE_PYTHON),y)
-	GPSD_DEPENDENCIES += python
-else
-	GPSD_SCONS_OPTS += python=no
-endif
-
 # Disable IPv6, if we don't support it
 ifneq ($(BR2_INET_IPV6),y)
 	GPSD_SCONS_OPTS += ipv6=no
