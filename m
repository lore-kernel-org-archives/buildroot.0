Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78699C02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 15:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BE6F600B9;
	Mon,  3 Feb 2025 15:32:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aWHFcSrX6anV; Mon,  3 Feb 2025 15:32:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0359960A48
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0359960A48;
	Mon,  3 Feb 2025 15:32:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4077812A
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 15:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3019B80D66
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 15:32:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z2J8HZ8S1g94 for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 15:32:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0F11A80C82
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F11A80C82
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0F11A80C82
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 15:32:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 9DEC719F59C;
 Mon,  3 Feb 2025 16:32:45 +0100 (CET)
Received: from host-109-89-232-55.dynamic.voo.be ([109.89.232.55:33004])
 via host-109-89-232-55.dynamic.voo.be ([109.89.232.55])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 03 Feb 2025 16:32:45 +0100
MIME-Version: 1.0
Date: Mon, 03 Feb 2025 16:32:45 +0100
From: Julien Olivain <ju.o@free.fr>
To: Vincent Jardin <vjardin@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20250203144420.50351-2-vjardin@free.fr>
References: <20241110184324.50580-2-vjardin@free.fr>
 <20250203144420.50351-1-vjardin@free.fr>
 <20250203144420.50351-2-vjardin@free.fr>
User-Agent: Webmail Free/1.6.9
Message-ID: <19e3c144a337497a75f5b1a552c386c5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1738596766;
 bh=ZaJ+khlqx1JhL/4kPhROdjy48lLmD6Z4iDmlhcmkito=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=swTbrJBf/I/23WNl14q5d7ME0w+6ECbrjAgGjiX7hTXbt9F8jP5y8XmKno/TRYwSC
 HSq0PuYWtGvU1YjPne3nEYfwc17JfWggStp1H038H9ROtUEmL8g0DGDQ7rSB1KSh6B
 B3wf2MJI7qxSzaaBwA9x61+svTY38ivTpPQia05tCPDAuNbuo1oM91hatMENXqUaFR
 NJXCTiHQ4VWIjVYkWrI2EEoBGDCfKexYsVIaVXTjgSmMtAih5V3y4N05NR8kr3Sl4B
 NrMmMawY78thtl2gulJ2j6a1UyimtA9PvK8H34jNIUsdjpXdkho6SWGZniKXYN1t93
 TaA+EWaDlIe8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=swTbrJBf
Subject: Re: [Buildroot] [PATCH v2 1/1] board/nvidia/bf3: set eth names
 according to doc
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Vincent,

Thanks for the patch!

On 03/02/2025 15:44, Vincent Jardin wrote:
> Set the names of the Ethernet interfaces that are exposed from a first
> boot so they are aligned with those described by Mellanox/NVIDIA
> documentation for the BF3.
> 
> Those tmfifo and oob interface names are describeded at:
>   
> https://docs.nvidia.com/networking/display/bluefielddpuosv460/host-side+interface+configuration
> 
> When running the native Ubuntu on the BF3 board, the following udev
> rules are set:
> $ cat /etc/udev/rules.d/91-tmfifo_net.rules
> SUBSYSTEM=="net", ACTION=="add", 
> DEVPATH=="/devices/platform/MLNXBF01:00/virtio1/net/eth[0-9]", 
> NAME="tmfifo_net0"
> 
> $ cat /etc/udev/rules.d/92-oob_net.rules
> SUBSYSTEM=="net", ACTION=="add", 
> DEVPATH=="/devices/platform/MLNXBF17:00/net/e*", NAME="oob_net0", 
> RUN+="/sbin/sysctl -w net.ipv4.conf.oob_net0.arp_notify=1"
> 
> The default CX ports of the BF3 are:
> ubuntu@bf$ ip link show p0
> 4: p0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP 
> mode
>    DEFAULT group default qlen 1000
>     link/ether a0:88:c2:xx:xx:xx brd ff:ff:ff:ff:ff:ff
>     altname enp3s0f0np0
> ubuntu@bf$ ip link show p1
> 5: p1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP 
> mode
>    DEFAULT group default qlen 1000
>     link/ether a0:88:c2:xx:xx:xx brd ff:ff:ff:ff:ff:ff
>     altname enp3s0f1np1
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> ---
>  .../bf3/rootfs_overlay/etc/init.d/S04ifnames  | 61 +++++++++++++++++++
>  configs/nvidia_bf3_defconfig                  |  3 +
>  2 files changed, 64 insertions(+)
>  create mode 100755 
> board/nvidia/bf3/rootfs_overlay/etc/init.d/S04ifnames
> 
> diff --git a/board/nvidia/bf3/rootfs_overlay/etc/init.d/S04ifnames 
> b/board/nvidia/bf3/rootfs_overlay/etc/init.d/S04ifnames
> new file mode 100755
> index 0000000000..adb43f1e2c
> --- /dev/null
> +++ b/board/nvidia/bf3/rootfs_overlay/etc/init.d/S04ifnames
> @@ -0,0 +1,61 @@
> +#!/bin/sh
> +# Rename the board's interfaces according to Mellanox/NVIDIA's 
> documentation

