From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 19 Jul 2014 15:56:24 +0200
Subject: [Buildroot] [PATCH 17/20 v3] package/vlc: needs libudev,
	not a udev daemon
In-Reply-To: <cover.1405777634.git.yann.morin.1998@free.fr>
References: <cover.1405777634.git.yann.morin.1998@free.fr>
Message-ID: <d24ff96ecb96e9cfd27766ffe0925298a4bd8240.1405777634.git.yann.morin.1998@free.fr>
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
