Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD41C48286
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 10:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84BF5851C7;
	Sun,  4 Feb 2024 10:19:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84BF5851C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Ze0Weiut2xn; Sun,  4 Feb 2024 10:19:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1456851C2;
	Sun,  4 Feb 2024 10:19:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1456851C2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1A1801BF41D
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 10:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7EF24019D
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 10:19:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7EF24019D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eSDUuRZhZS1G for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 10:19:06 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B301401D5
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 10:19:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B301401D5
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2001:67c:1810:f051:9566:1ebe:e5dc:dd49])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 15523B0037C;
 Sun,  4 Feb 2024 11:19:02 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 04 Feb 2024 11:19:01 +0100
Date: Sun, 4 Feb 2024 11:19:01 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <Zb9klY8LZqpPByDy@landeda>
References: <20240203180247.143487-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240203180247.143487-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707041944;
 bh=GvxHgaEalqNjkiZoERSMyU6vMMYt5Dqk/I2e+j5wOSQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m83rPZ6T8QFfco/m4nJrYslEQNlsvRQ1JcilYHd2G3DbS/1y/yOzhSxg0fqZsTpju
 6By0+PIatgIO5lY25mBCpEchQIaVIduTusL6QAreJrBWPHV8M0nvCbPaz47TbZnQyf
 wr9FC1RFAfZdBGCoI+0dqTpFsBleRfXPNCm5u5l+KxPkkAybOWUbqw8Z04XtEivXWl
 3jndNF5IcR/JVsAgSE4Rc6n5t9DwtujtLDQbF+Umt3tkYJauTQ6Ep+fdo7n7wcSHcU
 ejCX7wz89KwBYVpIwCLv2FkfzJf0KfXxIaaQfArVJg/nVahoTUqCVZuF+tKhilyzaP
 n0yCU605rpRFw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=m83rPZ6T
Subject: Re: [Buildroot] [PATCH 1/1] package/netatalk: update
 NETATALK_CPE_ID_VENDOR
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

On 2024-02-03 19:02 +0100, Fabrice Fontaine spake thusly:
> cpe:2.3:a:netatalk_project:netatalk has been deprecated in favor of
> cpe:2.3:a:netatalk:netatalk in September 2023:
> 
>   <cpe-item name="cpe:/a:netatalk_project:netatalk:3.1.13" deprecated="true" deprecation_date="2023-09-29T11:15:00.340Z">
>       <reference href="https://sourceforge.net/projects/netatalk/files/netatalk/">Version</reference>
>     <cpe-23:cpe23-item name="cpe:2.3:a:netatalk_project:netatalk:3.1.13:*:*:*:*:*:*:*">
>         <cpe-23:deprecated-by name="cpe:2.3:a:netatalk:netatalk:3.1.13:*:*:*:*:*:*:*" type="NAME_CORRECTION"/>
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, along with the few following CPE updates, thanks!

Regards,
Yann E. MORIN.

> ---
>  package/netatalk/netatalk.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
> index a47bfa7e84..40e64dabeb 100644
> --- a/package/netatalk/netatalk.mk
> +++ b/package/netatalk/netatalk.mk
> @@ -12,7 +12,7 @@ NETATALK_DEPENDENCIES = host-pkgconf openssl berkeleydb libgcrypt libgpg-error \
>  	libevent
>  NETATALK_LICENSE = GPL-2.0+, LGPL-3.0+, MIT-like
>  NETATALK_LICENSE_FILES = COPYING COPYRIGHT
> -NETATALK_CPE_ID_VENDOR = netatalk_project
> +NETATALK_CPE_ID_VENDOR = netatalk
>  
>  # Don't run ldconfig!
>  NETATALK_CONF_ENV += CC="$(TARGET_CC) -std=gnu99" \
> -- 
> 2.43.0
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
