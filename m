Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C864EC433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 19:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 581C140A8E;
	Tue, 14 Jun 2022 19:13:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8nD9S2KeWzjR; Tue, 14 Jun 2022 19:13:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A33A440A07;
	Tue, 14 Jun 2022 19:13:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ED78B1BF5B4
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 19:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E93F860E82
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 19:13:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7skslhnZBfug for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 19:13:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 928D2607F2
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 19:12:47 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id m20so18980666ejj.10
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 12:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=R9vWDApoDlfR1XvmNN5E+7Y3tdMJ5b3LxqHlTUx49lw=;
 b=RtW+5vb9hLld02wqTPz+DA3U85WhMj5wOBrm5cPiZfPTCPxpKDKPF0agCBGcODRb6T
 rp5Y1EaVjgiu8Gc5ZcJ/Y/9hPJ7dzX3vtPRC/2Fu7q7MASxnuvQnRy9thmuQv3onjeqK
 v80kQ90MOTPQ/Ze1AHHZXr6WrSY+oxDe5IbA6QRr5wBrPeAkmLlbj2AuvJ3B1won1kcD
 kIGgjwQS7Chv4jzrjnu23vV4C7VkDkOks6d07yOpLXbLYXJMcMZhZrBuAlTqOnSYx+lS
 IUrWoqBiA5JTGjz+XuvNTD+ecIWJ8+Rp5GrbpWwh6eYgVKR5zyGovyftbrg30KtH90Sg
 WYZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=R9vWDApoDlfR1XvmNN5E+7Y3tdMJ5b3LxqHlTUx49lw=;
 b=N7ohIuPfOa+9rvHieAq6AJxqeURz3CtD1jgqXQbpBe39GhPB9yShYvvvlMarf3QT/0
 jcAy7yTo0dR8bWvACR+UzmChKNk9NeRC0laXZY1HxyhBf/siAMttnZroP6Gs07G6S3bM
 PueyzAx78MyM5ypYtLawu/YBTjJ0FcdO1MiDzs7cKaXWJJ3FdhshNYUEYdnzjPlJbdqZ
 kneJMffQyqn5tAgGuquvr4D50SlHDaI8GZsFDn3KrYaqwqMbhIeQ6eT0C3NamxEq8t13
 PVdu8eaJZ07CJIdW3Sw5wPxWLJoawxAgbvcwKT9BvbUPk5L6nXW48x+Rlj+sjNtxiMGJ
 zERA==
X-Gm-Message-State: AOAM531tsTHPXRW+tka78NG4PMJs06j3Vaecl+BBrTh1UOni4aKuIwjg
 FsngjUbdtp3M7NjMKyu4oc61LXkdHNp5dg==
X-Google-Smtp-Source: ABdhPJyypE7YP34Fi1tmcjONqkhw3r4aGZj57uTVY2IWqvt9ygG4S2b1T6yWqRXkCDfZXmXPdPDVGw==
X-Received: by 2002:a17:906:b898:b0:711:ca46:24ec with SMTP id
 hb24-20020a170906b89800b00711ca4624ecmr5569535ejb.111.1655233965818; 
 Tue, 14 Jun 2022 12:12:45 -0700 (PDT)
Received: from [10.1.0.138] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 oq13-20020a170906cc8d00b006feb047502bsm5333034ejb.151.2022.06.14.12.12.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 12:12:45 -0700 (PDT)
Message-ID: <06b59095-245e-e92e-d6e8-73fcef93437a@mind.be>
Date: Tue, 14 Jun 2022 21:12:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220612200904.2783767-1-fontaine.fabrice@gmail.com>
Organization: Essensium/Mind
In-Reply-To: <20220612200904.2783767-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/zstd: pass _GNU_SOURCE in CFLAGS
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/06/2022 22:09, Fabrice Fontaine wrote:
> Fix the following build failure:
> 
> util.c: In function 'UTIL_utime':
> util.c:173:27: error: 'stat_t' {aka 'const struct stat'} has no member named 'st_mtim'; did you mean 'st_mtime'?
>    173 |     timebuf[1] = statbuf->st_mtim;
>        |                           ^~~~~~~
>        |                           st_mtime
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/dd944a3bd4ac0c94b2bec8ac209100daaf43903d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/zstd/zstd.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
> index e8f6315222..75eb6ecc07 100644
> --- a/package/zstd/zstd.mk
> +++ b/package/zstd/zstd.mk
> @@ -36,7 +36,7 @@ ZSTD_OPTS += HAVE_LZ4=0
>   endif
>   
>   # zstd will append -O3 after $(CFLAGS), use MOREFLAGS to override again
> -ZSTD_OPTS += MOREFLAGS="$(TARGET_OPTIMIZATION)"
> +ZSTD_OPTS += MOREFLAGS="$(TARGET_OPTIMIZATION) -D_GNU_SOURCE"

  Although this workaround seems quite innocuous, it doesn't feel like the right 
thing to do. Indeed, the code around the use of st_mtim already does every 
effort of making sure that the toolchain really supports st_mtim.

  Actually, it feels like a bug in glibc. POSIX require st_mtim to exist, so 
requiring _GNU_SOURCE for it is just plain wrong. Indeed, in 
sysdeps/unix/sysv/linux/microblaze/bits/struct_stat.h, the largefile definition 
of st_mtim is protected by the __USE_MISC macro, while the non-largefile 
definition is protected by the __USE_XOPEN2K8 macro (which is the correct one). 
So I'd rather patch glibc.

  Apparently, Debian has a similar problem on Alpha [1].

[1] https://github.com/facebook/zstd/pull/2986

>   
>   ZSTD_BUILD_LIBS_BASENAMES = libzstd.pc
>   ifeq ($(BR2_STATIC_LIBS),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
