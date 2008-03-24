From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Mon, 24 Mar 2008 12:29:34 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/strace
Message-ID: <20080324192934.46C773C385@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2008-03-24 12:29:34 -0700 (Mon, 24 Mar 2008)
New Revision: 21476

Log:
* Strace requires both if_packet.h and netlink.h
- Force detection of these in configure by supplying environment 
  variables

For them to be detected by configure may require a much more 
invasive approach by patching configure.ac and regenerating
apon build.



Modified:
   trunk/buildroot/package/strace/strace.mk


Changeset:
Modified: trunk/buildroot/package/strace/strace.mk
===================================================================
--- trunk/buildroot/package/strace/strace.mk	2008-03-24 19:23:37 UTC (rev 21475)
+++ trunk/buildroot/package/strace/strace.mk	2008-03-24 19:29:34 UTC (rev 21476)
@@ -31,7 +31,8 @@
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
 		CFLAGS="$(TARGET_CFLAGS) $(BR2_STRACE_CFLAGS)" \
-		aaa_ac_cv_header_linux_if_packet_h=yes \
+		ac_cv_header_linux_if_packet_h=yes \
+		ac_cv_header_linux_netlink_h=yes \
 		./configure \
 		--target=$(REAL_GNU_TARGET_NAME) \
 		--host=$(REAL_GNU_TARGET_NAME) \
