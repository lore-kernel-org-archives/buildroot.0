Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D20DAEB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 15:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52566409EB;
	Sun, 25 Jun 2023 15:22:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52566409EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ofFc12IUn0gP; Sun, 25 Jun 2023 15:22:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13D17409E2;
	Sun, 25 Jun 2023 15:22:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13D17409E2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B14141BF3F2
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 15:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95F48409E2
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 15:22:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95F48409E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pMVKnd_Zs6YH for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 15:22:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BD47409C0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3BD47409C0
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 15:22:40 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D309520004;
 Sun, 25 Jun 2023 15:22:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qDRZT-006svl-Ra; Sun, 25 Jun 2023 17:22:35 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <20230622160212.2063472-1-dannenberg@ti.com>
 <20230622160212.2063472-7-dannenberg@ti.com>
 <20230625135435.GC589277@scaer>
 <bd293d20-a3c8-d76d-e711-75daaa5ec136@mind.be>
Date: Sun, 25 Jun 2023 17:22:35 +0200
In-Reply-To: <bd293d20-a3c8-d76d-e711-75daaa5ec136@mind.be> (Arnout
 Vandecappelle's message of "Sun, 25 Jun 2023 16:33:04 +0200")
Message-ID: <875y7bpnwk.fsf@48ers.dk>
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

 >>> * TI Linux Kernel v5.10
 >> So this means going from a 6.3 kernel back to a 5.10 (the current
 >> latest
 >> if 6.3, which is what is used in the defconfigs from the two previous
 >> patches). That's a bit unfortunate.
 >> Do you have plans to update to a more recent kernel in the (near)
 >> future? Can't we keep using 6.3 anyway?

 >  We don't actually have a clear policy on whether to use upstream or
 >  vendor kernels for the defconfigs. We have a few boards with both,
 > but IMHO that's not a great approach either.

 >  Personally, I think it makes sense to focus on vendor kernels for the
 >  defconfigs. Using upstream is generally easy, you just have to find
 > the appropriate device tree. But for the vendor kernel, you have to
 > find the repository, which branch is "current", and often also make
 > sure you sync up with U-Boot and OP-TEE etc. versions. @Andreas don't
 > take this as law, though, it's just personal opinion.

Correct, but given the poor quality of most vendor kernels, using a
board with mainline is typically a lot nicer (if the IP blocks you care
about are supported naturally).

Same about the support, E.G. we had issues with various vendor
kernels/bootloaders breaking with newer toolchain versions.


 >  That said, I think for each board we should look at what the vendor
 >  kernel really brings. If everything, including GPU, is working with
 > the upstream kernel, it doesn't make sense to use the vendor kernel. I
 > don't know if that's the case in this specific situation.

 >  Yann, Peter, Romain, Thomas, what do you think?

Agreed. I would in general say go for mainline, unless there is no
decent support in mainline. I would not necessarily think that GPU
support is a requirement, but at least the things used by the defconfig
(E.G. storage, serial, network).

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
