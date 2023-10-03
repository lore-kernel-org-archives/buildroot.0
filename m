Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53060E8FDB4
	for <buildroot@archiver.kernel.org>; Tue,  3 Oct 2023 20:34:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBED0610E4;
	Tue,  3 Oct 2023 20:34:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBED0610E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OrCJyUUmc7VZ; Tue,  3 Oct 2023 20:34:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4ABBF60ECE;
	Tue,  3 Oct 2023 20:34:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4ABBF60ECE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 525361BF3D2
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 20:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C12980E4F
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 20:34:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C12980E4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OHMZTs2P3-Sb for <buildroot@lists.busybox.net>;
 Tue,  3 Oct 2023 20:34:48 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A0A0D80DB0
 for <buildroot@buildroot.org>; Tue,  3 Oct 2023 20:34:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0A0D80DB0
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:c4b3:c81e:8436:9d13])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 1F7C978034E;
 Tue,  3 Oct 2023 22:34:42 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 03 Oct 2023 22:34:41 +0200
Date: Tue, 3 Oct 2023 22:34:41 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231003203441.GE2957@scaer>
References: <20231003185603.233238-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231003185603.233238-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1696365284;
 bh=kMIO675x3OW9pQnzUHu7h6r1Gygy1JusDY59ACONzJc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KCk2cBYLFMchwgGWHCelpUABEB9VpeScRzLu/LYjfhyEvnkJ3oV95COTG4xWbh563
 6e2EGvNBHRjsMBG+2EQpB7qKWRg6V72GQ/zGIHLiNjBxpJPCqRdvWloCFqzQNcDHCQ
 n1rlzf0jKqxf+jN+ofqHTR1JKKbJE48+QrinyV1qMY1zlaQT7T3oYusgbLKNCP9YSQ
 zxEuTs6YuiLBcwpRM0dsJVdpP+G9dH4fJWFcowCmSGVYq/3ulEpjOC5eKKaPlzgRN5
 ozN3XyKzeKn6SQkNBS6ze1QL4aij6Gqc0kdF+LwrKXndDwn5LvKyKE2mm/dUyQNwv4
 ka+o3bVIUdRCQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KCk2cBYL
Subject: Re: [Buildroot] [PATCH 1/1] package/udpcast: bump to version
 20230924
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

On 2023-10-03 20:56 +0200, Fabrice Fontaine spake thusly:
> https://udpcast.linux.lu/mailman3/hyperkitty/list/udpcast@udpcast.linux.lu/thread/BXBS6HOFXCMOF3LKCOVWXDPRD43S6B3Z
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/udpcast/udpcast.hash | 2 +-
>  package/udpcast/udpcast.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/udpcast/udpcast.hash b/package/udpcast/udpcast.hash
> index 9ce91330fd..aca098d982 100644
> --- a/package/udpcast/udpcast.hash
> +++ b/package/udpcast/udpcast.hash
> @@ -1,3 +1,3 @@
>  # locally computed hash
> -sha256  a3cebee7a87ecf1bca0645f125be78fbd7b37846a4da82fecef96b92cc64d050  udpcast-20211207.tar.gz
> +sha256  17b5cd8b1e54f7e2e53357ac02ee86e4198bf704096987a03a3b5c402a0ecea1  udpcast-20230924.tar.gz
>  sha256  422befd3503b1f39a6027017f639874c1f274e37ec60ba3174894646b584ccbc  COPYING
> diff --git a/package/udpcast/udpcast.mk b/package/udpcast/udpcast.mk
> index 4ea73e20c7..64a0bfbd37 100644
> --- a/package/udpcast/udpcast.mk
> +++ b/package/udpcast/udpcast.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -UDPCAST_VERSION = 20211207
> +UDPCAST_VERSION = 20230924
>  UDPCAST_SITE = http://www.udpcast.linux.lu/download
>  UDPCAST_DEPENDENCIES = host-m4
>  UDPCAST_LICENSE = BSD-2-Clause, GPL-2.0+
> -- 
> 2.40.1
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
