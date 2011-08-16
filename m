From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 16 Aug 2011 08:36:01 +0200
Subject: [Buildroot] [git commit] uClibc: disallow 0.9.32 on avr32
Message-ID: <20110816063719.503FC8C980@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3037dba2f11f5576dfbe3152f8e1e2bf7b1e6c21
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build breaks during gcc-intermediate step with 0.9.32.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/uClibc/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/toolchain/uClibc/Config.in b/toolchain/uClibc/Config.in
index 16b2be4..9f3c7b3 100644
--- a/toolchain/uClibc/Config.in
+++ b/toolchain/uClibc/Config.in
@@ -5,6 +5,7 @@ comment "uClibc Options"
 
 choice
 	prompt "uClibc C library Version"
+	default BR2_UCLIBC_VERSION_0_9_31 if BR2_avr32 # 0.9.32 broken
 	default BR2_UCLIBC_VERSION_0_9_32
 	help
 	  Select the version of uClibc you wish to use.
@@ -18,6 +19,7 @@ choice
 
 	config BR2_UCLIBC_VERSION_0_9_32
 		bool "uClibc 0.9.32.x"
+		depends on !BR2_avr32
 
 	config BR2_UCLIBC_VERSION_SNAPSHOT
 		bool "daily snapshot"
-- 
1.7.3.4
