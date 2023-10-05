Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5555EE92735
	for <buildroot@archiver.kernel.org>; Thu,  5 Oct 2023 19:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3D31428D4;
	Thu,  5 Oct 2023 19:56:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3D31428D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c6Y0X86p-TMQ; Thu,  5 Oct 2023 19:56:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA21C428CE;
	Thu,  5 Oct 2023 19:56:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA21C428CE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2554F1BF40E
 for <buildroot@lists.busybox.net>; Thu,  5 Oct 2023 19:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C2A840280
 for <buildroot@lists.busybox.net>; Thu,  5 Oct 2023 19:56:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C2A840280
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0aKnd_c6FP8f for <buildroot@lists.busybox.net>;
 Thu,  5 Oct 2023 19:56:17 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1EF96400C6
 for <buildroot@buildroot.org>; Thu,  5 Oct 2023 19:56:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EF96400C6
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:c5c9:a1ea:cbf9:9051])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 14B8819F743;
 Thu,  5 Oct 2023 21:56:13 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 05 Oct 2023 21:56:12 +0200
Date: Thu, 5 Oct 2023 21:56:12 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francis Laniel <flaniel@linux.microsoft.com>
Message-ID: <20231005195612.GB2552@scaer>
References: <20231005062458.8973-1-flaniel@linux.microsoft.com>
 <20231005062458.8973-2-flaniel@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231005062458.8973-2-flaniel@linux.microsoft.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1696535775;
 bh=ahcm+AYdTMnsx5gmWVKqGyYdw6fYlynliEsl9VNu3dc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nwDQQ55t1/j3gG3vxBZTYehVDE1JmBA2kCXnKvX8SLg0JLK8XH5yt/VJCcdV5aQvX
 cQnwJivA/2wW0BtkHLLsVrjxBwzbuxdNpjOLx44jQSzze7fpmn6R/t7anwU2v7PiTk
 pdMbh4oH0wgLjdasshINMWnov0j8w/wLPZYz+Q9HXIqCD/PfGSAFuL/ElOBJ6bJrV/
 X2BxGBk1QbITRXwnTj6aKHMeW7Un03qhON/qI50UeXl7TqpQtDeGw2vlAZCBfVDrnh
 A9qcv9jGkQiAZNfjb/WOeC9L3GeaFXSGLXrzVG1flEJ5t+++4lFW/ldBictHWGQIlZ
 b7YpEoviZjOBg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nwDQQ55t
Subject: Re: [Buildroot] [PATCH 1/1] package/tbb: fixes hash
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

Francis, All,

On 2023-10-05 09:24 +0300, Francis Laniel spake thusly:
> Fixes: 74b50d553eaf ("package/tbb: bump to version 2021.10.0.")
> Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/tbb/tbb.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/tbb/tbb.hash b/package/tbb/tbb.hash
> index 1caf81c5c5..085d54109a 100644
> --- a/package/tbb/tbb.hash
> +++ b/package/tbb/tbb.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  eee380323bb7ce864355ed9431f85c43955faaae9e9bce35c62b372d7ffd9f8b  tbb-2021.10.0.tar.gz
> +sha256  487023a955e5a3cc6d3a0d5f89179f9b6c0ae7222613a7185b0227ba0c83700b  tbb-2021.10.0.tar.gz
>  sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE.txt
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
