From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 14 Jul 2017 14:15:37 -0400
Subject: [Buildroot] [PATCH 15/15] sngrep: support libressl
In-Reply-To: <20170714181537.17479-1-aduskett@gmail.com>
References: <20170714181537.17479-1-aduskett@gmail.com>
Message-ID: <20170714181537.17479-15-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/sngrep/sngrep.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/sngrep/sngrep.mk b/package/sngrep/sngrep.mk
index 9b6240875..1d502c734 100644
--- a/package/sngrep/sngrep.mk
+++ b/package/sngrep/sngrep.mk
@@ -24,6 +24,9 @@ endif
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
2.13.0
