Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C3CC3DA4A
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 20:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9AEF640B9B;
	Tue, 20 Aug 2024 20:07:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JP7jT12QNeXc; Tue, 20 Aug 2024 20:07:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E839B40BD2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E839B40BD2;
	Tue, 20 Aug 2024 20:07:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1CD491BF376
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 20:07:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0931740B30
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 20:07:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RkPTWUjM7MAr for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 20:07:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60DCB40BA8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60DCB40BA8
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 20:07:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4E10586193; Tue, 20 Aug 2024 20:07:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 20 Aug 2024 22:05:01 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 4170afa998c2cc4531bba7abae39b04d5c265830
X-Git-Newrev: 4d68f0d040c47a98e008e28ba146c6d12000262c
X-Patchwork-Hint: ignore
Message-Id: <20240820200712.4E10586193@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/dhrystone:
 cleanup patch stack
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4d68f0d040c47a98e008e28ba146c6d12000262c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

dhrystone is basically a dead project, so there is no Git repo
available anywhere, no new release, nothing.

Despite that, let's reformat the patches with "git format-patch", keep
the original authorship but add my SoB since I'm reintroducing the
patches, and indicate the Upstream: status.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 95013777cf93548eee7ac3010b513d354e8b0a30)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |  5 ----
 ...pecify-the-number-of-runs-on-the-command.patch} | 22 ++++++++++++----
 ...e-from-system-rather-than-requiring-via-C.patch | 29 ++++++++++++++++++++++
 package/dhrystone/0002-HZ.patch                    | 17 -------------
 package/dhrystone/0003-exit.patch                  | 14 -----------
 ...0003-trust-the-exit-status-of-the-program.patch | 26 +++++++++++++++++++
 ...004-get-prototypes-for-malloc-exit-strcpy.patch | 27 ++++++++++++++++++++
 package/dhrystone/0004-headers.patch               | 15 -----------
 ...ision-with-C-library-using-NO_PROTOTYPES.patch} | 20 ++++++++++++---
 9 files changed, 115 insertions(+), 60 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 4eff91e184..962ba03fe2 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -513,11 +513,6 @@ package/dhcp/S80dhcp-server Shellcheck lib_sysv.Variables
 package/dhcp/dhclient-script Shellcheck lib_shellscript.TrailingSpace
 package/dhcpcd/S41dhcpcd lib_sysv.Indent lib_sysv.Variables
 package/dhcpdump/0001-use-non-bsd-structures.patch lib_patch.Upstream
-package/dhrystone/0001-cmdline-nruns.patch lib_patch.Sob lib_patch.Upstream
-package/dhrystone/0002-HZ.patch lib_patch.Sob lib_patch.Upstream
-package/dhrystone/0003-exit.patch lib_patch.Sob lib_patch.Upstream
-package/dhrystone/0004-headers.patch lib_patch.Sob lib_patch.Upstream
-package/dhrystone/0005-prototypes.patch lib_patch.Sob lib_patch.Upstream
 package/dht/0001-cmake.patch lib_patch.Upstream
 package/dillo/0001-usr-local-include.patch lib_patch.Upstream
 package/dillo/0002-Fix-openssl-detection.patch lib_patch.Upstream
diff --git a/package/dhrystone/0001-cmdline-nruns.patch b/package/dhrystone/0001-let-people-specify-the-number-of-runs-on-the-command.patch
similarity index 66%
rename from package/dhrystone/0001-cmdline-nruns.patch
rename to package/dhrystone/0001-let-people-specify-the-number-of-runs-on-the-command.patch
index 1164610cca..b185826847 100644
--- a/package/dhrystone/0001-cmdline-nruns.patch
+++ b/package/dhrystone/0001-let-people-specify-the-number-of-runs-on-the-command.patch
@@ -1,10 +1,19 @@
-let people specify the number of runs on the command line
+From 16d84fa7ecea8102680c9610d4186c4f54936b07 Mon Sep 17 00:00:00 2001
+From: Vivi Li <vivi.li@analog.com>
+Date: Mon, 15 Jul 2024 11:07:11 +0200
+Subject: [PATCH] let people specify the number of runs on the command line
 
-Patch by Vivi Li <vivi.li@analog.com>
+Upstream: dead
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ dhry_1.c | 25 ++++++++++++++++++-------
+ 1 file changed, 18 insertions(+), 7 deletions(-)
 
