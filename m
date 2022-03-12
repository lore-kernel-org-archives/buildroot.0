Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E18C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 17:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CD2B812FE;
	Sat, 12 Mar 2022 17:03:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oKVVIDcbkNHv; Sat, 12 Mar 2022 17:03:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD49181288;
	Sat, 12 Mar 2022 17:03:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DF6DC1BF3FF
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D77B540412
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:03:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TKdkftL2N8K5 for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 17:03:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A9252403AA
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 17:03:51 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9481:d19c:460:d0b4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 06DBF19F576;
 Sat, 12 Mar 2022 18:03:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647104630;
 bh=5qmAkDYpklPoHFNHeQaNyB6RzUSuAZrNpLmGHT24/9Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ladABPYbTsjdOSOC/Xh5hCP/1uiKuc90yTaPQIVKXuQdz53twvts601zQDJxB1Sdm
 q0EWVjyeNPEmibL26H/kXI1bao1ac741Qm1//ISuw4jK4cVmqB5L98b6C12/S3SJSG
 wPEf6/2qVaImTVWVWkJTkxlOZgaC7EMj0kM5VRsQqTlPWeuLTpCwfasG1kcgvUnEGQ
 Y+muIWMaPqtInutPA2vO4bdPZ6Z5weFu4eKE+jltlulnFktn6LFa3wlbdaX6WTXPt1
 3Y6el76fC5DmEzyx2llmaHMYb5dv7W3w0XdubGzpoSxS+2JpKQwg46iwJcYo/pMDrZ
 sQwLP6fpxrthA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 12 Mar 2022 18:03:46 +0100
Date: Sat, 12 Mar 2022 18:03:46 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220312170346.GJ283544@scaer>
References: <20220311192726.3879992-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220311192726.3879992-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-python: apply host platform
 and project base to pep517 env
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Kames, All,

On 2022-03-11 12:27 -0700, James Hilliard spake thusly:
> The _PYTHON_HOST_PLATFORM and _PYTHON_PROJECT_BASE variables should
> also be set for pep517 builds as they are not setuptools/distutils
> specific.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/pkg-python.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> index f031bc8fae..52ce402281 100644
> --- a/package/pkg-python.mk
> +++ b/package/pkg-python.mk
> @@ -113,6 +113,8 @@ HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
>  
>  # Target pep517-based packages
>  PKG_PYTHON_PEP517_ENV = \
> +	_PYTHON_HOST_PLATFORM="$(PKG_PYTHON_HOST_PLATFORM)" \
> +	_PYTHON_PROJECT_BASE="$(PYTHON3_DIR)" \
>  	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
>  	PATH=$(BR_PATH) \
>  	$(TARGET_CONFIGURE_OPTS) \
> -- 
> 2.25.1
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
