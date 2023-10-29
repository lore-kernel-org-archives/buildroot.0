Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 255D5C4332F
	for <buildroot@archiver.kernel.org>; Sun, 29 Oct 2023 08:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D46797044E;
	Sun, 29 Oct 2023 08:41:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D46797044E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uhx5Zy1qwzQO; Sun, 29 Oct 2023 08:41:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1974A7040D;
	Sun, 29 Oct 2023 08:41:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1974A7040D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3C2551BF41A
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 08:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14B7070416
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 08:39:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14B7070416
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YkzRiuDpyJwx for <buildroot@lists.busybox.net>;
 Sun, 29 Oct 2023 08:39:13 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C55777040A
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 08:39:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C55777040A
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:de1f:355b:eff2:ec6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id C34B6200587;
 Sun, 29 Oct 2023 09:39:06 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 Oct 2023 09:39:06 +0100
Date: Sun, 29 Oct 2023 09:39:06 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231029083906.GH687180@scaer>
References: <20231028210348.1235466-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231028210348.1235466-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698568750;
 bh=KvqEPTvX5KGYXOPpjKqFxJngyAXV4S/OlCpdyuj8xKI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CKiu+6GOvirM17+iaR7DxWheXu7Vp8XKHtbrMvJdOizaFBCwgU7kYqe9GpX1c9thm
 T9jMvwSLd91Frtmgj2pthM3PuwOI8BeF6ib7gfosJmY3DKkXSJET5gcCglAGm2J3oL
 kA/+qEVM7eFXEtG23CqtlJIwCLM3HFwAySVjmB8fh/hfs+zPpHSV+gQPHxtC6NKDE/
 0oDij547l9yq70jNrsLmzxcf8YLWJYJKUhX95kzA/CysejrgJ7u+XnE0/GPdFGsnjq
 VGNGHdPb7bP1dxa3AcY5wXCWXm1M1JcniNun12UKsKqN2R9DmFWti2OzHeZidTLj55
 yZNWSqbscMCmg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CKiu+6GO
Subject: Re: [Buildroot] [PATCH 1/1] package/flashrom: bump to version 1.3.0
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

Fabrice, All,

On 2023-10-28 23:03 +0200, Fabrice Fontaine spake thusly:
> https://www.flashrom.org/release_notes/v_1_3.html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/flashrom/flashrom.hash | 4 ++--
>  package/flashrom/flashrom.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/flashrom/flashrom.hash b/package/flashrom/flashrom.hash
> index 2ab463d93a..d3bfbad781 100644
> --- a/package/flashrom/flashrom.hash
> +++ b/package/flashrom/flashrom.hash
> @@ -1,4 +1,4 @@
>  # Locally computed after checking pgp signature
> -# https://download.flashrom.org/releases/flashrom-v1.2.1.tar.bz2.asc
> -sha256  89a7ff5beb08c89b8795bbd253a51b9453547a864c31793302296b56bbc56d65  flashrom-v1.2.1.tar.bz2
> +# https://download.flashrom.org/releases/flashrom-v1.3.0.tar.bz2.asc
> +sha256  a053234453ccd012e79f3443bdcc61625cf97b7fd7cb4cdd8bfbffbe8b149623  flashrom-v1.3.0.tar.bz2
>  sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
> index dd505987ed..ca55592dba 100644
> --- a/package/flashrom/flashrom.mk
> +++ b/package/flashrom/flashrom.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FLASHROM_VERSION = 1.2.1
> +FLASHROM_VERSION = 1.3.0
>  FLASHROM_SOURCE = flashrom-v$(FLASHROM_VERSION).tar.bz2
>  FLASHROM_SITE = https://download.flashrom.org/releases
>  FLASHROM_LICENSE = GPL-2.0+
> -- 
> 2.42.0
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
