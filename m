Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4DA606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=X9wopLpU
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EE2860B48;
	Fri, 30 Oct 2026 15:28:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gbtLkUGHQe5g; Fri, 30 Oct 2026 15:28:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8C25660B4A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374084;
	b=embfjzB/fj5n5MriRx1z09kCiM5JTP0/892CK0o9DLFYPKADfT1JRLolKGOCTw6RW8c/
	 xjPhDEuGK0vlu4Gv1CAi+wbp3FmnD9rp0b9pMSeFkq+KO+MqgkSxYokPAh+tIMXu8d2s1
	 gDHB0qV6GPJRYgG2d3ZkPyRH0phr7DEf1uKtFLk7OSDlOQbbRyzjoaZYNjDQPxNbRd6bM
	 PxXz0Dj0+VZX995FchMnV9GmDmTHyxTV97AgP7AUQKJig7TI8BvrXIDUV/WMCCprhDpQs
	 iTcKhcTEhS7e0BXGtARc1a/epGzLvMPWAeeOnVZrPR0RvGpHKj2irmzWNW3K7O7LZ0g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374084;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Gy7sJNZelt4y0gOhHlqWCA2GBX5/FOpTmYVDM3JdB8s=;
	b=O/MABdE+NSDzQpfraWQ4DYNxD/fMVT/IHepKEO+vvrVwhCmt6mxBmSCmkDqz86T4j6hi
	 rTTrqGhDM+deRiY7gm4zlPljIbgshjnzOSxlqi2HQgYYxq/QjBbdOAIqH4SEqWToXCj8u
	 LTSo1NOpycDdB54gmXFSPjHoT3Cr4KI5G62g6Rp8cy9CymMvGGn3lwJ4tkeYNn4SdVvZR
	 8Lv1uuGjSJPABZbnUQTctqviCtdM+XfsUIVlOj0suML+eFgcNSUswAtqTF2w/1nkZeo2J
	 Psgkef7AAjNozqXvIpQ8xvSdADcxuj1McxF6FMVWdQQNuTzM8zqcT3H8cDV5lqp29/Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374084;
	bh=Gy7sJNZelt4y0gOhHlqWCA2GBX5/FOpTmYVDM3JdB8s=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=X9wopLpUfx0uHLgZfwZgjMIUy5b2d5EgjmxS1APyLdjO4VLGPKWx+xQs0ZAPo5CSQ
	 Yc6p+SZn/CEvndT+Lm9zJeH/p9VAhBOMTVw2qEpGNF1vP2CJ4uhG3R76gIGqxwSr21
	 rRcwLykeQcT5/UI1YsChAEqGh4zLLVTpW3BWWRLyl9VjWkRNDfRa183gBhVcXDXNYU
	 5mELG69S8d9Gyl+s+/XbAlZep/PUz2L19UrkORexK/6YVlWXzKUTXHOmSboajG5k8g
	 cTaGRAifeIPkxmM9zpdBQPxESMXDwTWMzs4b2kjaFFq5LjY2YMv3sAzOoYJvzsbh/P
	 buixIaWVOFlOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C25660B4A;
	Fri, 30 Oct 2026 15:28:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BCF9CD38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A26F680CEE
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qsrcGiMJTAaD for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:27:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3483D81464
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374065;
 b=FBLbHDv/zSok1VEramQszTTrs+fCsJnMR77NyKGZKDcdfhn9pcOgCIo9/rg8tKiABytu
 pBlxtNNrRnnkhyhdG1G0Z8fSDyTuITzPnYilnLLJ1WwiH+rOiVamU34lucODCiLN4Yj94
 XaL+IfmSfVAZEDJx5s7AWjgs8TVGbuJhQFwhfjAH5GJ3lwoyEioUX6ia97+Skq5yDojgB
 RYSPWWVq6R4ErZ+UtRfoyg+bsz3BqEISbupgOtqJAM0iZSeVgG62zjH7dPE/rz/VFq9Tm
 +N93fpBuImYoxo6VsaXxSyOT933JcLlql8jwuWpFZSgTIvB7jD0fu4YPd+VOYgIWFTg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374065;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=a/H+uJef5R6ylMWyMMiG+8R40xPt/RxXRIUm2/Rbo6E=;
 b=OCMfYOlJkxtvKVwuONL0COupkr46Rcv+s9ZTYadyCktFGbJhkYzRSx2amfRPA8c3/Aub
 Idq92B9q6+1rB0iOLmF3kcMzkJZC6s2fEVRWoiujuhjlvEjHOlzJRU9UWdqQvQLjXSYxo
 locjy/Wu4GsGfTF6U+kZ9EKvbrYAs1Uxxub3w1wH+p3t3ad3eueBM4V0jbdfl1Ppjpesc
 1XVq9g748CgwqxlDlPSynmfJ5LSYHxCvNduHwWoDZTROHHgHB+8n3snJXpfRG7D4t/YAd
 e6F2pE3r7+gQsqGvzMZVUtxqK/ot73jZJ8xQPJLtI3ze22ZvAHEDZed81zhwyY/Ssdg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b="SZ/snhne"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3483D81464
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:44 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4a20bdaf39cso9870925e9.1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:27:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374063; x=1793978863;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=a/H+uJef5R6ylMWyMMiG+8R40xPt/RxXRIUm2/Rbo6E=;
 b=YLiXYdcSx4f5FLJq5lBhzKBCt7kgm5ShVs2S064RnsEHcYo9IkNnTuVd4+8AzUt/Cf
 fyCVh+aw2NorraudiluO/nwfcKx5l+JPLaVAOmRNF91EWc+rauQygYXnNq6AihPq1Rlh
 6sjTwHr6g+wIYXayXYNQQfGoREEG+0a3WQlqa2hAxsH4QMaSHmzrAn6mgo1OLkAVwyTA
 7f8RmrCkiQgd0OME5o2PXfupxKKX13XsmZeVTX8ykB2u6WElVDm92XGUoeTAUId/t6nt
 11lBUqRZ7y2RGFLt6gMeqk//dnYbufhv79UCcMX7EsmoFu9CSNKO/MAAWRll7Yt2iVOZ
 HIuw==
