Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC08C04A95
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 10:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C0F440275;
	Sun, 25 Sep 2022 10:13:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C0F440275
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T8jnFDp8uR0A; Sun, 25 Sep 2022 10:13:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FE6F401CF;
	Sun, 25 Sep 2022 10:13:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FE6F401CF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5E5011BF2AF
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 10:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30E6082A56
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 10:13:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30E6082A56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dD-_rTEud0qV for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 10:13:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CC1982AEF
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8CC1982AEF
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 10:13:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2297560002;
 Sun, 25 Sep 2022 10:13:03 +0000 (UTC)
Date: Sun, 25 Sep 2022 12:13:02 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220925121302.6e9aa48d@windsurf>
In-Reply-To: <20220925100355.GG1127102@scaer>
References: <20220925090920.1585682-1-thomas.petazzoni@bootlin.com>
 <20220925090920.1585682-3-thomas.petazzoni@bootlin.com>
 <20220925100355.GG1127102@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664100783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M4jK4p7ZQwUqko+PzQOGJcK9POGVRY+FdJisG49NLnw=;
 b=Xwf+JolAmvFeSn4ae5fgmZHEdndfDxoaYjljpYzkfnYdnuyL9f30SBp9qCI0ooAfbns7WP
 4/rn+TRyLvxi9A4RzDzRwd03fA1ZTUc9c1b88WOlIZp3sDCenpzzFI6+lW/URxlci1YSpm
 BJsXridwTQK0Q5HIXCyK8h+FTdoE+u6WYJJRehTp8bVMxBS0Z8WPfFg8sQ9/6uSXv9gr8I
 V6/5wVN7SqB/pHDl9wpPMHXy6uiwnAO0jCWQgY6XUTqIPTZBcsa3srk0MU5vSi8ApugGuu
 wacCQCsdjLJf1f3eaq3jdM7pOaPRxsE6mzQBA/9svjNSeTjs8cg9b99/rlNgPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Xwf+JolA
Subject: Re: [Buildroot] [PATCH v2 2/5] Revert "arch/xtensa: custom
 configuration requires an overlay"
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sun, 25 Sep 2022 12:03:55 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> As 4cbf7336914f explained, an empty overlay is equivalent to using the
> fsf variant, so in that case, there would be no point in asking for a
> custom core to begin with, and Max Filipov seemed to agree:
>     https://lore.kernel.org/buildroot/CAMo8BfKHKuVC86uOwP0z8CzE425q7u0B_q6jdeU0Rw9upaiY=Q@mail.gmail.com/
> 
> So, I think we are maybe taking the issue from the wrong side here. We
> should forbid an empty overlay only when using our internal toolchain
> for a custom xtensa core. I.e.:
> 
>     diff --git a/arch/arch.mk.xtensa b/arch/arch.mk.xtensa
>     index 7b6c59cecd..1799528a93 100644
>     --- a/arch/arch.mk.xtensa
>     +++ b/arch/arch.mk.xtensa
>     @@ -1,8 +1,10 @@
>      BR_ARCH_XTENSA_OVERLAY_FILE = $(call qstrip,$(BR2_XTENSA_OVERLAY_FILE))
>      
>     -ifeq ($(BR_BUILDING)$(BR2_XTENSA_CUSTOM):$(BR_ARCH_XTENSA_OVERLAY_FILE),yy:)
>     +ifeq ($(BR_BUILDING)$(BR2_TOOLCHAIN_BUILDROOT),yy)
>     +ifeq ($(BR_ARCH_XTENSA_OVERLAY_FILE),)
>      $(error No xtensa overlay file provided. Check your BR2_XTENSA_OVERLAY_FILE setting)
>      endif
>     +endif

You're right, this seems to be a better approach. In the case of an
internal toolchain with custom core, it means the user still sees the
little/big endian choice, but if he hasn't specified an overlay, the
build will be aborted early on.

I guess I'm on for a v3!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
