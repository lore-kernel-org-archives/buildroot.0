From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 25 Jun 2007 04:22:28 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/bash
Message-ID: <20070625112228.065BEA45F9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-25 04:22:26 -0700 (Mon, 25 Jun 2007)
New Revision: 18928

Log:
- forgot to adjust the pathes..


Modified:
   trunk/buildroot/package/bash/bash32-010
   trunk/buildroot/package/bash/bash32-011
   trunk/buildroot/package/bash/bash32-012
   trunk/buildroot/package/bash/bash32-013
   trunk/buildroot/package/bash/bash32-014
   trunk/buildroot/package/bash/bash32-015
   trunk/buildroot/package/bash/bash32-016
   trunk/buildroot/package/bash/bash32-017


Changeset:
Modified: trunk/buildroot/package/bash/bash32-010
===================================================================
--- trunk/buildroot/package/bash/bash32-010	2007-06-25 11:17:52 UTC (rev 18927)
+++ trunk/buildroot/package/bash/bash32-010	2007-06-25 11:22:26 UTC (rev 18928)
@@ -19,7 +19,7 @@
 Patch:
 
 *** ../bash-3.2.9/pathexp.h	Sat Feb 19 17:23:18 2005
---- pathexp.h	Wed Jan 31 22:53:16 2007
+--- bash-3.2/pathexp.h	Wed Jan 31 22:53:16 2007
 ***************
 *** 1,5 ****
   /* pathexp.h -- The shell interface to the globbing library. */
@@ -42,7 +42,7 @@
   
   #if defined (EXTENDED_GLOB)
 *** ../bash-3.2.9/pathexp.c	Mon May  6 13:43:05 2002
---- pathexp.c	Mon Feb 26 16:59:23 2007
+--- bash-3.2/pathexp.c	Mon Feb 26 16:59:23 2007
 ***************
 *** 1,5 ****
   /* pathexp.c -- The shell interface to the globbing library. */
@@ -100,7 +100,7 @@
   	  temp[j++] = '\\';
   	  i++;
 *** ../bash-3.2.9/subst.c	Tue Nov  7 16:14:41 2006
---- subst.c	Wed Jan 31 23:09:58 2007
+--- bash-3.2/subst.c	Wed Jan 31 23:09:58 2007
 ***************
 *** 5,9 ****
        beauty, but, hey, you're alright.'' */
@@ -163,7 +163,7 @@
   	  free (p);
   	}
 *** ../bash-3.2.9/execute_cmd.c	Sat Aug 26 00:23:17 2006
---- execute_cmd.c	Wed Jan 31 23:12:06 2007
+--- bash-3.2/execute_cmd.c	Wed Jan 31 23:12:06 2007
 ***************
 *** 1,5 ****
   /* execute_cmd.c -- Execute a COMMAND structure. */
@@ -191,7 +191,7 @@
         if (arg2 == 0)
   	arg2 = nullstr;
 *** ../bash-3.2/patchlevel.h	Thu Apr 13 08:31:04 2006
---- patchlevel.h	Mon Oct 16 14:22:54 2006
+--- bash-3.2/patchlevel.h	Mon Oct 16 14:22:54 2006
 ***************
 *** 26,30 ****
      looks for to find the patch level (for the sccs version string). */

Modified: trunk/buildroot/package/bash/bash32-011
===================================================================
--- trunk/buildroot/package/bash/bash32-011	2007-06-25 11:17:52 UTC (rev 18927)
+++ trunk/buildroot/package/bash/bash32-011	2007-06-25 11:22:26 UTC (rev 18928)
@@ -20,7 +20,7 @@
 Patch:
 
 *** ../bash-3.2-patched/configure.in	Tue Sep 26 11:05:45 2006
---- configure.in	Wed Jan 31 09:48:00 2007
+--- bash-3.2/configure.in	Wed Jan 31 09:48:00 2007
 ***************
 *** 6,10 ****
   dnl Process this file with autoconf to produce a configure script.
@@ -49,7 +49,7 @@
   lynxos*)	LOCAL_CFLAGS=-DRECYCLES_PIDS ;;
   linux*)		LOCAL_LDFLAGS=-rdynamic		 # allow dynamic loading
 *** ../bash-3.2-patched/config-bot.h	Tue Sep 12 16:43:04 2006
---- config-bot.h	Tue Mar  6 10:41:31 2007
+--- bash-3.2/config-bot.h	Tue Mar  6 10:41:31 2007
 ***************
 *** 2,6 ****
   /* modify settings or make new ones based on what autoconf tells us. */
@@ -83,7 +83,7 @@
   #  undef HAVE_GETCWD
   #endif
 *** ../bash-3.2-patched/builtins/common.c	Thu Jul 27 09:39:51 2006
