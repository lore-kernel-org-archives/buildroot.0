Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB353D68BF5
	for <buildroot@archiver.kernel.org>; Sat, 16 Nov 2024 17:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 279546059F;
	Sat, 16 Nov 2024 17:21:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Ur6VEPY-WPa; Sat, 16 Nov 2024 17:21:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DCE060614
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DCE060614;
	Sat, 16 Nov 2024 17:21:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BF241EB9
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 17:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4F5141D7C
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 17:21:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8t7TSjUdbCjc for <buildroot@buildroot.org>;
 Sat, 16 Nov 2024 17:21:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7469341D70
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7469341D70
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7469341D70
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 17:21:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id A9FEBB0051B;
 Sat, 16 Nov 2024 18:21:49 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:36690])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 16 Nov 2024 18:21:49 +0100
MIME-Version: 1.0
Date: Sat, 16 Nov 2024 18:21:49 +0100
From: Julien Olivain <ju.o@free.fr>
To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org
In-Reply-To: <f1012c843a68027c24f3e7f482a63f7d23a3f13e.1731610930.git.baruch@tkos.co.il>
References: <f1012c843a68027c24f3e7f482a63f7d23a3f13e.1731610930.git.baruch@tkos.co.il>
User-Agent: Webmail Free/1.6.9
Message-ID: <30bc786ec92e401e6ea0a85aeaae1531@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731777710;
 bh=hD5433rVhmoUXD1zT4swcYVU59HLpjy4X4smKUwhwvM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jbpQe65oL+HmEug7o8JHiZeOambrdU7iKFmDxV7ZQkLqve9Zvlk7dbxuoMth+aDrJ
 8OMzPLxw5Wp14aY33fa1Ee+A0StThQIfUEdQTPk/I1eHTQ+rOVYv1RqvOy8l6W7SAK
 YOkvE2+v/hmw90BTJfOd+asTyzsGeOQKNZuumqQ0Wg2zgN2a9x7wcIr2YlGwae6z14
 LNO6r3SEv0qAuGWLhrDYevRp2aNOfhPHRLODn6TiiTX7vjwgB5gyy+LezWIGgSbAVy
 7OrTL1y5U0reEs4c2+toSV8hPRHPmT9l11Tm5onm3M+UDIi6d+xHtn0uY6Qa4BjotM
 tKUFZAsY9tQGg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=jbpQe65o
Subject: Re: [Buildroot] [PATCH] package/socat: bump to version 1.8.0.1
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 14/11/2024 20:02, Baruch Siach via buildroot wrote:
> Update README hash for changes unrelated to license.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Applied to next, thanks.

> ---
>  package/socat/socat.hash | 6 +++---
>  package/socat/socat.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/socat/socat.hash b/package/socat/socat.hash
> index 2a14d7530301..70c6e6a8f1c5 100644
> --- a/package/socat/socat.hash
> +++ b/package/socat/socat.hash
> @@ -1,8 +1,8 @@
>  # From http://www.dest-unreach.org/socat/download.md5sum
> -md5  51f9ecdf5d942d0a3c150ea400eb89ef  socat-1.8.0.0.tar.bz2
> +md5  e53a6e8e8594ac87476fe4ae361bbcd1  socat-1.8.0.1.tar.bz2
>  # From http://www.dest-unreach.org/socat/download.sha256sum
> -sha256  
> e1de683dd22ee0e3a6c6bbff269abe18ab0c9d7eb650204f125155b9005faca7  
> socat-1.8.0.0.tar.bz2
> +sha256  
> 6a283565db7cf86292c6f70504c58abb03e29888adeed5a6c5f3457e803c1b81  
> socat-1.8.0.1.tar.bz2
>  # Locally calculated
> -sha256  
> de9d702354b2e748ea87eb20d18c3d90ebede5dc6d2fc3c2e0645d139a5181bc  
> README
> +sha256  
> 6c07bae42bf0a919c9dd6583f76cc9020a472652dcdad3e84923074a1f412d75  
> README
>  sha256  
> 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  
> COPYING
>  sha256  
> fd9e48ca316a5032069b9521f4f4b4d9b1c60365012bae1e62286bcd5bd2e761  
> COPYING.OpenSSL
> diff --git a/package/socat/socat.mk b/package/socat/socat.mk
> index 7f634c28f09e..84d9cd3cf84d 100644
> --- a/package/socat/socat.mk
> +++ b/package/socat/socat.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -SOCAT_VERSION = 1.8.0.0
> +SOCAT_VERSION = 1.8.0.1
>  SOCAT_SOURCE = socat-$(SOCAT_VERSION).tar.bz2
>  SOCAT_SITE = http://www.dest-unreach.org/socat/download
>  SOCAT_LICENSE = GPL-2.0 with OpenSSL exception
> --
> 2.45.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
