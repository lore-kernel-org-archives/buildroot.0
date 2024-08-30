Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988FFCA0EDC
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 16:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 120F7400D6;
	Fri, 30 Aug 2024 16:47:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MIccwQHPOI7i; Fri, 30 Aug 2024 16:47:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFC394013C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BFC394013C;
	Fri, 30 Aug 2024 16:47:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 67D3C1BF35F
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 16:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61F6784138
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 16:47:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1zh2SjmTBVeH for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 16:47:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4358184111
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4358184111
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4358184111
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 16:47:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4086C60003;
 Fri, 30 Aug 2024 16:47:15 +0000 (UTC)
Date: Fri, 30 Aug 2024 18:47:14 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240830184714.539c1fb0@windsurf>
In-Reply-To: <CABGWkvrSzFdKqrZ1MWm76kEtd=GigJA5_FwYq3smQJW734S6xw@mail.gmail.com>
References: <20240824151511.3178807-1-dario.binacchi@amarulasolutions.com>
 <20240826185741.7c68d235@windsurf>
 <CABGWkvrSzFdKqrZ1MWm76kEtd=GigJA5_FwYq3smQJW734S6xw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725036435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bvw3H4gWTnNXIkbkG7o0x8EUxmvLoXk7Vh+GmCfN+ZM=;
 b=owpQ+01y82DZWkW6iSACXWtlZlEdB81s7siLfPJiwyWxO0CyUGlD0rxT37JdXwN6jDLEbN
 ol+IbnM14nNt9ZgYCShzaMG8n96o+la35pr1F4/GMAalbkTkFefLSRS5bz4UiPy4Gi+y64
 LinS4eJe0vpmcn1FqeW5ZYbktJUuvavl+KWzo66SB2+PZQGO5amN9j9zrxC3mK/79Kl/Fx
 F1lgzwazRairXBS7F49SxZtag3NO44QKkOPAPrlsyxi46GrzZBj6lewiHBtwrtC2hiEjq5
 eudWVuJZxKurAXU1Nj6DZ7mzjhvghu8f3Rm0BbhkI557FVczfXYBkO402VTJBw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=owpQ+01y
Subject: Re: [Buildroot] [PATCH 1/1] package/armadillo: bump to version
 10.1.0
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
Cc: Samuel Martin <s.martin49@gmail.com>, linux-amarula@amarulasolutions.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Dario,

On Tue, 27 Aug 2024 08:20:30 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> This is the response from Conrad Sand, one of the two maintainers of
> the project:
> 
> ---------------------------------------------------------------------------------------------------
> Hi Dario,
> 
> Armadillo 9.900 is very old, horribly outdated and no longer supported.

Right, but this is not a reason for the tarball to no longer be
available, as it breaks build systems horribly.

> I recommend upgrading to the latest version, which is currently 14.0.2.
> https://sourceforge.net/projects/arma/files/armadillo-14.0.2.tar.xz
> 
> If you really want ancient versions of Armadillo, they can be
> temporarily found here:
> 
> https://sourceforge.net/projects/arma/files/retired/

Did you try using those?

> ---------------------------------------------------------------------------------------------------
> 
> So, should I restore the  9.900 version?

Yes, for master, I would prefer to keep the 9.900 version.

> Or at this point, would it be acceptable to bump to 10.10?
> Or should I restore 9.900 and then bump to 10.10?
> Or should I restore 9.900 and then bump to 14.2?

This last choice is the right one: restore 9.900 in master, and bump to
14.0.2 in next, of course if you're interested by the package.
Otherwise, we could also decide to drop the package entirely. Samuel
Martin is associated to its in the DEVELOPERS file, but Samuel has
stopped contributing to Buildroot years ago, and nobody else got
interested by that package. Therefore dropping it would be a totally
acceptable alternative.

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
