From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 4 Mar 2013 12:23:40 +0100
Subject: [Buildroot] [git commit] wireshark: explicitly disable libsmi
Message-ID: <20130304112555.AFF2F9AE7E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6afbd13c2a22783d6815b0b58e604646375da1a7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

wireshark's libsmi detection is not cross compile friendly. We don't have
libsmi in Buildroot yet anyway, so just disable support for it in wireshark.

Fixes
http://autobuild.buildroot.net/results/0daaa3dd74315ac901920e7daf89620ef4c088a0

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/wireshark/wireshark.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 2e89987..c9fb44b 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -17,7 +17,7 @@ WIRESHARK_CONF_ENV = LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config \
 # wireshark adds -I$includedir to CFLAGS, causing host/target headers mixup.
 # Work around it by pointing includedir at staging
 WIRESHARK_CONF_OPT = --disable-wireshark --without-krb5 --disable-usr-local \
-		     --enable-static=no --with-gnutls=no \
+		     --enable-static=no --with-gnutls=no --with-libsmi=no \
 		     --includedir=$(STAGING_DIR)/usr/include
 
 $(eval $(call autotools-package))
