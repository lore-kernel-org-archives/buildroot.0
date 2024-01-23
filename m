Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D637C47258
	for <buildroot@archiver.kernel.org>; Tue, 23 Jan 2024 21:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C15284092D;
	Tue, 23 Jan 2024 21:37:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C15284092D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L9TWlWrXLEWY; Tue, 23 Jan 2024 21:37:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04E4B40285;
	Tue, 23 Jan 2024 21:37:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04E4B40285
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 180121BF426
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 21:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12A37839BF
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 21:17:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12A37839BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9nV4RuSbbph4 for <buildroot@lists.busybox.net>;
 Tue, 23 Jan 2024 21:17:39 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 068CE83D06
 for <buildroot@buildroot.org>; Tue, 23 Jan 2024 21:17:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 068CE83D06
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 98D8113F88D;
 Tue, 23 Jan 2024 22:17:33 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 23 Jan 2024 22:17:33 +0100
Date: Tue, 23 Jan 2024 22:17:33 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Antoine Coutant <antoine.coutant@smile.fr>
Message-ID: <ZbAs7YugNBmL3bIS@landeda>
References: <20240123162548.2738451-1-antoine.coutant@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240123162548.2738451-1-antoine.coutant@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1706044655;
 bh=9VQ/zSdJxjwFm0aA/nPHAoDV8CPiAQr3KY/sPw/go50=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qe/WRiu3KjN6zT97ZmL5La+tK9ASvTNxRPq6Uxp/RavxPY0MQrNS+LsjWbJglQIeD
 tLZfhHPDQEXXADXkpP5Qz8LE5T3r5D2ywGYqb1usn21+4BpuedENbpUEbvgBkOLZv/
 Vp/FApsHgX7D7j6AttiRPJ6LqteyMzInsNWwjJUxU8Bvp4TB7UqyLxvWn2TRDrG2uX
 Rxu6Ud/iJFRSqre5mrM13Kcyky5qtRZUOJsL83tekaClDm/PZCc7jHX+8NrtXx2JOY
 7tmBDvRSKHGdyr69eAT1wCzDVdYbtwJWh2pD6dNB8V37E45P1ga5xN+DMwg2tPY4EH
 8AcB1SAuOzU2g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Qe/WRiu3
Subject: Re: [Buildroot] [PATCH] package/bat: bump version to 0.24.0
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

Antoine, All,

On 2024-01-23 17:25 +0100, Antoine Coutant spake thusly:
> Changelog:
> https://github.com/sharkdp/bat/blob/master/CHANGELOG.md
> 
> Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>

All three patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Tested on qemu_x86_64
> ---
>  package/bat/bat.hash | 2 +-
>  package/bat/bat.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/bat/bat.hash b/package/bat/bat.hash
> index a79cb8f9a3..3fc01aff7f 100644
> --- a/package/bat/bat.hash
> +++ b/package/bat/bat.hash
> @@ -1,4 +1,4 @@
>  # Locally generated
> -sha256  b29af37f274019cf1a36d9483c6f30ff780d3be9d0a9e6a96a43737388b7e409  bat-0.23.0.tar.gz
> +sha256  59d40adf1532834613752511cb5349679bf82f7f20b98e42de50472d4aa97970  bat-0.24.0.tar.gz
>  sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
>  sha256  dccda9eb9533f5c65624a1106536c6cfde46008d58e60b3faf154e8b9fd5b46e  LICENSE-MIT
> diff --git a/package/bat/bat.mk b/package/bat/bat.mk
> index 395134df17..b95cdb25ac 100644
> --- a/package/bat/bat.mk
> +++ b/package/bat/bat.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BAT_VERSION = 0.23.0
> +BAT_VERSION = 0.24.0
>  BAT_SITE = $(call github,sharkdp,bat,v$(BAT_VERSION))
>  BAT_LICENSE = Apache-2.0 or MIT
>  BAT_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
> -- 
> 2.25.1
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
