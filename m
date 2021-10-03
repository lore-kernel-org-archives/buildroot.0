Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 200BAC433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 20:00:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9049619E7
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 20:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C9049619E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9732040805;
	Sun,  3 Oct 2021 20:00:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sy1vlPEgpzby; Sun,  3 Oct 2021 20:00:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF479406BC;
	Sun,  3 Oct 2021 20:00:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D4481BF45A
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 20:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C5DF8495C
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 20:00:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AAB1iamYkK8W for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 20:00:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 73A8D8494B
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 20:00:06 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1d3d:918b:43fc:aadd])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id CD63613F81D;
 Sun,  3 Oct 2021 21:59:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633291205;
 bh=m1adDekkG2McyfDV9n6n6MhvtuR9ALvNw4ul+oj43vQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qy9hCh5eDYXE0TtsWmd9Bnpnoa8yoZKP+E2mpp6DwYXcWYwO7EwG1XAXBjNkebiAC
 QM+rcZdwXWCgnf61cshCVSQ4wZJbJG9vXeGC7YEvuH47pwlcPIIAwGgfCQsC9PvifM
 ofTS9/v7Zi8uyNCVFJ2f+g09k6xAZ17t8IE1tc1DJOU4l5ptPR+9FFeBrXgZZwvMCm
 zD9TVXJ3cYNlbkJ+Nxo/y+BI8kh0gU5xFbNcbWkzEX21wtPZ+LHUiDqS+9hG8ACJuY
 7KSs6UEB7Lb6SerivoU6zFomx8r296fr0pVI09TbZF6t6XROjq5mMIHDK3wJxBwhA3
 PSVRcJFPznzew==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 03 Oct 2021 21:59:58 +0200
Date: Sun, 3 Oct 2021 21:59:58 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Asaf Kahlon <asafka7@gmail.com>
Message-ID: <20211003195958.GR1504958@scaer>
References: <20210928123257.617634-1-asafka7@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210928123257.617634-1-asafka7@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pyhamcrest: bump to
 version 2.0.2
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

AsaF, All,

On 2021-09-28 15:32 +0300, Asaf Kahlon spake thusly:
> * The package doesn't support python2 anymore.

I've updated the comment in the reverese dependency, twisted.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> * Indent with two spaces in the hash file.
> * License was changed with a year bump.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  package/python-pyhamcrest/Config.in              | 1 +
>  package/python-pyhamcrest/python-pyhamcrest.hash | 6 +++---
>  package/python-pyhamcrest/python-pyhamcrest.mk   | 4 ++--
>  3 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-pyhamcrest/Config.in b/package/python-pyhamcrest/Config.in
> index c2a4dc06f7..1bbae3fec7 100644
> --- a/package/python-pyhamcrest/Config.in
> +++ b/package/python-pyhamcrest/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_PYTHON_PYHAMCREST
>  	bool "python-pyhamcrest"
> +	depends on BR2_PACKAGE_PYTHON3
>  	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
>  	select BR2_PACKAGE_PYTHON_SIX # runtime
>  	help
> diff --git a/package/python-pyhamcrest/python-pyhamcrest.hash b/package/python-pyhamcrest/python-pyhamcrest.hash
> index 0c1660e08a..b2e84d7d1f 100644
> --- a/package/python-pyhamcrest/python-pyhamcrest.hash
> +++ b/package/python-pyhamcrest/python-pyhamcrest.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/pyhamcrest/json
> -md5	8b833a3fa30197455df79424f30c8c3f  PyHamcrest-1.9.0.tar.gz
> -sha256	8ffaa0a53da57e89de14ced7185ac746227a8894dbd5a3c718bf05ddbd1d56cd  PyHamcrest-1.9.0.tar.gz
> +md5  7a086f0b067f8d38958ec32f054559b4  PyHamcrest-2.0.2.tar.gz
> +sha256  412e00137858f04bde0729913874a48485665f2d36fe9ee449f26be864af9316  PyHamcrest-2.0.2.tar.gz
>  # Locally computed sha256 checksums
> -sha256	ec76c04449607010d061b1e29c9d20a5ffae74db9d04670ae82538ccfe68b941  LICENSE.txt
> +sha256  71beae6c8151362cfe398cbd350191a1cc52d3d28499839a7830b25f5b50a7fe  LICENSE.txt
> diff --git a/package/python-pyhamcrest/python-pyhamcrest.mk b/package/python-pyhamcrest/python-pyhamcrest.mk
> index 244aa8c606..28979600dd 100644
> --- a/package/python-pyhamcrest/python-pyhamcrest.mk
> +++ b/package/python-pyhamcrest/python-pyhamcrest.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_PYHAMCREST_VERSION = 1.9.0
> +PYTHON_PYHAMCREST_VERSION = 2.0.2
>  PYTHON_PYHAMCREST_SOURCE = PyHamcrest-$(PYTHON_PYHAMCREST_VERSION).tar.gz
> -PYTHON_PYHAMCREST_SITE = https://files.pythonhosted.org/packages/a4/89/a469aad9256aedfbb47a29ec2b2eeb855d9f24a7a4c2ff28bd8d1042ef02
> +PYTHON_PYHAMCREST_SITE = https://files.pythonhosted.org/packages/58/05/7b993fabb44ff0b52a90916d96bfd91a65ecf90b8248e72bba325ba8e438
>  PYTHON_PYHAMCREST_SETUP_TYPE = setuptools
>  PYTHON_PYHAMCREST_LICENSE = BSD-3-Clause
>  PYTHON_PYHAMCREST_LICENSE_FILES = LICENSE.txt
> -- 
> 2.33.0
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
