From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Oct 2020 11:06:03 +0100
Subject: [Buildroot] [git commit] package/mosquitto: add support for TLS
 with libressl
Message-ID: <20201025095356.660D685F5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7a49be66e19f74f7d615f23bc3fdd556815b67f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mosquitto nowadays works correctly with libressl, so allow that as the
openssl backend as well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mosquitto/mosquitto.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 5734dd45c5..fcd9cb7de9 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -48,8 +48,8 @@ else
 MOSQUITTO_MAKE_OPTS += WITH_THREADING=no
 endif
 
-ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
-MOSQUITTO_DEPENDENCIES += host-pkgconf libopenssl
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+MOSQUITTO_DEPENDENCIES += host-pkgconf openssl
 MOSQUITTO_MAKE_OPTS += \
 	WITH_TLS=yes \
 	CLIENT_STATIC_LDADD="`$(PKG_CONFIG_HOST_BINARY) --libs openssl`"
