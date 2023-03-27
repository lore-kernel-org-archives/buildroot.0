Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE99C7619A
	for <buildroot@archiver.kernel.org>; Mon, 27 Mar 2023 07:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73F82410DB;
	Mon, 27 Mar 2023 07:42:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73F82410DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NHOCC0oGV2Fg; Mon, 27 Mar 2023 07:42:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B00D409A0;
	Mon, 27 Mar 2023 07:42:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B00D409A0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8BF931BF2E3
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 07:42:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F85581CC3
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 07:42:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F85581CC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uqmezWZAsHXP for <buildroot@lists.busybox.net>;
 Mon, 27 Mar 2023 07:42:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66F6081CAF
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 66F6081CAF
 for <buildroot@buildroot.org>; Mon, 27 Mar 2023 07:42:27 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D95221C0016;
 Mon, 27 Mar 2023 07:42:23 +0000 (UTC)
Date: Mon, 27 Mar 2023 09:42:22 +0200
To: "Frager, Neal" <neal.frager@amd.com>
Message-ID: <20230327094222.3b11e289@windsurf>
In-Reply-To: <B1C2F9E6-C87B-4B1A-A6F9-9A312663D946@amd.com>
References: <20230326220543.057f381d@windsurf>
 <B1C2F9E6-C87B-4B1A-A6F9-9A312663D946@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1679902944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=opb8QEoHJq+czfFY35BUe+Hd9XsPGGc7J8i29gjo63g=;
 b=R0pMBwKD9APqx03BmOeBbskXEpH3kRtChORf/8pWe956dCvCcl7ng2dTZBsoc7p0EHqJwo
 7lbNm+evLaERywHO8kyxRrMajYSo7KT3LmUGbxKWy579W97bx81fMHCjwHkCR3Gli0j1ne
 OI03gy7BsZfptlVGAYOhjJr0EbYTAWZcqfPcEItjxc0nF4OeWohwRyBd2E+GhbILZPJcQR
 8y4ZM2QDE/hW4CMWqzkrDKq68067//9LXsJgeh8P3vAa6S2Yfkt3CPzzo9e2nfXVyB9NPH
 QVD9vTwNNzY5Qg7oeMAiMNsRMNad/QXfAG+zzur1nb0ODYNQKV7LDJSHr0Htkg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=R0pMBwKD
Subject: Re: [Buildroot] [PATCH v1 1/2] package/zynqmp-firmware: new package
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
Cc: "Simek, Michal" <michal.simek@amd.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 Neal Frager via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 27 Mar 2023 05:45:45 +0000
"Frager, Neal" <neal.frager@amd.com> wrote:

> I would not say this is the conclusion of our discussion, but rather
> a next step.  Once we have a microblaze compiler package, we can
> update the zynqmp-firmware package to use the included compiler by
> default or allow users to select an external one, in case they prefer
> to use the Xilinx distributed compiler.

Hm, OK. I don't know if we want to have both options of using a
compiler provided by Buildroot, or a compiler installed separately. No
strong feeling about this.

> These CFLAGS are needed for the k26 SOMs, so we will need to include
> them for the kv260 and kr260 defconfigs.  I agree with you that
> custom flags are not so nice, and hopefully Xilinx will find a better
> solution for this in future versions.
> 
> For now, I think we have to live with it.

Another solution would be to simply have a ZYNQMP_FIRMWARE option that
allows to pass custom CFLAGS, and let each defconfig handle this. Here
as well, no strong feeling about this.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
