From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 31 Jul 2014 02:16:48 +0200
Subject: [Buildroot] [PATCH 13/14 v4] [RFC] package/vlc: needs libudev,
	not a udev daemon
In-Reply-To: <cover.1406765723.git.yann.morin.1998@free.fr>
References: <cover.1406765723.git.yann.morin.1998@free.fr>
Message-ID: <e5a790827ff9d3db18b2bc1a46674da0e9b7e4c5.1406765723.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

vlc is happy enough with just a libudev, and does
not require a udev daemon.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/vlc/vlc.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 6c4677a..11e157e 100644
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
1.9.1
