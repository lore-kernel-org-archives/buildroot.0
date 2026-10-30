Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0F9606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=STrwj71g
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59DD040DB4;
	Fri, 30 Oct 2026 15:29:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WJxJFR9-a4dn; Fri, 30 Oct 2026 15:29:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 22D3B40DAF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374160;
	b=D2UBQZ5gbkox1+G0CoeMWFKzmL8HWOIhKyXQjwvvRj34L94BB8BPEyJ4FMZeYvPG/aBJ
	 dwtjwx7VBJvEmYzzx0lqBf85YFZgfXfe4Y5iceS1Zn37IGeXLSHMxyCaunQOOZCT7oQuw
	 k6yHLXzNUMe8vD5sgvuEFgKbSPAtMlbel8rrCa+HeXFBQQ4/ojwREMzZFPGgWORtxdI7h
	 16LLwZi4wdLLeKKbUs4m+EQNvXd+GIccUKi1q6Jmwj9YCbqA4rrw89cbzC+qZt9a62P7p
	 jZFpM0xcgQInAnW+o2HbZW/NZs60utRwQGl8jdPLPu+1pPdvV3YiNUroGqSvE6Mhnpg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374160;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=4i2VbJbme1sYaPKswduSVhVMKVhEaxcZSI4ea0UsyVE=;
	b=pTxMcKNiAO8+YLkgefHtMF4DCDCsYtKaLki7iXPOYQzxHKbhpw6DDmXq37ITN4MzaSRI
	 cgU6KkDXaQYKXgmdVM56M2eEUoi1Bp/THRE8etBQn2dY4NIcGyPMg7R4xgO9QwuXyzMXG
	 UbgIqiJjlGEV/RLcaSAkvKe6ausXT09fda9yguzK/qWgTjqIufxnNOr0Ist4zK5qgHKp3
	 qwUtACIrOU47vYnuf8I/tQA3DnB2TppSSLzORCOsfAeePgMK0wvaJpZgYbmW7FXSBtj+/
	 LZTF3VVBDcQz7mX1KNk6crCJv3aoj6fdXhuIhE3uwMAc8IadrJcq2eK/be6JgZsDxcg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374160;
	bh=4i2VbJbme1sYaPKswduSVhVMKVhEaxcZSI4ea0UsyVE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=STrwj71gZP7Xi/S/vV1lSc7w/JRpwNtK0yUA2+tu4LTfgWv3Q5m0IuEKYDyWfRk1T
	 BCXr4oTqOBrncKPZqyqvJn8CmFM+whIlxuNM5XO81gFLZwltfrKqrMK2bgnRvCzQUx
	 vK5LN82LNc6GWDlE6Pxiw5Sc66RFlHOP5ksYVEWyoJ0XlD9P16sKgmIcGJt1MlyWNf
	 yk4UvU5/qvuiMC0v26cFzYlf1SMG6CnxpBmkXyxlpuYFgAKRlq6nuswPgN4czP6osv
	 zlGaPRXV6nkZC51Bv4ddTlijM96x7oA9bQJh6wcYk5f/9CzCWeZ/TeMybBHBdD3LLK
	 3I6CCEAhcdpMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22D3B40DAF;
	Fri, 30 Oct 2026 15:29:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 69DC7235
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FD6140530
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YYQnfpAn9HFj for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:28:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 70FC340211
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374107;
 b=DGs2NqnXVOdYNt/EhumggMKqVQXT5zMfvEufNBrtcYTK02QjW3weKjJ5P9O5hc9UtJ2C
 vmm20Uzm881+DVk5HghAdCobD+waHwUrfuaGiufITnsYZNbVkP50qwQhLOhmt+cEtpRva
 EUxvkCvhARZrDNva2MwQg/jgJ0CIwuIcC1htGRyJL83VOPr+3Phjvvi7pp7N/kA4ojK6k
 zRaTVvSH0gTUefl0g5u+1A+IYbxxpRXhvDfLQUoTnwwMT5GOxOddVv/ZvpCs7up/kLyxv
 /W9HF2SW0RrHVrjmfWknYGqBv3y5vJNJOpB0jn5tsNpCSBjoZDMOpSnltpZ+W49d8Jw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374107;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=YDDnTWrErP8gW604P7HriuN5UHEstXdWNSClGl40mK8=;
 b=rj8iFRNNwd+ofjJC1ZfOuLLhtIcWLglumkmx629pbqjCNaJbiRN1GJAsp+AryUoToq3k
 Z4RyjvUG3WYlXobxT/IZPHJd7q/11NWhwXOvyQhFdwKIF33pd/rcLnLy4fywsLC1EUWRJ
 78a/nThn+igpU2ckXu/8fuz8KVpvbh3CLfFMgMdpXaTV4yjoh2hu7AAnYkjIObBTRgspk
 3tKdp9bnuUfiphP9eWOYP7+6XMM7QbM+BOJhuBon23ZlQAhdXdfuaeowa3J2GC5LCgqJS
 VDWR0H2sypCGoXXX0pq4qPchNiF66gImMux3zALAGeLYuG5qZt5PvohiDp8fdm2scZg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=P+gBD9Pv; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::431"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 70FC340211
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:27 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-48df0fa43c5so504740f8f.0
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:28:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374105; x=1793978905;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=YDDnTWrErP8gW604P7HriuN5UHEstXdWNSClGl40mK8=;
 b=tFb+AElWYIVCWFW9yJ48FrxESBP33mV0vRp8c+o6+zIf0P18SkW9oA2w2y+e7ysnXS
 g2SGPfKKJvTUn/GxoUkfi7S8TH86cfJYU4lJzZS/VRPlhYLO0sIwXxBvZa0J0GRnfu+0
 aKypfJo5GRqejGVCj1ACRP+a00OudIpQ2dYfJTGqAjdPH9Pgwnt3V3kGHqm7HjYzOYs0
 Spfe+4nZCu8c3FjegOB5jmlQpadqGsY0/BXPJlLi9nR0hLxNX/8isZztueV3Sa8ChS4S
 VE4D9cSZxG39HRmcPMZKANr3ygOsqe5dnPtMVgjeE436VBoq1zFzYol8CVerVI+biRhf
 3ZZw==
