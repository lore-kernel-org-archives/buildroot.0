Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3182E606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VAOWZr6s
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10199812C7;
	Fri, 30 Oct 2026 14:19:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bkZ_Hs6FbnSk; Fri, 30 Oct 2026 14:19:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E1AB1813B0
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369956;
	b=RMUNPzVMBiXOuIvDTaWv0qR+uhqVaohP2ITpZnyYH1shHrwR5JXLOx2uol76ehAJLoCG
	 TDZA8Fk58hZNcsrURvurWpo6SNbLJVzx1NQlAvrJRhoIqI3OwHzzYAq/71JzShML/HvUq
	 APXBoG+rTr/X9EGP/bjvpXYAi6Df9ltSZuonnr/s8IAtjFPcaLWJT9G3I9GxaaOHEkFaM
	 yIsjtZQ6gMSQi0DsHe3FTNciKimGxDNqiWeZ/Lg/5Ir0K7D7ATN32rYbYzlIyGmB8uikG
	 UOD+aNRFxmPjPvmXBQLU9U8lMv1WUd+6a6vUfUSFmc5+bNEEepRHL82/X4Jdk5jCukw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369956;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=LYtEk9NCVBRDpLCpAcxnR/xzTXVWmiJSGi5z9VybWCw=;
	b=H/9YYxvlIHjzXGqMemvwEcqoUYzqRKjLAPZipVgbSR7t6+U5wIdIYd+MjsqwerWvI1r7
	 8pYj26mV1Nh70T/uKBry8JDULyIDJpeo0upY6GmL8LkB66YmqGMFIQZFnw1QdUqdbbEQx
	 IzCnyx70ZO5VSCs/yODdUKBqDLlBFMfgeAUz5TycPXkuFuOFx+p7ELk3gl2iAaP+B5Ysu
	 AaOBU6FEOrfb2Xh55UVkEdHw2W3UWpGuEnSl062KavUGyv+An4T3Z26pzS3soeKGPv7Qz
	 bToGeBVqWtZPWcftF2YmaGFTNxbDiDmZz1e8C/kEaktO9p8UFQTdM7njacw5jEJgOXQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369956;
	bh=LYtEk9NCVBRDpLCpAcxnR/xzTXVWmiJSGi5z9VybWCw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VAOWZr6sCGJX/YkanGrZxCPlRtAP1R9kFZ2StZ/6a05nZE3xS4w3NVoQc2L2R4XKV
	 fKlspdOIs4Bg5AqRGa94g3zbXMzc+KgIAvBs7rM4lQgKDu4ZQoZ2w1S+z4J8nyowGj
	 U5L/dImdom2t/7b5XdiIV/B4nFqTjJNI4oR1ArfIFdiE25yTLgfW8PBYIUGLrtsGsy
	 4VimGtrd8ykMSSCeW6UqEaO7KjNS6TF4MGfiTOua3HKMVT10eRa6FTiGKAWPLXHFfE
	 ALc7ywswYhOf5+m6kyH9SWvLujfHWrEtldk1IYlRxvYCOtZ9DV+Zmg3sgiKxNq912O
	 zAQGvlWuiRW2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1AB1813B0;
	Fri, 30 Oct 2026 14:19:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 90FA1D44
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8404D812E1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3NRtPW9R6MHz for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 80C16812C5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369890;
 b=ab39jewt3PMtdNQ2EarmRj9k/OMO+ShjkNGT9QmudBij+0Wg8+Ppx4I+jZ6riAKPt/dZ
 0MZdmdk3AYaDjEcLDI+v5sm4XYKwDN8z71xPy33pKDxWvOMcOGmshQrpfzY11+adgzq55
 k079UTmWe8bXP41AZ6G35CpeXRUVppl9zMo6OocEC53OgqLwS+pfPL/UjehEZT/tz6Pwa
 KxG1VaRi0CHWYOilINzfjVQZ6xW7yxeN2szvsTbGhlDCG25gHnCIOErKDb4A8N0P41LNC
 nWQwCC4N2AOJJDQL1K/lwy2sQtosreeoTR0oZxvfeOPzgJ4gdqFxeFRqWH45vZFS8Uw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369890;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=0HlPelQKvLViesRYeSHkoXvv45yexFL68aI21uAYqrI=;
 b=Rsi/ZPYoM0g/ErLTSL7BAUZ0I9gOvHPnPCR7Q4zZiI5hWR73lUcFwSOm+gh7BguveX4A
 0/oVzizlWjjIFZzO3tdgkMkq6QJvvY+DICdncC9ACIpnKA0ME54LgB94EChOnigkw2CJg
 k1YaIfSU5923oeZrIgvheeHEkvYINHl8IJjZhi1Xks1O7hNUt+aCxk7tbXnO95GskaOOo
 knJ+Sy2gl3FR+HyMK1h0gB/QGuyXsAIY+YdVDyunGx8ORvnYuMdhQ9dEg96FwUi+9NE77
 wXTcICO4I2MHHmya3jj+eXGvfw3VajNKofrlmyD3IOeipQwBpkgaO1F4ochlWPxup7A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80C16812C5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 91B859D388; Fri, 30 Oct 2026 14:16:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:07 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: d2b9fcad0df1e1d6813206fe45f7999e908a9c2e
