Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67AB7C19F28
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 17:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6FB5829FD;
	Wed,  3 Aug 2022 17:22:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6FB5829FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C7zGAcaj2HaT; Wed,  3 Aug 2022 17:22:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26A13829DC;
	Wed,  3 Aug 2022 17:22:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26A13829DC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B85C51BF281
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 17:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 932B941C33
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 17:22:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 932B941C33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PwXJCKCQJ3ku for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 17:22:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 962854049B
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 962854049B
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 17:22:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 731EF1C0005;
 Wed,  3 Aug 2022 17:22:30 +0000 (UTC)
Date: Wed, 3 Aug 2022 19:22:29 +0200
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Message-ID: <20220803192229.0356e729@windsurf>
In-Reply-To: <IA1PR12MB6210D4881185B436788BF05EA1969@IA1PR12MB6210.namprd12.prod.outlook.com>
References: <20220717200407.1400318-1-thomas.petazzoni@bootlin.com>
 <IA1PR12MB62105EDFE310AD93A55A33B6A18D9@IA1PR12MB6210.namprd12.prod.outlook.com>
 <20220718091350.4b968717@windsurf>
 <IA1PR12MB62107029D82ADA688CF7C210A18F9@IA1PR12MB6210.namprd12.prod.outlook.com>
 <20220726152108.3470eb7d@windsurf>
 <IA1PR12MB6210D4881185B436788BF05EA1969@IA1PR12MB6210.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659547351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SK07O/lowtxsU/rNivrzmAd2J7PcaaH52Y3q91CEdr0=;
 b=SsJXsdNKGZZVMpNJDeMYyzvqM0jZnUqQUwEFUiu2zDHH3T6k0wjkBVzFV8qYbOcEtBGM9T
 HXVaVKDL55oXbuN33MoWU/3/mETdeCK6tXfJwCyd+tSdfBTimJCRWDA1LwPIpYI8ccQIUg
 /KAxpVQ7nxjGCGAzaLxPmHDevaKDih5vYVEutI6HG/cpPXHD1yg+yG66xYT8mTP2zC5Ioj
 VN7EgpXQOwtToWVjDWR1ZYbaGM9sAzQpKLNNBdONJxuRqG4cJYtQC15GUsq1gIyqs4YVp1
 MCDl03kSvXjnHPAd/Apu+MAg6SIQJvF2k3LaGRlTzTzfO4C/H4AiKwZ4ZRpvWQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SsJXsdNK
Subject: Re: [Buildroot] [arc-buildroot] [PATCH] arch: remove support for
 BR2_ARC_PAGE_SIZE_4K
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 ARC Maintainers <arc-buildroot@synopsys.com>,
 Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Re-adding Buildroot mailing list in Cc.

On Thu, 28 Jul 2022 20:25:47 +0000
Alexey Brodkin <Alexey.Brodkin@synopsys.com> wrote:

> > I don't understand what you mean here. Today, we are setting
> > max-page-size, and that doesn't work because the common-page-size value
> > is higher. As I mentioned in my initial patch, passing
> > -Wl,-z,max-page-size=4096 (already done) and
> > -Wl,-z,common-page-size=4096 would most likely fix the error, but I
> > wasn't sure it was the correct thing to do.  
> 
> So, right, suggested change of explicit setup of "common-page-size=max-page-size"
> is a good fix as it is compatible with older Binutils (before the change
> referred above, i.e. before 2.38).

Could you provide the patch?

Keep in mind that this block of code:

# Explicitly set LD's "max-page-size" instead of relying on some defaults
ifeq ($(BR2_ARC_PAGE_SIZE_4K)$(BR2_ARM64_PAGE_SIZE_4K),y)
ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=4096
else ifeq ($(BR2_ARC_PAGE_SIZE_8K),y)
ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=8192
else ifeq ($(BR2_ARC_PAGE_SIZE_16K),y)
ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=16384
else ifeq ($(BR2_ARM64_PAGE_SIZE_64K),y)
ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=65536
endif

in arch/arch.mk, has been recently modified to be used for configurable
page sizes on ARM64. So, if we decide to add
-Wl,-z,common-page-size=XYZ, it also needs to work for ARM64 (I think
it should, but I just want to warn that this code is no longer
ARC-specific).

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
