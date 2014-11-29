From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Sat, 29 Nov 2014 10:12:39 +0100
Subject: [Buildroot] [PATCH v2 2/3] libz160: fix dependencies
In-Reply-To: <1417252360-10929-1-git-send-email-jezz@sysmic.org>
References: <1417252360-10929-1-git-send-email-jezz@sysmic.org>
Message-ID: <1417252360-10929-3-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libz160 is provided as binary. We need EABI toolchain with glibc to use
it.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/freescale-imx/libz160/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/freescale-imx/libz160/Config.in b/package/freescale-imx/libz160/Config.in
index f956cce..f4abcc5 100644
--- a/package/freescale-imx/libz160/Config.in
+++ b/package/freescale-imx/libz160/Config.in
@@ -1,5 +1,11 @@
 config BR2_PACKAGE_LIBZ160
 	bool "libz160"
+	depends on BR2_ARM_EABI
+	depends on BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  An API for user space programs to perform 2D accelerated graphics
 	  operations on AMD GPU (included for examples in iMX5x chipsets)
+
+comment "libz160 needs an EABI toolchain w/ (e)glibc"
+	depends on BR2_arm
+	depends on (!BR2_ARM_EABI || !BR2_TOOLCHAIN_USES_GLIBC)
-- 
1.9.1
