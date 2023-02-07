Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D896C636CD
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 09:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED05881B26;
	Tue,  7 Feb 2023 09:03:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED05881B26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FD2-5--vvKdT; Tue,  7 Feb 2023 09:03:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2BB481B3E;
	Tue,  7 Feb 2023 09:03:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2BB481B3E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D41151BF30B
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 09:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE2B64053F
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 09:03:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE2B64053F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W-McRy5Sy3RM for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 09:03:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08E40401F1
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 08E40401F1
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 09:03:32 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 032FE13F89D;
 Tue,  7 Feb 2023 10:03:25 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 07 Feb 2023 10:03:25 +0100
Date: Tue, 7 Feb 2023 10:03:25 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Message-ID: <20230207090325.GA4124@scaer>
References: <20220616163309.5271-1-raphael.pavlidis@gmail.com>
 <20220904125359.18844-1-raphael.pavlidis@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220904125359.18844-1-raphael.pavlidis@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675760609;
 bh=mxXNmgAF0J0qtZCzH0Qe80CuOZ+v54zyE2TSCuBTprA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jdYF0LHXj03UwdHvvjtWVLnJC7/z01N/gA3yjaBqflqLTRjvqzVgvKIY+nG+4GRkO
 MTGv4heF732bkhTKckRiFuLjZZ/DkJ3i2ak91nswtZS4gsEJ86uQJPxpCBScdeAmPr
 i6LmO8UVhKUckytWEjvi3ESqUAMGtvpdYWqcvuTushtHGdZmNW0QJFfUklgcV1esby
 TYczQTGOKn7LQK7G6RH4k6LTvc8jivthJqtFUreHR4mhJjg2Vk83i1i5W+eUYkPJAR
 WwkgE77m7TgbOtoGOl46t7NKoupdzUuOXXCJFJoWtKHcfgYrR8m9NpME+2BQQGR6Q/
 FVY9mX4y+QcIA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jdYF0LHX
Subject: Re: [Buildroot] [PATCH v3 1/1] package/cni-plugins: new package
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
Cc: Anisse Astier <anisse@astier.eu>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Raphael, All,

On 2022-09-04 14:53 +0200, Raphael Pavlidis spake thusly:
> cni-plugins contains some reference networking plugins, maintained by
> the CNI team.
> 
> Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>

We had cni-plugins added by Christian, and we're now at version 1.2.0.

I'm not sure whether it makes sense to have a selection for each and
individual plugins, but if you think that does, then feel free to respin
an update.

Thanks!

Regards,
Yann E. MORIN.

