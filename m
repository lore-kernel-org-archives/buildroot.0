From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 27 Sep 2014 18:29:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/openssl: drop libdl from more pc
	files
Message-ID: <1411835343-32736-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a follow-up patch for
http://git.buildroot.net/buildroot/commit/package/openssl/openssl.mk?id=c130c5d4635e2a4c7338161953152faf8fca07c4

Fixes
http://autobuild.buildroot.net/results/358/35899961b6dc01c1522b17f63946da5ab809bff8/
http://autobuild.buildroot.net/results/c86/c865214e74dd3766b6343ef73c666fa89c0b5dec/
http://autobuild.buildroot.net/results/fc1/fc12e88fb789e2b68d427c37f39789954309b05d/
http://autobuild.buildroot.net/results/f4d/f4deef4e7d2e2cf5fbc9ce5f02289b4dc60cd23b/
http://autobuild.buildroot.net/results/dfd/dfd81f1f1f0f315317b2a85d24b286a277ac7c16/
http://autobuild.buildroot.net/results/918/9188fc9a63d880cac28c5a9a246ca5504dd11bb2/
http://autobuild.buildroot.net/results/dd1/dd1c326345f8f9c8b5838601ace19002f5360bb2/
http://autobuild.buildroot.net/results/27b/27b4544c59166a9f40092403ed3f530190544a82/
http://autobuild.buildroot.net/results/c37/c37022e334d763bad2a59f7311b93504a569b2dd/
http://autobuild.buildroot.net/results/e89/e89265937a6b4808b817be16bcab79bae4a9aed1/
http://autobuild.buildroot.net/results/4a2/4a222a40d627fda6e49714b13b4321d62c9c2e51/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/openssl/openssl.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 4911034..4800bea 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -118,6 +118,8 @@ endef
 # libdl has no business in a static build
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
 define OPENSSL_FIXUP_STATIC_PKGCONFIG
+	$(SED) 's/-ldl//' $(STAGING_DIR)/usr/lib/pkgconfig/libcrypto.pc
+	$(SED) 's/-ldl//' $(STAGING_DIR)/usr/lib/pkgconfig/libssl.pc
 	$(SED) 's/-ldl//' $(STAGING_DIR)/usr/lib/pkgconfig/openssl.pc
 endef
 OPENSSL_POST_INSTALL_STAGING_HOOKS += OPENSSL_FIXUP_STATIC_PKGCONFIG
-- 
1.7.10.4
