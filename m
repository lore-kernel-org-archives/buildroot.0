From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 30 May 2021 20:24:39 +0300
Subject: [Buildroot] [PATCH next] package/libssh: openssl backend requires
 DES
Message-ID: <1af92899b25348964b506c229ae4b5c2e20771d3.1622395479.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make sure that openssl supports DES. The libssh openssl backend depends
on DES support.

Fixes:
http://autobuild.buildroot.net/results/faf773b9997d6504f32fe660d0d9b9c15a198aa5/
http://autobuild.buildroot.net/results/c3ebcbb9b5ff502e7acefb8b2426bd544913d415/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libssh/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libssh/Config.in b/package/libssh/Config.in
index cde73a0d872a..1f271a692ef8 100644
--- a/package/libssh/Config.in
+++ b/package/libssh/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LIBSSH
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_OPENSSL if !(BR2_PACKAGE_MBEDTLS || BR2_PACKAGE_LIBGCRYPT)
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	help
 	  libssh is a multiplatform C library implementing the SSHv2
 	  and SSHv1 protocol on client and server side. With libssh,
-- 
2.30.2
