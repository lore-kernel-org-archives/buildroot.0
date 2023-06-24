Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F088EEB64DA
	for <buildroot@archiver.kernel.org>; Sat, 24 Jun 2023 14:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85CD960F2E;
	Sat, 24 Jun 2023 14:33:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85CD960F2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jftwXuuQhcZL; Sat, 24 Jun 2023 14:33:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A73B76112B;
	Sat, 24 Jun 2023 14:33:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A73B76112B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1549F1BF3E0
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 14:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0697403A4
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 14:33:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0697403A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SgIyRs3M_soY for <buildroot@lists.busybox.net>;
 Sat, 24 Jun 2023 14:33:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D1244011B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4D1244011B
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 14:32:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:d5f8:72e0:30f9:5d41])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id D9BECB00579;
 Sat, 24 Jun 2023 16:32:54 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 24 Jun 2023 16:32:54 +0200
Date: Sat, 24 Jun 2023 16:32:54 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230624143254.GU24952@scaer>
References: <20230624141847.3243715-1-bernd@kuhls.net>
 <20230624141847.3243715-2-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230624141847.3243715-2-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1687617176;
 bh=Woi2BPBzkxdQlXeSDWhlZXik05nAb7pTQoHazlRh2Kw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IU8RLaXJYZzTJ+tNMc3NE5esNPI7IU2EN1bc6YUlW4rIeMSzMvOxmI2ct03GMFCw0
 8CRZnnW/Tsh0Nk9SCjS2iS2TqB3EIwcP0olJVdiB1cI4l0mpWZmyBJezJazzZ6wgBU
 sXRsh3t4p7lhwQeCG4AC1gwGSGSGtw9ATUmPTsKSgpAO8YADGSwoa7hUAJlIoe7Ya8
 Z2CdjpSKTSbDn4vrqOMhbjIGWZyKSMB+NoP0JAkiWIiBG2ZrGu4qE2yNyiqMeXAwP6
 FW/V/E150RYUVLdZcddoapTjNMZlTR6pK+HWFa5XQLMQbA8af3j+Vj6JVMtkmnWl9m
 LCUhw1kLYDq/Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IU8RLaXJ
Subject: Re: [Buildroot] [PATCH 2/2] package/samba4: update patch 0004
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

On 2023-06-24 16:18 +0200, Bernd Kuhls spake thusly:
> Fix typo in title, add upstream URL

Ah, I knew I had already seen something similar recently...

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...dparty-heindal-Use-perl-module-JSON-part-of-core-i.patch | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/samba4/0004-3rdparty-heindal-Use-perl-module-JSON-part-of-core-i.patch b/package/samba4/0004-3rdparty-heindal-Use-perl-module-JSON-part-of-core-i.patch
> index 7eb31e5d07..aa55c09891 100644
> --- a/package/samba4/0004-3rdparty-heindal-Use-perl-module-JSON-part-of-core-i.patch
> +++ b/package/samba4/0004-3rdparty-heindal-Use-perl-module-JSON-part-of-core-i.patch
> @@ -1,15 +1,15 @@
>  From bd8fc19c8383914b518a9d56f4c08fba3baeb967 Mon Sep 17 00:00:00 2001
>  From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  Date: Sun, 7 May 2023 11:02:26 +0200
> -Subject: [PATCH] 3rdparty/heindal: Use perl module JSON, part of core, instead
> - of JSON:PP package
> +Subject: [PATCH] 3rdparty/heimdal: Use perl module JSON:PP, part of core, instead
> + of JSON package
>  
>  Downloaded from
>  https://github.com/openwrt/packages/blob/master/net/samba4/patches/105-perl-json-pp.patch
>  
>  Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>  Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> -Upstream: unknown
> +Upstream: https://github.com/heimdal/heimdal/pull/1176
>  ---
>   third_party/heimdal/cf/make-proto.pl | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
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
