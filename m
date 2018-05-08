From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  8 May 2018 18:05:19 +0300
Subject: [Buildroot] [PATCH 3/3] toolchain: remove
 BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
In-Reply-To: <ea3c437cb4b462525feff0325c137d4b27717422.1525791919.git.baruch@tkos.co.il>
References: <ea3c437cb4b462525feff0325c137d4b27717422.1525791919.git.baruch@tkos.co.il>
Message-ID: <d73fb1142b95cdae722636c94d9f8e8bd4f40506.1525791919.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit b9882925a4 (toolchain: introduce
BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS) added this symbol to identify
Blackfin toolchains without shadow passwords support. We no longer
support Blackfin.

Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 toolchain/Config.in                                          | 5 -----
 .../toolchain-external-custom/Config.in.options              | 3 ---
 2 files changed, 8 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 121ddb4fa49a..77f95ee1c32c 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -15,7 +15,6 @@ config BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 	select BR2_TOOLCHAIN_SUPPORTS_PIE
 
 config BR2_TOOLCHAIN_USES_UCLIBC
@@ -43,7 +42,6 @@ choice
 config BR2_TOOLCHAIN_BUILDROOT
 	bool "Buildroot toolchain"
 	depends on BR2_ARCH_HAS_TOOLCHAIN_BUILDROOT
-	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 
 config BR2_TOOLCHAIN_EXTERNAL
 	bool "External toolchain"
@@ -108,9 +106,6 @@ config BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 config BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	bool
 
-config BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
-	bool
-
 config BR2_TOOLCHAIN_HAS_SSP
 	bool
 
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 65d94d0adfd8..55370e967a37 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -277,9 +277,6 @@ choice
 config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
 	bool "uClibc/uClibc-ng"
 	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
-	# For the time being, we assume that all custom external
-	# toolchains have shadow password support.
-	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 	help
 	  Select this option if your external toolchain uses the
 	  uClibc (available from http://www.uclibc.org/)
-- 
2.17.0
