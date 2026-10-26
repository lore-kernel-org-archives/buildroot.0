Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34009606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 13:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Ra5OFryD
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01A8C80DB0;
	Mon, 26 Oct 2026 13:52:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CyLA_EBW5au5; Mon, 26 Oct 2026 13:52:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0A5A980DB3
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793022753;
	b=T9Uzalt2QeL7aYRkwLxpi5FWx+/iyuhYPdblcbEEciCdCUj62Ksyf5l0cFe2w0dWY8zt
	 MhXeE6q8/z/IPcW30fayaBQGin5HBEZNsf5TrDKO+t0qh4VkaWS2O3M4yZAvB/Kz6SS3F
	 DOnZpHWmMqhLzNaWgmbuGeGZtRITCrBuTrQnT2yId5Merja6gexVIKWXVh1QuFCxKlBn6
	 sD6BzqMeikoZ0i03JPbTtaJKnWcxh12q+f2OMyGeA9e6FQJAwIyLnt+XCqMRezhNFtoFx
	 CdY5Vw2wH5jE3nU3UN8cEatqKp2U9zNpF1UG4VVZgKBBLugDXZPV/JrmlAnGeKzp5vw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793022753;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=2UHs4htgLvTDaPV95HTDBA5jO5B4lqRLIRjOwTA+pPY=;
	b=Hg9YFbohL/DJwhwzMi9687IJkudb5NrXVyjwCNafQHSrDX1HdMEL1TLyuJpqA1fQfenH
	 HqKDrI59f5sGAOecA0I40hcvOcqtqQNujiY/YDcsI9dn7ZnWx8B7hnFWpU/aYceM946yE
	 9C2XK2bvLHVAqf7Kxkk+jwsPD07idAo56OKbCUg/39Ohz5bHJm44k0/Ct5OKPK8uV9V5j
	 UMvVoBctgfL8otwfkjEE8HGlKpDT0P0wc7DKLWQmo8xsD991VlrDUEyYBRwpWKqcbq08F
	 jPSErZEpU+tSFi1zksoN9hrUuKWFDATYVx38lbyGnJIZvlYsuB3P5csXB5bJJqswllg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793022753;
	bh=2UHs4htgLvTDaPV95HTDBA5jO5B4lqRLIRjOwTA+pPY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ra5OFryDv7N9EQJFZCmuufrl6vL+q5osfjLO+cmKfH0MzphCpuX43pkJ42cctVe0W
	 zhTEVL21B98uMrCR9Y9Ctl6+ni+UsNKReTexY7Q0h9C/LkScd9paY1psRSWDDauOBE
	 Nhwqm3d4loHYpaci48eYEByZIFM0S65DYegkrwMHJINqbFiDqRutrBsaHTq2EMjEAi
	 SVn7N3bhrv4Y2rHuRqwsolJNx0Ad2kFiMRwVhkr9tPtNkFYtR2ELe5+nuTvg/wFKJb
	 DTsjca01NDOV42gV74Wby1Fx55GjHokz5xMIbnRuiizcZT/HcndSpaOkR+qda/v/Uv
	 VkOkQ3rhP3gGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A5A980DB3;
	Mon, 26 Oct 2026 13:52:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 888433B6
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 13:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E99760608
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 13:52:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QqIaasso9IpT for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 13:52:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4282A60607
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793022750;
 b=YrfaMbfVTHwjpfgwUzOUeW7djzRVMiwhYz0qeAxzU/zbKx8gyHV/mOceL8sYXlbrI1Nb
 0iTO1mUN0vJwal7eIIRqc8o9Q4PCUruBdfXcHyOm/xRUxfmbvGvydQdkUYAXH6CtAIrLJ
 l7LIESlBgFFLLG1O5ghY+gzEecJb7Tp2bg6yDCVVnniYLE27Z/AALHpZE2A2StEpeg2E6
 LKBb1s2Mj37c6yPzVIVUa1YJ2FtyZ4R60Q6je9QCYWq71/MfJg4/5kKmAcA/R2VDwogMy
 EInpPMqmBe7KVrNzuHryIim2Kr99yDnF/bOJqyTLKA1tO71vTohurUo8qTDBR2hnkZw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793022750;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=J2ZOjCk+58FRuXrEhTAX2eb1twbpZjOrtfGHReWyJS0=;
 b=SohFnmX+VuEpCNsZNKTLV99q5jMAuUW++P9wvvJFyinWWeBc/PhpXXwbW1CFpJNik+Qq
 uQE6VtBHuyo44z8d7yKZMBMLkqO/0pLOexLUkyPSAUGxtBcwm0m3AMGlrlclJ1VeXODfk
 2RCzlIF+NijHuH5XS4nHUUseiwQVXKxUrbX8EE3q+v489vHjgWqkhzVRgzgzBffCHqhC9
 AQacali9Wmmjsqpe0Bu82yzwoID1YWsajFtuaFMcweFSzMDxPddLBIxPeEra+hKx4H2jv
 mUU+UEYyFU4SQucvYxAaUUxwoqT835DPUEPFrNbC0TvTOqAaFFM9Trz/zumt7Nq/EpA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=MBPlvSgM; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::62e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4282A60607
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 13:52:29 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-c40f29667e6so482736066b.0
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 06:52:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793022748; x=1793627548;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=J2ZOjCk+58FRuXrEhTAX2eb1twbpZjOrtfGHReWyJS0=;
 b=SZTH47D5rzMSWNeaejAFw7nmTOLWwaqa9c0f0vY9f7m1XdWzBQeqdB7RAdaR3pZmvr
 thgODpe0KJBWvOAG46DVhX1navK5xcvRiraNoLY7YDmlVCEz3h8MwQymtHf3ex0QQJaE
 XsDnVicUlCQ6fmzKsaxcYv/o4gcvVAdkSXH4eTryNWaCkNtx5tJoK72vup2TNSzE2gDD
 BDCHoB9zrDSMolLJxjrRBQyFGnIjO6GjG03bkrfSrnsNiwN4zzbr5WIYLj549X7TaQ0f
 gcMI7/5dWQMqWTz6WxRMQF+Pacqxkwp6m6qZBMfwv/xNOUE/F4Nu7CHeEVvYHvXuiQkO
 roNw==
