Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E29C25B74
	for <buildroot@archiver.kernel.org>; Sat, 18 May 2024 20:47:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BAA7405D5;
	Sat, 18 May 2024 20:47:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BHKpbFwn1RQC; Sat, 18 May 2024 20:47:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9D43405EA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9D43405EA;
	Sat, 18 May 2024 20:47:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2328C1BF3F0
 for <buildroot@lists.busybox.net>; Sat, 18 May 2024 20:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 102CE60614
 for <buildroot@lists.busybox.net>; Sat, 18 May 2024 20:47:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6QyHdlI5eNOB for <buildroot@lists.busybox.net>;
 Sat, 18 May 2024 20:47:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ED681605ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED681605ED
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED681605ED
 for <buildroot@buildroot.org>; Sat, 18 May 2024 20:47:06 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2e564cad1f6so42369621fa.1
 for <buildroot@buildroot.org>; Sat, 18 May 2024 13:47:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716065224; x=1716670024;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o34IHJ9nTC4l+4kwvDdhOviK0XhPqRny44cTxtnATQ8=;
 b=h020qGxmwFRcFHl8hebpsbW2SqJjBbw6EYyVAsflSJUyTUuxP7zdKNHuWxzXhrrT7f
 r7BmDlXPR9ZuyLTJn1i+QhETA0qUo4kNI6Z/Pqtsr7hpxghZqGi3+HeitUZRCpMZuWF8
 UGGP0+ADjLNTxhiIH3MtcWOE9M55kyc0ucN7gH5ioFgifL09hUkg2o7UpaS5lzTIhHLQ
 yby9r5qf9//4HpLznrI0v8bw6b7ZvxwRYo32st8VgkAaO2b9MuHSs9jb1MYz0mPVU34V
 s8YSTHLS2tOWUdvcRW+YJ5cZB5QUKAOKG8MXcSFalbwBtjTCl2NPkn8K+deWWBQVAVP4
 rw2w==
X-Gm-Message-State: AOJu0Yy0GVrJsVEqYZ+X+iRTH6eCceGi7WKa/OZ4v4qVP+q15gEOJUYZ
 IO00PHuhhLLn2XTnQ0me0T0K1amH5H7DJ7fzGxJ2gRbbf2D19xtYGWBzcw==
X-Google-Smtp-Source: AGHT+IFlxr6ic9ALDH1NCcMtlnfg02ikHEaAar1yDQe35cmIDl/8VEb27snA8l9CAazAFGEjOTwY+g==
X-Received: by 2002:a2e:2c0c:0:b0:2e7:102f:7aeb with SMTP id
 38308e7fff4ca-2e7102f7d5cmr31659551fa.40.1716065223584; 
 Sat, 18 May 2024 13:47:03 -0700 (PDT)
Received: from development2.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-574ea5d755bsm6176934a12.51.2024.05.18.13.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 May 2024 13:47:02 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 18 May 2024 22:46:02 +0200
Message-Id: <20240518204602.3167167-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1716065224; x=1716670024; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o34IHJ9nTC4l+4kwvDdhOviK0XhPqRny44cTxtnATQ8=;
 b=JDcoZ68smFFoZd4VzJhejwRv0fmzqJFo1rhCsNCC1dtsCAFOus+DcZEmt6wml5KKxu
 JvnXEEsJkymNBfC3/8lVUDt4F2wzNLTCiabS6mdl28N1DPMKS7mnTGXzBC0wC/Cyi1dK
 3owp228YTKlWol4Z2qgwk6vl0PGMjuAKQyuXE0R0ThfH66KNq7iWRwuWeEm5Gm4qbM1O
 wPYn3uh2kEiykFtChNemeL9uoyEOi5dCPC3jN6jT7VnfnK6HR+8E4q8I3F9DvUVJgHPI
 ZDtauBAbSmfZni8LTFe29X2CaL0KrVYreB80PMssXwVRURDKatV2ZAAh0hEizGAwCye7
 Mlsw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JDcoZ68s
