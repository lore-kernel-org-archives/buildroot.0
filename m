Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FC7C04FDE
	for <buildroot@archiver.kernel.org>; Tue, 13 Dec 2022 08:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A98C408DA;
	Tue, 13 Dec 2022 08:23:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A98C408DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e-0tIhco6We8; Tue, 13 Dec 2022 08:23:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE670408D8;
	Tue, 13 Dec 2022 08:23:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE670408D8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 650A81BF3A4
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 08:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2AF9460B27
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 08:23:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AF9460B27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SHs6hoJbEANw for <buildroot@lists.busybox.net>;
 Tue, 13 Dec 2022 08:23:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B203F60AC0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B203F60AC0
 for <buildroot@buildroot.org>; Tue, 13 Dec 2022 08:23:29 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8D78524000D;
 Tue, 13 Dec 2022 08:23:26 +0000 (UTC)
Date: Tue, 13 Dec 2022 09:23:25 +0100
To: "Frager, Neal" <neal.frager@amd.com>
Message-ID: <20221213092325.15176bbb@booty>
In-Reply-To: <CH2PR12MB500436FEFB9A1E70F891A504F0E29@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20221209194043.28673-1-brandon.maier@collins.com>
 <20221212103136.71c0a850@booty>
 <CH2PR12MB500436FEFB9A1E70F891A504F0E29@CH2PR12MB5004.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670919807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=45EyRGN3c1Rq/79XNIDcwIqsQaj6ChWEZLW+9r8ztHQ=;
 b=QEJdbJ2a5w2XnUzq/okH2R5T8M0n3mFCnBJ3490k6smF5NYg9qRjS7Gm/RXihfL5v2XA9m
 vkmZAcoZn5zCnGV+ETC9OcTfv9KzdRA062mw5iAdlZXVvxHWzb+AD1kblfX2YC7sYA93gD
 cStZcrQ7I7ypJs1N0JxLQpZj7bFfj8gx4gF4/rjoYIDfItKog4yU9qmbEHAw/pNpzyEp2E
 k0WZKen0JvH5yjds5opn0YDJsmmSy1vf4bIpzqSdAPL5PmFgGF6HYpR0hRpfhoejWLDD8F
 RisuOJWJgL9JM+lJeLtRPx2omUBxEZB7ARG8DjBzONEAuDCYGb/ashl888I2uw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QEJdbJ2a
Subject: Re: [Buildroot] [PATCH 1/1] boot/uboot/uboot.mk: support binary
 pm_cfg_obj
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
Cc: Brandon Maier <brandon.maier@collins.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On Mon, 12 Dec 2022 12:52:37 +0000
"Frager, Neal" <neal.frager@amd.com> wrote:

> Hi Luca,
> 
> > BR2_TARGET_UBOOT_ZYNQMP_PM_CFG only works with C files, as it always 
> > tries to process them through tools/zynqmp_pm_cfg_obj_convert.py. 
> > Rework the logic so if the pm_cfg_obj isn't a C file, it is provided 
> > directly to U-Boot.  
> 
> > Can you describe a use case where this would be useful? While I intuitively understand there _might_ be some, I cannot find any good example based on my experience.  
> 
> > Building the pm_cfg_obj from source code is very easily done by Buildroot, unlike building the PMUFW. Additionally one PMUFW binary can be used on multiple zynqmp hardware, while the cfg obj is very likely to change across different projects, and a somewhat readable text file is way more understandable than a binary blob.  
> 
> I believe Brandon should weigh in on this with his opinion as well.  As I thought about it this morning, I just wanted to share my two cents for what they are worth.
> 
> I agree with you that most users would want to build everything with buildroot, if they could.  Right now, we support using pmufw binaries only because we do not have a solution for building the pmufw itself with buildroot.
> If users could build the pmufw itself with buildroot, I am sure most of them would.
> 
> However, at the same time, does Brandon's patch really hurt anything?  By allowing users to provide a pre-built pm_cfg_obj binary blob, it does not prevent users from still providing a c file.
> Basically, it allows for the capability of building the pm_cfg_obj.c file with Xilinx tools and just providing the binary blob for being included in the spl/boot.bin by buildroot without removing any capability.
> 
> So from my view, this patch may not be critical, but it does not break anything either.  I am ok with whatever you and Brandon decide about committing it.

I think any line of code that is not very useful (or not useful at all)
does hurt. People have to maintain it, code is less readable, etc.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
