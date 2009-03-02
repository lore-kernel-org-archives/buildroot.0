From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  2 Mar 2009 19:56:13 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ipsec-tools
Message-ID: <20090302195613.80FE27747D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-02 19:56:13 +0000 (Mon, 02 Mar 2009)
New Revision: 25492

Log:
ipsec-tools: use select rather than depends for library dependencies

As noticed on the mailing list.

Modified:
   trunk/buildroot/package/ipsec-tools/Config.in


Changeset:
Modified: trunk/buildroot/package/ipsec-tools/Config.in
===================================================================
--- trunk/buildroot/package/ipsec-tools/Config.in	2009-03-02 19:51:24 UTC (rev 25491)
+++ trunk/buildroot/package/ipsec-tools/Config.in	2009-03-02 19:56:13 UTC (rev 25492)
@@ -1,12 +1,11 @@
 config BR2_PACKAGE_IPSEC_TOOLS
 	bool "ipsec-tools"
-	depends on BR2_PACKAGE_OPENSSL && BR2_PACKAGE_FLEX && BR2_PACKAGE_FLEX_LIBFL
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_FLEX
+	select BR2_PACKAGE_FLEX_LIBFL
 	help
 	  This package is required to support IPSec for Linux 2.6+
 
-comment "ipsec-tools	- disabled (requires openssl, flex and the flex library (libfl.a) )"
-	depends on !BR2_PACKAGE_OPENSSL || !BR2_PACKAGE_FLEX
-
 config BR2_PACKAGE_IPSEC_TOOLS_ADMINPORT
 	default y
 	depends on BR2_PACKAGE_IPSEC_TOOLS
