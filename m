Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E00C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 15:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3311060ACB;
	Mon,  6 Jun 2022 15:14:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uJeD7e30092C; Mon,  6 Jun 2022 15:14:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48CB260AA3;
	Mon,  6 Jun 2022 15:14:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CD3BA1BF3F6
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 15:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BBDAE4169E
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 15:14:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gYCfD4LBNmPw for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 15:14:47 +0000 (UTC)
X-Greylist: delayed 00:05:06 by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1E1F24168F
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 15:14:46 +0000 (UTC)
Received: from [192.168.0.66] ([92.154.77.116]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1McY4R-1nM8r62zi1-00czfR; Mon, 06 Jun 2022 17:09:38 +0200
Message-ID: <ce3dbd69-bb72-a8ff-2ce8-e52da3133d9a@green-communications.fr>
Date: Mon, 6 Jun 2022 17:09:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Angelo Compagnucci <angelo@amarulasolutions.com>, buildroot@buildroot.org
References: <20220527103335.1968203-1-angelo@amarulasolutions.com>
 <20220527103335.1968203-3-angelo@amarulasolutions.com>
From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
In-Reply-To: <20220527103335.1968203-3-angelo@amarulasolutions.com>
X-Provags-ID: V03:K1:p1dQ+WFH4G/XhhXS2/ZufIm3YrwS7qs9ZMhzr29P16l79KtZm/2
 Oq68FkQ5qnVJMwwZPr0sC4k+iieQ3sJzx1NZ/YZ9Ukki6KhuGsKQe6ewpziGZaJkpxRxD8q
 COfiH0Nx7bPh17j4ZdbjS4lUR0zEL/UgyaCUaerWcRwq8pGWjVrrolbm8nCwFv2zJULkBG0
 dNXv4Ot5MdMhtBauSeeOg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0jfzSoJLxQU=:ucI5jJU7aXC9+qAZxueiYx
 g7NRstlg5bi+AS7yXF+UJQd0awS8KgIWIzlIslGSWOF3WSx0A8EWTqSoFy476+8NsHBjLG3Yr
 vwluIeznalr+NzepvAe5aM+KhsGT6hUN6E+kMHmUZhA9Bs6L1oy7xHte4NnOE180KP0m9qxi7
 wiUSUO0qfDlSDn2M9yQDQJ8TYVa49QaxWldNI3tdV887e0qtU4olzO9ySl1n6fPiFyPrRc/W8
 tILIzAr9cL5LQ85Co0p+pya0zNqbTGNK0lCQ12X2kPdq0Q/jEcXaWC+1gje3yNuzn5mSlra74
 nQO+If1tpAwPGkwHpAQjOOFmCl5sCRO3pg45oyj7RpHqIUlVOpCVaAl+0QqpstQRLaCZ8FhAn
 Vzx9IK5l/ym7oO76GFc3rhIeT09S72m4jMI4sTA8Hsqe99ghqRsC5VvVrQAQwmr8mO0CaxIkT
 vrJ0xBMO+AjhCzjoCL8a7LJiH5JPoFrp3bG+gdIR33jRDc4btidHnRUoK8GITJ4wqkmUTZ1+/
 geTfUVQEDl7briv7x+yVQ70zocwQpXJX9pZv6TkXWDDcPomYTsww/243KU1mURtUghtLZhCPC
 OdJaO20GHL7vTAwlsrOTP0UQTwTSR1UF1OJc1Z07aVSnY6H5WYIjKl4dRDlcTAeAZmkQ/sm3F
 ycaq4RbGk3UBhWtk8GttDB+Cm42nRm4BG93cSBoJgsB6RA68At0WIEZvKtdTRTLtllE7jcDzB
 02I6F+0UDhv/vCtXo1bPbIhTd1IafLDqJsrjeRrTz6jkyoWZ/Iop2JibS05pJJPn967xbLW4Y
 SY0ntJ7
Subject: Re: [Buildroot] [PATCH 2/4] package/wpa_supplicant: adding ifupdown
 support
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

Hello,

On 27/05/2022 12:33, Angelo Compagnucci wrote:
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
> The provided file is a simplified version based on the one available
> on debian.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>   package/wpa_supplicant/ifupdown.sh       | 71 ++++++++++++++++++++++++
>   package/wpa_supplicant/wpa_supplicant.mk | 10 ++++
>   2 files changed, 81 insertions(+)
>   create mode 100755 package/wpa_supplicant/ifupdown.sh
> 
> diff --git a/package/wpa_supplicant/ifupdown.sh b/package/wpa_supplicant/ifupdown.sh
> new file mode 100755
> index 0000000000..8eecf73436
> --- /dev/null
> +++ b/package/wpa_supplicant/ifupdown.sh
> @@ -0,0 +1,71 @@
> +#!/bin/sh
> +
> +# This file is executed by ifupdown in pre-up, post-up, pre-down and
> +# post-down phases of network interface configuration.

It is also executed for every interface regardless of if wpa-* options are 
specified or not. ifupdown works by turning all options into IF_* environment 
variables and running all hooks with it.

Right now this hook starts wpa_supplicant on every non-lo interface.
It probably needs a if [ -z "$IF_WPA_CONF" ]; then exit 0; fi somewhere.
The earliest the better.

> +
> +WPA_SUP_BIN="/usr/sbin/wpa_supplicant"
> +
> +if [ -n "$IF_WPA_MAINT_DEBUG" ]; then
> +	set -x
> +fi

It is really necessary to support the "wpa-maint-debug yes" 
/etc/network/interfaces option ?  This script is simple enough, unlike Debian's.

> +
> +# quit if we're called for the loopback
> +if [ "$IFACE" = lo ]; then
> +	exit 0
> +fi

Special-casing lo can be removed by filtering on -z IF_WPA_CONF.  Nobody is 
going to specify a wpa-conf on the lo interface, and if they do, they should 
assume the consequences.

> +
> +# allow wpa_supplicant interface to be specified via wpa-iface
> +# useful for starting wpa_supplicant on one interface of a bridge
> +if [ -n "$IF_WPA_IFACE" ]; then
> +	WPA_IFACE="$IF_WPA_IFACE"
> +else
> +	WPA_IFACE="$IFACE"
> +fi
> +
> +WPA_SUP_PIDFILE="/run/wpa_supplicant.${WPA_IFACE}.pid"
> +
> +# quit if executables are not installed
> +if [ ! -x "$WPA_SUP_BIN" ]; then
> +	exit 0
> +fi
> +
> +do_start () {
> +	if [ -n "$IF_WPA_CONF" ] && [ "$IF_WPA_CONF" != "managed" ]; then
> +		if [ ! -s "$IF_WPA_CONF" ]; then
> +			echo "cannot read contents of $IF_WPA_CONF"
> +			exit 1
> +		fi
> +		WPA_SUP_CONF_CTRL_DIR=$(sed -n -e 's/[[:space:]]*#.*//g' -e 's/[[:space:]]\+.*$//g' \
> +			-e 's/^ctrl_interface=\(DIR=\)\?\(.*\)/\2/p' "$IF_WPA_CONF")
> +		if [ -n "$WPA_SUP_CONF_CTRL_DIR" ]; then
> +			WPA_SUP_CONF="-c $IF_WPA_CONF -C $WPA_SUP_CONF_CTRL_DI > +		else
> +			WPA_SUP_CONF="-c $IF_WPA_CONF"
> +		fi
> +	else
> +		# specify the default ctrl_interface
> +		WPA_SUP_CONF="-C $WPA_CTRL_DIR"
> +	fi
> +}

Debian's ifupdown script need wpa_supplicant to have a ctrl_interface because it 
want to use wpa_cli for all the other wpa-* options, and wpa_cli works by 
connecting to a ctrl_interface.

This script does not use wpa_cli so all the ctrl_interface handling can be 
removed, unless you want to implement the other options later.

By the way, "wpa-conf "managed" is mostly used with the other wpa-* options to 
configure the ssid/passphrase within /etc/network/interfaces, which is something 
your script does not support, so you can remove the first 'if'.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
