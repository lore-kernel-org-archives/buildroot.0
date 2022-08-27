Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006C8ECAAD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 07:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 745C160BFC;
	Sat, 27 Aug 2022 07:59:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 745C160BFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FX5COfhMXIJU; Sat, 27 Aug 2022 07:59:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 974A660BF0;
	Sat, 27 Aug 2022 07:59:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 974A660BF0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 296851BF267
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 07:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01897404F0
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 07:59:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01897404F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7_34tpvj6ihl for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 07:59:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94B6E404EB
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 94B6E404EB
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 07:59:52 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1c2f:c99e:ae80:bcc0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id C9AF419F748;
 Sat, 27 Aug 2022 09:59:47 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 27 Aug 2022 09:59:47 +0200
Date: Sat, 27 Aug 2022 09:59:47 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220827075947.GP37358@scaer>
References: <20220826213447.47029-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220826213447.47029-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661587191;
 bh=grZn1wbTCxnNSBJAqKJrbNWncUkLZQt61Sp4n9oFDbs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lv0zQRp924QlVBzoXdA1dUIiDi1MUymA1aE4TT4KORitPfOhcKy+d2t2tGeuU8aip
 7z+YtD6pwqd7NLst1gFUSiMOvinN9np2ps/fheVnqv+Z+/bNV2RDprv6XreUXr9t5u
 l6vpBYAhKTydafwh2sQRTYvy8F5lOchFBKjYLjkrLGoC5QaY88qA+Hnv+Iz2kh94+6
 dOl42G0XsE+wBSLEot89td3ooMlcY2biIEQvVVGcKyBi8S0KZTGeU3qQEUBE6fr7uf
 CVpkwt7PN0B94/gGrXHIVa2jFCTSQGzXeS2oeimUdjc8cezAbR3BnU6HGy0B51Hdyv
 JgnIVrlLx7lrw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lv0zQRp9
Subject: Re: [Buildroot] [PATCH 1/2] package/v4l2loopback: add
 V4L2LOOPBACK_CPE_ID_VENDOR
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
Cc: Alexandre Esse <alexandre.esse.dev@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-08-26 23:34 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:o:v4l2loopback_project:v4l2loopback is a valid CPE identifier
> for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Ao%3Av4l2loopback_project%3Av4l2loopback
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Series of two patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/v4l2loopback/v4l2loopback.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/v4l2loopback/v4l2loopback.mk b/package/v4l2loopback/v4l2loopback.mk
> index d9f065a49d..6ee4b69ef9 100644
> --- a/package/v4l2loopback/v4l2loopback.mk
> +++ b/package/v4l2loopback/v4l2loopback.mk
> @@ -8,6 +8,8 @@ V4L2LOOPBACK_VERSION = 0.12.5
>  V4L2LOOPBACK_SITE = $(call github,umlaeute,v4l2loopback,v$(V4L2LOOPBACK_VERSION))
>  V4L2LOOPBACK_LICENSE = GPL-2.0+
>  V4L2LOOPBACK_LICENSE_FILES = COPYING
> +V4L2LOOPBACK_CPE_ID_VENDOR = v4l2loopback_project
> +V4L2LOOPBACK_CPE_ID_PREFIX = cpe:2.3:o
>  
>  ifeq ($(BR2_PACKAGE_V4L2LOOPBACK_UTILS),y)
>  define V4L2LOOPBACK_INSTALL_TARGET_CMDS
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
