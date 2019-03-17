From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Mar 2019 22:50:37 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/libraw: security
 bump to version 0.19.2
Message-ID: <20190317220412.7D3D58EC65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=099c48f1fad731c15cf3da00cbb2d52b86ed2391
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

- Fixes CVE-2018-5815 and CVE-2018-5816
- README has been renamed into README.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 23fd8458fd55166044a476934f51ba3d29fb1745)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libraw/libraw.hash | 4 ++--
 package/libraw/libraw.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libraw/libraw.hash b/package/libraw/libraw.hash
index c546b1bee5..643a2109b5 100644
--- a/package/libraw/libraw.hash
+++ b/package/libraw/libraw.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256	7cf724a40a0d8915869498f51062a952167e4f5bae2b6920542c9e0e079a471d	LibRaw-0.18.11.tar.gz
+sha256	400d47969292291d297873a06fb0535ccce70728117463927ddd9452aa849644	LibRaw-0.19.2.tar.gz
 sha256	eea173a556abac0370461e57e12aab266894ea6be3874c2be05fd87871f75449	LICENSE.LGPL
 sha256	0e3098d2d54a12434715f6679ea408d57da5e8d613c385c58ecc6fe5d30cc81f	LICENSE.CDDL
-sha256	7fe7564c5d48c5d353d7c1966dcddada3791586a4c2eedbc68ad56e96955e75d	README
+sha256	eee0055723d3483ef3ee7920e2178177b14a334c2a622be4101bcfb05d21407e	README.md
diff --git a/package/libraw/libraw.mk b/package/libraw/libraw.mk
index 4ff7462647..0d95207b73 100644
--- a/package/libraw/libraw.mk
+++ b/package/libraw/libraw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRAW_VERSION = 0.18.11
+LIBRAW_VERSION = 0.19.2
 LIBRAW_SOURCE = LibRaw-$(LIBRAW_VERSION).tar.gz
 LIBRAW_SITE = http://www.libraw.org/data
 LIBRAW_INSTALL_STAGING = YES
@@ -14,7 +14,7 @@ LIBRAW_CONF_OPTS += \
 	--disable-demosaic-pack-gpl2 \
 	--disable-demosaic-pack-gpl3
 LIBRAW_LICENSE = LGPL-2.1 or CDDL-1.0
-LIBRAW_LICENSE_FILES = LICENSE.LGPL LICENSE.CDDL README
+LIBRAW_LICENSE_FILES = LICENSE.LGPL LICENSE.CDDL README.md
 LIBRAW_DEPENDENCIES = host-pkgconf
 LIBRAW_CXXFLAGS = $(TARGET_CXXFLAGS)
 LIBRAW_CONF_ENV = CXXFLAGS="$(LIBRAW_CXXFLAGS)"
