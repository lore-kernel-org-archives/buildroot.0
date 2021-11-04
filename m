Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAF13C433EF
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 21:48:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FE3B61244
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 21:48:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3FE3B61244
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AEA6405FE;
	Thu,  4 Nov 2021 21:48:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id haYxzVuHzOVF; Thu,  4 Nov 2021 21:48:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FD6040588;
	Thu,  4 Nov 2021 21:48:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0E1031BF8A8
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 21:48:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F221740588
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 21:48:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gDyJchKONk13 for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 21:48:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD11340506
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 21:48:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d011:289f:59c0:9f5b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 82E6E13F81D;
 Thu,  4 Nov 2021 22:48:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636062513;
 bh=hMsEQA0UkKT1zEYBhpRFlyFPL5uiHX9XF7ozbbqwNVg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Nf2uuXJ20PmNAn+wBNj4xdaRfBgEuvPKbc1l1BWFg2Ivfef61ZP8T6XbKKm8nY1hS
 F+gDQWJeopy6DYuTMsGlOcqRP3oX7uANtt5JHv0gADzPilFUfKN1D2rNPTnPfeoGRF
 G43MHOngLWRDMUGVMQY/6S+/rdpJZk2ojfjb13mFeMi8kYqzatUCmnN5WMVFfp0rDX
 bSKHRgwxHCkIacl59d5aJxCQgRcR4t7FRiC5WvCmHe+3FipI8bB7Wxsky4J7RBoMbk
 nWb47v5LpdMjCI1wIc5OuGiWfzS2ZBomOyMmDa8AB68VfMz0a22+JwR7SXM1jfPQPv
 Iujuwm0HGFUPQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 04 Nov 2021 22:48:29 +0100
Date: Thu, 4 Nov 2021 22:48:29 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20211104214829.GC2400@scaer>
References: <20211104065422.88A6E81027@smtp1.osuosl.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211104065422.88A6E81027@smtp1.osuosl.org>
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

Hello All,

Fabrice, Waldemar, the following touches packages you are interested in,
on there are patches you sent that may need some more work:

On 2021-11-04 06:54 -0000, Thomas Petazzoni spake thusly:
> Autobuild statistics for 2021-11-03

Here are a few quick analysis of the unknown failures. They all occur
with a top-level parallel build (which is not the issue!), that's why
the actual reason is not directly visible. See below for some quick
analysis...

> Detail of failures for master
[--SNIP--]
>     arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/b0c3e81e1f6791c4ba95e15941e2f033260e7ad5 |     

The setfacl requirement for tpm2-tss. There is a pending patch by
Fabrice, but there are some deeper concerns about it:
    https://patchwork.ozlabs.org/project/buildroot/patch/20211013065446.1857356-1-fontaine.fabrice@gmail.com/

>     arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/57c93b8a4c03a4e2312eff7d7bce233008aae3ae |     

Host-ruby started to build, but did not finish. Maybe related to the
patch from Fabrice:
    https://patchwork.ozlabs.org/project/buildroot/patch/20211026070603.3811023-1-fontaine.fabrice@gmail.com/

>     sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/2e0055263d1d8f9df00182a9823bd58bda09bdef |     

vim started to build, but did not finish.

>     sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/e050e77b06e9a84ab0ed68179bc90a526baf8a59 |     

tpm2-tss started to configure, but did not finish. Most probably, the
setfacl issue again.

>     arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/dcce065cf393cd1f46320f85e88cb69a3e51cdc0 |     

The tpm2-tss setfacl issue again.


Hint, and to serve as my own memory: if investigating a reported-unknown
failure, just grab the build-time.log.gz, decompress it, and pass it
through this python3 script:


    with open('build-time.log', 'r') as f:
        lines =  [l.rstrip('\n\r') for l in f.readlines()]
    pkg = dict()
    for l in lines:
        items = [i.strip() for i in l.split(':')]
        if items[1] == 'start':
            pkg[items[3]] = items[2]
        else:
            del pkg[items[3]]
    print(pkg)

This reports all the packages (usually one) that had a step started that
did not end, e.g.;

    {'tpm2-tss': 'configure'}

Plop.

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
