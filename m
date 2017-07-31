From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 31 Jul 2017 08:08:05 -0400
Subject: [Buildroot] [PATCH v2 05/14] libsrtp: support libressl
In-Reply-To: <20170731120815.5315-1-aduskett@gmail.com>
References: <20170731120815.5315-1-aduskett@gmail.com>
Message-ID: <20170731120815.5315-5-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v2:
  - None.

 package/libsrtp/libsrtp.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libsrtp/libsrtp.mk b/package/libsrtp/libsrtp.mk
index 9e72856c4..e1527da0c 100644
--- a/package/libsrtp/libsrtp.mk
+++ b/package/libsrtp/libsrtp.mk
@@ -28,6 +28,9 @@ LIBSRTP_DEPENDENCIES = host-pkgconf
 ifeq ($(BR2_PACKAGE_OPENSSL)x$(BR2_STATIC_LIBS),yx)
 LIBSRTP_DEPENDENCIES += openssl
 LIBSRTP_CONF_OPTS += --enable-openssl
+else ifeq ($(BR2_PACKAGE_LIBRESSL)x$(BR2_STATIC_LIBS),yx)
+LIBSRTP_DEPENDENCIES += libressl
+LIBSRTP_CONF_OPTS += --enable-openssl
 else
 LIBSRTP_CONF_OPTS += --disable-openssl
 endif
-- 
2.13.3
