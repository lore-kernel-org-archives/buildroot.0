Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 071C3C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 19:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A975B60C25;
	Sun, 14 Aug 2022 19:26:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A975B60C25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VCp7NDuPc47c; Sun, 14 Aug 2022 19:26:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C07AA60BB5;
	Sun, 14 Aug 2022 19:26:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C07AA60BB5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7ED6F1BF30C
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 19:26:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59EC081CE7
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 19:26:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59EC081CE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id apBlKTWDKqU4 for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 19:26:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E7BA81BF5
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E7BA81BF5
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 19:26:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4cac:4fa9:6c11:832f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id EF5266013F;
 Sun, 14 Aug 2022 21:26:20 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 Aug 2022 21:26:20 +0200
Date: Sun, 14 Aug 2022 21:26:20 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220814192620.GI2854108@scaer>
References: <20220814191459.3187808-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220814191459.3187808-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660505185;
 bh=YgPcUNymOF/LD2D5pOqWHHaET1NidMNI0btxX7bQJc0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qpYrKyjVz8x7wWjMfu9ANE3Wct4RjEf/5F+bv6kLSKXdJ4UdrKuuKT/h7K7RLRIqw
 POwqszUt+vA76nMsVzFfO+z9ajFPUrtoNksF57Ti8itJcuWlaawcABzBJ4G3HaF0Vd
 xiWgmOhuaQQndH9VyebcjUcWToDVu7267hsNgZXRT538jYfvlP8ngIHcHWgOM1Y7Hk
 0Tb/5d+HpGmTp1x1tKsmEL4eqx+kEZTzN/cAx4WvlbUwGK/Zx9x6k3k0Sl9/pq8Zqg
 XWXnjraK4lvTRlb0PYZuFgFnFHhXMDfdVcSTv+p3o+3THifDyQYgEznnmSbpT1Mqcz
 hCykZxUHRCKKQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qpYrKyjV
Subject: Re: [Buildroot] [PATCH 1/1] package/python-service-identity: drop
 comment
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
Cc: Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-08-14 21:14 +0200, Fabrice Fontaine spake thusly:
> Commit a2ba9e7db9bd5fabff738147f73039fc8d4f1b3d forgot to drop comment
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-service-identity/Config.in | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/python-service-identity/Config.in b/package/python-service-identity/Config.in
> index 09ebd97a65..278900971e 100644
> --- a/package/python-service-identity/Config.in
> +++ b/package/python-service-identity/Config.in
> @@ -2,7 +2,6 @@ config BR2_PACKAGE_PYTHON_SERVICE_IDENTITY
>  	bool "python-service-identity"
>  	# python-pyopenssl -> python-cryptography
>  	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
> -	# python-pyopenssl -> python-cryptography
>  	select BR2_PACKAGE_PYTHON_ATTRS # runtime
>  	select BR2_PACKAGE_PYTHON_PYASN1 # runtime
>  	select BR2_PACKAGE_PYTHON_PYASN1_MODULES # runtime
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
