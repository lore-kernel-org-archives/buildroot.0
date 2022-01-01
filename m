Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48719C433EF
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 13:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B75C960B95;
	Sat,  1 Jan 2022 13:04:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lnbeugs0jpvi; Sat,  1 Jan 2022 13:04:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F227860DED;
	Sat,  1 Jan 2022 13:04:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 268E01BF31D
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 13:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22F9C402B1
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 13:04:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OxomJB5dVD8h for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 13:04:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D65CA402AC
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 13:04:18 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b440:9a6c:7abd:86f8])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 9AEEF5FF96;
 Sat,  1 Jan 2022 14:04:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641042256;
 bh=ixIWgE2jJKBwW3QNcVzpHqK3KxwZ632nnSsofzk+bFo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pBaQ1JASzLcNi2FVryb0knodYapeMQILRVGnaA+v7H9rNC/AqvLUDsm5hR4zkzIQK
 0nyqC9k526RaUOEfTB1BoQo5uV5o0nhxEDT/ph5kY4CAD2AXMIBW4uiJuI2yERQIo4
 0BWUAXK/1CwxkrG65glf2d2uMOJGalHsaMR9bY4gIcIKVmNVwYsFmK5JhS3CL6Ajyu
 p9S8YDml5E25FM5RtZbufY6ZCGPMq2GVfxqjFJyczxQF6IB9aco8y+EBT9LMCfOHkR
 3/mmgKbOZmbfo5Dw+AWqTL2GEr0+hwSWeRhhMQ46qYD/a+ILhdENRCLOHKdvDSUiuQ
 E9C+lbLuCZCAg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Jan 2022 14:04:07 +0100
Date: Sat, 1 Jan 2022 14:04:07 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220101130407.GG3390456@scaer>
References: <20210305111048.1902558-1-fontaine.fabrice@gmail.com>
 <87mtkf1wd1.fsf@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87mtkf1wd1.fsf@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcpcd: add
 BR2_PACKAGE_DHCPCD_ENABLE_PRIVSEP
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
Cc: Joachim Wiberg <troglobit@gmail.com>, John Stile <johns@msli.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-01-01 13:19 +0100, Joachim Wiberg spake thusly:
> On Fri, Mar 05, 2021 at 12:10, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> > Add BR2_PACKAGE_DHCPCD_ENABLE_PRIVSEP following Arnout feedback:
> > https://patchwork.ozlabs.org/project/buildroot/patch/20210303091904.467706-1-fontaine.fabrice@gmail.com
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> 
> Looks good to me, much cleaner than what we have now.
> 
> Reviewed-by: Joachim Wiberg <troglobit@gmail.com>

Applied to master, thanks.

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
