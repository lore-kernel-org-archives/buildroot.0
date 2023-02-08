Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A75C636CC
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 15:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2A1381F30;
	Wed,  8 Feb 2023 15:39:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2A1381F30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PBHcYF_sckeZ; Wed,  8 Feb 2023 15:39:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06A7981E74;
	Wed,  8 Feb 2023 15:39:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06A7981E74
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 982851BF36C
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 15:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F1644071E
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 15:39:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F1644071E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E0syahDiEZfv for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 15:39:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C14A9405E7
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C14A9405E7
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 15:39:23 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D8DC61BF20E;
 Wed,  8 Feb 2023 15:39:20 +0000 (UTC)
Date: Wed, 8 Feb 2023 16:39:19 +0100
To: TIAN Yuanhao <tianyuanhao3@163.com>
Message-ID: <20230208163919.49c6eb38@windsurf>
In-Reply-To: <20221009111423.7654-1-tianyuanhao3@163.com>
References: <20220926154320.35494-1-tianyuanhao3@163.com>
 <20221009111423.7654-1-tianyuanhao3@163.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675870761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SXz/3K0/XFn+ANRfSBcrSG1mvU89fj2AwkOGNQAPsu4=;
 b=aOYRjMdKT3Nv61rAzJRG/KiTpsZ9YIp0qsnMTI4x502bJ8EPHdnERoScvZBvrpzPMaGGAQ
 1o/JLfvcdH5/hGOFAirjFAK3WO6x/I3fiXEGTeiegWOccKcjZlS/OEP2LclidtH5qdE+2w
 TXT7HI7Jwe8K0TkBuG5hCwkvL9cdRYF0Mr+oik7/TN39kZC7gcJeUD17yykTLmXDIVMFNX
 H1QBEMWgTA43PGN50BU1RYHHYF6Dg1BX8b8UWxaxBW9A17mwje8AXPAUAodakKyYEeZZHr
 jWhzZHDhMXQGgo/X6sroVlQhUc5HZFcbt9xoorYW6U5Y2LcuMpc+MtFQ4SFNmQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aOYRjMdK
Subject: Re: [Buildroot] [PATCH v2 1/1] package/open-iscsi: new package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sun,  9 Oct 2022 04:14:23 -0700
TIAN Yuanhao <tianyuanhao3@163.com> wrote:

> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

I have applied the patch, with some changes. See below.


> diff --git a/package/open-iscsi/Config.in b/package/open-iscsi/Config.in
> new file mode 100644
> index 0000000000..04ec120e9a
> --- /dev/null
> +++ b/package/open-iscsi/Config.in
> @@ -0,0 +1,19 @@
> +config BR2_PACKAGE_OPEN_ISCSI
> +	bool "open-iscsi"
> +	depends on BR2_USE_MMU # fork()
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # pthread
> +	depends on !BR2_STATIC_LIBS # kmod
> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_OPEN_ISNS
> +	select BR2_PACKAGE_KMOD
> +	select BR2_PACKAGE_UTIL_LINUX
> +	select BR2_PACKAGE_UTIL_LINUX_LIBS

This BR2_PACKAGE_UTIL_LINUX_LIBS symbol is only for packages that
cannot use util-linux because they would otherwise create a circular
dependency. This is not the case of open-iscsi, so we can use
util-linux directly.

> +	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
> +	help
> +	  iSCSI tools for Linux.
> +
> +	  https://www.open-iscsi.com
> +
> +comment "open-iscsi needs a toolchain w/ threads, dynamic library"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> diff --git a/package/open-iscsi/open-iscsi.hash b/package/open-iscsi/open-iscsi.hash
> new file mode 100644
> index 0000000000..9fd651cae8
> --- /dev/null
> +++ b/package/open-iscsi/open-iscsi.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  9565bdf6b68b223e1e0d455d9a04d7536724a3f5b5a254e9398d06b2a0c6b6d2  open-iscsi-2.1.8.tar.gz
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/open-iscsi/open-iscsi.mk b/package/open-iscsi/open-iscsi.mk
> new file mode 100644
> index 0000000000..4bbd96f591
> --- /dev/null
> +++ b/package/open-iscsi/open-iscsi.mk
> @@ -0,0 +1,27 @@
> +################################################################################
> +#
> +# open-iscsi
> +#
> +################################################################################
> +
> +OPEN_ISCSI_VERSION = 2.1.8
> +OPEN_ISCSI_SITE = $(call github,open-iscsi,open-iscsi,$(OPEN_ISCSI_VERSION))
> +OPEN_ISCSI_LICENSE = GPL-2.0+

Actually, there is some GPLv3+ code, see
https://github.com/open-iscsi/open-iscsi/issues/379, so I changed this
to GPL-2.0+, GPL-3.0+ and added a comment to explain what's going on.

> +OPEN_ISCSI_LICENSE_FILES = COPYING
> +OPEN_ISCSI_DEPENDENCIES = kmod open-isns openssl util-linux-libs

Changed util-linux-libs to util-linux.

And applied!

Thanks a lot for your contribution!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
