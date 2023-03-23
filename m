Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC53AC6FD1D
	for <buildroot@archiver.kernel.org>; Thu, 23 Mar 2023 06:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72A0F41DF4;
	Thu, 23 Mar 2023 06:56:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72A0F41DF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gWBVFvlOEpxq; Thu, 23 Mar 2023 06:56:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D87741DF3;
	Thu, 23 Mar 2023 06:56:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D87741DF3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 62C5D1BF844
 for <buildroot@lists.busybox.net>; Thu, 23 Mar 2023 06:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D6778133E
 for <buildroot@lists.busybox.net>; Thu, 23 Mar 2023 06:56:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D6778133E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2ctXI2u3XZ7g for <buildroot@lists.busybox.net>;
 Thu, 23 Mar 2023 06:56:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0759F81337
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0759F81337
 for <buildroot@buildroot.org>; Thu, 23 Mar 2023 06:56:23 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C6F43FF807;
 Thu, 23 Mar 2023 06:56:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pfErz-00AysZ-OI; Thu, 23 Mar 2023 07:56:19 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Zvi Vered <veredz72@gmail.com>
References: <CABRndgw1EVFyDNDcRJ10gOPFfw-gH+7Gqx7P537EiSVr5Wq6Kw@mail.gmail.com>
 <875yavx0ui.fsf@dell.be.48ers.dk>
 <CABRndgyqeJXm6XqwYQ_QUaQAGB9EENSq4dc3qLaq6Y3RUhxFUg@mail.gmail.com>
 <87edpiuehn.fsf@dell.be.48ers.dk>
 <CABRndgwMRVDXzSAoGb5fU9PqM2b6z6we5rH40_NCs7w12LHiDA@mail.gmail.com>
 <877cv9vr7v.fsf@dell.be.48ers.dk>
 <CABRndgz8n37jikSwt3uBkGTM-UBObYcny6xEqhnFkDod9dae1Q@mail.gmail.com>
 <87355wv45c.fsf@dell.be.48ers.dk>
 <CABRndgycL0_hvf5dizJDby8VeW_z4xSnTZkXUOsVsXwy==yheA@mail.gmail.com>
Date: Thu, 23 Mar 2023 07:56:19 +0100
In-Reply-To: <CABRndgycL0_hvf5dizJDby8VeW_z4xSnTZkXUOsVsXwy==yheA@mail.gmail.com>
 (Zvi Vered's message of "Thu, 23 Mar 2023 04:35:02 +0200")
Message-ID: <875yasq7l8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] 2023.02 : pty_allocate: openpty: No such file or
 directory
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

>>>>> "Zvi" == Zvi Vered <veredz72@gmail.com> writes:

 > Hi Peter,
 > Attached .config of buildroot.
 > Did you get it ?

Yes. So I see that you do not create any filesystem images, only our
default rootfs.tar?


 > Today I will send the exact script of how I'm packing the tree files of the
 > rootfs into one file that u-boot loads via TFTP.

Ok, any specific reason for wanting to do this in a custom way rather
than E.G. letting Buildroot build your Linux kernel and embed the rootfs
as an initramfs?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
