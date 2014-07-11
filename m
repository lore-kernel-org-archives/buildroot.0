From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Jul 2014 19:55:43 +0200
Subject: [Buildroot] [PATCH 1/2] binutils: remove leftover version
	definitions
Message-ID: <1405101344-14365-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Following d4839ffcab70f2496673e5b376f4c0d492260396 ("binutils: remove
2.20.1, 2.21 and 2.23.1"), Config.in.host contains unneeded
definitions of BR2_BINUTILS_VERSION for no longer existing
versions. This patch fixes that.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/Config.in.host | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 8369785..de45b43 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -35,11 +35,8 @@ config BR2_BINUTILS_VERSION
 	string
 	default "2.18-avr32-1.0.1" if BR2_BINUTILS_VERSION_2_18_AVR32_1_0_1
 	default "arc-4.8-R3"	if BR2_arc
-	default "2.20.1"	if BR2_BINUTILS_VERSION_2_20_1
-	default "2.21"		if BR2_BINUTILS_VERSION_2_21
 	default "2.21.1"	if BR2_BINUTILS_VERSION_2_21_1
 	default "2.22"		if BR2_BINUTILS_VERSION_2_22
-	default "2.23.1"	if BR2_BINUTILS_VERSION_2_23_1
 	default "2.23.2"	if BR2_BINUTILS_VERSION_2_23_2
 	default "2.24"		if BR2_BINUTILS_VERSION_2_24
 
-- 
2.0.0
