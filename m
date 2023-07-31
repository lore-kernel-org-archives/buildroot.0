Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED7F0C001DF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 22:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9748F40BDD;
	Mon, 31 Jul 2023 22:13:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9748F40BDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WHpCCxeDewgH; Mon, 31 Jul 2023 22:13:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AEF3640C04;
	Mon, 31 Jul 2023 22:13:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEF3640C04
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 312421BF378
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 22:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A59A400F2
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 22:13:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A59A400F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iiOhplB8ehAh for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 22:13:17 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C83604011A
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 22:13:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C83604011A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2ED3060005;
 Mon, 31 Jul 2023 22:13:07 +0000 (UTC)
Date: Tue, 1 Aug 2023 00:13:06 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230801001306.19ae77b4@windsurf>
In-Reply-To: <20230731183731.2978383-2-bernd@kuhls.net>
References: <20230731183731.2978383-1-bernd@kuhls.net>
 <20230731183731.2978383-2-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690841593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tuz8cb/xPi2vR4C7gOjN3j6XVbzAb8slujTFtBBKsXs=;
 b=kncPqsaAE4G0gdkDwHi0I0YsimNKRp80GKQWNZEXomf86xt9V65S9DeC/ub63QI5LYbPEu
 vsqbdWDYiov+O77JTdjCdN5cmvCA6/W5xbDbstBmOTOppLG3ZolkxTAVftAI6CKPAot8tV
 yc5clFSI/cLciJPCKOzh3vh4xxNuwUFI+TELt4W0Chyp2PYhHZxmi+h3lMcNhPBjT0YEEO
 3pF/tMXqQC4kJDuWZVIZ/5cwiBu4aAqLSpCi0/2tvIk6B28vr2rKWDE+8ZCfe/WgZ9cyrX
 BgsalK0g14BRj6flM1R+eBGG4Y99s4cQE/en9eFr/PSciYCNkt2Pbj/6N1C17w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kncPqsaA
Subject: Re: [Buildroot] [PATCH v2 2/2] package/{binutils,
 libiberty}: add support for version 2.41
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Mon, 31 Jul 2023 20:37:31 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://sourceware.org/pipermail/binutils/2023-July/128719.html
> 
> Copied patches from version 2.40.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

This needs a bit more work, look at other binutils bumps. We want at
least:

- Introduce 2.41
- Switch to 2.40 as default
- Drop 2.38 (don't forget legacy handling)

Also, do we want to update libiberty to 2.41 as well? (Need to make
sure it remains compatible with binutils 2.39 and 2.40).

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
