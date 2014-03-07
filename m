From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Mar 2014 22:37:24 +0100
Subject: [Buildroot] [git commit] vlc: update opencv disabling flag
Message-ID: <20140307213735.B61A09BE0A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1f646d71e40b697de9c8d3ac9985a02d2a878e8a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch completes the commit d7f13e500e5970577e7abd96a0e9254a1e8f643f
turning --{with,without}- options in --{enable,disable}- options.

Fixes:
  http://autobuild.buildroot.net/results/a34/a34abdcc92a6b2cf976760d66adf6c7572743bb4/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vlc/vlc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index e6d0ded..a9ee620 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -42,7 +42,7 @@ VLC_CONF_OPT += \
 	--disable-projectm \
 	--disable-vsxu \
 	--disable-mtp \
-	--without-opencv
+	--disable-opencv
 
 # Building static and shared doesn't work, so force static off.
 ifeq ($(BR2_PREFER_STATIC_LIB),)
