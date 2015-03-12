From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Thu, 12 Mar 2015 16:12:27 +0100
Subject: [Buildroot] [PATCH v2 3/3] mp4v2: Remove --disable-debug workaround.
In-Reply-To: <1426173147-27755-1-git-send-email-johan.oudinet@gmail.com>
References: <1426173147-27755-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <1426173147-27755-3-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is not needed since BR2_ENABLE_DEBUG does not set this flag
anymore.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/mp4v2/mp4v2.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/mp4v2/mp4v2.mk b/package/mp4v2/mp4v2.mk
index 5d38116..1da5bc3 100644
--- a/package/mp4v2/mp4v2.mk
+++ b/package/mp4v2/mp4v2.mk
@@ -16,12 +16,6 @@ MP4V2_LICENSE_FILES = COPYING
 # disable it
 MP4V2_CONF_ENV = ac_cv_prog_FOUND_HELP2MAN=no
 
-# infrastructure passes --disable-debug if !BR2_ENABLE_DEBUG. With
-# mpv42 the only thing this option does is that it tries to strip any
-# -g* options from CFLAGS/CXXFLAGS. The logic to do so is
-# unfortunately buggy, so just pass --enable-debug to disable this
-MP4V2_CONF_OPTS = --enable-debug
-
 ifeq ($(BR2_LARGEFILE),y)
 MP4V2_CONF_OPTS += --enable-largefile
 else
-- 
2.1.0
