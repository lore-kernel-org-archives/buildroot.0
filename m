Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E68B4CE7A91
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 20:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D81D4024D;
	Thu,  5 Sep 2024 20:01:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tAZWWVltC36z; Thu,  5 Sep 2024 20:01:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21A59400E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21A59400E4;
	Thu,  5 Sep 2024 20:01:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 384871BF423
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 20:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2608A400E4
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 20:01:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WxWNplGoI-AF for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 20:01:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8C4F7400AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C4F7400AE
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8C4F7400AE
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 20:01:51 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D147A13F879;
 Thu,  5 Sep 2024 22:01:47 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 05 Sep 2024 22:01:47 +0200
Date: Thu, 5 Sep 2024 22:01:47 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZtoOK5yQ8hw1LsOs@landeda>
References: <20240904204234.498396-1-yann.morin.1998@free.fr>
 <20240905210725.49e2524c@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240905210725.49e2524c@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725566509;
 bh=oXSjNv/eOS2AjiWoVfd+5XEyXVucBGAGKTTWpOBRTXo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lSHjvd4xf7nVQO8egdISmdq7nDdXXMsrNHdm8/jj17N+OWh37nWqTbQugGYi+wuA+
 81xlbo+HYafWGhRioQemUDcC0/S4BmxxlnJWCWsO0DehjJmb219bL1SHykLXy6Y3Fg
 4vJlrnuDORkyBnhXbqG/KtPsEnCk9uC+eMFaablfDTHcKr+mVWuluNR1DMqcmGY31M
 jdc3Epqy3nYcgwX5CgvVaGfrkGf8Ot2ChpeOkxS0wgzKVL04RG0GBryUufkNkLiSzW
 bnlRhNTxGEhaycTj+FOPWt9Mavky83xs9aYUOxlFSed8eqLpfxSPY7zcyjunn5tH1Y
 hKhnAnhFeWMPg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=lSHjvd4x
Subject: Re: [Buildroot] [PATCH] package/pkg-cargo: don't install crates
 tracking
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

On 2024-09-05 21:07 +0200, Thomas Petazzoni spake thusly:
> On Wed,  4 Sep 2024 22:42:34 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> > Closes: #17
> 
> Thanks for the patch, which I have applied to next. However, I would
> really like:
> 
> Closes: #17
> 
> to be:
> 
> Fixes:
> 
>   https://gitlab.com/buildroot.org/buildroot/-/issues/17

As explained on IRC, and for all to know: using "Fixes: #17" makes
Gitlab automatically close the corresponding issue with a reference to
the proper commit log.

It seems GitLab was able to notice that this commit referenced the
issue, so if we go for the full URL, I think we should put it on the
same line as the "Fixes:" tag.

> For two reasons:
> 
> (1) For autobuilder failures we use a full URL, not just the
>     identifier, so we should do the same for Gitlab issue. It also makes
>     them directly clickable from the commit log, which is really nice,
>     and makes it very clear that it's fixing a Gitlab issue
> 
> (2) Fixes: gets picked up by patchwork and not Closes:
> 
> I adjusted this when committing, so this was really just to hopefully
> establish what we consider to be our best practice on this matter :-)

I think it sets the wrong example, then, and that we'll have to settle
on an actual best practice. ;-)

Then I'll have to address another issue so that I can properly tag it in
my commit log! :-]

Thanks!

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
