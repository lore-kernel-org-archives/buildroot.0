Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A80CC3DA79
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 22:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02C20400F8;
	Thu, 29 Dec 2022 22:43:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02C20400F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e9hEXvSggA6q; Thu, 29 Dec 2022 22:43:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DE2040227;
	Thu, 29 Dec 2022 22:43:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DE2040227
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C9D3B1BF287
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 22:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B2168196E
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 22:43:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B2168196E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TDR4jaiB4x9o for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 22:43:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F155F8195D
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F155F8195D
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 22:43:02 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3807760002;
 Thu, 29 Dec 2022 22:42:59 +0000 (UTC)
Date: Thu, 29 Dec 2022 23:42:57 +0100
To: "Frager, Neal" <neal.frager@amd.com>
Message-ID: <20221229234257.345ab5fc@booty>
In-Reply-To: <CH2PR12MB50049E8BC94D43962394656BF0E89@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20221209194043.28673-1-brandon.maier@collins.com>
 <20221212103136.71c0a850@booty>
 <BN0P110MB16733493900DDC40600F15A2EBE29@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
 <CH2PR12MB50049E8BC94D43962394656BF0E89@CH2PR12MB5004.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672353779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+E3x2uzjtWnh4/mY2TfAzxD09fxx2WXDv8yP8d6yZBM=;
 b=cLLGDLAAwcVjE8Y5Op3FO6UQkk5uHHXzKh5LZwWPSxci3BKb/MRpc/jIGIoQ+HXbzdFZuY
 IVQPGdxg//DdK3ShnwnieQnYN5mkOcmFhAvwzvqLj+o9W/jxO0JUQAlvDBoIV1R++Vw2mA
 Z8Bmv7PzToP2XfixvTGF8s29esTi0U+2cQeFgZ2jVK406cuuyBQzemwNZXA5fp3GsPY/61
 z/X63sEEkze5vaaAN1tVLyzKUsw0w9RWryerqocUPHmjhpcBzlPzTASs6OnTjiuNat5GUt
 hzahMWuP5H0iklupoGn6/IfvDDXvBNYqqu5vhXNt0CP5TrmfagRzVdsmeIT0iQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cLLGDLAA
Subject: Re: [Buildroot] [External] Re: [PATCH 1/1] boot/uboot/uboot.mk:
 support binary pm_cfg_obj
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
Cc: "Maier,
 Brandon L                            Collins" <Brandon.Maier@collins.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Thu, 22 Dec 2022 14:37:52 +0000
"Frager, Neal" <neal.frager@amd.com> wrote:

> Hi Brandon, Luca,
> 
> > Can you describe a use case where this would be useful? While I 
> > intuitively understand there _might_ be some, I cannot find any good 
> > example based on my experience.
> > 
> > Building the pm_cfg_obj from source code is very easily done by 
> > Buildroot, unlike building the PMUFW. Additionally one PMUFW binary 
> > can be used on multiple zynqmp hardware, while the cfg obj is very 
> > likely to change across different projects, and a somewhat readable 
> > text file is way more understandable than a binary blob.  
>  
> > One of our developers was having issues getting their pm_cfg_obj.c to compile with zynqmp_pm_cfg_obj_convert.py, so they decided to compile it manually instead. This patch set was the result when they asked why Buildroot wouldn't accept their bin file. However for our team this patch is now moot, as I ported your U-Boot fix for building Vivado 2021.x to their U-Boot and that fixed the issue ;)  
> 
> > I decided to send this patch anyway, as I already tested it and it seems like a reasonable thing to support anyway.  
> 
> As this patch is still pending, I thought I would change my neutral position on it.
> 
> At the moment, the defines and format of the pm_cfg_obj.c file could change from one Xilinx release to the next.  zynqmp should
> be mature enough that these changes are minor, but even a single new define being added to the pm_cfg_obj.c could potentially 
> break the zynqmp_pm_cfg_obj_convert.py.  Since users might use any version of the Xilinx tools with buildroot, there always could
> be an issue as Brandon has experienced.
> 
> For this reason, I believe it is worth having the support for users to supply a pre-compiled pm_cfg_obj.bin, and I would like to see
> Brandon's patch included in buildroot.

As you wrote, "zynqmp should be mature enough that these changes are
minor", so I think we should optimistically predict that no breaking
changes are going to happen. We should reconsider this only in case
such issues will start happening in the future creating a major
annoyance.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
