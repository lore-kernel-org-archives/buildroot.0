Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C26C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 19:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB872403F8;
	Wed,  9 Feb 2022 19:24:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KqCX-42kKKlA; Wed,  9 Feb 2022 19:24:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72781404F1;
	Wed,  9 Feb 2022 19:24:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B27A21BF422
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 19:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9FD2E403F8
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 19:24:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UWVMW7_RBp0w for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 19:24:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 36AB3405F3
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 19:24:07 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id f17so5839101wrx.1
 for <buildroot@buildroot.org>; Wed, 09 Feb 2022 11:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EioXCjmM8lz2yP3091qtYzwh8fe6GyuIq7IBHuDuTX4=;
 b=qth6yrwoOuN+c3ObH0ITWCdWDZaIcZ8GA8TCbAoM/hYahpYKzpprtAqSDaZn+ZRrru
 PvzEtX10/Q6oKwEsiVts+xzOvDVxZjAh2KydkDfEWEzEqSX4B4aaEWYKM5pKg3mRhBlm
 sigI7WKW09p+VVLa1R2lTN2Fw58B69A9OPOd+IXNbzIXGWgqxwSbnSC/WAe7qM88wZ7K
 mzuDrXzjzHoz2H4y3Gw2Auv/pmMbuZP4S8Eihj4tMOh64FNVqZbdqxHL4Ea3l+QjFX/z
 AySE18LoNdsbTsKz03oPbl5dtzEHYYiBvFaR9nGhhn1kEluqKMXROzCinWZoatzjpdHg
 7oZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EioXCjmM8lz2yP3091qtYzwh8fe6GyuIq7IBHuDuTX4=;
 b=DDpbeuv6tVAFqtExYiAOauQ+KATWc4XpCNnd15mpZgU/ey4Fc+Jr88n5dES7HaZTDl
 ZaLIdZ/mB9Yhzgxovi+pHi2Yf23fxl4TquEJ63O0U1gY1pDZ8cpGcJom0/ZxzsYotOhC
 qqJ/oYYrEqJVCW0ZAGeqboLpLFnW0Xst63imzM2YB3IloLuZ9DpZymemLcW3TV3ANH0J
 Q15AUXEECiNL9C2HJ5WX5kZtA5Q/Fvv19phEE2rqJUsMYAhsh5T9EE06BZ8xY+JsHbaE
 fRCTc2w+m8RMXo81YczYjXOk4Nd1vlgUe6dwQpZYQQXdEhssZ0Gk4hclZWlO6nog76Dt
 U2Cw==
X-Gm-Message-State: AOAM531jtF3OqI7nQC4bkuhgSGygtQeg0xasTvbvuaB1SV/hWBxR+QQZ
 eXCKaahJTlsS8ibFhFi5cNL/4JoPgmM=
X-Google-Smtp-Source: ABdhPJx6RqhmTFoDUN8LBGFmXURcC1R3xU2upfIvK7XsKlUL8ewAEY4iscBih7AxMp0eI71UsRqsWg==
X-Received: by 2002:a5d:58ca:: with SMTP id o10mr3328657wrf.325.1644434645086; 
 Wed, 09 Feb 2022 11:24:05 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id c8sm7050901wmq.39.2022.02.09.11.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 11:24:04 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 20:24:36 +0100
Message-Id: <20220209192436.319769-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rng-tools: bump to version 6.15
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patches (already in version)

https://github.com/nhorman/rng-tools/releases/tag/v6.15

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ct-non-posix-extensions-for-pthreads.patch | 43 ----------------
 ...-either-pthread-affinity-set-methods.patch | 49 -------------------
 package/rng-tools/rng-tools.hash              |  2 +-
 package/rng-tools/rng-tools.mk                |  2 +-
 4 files changed, 2 insertions(+), 94 deletions(-)
 delete mode 100644 package/rng-tools/0001-Adding-ability-to-detect-non-posix-extensions-for-pthreads.patch
 delete mode 100644 package/rng-tools/0002-Allow-for-use-of-either-pthread-affinity-set-methods.patch

