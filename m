Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A73FECAAA1
	for <buildroot@archiver.kernel.org>; Fri, 28 Oct 2022 06:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9858E81493;
	Fri, 28 Oct 2022 06:44:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9858E81493
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q24upSGQZqj0; Fri, 28 Oct 2022 06:44:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2433813EC;
	Fri, 28 Oct 2022 06:44:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2433813EC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C13C51BF860
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F328410C8
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:44:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F328410C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t74AH3BiaIcy for <buildroot@lists.busybox.net>;
 Fri, 28 Oct 2022 06:44:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C003410C7
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1C003410C7
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 06:44:43 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 275431C0006;
 Fri, 28 Oct 2022 06:44:41 +0000 (UTC)
Date: Fri, 28 Oct 2022 08:44:39 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221028084439.36374fd6@windsurf>
In-Reply-To: <20221016211517.58308-1-fontaine.fabrice@gmail.com>
References: <20221016211517.58308-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666939481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6pvK8yUCUvE+mGKE59sCQ8n6SbB0i3wnHg9y2ukYn4A=;
 b=LS54DfmRisxMFcbaJ0ljaJwtaGb9RJKTkf5QE+nU6SRsse+Zp8RxcmCoaDr+0RIgsZrNHd
 qnFrqhcXMYNxzoVq5HLMmrIH619DIE/748UY8Vbo+qLJdAlhNwsQyNWeHz0o7lE6SutC1P
 hLdltoHO1pvMwK/vA5tZ7vswz4zgZ7POGuaGRPQ+PF7EartSayDMEMDOEBvVGdwXtYgmpx
 bM0SPXiITkfxl5ZkHfCLUBuHWBqBKd45nXrp+VpEgiDVXi8ZcvMAxBUF9cLEhHS2Iof8eJ
 M3CRoeLC+ceGfEDoaC3srCY4WHkcs0xeXerNvjESWIyaEIpHR91fW2NxU11c2w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LS54DfmR
Subject: Re: [Buildroot] [PATCH 1/1] package/libpfm4: bump to version 4.12.0
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

On Sun, 16 Oct 2022 23:15:17 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Major updates:
>  - Add IBM Power10 core PMU support
>  - Add Intel IcelakeX core PMU support
>  - Add Intel SapphireRapid core PMU support
>  - Add Intel SapphireRapid RAPL PMU support
>  - Update Intel Icelake RAPL PMU support
>  - Add support HiSilicon Kunpeng uncore PMUs
>  - Add support HiSilicon Kunpeng core PMU
>  - Remove arm_fujitsu_a64fx_support for ARM(32 bit)
>  - Update Intel Skylake event table
>  - Add Intel PERF_METRICS event support for Icelake
>  - Add support for ARM Neoverse N2 core PMU
>  - Add ARM SPE events for Neoverse N1 core PMU
>  - Add cgroup-switches software event
>  - Add Intel Tigerlake and Rocketlake core PMU support
>  - Add AMD64 Fam19h Zen3 L3 PMU support
>  - Add AMD64 Fam17h Zen2 RAPL support
>  - Add AMD64 Fam19h Zen3 core PMU support
>  - Add RAPL for AMD64 Fam19h Zen3 processor
>  - Update ARM N1 event table
>  - Update AMD Fam17h Zen2 event table
>  - s390: Update counter definition for IBM z16
> 
> https://perfmon2.sourceforge.net/
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libpfm4/libpfm4.hash | 6 +++---
>  package/libpfm4/libpfm4.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
