From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 14 Aug 2007 04:59:47 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070814115947.729A7A6816@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-08-14 04:59:46 -0700 (Tue, 14 Aug 2007)
New Revision: 19505

Log:
Added powerpc variant selection

Modified:
   trunk/buildroot/Config.in


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2007-08-14 10:27:56 UTC (rev 19504)
+++ trunk/buildroot/Config.in	2007-08-14 11:59:46 UTC (rev 19505)
@@ -295,8 +295,66 @@
 	bool "itanium 2"
 endchoice
 
+choice
+	prompt "Target Architecture Variant"
+	depends BR2_powerpc
+	default BR2_generic_powerpc
+	help
+	  Specific CPU variant to use
+config BR2_generic_powerpc
+	bool "generic"
+config BR2_powerpc_401
+	bool "401"
+config BR2_powerpc_403
+	bool "403"
+config BR2_powerpc_405
+	bool "405"
+config BR2_powerpc_405fp
+	bool "405 with FPU"
+config BR2_powerpc_440
+	bool "440"
+config BR2_powerpc_440fp
+	bool "440 with FPU"
+config BR2_powerpc_505
+	bool "505"
+config BR2_powerpc_601
+	bool "601"
+config BR2_powerpc_602
+	bool "602"
+config BR2_powerpc_603
+	bool "603"
+config BR2_powerpc_603e
+	bool "603e"
+config BR2_powerpc_604
+	bool "604"
+config BR2_powerpc_604e
+	bool "604e"
+config BR2_powerpc_620
+	bool "620"
+config BR2_powerpc_630
+	bool "630"
+config BR2_powerpc_740
+	bool "740"
+config BR2_powerpc_7400
+	bool "7400"
+config BR2_powerpc_7450
+	bool "7450"
+config BR2_powerpc_750
+	bool "750"
+config BR2_powerpc_801
+	bool "801"
+config BR2_powerpc_821
+	bool "821"
+config BR2_powerpc_823
+	bool "823"
+config BR2_powerpc_860
+	bool "860"
+config BR2_powerpc_970
+	bool "970"
+config BR2_powerpc_8540
+	bool "8540"
+endchoice
 
-
 config BR2_ARCH
 	string
 	default "alpha"		if BR2_alpha
