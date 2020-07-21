From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Jul 2020 09:32:04 +0200
Subject: [Buildroot] [git commit] package/libzip: add mbedtls optional
 dependency
Message-ID: <20200721072745.DC68987B4D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e2cfc784b7357cde4f4e5c8549edc6d23d2474de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mbedtls is available (and enabled by default) since version 1.5.2 and
https://github.com/nih-at/libzip/commit/8e01a4fe8fa830c973b6a00f0da1e8b01789529a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libzip/libzip.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libzip/libzip.mk b/package/libzip/libzip.mk
index 6023dbec1b..9d64db32fa 100644
--- a/package/libzip/libzip.mk
+++ b/package/libzip/libzip.mk
@@ -27,6 +27,13 @@ else
 LIBZIP_CONF_OPTS += -DENABLE_GNUTLS=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_MBEDTLS),y)
+LIBZIP_DEPENDENCIES += mbedtls
+LIBZIP_CONF_OPTS += -DENABLE_MBEDTLS=ON
+else
+LIBZIP_CONF_OPTS += -DENABLE_MBEDTLS=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBZIP_DEPENDENCIES += openssl
 LIBZIP_CONF_OPTS += -DENABLE_OPENSSL=ON
