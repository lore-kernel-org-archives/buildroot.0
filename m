From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Jun 2014 01:02:41 +0200
Subject: [Buildroot] [PATCH 17/20 RFC] package/vlc: needs libudev,
	not a udev daemon
In-Reply-To: <cover.1402699915.git.yann.morin.1998@free.fr>
References: <cover.1402699915.git.yann.morin.1998@free.fr>
Message-ID: <97d2b27540daf8dc79139d2e9ef3f1dc964925a3.1402699915.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

vlc is happy enough with just a libudev, and does
not require a udev daemon.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/vlc/vlc.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 6eb7eea..cc06818 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -284,9 +284,9 @@ else
 VLC_CONF_OPT += --disable-tremor
 endif
 
-ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+ifeq ($(BR2_PACKAGE_HAS_LIBUDEV),y)
 VLC_CONF_OPT += --enable-udev
-VLC_DEPENDENCIES += udev
+VLC_DEPENDENCIES += libudev
 else
 VLC_CONF_OPT += --disable-udev
 endif
-- 
1.8.3.2
