Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7772C4332F
	for <buildroot@archiver.kernel.org>; Wed, 14 Dec 2022 19:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8ED6681E66;
	Wed, 14 Dec 2022 19:01:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8ED6681E66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LBbcA11MVfBQ; Wed, 14 Dec 2022 19:01:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B170880C2B;
	Wed, 14 Dec 2022 19:01:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B170880C2B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 858321BF312
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 19:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60DCA40144
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 19:01:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60DCA40144
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LQXVAHzl3AjO for <buildroot@lists.busybox.net>;
 Wed, 14 Dec 2022 19:01:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AED040127
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5AED040127
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 19:01:47 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 21F73C0005;
 Wed, 14 Dec 2022 19:01:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p5X0i-000Vxv-8s; Wed, 14 Dec 2022 20:01:44 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Quentin Schulz <foss+buildroot@0leil.net>
References: <20221213-cairo-cves-v1-0-b802b492d112@theobroma-systems.com>
Date: Wed, 14 Dec 2022 20:01:44 +0100
In-Reply-To: <20221213-cairo-cves-v1-0-b802b492d112@theobroma-systems.com>
 (Quentin Schulz's message of "Wed, 14 Dec 2022 12:16:00 +0100")
Message-ID: <87pmclu7vr.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 0/2] package/cairo: fix multiple CVEs
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Quentin" == Quentin Schulz <foss+buildroot@0leil.net> writes:

 > This fixes CVE-2019-6462 with an upstream patch and CVE-2020-35492 with a patch
 > slightly modified compared to upstream (namely removing tests since it includes
 > a png file which `patch` does not know how to handle when applying the patch).

Thanks!

 > There's still one CVE in the wild: CVE-2019-6461 but there's no patch for it yet
 > (not even an attempt),
 > c.f. https://gitlab.freedesktop.org/cairo/cairo/-/issues/352.

 > Yocto does have a patch for it though:
 > https://cgit.openembedded.org/openembedded-core/tree/meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch?id=a89bea9fed0005bc7d820a1fc6a9d6dd7c246c22
 > (don't mind the wrong CVE name, I'll send a patch fixing it soon).

 > But I'm not entirely convinced it's a proper fix? So i'll leave it up for
 > discussion.

That indeed looks kind of fishy to me, but I don't really know much
about cairo. Anyone?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
