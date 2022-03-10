Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 587D0C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 20:58:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFCF361278;
	Thu, 10 Mar 2022 20:58:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v6ojGfmH-rmZ; Thu, 10 Mar 2022 20:58:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBA1D60B34;
	Thu, 10 Mar 2022 20:58:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 03F361BF331
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 20:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F408C60B34
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 20:57:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I9ogvVdUFS-7 for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 20:57:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DABC960768
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 20:57:58 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id b24so8534093edu.10
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 12:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=puxWl1b6Y+fEFjzDz0jbMoB6HdjxlV2OfOnIla6t6L0=;
 b=G8PMQwtLHs/7dtawYVl+OaD9dL3MdNEmd3bcRZstvx9DlDaNqCCKxvmzUX3W8JJVWc
 t53C3+AF8W6yy1ZufLmUpGs77eZAp2tvHpNgX+eSN9Ih53sboFTb1NKNdFsKdZY9YToH
 DdeR2jo15LgrieKHWLtrJqRmIrdDY7YmA8UNqL3EgDIL6cESbehqYOgYgfk8KVbyBgKD
 OPbXOHc2L6HmKXJiao7oeLHBF/2ZaVGrpe1McmLh850p4I05/djrr6c0lR0XYKbBkSl0
 RxcEVQQguHw7g4CrSC3j/ZSFzBZUzkzEX494udBLs5DbwcFazeci58UImXmyRgDuHFGH
 V4uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=puxWl1b6Y+fEFjzDz0jbMoB6HdjxlV2OfOnIla6t6L0=;
 b=29aNZ9xoKCToqLH1aVCND0Q2jfFO22Lk+KdIvw79FHVAP0tkd1lADrHUx8dpe0dMh1
 hDCTa5Jfcd27SoDKKIjmjdKlx6Pni86feYxY9zIcYKXT46tHy9saUpX33rackwlYji2T
 rT69HCArHPXxYjYayznY4gMMPliB+h3JIWYu/1sxX9gIQwc4pgXrShLjMO9PsoxHxcEL
 9uroBItE0BQ4aN7rl/K8wVMCGYbfEMmbCp13MYOI9k0M9pOuCKjqqL7uJa20Vnq8LtKR
 ylvTDhTmEIlP5trPJMaLXOAuqe04OVRJXvSy6E3/DBPl4NpirSIcIPo+BxV0w1zwQSeV
 ij9w==
X-Gm-Message-State: AOAM5304gL1R8i7rOaFwe/mJVlZsEcXL8GeVG2XR+iK/mYBPUiWSyGxg
 gw7k8alSw6GGy/anooi2DilX5Q==
X-Google-Smtp-Source: ABdhPJyuH9chs73x5xW4/+NTHCkpP/DY54XjWNfz6+a6/o7buritgNe8XcBHlGu2olx2SXZwHDNNag==
X-Received: by 2002:a05:6402:1d50:b0:416:3b53:6f5 with SMTP id
 dz16-20020a0564021d5000b004163b5306f5mr6241261edb.269.1646945877102; 
 Thu, 10 Mar 2022 12:57:57 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 z24-20020a170906815800b006dab4bd985dsm2133958ejw.107.2022.03.10.12.57.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 12:57:56 -0800 (PST)
Message-ID: <ea92fd5c-eb37-e17a-973f-d9fb90621725@mind.be>
Date: Thu, 10 Mar 2022 21:57:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: TIAN Yuanhao <tianyuanhao3@163.com>, buildroot@buildroot.org
References: <20220226102418.943851-1-tianyuanhao3@163.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220226102418.943851-1-tianyuanhao3@163.com>
Subject: Re: [Buildroot] [PATCH/next 1/1] package/balena-engine: bump to
 version 20.10.12
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
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>,
 Matt Weber <matthew.weber@collins.com>, Kyle Harding <kyle@balena.io>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/02/2022 11:24, TIAN Yuanhao wrote:
