From: Romain Naour <romain.naour@gmail.com>
Date: Wed,  8 May 2019 17:07:11 +0200
Subject: [Buildroot] [PATCH v2 06/15] arch: add BR2_ARCH_NEEDS_GCC_AT_LEAST_9
In-Reply-To: <20190508150720.27946-1-romain.naour@gmail.com>
References: <20190508150720.27946-1-romain.naour@gmail.com>
Message-ID: <20190508150720.27946-7-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new symbol will be used by architectures introduced with gcc 9 and
by external toolchains based on gcc 9.

[1] https://gcc.gnu.org/gcc-9/changes.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 arch/Config.in             | 4 ++++
 package/gcc/Config.in.host | 1 +
 2 files changed, 5 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index d82803c828..051d4cdab7 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -302,6 +302,10 @@ config BR2_ARCH_NEEDS_GCC_AT_LEAST_8
 	bool
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 
+config BR2_ARCH_NEEDS_GCC_AT_LEAST_9
+	bool
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_8
+
 # The following string values are defined by the individual
 # Config.in.$ARCH files
 config BR2_ARCH
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 760225f7d9..a9f8492399 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -64,6 +64,7 @@ config BR2_GCC_VERSION_7_X
 
 config BR2_GCC_VERSION_8_X
 	bool "gcc 8.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_9
 	# Broken or unsupported architectures
 	depends on !BR2_or1k
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
-- 
2.14.5
