Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 207EFC433F5
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 21:23:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B32436103E
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 21:23:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B32436103E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8929861579;
	Fri,  5 Nov 2021 21:23:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lyqWzlKsXAp5; Fri,  5 Nov 2021 21:23:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3A24605CD;
	Fri,  5 Nov 2021 21:23:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1FEA91BF5B5
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 21:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0DEFB400BE
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 21:23:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z0k_E3gSg_xX for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 21:23:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE7E64011F
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 21:23:27 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9d6e:5497:a761:f603])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 177025FF10;
 Fri,  5 Nov 2021 22:23:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636147406;
 bh=PThFf00UiT8HXdGOSWphlapIgaf7KlA6FJUFZGkeYnI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s1ZZznZVS+2FmXl3T4Z9ZMAiUZL+6yCC4MhVA+zxPrldqu2YcTa4LvVVJNq+2pIqO
 GOOW59ZXysj7bHO69lujIxOGXG7pa5nsoKiL4+GFqHrhakc2KN0Y2aA9QsQ3skb9Uh
 oCSzU8H8FACOKDGFoUWWJWDraJ6WJQMJFHZGIeHuuw2X9jpBRjBHhLStwtrPJQDr/h
 w2GETiWvXXUG3HHAwsAH1r2cxI1nnpFQGAlnzqRma266ASYvth3Q1B7+4QENCJaKXd
 +D0Ssvhd+hKyqjyF8b8JWU/qkuEQ+cc2EZqyQeGDr5jD5VhPmXHg+YgYtnSC+PBoVH
 Rk19DLo90kY6Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 05 Nov 2021 22:23:21 +0100
Date: Fri, 5 Nov 2021 22:23:21 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20211105212321.GG2400@scaer>
References: <20211104065422.88A6E81027@smtp1.osuosl.org>
 <20211104214829.GC2400@scaer> <20211105092502.5e3ac821@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211105092502.5e3ac821@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2021-11-03
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

Thomas, All,

On 2021-11-05 09:25 +0100, Thomas Petazzoni spake thusly:
> On Thu, 4 Nov 2021 22:48:29 +0100
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > Hint, and to serve as my own memory: if investigating a reported-unknown
> > failure, just grab the build-time.log.gz, decompress it, and pass it
> > through this python3 script:
> > 
> > 
> >     with open('build-time.log', 'r') as f:
> >         lines =  [l.rstrip('\n\r') for l in f.readlines()]
> >     pkg = dict()
> >     for l in lines:
> >         items = [i.strip() for i in l.split(':')]
> >         if items[1] == 'start':
> >             pkg[items[3]] = items[2]
> >         else:
> >             del pkg[items[3]]
> >     print(pkg)
> > 
> > This reports all the packages (usually one) that had a step started that
> > did not end, e.g.;
> > 
> >     {'tpm2-tss': 'configure'}
> 
> Should we augment the logic that detects the failure reason with
> something like this, when the reason is "unknown" ? It would be ideal
> to also get the package version, so we could get the exact same
> information as we have with "normal" failures.

Oh-noes, another side track! ;-)

But the autobuilder website can only report one package per build
failure, so if the above were to return more than one package, how
should we handle it? Just pick one randomly?

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
