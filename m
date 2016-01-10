From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 10 Jan 2016 21:59:25 +0100
Subject: [Buildroot] [PATCH v5 09/29] package/freeswitch: add optional
	dependency to freetype
In-Reply-To: <1452459585-7085-1-git-send-email-bernd.kuhls@t-online.de>
References: <1452459585-7085-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1452459585-7085-10-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/freeswitch/freeswitch.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 5cab5cc..3a847fa 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -124,6 +124,10 @@ else
 FREESWITCH_CONF_OPTS += --disable-zrtp
 endif
 
+ifeq ($(BR2_PACKAGE_FREETYPE),y)
+FREESWITCH_DEPENDENCIES += freetype
+endif
+
 ifeq ($(BR2_PACKAGE_LIBEDIT),y)
 FREESWITCH_DEPENDENCIES += libedit
 FREESWITCH_CONF_OPTS += --enable-core-libedit-support
-- 
2.6.4
