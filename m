From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 17:03:06 +0100
Subject: [Buildroot] [git commit] package/clapack: cleanup configure options
Message-ID: <20141026160700.056F3B0961@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=63f7c707f75d8d0cc00a6064017162bd618cb5bb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove the BUILD_TESTING configure option (note the typo in its existing
name), which is already set to the same value by the cmake
infrastructure.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/clapack/clapack.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/clapack/clapack.mk b/package/clapack/clapack.mk
index 99de35d..c3841f2 100644
--- a/package/clapack/clapack.mk
+++ b/package/clapack/clapack.mk
@@ -14,7 +14,6 @@ CLAPACK_LICENSE = HPND (libf2c), BSD-3c (libblas and liblapack)
 CLAPACK_LICENSE_FILES = F2CLIBS/libf2c/Notice COPYING
 CLAPACK_SITE = http://www.netlib.org/clapack
 CLAPACK_INSTALL_STAGING = YES
-CLAPACK_CONF_OPTS = -DBUILDTESTING=OFF
 
 ifneq ($(BR2_PACKAGE_CLAPACK_ARITH_H),)
 CLAPACK_CONF_OPTS += -DARITH_H=$(BR2_PACKAGE_CLAPACK_ARITH_H)
