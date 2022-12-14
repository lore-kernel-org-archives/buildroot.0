Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4200C4332F
	for <buildroot@archiver.kernel.org>; Wed, 14 Dec 2022 19:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 660A340BBC;
	Wed, 14 Dec 2022 19:15:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 660A340BBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TOUmswEXz9Ex; Wed, 14 Dec 2022 19:15:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AAC1840144;
	Wed, 14 Dec 2022 19:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAC1840144
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 902981BF42C
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 19:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 674CC41841
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 19:15:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 674CC41841
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cBcYpESe3b-4 for <buildroot@lists.busybox.net>;
 Wed, 14 Dec 2022 19:15:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 421A341838
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 421A341838
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 19:15:08 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B19BFFF809;
 Wed, 14 Dec 2022 19:15:05 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p5XDb-000WwA-Uf; Wed, 14 Dec 2022 20:15:03 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20220917215300.1330070-1-james.hilliard1@gmail.com>
 <cca657ee-bbf2-2fcc-8e09-e7d7f6733694@theobroma-systems.com>
Date: Wed, 14 Dec 2022 20:15:03 +0100
In-Reply-To: <cca657ee-bbf2-2fcc-8e09-e7d7f6733694@theobroma-systems.com>
 (Quentin Schulz's message of "Mon, 12 Dec 2022 15:32:07 +0100")
Message-ID: <878rj9u79k.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/wayland: bump to version 1.21.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Quentin" == Quentin Schulz <quentin.schulz@theobroma-systems.com> writes:

Hello,

 > Can this be merged back to 2022.02.x and 2022.08.x as a security fix please?

 > Versions before 1.20.91 are vulnerable to
 > https://nvd.nist.gov/vuln/detail/CVE-2021-3782.

Thanks for the heads up. 2022.08.x is now EOL, but we can do it for
2022.02.x.

What are the reverse dependencies? We're currently using 1.19.0 on
2022.02.x, so perhaps it would be safer to instead just backport the
fix:

https://gitlab.freedesktop.org/wayland/wayland/-/commit/b19488c7154b902354cb26a27f11415d7799b0b2

Is this something you can do (and have a setup to verify on?)

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
