From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Oct 2014 13:46:22 -0700
Subject: [Buildroot] [PATCH 14/15 v6] [RFC] package/vlc: needs libudev,
	not a udev daemon
In-Reply-To: <cover.1414442699.git.yann.morin.1998@free.fr>
References: <cover.1414442699.git.yann.morin.1998@free.fr>
Message-ID: <fdd247200872a36e40026aa4f58e0f7b555ece17.1414442699.git.yann.morin.1998@free.fr>
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
index 7e81d59..5bcd705 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -288,9 +288,9 @@ else
 VLC_CONF_OPTS += --disable-tremor
 endif
 
-ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+ifeq ($(BR2_PACKAGE_HAS_LIBUDEV),y)
 VLC_CONF_OPTS += --enable-udev
-VLC_DEPENDENCIES += udev
+VLC_DEPENDENCIES += libudev
 else
 VLC_CONF_OPTS += --disable-udev
 endif
-- 
1.9.1
