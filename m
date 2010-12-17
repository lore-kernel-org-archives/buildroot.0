From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 17 Dec 2010 17:00:18 +0100
Subject: [Buildroot] [git commit master 1/1] Remove completely useless set
	of Makefiles specific to Atmel
Message-ID: <20101217160156.3CF1C8E9A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e35eb0486195cba6ddece04ff42c4edebfb7d45c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/Makefile.in                           |    2 --
 target/device/Atmel/Makefile.in.linux        |    3 ---
 target/device/Atmel/arch-arm/arch-arm.mk     |    4 ----
 target/device/Atmel/arch-avr32/arch-avr32.mk |    3 ---
 target/device/Makefile.in.linux              |    1 -
 5 files changed, 0 insertions(+), 13 deletions(-)
 delete mode 100644 target/device/Atmel/Makefile.in.linux
 delete mode 100644 target/device/Atmel/arch-arm/arch-arm.mk
 delete mode 100644 target/device/Atmel/arch-avr32/arch-avr32.mk
 delete mode 100644 target/device/Makefile.in.linux

diff --git a/target/Makefile.in b/target/Makefile.in
index 475cd6e..aab9d39 100644
--- a/target/Makefile.in
+++ b/target/Makefile.in
@@ -4,5 +4,3 @@ include target/generic/Makefile.in
 # this eventually adds the kernel target to TARGETS:
 include target/device/Makefile.in
 include target/xtensa/Makefile.in
-
-include target/device/Makefile.in.linux
diff --git a/target/device/Atmel/Makefile.in.linux b/target/device/Atmel/Makefile.in.linux
deleted file mode 100644
index b529a9b..0000000
--- a/target/device/Atmel/Makefile.in.linux
+++ /dev/null
@@ -1,3 +0,0 @@
-include target/device/Atmel/arch-arm/arch-arm.mk
-include target/device/Atmel/arch-avr32/arch-avr32.mk
-
diff --git a/target/device/Atmel/arch-arm/arch-arm.mk b/target/device/Atmel/arch-arm/arch-arm.mk
deleted file mode 100644
index 49af525..0000000
--- a/target/device/Atmel/arch-arm/arch-arm.mk
+++ /dev/null
@@ -1,4 +0,0 @@
-ifeq ($(BR2_arm),y)
-
-endif
-
diff --git a/target/device/Atmel/arch-avr32/arch-avr32.mk b/target/device/Atmel/arch-avr32/arch-avr32.mk
deleted file mode 100644
index 27a6d3b..0000000
--- a/target/device/Atmel/arch-avr32/arch-avr32.mk
+++ /dev/null
@@ -1,3 +0,0 @@
-ifeq ($(BR2_avr32),y)
-
-endif
diff --git a/target/device/Makefile.in.linux b/target/device/Makefile.in.linux
deleted file mode 100644
index 8ee640a..0000000
--- a/target/device/Makefile.in.linux
+++ /dev/null
@@ -1 +0,0 @@
-include target/device/Atmel/Makefile.in.linux
-- 
1.7.2.2
