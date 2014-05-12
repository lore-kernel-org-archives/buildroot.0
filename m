From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 May 2014 00:12:28 +0200
Subject: [Buildroot] [PATCH] crda: disable on NIOS II
Message-ID: <1399932748-12406-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building crda on NIOS II triggers the infamous _gp linker issue. Since
nobody cared, let's disable this package on NIOS II for the moment.

Fixes:

  http://autobuild.buildroot.net/results/272/272f18410e4855ab6b3bfd8a44243c1ebecf6abe/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/crda/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/crda/Config.in b/package/crda/Config.in
index e56a45e..0e0eb7f 100644
--- a/package/crda/Config.in
+++ b/package/crda/Config.in
@@ -5,6 +5,8 @@ config BR2_PACKAGE_CRDA
 	select BR2_PACKAGE_LIBNL
 	# regdb is a runtime dependency
 	select BR2_PACKAGE_WIRELESS_REGDB
+	# Triggers the _gp link issue
+	depends on !BR2_nios2
 	help
 	  Central Regulatory Domain Agent.
 
@@ -17,3 +19,4 @@ config BR2_PACKAGE_CRDA
 
 comment "crda needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_nios2
-- 
1.9.2