X-Git-Newrev: eb1c172600938b55916d6a00378ca14e481e063e
X-Patchwork-Hint: ignore
Message-Id: <20261030141642.91B859D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/libmicrohttpd:
 fix build without thread support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3465191500593615490=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3465191500593615490==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/eb1c172600938b55916d6a00378ca14e481e063e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

When the toolchain has no thread support, libmicrohttpd is configured
with --with-threads=none. In that case connection_get_wait() is not
compiled, because it is defined inside the
"#if defined(MHD_USE_POSIX_THREADS) || defined(MHD_USE_W32_THREADS)"
region, but MHD_get_timeout64(), which is built unconditionally, calls
it:

daemon.c: In function 'MHD_get_timeout64':
daemon.c:4524:18: error: implicit declaration of function 'connection_get_wait' [-Wimplicit-function-declaration]

Add a patch, submitted upstream, that moves connection_get_wait() out
of the threads-only region.

The faulty code was introduced upstream by commit 73c43a7ef7bd ("Added
workaround for system clock jumps back"), first released in v0.9.75,
which added connection_get_wait() inside the threads-only region and
at the same time called it from MHD_get_timeout().

This issue has been present since commit 8ec001b467e2
("package/libmicrohttpd: bump version to 0.9.75"), which pulled in
that upstream code. It therefore affects 2022.02 and later, and all
maintained branches (2025.02.x, 2025.11.x, 2026.02.x, 2026.05.x and
2026.08.x). However, it only turns into a build failure with GCC >= 14,
as implicit function declarations are errors by default since GCC 14
[1]; with older GCC versions only a warning is emitted.

[1] https://gcc.gnu.org/gcc-14/porting_to.html#implicit-function-declaration

Fixes:
https://autobuild.buildroot.org/results/10f33829552059264104623353a9ec1584b08e4f

Fixes: 8ec001b467e22904c0a7ec5780d83afd44ad78f3 ("package/libmicrohttpd: bump version to 0.9.75")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9bd7330a43156da5d77b8423e46c8843d6af6db1)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ...ithout-thread-support-connection_get_wait.patch | 145 +++++++++++++++++++++
 1 file changed, 145 insertions(+)

