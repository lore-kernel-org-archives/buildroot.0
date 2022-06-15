Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC8A8C433EF
	for <buildroot@archiver.kernel.org>; Wed, 15 Jun 2022 02:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DAAD410D4;
	Wed, 15 Jun 2022 02:23:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9SobjeeAdMue; Wed, 15 Jun 2022 02:23:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8012410C7;
	Wed, 15 Jun 2022 02:23:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D1F9E1BF5A0
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 02:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5A23410C7
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 02:23:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SJf5S6diUMz0 for <buildroot@lists.busybox.net>;
 Wed, 15 Jun 2022 02:23:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 63BC8410C3
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 02:23:53 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id p1so7862188ilj.9
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 19:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VEXxPcJESimb0WkI29cNDCJOJLzxRSioV1IxjS0HyYk=;
 b=GP7WT5Vix3yserDTwr+2RFPiDzmBOo6/mymuPBmLPlmGgtDs1siDQ77/OniV0SYCSC
 IvVF+GcARHlTn87jFmzTOEF7pxsRWAxzjeaf7206C/odOs7+6cuLRvMYjnwDfzDx/hUU
 Ov7SUdWp8kIE/fWR9RGB5o/DeaOmfgtPychb7DAt/Wlzk3WQX31XO/3NQX59SxBvfEwC
 ZDadJLZwBSgpk3xDt0cJ6E1DwR4SpbtDfakVfRpmRd5+KjQgMXcfdoOApKZAdDFBhb9y
 eFSSxcr/oxDdp5o2baL2SWD5QAJ+kY96LpzrUKkEbHYPsDzDRvfAqfXqZieOPRAk7hpZ
 swOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VEXxPcJESimb0WkI29cNDCJOJLzxRSioV1IxjS0HyYk=;
 b=cRclLL7cHUYOgLUWYHAwHLbR59IS2E2U7YdRHyYa2Gyg/VWMyt5m5rDgUrB6KpSqEg
 DT0lV9WcWrjKsPaTdEHpDcqfSwX2/zg5CLomWdTIy85BX4XE58Oz4FP5940yVOH6bH+W
 bxUPQfcuAw0SFp+QgpAeeiryzJPxiwEHH1qmZoc9Lg1EkFZoLp1Oezar4DIE2ZY9MoH0
 CptPEhfuxjDPTZ3+/HdiafSLk4rrk4qdlb+sK788Q+T/G1M96RoDlgv+xRnZKZxsQdQO
 DMOUJklt0HwO4RyPFsOuNz8yBfH7U1NS73DJ2QRjIYpUTCZTkh+W8JVR8svsx3TvPFLA
 deDw==
X-Gm-Message-State: AJIora9yNKijP0y37a1REKwjiRF6Z2ZA6KLmKAcb6LFDKdxNjppjXmeE
 LMAc9HebSv4EvHOY0kF11c3eYWx67/w=
X-Google-Smtp-Source: AGRyM1uEMDkqL04oIHVQGI9c8Et7wkpEidsISQOz4Ph5EU2xm4X3ditxOM3SDnpvNm3gO8v04nG6cw==
X-Received: by 2002:a05:6e02:1a64:b0:2d1:cb20:edc2 with SMTP id
 w4-20020a056e021a6400b002d1cb20edc2mr4826999ilv.253.1655259832091; 
 Tue, 14 Jun 2022 19:23:52 -0700 (PDT)
Received: from james-x399.localdomain (71-218-113-86.hlrn.qwest.net.
 [71.218.113.86]) by smtp.gmail.com with ESMTPSA id
 w2-20020a023942000000b0032b3a781754sm5566376jae.24.2022.06.14.19.23.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 19:23:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 14 Jun 2022 20:23:48 -0600
Message-Id: <20220615022348.914136-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/{glibc,
 localedef}: bump to version
 2.35-134-gb6aade18a7e5719c942aa2da6cf3157aca993fa4
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
Cc: Romain Naour <romain.naour@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Contains various fixes some of which may effect pthread fork handling.

