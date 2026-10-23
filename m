Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBEE606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 13:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AuDawJax
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 379196070F;
	Fri, 23 Oct 2026 13:21:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SNYZNupfXvud; Fri, 23 Oct 2026 13:21:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4949A6071F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792761709;
	b=SN3+z+o2LFKT7B+1UziX6bWxhlPZ3pT+5v7nBy3eQ/kEgPoKE5jVsZ0ytDxWgGifOB6+
	 EedakhD2TcndR9wbWevwrYTKcnoX7edtDdif4tKqFFdIo9O9X9nXg7JZVc6pJi2UjZrEg
	 9a2XhLXp3CJRCJm5ZdIBtI3goo/xkkCdIL+qktz/FT5LtUI+6qzVrTlcZX7bHxrqPJG3e
	 t0VoXmUfZQjVthHP9zfwJZDf3nwL4gXpVySnQViYcJcYyCgx0YB0KEm3r2rnyps00e2YS
	 x6hQMJ0v3x+JZHNtAcSZOU6YpXt07go2OvdxuPSkbEiYr2a6+iBWDbL60EboJjpsN6w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792761709;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Wd/B2wttLsyh9PlYfkzuAa7hLh9VVcqpbgZzDHaBq3E=;
	b=P83iwJRTh5lFzNMFBv1tNw9H8e8YUFky64cFsGJMAc8nxS0bL2EpRmClbxGhzYSSvbvf
	 ED6VfODPwFg+2s8buJ3CaTxO1DMgyhN0NTpG0TZb4kOZM2jt3FnzzSgpCg9S7vPe4P726
	 RJna7P/kiemIHJZFaXLRDZbJwoAW2smWgNXlNrBWs5ITb4xdGwxXyvwHsWysfL11oaa0h
	 aOn6BmGzAenWtDBNABq/X9gom0FFZJVbgCB37G/iELSpBOznL4lcWFySESrOfKK3bDDDQ
	 neUh36w3Rit5tna26OtSSvzfGfdfUEp206InDMjHxVV9X1kE9peYaY7wnjkJd44bADQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792761709;
	bh=Wd/B2wttLsyh9PlYfkzuAa7hLh9VVcqpbgZzDHaBq3E=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AuDawJaxaaFsimuTun/dyonxVQ3Nc1YhOwGPEdMVdIVsgo3FT6MDrrP9k0DgNRlB0
	 wA4btRfQ9VZKWHxb803arv5abqbubXE6gSNnQ9XecRPW2HL/HWmu34O4cvATNw4kUc
	 BdYv8hgCFiRZiuvXm3MBdBszdrJeKsb7ZlaCvb51ZYhq4Z07q03Qus0nsMCWdHfBAB
	 V+k3gpaPlu/BwCsQg+DksCKM9MpflDYh5ehsRA+daH+xzD6h1RYO9Th0eZOq89lPeO
	 dOtuSg1epv2pgcU/i6mWJv/j1iW+/neomw3hlaVwEzhpRVAcZHE95th2qgdvf9ARDu
	 /dPEjWH0v1Klw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4949A6071F;
	Fri, 23 Oct 2026 13:21:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F75D356
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 652CB6070F
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:21:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hKuOklVDUv3c for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 13:21:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 014EC608E2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792761705;
 b=PeUsy8PQWbOi9uS9hgY0L2bB6DFdoPWbV2Th56b0y+53ro63blXQJjr8nbkpI3KuSLOx
 d4JAWVNIZ2Hu4UBAw/WtBf4dnch4dEvXpW2Ik2IJVbdY1y3U+zobneLlyNflDb8Fa9cDc
 cFSKuVdJ2XszLs84FhLTYCO2ldHIxGcXjtKCfyecTVAyn2XeM0J8at3STaODAofgFwdTL
 64kiypGUhlsg1bt9yFfA2SgsHe3l1RTp1YZdF6BJuffF2S0SnDnmiJjNinUrq96PfA+V7
 6m0ZLQzdwI7JAxNvfcw1xJSXFgsgH89BbQ9mUhAho0DvQfO5iNFlqv+I8WAkjXBIyDA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792761705;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=ng3izMfsKmur2g/BbwM0V5/aA4T+GrkwjGW/tITVSY0=;
 b=P0hWmGpBVzChWWQykJTHGVJrFJ2q5zVdBslDzgJ+ApKGa7DXuDLmVfsES+CCz5XCEtnS
 XnIUTNwXslVZDLqIgr4sp6HOU233C5RFcbxZb9Qcn7P5G8zubN04womdXn7WV0eT0Io5w
 JQta9Etfh3yLqFC8j/D5QpyMG7g7onTNZhIw0M9/prwwuOBdcKBKkweF1GBY2G0DpkM9H
 ylBim0P5buwOKRaHhTZQtkkRBjYgHqFEIXhAHlCfV3qoiS5Z0ggZeD+02LaLDFsMXNCFC
 lBws/lR3Vmj/zQSrkm6djRNJC9ptXEbydbMpPgpr3sTpLtI8tS68bAkLVXZha3mUjuw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=bm1CDsUi; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::52e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 014EC608E2
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:21:44 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6b1d8944cb0so1251904a12.3
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 06:21:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792761703; x=1793366503;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ng3izMfsKmur2g/BbwM0V5/aA4T+GrkwjGW/tITVSY0=;
 b=RkD75n+IF7ZHJGtDiG/dI4z0Dh8615E+Q2Da08qe39rLqoazq/vonMQdhePGg3eWFL
 GcwJ5byRNFkw6oKihMUGTDHGby0ybtjZTa444zWQYw/YQciY90vD9KSAapEi0tc5rlr4
 RUlvwtqlQ8EoqSsDWyVLg7H3IFS3zU6vUgR2KJXGlttYPEwcJkZGTOL+24zo5X66uIRH
 J3vB1U+lDy0LKFSMB+J3zezgZz47DtfxdDZ5IfJOOI/gOtUxbYs9gJjVRpdhFubqgstl
 Vm17XQXl35Zt0dcCO4zpT94gcyxXCfRymUlSc3AccJd2u8ctJicf0kJZVtuTIRsGQxFs
 nOcA==
