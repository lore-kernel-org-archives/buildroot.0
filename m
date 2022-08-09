Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 202E6C19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 16:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD2B260BB2;
	Tue,  9 Aug 2022 16:36:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD2B260BB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k9NTJ0PTe7Dd; Tue,  9 Aug 2022 16:36:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D776660B4E;
	Tue,  9 Aug 2022 16:36:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D776660B4E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 95E221BF860
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 16:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E04C813DC
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 16:36:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E04C813DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oao1M_ZKbJxz for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 16:35:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22FE3813B1
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 22FE3813B1
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 16:35:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:55f2:8e98:fc59:1d5e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id F302A13FA3E;
 Tue,  9 Aug 2022 18:35:50 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 09 Aug 2022 18:35:50 +0200
Date: Tue, 9 Aug 2022 18:35:50 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Vincent Fazio <vfazio@xes-inc.com>
Message-ID: <20220809163550.GF3168@scaer>
References: <CAM6O0Zgc_jfn+m1ZhRByLQ4QDDAYpAOQv-9aDRgruSYKWV5wUA@mail.gmail.com>
 <20220808122020.0c1ec66a@windsurf>
 <CAM6O0ZjLizEsUWZr106T6+WowWdkqE7k_a1bCaPeAVbPScZ6Ag@mail.gmail.com>
 <ea0d3b02-e5e1-9f4d-0d3a-a498f5d184f0@mind.be>
 <CAM6O0ZicaNFBn--yCoWOUkZZ3wBLKY24SDjTjsGz2y0Mbjy_1w@mail.gmail.com>
 <PH1P110MB1603D8E2804E4F31B878B6039F629@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <PH1P110MB1603D8E2804E4F31B878B6039F629@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660062957;
 bh=tMpxVT1dQxLywoMtBaPItPoPb42s85MUVRZBalhJrvQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TzxJ5BIBt0ZRZ8fTPhFVaCohpKlXp8Nz+ETYHxOLg733SjXLU/lsNnp04ufpcFz7s
 FdgW76iVxa4J80synQ5BtK2tuHyOxeDdCog9b9YLQRIrLqnY47E2o8FDuAj+vYDvzI
 WfifyPRIhMwpHbV7uHyFZPr3x3Pb8zKGsn7kPpFm//ztw/kOpL3b3keV7TtVG5K83j
 v6ZOcJqiPh3A7jzoT2VOsBzvjHnRuo7SmRpyCesco3lXqylY9Dey9U42S5PEADH2Q+
 tv80dD/2V+qx863UzYowFj9vgy0a/+FVxi1PgUBneBGV8M8VNLwqzU1l4hFlJGfPGq
 IyvruXpjOfGaQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TzxJ5BIB
Subject: Re: [Buildroot] [External] - Re: Python pyc only and problem with
 scripts
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
Cc: Federico Pellegrin <fede@evolware.org>,
 Marcus Hoffmann <marcus.hoffmann@othermo.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Vincent, All,

On 2022-08-09 12:54 +0000, Vincent Fazio spake thusly:
[--SNIP--]
> That said,  if you read PEP 3147, it's pretty clear that sourceless distributions are "legacy",
> so anything we do is likely outside of the scope of what upstream intends to support. It may still be
> worth having a discussion about long term support options

Ref;
    https://peps.pythondiscord.com/pep-3147/#case-4-legacy-pyc-files-and-source-less-imports

    ---8<---
    Case 4: legacy pyc files and source-less imports

    Python will ignore all legacy pyc files when a source file exists
    next to it. In other words, if a foo.pyc file exists next to the
    foo.py file, the pyc file will be ignored in all cases

    In order to continue to support source-less distributions though,
    if the source file is missing, Python will import a lone pyc file
    if it lives where the source file would have been.
    ---8<---

Vincent, Thomas, and I have had a quick discussion on IRC, which boils
down to reading the PEP3147 in two (or three) ways:

  - Vincent: legacy (pyc files and source-less imports)
    => both pyc files on their own *and* source-less distributions
       are considered legacy

  - Yann: (legacy pyc files) and (source-less imports)
    => only pyc files on thier own are legacy; source-less distribution
       is still supported

  - Thomas: in-between
    => "Because we can't break the world overnight, we continue to
       support this, but it sucks"

So, Vincent has opened an issue to ask for clarification:
    https://github.com/python/cpython/issues/95827

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
