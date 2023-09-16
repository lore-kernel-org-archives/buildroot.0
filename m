Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3811CD37BC
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 12:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C2F040C27;
	Sat, 16 Sep 2023 12:09:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C2F040C27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MlTSTagHwzs0; Sat, 16 Sep 2023 12:09:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FA0D40C09;
	Sat, 16 Sep 2023 12:09:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FA0D40C09
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 15F811BF860
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 12:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E23DA40982
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 12:09:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E23DA40982
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wex6N-L0w1nH for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 12:09:25 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A68A4410D1
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 12:09:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A68A4410D1
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:9162:d12f:41c1:9c3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id EAA822003CC;
 Sat, 16 Sep 2023 14:09:21 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 16 Sep 2023 14:09:21 +0200
Date: Sat, 16 Sep 2023 14:09:21 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230916120921.GW2571@scaer>
References: <20230916101413.16588-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230916101413.16588-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694866164;
 bh=uuoH796Uqqznwhb0eaRh1vwoqdG7G/GUGORaX80byHQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ARUcY1cy7kNOalKta1uYVz5gGrkNx/TW9Rzz2Dy3UcHvCcvNyySAdDrez8ugaNlD/
 NsKdgBQMV1JQbJVDhVTJzbftPyuLBKW/VCqHg+l3P0zQXV99x2UKRy2dBPAjyZtKIe
 NXr8DtDHbKaOw3bsH2QaLV0AV7VhMaELeG5BcGQrbALk91Hv0MsBx6o6TBX9SileiU
 Y8Trl83ngj8/CAYvxjOokhKKaF4xOZZN5xjFsuSHjyS2PT3ciTpnIav281sUnTanja
 cOstN7ZqouUrWE4U/sBljXA9HaeO8WjjYwZEEdbnS6kJiVPbLtmd9QQXOZaRt2N/7x
 1lOYHvmYeYBMw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ARUcY1cy
Subject: Re: [Buildroot] [PATCH 1/1] package/openssh: bump to version 9.4p1
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

On 2023-09-16 12:14 +0200, Fabrice Fontaine spake thusly:
> https://www.openssh.com/txt/release-9.4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/openssh/openssh.hash | 4 ++--
>  package/openssh/openssh.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
> index df472e087d..4060b95e9b 100644
> --- a/package/openssh/openssh.hash
> +++ b/package/openssh/openssh.hash
> @@ -1,4 +1,4 @@
> -# From https://www.openssh.com/txt/release-9.3p2
> -sha256  200ebe147f6cb3f101fd0cdf9e02442af7ddca298dffd9f456878e7ccac676e8  openssh-9.3p2.tar.gz
> +# From https://www.openssh.com/txt/release-9.4p1
> +sha256  3608fd9088db2163ceb3e600c85ab79d0de3d221e59192ea1923e23263866a85  openssh-9.4p1.tar.gz
>  # Locally calculated
>  sha256  05c30446ba738934b3f1efa965b454c122ca26cc4b268e5ae6843f58ccd1b16d  LICENCE
> diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
> index a2c3f16129..358ef42b6e 100644
> --- a/package/openssh/openssh.mk
> +++ b/package/openssh/openssh.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -OPENSSH_VERSION_MAJOR = 9.3
> -OPENSSH_VERSION_MINOR = p2
> +OPENSSH_VERSION_MAJOR = 9.4
> +OPENSSH_VERSION_MINOR = p1
>  OPENSSH_VERSION = $(OPENSSH_VERSION_MAJOR)$(OPENSSH_VERSION_MINOR)
>  OPENSSH_CPE_ID_VERSION = $(OPENSSH_VERSION_MAJOR)
>  OPENSSH_CPE_ID_UPDATE = $(OPENSSH_VERSION_MINOR)
> -- 
> 2.40.1
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
