From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 15 Jan 2010 14:48:08 +0100
Subject: [Buildroot] [git commit master] toolchain: add uclibc 0.9.30.2
Message-ID: <20100115134832.B0C3277105@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6bfb4885b03d79a474aa431bd406c2bb707aa7cf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    2 ++
 toolchain/uClibc/Config.in |   10 ++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 2be6728..2e1bed4 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,5 +1,7 @@
 2010.02, Not yet released:
 
+	Toolchain: uClibc 0.9.30.2
+
 	New packages: libcdaudio, libdvdnav, libdvdread, hostapd, tcpreplay
 
 	Updated/fixed packages: autoconf, bind, binutils, busybox,
diff --git a/toolchain/uClibc/Config.in b/toolchain/uClibc/Config.in
index 16708a6..0d41de1 100644
--- a/toolchain/uClibc/Config.in
+++ b/toolchain/uClibc/Config.in
@@ -5,7 +5,7 @@ comment "uClibc Options"
 
 choice
 	prompt "uClibc C library Version"
-	default BR2_UCLIBC_VERSION_0_9_30_1
+	default BR2_UCLIBC_VERSION_0_9_30_2
 	help
 	  Select the version of uClibc you wish to use.
 
@@ -20,12 +20,16 @@ choice
 		bool "uClibc 0.9.29"
 
 	config BR2_UCLIBC_VERSION_0_9_30
-		depends on BR2_RECENT || BR2_DEPRECATED
+		depends on BR2_DEPRECATED
 		bool "uClibc 0.9.30"
 
 	config BR2_UCLIBC_VERSION_0_9_30_1
+		depends on BR2_RECENT || BR2_DEPRECATED
 		bool "uClibc 0.9.30.1"
 
+	config BR2_UCLIBC_VERSION_0_9_30_2
+		bool "uClibc 0.9.30.2"
+
 	config BR2_UCLIBC_VERSION_SNAPSHOT
 		bool "daily snapshot"
 
@@ -44,6 +48,7 @@ config BR2_UCLIBC_VERSION_STRING
 	default 0.9.29		if BR2_UCLIBC_VERSION_0_9_29
 	default 0.9.30		if BR2_UCLIBC_VERSION_0_9_30
 	default 0.9.30.1	if BR2_UCLIBC_VERSION_0_9_30_1
+	default 0.9.30.2	if BR2_UCLIBC_VERSION_0_9_30_2
 	default $BR2_USE_UCLIBC_SNAPSHOT	if BR2_UCLIBC_VERSION_SNAPSHOT
 
 config BR2_UCLIBC_CONFIG
@@ -52,6 +57,7 @@ config BR2_UCLIBC_CONFIG
 	default "toolchain/uClibc/uClibc-0.9.29.config" if BR2_UCLIBC_VERSION_0_9_29
 	default "toolchain/uClibc/uClibc-0.9.30.config" if BR2_UCLIBC_VERSION_0_9_30
 	default "toolchain/uClibc/uClibc-0.9.30.config" if BR2_UCLIBC_VERSION_0_9_30_1
+	default "toolchain/uClibc/uClibc-0.9.30.config" if BR2_UCLIBC_VERSION_0_9_30_2
 	default "toolchain/uClibc/uClibc-snapshot.config" if BR2_UCLIBC_VERSION_SNAPSHOT
 	help
 	  Some people may wish to use their own modified uClibc configuration
-- 
1.6.3.3
