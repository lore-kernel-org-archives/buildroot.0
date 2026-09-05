Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF76C624DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 14:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B9AF60622;
	Sat,  5 Sep 2026 14:14:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6doFn1Jpc4Yw; Sat,  5 Sep 2026 14:14:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C31CF6060C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788617676;
	b=QsgRShCVwN6A3VFulIIEYkG40G+L7rmNFm6Vlr+SoYyBJxbGNSIJmXHHTB/bADmkubkr
	 umRyfW97vZbJq6y871U87vh2ZwvbPYTAGLCJyP4o1+Ik0mRjh3kudjtttYMpT26kTYxM4
	 TPnYFMy/LUfJ5eJfhgeF5tc0zMZ+NbG2QZiGrLRYF5YFWkwZD491cAWglKl7gSgm4TCWN
	 lFCqOgNquzbFUZb0MLy5mgoveXYbFsVJQmyNFG2zpX4fm69TIOYKMLe8+wYvEu+SxD7C2
	 00SfWpBsD11nSDroljg8313lIhTgOcOdPrhExXCu3SaHNfpJ6Bg3F1y4NrYGLRP80iQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788617676;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=aYGZ5nz+wX6tLUSuURrlukiTKasQ/cSlqR6KUCCTP20=;
	b=fz2lQTqI8BS8hMd3GH0uNm5oQLKcBebiErn+IxuFfuEwruUb8gT1UCi5S1/UeddtX6iO
	 4wTKP6KYmIHDZEYIn/fTuHfieaRknfUDWtXTTwAATIdr+ryK1Sc/T16srXc/ezcAWOLI1
	 nHXR/GUgwBhtMxhiMuBEfQTigKaqwWwGl1eL2ncB13UzAbLTRXDmYN4LGl2cEO2c1fj1A
	 YkXvLaazAQay1NWqLQkz0NO/m3l04Z4xVakO3ipXK+wiUnCg2wYTCOkN+4uJIIjjSEUOF
	 ViFe+vBAVVgaxDFBpqKNESD8IN/pRl6gpLGczf/+sOkZMo/kohyyF/dtopFH+tK/Ymg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788617676;
	bh=aYGZ5nz+wX6tLUSuURrlukiTKasQ/cSlqR6KUCCTP20=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZoxTbalo92na0mrja1u3hdYP4tHuIwJWAs3wkBvFKilFzKWPuAoIBVyuou7Lr8Xyn
	 uEK9Pi5GpY1Xb5hOLpIaLEqjj4XrvWkwEullZuFU6nxfuix4EZ9VoNF2EoXHCJ85Xt
	 OK05ylOYxS+qqmBSTMMJfU7A6+NjbCn79pU2CMJTS/rrfmqkFeYXxkmLpE4nG436Gm
	 lM+VWeMp5pnWbACDne4VHe9mg4L6HLK70w7R+E7tAq8H8ZwZFrCNClKx815dL03iTF
	 nN9O2EH7bqEEqN1kk/mCC7rpNeAVqdSXRjyjPkEG0zXe0UlObllSZI2qvfkNSgN6hp
	 h2vzbSguh14NQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C31CF6060C;
	Sat,  5 Sep 2026 14:14:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 908D2105
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 14:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8275040566
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 14:14:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hufmHxuHH7Yf for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 14:14:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A149840A97
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788617672;
 b=mLnW2lgkmMCQVLl337aCvDoH+Yd5msuLg6815Ib/FmN+PEEnbrZXNGyMjnrfyZQZIJb6
 3fnsP8IRDVGHxE6hVSnboDY1Pe4AF1288MMIcWxOHYrwFfR9yGE5fF23+u/pIPkz9mDTG
 6NVprwuqYrKQLzI05ILkA+oCzZUgxS+Xctfm9n0/KdHQwh0qcv8/akKV/JYJJrg3Sl602
 8QsXXshQmNlLPLrdfCHvAiqbsElCTn1hIDmLxolrkSyRkQGvq8mfX8YoI6JorJh/dCJ0R
 f0y+GZEsJHjAksBgtY6ClKVFvMCIX7N9O623N+kSB/13kYkA52S4eEsi70mrZTFeUcw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788617672;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=W5wGkm/fzpOA3IizuxCLZ/HkAmzLGd3oNz8nIJlsWsk=;
 b=tQhZRalJg8I4g4JBIwRi9cJAUHwddfg9CDhls+Yc7LiKowI4UKjiyj9p7KusRtxHo/am
 hO9qnj4xwtxKEHk18CaKt9jSYwIQM0pA8vi9oU0QCyclkQ0tks4te63gvOGQQqvoHxpwi
 KO3zFg9kHgkV3ISniAMmih5ZOdC8GqXvKjnjICtGuAusCnnP8WL8L6ZzmG1I3XmcSSSYR
 O/xdvOM9m6HaO40SQ1j8pUhQB03jIET47YLhhTO7aaVBTZN1SSeiygXoFH2eI8yuEYW6Q
 IwNiQXHKjJgYgAT/7rG5fUXw7+I/DsEsVG3gfMbEfJEGNtL9jEqblL8SH63CYefa0rQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=jGuhpA48; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A149840A97
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 14:14:31 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 9E65A1A18F2;
 Sat,  5 Sep 2026 14:14:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5EE9E60233;
 Sat,  5 Sep 2026 14:14:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3DF9811C783E9; 
 Sat,  5 Sep 2026 16:14:24 +0200 (CEST)
