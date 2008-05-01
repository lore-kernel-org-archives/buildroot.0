From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Thu,  1 May 2008 12:07:59 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/bash
Message-ID: <20080501190759.55F053C68B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2008-05-01 12:07:58 -0700 (Thu, 01 May 2008)
New Revision: 21913

Log:
* Fixed bash patches


Modified:
   trunk/buildroot/package/bash/bash32-025
   trunk/buildroot/package/bash/bash32-026
   trunk/buildroot/package/bash/bash32-027
   trunk/buildroot/package/bash/bash32-028
   trunk/buildroot/package/bash/bash32-029
   trunk/buildroot/package/bash/bash32-030
   trunk/buildroot/package/bash/bash32-031
   trunk/buildroot/package/bash/bash32-032
   trunk/buildroot/package/bash/bash32-033


Changeset:
Modified: trunk/buildroot/package/bash/bash32-025
===================================================================
--- trunk/buildroot/package/bash/bash32-025	2008-05-01 19:03:48 UTC (rev 21912)
+++ trunk/buildroot/package/bash/bash32-025	2008-05-01 19:07:58 UTC (rev 21913)
@@ -16,8 +16,8 @@
 
 Patch:
 
-*** ../bash-3.2-patched/lib/readline/input.c	Wed Aug 16 15:15:16 2006
---- lib/readline/input.c	Tue Jul 17 09:24:21 2007
+*** bash-3.2-patched/lib/readline/input.c	Wed Aug 16 15:15:16 2006
+--- bash-3.2/lib/readline/input.c	Tue Jul 17 09:24:21 2007
 ***************
 *** 134,139 ****
   
@@ -62,8 +62,8 @@
 + #endif
       push_index = 0;
   
-*** ../bash-3.2/patchlevel.h	Thu Apr 13 08:31:04 2006
---- patchlevel.h	Mon Oct 16 14:22:54 2006
+*** bash-3.2/patchlevel.h	Thu Apr 13 08:31:04 2006
+--- bash-3.2/patchlevel.h	Mon Oct 16 14:22:54 2006
 ***************
 *** 26,30 ****
      looks for to find the patch level (for the sccs version string). */

Modified: trunk/buildroot/package/bash/bash32-026
===================================================================
--- trunk/buildroot/package/bash/bash32-026	2008-05-01 19:03:48 UTC (rev 21912)
+++ trunk/buildroot/package/bash/bash32-026	2008-05-01 19:07:58 UTC (rev 21913)
@@ -22,8 +22,8 @@
 
 Patch:
 
-*** ../bash-3.2-patched/configure.in	2007-03-06 11:07:38.000000000 -0500
---- configure.in	2007-11-23 15:37:41.000000000 -0500
+*** bash-3.2-patched/configure.in	2007-03-06 11:07:38.000000000 -0500
+--- bash-3.2/configure.in	2007-11-23 15:37:41.000000000 -0500
 ***************
 *** 519,523 ****
   		# dynamic version
@@ -37,8 +37,8 @@
 ! 		darwin[[89]]*)	READLINE_LIB='${READLINE_LIBRARY}' ;;
   		*)		READLINE_LIB=-lreadline ;;
   		esac
-*** ../bash-3.2-patched/configure	2007-03-24 14:51:22.000000000 -0400
---- configure	2007-11-23 15:46:15.000000000 -0500
+*** bash-3.2-patched/configure	2007-03-24 14:51:22.000000000 -0400
+--- bash-3.2/configure	2007-11-23 15:46:15.000000000 -0500
 ***************
 *** 4872,4876 ****
   		# dynamic version
@@ -52,8 +52,8 @@
 ! 		darwin[89]*)	READLINE_LIB='${READLINE_LIBRARY}' ;;
   		*)		READLINE_LIB=-lreadline ;;
   		esac
-*** ../bash-3.2-patched/version.c	2005-05-16 11:58:34.000000000 -0400
---- version.c	2007-11-23 16:03:40.000000000 -0500
+*** bash-3.2-patched/version.c	2005-05-16 11:58:34.000000000 -0400
+--- bash-3.2/version.c	2007-11-23 16:03:40.000000000 -0500
 ***************
 *** 80,83 ****
     printf ("GNU bash, version %s (%s)\n", shell_version_string (), MACHTYPE);
@@ -65,8 +65,8 @@
     if (extended)
 !     printf (_("Copyright (C) 2007 Free Software Foundation, Inc.\n"));
   }
-*** ../bash-3.2/patchlevel.h	Thu Apr 13 08:31:04 2006
---- patchlevel.h	Mon Oct 16 14:22:54 2006
+*** bash-3.2/patchlevel.h	Thu Apr 13 08:31:04 2006
+--- bash-3.2/patchlevel.h	Mon Oct 16 14:22:54 2006
 ***************
 *** 26,30 ****
      looks for to find the patch level (for the sccs version string). */

Modified: trunk/buildroot/package/bash/bash32-027
===================================================================
--- trunk/buildroot/package/bash/bash32-027	2008-05-01 19:03:48 UTC (rev 21912)
+++ trunk/buildroot/package/bash/bash32-027	2008-05-01 19:07:58 UTC (rev 21913)
@@ -16,8 +16,8 @@
 
 Patch:
 
