From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jul 2013 00:27:38 +0200
Subject: [Buildroot] [PATCHv2 15/25] binutils: exclude binutils versions
	that don't support EABIhf
In-Reply-To: <1373754468-7527-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1373754468-7527-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1373754468-7527-16-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ARM EABIhf support was introduced in Binutils 2.22, so earlier
versions should not be selected when EABIhf is used.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/Config.in.host | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 3d687fe..9ddaed7 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -14,14 +14,17 @@ choice
 
 	config BR2_BINUTILS_VERSION_2_20_1
 		depends on !BR2_avr32
+		depends on !BR2_ARM_EABIHF
 		bool "binutils 2.20.1"
 
 	config BR2_BINUTILS_VERSION_2_21
 		depends on !BR2_avr32
+		depends on !BR2_ARM_EABIHF
 		bool "binutils 2.21"
 
 	config BR2_BINUTILS_VERSION_2_21_1
 		depends on !BR2_avr32
+		depends on !BR2_ARM_EABIHF
 		bool "binutils 2.21.1"
 
 	config BR2_BINUTILS_VERSION_2_22
-- 
1.8.1.2