X-Gm-Message-State: AFq9FYKAgbqZKtawuWpQdI9v2JwekUtCHDUacKy6AsJOKxc+NmvAOGLs
 KtCl4SfK0xd+gYiBGu8BH0QkN6SUycnFIfZLyrrPrp7OGEvaPfIGnR+ayZ9eNZgbdBxsnN9vQhv
 ieIzKlrc=
X-Gm-Gg: AYBFou1zoUel6DpD4KxqqW7+VkfHkyiYWdpJ2dBPCPTYvF5cvMgRsXhqpge0eKQXqn+
 BQMJgzz9bkXyvxOe0z6Zb8VzHLiG07QPPtnaxZEF8S22a2ocwIo44zLafi5pNKlshTxLOgEO0B9
 zgGDK71QV9KdDrDrF6To3wlGce8DPt+FYMqHiztdSTc1ZHbFbQqvZY2Q4qlDSonozLeke+zuxND
 Zk/3e5f8TdBYmFdnfcKqsqULsk5xiwshcTbJmmfbMqoKko+QTp8LxGJheXTYBy2PyHxXR7csXvS
 vLrAz+g0Ip2LCYeyRc7STl8c2cNQaEkVcc6I+kyQWWvwpiFAROWXR34UUVpqDI/xrF5YjzGE9Eu
 rU8W2Jn7Z8ryYq6PySIo5L5YLun4I4SsmLzY7keE3a4praTtn5rSMwmRKgwNfx15ORP453WEuGh
 hVKRI1HoV6kxqE+i5DnGbs9+hfMbn8q32VrsuScdNgmMhP10KR4moQb9Zr9MyB/C0Wpw48uQSdD
 EprBjmS1G/Wjn+zWsVrQB/3exgaczRls/PM8HUiaj6Wf/RDwt+cUYQE9VZu1vzCJqpVjzo9TzHM
 QfXTb/hzrf/FXDjvjs/fbNohRJYly3K0vYimBK77RaExfhf6fTbtfvpx8lw0iSEZCW8ab9GC
X-Received: by 2002:a05:6000:144e:b0:48e:850:c0b7 with SMTP id
 ffacd0b85a97d-48e6e27ec17mr6109222f8f.1.1793374105133; 
 Fri, 30 Oct 2026 08:28:25 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b964desm3767077f8f.46.2026.10.30.08.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:28:24 -0700 (PDT)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:28:22 +0100
