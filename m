Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22021C4332F
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 16:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B586E421FC;
	Tue,  7 Nov 2023 16:15:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B586E421FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z0wxXQNHUlm5; Tue,  7 Nov 2023 16:15:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECE03421F8;
	Tue,  7 Nov 2023 16:15:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECE03421F8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A810A1BF27A
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 16:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8158B61396
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 16:15:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8158B61396
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V8QvAPlPRZoY for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 16:15:48 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EF47D61024
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 16:15:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF47D61024
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:251d:f18c:43f3:5a5b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id ED6D113F8C2;
 Tue,  7 Nov 2023 17:15:39 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 07 Nov 2023 17:15:39 +0100
Date: Tue, 7 Nov 2023 17:15:39 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20231107161539.GD229059@scaer>
References: <20231031120713.678783-1-giulio.benetti@benettiengineering.com>
 <20231101152114.GE114892@scaer>
 <26fabf07-fc17-421b-9cbb-fb721bf63374@benettiengineering.com>
 <20231103212151.GA2875@scaer>
 <579363d0-a242-444a-aecf-83f21b4e629b@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <579363d0-a242-444a-aecf-83f21b4e629b@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1699373745;
 bh=fJoeBNaPiDuNW3nTqOkWGlOJdiD2niGZLct2U4RUJqU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lsQXWIPHz4Lo6E6TtyQ91WQ0J2CG62tXtluLOdkM8a/VElozzQ+HUeJG/TGzwb6+O
 HR+XC/mInWc6YvCPaU8a19Hkc+SroAoEtPCdtp+PIhQ6bno4e7RBkiaveKhatrwTk8
 hRAqIVIqW2k6W9jf7Yg4jbmuP969REjY8K4FG8EsU3/E4mLgGcLJtpHYNtqPFHQCCv
 tZTh+YXzi6s9WopMC/Q5iAkd/AnMMcDinUPp69un9OD0Z47K8CSAEq+x/5mf3CyWnQ
 J7Ql/J8ZLtj4gvAzrUYTqR7nAIdEOsat/U0CWfPS2gKIbxq+I2kxNfBn6Zfnx1mJqG
 1nLg9I2gFZ6pg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lsQXWIPH
Subject: Re: [Buildroot] [PATCH] package/nodejs/nodejs-src: remove .node
 files with different architecture
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
Cc: buildroot@buildroot.org, Daniel Price <daniel.price@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2023-11-05 15:27 +0100, Giulio Benetti spake thusly:
> On 03/11/23 22:21, Yann E. MORIN wrote:
> >Oh, I was just walking the "npm is a mess anyway, just ignore anything
> >from it, we don't care" road. If we take this stance, then
> >_BIN_ARCH_EXCLUDE is a trivial way to avoid the check-bin-arch issue.
[--SNIP--]
> Since npm rebuilding is not that easy and fast to deal with I've just sent
> this patch to temporary exclude the /usr/lib/node_modules folder
> as you've suggested(forgotten to add "Suggested-by: Yann E. MORIN
> <yann.morin.1998@free.fr>").
> 
> Later I hope to find time to deal with npm rebuilding.

I think tht it might in fact be what we're doing already, as we use:
    npm_config_build_from_source=true

in the environment when we call npm.

However, I was not able to find any reference to those options... :-/

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
