Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A1DDC433FE
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 16:20:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCF1861100
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 16:19:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CCF1861100
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68F2160ACE;
	Wed, 13 Oct 2021 16:19:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IvZX-WHnJ_Hm; Wed, 13 Oct 2021 16:19:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD16E608ED;
	Wed, 13 Oct 2021 16:19:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 74F981BF2F0
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 16:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64CFB608ED
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 16:19:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qrVBEoj1qeqQ for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 16:19:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 713BC605A2
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 16:19:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5b8:fa6c:9a56:27a6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 7E593780326;
 Wed, 13 Oct 2021 18:19:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634141993;
 bh=HalcLQWhan04byJkyRzPHR2NT2NYkwlrC8pRmBzgMno=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g25kmX5z69xlc5f5UPUKMgTJPwFL4duluO6I8h4AcWyqcsE2kQcM28pgLu15+WgFn
 If2X/hCCZcBx9t3boyRyyswpk05u7TVnw9hlzJoRpcFKueHMnMd/QKEypeSIX8Ak7g
 qgE+r81i7Gzu1LQkEUAMYF3nGta7EKcOKDb29F7VuW4G6PLptU+f9ZGUEHGpDoJ6pA
 eBrnXC1zFi3+HhbuOmL0i4xCcE39TLi6z38+khj5dU6oeDyUHCgS0WqAL2vmQDOazZ
 79pGMvIgxIzEFoMyDz9lMo1/lWC16RTxDpFGk8NtM7HQpRZbZEdXK1EZmgwQundExs
 KleMYf+QtVNng==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 13 Oct 2021 18:19:47 +0200
Date: Wed, 13 Oct 2021 18:19:47 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211013161947.GB368016@scaer>
References: <20211013070105.1857677-1-fontaine.fabrice@gmail.com>
 <20211013161659.GA368016@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211013161659.GA368016@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/dtbocfg: depends on kernel
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
Cc: =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-10-13 18:16 +0200, Yann E. MORIN spake thusly:
> On 2021-10-13 09:01 +0200, Fabrice Fontaine spake thusly:
> > Fix the following build failure raised since the addition of the package
> > in commit 9fc7b49ab193da55b0a72d27b5e0ea33245b4df0:
> > 
> > Makefile:587: *** linux is in the dependency chain of dtbocfg that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.
> > 
> > Fixes:
> >  - http://autobuild.buildroot.org/results/449a731c0a1394c28f519e341ea145cb42af012d
> > 
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/dtbocfg/Config.in | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/package/dtbocfg/Config.in b/package/dtbocfg/Config.in
> > index c1e8318e5c..862dc0ccc5 100644
> > --- a/package/dtbocfg/Config.in
> > +++ b/package/dtbocfg/Config.in
> > @@ -1,5 +1,6 @@
> >  config BR2_PACKAGE_DTBOCFG
> >  	bool "dtbocfg"
> > +	depends on BR2_LINUX_KERNEL
> 
> You forgot to add the corresponding comment: "dtbocfg needs a kernel to
> be built", so I've done so when applying, and applied to master, thanks.

... and of course, I apparently forgot to run "git commit --amend"...

Sigh... :-(

Regards,
Yann E. MORIN.

> Regards,
> Yann E. MORIN.
> 
> >  	help
> >  	  dtbocfg, which stands for Device Tree Blob Overlay
> >  	  Configuration File System, was developed to serve
> > -- 
> > 2.33.0
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
