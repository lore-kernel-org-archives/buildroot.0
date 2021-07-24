Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B313FC4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 21:30:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E59160E90
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 21:30:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7E59160E90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08CE6605EC;
	Sat, 24 Jul 2021 21:30:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bRBDqFG63rvp; Sat, 24 Jul 2021 21:30:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09E9A60777;
	Sat, 24 Jul 2021 21:30:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 119CC1BF2AA
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 21:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00F4E826C1
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 21:30:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NtwLxdUaYVBf for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 21:30:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC0C582521
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 21:30:35 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 1A2C4240002;
 Sat, 24 Jul 2021 21:30:30 +0000 (UTC)
Date: Sat, 24 Jul 2021 23:30:29 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20210724233029.0b6e4d2f@windsurf>
In-Reply-To: <20210721214518.227254-1-aduskett@gmail.com>
References: <20210721214518.227254-1-aduskett@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/4] package/polkit: bump version to
 0.119 and use duktape
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Marek Belisko <marek.belisko@open-nandra.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Norbert Lange <nolange79@gmail.com>,
 Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Wed, 21 Jul 2021 14:45:15 -0700
Adam Duskett <aduskett@gmail.com> wrote:

> Unfortuantly, as of commit 3e1d61868fa8bfc586099302e931433270e5d17d, polkit
> requires mozjs >= 78, which means spidermonkey is too old. As such, this patch
> is larger than usual.
> 
> Spidermonkey has a few major issues:
>   - The source directory after compilation is enormous (2.7G!)
>   - The shared library is 24MB stripped!
>   - It requires python2 to build, which is EOLed, and Buildroot is working
>     towards removing. See: https://elinux.org/Buildroot:Python2Packages
> 
> Instead of going through the arduous task of updating Spidermonkey, there is a
> better solution: use duktape.
> 
> There has been a pending patch for over a year that incorporates duktape as an
> optional backend for polkit found here:
> https://gitlab.freedesktop.org/polkit/polkit/-/merge_requests/35
> 
> As Thomas Petazzoni put it:
>   "As I am subscribed to notifications on this merge request, I have been
>   following the intermittent discussions taking place on this topic.
>   And indeed, discussions have been sparse, and the polkit maintainer reaction
>   has not been very supportive. It even feels like they are trying to find
>   every possible argument or small issue not to merge the duktape integration."
> 
> Many people have come out to support using duktape, and many users, including
> myself, have used polkit with duktape for as long as the above merge request has
> been around without issues; merging in the above merge request is an acceptable
> exception to the typical Buildroot package policies.
> 
> As Thomas also suggested, I have forked polkit on Github
> (https://github.com/aduskett/polkit-duktape), with the above duktape
> merge request applied, and a release made with the same tag as upstream (0.119).
> 
> I refrained from also adding 0001-make-netgroup-support-optional.patch as it is
> outside of the scope of why the fork exists.
> 
> Changes:
>   - refactor 0001-make-netgroup-support-optional.patch to work with 0.119 and
>     duktape.
>   - Remove upstream incorporated 0002-jsauthority-memleak.patch
>   - Remove upstream 0003-polkit-0.116-pkttyagent-sigttou-bg-job.patch
>   - Remove any trace of spidermonkey from polkit, udisks, and systemd-polkit
>   - Add duktape as a dependency of polkit
>   - Change POLKIT_SITE to the above polkit-duktape GitHub repository.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

Thanks a lot for this new iteration, I have applied the entire series
to master. Thanks for this work, it's really great to have that in
Buildroot now.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
