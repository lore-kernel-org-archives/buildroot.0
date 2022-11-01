Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D195C4332F
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 22:31:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 017C740643;
	Tue,  1 Nov 2022 22:31:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 017C740643
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bnjTJK2ZakkZ; Tue,  1 Nov 2022 22:31:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 280D1405BC;
	Tue,  1 Nov 2022 22:31:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 280D1405BC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2F7031BF3E8
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 149EC405BC
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:31:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 149EC405BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9baWPO65hlTx for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 22:31:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F4145400EF
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F4145400EF
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 22:31:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 41C66100008;
 Tue,  1 Nov 2022 22:31:45 +0000 (UTC)
Date: Tue, 1 Nov 2022 23:31:44 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221101233144.535079ab@windsurf>
In-Reply-To: <20221008134414.1305025-1-james.hilliard1@gmail.com>
References: <20221008134414.1305025-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667341905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3oh7wH6ZKgmANGeQkGbrwASieiG9FGRLTQj99P9Ncyc=;
 b=ORAZEEkBYKWbJaMhSRgABpLrQqVyfo/OxyICHZE64JJ2hF0xpHDVAh1TmrnzbwKDRM65fc
 oQCksa8uUeHjhxS7nnyN/yex+AaaibG/ea49A2cW+U89OO3f1xlGAbXu1BAuNAHyXbn9NG
 22QLcaAtP26sd0LtoaJaH3QvsFlrYC45CYF5bfbDFfLU2NTpJQqVdPFFpidTozw4RsGK0F
 k/CBpl2Pz+ULAkvzvR8QRm513pMXj67ssNqdpMDEMKf9Avr09RNSCNHVI9fC5AggPGVzlk
 iX4m0YLWgm7IgvBlCB6d3r2DVb97oPe2HTBaHgdF+AUVVoSmj06E5BWt+oGQfQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ORAZEEkB
Subject: Re: [Buildroot] [PATCH 1/1] package/ocf-linux: fix build with
 kernels up to version 4.14
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

Hello James,

On Sat,  8 Oct 2022 07:44:14 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Add patches fixing build on kernels up to version 4.14.
> 
> Depend on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15 as builds fail on 4.15
> and newer currently.

Thing is that !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15 does not guarantee
that the kernel is < 4.15. Indeed, the kernel version can be much more
recent than the kernel headers version. For example, you can be using
an external toolchain with headers 4.9... and be building a 6.0 Linux
kernel, against which the ocf-linux kernel modules will be built.. and
fail to build.

To be honest, the last release of ocf-linux was in 2017. It doesn't
build after 4.14, and even 4.14 requires patches. I would advocate for
dropping ocf-linux entirely. It was added by Gustavo back in the days,
and nobody ever cared about this package except you earlier this year
with the bump to 20171122. All other changes on ocf-linux have been
related to tree-wide cleanup/infrastructure changes.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