X-Gm-Message-State: AFq9FYIaD7HqqbKcFqnufqhTmF7udsAVpHRC6slzCu8rYk++X8bI1Eoq
 BSXaSnat52vpwzPRMROz2CMI4TGta0KChTSq2R0L78CAMUgn9G9VtInCJ4kNo9OOfFP9KL8iw1A
 O0zp/qc8=
X-Gm-Gg: AYBFou1gIX/2/1HfKtm9/DU5OGELdOXm7VwGVrDS4Jyj8/vLeJTeHna4PZjGfNjOoJX
 Kwn3KU+UJDcnKJoI/nmTi4S2n12HZ/fqcxPdseQP+DKcubU+5Q8AeLNvf78xnoVj/TDCP689z6c
 2714X5h3dQBQt/wBm1oMQDrQ9JTjYGFlbxBMOseMrbkURFFP9U0ZRmmAfCNHCtVfwPo0hV6KtIf
 K/BdbFiczMtJp88r1DrKLVfW4HQ17HnamEyyWTR/+OVXRw7OMt+6qRmV8oULmeyyFNqAsJuU1aJ
 X+zy4ScYEOiASCvaQhRGqp/D6pBczT+Va1rAlRCb4VWMDBV/ZTAKkQwgRs5rS8clrWC6V0DoGX5
 EEIQMp7zGe0P+8/nJWkDjAuDskfze//le43pEsNcl8POC2HYT+H0OOs97VH1vB1Eqx1RrPHTZPG
 Hp5yj7g+kqOJcILyPwgU4zIatUYqlN/7PvGCK7mVR4FJReDR8GAmvq6EPRDfiNULNYp8/a3RIKW
 xNR7MS3yePjr8SGYB2M4AdrPM8BKBdIub+8wKou/4G7RC6K6qT6B0kNJQ==
X-Received: by 2002:a17:907:3e9d:b0:c42:4750:8d33 with SMTP id
 a640c23a62f3a-c46a9040a6bmr357520166b.28.1792761702774; 
 Fri, 23 Oct 2026 06:21:42 -0700 (PDT)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e38060522sm5295899f8f.51.2026.10.23.06.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 06:21:42 -0700 (PDT)
To: buildroot@buildroot.org,
	Waldemar Brodkorb <wbx@openadk.org>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 23 Oct 2026 15:21:39 +0200
