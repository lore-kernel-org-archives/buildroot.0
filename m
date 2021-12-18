Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7502C433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Dec 2021 22:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48D5384DB1;
	Sat, 18 Dec 2021 22:25:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mz88gC8RUORc; Sat, 18 Dec 2021 22:25:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9256584DAF;
	Sat, 18 Dec 2021 22:25:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8B61A1BF23C
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 22:25:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7AF1360B2B
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 22:25:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BytsZOo1smiP for <buildroot@lists.busybox.net>;
 Sat, 18 Dec 2021 22:25:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A492460B21
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 22:25:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4cb3:149f:d03e:db5a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id ADFF55FF3F;
 Sat, 18 Dec 2021 23:25:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1639866313;
 bh=Sk6V3skMpo9nJiqOAYEQa4WOUztKoKEltM4e+t8zMPc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UZ7ND21x8tmXBqiRl8eD7KxH3LPDK+X62HkJuprfIpr0Hzzp/Mmeu0VqxIUuE+3lV
 RrT44+xzfny4W23Zcyp/oTsZI/Z9AN/QY+NXKQSnwq1oQ1i313QlOsfWtsDT9NqHUu
 w3/lelsg1Cn/LHDHENInTO32zitMOb0zriECcwFyfiwc0OlbhhK7xB/FCbSy6cFDD2
 LibfQxxihI+fdN5GAZPyI97Inm+Sz4+YF9V6xqYn26gwPqsh309ngxHumDMXFUQDko
 grmDg9eWVdJs97pofxVzr1c1NFp2v8MY2qtB7olZMnReJ7gwx61HvSRSmEGIkR7Gfq
 VglhP5+u4OgsQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Dec 2021 23:25:09 +0100
Date: Sat, 18 Dec 2021 23:25:09 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211218222509.GV2603@scaer>
References: <20211217192104.32165-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211217192104.32165-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/libmediaart: needs host-vala
 for introspection
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

On 2021-12-17 20:21 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since commit
> 3db4d486d689b4a9d59c8f7637211893b0a1cb1b:
> 
> ../output-1/build/libmediaart-1.9.5/libmediaart/meson.build:63:2: ERROR: Program 'vapigen' not found
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/189e12686b059ddadf84ced40efcd9875e5e1521
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libmediaart/libmediaart.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libmediaart/libmediaart.mk b/package/libmediaart/libmediaart.mk
> index b4c09d85e1..77665fd95b 100644
> --- a/package/libmediaart/libmediaart.mk
> +++ b/package/libmediaart/libmediaart.mk
> @@ -28,7 +28,7 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
>  LIBMEDIAART_CONF_OPTS += -Dintrospection=true
> -LIBMEDIAART_DEPENDENCIES += gobject-introspection
> +LIBMEDIAART_DEPENDENCIES += host-vala gobject-introspection
>  else
>  LIBMEDIAART_CONF_OPTS += -Dintrospection=false
>  endif
> -- 
> 2.33.0
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
