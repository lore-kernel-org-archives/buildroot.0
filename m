Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F9BFCD5BD1
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 21:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32C1460767;
	Mon,  1 Jun 2026 21:06:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JUrdtXsXA9o2; Mon,  1 Jun 2026 21:06:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 340F860768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780348014;
	bh=qQ9zsLUb4RAwK6fZhgkXZf95xqIm1hghIy+4tY4GSkc=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=Wsk0SF9tDefiznAlToped7/RrTGqZAozYVQXY+Nx/XK5O16GV2QlHgNJk83MmJ65m
	 Fhs1x8X6zdBh229dr9lhKi30aYLcff/pZd3ISmq1YPwlL9Z6nHiCTmxgBhhSFjGYBa
	 VuLFJZl2+R4BuJqltkZJIUM/X16HKsvN3U+hFY3guBzOHkE0kiW9NpT3LhI6fe6OLQ
	 8R9CLnKsRe75fknKKY78XGgSVjGyfSZlRcRopgUVFl1B+gCPPXcknFZ92JvOhAOIaK
	 8EfOVhl2Y7775K6ycvwpYasc6VDm3xG7fxornEfpLV/EbjBp9mmnBJBV78Lc/9ePo9
	 xXxHAozthA/fg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 340F860768;
	Mon,  1 Jun 2026 21:06:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 010B2223
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 21:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DAB2960768
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 21:06:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4eJZ5g4u4bKQ for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 21:06:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9E87060767
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E87060767
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E87060767
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 21:06:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1AC79B97C39F; Mon,  1 Jun 2026 23:06:47 +0200 (CEST)
Message-ID: <939e9ffc-dba6-4e0c-a64d-3269b7167cd7@rnout.be>
Date: Mon, 1 Jun 2026 23:06:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dowan Gullient <dowan.gullient@smile.fr>, buildroot@buildroot.org
References: <20260601144955.74171-1-dowan.gullient@smile.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260601144955.74171-1-dowan.gullient@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780348008; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=0Q6srU/50t1C1+P39daE8bx7oSTpL8KoLVpCBZFlaL4=;
 b=XHSrK/l2cuuhxxZc//ZfBOBfEEMlFGuv9MlY0Cp80XDpECIqWGldhXKmxitqeJn8HPoeIe
 Vbwm55riZTObWJTdfJf1Nlo8BTDWyvmooIB2j/xeqRKnosv6BCY85BKaiaFlJr0p0Ira6G
 ARqjAE7fBex1cqS2PsetqBKMC/owQM2NPBa1C8H+Pyg9q6n83giObheUNEL7gailPbTnfy
 gPJnKzNlwFpflt28CqRaMg005wAWEf7wuTfSNQc/7feCaOkcKY3V+k51JWvzLPeeg7nPrJ
 3cM9vfuQlZKXghRDpFBlaN127oFbf8LG9M5Qa255ul4vxDl2FbgthkSprFtUoA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=XHSrK/l2
Subject: Re: [Buildroot] [PATCH v3 1/1] support/testing: test_podman.py :
 kernel version bump and add kernel fragment to fix iptables errors caused
 by this modification
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Dowan,

  It's convenient if you put the people who already looked at earlier versions 
in Cc. Many of us don't actively read all mails on the list.

On 01/06/2026 16:49, Dowan Gullient via buildroot wrote:
> From: Dowan GULLIENT <dowan.gullient@smile.fr>
> 
> This patch is a new version of the patch
> https://patchwork.ozlabs.org/project/buildroot/patch/20260505100553.4100688-3-dowan.gullient@smile.fr/mbox/

  Referring to previous versions is done an a patch changelog below the --- 
line. [1]


> that bumps the kernel version and adds a Linux kernel fragment for Podman
> tests to resolve "Protocol not supported" and "Table does not exist" errors

  You should turn this commit message around. The goal of this patch is to 
update the kernel version in the test (to be sure that podman runs correctly on 
recent kernels). And it turns out that it doesn't run correctly because the test 
fails. So the patch also fixes the test by enabling kernel options in various 
packages (various: see below).

  Actually, any KCONFIG_ENABLE_OPT changes you make should be in separate 
patches, because they are relevant even if the test is not updated.

> when using iptables-based networking which appeared due to the bump of the
> kernel version (5.10->6.18) Indeed, the new kernel version requires additional
> configuration options due to the switch to nftables, and to support Podman's
> networking features, especially when using iptables-based networking.

  So it sounds like these "new options" should always be enabled by podman itself.

  Is it possible to do a minimal runtime test with a kernel that has nothing 
