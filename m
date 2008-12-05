From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Fri,  5 Dec 2008 06:46:56 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/samba
Message-ID: <20081205144656.D32053C8A1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-12-05 06:46:56 -0800 (Fri, 05 Dec 2008)
New Revision: 24283

Log:
samba: predefine a autoconf result for enums with negative values

The configure script tries to find out if enums can be negative, this is not
supported when cross compiling, since it tries to run the binary. This commit
sets the test to yes, i.e. negative enums are possible.



Modified:
   trunk/buildroot/package/samba/samba.mk


Changeset:
Modified: trunk/buildroot/package/samba/samba.mk
===================================================================
--- trunk/buildroot/package/samba/samba.mk	2008-12-05 10:22:52 UTC (rev 24282)
+++ trunk/buildroot/package/samba/samba.mk	2008-12-05 14:46:56 UTC (rev 24283)
@@ -33,6 +33,7 @@
 		samba_cv_HAVE_FCNTL_LOCK=yes \
 		samba_cv_HAVE_SECURE_MKSTEMP=yes \
 		samba_cv_fpie=no \
+		SMB_BUILD_CC_NEGATIVE_ENUM_VALUES=yes \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
