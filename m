Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBACC433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 21:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 185BB403C2;
	Sat,  5 Nov 2022 21:12:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 185BB403C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7X0bZ_xZKB-W; Sat,  5 Nov 2022 21:12:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4588A4032A;
	Sat,  5 Nov 2022 21:12:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4588A4032A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BE8401BF283
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 21:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 821E3408C8
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 21:12:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 821E3408C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rbCaWzqKBTA2 for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 21:12:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D3E5408BD
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D3E5408BD
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 21:12:15 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1FBBB60009;
 Sat,  5 Nov 2022 21:12:12 +0000 (UTC)
Date: Sat, 5 Nov 2022 22:12:11 +0100
To: unixmania@gmail.com
Message-ID: <20221105221211.53d7c53a@windsurf>
In-Reply-To: <20221104235727.587650-2-unixmania@gmail.com>
References: <20221104235727.587650-1-unixmania@gmail.com>
 <20221104235727.587650-2-unixmania@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667682733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0IyAZqm8ATCvirWP/8rpL/SZlXdm+y1aGMqdJgi5Ozs=;
 b=lVJ490ssR4MkDbRdiNgqX7I/B5uYyfEDfzU/HK8CMHfZTJ8V6r5AtZ5w4LdNS7JxuAovHm
 SJiRzN9GKyyrudUAIvYzS30awCLh4DoyLgs+BSXmgyiDUjFeNt3Fi0AuaA6WhKUTz+ivHO
 colAhWr7XE/meYVs1OyT2OA37uDnF6PKYWSCpfw72ta2VjaEVVQYdWhUQdOtDKh0+CL5hZ
 aLjfrgE84oSXt820xmmf8IVgBf9NSuShogNqcPZB3yTVloiRMljryEWngvXRq5YzDFt89m
 WnJMDPXP8AuegxlAIczEdpZQS9FGNCmm1pfeX0MBrJFya3bU6qTmY7wPSsta1g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lVJ490ss
Subject: Re: [Buildroot] [PATCH 1/3] package/qemu: make "custom targets"
 config depend on !BR2_STATIC_LIBS
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Carlos,

On Fri,  4 Nov 2022 20:57:25 -0300
unixmania@gmail.com wrote:

> From: Carlos Santos <unixmania@gmail.com>
> 
> Custom targets selects system and Linux user-land emulation, which in
> their turn require shared libraries.
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>

Could you clarify which configuration fails to build?

>  config BR2_PACKAGE_QEMU_CUSTOM_TARGETS
>  	string "Enable specific targets"
> +	depends on !BR2_STATIC_LIBS # dtc

What is the relationship with DTC here?

Also, when we have a !BR2_STATIC_LIBS dependency, we normally add a
Config.in comment:

comment "specific targets need a toolchain w/ shared library"
	depends on BR2_STATIC_LIBS

But really the most important thing is to get more details to
understand better the problem.

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
