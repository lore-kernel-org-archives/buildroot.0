Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB362C3DA4A
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 21:41:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F49F605D5;
	Wed, 14 Aug 2024 21:41:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yuLpLfZeRj33; Wed, 14 Aug 2024 21:41:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CA03608EF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CA03608EF;
	Wed, 14 Aug 2024 21:41:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1B0A11BF4DB
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 21:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 066168137C
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 21:41:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jLYwJGV6ijqJ for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 21:41:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0CDA8137A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0CDA8137A
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 21:41:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ABCF77FFDC; Wed, 14 Aug 2024 21:41:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 14 Aug 2024 23:41:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f31e860ae4cd29fd3d23871797d91b4f3667c806
X-Git-Newrev: 1feacea6675a28c4a3dc5e7a562b035468e3490a
X-Patchwork-Hint: ignore
Message-Id: <20240814214143.ABCF77FFDC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dc3dd: fix compile issues
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1feacea6675a28c4a3dc5e7a562b035468e3490a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch from Debian to fix the autobuild issues.
Furthermore something like ea2f52494c32c53a3def6dc3b0c5b9d5d7c7edf4
from cvs package is required as well.

Fixes:
 - http://autobuild.buildroot.net/results/6a0/6a0c5dc057eb348afcd5e3859cb37059d6bd91c1

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...etdate.y-compile-on-QNX-and-NetBSD-5-i386.patch | 104 +++++++++++++++++++++
 package/dc3dd/dc3dd.mk                             |   2 +
 2 files changed, 106 insertions(+)