Message-ID: <20261023132141.1608098-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <as2y5-1HltXrXKyP@waldemar-brodkorb.de>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/uclibc: add missing sys/auxv.h for
 static builds
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
> getauxval() works fine for static builds. This was already fixed
> a while ago, see the commit message of the patch for more details.
> 
> Fixes:
>  - https://autobuild.buildroot.net/results/f03/f03380ef48cea232e4958084eae419d5516f4ef4
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  ...l-sys-auxv.h-for-static-builds-again.patch | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 package/uclibc/0006-buildsys-install-sys-auxv.h-for-static-builds-again.patch
> 
> diff --git a/package/uclibc/0006-buildsys-install-sys-auxv.h-for-static-builds-again.patch b/package/uclibc/0006-buildsys-install-sys-auxv.h-for-static-builds-again.patch
> new file mode 100644
> index 0000000000..74d14b5501
> --- /dev/null
> +++ b/package/uclibc/0006-buildsys-install-sys-auxv.h-for-static-builds-again.patch
> @@ -0,0 +1,57 @@
> +From 6dc9f06a0330f11171f76f4b831724c02642f11f Mon Sep 17 00:00:00 2001
> +From: ramin <lordrasmus@gmail.com>
> +Date: Mon, 12 Oct 2026 16:30:56 +0200
> +Subject: [PATCH] buildsys: install sys/auxv.h for static builds again
> +
> +getauxval() has not needed ld.so since 227b7c825 and 737a0edf4 ("Make
> +getauxval work with static linking", "Support non-cached entries in
> +getauxval", v1.0.52): _dl_auxvt and _dl_auxv_start are defined in
> +libc/misc/elf/dl-support.c for the static libc, and __uClibc_main calls
> +_dl_aux_init() on that path too.  The static libc.a carries getauxval,
> +__getauxval, _dl_aux_init, _dl_auxvt and _dl_auxv_start.
> +
> +Its header is still withheld, though.  df81bd1e2 ("getauxval: remove
> +header for static builds") put sys/auxv.h next to dlfcn.h in the
> +HEADERS_RM line that applies when HAVE_SHARED is unset, as a way around
> +the link error of the day -- a package that probed for getauxval would
> +not find a declaration and would take its fallback path.  That error is
> +gone and the workaround outlived it: a static sysroot installs 70 of the
> +71 headers in include/sys, and the one missing is auxv.h.
> +
> +So a static configuration of, say, openssl fails with "sys/auxv.h: No
> +such file or directory", which reads like a missing feature rather than
> +a withheld declaration.
> +
> +Measured on riscv64 with a static configuration and gcc 10.5.0: with the
> +header installed, a
> +statically linked program answers AT_PAGESZ as 4096, matching
> +sysconf(_SC_PAGESIZE), returns every entry of /proc/self/auxv unchanged,
> +and reports ENOENT for a type that was not passed -- both for a type
> +inside the cached range and for one above it, which takes the search
> +over the whole vector.
> +
> +dlfcn.h and bits/dlfcn.h stay removed.
> +
> +Upstream: https://gogs.waldemar-brodkorb.de/oss/uclibc-ng/commit/6dc9f06a0330f11171f76f4b831724c02642f11f
> +Signed-off-by: Ramin Moussavi <lordrasmus@gmail.com>
> +Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> +---
> + Makefile.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile.in b/Makefile.in
> +index 3b28fbf60..72865863d 100644
> +--- a/Makefile.in
> ++++ b/Makefile.in
> +@@ -257,7 +257,7 @@ HEADERS_RM- := \
> + ifeq ($(UCLIBC_STRICT_HEADERS),y)
> + HEADERS_RM- += sgtty.h
> + endif
> +-HEADERS_RM-$(HAVE_SHARED)                    += dlfcn.h bits/dlfcn.h sys/auxv.h
> ++HEADERS_RM-$(HAVE_SHARED)                    += dlfcn.h bits/dlfcn.h
> + HEADERS_RM-$(PTHREADS_DEBUG_SUPPORT)         += thread_db.h
> + HEADERS_RM-$(UCLIBC_HAS_ARGP)                += argp.h
> + HEADERS_RM-$(UCLIBC_HAS_BSD_ERR)             += err.h
> +-- 
> +2.47.3
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
