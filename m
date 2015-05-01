From: Romain Naour <romain.naour@openwide.fr>
Date: Fri,  1 May 2015 18:44:45 +0200
Subject: [Buildroot] [PATCH 2/3] package/argp-standalone: add missing
	limits.h
In-Reply-To: <1430498686-10719-1-git-send-email-romain.naour@openwide.fr>
References: <1430498686-10719-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1430498686-10719-2-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/b80/b802cc638a4b11d2a2098b82615f2c0ccadf8e3f/build-end.log

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Cc: Max Filippov <jcmvbkbc@gmail.com>
---
 package/argp-standalone/0002-isprint.patch | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/package/argp-standalone/0002-isprint.patch b/package/argp-standalone/0002-isprint.patch
index 00ace31..ffdca4c 100644
--- a/package/argp-standalone/0002-isprint.patch
+++ b/package/argp-standalone/0002-isprint.patch
@@ -1,7 +1,7 @@
-From 9f1c15818915b888a93d4514cf4cf3fead261c3c Mon Sep 17 00:00:00 2001
+From f5635bb13af07190bd057889f90110bf74e1c5c0 Mon Sep 17 00:00:00 2001
 From: Max Filippov <jcmvbkbc@gmail.com>
 Date: Fri, 1 May 2015 18:21:51 +0200
-Subject: [PATCH 2/2] restrict value range passed to isprint function
+Subject: [PATCH] restrict value range passed to isprint function
 
 According to C standards isprint argument shall be representable as an
 unsigned char or be equal to EOF, otherwise the behaviour is undefined.
@@ -12,12 +12,13 @@ Restrict isprint argument range to values representable by unsigned char.
 
 Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
 [Romain:
-  - format to git patch]
+  - format to git patch
+  - add missing limits.h header for UCHAR_MAX]
 Signed-off-by: Romain Naour <romain.naour@openwide.fr>
 ---
  argp-parse.c | 2 +-
- argp.h       | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
+ argp.h       | 3 ++-
+ 2 files changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/argp-parse.c b/argp-parse.c
 index bdb4ad6..d8e7d54 100644
@@ -33,10 +34,18 @@ index bdb4ad6..d8e7d54 100644
  }
  
 diff --git a/argp.h b/argp.h
-index ee23c99..abd8b05 100644
+index ee23c99..b2c5f74 100644
 --- a/argp.h
 +++ b/argp.h
-@@ -577,7 +577,7 @@ __option_is_short (__const struct argp_option *__opt)
+@@ -23,6 +23,7 @@
+ 
+ #include <stdio.h>
+ #include <ctype.h>
++#include <limits.h>
+ 
+ #define __need_error_t
+ #include <errno.h>
+@@ -577,7 +578,7 @@ __option_is_short (__const struct argp_option *__opt)
    else
      {
        int __key = __opt->key;
-- 
1.9.3
