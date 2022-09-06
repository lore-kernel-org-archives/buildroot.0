Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFE4AECAAA1
	for <buildroot@archiver.kernel.org>; Tue,  6 Sep 2022 21:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4253D404F3;
	Tue,  6 Sep 2022 21:41:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4253D404F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 268jrYYOcoWp; Tue,  6 Sep 2022 21:41:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E13D404E2;
	Tue,  6 Sep 2022 21:41:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E13D404E2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 51CA81BF9BA
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 21:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D39160B6B
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 21:41:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D39160B6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jEa41SH_SSDe for <buildroot@lists.busybox.net>;
 Tue,  6 Sep 2022 21:41:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BBB360B52
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4BBB360B52
 for <buildroot@buildroot.org>; Tue,  6 Sep 2022 21:41:23 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:f72e:cac9:64c4:382d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 481F113F846;
 Tue,  6 Sep 2022 23:41:19 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 06 Sep 2022 23:41:19 +0200
Date: Tue, 6 Sep 2022 23:41:19 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20220906214119.GD1490660@scaer>
References: <20220906161557.2645766-1-peter@korsgaard.com>
 <20220906213513.GC1490660@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220906213513.GC1490660@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662500481;
 bh=Fh1tx26PL3VoQ9oM2oWM744n3zJj9KWTZiPupnwwB9U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k4YqTRvv3AhscbaCFrv6qhIG8BudeujFs8YfMYSKixGY5BMnPJtWR9qfPS9Mtel5o
 8+86NOGge2xs/8R9WUeFEGpKXYDOCOZ3pyD2Oie9K+pKPGF4bWwoFYAMnp8eSANmfZ
 HFvsMYQDjfkxrVcR3BZOzmXq1gew2vaPSJQ0r0RSxIhUVBMpgGr+7Vu6WJdJyloPm0
 uvRgpBVT8ZyXEN61PiwLayPkzZnqjl6FOeYsIUEq9AWth+rUJ113ufBQabvmZKWLDZ
 1YrSPTRgBHDj/vAOE5Zi/HIix2TOQLFOrQ8bGI7sJvY/av30WhbOHYYiKVP5lvIG9+
 UgvYff95gOofw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=k4YqTRvv
Subject: Re: [Buildroot] [PATCH-next 1/2] nezha_defconfig: bump opensbi,
 u-boot and linux
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2022-09-06 23:35 +0200, Yann E. MORIN spake thusly:
> On 2022-09-06 18:15 +0200, Peter Korsgaard spake thusly:
> > [...]  Keep the kernel build configuration in
> > place so host-{bison,flex} is built.
> Finally, with PPD, the PPD of u-boot would not have host-flex and
> host-bison because of the kernel anyway (it gets them from host-dtc
> instead) as the kernel is not a dependency of u-boot.

And the build did actually succeed with PPD when running in our docker
ref image which does not have flex or bison, and removing those two
lines:
    BR2_LINUX_KERNEL_DTS_SUPPORT=y
    BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun20i-d1-nezha"

But since I don't have the board, I can't test it...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
