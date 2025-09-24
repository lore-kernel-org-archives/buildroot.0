Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A89CBCAC5AE
	for <buildroot@archiver.kernel.org>; Wed, 24 Sep 2025 19:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57430831DB;
	Wed, 24 Sep 2025 19:01:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RHoOy3U7GeSh; Wed, 24 Sep 2025 19:01:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FF1283196
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FF1283196;
	Wed, 24 Sep 2025 19:01:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DD4E8177
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 19:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CFC5040C4C
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 19:01:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kte6_Yha9rr3 for <buildroot@buildroot.org>;
 Wed, 24 Sep 2025 19:01:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDB7740B2C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDB7740B2C
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 19:01:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BA84F863A8; Wed, 24 Sep 2025 19:01:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 24 Sep 2025 19:43:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 39ea74ffc7d6387af0a3040542008960c7cdbf2f
X-Git-Newrev: 42d36a4133f2304d9cbaa7632ea794280095898a
X-Patchwork-Hint: ignore
Message-Id: <20250924190107.BA84F863A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bc: bump to 1.08.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=42d36a4133f2304d9cbaa7632ea794280095898a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update patch 2 and drop patch 3 and 4 because integrated in the
new version.

Release notes:
https://mail.gnu.org/archive/html/info-gnu/2025-01/msg00000.html
https://lists.gnu.org/archive/html/info-gnu/2025-01/msg00002.html
https://lists.gnu.org/archive/html/info-gnu/2025-05/msg00006.html

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |   2 -
 ...read-and-write-errors-on-input-and-output.patch | 515 +++++----------------
 .../bc/0003-dc-fix-exit-code-of-q-command.patch    |  46 --
 package/bc/0004-no-gen-libmath.patch               |  97 ----
 package/bc/bc.hash                                 |   2 +-
 package/bc/bc.mk                                   |   6 +-
 6 files changed, 129 insertions(+), 539 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 50471f3f85..a3437c1cf3 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -242,8 +242,6 @@ package/bash/0001-input.h-add-missing-include-on-stdio.h.patch lib_patch.Upstrea
 package/bash/0002-parse.y-fix-compilation-for-non-multibyte-builds.patch lib_patch.Upstream
 package/bc/0001-bc-use-MAKEINFO-variable-for-docs.patch lib_patch.Upstream
 package/bc/0002-notice-read-and-write-errors-on-input-and-output.patch lib_patch.Upstream
-package/bc/0003-dc-fix-exit-code-of-q-command.patch lib_patch.Upstream
-package/bc/0004-no-gen-libmath.patch lib_patch.Upstream
 package/bcache-tools/0001-Don-t-inline-crc64-for-gcc-5-compatability.patch lib_patch.Upstream
 package/bctoolbox/0001-Fix-Libs.private-flags-for-mbedtls.patch lib_patch.Upstream
 package/bcusdk/0002-eibd-fix-endless-recursion-when-using-USB-backends.patch lib_patch.Upstream
diff --git a/package/bc/0002-notice-read-and-write-errors-on-input-and-output.patch b/package/bc/0002-notice-read-and-write-errors-on-input-and-output.patch
index 7649ae8c4f..c83815f9a2 100644
--- a/package/bc/0002-notice-read-and-write-errors-on-input-and-output.patch
+++ b/package/bc/0002-notice-read-and-write-errors-on-input-and-output.patch
@@ -1,4 +1,4 @@
-From af96fb92052c307818eefa4b687f964f1e3f542e Mon Sep 17 00:00:00 2001
+From f9a0d6d4395d5377bd1c41bebbd2190e0971beb9 Mon Sep 17 00:00:00 2001
 From: Matt Weber <matthew.weber@rockwellcollins.com>
 Date: Thu, 12 Sep 2019 15:04:35 -0500
 Subject: [PATCH] notice read and write errors on input and output
@@ -30,28 +30,30 @@ Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 [Bernd:
  Updated to incorporate changes by Matthias Klose <doko@debian.org>
  on 2024-03-13 that fix Debian bug https://bugs.debian.org/1065375]
+[dario: update patch for 1.08.2]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  bc/execute.c | 10 +++++++++-
  bc/main.c    |  3 +++
  bc/sbc.y     |  2 ++
  bc/scan.c    |  2 ++
  bc/scan.l    |  3 +++
- bc/util.c    | 15 ++++++++++++--
- dc/dc.c      |  3 +++
- dc/eval.c    | 55 +++++++++++++++++++++++++++++++++++++++-------------
- dc/misc.c    |  1 +
- dc/numeric.c |  9 +++++++++
- dc/stack.c   | 11 ++++++++++-
- dc/string.c  |  2 ++
- h/number.h   | 11 +++++++----
- lib/number.c | 24 +++++++++++++++++++++++
- 14 files changed, 129 insertions(+), 22 deletions(-)
+ bc/util.c    | 15 +++++++++++++--
+ dc/dc.c      |  4 ++++
+ dc/eval.c    |  2 ++
+ dc/misc.c    |  3 +++
+ dc/numeric.c |  5 +++++
+ dc/stack.c   |  2 ++
+ dc/string.c  |  3 +++
+ h/number.h   | 10 ++++++----
+ lib/number.c | 24 ++++++++++++++++++++++++
+ 14 files changed, 81 insertions(+), 7 deletions(-)
 
 diff --git a/bc/execute.c b/bc/execute.c
-index 256e4b7..50eac49 100644
+index e653a9d75979..3374a38e5fb6 100644
 --- a/bc/execute.c
 +++ b/bc/execute.c
-@@ -104,6 +104,7 @@ execute (void)
+@@ -105,6 +105,7 @@ execute (void)
  	      }
  	    out_char ('\n');
  	  }
@@ -59,7 +61,7 @@ index 256e4b7..50eac49 100644
        }
  #endif
  
-@@ -224,6 +225,7 @@ execute (void)
+@@ -225,6 +226,7 @@ execute (void)
  		}
  	    }
  	fflush (stdout);
@@ -67,7 +69,7 @@ index 256e4b7..50eac49 100644
  	break;
  
        case 'R' : /* Return from function */
-@@ -259,6 +261,7 @@ execute (void)
+@@ -260,6 +262,7 @@ execute (void)
  	if (inst == 'W') out_char ('\n');
  	store_var (4);  /* Special variable "last". */
  	fflush (stdout);
@@ -75,7 +77,7 @@ index 256e4b7..50eac49 100644
  	pop ();
  	break;
  
