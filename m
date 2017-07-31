From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 31 Jul 2017 08:08:14 -0400
Subject: [Buildroot] [PATCH v2 14/14] sngrep: support libressl
In-Reply-To: <20170731120815.5315-1-aduskett@gmail.com>
References: <20170731120815.5315-1-aduskett@gmail.com>
Message-ID: <20170731120815.5315-14-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v2:
  - None.

 package/sngrep/sngrep.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/sngrep/sngrep.mk b/package/sngrep/sngrep.mk
index 67ef882e2..2d2d1e904 100644
--- a/package/sngrep/sngrep.mk
+++ b/package/sngrep/sngrep.mk
@@ -20,6 +20,9 @@ SNGREP_CONF_OPTS += --disable-unicode
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 SNGREP_DEPENDENCIES += openssl
 SNGREP_CONF_OPTS += --with-openssl --without-gnutls
+else ifeq ($(BR2_PACKAGE_LIBRESSL),y)
+SNGREP_DEPENDENCIES += libressl
+SNGREP_CONF_OPTS += --with-openssl --without-gnutls
 # gnutls support also requires libgcrypt
 else ifeq ($(BR2_PACKAGE_GNUTLS)$(BR2_PACKAGE_LIBGCRYPT),yy)
 SNGREP_DEPENDENCIES += gnutls
-- 
2.13.3
