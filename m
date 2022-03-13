Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F45C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Mar 2022 09:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06C8D82553;
	Sun, 13 Mar 2022 09:12:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pvjJse2Td_xd; Sun, 13 Mar 2022 09:12:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C005A81DB2;
	Sun, 13 Mar 2022 09:12:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B0ED91BF2A6
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 09:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F4FF818CA
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 09:11:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d_y9EACw78J4 for <buildroot@lists.busybox.net>;
 Sun, 13 Mar 2022 09:11:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 927A1818C9
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 09:11:21 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:91a3:d0c0:1a06:f60f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id E802C7802D7;
 Sun, 13 Mar 2022 10:11:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647162680;
 bh=twQm0UeUrJJKtImoQcfFz7lFb8lRRT2zq42PT1f35xU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VokK7KhAwvrkATN2Ck7+cfalmxSpsVa/Do8t9E8XB6qB5uhQfh5os/ILy4LVm5r2h
 0L+p2c3IZLCgd7yma9BvL2LNmzaLsOCdc9txoWyDUMFi/9dJJtwYbcpdnt1xlhQjcm
 7+dhCN8QD1RLacT3z/yKkcu17yxVTJu/OLQww7BbjfZTYNEmeXJnkzQwjbuQie0kig
 0bWwBEPeQkJyiQiC+NmX0+E8yRgPZb8P1YVRDOECwvNURwT1Y3tlKhobmUJeBxScaw
 T1qhvtTo1gX4zU33jCkdI38NbP5Wp5n/4vYrBuwEq6pk7k9VGXdoBdFQZ2inJF7ka1
 g/HrC8yQkgIog==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 13 Mar 2022 10:11:16 +0100
Date: Sun, 13 Mar 2022 10:11:16 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220313091116.GS283544@scaer>
References: <20220311194446.3952944-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220311194446.3952944-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/python-argon2-cffi: bump to
 version 21.3.0
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

On 2022-03-11 12:44 -0700, James Hilliard spake thusly:
> Migrate to new flit based build.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-argon2-cffi/Config.in               |  8 +++-----
>  package/python-argon2-cffi/python-argon2-cffi.hash |  4 ++--
>  package/python-argon2-cffi/python-argon2-cffi.mk   | 14 +++-----------
>  3 files changed, 8 insertions(+), 18 deletions(-)
> 
> diff --git a/package/python-argon2-cffi/Config.in b/package/python-argon2-cffi/Config.in
> index 5cddb3314e..5940d1c910 100644
> --- a/package/python-argon2-cffi/Config.in
> +++ b/package/python-argon2-cffi/Config.in
> @@ -1,10 +1,8 @@
>  config BR2_PACKAGE_PYTHON_ARGON2_CFFI
>  	bool "python-argon2-cffi"
> -	depends on BR2_USE_MMU # libargon2
> -	depends on !BR2_STATIC_LIBS # libargon2
> -	select BR2_PACKAGE_PYTHON_CFFI # runtime
> -	select BR2_PACKAGE_PYTHON_SIX # runtime
> -	select BR2_PACKAGE_LIBARGON2
> +	depends on BR2_USE_MMU # python-argon2-cffi-bindings -> libargon2
> +	depends on !BR2_STATIC_LIBS # python-argon2-cffi-bindings -> libargon2

So, here, you are referencing libargon2, but you do not depend on it,
neither do you select it. If your dependency is just on
python-argon2-cffi-bindings, then that's all you need to document, not
why it needs it.

And so, why is the dependency to libargon2 dropped? Given the name of
the two packages, python-argon2-cffi and libargon2, they really look
like they are related, so dropping the dependency on libargon2 would
really need a little explanation, maybe just to state that since
upstream commit cb0248d29ab2 (Extract CFFI bindings into
argon2-cffi-bindings), the dependency is carried by argon2-cffi-bindings
which is already enforced in Buildroot.

Applied with a blurb added to that effect.

Regards,
Yann E. MORIN.

> +	select BR2_PACKAGE_PYTHON_ARGON2_CFFI_BINDINGS # runtime
>  	help
>  	  The secure Argon2 password hashing algorithm.
>  
> diff --git a/package/python-argon2-cffi/python-argon2-cffi.hash b/package/python-argon2-cffi/python-argon2-cffi.hash
> index 6c416ffd88..09da5855a3 100644
> --- a/package/python-argon2-cffi/python-argon2-cffi.hash
> +++ b/package/python-argon2-cffi/python-argon2-cffi.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/argon2-cffi/json
> -md5  f33bc18f2c2438f685ba1f0bbd2b86a4  argon2-cffi-21.1.0.tar.gz
> -sha256  f710b61103d1a1f692ca3ecbd1373e28aa5e545ac625ba067ff2feca1b2bb870  argon2-cffi-21.1.0.tar.gz
> +md5  b7843e8690c790f8e743d37bb75c25a8  argon2-cffi-21.3.0.tar.gz
> +sha256  d384164d944190a7dd7ef22c6aa3ff197da12962bd04b17f64d4e93d934dba5b  argon2-cffi-21.3.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  bf659a28b49240602f56bbdf490cbe2ec509b15b98f99d7b19a52c740e327863  LICENSE
> diff --git a/package/python-argon2-cffi/python-argon2-cffi.mk b/package/python-argon2-cffi/python-argon2-cffi.mk
> index f01c940589..0fb3e50ff3 100644
> --- a/package/python-argon2-cffi/python-argon2-cffi.mk
> +++ b/package/python-argon2-cffi/python-argon2-cffi.mk
> @@ -4,19 +4,11 @@
>  #
>  ################################################################################
>  
> -PYTHON_ARGON2_CFFI_VERSION = 21.1.0
> +PYTHON_ARGON2_CFFI_VERSION = 21.3.0
>  PYTHON_ARGON2_CFFI_SOURCE = argon2-cffi-$(PYTHON_ARGON2_CFFI_VERSION).tar.gz
> -PYTHON_ARGON2_CFFI_SITE = https://files.pythonhosted.org/packages/7b/39/a26aaef5c3f0c6cfd67c80599b5b40a794fdab46f4ee3be925d71e2f9596
> -PYTHON_ARGON2_CFFI_SETUP_TYPE = setuptools
> +PYTHON_ARGON2_CFFI_SITE = https://files.pythonhosted.org/packages/3f/18/20bb5b6bf55e55d14558b57afc3d4476349ab90e0c43e60f27a7c2187289
> +PYTHON_ARGON2_CFFI_SETUP_TYPE = flit
>  PYTHON_ARGON2_CFFI_LICENSE = MIT
>  PYTHON_ARGON2_CFFI_LICENSE_FILES = LICENSE
> -PYTHON_ARGON2_CFFI_DEPENDENCIES = host-python-cffi libargon2
> -PYTHON_ARGON2_CFFI_ENV = ARGON2_CFFI_USE_SYSTEM=1
> -
> -ifeq ($(BR2_X86_CPU_HAS_SSE2),y)
> -PYTHON_ARGON2_CFFI_ENV += ARGON2_CFFI_USE_SSE2=1
> -else
> -PYTHON_ARGON2_CFFI_ENV += ARGON2_CFFI_USE_SSE2=0
> -endif
>  
>  $(eval $(python-package))
> -- 
> 2.25.1
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
