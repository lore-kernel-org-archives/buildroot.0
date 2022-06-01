Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8729EC43334
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 19:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1335860D72;
	Wed,  1 Jun 2022 19:26:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1QWSSeeX8ieI; Wed,  1 Jun 2022 19:26:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1779B60C1A;
	Wed,  1 Jun 2022 19:26:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 62C761BF333
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 19:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F79A60C1A
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 19:25:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tokF91YQz_-p for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 19:25:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 26AC3606C6
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 19:25:56 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EA33D20003;
 Wed,  1 Jun 2022 19:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654111554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MUBeZkdFbsyJuMbwzjXpIcXzE3lb9qz3x545j6Hc264=;
 b=N275gRNO6sSBtSAmdT12pnhDfo7rttaCF327uhdyoRG1zfV7ACGZBjq378MFAkIDTOCBrW
 HCCjE3gIH9DN1nQKMu4i0Qst22pXcngG0F//q/7l5dEDNwkbMfcAoDz/9rU3+oOupq4r4T
 FsTeqdnfFjyotTDpMeA74gsQHAWen973f+LwakhIzUC7YAIFiVTrQ9e2v2tPj/CdBu71BL
 Qan5J16UmVC9MpenK+pOVwGelVRGXo1Upz73uJisCXQFs9u/Jeb0DTI0pyC+7p7LaTbiOP
 praZq3IpnfJQaq8IpCs2li4+5QbBwhOx/xEWu14UZCn5nFFf4/VdBC8Nuy2CNg==
Date: Wed, 1 Jun 2022 21:25:52 +0200
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20220601212552.479542be@windsurf>
In-Reply-To: <20220527103335.1968203-3-angelo@amarulasolutions.com>
References: <20220527103335.1968203-1-angelo@amarulasolutions.com>
 <20220527103335.1968203-3-angelo@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: jagan@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Fri, 27 May 2022 12:33:33 +0200
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> Actually, configuring a wifi interface as per "interfaces" man:
> 
> auto wlan0
> iface wlan0 inet dhcp
> wpa-conf /etc/wpa_supplicant.conf

Do you have a link to an interfaces manpage that documents wpa-conf?

Is this supported by the Busybox ifupdown?

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
> +
> +WPA_SUP_BIN="/usr/sbin/wpa_supplicant"
> +
> +if [ -n "$IF_WPA_MAINT_DEBUG" ]; then
> +	set -x
> +fi

Where is IF_WPA_MAINT_DEBUG supposed to be defined?

> +# allow wpa_supplicant interface to be specified via wpa-iface
> +# useful for starting wpa_supplicant on one interface of a bridge
> +if [ -n "$IF_WPA_IFACE" ]; then
> +	WPA_IFACE="$IF_WPA_IFACE"
> +else
> +	WPA_IFACE="$IFACE"
> +fi

I'm curious to understand how wpa-iface ends up in IP_WPA_IFACE. I
guess I'm missing a piece of the puzzla.

> +WPA_SUP_PIDFILE="/run/wpa_supplicant.${WPA_IFACE}.pid"
> +
> +# quit if executables are not installed
> +if [ ! -x "$WPA_SUP_BIN" ]; then
> +	exit 0
> +fi

This can be removed in the context of Buildroot. We tend to not check
for the installation of executables from the same package, as it's
quite useless.

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
> +			WPA_SUP_CONF="-c $IF_WPA_CONF -C $WPA_SUP_CONF_CTRL_DIR"

The manpage of wpa_supplicant says:

       -C ctrl_interface
              Path to ctrl_interface socket (Per interface. Only used if -c is not).

so passing -C when -c is passed does not make sense. Or am I missing
something?

> +		else
> +			WPA_SUP_CONF="-c $IF_WPA_CONF"
> +		fi
> +	else
> +		# specify the default ctrl_interface
> +		WPA_SUP_CONF="-C $WPA_CTRL_DIR"

How is WPA_CTRL_DIR defined?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