-*** ../bash-3.2.25/lib/readline/display.c	Mon Aug  6 14:26:29 2007
---- lib/readline/display.c	Wed Oct 10 22:43:58 2007
+*** bash-3.2.25/lib/readline/display.c	Mon Aug  6 14:26:29 2007
+--- bash-3.2/lib/readline/display.c	Wed Oct 10 22:43:58 2007
 ***************
 *** 1049,1053 ****
   	      else
@@ -68,8 +68,8 @@
 !       _rl_last_c_pos == prompt_physical_chars)
       cpos_adjusted = 1;
   #endif
-*** ../bash-3.2/patchlevel.h	Thu Apr 13 08:31:04 2006
---- patchlevel.h	Mon Oct 16 14:22:54 2006
+*** bash-3.2/patchlevel.h	Thu Apr 13 08:31:04 2006
+--- bash-3.2/patchlevel.h	Mon Oct 16 14:22:54 2006
 ***************
 *** 26,30 ****
      looks for to find the patch level (for the sccs version string). */

Modified: trunk/buildroot/package/bash/bash32-028
===================================================================
--- trunk/buildroot/package/bash/bash32-028	2008-05-01 19:03:48 UTC (rev 21912)
+++ trunk/buildroot/package/bash/bash32-028	2008-05-01 19:07:58 UTC (rev 21913)
@@ -15,8 +15,8 @@
 
 Patch:
 
-*** ../bash-3.2-patched/lib/readline/display.c	2007-08-25 13:47:08.000000000 -0400
---- lib/readline/display.c	2007-11-10 17:51:29.000000000 -0500
+*** bash-3.2-patched/lib/readline/display.c	2007-08-25 13:47:08.000000000 -0400
+--- bash-3.2/lib/readline/display.c	2007-11-10 17:51:29.000000000 -0500
 ***************
 *** 392,396 ****
         local_prompt = expand_prompt (p, &prompt_visible_length,
@@ -43,8 +43,8 @@
 ! 						   (int *)NULL,
   						   (int *)NULL);
         *t = c;
-*** ../bash-3.2/patchlevel.h	Thu Apr 13 08:31:04 2006
---- patchlevel.h	Mon Oct 16 14:22:54 2006
+*** bash-3.2/patchlevel.h	Thu Apr 13 08:31:04 2006
+--- bash-3.2/patchlevel.h	Mon Oct 16 14:22:54 2006
 ***************
 *** 26,30 ****
      looks for to find the patch level (for the sccs version string). */

Modified: trunk/buildroot/package/bash/bash32-029
===================================================================
--- trunk/buildroot/package/bash/bash32-029	2008-05-01 19:03:48 UTC (rev 21912)
+++ trunk/buildroot/package/bash/bash32-029	2008-05-01 19:07:58 UTC (rev 21913)
@@ -16,8 +16,8 @@
 
 Patch:
 
-*** ../bash-3.2-patched/expr.c	2007-08-25 13:47:05.000000000 -0400
---- expr.c	2007-10-18 08:08:44.000000000 -0400
+*** bash-3.2-patched/expr.c	2007-08-25 13:47:05.000000000 -0400
+--- bash-3.2/expr.c	2007-10-18 08:08:44.000000000 -0400
 ***************
 *** 287,290 ****
 --- 287,292 ----
@@ -35,8 +35,8 @@
 +   noeval = 0;
   
     FASTCOPY (evalbuf, oevalbuf, sizeof (evalbuf));
-*** ../bash-3.2/patchlevel.h	Thu Apr 13 08:31:04 2006
---- patchlevel.h	Mon Oct 16 14:22:54 2006
+*** bash-3.2/patchlevel.h	Thu Apr 13 08:31:04 2006
+--- bash-3.2/patchlevel.h	Mon Oct 16 14:22:54 2006
 ***************
 *** 26,30 ****
      looks for to find the patch level (for the sccs version string). */

Modified: trunk/buildroot/package/bash/bash32-030
===================================================================
--- trunk/buildroot/package/bash/bash32-030	2008-05-01 19:03:48 UTC (rev 21912)
+++ trunk/buildroot/package/bash/bash32-030	2008-05-01 19:07:58 UTC (rev 21913)
@@ -16,8 +16,8 @@
 
 Patch:
 
-*** ../bash-3.2-patched/execute_cmd.c	2007-03-24 14:51:05.000000000 -0400
---- execute_cmd.c	2007-11-05 22:31:14.000000000 -0500
+*** bash-3.2-patched/execute_cmd.c	2007-03-24 14:51:05.000000000 -0400
+--- bash-3.2/execute_cmd.c	2007-11-05 22:31:14.000000000 -0500
 ***************
 *** 615,619 ****
         redirection_undo_list = (REDIRECT *)NULL;
@@ -31,8 +31,8 @@
 !       return (last_command_exit_value = EXECUTION_FAILURE);
       }
 
