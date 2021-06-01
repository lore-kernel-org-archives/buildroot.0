From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 1 Jun 2021 23:17:00 +0200
Subject: [Buildroot] [git commit] package/libssh: openssl backend requires
 DES
Message-ID: <20210607144659.3366F814BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0f1083bf21edc990c97db05ef5dd71ce453bceef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make sure that openssl supports DES. The libssh openssl backend depends
on DES support.

Fixes:
http://autobuild.buildroot.net/results/faf773b9997d6504f32fe660d0d9b9c15a198aa5/
http://autobuild.buildroot.net/results/c3ebcbb9b5ff502e7acefb8b2426bd544913d415/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libssh/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libssh/Config.in b/package/libssh/Config.in
index cde73a0d87..1f271a692e 100644
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
