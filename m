Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFB2C433F5
	for <buildroot@archiver.kernel.org>; Fri, 30 Sep 2022 15:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7BBB4101B;
	Fri, 30 Sep 2022 15:13:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7BBB4101B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 36X2znLyHVM4; Fri, 30 Sep 2022 15:13:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CC1240C36;
	Fri, 30 Sep 2022 15:13:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CC1240C36
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2B6EA1BF2F7
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 15:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07068610F8
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 15:13:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07068610F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L1m0o-3e2PJy for <buildroot@lists.busybox.net>;
 Fri, 30 Sep 2022 15:13:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36208610C7
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 36208610C7
 for <buildroot@buildroot.org>; Fri, 30 Sep 2022 15:13:05 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BE4D1240014;
 Fri, 30 Sep 2022 15:13:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oeHhG-00Bcbr-Fn; Fri, 30 Sep 2022 17:13:02 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <a8ea0d5fc6b7f447cbfab2426e1fe3687ee7e0d1.1662007555.git.baruch@tkos.co.il>
 <c4193508bfb3de595c8cb3652d6f3dd69acd7fb9.1662007555.git.baruch@tkos.co.il>
 <20220924103725.0778da2d@windsurf>
Date: Fri, 30 Sep 2022 17:13:02 +0200
In-Reply-To: <20220924103725.0778da2d@windsurf> (Thomas Petazzoni's message of
 "Sat, 24 Sep 2022 10:37:25 +0200")
Message-ID: <87k05k520x.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] board/solidrun/macchiatobin: update BSP
 components version
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
Cc: buildroot@busybox.net, Sergey Matyukevich <geomatsi@gmail.com>,
 Baruch Siach via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Thu,  1 Sep 2022 07:45:55 +0300
 > Baruch Siach via buildroot <buildroot@buildroot.org> wrote:

 >> Update the listed versions to match current status since commit
 >> b4d9b515088d ("configs/solidrun_macchiatobin: bump BSP components").
 >> 
 >> All components are now from upstream so no need to state that for each
 >> one.
 >> 
 >> Cc: Sergey Matyukevich <geomatsi@gmail.com>
 >> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 >> ---
 >> board/solidrun/macchiatobin/readme.txt | 6 +++---
 >> 1 file changed, 3 insertions(+), 3 deletions(-)

 > Applied to master, thanks.

Committed to 2022.02.x, 2022.05.x and 2022.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
