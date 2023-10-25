Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0FC4C0032E
	for <buildroot@archiver.kernel.org>; Wed, 25 Oct 2023 19:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 513BE81975;
	Wed, 25 Oct 2023 19:19:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 513BE81975
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RYiA4AAVb-_p; Wed, 25 Oct 2023 19:19:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6C0980E7B;
	Wed, 25 Oct 2023 19:19:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6C0980E7B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B77121BF295
 for <buildroot@lists.busybox.net>; Wed, 25 Oct 2023 19:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9140060A87
 for <buildroot@lists.busybox.net>; Wed, 25 Oct 2023 19:19:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9140060A87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MMjW3gfWIQFe for <buildroot@lists.busybox.net>;
 Wed, 25 Oct 2023 19:19:14 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 95CC660881
 for <buildroot@buildroot.org>; Wed, 25 Oct 2023 19:19:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95CC660881
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6F7D440002;
 Wed, 25 Oct 2023 19:19:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qvjPL-004OXA-HX; Wed, 25 Oct 2023 21:19:11 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@smile.fr>
References: <20230817230844.450092-1-romain.naour@gmail.com>
 <20230817230844.450092-4-romain.naour@gmail.com>
 <35a394cd-799f-9a00-68b1-2e2b6e14bdcc@mind.be>
 <b16fd091-eb7b-48e3-84ea-d4c3b71f7db3@smile.fr>
Date: Wed, 25 Oct 2023 21:19:11 +0200
In-Reply-To: <b16fd091-eb7b-48e3-84ea-d4c3b71f7db3@smile.fr> (Romain Naour's
 message of "Wed, 25 Oct 2023 16:50:03 +0200")
Message-ID: <87edhiqzm8.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 4/4] configs/avenger96_defconfig: bump ATF
 version to 2.9 for binutils 2.39+ support
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
Cc: Marleen Vos <marleen.vos@mind.be>, Romain Naour <romain.naour@gmail.com>,
 Dario Binacchi <dariobin@libero.it>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

Hi,

 > So today we are using a toolchain using releases that were not yet available at
 > the time that the avenger96_defconfig was contributed.

I do have an avenger96 board, but I don't recall having seen any
notifications about failures? Anyway, I'll get my board up and running
again and verify.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
