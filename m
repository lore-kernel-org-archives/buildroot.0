Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C026EC3DA78
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 21:17:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E59281F0D;
	Sat, 14 Jan 2023 21:17:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E59281F0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gwoGXdVuUXtx; Sat, 14 Jan 2023 21:17:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58BFF81F05;
	Sat, 14 Jan 2023 21:17:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58BFF81F05
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 652A51BF3C2
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 21:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BC6260F79
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 21:17:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BC6260F79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NsKus5u37Ba8 for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 21:17:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EB9060EAA
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2EB9060EAA
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 21:17:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BAA8040003;
 Sat, 14 Jan 2023 21:17:19 +0000 (UTC)
Date: Sat, 14 Jan 2023 22:17:18 +0100
To: Vincent Fazio <vfazio@xes-inc.com>
Message-ID: <20230114221718.01e97481@windsurf>
In-Reply-To: <20230113225425.3301420-1-vfazio@xes-inc.com>
References: <20230113225425.3301420-1-vfazio@xes-inc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1673731040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ah0w/a/SHX5vhqxI+tQYxzNH43pNSTOFvCpXF+63OsA=;
 b=fkelQu6VtmtxqoX+L0lJ5yRmU+EoPofAbdGkY761mQnmOIBjY7pNJc+8ip20obAoDU1gpN
 RVdSpuyQS0ezfZcGTEGGduhdi7S+xlh6gmlnWC3iJAijVmU24fcCjFk/9q0iRxsaDVqEnc
 xy1Tyxfi3kUYA0etdbNYJuu1b7uRpLD2zxpHGtqAQyi9if/8YulXQ2ZvvxbsaZeM21tYCH
 ABRfKS6JW3zaJwS8pzjlLHCpV9cGNpTq5fEyG9m2v+shRfOck6LPbKcwZL9pAmrJgYFnI3
 Mkcx8Yq8K8BimT77vFWWE3HyVA34E2usaDl+w7OwnWNt9Jymo2PYulGTQHOnhA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fkelQu6V
Subject: Re: [Buildroot] [PATCH 1/2] package/ipmitool: backport fixes for
 registry issues
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Floris Bos <bos@je-eigen-domein.nl>, Heiko Thiery <heiko.thiery@gmail.com>,
 Vincent Fazio <vfazio@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Fri, 13 Jan 2023 16:54:24 -0600
Vincent Fazio <vfazio@xes-inc.com> wrote:

> From: Vincent Fazio <vfazio@gmail.com>
> 
> Add upstream patches to:
>   Fix the URL used for hte IANA PEN registry
>   Make a missing registry file non-fatal
>   Make downloading/installing the registry optional
> 
> The IANA PEN registry used by ipmitool takes up 4MB+. It is also not
> "frozen" and can be updated at the whim of IANA. This causes headaches
> when needing reproducible builds.
> 
> Registry installation will be disabled when BR2_REPRODUCIBLE is selected.
> 
> By default, the registry is not installed since it is largely a cosmetic
> feature and not driving core functionality.

So in the current Buildroot situation (before this patch), the registry
is always installed, correct?

> 
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> ---
>  .../0002-Fix-enterprise-numbers-URL.patch     |  33 ++++++
>  ...t-require-the-IANA-PEN-registry-file.patch | 112 ++++++++++++++++++
>  ...c-allow-disabling-registry-downloads.patch |  72 +++++++++++
>  package/ipmitool/Config.in                    |  12 ++
>  package/ipmitool/ipmitool.mk                  |   4 +
>  5 files changed, 233 insertions(+)
>  create mode 100644 package/ipmitool/0002-Fix-enterprise-numbers-URL.patch
>  create mode 100644 package/ipmitool/0003-Do-not-require-the-IANA-PEN-registry-file.patch
>  create mode 100644 package/ipmitool/0004-configure.ac-allow-disabling-registry-downloads.patch
> 
> diff --git a/package/ipmitool/0002-Fix-enterprise-numbers-URL.patch b/package/ipmitool/0002-Fix-enterprise-numbers-URL.patch
> new file mode 100644
> index 0000000000..af62d22459
> --- /dev/null
> +++ b/package/ipmitool/0002-Fix-enterprise-numbers-URL.patch
> @@ -0,0 +1,33 @@
> +From 1edb0e27e44196d1ebe449aba0b9be22d376bcb6 Mon Sep 17 00:00:00 2001
> +From: Alexander Amelkin <alexander@amelkin.msk.ru>
> +Date: Tue, 22 Nov 2022 13:55:33 +0300
> +Subject: [PATCH] Fix enterprise-numbers URL
> +
> +IANA has changed their URL scheme, and the content at the old URL for
> +enterprise-numbers switched from text/plain to text/html.
> +
> +Fix Makefile.am to use the new URL
> +
> +Resolves ipmitool/ipmitool#377
> +
> +Signed-off-by: Alexander Amelkin <alexander@amelkin.msk.ru>