diff --git a/package/dc3dd/0004-Make-getdate.y-compile-on-QNX-and-NetBSD-5-i386.patch b/package/dc3dd/0004-Make-getdate.y-compile-on-QNX-and-NetBSD-5-i386.patch
new file mode 100644
index 0000000000..6b7344e6e6
--- /dev/null
+++ b/package/dc3dd/0004-Make-getdate.y-compile-on-QNX-and-NetBSD-5-i386.patch
@@ -0,0 +1,104 @@
+From: Bruno Haible <bruno@clisp.org>
+Date: Thu, 17 Sep 2009 22:42:33 +0200
+Subject: Make getdate.y compile on QNX and NetBSD 5 / i386.
+
+Forwarded: https://sourceforge.net/p/dc3dd/bugs/23/
+Origin: https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=a68c9ab3cfc8ac7cf2a709b0c1aa93229f8635e6
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://sources.debian.org/patches/dc3dd/7.3.1-3/Make-getdate.y-compile-on-QNX-and-NetBSD-5-i386.patch/
+---
+ lib/getdate.y | 33 ++++++++++++++++++++++-----------
+ m4/getdate.m4 | 14 ++++++++++++++
+ 2 files changed, 36 insertions(+), 11 deletions(-)
+
+diff --git a/lib/getdate.y b/lib/getdate.y
+index 1deec51..d2c23f2 100644
+--- a/lib/getdate.y
++++ b/lib/getdate.y
+@@ -108,12 +108,21 @@
+ 
+ #define HOUR(x) ((x) * 60)
+ 
+-/* Lots of this code assumes time_t and time_t-like values fit into
+-   long int.  It also assumes that signed integer overflow silently
+-   wraps around, but there's no portable way to check for that at
+-   compile-time.  */
++/* long_time_t is a signed integer type that contains all time_t values.  */
+ verify (TYPE_IS_INTEGER (time_t));
+-verify (LONG_MIN <= TYPE_MINIMUM (time_t) && TYPE_MAXIMUM (time_t) <= LONG_MAX);
++#if TIME_T_FITS_IN_LONG_INT
++typedef long int long_time_t;
++#else
++typedef time_t long_time_t;
++#endif
++
++/* Lots of this code assumes time_t and time_t-like values fit into
++   long_time_t.  */
++verify (TYPE_MINIMUM (long_time_t) <= TYPE_MINIMUM (time_t)
++        && TYPE_MAXIMUM (time_t) <= TYPE_MAXIMUM (long_time_t));
++
++/* FIXME: It also assumes that signed integer overflow silently wraps around,
++   but this is not true any more with recent versions of GCC 4.  */
+ 
+ /* An integer value, and the number of digits in its textual
+    representation.  */
+@@ -146,7 +155,7 @@ typedef struct
+   long int day;
+   long int hour;
+   long int minutes;
+-  long int seconds;
++  long_time_t seconds;
+   long int ns;
+ } relative_time;
+ 
+@@ -1492,20 +1501,22 @@ get_date (struct timespec *result, char const *p, struct timespec const *now)
+ 	time_t t1 = t0 + d1;
+ 	long int d2 = 60 * pc.rel.minutes;
+ 	time_t t2 = t1 + d2;
+-	long int d3 = pc.rel.seconds;
+-	time_t t3 = t2 + d3;
++	long_time_t d3 = pc.rel.seconds;
++	long_time_t t3 = t2 + d3;
+ 	long int d4 = (sum_ns - normalized_ns) / BILLION;
+-	time_t t4 = t3 + d4;
++	long_time_t t4 = t3 + d4;
++	time_t t5 = t4;
+ 
+ 	if ((d1 / (60 * 60) ^ pc.rel.hour)
+ 	    | (d2 / 60 ^ pc.rel.minutes)
+ 	    | ((t1 < t0) ^ (d1 < 0))
+ 	    | ((t2 < t1) ^ (d2 < 0))
+ 	    | ((t3 < t2) ^ (d3 < 0))
+-	    | ((t4 < t3) ^ (d4 < 0)))
++	    | ((t4 < t3) ^ (d4 < 0))
++	    | (t5 != t4))
+ 	  goto fail;
+ 
+-	result->tv_sec = t4;
++	result->tv_sec = t5;
+ 	result->tv_nsec = normalized_ns;
+       }
+     }
+diff --git a/m4/getdate.m4 b/m4/getdate.m4
+index d160329..cfbb86f 100644
+--- a/m4/getdate.m4
++++ b/m4/getdate.m4
+@@ -30,4 +30,18 @@ AC_DEFUN([gl_GETDATE],
+   AC_STRUCT_TIMEZONE
+   AC_REQUIRE([gl_CLOCK_TIME])
+   AC_REQUIRE([gl_TM_GMTOFF])
++  AC_COMPILE_IFELSE(
++    [AC_LANG_SOURCE([[
++#include <time.h> /* for time_t */
++#include <limits.h> /* for CHAR_BIT, LONG_MIN, LONG_MAX */
++#define TYPE_MINIMUM(t) \
++  ((t) ((t) 0 < (t) -1 ? (t) 0 : ~ (t) 0 << (sizeof (t) * CHAR_BIT - 1)))
++#define TYPE_MAXIMUM(t) \
++  ((t) ((t) 0 < (t) -1 ? (t) -1 : ~ (~ (t) 0 << (sizeof (t) * CHAR_BIT - 1))))
++typedef int verify_min[2 * (LONG_MIN <= TYPE_MINIMUM (time_t)) - 1];
++typedef int verify_max[2 * (TYPE_MAXIMUM (time_t) <= LONG_MAX) - 1];
++       ]])],
++    [AC_DEFINE([TIME_T_FITS_IN_LONG_INT], [1],
++       [Define to 1 if all 'time_t' values fit in a 'long int'.])
++    ])
+ ])
diff --git a/package/dc3dd/dc3dd.mk b/package/dc3dd/dc3dd.mk
index f47f34a81a..c31ab9e1f3 100644
--- a/package/dc3dd/dc3dd.mk
+++ b/package/dc3dd/dc3dd.mk
@@ -15,4 +15,6 @@ DC3DD_LICENSE_FILES = COPYING
 DC3DD_AUTORECONF = YES
 DC3DD_AUTOPOINT = YES
 
+DC3DD_CONF_ENV = ac_cv_func_working_mktime=yes
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
