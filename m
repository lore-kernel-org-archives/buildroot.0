Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A401C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 12:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 795BF81454;
	Mon, 27 Dec 2021 12:48:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HUuaVSEboaan; Mon, 27 Dec 2021 12:48:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A498E8141F;
	Mon, 27 Dec 2021 12:48:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 481571BF4D8
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 12:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 456F4408C6
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 12:48:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XApNZRHd83FU for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 12:48:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E9B4540345
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 12:48:02 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id t18so32101856wrg.11
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 04:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oRnLWb/sjUr3lzBzrhsVWLA9N3crxJsMO6HChV40Ips=;
 b=KpOaFDDCSEwreuSKSRFqJcZpWuEAbyepANdjdx2nChbGLfB/EbVYakzqQvRrCi7qOd
 SpV15ZJ5xhRqiTwQEiNPLz9DlFwGawgUl1/Bfdpg68yfcsyXldxEJcwzf09gG+yS0nzz
 w5uqyGmn9fbMKEzSU8Yy0g7V6HjdeZ5WZEnu+BX+ACcY3KNlz/aCkAyz3YkSFsf6YDM+
 QShkFD+nuoRnVTeNznwTpPNyo1iXzMS6nBXSK+xnbwcK3VWBpeOuXaQXr6b2fbIZMZGd
 SH5YXF8s+mX7CznuXsXnFKG/zQB13P7I8XGdmdDYX3V7UUh+/uNnWLgWdpLZ50dU/U5w
 N0/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oRnLWb/sjUr3lzBzrhsVWLA9N3crxJsMO6HChV40Ips=;
 b=O8feUJj7DWtndeiHiIq4zOi9vpHiXOAGcNtYFtmvIsIjWe2MzSv9KsjVklNe0CJsn7
 I/LskLCtWMWExB4TCKscsQjyWLlMI8o1dL4dpt1bOzxkyqZCghKY91N8dA1+I0JOk2kA
 4x956leIhQi22/qK+6QuDuGHtiJJTNb4EBT0ZUyNGrrnNA0Vvpsi1M4erRdweZD8LVTv
 Ys4NxvLfxIc3fPDofcRaDmlMua0U30+v66s60BPnL3UEFNjxW59Bp2wFLb/F79gXGsw2
 PGxO2ckT9AnLmGGVTt20meIltrN+JA36WxybF2kjcZr9wn1zjUoNDJCJdWXGcYoLVuB/
 5z/Q==
X-Gm-Message-State: AOAM531e/rTdeVGgL8T6rc+lRjilfs3P0WmlaNZap/pz7LeHr4q6LvzS
 wrAJIWjs8QhdmIE/6qqt1xcT7SsJozmLug==
X-Google-Smtp-Source: ABdhPJx8KEBuYVfdjL9GyChbNvaZtXsqmAEiaFDwJRedVuoEfH1Xzpcg1SUDfbI3NF+bI97P9R6cgg==
X-Received: by 2002:a5d:6d06:: with SMTP id e6mr11981185wrq.50.1640609281087; 
 Mon, 27 Dec 2021 04:48:01 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id r20sm14943386wmd.37.2021.12.27.04.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 04:48:00 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 13:47:20 +0100
Message-Id: <20211227124720.1511041-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/procps-ng: bump to version 3.3.17
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Update indentation in hash file (two spaces)
- Disable w on musl to avoid a build failure:
  https://gitlab.com/procps-ng/procps/-/issues/193

https://gitlab.com/procps-ng/procps/-/blob/v3.3.17/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-configure-Add--disable-w.patch       | 93 +++++++++++++++++++
 ...ssing-nl_langinfo-on-certain-configs.patch | 34 +++++++
 package/procps-ng/procps-ng.hash              | 12 +--
 package/procps-ng/procps-ng.mk                | 11 ++-
 4 files changed, 143 insertions(+), 7 deletions(-)
 create mode 100644 package/procps-ng/0001-configure-Add--disable-w.patch
 create mode 100644 package/procps-ng/0002-escape-c-Fix-missing-nl_langinfo-on-certain-configs.patch

