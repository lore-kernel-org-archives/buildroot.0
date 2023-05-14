Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD7CDC77B7F
	for <buildroot@archiver.kernel.org>; Sun, 14 May 2023 18:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF29D41F7E;
	Sun, 14 May 2023 18:42:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF29D41F7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zPS77gAVA72l; Sun, 14 May 2023 18:42:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C92D741F6A;
	Sun, 14 May 2023 18:42:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C92D741F6A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 922E21BF5A2
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 18:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A789611A4
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 18:42:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A789611A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5QdGfaVPhPcT for <buildroot@lists.busybox.net>;
 Sun, 14 May 2023 18:42:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE46960F12
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EE46960F12
 for <buildroot@buildroot.org>; Sun, 14 May 2023 18:42:20 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AF6CB1C0002;
 Sun, 14 May 2023 18:42:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pyGfg-00HG41-Ne; Sun, 14 May 2023 20:42:16 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20230412222602.1975782-1-aduskett@gmail.com>
 <20230412222602.1975782-2-aduskett@gmail.com>
 <874joh2waj.fsf@dell.be.48ers.dk> <20230513201205.GG2582048@scaer>
Date: Sun, 14 May 2023 20:42:16 +0200
In-Reply-To: <20230513201205.GG2582048@scaer> (Yann E. MORIN's message of
 "Sat, 13 May 2023 22:12:05 +0200")
Message-ID: <87zg6621rr.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/3] package/nftables: bump to version 1.0.7
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Peter, All,
 > On 2023-05-12 21:18 +0200, Peter Korsgaard spake thusly:
 >> >>>>> "Adam" == Adam Duskett <aduskett@gmail.com> writes:
 >> > Other changes:
 >> >   - Switch to tar.xz as the package is not distributed as a .bz2 any longer.
 >> >   - Update the sha256sum of the license file, as it has been updated to
 >> >     include the following text:
 >> >     "Original author of nftables distributed the code under the terms of the
 >> >      GPL version 2 *only*. New code though is moving to GPL version 2 or any
 >> >      later which is the preferred license for this project these days."
 >> >     The author has also changed from Patrick McHardy <kaber@trash.net> to
 >> >     Pablo Neira Ayuso <pablo@netfilter.org>
 >> But the combination is presumably still GPL-v2-only for now?

 > I would believe so, yes.

 >> > Signed-off-by: Adam Duskett <aduskett@gmail.com>
 >> Committed, thanks.

 > Since you did not push, I did. ;-)

Ups, indeed - Thanks!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
