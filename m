Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80894C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 18:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 032A2841BC;
	Wed,  9 Mar 2022 18:49:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FZQxRjp0YENv; Wed,  9 Mar 2022 18:49:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B9068416D;
	Wed,  9 Mar 2022 18:49:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 327541BF371
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 18:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F9D6416B7
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 18:49:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N7OuPuaYSpOV for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 18:49:05 +0000 (UTC)
X-Greylist: delayed 05:49:57 by SQLgrey-1.8.0
Received: from 4.mo550.mail-out.ovh.net (4.mo550.mail-out.ovh.net
 [46.105.76.26])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C3846416B6
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 18:49:05 +0000 (UTC)
Received: from player697.ha.ovh.net (unknown [10.108.16.60])
 by mo550.mail-out.ovh.net (Postfix) with ESMTP id A39822147B
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 10:30:16 +0000 (UTC)
Received: from dopsi.ch (unknown [147.87.105.170])
 (Authenticated sender: dopsi@dopsi.ch)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id C8FE02831674A
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 10:30:15 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R00493124adf-5ba3-4f11-b753-054b526024ae,
 8C4A81BA845AD86367A70DA6059151C156D75370) smtp.auth=dopsi@dopsi.ch
X-OVh-ClientIp: 147.87.105.170
Message-ID: <3677050fbcbf7d7e31d8c6c12924f648d0e37d2a.camel@dopsi.ch>
From: Simon Doppler <dopsi@dopsi.ch>
To: buildroot@buildroot.org
Date: Wed, 09 Mar 2022 11:30:14 +0100
In-Reply-To: <94327194-ed5b-42c2-8ece-45c0368c9622@www.fastmail.com>
References: <0e6293a1-fa3e-4399-b963-14634d3578ad@www.fastmail.com>
 <f4e356e6f59e8746890bbdc07ed684115043e762.camel@dopsi.ch>
 <94327194-ed5b-42c2-8ece-45c0368c9622@www.fastmail.com>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
X-Ovh-Tracer-Id: 9346939554425583733
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddukedgudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefkuffhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhmpefuihhmohhnucffohhpphhlvghruceoughophhsihesughophhsihdrtghhqeenucggtffrrghtthgvrhhnpeefffduieeiieeghfegvdeuiedtgeekffdtjedtkeduffeiledvgefgveehkeffveenucfkpheptddrtddrtddrtddpudegjedrkeejrddutdehrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehplhgrhigvrheileejrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepughophhsihesughophhsihdrtghhpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
Subject: Re: [Buildroot] Patching buildroot package makefiles with
 BR2_EXTERNAL
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Danilo,

> > I did expect that adding the dependency as you did would work but
> > it
> > failed: they show up when running `make arm-
> > trusted-firmware-show-depends` but not in `make arm-trusted-
> > firmware-show-build-order`. Does the same happen for you?
> 
> Yes, same issue for me. "make nginx-show-depends" includes "nginx-
> rtmp-module",
> but "make nginx-show-build-order" does not.
> 
> Manually building the module before building nginx does work, but it
> would be
> nice if there were a clean fix.

I submitted a bug report [1], with some extra info I found by digging
around today.

I will continue to dig around in the coming weeks but it will still not
be high on my priorities.

Simon

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
