Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C3DC3DA4A
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 10:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E2C240300;
	Tue, 20 Aug 2024 10:39:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CwPy3Hpo7e4Z; Tue, 20 Aug 2024 10:39:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C100405AE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C100405AE;
	Tue, 20 Aug 2024 10:39:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8664A1BF4DB
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 10:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7157340300
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 10:39:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BpTolKOQFG49 for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 10:39:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7EAF84024D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EAF84024D
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7EAF84024D
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 10:39:42 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 331543536550; Tue, 20 Aug 2024 12:39:39 +0200 (CEST)
Date: Tue, 20 Aug 2024 12:39:39 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZsRya7Q1XFeVaZT3@waldemar-brodkorb.de>
References: <ZsReNU/ELx70PBm1@waldemar-brodkorb.de>
 <20240820114501.185c9857@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240820114501.185c9857@windsurf>
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1724150379; bh=AB6HmuOmmkyeAgIvZgggYG4Q2l8OYT5nVXHhrczQfLY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ckd5zW+GD1i8f1z2pj9WzOL5ZaFKgPfGzzygmXycXdLhR6/oRQNpP39SLTQF6kthA
 iDLauHOZhq3bZFTmnmLvT5L6Fs7wOoq7yTgH6GwDdSWzXZHe0MlEu6rE9g+131mOON
 LasgTzpItQxAFQW2trKHNKQCPxZWgTXsqw3ICy7o2CYY1ufKIyphvy2yDrbAnfKh+Y
 ybSPPc8TFO6NNuA9DChGRCu1sK+MJbfUJ8+O5gcZcfH1Oc7Gb28NFlpgfBM3ECCVVO
 tJsmP42Ri0H2j/9qWw0STGhjY+wHZdExcMwCwcFd83jxMQifWed2FdHamuEC75wkUi
 9+JDPQXqh0E7g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=ckd5zW+G
Subject: Re: [Buildroot] docker package in buildroot
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

Hi Thomas,
Thomas Petazzoni wrote,

> Hello,
> 
> On Tue, 20 Aug 2024 11:13:25 +0200
> Waldemar Brodkorb <wbx@openadk.org> wrote:
> 
> > I would like to test Docker (docker-engine) in Buildroot.
> > 
> > When starting a container I get:
> > # docker run nginx
> > docker0: port 1(veth7743781) entered blocking state
> > docker0: port 1(veth7743781) entered disabled state
> > veth7743781: entered allmulticast mode
> > veth7743781: entered promiscuous mode
> > docker0: port 1(veth7743781) entered disabled state
> > veth7743781 (unregistering): left allmulticast mode
> > veth7743781 (unregistering): left promiscuous mode
> > docker0: port 1(veth7743781) entered disabled state
> > docker: Error response from daemon: failed to create task for
> > container: failed to create shim task: OCI runtime create failed:
> > error opening file `/proc/self/uid_map`: No such file or directory:
> > unknown.
> > 
> > It is inside Qemu aarch64 system with glibc.
> 
> Quick question: did you build your kernel with Buildroot, or
> separately? If you built it with Buildroot, did you build it with
> Docker already enabled?

Yes, I built the Kernel with Buildroot. I used the
qemu-system-aarch64 defconfig and enabled docker.
 
> Indeed the docker-engine package enables a shitload of kernel options:
> 
> define DOCKER_ENGINE_LINUX_CONFIG_FIXUPS
>         $(call KCONFIG_ENABLE_OPT,CONFIG_POSIX_MQUEUE)
>         $(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS)
>         $(call KCONFIG_ENABLE_OPT,CONFIG_MEMCG)
>         $(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_SCHED)
>         $(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_FREEZER)
>         $(call KCONFIG_ENABLE_OPT,CONFIG_CPUSETS)
>         $(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_DEVICE)
>         $(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_CPUACCT)
>         $(call KCONFIG_ENABLE_OPT,CONFIG_NAMESPACES)
>         $(call KCONFIG_ENABLE_OPT,CONFIG_UTS_NS)
>         $(call KCONFIG_ENABLE_OPT,CONFIG_IPC_NS)
>         $(call KCONFIG_ENABLE_OPT,CONFIG_PID_NS)
>         $(call KCONFIG_ENABLE_OPT,CONFIG_NET_NS)
>         $(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER)
>         $(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_ADVANCED)
>         $(call KCONFIG_ENABLE_OPT,CONFIG_BRIDGE_NETFILTER)
>         $(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK)
>         $(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XTABLES)
>         $(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XT_MATCH_ADDRTYPE)
>         $(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XT_MATCH_CONNTRACK)
>         $(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XT_MATCH_IPVS)
>         $(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_IPTABLES)
>         $(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_FILTER)
>         $(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_NAT)
>         $(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_TARGET_MASQUERADE)
>         $(call KCONFIG_ENABLE_OPT,CONFIG_BRIDGE)
>         $(call KCONFIG_ENABLE_OPT,CONFIG_NET_CORE)
>         $(call KCONFIG_ENABLE_OPT,CONFIG_VETH)
>         $(call KCONFIG_ENABLE_OPT,CONFIG_OVERLAY_FS)
>         $(call KCONFIG_ENABLE_OPT,CONFIG_KEYS)
>         $(DOCKER_ENGINE_DRIVER_BTRFS_LINUX_CONFIG_FIXUPS)
>         $(DOCKER_ENGINE_DRIVER_DM_LINUX_CONFIG_FIXUPS)
> endef
> 
> Maybe some are missing? :-)

And who knows which one's are missing? :)

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
