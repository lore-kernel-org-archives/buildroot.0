From: spdawson at gmail.com <spdawson@gmail.com>
Date: Thu, 16 Jan 2014 07:37:46 +0000
Subject: [Buildroot] [PATCH] vlc: add libmodplug support
Message-ID: <1389857866-8318-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Commit 0a5d5240157f1df80d2457db2a153821f56997d8 added a libmodplug package
to Buildroot; this means that libmodplug support can now be enabled for the
vlc package.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/vlc/vlc.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 516876b..ce51f37 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -14,7 +14,6 @@ VLC_DEPENDENCIES = host-pkgconf
 VLC_CONF_OPT += \
 	--disable-a52 \
 	--disable-shout \
-	--disable-mod \
 	--disable-twolame \
 	--disable-dca \
 	--disable-dirac \
@@ -116,6 +115,13 @@ else
 VLC_CONF_OPT += --disable-mad
 endif
 
+ifeq ($(BR2_PACKAGE_LIBMODPLUG),y)
+VLC_CONF_OPT += --enable-mod
+VLC_DEPENDENCIES += libmodplug
+else
+VLC_CONF_OPT += --disable-mod
+endif
+
 ifeq ($(BR2_PACKAGE_LIBMPEG2),y)
 VLC_CONF_OPT += --enable-libmpeg2
 VLC_DEPENDENCIES += libmpeg2
-- 
1.8.3.2
