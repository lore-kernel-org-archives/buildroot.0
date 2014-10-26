From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 17:04:18 +0100
Subject: [Buildroot] [git commit] package/libsoxr: cleanup configure options
Message-ID: <20141026160700.1CD91B0961@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aab83053553450f524a0c0e7dc3bf74fea6bee75
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BUILD_SHARED_LIBS is already driven by the cmake-package
infrastructure.

[Thomas: amend to really remove the BUILD_SHARED_LIBS option from the
package, after checking on IRC with Samuel.]

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsoxr/libsoxr.mk |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/package/libsoxr/libsoxr.mk b/package/libsoxr/libsoxr.mk
index 528d5c1..eea1418 100644
--- a/package/libsoxr/libsoxr.mk
+++ b/package/libsoxr/libsoxr.mk
@@ -12,10 +12,6 @@ LIBSOXR_LICENSE_FILES = LICENCE COPYING.LGPL
 LIBSOXR_INSTALL_STAGING = YES
 LIBSOXR_CONF_OPTS = -DWITH_OPENMP=OFF
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
-LIBSOXR_CONF_OPTS += -DBUILD_SHARED_LIBS:BOOL=OFF
-endif
-
 ifeq ($(call qstrip,$(BR2_ENDIAN)),BIG)
 LIBSOXR_CONF_OPTS += -DHAVE_WORDS_BIGENDIAN=1
 else
