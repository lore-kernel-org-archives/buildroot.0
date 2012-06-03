From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  3 Jun 2012 16:04:44 +0200
Subject: [Buildroot] [PATCH 10/10] toolchain-external: on SuperH,
	use Sourcery CodeBench 2011.09 by default
In-Reply-To: <cover.1338732273.git.thomas.petazzoni@free-electrons.com>
References: <cover.1338732273.git.thomas.petazzoni@free-electrons.com>
Message-ID: <7a2800c2cb33d674a82e1396354225549458a708.1338732273.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The 2012.03 version of the x86 toolchain uses glibc 2.15, which
doesn't provide RPC functions. This breaks most packages for now,
until we package TI-RPC properly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index f632deb..c8c1f14 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -5,6 +5,10 @@ choice
 	# Don't use the latest Sourcery CodeBench on x86 by default,
 	# because it uses glibc 2.15, which lacks RPC functions.
 	default BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201109 if BR2_i386 || BR2_x86_64
+	# Don't use the latest Sourcery CodeBench on SuperH by
+	# default, because it uses glibc 2.15, which lacks RPC
+	# functions.
+	default BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103 if BR2_sh4a || BR2_sh4aeb
 
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_05
 	bool "Linaro 2012.05"
-- 
1.7.9.5
