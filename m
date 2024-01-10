Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0AA0C47073
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 19:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 49239436C1;
	Wed, 10 Jan 2024 19:06:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49239436C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3xosz59Po_0b; Wed, 10 Jan 2024 19:06:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC0E04374C;
	Wed, 10 Jan 2024 19:06:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC0E04374C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8D0261BF296
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 19:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65ED14223F
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 19:06:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65ED14223F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uWp4FAndMvbd for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 19:06:16 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 32B4A42240
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 19:06:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32B4A42240
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id EC5A2B0051B;
 Wed, 10 Jan 2024 20:06:09 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:60144])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 10 Jan 2024 20:06:09 +0100
MIME-Version: 1.0
Date: Wed, 10 Jan 2024 20:06:09 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20240110035911.1020944-1-james.hilliard1@gmail.com>
References: <20240110035911.1020944-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.5
Message-ID: <29b23c5438f3123feeb6af3a1e4f1d16@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704913573;
 bh=vu4prTOOzmcSaIhcSmgXtCS2F8CbJo7+HEG3PDdZXIA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GN1AxTvr/g8uGPOyXoTLwUREQ/hhemr0FqRoO1nv5Y6plAR9GEEIG/8LCkmFGeyLO
 iJJYfv81C5734BZNbtZgaw6i+DEIW5SzvcogHDtr/XNQAGPNkxqQvZJVMpBCAmEAHy
 /LOsm0h9DDz3vpgzLmuUjmjhXGGK2sRxwRs/lokBh/yVWOgtik9qQLXCdPyS73Jbw5
 O7SbuORer9ZaLSzTlVvXEkB38bvCCQc/ViTNko9Et9VlXXD6r0NHAdYHaLkgZQDJX4
 fZw6MrnngFH/yAVaILCzq/mjYCldPeV1o4eHUfUhDeNpx5eCrLDh7z0zgFQAdt2Gs+
 VtWkUHGZ0N49g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GN1AxTvr
Subject: Re: [Buildroot] [PATCH 1/1] package/python-ml-dtypes: bump to
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi James,

The python-ml_dtypes v0.3.2 changelog says that the pybind11 build
requirement was removed. See:
https://github.com/jax-ml/ml_dtypes/blob/v0.3.2/CHANGELOG.md#032---2024-01-03

This patch does not remove it is the _DEPENDENCIES. Did you try to build 
the
package without it?

On 10/01/2024 04:59, James Hilliard wrote:
> Migrate from distutils which is being deprecated to setuptools.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-ml-dtypes/python-ml-dtypes.hash | 4 ++--
>  package/python-ml-dtypes/python-ml-dtypes.mk   | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-ml-dtypes/python-ml-dtypes.hash 
> b/package/python-ml-dtypes/python-ml-dtypes.hash
> index a440268e39..53bfacb528 100644
> --- a/package/python-ml-dtypes/python-ml-dtypes.hash
> +++ b/package/python-ml-dtypes/python-ml-dtypes.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/ml_dtypes/json
> -md5  6adbb05530819bdb4a78d2372d187fe2  ml_dtypes-0.3.1.tar.gz
> -sha256  
> 60778f99194b4c4f36ba42da200b35ef851ce4d4af698aaf70f5b91fe70fc611  
> ml_dtypes-0.3.1.tar.gz
> +md5  438c04dc0d941ec1b3b71667225c74c8  ml_dtypes-0.3.2.tar.gz
> +sha256  
> 533059bc5f1764fac071ef54598db358c167c51a718f68f5bb55e3dee79d2967  
> ml_dtypes-0.3.2.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  
> LICENSE
> diff --git a/package/python-ml-dtypes/python-ml-dtypes.mk 
> b/package/python-ml-dtypes/python-ml-dtypes.mk
> index 92d23bece4..b346dc5e9b 100644
> --- a/package/python-ml-dtypes/python-ml-dtypes.mk
> +++ b/package/python-ml-dtypes/python-ml-dtypes.mk
> @@ -4,12 +4,12 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_ML_DTYPES_VERSION = 0.3.1
> +PYTHON_ML_DTYPES_VERSION = 0.3.2
>  PYTHON_ML_DTYPES_SOURCE = ml_dtypes-$(PYTHON_ML_DTYPES_VERSION).tar.gz
> -PYTHON_ML_DTYPES_SITE = 
> https://files.pythonhosted.org/packages/16/6e/9a7a51ee1ca24b8e92109128260c5aec8340c8fe5572e9ceecddae559abe
> +PYTHON_ML_DTYPES_SITE = 
> https://files.pythonhosted.org/packages/39/7d/8d85fcba868758b3a546e6914e727abd8f29ea6918079f816975c9eecd63
>  PYTHON_ML_DTYPES_LICENSE = Apache-2.0
>  PYTHON_ML_DTYPES_LICENSE_FILES = LICENSE
> -PYTHON_ML_DTYPES_SETUP_TYPE = distutils
> +PYTHON_ML_DTYPES_SETUP_TYPE = setuptools
> 
>  PYTHON_ML_DTYPES_DEPENDENCIES = \
>  	host-python-numpy \
> --
> 2.34.1

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