X-Gm-Message-State: AFq9FYJlL1UhxY6nJDLBlNaooQLX9LRqgXITXmSl7lcWspx5Cxe3vrkN
 XX1zhQXQzxOBN6OZMwGms6kac3XtRkx/lrKW1Wpu3bCKv1NNXMTfaaRtCCGIxfj8Ra55Fnj6kd0
 itLre/QA=
X-Gm-Gg: AYBFou3DhnQbKjBOHjWIFgcNydJjzu/Akm9ASsw7NQHwShJxnT72ECE81PAfFrf+frq
 OPg7jLSVjGRMjJcT51JMbnjHaQTqwUtwy9AehmvrWCnD6N4/LoXOOoHdUY+hXDgXzAQYLeJGsia
 6G02OuF7pufiUbAxYtP7fovPn0A7LA3Se7jpVgAdT8kgXdASD+4BFODWSN//cRXzcVQympbDL4X
 4nFZtGmh50x9CeT7SLSl6rloOfAOzdtk/xql87gTk+44YRhygaErr0NdXTHcoU+t7NwKpjrLRxv
 VjzhAhKuANi2Gdpv660GFeoU3BVgsm0Zc21J4olXA5MdWRpoSiaIdJojEcJAHec13SkqfuNi1g7
 DKlB65ByW2XBNCL6EoZERRtwurUOsovPvU25I1R7hkDuz38NuJKps6kWOiyPGZgxnjUuEwljZCO
 YYZWkEBKa/D79BUTKRJfix/ZmuezHWrdeh9MaNI+aMTiJWPF+vJ8UAMzgFEW8wcXtaqt9u6frN7
 /NKp0SjyfxjJkGDTUMLKAcuSJyRpFQRc6bEuPbCgeVSQvB40lcC3iSGxj2E5SDkblfMH+enqD9U
 V/rCHJ0rLNK1cNDUs2rVOP7YIShuV2gen6nWa/PQwMM8kbkZd6pCcpXc02jsb9HaxtIH1cKP
X-Received: by 2002:a05:600c:a00a:b0:4a2:190f:cf6a with SMTP id
 5b1f17b1804b1-4ac19802310mr66602125e9.35.1793374062744; 
 Fri, 30 Oct 2026 08:27:42 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4abf6e63e0esm88588985e9.12.2026.10.30.08.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:27:42 -0700 (PDT)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:27:39 +0100
