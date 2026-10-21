Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94290606A319
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 12:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LfTtQ0eS
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DE1060809;
	Wed, 21 Oct 2026 12:52:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 87ywXouSEgKG; Wed, 21 Oct 2026 12:52:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 38F8760831
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792587144;
	b=fRKY5iDKuz/xf1VO3k16KQo2/KEMSOxSi9g0aojRGMS+d2ZmwCkaWZS3nFl+dFc50Mf8
	 pt1BA6HOFYD/YbAQl/4WLdh6h15lVxv9eGBu4Hgi2K0psaGJAd1voa8rj1HWjROwpHCIr
	 fTk1yfwn70FpGujtINiShg6Uw0B4fP1njhu59z+7gWB/DobwValB5YNmHdNF0fL963kpw
	 qsKL5TM5/seM3qY0lhw7ko4z2sQUeYovwesFDlVyi+U+4K5zxMdJBK73FK101XOTo/F7+
	 q2zSJ3Ek1u4m0jRGWQrswkAfQxv5nuSiIWI3WTNOubdL1BT3b4J+Co+Sd4P6nAuxHAQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792587144;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=IUhoek9Y1pK3TlCZrZTJzdnxrQRIcAoukHCmyT8bfak=;
	b=OQg+ockvBe+5/6sjbl3dTSL8bpeeEZ+oNGOCJly5O75FqpBIPcYAW4PYWj2LWVj3006Y
	 tMJ9we8ZE9SQ9AQbRu18r/dMvyDv3wOl/HM9VYuh6ZzNJlo1Aa9GdoxQu8c1i4sG0P8/S
	 Ko/AeYvwU6kA3jYsXJnD2Aqm2qIrWaFz1t/l2ss8q7yKu/WJfUydEW5R2L8L3z+9k9+A3
	 EMIVNRNvbN8H8th6qg6ymMsFXjRBV5W6aR8xhw0k219D1GtGA/Dk47ss5+wCmK2UPBigl
	 hOQcUoynbI8YLnczQ9igMWmR/wgIwUiEWalR5bFZwBkzUSqNT9H0LQEZx1TBU+R91mQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792587144;
	bh=IUhoek9Y1pK3TlCZrZTJzdnxrQRIcAoukHCmyT8bfak=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=LfTtQ0eSzjb9xD8BTgJgR++yTxm5n1boIGhp4hetvKbc5lsFt5Gv0U9nNBzs54Ccp
	 gw4qVVmKY+1oioorSvEkzQ4SxysUR3mQLn90viQi19XbvkyQPrljVPvhURosa48W/L
	 1v2vJ7j5P+PyAGZ6TtDK4VveE6YavxCoJiBXvNQjUt1E0+OOoCtiu1ijtd8iNygBYg
	 l4XWObNs2Z/NrtRivuViWa/k8tZys1IYn1jSg/oVuOiSvzPGpu0CDKj7/CsrTkmm3B
	 3RjERUEt3xcrBY/pKAjMsTRbNux2AgkPYJV/ugO24vq2hRqngBzK88aiZwmss4pOzq
	 bnnseyEI+kXgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38F8760831;
	Wed, 21 Oct 2026 12:52:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C046C23A
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 12:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1672810DD
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 12:52:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oKoXQkIArnRt for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 12:52:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 41177810C5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792587141;
 b=g8B5eB0vxw2O4vXL3bUv5bX3JitEPo0zxPmR/YL19kqqAlCaPwdLjJcS+rQ28Wjb34sH
 k9K9iIGinoWhZcL61o5RPaZ7WL9EkfNTk0FdYZ7xATbjcoRrK9dSNgEbCNvl3wCPu4viJ
 gLRQr3H5eKJaO4FqHAvCf+/+ZAULYyuJneE36yIriLq0GZI83nbSIV4s1l5SJLH2pSvGt
 tVaUkWvyuuENfTx9HZ6++tplbncJS/qvw8qaIh7qt7ElByDrMT2H+FnhqBzvleIS5DF+N
 gM6x548+rww5emk1VjzhyUU9U/JQG6bKUJbxfEXMW8cYSwgb3lPKBm74QS1HLng05ug==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792587141;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=kFcGgk4nPOWZMhsxhOZMp87lFtJJpCBIPmF0MuxStlg=;
 b=JcXwAwZrIWhc58pLSny6WH74XdnDNTCbvBO34MvMgrTyznA2h5n4lM+j8eUBwsnHLd4F
 C5TZ0nt7JpIZc359pZFcTlcVIEoDgNiud6aZSpgMBU2vUsYeR/bP+nVzcB66JItbSfq9+
 nLpAmQcMcvttkcXwjhmVfUzKUg9qVf6l9im1MYoyV8nAAGFa3NVCNTrvH6ylWezXX7ffi
 t7kL7JVXNJftPIM965Nto9t1TanAUmaoZGLpp2IthVlWXVKk6Rd6tHzasPQSeQlA+cn/D
 EWY4v3XC+mZJrIKMyD4KyfhYdF2v5SISSnbjV8rG4Wnh3OCniQBOmJxIuD41oUKCy9Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=D2lFoCjY; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::62b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 41177810C5
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 12:52:20 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-c46822eefb6so61954766b.2
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 05:52:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792587139; x=1793191939;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=kFcGgk4nPOWZMhsxhOZMp87lFtJJpCBIPmF0MuxStlg=;
 b=o/oVVrqpX7HZ2XPszZmtCHiW7eSeu28JXs+eeiQCNywiMCj8jmYKXcofSeJ53ULCz/
 q1nKNW6cGI09PClAtf46HYcB4MLhtwL1h856WmzC1e6iyyt+oEbKgeyWOF8qyoAsNn8B
 8OKxRXkAAcRFks7ESVw18rqlBI1vFUtvVSBWNJpSVl4voaeX3ElqmRkLP+MWq4e5iZ45
 78aK4/sfeT5mdSZEZEeFqtlOjRKx6uF1yMX7wqDUS3O5HdZS82pBHk8I+FliHmP6TRDO
 by9eBzlIook8ZvQL9fa8lHEjEaWG2x43iL+QAL2eoCGYb7xUFJJKLFLZea0Lkprh0SHM
 IkIQ==
