Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8689C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 20:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DE56401B1;
	Sun, 11 Dec 2022 20:30:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DE56401B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cXg-W6Q5saHI; Sun, 11 Dec 2022 20:30:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6771040982;
	Sun, 11 Dec 2022 20:30:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6771040982
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 82CC21BF2B1
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5CEB680C67
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:30:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CEB680C67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8sC18hUYu6UB for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 20:30:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4599580C1E
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4599580C1E
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 20:30:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1139F100005;
 Sun, 11 Dec 2022 20:29:57 +0000 (UTC)
Date: Sun, 11 Dec 2022 21:29:57 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20221211212957.27aa9e19@windsurf>
In-Reply-To: <0D32AFEE-0712-48AE-A855-3FFC249371DD@benettiengineering.com>
References: <ec8d8bd9-5185-b9fb-f6cb-6aec971a5de1@mind.be>
 <0D32AFEE-0712-48AE-A855-3FFC249371DD@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670790598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LCTcclfpz0f5V/WH9lfYbPWHQ7hbyoJeTWNMqG/mbQU=;
 b=lsec/QeW2FF7PL4CAHYXBgnBhSAa/QjOboksYoTnDxiq8pYPCv2wASKYm5vETGQv2+BGoH
 7f3dsNL0EJubltGd0btgdu3rDFxC6egqrG6T8pOJE8VFyCF7PbD/heaU/ie6VWmSmOQ8dg
 VVMdNDtrZSwB/BTFJvbRRYZe1JaU9PDPDW68AQ7lbIkTJdfn73xkftfu9COVPceM18hYLF
 fJiG2St+QU5YdFNgV5qZRbFeESbSVWuGkotLmhD0PPCo0mIlbxSBnfxzOniyuUrOA0PNX5
 wdG53v4sELqSIuATgwWpLL1v1x5PBwl8wiYH4u/jR+d0BePOYiJ/il7Xz4/SXA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lsec/QeW
Subject: Re: [Buildroot] [PATCH 2/2] package/rtl8192eu: fix build failure on
 Big Endian architectures
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 29 Nov 2022 23:25:29 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> > Clearly, all of this is rubbish in Buildroot context. So what we should do is to set
> > 
> > RTL8192EU_MODULE_MAKE_OPTS = ... CONFIG_PLATFORM_I386_PC=n
> > 
> > At that point, we can set all the appropriate config options we like, which would be the -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT in USER_EXTRA_CFLAGS.  
> 
> Yes, this is another approach, but there is only a patch with my proposed solution applied [1]
> so maybe for consistency we could keep it the same, what about it?

Well, Arnout has a point that having CONFIG_PLATFORM_I386_PC=y is not
really good. So perhaps 354f9387f33b5fab023cb98e52d84d58624f0ecf also
needs to be changed like Arnout suggested?

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