diff --git a/package/libmicrohttpd/0001-fix-build-without-thread-support-connection_get_wait.patch b/package/libmicrohttpd/0001-fix-build-without-thread-support-connection_get_wait.patch
new file mode 100644
index 0000000000..d7f93f57f3
--- /dev/null
+++ b/package/libmicrohttpd/0001-fix-build-without-thread-support-connection_get_wait.patch
@@ -0,0 +1,145 @@
+From b9da2097d719dbd125849f2e344d0a7d80b56da6 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Sat, 26 Sep 2026 12:08:52 +0200
+Subject: [PATCH] fix build without thread support: connection_get_wait() must
+ be unconditional
+
+connection_get_wait() was defined inside the
+"#if defined(MHD_USE_POSIX_THREADS) || defined(MHD_USE_W32_THREADS)"
+region, but MHD_get_timeout64(), which is compiled unconditionally,
+calls it.  When MHD is configured with --with-threads=none the
+definition is not compiled and the build fails:
+
+  daemon.c: In function 'MHD_get_timeout64':
+  daemon.c:4524:18: error: implicit declaration of function
+    'connection_get_wait' [-Wimplicit-function-declaration]
+
+Move the function above the threads-only region.  Pure code motion,
+no functional change; the two thread-only call sites in
+thread_main_handle_connection() still follow the definition.
+
+Found while cross-compiling for a Buildroot mips64el/uClibc toolchain
+without thread support (--with-threads=none).
+
+Upstream: https://lists.gnu.org/archive/html/libmicrohttpd/2026-08/msg00002.html
+Assisted-by: Claude:claude-opus-5
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ src/microhttpd/daemon.c | 97 +++++++++++++++++++++--------------------
+ 1 file changed, 49 insertions(+), 48 deletions(-)
+
+diff --git a/src/microhttpd/daemon.c b/src/microhttpd/daemon.c
+index b42d4ee..081d9a6 100644
+--- a/src/microhttpd/daemon.c
++++ b/src/microhttpd/daemon.c
+@@ -1847,6 +1847,55 @@ process_urh (struct MHD_UpgradeResponseHandle *urh)
+ 
+ #endif /* HTTPS_SUPPORT  && UPGRADE_SUPPORT */
+ 
++
++/**
++ * Get maximum wait period for the connection (the amount of time left before
++ * connection time out)
++ * @param c the connection to check
++ * @return the maximum number of millisecond before the connection must be
++ *         processed again.
++ */
++static uint64_t
++connection_get_wait (struct MHD_Connection *c)
++{
++  const uint64_t now = MHD_monotonic_msec_counter ();
++  const uint64_t since_actv = now - c->last_activity;
++  const uint64_t timeout = c->connection_timeout_ms;
++  uint64_t mseconds_left;
++
++  mhd_assert (0 != timeout);
++  /* Keep the next lines in sync with #connection_check_timedout() to avoid
++   * undesired side-effects like busy-waiting. */
++  if (timeout < since_actv)
++  {
++    if (UINT64_MAX / 2 < since_actv)
++    {
++      const uint64_t jump_back = c->last_activity - now;
++      /* Very unlikely that it is more than quarter-million years pause.
++       * More likely that system clock jumps back. */
++      if (5000 >= jump_back)
++      { /* Jump back is less than 5 seconds, try to recover. */
++        return 100; /* Set wait time to 0.1 seconds */
++      }
++      /* Too large jump back */
++    }
++    return 0; /* Connection has timed out */
++  }
++  else if (since_actv == timeout)
++  {
++    /* Exact match for timeout and time from last activity.
++     * Maybe this is just a precise match or this happens because the timer
++     * resolution is too low.
++     * Set wait time to 0.1 seconds to avoid busy-waiting with low
++     * timer resolution as connection is not timed-out yet. */
++    return 100;
++  }
++  mseconds_left = timeout - since_actv;
++
++  return mseconds_left;
++}
++
++
+ #if defined(MHD_USE_POSIX_THREADS) || defined(MHD_USE_W32_THREADS)
+ #ifdef UPGRADE_SUPPORT
+ /**
+@@ -2009,54 +2058,6 @@ thread_main_connection_upgrade (struct MHD_Connection *con)
+ #endif /* UPGRADE_SUPPORT */
+ 
+ 
+-/**
+- * Get maximum wait period for the connection (the amount of time left before
+- * connection time out)
+- * @param c the connection to check
+- * @return the maximum number of millisecond before the connection must be
+- *         processed again.
+- */
+-static uint64_t
+-connection_get_wait (struct MHD_Connection *c)
+-{
+-  const uint64_t now = MHD_monotonic_msec_counter ();
+-  const uint64_t since_actv = now - c->last_activity;
+-  const uint64_t timeout = c->connection_timeout_ms;
+-  uint64_t mseconds_left;
+-
+-  mhd_assert (0 != timeout);
+-  /* Keep the next lines in sync with #connection_check_timedout() to avoid
+-   * undesired side-effects like busy-waiting. */
+-  if (timeout < since_actv)
+-  {
+-    if (UINT64_MAX / 2 < since_actv)
+-    {
+-      const uint64_t jump_back = c->last_activity - now;
+-      /* Very unlikely that it is more than quarter-million years pause.
+-       * More likely that system clock jumps back. */
+-      if (5000 >= jump_back)
+-      { /* Jump back is less than 5 seconds, try to recover. */
+-        return 100; /* Set wait time to 0.1 seconds */
+-      }
+-      /* Too large jump back */
+-    }
+-    return 0; /* Connection has timed out */
+-  }
+-  else if (since_actv == timeout)
+-  {
+-    /* Exact match for timeout and time from last activity.
+-     * Maybe this is just a precise match or this happens because the timer
+-     * resolution is too low.
+-     * Set wait time to 0.1 seconds to avoid busy-waiting with low
+-     * timer resolution as connection is not timed-out yet. */
+-    return 100;
+-  }
+-  mseconds_left = timeout - since_actv;
+-
+-  return mseconds_left;
+-}
+-
+-
+ /**
+  * Complete the resume of a connection that has its own thread.
+  *

--===============3465191500593615490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3465191500593615490==--
