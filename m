Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 011A7C531DC
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 15:17:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B55AA840DF;
	Fri, 23 Aug 2024 15:17:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZDRl6cytXNY5; Fri, 23 Aug 2024 15:17:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2E17840E0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2E17840E0;
	Fri, 23 Aug 2024 15:17:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 179D91BF4E6
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 15:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05880840E0
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 15:17:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Nq3QXsBi8Lg for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 15:17:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0D7A3840DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D7A3840DF
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D7A3840DF
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 15:17:25 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id E0D473535C26; Fri, 23 Aug 2024 17:17:23 +0200 (CEST)
Date: Fri, 23 Aug 2024 17:17:23 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZsioAzIzj7+DdKwe@waldemar-brodkorb.de>
References: <ZsgdgdqUcwJzrrna@waldemar-brodkorb.de>
 <20240823095809.70b3bfec@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240823095809.70b3bfec@windsurf>
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1724426243; bh=vEH1k7tp4XKH9FGsHMkHNCU/UTM5FXMUO6Bi1RegOnA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ahudnAbNFPoMrAm3tg0bSYR7Aj7W1MaizgFE4FHzvet84arH4mLeAvbPCiloPmYWD
 lboBlBuvUYk0eorUgxG7Oa9OZ4vNb0MYUkzqWikr7fFUMFiOrAoNSdr2CUQt8i38LF
 f2eA/q1Swmf6MlQojw1ht4FXnWfLxXLSnh+r3C05Qf3FtEkNXkz6oxJMJTdNgE8fnh
 zAvbKHXpV9H4XzBNUgOkICC/GNwlAlwwCuqf3ru1YOq+S2R1l/1e+LIhFiy8ps/YNN
 TEqirYj5WkQzfmGWjfnfF2ZM776SpTgdjIiqkmLIgubsOyRaDZ1OOA5A8IL8m2nW1m
 uUJ7TKHjU2xQg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=ahudnAbN
Subject: Re: [Buildroot] [PATCH next] package/fbv: update package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,
Thomas Petazzoni wrote,

> Hello Waldemar,
> 
> Thanks a lot, looks good. Just a few nits below.
> 
> On Fri, 23 Aug 2024 07:26:25 +0200
> Waldemar Brodkorb <wbx@openadk.org> wrote:
> 
> > diff --git a/package/fbv/Config.in b/package/fbv/Config.in
> > index 2206276334..1d11bfb3ef 100644
> > --- a/package/fbv/Config.in
> > +++ b/package/fbv/Config.in
> > @@ -2,10 +2,10 @@ config BR2_PACKAGE_FBV
> >  	bool "fbv"
> >  	help
> >  	  fbv is a very simple graphic file viewer for the framebuffer
> > -	  console, capable of displaying GIF, JPEG, PNG and BMP files
> > -	  using libungif, libjpeg and libpng.
> > +	  console, capable of displaying JPEG, PNG and BMP files
> > +	  using libjpeg and libpng.
> >  
> > -	  http://freshmeat.net/projects/fbv/
> > +	  https://github.com/amadvance/fbv
> >  
> >  if BR2_PACKAGE_FBV
> >  
> > @@ -23,11 +23,4 @@ config BR2_PACKAGE_FBV_JPEG
> >  	help
> >  	  Enable support for JPEG using IJG's libjpeg.
> >  
> > -config BR2_PACKAGE_FBV_GIF
> > -	bool "GIF support"
> > -	default y
> > -	select BR2_PACKAGE_GIFLIB
> > -	help
> > -	  Enable support for GIF using giflib.
> 
> When you remove an option, you should add an entry in Config.in.legacy.
> 
> 
> > diff --git a/package/fbv/fbv.hash b/package/fbv/fbv.hash
> > index 3f25465ba1..7cd9bb597f 100644
> > --- a/package/fbv/fbv.hash
> > +++ b/package/fbv/fbv.hash
> > @@ -1,3 +1,3 @@
> >  # Locally calculated
> > -sha256  9b55b9dafd5eb01562060d860e267e309a1876e8ba5ce4d3303484b94129ab3c  fbv-1.0b.tar.gz
> > +sha256  233b387bf110eaab94221e91bebc16365c70bf6ede01280164a875a7f460d0e0  fbv-7c2000804226ca860ca80f3baa993582e29aa1a2-git4.tar.gz
> >  sha256  bf21d97bafcaacb5d6bc3d5502030c340f0e0593614078ab017af91e950083af  COPYING
> 
> Did you verify that legal-info was still working?
> 
> > diff --git a/package/fbv/fbv.mk b/package/fbv/fbv.mk
> > index a69e4ad518..9c7d74b671 100644
> > --- a/package/fbv/fbv.mk
> > +++ b/package/fbv/fbv.mk
> > @@ -4,12 +4,14 @@
> >  #
> >  ################################################################################
> >  
> > -FBV_VERSION = 1.0b
> > -FBV_SITE = http://s-tech.elsat.net.pl/fbv
> > -
> > +FBV_VERSION = 7c2000804226ca860ca80f3baa993582e29aa1a2
> > +FBV_SITE = https://github.com/amadvance/fbv
> > +FBV_SITE_METHOD = git
> 
> Please use:
> 
> FBV_SITE = $(call github,amadvance,fbv,$(FBV_VERSION))
> 
> and drop FBV_SITE_METHOD
> 
> Also, with this commit, you are kind of "adopting" this package, so
> perhaps add yourself in the DEVELOPERS file for this package?
> 
> Thanks!

As always, thanks for the review. I have sent a v2.

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
