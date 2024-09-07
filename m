Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1C8ECE567
	for <buildroot@archiver.kernel.org>; Sat,  7 Sep 2024 19:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 267DA40383;
	Sat,  7 Sep 2024 19:57:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gl5YyspsbfKe; Sat,  7 Sep 2024 19:57:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F4FB40373
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F4FB40373;
	Sat,  7 Sep 2024 19:57:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4D9411BF3EC
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 19:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 473834029C
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 19:57:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6UYW8g8FRXeV for <buildroot@lists.busybox.net>;
 Sat,  7 Sep 2024 19:57:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CCF1040290
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCF1040290
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CCF1040290
 for <buildroot@buildroot.org>; Sat,  7 Sep 2024 19:57:35 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A2B7E13F846;
 Sat,  7 Sep 2024 21:57:30 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 07 Sep 2024 21:57:30 +0200
Date: Sat, 7 Sep 2024 21:57:30 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <ZtywKuWN1HXJhHjw@landeda>
References: <20240906171152.1922026-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240906171152.1922026-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725739053;
 bh=PF1SSv8PAYhRX3mMYGPtdY2D9D+D712ZUqWbUKtPy4Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GGurI1KJESzi0G6JbBsX+u+44Kr4UHq9vlHSuV+bY8Is/56FUy9OoYjz9aoIEU8eR
 EFLsodSgb5YWsgvvl55YJxeVGJHIASB7VNmHye17Ph+Ffjvqkwe4R0NXeYz1yUfVOZ
 uG2aUAv3cpoef7AsnKgJ8B1pnYHmKyfUDwjIJjUXUYPscINHONtwdIC58lVlF6nwo6
 3j+tAMskVAV5FytGQOP2Ig5RmY0P9VfjuCRlCWO9nXBS78hFFTP023c5rVWKUN1ugb
 lnpvKM2HvPo/PCvh1RbX1CuE6rXyqPsCHV+NmgMFyq/CGg0lNLv6D7080y+lCM6Fhm
 SmM1CNFpUrFZA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GGurI1KJ
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cryptography: bump to
 version 43.0.1
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

On 2024-09-06 11:11 -0600, James Hilliard spake thusly:
> Migrate from setuptools-rust to maturin pep517 backend.
> 
> License hash changed due to dropping PSF license:
> https://github.com/pyca/cryptography/commit/5e6476a4c6e094926a983dcf5cbe9488c30aeb53
> 
> We now need to enable chacha support when building with libopenssl.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

It would have been nice to add a little blurb to explain that we no
longe rneed the hack introduced in commit c617ebbc977d.

I've added that when applying.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-cryptography/Config.in                | 1 +
>  package/python-cryptography/python-cryptography.hash | 4 ++--
>  package/python-cryptography/python-cryptography.mk   | 9 ++++-----
>  3 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/package/python-cryptography/Config.in b/package/python-cryptography/Config.in
> index 213aa24fa8..d12f040656 100644
> --- a/package/python-cryptography/Config.in
> +++ b/package/python-cryptography/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_PYTHON_CRYPTOGRAPHY
>  	bool "python-cryptography"
>  	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
>  	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_CHACHA if BR2_PACKAGE_LIBOPENSSL
>  	select BR2_PACKAGE_PYTHON_CFFI # runtime
>  	help
>  	  cryptography is a package designed to expose cryptographic
> diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
> index 5fbf69a208..5336f23257 100644
> --- a/package/python-cryptography/python-cryptography.hash
> +++ b/package/python-cryptography/python-cryptography.hash
> @@ -1,6 +1,6 @@
>  # Locally calculated after vendoring
> -sha256  b55c6c011ba4bb803de0b557f40f1765bab9f63240e93516daaf75c3c68e6618  python-cryptography-39.0.2-cargo2.tar.gz
> +sha256  c57ae743b2adfb29a3fc005b6f39bf1378e20d10529a859b6e2e425845bff8f3  cryptography-43.0.1.tar.gz
>  # Locally computed sha256 checksums
> -sha256  43dad2cc752ab721cd9a9f36ece70fb53ab7713551f2d3d8694d8e8c5a06d6e2  LICENSE
> +sha256  3e0c7c091a948b82533ba98fd7cbb40432d6f1a9acbf85f5922d2f99a93ae6bb  LICENSE
>  sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
>  sha256  602c4c7482de6479dd2e9793cda275e5e63d773dacd1eca689232ab7008fb4fb  LICENSE.BSD
> diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
> index 1cbccd0d5c..2602289149 100644
> --- a/package/python-cryptography/python-cryptography.mk
> +++ b/package/python-cryptography/python-cryptography.mk
> @@ -4,11 +4,10 @@
>  #
>  ################################################################################
>  
> -PYTHON_CRYPTOGRAPHY_VERSION = 39.0.2
> -PYTHON_CRYPTOGRAPHY_SOURCE_PYPI = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
> -PYTHON_CRYPTOGRAPHY_SITE_PYPI = https://files.pythonhosted.org/packages/fa/f3/f4b8c175ea9a1de650b0085858059050b7953a93d66c97ed89b93b232996
> -PYTHON_CRYPTOGRAPHY_SITE = $(PYTHON_CRYPTOGRAPHY_SITE_PYPI)/$(PYTHON_CRYPTOGRAPHY_SOURCE_PYPI)?buildroot-path=filename
> -PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools-rust
> +PYTHON_CRYPTOGRAPHY_VERSION = 43.0.1
> +PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
> +PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/de/ba/0664727028b37e249e73879348cc46d45c5c1a2a2e81e8166462953c5755
> +PYTHON_CRYPTOGRAPHY_SETUP_TYPE = maturin
>  PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
>  PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
>  PYTHON_CRYPTOGRAPHY_CPE_ID_VENDOR = cryptography_project
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
