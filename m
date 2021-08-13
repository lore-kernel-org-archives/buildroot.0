Return-Path: <SRS0=Wz+O=NE=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 287ACC4338F
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 05:29:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD5D8610CC
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 05:29:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BD5D8610CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FBD160656;
	Fri, 13 Aug 2021 05:29:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qOLealMWUFKc; Fri, 13 Aug 2021 05:29:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C88A4606D4;
	Fri, 13 Aug 2021 05:29:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5B8C01BF2F1
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 05:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4341640377
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 05:29:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D_6BYEPN4XH1 for <buildroot@lists.busybox.net>;
 Fri, 13 Aug 2021 05:29:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 312B340188
 for <buildroot@uclibc.org>; Fri, 13 Aug 2021 05:29:12 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1mEPkk-0003XM-9l
 for buildroot@uclibc.org; Fri, 13 Aug 2021 07:29:10 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 13 Aug 2021 07:28:03 +0200
Message-ID: <3gchuhxp9g.ln2@ID-313208.user.individual.net>
References: <cover.1468274498.git.yann.morin.1998@free.fr>
 <99d32ded-9102-c9a7-4f15-38d1bd0a0537@t-online.de>
 <20210308223040.GF2737665@scaer>
Mime-Version: 1.0
User-Agent: Pan/0.145 (Duplicitous mercenary valetism; d7e168a
 git.gnome.org/pan2)
Subject: Re: [Buildroot] [PATCH 00/12 v8] Introduce libudev (branch
 yem/libudev-4)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi Yann,

Am Mon, 08 Mar 2021 23:30:40 +0100 schrieb Yann E. MORIN:

> Well, eudev now has had the ability to only build the library for a 
while
> already:
> 
>     https://github.com/gentoo/eudev/commit/
18565392cfecb5be6f3261ae0f82827c9ecfa08b

great, I did not know that.

> So, I would prefer we first stick with just eudev like my latest branch:
>     https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/libudev-6

Agreed.

> Then, of course, we could add libudev-zero as a fourth provider for
> libudev, why not...

With eudev being able to provide libudev there is no need for libudev-
zero from my pov anymore.

> Sorry I haven't taken the time to properly rebase and resend this v6 of
> my branch yet... :-( I can try to have a look, but feel free to grab my
> patches and massage them as needed. Most patches need better commit
> log...

Here you can find your rebased branch with kodi support added:
https://github.com/bkuhls/buildroot/commits/master_libudev

Run-time test with libcec detecting the cec adapter using libudev 
provided by eudev was positive.

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