+diff --git a/dhry_1.c b/dhry_1.c
+index 7ab02a8..97bd30f 100644
 --- a/dhry_1.c
 +++ b/dhry_1.c
-@@ -66,7 +70,7 @@
+@@ -66,7 +66,7 @@ float           Microseconds,
  /* end of variables for time measurement */
  
  
@@ -13,7 +22,7 @@ Patch by Vivi Li <vivi.li@analog.com>
  /*****/
  
    /* main program, corresponds to procedures        */
-@@ -101,6 +105,13 @@
+@@ -101,6 +101,13 @@ main ()
          /* Warning: With 16-Bit processors and Number_Of_Runs > 32000,  */
          /* overflow may occur for this array element.                   */
  
@@ -27,7 +36,7 @@ Patch by Vivi Li <vivi.li@analog.com>
    printf ("\n");
    printf ("Dhrystone Benchmark, Version 2.1 (Language: C)\n");
    printf ("\n");
-@@ -114,13 +125,17 @@
+@@ -114,13 +121,17 @@ main ()
      printf ("Program compiled without 'register' attribute\n");
      printf ("\n");
    }
@@ -51,3 +60,6 @@ Patch by Vivi Li <vivi.li@analog.com>
  
    printf ("Execution starts, %d runs through Dhrystone\n", Number_Of_Runs);
  
