From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 May 2014 00:03:06 +0200
Subject: [Buildroot] [git commit] aiccu: not available on NIOS II
Message-ID: <20140512220744.B36C69CBAC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=50d367315d719405652968ad2d4258dbafffa557
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building aiccu does not work on NIOS II due to the _gp problem, and
nobody is interested to fix it for now, so we simply disallow this
package. While we're at it, we propagate the AVR32 exclusion to the
comment.

Fixes:

  http://autobuild.buildroot.net/results/786/7864cd5789a9f9b9f0603d738f4e63822d8469dd/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/aiccu/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/aiccu/Config.in b/package/aiccu/Config.in
index 9865b5c..a6933b6 100644
--- a/package/aiccu/Config.in
+++ b/package/aiccu/Config.in
@@ -11,6 +11,8 @@ config BR2_PACKAGE_AICCU
 	# due to the lack of dn_skipname(), even with external
 	# toolchains.
 	depends on !BR2_avr32
+	# Triggers the _gp link issue
+	depends on !BR2_nios2
 	select BR2_PACKAGE_GNUTLS
 	help
 	  SixXS Automatic IPv6 Connectivity Client Utility
@@ -29,3 +31,5 @@ config BR2_PACKAGE_AICCU
 comment "aiccu needs a toolchain w/ IPv6, wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !(BR2_INET_IPV6 && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
+	depends on !BR2_avr32
+	depends on !BR2_nios2
