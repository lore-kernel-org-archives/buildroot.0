From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Nov 2013 18:57:30 +0100
Subject: [Buildroot] [PATCH 1/3] toolchain-buildroot: glibc and eglibc
	support is no longer experimental
In-Reply-To: <1384192652-4203-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1384192652-4203-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1384192652-4203-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The glibc and eglibc support has been introduced since a little bit of
time now, I believe we can remove the "experimental" statement next to
it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-buildroot/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 0ebbd6c..5111c74 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -16,7 +16,7 @@ config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 	  http://uclibc.org
 
 config BR2_TOOLCHAIN_BUILDROOT_EGLIBC
-	bool "eglibc (experimental)"
+	bool "eglibc"
 	depends on BR2_arm    || BR2_armeb    || BR2_aarch64 || \
 		   BR2_i386   || BR2_mips     || BR2_mipsel  || \
 		   BR2_mips64 || BR2_mips64el || BR2_powerpc || \
@@ -36,7 +36,7 @@ config BR2_TOOLCHAIN_BUILDROOT_EGLIBC
 	  http://eglibc.org
 
 config BR2_TOOLCHAIN_BUILDROOT_GLIBC
-	bool "glibc (experimental)"
+	bool "glibc"
 	depends on BR2_arm    || BR2_armeb    || BR2_aarch64 || \
 		   BR2_i386   || BR2_mips     || BR2_mipsel  || \
 		   BR2_mips64 || BR2_mips64el || BR2_powerpc || \
-- 
1.8.1.2
