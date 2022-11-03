Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B56C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 11:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65E8B40B0E;
	Thu,  3 Nov 2022 11:02:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65E8B40B0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tsGDgIrfzR85; Thu,  3 Nov 2022 11:02:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61E1B40459;
	Thu,  3 Nov 2022 11:02:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61E1B40459
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AF4D61BF317
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 11:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 858C681F12
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 11:02:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 858C681F12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zGF-LYsB0aFT for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 11:02:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46FD481F07
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 46FD481F07
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 11:02:18 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 215E81C0003;
 Thu,  3 Nov 2022 11:02:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oqXzA-008OAu-LZ; Thu, 03 Nov 2022 12:02:12 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Frager, Neal" <neal.frager@amd.com>
References: <20221022082824.35440-1-neal.frager@amd.com>
 <87a65o443y.fsf@dell.be.48ers.dk>
 <DM6PR12MB5007802871CC6D33DFFAF1E6F02C9@DM6PR12MB5007.namprd12.prod.outlook.com>
 <875ygc424e.fsf@dell.be.48ers.dk>
 <CH2PR12MB5004B0C65D7D73B65F0143CEF0389@CH2PR12MB5004.namprd12.prod.outlook.com>
Date: Thu, 03 Nov 2022 12:02:12 +0100
In-Reply-To: <CH2PR12MB5004B0C65D7D73B65F0143CEF0389@CH2PR12MB5004.namprd12.prod.outlook.com>
 (Neal Frager's message of "Thu, 3 Nov 2022 10:52:50 +0000")
Message-ID: <87bkpoqp1n.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 1/1] package/bootgen: add bootgen host
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
Cc: "O'Neal, Terry" <terry.oneal@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>, "Chaplin,
 Kris" <Kris.Chaplin@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Frager," == Frager, Neal <neal.frager@amd.com> writes:

 > Hi Peter,
 >>> I also had issues with linking with the embedded copy of flex if
 > the >> build host has the flex development package installed unless I
 > add >> the following patch, which unfortunately is still not merged:

 >>> https://github.com/Xilinx/bootgen/pull/20

 >> Thank you for sharing.  I will push this internally to see if we can get this prioritized.

 > https://github.com/Xilinx/bootgen/commit/af4f7083ea92931a07e47995eb2bc2a348c577ed

 > Committed, thanks.

Thanks! Is there any specific reason why the PR was not merged / my
authorship was dropped?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
