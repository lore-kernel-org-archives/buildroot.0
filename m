Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9C5C2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 15:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1906460D9C;
	Sat, 17 May 2025 15:07:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9c4ghMEI56ej; Sat, 17 May 2025 15:07:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D00C60828
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D00C60828;
	Sat, 17 May 2025 15:07:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DB80C1DE
 for <buildroot@buildroot.org>; Sat, 17 May 2025 15:07:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD1E460828
 for <buildroot@buildroot.org>; Sat, 17 May 2025 15:07:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MvsMJ7FRWyNk for <buildroot@buildroot.org>;
 Sat, 17 May 2025 15:07:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EA4C460754
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA4C460754
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA4C460754
 for <buildroot@buildroot.org>; Sat, 17 May 2025 15:07:32 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 2256919F73B;
 Sat, 17 May 2025 17:07:29 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 17 May 2025 17:07:25 +0200
Date: Sat, 17 May 2025 17:07:25 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: buildroot@buildroot.org
Message-ID: <aCimLWtydyZb0lxf@landeda>
References: <cover.1747241900.git.yann.morin.1998@free.fr>
 <cc940dccb8f864ed0718fcc655fd972a49f3c5d4.1747241900.git.yann.morin.1998@free.fr>
 <447ef018-8c6c-4800-9013-0239886c9da1@rnout.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <447ef018-8c6c-4800-9013-0239886c9da1@rnout.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747494451;
 bh=DqQjfwmzlQQPeI1OzUTo01j3/SOFlgl3dWC1YNE+wE4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CfRDcoSOfkGmQVkAse5PBGXpgztAZTyW3wRMHCrEtSnULUaCBWPVoXnTV3gKkMiGa
 X4Pfo8icZEZ3+80cZv4YP72lep7OHFgXU2x1rpgN8UrXiF4o8CbUzix1gHdEAUBxgJ
 BkRknSSUaJK9pMSnZ1LJk6xM0UpwZnAxhBb3GYFfRhDkdSh9NtLV2A0Gt+E2L58LXh
 K8C3ub6isnZPA06YsXZntGDRGGxTMUKpht6JAtdJXwO4HqAYgO+JCMesx9oOxjrJNJ
 W1k7my3oT+47GABPRWNY7frHhp+Q2zxJHLVlIcAanfkjmDKwFFLeA/jA4J0WL8kM8z
 brKGfj3596zcQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CfRDcoSO
Subject: Re: [Buildroot] [PATCH 07/13] support/scripts;
 teach check-merged what to check
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2025-05-17 12:24 +0200, Arnout Vandecappelle spake thusly:
> On 14/05/2025 18:58, Yann E. MORIN wrote:
> > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
[--SNIP--]
> > diff --git a/package/skeleton-custom/skeleton-custom.mk b/package/skeleton-custom/skeleton-custom.mk
> > index 7d64959711..e583d2d731 100644
> > --- a/package/skeleton-custom/skeleton-custom.mk
> > +++ b/package/skeleton-custom/skeleton-custom.mk
> > @@ -25,10 +25,11 @@ endif
> >   # For a merged /usr, ensure that /lib, /bin and /sbin and their /usr
> >   # counterparts are appropriately setup as symlinks ones to the others.
> > -ifeq ($(BR2_ROOTFS_MERGED_USR),y)
> >   SKELETON_CUSTOM_NOT_MERGED_USR_DIRS = \
> > -	$(shell support/scripts/check-merged $(SKELETON_CUSTOM_PATH))
> > -endif # merged /usr
> > +	$(shell support/scripts/check-merged \
> > +		$(SKELETON_CUSTOM_PATH) \
> > +		$(if $(BR2_ROOTFS_MERGED_USR),merged-usr) \
> > +	)
> 
>  While you're anyway working on this: I think there's little point of doing
> this as a "preliminary" check, I think it's fine to do this check while
> "building" the custom skeleton (i.e. in
> SKELETON_CUSTOM_INSTALL_TARGET_CMDS).
> 
>  That would allow us to move the error message to the check-merged script
> itself, and let it return 1 in case it's not properly merged. And with that,
> both instances can simply call the script without capturing its output. It's
> going to save +-10 lines of code and make things easier to understand IMHO.

I was considering something in that spirit, so your suggesting it just
confirms that it is a good idea, and I'll look into doing that.

> >   ifeq ($(BR2_PACKAGE_SKELETON_CUSTOM)$(BR_BUILDING),yy)
> >   ifneq ($(SKELETON_CUSTOM_NOT_MERGED_USR_DIRS),)
> > diff --git a/support/scripts/check-merged b/support/scripts/check-merged
> > index 9459d975fe..7fea4e1dea 100755
> > --- a/support/scripts/check-merged
> > +++ b/support/scripts/check-merged
> > @@ -11,12 +11,14 @@
> >   #
> >   # Input:
> >   #   $1:     the root directory (skeleton, overlay) to check
> > +#   $*:     the list of merged checks to perform: merged-usr
> 
>  If you make this an option (i.e. --merged-usr), then we can replace $1 with
> a $* that covers all directories, and we can get rid of the foreach in
> Makefile's check of the overlays, and that code could simplify to:
> 
> 	@$(call MESSAGE,"Sanity check in overlays)
> 	support/scripts/check-merged \
> 		$(if $(BR2_ROOTFS_MERGED_USR),--merged-usr) \
> 		$(call qstrip,$(BR2_ROOTFS_OVERLAY))
> 
>  Of course, there's a risk that I'm overengineering things, so feel free to
> ignore my suggestions.

I also like it a bit better, indeed. Let's see what I can come up
with...

Thanks.

Regards,
Yann E. MORIN.

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
