From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Jun 2016 15:26:40 +0200
Subject: [Buildroot] [PATCH 5/5] package/lirc-tools: add optional support
	for portaudio
In-Reply-To: <1466342800-4980-1-git-send-email-bernd.kuhls@t-online.de>
References: <1466342800-4980-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1466342800-4980-5-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lirc-tools has optional support for portaudio, see configure.ac,
line 218+.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/lirc-tools/lirc-tools.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/lirc-tools/lirc-tools.mk b/package/lirc-tools/lirc-tools.mk
index 88ec2c9..69861ab 100644
--- a/package/lirc-tools/lirc-tools.mk
+++ b/package/lirc-tools/lirc-tools.mk
@@ -29,6 +29,10 @@ ifeq ($(BR2_PACKAGE_LIBUSB_COMPAT),y)
 LIRC_TOOLS_DEPENDENCIES += libusb-compat
 endif
 
+ifeq ($(BR2_PACKAGE_PORTAUDIO),y)
+LIRC_TOOLS_DEPENDENCIES += portaudio
+endif
+
 define LIRC_TOOLS_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/lirc-tools/S25lircd \
 		$(TARGET_DIR)/etc/init.d/S25lircd
-- 
2.8.1
