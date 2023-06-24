Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA145EB64DA
	for <buildroot@archiver.kernel.org>; Sat, 24 Jun 2023 15:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 622B76116F;
	Sat, 24 Jun 2023 15:07:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 622B76116F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QWhL2U3FXrIW; Sat, 24 Jun 2023 15:07:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87EA561175;
	Sat, 24 Jun 2023 15:07:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87EA561175
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 46B231BF420
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 15:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 209C881F21
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 15:07:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 209C881F21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id On1ezZCrwevf for <buildroot@lists.busybox.net>;
 Sat, 24 Jun 2023 15:07:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15FBD81F20
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 15FBD81F20
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 15:07:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:d5f8:72e0:30f9:5d41])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 17585B00579;
 Sat, 24 Jun 2023 17:07:29 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 24 Jun 2023 17:07:28 +0200
Date: Sat, 24 Jun 2023 17:07:28 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230624150728.GW24952@scaer>
References: <20230623063344.46379-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230623063344.46379-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1687619253;
 bh=i9R+wlhE+3jf3aUgta9ocoLz38Oyp6cILam5C6b8+Po=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jCF04G6aOParMjVn86l4GmEMbyXOWXCgYPtPfCquZcsOkNfdlFfKJWxyi1gdZnLfk
 sWkKZvdl8oy9BFVYJWmz5wJK9t2ZczcH1BrowQ9yyIE9FLHC/nh5i+mkvXM1ELMzcB
 ScAvAiyQ4dWtAhPnr9tEjvA4ZWTIAi8w0aFEKnvUitMZxBK1APbGroIP/uU4Zju7qG
 wgaSuDYffvMaPIbcbZU3RLGbivIpLIsQcUOuS6tYtC4BHtP4fOIzv3+yDi30OHatDY
 DuWgfybbnr8XRsYuef1v22UUk/2oabHbc1hd9+DSgkh+hefYzoFCsaonJBsrI34XlQ
 xeukymQCp4xzg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jCF04G6a
Subject: Re: [Buildroot] [PATCH 1/1] package/python-wheel: new host package
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2023-06-23 00:33 -0600, James Hilliard spake thusly:
> This will be required for upcoming setuptools pep517 support.

Then make it part of the series that does add that PEP517 support,
please. Otherwise, so far, as there is no in-tree package that uses
host-python-wheel, it's just dead code.

Regards,
Yann E. MORIN.

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-wheel/python-wheel.hash |  5 +++++
>  package/python-wheel/python-wheel.mk   | 14 ++++++++++++++
>  2 files changed, 19 insertions(+)
>  create mode 100644 package/python-wheel/python-wheel.hash
>  create mode 100644 package/python-wheel/python-wheel.mk
> 
> diff --git a/package/python-wheel/python-wheel.hash b/package/python-wheel/python-wheel.hash
> new file mode 100644
> index 0000000000..377a85c8fd
> --- /dev/null
> +++ b/package/python-wheel/python-wheel.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/wheel/json
> +md5  ec5004c46d1905da98bb5bc1a10ddd21  wheel-0.40.0.tar.gz
> +sha256  cd1196f3faee2b31968d626e1731c94f99cbdb67cf5a46e4f5656cbee7738873  wheel-0.40.0.tar.gz
> +# Locally computed sha256 checksums
> +sha256  30c23618679108f3e8ea1d2a658c7ca417bdfc891c98ef1a89fa4ff0c9828654  LICENSE.txt
> diff --git a/package/python-wheel/python-wheel.mk b/package/python-wheel/python-wheel.mk
> new file mode 100644
> index 0000000000..159598fd1e
> --- /dev/null
> +++ b/package/python-wheel/python-wheel.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-wheel
> +#
> +################################################################################
> +
> +PYTHON_WHEEL_VERSION = 0.40.0
> +PYTHON_WHEEL_SOURCE = wheel-$(PYTHON_WHEEL_VERSION).tar.gz
> +PYTHON_WHEEL_SITE = https://files.pythonhosted.org/packages/fc/ef/0335f7217dd1e8096a9e8383e1d472aa14717878ffe07c4772e68b6e8735
> +PYTHON_WHEEL_SETUP_TYPE = flit
> +PYTHON_WHEEL_LICENSE = MIT
> +PYTHON_WHEEL_LICENSE_FILES = LICENSE.txt
> +
> +$(eval $(host-python-package))
> -- 
> 2.34.1
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
