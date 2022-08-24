Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FEA6C00140
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 09:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0BFD40B00;
	Wed, 24 Aug 2022 09:32:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0BFD40B00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pBgyvfPn5T3s; Wed, 24 Aug 2022 09:32:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 01BAA403E9;
	Wed, 24 Aug 2022 09:32:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01BAA403E9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0F7981BF357
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 09:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD4804087B
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 09:32:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD4804087B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q7ZHlp6Wx-NK for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 09:32:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95CA64067C
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 95CA64067C
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 09:32:11 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:7dbd:6c96:78c0:4dbe])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 1B31F200390;
 Wed, 24 Aug 2022 11:32:00 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 24 Aug 2022 11:32:00 +0200
Date: Wed, 24 Aug 2022 11:32:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220824093200.GA2969832@scaer>
References: <20220820113352.4976-1-fontaine.fabrice@gmail.com>
 <20220821094911.GR2775145@scaer> <20220821120304.GU2775145@scaer>
 <20220823093051.GA2775145@scaer>
 <f75b663e-0584-3777-d61c-e9e4010ad3b9@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f75b663e-0584-3777-d61c-e9e4010ad3b9@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661333528;
 bh=eraTArLxbs5Gd17OEVqIb6ODIKNMXjykmHLySGY1vDs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PagTkDH+8eNvi4FkA9K0uTWyVr21Hemyx5SSgK/1fIBMqTSCvJli/J4UZ5HF8vZRD
 N9BSLnDMvgpyP65KL54ijjAFexBOeolPzRmA0/CYjSY/0S0n1U4f+rNdc3CMZSqOw/
 Si7YxSYExVao7iiQyweURaTMWEb6cdHjnPJuOinNg3D7xr5Dqd8vPrMoqteyh7w6r6
 /k1kEKUPmM/UqINjZpiBwq1iAEm9Zar4pbPc6oUK/++QqiK8mji/WQw7cbuQkKL2hY
 +rUgcEhRUMULGwRHxkaAdmwbad0iQmCLipWjIVlzAnb5NVRYNU2IOymGZlroribFan
 CtFjvHj3S1SjQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PagTkDH+
Subject: Re: [Buildroot] [PATCH 1/1] utils/genrandconfig: add
 jquery-ui-themes handling
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ARnout, All,

On 2022-08-23 22:14 +0200, Arnout Vandecappelle spake thusly:
> On 23/08/2022 11:30, Yann E. MORIN wrote:
[--SNIP--]
> >This has now been running for almost 48 hours straight, and there has
> >been 10005 configs generated, 55 with BR2_PACKAGE_JQUERY_UI_THEMES
> >enabled, of which none with BR2_PACKAGE_JQUERY_UI_THEMES_THEME unset.
>  Isn't it simply fixed by commit f008c74061e604069d9716ac97d2a3f78c9f00b3 ?
> The autobuild failure didn't contain that commit yet.

Damn. I only ever looked at the genrandconfig git log, and did not even
think about looking at the pacgae log. Sigh...

Thanks for the heads-up.

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
