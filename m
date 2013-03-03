From: Baruch Siach <baruch@tkos.co.il>
Date: Sun,  3 Mar 2013 10:55:44 +0200
Subject: [Buildroot] [PATCH] wireshark: explicitly disable libsmi
Message-ID: <e3a671643f7a6f4508e3abeec73ae3bec032834f.1362300524.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

wireshark's libsmi detection is not cross compile friendly. We don't have
libsmi in Buildroot yet anyway, so just disable support for it in wireshark.

Fixes
http://autobuild.buildroot.net/results/0daaa3dd74315ac901920e7daf89620ef4c088a0

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/wireshark/wireshark.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
1.7.10.4
