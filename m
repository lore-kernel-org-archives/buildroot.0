From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2009 00:19:17 +0100
Subject: [Buildroot] [git commit master] uclibc: do not allow selection of
	non-avr32 versions on AVR32
Message-ID: <20091214232058.7902F77796@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b642f7eefbf8c7f0111d74528390de31aaacf203
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/uClibc/Config.in |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/toolchain/uClibc/Config.in b/toolchain/uClibc/Config.in
index c0ec220..cc7dcd1 100644
--- a/toolchain/uClibc/Config.in
+++ b/toolchain/uClibc/Config.in
@@ -11,16 +11,17 @@ choice
 	  Select the version of uClibc you wish to use.
 
 	config BR2_UCLIBC_VERSION_0_9_28_3
+		depends on !BR2_avr32
 		depends on BR2_DEPRECATED
 		bool "uClibc 0.9.28.3"
-		depends on BR2_EXT_UCLIBC_VERSION_0_9_28_3
 
 	config BR2_UCLIBC_VERSION_0_9_29
+		depends on !BR2_avr32
 		depends on BR2_DEPRECATED
 		bool "uClibc 0.9.29"
-		depends on BR2_EXT_UCLIBC_VERSION_0_9_29
 
 	config BR2_UCLIBC_VERSION_0_9_30
+		depends on !BR2_avr32
 		depends on BR2_RECENT || BR2_DEPRECATED
 		bool "uClibc 0.9.30"
 
@@ -29,15 +30,15 @@ choice
 		bool "uClibc 0.9.30-avr32-2.1.5"
 
 	config BR2_UCLIBC_VERSION_0_9_30_1
+		depends on !BR2_avr32
 		bool "uClibc 0.9.30.1"
-		depends on BR2_EXT_UCLIBC_VERSION_0_9_30_1
 
 	config BR2_UCLIBC_VERSION_SNAPSHOT
+		depends on !BR2_avr32
 		bool "daily snapshot"
 
 endchoice
 
-
 config BR2_USE_UCLIBC_SNAPSHOT
 	string "Date (yyyymmdd) of snapshot or 'snapshot' for latest"
 	default "snapshot"
-- 
1.6.3.3
