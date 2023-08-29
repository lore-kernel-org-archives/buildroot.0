Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050BAC71153
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 20:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4C1260F2B;
	Tue, 29 Aug 2023 20:09:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4C1260F2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RjK-0mDKMh71; Tue, 29 Aug 2023 20:09:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1425560EAA;
	Tue, 29 Aug 2023 20:09:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1425560EAA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 02D8D1BF59B
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 20:09:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD0B281338
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 20:09:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD0B281338
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wXt0rB4u5ZzS for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 20:09:48 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D482A812E5
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 20:09:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D482A812E5
Received: by mail.gandi.net (Postfix) with ESMTPSA id 26A8120005;
 Tue, 29 Aug 2023 20:09:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qb51z-008P6J-77; Tue, 29 Aug 2023 22:09:43 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Vincent Fazio <vfazio@gmail.com>
References: <20230706171834.1065129-1-vfazio@gmail.com>
Date: Tue, 29 Aug 2023 22:09:43 +0200
In-Reply-To: <20230706171834.1065129-1-vfazio@gmail.com> (Vincent Fazio's
 message of "Thu, 6 Jul 2023 12:18:32 -0500")
Message-ID: <87y1ht3914.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/3]
 toolchain/toolchain-external/toolchain-external-bootlin: flag OpenMP
 support
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
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Vincent" == Vincent Fazio <vfazio@gmail.com> writes:

 > Due to a bug in the upstream toolchain builder's fragment generator [0],
 > gen-bootlin-toolchains is not aware that OpenMP was enabled for all
 > 2022.08 toolchains.

 > OpenMP support needs to be flagged so the proper libraries get copied
 > into the resultant filesystem to avoid missing dependencies [1].

 > [0]: https://github.com/bootlin/toolchains-builder/issues/60
 > [1]: https://bugs.busybox.net/show_bug.cgi?id=15634

 > Signed-off-by: Vincent Fazio <vfazio@gmail.com>

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
