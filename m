Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A4FEC5DF87
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 10:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37F4A60677;
	Fri, 21 Aug 2026 10:23:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7aFR1qvRynAu; Fri, 21 Aug 2026 10:23:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787307788;
	bh=YfFVCiboJA0YgyIGCSoorYU10izqkFEtvngn9Ebk3eI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=N4msqU7pNmrxg829DbF79y3/Kex95w6pOA4ylea3rUaBkpIOJJm25TSihezgOxKht
	 0AE65BwAtKKsDVRlaMl51kwvxbFzhTCg6KauH/DEAYXUpOkj1A4cm6OYuMQuMACTXq
	 ZRM7IeVoyv9IcwSfPafOPzFERvEjA6928mdudYnsaBFRC936Zg3sSmhHLmGYJUmck0
	 AfFdLQPNBKmayMEvvd6TD7XSOW7mlhVtWOsblPQDZ1OtI6sHGmOPIHzWBT2INVzoMe
	 aLb3p+HGzWFzpo/6tSt3t7NJI5CfetjeJ86aS4+JeRDRXcWaFyt47oRAIxAlZ7TtU6
	 7X71GwsVUPtbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 500846068A;
	Fri, 21 Aug 2026 10:23:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EF9A0EA3
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 10:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D570F4006A
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 10:23:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id haEYiX77Ow42 for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 10:23:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D522440026
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 10:23:04 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 997C31A1697;
 Fri, 21 Aug 2026 10:23:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6554C604AA;
 Fri, 21 Aug 2026 10:23:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 87BDE11C76D15; 
 Fri, 21 Aug 2026 12:23:01 +0200 (CEST)
Date: Fri, 21 Aug 2026 12:23:00 +0200
To: Alessandro Rubini <rubini@gnudd.com>
Cc: buildroot@buildroot.org
Message-ID: <aoglkraRzHufPBHQ@windsurf>
References: <amaDQ/RxzLn24+me@arcana.i.gnudd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <amaDQ/RxzLn24+me@arcana.i.gnudd.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/opencv: depend on webp mux/demux
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Alessandro,

Thanks for your patch!

On Sun, Jul 26, 2026 at 11:59:31PM +0200, Alessandro Rubini wrote:
> Without this dependency, autoconfiguration fails:
> 
>     CMake Error: The following variables are used in this project,
>          but they are set to NOTFOUND.
>     Please set them or make sure they are set and tested correctly
>          in the CMake files:
>     WEBP_DEMUX_LIBRARY
>     linked by target "opencv_imgcodecs"
>          in directory [...]/build/opencv4-4.13.0/modules/imgcodecs
>     WEBP_MUX_LIBRARY
>     linked by target "opencv_imgcodecs"
>          in directory [...]/build/opencv4-4.13.0/modules/imgcodecs
> 
> Signed-off-by: Alessandro Rubini <rubini@gnudd.com>
> ---
>  package/opencv4/Config.in  | 2 ++
>  package/opencv4/opencv4.mk | 1 +
>  2 files changed, 3 insertions(+)
> 
> diff --git a/package/opencv4/Config.in b/package/opencv4/Config.in
> index 47c1cf3f4a..856f3e8abd 100644
> --- a/package/opencv4/Config.in
> +++ b/package/opencv4/Config.in
> @@ -7,6 +7,8 @@ menuconfig BR2_PACKAGE_OPENCV4
>  	depends on !BR2_STATIC_LIBS # include dlfcn.h
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
>  	select BR2_PACKAGE_ZLIB
> +	select BR2_PACKAGE_WEBP_DEMUX
> +	select BR2_PACKAGE_WEBP_MUX

I don't think this is correct, because here a build of opencv4 with
nothing special works fine, so it means that webp doesn't seem to be a
mandatory dependency of opencv4, but your patch turns webp into a
mandatory dependency of opencv4.

Basically here:

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_PACKAGE_OPENCV4=y

builds fine.

But I do see autobuilder failures for this issue, for example:

  https://autobuild.buildroot.net/results/acb/acbddbea6d18272b5830be1b5fa5f40cf37e0389/build-end.log

In the autobuilders, I see that the few occurrences of this failures
occur when BR2_PACKAGE_OPENCV4_WITH_WEBP is enabled, which pulls in
webp as a dependency already.

So two things need to be figured out:

1. Under what conditions exactly is webp required, so that the
   dependency can be added only when needed

2. Since when the problem exists. Indeed, when we are fixing bugs, we
   always have to figure out if the fix needs to be backported to our
   stable branch (currently 2025.02.x), so every fix must come with a
   reference to the commit that introduced the problem in the first
   place. Or at least figure out whether 2025.02.x was affected or
   not.

Also, your patch could anyway not be correct, because we already have:

ifeq ($(BR2_PACKAGE_OPENCV4_WITH_WEBP),y)
OPENCV4_CONF_OPTS += -DWITH_WEBP=ON
OPENCV4_DEPENDENCIES += webp
else
OPENCV4_CONF_OPTS += -DWITH_WEBP=OFF
endif

which adds webp conditionally, and it wouldn't make sense to add it
unconditionally, and then have some logic to add it conditionally.

Could you have a look into this?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
