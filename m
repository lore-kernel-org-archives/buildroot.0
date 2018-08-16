From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Aug 2018 11:59:42 +0200
Subject: [Buildroot] [git commit branch/next] package/vlc: add optional
 dependency to x264
Message-ID: <20180816113141.1CC238D213@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dcb16c74daf2f9b6a2ab9bcc7f5a5ac1f4f0548b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vlc/vlc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 5e5230edc9..bc20e2946e 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -409,6 +409,13 @@ else
 VLC_CONF_OPTS += --disable-udev
 endif
 
+ifeq ($(BR2_PACKAGE_X264),y)
+VLC_CONF_OPTS += --enable-x264
+VLC_DEPENDENCIES += x264
+else
+VLC_CONF_OPTS += --disable-x264
+endif
+
 ifeq ($(BR2_PACKAGE_XCB_UTIL_KEYSYMS),y)
 VLC_CONF_OPTS += --enable-xcb
 VLC_DEPENDENCIES += xcb-util-keysyms