X-Gm-Message-State: AFq9FYItBCJXj7+FiqXvV5kfbkvhUkQPgs094cu4T6yeEEpxeLm73F/d
 i4BdEyUj7Lsw1Lwz/caAyJUy18+vv7U+yHZcAn1HeRThOWph8G3mJt/jAHJnUw==
X-Gm-Gg: AYBFou3RtW/lsM7mWR1c/APNcz/gEmZ+ijdYVdtsEim6PfK1A9EDtjBwa5qnyxFs/dK
 YCr2/USdc8OVFqVxajPpT6SXjo8q2HdWtq/LsHl6IzsPicEDT3YV2yXKCF1AKmpwYIibEevI4bx
 NxnEeYuS3TwIbR6XP6Z7uT1i8FzV44BsUwLfV/ac44+mMcfJ8oOKqnLCUyYRNl/q2z1+HxPHZP/
 0QL4qo8z732SxJ55W9hczXqPHgNOk4OfnDFhpud2rWOsdf0d871QZPY/CGL/VNLxa/HQ1nAx8hZ
 UI9k7gzOJf4/mCecoF8Zt2KbcFI61/G1uV5wjg8ArXXo7UnKhfQbOo72CxdoyIJuUwAZONiVshI
 xvfYwBPRLhzDOgkUxMgLyJ1bFBYTOn4/GsHKltZZZB1gMRBf+Zy/ml2WmZJ5fiCIDYKq8X6EFMY
 j9o0pY6B0FI+jPJY1PVwOPgpR+Pt/ktUbT7bwnFGQypDt0Id6wyRrhb3rSdb4N0AXKgs7hQQc+y
 1L1v0SVDe5AbDfifBvaTMnTmg0TdsrGVt+K6rhGqvPLXHhbVtdbBhXQEhubBRQzzFTy8OenySAD
 DW8BT06mO+AE/wt0MYQPIeNo5mQcmt0hNMwmMhvWeCoSFqC4CLuLZJgS
X-Received: by 2002:a17:907:100c:b0:c46:8063:220c with SMTP id
 a640c23a62f3a-c46bdbefbf5mr569386466b.11.1793022747297; 
 Mon, 26 Oct 2026 06:52:27 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd5202d9sm325530266b.32.2026.10.26.06.52.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2026 06:52:26 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 26 Oct 2026 14:52:26 +0100
