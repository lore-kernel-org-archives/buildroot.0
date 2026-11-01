Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71922606A325
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WkcdzQcT
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49923605DE;
	Sun,  1 Nov 2026 17:00:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T2HpYaZTSgdS; Sun,  1 Nov 2026 17:00:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 403A06060C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793552441;
	b=hdk9DohSwvnBowrQJyH510VvtHCw2uDVe3HFbhSOQB1N5hXZyy7+dQVeILO2CLpmUcLl
	 Elc4WK5/BHj6liHfUqNJZpGsTDV1evLyxovhycCu3eJeOeqjB/9uw5xUy0hLInEYJFocI
	 iH9Vga8W8aHo9zryLZDmNJBEge6ldVBqSVYn7ekAZdOWEIGaUspXjjz8wqZcZZ8D8EMxf
	 hIV/l51AklQPXQturwrxyrbfCngVkVOW2j+ONDzKUWM1vnYInSZieTpwJpz7AN10qFtZ1
	 BF9OYqkyB1nC4B4EdjZelKr8XXn6EhdrSU/bXZ/cFYjtKNM3cJX9UL8IG1uLjUXiwjQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552441;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=gIJI2ku7joV9ULavzMVDnrUq+p304c8zdEerblu3yCk=;
	b=mijKl1uKoOlnik3C+2Z7O3fW8yygThp8+5i+7WCdwLCcTsL7TWRK/VAV6QwqGz8GWkYD
	 C5/fp3W2ZCcDiFQ2cyJTkcpNyHq22IC5a3G5ePAx3KV/46ZUtJUkN5GYzGZJSm+wLCxRR
	 6pZl8jz6YTP7qPDvz1bJk2o1GBKIqylK69mJ3EnNilX29chThRRW8Zr3muc05npCWFk39
	 HECi2PDUkZRhFXGVAiFrhxbtggkp/EplLYdr1omzTqGUoOPj+GOXeQEi/ToAaVl+MU9Qp
	 kFqE1iL0u4UwS3hFJIUvQz7cQWGs43lmC6rJwRMHa8EfIKryIAH/i0FJ/77m8VB7Ycg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793552441;
	bh=gIJI2ku7joV9ULavzMVDnrUq+p304c8zdEerblu3yCk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WkcdzQcT/ob+wyPDiX2JjdpME/DvHModL/CZO9C6xyTBQi28FBp7L5rCT2v83cMo9
	 e8LerlBt3A9IVFclPCvhuCo6Zvbd9U1g3hYBi6443P4eoF9o6ahQ8sTgu9fucNMTTk
	 +jt0TDeR4alJPmCk/LyO6JEje5HyScLQQszTdSC52oml4rufIibIZ5CwQJo0s58sKH
	 Ec22SVjzRposOstS7Te6RIngu1rbAoXC3F7WEh2FSDp96uFP+7cEOcA7wH87ei3gYn
	 zcFzZ0espgUK2X3C7sO8wPKpaVi3cyl/YGtpHPG2A1eRYS6msvGMwUc6w63sZR5Lmx
	 SFZHXIFGTF6Uw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 403A06060C;
	Sun,  1 Nov 2026 17:00:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E557D380
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:00:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C98DD400AE
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:00:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id COzIbQPgIW1r for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:00:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 97E3640076
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793552437;
 b=Bhmuppe2t5vWfGZ038ebMLApfvZ1BWguKG1EGi9zc+kSDQ2Dt3xb+QCphvKxe72RlSEE
 tBo+OweiE45FD5TSatlYTeVUqlpBusxQZ4Sm0OeE8qc7po4hETon8vY2/HGelVTLXoU0R
 6P7gnRCGjtILYc6z9vzJs1XnKdDL9qbMUlz37Uf6zNRby8d0C3qfaznKq9Cili0rPbFvF
 GX3++vVYL23UiPSrojhfQDJHVZG5WRGXn4e/H8iJ1v4Lmj3wAUpuQqc/wlszB+apJvyB+
 /Dj4sAaaILPmFvZ5o4k1q/K4ZOz6ZaaoW2uRfNSGLw2VXENUp5Drv6KHIqXfVkAFJ+w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793552437;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=DzKCnsOgEPXwarrv5h7Glp5BISDIppa9jdKb25I9I9M=;
 b=S8alLvBQ5kZhJ3M7t0SciIozMkjSucqB7t78mFSU+flOvkMvnIeS3OOMRHawofjyyveF
 l+pfgcX9nV2Wq2GvL74V3mECO++wkYkoeknxVSeQZM0j7Uuxn5kB9pJVqirYF+rRJMd6F
 m5mKv65TWGccaV/1ZOXapKv/TrtrxkJheJGUvgaUViciIpT4iDPM+dGu3oK+kD3hfFpWg
 sz/ECChu+MQz+NYfSM4gOIHv464WW7OJZL05zEy1Y+qoF3inXx5KiZF5doXCyHLIdpnQw
 n5hKJmthwD1fb7/T/gHfU8942K6nlc99n8aYhc8oJ8rB8pSLtmItQ3OdU4HJFhEQxuA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=QeX5pnTH; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 97E3640076
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:00:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 9AA46C49F77
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:01:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B6CE360750;
 Sun,  1 Nov 2026 17:00:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 289AF1032912A; Sun,  1 Nov 2026 18:00:31 +0100 (CET)
