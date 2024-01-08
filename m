Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9359C3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 11:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EFFB60EDF;
	Mon,  8 Jan 2024 11:06:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EFFB60EDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E-ZnMcXrGXej; Mon,  8 Jan 2024 11:06:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5ABD60B70;
	Mon,  8 Jan 2024 11:06:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5ABD60B70
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C027A1BF303
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 11:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A68D4821A8
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 11:06:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A68D4821A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JPdtOgrJkEGk for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 11:06:17 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2DD7E8208C
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 11:06:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DD7E8208C
Received: by mail.gandi.net (Postfix) with ESMTPSA id ED68DE0003;
 Mon,  8 Jan 2024 11:06:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rMnSP-00731P-11;
 Mon, 08 Jan 2024 12:06:13 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20231206192527.90222-1-kilian.zinnecker@mail.de>
 <ZYcqdkBK1XbKOmlq@landeda>
Date: Mon, 08 Jan 2024 12:06:13 +0100
In-Reply-To: <ZYcqdkBK1XbKOmlq@landeda> (Yann E. MORIN's message of "Sat, 23
 Dec 2023 19:44:06 +0100")
Message-ID: <87le90xexm.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] configs/rock5b: add hash for custom
 kernel, uboot
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
Cc: kilian.zinnecker@mail.de, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hello,

 > Now I realise one point that I completely forgot: if the upstream git
 > tree disapears, we're left with downloading from a backup mirror (like
 > s.b.o.). Or one can also use a primary mirror. In thoses cases, we do
 > want to have a hash for the archive, even if the official is a git-clone
 > repos.

 > So, bottom line: we need a hash for all cases. Except when the remote is
 > known to not be reproducible by design, which will be the few
 > excpetions.

I agree.

 > I initially dropped the kernel part when applying your patch. But in
 > light of what I wrote above, I'll push a follow up patch fixing it,
 > sorry for the mess...

 > [0] https://lore.kernel.org/buildroot/874jgpnn7d.fsf@48ers.dk/

Committed those two patches to 2023.11.x as well, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
