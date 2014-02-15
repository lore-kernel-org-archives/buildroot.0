From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 15 Feb 2014 23:13:22 +0100
Subject: [Buildroot] [PATCH 1/2] vlc: explicitly disable opencv support
In-Reply-To: <1392502403-19701-1-git-send-email-s.martin49@gmail.com>
References: <1392502403-19701-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1392502403-19701-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

vlc can use opencv in video filters, but it requires a couple of
features enabled in opencv; so, simply force disabling opencv support.

Note that vlc does includes the legacy opencv/cv.h header, which pulls a
number of opencv's features (core, video, imgproc, ...).

Fixes:
  http://autobuild.buildroot.org/results/39c/39c77ffb5a5599d0b09422433c747b2bac185c4f/
  http://autobuild.buildroot.org/results/a79/a79b055da09e4d8ede263251df8461bc8a64569a/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/vlc/vlc.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index f235ff8..db99a3b 100644
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
-- 
1.8.5.4
