Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0288C433EF
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 20:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9298D4148A;
	Thu,  9 Jun 2022 20:53:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y8Xy08zItVxr; Thu,  9 Jun 2022 20:53:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DF18410D3;
	Thu,  9 Jun 2022 20:53:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5B3601BF2F0
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 497FB410D3
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:53:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A1kI3phUKjyc for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 20:53:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 53ED9409B1
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 20:53:49 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5DEC9200003;
 Thu,  9 Jun 2022 20:53:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nzPA2-002Ndv-Iu; Thu, 09 Jun 2022 22:53:46 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220606163914.1592818-1-fontaine.fabrice@gmail.com>
Date: Thu, 09 Jun 2022 22:53:46 +0200
In-Reply-To: <20220606163914.1592818-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 6 Jun 2022 18:39:14 +0200")
Message-ID: <87y1y5y2w5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/rockchip-mali: fix armeb build
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 =?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following armeb build failure raised since the addition of the
 > package in commit 97c74a73e5dee17530647f89b2c7d8692781eb14:

 > ERROR: architecture for "/usr/lib/libmali-bifrost-g31-rxp0-gbm.so" is "AArch64", should be "ARM"

 > Fixes:
 >  - http://autobuild.buildroot.org/results/33ebfa936da8dfa4035db08a96f8872d7c9db6c3

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
