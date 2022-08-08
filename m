Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98066C00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 20:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29D2340934;
	Mon,  8 Aug 2022 20:47:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29D2340934
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ybJjLGLl32Sm; Mon,  8 Aug 2022 20:47:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3D374092E;
	Mon,  8 Aug 2022 20:47:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3D374092E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1DCAF1BF283
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 20:47:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECC7A81464
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 20:47:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECC7A81464
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TYxDNO1LVFRS for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 20:47:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD46581327
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD46581327
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 20:47:35 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F233860003;
 Mon,  8 Aug 2022 20:47:32 +0000 (UTC)
Date: Mon, 8 Aug 2022 22:47:31 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220808224731.7a316fbb@windsurf>
In-Reply-To: <CAPi7W80GOh-GQzB6u11MG69qn1GLWKT4VEGrkz53S-bofiWr_g@mail.gmail.com>
References: <20220808151402.1694762-1-fontaine.fabrice@gmail.com>
 <20220808223150.704a8822@windsurf>
 <CAPi7W80GOh-GQzB6u11MG69qn1GLWKT4VEGrkz53S-bofiWr_g@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659991654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RF68iVa45OyzxG4Vyk07MLKGtzM0miOcM5uoha3bjRQ=;
 b=S46p0n3uZ9dXLDQxEpdqY6DWnZ4H0BTfm1yUs55UM/GkX4+DIdqUVJuysABS+4DmjhMNEH
 k4ikBPiohWGmcU9n+nNYmbBUcARijZRUnlFsokUpXkTVh8gvFoXNz445R3WHqgPoq3U92H
 5RoPN/cF0znfntcv+lCKmXe/PilSEOS6xKwhwmgwQ4BFTMxZVBtb2RtyQxcZ1oX8OYt5xQ
 Dc3FTgEnKRNJpkYoxP/MymY9iLFTLWI4mVF0aHo2CoZX/OSx+F9gWLsQCDNari8tXyMvQT
 Lyt4PoMDra5Ihn5wFq7aCW2/oeSHHbECTJ1vwfuHO/mREOYiiEA33WJdc0wf0Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=S46p0n3u
Subject: Re: [Buildroot] [PATCH 1/2] package/serd: bump to version 0.30.14
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 8 Aug 2022 22:39:00 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> If -Dstatic is true, -static will be added to tool_link_args to statically
> link executables:
> 
> if get_option('static')
> tool_link_args += ['-static']
> endif
> 
> So, indeed, the static option is probably only useful when both shared and
> static libraries are built (i.e. with BR2_SHARED_STATIC_LIBS) to force the
> tools to be statically linked.
> I can drop it if you want.

I'm not sure to follow you: when BR2_SHARED_STATIC_LIBS=y, we do *not*
want tools to be statically linked.

In addition, your patch was passing -Dstatic=true only when
BR2_STATIC_LIBS=y, so when BR2_SHARED_STATIC_LIBS=y was passed your
patch was passing -Dstatic=false.

I believe we should pass -Dstatic=false unconditionally. Of course,
give it a test with BR2_STATIC_LIBS=y, and see if the build works fine,
but I believe it should.

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