> Also:
> - drop unused dependencies
> - drop invalid tags
> - drop the autogen step
> - simplify kconfigs just to run hello-world
> 
> https://github.com/balena-os/balena-engine/blob/v20.10.12/CHANGELOG.md
> 
> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/balena-engine/Config.in          |  1 -
>   package/balena-engine/balena-engine.hash |  2 +-
>   package/balena-engine/balena-engine.mk   | 42 +++++-------------------
>   3 files changed, 9 insertions(+), 36 deletions(-)
> 
> diff --git a/package/balena-engine/Config.in b/package/balena-engine/Config.in
> index f48f361dc2..02f694515e 100644
> --- a/package/balena-engine/Config.in
> +++ b/package/balena-engine/Config.in
> @@ -6,7 +6,6 @@ config BR2_PACKAGE_BALENA_ENGINE
>   	depends on BR2_USE_MMU # util-linux
>   	select BR2_PACKAGE_CGROUPFS_MOUNT if !BR2_PACKAGE_SYSTEMD # runtime
>   	select BR2_PACKAGE_IPTABLES # runtime
> -	select BR2_PACKAGE_SQLITE # runtime
>   	select BR2_PACKAGE_UTIL_LINUX # runtime
>   	select BR2_PACKAGE_UTIL_LINUX_BINARIES # runtime
>   	select BR2_PACKAGE_UTIL_LINUX_MOUNT # runtime
> diff --git a/package/balena-engine/balena-engine.hash b/package/balena-engine/balena-engine.hash
> index 3f632ef381..ef590881f5 100644
> --- a/package/balena-engine/balena-engine.hash
> +++ b/package/balena-engine/balena-engine.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  389282706562118608b6ac580e7beacd6a43f0bb3481c69fb1856bed9ac49b85  balena-engine-19.03.14.tar.gz
> +sha256  43f4c985b855a4f731a5cdac214f1adf6c4cc2021cbad3f93856009df246d61c  balena-engine-20.10.12.tar.gz
>   sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
> diff --git a/package/balena-engine/balena-engine.mk b/package/balena-engine/balena-engine.mk
> index b3eb2ca75b..0afcea3d7e 100644
> --- a/package/balena-engine/balena-engine.mk
> +++ b/package/balena-engine/balena-engine.mk
> @@ -4,34 +4,33 @@
>   #
>   ################################################################################
>   
> -BALENA_ENGINE_VERSION = 19.03.14
> +BALENA_ENGINE_VERSION = 20.10.12
>   BALENA_ENGINE_SITE = $(call github,balena-os,balena-engine,v$(BALENA_ENGINE_VERSION))
>   
>   BALENA_ENGINE_LICENSE = Apache-2.0
>   BALENA_ENGINE_LICENSE_FILES = LICENSE
>   
> -BALENA_ENGINE_DEPENDENCIES = host-pkgconf
>   BALENA_ENGINE_GOMOD = github.com/docker/docker
>   
>   BALENA_ENGINE_LDFLAGS = \
> -	-X github.com/docker/cli/cli/version.Version=N/A \
> -	-X github.com/docker/cli/cli/version.GitCommit= \
> -	-X github.com/docker/cli/cli/version.BuildTime= \
> +	-X $(BALENA_ENGINE_GOMOD)/dockerversion.GitCommit= \
> +	-X $(BALENA_ENGINE_GOMOD)/dockerversion.Version=$(BALENA_ENGINE_VERSION) \
>   	-X github.com/containerd/containerd/version.Version=N/A \
> +	-X github.com/docker/cli/cli/version.BuildTime= \
> +	-X github.com/docker/cli/cli/version.GitCommit= \
> +	-X github.com/docker/cli/cli/version.Version=N/A \
>   	-X github.com/opencontainers/runc.version=N/A
>   
>   BALENA_ENGINE_TAGS = \
>   	cgo \
> -	exclude_graphdriver_zfs \
> -	autogen \
> -	no_buildkit \
>   	no_btrfs \
>   	no_cri \
>   	no_devmapper \
>   	no_zfs \
>   	exclude_disk_quota \
>   	exclude_graphdriver_btrfs \
> -	exclude_graphdriver_devicemapper
> +	exclude_graphdriver_devicemapper \
> +	exclude_graphdriver_zfs
>   
>   BALENA_ENGINE_BUILD_TARGETS = cmd/balena-engine
>   
> @@ -40,16 +39,6 @@ BALENA_ENGINE_DEPENDENCIES += systemd
>   BALENA_ENGINE_TAGS += journald
>   endif
>   
> -define BALENA_ENGINE_RUN_AUTOGEN
> -	cd $(@D) && \
> -		VERSION=$(BALENA_ENGINE_VERSION) \
> -		PKG_CONFIG=$(PKG_CONFIG_HOST_BINARY) \
> -		$(TARGET_MAKE_ENV) \
> -		$(SHELL) hack/make/.go-autogen
> -endef
> -
> -BALENA_ENGINE_POST_CONFIGURE_HOOKS += BALENA_ENGINE_RUN_AUTOGEN
> -
>   define BALENA_ENGINE_INSTALL_INIT_SYSTEMD
>   	$(INSTALL) -D -m 644 $(@D)/contrib/init/systemd/balena-engine.service \
>   		$(TARGET_DIR)/usr/lib/systemd/system/balena-engine.service
> @@ -64,35 +53,20 @@ endef
>   define BALENA_ENGINE_LINUX_CONFIG_FIXUPS
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_POSIX_MQUEUE)
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS)
> -	$(call KCONFIG_ENABLE_OPT,CONFIG_MEMCG)
> -	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_SCHED)
> -	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_FREEZER)
> -	$(call KCONFIG_ENABLE_OPT,CONFIG_CPUSETS)
> -	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_DEVICE)
> -	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_CPUACCT)
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_NAMESPACES)
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_UTS_NS)
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_IPC_NS)
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_PID_NS)
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_NS)
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER)
> -	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_ADVANCED)
> -	$(call KCONFIG_ENABLE_OPT,CONFIG_BRIDGE_NETFILTER)
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK)
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XT_MATCH_ADDRTYPE)
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XT_MATCH_CONNTRACK)
> -	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XT_MATCH_IPVS)
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_IPTABLES)
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_FILTER)
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_NAT)
> -	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_TARGET_MASQUERADE)
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_BRIDGE)
> -	$(call KCONFIG_ENABLE_OPT,CONFIG_DUMMY)
> -	$(call KCONFIG_ENABLE_OPT,CONFIG_MACVLAN)
> -	$(call KCONFIG_ENABLE_OPT,CONFIG_VXLAN)
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_VETH)
> -	$(call KCONFIG_ENABLE_OPT,CONFIG_OVERLAY_FS)
> -	$(call KCONFIG_ENABLE_OPT,CONFIG_KEYS)
>   endef
>   
>   define BALENA_ENGINE_INSTALL_SYMLINK
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