> ---
> Changes v2 -> v3:
>   - DEVELOPERS: add Raphael Pavlids for cni-plugins
> 
> Changes v1 -> v2:
>   - change BR2_PACKAGE_CNI_PLUGINS from config to menuconfig
>   - turn on all plugins by default
> 
>  DEVELOPERS                           |   3 +
>  package/Config.in                    |   1 +
>  package/cni-plugins/Config.in        | 108 +++++++++++++++++++++++++++
>  package/cni-plugins/cni-plugins.hash |   3 +
>  package/cni-plugins/cni-plugins.mk   |  77 +++++++++++++++++++
>  5 files changed, 192 insertions(+)
>  create mode 100644 package/cni-plugins/Config.in
>  create mode 100644 package/cni-plugins/cni-plugins.hash
>  create mode 100644 package/cni-plugins/cni-plugins.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index d2bd0d809a..208330881c 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2506,6 +2506,9 @@ F:	support/testing/tests/package/test_python_jmespath.py
>  F:	support/testing/tests/package/test_python_rsa.py
>  F:	support/testing/tests/package/test_python_s3transfer.py
>  
> +N:	Raphael Pavlidis <raphael.pavlidis@gmail.com>
> +F:	package/cni-plugins/
> +
>  N:	Refik Tuzakli <tuzakli.refik@gmail.com>
>  F:	package/freescale-imx/
>  F:	package/paho-mqtt-cpp/
> diff --git a/package/Config.in b/package/Config.in
> index d1c098c48f..00e9a5a99f 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1812,6 +1812,7 @@ menu "Networking"
>  	source "package/bluez5_utils-headers/Config.in"
>  	source "package/c-ares/Config.in"
>  	source "package/cgic/Config.in"
> +	source "package/cni-plugins/Config.in"
>  	source "package/cppzmq/Config.in"
>  	source "package/curlpp/Config.in"
>  	source "package/czmq/Config.in"
> diff --git a/package/cni-plugins/Config.in b/package/cni-plugins/Config.in
> new file mode 100644
> index 0000000000..9ce13f4bbe
> --- /dev/null
> +++ b/package/cni-plugins/Config.in
> @@ -0,0 +1,108 @@
> +menuconfig BR2_PACKAGE_CNI_PLUGINS
> +	bool "cni-plugins"
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
> +	help
> +	  Some reference and example networking plugins, maintained by the CNI team.
> +
> +	  https://github.com/containernetworking/plugins
> +
> +if BR2_PACKAGE_CNI_PLUGINS
> +
> +config BR2_PACKAGE_CNI_PLUGINS_BRIDGE
> +	bool "bridge"
> +	default y
> +	help
> +	  Creates a bridge, adds the host and the container to it.
> +
> +config BR2_PACKAGE_CNI_PLUGINS_IPVLAN
> +	bool "ipvlan"
> +	default y
> +	help
> +	  Adds an ipvlan interface in the container.
> +
> +config BR2_PACKAGE_CNI_PLUGINS_LOOPBACK
> +	bool "loopback"
> +	default y
> +	help
> +	  Set the state of loopback interface to up.
> +
> +config BR2_PACKAGE_CNI_PLUGINS_MACVLAN
> +	bool "macvlan"
> +	default y
> +	help
> +	  Creates a new MAC address, forwards all traffic to that to the container.
> +
> +config BR2_PACKAGE_CNI_PLUGINS_PTP
> +	bool "ptp"
> +	default y
> +	help
> +	  Creates a veth pair.
> +
> +config BR2_PACKAGE_CNI_PLUGINS_VLAN
> +	bool "vlan"
> +	default y
> +	help
> +	  Creates a veth pair.
> +
> +config BR2_PACKAGE_CNI_PLUGINS_HOST_DEVICE
> +	bool "host-device"
> +	default y
> +	help
> +	  Move an already-existing device into a container.
> +
> +config BR2_PACKAGE_CNI_PLUGINS_DHCP
> +	bool "dhcp"
> +	default y
> +	help
> +	  Runs a daemon on the host to make DHCP requests on behalf of the
> +	  container.
> +
> +config BR2_PACKAGE_CNI_PLUGINS_HOST_LOCAL
> +	bool "host-local"
> +	default y
> +	help
> +	  Maintains a local database of allocated IPs.
> +
> +config BR2_PACKAGE_CNI_PLUGINS_STATIC
> +	bool "static"
> +	default y
> +	help
> +	  Allocate a single static IPv4/IPv6 address to container. It's useful in
> +	  debugging purpose.
> +
> +config BR2_PACKAGE_CNI_PLUGINS_TUNING
> +	bool "tuning"
> +	default y
> +	help
> +	  Tweaks sysctl parameters of an existing interface.
> +
> +config BR2_PACKAGE_CNI_PLUGINS_PORTMAP
> +	bool "portmap"
> +	default y
> +	help
> +	  An iptables-based portmapping plugin. Maps ports from the host's address
> +	  space to the container.
> +
> +config BR2_PACKAGE_CNI_PLUGINS_BANDWIDTH
> +	bool "bandwidth"
> +	default y
> +	help
> +	  Allows bandwidth-limiting through use of traffic control tbf
> +	  (ingress/egress).
> +
> +config BR2_PACKAGE_CNI_PLUGINS_SBR
> +	bool "sbr"
> +	default y
> +	help
> +	  A plugin that configures source based routing for an interface (from which
> +	  it is chained).
> +
> +config BR2_PACKAGE_CNI_PLUGINS_FIREWALL
> +	bool "firewall"
> +	default y
> +	help
> +	  A firewall plugin which uses iptables or firewalld to add rules to allow
> +	  traffic to/from the container.
> +
> +endif # BR2_PACKAGE_CNI_PLUGINS
> diff --git a/package/cni-plugins/cni-plugins.hash b/package/cni-plugins/cni-plugins.hash
> new file mode 100644
> index 0000000000..c987e1ff45
> --- /dev/null
> +++ b/package/cni-plugins/cni-plugins.hash
> @@ -0,0 +1,3 @@
> +# Locally computed:
> +sha256  c86c44877c47f69cd23611e22029ab26b613f620195b76b3ec20f589367a7962  cni-plugins-1.1.1.tar.gz
> +sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
> diff --git a/package/cni-plugins/cni-plugins.mk b/package/cni-plugins/cni-plugins.mk
> new file mode 100644
> index 0000000000..02abcd283c
> --- /dev/null
> +++ b/package/cni-plugins/cni-plugins.mk
> @@ -0,0 +1,77 @@
> +################################################################################
> +#
> +# cni-plugins
> +#
> +################################################################################
> +
> +CNI_PLUGINS_VERSION = 1.1.1
> +CNI_PLUGINS_SITE = $(call github,containernetworking,plugins,v$(CNI_PLUGINS_VERSION))
> +CNI_PLUGINS_LICENSE = Apache-2.0
> +CNI_PLUGINS_LICENSE_FILES = LICENSE
> +
> +ifeq ($(BR2_PACKAGE_CNI_PLUGINS_BRIDGE),y)
> +CNI_PLUGINS_BUILD_TARGETS += plugins/main/bridge
> +endif
> +
> +ifeq ($(BR2_PACKAGE_CNI_PLUGINS_IPVLAN),y)
> +CNI_PLUGINS_BUILD_TARGETS += plugins/main/ipvlan
> +endif
> +
> +ifeq ($(BR2_PACKAGE_CNI_PLUGINS_LOOPBACK),y)
> +CNI_PLUGINS_BUILD_TARGETS += plugins/main/loopback
> +endif
> +
> +ifeq ($(BR2_PACKAGE_CNI_PLUGINS_MACVLAN),y)
> +CNI_PLUGINS_BUILD_TARGETS += plugins/main/macvlan
> +endif
> +
> +ifeq ($(BR2_PACKAGE_CNI_PLUGINS_PTP),y)
> +CNI_PLUGINS_BUILD_TARGETS += plugins/main/ptp
> +endif
> +
> +ifeq ($(BR2_PACKAGE_CNI_PLUGINS_VLAN),y)
> +CNI_PLUGINS_BUILD_TARGETS += plugins/main/vlan
> +endif
> +
> +ifeq ($(BR2_PACKAGE_CNI_PLUGINS_HOST_DEVICE),y)
> +CNI_PLUGINS_BUILD_TARGETS += plugins/main/host-device
> +endif
> +
> +ifeq ($(BR2_PACKAGE_CNI_PLUGINS_DHCP),y)
> +CNI_PLUGINS_BUILD_TARGETS += plugins/ipam/dhcp
> +endif
> +
> +ifeq ($(BR2_PACKAGE_CNI_PLUGINS_HOST_LOCAL),y)
> +CNI_PLUGINS_BUILD_TARGETS += plugins/ipam/host-local
> +endif
> +
> +ifeq ($(BR2_PACKAGE_CNI_PLUGINS_STATIC),y)
> +CNI_PLUGINS_BUILD_TARGETS += plugins/ipam/static
> +endif
> +
> +ifeq ($(BR2_PACKAGE_CNI_PLUGINS_TUNING),y)
> +CNI_PLUGINS_BUILD_TARGETS += plugins/meta/tuning
> +endif
> +
> +ifeq ($(BR2_PACKAGE_CNI_PLUGINS_PORTMAP),y)
> +CNI_PLUGINS_BUILD_TARGETS += plugins/meta/portmap
> +endif
> +
> +ifeq ($(BR2_PACKAGE_CNI_PLUGINS_BANDWIDTH),y)
> +CNI_PLUGINS_BUILD_TARGETS += plugins/meta/bandwidth
> +endif
> +
> +ifeq ($(BR2_PACKAGE_CNI_PLUGINS_SBR),y)
> +CNI_PLUGINS_BUILD_TARGETS += plugins/meta/sbr
> +endif
> +
> +ifeq ($(BR2_PACKAGE_CNI_PLUGINS_FIREWALL),y)
> +CNI_PLUGINS_BUILD_TARGETS += plugins/meta/firewall
> +endif
> +
> +define CNI_PLUGINS_INSTALL_TARGET_CMDS
> +	$(INSTALL) -d  $(TARGET_DIR)/usr/libexec/cni
> +	$(INSTALL) -D -m 0755 $(@D)/bin/* $(TARGET_DIR)/usr/libexec/cni/
> +endef
> +
> +$(eval $(golang-package))
> -- 
> 2.35.1
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
