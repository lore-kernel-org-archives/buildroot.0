From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Jun 2016 15:26:37 +0200
Subject: [Buildroot] [PATCH 2/5] package/lirc-tools: add optional support
	for libusb-compat
In-Reply-To: <1466342800-4980-1-git-send-email-bernd.kuhls@t-online.de>
References: <1466342800-4980-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1466342800-4980-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lirc-tools has optional support for libusb-compat, see configure.ac,
line 199+.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/lirc-tools/lirc-tools.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/lirc-tools/lirc-tools.mk b/package/lirc-tools/lirc-tools.mk
index 89a29d5..20d0912 100644
--- a/package/lirc-tools/lirc-tools.mk
+++ b/package/lirc-tools/lirc-tools.mk
@@ -17,6 +17,10 @@ LIRC_TOOLS_AUTORECONF = YES
 LIRC_TOOLS_CONF_ENV = XSLTPROC=yes
 LIRC_TOOLS_CONF_OPTS = --without-x
 
+ifeq ($(BR2_PACKAGE_LIBUSB_COMPAT),y)
+LIRC_TOOLS_DEPENDENCIES += libusb-compat
+endif
+
 define LIRC_TOOLS_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/lirc-tools/S25lircd \
 		$(TARGET_DIR)/etc/init.d/S25lircd
-- 
2.8.1
