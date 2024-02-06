Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB96C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 17:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D026C8234B;
	Tue,  6 Feb 2024 17:18:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Smc34jR9OB6i; Tue,  6 Feb 2024 17:18:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85E1382108
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85E1382108;
	Tue,  6 Feb 2024 17:18:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 40B031BF3A1
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1991741764
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:18:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1991741764
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id btWGrGdmD-zU for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 17:18:28 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A1FB41753
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 17:18:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A1FB41753
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id DA38813F880;
 Tue,  6 Feb 2024 18:18:20 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 06 Feb 2024 18:18:20 +0100
Date: Tue, 6 Feb 2024 18:18:20 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <ZcJp3IN0suIBa9ds@landeda>
References: <20240206161715.550268-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240206161715.550268-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707239905;
 bh=1B2EPKikVWnQr9BwWslK0/z3sCCZMoQxT50ey9FUYdY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FwDgTOV4cSlIAhZpItZJIWl07TScxxXS2HZeGKl9RRN1hL9LtOkrJGt1gURiHlqXx
 o/b/hXV0d7apxnAcEcJsTjNsz8y21m3aL2fk6xyTcb6MittEpRkb01vUfKT1ShJU1z
 RAhy5QChBAD5briHidVmrkNHFEpZhgUHsecO+8V1wbITHydZiVAQh9g+2kXP8qsOTb
 qEebCNybkhgpCTSfuLYHpzxAa4FIuG2HyxSkn+LHM2dhzA5zMH4tOVugG+KpiLKtlR
 /beU2rRgcsEtkWLtIxb9D5ZrncbXVx7joPQQgoPM8KI+YzI/90FgCgCAZrLVxCjc/A
 QPvYLnGCpugTQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FwDgTOV4
Subject: Re: [Buildroot] [PATCH v2 1/1] package/python-ml-dtypes: bump to
 version 0.3.2
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
Cc: Julien Olivain <ju.o@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2024-02-06 09:17 -0700, James Hilliard spake thusly:
> Migrate from distutils which is being deprecated to setuptools.
> 
> Drop python-pybind which is no longer required:
> https://github.com/jax-ml/ml_dtypes/blob/v0.3.2/CHANGELOG.md#032---2024-01-03
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Could you check whether the following patches are still valid and
required, please:

    https://patchwork.ozlabs.org/project/buildroot/patch/3afcc982685e876ac9b2ae54f86164647040ab85.1706448055.git.yann.morin.1998@free.fr/
    https://patchwork.ozlabs.org/project/buildroot/patch/20240112221910.14778-1-fontaine.fabrice@gmail.com/

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>   - drop pybind
> ---
>  package/python-ml-dtypes/Config.in             | 1 -
>  package/python-ml-dtypes/python-ml-dtypes.hash | 4 ++--
>  package/python-ml-dtypes/python-ml-dtypes.mk   | 9 ++++-----
>  3 files changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/package/python-ml-dtypes/Config.in b/package/python-ml-dtypes/Config.in
> index 72506896df..8791564b19 100644
> --- a/package/python-ml-dtypes/Config.in
> +++ b/package/python-ml-dtypes/Config.in
> @@ -5,7 +5,6 @@ config BR2_PACKAGE_PYTHON_ML_DTYPES
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # python-numpy
>  	depends on BR2_HOST_GCC_AT_LEAST_9 # host-python-numpy
>  	select BR2_PACKAGE_PYTHON_NUMPY
> -	select BR2_PACKAGE_PYTHON_PYBIND
>  	help
>  	  ml_dtypes is a stand-alone implementation of several NumPy
>  	  dtype extensions used in machine learning libraries.
> diff --git a/package/python-ml-dtypes/python-ml-dtypes.hash b/package/python-ml-dtypes/python-ml-dtypes.hash
> index a440268e39..53bfacb528 100644
> --- a/package/python-ml-dtypes/python-ml-dtypes.hash
> +++ b/package/python-ml-dtypes/python-ml-dtypes.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/ml_dtypes/json
> -md5  6adbb05530819bdb4a78d2372d187fe2  ml_dtypes-0.3.1.tar.gz
> -sha256  60778f99194b4c4f36ba42da200b35ef851ce4d4af698aaf70f5b91fe70fc611  ml_dtypes-0.3.1.tar.gz
> +md5  438c04dc0d941ec1b3b71667225c74c8  ml_dtypes-0.3.2.tar.gz
> +sha256  533059bc5f1764fac071ef54598db358c167c51a718f68f5bb55e3dee79d2967  ml_dtypes-0.3.2.tar.gz
>  # Locally computed sha256 checksums
>  sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/python-ml-dtypes/python-ml-dtypes.mk b/package/python-ml-dtypes/python-ml-dtypes.mk
> index 92d23bece4..676137ecf1 100644
> --- a/package/python-ml-dtypes/python-ml-dtypes.mk
> +++ b/package/python-ml-dtypes/python-ml-dtypes.mk
> @@ -4,16 +4,15 @@
>  #
>  ################################################################################
>  
> -PYTHON_ML_DTYPES_VERSION = 0.3.1
> +PYTHON_ML_DTYPES_VERSION = 0.3.2
>  PYTHON_ML_DTYPES_SOURCE = ml_dtypes-$(PYTHON_ML_DTYPES_VERSION).tar.gz
> -PYTHON_ML_DTYPES_SITE = https://files.pythonhosted.org/packages/16/6e/9a7a51ee1ca24b8e92109128260c5aec8340c8fe5572e9ceecddae559abe
> +PYTHON_ML_DTYPES_SITE = https://files.pythonhosted.org/packages/39/7d/8d85fcba868758b3a546e6914e727abd8f29ea6918079f816975c9eecd63
>  PYTHON_ML_DTYPES_LICENSE = Apache-2.0
>  PYTHON_ML_DTYPES_LICENSE_FILES = LICENSE
> -PYTHON_ML_DTYPES_SETUP_TYPE = distutils
> +PYTHON_ML_DTYPES_SETUP_TYPE = setuptools
>  
>  PYTHON_ML_DTYPES_DEPENDENCIES = \
>  	host-python-numpy \
> -	python-numpy \
> -	python-pybind
> +	python-numpy
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
