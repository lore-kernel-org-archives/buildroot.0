Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF26ECAAD2
	for <buildroot@archiver.kernel.org>; Sun, 28 Aug 2022 08:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 374FC826D5;
	Sun, 28 Aug 2022 08:35:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 374FC826D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CQgsKMsLi4ug; Sun, 28 Aug 2022 08:35:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E037824EE;
	Sun, 28 Aug 2022 08:35:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E037824EE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A71631BF330
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 08:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81887824EE
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 08:35:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81887824EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nnkx9xmdpsjA for <buildroot@lists.busybox.net>;
 Sun, 28 Aug 2022 08:35:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF872814A0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF872814A0
 for <buildroot@buildroot.org>; Sun, 28 Aug 2022 08:35:32 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e2dc:5f1b:7f23:232])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id B603D78031A;
 Sun, 28 Aug 2022 10:35:26 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 28 Aug 2022 10:35:26 +0200
Date: Sun, 28 Aug 2022 10:35:26 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220828083526.GF37358@scaer>
References: <20220826130843.264607-1-johan.oudinet@gmail.com>
 <20220827084732.GR37358@scaer> <20220828100605.509b1ead@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220828100605.509b1ead@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661675729;
 bh=4j7EdeG+bcxE/LQ4rv7nGSjsYSuZ2l+ZBFxp6Wme70U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tmJ8cCbqyg9qhmNoqudwKXpH5zWwSwS81uupxTLGz78IFpu1p/pD5IxqfMsP0qq8G
 ivlnkfbfG5XFC3OPlYnOWYIqPkaJPsw+8Cv7J3xkMfWOtGXUG3ijnchC0JH6831e6w
 qg/g15zee6Vz/pCTV22MuqWf3Ixr5KlzPm5LZBC6ZQG+XDoJvTl9pNHeKayUHsg/gH
 /r2Hz5jaOpR0yXROspbx0I2KnlimBsRoX+DRtxXyMU97UHbmMvBE41uM1VPludxHwE
 wD2zmQlg9BFA/mohU4RbL7ZL9J89+qx7LdutZSveM/ffSLHVkWTMTpiqDNELXcVhd2
 OS0lfTz9Ti9iA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tmJ8cCbq
Subject: Re: [Buildroot] [PATCH v2] package/forge: new package
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-08-28 10:06 +0200, Thomas Petazzoni spake thusly:
> On Sat, 27 Aug 2022 10:47:32 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> > > +define FORGE_BUILD_CMDS
> > > +	cd $(@D) && $(NPM) install && $(NPM) run build  
[--SNIP--]
> And side questions are:
>  - Does this $(NPM) install step downloads stuff? If it does, then it's
>    wrong, because it works around Buildroot's download infrastructure.

Yes, as far as I understand, that's where the vendoring step happens.
Unless we have a download post-process step like we have for go and
cargo, there is not much we can do about that. See also my further reply
on the previous iteration [0].

Also that install-then-build sequence seems to be canon, see [1].

But before we introduce either a download prost-process and/or an
npm-package infrastructure, it would be better [2] to have more than
two data-points.

[0] https://lore.kernel.org/buildroot/20220826210712.GE37358@scaer/
[1] https://lore.kernel.org/buildroot/20220827093603.GT37358@scaer/
[2] I said "better", not "nice", on purpose. ;-]

>  - Does this $(NPM) install step installs extra stuff? If it does, are
>    these extra things accounted for from a legal information
>    perspective?

Yeah, it does install the vendored stuff. And of course it is not
accounted for, what did you hope? ;-)

So, yes, FORGE_LICENSE should include something like:

    , vendored dependencies licenses probably not listed

> Yeah, I know, annoying questions :-)

Hehe... :-]

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
