Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5479BCFD376
	for <buildroot@archiver.kernel.org>; Sun, 30 Nov 2025 14:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE2248231E;
	Sun, 30 Nov 2025 14:33:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gObJgjZtCHHU; Sun, 30 Nov 2025 14:33:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D27F88231F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D27F88231F;
	Sun, 30 Nov 2025 14:33:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 22FB1351
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 14:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09F7E8231E
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 14:33:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cxzUsISPnCu0 for <buildroot@buildroot.org>;
 Sun, 30 Nov 2025 14:33:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D80E88231F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D80E88231F
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D80E88231F
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 14:33:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 6BFA120039E;
 Sun, 30 Nov 2025 15:33:14 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 30 Nov 2025 15:33:14 +0100
MIME-Version: 1.0
Date: Sun, 30 Nov 2025 15:33:14 +0100
To: Maxime Leroy <maxime@leroys.fr>
Cc: buildroot@buildroot.org, Vincent Jardin <vjardin@free.fr>
In-Reply-To: <20251021120342.483933-4-maxime@leroys.fr>
References: <20251021120342.483933-1-maxime@leroys.fr>
 <20251021120342.483933-4-maxime@leroys.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <019c90d7929f98d2f7da75410b941388@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764513196;
 bh=iNGLQ60XgY3KkFJdItsWji4fYpi9wu6j53WbeCp9cx8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TBRrXYolrE8hO9ArrchBbURKdaje81xJ3StUpkN/rzJn/cP4NlcQuNd3ezpt7y7kL
 AkKVmAXFZY8suRcBhLGsaSvSwOWb46N6zZmRyv84h1VGP7FFEhhkLc0jm4cJOrxAq2
 N11PMkk73XDrEy7PgTkkNlPmK02LsK8yw4OckAEftDQKonqZUw+MRIFS8ieRnqyQQq
 SVmeTs5rFj2sL+vyJlncMpEj+dmKTjuzVk38DByD7zH+Rf183KkPBE+hoh9G2m44s2
 7JZkrJIfL8puDHwNV8tEFcpF83ExxDDwTUvlfKLDVOvVQieKiRj7SS6zBDZRcUnucZ
 052dADrXkeQ+A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TBRrXYol
Subject: Re: [Buildroot] [PATCH 3/5] package/dpdk: make drivers selectable
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Maxime,

I finally had some time to test those patches. I have few comments.

On 21/10/2025 14:03, Maxime Leroy wrote:
> Add BR2_PACKAGE_DPDK_DRIVERS_LIST to control which DPDK applications 
> are
> built:
>   - empty : use DPDK defaults
>   - none  : disable all drivers (-Ddisable_drivers='*/*')
>   - list  : pass to -Denable_drivers= (comma-separated)
> 
> Signed-off-by: Maxime Leroy <maxime@leroys.fr>
> ---
>  package/dpdk/Config.in | 14 ++++++++++++++
>  package/dpdk/dpdk.mk   |  9 +++++++++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/package/dpdk/Config.in b/package/dpdk/Config.in
> index 5e8f2e001b..5de1c63937 100644
> --- a/package/dpdk/Config.in
> +++ b/package/dpdk/Config.in
> @@ -50,6 +50,20 @@ config BR2_PACKAGE_DPDK_ENABLE_KMODS
>  	  legacy uio/kni). Upstream marks this option as deprecated
>  	  and it will be removed in a future release.
> 
> +config BR2_PACKAGE_DPDK_DRIVERS_LIST
> +	string "Comma-separated drivers (e.g. net/virtio,net/ixgbe)"

Could you make this string prompt shorter and move the example in
help section? See my suggestion below.

> +	help
> +	  Controls which DPDK drivers are built.
> +
> +	  Values:
> +	   (empty): use DPDK defaults
> +	   none   : build no drivers
> +	   list   : e.g. "net/virtio,net/ixgbe"

Testing the provided example with the commands:

cat >.config <<EOF
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_DPDK=y
BR2_PACKAGE_DPDK_DRIVERS_LIST="net/virtio,net/ixgbe"
EOF
make olddefconfig
make dpdk

Fails with error:

ERROR: Unknown variable "c_args".

Could you provide an example working at least with with the
current version of dpdk in Buildroot (or the upcoming 25.11),
please?

> +
> +	  To list all drivers found in the DPDK source tree:
> +	    find drivers -mindepth 2 -maxdepth 2 -type d \
> +	    ! -printf '%P\n' | sort

Upstream commit [1] for example,
to be included in upcoming 25.11 release reorganized the
structure of the driver directory. So this command to list the
possible drivers might need to be updated after the bump to 25.11.

Also playing a bit with those new options, I noticed enabling
a dpdk component does not enable its internal dpdk dependencies.
So I would suggest to add a comment about that in the help.

With those comments, I suggest the following:

	string "List of enabled drivers"
	help
	  Controls which DPDK drivers are built.

	  Accepted values:
	   (empty): use DPDK defaults
	   none   : build no drivers
	   list   : comma-separated list of drivers to enable
	            e.g. "net/virtio,net/ixgbe"

	  To list all drivers found in the DPDK source tree:
	    find drivers -mindepth 2 -maxdepth 2 -type d \
	    ! -printf '%P\n' | sort

	  Note: providing manually a list of dpdk component to enable
	  does not automatically enable its dependencies (internal or
	  external). It is the user responsiblity to add internal dpdk
	  dependencies in this list, and/or select the relevant
	  Buildroot packages for external dependencies. DPDK
	  configuration will fail in case of missing dependencies.

Please adjust as needed.


> +
>  endif
> 
>  comment "dpdk needs a glibc toolchain w/ threads, gcc >= 4.9, headers 
> >= 4.19"
> diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
> index 30d5bcc9ca..9333a67c31 100644
> --- a/package/dpdk/dpdk.mk
> +++ b/package/dpdk/dpdk.mk
> @@ -47,6 +47,15 @@ else
>  DPDK_CONF_OPTS += -Dexamples=
>  endif
> 
> +DPDK_DRIVERS := $(call qstrip,$(BR2_PACKAGE_DPDK_DRIVERS_LIST))
> +ifneq ($(DPDK_DRIVERS),)
> +  ifeq ($(DPDK_DRIVERS),none)
> +    DPDK_CONF_OPTS += -Ddisable_drivers='*/*'

With the upstream commit [1], will this '*/*' still work with
a dpdk version 25.11?

> +  else
> +    DPDK_CONF_OPTS += -Denable_drivers='$(DPDK_DRIVERS)'
> +  endif
> +endif
> +
>  ifeq ($(BR2_PACKAGE_DPDK_TESTS),y)
>  DPDK_CONF_OPTS += -Dtests=true
>  else
> --
> 2.43.0

Since the new dpdk version is expected soon, I suggest you
should test those updated patches with it. And possibly
send all those in the same series including the bump.

Best regards,

Julien.

[1] 
https://github.com/DPDK/dpdk/commit/c1d145834f287aa8cf53de914618a7312f2c360e
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