Date: Sun, 1 Nov 2026 18:00:30 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Message-ID: <audvr60n62pCGzCb@windsurf>
References: <20261101104535.1696412-1-bernd@kuhls.net>
 <20261101104535.1696412-6-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261101104535.1696412-6-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 6/6] package/ffmpeg: bump version to 9.0.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Bernd,

Thanks for working on this. A number of questions below.

On Sun, Nov 01, 2026 at 11:45:34AM +0100, Bernd Kuhls wrote:
> diff --git a/package/ffmpeg/0001-swscale-x86-yuv2rgb-Fix-build-without-SSSE3.patch b/package/ffmpeg/0001-swscale-x86-yuv2rgb-Fix-build-without-SSSE3.patch
> index aa56e5a9b4..3c171c4ce7 100644
> --- a/package/ffmpeg/0001-swscale-x86-yuv2rgb-Fix-build-without-SSSE3.patch
> +++ b/package/ffmpeg/0001-swscale-x86-yuv2rgb-Fix-build-without-SSSE3.patch
> @@ -7,11 +7,11 @@ commit fc6a5883d6af8cae0e96af84dda0ad74b360a084 breaks build on
>  x86_64 CPUs which do not have SSSE3, e.g. AMD Phenom-II
>  
>  Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
> -[bernd.kuhls@t-online.de:
> -  - retrieved from upstream patchwork:
> -    https://patchwork.ffmpeg.org/project/ffmpeg/patch/20200223122256.23402-1-michael@niedermayer.cc/
> -]
> -Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +
> +Upstream: https://patchwork.ffmpeg.org/project/ffmpeg/patch/20200223122256.23402-1-michael@niedermayer.cc/

This was submitted in 2020.. but apparently not merged, what's the plan?

> diff --git a/package/ffmpeg/0002-avcodec-vaapi_h264-skip-decode-if-pic-has-no-slices.patch b/package/ffmpeg/0002-avcodec-vaapi_h264-skip-decode-if-pic-has-no-slices.patch
> index 2892df9d81..dfeb37b1e1 100644
> --- a/package/ffmpeg/0002-avcodec-vaapi_h264-skip-decode-if-pic-has-no-slices.patch
> +++ b/package/ffmpeg/0002-avcodec-vaapi_h264-skip-decode-if-pic-has-no-slices.patch
> @@ -10,19 +10,19 @@ Corresponding kodi bug: https://github.com/xbmc/xbmc/issues/15704
>  Downloaded from Kodi ffmpeg repo:
>  https://github.com/xbmc/FFmpeg/commit/2c6b3f357331e203ad87214984661c40704aceb7
>  
> -Patch was sent upstream:
> -http://ffmpeg.org/pipermail/ffmpeg-devel/2019-March/240863.html
> +Upstream: http://ffmpeg.org/pipermail/ffmpeg-devel/2019-March/240863.html

Same question: submitted in 2019, not merged.

> diff --git a/package/ffmpeg/0003-libavutil-Fix-mips-build.patch b/package/ffmpeg/0003-libavutil-Fix-mips-build.patch
> index aeb272c459..ce72514d67 100644
> --- a/package/ffmpeg/0003-libavutil-Fix-mips-build.patch
> +++ b/package/ffmpeg/0003-libavutil-Fix-mips-build.patch
> @@ -7,10 +7,9 @@ Check for sys/auxv.h because not all toolchains contain this header.
>  
>  Fixes https://trac.ffmpeg.org/ticket/9138
>  
> -Patch sent upstream:
> -http://ffmpeg.org/pipermail/ffmpeg-devel/2021-June/281272.html
> +Upstream: http://ffmpeg.org/pipermail/ffmpeg-devel/2021-June/281272.html

Same question :)

> diff --git a/package/ffmpeg/0004-configure-add-extralibs-to-extralibs_xxx.patch b/package/ffmpeg/0004-configure-add-extralibs-to-extralibs_xxx.patch
> index 050b34fd89..b6b49b2ca6 100644
> --- a/package/ffmpeg/0004-configure-add-extralibs-to-extralibs_xxx.patch
> +++ b/package/ffmpeg/0004-configure-add-extralibs-to-extralibs_xxx.patch
> @@ -8,9 +8,9 @@ applications such as motion to retrieve ffmpeg dependencies such as
>  -latomic through pkg-config
>  
>  Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status: not upstreamable]
> +Upstream: not upstreamable

So why do we have it?

> diff --git a/package/ffmpeg/0005-avutil-arm-fix-armv5-build.patch b/package/ffmpeg/0005-avutil-arm-fix-armv5-build.patch
> new file mode 100644
> index 0000000000..5f0a6bc325
> --- /dev/null
> +++ b/package/ffmpeg/0005-avutil-arm-fix-armv5-build.patch
> @@ -0,0 +1,47 @@
> +From d79bcb8ff738af8d15021cbe746c23cc245e03d6 Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd@kuhls.net>
> +Date: Fri, 30 Oct 2026 08:52:16 +0100
> +Subject: [PATCH] avutil/arm: fix armv5 build
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/471db1d323aaed50ff922f0da76ecc8e45c4e817
> +
> +added armv6 optimizations and guarded the include with

If these are ARMv6 optimizations... why are you enabling them on ARMv5?

> +FFMPEG_EXTRA_DOWNLOADS = \
> +	https://github.com/xbmc/xbmc/raw/refs/tags/22.0rc1-Piers/tools/depends/target/ffmpeg/001-ffmpeg-all-libpostproc-plugin.patch
> +

This is a huge patch to re-add libpostproc. What's the plan
mid/long-term ?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