diff --git a/package/rng-tools/0001-Adding-ability-to-detect-non-posix-extensions-for-pthreads.patch b/package/rng-tools/0001-Adding-ability-to-detect-non-posix-extensions-for-pthreads.patch
deleted file mode 100644
index ba6cf63d7c..0000000000
--- a/package/rng-tools/0001-Adding-ability-to-detect-non-posix-extensions-for-pthreads.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From d1840e54a15fc454936cada10cce7fd91d06232b Mon Sep 17 00:00:00 2001
-From: Neil Horman <nhorman@gmail.com>
-Date: Thu, 15 Jul 2021 08:43:01 -0400
-Subject: [PATCH] Adding ability to detect non-posix extensions for pthreads
-
-Theres a desire to build rngd with musl, which doesn't have all the gnu
-extensions (but it has some).  So test for those.  Note, this requires
-the addition of the USE_EXTENSIONS macro to enable -d_GNU_SOURCE
-
-Signed-off-by: Neil Horman <nhorman@tuxdriver.com>
-
-[Retrieved from:
-https://github.com/nhorman/rng-tools/commit/d1840e54a15fc454936cada10cce7fd91d06232b]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 0fe06fc..de7dca3 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -25,6 +25,7 @@ AC_CANONICAL_TARGET dnl required for broken AX_PTHREAD
- AM_INIT_AUTOMAKE([foreign])
- AC_CONFIG_HEADERS([rng-tools-config.h])
- AC_CONFIG_MACRO_DIRS([m4])
-+AC_USE_SYSTEM_EXTENSIONS
- 
- dnl Parse options
- 
-@@ -100,6 +101,12 @@ AS_IF(
- 	], [AC_MSG_NOTICE([Disabling JITTER entropy source])]
- )
- 
-+AC_CHECK_DECL(pthread_attr_setaffinity_np,
-+		[AC_DEFINE([HAVE_PTHREAD_ATTR_SETAFFINITY], 1,[Set ATTR_SETAFFINITY])],
-+		[ AC_CHECK_DECL(pthread_setaffinity_np,
-+		   [AC_DEFINE([HAVE_PTHREAD_SETAFFINITY],1, [Set PTHREAD_SETAFFINITY])], [ AC_MSG_ERROR([Neither pthread_setaffinity_np nor pthread_attr_setaffinity_np found])],[[#include <pthread.h>]])
-+		], [[#include <pthread.h>]])
-+
- AS_IF(
- 	[ test "x$with_nistbeacon" != "xno"],
- 	[
diff --git a/package/rng-tools/0002-Allow-for-use-of-either-pthread-affinity-set-methods.patch b/package/rng-tools/0002-Allow-for-use-of-either-pthread-affinity-set-methods.patch
deleted file mode 100644
index 17285baa6a..0000000000
--- a/package/rng-tools/0002-Allow-for-use-of-either-pthread-affinity-set-methods.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 5caa086dc14cecf68d1a5c31e87ba1efb2c00893 Mon Sep 17 00:00:00 2001
-From: Neil Horman <nhorman@gmail.com>
-Date: Thu, 15 Jul 2021 08:48:10 -0400
-Subject: [PATCH] Allow for use of either pthread affinity set methods
-
-musl has support for pthread_setaffinity_np, but not
-pthread_attr_setaffinity_np.  so check for hte existence of either
-function in configure, and use the appropriate one.
-
-Signed-off-by: Neil Horman <nhorman@tuxdriver.com>
-
-[Retrieved from:
-https://github.com/nhorman/rng-tools/commit/5caa086dc14cecf68d1a5c31e87ba1efb2c00893]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- rngd_jitter.c | 15 ++++++++++++++-
- 1 file changed, 14 insertions(+), 1 deletion(-)
-
-diff --git a/rngd_jitter.c b/rngd_jitter.c
-index ea29436..5c7e09e 100644
---- a/rngd_jitter.c
-+++ b/rngd_jitter.c
-@@ -67,12 +67,25 @@ static int rngd_notime_start(void *ctx,
- 	for(i=i-1;i>=0;i--) {
- 		CPU_SET(i,cpus);
- 	}
--	pthread_attr_setaffinity_np(&thread_ctx->notime_pthread_attr, cpusize, cpus);
- 
-+        /*
-+	 * Note that only one of:
-+	 * HAVE_PTHREAD_ATTR_SETAFFINITY
-+	 * and
-+	 * HAVE_PTHREAD_SETAFFINITY
-+	 * Will ever be set, as per the configure.ac logic
-+	 */
-+#ifdef HAVE_PTHREAD_ATTR_SETAFFINITY
-+	pthread_attr_setaffinity_np(&thread_ctx->notime_pthread_attr, cpusize, cpus);
-+#endif
- 	ret = -pthread_create(&thread_ctx->notime_thread_id,
- 				&thread_ctx->notime_pthread_attr,
- 				start_routine, arg);
- 
-+#ifdef HAVE_PTHREAD_SETAFFINITY
-+	pthread_setaffinity_np(&thread_ctx->notime_thread_id, cpusize, cpus);
-+#endif
-+
- 	CPU_FREE(cpus);
- 	return ret;
- }
diff --git a/package/rng-tools/rng-tools.hash b/package/rng-tools/rng-tools.hash
index 6806a99fc6..be2ee13969 100644
--- a/package/rng-tools/rng-tools.hash
+++ b/package/rng-tools/rng-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4dd86f6ae37d917a8489f44070d39d7feddcc622429b95efd7aa85a1f3cfdf81  rng-tools-6.14.tar.gz
+sha256  bff0c58dff90ec10bd61f672e48618e045155eabd60b32d63a9c4ffbdad05f3a  rng-tools-6.15.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/rng-tools/rng-tools.mk b/package/rng-tools/rng-tools.mk
index 8db97569d4..8b195ea875 100644
--- a/package/rng-tools/rng-tools.mk
+++ b/package/rng-tools/rng-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RNG_TOOLS_VERSION = 6.14
+RNG_TOOLS_VERSION = 6.15
 RNG_TOOLS_SITE = $(call github,nhorman,$(RNG_TOOLS_NAME),v$(RNG_TOOLS_VERSION))
 RNG_TOOLS_LICENSE = GPL-2.0
 RNG_TOOLS_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
