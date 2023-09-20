Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CE8C04ABA
	for <buildroot@archiver.kernel.org>; Wed, 20 Sep 2023 17:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DC1661389;
	Wed, 20 Sep 2023 17:37:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DC1661389
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jQr11hGUimpw; Wed, 20 Sep 2023 17:37:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5369361376;
	Wed, 20 Sep 2023 17:37:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5369361376
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0A2F21BF95F
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 17:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D708B41FAA
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 17:37:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D708B41FAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZOTCWwgx13oS for <buildroot@lists.busybox.net>;
 Wed, 20 Sep 2023 17:37:07 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A3CD141FA5
 for <buildroot@buildroot.org>; Wed, 20 Sep 2023 17:37:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3CD141FA5
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:a117:66c:8b6b:25fb])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 75FB660139;
 Wed, 20 Sep 2023 19:37:01 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 20 Sep 2023 19:37:01 +0200
Date: Wed, 20 Sep 2023 19:37:01 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Daniel Lang <dalang@gmx.at>
Message-ID: <20230920173701.GF512384@scaer>
References: <20230920043113.36674-2-dalang@gmx.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230920043113.36674-2-dalang@gmx.at>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1695231423;
 bh=dBbvTn5U+ACwd/qz3+F/r7PiGsLVLs3pfzyNIYXG6No=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FbWBTUOmfBk8aKHFw5YBFLYvPBRDjT/nEdN3cedWhH7XkkvlCIDnIXE82/XittKwd
 0R+dIawhxWnYUfXPnYWOlbc3u30IP6qsFrig8q5n+paqXIDktwMfR5/IcA3KRfjG9P
 zmEb69adQPV/ovK6xJWPnQe1RNE3K4B62FLS69Ncw1qP8Db/Q5y2Pp705Hy254CcAA
 XCaRGmoZhqrIk1GTK5ST2ogCG5aptH8WXkt5aP8P7WBN0r2WRMhW2EEghIv1dkNYMd
 uSxUs6wzVDdlmtT5a1rcpgeEjBIG6VlsBBE3iyOiNDPjQF+gaaafZ8vetmjSHfjDO8
 KBZM/7MKk3WWg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FbWBTUOm
Subject: Re: [Buildroot] [PATCH v2] package/bind: drop CVE-2017-3139 from
 IGNORE_CVES
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

Daniel, All,

On 2023-09-20 06:31 +0200, Daniel Lang spake thusly:
> As of 2021-05-14 CVE-2017-3139 is no longer listed as affecting bind, only RHEL.
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> v1 -> v2:
> add Signed-off-by
> ---
>  package/bind/bind.mk | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/package/bind/bind.mk b/package/bind/bind.mk
> index b934ab3190..618b5b9278 100644
> --- a/package/bind/bind.mk
> +++ b/package/bind/bind.mk
> @@ -14,8 +14,6 @@ BIND_LICENSE = MPL-2.0
>  BIND_LICENSE_FILES = COPYRIGHT
>  BIND_CPE_ID_VENDOR = isc
>  BIND_SELINUX_MODULES = bind
> -# Only applies to RHEL6.x with DNSSEC validation on
> -BIND_IGNORE_CVES = CVE-2017-3139
>  # Library CVE and not used by bind but used by ISC DHCP
>  BIND_IGNORE_CVES += CVE-2019-6470
>  BIND_TARGET_SERVER_SBIN = arpaname ddns-confgen dnssec-checkds dnssec-coverage
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
