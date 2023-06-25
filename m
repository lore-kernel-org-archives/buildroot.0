Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F5F7EB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 19:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D47D660F25;
	Sun, 25 Jun 2023 19:14:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D47D660F25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ths8PcC5_4oZ; Sun, 25 Jun 2023 19:14:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DD4260B16;
	Sun, 25 Jun 2023 19:14:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DD4260B16
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E27671BF3A4
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C90D3400DD
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:14:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C90D3400DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L6QO91V7hunF for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 19:14:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E718400C8
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4E718400C8
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 19:14:32 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6BDE960003;
 Sun, 25 Jun 2023 19:14:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qDVBr-00779G-BW; Sun, 25 Jun 2023 21:14:27 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <20230622160212.2063472-1-dannenberg@ti.com>
 <20230622160212.2063472-7-dannenberg@ti.com>
 <20230625135435.GC589277@scaer>
 <bd293d20-a3c8-d76d-e711-75daaa5ec136@mind.be>
 <875y7bpnwk.fsf@48ers.dk>
 <1383cf3a-fa81-75b7-1e3f-45a82ebb4c7d@mind.be>
Date: Sun, 25 Jun 2023 21:14:27 +0200
In-Reply-To: <1383cf3a-fa81-75b7-1e3f-45a82ebb4c7d@mind.be> (Arnout
 Vandecappelle's message of "Sun, 25 Jun 2023 20:59:01 +0200")
Message-ID: <87v8fbnylo.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v9 06/11] board/ti/am62x_sk|am64x_sk: switch
 to TI SDK v8.6 sources
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
Cc: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Andreas Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> Correct, but given the poor quality of most vendor kernels, using a
 >> board with mainline is typically a lot nicer (if the IP blocks you care
 >> about are supported naturally).

 >  I'm not sure that you can claim most vendor kernels are poor
 >  quality. At least NXP and Microchip have decent vendor
 > kernels. Conversely, when vendor kernels are horrible, mainline is
 > often not super usable either (because, of course, those vendors don't
 > invest in upstreaming either).

Sure, not all vendor kernels are equal, but vendor drivers are often
written by people not very familiar with the subsystem, so things get
handled in "odd ways", and as they have not been submitted upstream they
don't get any review feedback to clean it up. The vendor kernels of high
quality is typically the ones where the vendor developers interact with
mainline (so their drivers get reviewed by the subsystem maintainers).
E.G. for the Microchip and NXP cases, the basics are anyway in mainline,
so it is normal that the identical parts in the vendor kernel also looks
sensible.

I am not aware of any situations where the mainline kernel is of lower
quality than the vendor kernel. It will often have less features, but the
support that is there is often cleaner.


 >> Same about the support, E.G. we had issues with various vendor
 >> kernels/bootloaders breaking with newer toolchain versions.
 >> 
 >> >  That said, I think for each board we should look at what the vendor
 >> >  kernel really brings. If everything, including GPU, is working with
 >> > the upstream kernel, it doesn't make sense to use the vendor kernel. I
 >> > don't know if that's the case in this specific situation.
 >> >  Yann, Peter, Romain, Thomas, what do you think?

 >> Agreed. I would in general say go for mainline, unless there is no
 >> decent support in mainline. I would not necessarily think that GPU
 >> support is a requirement, but at least the things used by the defconfig
 >> (E.G. storage, serial, network).

 >  That's exactly the opposite of what I was saying, so not agreed I guess :-)

I guess it is a question of glass half full vs half empty. You wrote
".. we should look at what the vendor kernel really brings. If
everything, including GPU, is working with the upsteam kernel, it
doesn't make sense to use the vendor kernel", which I agreed with,
EXCEPT that I think the cutoff point should be lower than "everything
supported", but just if mainline is suitable for booting a Buildroot
defconfig, E.G. working serial/storage/network.

But like usual, this is largely up to the person contributing the
defconfig.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
