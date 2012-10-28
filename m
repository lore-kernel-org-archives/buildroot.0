From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Oct 2012 17:40:31 +0100
Subject: [Buildroot] [PATCH 1/7] Add AArch64 to the list of architectures
In-Reply-To: <1351442438-20639-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1351442438-20639-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1351442438-20639-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/Config.in.arch |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/Config.in.arch b/target/Config.in.arch
index 639327a..ac2c0b5 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -23,6 +23,13 @@ config BR2_armeb
 	  http://www.arm.com/
 	  http://en.wikipedia.org/wiki/ARM
 
+config BR2_aarch64
+	bool "AArch64"
+	help
+	  Aarch64 is a 64-bit architecture developed by ARM Holdings.
+	  http://www.arm.com/products/processors/instruction-set-architectures/armv8-architecture.php
+	  http://en.wikipedia.org/wiki/ARM
+
 config BR2_avr32
 	bool "AVR32"
 	select BR2_SOFT_FLOAT
@@ -580,6 +587,7 @@ config BR2_ARCH
 	string
 	default "arm"		if BR2_arm
 	default "armeb"		if BR2_armeb
+	default "aarch64"       if BR2_aarch64
 	default "avr32"		if BR2_avr32
 	default "bfin"		if BR2_bfin
 	default "i386"		if BR2_x86_i386
-- 
1.7.9.5
