Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D1A8C77B7D
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 20:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0AE241DA2;
	Sat, 13 May 2023 20:39:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0AE241DA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uk7DLXmyUW8B; Sat, 13 May 2023 20:39:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C98F41D9B;
	Sat, 13 May 2023 20:39:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C98F41D9B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2E96D1BF48C
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 20:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01C8083BFF
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 20:39:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01C8083BFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bqxulAnGptHY for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 20:39:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2D5D83BCB
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F2D5D83BCB
 for <buildroot@busybox.net>; Sat, 13 May 2023 20:39:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:e91d:2912:5826:9d75])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 2A85FB00563;
 Sat, 13 May 2023 22:39:30 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 13 May 2023 22:39:29 +0200
Date: Sat, 13 May 2023 22:39:29 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230513203929.GO2582048@scaer>
References: <20230315090730.399162-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230315090730.399162-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684010372;
 bh=hI/YVwSkYubGjat4VM0y0IEb4bYoBoabzytILHmQN1I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lWAVBWAEGjUkc8UNLdJH4DuAhqUuH8RgQsTX3merVc659iyZ3CfaEq2nqyAj9AHdJ
 gaHGFzxcRUBLG1SP8+PyqsN+/6Z+11WV3phfUK0HecmgDaY6FYzlOdR7AFfYJiJGdf
 /x+jJnkMOI6pXZBLenhAN9Pur58ec5Z2n1ouFCZ86w4oeIQIwsZmNjFSntfjdGOK3S
 EUixntM0sxz33ccH3OW/hiOR3GI+JrkdMX9OI1Kp6M83WvAiVSTW0o2EhJDGZg+Gnw
 lFpeMF1zL3IwSUltbyEwgoJ5aTTbv/Cy/pG469nAYKT+E16lJHGDvNEE26ddxSnZsp
 stZEmeGYYDK3g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lWAVBWAE
Subject: Re: [Buildroot] [PATCH] package/lua-mqtt: bump to version 0.3.0
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Francois, All,

On 2023-03-15 10:07 +0100, Francois Perrad spake thusly:
> diff COPYRIGHT:
> -Copyright (C) 2022 Francois Perrad.
> +Copyright (C) 2022-2023 Francois Perrad.

A diff hunk in the body can cause q few issues (some of my scripts choke
on it, but it looks git-am does not, pfew...).

Still, just state:

    Update hash for license file, due to update in copyright years.

The commit log is not a diff, it is meant to be read by humans, which
expects human-readable text (well,m for a certain notion of redability,
that is ;-] ).

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/lua-mqtt/lua-mqtt.hash | 4 ++--
>  package/lua-mqtt/lua-mqtt.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/lua-mqtt/lua-mqtt.hash b/package/lua-mqtt/lua-mqtt.hash
> index 3636e9e6a..62f8f350f 100644
> --- a/package/lua-mqtt/lua-mqtt.hash
> +++ b/package/lua-mqtt/lua-mqtt.hash
> @@ -1,3 +1,3 @@
>  # computed by luarocks/buildroot
> -sha256  986ec63dd9f0761f9c5231f6e19529138602c289e13da5c71dc1449f5f247152  lua-mqtt-0.1.0-1.src.rock
> -sha256  e86d7c8adfabcb7c6515cc6e524bf0a76f7b3a86560a7ac47d7cabae5f8391a2  lua-mqtt-0.1.0/COPYRIGHT
> +sha256  1b5ec0aebb2d41700762e3d6f542517c55b8cf44e323c53d55a47f19e22b664a  lua-mqtt-0.3.0-1.src.rock
> +sha256  c8d12c868b979f5b9592eec503fc3de54e9feb92163f3cfc50a141ee2bcccc25  lua-mqtt-0.3.0/COPYRIGHT
> diff --git a/package/lua-mqtt/lua-mqtt.mk b/package/lua-mqtt/lua-mqtt.mk
> index a2f17d2b2..ff889237e 100644
> --- a/package/lua-mqtt/lua-mqtt.mk
> +++ b/package/lua-mqtt/lua-mqtt.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LUA_MQTT_VERSION = 0.1.0-1
> +LUA_MQTT_VERSION = 0.3.0-1
>  LUA_MQTT_LICENSE = MIT
>  LUA_MQTT_LICENSE_FILES = $(LUA_MQTT_SUBDIR)/COPYRIGHT
>  
> -- 
> 2.37.2
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
