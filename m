From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 13 Aug 2007 13:22:19 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot:  toolchain/uClibc
Message-ID: <20070813202219.DAAB2A6830@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-13 13:22:17 -0700 (Mon, 13 Aug 2007)
New Revision: 19494

Log:
Stop halting ARM build to configure uClibc

Modified:
   trunk/buildroot/Config.in
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.29.config


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2007-08-13 20:18:25 UTC (rev 19493)
+++ trunk/buildroot/Config.in	2007-08-13 20:22:17 UTC (rev 19494)
@@ -65,6 +65,8 @@
 
 config BR2_generic_arm
 	bool "generic_arm"
+config BR2_arm7tdmi
+	bool "arm7tdmi"
 config BR2_arm610
 	bool "arm610"
 config BR2_arm710
@@ -77,6 +79,8 @@
 	bool "arm922t"
 config BR2_arm926t
 	bool "arm926t"
+config BR2_arm10t
+	bool "arm10t"
 config BR2_arm1136jf_s
 	bool "arm1136jf_s"
 config BR2_arm1176jz_s
@@ -95,12 +99,15 @@
 
 config BR2_ARM_TYPE
 	string
+	default GENERIC_ARM	if BR2_generic_arm
 	default ARM610		if BR2_arm610
 	default ARM710		if BR2_arm710
+	default ARM7TDMI	if BR2_arm7tdmi
 	default ARM720T		if BR2_arm720t
 	default ARM920T		if BR2_arm920t
 	default ARM922T		if BR2_arm922t
 	default ARM926T		if BR2_arm926t
+	default ARM10T		if BR2_arm10t
 	default ARM1136JF_S 	if BR2_arm1136jf_s
 	default ARM1176JZ_S	if BR2_arm1176jz_s
 	default ARM1176JZF_S	if BR2_arm1176jzf_s
@@ -108,7 +115,6 @@
 	default ARM_SA1100	if BR2_sa1100
 	default ARM_XSCALE	if BR2_xscale
 	default ARM_IWMMXT	if BR2_iwmmxt
-	default GENERIC_ARM	if BR2_generic_arm
 
 choice
 	prompt "Target ABI"

Modified: trunk/buildroot/toolchain/uClibc/uClibc-0.9.29.config
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-0.9.29.config	2007-08-13 20:18:25 UTC (rev 19493)
+++ trunk/buildroot/toolchain/uClibc/uClibc-0.9.29.config	2007-08-13 20:22:17 UTC (rev 19494)
@@ -210,6 +210,8 @@
 # CONFIG_ARM926T is not set
 # CONFIG_ARM10T is not set
 # CONFIG_ARM1136JF_S is not set
+# CONFIG_ARM1176JZ_S is not set
+# CONFIG_ARM1176JZF_S is not set
 # CONFIG_ARM_SA110 is not set
 # CONFIG_ARM_SA1100 is not set
 # CONFIG_ARM_XSCALE is not set
