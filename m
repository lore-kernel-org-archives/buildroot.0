Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190F3C636CC
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 14:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA2A04160F;
	Sun,  5 Feb 2023 14:39:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA2A04160F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8MkhkAQcjlzT; Sun,  5 Feb 2023 14:39:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6623041558;
	Sun,  5 Feb 2023 14:39:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6623041558
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7C60D1BF475
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 14:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 568138149B
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 14:39:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 568138149B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zaaBbLPdXMjo for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 14:39:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 510388149D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 510388149D
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 14:39:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.112.201])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 4B41513F854;
 Sun,  5 Feb 2023 15:39:45 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 05 Feb 2023 15:39:44 +0100
Date: Sun, 5 Feb 2023 15:39:44 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230205143944.GN2960@scaer>
References: <20230205142543.285695-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230205142543.285695-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675607987;
 bh=6Eskg5DCqiN8Ffp+vWWDBJnp296U2fH0rzIHZxog5zM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p8XMZDh76RO9AwOLITmEVCp6hioLHO6x7Dlx/VinnrOeG0rs3dPJOhV8FpNppcbbm
 gH6yOZ/xanHkvwUQVbFeCJdSA10C8rEkSNWRpfxzZowOVhhwmC1Nb3hOJSzdM+jpD0
 PE8ktVPMUzCPI0LrvsWd5f2jP7FBfWsndQZw/ymxx71S3kNcVToGhRh0GiPFcfKbfE
 eAXeHIMqBBTsDNwDIoxaawB+yRqY9FAT4934dGBlTUw/kDhtKO6s3Lujjy8o9qSrcu
 Tq/beeO3LCAWgxzjUFesEMw34nZfBhJEgsQGlOlBgg4qrtPrIwElO6zDFH70I1WNsU
 d+1mSRxQ2lnjw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=p8XMZDh7
Subject: Re: [Buildroot] [PATCH 1/1] package/wireshark: security bump to
 version 4.0.3
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

On 2023-02-05 15:25 +0100, Fabrice Fontaine spake thusly:
> Fix CVE-2023-0411, CVE-2023-0412, CVE-2023-0413, CVE-2023-0414,
> CVE-2023-0415, CVE-2023-0416 and CVE-2023-0417
> 
> https://www.wireshark.org/security/wnpa-sec-2023-01
> https://www.wireshark.org/security/wnpa-sec-2023-02
> https://www.wireshark.org/security/wnpa-sec-2023-03
> https://www.wireshark.org/security/wnpa-sec-2023-04
> https://www.wireshark.org/security/wnpa-sec-2023-05
> https://www.wireshark.org/security/wnpa-sec-2023-06
> https://www.wireshark.org/security/wnpa-sec-2023-07
> 
> https://www.wireshark.org/docs/relnotes/wireshark-4.0.3.html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/wireshark/wireshark.hash | 6 +++---
>  package/wireshark/wireshark.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
> index e9026b8caa..7128b560ae 100644
> --- a/package/wireshark/wireshark.hash
> +++ b/package/wireshark/wireshark.hash
> @@ -1,6 +1,6 @@
> -# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.0.2.txt
> -sha1  0127180ff18515b086fe5603f767f53ddaa64c1a  wireshark-4.0.2.tar.xz
> -sha256  f35915699f2f9b28ddb211202d40ec8984e5834d3c911483144a4984ba44411d  wireshark-4.0.2.tar.xz
> +# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.0.3.txt
> +sha1  243b0057cfe6d447662e81b5646110aaf8b63c81  wireshark-4.0.3.tar.xz
> +sha256  6c51e15bcc0afb93734e686dbff354ffd159f570bd2904bcbbad6f3feb7e9511  wireshark-4.0.3.tar.xz
>  
>  # Locally calculated
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
> index e2a424ef0f..12c36575df 100644
> --- a/package/wireshark/wireshark.mk
> +++ b/package/wireshark/wireshark.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WIRESHARK_VERSION = 4.0.2
> +WIRESHARK_VERSION = 4.0.3
>  WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
>  WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
>  WIRESHARK_LICENSE = wireshark license
> -- 
> 2.39.0
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
