From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 17:03:46 +0100
Subject: [Buildroot] [git commit] package/libsoxr: cleanup configure options
Message-ID: <20141026160700.147C0B0961@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=136340bc0afd33abd6b703b632c38c42d86811ca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Test build is already disabled by the cmake-package infrastructure. We
also get rid of the option type for the WITH_OPENMP option, as it is
not necessary.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsoxr/libsoxr.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libsoxr/libsoxr.mk b/package/libsoxr/libsoxr.mk
index 498db8e..528d5c1 100644
--- a/package/libsoxr/libsoxr.mk
+++ b/package/libsoxr/libsoxr.mk
@@ -10,7 +10,7 @@ LIBSOXR_SITE = http://downloads.sourceforge.net/project/soxr
 LIBSOXR_LICENSE = LGPLv2.1+
 LIBSOXR_LICENSE_FILES = LICENCE COPYING.LGPL
 LIBSOXR_INSTALL_STAGING = YES
-LIBSOXR_CONF_OPTS = -DWITH_OPENMP:BOOL=OFF -DBUILD_TESTS:BOOL=OFF
+LIBSOXR_CONF_OPTS = -DWITH_OPENMP=OFF
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
 LIBSOXR_CONF_OPTS += -DBUILD_SHARED_LIBS:BOOL=OFF
