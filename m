From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Apr 2020 22:07:29 +0200
Subject: [Buildroot] [RESEND PATCH v2 1/3] configs,
 board/olpc: add scripts for OLPC laptops
In-Reply-To: <20191030123909.443536-2-lkundrak@v3.sk>
References: <20191030123909.443536-1-lkundrak@v3.sk>
 <20191030123909.443536-2-lkundrak@v3.sk>
Message-ID: <20200413220729.362c699c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 30 Oct 2019 13:39:07 +0100
Lubomir Rintel <lkundrak@v3.sk> wrote:

>  board/olpc/genimage.cfg  |  10 +
>  board/olpc/linux.config  | 461 +++++++++++++++++++++++++++++++++++++++

There are really a lot of things in this Linux kernel configuration
files, many of which don't really look like they are needed. We don't
need a strictly minimal configuration, but...

> +CONFIG_INET_AH=m
> +CONFIG_INET_ESP=m
> +CONFIG_INET_IPCOMP=m
> +CONFIG_TCP_CONG_ADVANCED=y
> +CONFIG_TCP_CONG_BIC=y
> +CONFIG_TCP_CONG_CUBIC=m
> +CONFIG_TCP_CONG_HSTCP=m
> +CONFIG_TCP_CONG_HYBLA=m
> +CONFIG_TCP_CONG_SCALABLE=m
> +CONFIG_TCP_CONG_LP=m
> +CONFIG_TCP_CONG_VENO=m
> +CONFIG_TCP_CONG_YEAH=m
> +CONFIG_TCP_CONG_ILLINOIS=m

Do we need all those TCP congestion algos, especially as modules?

> +CONFIG_IPV6_ROUTER_PREF=y
> +CONFIG_IPV6_ROUTE_INFO=y
> +CONFIG_IPV6_OPTIMISTIC_DAD=y
> +CONFIG_INET6_AH=m
> +CONFIG_INET6_ESP=m
> +CONFIG_INET6_IPCOMP=m
> +CONFIG_IPV6_MIP6=m
> +CONFIG_IPV6_SIT=m
> +CONFIG_IPV6_TUNNEL=m
> +CONFIG_IPV6_MULTIPLE_TABLES=y
> +CONFIG_IPV6_SUBTREES=y
> +CONFIG_NETWORK_SECMARK=y
> +CONFIG_NETFILTER=y
> +CONFIG_NF_CONNTRACK=m
> +CONFIG_NF_CONNTRACK_FTP=m
> +CONFIG_NF_CONNTRACK_IRC=m
> +CONFIG_NETFILTER_XT_TARGET_NFLOG=m
> +CONFIG_NETFILTER_XT_MATCH_STATE=m
> +CONFIG_IP_NF_IPTABLES=m
> +CONFIG_IP_NF_FILTER=m
> +CONFIG_NET_SCHED=y
> +CONFIG_NET_SCH_CBQ=m
> +CONFIG_NET_SCH_HTB=m
> +CONFIG_NET_SCH_HFSC=m
> +CONFIG_NET_SCH_PRIO=m
> +CONFIG_NET_SCH_RED=m
> +CONFIG_NET_SCH_SFQ=m
> +CONFIG_NET_SCH_TEQL=m
> +CONFIG_NET_SCH_TBF=m
> +CONFIG_NET_SCH_GRED=m
> +CONFIG_NET_SCH_DSMARK=m
> +CONFIG_NET_SCH_NETEM=m
> +CONFIG_NET_SCH_INGRESS=m
> +CONFIG_NET_CLS_BASIC=m
> +CONFIG_NET_CLS_TCINDEX=m
> +CONFIG_NET_CLS_ROUTE4=m
> +CONFIG_NET_CLS_FW=m
> +CONFIG_NET_CLS_U32=m
> +CONFIG_CLS_U32_PERF=y
> +CONFIG_CLS_U32_MARK=y
> +CONFIG_NET_CLS_RSVP=m
> +CONFIG_NET_CLS_RSVP6=m
> +CONFIG_NET_CLS_FLOW=m
> +CONFIG_NET_CLS_CGROUP=y
> +CONFIG_NET_EMATCH=y
> +CONFIG_NET_EMATCH_CMP=m
> +CONFIG_NET_EMATCH_NBYTE=m
> +CONFIG_NET_EMATCH_U32=m
> +CONFIG_NET_EMATCH_META=m
> +CONFIG_NET_EMATCH_TEXT=m
> +CONFIG_NET_CLS_ACT=y
> +CONFIG_NET_ACT_POLICE=m
> +CONFIG_NET_ACT_GACT=m
> +CONFIG_GACT_PROB=y
> +CONFIG_NET_ACT_MIRRED=m
> +CONFIG_NET_ACT_PEDIT=m
> +CONFIG_NET_ACT_SIMP=m

And all those network features?

