Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A730BC636CD
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 10:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DB8C8138A;
	Tue,  7 Feb 2023 10:23:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DB8C8138A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vQ0TCi8N0YQc; Tue,  7 Feb 2023 10:23:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 544918136E;
	Tue,  7 Feb 2023 10:23:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 544918136E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3BBCB1BF27A
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 10:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 154FC40913
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 10:23:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 154FC40913
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nb72ZemhI2IV for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 10:22:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C1F24090F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7C1F24090F
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 10:22:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 45FB013F8AF;
 Tue,  7 Feb 2023 11:22:51 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 07 Feb 2023 11:22:51 +0100
Date: Tue, 7 Feb 2023 11:22:51 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@paral.in>
Message-ID: <20230207102251.GB4124@scaer>
References: <20230207043010.85696-1-christian@paral.in>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230207043010.85696-1-christian@paral.in>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675765376;
 bh=TqCG9rbTDcOJCG6A6kEt3SViG5PpXP4X4X4aRD69faA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j0SKHOJmDoQHY2HhMVUkuZBvQc9DB7c30Zu0SG9Hp4zk4eQI42aWnbQALWBMHxCNA
 QhkxzFQOhWF0nZ94hEU0mbkYLTkeVwJLyTgHL4RY0QmXKcUzixfjnFJ6AV1HAS0Ia7
 dv/+Ax6h3l+B+svuay9rE193nQ1Srwo0q5Kb4ByofbLBiI20ux3+LZj+Qy28L1atn6
 VVNI1aD4eK8rh1Yf8Wp3U2pmxAcvS7l+RdRbcXpRxn5WhaqGc56pfbzDDcUAhDS+Fp
 6yjsVM9GSqVGjnlr4eAfouL9q4gmdCCJ/hXTnLeLhuPjKcEO/LcfITAPhS9SJgQHox
 HR1+scATQ9QmQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=j0SKHOJm
Subject: Re: [Buildroot] [PATCH v3 1/3] package/docker-engine: bump version
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
Cc: Tian Yuanhao <tianyuanhao3@163.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Christian, All,

On 2023-02-06 20:30 -0800, Christian Stewart via buildroot spake thusly:
> docker-engine does not ship a go.mod file in the tarball: create one to tell the
> Go compiler the root import path prefix for the module and the language version.
> Note that the language version in go.mod is not required to be equal the version
> of the Go compiler.
> 
> This update requires a workaround for the non-standard vendor/ structure in the
> docker-engine repository, which has an invalid vendor/modules.txt file.
> 
> Reference: https://github.com/moby/moby/issues/44618#issuecomment-1343565705
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

I've applied to master, after a substantial rewording of the commit log
(which already pretty good, thanks!).

I also chaged to using a post-extract hook instead of using the
configure_cmds. Indeed, currently, the golang infra does not use the
configure step, but if we need it in the future, that woudl break here.

So I've made that post-extract hooks, because that's what they are in
practice (I hesitated with post-patch hooks, though, and I just
arbitrarily settled for post-extract).

I did the same for docker-cli.

Series of three patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> 
> v1 -> v2:
> 
>  - clarify commit message about containerd.service and sysv compat
>  - fix formatting in S60dockerd
>  - bundle commit into a series with required containerd changes
> 
> v2 -> v3:
> 
>  - remove whitespace changes (as per Yann review)
>  - use rm -f instead of checking for file existence
>  - add the go.mod file in the CONFIGURE step
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/docker-engine/docker-engine.hash |  2 +-
>  package/docker-engine/docker-engine.mk   | 10 +++++++++-
>  2 files changed, 10 insertions(+), 2 deletions(-)
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
> index 2a9b72ca78..229e199aa2 100644
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
> @@ -62,6 +62,14 @@ else
>  DOCKER_ENGINE_TAGS += exclude_graphdriver_vfs
>  endif
>  
> +# create the go.mod file with language version go1.19
> +# remove the conflicting vendor/modules.txt
> +# https://github.com/moby/moby/issues/44618#issuecomment-1343565705
> +define DOCKER_ENGINE_CONFIGURE_CMDS
> +	printf "module $(DOCKER_ENGINE_GOMOD)\n\ngo 1.19\n" > $(@D)/go.mod
> +	rm -f $(@D)/vendor/modules.txt
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
