Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DADFC43334
	for <buildroot@archiver.kernel.org>; Wed,  8 Jun 2022 07:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4783940B6E;
	Wed,  8 Jun 2022 07:59:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ZrA3xrM-njc; Wed,  8 Jun 2022 07:59:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 769AF40B0F;
	Wed,  8 Jun 2022 07:59:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 81D611BF25B
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 07:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69F6A40B0F
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 07:59:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CxvI2QrK86v3 for <buildroot@lists.busybox.net>;
 Wed,  8 Jun 2022 07:59:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B4A7404BD
 for <buildroot@buildroot.org>; Wed,  8 Jun 2022 07:59:12 +0000 (UTC)
Received: from [192.168.0.189] ([151.127.53.97]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MWAaw-1oEkcx3rVy-00Xa0J; Wed, 08 Jun 2022 09:59:09 +0200
Message-ID: <be16a0a9-1555-2f85-1e6a-35532ce3a0b6@green-communications.fr>
Date: Wed, 8 Jun 2022 09:58:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: fr
To: Angelo Compagnucci <angelo@amarulasolutions.com>, buildroot@buildroot.org
References: <20220607151719.2305134-1-angelo@amarulasolutions.com>
 <20220607151719.2305134-3-angelo@amarulasolutions.com>
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
In-Reply-To: <20220607151719.2305134-3-angelo@amarulasolutions.com>
X-Provags-ID: V03:K1:xq1naBcsFNrZoZx+cGjDS47wHCPmeI+yinnQI2JDHFXlljZanUq
 GWSM0AccX9Byey0DqJTLJVZA3jh3DocpWurufWyljZrHqTm7deJzi7JDxznYne+gxMqr8fK
 dhfjqpfLD69n3L1Kdxfy4PVIuMneK5Ns8bFyN/hJqQYJnS9sxsnCpl0g2zkLY129nybxLe1
 jDNDLnsgMbn5PegAykVvA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jkT8UG5E1Lw=:MS3aG46AL2TsljWQ8JFjM7
 APqpYVtA9+PdHsgHnHaSezxCFq//AtMHDMgrqgDMUDmGmXgFBQZ+qA147QTULnBbH7TfkTwHy
 rdCXyYp8JiEx+NNCB39JhqNjXNAfGwWxtf0woqbLLM1GosPtXrp5jhF5Gr2SbYtZNaqL4bs7k
 DTkxRmi3hfs5zdCX1I/CkhtWF7p0UEnWfv7LNmleioLr7hsAtptjBS/dLCXcNtOoYpFMjkv0g
 cJ4D1ZHokWh5uBQQK3AraytgdATNDu7/gQft1kQfutelMfB1CKOT9kSeWebh1gBMQLRG9dwpj
 bcoMB+yIT9LMTsY5K51lyHEbHeyO50OX4gX7BCS8JwLO7nGETg5AXOtJJ/Z516bzzjiFP8Pxk
 8DFHr6hEwr6aRS3clhGCbDDjJHSgOQtfglZ51ix3GmSRh+U2CliGdysn8bUjzYCJxjWairITi
 rKqZ2nRo4MSCalVYWt1K0vRQu5wcN/PoD7XcI/ryC9mE/pSbm5K57i4l0ZzQlN73Vf1RSOvJn
 khZ57r+neYzeKm0HH+zW6sbW5j5eHe0I2RvT2DD7k4a+EIT2WFQ2rpgv8vpqPrLPOvb+AHx4a
 g0/r2CX0ZuLIYpQqdi1iKXqdD87ZakJF2TL8axVzu+kPm7nCeYU6r83UN4RrNTeXvUN9oMw1P
 KmMYSyVOJ5tQVGvFqM8MdhdROB3yzP7IaAuCaBqRcIJnmABrx6VkacTjc2/4LpGiEbOLnUgcH
 9jod021Ww/sU1p2bFz8Q9RVKppQ7dvVq3hLc6rD1Zd6qmqfGEUd5FQOhA8DEo/eBjzOeM4n10
 /9lyxIR
Subject: Re: [Buildroot] [PATCH v2 2/3] package/wpa_supplicant: adding
 ifupdown support
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
Cc: jagan@amarulasolutions.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 07/06/2022 17:17, Angelo Compagnucci wrote:
> Actually, configuring a wifi interface as per "interfaces" man:
> 
> auto wlan0
> iface wlan0 inet dhcp
> wpa-conf /etc/wpa_supplicant.conf
> 
> doesn't work on buildroot because the line wpa-conf is ignored due to
> the lack of a proper ifupdown script to handle the wpa_supplicant
> initialization.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
> v1 -> v2:
> * Simplify script to the minimum to have the service started (Thomas,
>    Nicolas)
> 
>   package/wpa_supplicant/ifupdown.sh       | 48 ++++++++++++++++++++++++
>   package/wpa_supplicant/wpa_supplicant.mk | 10 +++++
>   2 files changed, 58 insertions(+)
>   create mode 100755 package/wpa_supplicant/ifupdown.sh
> 
> diff --git a/package/wpa_supplicant/ifupdown.sh b/package/wpa_supplicant/ifupdown.sh
> new file mode 100755
> index 0000000000..7321c7602f
> --- /dev/null
> +++ b/package/wpa_supplicant/ifupdown.sh
> @@ -0,0 +1,48 @@
> +#!/bin/sh
> +
> +# This file is executed by ifupdown in pre-up, post-up, pre-down and
> +# post-down phases of network interface configuration.
> +
> +WPA_SUP_BIN="/usr/sbin/wpa_supplicant"
> +
> +# Allow wpa_supplicant interface to be specified via wpa-iface
> +# useful for starting wpa_supplicant on one interface of a bridge
> +if [ -n "$IF_WPA_IFACE" ]; then
> +	WPA_IFACE="$IF_WPA_IFACE"
> +else
> +	WPA_IFACE="$IFACE"
> +fi
> +
> +WPA_SUP_PIDFILE="/run/wpa_supplicant.${WPA_IFACE}.pid"
> +
> +do_start () {
> +	[ -z "$IF_WPA_CONF" ] && exit 0
> +
> +	if [ ! -s "$IF_WPA_CONF" ]; then
> +		echo "cannot read contents of $IF_WPA_CONF"
> +		exit 1
> +	fi
> +	WPA_SUP_CONF="-c $IF_WPA_CONF"
> +}
> +
> +case "$MODE" in
> +	start)
> +		do_start
> +		case "$PHASE" in
> +			post-up)
> +				start-stop-daemon -S -q -x ${WPA_SUP_BIN} \
> +				-- -B -i ${WPA_IFACE} ${WPA_SUP_CONF} -P ${WPA_SUP_PIDFILE}
> +				;;
> +		esac
> +		;;
> +
> +	stop)
> +		case "$PHASE" in
> +			pre-down)
> +				start-stop-daemon -K -p ${WPA_SUP_PIDFILE}
> +				;;

Now this script will still attempt to stop wpa_supplicant on all 
interfaces even without a wpa-conf option. The [ -z "$IF_WPA_CONF" ] 
check need to be done earlier.

> +		esac
> +		;;
> +esac
> +
> +exit 0
> diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
> index c4cfe03371..d38bf572db 100644
> --- a/package/wpa_supplicant/wpa_supplicant.mk
> +++ b/package/wpa_supplicant/wpa_supplicant.mk
> [...]
> @@ -259,8 +267,10 @@ define WPA_SUPPLICANT_INSTALL_TARGET_CMDS
>   	$(WPA_SUPPLICANT_INSTALL_PASSPHRASE)
>   	$(WPA_SUPPLICANT_INSTALL_DBUS)
>   	$(WPA_SUPPLICANT_INSTALL_WPA_CLIENT_SO)
> +	$(WPA_SUPPLICANT_INSTALL_IFUP_SCRIPTS)
>   endef
>   
> +

This added blank line should probably go away.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
