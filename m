Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 677F8C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 07:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8DCB42033;
	Tue,  9 Jan 2024 07:37:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8DCB42033
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o0sCXIitD6Bu; Tue,  9 Jan 2024 07:37:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0840341921;
	Tue,  9 Jan 2024 07:37:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0840341921
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C68AF1BF3EC
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 07:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F13141921
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 07:37:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F13141921
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ri5CUJ0WNyg6 for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 07:37:18 +0000 (UTC)
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 82CDB4191F
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 07:37:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82CDB4191F
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 86CFD440459;
 Tue,  9 Jan 2024 09:35:03 +0200 (IST)
References: <20240109073348.4039538-1-james.hilliard1@gmail.com>
User-agent: mu4e 1.10.8; emacs 29.1
To: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 09 Jan 2024 09:36:18 +0200
In-reply-to: <20240109073348.4039538-1-james.hilliard1@gmail.com>
Message-ID: <87zfxfq7o6.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1704785703;
 bh=08O3tDwlVxW73EKg4413V2tsK+EvDfWYu7x98r+CZqg=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=MlTVV2IcMU5CSQnA7C9gv2p25h2s6Sn7vCM20rjCcynZkBI4Wb3u5PwwxYXVnV4ZE
 4D8Sj+MLcbRFul2wFnzIPulJHGHXQ20ty9YNsnyPVXHdZLZSSSmNcXamExMYhf1qBd
 QUwZolykDYsL4pUB54Zlrak5iqn5SpWe9cwaKylBROos2YUKP7dztdRq0UUQ3GQp4N
 2mHKI/HIhHTVR45mCtES/ZiQFtBIJsI0fGpj9LsrwNae2SbpsNLmbmja1J6m4EmW8m
 WNLJfPZuvPQXsSUIcSVwCp04AHgW1uzUmPTCf30bykeY42YLoW+4DO/VmCA/TCIYpW
 2Oyn+wsrBac0A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=MlTVV2Ic
Subject: Re: [Buildroot] [PATCH 1/1] package/python-fastapi: bump to version
 0.108.0
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi James,

On Tue, Jan 09 2024, James Hilliard wrote:
> Add new python-anyio runtime dependency.
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-fastapi/Config.in           | 1 -
>  package/python-fastapi/python-fastapi.hash | 4 ++--
>  package/python-fastapi/python-fastapi.mk   | 4 ++--
>  3 files changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/package/python-fastapi/Config.in b/package/python-fastapi/Config.in
> index 7d376d3dd7..d4a527c601 100644
> --- a/package/python-fastapi/Config.in
> +++ b/package/python-fastapi/Config.in
> @@ -1,7 +1,6 @@
>  config BR2_PACKAGE_PYTHON_FASTAPI
>  	bool "python-fastapi"
>  	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-pydantic -> python-pydantic-core
> -	select BR2_PACKAGE_PYTHON_ANYIO # runtime

This doesn't match the commit log.

baruch

>  	select BR2_PACKAGE_PYTHON_PYDANTIC # runtime
>  	select BR2_PACKAGE_PYTHON_STARLETTE # runtime
>  	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
> diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
> index 3dc1578cb7..8c578a386f 100644
> --- a/package/python-fastapi/python-fastapi.hash
> +++ b/package/python-fastapi/python-fastapi.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/fastapi/json
> -md5  06bfa7c610fc9e81d05b0319eb70cae7  fastapi-0.105.0.tar.gz
> -sha256  4d12838819aa52af244580675825e750ad67c9df4614f557a769606af902cf22  fastapi-0.105.0.tar.gz
> +md5  6dd5b159f2d6a7c405b4cb5cb9afb564  fastapi-0.108.0.tar.gz
> +sha256  5056e504ac6395bf68493d71fcfc5352fdbd5fda6f88c21f6420d80d81163296  fastapi-0.108.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
> diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
> index dc6d919926..dd435445cb 100644
> --- a/package/python-fastapi/python-fastapi.mk
> +++ b/package/python-fastapi/python-fastapi.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_FASTAPI_VERSION = 0.105.0
> +PYTHON_FASTAPI_VERSION = 0.108.0
>  PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
> -PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/77/bb/5941e6e2ce3020f64b539a49d39f49be05de17d0c47fea95012589f812a5
> +PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/cb/0d/ec01761249b228f288b693a7ad6b2e695af521ca0f32dd09aef58890d9a4
>  PYTHON_FASTAPI_SETUP_TYPE = pep517
>  PYTHON_FASTAPI_LICENSE = MIT
>  PYTHON_FASTAPI_LICENSE_FILES = LICENSE


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