> +CONFIG_USB_CATC=m
> +CONFIG_USB_KAWETH=m
> +CONFIG_USB_PEGASUS=m
> +CONFIG_USB_RTL8150=m
> +CONFIG_USB_USBNET=m
> +CONFIG_USB_NET_CDC_EEM=m
> +CONFIG_USB_NET_DM9601=m
> +CONFIG_USB_NET_SMSC75XX=m
> +CONFIG_USB_NET_SMSC95XX=m
> +CONFIG_USB_NET_GL620A=m
> +CONFIG_USB_NET_PLUSB=m
> +CONFIG_USB_NET_MCS7830=m
> +CONFIG_USB_NET_RNDIS_HOST=m
> +CONFIG_USB_ALI_M5632=y
> +CONFIG_USB_AN2720=y
> +CONFIG_USB_EPSON2888=y
> +CONFIG_USB_KC2190=y
> +CONFIG_USB_NET_INT51X1=m
> +CONFIG_USB_IPHETH=y
> +CONFIG_USB_SIERRA_NET=m

All these USB Ethernet drivers?

> +CONFIG_NLS_DEFAULT="utf8"
> +CONFIG_NLS_CODEPAGE_437=y
> +CONFIG_NLS_CODEPAGE_737=m
> +CONFIG_NLS_CODEPAGE_775=m
> +CONFIG_NLS_CODEPAGE_850=m
> +CONFIG_NLS_CODEPAGE_852=m
> +CONFIG_NLS_CODEPAGE_855=m
> +CONFIG_NLS_CODEPAGE_857=m
> +CONFIG_NLS_CODEPAGE_860=m
> +CONFIG_NLS_CODEPAGE_861=m
> +CONFIG_NLS_CODEPAGE_862=m
> +CONFIG_NLS_CODEPAGE_863=m
> +CONFIG_NLS_CODEPAGE_864=m
> +CONFIG_NLS_CODEPAGE_865=m
> +CONFIG_NLS_CODEPAGE_866=m
> +CONFIG_NLS_CODEPAGE_869=m
> +CONFIG_NLS_CODEPAGE_936=m
> +CONFIG_NLS_CODEPAGE_950=m
> +CONFIG_NLS_CODEPAGE_932=m
> +CONFIG_NLS_CODEPAGE_949=m
> +CONFIG_NLS_CODEPAGE_874=m
> +CONFIG_NLS_ISO8859_8=m
> +CONFIG_NLS_CODEPAGE_1250=m
> +CONFIG_NLS_CODEPAGE_1251=m
> +CONFIG_NLS_ASCII=y
> +CONFIG_NLS_ISO8859_1=m
> +CONFIG_NLS_ISO8859_2=m
> +CONFIG_NLS_ISO8859_3=m
> +CONFIG_NLS_ISO8859_4=m
> +CONFIG_NLS_ISO8859_5=m
> +CONFIG_NLS_ISO8859_6=m
> +CONFIG_NLS_ISO8859_7=m
> +CONFIG_NLS_ISO8859_9=m
> +CONFIG_NLS_ISO8859_13=m
> +CONFIG_NLS_ISO8859_14=m
> +CONFIG_NLS_ISO8859_15=m

These zillions NLS codepages ?

> +CONFIG_FONTS=y
> +CONFIG_FONT_TER16x32=y
> +CONFIG_PRINTK_TIME=y
> +CONFIG_DYNAMIC_DEBUG=y
> +CONFIG_DEBUG_INFO=y

Really a kernel with debug info ?

> +CONFIG_DEBUG_RODATA_TEST=y
> +CONFIG_DEBUG_MEMORY_INIT=y
> +# CONFIG_DEBUG_PREEMPT is not set
> +CONFIG_KGDB=y

And with kgdb ?

Could you review this Linux kernel defconfig, and try to keep options
that are more relevant ?

> diff --git a/board/olpc/post-build.sh b/board/olpc/post-build.sh
> new file mode 100755
> index 0000000000..4647e4ec94
> --- /dev/null
> +++ b/board/olpc/post-build.sh
> @@ -0,0 +1,18 @@
> +#!/bin/sh
> +
> +BOARD_DIR="$(dirname $0)"
> +
> +for i in tty1 tty2 tty3 tty4
> +do
> +	mkdir -p $TARGET_DIR/etc/systemd/system/getty.target.wants
> +	ln -sf ../../../../usr/lib/systemd/system/getty at .service \
> +		$TARGET_DIR/etc/systemd/system/getty.target.wants/getty@$i.service
> +done

The logic to create the systemd unit symlinks has changed since we have
a host-systemd package that takes care of creating the symlinks. Could
you review the changes in package/systemd/systemd.mk, and adjust what
is needed here to get the getty to start up ?

> +ln -sf /var/run/NetworkManager/resolv.conf $TARGET_DIR/etc/resolv.conf

We don't really want NetworkManager in our defconfigs, I'll answer
about this on PATCH 2/3 and 3/3.

> +rm -f $TARGET_DIR/etc/systemd/system/multi-user.target.wants/systemd-networkd.service
> +rm -f $TARGET_DIR/etc/systemd/system/network-online.target.wants/systemd-networkd-wait-online.service
> +rm -f $TARGET_DIR/etc/systemd/system/sockets.target.wants/systemd-networkd.socket

Why is this needed?

> diff --git a/board/olpc/post-image.sh b/board/olpc/post-image.sh
> new file mode 100755
> index 0000000000..9cca1b1789
> --- /dev/null
> +++ b/board/olpc/post-image.sh

Use support/scripts/genimage.sh instead.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
