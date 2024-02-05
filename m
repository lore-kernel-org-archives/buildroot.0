Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53055C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 17:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1C9940135;
	Mon,  5 Feb 2024 17:52:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1C9940135
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qp449Bub-51h; Mon,  5 Feb 2024 17:52:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C152F40162;
	Mon,  5 Feb 2024 17:52:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C152F40162
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C313A1BF3D6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BE8281D67
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:52:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BE8281D67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cr1qF5gIjF7Z for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 17:52:52 +0000 (UTC)
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD79C81D65
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 17:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD79C81D65
Received: from [192.168.17.123] (unknown [85.119.216.19])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 6C1632C800D1
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 18:52:50 +0100 (CET)
Message-ID: <e76ab143-f2cb-47e3-8383-0688df3e82a9@bubu1.eu>
Date: Mon, 5 Feb 2024 18:52:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
References: <20240205164615.510688-1-james.hilliard1@gmail.com>
In-Reply-To: <20240205164615.510688-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707155570; bh=f3W0pZAIVRiHESKufXCaayQ5CObVkLURVPHGJE0vijY=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=Bz14eM25x8ZzXwIAoYkRGA0gpCxEJ6lFvwsdMyi637NQ3xNcYFVUTT3H/hf0G2d94
 QPQBSO3luIBSpCDB8ezIJUQyGOhWYziQ3f0hg3aGHnpOnPjMEZZqH2onJNsEEihs/l
 dnE9jfaB1+9O0qIMr4GBrDM5rnb+6jbpj73T3afTsgI6sYaRsdpb5wod2i49a24F+o
 FAH9+WGCwtuKcWr3isZrYF5T6sz7c1SO9IbaaGeOXmPoSz5kUo/QjQmmd0wnZ2K5Ff
 Tgb2R1m9ZOr8qgTUxucrzj7Qmw2NU5ykq6dFyzzIUGBPaytAtCMDIJ5IjRJI7S9sVe
 GRdrYvTd+NKAA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=Bz14eM25
Subject: Re: [Buildroot] [PATCH 1/2] package/python-starlette: bump to
 version 0.36.3
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 05.02.24 17:46, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Reviewed-by: Marcus Hoffmann <buildroot@bubu1.eu>

> ---
>   package/python-starlette/python-starlette.hash | 4 ++--
>   package/python-starlette/python-starlette.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-starlette/python-starlette.hash b/package/python-starlette/python-starlette.hash
> index 820026b70b..03d77cf5be 100644
> --- a/package/python-starlette/python-starlette.hash
> +++ b/package/python-starlette/python-starlette.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/starlette/json
> -md5  2ef2fc635691fd4a1823564218292dce  starlette-0.34.0.tar.gz
> -sha256  ed050aaf3896945bfaae93bdf337e53ef3f29115a9d9c153e402985115cd9c8e  starlette-0.34.0.tar.gz
> +md5  0a1e026d653dc448ae07f47eefe1dc8b  starlette-0.36.3.tar.gz
> +sha256  90a671733cfb35771d8cc605e0b679d23b992f8dcfad48cc60b38cb29aeb7080  starlette-0.36.3.tar.gz
>   # Locally computed sha256 checksums
>   sha256  dcb95677a02240243187e964f941847d19b17821cf99e5afae684fab328c19bf  LICENSE.md
> diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
> index 07f9d6be5e..9d137f5f5a 100644
> --- a/package/python-starlette/python-starlette.mk
> +++ b/package/python-starlette/python-starlette.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_STARLETTE_VERSION = 0.34.0
> +PYTHON_STARLETTE_VERSION = 0.36.3
>   PYTHON_STARLETTE_SOURCE = starlette-$(PYTHON_STARLETTE_VERSION).tar.gz
> -PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/4f/36/168ba6d56a28382f3b081b23b0cc431de35786e120b94c1f372708ed3059
> +PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/be/47/1bba49d42d63f4453f0a64a20acbf2d0bd2f5a8cde6a166ee66c074a08f8
>   PYTHON_STARLETTE_SETUP_TYPE = pep517
>   PYTHON_STARLETTE_LICENSE = BSD-3-Clause
>   PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
