From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 Feb 2014 09:02:19 +0100
Subject: [Buildroot] [git commit] vlc: explicitly disable opencv support
Message-ID: <20140217080317.2D35E9C92F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8e63d54e2ad7846f17f67079be8262f1deab7b7a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

vlc can use opencv in video filters, but it requires a couple of
features enabled in opencv; so, simply force disabling opencv support.

Note that vlc does includes the legacy opencv/cv.h header, which pulls a
number of opencv's features (core, video, imgproc, ...).

Fixes:
  http://autobuild.buildroot.org/results/39c/39c77ffb5a5599d0b09422433c747b2bac185c4f/
  http://autobuild.buildroot.org/results/a79/a79b055da09e4d8ede263251df8461bc8a64569a/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vlc/vlc.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 6169514..0e76e11 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -30,7 +30,8 @@ VLC_CONF_OPT += \
 	--disable-goom \
 	--disable-projectm \
 	--disable-vsxu \
-	--disable-mtp
+	--disable-mtp \
+	--without-opencv
 
 # Set powerpc altivec appropriately
 ifeq ($(BR2_powerpc_7400)$(BR2_powerpc_7450)$(BR2_powerpc_970),y)
