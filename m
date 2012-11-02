From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 2 Nov 2012 21:06:02 +0100
Subject: [Buildroot] [git commit] Add AArch64 to the list of architectures
Message-ID: <20121102231430.9B972999E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1ea9a8e233032782b843e8a91a119891cf3197a9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/Config.in.arch |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

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
