Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94337C36008
	for <buildroot@archiver.kernel.org>; Wed, 26 Mar 2025 15:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EE8D60F34;
	Wed, 26 Mar 2025 15:34:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ewFqqgBiTj_1; Wed, 26 Mar 2025 15:34:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BE5B60FFF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BE5B60FFF;
	Wed, 26 Mar 2025 15:34:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AE82C0
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 15:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 864CB80C71
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 15:34:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ilzqTUlqqNTr for <buildroot@buildroot.org>;
 Wed, 26 Mar 2025 15:34:20 +0000 (UTC)
X-Greylist: delayed 914 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 26 Mar 2025 15:34:18 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 27F0B80529
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27F0B80529
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=117.135.210.4;
 helo=m16.mail.163.com; envelope-from=uuidxx@163.com; receiver=<UNKNOWN> 
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27F0B80529
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 15:34:18 +0000 (UTC)
Received: from OSZPR01MB7868.jpnprd01.prod.outlook.com (unknown [])
 by gzsmtp2 (Coremail) with SMTP id PSgvCgD39mXcGuRn7lSgAQ--.17005S2;
 Wed, 26 Mar 2025 23:18:54 +0800 (CST)
From: "uuidxx@163.com" <uuidxx@163.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>, Thomas Petazzoni
 via buildroot <buildroot@buildroot.org>
CC: Fiona Klute <fiona.klute@gmx.de>, "Alvaro G . M" <alvaro.gamez@hazent.com>
Thread-Topic: Re: [Buildroot] [PATCH 2/2] package/busybox: Add ifplugd init
 script
Thread-Index: AQHbnl9G+SMXM/ddpkmCAei3gVItvg==
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Wed, 26 Mar 2025 15:18:50 +0000
Message-ID: <OSZPR01MB786841EC8FE7B336554A1654FDA62@OSZPR01MB7868.jpnprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
msip_labels: 
MIME-Version: 1.0
X-CM-TRANSID: PSgvCgD39mXcGuRn7lSgAQ--.17005S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCF43tFW7AFWrZF45KryDJrb_yoWrAFWkp3
 yrWr15Kr1kWFyfJ3s3Cr1xAF98AayDtr4UurZxt34jyryqk34fGr12kry5JF17AFyfJ3W2
 qan5urW7u3yDWFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U3WrZUUUUU=
X-Originating-IP: [52.98.120.205]
X-CM-SenderInfo: hxxlv5r06rljoofrz/1tbiXxAc22fkFCq9twAAs-
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:Subject:Date:Message-ID:Content-Type:
 MIME-Version; bh=CAU9ZWlmZUvHJSVHh1/bHZtvMG95sshHHy+y4Mzq+w0=;
 b=pFEJhU3zD2f+ZlaIfSiCOyrettCwyxitZVEKnWUBgfDFeLoIwLof3xIh9ivxlV
 CjoFJsnXxQpquZ5DM9GrbUttOwJI2IXZ0nomYPtTCiXP6hLPwIRAJ5ykbiARN631
 JNBSfR2mv7YCnlgdNYye59cBiElI9VOe483wPOhrnxrhk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=pFEJhU3z
Subject: Re: [Buildroot] [PATCH 2/2] package/busybox: Add ifplugd init script
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello, Fiona and Thomas.

