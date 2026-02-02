Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA10E7DF0F
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 17:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A5FB6073A;
	Mon,  2 Feb 2026 17:54:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DwCKrJ2m5SdG; Mon,  2 Feb 2026 17:54:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C217606B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770054848;
	bh=MFhw5gDQ+hOaadS1z/s6tgi0qt6sCwV7gTK3vMeRN+g=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RL8GLRXaJgO9KbSMl3qgrP1DpDwiifh/R9ExoGQV83dm7v7aYI9L4KleKLQvRVGi8
	 mRHj6076x8uFc7uNTxmhKijbv7Bv4R/cx1OQmUBUdPXNMoxyk+RKYMeBHpvGlTwz9v
	 DTjQmx4y1+jn0aoKT4njzhwKzTfezogr3N+P/OsMgcpxiFz/vAZKwky1oQwn6THi2K
	 dWPOKRZUFuQO1o9acFqMFqbk5N/FWohV/ZaVEejvIEt+UFtoKMP0rjDXebcW12suO5
	 hvxFqiPh/BwZTP2oCP4tteFxJJNUoeLBulbxXOBiqkg1+kCzIaPAZfrog5iaRuYxXk
	 x6mTFqxe8EB8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C217606B0;
	Mon,  2 Feb 2026 17:54:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A8310149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9600A6073A
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:54:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qpJp_s_kL4zH for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 17:54:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7560F60093
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7560F60093
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7560F60093
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:54:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AE667B97AC69; Mon,  2 Feb 2026 18:54:01 +0100 (CET)
Message-ID: <78b41baa-1a11-492e-8e8b-5b0aea92b7bd@rnout.be>
Date: Mon, 2 Feb 2026 18:53:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kory Maincent <kory.maincent@bootlin.com>, buildroot@buildroot.org
Cc: Etienne Carriere <etienne.carriere@foss.st.com>,
 Alistair Francis <alistair@alistair23.me>, Dick Olsson <hi@senzilla.io>,
 Sergey Matyukevich <geomatsi@gmail.com>, Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Gero_Schw=C3=A4ricke?= <gero.schwaericke@grandcentrix.net>,
 Thomas Perale <thomas.perale@mind.be>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20251001-fix_license-v2-0-bf18911c835d@bootlin.com>
 <20251001-fix_license-v2-1-bf18911c835d@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251001-fix_license-v2-1-bf18911c835d@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1770054844; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=Y9bEvwVOUvRgFDO30S96vn77J9VIPyfMGnCTJfuZWWE=;
 b=l0+EBcotUHwQqAK2vXnCASUOsn8DlvsucORqmGi2LyYZBmLljNryUzq3n8FdEqgavnSfvM
 02gut30YdivrawdFrMcC/28Zk0EEcn2bos7vKrW8NPx66VMRpbL3NvzchitXHhmX6wQp++
 e1pYwsnkXtHxSWG87hDbiUgYqLqixtA8tzVXyyjFDJ7K04cHMEYjakrxrtDIXVpeZmRJsK
 8gIqw3frqUjfDcKIXJfmgKwljGoLXSVuYuPHUDb7DM1WfocC38K5+i3IaK9WBMNfAcByv+
 TZRFjt93XScpYYp3rbeNoPKN7+3VtQbrKjJYeSOV4MBfee7DuJ2XrPqd+B6Qww==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=l0+EBcot
Subject: Re: [Buildroot] [PATCH v2 1/7] linux: Add support for custom
 license files
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Kory,

  Series applied to master, with changes...

  First, you missed package/linux-headers, so I added an additional commit that 
does the same for that package.

  Second, unfortunately the hash of the license file LICENSES/preferred/GPL-2.0 
changed in 6.17. Therefore, for the CIP versions, and all linux-headers versions 
before 6.17, the hash check fails... I added another commit that adds 
version-specific hash files for all supported versions.

  Third, these version-specific hash files break bump-stable-kernel-versions. I 
did not fix that - instead I added all people who I knkow use that script in Cc.
Hopefully someone will fix it :-)

  And finally, there's a small simplification (applied to all patches in the 
series), see below.

On 01/10/2025 16:58, Kory Maincent via buildroot wrote:
> The Linux package was not providing any license file when a custom
> Linux version was selected.
> 
> Fix this by adding a Kconfig option to specify the license file,
> with a default value set to the commonly used license paths.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
> 
> Change in v2:
> - Do not show license option if it is not a custom repo
> ---
>   linux/Config.in | 16 ++++++++++++++++
>   linux/linux.mk  |  8 ++------
>   2 files changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index 1f1c014ba21fe8ca5f06993f08c6707f6501d9af..6352260cd7d90520964d5ea6fb2714fbf827557d 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -150,6 +150,22 @@ config BR2_LINUX_KERNEL_VERSION
>   	default BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION \
>   		if BR2_LINUX_KERNEL_CUSTOM_GIT || BR2_LINUX_KERNEL_CUSTOM_HG || BR2_LINUX_KERNEL_CUSTOM_SVN
>   
> +config BR2_LINUX_KERNEL_CUSTOM_LICENSE_FILES
> +	string "Kernel license files"
> +	default "COPYING LICENSES/preferred/GPL-2.0 LICENSES/exceptions/Linux-syscall-note"
> +	depends on BR2_LINUX_KERNEL_CUSTOM_GIT || BR2_LINUX_KERNEL_CUSTOM_HG || \
> +		   BR2_LINUX_KERNEL_CUSTOM_SVN || BR2_LINUX_KERNEL_CUSTOM_TARBALL
> +	help
> +	  A space-separated list of license files related to the Linux
> +	  kernel package.
> +
> +config BR2_LINUX_KERNEL_LICENSE_FILES
> +	string
> +	default BR2_LINUX_KERNEL_CUSTOM_LICENSE_FILES \
> +		if BR2_LINUX_KERNEL_CUSTOM_GIT || BR2_LINUX_KERNEL_CUSTOM_HG || \
> +		   BR2_LINUX_KERNEL_CUSTOM_SVN || BR2_LINUX_KERNEL_CUSTOM_TARBALL

  There is no need to have two Kconfig options, you can add the condition to the 
prompt. So I kept BR2_LINUX_KERNEL_LICENSE_FILES and moved the condition to the 
prompt.

  Regards,
  Arnout

> +	default "COPYING LICENSES/preferred/GPL-2.0 LICENSES/exceptions/Linux-syscall-note"
> +
>   #
>   # Patch selection
>   #
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 0520394931ce7950a750d4f57dab451377886612..c61089bfe040ba9dee9efc00c0ec3cf4f9ef0167 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -6,12 +6,8 @@
>   
>   LINUX_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
>   LINUX_LICENSE = GPL-2.0
> -ifeq ($(BR2_LINUX_KERNEL_LATEST_VERSION),y)
> -LINUX_LICENSE_FILES = \
> -	COPYING \
> -	LICENSES/preferred/GPL-2.0 \
> -	LICENSES/exceptions/Linux-syscall-note
> -endif
> +LINUX_LICENSE_FILES = $(call qstrip,$(BR2_LINUX_KERNEL_LICENSE_FILES))
> +
>   LINUX_CPE_ID_VENDOR = linux
>   LINUX_CPE_ID_PRODUCT = linux_kernel
>   LINUX_CPE_ID_PREFIX = cpe:2.3:o
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
