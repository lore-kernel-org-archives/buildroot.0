Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA9EBCAC5B0
	for <buildroot@archiver.kernel.org>; Sat, 27 Sep 2025 13:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8509484E2A;
	Sat, 27 Sep 2025 13:03:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eBpQlQQLlFQm; Sat, 27 Sep 2025 13:03:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B46C84E2B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B46C84E2B;
	Sat, 27 Sep 2025 13:03:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 46578198
 for <buildroot@buildroot.org>; Sat, 27 Sep 2025 13:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43A46614F2
 for <buildroot@buildroot.org>; Sat, 27 Sep 2025 13:03:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9aDMT5K3Hqsy for <buildroot@buildroot.org>;
 Sat, 27 Sep 2025 13:03:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6E538614E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E538614E7
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6E538614E7
 for <buildroot@buildroot.org>; Sat, 27 Sep 2025 13:03:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 41768B0055E;
 Sat, 27 Sep 2025 15:03:42 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 27 Sep 2025 15:03:42 +0200
MIME-Version: 1.0
Date: Sat, 27 Sep 2025 15:03:42 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250925222814.2323048-1-james.hilliard1@gmail.com>
References: <20250925222814.2323048-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <465fee2707f10b55fa963edff7baea16@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758978223;
 bh=Dj643TT+FWOue7zLuGMhH2mCqYOj4xJXhrhlSJ3h93M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DDs1kvsX0IP2SnKcT1aMaODyvVun2UcmEPF28QE7gRKYLA9K4OKh1GWBrySnt89m5
 ikF1brMB+Cmo2lcTMR718PxH94SoPkvFqRCulVxneVrKGLObJv0ZirU6y/vBEDCk7/
 SRNaM7c3GM4NOrW1Qt/jYiiX3lujxx7gIYxJ9D9O9cpqN3+cWZ3BZ8G1Kp1IjODMcx
 vF5U0aK+zY3z+qETrSQ/I2vGf6g/Vb9kRsuXnV7nqjCkhD/QJ2zYWR4fO7Bw01GVdh
 MpRw6VbfA2zJ6mw++GijiNepR3cElbSxrLfMr9DinmmDQTfX3qijNakZeI0zEMJJZZ
 MiGoekCZKfkDA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DDs1kvsX
Subject: Re: [Buildroot] [PATCH 1/1] package/tailscale: bump to version
 1.88.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi James,

On 26/09/2025 00:28, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/tailscale/tailscale.hash | 2 +-
>  package/tailscale/tailscale.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/tailscale/tailscale.hash 
> b/package/tailscale/tailscale.hash
> index e2d600f03e..444412f8f4 100644
> --- a/package/tailscale/tailscale.hash
> +++ b/package/tailscale/tailscale.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  
> 4830cd822a838d5d44fd5eeebd07a2aacaf0255fb3fb7d3852d57659f54e51bc  
> tailscale-1.78.1-go2.tar.gz
> +sha256  
> 98b51e95e84378ab280c5a8706508d493ab9152a0215f00f0f69e3ea2673ea0f  
> tailscale-1.88.3-go2.tar.gz
>  sha256  
> d1ee1c7947d4b2c1963ea214d5324f1d4c89f2f1d0f0224889b4dfb868dad725  
> LICENSE
> diff --git a/package/tailscale/tailscale.mk 
> b/package/tailscale/tailscale.mk
> index 3c6c7bce1e..141a5b98d6 100644
> --- a/package/tailscale/tailscale.mk
> +++ b/package/tailscale/tailscale.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -TAILSCALE_VERSION = 1.78.1
> +TAILSCALE_VERSION = 1.88.3

For some reason, the download of this dependency
github.com/tdakkota/asciicheck v0.2.0
is failing. See also:
https://github.com/tailscale/tailscale/blob/v1.88.3/go.mod#L387

https://github.com/tdakkota/asciicheck
currently returns a 404.

Any clue how to solve this issue?


>  TAILSCALE_SITE = $(call 
> github,tailscale,tailscale,v$(TAILSCALE_VERSION))
>  TAILSCALE_LICENSE = BSD-3-Clause
>  TAILSCALE_LICENSE_FILES = LICENSE
> --
> 2.43.0

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
