From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  2 Apr 2018 13:27:07 +0200
Subject: [Buildroot] [PATCH 2/2] package/openldap: add support for libressl
In-Reply-To: <20180402112707.19855-1-bernd.kuhls@t-online.de>
References: <20180402112707.19855-1-bernd.kuhls@t-online.de>
Message-ID: <20180402112707.19855-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Openldap builds fine with current libressl 2.7.2.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/openldap/openldap.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openldap/openldap.mk b/package/openldap/openldap.mk
index 6dd2390923..3f00f2b7df 100644
--- a/package/openldap/openldap.mk
+++ b/package/openldap/openldap.mk
@@ -12,9 +12,9 @@ OPENLDAP_LICENSE_FILES = LICENSE
 OPENLDAP_INSTALL_STAGING = YES
 OPENLDAP_DEPENDENCIES = host-pkgconf
 
-ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
 OPENLDAP_TLS = openssl
-OPENLDAP_DEPENDENCIES += libopenssl
+OPENLDAP_DEPENDENCIES += openssl
 else ifeq ($(BR2_PACKAGE_GNUTLS),y)
 OPENLDAP_TLS = gnutls
 OPENLDAP_DEPENDENCIES += gnutls
-- 
2.14.2
