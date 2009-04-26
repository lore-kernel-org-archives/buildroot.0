From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 26 Apr 2009 21:17:34 +0000 (UTC)
Subject: [Buildroot] svn commit: [26213] trunk/buildroot/package/samba
Message-ID: <20090426211734.A759F77456@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-26 21:17:33 +0000 (Sun, 26 Apr 2009)
New Revision: 26213

Log:
samba: fix build with ipv6 support is disabled

Based on patch by Sven Neumann <s.neumann@phase-zero.de>, closes #285

Modified:
   trunk/buildroot/package/samba/samba.mk


Changeset:
Modified: trunk/buildroot/package/samba/samba.mk
===================================================================
--- trunk/buildroot/package/samba/samba.mk	2009-04-26 21:17:29 UTC (rev 26212)
+++ trunk/buildroot/package/samba/samba.mk	2009-04-26 21:17:33 UTC (rev 26213)
@@ -35,6 +35,7 @@
 		samba_cv_HAVE_NATIVE_ICONV=no \
 		samba_cv_CC_NEGATIVE_ENUM_VALUES=yes \
 		samba_cv_fpie=no \
+		libreplace_cv_HAVE_IPV6=$(if $(BR2_INET_IPV6),yes,no) \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
