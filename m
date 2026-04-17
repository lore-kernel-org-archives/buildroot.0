Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE55F436BF
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 17:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EBA740BD3;
	Fri, 17 Apr 2026 17:11:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nw0LDhTwzkCl; Fri, 17 Apr 2026 17:11:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9023440BC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776445866;
	bh=ykxMa7jndzx8HacJjpKvi8sJKdOBe8/Sx+Yvq1jMvX0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tc/eo6noDD2ViUzTd4KJDdPjbRyvtMRYjEt27SikIju2+AF/jyBvl0X+URHk0dVdm
	 kdQXXBafviAhdIwPVCWGjhglPvufaiLKSxpqJ2KXO+n+V8ncpD6ilR0HGy/Him8B6I
	 CQyHQS6FTbB6ozg/famb+9U/AOsGkNXG8pU0qmlwocGF21u6TtthJ7wc9AiPmFtIRt
	 GgA99xHeYzFBlR5GoHdEntBa6k9SUR7v5FHvcqoq/7fnDL7YFlTD1uP4Ei4lmTAPbP
	 H1K4cuW4JvUT40MnhgKG2hUnAcONS15GLS7tzxZLxiUj91nUG2QRvPEzkuSEMJ3W29
	 NLjdJSgDCE9dw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9023440BC6;
	Fri, 17 Apr 2026 17:11:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C337259
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 17:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19A1560EC1
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 17:11:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f7K6sI2M2tjc for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 17:11:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1D55660EBF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D55660EBF
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1D55660EBF
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 17:11:03 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-c06cb8004e8so355966a12.0
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 10:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776445863; x=1777050663;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UxJmcRVL8dJb/Yj2I017hYTAn69XNpKhKjvT0aSkBYI=;
 b=nXNWbUA+7pmwjw8QG6Ftd7+hAgxdTauVTP+LPQ2MCSlJn+Rv9XgtPCryjfe/GmcD7m
 bal87hUzzACNF5N/IZ4brJVSqJI5xjn1muwy6EGJjXdqlxsExf90YvWPphN+Vtz3KRxH
 gkuJxbLs+9FdRnkiuZsxGzDHaYqeGXssJrckLn9Y75Kfi9cOgPcCHvw5J+/+O71PhqlM
 d+yzS5PzXVRJRBlFa4LHjlfWqS136lLx3a2F4DUXHil5Gqu9ZUy3Em7zUR3TEB+aHHNj
 wn97AXI+FkcoQiML4z2K9W9dfn9UhpVp8db9ET0KCz1bDlCMJTQUaVWRrZBuSzLVFpSH
 Mptg==
X-Gm-Message-State: AOJu0YzxyNFN7OW60jGdOfPYFSWzGU2arw9Ew2E+fLZaLoTEVW3mCSnc
 knS62SbAIO991cngy/qtGy6gFANeCEzwNlbmMLzuZHS+agWAVVfKhsDOIaXHeg==
X-Gm-Gg: AeBDiet8mLWoJgAFRgs6khwU8h3+hi1iXUpc9mnRgboReWQ/2s5kozz65bt1B+NiimI
 1R6k6Pz6s0/PsddxGAxj14ENaGdxwphY7tTtpnP9XbQUworRIYN9DxzpxJVnBy7YiO7myQYrwxY
 XtDB2dy2vbIKSpVPkxHhPwL/GY2ooVAPvNxMrkjPpHc+EIPBTrqhtqrwwnAUesUFvgnj0UAngHf
 4OCCs5+MrLB/R7fzSdyQikpXNC5xiGzfJ16/1he7nA528WnET3+8AKeANMDyol2NA4FCPD5oX0E
 AuFwGz6Qf5PlmRiyjMj82Ww2sA/eT6PvSxyanLoq2ExLNCAube0llBxR/Dl+18rRSzlIo8L4elR
 bJkP9IyM0PxCb4Zoo5bxa/GDBM9Nw1t476bopyrNVljOxsqa3vxpddFnETPvYOkLdCdQrW+Nysw
 DpWH59t7hwe0CVjk+wM8eQPCfmKUldq33RQaHumlut0kbnyCASj8sLD9L+
