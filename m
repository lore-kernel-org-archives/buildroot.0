Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E87F9C77B7C
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 21:26:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 98328408A5;
	Sun,  7 May 2023 21:26:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98328408A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dmVKxWsfw_sp; Sun,  7 May 2023 21:26:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE42640629;
	Sun,  7 May 2023 21:26:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE42640629
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EF3A71BF2C4
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C854460F47
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:26:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C854460F47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d4Gl7z75b7kd for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 21:26:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86EAE60F45
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 86EAE60F45
 for <buildroot@buildroot.org>; Sun,  7 May 2023 21:26:46 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:7bde:4dbc:bac0:54b7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id C14B22003A4;
 Sun,  7 May 2023 23:26:40 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 May 2023 23:26:40 +0200
Date: Sun, 7 May 2023 23:26:40 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Leon Rinkel <leon@rinkel.me>
Message-ID: <20230507212640.GQ252090@scaer>
References: <20230507204842.1390-1-leon@rinkel.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230507204842.1390-1-leon@rinkel.me>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683494803;
 bh=7PoTEYmnO0YVvKM2KzuIzL9SPRsXYvTj8jImCRQntsk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qjl2himJBODbROO9cBCqdxtIg9T5ko5lECIjJ04GiL5R2IQwLfEWdPocr5LrBaOKR
 GEuP4gWMAJEyGT6XNJ3kjtgBiPwx6vlRLT0H2qR2fj6Yf47Nz4myTLgUrAuSjgtnfe
 No1CkSWFJiqBgRcU0fIakE2H7rF2oNvOrqWQabxJejOkeyAZ3Bv6DdUGwKIIsYf+W3
 3OQPQZ7jl84s6OhizCCIWa+yRon/U2aY9zYobOrqK9AmzBo+XRw7dMchb4iAWtKCor
 rpFdcs785lMzpC92fOuyOx04b4jZAzigmzzSfNCivbxpgnE+CKOSNutDex7p/bZ3/H
 1RIwOIgSfk6lQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qjl2himJ
Subject: Re: [Buildroot] [PATCH v2] package/bat: bump version to 0.23.0
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
Cc: David Pierret <david.pierret@smile.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Leon, All,

On 2023-05-07 20:48 +0000, Leon Rinkel spake thusly:
> Update hash for LICENSE-MIT, to account for an update in the copyright years:
> https://github.com/sharkdp/bat/commit/d43d241f5bac0fde7881b55f61644e0408181cf7
> 
> Signed-off-by: Leon Rinkel <leon@rinkel.me>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>   - Justify license hash change in commit message (requested by Yann E. MORIN)
> 
> Signed-off-by: Leon Rinkel <leon@rinkel.me>
> ---
>  package/bat/bat.hash | 4 ++--
>  package/bat/bat.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/bat/bat.hash b/package/bat/bat.hash
> index f4d3e32c34..a79cb8f9a3 100644
> --- a/package/bat/bat.hash
> +++ b/package/bat/bat.hash
> @@ -1,4 +1,4 @@
>  # Locally generated
> -sha256  7940641baaa61cd3bcd1c3db4804d179609d6ccd955868928a129bf3f853e0b2  bat-0.19.0.tar.gz
> +sha256  b29af37f274019cf1a36d9483c6f30ff780d3be9d0a9e6a96a43737388b7e409  bat-0.23.0.tar.gz
>  sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
> -sha256  64de710b6309a7db5e44ad0af382300c7fb6f6d116d8ae32f0164e05db033068  LICENSE-MIT
> +sha256  dccda9eb9533f5c65624a1106536c6cfde46008d58e60b3faf154e8b9fd5b46e  LICENSE-MIT
> diff --git a/package/bat/bat.mk b/package/bat/bat.mk
> index dc29a85429..395134df17 100644
> --- a/package/bat/bat.mk
> +++ b/package/bat/bat.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BAT_VERSION = 0.19.0
> +BAT_VERSION = 0.23.0
>  BAT_SITE = $(call github,sharkdp,bat,v$(BAT_VERSION))
>  BAT_LICENSE = Apache-2.0 or MIT
>  BAT_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
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
