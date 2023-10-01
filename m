Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59653E748E9
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 11:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA16F42FD2;
	Sun,  1 Oct 2023 11:24:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA16F42FD2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J7DO7xZdVFjb; Sun,  1 Oct 2023 11:24:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B38CB42FDD;
	Sun,  1 Oct 2023 11:24:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B38CB42FDD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8F4431BF5A0
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 11:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76839405E9
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 11:24:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76839405E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 71eAjAP3MwuQ for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 11:24:33 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EC81840574
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 11:24:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC81840574
Received: by mail.gandi.net (Postfix) with ESMTPSA id DDE5460003;
 Sun,  1 Oct 2023 11:24:28 +0000 (UTC)
Received: from peko by dell.home with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qmuYm-00GJKB-6d; Sun, 01 Oct 2023 13:24:28 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Frager, Neal" <neal.frager@amd.com>
References: <20230904100443.1613306-1-neal.frager@amd.com>
 <20230922145236.027dc287@booty>
 <CH2PR12MB50040897854080471200F9E0F0FFA@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20230922155735.43ddc356@booty>
 <CH2PR12MB5004C65AFCE251505428888AF0FFA@CH2PR12MB5004.namprd12.prod.outlook.com>
 <MN0PR12MB60045761B225083426E7B1A1A0FFA@MN0PR12MB6004.namprd12.prod.outlook.com>
 <CH2PR12MB5004761ED87FCAC8E37E9667F0FEA@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20230925045944.6a88abd4@booty>
 <7AD8C3E2-4A82-434F-8C3D-6B9B5E53E798@amd.com>
Date: Sun, 01 Oct 2023 13:24:28 +0200
In-Reply-To: <7AD8C3E2-4A82-434F-8C3D-6B9B5E53E798@amd.com> (Neal Frager's
 message of "Mon, 25 Sep 2023 03:43:21 +0000")
Message-ID: <877co67fgz.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v3 1/6] package/binutils-bare-metal: new
 package
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
Cc: "Simek, Michal" <michal.simek@amd.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Frager," == Frager, Neal <neal.frager@amd.com> writes:

Hello,

 >>> Is this ok for both of you?
 >> 
 >> I'm OK with the whole approach, except for the sentence "I do not
 >> believe there is currently any organized effort to upstream any of
 >> these patches"... which is probably already clear to the recipients
 >> of this message, and thus is not going to be solved in this thread,
 >> however I just want to be sure my position is clear. I'd also like to
 >> stress that I appreciate a lot the work you are doing to properly
 >> support the pmufw in Buildroot. Thanks!
 >> 
 >> Luca

 > Your position is very clear.  And I can assure you that both Ibai and I agree with it.

 > It would be much better if all of these binutils and gcc patches for
 > microblaze go upstream, and both Ibai and I have pushed for it
 > internally at AMD / Xilinx.

 > The only thing I can say is that change is always possible.
 > Yesterday, we could not build a zynqmp pmufw, versal plm or versal
 > psmfw in buildroot.  Today, we have submitted a solution to change
 > that.

 > Tomorrow (figurative meaning the future), we hope to get all these
 > binutils and gcc patches upstream, so the upstream toolchain matches
 > the AMD Xilinx distributed toolchain.

 > One step at a time.

Sure! Sorry, I am somewhat late to the review game here. I wonder how
this fits with Luca's zynqmp-pmufw-builder?

E.G. today the setup is that the pmufw is built outside Buildroot and we
just point the u-boot package to where it can fetch the prebuilt
firmware binary - This is nice in the sense that it is fast and simple,
but makes is somewhat annoying to make modifications to the firmware.

This series instead goes to the other extreme, E.G. we build the entire
microblaze toolchain from scratch and then use it to build the firmware
and use it in the u-boot package - This is nice because it is all in
Buildroot and we have it all under control, but also brings quite some
build time overhead for building the toolchain before building the
(small) toolchain. You can naturally "solve" it by using two defconfigs,
E.G. one that builds the pmufw and another that uses the prebuilt one,
but it isn't very handy either.

Would an in between option not be more interesting, E.G. use (or
download) a prebuilt microblaze toolchain and use that to build the
firmware? That would still give the flexibility to easily tweak the
firmware, but not the overhead of building the toolchain every time?

I guess the problems with that are what to do about the meta-xilinx
patches and where/who wants to host a prebuilt one?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
