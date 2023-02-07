Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A9BFC636CD
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 11:12:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06EEE40629;
	Tue,  7 Feb 2023 11:12:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06EEE40629
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lxI7cu66sB1Y; Tue,  7 Feb 2023 11:12:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15C18405E3;
	Tue,  7 Feb 2023 11:12:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15C18405E3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DCB321BF2AF
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 11:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7688405E3
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 11:12:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7688405E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PJCVlbLNFOdv for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 11:12:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A660240273
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A660240273
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 11:12:10 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B5D5E13F8CC;
 Tue,  7 Feb 2023 12:12:02 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 07 Feb 2023 12:12:02 +0100
Date: Tue, 7 Feb 2023 12:12:02 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@paral.in>
Message-ID: <20230207111202.GC4124@scaer>
References: <20230207043121.86027-1-christian@paral.in>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230207043121.86027-1-christian@paral.in>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675768327;
 bh=xJauzXnYy+QbWfU7gZkhVewNP5X9F52Ck2NMtwP6P8Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q2ktL6cYckaqovZh2uvXKZ9kctnMKQkPONx2RJsMSUG3v8k20NUhbA4xTzLR/WC8u
 89q9rS/yVlkY8O9AjW2l8jjwliKsRzx2+Gm4Sb+Pk4bd0Cem346Le4GktXmuG+xE+O
 SWdW1Mx1osAXsz+rYzup6RbqnDkoiu4zQoYvQX/mp43cspz7o3Epa8r4vfbW5GGtPU
 IlJMaZQx8TTBJv2VYK7bIYNCKhS1dFUXZSx6X2ZVQwJwuU+T31MWjmrNFk2CzoLOZa
 YCDVn7hyx6CDqrCgo+HXfe9pAa79ik9Sj9cCL1GKW0cqvAdDDOtw2KCVkKfbjZfvJL
 urWDu7DOy09Xg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Q2ktL6cY
Subject: Re: [Buildroot] [PATCH v2 1/1] package/balena-engine: bump to
 version 20.10.26
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
Cc: Tian Yuanhao <tianyuanhao3@163.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Christian, All,

On 2023-02-06 20:31 -0800, Christian Stewart via buildroot spake thusly:
> balena-engine does not ship a go.mod file in the tarball: create one to tell the
> Go compiler the root import path prefix for the module and the language version.
> Note that the language version in go.mod is not required to be equal the version
> of the Go compiler.
> 
> This update requires a workaround for the non-standard vendor/ structure in the
> balena-engine repository, which has an invalid vendor/modules.txt file.
> 
> Reference: https://github.com/moby/moby/issues/44618#issuecomment-1343565705
> 
> Remove the vendor/archive sub-tree (fixes a build error) because Go no longer
> allows having duplicate packages in GOPATH and GOROOT. vendor/archive/tar cannot
> be in vendor/ because it exists in the standard library. Remove it from vendor/.
> 
> https://github.com/balena-os/balena-engine/releases/tag/v20.10.26
> 
> Signed-off-by: Christian Stewart <christian@paral.in>

I've done the samechanges as in docker-engine and docker-cli, and
applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> 
> v2 -> v3:
> 
>  - add missing go.mod file in CONFIGURE step
>  - use rm -f instead of checking for file existence
>  - update comment about language version
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/balena-engine/balena-engine.hash |  2 +-
>  package/balena-engine/balena-engine.mk   | 12 +++++++++++-
>  2 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/package/balena-engine/balena-engine.hash b/package/balena-engine/balena-engine.hash
> index 4adb8ce561..6a92a40cc8 100644
> --- a/package/balena-engine/balena-engine.hash
> +++ b/package/balena-engine/balena-engine.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  4fb38109d133d499de366466a612fb6f523ea99d56fcd69b45dc494a75fbce0f  balena-engine-20.10.21.tar.gz
> +sha256  1482b64e35d5406be719e362647ed7d0599cf4eead7770247ebd972c4c85ede5  balena-engine-20.10.26.tar.gz
>  sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
> diff --git a/package/balena-engine/balena-engine.mk b/package/balena-engine/balena-engine.mk
> index ecfb62bfbf..89a572cf8e 100644
> --- a/package/balena-engine/balena-engine.mk
> +++ b/package/balena-engine/balena-engine.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BALENA_ENGINE_VERSION = 20.10.21
> +BALENA_ENGINE_VERSION = 20.10.26
>  BALENA_ENGINE_SITE = $(call github,balena-os,balena-engine,v$(BALENA_ENGINE_VERSION))
>  
>  BALENA_ENGINE_LICENSE = Apache-2.0
> @@ -34,6 +34,16 @@ BALENA_ENGINE_TAGS = \
>  
>  BALENA_ENGINE_BUILD_TARGETS = cmd/balena-engine
>  
> +# create the go.mod file with language version go1.19
> +# remove the conflicting vendor/modules.txt
> +# remove the conflicting vendor/archive (not allowed in go1.20)
> +# https://github.com/moby/moby/issues/44618#issuecomment-1343565705
> +define BALENA_ENGINE_CONFIGURE_CMDS
> +	printf "module $(BALENA_ENGINE_GOMOD)\n\ngo 1.19\n" > $(@D)/go.mod
> +	rm -f $(@D)/vendor/modules.txt
> +	rm -rf $(@D)/vendor/archive
> +endef
> +
>  ifeq ($(BR2_INIT_SYSTEMD),y)
>  BALENA_ENGINE_DEPENDENCIES += systemd
>  BALENA_ENGINE_TAGS += journald
> -- 
> 2.39.1
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
