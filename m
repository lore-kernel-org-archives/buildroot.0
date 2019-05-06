From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  6 May 2019 20:30:02 +0200
Subject: [Buildroot] [PATCH 06/15] package/gcc: add support for gcc 9.1
In-Reply-To: <20190506183011.4856-1-romain.naour@gmail.com>
References: <20190506183011.4856-1-romain.naour@gmail.com>
Message-ID: <20190506183011.4856-7-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/gcc/Config.in.host | 8 ++++++++
 package/gcc/gcc.hash       | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 8e22a4c155..a9f8492399 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -64,10 +64,17 @@ config BR2_GCC_VERSION_7_X
 
 config BR2_GCC_VERSION_8_X
 	bool "gcc 8.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_9
 	# Broken or unsupported architectures
 	depends on !BR2_or1k
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
+config BR2_GCC_VERSION_9_X
+	bool "gcc 9.x"
+	# Broken or unsupported architectures
+	depends on !BR2_or1k
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
+
 endchoice
 
 # libcilkrts was introduced in gcc 4.9 (oldest gcc version we
@@ -83,6 +90,7 @@ config BR2_GCC_VERSION
 	default "6.5.0"     if BR2_GCC_VERSION_6_X
 	default "7.4.0"     if BR2_GCC_VERSION_7_X
 	default "8.3.0"     if BR2_GCC_VERSION_8_X
+	default "9.1.0"     if BR2_GCC_VERSION_9_X
 	default "arc-2018.09-release" if BR2_GCC_VERSION_ARC
 	default "or1k-musl-5.4.0-20170218" if BR2_GCC_VERSION_OR1K
 
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 4f1e7f932f..f2702c4ba6 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -8,6 +8,8 @@ sha512  ce046f9a50050fd54b870aab764f7db187fe7ea92eb4aaffb7c3689ca623755604e231f2
 sha512  8864d8e4b97c2e1a4f17422f6e68120172ebefeab97b1757734f7185ca68a6b9a89011c6833c03fa454c17b0ac35b15e1d284881e6971035948ac6100f3aa45e  gcc-7.4.0.tar.xz
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-8.3.0/sha512.sum
 sha512  1811337ae3add9680cec64968a2509d085b6dc5b6783fc1e8c295e3e47416196fd1a3ad8dfe7e10be2276b4f62c357659ce2902f239f60a8648548231b4b5802  gcc-8.3.0.tar.xz
+#  From ftp://gcc.gnu.org/pub/gcc/releases/gcc-9.1.0/sha512.sum
+sha512  b6134df027e734cee5395afd739fcfa4ea319a6017d662e54e89df927dea19d3fff7a6e35d676685383034e3db01c9d0b653f63574c274eeb15a2cb0bc7a1f28  gcc-9.1.0.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  4d12c3ac27b9de9c533be3b8964cf23d21bf6933b5073183e1affe714b0ff33f9d6169e3b55a5c505d7dae33c9bb4f8b0d110461e3a124182d8c8d51b66b8e45  gcc-arc-2018.09-release.tar.gz
-- 
2.14.5