X-Gm-Message-State: AFq9FYK9782u4ors1zMdNyh6FgxHAQlopqh8H/wOUCkA84Fj3hKEF65S
 SLqEztGCnrz/NLlcWMf150lrCg9s4U0QX5G8oAzgJz+1MRllfYCJIVPBvBDvEQ==
X-Gm-Gg: AYBFou24E5KskkHnaTE+lTLOLLsjgFv47VIlm/VU4Ra7r7bWOkG25c+GAa6vzWeezND
 BIPsddRA260Wxx+tGlE4kCkiDBTKWFcW5c1cL3dAmnmzqSNvfvyS0ZoWiBhmHu3qJmkrJCnM9QS
 syXtFLr3d2pWSgLb/WDDsqDQ1qXfbZ4gSCjQ0Uq69klVidX1MKvZ1UuVooRSgmFpIx41TAOClUT
 KYL01ZCe8MQn3gfkGjT/lJNsY/kN3EOougq7aypU8k9RNj/iMd9USQo1iQaj1UV8WcLdLG3R4bZ
 u6ozkIYZbIH8IUSmcIXp35UuTGzBdrmxvB7hHzWlla/twBhmtIVu0hK41kbkuc5JaCmlPF9B7YC
 bR1YqWN4pldTvvHPdLKH4Qurhy9+I3riP2sIJx3yWGZa2RnVobQgy3Pvr/6xQzIPoS1Jlt66YXk
 NoLJR+fwtKnFvWgpa6c0GiGnauAm0KF4832nj1m9tT8zayIZ72v3DpcPDxd1RGxY4x5tiRulOg3
 bpuAG7E0bYTJ3D1DpUJutr4tQMQ+NR8AJrt6O8UM3Sn3ufJVqiZO7rNUTqDLixphCGAcgkze1Fx
 3mf/S3pbYF6FMZUtF8HvnLkhcbWxs1fLKrb62Thjo5u0mR3bF3TdypwI
X-Received: by 2002:a17:907:6d21:b0:c43:ae92:9b3 with SMTP id
 a640c23a62f3a-c4679a46d2fmr188804766b.38.1792587138713; 
 Wed, 21 Oct 2026 05:52:18 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4678fa929dsm74191066b.41.2026.10.21.05.52.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 05:52:16 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 14:52:14 +0200
Message-Id: <20261021125214.141014-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260926133654.2836794-1-yegorslists@googlemail.com>
References: <20260926133654.2836794-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/libmicrohttpd: fix build without
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Bernd Kuhls <bernd@kuhls.net>, Will Newton <will.newton@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
---
Changes v1 -> v2:
  - identify the commit that introduced the issue, add a Fixes: tag
    and explain that the failure only shows up with GCC >= 14
    (suggested by Thomas Petazzoni)

 ...t-thread-support-connection_get_wait.patch | 145 ++++++++++++++++++
 1 file changed, 145 insertions(+)
 create mode 100644 package/libmicrohttpd/0001-fix-build-without-thread-support-connection_get_wait.patch

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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