-*** ../bash-3.2/patchlevel.h	Thu Apr 13 08:31:04 2006
---- patchlevel.h	Mon Oct 16 14:22:54 2006
+*** bash-3.2/patchlevel.h	Thu Apr 13 08:31:04 2006
+--- bash-3.2/patchlevel.h	Mon Oct 16 14:22:54 2006
 ***************
 *** 26,30 ****
      looks for to find the patch level (for the sccs version string). */

Modified: trunk/buildroot/package/bash/bash32-031
===================================================================
--- trunk/buildroot/package/bash/bash32-031	2008-05-01 19:03:48 UTC (rev 21912)
+++ trunk/buildroot/package/bash/bash32-031	2008-05-01 19:07:58 UTC (rev 21913)
@@ -17,8 +17,8 @@
 
 Patch:
 
-*** ../bash-3.2-patched/lib/readline/display.c	2007-08-25 13:47:08.000000000 -0400
---- lib/readline/display.c	2007-11-10 17:51:29.000000000 -0500
+*** bash-3.2-patched/lib/readline/display.c	2007-08-25 13:47:08.000000000 -0400
+--- bash-3.2/lib/readline/display.c	2007-11-10 17:51:29.000000000 -0500
 ***************
 *** 1566,1574 ****
   	  else
@@ -45,8 +45,8 @@
 + 		}
   	      return;
   	    }
-*** ../bash-3.2/patchlevel.h	Thu Apr 13 08:31:04 2006
---- patchlevel.h	Mon Oct 16 14:22:54 2006
+*** bash-3.2/patchlevel.h	Thu Apr 13 08:31:04 2006
+--- bash-3.2/patchlevel.h	Mon Oct 16 14:22:54 2006
 ***************
 *** 26,30 ****
      looks for to find the patch level (for the sccs version string). */

Modified: trunk/buildroot/package/bash/bash32-032
===================================================================
--- trunk/buildroot/package/bash/bash32-032	2008-05-01 19:03:48 UTC (rev 21912)
+++ trunk/buildroot/package/bash/bash32-032	2008-05-01 19:07:58 UTC (rev 21913)
@@ -15,8 +15,8 @@
 
 Patch:
 
-*** ../bash-3.2-patched/lib/readline/input.c	2007-08-25 13:47:10.000000000 -0400
---- lib/readline/input.c	2007-10-12 22:55:25.000000000 -0400
+*** bash-3.2-patched/lib/readline/input.c	2007-08-25 13:47:10.000000000 -0400
+--- bash-3.2/lib/readline/input.c	2007-10-12 22:55:25.000000000 -0400
 ***************
 *** 155,159 ****
         pop_index--;
@@ -30,8 +30,8 @@
 ! 	pop_index = ibuffer_len;
         ibuffer[pop_index] = key;
         return (1);
-*** ../bash-3.2/patchlevel.h	Thu Apr 13 08:31:04 2006
---- patchlevel.h	Mon Oct 16 14:22:54 2006
+*** bash-3.2/patchlevel.h	Thu Apr 13 08:31:04 2006
+--- bash-3.2/patchlevel.h	Mon Oct 16 14:22:54 2006
 ***************
 *** 26,30 ****
      looks for to find the patch level (for the sccs version string). */

Modified: trunk/buildroot/package/bash/bash32-033
===================================================================
--- trunk/buildroot/package/bash/bash32-033	2008-05-01 19:03:48 UTC (rev 21912)
+++ trunk/buildroot/package/bash/bash32-033	2008-05-01 19:07:58 UTC (rev 21913)
@@ -16,8 +16,8 @@
 
 Patch:
 
-*** ../bash-3.2-patched/arrayfunc.c	2007-08-25 13:47:05.000000000 -0400
---- arrayfunc.c	2007-05-31 11:55:46.000000000 -0400
+*** bash-3.2-patched/arrayfunc.c	2007-08-25 13:47:05.000000000 -0400
+--- bash-3.2/arrayfunc.c	2007-05-31 11:55:46.000000000 -0400
 ***************
 *** 723,727 ****
       {
@@ -31,8 +31,8 @@
 ! 	*rtype = (t[0] == '*') ? 1 : 2;
         if (allow_all == 0)
   	{
-*** ../bash-3.2-patched/subst.c	2007-08-25 13:47:08.000000000 -0400
---- subst.c	2007-11-14 15:43:00.000000000 -0500
+*** bash-3.2-patched/subst.c	2007-08-25 13:47:08.000000000 -0400
+--- bash-3.2/subst.c	2007-11-14 15:43:00.000000000 -0500
 ***************
 *** 4908,4915 ****
     intmax_t arg_index;
@@ -70,8 +70,8 @@
 +       ret->flags |= rflags;
       }
     return ret;
-*** ../bash-3.2/patchlevel.h	Thu Apr 13 08:31:04 2006
---- patchlevel.h	Mon Oct 16 14:22:54 2006
+*** bash-3.2/patchlevel.h	Thu Apr 13 08:31:04 2006
+--- bash-3.2/patchlevel.h	Mon Oct 16 14:22:54 2006
 ***************
 *** 26,30 ****
      looks for to find the patch level (for the sccs version string). */
