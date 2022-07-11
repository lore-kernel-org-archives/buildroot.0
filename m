Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A61CC433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Jul 2022 17:17:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C642960D6A;
	Mon, 11 Jul 2022 17:17:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C642960D6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zEtazxx7OzOo; Mon, 11 Jul 2022 17:17:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E086960AFE;
	Mon, 11 Jul 2022 17:17:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E086960AFE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CCFF91BF31D
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 17:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A849982EA5
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 17:17:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A849982EA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1qNlij87e9Es for <buildroot@lists.busybox.net>;
 Mon, 11 Jul 2022 17:17:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA4B982EA1
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CA4B982EA1
 for <buildroot@buildroot.org>; Mon, 11 Jul 2022 17:17:49 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AD6AA60006;
 Mon, 11 Jul 2022 17:17:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oAx2V-002Dsg-QO; Mon, 11 Jul 2022 19:17:43 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20220607203553.3307479-1-thomas.petazzoni@bootlin.com>
 <87czeb604k.fsf@dell.be.48ers.dk>
Date: Mon, 11 Jul 2022 19:17:43 +0200
In-Reply-To: <87czeb604k.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Mon, 11 Jul 2022 19:16:11 +0200")
Message-ID: <878roz6020.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 00/11] Another set of Bootlin toolchain
 integration improvements
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
Cc: Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:
 >> Hello,
 >> Patches 1 to 9 in this series are fixes for autobuilder
 >> issues. Patches 10 and 11 are improvements.

 >> Patches 1 and 2 fix the issue of RISC-V 64-bit toolchains being
 >> available on MMU-less architectures, even though they are not
 >> supported by the toolchain.

 >> Patches 3 and 4 fix the issue of ARM little endian toolchains being
 >> selectable for ARM big endian architectures.

 >> Patches 5 and 6 fix the issue of i686 toolchains being used for < i686
 >> platforms.

 >> Patches 7, 8 and 9 fix the issue of an error when trying to copy
 >> gdbserver, with toolchains that don't have gdbserver.

 > Committed patch 1-9 to 2022.05.x and 2022.02.x, thanks.

Ups - The fixes from v2 of this series, naturally.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
