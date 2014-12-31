From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Dec 2014 18:05:15 +0100
Subject: [Buildroot] [git commit] Revert "svgtiny: update source url"
Message-ID: <20141231170547.7FC927FA62@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=31783dcf559a206bc84eac9a6529033056e5db8b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 8f9b5f657b3dbb82a5725c3bf24ed261a77111d8.

The new svgtiny version does not build at all, see:

  http://autobuild.buildroot.org/results/242/24257e9739df8f589150336cb6213812516bf465/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsvgtiny/libsvgtiny.mk |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/libsvgtiny/libsvgtiny.mk b/package/libsvgtiny/libsvgtiny.mk
index 46f4923..a2d494e 100644
--- a/package/libsvgtiny/libsvgtiny.mk
+++ b/package/libsvgtiny/libsvgtiny.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-LIBSVGTINY_SITE = http://git.netsurf-browser.org/libsvgtiny.git
-LIBSVGTINY_SITE_METHOD = git
-LIBSVGTINY_VERSION = ea9d99fc8b231c22d06168135e181d61f4eb2f06
+LIBSVGTINY_SITE = svn://svn.netsurf-browser.org/trunk/libsvgtiny
+LIBSVGTINY_VERSION = 12121
 LIBSVGTINY_INSTALL_STAGING = YES
 LIBSVGTINY_DEPENDENCIES = libxml2 host-gperf host-pkgconf
 LIBSVGTINY_LICENSE = MIT
