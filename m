From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 17:40:36 +0200
Subject: [Buildroot] [git commit] package/openldap: add support for libressl
Message-ID: <20180402154039.51B3F81096@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=da41a058e662cb98290c21441b5aebedab7d37c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Openldap builds fine with current libressl 2.7.2.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
