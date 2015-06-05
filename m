From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Jun 2015 16:25:44 +0200
Subject: [Buildroot] [git commit] mp4v2: Remove --disable-debug workaround.
Message-ID: <20150605142606.EC92181E62@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=87e7f5464830b533ca3790452f200bbab0b1b32d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is not needed since BR2_ENABLE_DEBUG does not set this flag
anymore.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mp4v2/mp4v2.mk |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/package/mp4v2/mp4v2.mk b/package/mp4v2/mp4v2.mk
index d34de02..2acbb4e 100644
--- a/package/mp4v2/mp4v2.mk
+++ b/package/mp4v2/mp4v2.mk
@@ -16,12 +16,6 @@ MP4V2_LICENSE_FILES = COPYING
 # disable it
 MP4V2_CONF_ENV = ac_cv_prog_FOUND_HELP2MAN=no
 
-# infrastructure passes --disable-debug if !BR2_ENABLE_DEBUG. With
-# mpv42 the only thing this option does is that it tries to strip any
-# -g* options from CFLAGS/CXXFLAGS. The logic to do so is
-# unfortunately buggy, so just pass --enable-debug to disable this
-MP4V2_CONF_OPTS = --enable-debug --enable-largefile
-
 ifeq ($(BR2_PACKAGE_MP4V2_UTIL),y)
 MP4V2_CONF_OPTS += --enable-util
 else
