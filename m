Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4301C77B7F
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 15:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C10181E22;
	Sat,  6 May 2023 15:38:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C10181E22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tWoqQWtTgef7; Sat,  6 May 2023 15:38:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B394281B36;
	Sat,  6 May 2023 15:38:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B394281B36
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 81CA81BF36C
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 15:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5971481951
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 15:38:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5971481951
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5gqZ3fWrxEXY for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 15:38:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 126B381865
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 126B381865
 for <buildroot@busybox.net>; Sat,  6 May 2023 15:38:48 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:ae89:1f5e:7283:231f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 2F1A2B00579;
 Sat,  6 May 2023 17:38:45 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 06 May 2023 17:38:44 +0200
Date: Sat, 6 May 2023 17:38:44 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Baruch Siach <baruch@tkos.co.il>
Message-ID: <20230506153844.GJ252090@scaer>
References: <8bd45a8969a830626dc674204f09c522fd61bb6c.1683259990.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8bd45a8969a830626dc674204f09c522fd61bb6c.1683259990.git.baruch@tkos.co.il>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683387527;
 bh=NMR4KKsSnYFefFO0EhWJ461Z7iZoFETL2iq0hSLJ0ZE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E5u2XPEWRJPwrPcwWaM1rcv1NxQx0G/rHylCatAZup+CmrEAfv2fc55D26BWve/FY
 pPDkIpomRk0qdJXPaczlOBRHqmigBMFiwvsE0z2D3g72j2N92sq2ebjozeKzODlLgF
 0JYuvud2GAz3CSuWdt4g8Wlj7ZQhxPn6S8L6JjaWU6rfTXyjFGZBAhD5ElBs3ekyZA
 Hvgugcp+YXbyMxLc5ZGeDZGJXM5F8H9o4Uaqf0V0m5Ses0EMU7PQHNN4yZz0Cyy/CW
 tgDfyJ6xyF5xbzh+qPuaPAY9F1OTsq6yqgv4K9IMwh6xd1JlQT3VfGyzf7eg3+tyNV
 C+BksHqaVR2LA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=E5u2XPEW
Subject: Re: [Buildroot] [PATCH] package/libpcap: bump to version 1.10.4
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

Baruch, All,

On 2023-05-05 07:13 +0300, Baruch Siach via buildroot spake thusly:
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libpcap/libpcap.hash | 4 ++--
>  package/libpcap/libpcap.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libpcap/libpcap.hash b/package/libpcap/libpcap.hash
> index 270fd8869dac..34339c126196 100644
> --- a/package/libpcap/libpcap.hash
> +++ b/package/libpcap/libpcap.hash
> @@ -1,6 +1,6 @@
>  # Locally calculated after checking pgp signature
> -# https://www.tcpdump.org/release/libpcap-1.10.3.tar.gz.sig
> -sha256  2a8885c403516cf7b0933ed4b14d6caa30e02052489ebd414dc75ac52e7559e6  libpcap-1.10.3.tar.gz
> +# https://www.tcpdump.org/release/libpcap-1.10.4.tar.gz.sig
> +sha256  ed19a0383fad72e3ad435fd239d7cd80d64916b87269550159d20e47160ebe5f  libpcap-1.10.4.tar.gz
>  
>  # Hash for license file:
>  sha256  8a54594d257e14a5260ac770f1633516cb51e3fc28c40136ce2697014eda7afd  LICENSE
> diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
> index d4292ae9a3fb..a4523f22182b 100644
> --- a/package/libpcap/libpcap.mk
> +++ b/package/libpcap/libpcap.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBPCAP_VERSION = 1.10.3
> +LIBPCAP_VERSION = 1.10.4
>  LIBPCAP_SITE = https://www.tcpdump.org/release
>  LIBPCAP_LICENSE = BSD-3-Clause
>  LIBPCAP_LICENSE_FILES = LICENSE
> -- 
> 2.39.2
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