Date: Sat, 5 Sep 2026 16:14:23 +0200
To: Andreas Ziegler <br025@umbiko.net>
Cc: buildroot@buildroot.org, Marcus Hoffmann <buildroot@bubu1.eu>
Message-ID: <apwjYdxffhgRv79A@windsurf>
References: <20260905040256.2221199-1-br025@umbiko.net>
 <20260905040256.2221199-2-br025@umbiko.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260905040256.2221199-2-br025@umbiko.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v4 1/2] package/mpd: remove unused,
 add mandatory configuration items
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

Hello Andreas,

On Sat, Sep 05, 2026 at 06:02:52AM +0200, Andreas Ziegler wrote:
> The configuration file supplied by Buildroot is only a sample; it will
> not start MPD on a default installation. In a production build, a custom
> mpd.conf has to be supplied via rootfs overlay or on the target system.
> 
> Supply the necessary configuration items to start mpd in a default build,
> and discard unused customizations. 
> 
> Signed-off-by: Andreas Ziegler <br025@umbiko.net>

Thanks for the new iteration.

> diff --git a/package/mpd/Config.in b/package/mpd/Config.in
> index 1b6815e904..bbd6fc16e5 100644
> --- a/package/mpd/Config.in
> +++ b/package/mpd/Config.in
> @@ -119,7 +119,6 @@ config BR2_PACKAGE_MPD_LIBSNDFILE
>  
>  config BR2_PACKAGE_MPD_MAD
>  	bool "mad"
> -	default y

Why?

>  	select BR2_PACKAGE_MPD_ID3TAG
>  	select BR2_PACKAGE_LIBMAD
>  	help
> @@ -244,7 +243,6 @@ comment "Output plugins"
>  
>  config BR2_PACKAGE_MPD_ALSA
>  	bool "alsa"
> -	default y

Why?

These changes are not really explained in your commit message. Also
this change will break existing defconfigs that assume those options
"default y". Is it important to change this? (Even though I agree they
should not have been "default y" in the first place).

> diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
> index 4db0aee7cb..5852bbe73f 100644
> --- a/package/mpd/mpd.mk
> +++ b/package/mpd/mpd.mk
> @@ -347,8 +347,6 @@ endif
>  
>  define MPD_INSTALL_EXTRA_FILES
>  	$(INSTALL) -m 0644 -D package/mpd/mpd.conf $(TARGET_DIR)/etc/mpd.conf
> -	mkdir -p $(TARGET_DIR)/var/lib/mpd/music
> -	mkdir -p $(TARGET_DIR)/var/lib/mpd/playlists

Why is that no longer needed? Because of the configuration file
change? Or because it was bogus/useless anyway?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