Message-Id: <20261026135226.1614907-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/ccrypt: fix build with GCC 15 on musl
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When cross-compiling, ccrypt's configure can't run its getopt_long
test and always falls back to the bundled getopt. Its getopt.h only
prototypes getopt() when __GNU_LIBRARY__ is defined (glibc, uClibc),
so on musl it declares "extern int getopt ();", and getopt.c declares
"extern char *getenv ();". GCC 15 defaults to C23, where an empty
parameter list means (void), so the build fails:

  unistd.h:127:5: error: conflicting types for 'getopt'; have 'int(int,  char * const*, const char *)'
  ./include/getopt/getopt.h:150:12: note: previous declaration of 'getopt' with type 'int(void)'
  getopt.c:404:21: error: too many arguments to function 'getenv'; expected 0, have 1

Add a patch that always uses the full POSIX prototype for getopt()
and gives getenv() its standard prototype.

This issue has been present since commit 75891397abe6 ("package/gcc:
add support for GCC 15.x"), which made a C23-by-default compiler
available. It therefore affects 2025.08 and later, including the
2026.02.x LTS branch.

Fixes:
https://autobuild.buildroot.org/results/dd2b362542488a306a523fa05dedc859dfb0cf7e

Fixes: 75891397abe60dbe3d82a1ec39654ff81d1b1406 ("package/gcc: add support for GCC 15.x")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...h-C23-compilers-on-non-glibc-systems.patch | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 package/ccrypt/0001-Fix-build-with-C23-compilers-on-non-glibc-systems.patch

diff --git a/package/ccrypt/0001-Fix-build-with-C23-compilers-on-non-glibc-systems.patch b/package/ccrypt/0001-Fix-build-with-C23-compilers-on-non-glibc-systems.patch
new file mode 100644
index 0000000000..002d011062
--- /dev/null
+++ b/package/ccrypt/0001-Fix-build-with-C23-compilers-on-non-glibc-systems.patch
@@ -0,0 +1,56 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Mon, 26 Oct 2026 14:41:24 +0100
+Subject: [PATCH] Fix build with C23 compilers on non-glibc systems
+
+C23 (the default since GCC 15) treats an empty parameter list as
+(void). The bundled getopt only prototypes getopt() when
+__GNU_LIBRARY__ is defined and declares getenv() without parameters,
+so building against e.g. musl fails:
+
+  unistd.h:127:5: error: conflicting types for 'getopt'; have 'int(int,  char * const*, const char *)'
+  ./include/getopt/getopt.h:150:12: note: previous declaration of 'getopt' with type 'int(void)'
+  getopt.c:404:21: error: too many arguments to function 'getenv'; expected 0, have 1
+
+Always use the full POSIX prototype for getopt() and give getenv() its
+standard prototype.
+
+Upstream: https://sourceforge.net/p/ccrypt/patches/7/
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ src/getopt.c                | 2 +-
+ src/include/getopt/getopt.h | 7 -------
+ 2 files changed, 1 insertion(+), 8 deletions(-)
+
+diff --git a/src/getopt.c b/src/getopt.c
+index 23ab9c3..9974486 100644
+--- a/src/getopt.c
++++ b/src/getopt.c
+@@ -209,7 +209,7 @@ static char *posixly_correct;
+    whose names are inconsistent.  */
+ 
+ #ifndef getenv
+-extern char *getenv ();
++extern char *getenv (const char *);
+ #endif
+ 
+ static char *
+diff --git a/src/include/getopt/getopt.h b/src/include/getopt/getopt.h
+index 1abae0f..d8b4edd 100644
+--- a/src/include/getopt/getopt.h
++++ b/src/include/getopt/getopt.h
+@@ -141,14 +141,7 @@ struct option
+    `getopt'.  */
+ 
+ #if defined __STDC__ && __STDC__
+-# ifdef __GNU_LIBRARY__
+-/* Many other libraries have conflicting prototypes for getopt, with
+-   differences in the consts, in stdlib.h.  To avoid compilation
+-   errors, only prototype getopt for the GNU C library.  */
+ extern int getopt (int argc, char *const *argv, const char *__shortopts);
+-# else /* not __GNU_LIBRARY__ */
+-extern int getopt ();
+-# endif /* __GNU_LIBRARY__ */
+ 
+ # ifndef __need_getopt
+ extern int getopt_long (int argc, char *const *argv, const char *shortopts,
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
