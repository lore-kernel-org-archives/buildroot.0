Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C1EC61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 09:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9BA0D40B70;
	Wed, 22 Feb 2023 09:41:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BA0D40B70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gnyc6ZAi8kkg; Wed, 22 Feb 2023 09:41:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05F6E404DA;
	Wed, 22 Feb 2023 09:41:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05F6E404DA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8848B1BF3F9
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 09:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F7B640B61
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 09:41:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F7B640B61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id swgddyelXOAI for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 09:41:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9871404DA
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C9871404DA
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 09:41:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AAB22FF80D;
 Wed, 22 Feb 2023 09:41:25 +0000 (UTC)
Date: Wed, 22 Feb 2023 10:41:22 +0100
To: Andrei Cherniaev <cherniaev.andrei@kairo.space>
Message-ID: <20230222104122.6eff1ef1@windsurf>
In-Reply-To: <167705825735.1345689.5559147157105378409@wmail10.mailplug.com>
References: <167705825735.1345689.5559147157105378409@wmail10.mailplug.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677058885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IiR0eqzcUsWERvTf+2ys8lnYAl8hVDvMk4f/MXrO4Y0=;
 b=LX8SWCSWs58ze9CgpaLG1f5R16aSKQjKWdKfl0W4B7wVjonG/p7uskac8tIXnV8Qo0YhSL
 6G23MeSbyy+RcZsD8wT7le5AhM063+JP1kt4G/7wWyCQo8zqHVu6O49GFUK1Ek6O8KAcG5
 kDGYl/CZ0glGw4iT72rjnwL4+OV0y3E+oKpYdd5u2iiPCpcp8arilYkGRTIimserp9Tedq
 xKGMdZn21yTiLfdhdLJQwh5fSzDxa68r9ozxtOTjBBxUzqXXdmGyxmryjdLdKAl+MGK6Nv
 eno9Sj2WowLLRf/RwJLUMvfKykWw7VLZDZp/NfkbNvuvRARCMbw/4tZDhaGEmw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LX8SWCSW
Subject: Re: [Buildroot] [RE]Re: [PATCH] boot/grub2: add information where
 isconfiguration file
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Andrei,

Sorry but the plain text version of your e-mail is unreadable. Could
you use an e-mail client that sends a proper plain text version of its
e-mails?

Thanks a lot,

Thomas Petazzoni

On Wed, 22 Feb 2023 18:30:55 +0900
Andrei Cherniaev <cherniaev.andrei@kairo.space> wrote:

> Hello Thomas Petazzoni"boot/grub2/grub.cfg: it is part of Buildroot itself, and you probably don't want to have project-specific changes in there."You say that I try to set project-specific settings. Look at Buildroot, it set project-specific set default="0"set timeout="5"Why? Why 5, not 6? Buildroot shouldn't set project-specific settings, isn't it? May be maintainer should just removeset default="0"set timeout="5"from grub.cfg ?Andrei Cherniaev----- Original Message -----From : Thomas Petazzoni <thomas.petazzoni@bootlin.com>To : "AndreiCherniaev" <cherniaev.andrei@kairo.space>Cc : <buildroot@buildroot.org>Sent : 2023-02-22 07:02:02Subject : Re: [Buildroot] [PATCH] boot/grub2: add information where isconfiguration fileHello Andrei,On Mon,  9 Jan 2023 16:33:52 +0900AndreiCherniaev <cherniaev.andrei@kairo.space> wrote:> diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in> index 92b5dd501b..bf0400c08f 100644> --- a/boot/grub2/Config.in> +++ b/boot/grub2/Config.in> @@ -125,6 +125
 ,7 @@ config BR2_TARGET_GRUB2_BUILTIN_CONFIG_PC>  	  into the Grub image itself. This allows to set the root>  	  device and other configuration parameters, but however menu>  	  entries cannot be described in this embedded configuration.> +	  Use boot/grub2/grub.cfg to edit menu entries.Actually no, you probably don't want to change boot/grub2/grub.cfg: itis part of Buildroot itself, and you probably don't want to haveproject-specific changes in there.Instead, you should override it using a rootfs overlay (if grub.cfg isin $(TARGET_DIR)/boot) or a post-build/post-image script (if it's inthe EFI partition).I have nevertheless applied your patch, but after tweaking the messagein the help text, and moving it to the main Grub2 option. See:  https://gitlab.com/buildroot.org/buildroot/-/commit/7692d5beb2d9e4d0b463f0f26a177829e5bcc1ecBest regards,Thomas Petazzoni-- Thomas Petazzoni, co-owner and CEO, BootlinEmbedded Linux and Kernel engineering and traininghttps://bootlin.com


-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
