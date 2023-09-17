Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 168E4CD37B4
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 12:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C12B3610FA;
	Sun, 17 Sep 2023 12:43:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C12B3610FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LMaPpAeJ_0J8; Sun, 17 Sep 2023 12:43:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A70E610F6;
	Sun, 17 Sep 2023 12:43:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A70E610F6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E6D981BF473
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 12:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BED6D4091D
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 12:43:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BED6D4091D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jm2LZ3wKSduc for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 12:43:51 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 587414091B
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 12:43:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 587414091B
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:6a7e:c3f3:1d37:8ba2])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 35F8DB0054E;
 Sun, 17 Sep 2023 14:43:45 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Sep 2023 14:43:45 +0200
Date: Sun, 17 Sep 2023 14:43:45 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20230917124345.GR415981@scaer>
References: <20230917090221.2767084-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230917090221.2767084-1-peter@korsgaard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694954628;
 bh=7yijPrf5KJVPQemjWkaLcA5OerNcue0iyy1v7iXoQ3U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y7NSxa6RtYxmXV3MfxOpBE+tgYtWC4kxwspKnfFtQx9WuAsurTmCHX2IEkB0usBuj
 aBe1iJ9WyViF4gUoZIfzDfao8Jotq0l/ooeUt++VOy9vrX/9YrCNpC1X4GJ2dQg913
 FAs3TH2D6bM2hMFBZqGTxKmpTm9lvgZKcMcss4iPDw3pwSnR25ES6SLl7FrRuutpZT
 G/St/rjXXDgXOJ//AlTmmjcmYwR5aWOxffSNROzPBSluNiVoRRUjkngUFu/naAdH4X
 3VrWUAUXQmp8p4REU/QzqwR9ZAFGcN4dJ1cedFozhezkVU6vzkGKAA8lK8+kjUXwSH
 5btVfQykyfV0A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Y7NSxa6R
Subject: Re: [Buildroot] [PATCH] package/asterisk: security bump to version
 16.30.1
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

Peter, All,

On 2023-09-17 11:02 +0200, Peter Korsgaard spake thusly:
> Fixes the following security vulnerabilities:
> 
> CVE-2022-23537: Heap buffer overflow when decoding STUN message in pjproject

When I read "pjproject", I thnk "libpjsip". Is it realated? If so, is it
impacted? If so, should we get a fix for it too?

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Possible buffer overread when parsing a specially crafted STUN message with
> unknown attribute.  The vulnerability affects Asterisk users using ICE
> and/or WebRTC.
> 
> https://github.com/asterisk/asterisk/security/advisories/GHSA-4xjp-22g4-9fxm
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/asterisk/asterisk.hash | 2 +-
>  package/asterisk/asterisk.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
> index 98ee3bdc71..41e1da2962 100644
> --- a/package/asterisk/asterisk.hash
> +++ b/package/asterisk/asterisk.hash
> @@ -1,5 +1,5 @@
>  # Locally computed
> -sha256  9b93006a87be9c29492299118200e4f66c8369851c66a50fdef5b15dfc4eb2c2  asterisk-16.29.1.tar.gz
> +sha256  ef1ddc07dc02bb0c5f5ba58a5e42e42bcb63e55ac94199be8e3b5d3910f43736  asterisk-16.30.1.tar.gz
>  
>  # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
>  # sha256 locally computed
> diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
> index 22ac0334fd..4f1a80ba8b 100644
> --- a/package/asterisk/asterisk.mk
> +++ b/package/asterisk/asterisk.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -ASTERISK_VERSION = 16.29.1
> +ASTERISK_VERSION = 16.30.1
>  # Use the github mirror: it's an official mirror maintained by Digium, and
>  # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
>  ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
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
