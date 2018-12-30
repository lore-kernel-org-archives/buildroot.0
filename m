From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 16:29:13 +0100
Subject: [Buildroot] [git commit] package/msmtp: fix configure with
 openssl/gnutls
Message-ID: <20181230152441.5D7DE815B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4ab484444f30a1323580b8e43913ea2a91887907
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the bump of msmtp from 1.6.6 to 1.8.0 in commit
b68ad1b2d0d1c290489e0b4e1afec46b8220a8b9 ("msmtp: bump to version
1.8.0"), the configure option to select the SSL/TLS implementation is
no longer --with-ssl, but --with-tls.

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
[Thomas: improve commit log]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/msmtp/msmtp.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
index a495072abf..a26de92ef9 100644
--- a/package/msmtp/msmtp.mk
+++ b/package/msmtp/msmtp.mk
@@ -41,17 +41,17 @@ MSMTP_CONF_OPTS += --without-libsecret
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-MSMTP_CONF_OPTS += --with-ssl=openssl
+MSMTP_CONF_OPTS += --with-tls=openssl
 MSMTP_DEPENDENCIES += openssl
 ifeq ($(BR2_STATIC_LIBS),y)
 # openssl uses zlib, so we need to explicitly link with it when static
 MSMTP_CONF_ENV += LIBS=-lz
 endif
 else ifeq ($(BR2_PACKAGE_GNUTLS),y)
-MSMTP_CONF_OPTS += --with-ssl=gnutls
+MSMTP_CONF_OPTS += --with-tls=gnutls
 MSMTP_DEPENDENCIES += gnutls
 else
-MSMTP_CONF_OPTS += --with-ssl=no
+MSMTP_CONF_OPTS += --with-tls=no
 endif
 
 $(eval $(autotools-package))
