From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 21 Nov 2008 22:49:33 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20081122064933.EC67D3C7AB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-11-21 22:49:33 -0800 (Fri, 21 Nov 2008)
New Revision: 24119

Log:
busybox: updated 1.13.0 ash fix

Modified:
   trunk/buildroot/package/busybox/busybox-1.13.0-ash.patch


Changeset:
Modified: trunk/buildroot/package/busybox/busybox-1.13.0-ash.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.13.0-ash.patch	2008-11-22 06:49:30 UTC (rev 24118)
+++ trunk/buildroot/package/busybox/busybox-1.13.0-ash.patch	2008-11-22 06:49:33 UTC (rev 24119)
@@ -1,7 +1,6 @@
-diff -urpN busybox-1.13.0/shell/ash.c busybox-1.13.0-ash/shell/ash.c
---- busybox-1.13.0/shell/ash.c	2008-10-30 08:41:32.000000000 +0100
-+++ busybox-1.13.0-ash/shell/ash.c	2008-11-21 11:38:04.000000000 +0100
-@@ -536,6 +536,7 @@ static const char dolatstr[] ALIGN1 = {
+--- busybox-1.13.0/shell/ash.c	Thu Oct 30 08:41:32 2008
++++ busybox-1.13.0-ash/shell/ash.c	Sat Nov 22 02:31:06 2008
+@@ -536,6 +536,7 @@
  #define NHERE    24
  #define NXHERE   25
  #define NNOT     26
@@ -9,7 +8,7 @@
  
  union node;
  
-@@ -7546,43 +7547,44 @@ commandcmd(int argc UNUSED_PARAM, char *
+@@ -7546,43 +7547,46 @@
  
  /* ============ eval.c */
  
@@ -74,7 +73,9 @@
 +	[NDEFUN   ] = SHELL_ALIGN(sizeof(struct narg)),
 +	[NARG     ] = SHELL_ALIGN(sizeof(struct narg)),
 +	[NTO      ] = SHELL_ALIGN(sizeof(struct nfile)),
++#if ENABLE_ASH_BASH_COMPAT
 +	[NTO2     ] = SHELL_ALIGN(sizeof(struct nfile)),
++#endif
 +	[NCLOBBER ] = SHELL_ALIGN(sizeof(struct nfile)),
 +	[NFROM    ] = SHELL_ALIGN(sizeof(struct nfile)),
 +	[NFROMTO  ] = SHELL_ALIGN(sizeof(struct nfile)),