Subject: [Buildroot] [PATCH v2] package/ntp: fix build with GCC 14.x
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Fix pthread_detach() detection that is broken when building
with GCC 14.x:

checking for pthread_kill... yes
checking for pthread_rwlock_destroy with <pthread.h>... yes
checking for pthread_detach with <pthread.h>... no
configure: error: could not locate pthread_detach()
make[1]: *** [package/pkg-generic.mk:273:
/home/user/buildroot/bsp-barebox/build/ntp-4.2.8p17/.stamp_configured]
Error 1
make: *** [Makefile:82: _all] Error 2

Reference: https://bugs.ntp.org/show_bug.cgi?id=3926

Additionally, refresh patch 0002 to fix the offset of hunk 1.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes v1 -v2:
 - add upstream reference (Yann E. MORIN)
 - rework 0002 refresh reason (Yann E. MORIN)
 - add error log

 package/ntp/0002-ntp-syscalls-fallback.patch  |  9 ++++---
 .../ntp/0003-fix-pthread-detach-check.patch   | 27 +++++++++++++++++++
 2 files changed, 32 insertions(+), 4 deletions(-)
 create mode 100644 package/ntp/0003-fix-pthread-detach-check.patch

diff --git a/package/ntp/0002-ntp-syscalls-fallback.patch b/package/ntp/0002-ntp-syscalls-fallback.patch
index 535fc93dfd..46704b9d3f 100644
--- a/package/ntp/0002-ntp-syscalls-fallback.patch
+++ b/package/ntp/0002-ntp-syscalls-fallback.patch
@@ -8,10 +8,11 @@ Signed-off-by: James Knight <james.knight@rockwellcollins.com>
  configure.ac | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)

-diff --git a/configure.ac b/configure.ac
---- a/configure.ac
-+++ b/configure.ac
-@@ -1523,11 +1523,11 @@ AC_CACHE_CHECK(
+Index: ntp-4.2.8p17/configure.ac
+===================================================================
+--- ntp-4.2.8p17.orig/configure.ac
++++ ntp-4.2.8p17/configure.ac
+@@ -1472,11 +1472,11 @@ AC_CACHE_CHECK(
      [ntp_cv_var_ntp_syscalls],
      [
  	ntp_cv_var_ntp_syscalls=no
diff --git a/package/ntp/0003-fix-pthread-detach-check.patch b/package/ntp/0003-fix-pthread-detach-check.patch
new file mode 100644
index 0000000000..ffe5daa06d
--- /dev/null
+++ b/package/ntp/0003-fix-pthread-detach-check.patch
@@ -0,0 +1,27 @@
+fix pthread_detach check
+
+Refrence:
+ https://bugs.ntp.org/show_bug.cgi?id=3926
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ sntp/m4/openldap-thread-check.m4 |    6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+Index: ntp-4.2.8p17/sntp/m4/openldap-thread-check.m4
+===================================================================
+--- ntp-4.2.8p17.orig/sntp/m4/openldap-thread-check.m4
++++ ntp-4.2.8p17/sntp/m4/openldap-thread-check.m4
+@@ -262,10 +262,8 @@ pthread_rwlock_t rwlock;
+ 				dnl save the flags
+ 				AC_LINK_IFELSE([AC_LANG_PROGRAM([[
+ #include <pthread.h>
+-#ifndef NULL
+-#define NULL (void*)0
+-#endif
+-]], [[pthread_detach(NULL);]])],[ol_cv_func_pthread_detach=yes],[ol_cv_func_pthread_detach=no])
++pthread_t thread;
++]], [[pthread_detach(thread);]])],[ol_cv_func_pthread_detach=yes],[ol_cv_func_pthread_detach=no])
+ 			])
+
+ 			if test $ol_cv_func_pthread_detach = no ; then
--
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
