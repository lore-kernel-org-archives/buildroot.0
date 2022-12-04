Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F14ABC4332F
	for <buildroot@archiver.kernel.org>; Sun,  4 Dec 2022 11:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90C8260F42;
	Sun,  4 Dec 2022 11:45:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90C8260F42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gNZe1dIJTZ9h; Sun,  4 Dec 2022 11:45:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C87260E63;
	Sun,  4 Dec 2022 11:45:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C87260E63
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 857FB1BF3B0
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 11:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 610EF40354
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 11:45:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 610EF40354
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QPzuec0ESJSL for <buildroot@lists.busybox.net>;
 Sun,  4 Dec 2022 11:45:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10A4B40144
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 10A4B40144
 for <buildroot@buildroot.org>; Sun,  4 Dec 2022 11:45:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d16b:268a:13f6:6145])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id E17E119F5AE;
 Sun,  4 Dec 2022 12:45:01 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 04 Dec 2022 12:45:01 +0100
Date: Sun, 4 Dec 2022 12:45:01 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221204114501.GL3302@scaer>
References: <20221204091039.4362-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221204091039.4362-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670154305;
 bh=S4w0rg5YH+BOjPqH3u85jpna7LIUCPBwRMHHLQGieZA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Yct+F8OvaBLDXoMOIdesflsvbBwpio31FstQSNonwqdnRvyQy0AY5dfRsXYXA5kwN
 KRI/XzkEwHt0UA766jhITsan1FdzIMRZhCedS4Vc/3NbXcKmXqAia05zQQhc9YlI09
 5Q3nfVaaV3GR4fLtx8wNVN3YCmRd4VSdynTFh6Gc44lr+c0XsAUbK2OxRD+A+xnw+0
 tZZ2CX5CUs1zqP7McCczpGEHuvEOb0Cj6ro4qZqCJYXhi97G1QF5xGooUeDsZEayCX
 uTBGBff4UGuBoCexcATn8rS3Pk0jTOu3Aqxe9GX/oc8puhQP9v0mtj7MQye5L/jDTv
 J2UWqDpa0ioLg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Yct+F8Ov
Subject: Re: [Buildroot] [PATCH 1/1] package/optee-client: rename S30optee
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
Cc: Etienne Carriere <etienne.carriere@linaro.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-12-04 10:10 +0100, Fabrice Fontaine spake thusly:
> Commit b1c4c18766e51ee55e8d2e3a7cb12cb2762b12ff forgot to rename
> S30optee in optee-client.mk resulting in the following build failure:

Gah, I forgot to git add package/optee-client/optee-client.mk before I
did amend the commit...

> /usr/bin/install -m 0755 -D package/optee-client//S30optee /home/autobuild/autobuild/instance-0/output-1/target/etc/init.d/S30optee
> /usr/bin/install: cannot stat 'package/optee-client//S30optee': No such file or directory
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/21fc165933e6d226de277b62d4ce99342cef0ffb
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Thanks for fixing my mess. Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/optee-client/optee-client.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/optee-client/optee-client.mk b/package/optee-client/optee-client.mk
> index 252841ba10..3fbbe9484c 100644
> --- a/package/optee-client/optee-client.mk
> +++ b/package/optee-client/optee-client.mk
> @@ -27,8 +27,8 @@ OPTEE_CLIENT_CONF_OPTS += -DCFG_TEE_SUPP_PLUGINS=OFF
>  endif
>  
>  define OPTEE_CLIENT_INSTALL_INIT_SYSV
> -	$(INSTALL) -m 0755 -D $(OPTEE_CLIENT_PKGDIR)/S30optee \
> -		$(TARGET_DIR)/etc/init.d/S30optee
> +	$(INSTALL) -m 0755 -D $(OPTEE_CLIENT_PKGDIR)/S30tee-supplicant \
> +		$(TARGET_DIR)/etc/init.d/S30tee-supplicant
>  endef
>  
>  $(eval $(cmake-package))
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
