From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Mon, 27 Jan 2020 10:31:45 +0100
Subject: [Buildroot] [PATCH] package/bluez-alsa: bump to version 2.1.0
Message-ID: <20200127093145.22391-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also:
  * Conditionally enable support for integration with UPower D-Bus
    service if BR2_PACKAGE_UPOWER is selected
  * The copyright year was updated in the LICENSE file, therefore
    the hash value was also recalculated.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/bluez-alsa/bluez-alsa.hash | 4 ++--
 package/bluez-alsa/bluez-alsa.mk   | 9 ++++++++-
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/package/bluez-alsa/bluez-alsa.hash b/package/bluez-alsa/bluez-alsa.hash
index 37c4919f91..603a501d4f 100644
--- a/package/bluez-alsa/bluez-alsa.hash
+++ b/package/bluez-alsa/bluez-alsa.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256  451c99c2045a1ec1ffe0d054be4774fbd01af34d6d1a2757d346d02718381697  bluez-alsa-2.0.0.tar.gz
-sha256  45fe8648faa0e735d4aaf60c32ddd37fc7f027d34ccedcf0f69d8aa961b63b25  LICENSE
+sha256  6459f70e47e70b4c04a85acf148381e6c8a2e86bd638aff21870afc6c14b85b0  bluez-alsa-2.1.0.tar.gz
+sha256  60253922a459245128c34eb379cbda7c76936636d4c10edc576663a0f560dd4d  LICENSE
diff --git a/package/bluez-alsa/bluez-alsa.mk b/package/bluez-alsa/bluez-alsa.mk
index 5c07a1a5e8..c5a51ce5d4 100644
--- a/package/bluez-alsa/bluez-alsa.mk
+++ b/package/bluez-alsa/bluez-alsa.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BLUEZ_ALSA_VERSION = 2.0.0
+BLUEZ_ALSA_VERSION = 2.1.0
 BLUEZ_ALSA_SITE = $(call github,Arkq,bluez-alsa,v$(BLUEZ_ALSA_VERSION))
 BLUEZ_ALSA_LICENSE = MIT
 BLUEZ_ALSA_LICENSE_FILES = LICENSE
@@ -53,6 +53,13 @@ else
 BLUEZ_ALSA_CONF_OPTS += --disable-ofono
 endif
 
+# no build dependency, enables integration with UPower D-Bus service
+ifeq ($(BR2_PACKAGE_UPOWER),y)
+BLUEZ_ALSA_CONF_OPTS += --enable-upower
+else
+BLUEZ_ALSA_CONF_OPTS += --disable-upower
+endif
+
 ifeq ($(BR2_PACKAGE_BLUEZ_ALSA_HCITOP),y)
 BLUEZ_ALSA_DEPENDENCIES += libbsd ncurses
 BLUEZ_ALSA_CONF_OPTS += --enable-hcitop
-- 
2.25.0
