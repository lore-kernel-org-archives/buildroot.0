Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1612AC00140
	for <buildroot@archiver.kernel.org>; Sun, 21 Aug 2022 19:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B0F181AAC;
	Sun, 21 Aug 2022 19:06:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B0F181AAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EC2QFVddovHF; Sun, 21 Aug 2022 19:06:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0B3D818D4;
	Sun, 21 Aug 2022 19:06:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0B3D818D4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 357F31BF5DF
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 19:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C52F409B1
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 19:06:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C52F409B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zy3FapjMKR5K for <buildroot@lists.busybox.net>;
 Sun, 21 Aug 2022 19:06:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF4D1409C6
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BF4D1409C6
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 19:06:13 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C6AC520002;
 Sun, 21 Aug 2022 19:06:10 +0000 (UTC)
Date: Sun, 21 Aug 2022 21:06:09 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220821210609.621500c5@windsurf>
In-Reply-To: <20220820151243.GM2167049@scaer>
References: <20220819063717.33591-1-neal.frager@xilinx.com>
 <20220820151243.GM2167049@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661108772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VibW9FG5n4sMz9YFgPcnFs4cETp6XEpHLuo7PqTgeFY=;
 b=pciFOTpaf9MD2/HI50Gfp4HZmtAqxWDyxdhP4qCrHm7gm0ZS7xV3FqpChAIIUxwecN/xgd
 EOhuZfuA1MN9t7HTk3D8Zzf4Nd58ecPSNi5DNL0A1DR5+Sf1pf1Pm0El1NUO2Nz5M40gZQ
 5VuD6hiuWDZVuosAc1CBVbMDXEU4k522fhGYBEBjzpFLswYDX2X/5vbxo+BytcSCeie3v0
 I9Ya+RsgzlqDdLQe+zs6Cej5CbT3AY2Y6yolHSkq2x6y/6UoW1emBm+Fa8APljqH2r4iGZ
 1wtgWqOcDp96C94KEioaMIfTyDuxA/uY2l+qVnZSiQRyu7PPDP3IZMsdqcKn4Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pciFOTpa
Subject: Re: [Buildroot] [PATCH v1 1/3] add package/versal-firmware
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
Cc: Neal Frager <neal.frager@xilinx.com>, luca.ceresoli@bootlin.com,
 michal.simek@amd.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sat, 20 Aug 2022 17:12:43 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > +config BR2_PACKAGE_VERSAL_FIRMWARE_LOCATION
> > +	string "versal firmware location"  
> 
> The prompt should be "Custom git repository"
> 
> > +	help
> > +	  Location of a versal firmware boot.bin.
> > +
> > +	  The value should be a git repository.  
> 
> So, there is not even a default location?

For Custom Git repository options, we do not want to have a default
location. We just removed such a default location in the Xenomai
package, see e4040d0d8e1d3d3b77de582b8354eca641a0613d.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