This patch generates many errors with the command:

     utils/docker-run make check-package

Could you fix those, please?


> +
> +rename_interface() {
> +    bus_info=$1
> +    new_name=$2
> +    alt_name=$3
> +
> +    # Find the current interface name based on bus-info
> +    iface=$(find /sys/class/net -type l -exec sh -c '
> +        for i; do
> +            [ "$(basename "$(readlink -f "$i"/device)")" = "$0" ] && 
> basename "$i"
> +        done
> +    ' "$bus_info" {} +)
> +
> +    # Rename the interface if found
> +    if [ -n "$iface" ]; then
> +        ip link set "$iface" name "$new_name"
> +        printf "%s to %s" "$iface" "$new_name"
> +
> +        # Set altname if provided
> +        if [ -n "$alt_name" ]; then
> +            ip link property add dev "$new_name" altname "$alt_name"
> +            printf "/%s" "$alt_name"
> +        fi
> +        printf "; "
> +    else
> +        echo "$bus_info not found"
> +    fi
> +}
> +
> +case "$1" in
> +    start)
> +        printf "Starting interface renaming:"
> +        # Initialize success flag
> +        rename_allok=0
> +        rename_interface "0000:03:00.0" "p0" "enp3s0f0np0" || 
> rename_allok=1
> +        rename_interface "0000:03:00.1" "p1" "enp3s0f1np1" || 
> rename_allok=1
> +        rename_interface "MLNXBF17:00" "oob_net0" "enamlnxbf17i0" || 
> rename_allok=1
> +        rename_interface "virtio1" "tmfifo_net0" || rename_allok=1
> +
> +	if [ "$rename_allok" -eq 0 ]; then
> +		echo "OK"
> +	else
> +		echo "FAIL"
> +	fi
> +        ;;
> +    stop)
> +        ;;
> +    restart)
> +        # Optional: Handle restart by calling start after stop
> +        $0 stop
> +        $0 start
> +        ;;
> +    *)
> +        echo "Usage: $0 {start|stop|restart}"
> +        exit 1
> +        ;;
> +esac
> +
> +exit 0
> diff --git a/configs/nvidia_bf3_defconfig 
> b/configs/nvidia_bf3_defconfig
> index 3f958c0062..c5b00aae83 100644
> --- a/configs/nvidia_bf3_defconfig
> +++ b/configs/nvidia_bf3_defconfig
> @@ -10,3 +10,6 @@ 
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/nvidia/bf3/linux.config"
>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>  BR2_TARGET_ROOTFS_INITRAMFS=y
>  # BR2_TARGET_ROOTFS_TAR is not set
> +BR2_ROOTFS_OVERLAY="board/nvidia/bf3/rootfs_overlay"
> +BR2_PACKAGE_LIBMNL=y
> +BR2_PACKAGE_IPROUTE2=y

In Buildroot, we also try to maintain the defconfigs in they
"default" order. If you run commands:

     make nvidia_bf3_defconfig
     make savedefconfig
     git diff

You will be able to see that option are reordered differently.
Could you resend your patch after doing a "make savedefconfig"
please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
