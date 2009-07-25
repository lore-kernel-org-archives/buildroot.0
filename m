From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 25 Jul 2009 21:08:55 +0200
Subject: [Buildroot] [git commit] linux-advanced: remove unused ancient
	kernel versions
Message-ID: <20090725191956.C0CB37639E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f91315e1710c256b353cdc1eba9a2374826798bc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

More than 2 years old, and no in tree users.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/linux/Config.in.advanced |   28 ----------------------------
 target/linux/Config.in.versions |   16 ----------------
 2 files changed, 0 insertions(+), 44 deletions(-)

diff --git a/target/linux/Config.in.advanced b/target/linux/Config.in.advanced
index 6d755d8..a17e41a 100644
--- a/target/linux/Config.in.advanced
+++ b/target/linux/Config.in.advanced
@@ -40,10 +40,6 @@ config BR2_KERNEL_PATCH_LEVEL
 	default $(BR2_KERNEL_LATEST_2_6_26) if BR2_LINUX_2_6_26 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 	default $(BR2_KERNEL_LATEST_2_6_25) if BR2_LINUX_2_6_25 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 	default $(BR2_KERNEL_LATEST_2_6_24) if BR2_LINUX_2_6_24 && BR2_KERNEL_ADD_LATEST_MINORPATCH
-	default $(BR2_KERNEL_LATEST_2_6_23) if BR2_LINUX_2_6_23 && BR2_KERNEL_ADD_LATEST_MINORPATCH
-	default $(BR2_KERNEL_LATEST_2_6_22) if BR2_LINUX_2_6_22 && BR2_KERNEL_ADD_LATEST_MINORPATCH
-	default $(BR2_KERNEL_LATEST_2_6_21) if BR2_LINUX_2_6_21 && BR2_KERNEL_ADD_LATEST_MINORPATCH
-	default $(BR2_KERNEL_LATEST_2_6_20) if BR2_LINUX_2_6_20 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 	default "$(BR2_KERNEL_MINORLEVEL)" if BR2_KERNEL_ADD_MINORPATCH
 
 config BR2_KERNEL_NEXT_VERSION
@@ -55,10 +51,6 @@ config BR2_KERNEL_NEXT_VERSION
 	default "2.6.27" if BR2_LINUX_2_6_26
 	default "2.6.26" if BR2_LINUX_2_6_25
 	default "2.6.25" if BR2_LINUX_2_6_24
-	default "2.6.24" if BR2_LINUX_2_6_23
-	default "2.6.23" if BR2_LINUX_2_6_22
-	default "2.6.22" if BR2_LINUX_2_6_21
-	default "2.6.21" if BR2_LINUX_2_6_20
 
 config BR2_KERNEL_THIS_VERSION
 	string
@@ -70,10 +62,6 @@ config BR2_KERNEL_THIS_VERSION
 	default "2.6.26" if BR2_LINUX_2_6_26
 	default "2.6.25" if BR2_LINUX_2_6_25
 	default "2.6.24" if BR2_LINUX_2_6_24
-	default "2.6.23" if BR2_LINUX_2_6_23
-	default "2.6.22" if BR2_LINUX_2_6_22
-	default "2.6.21" if BR2_LINUX_2_6_21
-	default "2.6.20" if BR2_LINUX_2_6_20
 
 config BR2_KERNEL_SITE
 	string
@@ -163,22 +151,6 @@ config BR2_LINUX_2_6_24
 	bool "Linux 2.6.24"
 	select BR2_KERNEL_BASE
 
-config BR2_LINUX_2_6_23
-	bool "Linux 2.6.23"
-	select BR2_KERNEL_BASE
-
-config BR2_LINUX_2_6_22
-	bool "Linux 2.6.22"
-	select BR2_KERNEL_BASE
-
-config BR2_LINUX_2_6_21
-	bool "Linux 2.6.21"
-	select BR2_KERNEL_BASE
-
-config BR2_LINUX_2_6_20
-	bool "Linux 2.6.20"
-	select BR2_KERNEL_BASE
-
 config BR2_LINUX_2_6_31
 	bool "Linux 2.6.31"
 	select BR2_KERNEL_BASE
diff --git a/target/linux/Config.in.versions b/target/linux/Config.in.versions
index caf1151..d71504d 100644
--- a/target/linux/Config.in.versions
+++ b/target/linux/Config.in.versions
@@ -50,19 +50,3 @@ config BR2_KERNEL_LATEST_2_6_25
 config BR2_KERNEL_LATEST_2_6_24
 	string
 	default "7"
-
-config BR2_KERNEL_LATEST_2_6_23
-	string
-	default "17"
-
-config BR2_KERNEL_LATEST_2_6_22
-	string
-	default "19"
-
-config BR2_KERNEL_LATEST_2_6_21
-	string
-	default "7"
-
-config BR2_KERNEL_LATEST_2_6_20
-	string
-	default "21"
-- 
1.6.3.3
