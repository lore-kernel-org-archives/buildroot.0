From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 30 Dec 2019 13:42:00 +0100
Subject: [Buildroot] [git commit] package/libopenssl: make use of linux-x86
 for i386
Message-ID: <20191230123808.AC7158E79C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=03b39f7869859bbab692e7728af3009ed38998f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tested with:

BR2_x86_pentium4=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-i386-pentium4-full-2019.05.1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_4=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
BR2_PACKAGE_OPENSSL=y

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libopenssl/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libopenssl/Config.in b/package/libopenssl/Config.in
index 4bc32e06a9..5ca19b38f8 100644
--- a/package/libopenssl/Config.in
+++ b/package/libopenssl/Config.in
@@ -22,6 +22,7 @@ config BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH
 	default "linux-ppc"			if BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH_LINUX_PPC
 	default "linux-ppc64"			if BR2_powerpc64
 	default "linux-ppc64le"			if BR2_powerpc64le
+	default "linux-x86"			if BR2_i386
 	default "linux-x86_64"			if BR2_x86_64
 	# no-asm is needed with generic architectures such as
 	# linux-generic{32,64}, see