+-- 
+2.45.2
+
diff --git a/package/dhrystone/0002-Get-HZ-value-from-system-rather-than-requiring-via-C.patch b/package/dhrystone/0002-Get-HZ-value-from-system-rather-than-requiring-via-C.patch
new file mode 100644
index 0000000000..064a1a9524
--- /dev/null
+++ b/package/dhrystone/0002-Get-HZ-value-from-system-rather-than-requiring-via-C.patch
@@ -0,0 +1,29 @@
+From 7d890402dc5a32a72d5bc0532c87576937c18eb7 Mon Sep 17 00:00:00 2001
+From: Robin Getz <rgetz@blackfin.uclinux.org>
+Date: Mon, 15 Jul 2024 11:07:54 +0200
+Subject: [PATCH] Get HZ value from system rather than requiring via CPPFLAGS
+
+Upstream: dead
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ dhry.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/dhry.h b/dhry.h
+index 1714562..482d343 100644
+--- a/dhry.h
++++ b/dhry.h
+@@ -359,6 +359,10 @@
+                 /* for "times" */
+ #endif
+ 
++#ifndef HZ
++#include <sys/param.h>
++#endif
++
+ #define Mic_secs_Per_Second     1000000.0
+                 /* Berkeley UNIX C returns process times in seconds/HZ */
+ 
+-- 
+2.45.2
+
diff --git a/package/dhrystone/0002-HZ.patch b/package/dhrystone/0002-HZ.patch
deleted file mode 100644
index e3b8a0e05d..0000000000
--- a/package/dhrystone/0002-HZ.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Get HZ value from system rather than requiring via CPPFLAGS
-
-Patch by Robin Getz <rgetz@blackfin.uclinux.org>
-
---- a/dhry.h
-+++ b/dhry.h
-@@ -359,6 +359,10 @@
-                 /* for "times" */
- #endif
- 
-+#ifndef HZ
-+#include <sys/param.h>
-+#endif
-+
- #define Mic_secs_Per_Second     1000000.0
-                 /* Berkeley UNIX C returns process times in seconds/HZ */
- 
diff --git a/package/dhrystone/0003-exit.patch b/package/dhrystone/0003-exit.patch
deleted file mode 100644
index 8d99f4e5d7..0000000000
--- a/package/dhrystone/0003-exit.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-trust the exit status of the program
-
-Patch by Robin Getz <rgetz@blackfin.uclinux.org>
-
---- a/dhry_1.c
-+++ b/dhry_1.c
-@@ -274,6 +289,7 @@
-     printf ("\n");
-   }
-   
-+  exit(0);
- }
- 
- 
diff --git a/package/dhrystone/0003-trust-the-exit-status-of-the-program.patch b/package/dhrystone/0003-trust-the-exit-status-of-the-program.patch
new file mode 100644
index 0000000000..b7bc2b306c
--- /dev/null
+++ b/package/dhrystone/0003-trust-the-exit-status-of-the-program.patch
@@ -0,0 +1,26 @@
+From acd266448386c805c0afded780a5d7e6903bb485 Mon Sep 17 00:00:00 2001
+From: Robin Getz <rgetz@blackfin.uclinux.org>
+Date: Mon, 15 Jul 2024 11:08:43 +0200
+Subject: [PATCH] trust the exit status of the program
+
+Upstream: dead
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ dhry_1.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/dhry_1.c b/dhry_1.c
+index 97bd30f..358bdc3 100644
+--- a/dhry_1.c
++++ b/dhry_1.c
+@@ -285,6 +285,7 @@ main(int argc, char *argv[])
+     printf ("\n");
+   }
+   
++  exit(0);
+ }
+ 
+ 
+-- 
+2.45.2
+
diff --git a/package/dhrystone/0004-get-prototypes-for-malloc-exit-strcpy.patch b/package/dhrystone/0004-get-prototypes-for-malloc-exit-strcpy.patch
new file mode 100644
index 0000000000..e925f1e781
--- /dev/null
+++ b/package/dhrystone/0004-get-prototypes-for-malloc-exit-strcpy.patch
@@ -0,0 +1,27 @@
+From 85dcf4ca20a60689479bcb143ecf8c0402822abe Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier@gentoo.org>
+Date: Mon, 15 Jul 2024 11:09:18 +0200
+Subject: [PATCH] get prototypes for malloc/exit/strcpy
+
+Upstream: dead
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ dhry.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/dhry.h b/dhry.h
+index 482d343..825ef35 100644
+--- a/dhry.h
++++ b/dhry.h
+@@ -388,6 +388,8 @@
+ /* General definitions: */
+ 
+ #include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
+                 /* for strcpy, strcmp */
+ 
+ #define Null 0 
+-- 
+2.45.2
+
diff --git a/package/dhrystone/0004-headers.patch b/package/dhrystone/0004-headers.patch
deleted file mode 100644
index 82bb60d92d..0000000000
--- a/package/dhrystone/0004-headers.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-get prototypes for malloc/exit/strcpy
-
-Patch by Mike Frysinger <vapier@gentoo.org>
-
---- a/dhry.h
-+++ b/dhry.h
-@@ -388,6 +388,8 @@
- /* General definitions: */
- 
- #include <stdio.h>
-+#include <stdlib.h>
-+#include <string.h>
-                 /* for strcpy, strcmp */
- 
- #define Null 0 
diff --git a/package/dhrystone/0005-prototypes.patch b/package/dhrystone/0005-Avoid-collision-with-C-library-using-NO_PROTOTYPES.patch
similarity index 59%
rename from package/dhrystone/0005-prototypes.patch
rename to package/dhrystone/0005-Avoid-collision-with-C-library-using-NO_PROTOTYPES.patch
index 7fdcf94ee9..4cffc25a8d 100644
--- a/package/dhrystone/0005-prototypes.patch
+++ b/package/dhrystone/0005-Avoid-collision-with-C-library-using-NO_PROTOTYPES.patch
@@ -1,10 +1,19 @@
-Avoid collision with C library using NO_PROTOTYPES found in code already
+From 9a701143fc38fd9f5373af70dfd5f0da0bc8e04a Mon Sep 17 00:00:00 2001
+From: Robin Getz <rgetz@blackfin.uclinux.org>
+Date: Mon, 15 Jul 2024 11:09:55 +0200
+Subject: [PATCH] Avoid collision with C library using NO_PROTOTYPES
 
-Patch by Robin Getz <rgetz@blackfin.uclinux.org>
+Upstream: dead
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ dhry_1.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
 
+diff --git a/dhry_1.c b/dhry_1.c
+index 358bdc3..3ed1716 100644
 --- a/dhry_1.c
 +++ b/dhry_1.c
-@@ -28,7 +28,9 @@
+@@ -28,7 +28,9 @@ char            Ch_1_Glob,
  int             Arr_1_Glob [50];
  int             Arr_2_Glob [50] [50];
  
@@ -14,7 +23,7 @@ Patch by Robin Getz <rgetz@blackfin.uclinux.org>
  Enumeration     Func_1 ();
    /* forward declaration necessary since Enumeration may not simply be int */
  
-@@ -45,14 +45,18 @@
+@@ -45,14 +47,18 @@ Enumeration     Func_1 ();
  
  #ifdef TIMES
  struct tms      time_info;
@@ -33,3 +42,6 @@ Patch by Robin Getz <rgetz@blackfin.uclinux.org>
  #define Too_Small_Time 2
                  /* Measurements should last at least 2 seconds */
  #endif
+-- 
+2.45.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
