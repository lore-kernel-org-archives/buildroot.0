Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA92CC433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 09:00:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96E3980C03;
	Mon, 27 Dec 2021 09:00:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KgjmZlpqrXPx; Mon, 27 Dec 2021 09:00:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E57D28144D;
	Mon, 27 Dec 2021 09:00:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 55CCC1BF20F
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 09:00:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 533094030C
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 09:00:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FjYEAUta-Von for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 08:59:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 63D1C40308
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 08:59:59 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id A28D66000A;
 Mon, 27 Dec 2021 08:59:57 +0000 (UTC)
Date: Mon, 27 Dec 2021 09:59:56 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Juan A. Rubio" <jarubio2001@gmail.com>
Message-ID: <20211227095956.120b796e@windsurf>
In-Reply-To: <CAE58QoPWoZdZq=cOpo0MRJXgZDfa5Ad07HtYooT9LKho5KRS8A@mail.gmail.com>
References: <CAE58QoPWoZdZq=cOpo0MRJXgZDfa5Ad07HtYooT9LKho5KRS8A@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] Same 32-bit image for 64-bit and 32-bit platforms
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Juan,

On Mon, 27 Dec 2021 09:40:00 +0100
"Juan A. Rubio" <jarubio2001@gmail.com> wrote:

> I'm looking for information on whether it's possible to produce and
> use the same Buildroot image and associated sdk for two different
> boards, one based on an imx6 and the other on imx8. Is this something
> that Buildroot supports at all? do I need two separate Buildroot
> environments/builds, one for the 32-bit imx6 and another for the
> 64-bit imx8?

You will need different Buildroot builds yes, but you can use a single
Buildroot source tree. Basically, your i.MX6 system will need one
Buildroot configuration (.config file / defconfig file) and your i.MX8
system will need another Buildroot configuration (another .config file
/ defconfig file).

You can build both configurations in parallel based on the same
Buildroot source tree using "out of tree" build, see
https://buildroot.org/downloads/manual/manual.html#_building_out_of_tree.

Hope this helps,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
