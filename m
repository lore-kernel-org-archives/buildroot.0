Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 705D7C4345F
	for <buildroot@archiver.kernel.org>; Mon, 29 Apr 2024 11:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F142660797;
	Mon, 29 Apr 2024 11:24:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6alIZ_6kcfkm; Mon, 29 Apr 2024 11:24:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E510A605D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E510A605D8;
	Mon, 29 Apr 2024 11:24:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1E71E1BF23C
 for <buildroot@lists.busybox.net>; Mon, 29 Apr 2024 11:24:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A17F4043A
 for <buildroot@lists.busybox.net>; Mon, 29 Apr 2024 11:24:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fmqZfSUGCwXA for <buildroot@lists.busybox.net>;
 Mon, 29 Apr 2024 11:24:04 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=198.175.65.12;
 helo=mgamail.intel.com; envelope-from=aapo.vienamo@linux.intel.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E29E040111
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E29E040111
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E29E040111
 for <buildroot@buildroot.org>; Mon, 29 Apr 2024 11:24:03 +0000 (UTC)
X-CSE-ConnectionGUID: jtRA3xnlTAiSQUFlNG2DCg==
X-CSE-MsgGUID: u7Iv63RLSteDL/yDW/CSrw==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="21459791"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="21459791"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 04:24:03 -0700
X-CSE-ConnectionGUID: 0buugJ/WSEK2g4mbuzoFfA==
X-CSE-MsgGUID: V/7VR07tR4GgPCccWoURYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="26701577"
Received: from jianyan1-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.33.104])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 04:24:02 -0700
Date: Mon, 29 Apr 2024 14:23:56 +0300
From: Aapo Vienamo <aapo.vienamo@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Message-ID: <yikqqkczs6qq3uonbqxhmv73gnp3nfvlwucki3ih62rk76zak6@nokzbi4ijbnn>
References: <20240426113756.3962234-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240426113756.3962234-1-mika.westerberg@linux.intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714389844; x=1745925844;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IJCy6WI6i+IrPGl1hyHD5Gko3FdhvtgZ366PyiY0C6Q=;
 b=kKm8G7GtW49NxWA4ZLbhzTgAPcn7VuYF3cYgEib0i/RKiBOmuuA14HhA
 7iDGASEFObSPr15IKaGEmwwRRNMFEzW+GkGWEknO09mAc1KzDMvNUMVoN
 1ZfmdNqO2nFPFrqrMt3XeAkxaDiD1Qm/0T3+BRptBarZRSQ+rNS1YVj1I
 qZML5iXIAqp2G9kFFTp39eKfeqmbtAlKuX1+ufYgTTIqZzTXBouYDn93B
 bb2xGc3YDDcE2Qe2KDgKR7QPqUZy5nJUMM7wlW0OPKc6y7FtqLee9rUrl
 ZFQJo+hdZIyCyWTcpVHtuPuFKxqEOtaDELna+NTA+J/Sqgs7a9aKZY8LA
 w==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linux.intel.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kKm8G7Gt
Subject: Re: [Buildroot] [PATCH] package/tbtools: new package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Mika,

On Mon, Apr 29, 2024 at 02:04:02PM GMT, Mika Westerberg wrote:
> This is a collection of tools for Linux Thunderbolt/USB4 development,
> debugging and validation.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg at linux.intel.com>
> ---
>  package/Config.in          |  1 +
>  package/tbtools/Config.in  |  9 +++++++++
>  package/tbtools/tbtools.mk | 12 ++++++++++++
>  3 files changed, 22 insertions(+)
>  create mode 100644 package/tbtools/Config.in
>  create mode 100644 package/tbtools/tbtools.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index cdbf3577f8e1..e346917649a8 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -157,6 +157,7 @@ menu "Debugging, profiling and benchmark"
>  	source "package/stress-ng/Config.in"
>  	source "package/sysdig/Config.in"
>  	source "package/sysprof/Config.in"
> +	source "package/tbtools/Config.in"
>  	source "package/tcf-agent/Config.in"
>  	source "package/trace-cmd/Config.in"
>  	source "package/trinity/Config.in"
> diff --git a/package/tbtools/Config.in b/package/tbtools/Config.in
> new file mode 100644
> index 000000000000..d2a1405eb5e8
> --- /dev/null
> +++ b/package/tbtools/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_TBTOOLS
> +	bool "tbtools"
> +	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS

Tested this and theres a dependency on libudev which should be declared
here. Also, currently the 32-bit build fails (for x86 at least), so I'd
suggest BR2_ARCH_IS_64 for now to prevent breakage.

> +	select BR2_PACKAGE_HOST_RUSTC
> +	help
> +	  tbtools is a collection of tools for Linux Thunderbolt/USB4
> +	  development, debugging and validation.
> +
> +	  https://github.com/intel/tbtools
> diff --git a/package/tbtools/tbtools.mk b/package/tbtools/tbtools.mk
> new file mode 100644
> index 000000000000..61986ca8d311
> --- /dev/null
> +++ b/package/tbtools/tbtools.mk
> @@ -0,0 +1,12 @@
> +################################################################################
> +#
> +# tbtools
> +#
> +################################################################################
> +
> +TBTOOLS_VERSION = v0.3.2
> +TBTOOLS_SITE = $(call github,intel,tbtools,$(TBTOOLS_VERSION))
> +TBTOOLS_LICENSE = MIT
> +TBTOOLS_LICENSE_FILES = LICENSE
> +
> +$(eval $(cargo-package))
> -- 
> 2.43.0
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
