From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Thu, 12 Mar 2015 16:12:26 +0100
Subject: [Buildroot] [PATCH v2 2/3] lame: Remove --enable-debug workaround.
In-Reply-To: <1426173147-27755-1-git-send-email-johan.oudinet@gmail.com>
References: <1426173147-27755-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <1426173147-27755-2-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is not needed since BR2_ENABLE_DEBUG does not set this flag
anymore.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/lame/lame.mk | 7 -------
 1 file changed, 7 deletions(-)

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
-- 
2.1.0
