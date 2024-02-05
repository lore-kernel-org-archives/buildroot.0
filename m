Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C51BC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 14:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C97540A87;
	Mon,  5 Feb 2024 14:39:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C97540A87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 564hbZ95TvDB; Mon,  5 Feb 2024 14:39:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A46140A49;
	Mon,  5 Feb 2024 14:39:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A46140A49
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 58F2C1BF2F0
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 14:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3228B8254A
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 14:39:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3228B8254A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id glM3pN05wWhp for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 14:39:29 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A78D82451
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 14:39:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A78D82451
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9834A13FA45;
 Mon,  5 Feb 2024 15:39:22 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 05 Feb 2024 15:39:20 +0100
Date: Mon, 5 Feb 2024 15:39:20 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: ~bubu <bubu@bubu1.eu>
Message-ID: <ZcDzGKRq7ORiW2Uq@landeda>
References: <170712853287.18164.6368517214119629150-0@git.sr.ht>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <170712853287.18164.6368517214119629150-0@git.sr.ht>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707143965;
 bh=xWjk3ikUWri1I7oc+XeCq44FJfD+zkXGZxAPZA/mJko=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HZw/DQIrZ6Kp/79Zfqy6QVu98UzviUhPO8j/sPYaLtkpNWY+oj4vN223y2xqDyD29
 PxTgV7zuwVemoBmFoD3op5U5a4QvwfMxWP75kmnwlPSs2cKDcQaPyvshQKBvPbb9qv
 UuZ6vBkQWIE+zKfUWsU+B8YtGMz0VkhXeXXVmOL9ZwSpi9BGeskFwc9+8/qXg2l5nN
 DZQnEl5hTUTQqqHfBAq9DSFZHPcabUFpMy0lTMR0nOcA40SU0N9zWSfUTkj2/WBlxO
 RwqG+UJWI9w5LosiANC5+oVpepolLJVgKFj8y+3zNnd8ReBnMSQdHVbxod9LYWFVPL
 pSWO2Yz3EnGcg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HZw/DQIr
Subject: Re: [Buildroot] [PATCH buildroot] package/python-minimalmodbus: fix
 empty package
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Marcus, All,

On 2023-09-21 22:39 +0200, ~bubu spake thusly:
> From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
> 
> Calling `setup.py` build builds and installs  an empty package
> after upstream changed their packaging. Calling setuptools via
> `python -m build` builds the package correctly.

Applied to master, after fixing the authroship and Sob as we discussed
IRL, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-minimalmodbus/python-minimalmodbus.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/python-minimalmodbus/python-minimalmodbus.mk b/package/python-minimalmodbus/python-minimalmodbus.mk
> index 5a6e7733be..cb8a0d8cc9 100644
> --- a/package/python-minimalmodbus/python-minimalmodbus.mk
> +++ b/package/python-minimalmodbus/python-minimalmodbus.mk
> @@ -7,7 +7,8 @@
>  PYTHON_MINIMALMODBUS_VERSION = 2.1.1
>  PYTHON_MINIMALMODBUS_SOURCE = minimalmodbus-$(PYTHON_MINIMALMODBUS_VERSION).tar.gz
>  PYTHON_MINIMALMODBUS_SITE = https://files.pythonhosted.org/packages/37/fc/8a58f7bcdece751f16a4a9aac780acd1288aa8ac6adbffdd764c88fb71c6
> -PYTHON_MINIMALMODBUS_SETUP_TYPE = setuptools
> +PYTHON_MINIMALMODBUS_DEPENDENCIES = host-python-setuptools
> +PYTHON_MINIMALMODBUS_SETUP_TYPE = pep517
>  PYTHON_MINIMALMODBUS_LICENSE = Apache-2.0
>  PYTHON_MINIMALMODBUS_LICENSE_FILES = LICENSE
>  
> -- 
> 2.38.5
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
