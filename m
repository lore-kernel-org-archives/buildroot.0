Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB89EC5472F
	for <buildroot@archiver.kernel.org>; Tue, 27 Aug 2024 18:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 678974013F;
	Tue, 27 Aug 2024 18:55:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i5NtklksH-lq; Tue, 27 Aug 2024 18:55:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08A374031A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08A374031A;
	Tue, 27 Aug 2024 18:55:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 088AB1BF2B8
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 18:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 020AD4065A
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 18:55:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cPdRGKwiQLIG for <buildroot@lists.busybox.net>;
 Tue, 27 Aug 2024 18:55:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BAE5B40652
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAE5B40652
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BAE5B40652
 for <buildroot@buildroot.org>; Tue, 27 Aug 2024 18:55:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 890F5C0003;
 Tue, 27 Aug 2024 18:55:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sj1LI-0046vS-2D;
 Tue, 27 Aug 2024 20:55:00 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240421095353.208034-1-dario.binacchi@amarulasolutions.com>
 <20240421095353.208034-2-dario.binacchi@amarulasolutions.com>
 <20240715160555.6e88961e@windsurf>
Date: Tue, 27 Aug 2024 20:55:00 +0200
In-Reply-To: <20240715160555.6e88961e@windsurf> (Thomas Petazzoni via
 buildroot's message of "Mon, 15 Jul 2024 16:05:55 +0200")
Message-ID: <87r0a994or.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [RFC PATCH 1/2] support/scripts/genimage.sh:
 support creating a bmap image
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
Cc: michael@amarulasolutions.com, Xuanhao Shi <X15000177@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

Hi,

 >> An alternative implementation could have been to create another script,
 >> such as support/scripts/bmap.sh, capable of creating the bmap image
 >> using the same parameters passed to support/scripts/genimage.sh (i. e.
 >> -c board/<manufacturer>/<boardname>/genimage.cfg). However, in this case,
 >> the script would also need to know that the image is located in the
 >> ${BINARIES} directory. This could be achieved by adding an additional
 >> parameter, but it might cause genimage.sh to fail due to an unrecognized
 >> parameter.
 >> 
 >> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

 > We took advantage of the on-going Buildroot hackathon to discuss live,
 > and we pushed your patch, but with some changes:

 > (1) We don't add an option to script, but rather we look in the
 > Buildroot .config file is host-bmap-tools has been enabled. If it is
 > enabled, we assume the user wants bmap images

Sorry for the slow response, I only got to this now while backporting
for LTS, but I don't like the fact that it hardcodes gzip compression
(with a specific compression level), especially as it is
hidden/optionless now, E.G. it seems quite random that if you have a
genimage.cfg creating a sdcard.img (or whatever) and you then enable
host-bmaptools you all of a sudden don't have sdcard.img anymore, but
sdcard.img.gz (and sdcard.img.bmap) and "waste" time doing the
compression you may or may not want.

I would suggest to drop the gzip step and only create the .bmap files
(which presumably is quite fast?)

What do you say?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