Add patch reverting a commit breaking builds.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - revert a commit breaking build
---
 ...lement-a-useful-version-of-_startup_.patch | 132 ++++++++++++++++++
 package/glibc/glibc.hash                      |   2 +-
 package/glibc/glibc.mk                        |   2 +-
 package/localedef/localedef.mk                |   2 +-
 4 files changed, 135 insertions(+), 3 deletions(-)
 create mode 100644 package/glibc/0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch

diff --git a/package/glibc/0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch b/package/glibc/0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch
new file mode 100644
index 0000000000..549650aca1
--- /dev/null
+++ b/package/glibc/0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch
@@ -0,0 +1,132 @@
+From dfda505870f94a7ac8063eb47f622ddc65665ff1 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Tue, 14 Jun 2022 19:42:43 -0600
+Subject: [PATCH] Revert "Linux: Implement a useful version of _startup_fatal"
+
+Fixes:
+csu/libc-tls.c:202: undefined reference to `_startup_fatal_not_constant'
+
+This reverts commit 2d05ba7f8ef979947e910a37ae8115a816eb4d08.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+---
+ sysdeps/unix/sysv/linux/i386/startup.h | 23 ++++++++++++---
+ sysdeps/unix/sysv/linux/ia64/startup.h | 22 ---------------
+ sysdeps/unix/sysv/linux/startup.h      | 39 --------------------------
+ 3 files changed, 19 insertions(+), 65 deletions(-)
+ delete mode 100644 sysdeps/unix/sysv/linux/ia64/startup.h
+ delete mode 100644 sysdeps/unix/sysv/linux/startup.h
+
+diff --git a/sysdeps/unix/sysv/linux/i386/startup.h b/sysdeps/unix/sysv/linux/i386/startup.h
+index 213805d7d2..67c9310f3a 100644
+--- a/sysdeps/unix/sysv/linux/i386/startup.h
++++ b/sysdeps/unix/sysv/linux/i386/startup.h
+@@ -1,5 +1,5 @@
+ /* Linux/i386 definitions of functions used by static libc main startup.
+-   Copyright (C) 2022 Free Software Foundation, Inc.
++   Copyright (C) 2017-2022 Free Software Foundation, Inc.
+    This file is part of the GNU C Library.
+ 
+    The GNU C Library is free software; you can redistribute it and/or
+@@ -16,7 +16,22 @@
+    License along with the GNU C Library; if not, see
+    <https://www.gnu.org/licenses/>.  */
+ 
+-/* Can't use "call *%gs:SYSINFO_OFFSET" during startup.  */
+-#define I386_USE_SYSENTER 0
++#if BUILD_PIE_DEFAULT
++/* Can't use "call *%gs:SYSINFO_OFFSET" during statup in static PIE.  */
++# define I386_USE_SYSENTER 0
+ 
+-#include_next <startup.h>
++# include <sysdep.h>
++# include <abort-instr.h>
++
++__attribute__ ((__noreturn__))
++static inline void
++_startup_fatal (const char *message __attribute__ ((unused)))
++{
++  /* This is only called very early during startup in static PIE.
++     FIXME: How can it be improved?  */
++  ABORT_INSTRUCTION;
++  __builtin_unreachable ();
++}
++#else
++# include_next <startup.h>
++#endif
+diff --git a/sysdeps/unix/sysv/linux/ia64/startup.h b/sysdeps/unix/sysv/linux/ia64/startup.h
+deleted file mode 100644
+index 77f29f15a2..0000000000
+--- a/sysdeps/unix/sysv/linux/ia64/startup.h
++++ /dev/null
+@@ -1,22 +0,0 @@
+-/* Linux/ia64 definitions of functions used by static libc main startup.
+-   Copyright (C) 2022 Free Software Foundation, Inc.
+-   This file is part of the GNU C Library.
+-
+-   The GNU C Library is free software; you can redistribute it and/or
+-   modify it under the terms of the GNU Lesser General Public
+-   License as published by the Free Software Foundation; either
+-   version 2.1 of the License, or (at your option) any later version.
+-
+-   The GNU C Library is distributed in the hope that it will be useful,
+-   but WITHOUT ANY WARRANTY; without even the implied warranty of
+-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-   Lesser General Public License for more details.
+-
+-   You should have received a copy of the GNU Lesser General Public
+-   License along with the GNU C Library; if not, see
+-   <https://www.gnu.org/licenses/>.  */
+-
+-/* This code is used before the TCB is set up.  */
+-#define IA64_USE_NEW_STUB 0
+-
+-#include_next <startup.h>
+diff --git a/sysdeps/unix/sysv/linux/startup.h b/sysdeps/unix/sysv/linux/startup.h
+deleted file mode 100644
+index 39859b404a..0000000000
+--- a/sysdeps/unix/sysv/linux/startup.h
++++ /dev/null
+@@ -1,39 +0,0 @@
+-/* Linux definitions of functions used by static libc main startup.
+-   Copyright (C) 2017-2022 Free Software Foundation, Inc.
+-   This file is part of the GNU C Library.
+-
+-   The GNU C Library is free software; you can redistribute it and/or
+-   modify it under the terms of the GNU Lesser General Public
+-   License as published by the Free Software Foundation; either
+-   version 2.1 of the License, or (at your option) any later version.
+-
+-   The GNU C Library is distributed in the hope that it will be useful,
+-   but WITHOUT ANY WARRANTY; without even the implied warranty of
+-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-   Lesser General Public License for more details.
+-
+-   You should have received a copy of the GNU Lesser General Public
+-   License along with the GNU C Library; if not, see
+-   <https://www.gnu.org/licenses/>.  */
+-
+-#ifdef SHARED
+-# include_next <startup.h>
+-#else
+-# include <sysdep.h>
+-
+-/* Avoid a run-time invocation of strlen.  */
+-#define _startup_fatal(message)                                         \
+-  do                                                                    \
+-    {                                                                   \
+-      size_t __message_length = __builtin_strlen (message);             \
+-      if (! __builtin_constant_p (__message_length))                    \
+-        {                                                               \
+-          extern void _startup_fatal_not_constant (void);               \
+-          _startup_fatal_not_constant ();                               \
+-        }                                                               \
+-      INTERNAL_SYSCALL_CALL (write, STDERR_FILENO, (message),           \
+-                             __message_length);                         \
+-      INTERNAL_SYSCALL_CALL (exit_group, 127);                          \
+-    }                                                                   \
+-  while (0)
+-#endif  /* !SHARED */
+-- 
+2.25.1
+
diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index e0bbf341eb..016467cd81 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  fc3c1d25640fd4cd09fbf7e17eafcc7943731e901cc0a3686503ae8adfb11d31  glibc-2.35-96-g2c4fc8e5ca742c6a3a1933799495bb0b00a807f0.tar.gz
+sha256  f339586a104a8e12ff44d38fb24574d2abe694ddba322404f8bc1a50f4343228  glibc-2.35-134-gb6aade18a7e5719c942aa2da6cf3157aca993fa4.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index f3a08fbf24..5af539ca62 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.35-96-g2c4fc8e5ca742c6a3a1933799495bb0b00a807f0
+GLIBC_VERSION = 2.35-134-gb6aade18a7e5719c942aa2da6cf3157aca993fa4
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 061b7c7fc2..ae4cc55f30 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.35-96-g2c4fc8e5ca742c6a3a1933799495bb0b00a807f0
+LOCALEDEF_VERSION = 2.35-134-gb6aade18a7e5719c942aa2da6cf3157aca993fa4
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
 LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
 HOST_LOCALEDEF_DL_SUBDIR = glibc
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