X-Received: by 2002:a05:6a21:e082:b0:39f:91e9:cada with SMTP id
 adf61e73a8af0-3a08d677abemr4260803637.9.1776445862759; 
 Fri, 17 Apr 2026 10:11:02 -0700 (PDT)
Received: from fedora ([2409:40e5:112e:daba:4994:b597:7615:a059])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c797701d9bfsm1915006a12.16.2026.04.17.10.10.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 10:11:02 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Fri, 17 Apr 2026 22:40:45 +0530
Message-ID: <20260417171046.12548-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260220192301.119525-1-chakrabortyshubham66@gmail.com>
References: <20260220192301.119525-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776445863; x=1777050663; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UxJmcRVL8dJb/Yj2I017hYTAn69XNpKhKjvT0aSkBYI=;
 b=WPYDCCeJ5X73fGK1UdgEWFKwqkg2OZ0Am1qGomudd5XD+myAsNEvpHx+K1GmatWGIg
 08eW3RKW5soj9tOG8NVFnm3ov03Oz63BtukcirwguUrgyIKNmiOR6ASmN95p85sxI+v8
 obve5x4dTdh4wrOVm8x+E411F60WD2MH4SD2U6OXNcEVRMTMY62aQQMqjQ/rWmlZdCAr
 aAgfM3XRqC74l8aRQlbZI0kcKNHsdbGO//QASt9E533vKfmZ8Nylda6lYSnWSj41wMCa
 JIb6mfI96oKXJJHwah0JLPKXCzeuGSXyUSZ+SQlDjR7FC0VMlNBKhfMFOeYYmgoV2Jeb
 rrUw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=WPYDCCeJ
Subject: [Buildroot] [PATCH v2] package/make: fix conflicting prototypes for
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
This is particularly visible when using non-glibc C libraries (e.g. musl).

Fixes:
lib/fnmatch.c:124:14: error: conflicting types for 'getenv'; have 'char *(void)'
|   124 | extern char *getenv ();
|       |              ^~~~~~

Fix getenv() declarations in lib/fnmatch.c and src/getopt.c, and
fix getopt() declarations in src/getopt.h to match the prototypes
in <stdlib.h> and <unistd.h>.

Upstream: https://lists.gnu.org/archive/html/bug-make/2025-03/msg00032.html

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

---
v1 -> v2:
  - Add Upstream: tag with link to bug-make mailing list (Marcus)
  - Include specific GCC 15 error log in commit message
  - Improve commit description with more technical context
  - Update patch headers to standard format
---
 ...ing-prototypes-for-getenv-and-getopt.patch | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 package/make/0001-fix-conflicting-prototypes-for-getenv-and-getopt.patch

diff --git a/package/make/0001-fix-conflicting-prototypes-for-getenv-and-getopt.patch b/package/make/0001-fix-conflicting-prototypes-for-getenv-and-getopt.patch
new file mode 100644
index 0000000000..70f2dc2886
--- /dev/null
+++ b/package/make/0001-fix-conflicting-prototypes-for-getenv-and-getopt.patch
@@ -0,0 +1,70 @@
+From b64b62d00cb64b62d00cb64b62d00cb64b62d00c Mon Sep 17 00:00:00:00 2001
+From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+Date: Sat, 21 Feb 2026 12:00:00 +0000
+Subject: [PATCH] fix conflicting prototypes for getenv and getopt
+
+GCC 15 defaults to C23, which rejects old-style K&R empty parameter
+list declarations that conflict with typed prototypes in system headers.
+
+Fix getenv() declarations in lib/fnmatch.c and src/getopt.c, and
+fix getopt() declarations in src/getopt.h to match the prototypes
+in <stdlib.h> and <unistd.h>.
+
+This fixes build errors like:
+error: conflicting types for 'getenv'; have 'char *(void)'
+
+Upstream: https://lists.gnu.org/archive/html/bug-make/2025-03/msg00032.html
+Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
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
