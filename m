Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5560B606A319
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 19:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lKxY9ixi
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F374611BE;
	Wed, 21 Oct 2026 19:27:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YieRH-n1zqtC; Wed, 21 Oct 2026 19:27:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D8A7D61260
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792610873;
	b=eJ4lh7UJ9O4WsazdRs/amTWaUpmjvno1Jm7IMKp0CMjkP8F+2zF2IriT/Ixv6s1jR7b9
	 4dGx+5MPecMsdO4iDJII4iC11/Ld3J0RGPXi8prMeMH8Fi3+NlXbOpq37QnC2r+ATg7/t
	 sYWaRVK/sAKF7pg2K7pk4YYy9Ct20yV7B+cvfenx4PSbaPKV8Z99kl0WqMaQw+jXOLjok
	 Yoa31otLMmWyN9gHN1Y47UUnbjjPUkXfj7quiCnoJKMy8urc0+bUf9D/rGcQ4swtO91ft
	 IfCt010bGxZMdN/w879iUM7zTbN2tiPwJk67AhAqFcZhJku9gAeYiKeI2qJX2gVcZVw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792610873;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=1O8kyMjikpf0tAa8pbi4mlQ6ZyjHRYO2fIJFZiKfGn0=;
	b=FHZ6LWYDHgoU5VgH5Aj+lwSJmLd1uafEsp1rRiX4DtwN4cYoS+01Cmy2TWhwrv68TZog
	 Gxr2sxIUsTYD4GoBYyOryptI9qjk9NeNGLNZSOzqA4b5upH8kC3t0dr2geNBBd2y9B3Nz
	 E4fWAOpnV8KRIwLhaRBQJGPD42s405SOfwXUVykjN0OcQr0QngCg67T7xFrfeqcUqOU1K
	 I8MlIhftjF+zsa/RzW0t2vHzSzM114r///Rx6noudGcdYwpFaeUQqsE5dlx/myNZBza3P
	 m3eWa+hLTYEuT11NAqakev9zOAJVVxWA6LYK+HQirTZvWbdAHtrcAKbv+KhqWDARugQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792610872;
	bh=1O8kyMjikpf0tAa8pbi4mlQ6ZyjHRYO2fIJFZiKfGn0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lKxY9ixidCmwtSW+B+G7ukjVxla8oFUQfJVcxmU8nmKj4wqq6CQb3hR4EqLc8FNzA
	 D03vIdKanzjgpjQ7qnak/e/JVSm47D3bTGG0+PGXbqof3B1nUptV8CwsrlLlFAD+yx
	 Rru/7tk4UBJOAyH1xx51fHJNJqdeYhuYNAYg60K33epYHn9rRI7MUtPEBmvWi4jo1Y
	 0uDwrOmUO6hmH5DoTvQqqXcO+G4bjpz+YZcaK85ihOct7yVbnX2xkLCXjoDqBvrfvk
	 /dfqTizpRrCV5Ma26IPngVOtOUt3QIbOzsFUryTFzF/VADs64yJwLlMPrCn2gNInGe
	 OclLQA2pn6MwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8A7D61260;
	Wed, 21 Oct 2026 19:27:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B1FC13C1
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98215404DE
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:27:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LzUzghJ0eHK9 for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 19:27:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 969634030F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792610870;
 b=MsdtHG5+ptwyM/NElIvDBCu3OPzqeM2OeB+663R5rqlFKKoCLHtmwr82zXM/IPPADuO5
 iOcpPPHg2NJIPn+jHdmDXtNh10RFMe8WZWy77U9yJm+Tw2JkiTioCyY8C9oFpnLxDQuGd
 5LwozsCva9ZxT2So5v+3qYodLC4KIZJC+tR3z8a3vlmh9O+NL0VbEmHyVYS2l52D/XYvv
 k1oKw21b9JGH/8xkTX/TZ7ufNJMB/hVLWPS0x8QcSfDuEhYrOmxLTuv/mIquGYy7cSq9U
 e0wwQWwF+xOlP2bfYtRDCbnx+M7cMOS4t1GgukA7DOQMWKecTHJIqs7kdXSir9RuIQA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792610870;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=t0mqud3yW1SGqcgVAdxp3BQGMJ7GQt2iKsJcCmDAjjc=;
 b=GE/kt0vlDtiP+nzvo7Clm8ohf+p+46SGGYx6py3RcmizeLGSbE1aR7GQGknqlcX8O/gJ
 qL+nygLqdk20JWT3Ff7aW+Yak+AP9JTR71uA0RTkRrzs2m6j9+dD3W8/bfIMLtS3AiZ3+
 uX8IuV0TQs731IUFpbkZQqT+0OmrIeLu0aJuF/iSbXIIf5ZYcj5nDaKQl5KZfR3rdaNFb
 ZbldM9xXVBA0uYQTQyadi6M78GDwjWzuU1U3Jg26Ut7vUF/uCHI5hUHMgMYu65JmpnVuW
 mvF7kHg7eY3Sfd5KTJKNEJSYetCniE2Dan0puAstuyj0i3uefcK0tJPblJcfCTbhI1w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 969634030F
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:27:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DFE6A99ACE; Wed, 21 Oct 2026 19:26:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 21:25:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d2d3833f1d4d4bba742bafee3197fc456d41ec42
X-Git-Newrev: 9bd7330a43156da5d77b8423e46c8843d6af6db1
X-Patchwork-Hint: ignore
Message-Id: <20261021192626.DFE6A99ACE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmicrohttpd: fix build without
 thread support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9bd7330a43156da5d77b8423e46c8843d6af6db1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