-@@ -342,6 +345,7 @@ execute (void)
+@@ -343,6 +346,7 @@ execute (void)
        case 'w' : /* Write a string to the output. */
  	while ((ch = byte(&pc)) != '"') out_schar (ch);
  	fflush (stdout);
@@ -83,7 +85,7 @@ index 256e4b7..50eac49 100644
  	break;
  		   
        case 'x' : /* Exchange Top of Stack with the one under the tos. */
-@@ -549,7 +553,10 @@ execute (void)
+@@ -550,7 +554,10 @@ execute (void)
      {
        signal (SIGINT, use_quit);
        if (had_sigint)
@@ -95,7 +97,7 @@ index 256e4b7..50eac49 100644
      }
  }
  
-@@ -584,6 +591,7 @@ input_char (void)
+@@ -585,6 +592,7 @@ input_char (void)
  	  out_col = 0;  /* Saw a new line */
  	}
      }
@@ -104,10 +106,10 @@ index 256e4b7..50eac49 100644
    /* Classify and preprocess the input character. */
    if (isdigit(in_ch))
 diff --git a/bc/main.c b/bc/main.c
-index 012075c..c96207b 100644
+index b388e17b55bf..ab662dd10fc7 100644
 --- a/bc/main.c
 +++ b/bc/main.c
-@@ -353,6 +353,9 @@ use_quit (int sig)
+@@ -358,6 +358,9 @@ use_quit (int sig)
    errno = save;
  #else
    write (1, "\n(interrupt) Exiting bc.\n", 26);
@@ -118,7 +120,7 @@ index 012075c..c96207b 100644
  #endif
  }
 diff --git a/bc/sbc.y b/bc/sbc.y
-index 586686b..921ab1e 100644
+index 586686b4b71f..921ab1e13144 100644
 --- a/bc/sbc.y
 +++ b/bc/sbc.y
 @@ -86,7 +86,9 @@ program			: /* empty */
@@ -132,10 +134,10 @@ index 586686b..921ab1e 100644
  			    }
  			| program input_item
 diff --git a/bc/scan.c b/bc/scan.c
-index b237f55..8dee4e9 100644
+index e208c8e7b3ba..5ac4c80fd732 100644
 --- a/bc/scan.c
 +++ b/bc/scan.c
-@@ -791,6 +791,7 @@ bcel_input (char *buf, yy_size_t  *result, int max)
+@@ -776,6 +776,7 @@ bcel_input (char *buf, int *result, int max)
        if (bcel_len != 0)
  	history (hist, &histev, H_ENTER, bcel_line); 
        fflush (stdout);
@@ -143,7 +145,7 @@ index b237f55..8dee4e9 100644
      }
  
    if (bcel_len <= max)
-@@ -863,6 +864,7 @@ rl_input (char *buf, int *result, int max)
+@@ -848,6 +849,7 @@ rl_input (char *buf, int *result, int max)
  	add_history (rl_line); 
        rl_line[rl_len-1] = '\n';
        fflush (stdout);
@@ -152,10 +154,10 @@ index b237f55..8dee4e9 100644
  
    if (rl_len <= max)
 diff --git a/bc/scan.l b/bc/scan.l
-index eb2e2dd..79186bb 100644
+index 958538d6fed0..009f8b196a5e 100644
 --- a/bc/scan.l
 +++ b/bc/scan.l
-@@ -99,6 +99,7 @@ bcel_input (char *buf, yy_size_t  *result, int max)
+@@ -100,6 +100,7 @@ bcel_input (char *buf, int *result, int max)
        if (bcel_len != 0)
  	history (hist, &histev, H_ENTER, bcel_line); 
        fflush (stdout);
@@ -163,7 +165,7 @@ index eb2e2dd..79186bb 100644
      }
  
    if (bcel_len <= max)
-@@ -171,6 +172,7 @@ rl_input (char *buf, int *result, int max)
+@@ -172,6 +173,7 @@ rl_input (char *buf, int *result, int max)
  	add_history (rl_line); 
        rl_line[rl_len-1] = '\n';
        fflush (stdout);
@@ -171,7 +173,7 @@ index eb2e2dd..79186bb 100644
      }
  
    if (rl_len <= max)
-@@ -295,6 +297,7 @@ limits return(Limits);
+@@ -296,6 +298,7 @@ limits return(Limits);
  	    if (c == EOF)
  	      {
  		fprintf (stderr,"EOF encountered in a comment.\n");
@@ -180,10 +182,10 @@ index eb2e2dd..79186bb 100644
  	      }
  	  }
 diff --git a/bc/util.c b/bc/util.c
-index 8eba093..cacd796 100644
+index 7abc2a0af309..ce7cc404fb0b 100644
 --- a/bc/util.c
 +++ b/bc/util.c
-@@ -247,9 +247,10 @@ init_gen (void)
+@@ -248,9 +248,10 @@ init_gen (void)
    continue_label = 0;
    next_label  = 1;
    out_count = 2;
@@ -196,7 +198,7 @@ index 8eba093..cacd796 100644
      init_load ();
    had_error = FALSE;
    did_gen = FALSE;
-@@ -272,6 +273,7 @@ generate (const char *str)
+@@ -273,6 +274,7 @@ generate (const char *str)
  	  printf ("\n");
  	  out_count = 0;
  	}
@@ -204,7 +206,7 @@ index 8eba093..cacd796 100644
      }
    else
      load_code (str);
-@@ -289,6 +291,7 @@ run_code(void)
+@@ -290,6 +292,7 @@ run_code(void)
        if (compile_only)
  	{
  	  printf ("@r\n"); 
@@ -212,7 +214,7 @@ index 8eba093..cacd796 100644
  	  out_count = 0;
  	}
        else
-@@ -326,6 +329,7 @@ out_char (int ch)
+@@ -327,6 +330,7 @@ out_char (int ch)
  	}
        putchar (ch);
      }
