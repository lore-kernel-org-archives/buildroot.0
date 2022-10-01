Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64494C433FE
	for <buildroot@archiver.kernel.org>; Sat,  1 Oct 2022 19:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C93C440179;
	Sat,  1 Oct 2022 19:53:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C93C440179
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H21bzyyEwWFS; Sat,  1 Oct 2022 19:53:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0C0B4023F;
	Sat,  1 Oct 2022 19:53:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0C0B4023F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 26AC71BF3BA
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 19:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F0A16077D
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 19:53:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F0A16077D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vR9OHzXTFbUh for <buildroot@lists.busybox.net>;
 Sat,  1 Oct 2022 19:53:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F188606EB
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F188606EB
 for <buildroot@buildroot.org>; Sat,  1 Oct 2022 19:53:46 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9961:1217:61e8:73cc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id E671F780306;
 Sat,  1 Oct 2022 21:53:40 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Oct 2022 21:53:40 +0200
Date: Sat, 1 Oct 2022 21:53:40 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Message-ID: <20221001195340.GT30794@scaer>
References: <1664283942-24229-1-git-send-email-gwenj@trabucayre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1664283942-24229-1-git-send-email-gwenj@trabucayre.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1664654024;
 bh=tB1wIwr8h8gFh7grdPz5eYv9zYKRI4n4xqpbfiAMY0c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mkm3+WbjT4CspOPnXdT2Vp8pdLuEcrlPeF0Bt0Zf3rPwDl9/20m8gcEj5poYHQ7GL
 2ER7iu/R/Ir0H0ZXJSoGIKkgCOJvD52XPo6Y1SHgGlCgPVF+VtH3A0xJrLWPUOxZfR
 Glhfz5uUWRVT3h+EGbbvgd7uYgdlLnTcFKPmSbSlS3M2mQRmUCCdb7wD3BnjXGhVk6
 g3RAfg6lafSsv3dg45SnoZRLduSil/2ee60kOocGAf4tGgDMkTY4RGRO/DM+IdImN2
 hFP8oZpz1EyTVJo+O5Cmp6TvXCPncPWlKAPGdySeZ9ufjGxWqWU5xKJvl+i5c6LWqo
 FSkoUHGF0bLuw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mkm3+Wbj
Subject: Re: [Buildroot] [PATCH] package/python-remi: bump version to
 2022.7.27
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Gwenhael, All,

On 2022-09-27 15:05 +0200, Gwenhael Goavec-Merou spake thusly:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Applied to master, thanks.

But see below...

[--SNIP--]
>  PYTHON_REMI_LICENSE = Apache-2.0

There is a file named LICENSE in the tree. Could you update our
packaging to use that file, and add a hash for it, please?

Regards,
Yann E. MORIN.

>  PYTHON_REMI_SETUP_TYPE = setuptools
>  
> -- 
> 2.30.2
> 
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