---- builtins/common.c	Tue Mar  6 10:43:27 2007
+--- bash-3.2/builtins/common.c	Tue Mar  6 10:43:27 2007
 ***************
 *** 1,3 ****
 ! /* Copyright (C) 1987-2005 Free Software Foundation, Inc.
@@ -106,7 +106,7 @@
         if (the_current_working_directory == 0)
   	{
 *** ../bash-3.2-patched/configure	Tue Sep 26 11:06:01 2006
---- configure	Tue Mar  6 10:59:20 2007
+--- bash-3.2/configure	Tue Mar  6 10:59:20 2007
 ***************
 *** 27317,27321 ****
   sco3.2*)	LOCAL_CFLAGS=-DMUST_UNBLOCK_CHLD ;;
@@ -122,7 +122,7 @@
   lynxos*)	LOCAL_CFLAGS=-DRECYCLES_PIDS ;;
   linux*)		LOCAL_LDFLAGS=-rdynamic		 # allow dynamic loading
 *** ../bash-3.2/patchlevel.h	Thu Apr 13 08:31:04 2006
---- patchlevel.h	Mon Oct 16 14:22:54 2006
+--- bash-3.2/patchlevel.h	Mon Oct 16 14:22:54 2006
 ***************
 *** 26,30 ****
      looks for to find the patch level (for the sccs version string). */

Modified: trunk/buildroot/package/bash/bash32-012
===================================================================
--- trunk/buildroot/package/bash/bash32-012	2007-06-25 11:17:52 UTC (rev 18927)
+++ trunk/buildroot/package/bash/bash32-012	2007-06-25 11:22:26 UTC (rev 18928)
@@ -20,7 +20,7 @@
 Patch:
 
 *** ../bash-3.2.11/config.h.in	Tue Sep 12 16:00:54 2006
---- config.h.in	Tue Mar  6 11:17:55 2007
+--- bash-3.2/config.h.in	Tue Mar  6 11:17:55 2007
 ***************
 *** 1,5 ****
   /* config.h -- Configuration file for bash. */
@@ -54,7 +54,7 @@
   /* Define if your system has a working `malloc' function. */
   /* #undef HAVE_MALLOC */
 *** ../bash-3.2.11/builtins/printf.def	Mon Nov 13 08:58:52 2006
---- builtins/printf.def	Sun Feb  4 13:58:59 2007
+--- bash-3.2/builtins/printf.def	Sun Feb  4 13:58:59 2007
 ***************
 *** 2,6 ****
   It implements the builtin "printf" in Bash.
@@ -80,7 +80,7 @@
   #if !defined (PRIdMAX)
   #  if HAVE_LONG_LONG
 *** ../bash-3.2/patchlevel.h	Thu Apr 13 08:31:04 2006
---- patchlevel.h	Mon Oct 16 14:22:54 2006
+--- bash-3.2/patchlevel.h	Mon Oct 16 14:22:54 2006
 ***************
 *** 26,30 ****
      looks for to find the patch level (for the sccs version string). */

Modified: trunk/buildroot/package/bash/bash32-013
===================================================================
--- trunk/buildroot/package/bash/bash32-013	2007-06-25 11:17:52 UTC (rev 18927)
+++ trunk/buildroot/package/bash/bash32-013	2007-06-25 11:22:26 UTC (rev 18928)
@@ -17,7 +17,7 @@
 Patch:
 
 *** ../bash-3.2-patched/lib/readline/display.c	Thu Sep 14 14:20:12 2006
---- lib/readline/display.c	Fri Feb  2 20:23:17 2007
+--- bash-3.2/lib/readline/display.c	Fri Feb  2 20:23:17 2007
 ***************
 *** 561,574 ****
 --- 561,586 ----
@@ -49,7 +49,7 @@
   #define CHECK_LPOS() \
 
 *** ../bash-3.2/patchlevel.h	Thu Apr 13 08:31:04 2006
---- patchlevel.h	Mon Oct 16 14:22:54 2006
+--- bash-3.2/patchlevel.h	Mon Oct 16 14:22:54 2006
 ***************
 *** 26,30 ****
      looks for to find the patch level (for the sccs version string). */

Modified: trunk/buildroot/package/bash/bash32-014
===================================================================
--- trunk/buildroot/package/bash/bash32-014	2007-06-25 11:17:52 UTC (rev 18927)
+++ trunk/buildroot/package/bash/bash32-014	2007-06-25 11:22:26 UTC (rev 18928)
@@ -17,7 +17,7 @@
 Patch:
 
 *** ../bash-3.2-patched/array.c	Wed Jun  1 16:39:22 2005
---- array.c	Mon Jan 15 22:58:00 2007
+--- bash-3.2/array.c	Mon Jan 15 22:58:00 2007
 ***************
 *** 121,125 ****
   }
