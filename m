Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45CFC4167B
	for <buildroot@archiver.kernel.org>; Tue, 27 Dec 2022 20:48:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 668AE408AC;
	Tue, 27 Dec 2022 20:48:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 668AE408AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tx15PHuJXRji; Tue, 27 Dec 2022 20:48:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52E0B40891;
	Tue, 27 Dec 2022 20:48:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52E0B40891
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BEB581BF37A
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 20:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A57A140260
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 20:48:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A57A140260
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yVU9AjDkW4GU for <buildroot@lists.busybox.net>;
 Tue, 27 Dec 2022 20:48:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FA174018F
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6FA174018F
 for <buildroot@buildroot.org>; Tue, 27 Dec 2022 20:48:27 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A9C9460007;
 Tue, 27 Dec 2022 20:48:25 +0000 (UTC)
Date: Tue, 27 Dec 2022 21:48:24 +0100
To: Tan En De <ende.tan@starfivetech.com>
Message-ID: <20221227214824.5068674c@windsurf>
In-Reply-To: <20221224044616.3909215-1-ende.tan@starfivetech.com>
References: <20221224044616.3909215-1-ende.tan@starfivetech.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672174106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yM0/dP0NIQrZnBGkVRPEFhfYIn/0SqDHFA/YrsUvwbc=;
 b=dihq/N2oo29dwOcww6He1Esn405mCuC21gqjM07UfAIvHp1OhdwoxjREvcGxxfx3jdgnZn
 AyekOm/qTKnCQT1DHZ1euh+tUHWEEGkIrzjoAKbGX4bSrfJDXH4cPMm1LNOhWrzXKP7Plw
 7G55OLLb0xOE1tCOWFIZVAKCYr1dzdz2lmdGDKTqdaQQcsBLe8fFMiryRSa4lDH44RQQDo
 reA5EPMd77nVLZ6+ewZdoSUzKE0Ppww1tv8f8RXujlGM+4f9fOtQTlWwNCBeIEi861aQYZ
 5hx2OP0yMKjthITSv2mrldG4BNvS5ngspmPJUNUJzjA8mmrUW+PTnscEZJ/RRA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dihq/N2o
Subject: Re: [Buildroot] [1/1] package/libkcapi: Fix symver build error on
 non-ELF platforms
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
Cc: Stephan Mueller <smueller@chronox.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 24 Dec 2022 12:46:16 +0800
Tan En De <ende.tan@starfivetech.com> wrote:

> The following error is observed on Microblaze [1] build:
> ```
> error: symver is only supported on ELF platforms
> ```
> due to using __attribute__((symver)) on non-ELF platform.
> So, revert to using .symver in such case.
> 
> [1]: http://autobuild.buildroot.net/results/447/4470efb5a078c0e368f6bd4f5ec455eea5eeebb5/build-end.log
> 
> Upstream status: commit f630ed1f807e26de04b3a5dfd7f1b39d1c5cb642
> https://github.com/smuellerDD/libkcapi/pull/147
> 
> Signed-off-by: Tan En De <ende.tan@starfivetech.com>
> Signed-off-by: Stephan Mueller <smueller@chronox.de>
> ---
>  ...ver-build-error-on-non-ELF-platforms.patch | 84 +++++++++++++++++++
>  1 file changed, 84 insertions(+)
>  create mode 100644 package/libkcapi/0003-Fix-symver-build-error-on-non-ELF-platforms.patch

Applied to master, thanks. This macro AC_CHECK_ATTRIBUTE_SYMVER is
actually very good, and I believe a few other packages in Buildroot
could potentially benefit from it.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
