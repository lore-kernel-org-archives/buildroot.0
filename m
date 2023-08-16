Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA44BC19F4F
	for <buildroot@archiver.kernel.org>; Wed, 16 Aug 2023 19:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A20D61367;
	Wed, 16 Aug 2023 19:09:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A20D61367
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QUhfZIYBJ2J9; Wed, 16 Aug 2023 19:09:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D3A1613CA;
	Wed, 16 Aug 2023 19:09:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D3A1613CA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6AE091BF397
 for <buildroot@lists.busybox.net>; Wed, 16 Aug 2023 19:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4475D41719
 for <buildroot@lists.busybox.net>; Wed, 16 Aug 2023 19:09:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4475D41719
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UImNh8B0uaFi for <buildroot@lists.busybox.net>;
 Wed, 16 Aug 2023 19:09:23 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C79C1405B1
 for <buildroot@buildroot.org>; Wed, 16 Aug 2023 19:09:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C79C1405B1
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:1e73:3be7:eb1a:9d05])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 927205FF9E;
 Wed, 16 Aug 2023 21:09:14 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 16 Aug 2023 21:09:14 +0200
Date: Wed, 16 Aug 2023 21:09:14 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <20230816190914.GC1340200@scaer>
References: <20230816180916.2608831-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230816180916.2608831-1-yann.morin.1998@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692212959;
 bh=0fRt1tdoeKeRfZkrLv17MhiqGxKcO+qMqifVbmg8ZaY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dBYL7Gl0XaA9aaGpEKU5avPuP/kuQA9wksHbn/scAfndkVDPKPqY1gOj5k3I5wHlm
 r1GC29m0OBMRXZjrN3llAH69/iNqBKTkT/XuVS6vPhaB/HpcQBBa3aEuKYmtcID/pl
 KZFmUYbeR02qwzvBJkI2nhovrNQjyas4i/Qm5umlLArTA762NUIL5MU+qT5m1HBzYc
 v+HPpcfX/lcrLy0LPDfz5Ps4xvGtAnbLlTJHila8NgXwTvcv7f6mrM9U2v9Cl6p+es
 txHU7cAy2nE+fSdX9kReVzT4z4l70XV5zSogvCJpGImTXddoZ0OQgoCLl7fGNnsUiv
 zzp99X5ktlo+w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dBYL7Gl0
Subject: Re: [Buildroot] [PATCH] package/nftables: fix the build of the
 pyhon bindings
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>, James Hilliard <james.hilliard1@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

There is still an unkown part to the tory, which is when it broke, or if
it always was broken. I'm stil invetigating this, and this will be added
to the commit log shortly (thus the patch is "changes-requested" in
patchwork).

Still, feedback on the changes are still appreciated.

Regards,
Yann E. MORIN.

