Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE05C47077
	for <buildroot@archiver.kernel.org>; Tue, 16 Jan 2024 23:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6DF441C07;
	Tue, 16 Jan 2024 23:27:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6DF441C07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eH4F8evw3Pxs; Tue, 16 Jan 2024 23:27:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0578041BDD;
	Tue, 16 Jan 2024 23:27:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0578041BDD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 846921BF33E
 for <buildroot@lists.busybox.net>; Tue, 16 Jan 2024 23:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55CB741BDD
 for <buildroot@lists.busybox.net>; Tue, 16 Jan 2024 23:27:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55CB741BDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KEdpMbLvtpHT for <buildroot@lists.busybox.net>;
 Tue, 16 Jan 2024 23:27:36 +0000 (UTC)
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 048CF41BD7
 for <buildroot@buildroot.org>; Tue, 16 Jan 2024 23:27:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 048CF41BD7
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id PsqBr21eWlPNgPsqBr7V0F; Wed, 17 Jan 2024 00:27:31 +0100
Message-ID: <5a937a1a-2a4b-4bb5-bf65-d46d4a167de3@benettiengineering.com>
Date: Wed, 17 Jan 2024 00:27:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240116214427.945514-1-fontaine.fabrice@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20240116214427.945514-1-fontaine.fabrice@gmail.com>
X-CMAE-Envelope: MS4xfN5nTaA1i5O5BXQo3cD9QuNKyrU4/lm/K1zPDRKrENOu6dMJIqjBJPXYHPuXByhadiAxP6LNarw9eswn927pp2iYCdt3xstp3gTvRN2eTn5/retStmGx
 5x2Nr6FRD6T5qbXy8qYhnrvfC57IdW3fFTfW7qKKpTQrZBC63uSVU0l4AlojzZVI9QACDG0D3bjnCIPqK9il7n6uUWD4XUEBvmxRz5mJju6B22w+K5+wlgfD
 YfzsUQ55OO6wP9U1PLzHVvKkXwmshse04+YdnTLlNFiF52G6IzqiNuC1h0peyBiA49tZ4svYTVpcICNvSNk7ce9x1xvvIIMjpoKwqcfi/TQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1705447651; bh=yh5UQSjIs3BsOxBey8U8mn8oEN4WzUJK+p+976Mkjjg=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=R2ne6L71Kd+PGPkBkYOTGKduwTRu8/BjFL1QEklmtsQ+TdBsWv70JIixHhdl4bmnk
 x20eGxHlVPBKkr84zA5KJCaSnDFgOIrVsE3OK421nSIDH5IHRMfriZkFIlBZYL3XUN
 98IgXkeooPImaoIDGT+zxegy162aeSC+mOej9LuuvTM0xRJeCAH9teTYIOhM4uit3a
 QU/xhlJnYt57kYRpI4KCodw85E9fFpkye8Z7xbrJridurVyRUR+2AiC/7d/dgPWLtn
 ll6xUNROt0cnxrqNDIzg7B64q9VPJHMunrAZAXDq3i3lP04mXXZxbkGAHjgXWRRe82
 KNnS1zJW2jQDg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=R2ne6L71
Subject: Re: [Buildroot] [PATCH 1/1] package/libtracefs: needs threads
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabrice,

On 16/01/24 22:44, Fabrice Fontaine wrote:
> libtracefs needs threads resulting in the following build failure since
> its addition in commit b1dbd3f679e6660325472e3fdca72127d74e6929:
> 
> In file included from /home/autobuild/autobuild/instance-2/output-1/host/xtensa-buildroot-linux-uclibc/sysroot/usr/include/stdio.h:27,
>                   from ../src/tracefs-instance.c:10:
> /home/autobuild/autobuild/instance-2/output-1/host/xtensa-buildroot-linux-uclibc/sysroot/usr/include/features.h:218:5: warning: #warning requested reentrant code, but thread support was disabled [-Wcpp]
>    218 | #   warning requested reentrant code, but thread support was disabled
>        |     ^~~~~~~
> ../src/tracefs-instance.c:20:10: fatal error: pthread.h: No such file or directory
>     20 | #include <pthread.h>
>        |          ^~~~~~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/e0a8dd0781a1d1824a4cb78f47dcff4055083959
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Thank you for the patch. I thought pthread was required only while
building samples instead you're right it's mandatory for libtracefs
itself so:
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas

> ---
>   package/libtracefs/Config.in  | 5 +++--
>   package/linux-tools/Config.in | 5 +++--
>   2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libtracefs/Config.in b/package/libtracefs/Config.in
> index bb0777b16c..a46bbe0bb1 100644
> --- a/package/libtracefs/Config.in
> +++ b/package/libtracefs/Config.in
> @@ -1,5 +1,6 @@
>   config BR2_PACKAGE_LIBTRACEFS
>   	bool "libtracefs"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>   	depends on !BR2_STATIC_LIBS # libtraceevent
>   	select BR2_PACKAGE_LIBTRACEEVENT
>   	help
> @@ -8,5 +9,5 @@ config BR2_PACKAGE_LIBTRACEFS
>   
>   	  https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git/
>   
> -comment "libtracefs needs a toolchain w/ dynamic library"
> -	depends on BR2_STATIC_LIBS
> +comment "libtracefs needs a toolchain w/ threads, dynamic library"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
> index ce744663f1..fb158f84d4 100644
> --- a/package/linux-tools/Config.in
> +++ b/package/linux-tools/Config.in
> @@ -104,6 +104,7 @@ endif
>   
>   config BR2_PACKAGE_LINUX_TOOLS_RTLA
>   	bool "rtla"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libtracefs
>   	depends on !BR2_STATIC_LIBS # libtracefs
>   	select BR2_PACKAGE_LINUX_TOOLS
>   	select BR2_PACKAGE_LIBTRACEFS
> @@ -124,8 +125,8 @@ config BR2_PACKAGE_LINUX_TOOLS_RTLA
>   	  not available in Buildroot, so only rtla in kernels 5.19
>   	  onwards is actually supported in Buildroot.
>   
> -comment "rtla needs a toolchain w/ dynamic library"
> -	depends on BR2_STATIC_LIBS
> +comment "rtla needs a toolchain w/ threads, dynamic library"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
>   
>   config BR2_PACKAGE_LINUX_TOOLS_SELFTESTS
>   	bool"selftests"

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
