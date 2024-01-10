Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B47C4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 20:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 262EA435DF;
	Wed, 10 Jan 2024 20:11:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 262EA435DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MjJvR1l4tvvT; Wed, 10 Jan 2024 20:11:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20B5D436E5;
	Wed, 10 Jan 2024 20:11:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20B5D436E5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3BEA31BF5B3
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:11:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1472A613FF
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:11:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1472A613FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SRUVxlcgyWAK for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 20:11:28 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4DF59605EA
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:11:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DF59605EA
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 31637B005AF;
 Wed, 10 Jan 2024 21:11:23 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 10 Jan 2024 21:11:22 +0100
Date: Wed, 10 Jan 2024 21:11:22 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <ZZ756kxkevit-FJz@landeda>
References: <20231228203217.4C7EC81840@busybox.osuosl.org>
 <87edepasjd.fsf@48ers.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87edepasjd.fsf@48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704917485;
 bh=0GWpexA2aPfVqFxxvFQ18M7FOjrk9E1s3scUJEUF58E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gmeFAM0SLRk7t7aKI66NgRbPDgDG04P+YdjlixFlb270/WH21JFUpFF1FGmYBWxaT
 noBb2pqU5PwrpJ6cX4MChp4R+D5tVieD7cTZaUO2E2lCtCy1R0LbSu6yzxpkOdlRHc
 EP34EqS/hDj33Yw1onLfb3PD5MBiI147ZF2zuvRuzP0gVi1SLujv5VfXuAYwTQkPG1
 dUl2E7D73+MxBx1STOhA1n3dwBjHuQNunbyRLZz/mVO4skK/yeotQiwJj3MEBeMNa+
 WpNkNEWtAT8gObBCyEbdQ8kTjRs2HHS4wN9wa4Fr1KUXiGoumDSGoD3hO6Uq3R43lq
 0wSLq3Dlu+hpw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gmeFAM0S
Subject: Re: [Buildroot] [git commit] package/qt6base: remove
 $(TARGET_DIR)/usr/mkspecs in target-finalize
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

Peter, All,

On 2024-01-10 20:37 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  > qt6base installs things in /usr/mkspecs, but also the soon to be added
>  > qt6core5compat, and the existing package qwt as well.
[--SNIP--]
>  > diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
>  > index 9f0b78655f..f344ca4e3a 100644
>  > --- a/package/qwt/qwt.mk
>  > +++ b/package/qwt/qwt.mk
>  > @@ -58,7 +58,6 @@ endef
>  
>  >  define QWT_INSTALL_TARGET_CMDS
>  >  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install INSTALL_ROOT=$(TARGET_DIR)
>  > -	rm -Rf $(TARGET_DIR)/usr/mkspecs
> Hmm, qwt is a qt5 package, so this looks odd?

Ah, indeed, I didn't realise that. The original was a hard-coded removal
of $(TARGET_DIR)/usr/mkspecs, so that would have indeed taken care of
the removal for qwt, qt6base and any other qt6 package.

However, I changed it to a qt6base target-finalize hook when aplying,
and I did not realise qwt was not a qt6 package.

For Qt6, the /usr/mkspec is really a qt6base thing, so I still believe
it makes sense that it is a qt6base target-fionalize hook. For qwt, this
is an issue specific to qwt, not qt5base, so it makes sense to keep it
as an ad-goc fixup.

I'll revert the qwt part.

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
