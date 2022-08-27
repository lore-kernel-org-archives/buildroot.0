Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90BCAECAAD5
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 20:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2ED8A60E2E;
	Sat, 27 Aug 2022 20:45:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2ED8A60E2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YmykMZ1AlGc2; Sat, 27 Aug 2022 20:45:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54D0460E09;
	Sat, 27 Aug 2022 20:45:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54D0460E09
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9D2EF1BF95D
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 20:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8492360E15
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 20:45:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8492360E15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pyHg8egUZP4U for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 20:45:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8948D60D89
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8948D60D89
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 20:45:37 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e2dc:5f1b:7f23:232])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 8C888780509;
 Sat, 27 Aug 2022 22:45:31 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 27 Aug 2022 22:45:31 +0200
Date: Sat, 27 Aug 2022 22:45:31 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220827204531.GC37358@scaer>
References: <20220827202514.265143-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220827202514.265143-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661633135;
 bh=LUd08zfKPOaq6Dr6Ghm2tYvkavsN2Ny5rwcEwAbqFzI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IEDLMHS/tkSSIIu5SZZyjxzt/CIfXOGRo09EqH2bVdtjewzJDhRUD6fZ1H0xR7S+/
 swosU3Egmn2ZybHJyseH+/4B3mWBrzqUHF/Bpgt5btKOM8AMsI1D/Bwd+JsMuDRTAC
 SaVvYHP/9+b5mX3/Jq31/6n8b9ImOLWYT2zpw22lCbYfBqvpeen3UKktiCul/8EQcq
 /vFD11oS0pVklu8Y0uqsqzFo1oJhKP0OZbgF1AMBTB/kh5AENLonnksXtn6zb3G/vg
 deF0TwMzqUy4BNZPHoD8ykl4BuOV89c5Rweb5a5lWRR1PCclzWgcw5Lewf1nJIwCaC
 GKN9Yiq5acJTg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IEDLMHS/
Subject: Re: [Buildroot] [PATCH 1/1] package/freeradius-server: correctly
 set krb5-config
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
Cc: David GOUARIN <dgouarin@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-08-27 22:25 +0200, Fabrice Fontaine spake thusly:
> Fix typo added by commit 84d32e53657db32784608c1130ec5290667a652f:
> 
> configure: error: invalid variable name: `ac_cv_path_krb5-config'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/5a0e5023c274223b5eb7623165395549e7f446bf
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/freeradius-server/freeradius-server.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/freeradius-server/freeradius-server.mk b/package/freeradius-server/freeradius-server.mk
> index f77413a170..ebd459341d 100644
> --- a/package/freeradius-server/freeradius-server.mk
> +++ b/package/freeradius-server/freeradius-server.mk
> @@ -87,7 +87,7 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_LIBKRB5),y)
>  FREERADIUS_SERVER_CONF_OPTS += \
> -	ac_cv_path_krb5-config=$(STAGING_DIR)/usr/bin/krb5-config \
> +	ac_cv_path_krb5_config=$(STAGING_DIR)/usr/bin/krb5-config \
>  	--with-rlm_krb5
>  FREERADIUS_SERVER_DEPENDENCIES += libkrb5
>  else
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
