Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 290B0C28D13
	for <buildroot@archiver.kernel.org>; Mon, 22 Aug 2022 07:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F24160BEE;
	Mon, 22 Aug 2022 07:16:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F24160BEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kp2lzaEOt0XO; Mon, 22 Aug 2022 07:16:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD3A460AB0;
	Mon, 22 Aug 2022 07:16:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD3A460AB0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7EC581BF577
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 07:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66A2A4013D
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 07:16:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66A2A4013D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yat3vNseeulI for <buildroot@lists.busybox.net>;
 Mon, 22 Aug 2022 07:16:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 213D8400D2
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 213D8400D2
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 07:16:20 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:961:575d:b2ff:71eb])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 3ACEB6012E;
 Mon, 22 Aug 2022 09:16:12 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 22 Aug 2022 09:16:11 +0200
Date: Mon, 22 Aug 2022 09:16:11 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220822071611.GW2167049@scaer>
References: <20220822060201.3333515-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220822060201.3333515-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661152576;
 bh=4odSAIhEEs5HB2jrVmmmf4mvC/jMk+ZAFFZu2hC+yPE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nydw0EnJnCYBGBiLyzZgtR0vcVLastyeVC6GjLDJrsVpnZbA3heO8oeCEaPz8Mgfr
 zGURxTXynntC7aErCyoArHUY0yj5ESIKvnKytXcdTouFJGiM9wxlVu3LxSkTmY91Ym
 joQylHDXUwy8/uXWf8WqfmmXxSsVaCb/TQedy6wratG5g/+hzgceFP4y9vvpwwi5an
 gwaNDiforilx5dgyzWY6asUu3teuyaefl2k9SbMqALuayuTf+XAo21TBxGTTFrutQU
 7iO5TqEjl313QD6EBRfz3WYIx0/UkbRqzMSAuX4P4zKFyGR1tZiP+4C9PJvCL+zK/0
 MTf5eS6S7PJNA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nydw0EnJ
Subject: Re: [Buildroot] [PATCH v2 1/1] package/pkg-python: clean
 conflicting pep517 packages before install
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
Cc: Marcus Hoffmann <marcus.hoffmann@othermo.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2022-08-22 00:02 -0600, James Hilliard spake thusly:
> The python installer package isn't able to overwrite packages that

s/packages/files of packges/

> already exist, this causes problems when doing a rebuild or update
> without a full clean.
> 
> To fix this we can use functionality from importlib to identify and
> remove any conflicting python package files before installation.
> 
> Since we are adding this functionality to our pyinstaller.py script
> we must also use pyinstaller.py for host python packages to avoid
> hitting this issue there as well.

Please split in two:
  - first pach to use ur pyinstaller for host packages
  - second patch to cleanup

[--SNIP--]
> diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> index 5794e3a195..b147827821 100644
> --- a/package/pkg-python.mk
> +++ b/package/pkg-python.mk
> @@ -139,6 +139,14 @@ PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS = \
>  HOST_PKG_PYTHON_PEP517_ENV = \
>  	$(HOST_PKG_PYTHON_ENV)
>  
> +HOST_PKG_PYTHON_PEP517_INSTALL_OPTS = \
> +	--interpreter=/bin/python \

Why is this not $(HOST_DIR)/bin/python ?

There is no guarantee that there is a python interpreter on the build
machine, and we anyway want to use our python, not the system one.

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