We need you to add your Signed-off-by here.


> diff --git a/package/ipmitool/0003-Do-not-require-the-IANA-PEN-registry-file.patch b/package/ipmitool/0003-Do-not-require-the-IANA-PEN-registry-file.patch
> new file mode 100644
> index 0000000000..6ac5ce989b
> --- /dev/null
> +++ b/package/ipmitool/0003-Do-not-require-the-IANA-PEN-registry-file.patch
> @@ -0,0 +1,112 @@
> +From 26b088193a55624df4cbe2a0d33c7bba5bca108d Mon Sep 17 00:00:00 2001
> +From: Vincent Fazio <vfazio@gmail.com>
> +Date: Sat, 7 Jan 2023 21:02:48 -0600
> +Subject: [PATCH] Do not require the IANA PEN registry file
> +
> +Previously, ipmitool would fail to run if the local copy of the IANA PEN
> +registry could not be parsed.
> +
> +When the registry is not available the manufacturer will be "Unknown" but
> +ipmitool will otherwise function so should not be considered fatal.
> +
> +Also, fix an issue with improperly handling the `oem_info_list_load`
> +return value. Previously, in `ipmi_oem_info_init`, if `oem_info_list_load`
> +returned a negative value due to the registry file not existing, an
> +improper count would cause `oem_info_init_from_list` to aallocate a list
> +that didn't encompass the full header/tail list.
> +
> +  IANA PEN registry open failed: No such file or directory
> +    Allocating      3 entries
> +    [     1] 16777214 | A Debug Assisting Company, Ltd.
> +    [     0]  1048575 | Unspecified
> +
> +Now, use a signed int and ensure a valid count of loaded OEMs is used.
> +
> +Signed-off-by: Vincent Fazio <vfazio@gmail.com>

What is the upstream status of this patch?


> diff --git a/package/ipmitool/0004-configure.ac-allow-disabling-registry-downloads.patch b/package/ipmitool/0004-configure.ac-allow-disabling-registry-downloads.patch
> new file mode 100644
> index 0000000000..7c070cb51f
> --- /dev/null
> +++ b/package/ipmitool/0004-configure.ac-allow-disabling-registry-downloads.patch
> @@ -0,0 +1,72 @@
> +From be11d948f89b10be094e28d8a0a5e8fb532c7b60 Mon Sep 17 00:00:00 2001
> +From: Vincent Fazio <vfazio@gmail.com>
> +Date: Wed, 11 Jan 2023 22:55:51 -0600
> +Subject: [PATCH] configure.ac: allow disabling registry downloads
> +
> +Some environments require reproducible builds. Since the IANA PEN
> +registry is constantly updating and there is no snapshot available,
> +installing ipmitool via `make install` is not reproducible.
> +
> +Provide a configure mechanism to disable the registry download/install..

Missing Signed-off-by, and missing upstream status.

> diff --git a/package/ipmitool/Config.in b/package/ipmitool/Config.in
> index dbd6483110..ed3b918f9d 100644
> --- a/package/ipmitool/Config.in
> +++ b/package/ipmitool/Config.in
> @@ -9,6 +9,18 @@ config BR2_PACKAGE_IPMITOOL
>  
>  if BR2_PACKAGE_IPMITOOL
>  
> +comment "IANA PEN Registry will not be installed on reproducible builds"
> +	depends on BR2_REPRODUCIBLE
> +
> +config BR2_PACKAGE_IPMITOOL_PEN_REGISTRY
> +	bool "install PEN registry"

Maybe "install IANA PEN registry"

> +	depends on !BR2_REPRODUCIBLE
> +	help
> +	  Install the IANA PEN registry. 

Maybe spell out the PEN acronym here?

> +	  Shows manufacturer name in certain commands. 
> +	  
> +	  Not installing the registry saves ~4.3 MB.
> +
>  config BR2_PACKAGE_IPMITOOL_LANPLUS
>  	bool "enable lanplus interface"
>  	select BR2_PACKAGE_OPENSSL
> diff --git a/package/ipmitool/ipmitool.mk b/package/ipmitool/ipmitool.mk
> index b9f60d8151..f97d94693b 100644
> --- a/package/ipmitool/ipmitool.mk
> +++ b/package/ipmitool/ipmitool.mk
> @@ -14,6 +14,10 @@ IPMITOOL_CPE_ID_VENDOR = ipmitool_project
>  IPMITOOL_AUTORECONF = YES
>  IPMITOOL_DEPENDENCIES = host-pkgconf
>  
> +ifneq ($(BR2_PACKAGE_IPMITOOL_PEN_REGISTRY),y)
> +IPMITOOL_CONF_OPTS += --disable-registry-download
> +endif

Can we make this:

ifeq ($(BR2_PACKAGE_IPMITOOL_PEN_REGISTRY),y)
IPMITOOL_CONF_OPTS += --enable-registry-download
else
IPMITOOL_CONF_OPTS += --disable-registry-download
endif

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
