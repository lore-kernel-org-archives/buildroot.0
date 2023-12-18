Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506D9C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 16:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00AEB404FC;
	Mon, 18 Dec 2023 16:46:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00AEB404FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SfxS-CGE-R3e; Mon, 18 Dec 2023 16:46:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0AB1E40AEB;
	Mon, 18 Dec 2023 16:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AB1E40AEB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 305591BF2B3
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 16:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16D7B81990
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 16:46:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16D7B81990
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f4j4mFZg9aP9 for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 16:46:16 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C50E815AB
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 16:46:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C50E815AB
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 1B342B005B5;
 Mon, 18 Dec 2023 17:46:11 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 18 Dec 2023 17:46:10 +0100
Date: Mon, 18 Dec 2023 17:46:10 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <ZYB3UhzuQqzg90Vl@landeda>
References: <20231205235919.510051-1-adam.duskett@amarulasolutions.com>
 <20231205235919.510051-4-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231205235919.510051-4-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1702917974;
 bh=bdctpAr22c9pLORVxO97uftdOwv95oZkCxeVHL/wGqM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UQ7HoN9FzyhdwRU4mz/XajZsA2VEaQp6KaigvIDG0r3iKlyCCGhnj5OzYk7vGAe/I
 AqyTLVY7+z0ZW73+L6LsmsIQEc5tWhVL3N+OG3yhbWG1oWt6J43Y4oAeKIuSpApkwI
 MqQ6PRwG6Fmx3ju0wcL+8XJtvlbJSeVsQxULiH5D06YQefhQwec4L5+olvOY1/JvYO
 YfMWopQvG/CjtfMFmHLT5DQd1M7YmHMQOToVt3ksJ8ttmr/ALU5gGQPhf2iOljYCLp
 AqWywx44kLCWk5/+oplZ0TooxwQxOGnonmkUOkMalWmCr1RfXADz0t/Ed6wRaIQPNA
 y48aiwMksx2Jg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UQ7HoN9F
Subject: Re: [Buildroot] [PATCH 3/3]
 package/giflib/0004-Fix-several-defects-found-by-Coverity-scan.patch: New
 security patch
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adam, All,

On 2023-12-05 16:59 -0700, Adam Duskett spake thusly:
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...veral-defects-found-by-Coverity-scan.patch | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 package/giflib/0004-Fix-several-defects-found-by-Coverity-scan.patch
> 
> diff --git a/package/giflib/0004-Fix-several-defects-found-by-Coverity-scan.patch b/package/giflib/0004-Fix-several-defects-found-by-Coverity-scan.patch
> new file mode 100644
> index 0000000000..1719769872
> --- /dev/null
> +++ b/package/giflib/0004-Fix-several-defects-found-by-Coverity-scan.patch
> @@ -0,0 +1,61 @@
> +From a1c48b91cd1cf1e9bf7077709b69f4bfd4c4abc7 Mon Sep 17 00:00:00 2001
> +From: Sandro Mani <manisandro@gmail.com>
> +Date: Tue, 5 Dec 2023 16:38:48 -0700
> +Subject: [PATCH] Fix several defects found by Coverity scan
> +
> +From: giflib-5.2.1-17.fc39.src.rpm
> +Upstream: Not submitted
> +
> +Signed-off-by: Sandro Mani <manisandro@gmail.com>
> +Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> +---
> + gif2rgb.c | 11 ++++++++++-
> + 1 file changed, 10 insertions(+), 1 deletion(-)
> +
> +diff --git a/gif2rgb.c b/gif2rgb.c
> +index d9a469f..02cea41 100644
> +--- a/gif2rgb.c
> ++++ b/gif2rgb.c
> +@@ -170,6 +170,8 @@ static void SaveGif(GifByteType *OutputBuffer,
> +     /* Open stdout for the output file: */
> +     if ((GifFile = EGifOpenFileHandle(1, &Error)) == NULL) {
> + 	PrintGifError(Error);
> ++	free(OutputBuffer);
> ++	GifFreeMapObject(OutputColorMap);
> + 	exit(EXIT_FAILURE);
> +     }
> + 
> +@@ -179,6 +181,8 @@ static void SaveGif(GifByteType *OutputBuffer,
> + 	EGifPutImageDesc(GifFile,
> + 			 0, 0, Width, Height, false, NULL) == GIF_ERROR) {
> + 	PrintGifError(Error);
> ++	free(OutputBuffer);
> ++	GifFreeMapObject(OutputColorMap);
> + 	exit(EXIT_FAILURE);
> +     }
> + 
> +@@ -187,8 +191,11 @@ static void SaveGif(GifByteType *OutputBuffer,
> + 	       GifFile->Image.Width, GifFile->Image.Height);
> + 
> +     for (i = 0; i < Height; i++) {
> +-	if (EGifPutLine(GifFile, Ptr, Width) == GIF_ERROR)
> ++	if (EGifPutLine(GifFile, Ptr, Width) == GIF_ERROR) {
> ++	    free(OutputBuffer);
> ++	    GifFreeMapObject(OutputColorMap);
> + 	    exit(EXIT_FAILURE);
> ++        }
> + 	GifQprintf("\b\b\b\b%-4d", Height - i - 1);
> + 
> + 	Ptr += Width;
> +@@ -196,6 +203,8 @@ static void SaveGif(GifByteType *OutputBuffer,
> + 
> +     if (EGifCloseFile(GifFile, &Error) == GIF_ERROR) {
> + 	PrintGifError(Error);
> ++	free(OutputBuffer);
> ++	GifFreeMapObject(OutputColorMap);
> + 	exit(EXIT_FAILURE);
> +     }
> + }
> +-- 
> +2.43.0
> +
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
