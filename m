From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sat,  1 Feb 2020 11:56:40 +0100
Subject: [Buildroot] [PATCH] package/bluez-alsa: fix location of alsa config
 files
Message-ID: <20200201105640.8428-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since alsa-lib version 1.1.7 [1] the location for add-on config files
has changed.

In fact, the path for the alsa add-on config files has never been
correct set in the package (it should have been
`/usr/share/alsa/alsa.conf.d`).

With alsa-lib version 1.1.7 or later the correct path is
`/etc/alsa/conf.d`.

[1] https://github.com/alsa-project/alsa-lib/commit/93e03bdc2a3dcd5d12516f5de78e14d88a32ff2c

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/bluez-alsa/bluez-alsa.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bluez-alsa/bluez-alsa.mk b/package/bluez-alsa/bluez-alsa.mk
index c5a51ce5d4..7fed922a71 100644
--- a/package/bluez-alsa/bluez-alsa.mk
+++ b/package/bluez-alsa/bluez-alsa.mk
@@ -23,7 +23,7 @@ BLUEZ_ALSA_CONF_OPTS = \
 	--enable-aplay \
 	--disable-debug-time \
 	--with-alsaplugindir=/usr/lib/alsa-lib \
-	--with-alsaconfdir=/usr/share/alsa
+	--with-alsaconfdir=/etc/alsa/conf.d
 
 ifeq ($(BR2_PACKAGE_FDK_AAC),y)
 BLUEZ_ALSA_DEPENDENCIES += fdk-aac
-- 
2.25.0
