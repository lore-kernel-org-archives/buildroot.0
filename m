Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 438C1C19F2D
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 03:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9379240463;
	Sun, 14 Aug 2022 03:15:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9379240463
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qbwioBfvhxbg; Sun, 14 Aug 2022 03:15:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF2FD400F6;
	Sun, 14 Aug 2022 03:15:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF2FD400F6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0F00A1BF969
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 03:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE43A82813
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 03:15:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE43A82813
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x6597FScyOSS for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 03:15:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EBB1812E6
Received: from smtpcmd01-ws.aruba.it (smtpcmd01-ws.aruba.it [62.149.158.241])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2EBB1812E6
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 03:15:18 +0000 (UTC)
Received: from [192.168.8.175] ([86.32.63.136])
 by Aruba Outgoing Smtp  with ESMTPSA
 id N45souuLmr8wyN45toXwxE; Sun, 14 Aug 2022 05:15:17 +0200
Message-ID: <8c81c6e4-7e03-2045-2efe-7d31c56278c2@benettiengineering.com>
Date: Sun, 14 Aug 2022 05:15:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
To: buildroot@buildroot.org
References: <20220814031208.508000-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220814031208.508000-1-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfAan9d4fy4sD3jA/wV0LxlG/YW0rQcEh7rSP8V9EWGTsmT0mwyyo+LRQpoD5sOASHvEYccQy47cFRlSRfprr9oXtCPspYAsN6KPUPmNG3QVvD7bFp6oH
 EPlMReZYAY0LUBoDnAQUQ0xB2EJDv9QHGcOkR62Bpvhe13qnbvNQ/wvHewCvRHflSnHr7JN1dc0eZU1VcA7vPt9hxVPmJUxKTjs74BvnYWXeueyD6gixseIf
 k5A2cchqPjllupSUx1T3I+rKpCqQ+YMa6BH0L6yTaIk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1660446917; bh=NLvqfaaLeLTloCCrijlmnU8QIlFWTvbiNqTh9uGj/xE=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=B+50X9xprp3HbD5vN5o2+U+HnNovG0ZsqhLXiY3hyzfRkLY42P4Wi7jvHSfcv59T5
 uAYMxtFpG2CqNoQqR8iYAmvPzOg2GHbhRqzVq0EXCZ6hUKcue2zm+0bNjJwtI1eOvN
 PTEIt4TTcLtOYFqaijvMgoxCY5NqJoWJqYzZjR0AxZI0fOllc3/M1lhXSjpYnoiowj
 0eM6YfQdKDWcD1wZ2Jhq8PNovcx6lWjsGBSHOVP8TybyuIqigG37yg7tkmaj7E5xi+
 +T3j4xiKuSkZkdQpzJy6X+hQuYZjoGIbn/rDqe8/7un78OH+Is0lr2J4bHT8H0bljM
 i6krlfYs6exuQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=B+50X9xp
Subject: Re: [Buildroot] [PATCH] package/zstd: fix build failure on
 Microblaze
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ah, I've found only now Arnout's patch for this:
https://patchwork.ozlabs.org/project/buildroot/patch/20220725100745.2878896-1-arnout@mind.be/

Please drop it.

Sorry for the noise
-- 
Giulio Benetti
Benetti Engineering sas

On 14/08/22 05:12, Giulio Benetti wrote:
> Building for Microblaze leads to error:
> ```
> util.c: In function 'UTIL_utime':
> util.c:173:27: error: 'stat_t' {aka 'const struct stat'} has no member named 'st_mtim'; did you mean 'st_mtime'?
>    173 |     timebuf[1] = statbuf->st_mtim;
>        |                           ^~~~~~~
>        |                           st_mtime
> ```
> Let's define _POSIX_C_SOURCE=199309L to make st_mtim struct member
> visible again. Let's do this by using the already present MOREFLAGS
> variable since CFLAGS gets overridden through zstd configuration.
> 
> Fixes:
> http://autobuild.buildroot.net/results/aba/abaf20f73303bf7dfde7983f32b36d43db897ced/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   package/zstd/zstd.mk | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
> index e8f6315222..6c8fcebd89 100644
> --- a/package/zstd/zstd.mk
> +++ b/package/zstd/zstd.mk
> @@ -36,7 +36,12 @@ ZSTD_OPTS += HAVE_LZ4=0
>   endif
>   
>   # zstd will append -O3 after $(CFLAGS), use MOREFLAGS to override again
> -ZSTD_OPTS += MOREFLAGS="$(TARGET_OPTIMIZATION)"
> +ZSTD_MOREFLAGS = $(TARGET_OPTIMIZATION)
> +
> +# with glibc 'struct stat's member 'st_mtim' requires _POSIX_C_SOURCE=199309L
> +ZSTD_MOREFLAGS += -D_POSIX_C_SOURCE=199309L
> +
> +ZSTD_OPTS += MOREFLAGS="$(ZSTD_MOREFLAGS)"
>   
>   ZSTD_BUILD_LIBS_BASENAMES = libzstd.pc
>   ifeq ($(BR2_STATIC_LIBS),y)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