@@ -220,7 +222,7 @@ index 8eba093..cacd796 100644
  }
  
  /* Output routines: Write a character CH to the standard output.
-@@ -355,6 +359,7 @@ out_schar (int ch)
+@@ -356,6 +360,7 @@ out_schar (int ch)
  	}
        putchar (ch);
      }
@@ -228,7 +230,7 @@ index 8eba093..cacd796 100644
  }
  
  
-@@ -639,6 +644,7 @@ limits(void)
+@@ -640,6 +645,7 @@ limits(void)
  #ifdef OLD_EQ_OP
    printf ("Old assignment operatiors are valid. (=-, =+, ...)\n");
  #endif 
@@ -236,7 +238,7 @@ index 8eba093..cacd796 100644
  }
  
  /* bc_malloc will check the return value so all other places do not
-@@ -703,6 +709,7 @@ yyerror (str, va_alist)
+@@ -704,6 +710,7 @@ yyerror (str, va_alist)
    fprintf (stderr,"%s %d: ",name,line_no);
    vfprintf (stderr, str, args);
    fprintf (stderr, "\n");
@@ -244,7 +246,7 @@ index 8eba093..cacd796 100644
    had_error = TRUE;
    va_end (args);
  }
-@@ -743,6 +750,7 @@ ct_warn (mesg, va_alist)
+@@ -744,6 +751,7 @@ ct_warn (mesg, va_alist)
        fprintf (stderr,"%s %d: Error: ",name,line_no);
        vfprintf (stderr, mesg, args);
        fprintf (stderr, "\n");
@@ -252,7 +254,7 @@ index 8eba093..cacd796 100644
        had_error = TRUE;
      }
    else
-@@ -755,6 +763,7 @@ ct_warn (mesg, va_alist)
+@@ -756,6 +764,7 @@ ct_warn (mesg, va_alist)
  	fprintf (stderr,"%s %d: (Warning) ",name,line_no);
  	vfprintf (stderr, mesg, args);
  	fprintf (stderr, "\n");
@@ -260,7 +262,7 @@ index 8eba093..cacd796 100644
        }
    va_end (args);
  }
-@@ -789,6 +798,7 @@ rt_error (mesg, va_alist)
+@@ -790,6 +799,7 @@ rt_error (mesg, va_alist)
    va_end (args);
    
    fprintf (stderr, "\n");
@@ -268,7 +270,7 @@ index 8eba093..cacd796 100644
    runtime_error = TRUE;
  }
  
-@@ -823,6 +833,7 @@ rt_warn (const char *mesg)
+@@ -824,6 +834,7 @@ rt_warn (const char *mesg)
    va_end (args);
  
    fprintf (stderr, "\n");
@@ -277,26 +279,26 @@ index 8eba093..cacd796 100644
  
  /* bc_exit: Make sure to reset the edit state. */
 diff --git a/dc/dc.c b/dc/dc.c
-index 6a2bb26..ccdb1c2 100644
+index 92a843cbdcdc..c5ea5753c91e 100644
 --- a/dc/dc.c
 +++ b/dc/dc.c
-@@ -45,6 +45,7 @@
- #include <getopt.h>
+@@ -36,6 +36,7 @@
+ #endif
+ #include "../h/getopt.h"
  #include "dc.h"
- #include "dc-proto.h"
-+#include "number.h"
++#include "../h/number.h"
  
- #ifndef EXIT_SUCCESS	/* C89 <stdlib.h> */
- # define EXIT_SUCCESS	0
-@@ -59,6 +59,7 @@ static void
- bug_report_info DC_DECLVOID()
+ const char *progname;	/* basename of program invocation */
+ unsigned int max_recursion_depth=0;
+@@ -44,6 +45,7 @@ static void
+ bug_report_info(void)
  {
  	printf("Email bug reports to:  bug-dc@gnu.org .\n");
 +	checkferror_output(stdout);
  }
  
  static void
-@@ -69,6 +70,7 @@ show_version DC_DECLVOID()
+@@ -54,6 +56,7 @@ show_version(void)
  This is free software; see the source for copying conditions.  There is NO\n\
  warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE,\n\
  to the extent permitted by law.\n", DC_COPYRIGHT);
@@ -304,243 +306,54 @@ index 6a2bb26..ccdb1c2 100644
  }
  
  /* your generic usage function */
-@@ -85,6 +87,7 @@ Usage: %s [OPTION] [file ...]\n\
+@@ -71,6 +74,7 @@ Usage: %s [OPTION] [file ...]\n\
  \n\
  ", progname);
  	bug_report_info();
 +	checkferror_output(f);
  }
  
- /* returns a pointer to one past the last occurance of c in s,
+ /* returns a pointer to one past the last occurrence of c in s,
 diff --git a/dc/eval.c b/dc/eval.c
-index 05a3d9e..6c54e61 100644
+index 30d0a20381d1..26e6d21256f9 100644
 --- a/dc/eval.c
 +++ b/dc/eval.c
-@@ -41,6 +41,7 @@
+@@ -33,6 +33,7 @@
+ # include <unistd.h> /* isatty */
  #endif
  #include "dc.h"
