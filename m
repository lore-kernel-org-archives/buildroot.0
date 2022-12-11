Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C57FC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 09:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C771640901;
	Sun, 11 Dec 2022 09:10:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C771640901
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hFV0klflXyWf; Sun, 11 Dec 2022 09:10:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E63F408FD;
	Sun, 11 Dec 2022 09:10:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E63F408FD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 002A61BF3D9
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 09:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD55C408FA
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 09:10:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD55C408FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BxI4PzFRbSnK for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 09:10:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EAD8408F8
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7EAD8408F8
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 09:10:21 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9fcf:911b:99f4:8b0a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 0AEE35FF9E;
 Sun, 11 Dec 2022 10:10:14 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 11 Dec 2022 10:10:14 +0100
Date: Sun, 11 Dec 2022 10:10:14 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Marcin Niestroj <m.niestroj@grinn-global.com>
Message-ID: <20221211091013.GN1044805@scaer>
References: <20221103102102.924370-1-m.niestroj@grinn-global.com>
 <20221103102102.924370-2-m.niestroj@grinn-global.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221103102102.924370-2-m.niestroj@grinn-global.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670749819;
 bh=FBix650U/FOCDttF53rn2ssJ3Ck0DQULaWdUynEa2qY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M3WS+RSXdPmh8v9+dybCVRc4rLyC7OBR3jYNc3Y5nagUtQfyZe0/yJ9bEH8MtCBoA
 s+RCwja9WrFspRCqE4laUteJWJBAUkLO3bWyycZnSZobfFBdVYdxobrAD5+KMADJPC
 ctvCPJLSf15BWxNGuXwKlKL4O+a/H0QoSSBjZ07m7cOklSdkpIBOxcai9bq5H26lIf
 HLGACyKmMvw+P4qOAPGQp4mZYgTMZ0WL51vwEUhYipkhxsOVsd7jOrDpu8vdWmsF41
 DLxcTMwDN0oqpr7pj91+2/5kY1q0mEl2+lh2gVDGhgVaRAqavUiKfidsZ0mPnpx5xw
 7Na4d12DxidlQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=M3WS+RSX
Subject: Re: [Buildroot] [PATCH v2 2/2] package/python-bleak: bump version
 to 0.19.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Marcin, All,

On 2022-11-03 11:21 +0100, Marcin Niestroj spake thusly:
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> v1 -> v2: no changes
> 
>  package/python-bleak/Config.in         | 3 ++-
>  package/python-bleak/python-bleak.hash | 4 ++--
>  package/python-bleak/python-bleak.mk   | 4 ++--
>  3 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-bleak/Config.in b/package/python-bleak/Config.in
> index 085c16fae8..691450f86b 100644
> --- a/package/python-bleak/Config.in
> +++ b/package/python-bleak/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_PYTHON_BLEAK
>  	bool "python-bleak"
> -	select BR2_PACKAGE_PYTHON_DBUS_NEXT # runtime
> +	select BR2_PACKAGE_PYTHON_ASYNC_TIMEOUT # runtime
> +	select BR2_PACKAGE_PYTHON_DBUS_FAST # runtime
>  	help
>  	  Bluetooth Low Energy platform Agnostic Klient.
>  
> diff --git a/package/python-bleak/python-bleak.hash b/package/python-bleak/python-bleak.hash
> index 5acac877c9..9a8310b11c 100644
> --- a/package/python-bleak/python-bleak.hash
> +++ b/package/python-bleak/python-bleak.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/bleak/json
> -md5  0c26b270358a782767012220fc595aa5  bleak-0.12.1.tar.gz
> -sha256  4a80a24cc944e52e856054639f298229c39a2fc720e5f7adbeebb117d10849ed  bleak-0.12.1.tar.gz
> +md5  57564087d6e17ad1853109f530279b27  bleak-0.19.1.tar.gz
> +sha256  dff7c7f281dcb6629d0d722209c79ec3aa2a6c33867cb5c1ea3d44b72ca155c0  bleak-0.19.1.tar.gz
>  # Locally computed sha256 checksums
>  sha256  c4029a2b63b3824ab68be841f414addbdde20cb79cdbe272fa80c0b2abe65374  LICENSE
> diff --git a/package/python-bleak/python-bleak.mk b/package/python-bleak/python-bleak.mk
> index 3ae6d90311..00a4946ef6 100644
> --- a/package/python-bleak/python-bleak.mk
> +++ b/package/python-bleak/python-bleak.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_BLEAK_VERSION = 0.12.1
> +PYTHON_BLEAK_VERSION = 0.19.1
>  PYTHON_BLEAK_SOURCE = bleak-$(PYTHON_BLEAK_VERSION).tar.gz
> -PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/67/4b/ba00c69a24a8d08c86f02caa45727a2ad2844c7bee9630ccb063be226f71
> +PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/30/b9/60e1f455365e2340fe076cf7683f4e6d03db0b759d4f93fa45e68dc371e5
>  PYTHON_BLEAK_SETUP_TYPE = setuptools
>  PYTHON_BLEAK_LICENSE = MIT
>  PYTHON_BLEAK_LICENSE_FILES = LICENSE
> -- 
> 2.38.1
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
