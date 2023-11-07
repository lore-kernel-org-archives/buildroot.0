Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259EBC4332F
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 21:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D380460E0D;
	Tue,  7 Nov 2023 21:37:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D380460E0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0l2eNeXDJawt; Tue,  7 Nov 2023 21:37:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BB5F60DCA;
	Tue,  7 Nov 2023 21:37:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BB5F60DCA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5A6A01BF5A8
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 21:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 32C5F81B10
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 21:36:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32C5F81B10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GBLmFpkGKMXu for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 21:36:35 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 16F9781A81
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 21:36:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16F9781A81
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:251d:f18c:43f3:5a5b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E1D4113F899;
 Tue,  7 Nov 2023 22:36:28 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 07 Nov 2023 22:36:28 +0100
Date: Tue, 7 Nov 2023 22:36:28 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231107213628.GH229059@scaer>
References: <20231105092458.2935993-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231105092458.2935993-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1699392992;
 bh=W5C5L89qdzscEicKZZHSooZIA2sdBJrp22qRItQReB0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jeLrqcjcWZuaJV8zA3KB2FEPhnHpxO2dSUy4gShiNsBiCds7wN5uZTd0Tj1UQtdqh
 UM4e05RxirLpWea2LUi6TBPONHlj1TaTHWkTcem2aw1QaIQQu8uwL09qJixofm1hJG
 dvqifnEtDMKp9+i0NvzqGZWPz3ngY/puKTzG33nFf9vCbr0UC5dte9sBDYU9PP/mZT
 poj5/W3XX7aDFGcCQFZeZm5n0uYDj3BCLXMlez1n6BJdA/s9OKJycDIlbaCivhjuWD
 SWWiW/0FC6hkfcvFxTq3A5g5KUzI9VxOqC7JeoBeR3dxGrIP+3RC+VH1Jz8KJPOVaF
 m9yHA4v64drzA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jeLrqcjc
Subject: Re: [Buildroot] [PATCH 1/1] package/python-rpds-py: bump to version
 0.12.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2023-11-05 02:24 -0700, James Hilliard spake thusly:
> Migrate from generic pep517 infrastructure to maturin infrastructure.
> 
> Verified license is still MIT after hash changed.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-rpds-py/python-rpds-py.hash |  4 ++--
>  package/python-rpds-py/python-rpds-py.mk   | 14 +++-----------
>  2 files changed, 5 insertions(+), 13 deletions(-)
> 
> diff --git a/package/python-rpds-py/python-rpds-py.hash b/package/python-rpds-py/python-rpds-py.hash
> index e42dfbd948..b04aa210d3 100644
> --- a/package/python-rpds-py/python-rpds-py.hash
> +++ b/package/python-rpds-py/python-rpds-py.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after vendoring
> -sha256  3b1087c3c7d55b8730dfaa539147646292074819295812267832ce5b64a0034c  rpds_py-0.9.2.tar.gz
> +sha256  87361601241744fff6235e35050addfe34d00508172d2bd4f178193a28727287  rpds_py-0.12.0.tar.gz
>  # Locally computed sha256 checksums
> -sha256  8bcb72c82ea8ae74802293c41d93ad7d51434001b0ae45a603a5af0f507aee0a  LICENSE
> +sha256  314e4e91be3baa93c0fb4bccc9e4e97cd643eb839b065af921782c2175fe9909  LICENSE
> diff --git a/package/python-rpds-py/python-rpds-py.mk b/package/python-rpds-py/python-rpds-py.mk
> index 2b5530f237..6f71d02047 100644
> --- a/package/python-rpds-py/python-rpds-py.mk
> +++ b/package/python-rpds-py/python-rpds-py.mk
> @@ -4,19 +4,11 @@
>  #
>  ################################################################################
>  
> -PYTHON_RPDS_PY_VERSION = 0.9.2
> +PYTHON_RPDS_PY_VERSION = 0.12.0
>  PYTHON_RPDS_PY_SOURCE = rpds_py-$(PYTHON_RPDS_PY_VERSION).tar.gz
> -PYTHON_RPDS_PY_SITE = https://files.pythonhosted.org/packages/da/3c/fa2701bfc5d67f4a23f1f0f4347284c51801e9dbc24f916231c2446647df
> -PYTHON_RPDS_PY_SETUP_TYPE = pep517
> +PYTHON_RPDS_PY_SITE = https://files.pythonhosted.org/packages/75/be/e3f366aa4cd1e3a814f136773e506fc5423eff903ef0372a251df34e6e45
> +PYTHON_RPDS_PY_SETUP_TYPE = maturin
>  PYTHON_RPDS_PY_LICENSE = MIT
>  PYTHON_RPDS_PY_LICENSE_FILES = LICENSE
> -PYTHON_RPDS_PY_DEPENDENCIES = host-python-maturin
> -PYTHON_RPDS_PY_ENV = \
> -	$(PKG_CARGO_ENV) \
> -	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
> -# We need to vendor the Cargo crates at download time
> -PYTHON_RPDS_PY_DOWNLOAD_POST_PROCESS = cargo
> -PYTHON_RPDS_PY_DOWNLOAD_DEPENDENCIES = host-rustc
> -PYTHON_RPDS_PY_DL_ENV = $(PKG_CARGO_ENV)
>  
>  $(eval $(python-package))
> -- 
> 2.34.1
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