I'm currently using the 2025.02 branch. This script does not start ifplugd =
(Busybox's ifplugd) properly in busybox 1.37.0.

For now, I've changed this part of the code:

>	start-stop-daemon --start --background --make-pidfile \
>		--pidfile "$PIDFILE" --exec "/usr/sbin/$DAEMON" \
>		-- -n $IFPLUGD_ARGS

to this:

>	start-stop-daemon --start --background --exec "/usr/sbin/$DAEMON" \
>		-- -n $IFPLUGD_ARGS

and it starts ifplugd properly. I checked the /var/run/ directory and the f=
ile ifplugd.eth0.pid exists.

________________________________________
From:=A0Thomas Petazzoni via buildroot
Sent:
To:=A0Fiona Klute via buildroot
Cc:=A0Fiona Klute; Alvaro G . M
Subject:=A0Re: Re: [Buildroot] [PATCH 2/2] package/busybox: Add ifplugd ini=
t script


Hello Fiona,

On Wed,  5 Jun 2024 13:13:47 +0200
Fiona Klute via buildroot  wrote:

> The init script will be installed only if no other package provides
> ifplugd (currently that could be package/ifplugd). Users can configure
> the interface(s) which ifplugd should watch either using
> /etc/default/ifplugd (for one interface) or using per-interface
> symlinks to the script in /etc/init.d (for any number of
> interfaces). The action script that ifplugd runs when a link change is
> detected must be supplied separately.
> =

> Signed-off-by: Fiona Klute =


I applied your patch, with some changes. See below.

> ---
> make check-package complains about "Incorrect PIDFILE value" in the
> script. To support running multiple instances I need to support
> multiple (per-interface) PID files. Is there a better way to handle
> that, or explicitly silence the check?

Silence the check. See below :-)

> =

>  package/busybox/S41ifplugd | 84 ++++++++++++++++++++++++++++++++++++++
>  package/busybox/busybox.mk | 13 ++++++
>  2 files changed, 97 insertions(+)
>  create mode 100644 package/busybox/S41ifplugd
> =

> diff --git a/package/busybox/S41ifplugd b/package/busybox/S41ifplugd
> new file mode 100644
> index 0000000000..4d3b56ab6d
> --- /dev/null
> +++ b/package/busybox/S41ifplugd
> @@ -0,0 +1,84 @@
> +#!/bin/sh
> +
> +DAEMON=3D"ifplugd"
> +
> +# Each ifplugd instance handles only one interface, so this script is
> +# designed to be symlinked per interface. For each interface create a
> +# symlink with .IFACE appended to the name. E.g. to launch ifplugd for
> +# eth1 create a symlink from /etc/init.d/S41ifplugd.eth1 to this
> +# script. DEFAULT_IFACE sets the interface the non-symlink script will
> +# use, set it to empty in /etc/default/ifplugd to disable the default
> +# instance and use symlinked instances only.
> +DEFAULT_IFACE=3D"eth0"
> +# If your action script is not in the default location
> +# /etc/ifplugd/ifplugd.action, use the "-r" option to set the
> +# location.
> +IFPLUGD_ARGS=3D"-M"
> +
> +# shellcheck source=3D/dev/null
> +[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
> +
> +NAME_IFACE=3D"$(basename "$0" | cut -s -d. -f2)"
> +if [ -n "$NAME_IFACE" ]; then
> +	IFACE=3D"${NAME_IFACE}"
> +elif [ -n "$DEFAULT_IFACE" ]; then
> +	IFACE=3D"${DEFAULT_IFACE}"
> +else
> +	# no interface configured
> +	exit 0
> +fi
> +
> +PIDFILE=3D"/var/run/${DAEMON}.${IFACE}.pid"

I've added:

+# check-package disable Variables

above this line to ignore the PIDFILE warning.

> +# BusyBox' ifplugd does not create a pidfile, so pass "-n" in the
> +# command line and use "-m" to instruct start-stop-daemon to create
> +# one.
> +start() {
> +	printf 'Starting %s for %s: ' "$DAEMON" "$IFACE"
> +	# shellcheck disable=3DSC2086 # we need the word splitting
> +	start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
> +		-- -n $IFPLUGD_ARGS

And I fixed the script to use the long options.

> +	while true; do
> +		pid=3D"$( cat "${PIDFILE}" 2>/dev/null || true )"
> +		{ [ -n "${pid}" ] && [ -d "/proc/${pid}" ]; } || break
> +		sleep 0.1
> +	done

And the start-stop-daemon loop.

Thanks!

Thomas
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
