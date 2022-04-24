Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5FCFC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Apr 2022 17:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DEAB415A0;
	Sun, 24 Apr 2022 17:39:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Np04jhulvSJy; Sun, 24 Apr 2022 17:39:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C257541570;
	Sun, 24 Apr 2022 17:39:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A07271BF352
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 17:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C49060AED
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 17:39:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K4dhlWU2ymFC for <buildroot@lists.busybox.net>;
 Sun, 24 Apr 2022 17:39:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 48EC860A93
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 17:39:32 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:657d:21bd:cb37:8719])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 5374B7802D7;
 Sun, 24 Apr 2022 19:39:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1650821968;
 bh=FAwSi+XdFd0+dN9wwoHjZL3oGUDw9rFTZy0Ut/jOMdk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EkzI5BceR2UIYarCyYoJEOJ7kkjHUEQBfdbgvDdzjmCOkYmF3fctVnS4rbM2IkKe4
 PoxLvZVawQgBC4P179bjyctjRy+42/E0JsHriLEpwZnYYQB5HSPMxcm85yUtqIFibZ
 AiKrFHHNFRiRFdOwxdwBrv3hSYcJVyZqShfamEOaCuhUj2gje3RlynaqSR+Os1E1M6
 BxciHUwg5RHfXwcjVX4QQPnXcR+pOhgCUuxSIJW+tsi7xUTryf03Yxxo3h9Lmvwg1a
 YUTvBkz9yYrPYxj2U2V7xEVWlb2AmMED5vLzPIqrBmy1FcjiD4pe+dlK3gEPMN35ba
 UzI9QKbefL9JQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 24 Apr 2022 19:39:26 +0200
Date: Sun, 24 Apr 2022 19:39:26 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220424173926.GY2730@scaer>
References: <20220424171355.3174629-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220424171355.3174629-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/pamtester: fix build without C++
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

Fabrice, All,

On 2022-04-24 19:13 +0200, Fabrice Fontaine spake thusly:
> Run autoreconf to avoid the following build failure without C++:
> 
> configure: error: C++ preprocessor "/lib/cpp" fails sanity check
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c000aff659da024b6eef42bca824bdea7b5541c2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/pamtester/pamtester.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/pamtester/pamtester.mk b/package/pamtester/pamtester.mk
> index b09e4d1cc0..2d8f1317ca 100644
> --- a/package/pamtester/pamtester.mk
> +++ b/package/pamtester/pamtester.mk
> @@ -9,5 +9,7 @@ PAMTESTER_SITE = https://download.sourceforge.net/project/pamtester/pamtester/$(
>  PAMTESTER_DEPENDENCIES = linux-pam
>  PAMTESTER_LICENSE = BSD-3-Clause
>  PAMTESTER_LICENSE_FILES = LICENSE
> +# Fix build failure without C++
> +PAMTESTER_AUTORECONF = YES

Why does autoreconfiguring fix the issue?

Regards,
Yann E. MORIN.

>  $(eval $(autotools-package))
> -- 
> 2.35.1
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
