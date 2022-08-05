Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3B7C00140
	for <buildroot@archiver.kernel.org>; Fri,  5 Aug 2022 16:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3544960A9E;
	Fri,  5 Aug 2022 16:33:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3544960A9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wDVPYi33Q5E1; Fri,  5 Aug 2022 16:33:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B2F560586;
	Fri,  5 Aug 2022 16:33:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B2F560586
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BA7EF1BF9CB
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 16:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93B3940D8F
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 16:33:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93B3940D8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IvMp1AbiN9TQ for <buildroot@lists.busybox.net>;
 Fri,  5 Aug 2022 16:33:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A133E40607
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A133E40607
 for <buildroot@buildroot.org>; Fri,  5 Aug 2022 16:33:38 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5864:4f9d:d5e2:80b0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id B261A19F72D;
 Fri,  5 Aug 2022 18:33:32 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 05 Aug 2022 18:33:32 +0200
Date: Fri, 5 Aug 2022 18:33:32 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220805163332.GE3621445@scaer>
References: <20220804204157.30731-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220804204157.30731-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659717216;
 bh=ZY0XGtpXXCbvccfcxTLDYqRVoPwwpHe48eozYkoQYEI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=unKD09/d1br77ic2xwJXxQ0x03Kdn9MFkj2sDzxNz+kKbH6BtEnUXIEsTZd0e6ei0
 Z5XcP7N4g99VGY9MXn8UhJRhtEIkXWC2snNcwGnFZTI3fvh7/bhdn2y2l+hE0pyR37
 /Ydwv1bfj1vuHNGisDJ5VzzTeWvyRULWxIGHe0yi4e1eFCh5ShHkcNa2g/pKOAu7gh
 HHYaNlnR01nQZMR6rtn8WFBum0sBS0xBHVudcDdBBO28w05bCuvHXw2D5T4xh8/FFM
 hX/ELfnQElhXPtgDn8FRG2CfMQYxvW++5KPPwUTHalWmAv4nDaA8ppxCsQXO2PDZtQ
 6VPHjnQ/SX6Cw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=unKD09/d
Subject: Re: [Buildroot] [PATCH 1/2] package/gcnano-binaries: create
 symlinks for libGLESv2 and libGLESv1_CM.so
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
Cc: kory.maincent@bootlin.com, Jens Kleintje <scooby22@web.de>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-08-04 22:41 +0200, Thomas Petazzoni via buildroot spake thusly:
> At least libepoxy, a user of OpenGL ES, expects libraries to be
> available as libGLESv2.so.2 and libGLESv1_CM.so.1. While other OpenGL
> implementations comply with this, gcnano-binaries does not, and
> installs its libraries directly as .so, without any ABI version,
> causing runtime failures with libepoxy or SDL2, as it tries to
> dlopen() the OpenGL ES libraries with their ABI suffix.
> 
> See for example the libepoxy code:
> 
>   https://github.com/anholt/libepoxy/blob/master/src/dispatch_common.c#L191
> 
> Fix this issue by adding the relevant symlinks.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

(this is a bit of a convoluted install command, if any...)

Regards,
Yann E. MORIN.

> ---
>  package/gcnano-binaries/gcnano-binaries.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/gcnano-binaries/gcnano-binaries.mk b/package/gcnano-binaries/gcnano-binaries.mk
> index dc309ec3c2..ce9b24cc3a 100644
> --- a/package/gcnano-binaries/gcnano-binaries.mk
> +++ b/package/gcnano-binaries/gcnano-binaries.mk
> @@ -44,10 +44,17 @@ GCNANO_BINARIES_MODULE_MAKE_OPTS = \
>  
>  GCNANO_BINARIES_USERLAND_SUBDIR = gcnano-userland-multi-$(GCNANO_BINARIES_USERLAND_VERSION)
>  
> +# This creates:
> +#   libGLESv2.so.2    -> libGLESv2.so
> +#   libGLESv1_CM.so.1 -> libGLESv1_CM.so
> +# symlinks, as most OpenGL implementations have them, and they are
> +# expected by some users such as libepoxy.
>  define GCNANO_BINARIES_INSTALL
>  	cd $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/release/drivers/ ; \
>  	find . -type f -exec $(INSTALL) -D -m 0755 {} $(1)/usr/lib/{} \; ; \
>  	find . -type l -exec cp -a {} $(1)/usr/lib \;
> +	ln -sf libGLESv2.so $(1)/usr/lib/libGLESv2.so.2
> +	ln -sf libGLESv1_CM.so $(1)/usr/lib/libGLESv1_CM.so.1
>  	mkdir -p $(1)/usr/include
>  	cp -a $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/release/include/* $(1)/usr/include/
>  	ln -sf gbm/gbm.h $(1)/usr/include/gbm.h
> -- 
> 2.37.1
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
