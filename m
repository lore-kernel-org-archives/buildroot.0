From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 12 Jun 2021 11:40:13 +0200
Subject: [Buildroot] [PATCH 4/6] arch: add BR2_ARCH_NEEDS_GCC_AT_LEAST_11
In-Reply-To: <20210612094015.6792-1-romain.naour@gmail.com>
References: <20210612094015.6792-1-romain.naour@gmail.com>
Message-ID: <20210612094015.6792-4-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new symbol will be used by architectures introduced with gcc 11.

[1] https://gcc.gnu.org/gcc-11/changes.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 arch/Config.in             | 4 ++++
 package/gcc/Config.in.host | 1 +
 2 files changed, 5 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index 155403c363..1853e26bb4 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -321,6 +321,10 @@ config BR2_ARCH_NEEDS_GCC_AT_LEAST_10
 	bool
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
 
+config BR2_ARCH_NEEDS_GCC_AT_LEAST_11
+	bool
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_10
+
 # The following string values are defined by the individual
 # Config.in.$ARCH files
 config BR2_ARCH
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index a89d92bf61..5d66834301 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -41,6 +41,7 @@ config BR2_GCC_VERSION_9_X
 
 config BR2_GCC_VERSION_10_X
 	bool "gcc 10.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_11
 	# powerpc spe support has been deprecated since gcc 8.x.
 	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
 	depends on !BR2_powerpc_SPE
-- 
2.31.1
