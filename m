From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 22 Nov 2012 01:18:00 +0100
Subject: [Buildroot] [PATCH 10/33] ltp-testsuite: add warning about bessel
	function support if uclibc toolchain
In-Reply-To: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1353543503-8952-11-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/ltp-testsuite/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
index 86aa4fb..30ba70f 100644
--- a/package/ltp-testsuite/Config.in
+++ b/package/ltp-testsuite/Config.in
@@ -1,3 +1,7 @@
+comment "Note that ltp-testsuite needs a uclibc toolchain with DO_XSI_MATH (bessel functions) enabled"
+	depends on BR2_PACKAGE_LTP_TESTSUITE
+	depends on BR2_TOOLCHAIN_BUILDROOT || BR2_TOOLCHAIN_EXTERNAL_UCLIBC || BR2_TOOLCHAIN_CTNG_uClibc
+
 config BR2_PACKAGE_LTP_TESTSUITE
 	bool "ltp-testsuite"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.0