Message-ID: <20261030152741.1906899-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261021125214.141014-1-yegorslists@googlemail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/libmicrohttpd: fix build without
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> When the toolchain has no thread support, libmicrohttpd is configured
> with --with-threads=none. In that case connection_get_wait() is not
> compiled, because it is defined inside the
> "#if defined(MHD_USE_POSIX_THREADS) || defined(MHD_USE_W32_THREADS)"
> region, but MHD_get_timeout64(), which is built unconditionally, calls
> it:
> 
> daemon.c: In function 'MHD_get_timeout64':
> daemon.c:4524:18: error: implicit declaration of function 'connection_get_wait' [-Wimplicit-function-declaration]
> 
> Add a patch, submitted upstream, that moves connection_get_wait() out
> of the threads-only region.
> 
> The faulty code was introduced upstream by commit 73c43a7ef7bd ("Added
> workaround for system clock jumps back"), first released in v0.9.75,
> which added connection_get_wait() inside the threads-only region and
> at the same time called it from MHD_get_timeout().
> 
> This issue has been present since commit 8ec001b467e2
> ("package/libmicrohttpd: bump version to 0.9.75"), which pulled in
> that upstream code. It therefore affects 2022.02 and later, and all
> maintained branches (2025.02.x, 2025.11.x, 2026.02.x, 2026.05.x and
> 2026.08.x). However, it only turns into a build failure with GCC >= 14,
> as implicit function declarations are errors by default since GCC 14
> [1]; with older GCC versions only a warning is emitted.
> 
> [1] https://gcc.gnu.org/gcc-14/porting_to.html#implicit-function-declaration
> 
> Fixes:
> https://autobuild.buildroot.org/results/10f33829552059264104623353a9ec1584b08e4f
> 
> Fixes: 8ec001b467e22904c0a7ec5780d83afd44ad78f3 ("package/libmicrohttpd: bump version to 0.9.75")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to 2026.08.x. Thanks

> ---
> Changes v1 -> v2:
>   - identify the commit that introduced the issue, add a Fixes: tag
>     and explain that the failure only shows up with GCC >= 14
>     (suggested by Thomas Petazzoni)
> 
>  ...t-thread-support-connection_get_wait.patch | 145 ++++++++++++++++++
>  1 file changed, 145 insertions(+)
>  create mode 100644 package/libmicrohttpd/0001-fix-build-without-thread-support-connection_get_wait.patch
> 
> diff --git a/package/libmicrohttpd/0001-fix-build-without-thread-support-connection_get_wait.patch b/package/libmicrohttpd/0001-fix-build-without-thread-support-connection_get_wait.patch
> new file mode 100644
> index 0000000000..d7f93f57f3
> --- /dev/null
> +++ b/package/libmicrohttpd/0001-fix-build-without-thread-support-connection_get_wait.patch
> @@ -0,0 +1,145 @@
> +From b9da2097d719dbd125849f2e344d0a7d80b56da6 Mon Sep 17 00:00:00 2001
> +From: Yegor Yefremov <yegorslists@googlemail.com>
> +Date: Sat, 26 Sep 2026 12:08:52 +0200
> +Subject: [PATCH] fix build without thread support: connection_get_wait() must
> + be unconditional
> +
> +connection_get_wait() was defined inside the
> +"#if defined(MHD_USE_POSIX_THREADS) || defined(MHD_USE_W32_THREADS)"
> +region, but MHD_get_timeout64(), which is compiled unconditionally,
> +calls it.  When MHD is configured with --with-threads=none the
> +definition is not compiled and the build fails:
> +
> +  daemon.c: In function 'MHD_get_timeout64':
> +  daemon.c:4524:18: error: implicit declaration of function
> +    'connection_get_wait' [-Wimplicit-function-declaration]
> +
> +Move the function above the threads-only region.  Pure code motion,
> +no functional change; the two thread-only call sites in
> +thread_main_handle_connection() still follow the definition.
> +
> +Found while cross-compiling for a Buildroot mips64el/uClibc toolchain
> +without thread support (--with-threads=none).
> +
> +Upstream: https://lists.gnu.org/archive/html/libmicrohttpd/2026-08/msg00002.html
> +Assisted-by: Claude:claude-opus-5
> +Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> +---
> + src/microhttpd/daemon.c | 97 +++++++++++++++++++++--------------------
> + 1 file changed, 49 insertions(+), 48 deletions(-)
> +
> +diff --git a/src/microhttpd/daemon.c b/src/microhttpd/daemon.c
> +index b42d4ee..081d9a6 100644
> +--- a/src/microhttpd/daemon.c
> ++++ b/src/microhttpd/daemon.c
> +@@ -1847,6 +1847,55 @@ process_urh (struct MHD_UpgradeResponseHandle *urh)
> + 
> + #endif /* HTTPS_SUPPORT  && UPGRADE_SUPPORT */
> + 
> ++
> ++/**
> ++ * Get maximum wait period for the connection (the amount of time left before
> ++ * connection time out)
> ++ * @param c the connection to check
> ++ * @return the maximum number of millisecond before the connection must be
> ++ *         processed again.
> ++ */
> ++static uint64_t
> ++connection_get_wait (struct MHD_Connection *c)
> ++{
> ++  const uint64_t now = MHD_monotonic_msec_counter ();
> ++  const uint64_t since_actv = now - c->last_activity;
> ++  const uint64_t timeout = c->connection_timeout_ms;
> ++  uint64_t mseconds_left;
> ++
> ++  mhd_assert (0 != timeout);
> ++  /* Keep the next lines in sync with #connection_check_timedout() to avoid
> ++   * undesired side-effects like busy-waiting. */
> ++  if (timeout < since_actv)
> ++  {
> ++    if (UINT64_MAX / 2 < since_actv)
> ++    {
> ++      const uint64_t jump_back = c->last_activity - now;
> ++      /* Very unlikely that it is more than quarter-million years pause.
> ++       * More likely that system clock jumps back. */
> ++      if (5000 >= jump_back)
> ++      { /* Jump back is less than 5 seconds, try to recover. */
> ++        return 100; /* Set wait time to 0.1 seconds */
> ++      }
> ++      /* Too large jump back */
> ++    }
> ++    return 0; /* Connection has timed out */
> ++  }
> ++  else if (since_actv == timeout)
> ++  {
> ++    /* Exact match for timeout and time from last activity.
> ++     * Maybe this is just a precise match or this happens because the timer
> ++     * resolution is too low.
> ++     * Set wait time to 0.1 seconds to avoid busy-waiting with low
> ++     * timer resolution as connection is not timed-out yet. */
> ++    return 100;
> ++  }
> ++  mseconds_left = timeout - since_actv;
> ++
> ++  return mseconds_left;
> ++}
> ++
> ++
> + #if defined(MHD_USE_POSIX_THREADS) || defined(MHD_USE_W32_THREADS)
> + #ifdef UPGRADE_SUPPORT
> + /**
> +@@ -2009,54 +2058,6 @@ thread_main_connection_upgrade (struct MHD_Connection *con)
> + #endif /* UPGRADE_SUPPORT */
> + 
> + 
> +-/**
> +- * Get maximum wait period for the connection (the amount of time left before
> +- * connection time out)
> +- * @param c the connection to check
> +- * @return the maximum number of millisecond before the connection must be
> +- *         processed again.
> +- */
> +-static uint64_t
> +-connection_get_wait (struct MHD_Connection *c)
> +-{
> +-  const uint64_t now = MHD_monotonic_msec_counter ();
> +-  const uint64_t since_actv = now - c->last_activity;
> +-  const uint64_t timeout = c->connection_timeout_ms;
> +-  uint64_t mseconds_left;
> +-
> +-  mhd_assert (0 != timeout);
> +-  /* Keep the next lines in sync with #connection_check_timedout() to avoid
> +-   * undesired side-effects like busy-waiting. */
> +-  if (timeout < since_actv)
> +-  {
> +-    if (UINT64_MAX / 2 < since_actv)
> +-    {
> +-      const uint64_t jump_back = c->last_activity - now;
> +-      /* Very unlikely that it is more than quarter-million years pause.
> +-       * More likely that system clock jumps back. */
> +-      if (5000 >= jump_back)
> +-      { /* Jump back is less than 5 seconds, try to recover. */
> +-        return 100; /* Set wait time to 0.1 seconds */
> +-      }
> +-      /* Too large jump back */
> +-    }
> +-    return 0; /* Connection has timed out */
> +-  }
> +-  else if (since_actv == timeout)
> +-  {
> +-    /* Exact match for timeout and time from last activity.
> +-     * Maybe this is just a precise match or this happens because the timer
> +-     * resolution is too low.
> +-     * Set wait time to 0.1 seconds to avoid busy-waiting with low
> +-     * timer resolution as connection is not timed-out yet. */
> +-    return 100;
> +-  }
> +-  mseconds_left = timeout - since_actv;
> +-
> +-  return mseconds_left;
> +-}
> +-
> +-
> + /**
> +  * Complete the resume of a connection that has its own thread.
> +  *
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
