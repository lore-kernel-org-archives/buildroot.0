Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 366A9C636CC
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 14:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B197741720;
	Sun,  5 Feb 2023 14:15:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B197741720
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M9-Afrhj52b6; Sun,  5 Feb 2023 14:15:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DB1841715;
	Sun,  5 Feb 2023 14:15:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DB1841715
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C9CA21BF475
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 14:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87AFF4012F
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 14:15:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87AFF4012F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KLf0LapPMtZM for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 14:15:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 255EE40124
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 255EE40124
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 14:15:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1F35140007;
 Sun,  5 Feb 2023 14:15:04 +0000 (UTC)
Date: Sun, 5 Feb 2023 15:15:02 +0100
To: Niklas Cassel via buildroot <buildroot@buildroot.org>
Message-ID: <20230205151502.07fd434d@windsurf>
In-Reply-To: <20230117153503.2075602-1-niklas.cassel@wdc.com>
References: <20230117153503.2075602-1-niklas.cassel@wdc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675606504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HuPR2Xbed0s3a1E+JFHgcDNeJGxAltwixGx4dCCyVYI=;
 b=ZWxRPXP5qcFo/233Jy0g7ptwO2vG+NObM3HNwDxOeKg0Ky1XgMkM2cUtwoMbocNH4wXgTR
 mRhtPhRnmHEV9K2vZSoOFq3lKPLx0rLlSecvSSZaRWaKCL1nApdd71JExW0q7mwc2PJoCh
 tRHa8zys1lsQeVAS7W35z+2oWPJX3jbJXvqiAZvqQXzpeSRTqDLnl7rDlV53Dzdcn0k+i2
 UUrUBqgf5M/fhwPpXU3+rfJSB73NJWPolMOPzuWiUDB4Ekt4+zZO8KiIbD+MSHA2nYAMlW
 o8BPEl8rzthZ/X8mKoqLNkKsXPb5u2WOnsDSe0RFkENOFqtrPFHn0LBTjQtz5A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZWxRPXP5
Subject: Re: [Buildroot] [PATCH] package/elf2flt: fix error when building
 gdb for target on m68k
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Niklas,

On Tue, 17 Jan 2023 16:35:03 +0100
Niklas Cassel via buildroot <buildroot@buildroot.org> wrote:

> Thomas reported that m68k fails to build when enabling BR2_PACKAGE_GDB.
> 
> It fails when building gdb for the target with the following error:
> elf2flt: ERROR: text=0x3c826 overlaps data=0x256e0 ?
> 
> It turns out that the gdb binary has another problematic input section
> (.gcc_except_table), which causes elf2flt to try to append to the .text
> output section, after it has already moved on with appending sections
> to the .data output section.
> 
> elf2flt cannot append to a previous output section once it has moved on
> to another output section.
> 
> Update the existing elf2flt patch to also add an exception for
> .gcc_except_table.
> 
> Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> ---
>  ...l-error-regression-on-m68k-xtensa-ri.patch | 47 ++++++++++---------
>  1 file changed, 24 insertions(+), 23 deletions(-)

Many, many thanks for looking into this. It's a bit annoying that those
special sections have to be special-cased. Hopefully this will not
encounter too many of those special cases.

In the mean time, I've applied your patch to master. Thanks again!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
