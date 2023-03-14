Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF2DC7618A
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 08:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 803C840905;
	Tue, 14 Mar 2023 08:43:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 803C840905
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id shoiMsaEcM-O; Tue, 14 Mar 2023 08:43:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EDAD41857;
	Tue, 14 Mar 2023 08:43:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EDAD41857
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C97AB1BF2C3
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 08:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF9B540525
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 08:43:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF9B540525
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JhyHAGpLlgZb for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 08:43:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 898214011F
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 898214011F
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 08:43:10 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C32A840006;
 Tue, 14 Mar 2023 08:43:08 +0000 (UTC)
Date: Tue, 14 Mar 2023 09:43:08 +0100
To: Lang Daniel via buildroot <buildroot@buildroot.org>
Message-ID: <20230314094308.4b437d25@windsurf>
In-Reply-To: <VI1P190MB0493EEA41C1BB8926C997D539FBE9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
References: <VI1P190MB0493EEA41C1BB8926C997D539FBE9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678783389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jVjw3vA5Inj9b7zVkqQONUNTOz3A3ZOjhp3FS9Kxo+U=;
 b=GYiPAQfks2RoVLWoH/VIsN4eD78sEh8eqFUua7GaO0aAFWRT81199rsf7UN7LrhdgJXvNx
 C7rbZvi4XVDMS5e7hlo6tAsHW7u/mPaIOjxSN5iuUqpyVzuM5KSI6w9sxnOe3stVz1PjAU
 X1aKTksKoH2VUIEutUqyKOpZumgAShSxbbIbE7TxUR0FNI8WkWsLY2JmSoJvAD2asmrpzH
 cr57W/1h4EJHlCmddHMk6e/YH7oIsPonxB/47Jpnz1rIz2JpyMhZyKYt1nhw19QiD+SI2m
 dz17B6lsdZz7oO1dgBOjyvJ5e7kSH7j/sbllKjW4iPsjdVE8iM01ko+tNGiIwA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GYiPAQfk
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: fix COPYING hash
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
Cc: Lang Daniel <d.lang@abatec.at>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 14 Mar 2023 08:13:19 +0000
Lang Daniel via buildroot <buildroot@buildroot.org> wrote:

> The version bump in a1f0020 forgot to update the hash of the license
> file.
> Changes include updated copyright years for the different parties.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/0d93b20995c2bfd2236d820a35e5eae9de76f00e
> 
> Signed-off-by: Daniel Lang <d.lang@abatec.at>
> ---
>  package/harfbuzz/harfbuzz.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