- #include "dc-proto.h"
-+#include "number.h"
- 
- typedef enum {DC_FALSE, DC_TRUE} dc_boolean;
- 
-@@ -97,12 +97,15 @@ static int input_pushback;
- static int
- input_fil DC_DECLVOID()
- {
-+		int c;
- 	if (input_pushback != EOF){
--		int c = input_pushback;
-+		c = input_pushback;
- 		input_pushback = EOF;
- 		return c;
- 	}
--	return getc(input_fil_fp);
-+	c = getc(input_fil_fp);
-+	checkferror_input(input_fil_fp);
-+	return c;
- }
- 
- /* passed as an argument to dc_getnum */
-@@ -301,11 +304,13 @@ dc_func DC_DECLARG((c, peekc, negcmp))
- 				tmpint = dc_num2int(datum.v.number, DC_TOSS);
- 			if (2 <= tmpint  &&  tmpint <= DC_IBASE_MAX)
- 				dc_ibase = tmpint;
--			else
-+			else {
- 				fprintf(stderr,
- 						"%s: input base must be a number \
- between 2 and %d (inclusive)\n",
- 						progname, DC_IBASE_MAX);
-+				checkferror_output(stderr);
-+			}
- 		}
- 		break;
- 	case 'k':	/* set scale to value on top of stack */
-@@ -313,11 +318,12 @@ between 2 and %d (inclusive)\n",
- 			tmpint = -1;
- 			if (datum.dc_type == DC_NUMBER)
- 				tmpint = dc_num2int(datum.v.number, DC_TOSS);
--			if ( ! (tmpint >= 0) )
-+			if ( ! (tmpint >= 0) ) {
- 				fprintf(stderr,
- 						"%s: scale must be a nonnegative number\n",
- 						progname);
--			else
-+				checkferror_output(stderr);
-+			} else
- 				dc_scale = tmpint;
- 		}
- 		break;
-@@ -341,11 +347,12 @@ between 2 and %d (inclusive)\n",
- 			tmpint = 0;
- 			if (datum.dc_type == DC_NUMBER)
- 				tmpint = dc_num2int(datum.v.number, DC_TOSS);
--			if ( ! (tmpint > 1) )
-+			if ( ! (tmpint > 1) ) {
- 				fprintf(stderr,
- 						"%s: output base must be a number greater than 1\n",
- 						progname);
--			else
-+				checkferror_output(stderr);
-+			} else
- 				dc_obase = tmpint;
- 		}
- 		break;
-@@ -378,6 +385,7 @@ between 2 and %d (inclusive)\n",
- 				fprintf(stderr,
- 						"%s: square root of nonnumeric attempted\n",
- 						progname);
-+				checkferror_output(stderr);
- 			}else if (dc_sqrt(datum.v.number, dc_scale, &tmpnum) == DC_SUCCESS){
- 				dc_free_num(&datum.v.number);
- 				datum.v.number = tmpnum;
-@@ -424,6 +432,7 @@ between 2 and %d (inclusive)\n",
- 				dc_garbage("at top of stack", -1);
- 		}
- 		fflush(stdout);
-+		checkferror_output(stdout);
- 		break;
- 	case 'Q':	/* quit out of top-of-stack nested evals;
- 				 * pops value from stack;
-@@ -440,6 +449,7 @@ between 2 and %d (inclusive)\n",
- 			fprintf(stderr,
- 					"%s: Q command requires a number >= 1\n",
- 					progname);
-+			checkferror_output(stderr);
- 		}
- 		break;
- 	case 'R':	/* pop a value off of the evaluation stack,;
-@@ -483,11 +493,12 @@ between 2 and %d (inclusive)\n",
- 			if (datum.dc_type == DC_NUMBER)
- 				tmpint = dc_num2int(datum.v.number, DC_TOSS);
- 			if (dc_pop(&datum) == DC_SUCCESS){
--				if (tmpint < 0)
-+				if (tmpint < 0) {
- 					fprintf(stderr,
- 							"%s: array index must be a nonnegative integer\n",
- 							progname);
--				else
-+					checkferror_output(stderr);
-+				} else
- 					dc_array_set(peekc, tmpint, datum);
- 			}
- 		}
-@@ -499,18 +510,21 @@ between 2 and %d (inclusive)\n",
- 			tmpint = -1;
- 			if (datum.dc_type == DC_NUMBER)
- 				tmpint = dc_num2int(datum.v.number, DC_TOSS);
--			if (tmpint < 0)
-+			if (tmpint < 0) {
- 				fprintf(stderr,
- 						"%s: array index must be a nonnegative integer\n",
- 						progname);
--			else
-+				checkferror_output(stderr);
-+			} else
- 				dc_push(dc_array_get(peekc, tmpint));
- 		}
- 		return DC_EATONE;
- 
- 	default:	/* What did that user mean? */
- 		fprintf(stderr, "%s: ", progname);
-+		checkferror_output(stderr);
- 		dc_show_id(stdout, c, " unimplemented\n");
-+		checkferror_output(stdout);
- 		break;
- 	}
- 	return DC_OKAY;
-@@ -538,6 +552,7 @@ evalstr DC_DECLARG((string))
- 		fprintf(stderr,
- 				"%s: eval called with non-string argument\n",
- 				progname);
-+		checkferror_output(stderr);
- 		return DC_OKAY;
- 	}
- 	interrupt_seen = 0;
-@@ -635,6 +650,7 @@ evalstr DC_DECLARG((string))
- 				return DC_FAIL;
- 			}
- 			fprintf(stderr, "%s: unexpected EOS\n", progname);
++#include "../h/number.h"
+ 
+ typedef enum {
+ 	DC_OKAY,	//no further intervention needed for this command
+@@ -421,6 +422,7 @@ dc_nextcmd(void)
+ 				||  tmpint < 2  ||  DC_IBASE_MAX < tmpint) {
+ 			fprintf(stderr, "%s: input base must be a number "
+ 					"between 2 and %d (inclusive)\n", progname, DC_IBASE_MAX);
 +			checkferror_output(stderr);
- 			return DC_OKAY;
- 		}
- 	}
-@@ -692,6 +708,7 @@ dc_evalfile DC_DECLARG((fp))
- 	stdin_lookahead = EOF;
- 	for (c=getc(fp); c!=EOF; c=peekc){
- 		peekc = getc(fp);
-+		checkferror_input(stdin);
- 		/*
- 		 * The following if() is the only place where ``stdin_lookahead''
- 		 * might be set to other than EOF:
-@@ -717,24 +734,30 @@ dc_evalfile DC_DECLARG((fp))
- 		signal(SIGINT, sigint_handler);
- 		switch (dc_func(c, peekc, negcmp)){
- 		case DC_OKAY:
--			if (stdin_lookahead != peekc  &&  fp == stdin)
-+			if (stdin_lookahead != peekc  &&  fp == stdin) {
- 				peekc = getc(fp);
-+				checkferror_input(stdin);
-+			}
  			break;
- 		case DC_EATONE:
- 			peekc = getc(fp);
-+			checkferror_input(fp);
- 			break;
- 		case DC_EVALREG:
- 			/*commands which send us here shall guarantee that peekc!=EOF*/
- 			c = peekc;
- 			peekc = getc(fp);
-+			checkferror_input(fp);
- 			stdin_lookahead = peekc;
- 			if (dc_register_get(c, &datum) != DC_SUCCESS)
- 				break;
- 			dc_push(datum);
- 			/*@fallthrough@*/
- 		case DC_EVALTOS:
--			if (stdin_lookahead != peekc  &&  fp == stdin)
-+			if (stdin_lookahead != peekc  &&  fp == stdin) {
- 				peekc = getc(fp);
-+				checkferror_input(stdin);
-+			}
- 			if (dc_pop(&datum) == DC_SUCCESS){
- 				if (datum.dc_type == DC_NUMBER){
- 					dc_push(datum);
-@@ -744,6 +767,7 @@ dc_evalfile DC_DECLARG((fp))
- 							goto reset_and_exit_quit;
- 						fprintf(stderr, "%s: Q command argument exceeded \
- string execution depth\n", progname);
-+						checkferror_output(stderr);
- 					}
- 				}else{
- 					dc_garbage("at top of stack", -1);
-@@ -756,8 +780,11 @@ string execution depth\n", progname);
- 			fprintf(stderr,
- 					"%s: Q command argument exceeded string execution depth\n",
- 					progname);
--			if (stdin_lookahead != peekc  &&  fp == stdin)
-+			checkferror_output(stderr);
-+			if (stdin_lookahead != peekc  &&  fp == stdin) {
- 				peekc = getc(fp);
-+				checkferror_input(stdin);
-+			}
- 			break;
- 
- 		case DC_INT:
+ 		}
+ 		dc_discard_TOS();
 diff --git a/dc/misc.c b/dc/misc.c
-index cd23602..cd910b8 100644
+index e64f62aca1e9..17e337792a84 100644
 --- a/dc/misc.c
 +++ b/dc/misc.c
-@@ -47,6 +47,7 @@
- #include <getopt.h>
+@@ -31,12 +31,14 @@
+ #include <ctype.h>
  #include "dc.h"
- #include "dc-proto.h"
-+#include "number.h"
+ #include "../config.h"
++#include "../h/number.h"
+ 
+ /* print a simple warning message */
+ void
+ dc_warn(const char *msg)
+ {
+ 	fprintf(stderr, "%s: %s\n", progname, msg);
++	checkferror_output(stderr);
+ }
  
- #ifndef EXIT_FAILURE	/* C89 <stdlib.h> */
- # define EXIT_FAILURE	1
-@@ -89,6 +89,7 @@ dc_show_id DC_DECLARG((fp, id, suffix))
+ /* print an "out of memory" diagnostic and exit program */
+@@ -71,6 +73,7 @@ dc_show_id(FILE *fp, int id, const char *suffix)
  		fprintf(fp, "'%c' (%#o)%s", (unsigned int) id, id, suffix);
  	else
  		fprintf(fp, "%#o%s", (unsigned int) id, suffix);
@@ -549,42 +362,10 @@ index cd23602..cd910b8 100644
  
  
 diff --git a/dc/numeric.c b/dc/numeric.c
-index 37759de..60cfb85 100644
+index 556c5bd6478f..887688b0d64f 100644
 --- a/dc/numeric.c
 +++ b/dc/numeric.c
-@@ -133,6 +133,7 @@ dc_div DC_DECLARG((a, b, kscale, result))
- 	bc_init_num(CastNumPtr(result));
- 	if (bc_divide(CastNum(a), CastNum(b), CastNumPtr(result), kscale)){
- 		fprintf(stderr, "%s: divide by zero\n", progname);
-+		checkferror_output(stderr);
- 		return DC_DOMAIN_ERROR;
- 	}
- 	return DC_SUCCESS;
-@@ -155,6 +156,7 @@ dc_divrem DC_DECLARG((a, b, kscale, quotient, remainder))
- 	if (bc_divmod(CastNum(a), CastNum(b),
- 						CastNumPtr(quotient), CastNumPtr(remainder), kscale)){
- 		fprintf(stderr, "%s: divide by zero\n", progname);
-+		checkferror_output(stderr);
- 		return DC_DOMAIN_ERROR;
- 	}
- 	return DC_SUCCESS;
-@@ -173,6 +175,7 @@ dc_rem DC_DECLARG((a, b, kscale, result))
- 	bc_init_num(CastNumPtr(result));
- 	if (bc_modulo(CastNum(a), CastNum(b), CastNumPtr(result), kscale)){
- 		fprintf(stderr, "%s: remainder by zero\n", progname);
-+		checkferror_output(stderr);
- 		return DC_DOMAIN_ERROR;
- 	}
- 	return DC_SUCCESS;
-@@ -225,6 +228,7 @@ dc_sqrt DC_DECLARG((value, kscale, result))
- 	tmp = bc_copy_num(CastNum(value));
- 	if (!bc_sqrt(&tmp, kscale)){
- 		fprintf(stderr, "%s: square root of negative number\n", progname);
-+		checkferror_output(stderr);
- 		bc_free_num(&tmp);
- 		return DC_DOMAIN_ERROR;
- 	}
-@@ -470,6 +474,7 @@ dc_dump_num DC_DECLARG((dcvalue, discard_p))
+@@ -408,6 +408,7 @@ dc_dump_num(dc_num dcvalue)
  
  	for (cur=top_of_stack; cur; cur=next) {
  		putchar(cur->digit);
@@ -592,7 +373,7 @@ index 37759de..60cfb85 100644
  		next = cur->link;
  		free(cur);
  	}
-@@ -587,6 +592,8 @@ out_char (ch)
+@@ -493,6 +494,8 @@ out_char (int ch)
  			out_col = 1;
  		}
  		putchar(ch);
