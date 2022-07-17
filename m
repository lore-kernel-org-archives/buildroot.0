Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DFF6C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 13:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 180C0416F7;
	Sun, 17 Jul 2022 13:23:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 180C0416F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0zHLLhpxLvOQ; Sun, 17 Jul 2022 13:23:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A49FB416D5;
	Sun, 17 Jul 2022 13:23:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A49FB416D5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D43371BF3D5
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB0294177E
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:21:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB0294177E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YKv_x2mNBQxE for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 13:21:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58B6941779
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 58B6941779
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 13:21:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4985:d730:3c09:77ac])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 67772780500;
 Sun, 17 Jul 2022 15:21:25 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Jul 2022 15:21:25 +0200
Date: Sun, 17 Jul 2022 15:21:25 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220717132125.GE2249625@scaer>
References: <20220712214356.1976809-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220712214356.1976809-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658064087;
 bh=kHKG2FLOOybtO30LLHxdGn+YhfMGqzlqk83UplwEBjE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hTL2vdCrDK6XERWCFDVQl0HhjF9X9OIwgXx5kq6COu6ROhcVkCiInOE2gMyOZRWqT
 RQehpgz9iiB6uIj/siTdpaDotgeh/FrcWlri9vyRJATw5JED6tHQF2pVnDO5qGf6/0
 uiZEPEKCAvB2EQBFNKdZxERTUG++v3wugvnQIWXWlZEfFPwK8Wy9c6YkwdRS2pk2z4
 sW7Gz5vkqvTv12Q/k2OUadtJhSyDVuNXDIcoAQy1hrR3/pPth39XaYXl7N6nkBbrqN
 itiNEoOwZfdCh/ihfevAq3WfgTprIHk+9zjTbOpJbLCYL9w/WTx/ch0z1YMawlo7OJ
 DlNKLw/sVHvDQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hTL2vdCr
Subject: Re: [Buildroot] [PATCH 1/1] package/haproxy: bump to version 2.6.1
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

On 2022-07-12 23:43 +0200, Fabrice Fontaine spake thusly:
> https://www.mail-archive.com/haproxy@formilux.org/msg42473.html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/haproxy/haproxy.hash | 4 ++--
>  package/haproxy/haproxy.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
> index 4b00438190..7a870d7c0c 100644
> --- a/package/haproxy/haproxy.hash
> +++ b/package/haproxy/haproxy.hash
> @@ -1,5 +1,5 @@
> -# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.0.tar.gz.sha256
> -sha256  90f8e608aacd513b0f542e0438fa12e7fb4622cf58bd4375f3fe0350146eaa59  haproxy-2.6.0.tar.gz
> +# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.1.tar.gz.sha256
> +sha256  915b351e6450d183342c4cdcda7771eac4f0f72bf90582adcd15a01c700d29b1  haproxy-2.6.1.tar.gz
>  # Locally computed:
>  sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28  LICENSE
>  sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  doc/lgpl.txt
> diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
> index ef144053d6..de7accf4ce 100644
> --- a/package/haproxy/haproxy.mk
> +++ b/package/haproxy/haproxy.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  HAPROXY_VERSION_MAJOR = 2.6
> -HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).0
> +HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).1
>  HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
>  HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
>  HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
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