specific configured, and then a second one with more advanced (networking) 
features where additional kernel config options are added? The first one would 
go up to and excluding "podman network create buz". Everything in that container 
should work with an absolutely minimal kernel config (so basically an 
allnoconfig that is fixed up by the podman package - it's a bit more than 
allnoconfig or we wouldn't even be able to boot in qemu).

  Actually, such an absolutely minimal qemu kernel config would be useful to 
test other packages as well that need to to KCONFIG_ENABLE_OPT, so perhaps it 
should even move to the base test.

> This fragment enables the specific networking options required by the test:
> 
>      * VETH & BRIDGE:
>      Required for Podman to successfully execute `podman network create buz`
>      and attach containers to virtual bridge interfaces.

  Is it really only needed if you create a network? I thought a bridge was 
created to get any kind of networking inside the container.

> 
>      * IP_NF_IPTABLES, IP_NF_NAT, TARGET_MASQUERADE (and legacy variants):
>      Fixes "Table does not exist" and "modprobe: module ip_tables not found"
>      errors. These are strictly required for Netavark to set up
>      SNAT/Masquerading, allowing the container to successfully `wget google.com`
>      during the test. [1]

  Then netavark should do the KCONFIG_ENABLE_OPT calls for it.

> 
>      * NFT_COMPAT & NF_TABLES:
>      Fixes "Protocol not supported" errors. If the userspace `iptables` tool

  Then iptables should do the KCONFIG_ENABLE_OPT calls for it.

>      is built as an nftables wrapper, it requires this kernel compatibility
>      layer to successfully register legacy rules.
> 
>      * NETFILTER_XT_MATCH_* (ADDRTYPE, CONNTRACK, COMMENT, MARK):
>      Specific xtables match modules utilized by the Netavark CNI backend to
>      isolate bridge traffic and manage container port forwarding.
> 
> Note: Parent dependencies (e.g., NETFILTER, NETFILTER_ADVANCED, NF_CONNTRACK)
> are explicitly enabled to unlock the options listed above. Options globally
> required by the Podman package (like NET_NS, USER_NS, MEMCG) are intentionally
> omitted here as they are already enforced by PODMAN_LINUX_CONFIG_FIXUPS.
> 
> Some dependencies in the configuration file were verified by the check-config
> script from the Moby project [2].
> 
> This configuration was tested and podman tests now pass successfully without
> the previous errors.
> 
> [1] Gentoo Wiki (Podman Kernel Requirements):
> https://wiki.gentoo.org/wiki/Podman#Configure_the_kernel [2] Moby/Docker

  Nitpick: line break messed up here.

> Check-config Script:
> https://github.com/moby/moby/blob/master/contrib/check-config.sh
> 
> Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
> ---
>   support/testing/tests/package/test_podman.py  |  5 +--
>   .../package/test_podman/linux-podman.fragment | 32 +++++++++++++++++++
>   2 files changed, 35 insertions(+), 2 deletions(-)
>   create mode 100644 support/testing/tests/package/test_podman/linux-podman.fragment
> 
> diff --git a/support/testing/tests/package/test_podman.py b/support/testing/tests/package/test_podman.py
> index 9d86a06129..9b4a7dedaf 100644
> --- a/support/testing/tests/package/test_podman.py
> +++ b/support/testing/tests/package/test_podman.py
> @@ -15,10 +15,11 @@ class PodmanBase(infra.basetest.BRTest):
>           BR2_SYSTEM_DHCP="eth0"
>           BR2_LINUX_KERNEL=y
>           BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.202"
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"
>           BR2_LINUX_KERNEL_DEFCONFIG="vexpress"

  So I'd take this defconfig, remove everything that is not strictly needed to 
boot a vexpress (you can test with qemu_arm_vexpress_defconfig) and use that as 
the basic
> +        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="support/testing/tests/package/test_podman/linux-podman.fragment"
>           BR2_LINUX_KERNEL_DTS_SUPPORT=y
> -        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
> +        BR2_LINUX_KERNEL_INTREE_DTS_NAME="arm/vexpress-v2p-ca9"
>           BR2_PACKAGE_PODMAN=y
>           BR2_PACKAGE_UTIL_LINUX=y
>           BR2_PACKAGE_UTIL_LINUX_MOUNT=y
> diff --git a/support/testing/tests/package/test_podman/linux-podman.fragment b/support/testing/tests/package/test_podman/linux-podman.fragment
> new file mode 100644
> index 0000000000..386a3d0438
> --- /dev/null
> +++ b/support/testing/tests/package/test_podman/linux-podman.fragment
> @@ -0,0 +1,32 @@
> +# --- Core Container System Support ---

  "Core container" really sounds like it should be enabled automatically...


  Regards,
  Arnout

[1] https://buildroot.org/downloads/manual/manual.html#_patch_revision_changelog

> +CONFIG_VETH=y
> +CONFIG_BRIDGE=y
> +
> +# --- Netfilter Infrastructure (Core) ---
> +CONFIG_NETFILTER=y
> +CONFIG_NETFILTER_NETLINK=y
> +CONFIG_NETFILTER_ADVANCED=y
> +CONFIG_NF_CONNTRACK=y
> +CONFIG_NF_TABLES=y
> +CONFIG_NF_TABLES_IPV4=y
> +CONFIG_NFT_COMPAT=y
> +CONFIG_NF_NAT=y
> +CONFIG_NFT_NAT=y
> +CONFIG_NETFILTER_XTABLES=y
> +
> +# --- IPv4 Support & IPTABLES Compatibility ---
> +CONFIG_IP_NF_IPTABLES=y
> +CONFIG_IP_NF_IPTABLES_LEGACY=y
> +CONFIG_IP_NF_FILTER=y
> +CONFIG_IP_NF_NAT=y
> +CONFIG_IP_NF_TARGET_MASQUERADE=y
> +CONFIG_IP_NF_MANGLE=y
> +
> +# --- Xtables Match Modules required by Podman/Netavark ---
> +CONFIG_NETFILTER_XTABLES_LEGACY=y
> +CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=y
> +CONFIG_NETFILTER_XT_MATCH_CONNTRACK=y
> +CONFIG_NETFILTER_XT_MATCH_COMMENT=y
> +CONFIG_NETFILTER_XT_MARK=y
> +CONFIG_NETFILTER_XT_NAT=y
> +CONFIG_BRIDGE_NETFILTER=y


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
