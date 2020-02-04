From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Feb 2020 22:48:22 +0100
Subject: [Buildroot] [git commit] package/bluez-alsa: fix location of alsa
 config files
Message-ID: <20200204214142.EB3AB8B81B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4e36111dbcefee516325728375190a33fc63a7b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since alsa-lib version 1.1.7 [1] the location for add-on config files
has changed.

In fact, the path for the alsa add-on config files has never been
correct set in the package (it should have been
`/usr/share/alsa/alsa.conf.d`).

With alsa-lib version 1.1.7 or later the correct path is
`/etc/alsa/conf.d`.

[1] https://github.com/alsa-project/alsa-lib/commit/93e03bdc2a3dcd5d12516f5de78e14d88a32ff2c

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bluez-alsa/bluez-alsa.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bluez-alsa/bluez-alsa.mk b/package/bluez-alsa/bluez-alsa.mk
index 6726298f5b..d5cb3ed67b 100644
--- a/package/bluez-alsa/bluez-alsa.mk
+++ b/package/bluez-alsa/bluez-alsa.mk
@@ -17,7 +17,7 @@ BLUEZ_ALSA_CONF_OPTS = \
 	--enable-aplay \
 	--disable-debug-time \
 	--with-alsaplugindir=/usr/lib/alsa-lib \
-	--with-alsaconfdir=/usr/share/alsa
+	--with-alsaconfdir=/etc/alsa/conf.d
 
 ifeq ($(BR2_PACKAGE_FDK_AAC),y)
 BLUEZ_ALSA_DEPENDENCIES += fdk-aac
