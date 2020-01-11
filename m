From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jan 2020 15:29:13 +0100
Subject: [Buildroot] [git commit] package/asterisk: add bluez5_utils
 optional dependency
Message-ID: <20200111142228.1AF498A3C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dd3d7d18066c0292aa729e56fd8537d62568eb70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/asterisk/asterisk.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 00070aadba..bfdcb49e8f 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -139,6 +139,9 @@ endif
 ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
 ASTERISK_DEPENDENCIES += bluez_utils
 ASTERISK_CONF_OPTS += --with-bluetooth
+else ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
+ASTERISK_DEPENDENCIES += bluez5_utils
+ASTERISK_CONF_OPTS += --with-bluetooth
 else
 ASTERISK_CONF_OPTS += --without-bluetooth
 endif
