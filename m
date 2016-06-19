From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Jun 2016 15:26:39 +0200
Subject: [Buildroot] [PATCH 4/5] package/lirc-tools: add optional support
	for alsa-lib
In-Reply-To: <1466342800-4980-1-git-send-email-bernd.kuhls@t-online.de>
References: <1466342800-4980-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1466342800-4980-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lirc-tools has optional support for alsa-lib, see configure.ac,
line 230+.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/lirc-tools/lirc-tools.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/lirc-tools/lirc-tools.mk b/package/lirc-tools/lirc-tools.mk
index 59d9f69..88ec2c9 100644
--- a/package/lirc-tools/lirc-tools.mk
+++ b/package/lirc-tools/lirc-tools.mk
@@ -21,6 +21,10 @@ ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 LIRC_TOOLS_DEPENDENCIES += udev
 endif
 
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+LIRC_TOOLS_DEPENDENCIES += alsa-lib
+endif
+
 ifeq ($(BR2_PACKAGE_LIBUSB_COMPAT),y)
 LIRC_TOOLS_DEPENDENCIES += libusb-compat
 endif
-- 
2.8.1
