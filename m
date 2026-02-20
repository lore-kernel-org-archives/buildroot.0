Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 058DCC5AD68
	for <buildroot@archiver.kernel.org>; Fri, 20 Feb 2026 19:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CAA3608A1;
	Fri, 20 Feb 2026 19:23:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NLYH-L6_M1lC; Fri, 20 Feb 2026 19:23:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BCFA61018
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771615398;
	bh=ZSrU0rr3V9KB3YE6osbnTUAXylAhz4DAqSXXaW6MHLk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AFSUquv3TSrHUOBgLdL6BZ+cd8uZ5xmMgbeLS3MuLXCNWakLcsl+iVEXSYfSZmCh5
	 uxIvrw4mbuJXz1Alkl9vJJSyQS7k9l5GjQKItoZ+don2YLgBu6M4ELOoD7lz991Jap
	 vZjs3DKA8uURExxG4j1qIxEzDqBH8SEDUoLXhYtUU4GRJqY7NJzuyJanv9h4l6Q8Ow
	 SNv7s4aBIrDplvzSdLcZ3/nv6e5Nd+gGk3R/GyTNbjaFcNUlBrXdBl6EBYcud4OjeU
	 HtnbcGMZvf74QBiHXaCGaYW2yCcXurgBOhlXX470cMyKme13Oq4G1YIP5E1E6U7uHU
	 ZSz7PV2+8ptKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BCFA61018;
	Fri, 20 Feb 2026 19:23:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B2E8206
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 19:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C80261019
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 19:23:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iQYqqY2N4m0G for <buildroot@buildroot.org>;
 Fri, 20 Feb 2026 19:23:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 81CBC608A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81CBC608A1
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 81CBC608A1
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 19:23:15 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-352f60d6c2fso1435307a91.1
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 11:23:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771615394; x=1772220194;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GA67d9engpl4CVE4GA3r8tpg3DFHQuzgJhZo3dD0k8Y=;
 b=kxZs5v29hz7apNLkSMCJb/w/aPcsk+OS4VJYHKgkcPUeWqXsbeDUkwsWUexRK8Yf0f
 V/jzSCY+G8amePkFussAeKtgqfJWnB6b1YLvoLHCrGccy499Lw3LXoaacY4CaWNUgazT
 Dr8Thi3V7bcmw6lFr78K8dfPfcPxqoTIX4R7SJ8H2F8i/c5TvvCBeFX5AL2POacLFo81
 jHQbX9UxK+XD4d8EiLFjKGVMRgtGUH7bNgBZAA8rWC3shaGV+aAEEEkM5AkYoLDJLBQ3
 gY6TZDGeXsUqvJ1k1RSF7ZFcMZFQ+scogFWWZxS8GFHw0LOWdEJE0dP6aiAl4jMNExkp
 6RBw==
X-Gm-Message-State: AOJu0YyqdhbofUeq2RV6FRrkutfr5/kD5xfUHLyRLEa8jlh924srQRwq
 di9tQ4+lmuQh4Jh8rQNJqrbzXUnEfKXSBXGupZS+NjxJl8p36j/NZ2hj5OiL1rviTl0HlA==
X-Gm-Gg: AZuq6aJ8HZ/ufvZAHUPN+0DeKVVOZK6qsnhTFaOd2pzb7dU55uP8RSJ2tfrtfGrx0xh
 kj0SbHEvqyV8cJZTecovS9b8VCsHUmjHBipQxt+POBFbkaSxUUAvcduOzuH15UMaSRoHIcysFMU
 eDIYhIohPLlC7CfqqJCBSnI7TfGzl5i5wiQ981k1rVYrOp8+zjSSwOh3Ot/GaoH1YC2SkRtnt2B
 xtMHzATlb0xGPH1IoawRVaPLRHfc1+g5bcjlxLE6qydzEjLCWSvMCZdAGY2Zb2T4UX7XZzVvECB
 VRIT9I5Zy6cXcgkvXdb7W9IGcmhL51ifXxKpLKaOddjDi30R/cnj651Yvx3hJyiCrLr2utfrPnT
 7Yy8GqqQc4Hpc7mHNtYZFciWvKwhkc8xQ06kUygO8TZLRX0FhfpYOXLBnVcMxGb55NtvKp2gp3L
 KuQhvT/qOfl+umnTn4Bx9EPpNdYzSl512vzf7RPHJWpWNm
X-Received: by 2002:a17:90b:2781:b0:32e:7bbc:bf13 with SMTP id
 98e67ed59e1d1-358ae8da15amr480973a91.34.1771615394157; 
 Fri, 20 Feb 2026 11:23:14 -0800 (PST)
