From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 30 Dec 2019 13:41:57 +0100
Subject: [Buildroot] [git commit] package/libopenssl: make use of
 linux-generic64 for 64-bit archs
Message-ID: <20191230123808.967538E75C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ebb35ee5fb7bd5e6278a84ac2c18aa0a38056fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It was tested with:

BR2_mips64el=y
BR2_MIPS_NABI64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mips64-n64-full-2019.05.1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
BR2_PACKAGE_OPENSSL=y

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libopenssl/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libopenssl/Config.in b/package/libopenssl/Config.in
index 732da5b4ef..4bc32e06a9 100644
--- a/package/libopenssl/Config.in
+++ b/package/libopenssl/Config.in
@@ -24,6 +24,7 @@ config BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH
 	default "linux-ppc64le"			if BR2_powerpc64le
 	default "linux-x86_64"			if BR2_x86_64
 	# no-asm is needed with generic architectures such as
-	# linux-generic32, see
+	# linux-generic{32,64}, see
 	# https://github.com/openssl/openssl/issues/9839
+	default "linux-generic64 no-asm"	if BR2_ARCH_IS_64
 	default "linux-generic32 no-asm"
