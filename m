From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 21:37:46 +0200
Subject: [Buildroot] [git commit] package/gcc: add support for gcc 9.1
Message-ID: <20190622194128.071C082807@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=089000eccf584d611ad1a8e5400436952450e883
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
[Thomas: don't allow gcc 9.x for powerpc spe]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/Config.in.host | 10 ++++++++++
 package/gcc/gcc.hash       |  2 ++
 2 files changed, 12 insertions(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index e451ed9ba9..758c843ffe 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -83,6 +83,15 @@ config BR2_GCC_VERSION_8_X
 	depends on !BR2_powerpc_SPE
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
+config BR2_GCC_VERSION_9_X
+	bool "gcc 9.x"
+	# Broken or unsupported architectures
+	depends on !BR2_or1k
+	# powerpc spe support has been deprecated since gcc 8.x.
+	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
+	depends on !BR2_powerpc_SPE
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
+
 endchoice
 
 # libcilkrts was introduced in gcc 4.9 (oldest gcc version we
@@ -98,6 +107,7 @@ config BR2_GCC_VERSION
 	default "6.5.0"     if BR2_GCC_VERSION_6_X
 	default "7.4.0"     if BR2_GCC_VERSION_7_X
 	default "8.3.0"     if BR2_GCC_VERSION_8_X
+	default "9.1.0"     if BR2_GCC_VERSION_9_X
 	default "arc-2019.03-release" if BR2_GCC_VERSION_ARC
 	default "or1k-musl-5.4.0-20170218" if BR2_GCC_VERSION_OR1K
 	default "48152afb96c59733d5bc79e3399bb7b3d4b44266" if BR2_GCC_VERSION_CSKY
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 3f68e6758f..91562aef1e 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -8,6 +8,8 @@ sha512  ce046f9a50050fd54b870aab764f7db187fe7ea92eb4aaffb7c3689ca623755604e231f2
 sha512  8864d8e4b97c2e1a4f17422f6e68120172ebefeab97b1757734f7185ca68a6b9a89011c6833c03fa454c17b0ac35b15e1d284881e6971035948ac6100f3aa45e  gcc-7.4.0.tar.xz
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-8.3.0/sha512.sum
 sha512  1811337ae3add9680cec64968a2509d085b6dc5b6783fc1e8c295e3e47416196fd1a3ad8dfe7e10be2276b4f62c357659ce2902f239f60a8648548231b4b5802  gcc-8.3.0.tar.xz
+#  From ftp://gcc.gnu.org/pub/gcc/releases/gcc-9.1.0/sha512.sum
+sha512  b6134df027e734cee5395afd739fcfa4ea319a6017d662e54e89df927dea19d3fff7a6e35d676685383034e3db01c9d0b653f63574c274eeb15a2cb0bc7a1f28  gcc-9.1.0.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  c3f63fb601140f92d2dbef96b2dcc025ef754d2f049bfcc3d33e746c7b218b5138f2d8768cd580134858a8d347d234cf3ead276638f6de409f8f07c986e136b6  gcc-arc-2019.03-release.tar.gz
