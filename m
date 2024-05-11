Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E55C04FFE
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 18:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DBF5605DD;
	Sat, 11 May 2024 18:14:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LhG6F8idqv5y; Sat, 11 May 2024 18:14:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE8FE60629
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE8FE60629;
	Sat, 11 May 2024 18:14:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F1EB31BF2F2
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 18:14:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC6D681757
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 18:14:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 53cXVsuFggHx for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 18:14:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 81A018146A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81A018146A
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 81A018146A
 for <buildroot@buildroot.org>; Sat, 11 May 2024 18:14:02 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a59cdf7cd78so777065266b.0
 for <buildroot@buildroot.org>; Sat, 11 May 2024 11:14:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715451240; x=1716056040;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7HMbvvaDYgLYoIvOKCbOI1jSKqpvev0EzKixGlJ6KEY=;
 b=YE02Tcx6oni5FmqUjVXusInd3YjWJ2pJhxqu9ZfHk89sM9Hco67oZ/wzPSwcXATdJ3
 t/0sbLT5MR+4VgDxojLg172kKXUfVWphg72N/pHiGYUp/fp4vrdJnEwqXKVPNT+Rcvpx
 cVFO88Vfd9IutAVzNFylLhpstu0b/rZM0BPbYYqr1nWL9sb+8hUY7Jvqkn9j8rSswHU1
 RNqs+QN80PCu9uxVZFCMp2HzFSI6CKhM3BendCFeHO+TzXtUhAHSsz6T72fDCsSnjeQc
 dWFPnUyd9M8+N7ey1tXMX34bZ2riUUN72VFAd6bvuhS0Kk9DMNUJYwPP3m2UO6xFRdOL
 mozQ==
X-Gm-Message-State: AOJu0YxjfAhpZ98wcyy4YS1kLOvH1YUGmoxgAT8WpjUGVTG7J0dpJwdk
 T2IodiScFmhRLK5qv5xknlXIn2OWg921bbm1/h36uL2pXeAb8gGqxsJyEkgvVhKH3W9mf0TkuyW
 xj0w=
X-Google-Smtp-Source: AGHT+IH3+ecbYq/0EU0oY+2BKDBVOUGYwG7yFTompnBCj0eqKROVeauWeueT7fFC1WZqblLERE9qeA==
X-Received: by 2002:a17:906:31c9:b0:a59:efd0:e884 with SMTP id
 a640c23a62f3a-a5a2d57a38dmr364816666b.27.1715451240182; 
 Sat, 11 May 2024 11:14:00 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-8-99-67.retail.telecomitalia.it. [87.8.99.67])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a178a9d73sm356146466b.67.2024.05.11.11.13.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 May 2024 11:13:59 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 11 May 2024 20:13:52 +0200
Message-ID: <20240511181352.1712489-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1715451240; x=1716056040;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7HMbvvaDYgLYoIvOKCbOI1jSKqpvev0EzKixGlJ6KEY=;
 b=Ow0QaNDEY7dDeoAimc/1729iqW64UPGVez9WcR27dpzQ6fq5a5GJckfzxvnUGsTQoR
 RP9o27Tv3db6omhf0Y3ebdo2tUSF4kRLDscg8kO9WTopY8p7tgRXhJQ8+D9kLKps8zst
 n7hYy2ccusYbT3lf2MkC77gxQFSpc6dY9IPUs=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Ow0QaNDE
Subject: [Buildroot] [PATCH 1/1] package/sscep: fix linking error with
 musl-libc
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, michael@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch fixes the following linking failure:

/home/buildroot/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld: /home/buildroot/instance-0/output-1/host/i586-buildroot-linux-musl/sysroot/lib/libc.a(getopt.o): in function `getopt':
getopt.c:(.text.getopt+0x0): multiple definition of `getopt'; src/getopt.o:getopt.c:(.text+0x0): first defined here
/home/buildroot/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld: /home/buildroot/instance-0/output-1/host/i586-buildroot-linux-musl/sysroot/lib/libc.a(getopt.o):(.data.optind+0x0): multiple definition of `optind'; src/getopt.o:(.data+0x0): first defined here

Fixes:
- http://autobuild.buildroot.net/results/d5b1b4e5e9d9c8eca5e75c345db4d1f3f0cd84ed

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...-getopt-linking-error-with-musl-libc.patch | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 package/sscep/0002-Fix-getopt-linking-error-with-musl-libc.patch

diff --git a/package/sscep/0002-Fix-getopt-linking-error-with-musl-libc.patch b/package/sscep/0002-Fix-getopt-linking-error-with-musl-libc.patch
new file mode 100644
index 000000000000..ebb9985ef3ee
--- /dev/null
+++ b/package/sscep/0002-Fix-getopt-linking-error-with-musl-libc.patch
@@ -0,0 +1,67 @@
+From db7fab775d03438b4cfce6b49fab2d3176ecb1d3 Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Sat, 11 May 2024 19:38:01 +0200
+Subject: [PATCH] Fix getopt linking error with musl-libc
+
+The buildroot project, to which the sscep application was added, has
+configurations that raise the following linking error:
+buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld: buildroot/output/host/i586-buildroot-linux-musl/sysroot/lib/libc.a(getopt.o): in function `getopt':
+getopt.c:(.text.getopt+0x0): multiple definition of `getopt'; src/getopt.o:getopt.c:(.text+0x0): first defined here
+buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld: buildroot/output/host/i586-buildroot-linux-musl/sysroot/lib/libc.a(getopt.o):(.data.optind+0x0): multiple definition of `optind'; src/getopt.o:(.data+0x0): first defined here
+collect2: error: ld returned 1 exit status
+
+The commit 65561b53344b8 ("Fix getopt linking error") actually fixed the
+linking error only for uclibc, but not for musl-libc. The patch fixes
+the error for both uclibc and musl-libc.
+
+Link: http://autobuild.buildroot.net/results/d5b1b4e5e9d9c8eca5e75c345db4d1f3f0cd84ed/build-end.log
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: https://github.com/certnanny/sscep/pull/181
+---
+ configure.ac |  2 +-
+ src/getopt.c | 12 ++----------
+ 2 files changed, 3 insertions(+), 11 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 9f3ee15686a2..7a968d97dcaa 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -34,7 +34,7 @@ AC_TYPE_SIZE_T
+ # Checks for library functions.
+ AC_FUNC_MALLOC
+ AC_FUNC_REALLOC
+-AC_CHECK_FUNCS([alarm gethostbyname memset socket strchr strdup strstr])
++AC_CHECK_FUNCS([alarm gethostbyname getopt memset socket strchr strdup strstr])
+ 
+ AC_CONFIG_FILES([Makefile])
+ AC_SUBST([LIBTOOL_DEPS])
+diff --git a/src/getopt.c b/src/getopt.c
+index 0109406ba4ac..8793052845ed 100644
+--- a/src/getopt.c
++++ b/src/getopt.c
+@@ -31,15 +31,7 @@
+ #include <stddef.h>
+ #include <string.h>
+ 
+-#define GETOPT_INTERFACE_VERSION 2
+-#if !defined _LIBC && defined __GLIBC__ && __GLIBC__ >= 2
+-# include <gnu-versions.h>
+-# if _GNU_GETOPT_INTERFACE_VERSION == GETOPT_INTERFACE_VERSION
+-#  define ELIDE_CODE
+-# endif
+-#endif
+-
+-#ifndef ELIDE_CODE
++#ifndef HAVE_GETOPT
+ 
+ char* optarg;
+ int optopt;
+@@ -237,4 +229,4 @@ int getopt_long(int argc, char* const argv[], const char* optstring,
+   return retval;
+ }
+ 
+-#endif	/* Not ELIDE_CODE.  */
++#endif	/* HAVE_GETOPT  */
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