On 2023-08-16 20:09 +0200, Yann E. MORIN spake thusly:
> nftables provides python bindings; it uses setuptools to install them.
> We currently install those bindings by telling nftables buildsystem,
> autotools, to install the python bindings.
> 
> However, we do not pass any of the environment variables that are needed
> for setuptools packages. When host-python-setuptools is installed before
> nftables is built [0], this breaks the system at runtime, as the
> bindings are not installed; only the egg is, resulting in runtime errors
> like:
> 
>     # python -c 'import nftables'
>     Traceback (most recent call last):
>       File "<string>", line 1, in <module>
>     ModuleNotFoundError: No module named 'nftables'
> 
> Upstream has been doing some changes on their python handling, but it is
> not in a released version, and we can't backport those changes either,
> due to other big changes.
> 
> Instead, we split the pyhon bindings to their own package.
> 
> For legacy hadnling, we make that package default to y, so that existing
> (def)config still work. The only novelty is that it can be disabled now.
> 
> Many thanks to Julien for testing and finding the offending dependency,
> to James for suggesting the package split, and to Adam for, well,
> trigerring the issue in the first place! ;-p
> 
> [0] This can happen when another python package using setuptools is
>     built before nftables. However, with PPD, this never happens because
>     host-python-setuptools is never in the dependency chain of nftables.
> 
> Reported-by: Julien Olivain <ju.o@free.fr>
> Suggested-by: James Hilliard <james.hilliard1@gmail.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Adam Duskett <aduskett@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/nftables/Config.in                    |  5 +++++
>  package/nftables/nftables-python/Config.in    |  4 ++++
>  .../nftables-python/nftables-python.hash      |  1 +
>  .../nftables-python/nftables-python.mk        | 22 +++++++++++++++++++
>  package/nftables/nftables.mk                  | 10 +++------
>  5 files changed, 35 insertions(+), 7 deletions(-)
>  create mode 100644 package/nftables/nftables-python/Config.in
>  create mode 120000 package/nftables/nftables-python/nftables-python.hash
>  create mode 100644 package/nftables/nftables-python/nftables-python.mk
> 
> diff --git a/package/nftables/Config.in b/package/nftables/Config.in
> index 8d172b7256..833a3a38a2 100644
> --- a/package/nftables/Config.in
> +++ b/package/nftables/Config.in
> @@ -13,5 +13,10 @@ config BR2_PACKAGE_NFTABLES
>  
>  	  http://www.netfilter.org/projects/nftables/index.html
>  
> +# Legacy: this used to be handled in nftables.mk
> +if BR2_PACKAGE_NFTABLES
> +source "package/nftables/nftables-python/Config.in"
> +endif
> +
>  comment "nftables needs a toolchain w/ wchar, headers >= 3.12"
>  	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
> diff --git a/package/nftables/nftables-python/Config.in b/package/nftables/nftables-python/Config.in
> new file mode 100644
> index 0000000000..b16e2d0ad1
> --- /dev/null
> +++ b/package/nftables/nftables-python/Config.in
> @@ -0,0 +1,4 @@
> +config BR2_PACKAGE_NFTABLES_PYTHON
> +	bool "python bindings"
> +	default y # legacy
> +	depends on BR2_PACKAGE_PYTHON3
> diff --git a/package/nftables/nftables-python/nftables-python.hash b/package/nftables/nftables-python/nftables-python.hash
> new file mode 120000
> index 0000000000..9ac74580e7
> --- /dev/null
> +++ b/package/nftables/nftables-python/nftables-python.hash
> @@ -0,0 +1 @@
> +../nftables.hash
> \ No newline at end of file
> diff --git a/package/nftables/nftables-python/nftables-python.mk b/package/nftables/nftables-python/nftables-python.mk
> new file mode 100644
> index 0000000000..908bacd99a
> --- /dev/null
> +++ b/package/nftables/nftables-python/nftables-python.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# nftables-python
> +#
> +################################################################################
> +
> +# The following assignments work only because nftables.mk is included before
> +# this file is.
> +NFTABLES_PYTHON_VERSION = $(NFTABLES_VERSION)
> +NFTABLES_PYTHON_SOURCE = $(NFTABLES_SOURCE)
> +NFTABLES_PYTHON_SITE = $(NFTABLES_SITE)
> +NFTABLES_PYTHON_LICENSE = $(NFTABLES_LICENSE)
> +NFTABLES_PYTHON_LICENSE_FILES = $(NFTABLES_LICENSE_FILES)
> +
> +# We share the same source code as nftables
> +NFTABLES_PYTHON_DL_SUBDIR = nftables
> +
> +NFTABLES_PYTHON_SUBDIR = py
> +
> +NFTABLES_PYTHON_SETUP_TYPE = setuptools
> +
> +$(eval $(python-package))
> diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
> index b0a14bd429..aa88203ab5 100644
> --- a/package/nftables/nftables.mk
> +++ b/package/nftables/nftables.mk
> @@ -42,13 +42,6 @@ else
>  NFTABLES_CONF_OPTS += --without-json
>  endif
>  
> -ifeq ($(BR2_PACKAGE_PYTHON3),y)
> -NFTABLES_CONF_OPTS += --enable-python
> -NFTABLES_DEPENDENCIES += python3
> -else
> -NFTABLES_CONF_OPTS += --disable-python
> -endif
> -
>  NFTABLES_CONF_ENV = LIBS="$(NFTABLES_LIBS)"
>  
>  define NFTABLES_LINUX_CONFIG_FIXUPS
> @@ -58,3 +51,6 @@ define NFTABLES_LINUX_CONFIG_FIXUPS
>  endef
>  
>  $(eval $(autotools-package))
> +
> +# Legacy: we used to handle it in this .mk
> +include package/nftables/nftables-python/nftables-python.mk
> -- 
> 2.25.1
> 

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