@@ -601,119 +382,72 @@ index 37759de..60cfb85 100644
  	}
  }
  
-@@ -626,6 +633,7 @@ rt_error (mesg, va_alist)
- 	vfprintf (stderr, mesg, args);
- 	va_end (args);
- 	fprintf (stderr, "\n");
+@@ -516,6 +519,7 @@ rt_error(const char *mesg, ...)
+ 	vfprintf(stderr, mesg, args);
+ 	va_end(args);
+ 	fprintf(stderr, "\n");
 +	checkferror_output(stderr);
  }
  
  
-@@ -659,6 +667,7 @@ rt_warn (mesg, va_alist)
- 	vfprintf (stderr, mesg, args);
- 	va_end (args);
- 	fprintf (stderr, "\n");
+@@ -533,6 +537,7 @@ rt_warn(const char *mesg, ...)
+ 	vfprintf(stderr, mesg, args);
+ 	va_end(args);
+ 	fprintf(stderr, "\n");
 +	checkferror_output(stderr);
  }
  
  
 diff --git a/dc/stack.c b/dc/stack.c
-index 49422df..174411d 100644
+index 35f8ee7cc876..36755e42a87d 100644
 --- a/dc/stack.c
 +++ b/dc/stack.c
-@@ -33,9 +33,13 @@
+@@ -28,6 +28,7 @@
+ #include <stdlib.h>
  #include "dc.h"
- #include "dc-proto.h"
  #include "dc-regdef.h"
-+#include "number.h"
++#include "../h/number.h"
  
  /* an oft-used error message: */
