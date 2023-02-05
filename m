Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D938C636CC
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 15:36:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E16F841726;
	Sun,  5 Feb 2023 15:36:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E16F841726
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WOJ396L_ule0; Sun,  5 Feb 2023 15:36:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8289641718;
	Sun,  5 Feb 2023 15:36:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8289641718
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B68291BF59E
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 15:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8FC254171F
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 15:36:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FC254171F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PIeEOh9Qu7NP for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 15:36:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E72C41718
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E72C41718
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 15:36:01 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.112.201])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 399F613F87F;
 Sun,  5 Feb 2023 16:35:54 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 05 Feb 2023 16:35:52 +0100
Date: Sun, 5 Feb 2023 16:35:52 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@paral.in>
Message-ID: <20230205153552.GS2960@scaer>
References: <20230202132650.1537778-1-christian@paral.in>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230202132650.1537778-1-christian@paral.in>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675611358;
 bh=IGoTKZyPM0RSYkl2dsuEFOrsRqoYbyg2w98LmJso97A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JofryJ9bU2TCnBeyFwWqVLeGY7nsfj0SLGZE99nOgc83Ia6rVKEswmPIWDsuuvBMd
 l3N8Tc9+ovTTrUAxhmXQgpUdwzby9q/asJpIQbwe8EqeJkaBDF6TgJdCopolVUj4BV
 Cvf3B/+0C/1iRo8MEsT713w+GKdFuQRA+aFtuLkJ3sfkAPrMzRlrrePveJE//jAlKk
 Kq5yqS5auTJw/OUi3oc0aepyw9S5vCUFgFmr95IWMs/PPeH4278f1Ubpk0kS9jI4gg
 FZDOjF2BuNzSpW5bbijX74bUB9dczz4nnAXoOm4ePZeJA/3goY7yOW+FU4gGagY4Ky
 Igwxy1GswzPKA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JofryJ9b
Subject: Re: [Buildroot] [PATCH v1 1/1] package/balena-engine: bump to
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Christian, All,

On 2023-02-02 05:26 -0800, Christian Stewart via buildroot spake thusly:
> This update requires a workaround for the non-standard vendor/ structure in the
> balena-engine repository, which has an invalid vendor/modules.txt file.
> 
> Removing the vendor/modules.txt file fixes the build error.
> 
> Reference: https://github.com/moby/moby/issues/44618#issuecomment-1343565705
> 
> The go download post-process script uses go mod init to create the go.mod file

That's not correct. The download go-post-process script does not run
that command at all.

Furthermore, in the case of the balena-engine package, the
go-post-process script actually does absolutely nothing at all. Indeed,
it will notice that the vendor/ directory already exists, and thus will
exit early:

   17 # Already vendored tarball, nothing to do
   18 if tar tf "${output}" | grep -q "^[^/]*/vendor" ; then
   19     exit 0
   20 fi
   21
   22 post_process_unpack "${base_name}" "${output}"
   23
   24 # Do the Go vendoring
   25 pushd "${base_name}" > /dev/null
   26
   27 if [ ! -f go.mod ]; then
   28     echo "ERROR: no vendor/ folder and no go.mod, aborting"
   29     exit 1
   30 fi
   31
   32 go mod vendor -v -modcacherw
   33 popd > /dev/null
   34
   35 post_process_repack $(pwd) "${base_name}" "${output}"

Furthermore, for balena-engine, this all works because it is not using
the go-mod infra, and despite this uses a populated vendor/ directory.
So, we're not running the vendoring as it is already done, and we can
thus delete the problematic file.

So, you'll have to reword/rework the explanations.

Note that this also applies to your other patches touching the
docker-related packages, notably "package/docker-engine: bump version to
v23.0.0", so I'll mark the rest of that series as changes requested too.

Regards,
Yann E. MORIN.

> which specifies a language version of go1.16 on default. Use go mod edit to
> adjust the go.mod file to the required minimum version go1.19 for generic types
> used by docker-engine. (Fixes a build error).
> 
> Remove the vendor/archive sub-tree (fixes a build error) because Go no longer
> allows having duplicate packages in GOPATH and GOROOT. vendor/archive/tar cannot
> be in vendor/ because it exists in the standard library. Remove it from vendor/.
> 
> https://github.com/balena-os/balena-engine/releases/tag/v20.10.26
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/balena-engine/balena-engine.hash |  2 +-
>  package/balena-engine/balena-engine.mk   | 14 +++++++++++++-
>  2 files changed, 14 insertions(+), 2 deletions(-)
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
> index ecfb62bfbf..3b8b2f9ac6 100644
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
> @@ -34,6 +34,18 @@ BALENA_ENGINE_TAGS = \
>  
>  BALENA_ENGINE_BUILD_TARGETS = cmd/balena-engine
>  
> +# remove the conflicting vendor/modules.txt
> +# remove the conflicting vendor/archive (not allowed in go1.20)
> +# https://github.com/moby/moby/issues/44618#issuecomment-1343565705
> +define BALENA_ENGINE_CONFIGURE_CMDS
> +	if [ -f $(@D)/vendor/modules.txt ]; then \
> +		rm $(@D)/vendor/modules.txt; \

No need to test if a file exists before removing it; just
unconditionally delete it:
    rm -f $(@D)/vendor/modules.txt

> +	fi
> +	if [ -d $(@D)/vendor/archive ]; then \
> +		rm -rf $(@D)/vendor/archive; \

Ditto, just delete the directory without checking whether it exists.

Regards,
Yann E. MORIN.

> +	fi
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
