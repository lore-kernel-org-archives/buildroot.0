From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 21:28:13 +0200
Subject: [Buildroot] [git commit] openldap: supports only the real OpenSSL,
	not LibreSSL
Message-ID: <20171021192125.A263381110@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dfa1817d31a9ad7c9e1c54e717a30c224ec36707
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

openldap will not build with LibreSSL without patches, so let's
support only OpenSSL.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openldap/openldap.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openldap/openldap.mk b/package/openldap/openldap.mk
index 90ff112..56066f9 100644
--- a/package/openldap/openldap.mk
+++ b/package/openldap/openldap.mk
@@ -12,8 +12,8 @@ OPENLDAP_LICENSE_FILES = LICENSE
 OPENLDAP_INSTALL_STAGING = YES
 OPENLDAP_DEPENDENCIES = host-pkgconf
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-OPENLDAP_TLS = openssl
+ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
+OPENLDAP_TLS = libopenssl
 OPENLDAP_DEPENDENCIES += openssl
 else ifeq ($(BR2_PACKAGE_GNUTLS),y)
 OPENLDAP_TLS = gnutls