@@ -135,7 +135,7 @@
   	if (mflags & MATCH_STARSUB) {
   		ifs = getifs();
 *** ../bash-3.2-patched/array.h	Sun Jun  1 15:50:30 2003
---- array.h	Mon Jan 15 22:35:35 2007
+--- bash-3.2/array.h	Mon Jan 15 22:35:35 2007
 ***************
 *** 56,59 ****
 --- 56,60 ----
@@ -145,7 +145,7 @@
   
   extern char	*array_subrange __P((ARRAY *, arrayind_t, arrayind_t, int, int));
 *** ../bash-3.2-patched/subst.c	Fri Mar  2 16:20:50 2007
---- subst.c	Tue Mar  6 11:40:55 2007
+--- bash-3.2/subst.c	Tue Mar  6 11:40:55 2007
 ***************
 *** 1888,1892 ****
 --- 1889,1899 ----
@@ -291,7 +291,7 @@
         break;
   #endif
 *** ../bash-3.2/patchlevel.h	Thu Apr 13 08:31:04 2006
---- patchlevel.h	Mon Oct 16 14:22:54 2006
+--- bash-3.2/patchlevel.h	Mon Oct 16 14:22:54 2006
 ***************
 *** 26,30 ****
      looks for to find the patch level (for the sccs version string). */

Modified: trunk/buildroot/package/bash/bash32-015
===================================================================
--- trunk/buildroot/package/bash/bash32-015	2007-06-25 11:17:52 UTC (rev 18927)
+++ trunk/buildroot/package/bash/bash32-015	2007-06-25 11:22:26 UTC (rev 18928)
@@ -17,7 +17,7 @@
 Patch:
 
 *** ../bash-3.2-patched/execute_cmd.c	Fri Mar  2 16:20:50 2007
---- execute_cmd.c	Wed Jan 31 23:12:06 2007
+--- bash-3.2/execute_cmd.c	Wed Jan 31 23:12:06 2007
 ***************
 *** 3051,3054 ****
 --- 3051,3059 ----
@@ -31,7 +31,7 @@
     execute_disk_command (words, simple_command->redirects, command_line,
   			pipe_in, pipe_out, async, fds_to_close,
 *** ../bash-3.2-patched/subst.c	Fri Mar  2 16:20:50 2007
---- subst.c	Tue Mar  6 11:40:55 2007
+--- bash-3.2/subst.c	Tue Mar  6 11:40:55 2007
 ***************
 *** 4129,4132 ****
 --- 4151,4160 ----
@@ -69,7 +69,7 @@
         exit (rc);
       }
 *** ../bash-3.2-patched/subst.h	Tue Sep 19 08:34:41 2006
---- subst.h	Wed Jan 10 09:46:47 2007
+--- bash-3.2/subst.h	Wed Jan 10 09:46:47 2007
 ***************
 *** 223,226 ****
 --- 223,227 ----
@@ -79,7 +79,7 @@
   extern void unlink_fifo_list __P((void));
 
 *** ../bash-3.2/patchlevel.h	Thu Apr 13 08:31:04 2006
---- patchlevel.h	Mon Oct 16 14:22:54 2006
+--- bash-3.2/patchlevel.h	Mon Oct 16 14:22:54 2006
 ***************
 *** 26,30 ****
      looks for to find the patch level (for the sccs version string). */

Modified: trunk/buildroot/package/bash/bash32-016
===================================================================
--- trunk/buildroot/package/bash/bash32-016	2007-06-25 11:17:52 UTC (rev 18927)
+++ trunk/buildroot/package/bash/bash32-016	2007-06-25 11:22:26 UTC (rev 18928)
@@ -18,7 +18,7 @@
 Patch:
 
 *** ../bash-3.2/lib/readline/display.c	Fri Jan 19 13:34:50 2007
---- lib/readline/display.c	Sat Mar 10 17:25:44 2007
+--- bash-3.2/lib/readline/display.c	Sat Mar 10 17:25:44 2007
 ***************
 *** 1745,1749 ****
       {
@@ -36,7 +36,7 @@
   	{
   	  dpos -= woff;
 *** ../bash-3.2/patchlevel.h	Thu Apr 13 08:31:04 2006
---- patchlevel.h	Mon Oct 16 14:22:54 2006
+--- bash-3.2/patchlevel.h	Mon Oct 16 14:22:54 2006
 ***************
 *** 26,30 ****
      looks for to find the patch level (for the sccs version string). */

Modified: trunk/buildroot/package/bash/bash32-017
===================================================================
--- trunk/buildroot/package/bash/bash32-017	2007-06-25 11:17:52 UTC (rev 18927)
+++ trunk/buildroot/package/bash/bash32-017	2007-06-25 11:22:26 UTC (rev 18928)
@@ -17,7 +17,7 @@
 Patch:
 
 *** ../bash-3.2.16/lib/readline/display.c	Fri Apr 20 13:30:16 2007
---- lib/readline/display.c	Fri Apr 20 15:17:01 2007
+--- bash-3.2/lib/readline/display.c	Fri Apr 20 15:17:01 2007
 ***************
 *** 1599,1604 ****
   	  if (temp > 0)
@@ -69,7 +69,7 @@
   	    }
   	  lendiff = (oe - old) - (ne - new);
 *** ../bash-3.2/patchlevel.h	Thu Apr 13 08:31:04 2006
---- patchlevel.h	Mon Oct 16 14:22:54 2006
+--- bash-3.2/patchlevel.h	Mon Oct 16 14:22:54 2006
 ***************
 *** 26,30 ****
      looks for to find the patch level (for the sccs version string). */
