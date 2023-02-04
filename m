Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 164CCC636CC
	for <buildroot@archiver.kernel.org>; Sat,  4 Feb 2023 12:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81CB7410A1;
	Sat,  4 Feb 2023 12:56:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81CB7410A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bWXoEsRkGVb5; Sat,  4 Feb 2023 12:56:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51A57410B8;
	Sat,  4 Feb 2023 12:56:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51A57410B8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6B9371BF578
 for <buildroot@lists.busybox.net>; Sat,  4 Feb 2023 12:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42DD18124C
 for <buildroot@lists.busybox.net>; Sat,  4 Feb 2023 12:56:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42DD18124C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HRjACBVN_8B7 for <buildroot@lists.busybox.net>;
 Sat,  4 Feb 2023 12:56:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC68881231
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC68881231
 for <buildroot@buildroot.org>; Sat,  4 Feb 2023 12:56:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2001:67c:1810:f055:bd69:5802:2abe:8f56])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 9DEBA5FFA8;
 Sat,  4 Feb 2023 13:56:11 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 04 Feb 2023 13:56:11 +0100
Date: Sat, 4 Feb 2023 13:56:11 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@paral.in>
Message-ID: <20230204125611.GD14083@scaer>
References: <20230203034443.326513-1-christian@paral.in>
 <20230203034443.326513-2-christian@paral.in>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230203034443.326513-2-christian@paral.in>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675515374;
 bh=sPejNtpfAYl/mw+mu/CX8c+wjLeoV2Q6us8Cko1moDM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eo6oCwbS/iLnuGoaCRI9/vkm9VakcdCoE8YxfICR9CPGY1y4QVCY0Vju7eop+1UIN
 dyn9CHPJdOa3Emb9jIy4Maj8okX+C+CUHu8FQjf2Ecv3Z7mtteJ53kPw8DgqcKPFGG
 nWFL8MkoDrbKVPtm8fMAeASruGjPJJySXkgLMli4800VfQgN4QAfZYWPgOuG9+/4Pj
 tFAUCTNMIpcJ8w3Mz7iELiM4GS6k3JxOtbaQWFup6A+z7ultAhlT5xBMLlfBcoiHZm
 NaElYP06SFVpHZ0Q+FeFqNEpf5yTjZLwKArYbpXwQSFShsbM/io3DgSsmFvUYpCJAe
 mLnhrrtFZ3Wtg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eo6oCwbS
Subject: Re: [Buildroot] [PATCH v2 2/4] package/docker-engine: bump version
 to v23.0.0
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

On 2023-02-02 19:44 -0800, Christian Stewart via buildroot spake thusly:
> This update requires a workaround for the non-standard vendor/ structure in the
> docker-engine repository, which has an invalid vendor/modules.txt file.
> 
> Removing the vendor/modules.txt file fixes the build error.
> 
> Reference: https://github.com/moby/moby/issues/44618#issuecomment-1343565705
> 
> The go download post-process script uses go mod init to create the go.mod file
> which specifies a language version of go1.16 on default. Use go mod edit to
> adjust the go.mod file to the required minimum version go1.19 for generic types
> used by docker-engine. (Fixes a build error). Note that this changes the go.mod
> language version and is not required to be equal to the current Go tool version.
> 
> Note that as of v23.0.0 docker-engine expects containerd to be started by
> systemd if --containerd= flag is set in dockerd.service, whereas in previous
> versions containerd was started by the docker daemon as a sub-process.
> 
> There is no sysv unit for containerd, but this is OK: in the Docker sysv init
> file S60dockerd, we do not set the --containerd flag. The docker daemon will
> start containerd as a sub-process automatically due to the absence of this flag.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> 
> ---
> 
> v1 -> v2:
> 
>  - clarify commit message about containerd.service and sysv compat
>  - fix formatting in S60dockerd
>  - bundle commit into a series with required containerd changes
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/docker-engine/S60dockerd         |  2 +-
>  package/docker-engine/docker-engine.hash |  2 +-
>  package/docker-engine/docker-engine.mk   | 16 +++++++++++++++-
>  3 files changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/package/docker-engine/S60dockerd b/package/docker-engine/S60dockerd
> index def8bea149..7591f9fe66 100644
> --- a/package/docker-engine/S60dockerd
> +++ b/package/docker-engine/S60dockerd
> @@ -10,7 +10,7 @@ DAEMON_ARGS=""
>  do_start() {
>          echo -n "Starting $NAME: "
>          start-stop-daemon --start --quiet --background --make-pidfile \
> -		--pidfile $PIDFILE --exec $DAEMON -- $DAEMON_ARGS \
> +            --pidfile $PIDFILE --exec $DAEMON -- $DAEMON_ARGS \

TAB-to-space conversion. Although I personally prefer that, that is not
the road we've decided to go down in Buildroot, see for reference:
    package/busybox/S01syslogd

In any case, fixing/converting can adshouldbe done in its own patch.

(You missed the TAB on line 35, by the way.)

>                  && echo "OK" || echo "FAIL"
>  }
>  
> diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
> index d15b1359cb..670cbd414b 100644
> --- a/package/docker-engine/docker-engine.hash
> +++ b/package/docker-engine/docker-engine.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  ee0e2168e27ec87f1b0650e86af5d3e167a07fd2ff8c1ce3bb588f0b4f9a4658  docker-engine-20.10.22.tar.gz
> +sha256  94492508260e57eb93399257d53435cd5308ca6330e173ca6e6f3dbf4c6e12f3  docker-engine-23.0.0.tar.gz
>  sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
> diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
> index 2a9b72ca78..208688cc43 100644
> --- a/package/docker-engine/docker-engine.mk
> +++ b/package/docker-engine/docker-engine.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DOCKER_ENGINE_VERSION = 20.10.22
> +DOCKER_ENGINE_VERSION = 23.0.0
>  DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
>  
>  DOCKER_ENGINE_LICENSE = Apache-2.0
> @@ -40,6 +40,7 @@ ifeq ($(BR2_INIT_SYSTEMD),y)
>  DOCKER_ENGINE_DEPENDENCIES += systemd
>  DOCKER_ENGINE_TAGS += systemd journald
>  endif
> +

Spurious empty line, although it does make the code look nicer. Maybe
move that with the sysv-init refactoring/cleanup?

>  ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_EXPERIMENTAL),y)
>  DOCKER_ENGINE_TAGS += experimental
>  endif
> @@ -62,6 +63,19 @@ else
>  DOCKER_ENGINE_TAGS += exclude_graphdriver_vfs
>  endif
>  
> +# update the go module version to go1.19
> +# docker-engine does not use go modules
> +# remove the conflicting vendor/modules.txt
> +# https://github.com/moby/moby/issues/44618#issuecomment-1343565705
> +define DOCKER_ENGINE_CONFIGURE_CMDS
> +	if [ -f $(@D)/vendor/modules.txt ]; then \
> +		rm $(@D)/vendor/modules.txt; \
> +	fi

No need to test for the presence of a file to remove it; just forcibly
remove it:
    rm -f $(@D)/vendor/modules.txt

Regards,
Yann E. MORIN.

> +	cd $(@D); \
> +		$(HOST_GO_HOST_ENV) $(DOCKER_ENGINE_GO_ENV) \
> +		$(GO_BIN) mod edit -go=1.19 go.mod
> +endef
> +
>  DOCKER_ENGINE_INSTALL_BINS = $(notdir $(DOCKER_ENGINE_BUILD_TARGETS))
>  
>  define DOCKER_ENGINE_INSTALL_INIT_SYSTEMD
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
