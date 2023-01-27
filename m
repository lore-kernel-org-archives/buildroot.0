Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E8CFC38142
	for <buildroot@archiver.kernel.org>; Fri, 27 Jan 2023 08:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E67B26120E;
	Fri, 27 Jan 2023 08:21:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E67B26120E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0WLfZ53tzkaf; Fri, 27 Jan 2023 08:21:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D40E611FC;
	Fri, 27 Jan 2023 08:21:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D40E611FC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 964731BF363
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 08:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 589AC82871
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 08:21:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 589AC82871
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KjZx7dFHaklp for <buildroot@lists.busybox.net>;
 Fri, 27 Jan 2023 08:21:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BEBC82868
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2BEBC82868
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 08:21:16 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EBD2EFF805;
 Fri, 27 Jan 2023 08:21:12 +0000 (UTC)
Date: Fri, 27 Jan 2023 09:21:11 +0100
To: "Frager, Neal" <neal.frager@amd.com>
Message-ID: <20230127092111.76a3d867@booty>
In-Reply-To: <CH2PR12MB500452D43450E31376BC6472F0C99@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20221215111831.11956-1-neal.frager@amd.com>
 <20230124091850.0cabaa3e@booty>
 <CH2PR12MB500452D43450E31376BC6472F0C99@CH2PR12MB5004.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1674807673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j/jEMs68i1kJKHZ9Z+EingJz8bYl3HFy/ZGmSmzVivo=;
 b=aH6pHZsfkiWFLzZaDFmvDFwUY5vYaXd/amHlws+ZjO2ZPLV2Ia9OR8ziKErfZOhzGRHUDZ
 2K+BuIxWacl3c7fReynFbKZagtH5mhuup/TuBv8UABB5kReK3W9iMBJSn03UDDTYP67Pit
 70D2Cn68umustldwI7KEcFXNQuTR41uLg6lCkBzVomcW3UCg+bVQKTgVhGsX1WyTwWZbLV
 z3ZSju/J3xr8Jdu2OLFpNdoQ2eThlOx0wSjvG9XPe3VjuaD7PRS6d1DBY97pGm5Vx6YY9t
 LLo+ibgUXG183qYDbsERDz1AAAe2hm7h634HSJWXJVL0StTMLDRuB0LyCsAKpA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aH6pHZsf
Subject: Re: [Buildroot] [PATCH v2 1/1] board/zynqmp/kria/uboot.fragment:
 remove unnecessary configs
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: "Simek, Michal" <michal.simek@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On Tue, 24 Jan 2023 08:26:27 +0000
"Frager, Neal" <neal.frager@amd.com> wrote:

> Hi Luca,
> 
> > Reduce the configs in the kria/uboot.fragment to only what is necessary.
> > 
> > This patch has been build and run tested on a kria kv260 starter kit.
> > 
> > Signed-off-by: Neal Frager <neal.frager@amd.com>  
> 
> > Apologies for the delay. I was hoping to test this patch, but I'm not yet there, so for the moment I have a question below.  
> 
> No problem.
> 
> > ---
> > V1->V2:
> >   - CONFIG_DTB_RESELECT is no longer removed
> > ---
> >  board/zynqmp/kria/uboot.fragment | 4 ----
> >  1 file changed, 4 deletions(-)
> > 
> > diff --git a/board/zynqmp/kria/uboot.fragment 
> > b/board/zynqmp/kria/uboot.fragment
> > index 9e32edfb36..a6a262a562 100644
> > --- a/board/zynqmp/kria/uboot.fragment
> > +++ b/board/zynqmp/kria/uboot.fragment
> > @@ -6,9 +6,5 @@ CONFIG_PHY=y
> >  CONFIG_PHY_XILINX_ZYNQMP=y
> >  CONFIG_PINCTRL=y
> >  CONFIG_PINCONF=y
> > -CONFIG_POWER_DOMAIN=y
> > -CONFIG_ZYNQMP_POWER_DOMAIN=y
> > -CONFIG_DM_RESET=y
> > -CONFIG_RESET_ZYNQMP=y  
> 
> > Does this prevent the 'reset' command in U-Boot from working?  
> 
> This patch actually has zero effect on functionality.  These 4 u-boot configs are already included in the xilinx_zynqmp_virt_defconfig.

I see, so the patch is fine. I would add the above line to the
commit message to make it clear. You can send a v3 unless some
maintainers is willing to do it while applying.

With that added:

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
