From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  5 Dec 2010 21:52:35 +0100
Subject: [Buildroot] [PATCH 04/55] Remove completely useless set of
	Makefiles specific to Atmel
In-Reply-To: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
References: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
Message-ID: <81808c6eff173bd806bd514964e423bdc7f0797f.1291582351.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
1.7.0.4
