Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F2FC4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 07:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0AE2740578;
	Mon, 12 Dec 2022 07:24:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AE2740578
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6d1JVBDWea9b; Mon, 12 Dec 2022 07:24:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 691CC401AD;
	Mon, 12 Dec 2022 07:24:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 691CC401AD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 456FF1BF288
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 07:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 159F840240
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 07:24:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 159F840240
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id phl8u5rirjkh for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 07:24:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F6E540228
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F6E540228
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 07:24:13 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C7EF410000A;
 Mon, 12 Dec 2022 07:24:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p4dAY-00BsDT-WF; Mon, 12 Dec 2022 08:24:11 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Indrek Kruusa <indrek.kruusa@gmail.com>
References: <20221211201704.25858-1-indrek.kruusa@gmail.com>
 <20221211201704.25858-2-indrek.kruusa@gmail.com>
Date: Mon, 12 Dec 2022 08:24:10 +0100
In-Reply-To: <20221211201704.25858-2-indrek.kruusa@gmail.com> (Indrek Kruusa's
 message of "Sun, 11 Dec 2022 22:17:01 +0200")
Message-ID: <87y1rdxexx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/5] board/nezha/genimage.cfg: remove boot0
 from genimage.cfg
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

>>>>> "Indrek" == Indrek Kruusa <indrek.kruusa@gmail.com> writes:

 > Signed-off-by: Indrek Kruusa <indrek.kruusa@gmail.com>
 > ---
 >  board/nezha/genimage.cfg | 25 +++----------------------
 >  1 file changed, 3 insertions(+), 22 deletions(-)

 > -
 >  	partition rootfs {
 >  		partition-type = 0x83
 >  		image = "rootfs.ext4"
 >  		bootable = "true"
 > -		offset = 18M
 > +		offset = 2M

Any specific reason to use 2MB? u-boot-sunxi-with-spl.bin is only 768KB.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