--#define Empty_Stack	fprintf(stderr, "%s: stack empty\n", progname)
-+#define Empty_Stack do{					\
-+    fprintf(stderr, "%s: stack empty\n", progname);	\
-+    checkferror_output(stderr);				\
-+  }while(0)
- 
- 
- /* simple linked-list implementation suffices: */
-@@ -91,6 +94,7 @@ dc_binop DC_DECLARG((op, kscale))
- 	if (dc_stack->value.dc_type!=DC_NUMBER
- 			|| dc_stack->link->value.dc_type!=DC_NUMBER){
- 		fprintf(stderr, "%s: non-numeric value\n", progname);
-+		checkferror_output(stderr);
- 		return;
- 	}
- 	(void)dc_pop(&b);
-@@ -131,6 +135,7 @@ dc_binop2 DC_DECLARG((op, kscale))
- 	if (dc_stack->value.dc_type!=DC_NUMBER
- 			|| dc_stack->link->value.dc_type!=DC_NUMBER){
- 		fprintf(stderr, "%s: non-numeric value\n", progname);
-+		checkferror_output(stderr);
- 		return;
- 	}
- 	(void)dc_pop(&b);
-@@ -169,6 +174,7 @@ dc_cmpop DC_DECLVOID()
- 	if (dc_stack->value.dc_type!=DC_NUMBER
- 			|| dc_stack->link->value.dc_type!=DC_NUMBER){
- 		fprintf(stderr, "%s: non-numeric value\n", progname);
-+		checkferror_output(stderr);
- 		return 0;
- 	}
- 	(void)dc_pop(&b);
-@@ -206,6 +212,7 @@ dc_triop DC_DECLARG((op, kscale))
- 			|| dc_stack->link->value.dc_type!=DC_NUMBER
- 			|| dc_stack->link->link->value.dc_type!=DC_NUMBER){
- 		fprintf(stderr, "%s: non-numeric value\n", progname);
-+		checkferror_output(stderr);
- 		return;
- 	}
- 	(void)dc_pop(&c);
-@@ -327,6 +334,7 @@ dc_register_get DC_DECLARG((regid, result))
- 		*result = dc_int2data(0);
- 	}else if (r->value.dc_type==DC_UNINITIALIZED){
- 		fprintf(stderr, "%s: BUG: register ", progname);
-+		checkferror_output(stderr);
- 		dc_show_id(stderr, regid, " exists but is uninitialized?\n");
- 		return DC_FAIL;
- 	}else{
-@@ -402,6 +410,7 @@ dc_register_pop DC_DECLARG((stackid, result))
+ #define Empty_Stack	dc_warn("stack empty")
+@@ -388,6 +389,7 @@ dc_register_pop(int stackid, dc_data *result)
  	r = dc_register[stackid];
- 	if (r==NULL || r->value.dc_type==DC_UNINITIALIZED){
+ 	if (!r || r->value.dc_type==DC_UNINITIALIZED){
  		fprintf(stderr, "%s: stack register ", progname);
 +		checkferror_output(stderr);
  		dc_show_id(stderr, stackid, " is empty\n");
  		return DC_FAIL;
  	}
 diff --git a/dc/string.c b/dc/string.c
-index dee9169..389d899 100644
+index 41b578c130d2..bc8cac8248df 100644
 --- a/dc/string.c
 +++ b/dc/string.c
-@@ -45,6 +45,7 @@
- #endif
+@@ -26,6 +26,7 @@
+ #include <stdlib.h>
+ #include <string.h>	/* memcpy */
  #include "dc.h"
- #include "dc-proto.h"
-+#include "number.h"
++#include "../h/number.h"
  
  /* here is the completion of the dc_string type: */
  struct dc_string {
-@@ -94,6 +94,7 @@ dc_out_str DC_DECLARG((value, discard_flag))
- 	dc_discard discard_flag DC_DECLEND
+@@ -71,6 +72,7 @@ void
+ dc_out_str(dc_str value, dc_discard discard_flag)
  {
  	fwrite(value->s_ptr, value->s_len, sizeof *value->s_ptr, stdout);
-+        checkferror_output(stdout);
++	checkferror_output(stdout);
  	if (discard_flag == DC_TOSS)
  		dc_free_str(&value);
  }
-@@ -169,6 +170,7 @@ dc_readstring DC_DECLARG((fp, ldelim, rdelim))
+@@ -155,6 +157,7 @@ dc_readstring(int (*input)(void), int ldelim, int rdelim, const char *augment)
  		}
  		*p++ = c;
  	}
-+	checkferror_input(fp);
- 	return dc_makestring(line_buf, (size_t)(p-line_buf));
- }
- 
++
+ 	if (c==EOF && p==line_buf)
+ 		return dc_makestring(NULL, 0, NULL);
+ 	return dc_makestring(line_buf, (size_t)(p-line_buf), augment);
 diff --git a/h/number.h b/h/number.h
-index abf6332..1983ab4 100644
+index b2d9f9eae46a..f6fc880de920 100644
 --- a/h/number.h
 +++ b/h/number.h
 @@ -23,10 +23,10 @@
@@ -731,19 +465,20 @@ index abf6332..1983ab4 100644
  *************************************************************************/
  
  #ifndef _NUMBER_H_
