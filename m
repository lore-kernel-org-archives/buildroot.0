Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6C4C04A95
	for <buildroot@archiver.kernel.org>; Sat, 22 Oct 2022 09:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C69C8404FF;
	Sat, 22 Oct 2022 09:52:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C69C8404FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id frXPf_UQpDOv; Sat, 22 Oct 2022 09:52:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0BB540169;
	Sat, 22 Oct 2022 09:52:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0BB540169
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B10821BF39A
 for <buildroot@lists.busybox.net>; Sat, 22 Oct 2022 09:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8658360AD8
 for <buildroot@lists.busybox.net>; Sat, 22 Oct 2022 09:52:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8658360AD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u-l3kll-i668 for <buildroot@lists.busybox.net>;
 Sat, 22 Oct 2022 09:52:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D12560AB1
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4D12560AB1
 for <buildroot@buildroot.org>; Sat, 22 Oct 2022 09:52:06 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4778E240005;
 Sat, 22 Oct 2022 09:52:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1omBAf-00BekB-BN; Sat, 22 Oct 2022 11:52:01 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Frager, Neal" <neal.frager@amd.com>
References: <20221022082824.35440-1-neal.frager@amd.com>
 <87a65o443y.fsf@dell.be.48ers.dk>
 <DM6PR12MB5007802871CC6D33DFFAF1E6F02C9@DM6PR12MB5007.namprd12.prod.outlook.com>
Date: Sat, 22 Oct 2022 11:52:01 +0200
In-Reply-To: <DM6PR12MB5007802871CC6D33DFFAF1E6F02C9@DM6PR12MB5007.namprd12.prod.outlook.com>
 (Neal Frager's message of "Sat, 22 Oct 2022 09:22:39 +0000")
Message-ID: <875ygc424e.fsf@dell.be.48ers.dk>
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

Hi,

 >> I have a package for bootgen as well at $WORK, where I instead use
 >> host-pkgcon which is a bit nicer than these hard coded values, E.G.:

 > What do you mean by $WORK?

Simply that I have done it for an internal Buildroot external tree that
I use at work.


 >> I also had issues with linking with the embedded copy of flex if the
 >> build host has the flex development package installed unless I add
 >> the following patch, which unfortunately is still not merged:

 >> https://github.com/Xilinx/bootgen/pull/20

 > Thank you for sharing.  I will push this internally to see if we can get this prioritized.

Thanks!


 >> Please also add a bootgen.hash file with the hash of the tarball and LICENSE file.

 > Would you mind giving me instructions for generating the bootgen.hash, so I do not need to search for it?

It is simply a question of running sha256sum on the tarball and LICENSE
files. See
https://buildroot.org/downloads/manual/manual.html#adding-packages-hash
for details.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
