From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Jun 2015 16:25:06 +0200
Subject: [Buildroot] [git commit] lame: Remove --enable-debug workaround.
Message-ID: <20150605142606.E1DDF81E61@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b90c5d6f18c9823d7112249505d532572bc3080f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is not needed since BR2_ENABLE_DEBUG does not set this flag
anymore.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lame/lame.mk |    7 -------
 1 files changed, 0 insertions(+), 7 deletions(-)

diff --git a/package/lame/lame.mk b/package/lame/lame.mk
index e47e0af..dcd155f 100644
--- a/package/lame/lame.mk
+++ b/package/lame/lame.mk
@@ -14,13 +14,6 @@ LAME_CONF_OPTS = --enable-dynamic-frontends
 LAME_LICENSE = LGPLv2+
 LAME_LICENSE_FILES = COPYING
 
-# Building lame with debug symbols needs the following macros to be
-# defined: _FPU_MASK_IM, _FPU_MASK_ZM, _FPU_MASK_OM.
-# So, if BR2_ENABLE_DEBUG is selected, then we have force lame to be
-# built without debug symbols because a number of architectures don't
-# have those macros defined.
-LAME_CONF_OPTS += --disable-debug
-
 ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
 LAME_DEPENDENCIES += libsndfile
 LAME_CONF_OPTS += --with-fileio=sndfile
