From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jun 2021 09:15:32 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/libressl: fix
 openssldir setting to match openssl
Message-ID: <20210624065154.480DD8E065@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab13372ea656a26c9afb194768d9d5130d0392ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

libressl defaults to $prefix/etc/ssl for its "openssldir" setting, E.G.
the location where configuration files and certificates are searched:

openssl version -d
OPENSSLDIR: "/usr/etc/ssl"

Change it to /etc/ssl so it matches openssl and the expectations of packages
dealing with certificates (ca-certificates, libcurl, p11-kit)

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b0f0b4c4bc2fd1dd12c54ad555614f354d1b98dc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libressl/libressl.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index ad345ba3f0..d09df8f40f 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -10,6 +10,7 @@ LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code
 LIBRESSL_LICENSE_FILES = COPYING
 LIBRESSL_CPE_ID_VENDOR = openbsd
 LIBRESSL_INSTALL_STAGING = YES
+LIBRESSL_CONF_OPTS = -DOPENSSLDIR="/etc/ssl"
 
 ifeq ($(BR2_PACKAGE_LIBRESSL_BIN),)
 define LIBRESSL_REMOVE_BIN
