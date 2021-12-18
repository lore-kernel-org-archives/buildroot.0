Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54BB2C433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Dec 2021 22:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E054421AA;
	Sat, 18 Dec 2021 22:55:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2J0E60QptuWM; Sat, 18 Dec 2021 22:55:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AE2C42143;
	Sat, 18 Dec 2021 22:55:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EC2A81BF5AE
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 22:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D5002400C1
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 22:55:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9geAkgQ88Uz2 for <buildroot@lists.busybox.net>;
 Sat, 18 Dec 2021 22:55:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B2E35400AF
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 22:55:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4cb3:149f:d03e:db5a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id D5F8C5FF33;
 Sat, 18 Dec 2021 23:55:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1639868128;
 bh=e8pvZ+QQCmocjpKoiaf5vhTrj83f/wnOszz7rlC+aV4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b7JnVGOWHhWJdzE5FdTZMk2zIojiMNfgCC/srG6dPeEpb1cGbUaBpmK05YqF5hwrL
 MP78InQc4ybiZvep9YqQ0jBbBxkT5+VNS6eRXVSpVJFHtf8VG0iJsEOQToJEy37UiE
 xjsP9e3CFhyylzyblRr3PSSBE84dXHrpAzKatI+mmdMZCwzB7JrsHOkNi1F3mhGnvN
 FvqCJ4AwaMOqK8CPueYQOpQ58dD7Jcbx+F9G+7Bx4xByYD2lHhjVCH6XXRNGSyH2aa
 pgxes+Adq3SPRQ6iiGoBwtnMDCvtrgIAtvNivfxGjJw+l6UWDp22/ZYl8WoTKYUr1X
 kSlVC1Gj/JIQw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Dec 2021 23:55:21 +0100
Date: Sat, 18 Dec 2021 23:55:21 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211218225521.GZ2603@scaer>
References: <20211218223534.578115-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211218223534.578115-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenaptx: fix license
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
Cc: Yunhao Tian <t123yh.xyz@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-12-18 23:35 +0100, Fabrice Fontaine spake thusly:
> License is GPL-3.0+, not GPL-3.0 since the addition of the package in
> commit 1e4050b2d0372e1b47b57cc4210e3da5cb8ec3de
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libopenaptx/libopenaptx.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libopenaptx/libopenaptx.mk b/package/libopenaptx/libopenaptx.mk
> index f768dca1db..49e89d871c 100644
> --- a/package/libopenaptx/libopenaptx.mk
> +++ b/package/libopenaptx/libopenaptx.mk
> @@ -6,7 +6,7 @@
>  
>  LIBOPENAPTX_VERSION = 0.2.1
>  LIBOPENAPTX_SITE = https://github.com/pali/libopenaptx/releases/download/$(LIBOPENAPTX_VERSION)

In master, we have:

    LIBOPENAPTX_SITE = $(call github,pali,libopenaptx,$(LIBOPENAPTX_VERSION))

Did you forget to sned the corresponding fix (I agree that we should use
the released tarball rather than use the github helper)?

> -LIBOPENAPTX_LICENSE = GPL-3.0
> +LIBOPENAPTX_LICENSE = GPL-3.0+

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  LIBOPENAPTX_LICENSE_FILES = COPYING
>  LIBOPENAPTX_INSTALL_STAGING = YES
>  
> -- 
> 2.33.0
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
