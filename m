Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7998C07E9D
	for <buildroot@archiver.kernel.org>; Mon, 26 Sep 2022 10:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3866940B3A;
	Mon, 26 Sep 2022 10:25:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3866940B3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rdNUzTBXmjtS; Mon, 26 Sep 2022 10:25:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB8E7408EF;
	Mon, 26 Sep 2022 10:25:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB8E7408EF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 02E2C1BF3EC
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 10:25:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D496C41714
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 10:25:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D496C41714
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9eYxUFL6W6w9 for <buildroot@lists.busybox.net>;
 Mon, 26 Sep 2022 10:25:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37E4B415DC
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 37E4B415DC
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 10:25:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B7915E0005;
 Mon, 26 Sep 2022 10:24:58 +0000 (UTC)
Date: Mon, 26 Sep 2022 12:24:57 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Johan Oudinet <johan.oudinet@gmail.com>
Message-ID: <20220926122457.1ae898b3@windsurf>
In-Reply-To: <CAJtjsKbXry53n6HTcvV9jPyxJ4fcCbryAn7Vtk_8i=Q9qfed5g@mail.gmail.com>
References: <20220913174039.182887-1-thomas.claveirole@green-communications.fr>
 <20220925214700.5e222e95@windsurf>
 <20220925215340.43f64019@windsurf> <3124822.5fSG56mABF@harderbit>
 <20220926120059.1c0c677b@windsurf>
 <CAJtjsKbXry53n6HTcvV9jPyxJ4fcCbryAn7Vtk_8i=Q9qfed5g@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664187899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3tUDbDJ5n9PpAKCvbBfd7eYvMj/2C9j4hn45Zb9Oyl4=;
 b=TwcQVd141iIn9mePfbAdqr1Xnf++mksDxjkcDGlDoPGSG2uKo5H0ZcGNZyLQrzdAWAU451
 yHF+zcN1wekzW9I4w46Hg56ny/sYyC4EEHeJPPuwAA2AZ+iDBnp4iTVPcNvOwVs4zKwVkk
 3UWcDTeBGGbg0UyCp5azOZ6jxSVoVHWv48qJC/sSPStROmeho4+O1mNjhI6f+8yuSJOMgf
 r2O3+btx6pGd6w1pXnbaHW+FyMyYdVn7KCUhFKXR427fX9XMJWnwIFsIR6ApI0RiiRUjhy
 V++heTXbrfYzFT1LPlD5Ifp2xXVxNaeGYf33eQf3xpgXyUbPkUzShwXchzDcvQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TwcQVd14
Subject: Re: [Buildroot] [PATCH 1/2] package/nodejs: introduce
 BR2_PACKAGE_HOST_NODEJS_COREPACK
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
Cc: Daniel Price <daniel.price@gmail.com>,
 Thomas Claveirole <thomas.claveirole@green-communications.fr>,
 Martin Bark <martin@barkynet.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 26 Sep 2022 12:17:04 +0200
Johan Oudinet <johan.oudinet@gmail.com> wrote:

> That's a good point. I'll report this issue to forge developers. Every
> npm packages should have a package-lock.json file in their repository.

See https://github.com/digitalbazaar/forge/issues/1005.

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