Received: from fedora ([2409:40e5:1045:f7f3:b903:7ed:3361:c527])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-358a2b39b66sm1250681a91.11.2026.02.20.11.23.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 11:23:13 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Sat, 21 Feb 2026 00:53:01 +0530
Message-ID: <20260220192301.119525-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771615394; x=1772220194; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GA67d9engpl4CVE4GA3r8tpg3DFHQuzgJhZo3dD0k8Y=;
 b=DoBdhZ3XM/W3eDaketOXWRxJprOmFB3D+03JMnFPaHZbc9JmxSUir6qf9kDe35Fh0q
 F6/kvpOWFsXQKKCJtla+TUSEclc3QVeBJ+PRRzu5Rzd4fk22RFMstRYC+LW/U/bSGJ1r
 OcXPf8DOruzNTqa5nVXvCBYskG4tkwzSMGj8uWZsLHoFumszS+hEwiet4D0LYo9lmyVn
 sb5o5Vsvq2Ih4a/F3m/MLX86C5B0dMU18PXm448aGdG0k2hng0/VNsABad0pIYEf8a9l
 Z68OatJ217RzArQ4bz48CGdOnOKDcs7q6iQ50CtQsVwcYeJetrkx6DdukMtKIEh9askP
 v37A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=DoBdhZ3X
Subject: [Buildroot] [PATCH] package/make: fix conflicting prototypes for
 getenv and getopt
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

GCC 15 defaults to C23, which rejects old-style K&R empty parameter
list declarations that conflict with typed prototypes in system headers.

Fix getenv() declarations in lib/fnmatch.c and src/getopt.c, and
fix getopt() declarations in src/getopt.h to match the prototypes
in <stdlib.h> and <unistd.h>.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 ...ing-prototypes-for-getenv-and-getopt.patch | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 package/make/0001-fix-conflicting-prototypes-for-getenv-and-getopt.patch

diff --git a/package/make/0001-fix-conflicting-prototypes-for-getenv-and-getopt.patch b/package/make/0001-fix-conflicting-prototypes-for-getenv-and-getopt.patch
new file mode 100644
index 0000000000..b64b62d00c
--- /dev/null
+++ b/package/make/0001-fix-conflicting-prototypes-for-getenv-and-getopt.patch
@@ -0,0 +1,60 @@
+From: Buildroot Maintainer <buildroot@buildroot.org>
+Date: Sat, 21 Feb 2026 12:00:00 +0000
+Subject: [PATCH] fix conflicting prototypes for getenv and getopt
+
+Fixes build error with GCC 15 and musl libc.
+
+Signed-off-by: Buildroot Maintainer <buildroot@buildroot.org>
+---
+ lib/fnmatch.c | 2 +-
+ src/getopt.c  | 2 +-
+ src/getopt.h  | 4 ++--
+ 3 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/lib/fnmatch.c b/lib/fnmatch.c
+--- a/lib/fnmatch.c
++++ b/lib/fnmatch.c
+@@ -121,7 +121,7 @@
+    whose names are inconsistent.  */
+ 
+ # if !defined _LIBC && !defined getenv
+-extern char *getenv ();
++extern char *getenv (const char *__name);
+ # endif
+ 
+ # ifndef errno
+diff --git a/src/getopt.c b/src/getopt.c
+--- a/src/getopt.c
++++ b/src/getopt.c
+@@ -202,7 +202,7 @@
+    whose names are inconsistent.  */
+ 
+ #ifndef getenv
+-extern char *getenv ();
++extern char *getenv (const char *__name);
+ #endif
+ 
+ static char *
+diff --git a/src/getopt.h b/src/getopt.h
+--- a/src/getopt.h
++++ b/src/getopt.h
+@@ -102,7 +102,7 @@
+    errors, only prototype getopt for the GNU C library.  */
+ extern int getopt (int argc, char *const *argv, const char *shortopts);
+ #else /* not __GNU_LIBRARY__ */
+-extern int getopt ();
++extern int getopt (int argc, char *const *argv, const char *shortopts);
+ #endif /* __GNU_LIBRARY__ */
+ extern int getopt_long (int argc, char *const *argv, const char *shortopts,
+ 		        const struct option *longopts, int *longind);
+@@ -116,7 +116,7 @@
+ 		             const struct option *longopts, int *longind,
+ 			     int long_only);
+ #else /* not __STDC__ */
+-extern int getopt ();
++extern int getopt (int argc, char *const *argv, const char *shortopts);
+ extern int getopt_long ();
+ extern int getopt_long_only ();
+ 
+-- 
+2.43.0
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
