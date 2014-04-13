From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Apr 2014 21:58:57 +0200
Subject: [Buildroot] [PATCH 3/4] toolchain: add option to declare toolchains
	affected by gcc PR 58595
In-Reply-To: <1397419138-8776-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1397419138-8776-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1397419138-8776-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-common.in          | 3 +++
 toolchain/toolchain-external/Config.in | 1 +
 2 files changed, 4 insertions(+)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index b65b227..f98f19b 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -11,6 +11,9 @@ config BR2_LARGEFILE
 config BR2_INET_IPV6
 	bool
 
+config BR2_TOOLCHAIN_HAS_GCC_BUG_58595
+	bool
+
 config BR2_TOOLCHAIN_HAS_GCC_BUG_58854
 	bool
 
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 9499629..7fb3175 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -89,6 +89,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201311
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_ARM_EABI
 	depends on !BR2_PREFER_STATIC_LIB
+	select BR2_TOOLCHAIN_HAS_GCC_BUG_58595 # based-on gcc-4.8.1
 	select BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # based-on gcc-4.8.1
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-- 
1.8.3.2