-@@ -140,4 +140,7 @@ void bc_out_num (bc_num num, int o_base, void (* out_char)(int),
- 			     int leading_zero);
- 
+@@ -142,6 +142,8 @@ void bc_out_num (bc_num num, int o_base, void (* out_char)(int),
  void bc_out_long (long val, int size, int space, void (*out_char)(int));
-+
+ 
+ 
 +void checkferror_input (FILE*);
 +void checkferror_output (FILE*);
- #endif
+ 
+ /* function prototypes for callbacks from the library which
+  * need to be provided by the application
 diff --git a/lib/number.c b/lib/number.c
-index f394e92..80b33e3 100644
+index f84f4fc87336..9d4553a14b37 100644
 --- a/lib/number.c
 +++ b/lib/number.c
-@@ -1713,6 +1713,7 @@ static void
+@@ -1714,6 +1714,7 @@ static void
  out_char (int c)
  {
    putchar(c);
@@ -751,7 +486,7 @@ index f394e92..80b33e3 100644
  }
  
  
-@@ -1721,6 +1722,7 @@ pn (bc_num num)
+@@ -1722,6 +1723,7 @@ pn (bc_num num)
  {
    bc_out_num (num, 10, out_char, 0);
    out_char ('\n');
@@ -759,7 +494,7 @@ index f394e92..80b33e3 100644
  }
  
  
-@@ -1732,6 +1734,28 @@ pv (char *name, unsigned char *num, int len)
+@@ -1733,6 +1735,28 @@ pv (char *name, unsigned char *num, int len)
    printf ("%s=", name);
    for (i=0; i<len; i++) printf ("%c",BCD_CHAR(num[i]));
    printf ("\n");
@@ -789,5 +524,5 @@ index f394e92..80b33e3 100644
 +	}
 +}
 -- 
-2.17.1
+2.43.0
 
diff --git a/package/bc/0003-dc-fix-exit-code-of-q-command.patch b/package/bc/0003-dc-fix-exit-code-of-q-command.patch
deleted file mode 100644
index 24f665c808..0000000000
--- a/package/bc/0003-dc-fix-exit-code-of-q-command.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 7243037e63bff34b08bb1c993787b98dee585b2f Mon Sep 17 00:00:00 2001
-From: Li Zhou <li.zhou@windriver.com>
-Date: Thu, 27 Jun 2019 13:10:47 +0800
-Subject: [PATCH] dc: fix exit code of q command
-
-The exit code for "echo q | dc" is 1 for dc-1.4.1;
-while the exit code for "echo q | dc" is 0 for dc-1.4.
-
-Here is the answer from ken@gnu.org:
-dc-1.4 was right.  There was a rewrite of a chunk of code for 1.4.1 to
-fix a corner case in the Q command, and somehow the placement of the
-clean-up label for the 'q' command got misplaced on the error-handling
-branch instead of the clean-exit branch.  The patch below fixes this
-(it is committed for whenever the next bc/dc release gets made).
-
-Thanks for the report,
-        --Ken Pizzini
-
-Upstream:
-https://git.yoctoproject.org/cgit.cgi/poky/plain/meta/recipes-extended/bc/bc/0001-dc-fix-exit-code-of-q-command.patch
-
-Signed-off-by: Li Zhou <li.zhou@windriver.com>
-Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
----
- dc/eval.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/dc/eval.c b/dc/eval.c
-index 6c54e61..9c28f18 100644
---- a/dc/eval.c
-+++ b/dc/eval.c
-@@ -841,10 +841,10 @@ error_fail:
- 	fprintf(stderr, "%s: ", progname);
- 	perror("error reading input");
- 	return DC_FAIL;
--reset_and_exit_quit:
- reset_and_exit_fail:
- 	signal(SIGINT, sigint_default);
- 	return DC_FAIL;
-+reset_and_exit_quit:
- reset_and_exit_success:
- 	signal(SIGINT, sigint_default);
- 	return DC_SUCCESS;
--- 
-2.17.1
-
diff --git a/package/bc/0004-no-gen-libmath.patch b/package/bc/0004-no-gen-libmath.patch
deleted file mode 100644
index 15b7b9e5a8..0000000000
--- a/package/bc/0004-no-gen-libmath.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From a543af443c5f86b24ca89a994b75b6ef4751ac66 Mon Sep 17 00:00:00 2001
-From: Matt Weber <matthew.weber@rockwellcollins.com>
-Date: Thu, 12 Sep 2019 15:12:40 -0500
-Subject: [PATCH] no gen libmath
-
-These rules are not cross-friendly so delete them.  libmath has been
-generated offline and included as part of this patch as the fbc tool
-used to generate that header is assuming the cross architecture and
-can't execute.
-
-Upstream:
-https://git.yoctoproject.org/cgit.cgi/poky/plain/meta/recipes-extended/bc/bc/no-gen-libmath.patch
-https://git.yoctoproject.org/cgit.cgi/poky/plain/meta/recipes-extended/bc/bc/libmath.h
-
-[Reformatted to GIT for 1.0.7.1 by Matt W]
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
----
- bc/Makefile.am |  8 --------
- bc/libmath.h   | 46 ++++++++++++++++++++++++++++++++++++++++++++++
- 2 files changed, 46 insertions(+), 8 deletions(-)
- create mode 100644 bc/libmath.h
-
-diff --git a/bc/Makefile.am b/bc/Makefile.am
-index d9d412e..f244241 100644
---- a/bc/Makefile.am
-+++ b/bc/Makefile.am
-@@ -31,14 +31,6 @@ global.o: libmath.h
- 
- fbcOBJ = main.o bc.o scan.o execute.o load.o storage.o util.o warranty.o
- 
--libmath.h: libmath.b $(fbcOBJ) $(LIBBC)
--	echo '{0}' > libmath.h
--	$(MAKE) global.o
--	$(LINK) -o fbc $(fbcOBJ) global.o $(LIBBC) $(LIBL) $(READLINELIB) $(LIBS)
--	./fbc -c $(srcdir)/libmath.b </dev/null >libmath.h
--	$(srcdir)/fix-libmath_h
--	rm -f ./fbc ./global.o
--
- sbcOBJ = main.o sbc.o scan.o execute.o global.o load.o storage.o util.o \
-          warranty.o
- sbc.o: sbc.c
-diff --git a/bc/libmath.h b/bc/libmath.h
-new file mode 100644
-index 0000000..63e1acb
---- /dev/null
-+++ b/bc/libmath.h
-@@ -0,0 +1,46 @@
-+{"@iK20:s2:p@r",
-+"@iF1,5.6,7,8,9,10,11,12,13,14,15[l0:KA:#Z1:l0:s7:pKA:s0:pl5:C1,0:",
-+"s14:pl7:s0:pl14:RN1:l5:0<Z2:1s12:pl5:ns5:pN2:l2:s15:pK6:l15:+",
-+"K.44:l5:*+s13:pl5:cS1+s2:pN3:l5:1>Z4:l10:1+s10:pl5:K2:/s5:pl2:",
-+"1+s2:pJ3:N4:l13:s2:p1l5:+s14:pl5:s6:p1s8:pK2:s11:pN6:1B7:J5:N8:",
-+"l11:i11:pJ6:N7:l6:l5:*s6:l8:l11:*s8:/s9:pl9:0=Z9:l10:0>Z10:N11:",
-+"l10:d10:Z12:l14:l14:*s14:pJ11:N12:N10:l15:s2:pl12:Z13:1l14:/R",
-+"N13:l14:1/RN9:l14:l9:+s14:pJ8:N5:0R]@r",
-+"@iF2,5.7,9,10,11,12,13,14,15[l0:KA:#Z1:l0:s7:pKA:s0:pl5:C2,0:",
-+"s14:pl7:s0:pl14:RN1:l5:0{Z2:1K10:l2:^-1/RN2:l2:s15:pK6:l2:+s2:",
-+"pK2:s10:p0s11:pN3:l5:K2:}Z4:l10:K2:*s10:pl5:cRs5:pJ3:N4:N5:l5:",
-+"K.5:{Z6:l10:K2:*s10:pl5:cRs5:pJ5:N6:l5:1-l5:1+/s13:s14:pl13:l13:",
-+"*s12:pK3:s11:pN8:1B9:J7:N10:l11:K2:+s11:pJ8:N9:l13:l12:*s13:l11:",
-+"/s9:pl9:0=Z11:l10:l14:*s14:pl15:s2:pl14:1/RN11:l14:l9:+s14:pJ10:N7:",
-+"0R]@r",
-+"@iF3,5.7,9,11,12,13,16,14,15[l0:KA:#Z1:l0:s7:pKA:s0:pl5:C3,0:",
-+"s14:pl7:s0:pl14:RN1:l2:s15:pK1.1:l15:*K2:+s2:p1C4,0:s14:pl5:0",
-+"<Z2:1s12:pl5:ns5:pN2:0s2:pl5:l14:/K2:+K4:/s13:pl5:K4:l13:*l14:",
-+"*-s5:pl13:K2:%Z3:l5:ns5:pN3:l15:K2:+s2:pl5:s9:s14:pl5:nl5:*s16:",
-+"pK3:s11:pN5:1B6:J4:N7:l11:K2:+s11:pJ5:N6:l9:l16:l11:l11:1-*/*",
-+"s9:pl9:0=Z8:l15:s2:pl12:Z9:l14:n1/RN9:l14:1/RN8:l14:l9:+s14:p",
-+"J7:N4:0R]@r",
-+"@iF5,5.7,14,15[l0:KA:#Z1:l0:s7:pKA:s0:pl5:C5,0:s14:pl7:s0:pl14:",
-+"RN1:l2:s15:pl2:K1.2:*s2:pl5:1C4,0:K2:*+C3,0:s14:pl15:s2:pl14:",
-+"1/R0R]@r",
-+"@iF4,5.6,7,9,10,11,12,13,16,14,15[l0:KA:#Z1:l0:s7:pKA:s0:pl5:",
-+"C4,0:s14:pl7:s0:pl14:RN1:1s12:pl5:0<Z2:1ns12:pl5:ns5:pN2:l5:1",
-+"=Z3:l2:K25:{Z4:K.7853981633974483096156608:l12:/RN4:l2:K40:{Z5:",
-+"K.7853981633974483096156608458198757210492:l12:/RN5:l2:K60:{Z6:",
-+"K.785398163397448309615660845819875721049292349843776455243736",
-+":l12:/RN6:N3:l5:K.2:=Z7:l2:K25:{Z8:K.1973955598498807583700497",
-+":l12:/RN8:l2:K40:{Z9:K.1973955598498807583700497651947902934475",
-+":l12:/RN9:l2:K60:{Z10:K.197395559849880758370049765194790293447585103787852101517688",
-+":l12:/RN10:N7:l2:s15:pl5:K.2:>Z11:l15:K5:+s2:pK.2:C4,0:s6:pN11:",
-+"l15:K3:+s2:pN12:l5:K.2:>Z13:l10:1+s10:pl5:K.2:-1l5:K.2:*+/s5:",
-+"pJ12:N13:l5:s13:s14:pl5:nl5:*s16:pK3:s11:pN15:1B16:J14:N17:l11:",
-+"K2:+s11:pJ15:N16:l13:l16:*s13:l11:/s9:pl9:0=Z18:l15:s2:pl10:l6:",
-+"*l14:+l12:/RN18:l14:l9:+s14:pJ17:N14:0R]@r",
-+"@iF6,13,5.6,7,8,9,10,11,12,16,14,15[l0:KA:#Z1:l0:s7:pKA:s0:pl13:",
-+"l5:C6,00:s14:pl7:s0:pl14:RN1:l2:s15:p0s2:pl13:1/s13:pl13:0<Z2:",
-+"l13:ns13:pl13:K2:%1=Z3:1s12:pN3:N2:1s10:pK2:s11:pN5:l11:l13:{",
-+"B6:J4:N7:l11:i11:pJ5:N6:l10:l11:*s10:pJ7:N4:K1.5:l15:*s2:pl5:",
-+"l13:^K2:l13:^/l10:/s10:p1s9:s14:pl5:nl5:*K4:/s16:pK1.5:l15:*l10:",
-+"cL+l10:cS-s2:p1s11:pN9:1B10:J8:N11:l11:i11:pJ9:N10:l9:l16:*l11:",
-+"/l13:l11:+/s9:pl9:0=Z12:l15:s2:pl12:Z13:l10:nl14:*1/RN13:l10:",
-+"l14:*1/RN12:l14:l9:+s14:pJ11:N8:0R]@r",0}
--- 
-2.17.1
-
diff --git a/package/bc/bc.hash b/package/bc/bc.hash
index a2565a2b5f..5c50644062 100644
--- a/package/bc/bc.hash
+++ b/package/bc/bc.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  62adfca89b0a1c0164c2cdca59ca210c1d44c3ffc46daf9931cf4942664cb02a  bc-1.07.1.tar.gz
+sha256  ae470fec429775653e042015edc928d07c8c3b2fc59765172a330d3d87785f86  bc-1.08.2.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LIB
diff --git a/package/bc/bc.mk b/package/bc/bc.mk
index 5691ca9e67..9578e7d55d 100644
--- a/package/bc/bc.mk
+++ b/package/bc/bc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BC_VERSION = 1.07.1
+BC_VERSION = 1.08.2
 BC_SITE = $(BR2_GNU_MIRROR)/bc
 BC_DEPENDENCIES = host-flex
 BC_LICENSE = GPL-2.0+, LGPL-2.1+
@@ -12,8 +12,8 @@ BC_LICENSE_FILES = COPYING COPYING.LIB
 BC_CPE_ID_VENDOR = gnu
 BC_CONF_ENV = MAKEINFO=true
 
-# 0001-bc-use-MAKEINFO-variable-for-docs.patch and 0004-no-gen-libmath.patch
-# are patching doc/Makefile.am and Makefile.am respectively
+# 0001-bc-use-MAKEINFO-variable-for-docs.patch
+# is patching doc/Makefile.am
 BC_AUTORECONF = YES
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
