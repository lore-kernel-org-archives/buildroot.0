Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0794AC19F2C
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 18:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F08240981;
	Wed,  3 Aug 2022 18:55:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F08240981
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y9c5OnQODq8Q; Wed,  3 Aug 2022 18:55:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07826409A2;
	Wed,  3 Aug 2022 18:55:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07826409A2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 43A0A1BF5A7
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 18:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2BDA3818A7
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 18:55:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BDA3818A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SgyuZTT3waFU for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 18:55:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC3B78144C
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC3B78144C
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 18:55:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c944:63a3:5f2a:bb6f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 8B830780507;
 Wed,  3 Aug 2022 20:55:01 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 03 Aug 2022 20:54:57 +0200
Date: Wed, 3 Aug 2022 20:54:57 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Message-ID: <20220803185457.GB3274256@scaer>
References: <20220728112840.5143-1-guillaume.bressaix@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220728112840.5143-1-guillaume.bressaix@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659552904;
 bh=zvnT6E8Sd+8VDNDraQlD3fvjiyUBo8MjrAXUe3/5/aw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FtV0CUIv57km5E1cF3gaYeRbBUB+tMy9iB3NoDcmHcWRMB6DwmNsBiayfiago4EuY
 S+ow5mfBDn01Hnrh1yLAVhXip5RgMwlW2kB+ysYnETjza2Fb0DYTWJ1CH95/ttWGdF
 JBkuZJltHLUSwaafUEBv2qvnmcfpsPavxEDSN6xgmOwsZ2zHbWefd4JtJBZNuCULcz
 3RLtTyFARD5OV9Gj3JkZSyKTmnlc6tec1eqX2ikyFCvj3cIOG7cn6CnVl6DtKf9vyS
 5P7bcT+EpvJ/iIILFuoc52R2rHiRRkFhVnXJyry9PxS6uGkuikyF6E2c6FiBQZjNT8
 93lYCbHTyf3Lw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FtV0CUIv
Subject: Re: [Buildroot] [PATCH v2] package/mbw: new package
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
Cc: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Guillaume, All,

On 2022-07-28 13:28 +0200, Guillaume W. Bres spake thusly:
> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> changes v1 -> v2
>  - applied Romain's review
>  - update mbw to v1.5 latest
>  - update legal info
>  - mbw is now a cmake package, simplifies installation process
> ---
>  DEVELOPERS            |  1 +
>  package/Config.in     |  1 +
>  package/mbw/Config.in |  8 ++++++++
>  package/mbw/mbw.hash  |  3 +++
>  package/mbw/mbw.mk    | 12 ++++++++++++
>  5 files changed, 25 insertions(+)
>  create mode 100644 package/mbw/Config.in
>  create mode 100644 package/mbw/mbw.hash
>  create mode 100644 package/mbw/mbw.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index cb98c38..754f8c5 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1179,6 +1179,7 @@ N:	Guillaume William Brs <guillaume.bressaix@gmail.com>
>  F:	package/libnids/
>  F:	package/libxcrypt/
>  F:	package/liquid-dsp/
> +F:	package/mbw/
>  F:	package/pixiewps/
>  F:	package/python-pybind/
>  F:	package/reaver/
> diff --git a/package/Config.in b/package/Config.in
> index 4ff1fb2..fe68d32 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -122,6 +122,7 @@ menu "Debugging, profiling and benchmark"
>  	source "package/lttng-babeltrace/Config.in"
>  	source "package/lttng-modules/Config.in"
>  	source "package/lttng-tools/Config.in"
> +	source "package/mbw/Config.in"
>  	source "package/mcelog/Config.in"
>  	source "package/memstat/Config.in"
>  	source "package/netperf/Config.in"
> diff --git a/package/mbw/Config.in b/package/mbw/Config.in
> new file mode 100644
> index 0000000..e4f56c8
> --- /dev/null
> +++ b/package/mbw/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_MBW
> +	bool "mbw"
> +	help
> +	  MBW is a memory bandwidth benchmarking tool.
> +	  MBW determines the "copy" memory bandwidth available
> +	  to userspace programs.
> +
> +	  https://github.com/raas/mbw
> diff --git a/package/mbw/mbw.hash b/package/mbw/mbw.hash
> new file mode 100644
> index 0000000..74e3899
> --- /dev/null
> +++ b/package/mbw/mbw.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256  3c396ce09bb78c895e4d45e99b1ae07f80e3ea5eee59d78ed2048a7f2ae591ae  mbw-1.5.tar.gz
> +sha256  1afb2b8258506742238b9ceb8a865d7030c5889c56ba2911a0c0c042aa1335d1  mbw.spec
> diff --git a/package/mbw/mbw.mk b/package/mbw/mbw.mk
> new file mode 100644
> index 0000000..755a9f5
> --- /dev/null
> +++ b/package/mbw/mbw.mk
> @@ -0,0 +1,12 @@
> +################################################################################
> +#
> +# mbw
> +#
> +################################################################################
> +
> +MBW_VERSION = 1.5
> +MBW_SITE = $(call github,raas,mbw,v$(MBW_VERSION))
> +MBW_LICENSE = LGPL-2.1
> +MBW_LICENSE_FILES = mbw.spec
> +
> +$(eval $(cmake-package))
> -- 
> 1.8.3.1
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