diff --git a/package/procps-ng/0001-configure-Add--disable-w.patch b/package/procps-ng/0001-configure-Add--disable-w.patch
new file mode 100644
index 0000000000..8a699df5a6
--- /dev/null
+++ b/package/procps-ng/0001-configure-Add--disable-w.patch
@@ -0,0 +1,93 @@
+From 1524a625e693b956ce0b5091c9f89f24fb7e8614 Mon Sep 17 00:00:00 2001
+From: "Issam E. Maghni" <issam.e.maghni@mailbox.org>
+Date: Fri, 23 Apr 2021 15:58:36 -0400
+Subject: [PATCH] configure: Add --disable-w
+
+[Retrieved (and backported) from:
+https://gitlab.com/procps-ng/procps/-/commit/1524a625e693b956ce0b5091c9f89f24fb7e8614]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ Makefile.am  | 21 +++++++++++++++------
+ configure.ac |  6 ++++++
+ 2 files changed, 21 insertions(+), 6 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index de15e137..d2356872 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -47,8 +47,7 @@ bin_PROGRAMS = \
+ 	pwdx \
+ 	tload \
+ 	uptime \
+-	vmstat \
+-	w
++	vmstat
+ if BUILD_PWAIT
+ bin_PROGRAMS += pwait
+ endif
+@@ -60,8 +59,7 @@ usrbin_exec_PROGRAMS += \
+ 	pkill \
+ 	pmap \
+ 	uptime \
+-	vmstat \
+-	w
++	vmstat
+ endif
+ 
+ lib_LTLIBRARIES = \
+@@ -74,7 +72,6 @@ dist_man_MANS = \
+ 	pmap.1 \
+ 	uptime.1 \
+ 	vmstat.8 \
+-	w.1 \
+ 	ps/procps.1
+ 
+ if !CYGWIN
+@@ -137,6 +134,19 @@ else
+   EXTRA_DIST += kill.1
+ endif
+ 
++if BUILD_W
++if CYGWIN
++usrbin_exec_PROGRAMS += w
++else
++bin_PROGRAMS += w
++endif
++
++dist_man_MANS += w.1
++w_SOURCES = w.c lib/fileutils.c
++else
++  EXTRA_DIST += w.1
++endif
++
+ if WITH_NCURSES
+ if !CYGWIN
+ bin_PROGRAMS += \
+@@ -213,7 +223,6 @@ endif
+ tload_SOURCES = tload.c lib/strutils.c lib/fileutils.c
+ uptime_SOURCES = uptime.c lib/fileutils.c
+ vmstat_SOURCES = vmstat.c lib/strutils.c lib/fileutils.c
+-w_SOURCES = w.c lib/fileutils.c
+ 
+ # proc/libprocps.la
+ 
+diff --git a/configure.ac b/configure.ac
+index 750c0fbb..3e83fb88 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -234,6 +234,12 @@ AC_ARG_ENABLE([kill],
+   [], [enable_kill=yes]
+ )
+ AM_CONDITIONAL(BUILD_KILL, test "x$enable_kill" = xyes)
++AC_ARG_ENABLE([w],
++  AS_HELP_STRING([--disable-w], [do not build w]),
++  [], [enable_w=yes]
++)
++AM_CONDITIONAL(BUILD_W, test "x$enable_w" = xyes)
++
+ AM_CONDITIONAL(LINUX, test "x$host_os" = xlinux-gnu)
+ AM_CONDITIONAL(CYGWIN, test "x$host_os" = xcygwin)
+ 
+-- 
+GitLab
+
diff --git a/package/procps-ng/0002-escape-c-Fix-missing-nl_langinfo-on-certain-configs.patch b/package/procps-ng/0002-escape-c-Fix-missing-nl_langinfo-on-certain-configs.patch
new file mode 100644
index 0000000000..f3e2b126a6
--- /dev/null
+++ b/package/procps-ng/0002-escape-c-Fix-missing-nl_langinfo-on-certain-configs.patch
@@ -0,0 +1,34 @@
+From 2763b9880a7aab569694d6ee3170dd7341a26b84 Mon Sep 17 00:00:00 2001
+From: "Issam E. Maghni" <issam.e.maghni@mailbox.org>
+Date: Fri, 23 Apr 2021 16:53:39 -0400
+Subject: [PATCH] escape.c: Fix missing nl_langinfo on certain configs
+
+[Retrieved from:
+https://gitlab.com/procps-ng/procps/-/commit/2763b9880a7aab569694d6ee3170dd7341a26b84]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ proc/escape.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/proc/escape.c b/proc/escape.c
+index 2e8fb7dd..cf4a80de 100644
+--- a/proc/escape.c
++++ b/proc/escape.c
+@@ -24,13 +24,13 @@
+ #include "procps.h"
+ #include "escape.h"
+ #include "readproc.h"
++#include "nls.h"
+ 
+ #if (__GNU_LIBRARY__ >= 6) && (!defined(__UCLIBC__) || defined(__UCLIBC_HAS_WCHAR__))
+ # include <wchar.h>
+ # include <wctype.h>
+ # include <stdlib.h>  /* MB_CUR_MAX */
+ # include <ctype.h>
+-# include <langinfo.h>
+ #endif
+ 
+ #define SECURE_ESCAPE_ARGS(dst, bytes, cells) do { \
+-- 
+GitLab
+
diff --git a/package/procps-ng/procps-ng.hash b/package/procps-ng/procps-ng.hash
index 123db992ef..09f2ebd0cb 100644
--- a/package/procps-ng/procps-ng.hash
+++ b/package/procps-ng/procps-ng.hash
@@ -1,8 +1,8 @@
 # From http://sourceforge.net/projects/procps-ng/files/Production/
-md5	2b0717a7cb474b3d6dfdeedfbad2eccc	procps-ng-3.3.15.tar.xz
-sha1	2929bc64f0cf7b2db997eef79b7187658e47230d	procps-ng-3.3.15.tar.xz
+md5  d60613e88c2f442ebd462b5a75313d56  procps-ng-3.3.17.tar.xz
+sha1  a52952e8bc6aaab812176c00d25adc4d4e1552e2  procps-ng-3.3.17.tar.xz
 # Locally calculated after checking signature
-# http://downloads.sourceforge.net/project/procps-ng/Production/procps-ng-3.3.15.tar.xz.asc
-sha256 10bd744ffcb3de2d591d2f6acf1a54a7ba070fdcc432a855931a5057149f0465  procps-ng-3.3.15.tar.xz
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
-sha256 681e386e44a19d7d0674b4320272c90e66b6610b741e7e6305f8219c42e85366  COPYING.LIB
+# http://downloads.sourceforge.net/project/procps-ng/Production/procps-ng-3.3.17.tar.xz.asc
+sha256  4518b3e7aafd34ec07d0063d250fd474999b20b200218c3ae56f5d2113f141b4  procps-ng-3.3.17.tar.xz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  681e386e44a19d7d0674b4320272c90e66b6610b741e7e6305f8219c42e85366  COPYING.LIB
diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index 84ada1b133..46f75a48ef 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -4,13 +4,15 @@
 #
 ################################################################################
 
-PROCPS_NG_VERSION = 3.3.15
+PROCPS_NG_VERSION = 3.3.17
 PROCPS_NG_SOURCE = procps-ng-$(PROCPS_NG_VERSION).tar.xz
 PROCPS_NG_SITE = http://downloads.sourceforge.net/project/procps-ng/Production
 PROCPS_NG_LICENSE = GPL-2.0+, LGPL-2.0+ (libproc and libps)
 PROCPS_NG_LICENSE_FILES = COPYING COPYING.LIB
 PROCPS_NG_CPE_ID_VENDOR = procps-ng_project
 PROCPS_NG_INSTALL_STAGING = YES
+# We're patching configure.ac
+PROCPS_NG_AUTORECONF = YES
 PROCPS_NG_DEPENDENCIES = ncurses host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 PROCPS_NG_CONF_OPTS = LIBS=$(TARGET_NLS_LIBS)
 
@@ -45,6 +47,13 @@ ifeq ($(BR2_STATIC_LIBS),y)
 PROCPS_NG_CONF_OPTS += --disable-numa
 endif
 
+# w requires utmp.h
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+PROCPS_NG_CONF_OPTS += --disable-w
+else
+PROCPS_NG_CONF_OPTS += --enable-w
+endif
+
 # Avoid installing S02sysctl, since openrc provides /etc/init.d/sysctl.
 define PROCPS_NG_INSTALL_INIT_OPENRC
 	@:
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
