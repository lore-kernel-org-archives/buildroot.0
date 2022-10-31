Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E3AC38A02
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 10:01:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60E6681323;
	Mon, 31 Oct 2022 10:01:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60E6681323
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yjkmilRKPlx0; Mon, 31 Oct 2022 10:01:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 013A08132A;
	Mon, 31 Oct 2022 10:01:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 013A08132A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9263D1BF580
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 10:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B55960B33
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 10:00:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B55960B33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gkoJl3CYmOkM for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 10:00:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7821E60B2A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7821E60B2A
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 10:00:11 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:afdc:c5f1:f1be:8b47])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id AB9D1B00592;
 Mon, 31 Oct 2022 11:00:07 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 31 Oct 2022 11:00:07 +0100
Date: Mon, 31 Oct 2022 11:00:07 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221031100007.GT1058960@scaer>
References: <20221030213517.95390-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221030213517.95390-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667210409;
 bh=nzoZwrn2pDhvcJWEWVESMlCEj6f8yeuyJAqFdSaBQyg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HfNT0qDpw4YF9IG55hJiMouFbDmCCfgIjD+IADl67EigjQkSbezY9h89LObxpyC/o
 xYlKuI4cVOp/bov+tMxsCaU4HWX5gLe87NSoD5SWDn1/wZxyjGEj3imP9RSzquxkae
 /A8fI+NeHZnBNnI3YqEfUYWK2KWnkN9ewr/7tOUCdK2B93aupAFd9ZVWiO2r5h8YSN
 go0T7ifa1gPPLij5u627WVZjiRzL6IuP58kt2KgsnK6lEcJzibjdNfbdrMjOgzNO6N
 bXK3L5jaKmNJ+smu9bTATnW4hcH9iz9UajYNMpdjqvYclSqxTgdYKL4RQoUyHoeXyr
 yOM3AwRO/0HfQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HfNT0qDp
Subject: Re: [Buildroot] [PATCH 1/1] package/arp-scan: bump to version 1.9.8
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

On 2022-10-30 22:35 +0100, Fabrice Fontaine spake thusly:
> Update hash of COPYING (gnu.org license file used since
> https://github.com/royhills/arp-scan/commit/6194ffb69d831709d49b83f734f8c338c13df28c)
> 
> https://github.com/royhills/arp-scan/blob/1.9.8/ChangeLog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/arp-scan/arp-scan.hash | 4 ++--
>  package/arp-scan/arp-scan.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/arp-scan/arp-scan.hash b/package/arp-scan/arp-scan.hash
> index dd97333013..b18c6ceb38 100644
> --- a/package/arp-scan/arp-scan.hash
> +++ b/package/arp-scan/arp-scan.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  e03c36e4933c655bd0e4a841272554a347cd0136faf42c4a6564059e0761c039  arp-scan-1.9.7.tar.gz
> -sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> +sha256  b9b75ceaef6348f5951b06c773ec7a243a9e780e160eafebc369f9c27f6a7d3f  arp-scan-1.9.8.tar.gz
> +sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
> diff --git a/package/arp-scan/arp-scan.mk b/package/arp-scan/arp-scan.mk
> index 3fdbd463c2..73d1b99bc7 100644
> --- a/package/arp-scan/arp-scan.mk
> +++ b/package/arp-scan/arp-scan.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -ARP_SCAN_VERSION = 1.9.7
> +ARP_SCAN_VERSION = 1.9.8
>  ARP_SCAN_SITE = $(call github,royhills,arp-scan,$(ARP_SCAN_VERSION))
>  ARP_SCAN_LICENSE = GPL-3.0+
>  ARP_SCAN_LICENSE_FILES = COPYING
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