Message-ID: <20261030152824.1907307-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261022205926.3431624-1-yegorslists@googlemail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/iozone: fix build without ASYNC_IO
 with GCC >= 15
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> With uClibc, iozone is built with the linux-noaio target, where the
> async_*() stubs are declared and defined without parameter lists. GCC 15
> defaults to C23, where an empty parameter list means the function takes
> no arguments, so the build fails:
> 
>   iozone.c:8150:32: error: too many arguments to function 'async_write_no_copy'; expected 0, have 7
>   iozone.c:9126:31: error: too many arguments to function 'async_read_no_copy'; expected 0, have 8
>   iozone.c:20165:1: error: conflicting types for 'async_init'; have 'void(void)'
> 
> Add a patch, sent upstream, that gives the stubs full prototypes
> matching their ASYNC_IO counterparts. iozone 3.510, the latest release,
> still has the same stubs, so a version bump wouldn't help.
> 
> This issue has been present since commit 75891397abe6 ("package/gcc:
> add support for GCC 15.x"), as GCC 15 is the first version defaulting
> to C23. It therefore affects 2025.08 and later, i.e. 2025.11.x,
> 2026.02.x, 2026.05.x and 2026.08.x when GCC 15 is used. 2025.02.x is
> not affected as it doesn't support GCC 15.
> 
> Fixes:
> https://autobuild.buildroot.org/results/4090fb0d0a3b8bee60707b1672c35dada744bff5
> 
> Fixes: 75891397abe60dbe3d82a1ec39654ff81d1b1406 ("package/gcc: add support for GCC 15.x")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to 2026.08.x. Thanks

> ---
>  ...x-build-without-ASYNC_IO-with-GCC-15.patch | 96 +++++++++++++++++++
>  1 file changed, 96 insertions(+)
>  create mode 100644 package/iozone/0004-Fix-build-without-ASYNC_IO-with-GCC-15.patch
> 
> diff --git a/package/iozone/0004-Fix-build-without-ASYNC_IO-with-GCC-15.patch b/package/iozone/0004-Fix-build-without-ASYNC_IO-with-GCC-15.patch
> new file mode 100644
> index 0000000000..b049ce60ed
> --- /dev/null
> +++ b/package/iozone/0004-Fix-build-without-ASYNC_IO-with-GCC-15.patch
> @@ -0,0 +1,96 @@
> +From 0cc510655874362bc95c608021ef7921ae389559 Mon Sep 17 00:00:00 2001
> +From: Yegor Yefremov <yegorslists@googlemail.com>
> +Date: Thu, 22 Oct 2026 22:16:32 +0200
> +Subject: [PATCH] Fix build without ASYNC_IO with GCC >= 15
> +
> +Without ASYNC_IO (e.g. the linux-noaio target), the async_*() stubs
> +are declared and defined without parameter lists. GCC 15 defaults to
> +C23, where an empty parameter list means the function takes no
> +arguments, so the build fails:
> +
> +iozone.c:8150:32: error: too many arguments to function 'async_write_no_copy'; expected 0, have 7
> +iozone.c:9126:31: error: too many arguments to function 'async_read_no_copy'; expected 0, have 8
> +iozone.c:20165:1: error: conflicting types for 'async_init'; have 'void(void)'
> +
> +Give the stubs full prototypes matching their ASYNC_IO counterparts,
> +with the long long * cache pointer used without ASYNC_IO.
> +
> +Upstream: sent to capps@iozone.org
> +Assisted-by: Claude:claude-opus-5-5
> +Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> +---
> + src/current/iozone.c | 26 +++++++++++++++-----------
> + 1 file changed, 15 insertions(+), 11 deletions(-)
> +
> +diff --git a/src/current/iozone.c b/src/current/iozone.c
> +index 8de26cf..5542714 100755
> +--- a/src/current/iozone.c
> ++++ b/src/current/iozone.c
> +@@ -1332,11 +1332,11 @@ size_t async_write_no_copy(struct cache *,long long ,char *,long long,long long,
> + #else
> + long long *gc=0;
> + void async_init(long long **,int,int);
> +-int async_read();
> +-int async_read_no_copy();
> +-size_t async_write();
> +-size_t async_write_no_copy();
> +-void async_release();
> ++int async_read(long long *, long long , char *, off64_t, long long, long long, off64_t, long long);
> ++int async_read_no_copy(long long *, long long, char **, off64_t, long long, long long, off64_t, long long);
> ++size_t async_write(long long *,long long, char *, long long, off64_t, long long);
> ++size_t async_write_no_copy(long long *,long long ,char *,long long,long long,long long,char *);
> ++void async_release(long long *);
> + #endif
> + void do_float(int, double, int, int);
> + int create_xls(char *);
> +@@ -20144,37 +20144,41 @@ long long length;
> + 
> + #ifndef ASYNC_IO
> + int
> +-async_read()
> ++async_read(long long *gc, long long fd, char *ubuffer, off64_t offset,
> ++	long long size, long long stride, off64_t max, long long depth)
> + {
> + 	printf("Your system does not support async I/O\n");
> + 	exit(169);
> + }
> + size_t
> +-async_write_no_copy()
> ++async_write_no_copy(long long *gc, long long fd, char *buffer, long long size,
> ++	long long stride, long long depth, char *free_addr)
> + {
> + 	printf("Your system does not support async I/O\n");
> + 	exit(170);
> + }
> + size_t
> +-async_write()
> ++async_write(long long *gc, long long fd, char *buffer, long long size,
> ++	off64_t offset, long long depth)
> + {
> + 	printf("Your system does not support async I/O\n");
> + 	exit(171);
> + }
> + void
> +-async_init()
> ++async_init(long long **gc, int fd, int flag)
> + {
> + 	printf("Your system does not support async I/O\n");
> + 	exit(172);
> + }
> + int
> +-async_read_no_copy()
> ++async_read_no_copy(long long *gc, long long fd, char **ubuffer, off64_t offset,
> ++	long long size, long long stride, off64_t max, long long depth)
> + {
> + 	printf("Your system does not support async I/O\n");
> + 	exit(172);
> + }
> + void
> +-async_release()
> ++async_release(long long *gc)
> + {
> + 	printf("Your system does not support async I/O\n");
> + 	exit(173);
> +-- 
> +2.34.1
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
