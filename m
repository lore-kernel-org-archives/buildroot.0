Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D385C433FE
	for <buildroot@archiver.kernel.org>; Mon, 21 Nov 2022 21:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE7FE60F58;
	Mon, 21 Nov 2022 21:10:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE7FE60F58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G4wVaLIx5Mh3; Mon, 21 Nov 2022 21:10:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF69C60F2E;
	Mon, 21 Nov 2022 21:10:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF69C60F2E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 57D381BF34D
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 21:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 333BC403A2
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 21:10:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 333BC403A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5QpmwCyR6EsU for <buildroot@lists.busybox.net>;
 Mon, 21 Nov 2022 21:10:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D83A1402F5
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D83A1402F5
 for <buildroot@buildroot.org>; Mon, 21 Nov 2022 21:10:32 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:187b:ecdb:c1bc:94df])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3138213F87F;
 Mon, 21 Nov 2022 22:10:25 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 21 Nov 2022 22:10:24 +0100
Date: Mon, 21 Nov 2022 22:10:24 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221121211024.GM2516@scaer>
References: <20221121122021.287011-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221121122021.287011-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1669065029;
 bh=VhHunXsd+q99eskOLYZGtIv1/c3+ervZ0IiZVM2zJyw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=If4uw4kkilyuOAIqAGx2+wf4YF7W9MLwDshJsquP02vbbWq1H2By7yJImLIuLZPxj
 Czz5lPF3jEotji/GYphBseFDT5kmTTY7yRX7cesXSkPGI+6S2ptJvW5G50ilz4Sm5Q
 HGg7fS6IHzAsKJfZxqliJ6MaPtvPtmyHG1MzZKr2k54FIR48PiswW1RwKAwinzGzZO
 Umo37JS/jFJX+IWEyr6vfD2FfC2j5GdVSLzi+DCfrTvjEfA14AS3m3GpIoWy9Wj/T7
 77kXCKUToNAohhkSVLdNW0ugM0U/zL2wrcevQL0ZAvgk8AP5Zh+x9W5ganxwkiaq89
 ffuLEepgOvSKA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=If4uw4kk
Subject: Re: [Buildroot] [PATCH 1/2] package/python-orjson: bump to version
 3.8.2
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
Cc: Graeme Smecher <gsmecher@threespeedlogic.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2022-11-21 05:20 -0700, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-orjson/python-orjson.hash | 2 +-
>  package/python-orjson/python-orjson.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python-orjson/python-orjson.hash b/package/python-orjson/python-orjson.hash
> index 1de1d7cdc2..8563ed544f 100644
> --- a/package/python-orjson/python-orjson.hash
> +++ b/package/python-orjson/python-orjson.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after vendoring
> -sha256  285091518bdbde8086c60c5ed6d7090eccc1c232b00138c964c410f1a7da654f  orjson-3.7.11.tar.gz
> +sha256  dc06889b0ce52d5e96253573f6cbdf5939c5902022cbe2538cedc622e9378372  orjson-3.8.2.tar.gz
>  # Locally computed sha256 checksums
>  sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
>  sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
> diff --git a/package/python-orjson/python-orjson.mk b/package/python-orjson/python-orjson.mk
> index 0a266e827a..b18a5cdada 100644
> --- a/package/python-orjson/python-orjson.mk
> +++ b/package/python-orjson/python-orjson.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_ORJSON_VERSION = 3.7.11
> +PYTHON_ORJSON_VERSION = 3.8.2

In next, we already have 3.8.1, but I see you prepared the bump against
master. Is there any reason to apply it to master?

Regards,
Yann E. MORIN.

>  PYTHON_ORJSON_SOURCE = orjson-$(PYTHON_ORJSON_VERSION).tar.gz
> -PYTHON_ORJSON_SITE = https://files.pythonhosted.org/packages/fd/52/42520dbfd47191977140c49fa601624b9b4c6cc9d6a62d3e68970ee9eac6
> +PYTHON_ORJSON_SITE = https://files.pythonhosted.org/packages/13/08/d476fff015ccc0f043d3df6332c807695ae3d6abc1758b24f3d335750550
>  PYTHON_ORJSON_SETUP_TYPE = pep517
>  PYTHON_ORJSON_LICENSE = Apache-2.0 or MIT
>  PYTHON_ORJSON_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
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
