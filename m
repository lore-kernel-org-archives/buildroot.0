Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8511FC25B08
	for <buildroot@archiver.kernel.org>; Sat, 20 Aug 2022 17:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0671C41737;
	Sat, 20 Aug 2022 17:35:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0671C41737
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jycFSa3b2QLq; Sat, 20 Aug 2022 17:35:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE630416AB;
	Sat, 20 Aug 2022 17:35:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE630416AB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 07B9C1BF2B7
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 17:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E113241697
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 17:35:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E113241697
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lbhffMpOHG2n for <buildroot@lists.busybox.net>;
 Sat, 20 Aug 2022 17:35:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73DC1416ED
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 73DC1416ED
 for <buildroot@buildroot.org>; Sat, 20 Aug 2022 17:35:46 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:18c4:2559:c4a2:6528])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 91BF16012A;
 Sat, 20 Aug 2022 19:35:42 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 20 Aug 2022 19:35:42 +0200
Date: Sat, 20 Aug 2022 19:35:42 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220820173542.GO2167049@scaer>
References: <20220817153312.25368-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220817153312.25368-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661016944;
 bh=vbvzrdydTjuoxw4hzpDrIBRjcnYxdAmwAV6agpcWLYo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vJc8F20VaAnNR9/nRuxK5hVexGN73iw1YbLlFaYvpwjtZGlI6xXZ0bAKCrx7L6aSU
 eXj2cXJiGdqBMsRvCKl9s5TwQxA94+Sx904H4+P1/ZuK/gWXUAP8haRvxe4U40elC/
 cGZ/5lJX3AkoENW7aKdaPbSe3Y0FXlK6G8fCLFJeEgzqPQ6GbARvb5aNTHC0DsVWtr
 RNUK1BZfjDapwdUFXNinoIZyf2GPzgrpqM8xOOKTt9LVPU1WGZlI6WqoR/Iuj3jm1F
 QwUdKEhjk9/phTa++6arFtkDTsfVqOiFUYyvc2A6bN/z4ESBDGs6dVYMPDosfeH9c/
 g0BMj2vC9qLXQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vJc8F20V
Subject: Re: [Buildroot] [PATCH/next 1/1] package/tor: bump version to
 0.4.7.10
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2022-08-17 17:33 +0200, Bernd Kuhls spake thusly:
> Release notes:
> https://gitlab.torproject.org/tpo/core/tor/-/raw/release-0.4.7/ReleaseNotes
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/tor/tor.hash | 4 ++--
>  package/tor/tor.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/tor/tor.hash b/package/tor/tor.hash
> index dd1edfa97c..dba08f51b5 100644
> --- a/package/tor/tor.hash
> +++ b/package/tor/tor.hash
> @@ -1,4 +1,4 @@
> -# From https://dist.torproject.org/tor-0.4.7.8.tar.gz.sha256sum
> -sha256  9e9a5c67ad2acdd5f0f8be14ed591fed076b1708abf8344066990a0fa66fe195  tor-0.4.7.8.tar.gz
> +# From https://dist.torproject.org/tor-0.4.7.10.tar.gz.sha256sum
> +sha256  647e56dfa59ea36dab052027fcfc7663905c826c03509363c456900ecd435a5b  tor-0.4.7.10.tar.gz
>  # Locally computed
>  sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
> diff --git a/package/tor/tor.mk b/package/tor/tor.mk
> index 0e4bb553e2..ed3714f2db 100644
> --- a/package/tor/tor.mk
> +++ b/package/tor/tor.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TOR_VERSION = 0.4.7.8
> +TOR_VERSION = 0.4.7.10
>  TOR_SITE = https://dist.torproject.org
>  TOR_LICENSE = BSD-3-Clause
>  TOR_LICENSE_FILES = LICENSE
> -- 
> 2.30.2
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
