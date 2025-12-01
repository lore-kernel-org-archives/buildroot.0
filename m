Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A110ED116F3
	for <buildroot@archiver.kernel.org>; Mon,  1 Dec 2025 16:26:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5773C408D0;
	Mon,  1 Dec 2025 16:26:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wrP11ksveh2c; Mon,  1 Dec 2025 16:26:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD38740851
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD38740851;
	Mon,  1 Dec 2025 16:26:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DA2E61BD
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 16:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C037E4032C
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 16:26:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PNOMv7FNd3K8 for <buildroot@buildroot.org>;
 Mon,  1 Dec 2025 16:26:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0F0DF40214
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F0DF40214
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0F0DF40214
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 16:26:49 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.104.204]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MJVDW-1vfRjL30gq-00Rs6T; Mon, 01
 Dec 2025 17:26:47 +0100
Message-ID: <14e7bdf0-8209-4daa-a8ba-b1a7665c9379@gmx.de>
Date: Mon, 1 Dec 2025 17:26:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bastien Curutchet <bastien.curutchet@bootlin.com>, buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251201-rasdaemon-v3-0-8ad394bdc372@bootlin.com>
 <20251201-rasdaemon-v3-1-8ad394bdc372@bootlin.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 xsFNBFrLsicBEADA7Px5KipL9zM7AVkZ6/U4QaWQyxhqim6MX88TxZ6KnqFiTSmevecEWbls
 ppqPES8FiSl+M00Xe5icsLsi4mkBujgbuSDiugjNyqeOH5iqtg69xTd/r5DRMqt0K93GzmIj
 7ipWA+fomAMyX9FK3cHLBgoSLeb+Qj28W1cH94NGmpKtBxCkKfT+mjWvYUEwVdviMymdCAJj
 Iabr/QJ3KVZ7UPWr29IJ9Dv+SwW7VRjhXVQ5IwSBMDaTnzDOUILTxnHptB9ojn7t6bFhub9w
 xWXJQCsNkp+nUDESRwBeNLm4G5D3NFYVTg4qOQYLI/k/H1N3NEgaDuZ81NfhQJTIFVx+h0eT
 pjuQ4vATShJWea6N7ilLlyw7K81uuQoFB6VcG5hlAQWMejuHI4UBb+35r7fIFsy95ZwjxKqE
 QVS8P7lBKoihXpjcxRZiynx/Gm2nXm9ZmY3fG0fuLp9PQK9SpM9gQr/nbqguBoRoiBzONM9H
 pnxibwqgskVKzunZOXZeqyPNTC63wYcQXhidWxB9s+pBHP9FR+qht//8ivI29aTukrj3WWSU
 Q2S9ejpSyELLhPT9/gbeDzP0dYdSBiQjfd5AYHcMYQ0fSG9Tb1GyMsvh4OhTY7QwDz+1zT3x
 EzB0I1wpKu6m20C7nriWnJTCwXE6XMX7xViv6h8ev+uUHLoMEwARAQABzSBGaW9uYSBLbHV0
 ZSA8ZmlvbmEua2x1dGVAZ214LmRlPsLBlAQTAQgAPgIbIwULCQgHAwUVCgkICwUWAgMBAAIe
 AQIXgBYhBOTTE4/i2fL6gVL9ke6nJs4hI1pYBQJn9S5IBQkQ6+MhAAoJEO6nJs4hI1pYvz0P
 /34nPCo/g0WbeJB6N75/1EkM9gDD1+lT4GdFEYYnCzslSxrIsL3kWuzG2kpqrErU8i7Ao/B2
 iE3J9NinRe613xlVUy2CU1VKaekm3YTkcfR7u8G/STNEQ42S46+3JRBMlLg1YldRsfVXq8tc
 jdwo193h4zrEeEmUDm8n43BPBhhwNRf+igtI8cNVyn9nBt6BrDnSswg497lrRjGjoP2zTkLT
 Q/Sb/6rCHoyFAxVcicA7n2xvaW0Pg0rTOrtA9mVku5J3zqyS4ABtoUwPmyoTLa7vpZdC33hy
 g7+srYNdo9a1i9OKF+CK9q/4auf3bMMeJB472Q5N8yuthM+Qx8ICySElyVDYSbbQIle/h/L7
 XYgm4oE1CxwiVCi8/Y/GOqhHt+RHLRGG1Ic+btNTiW+R+4W4yGUxL7qLwepIMY9L/0UcdnUa
 OBJk4waEX2mgOTmyjKR0FAGtaSH1ebz2UbY6pz5H9tZ4BIX7ZcQN0fLZLoi/SbbF+WJgT4cd
 8BooqbaNRoglaNCtTsJ7oyDesL9l0pzQb/ni1HGAXKW3WBq49r7uPOsDBP8ygyoAOYw4b/TX
 qUjJYpp9HcoQHv0sybSbXCFUMnL1E5WUhy8bBjA9fNtU43Fv3OR2n5/5xSn6o33XVMYMtkrN
 0AvEfAOGGOMJWktEYA7rxy0TQiy0ttUq0eQszsFNBGQ1Nr0BEADTlcWyLC5GoRfQoYsgyPgO
 Z4ANz31xoQf4IU4i24b9oC7BBFDE+WzfsK5hNUqLADeSJo5cdTCXw5Vw3eSSBSoDP0Q9OUdi
 PNEbbblZ/tSaLadCm4pyh1e+/lHI4j2TjKmIO4vw0K59Kmyv44mW38KJkLmGuZDg5fHQrA9G
 4oZLnBUBhBQkPQvcbwImzWWuyGA+jDEoE2ncmpWnMHoc4Lzpn1zxGNQlDVRUNnRCwkeclm55
 Dz4juffDWqWcC2NrY5KkjZ1+UtPjWMzRKlmItYlHF1vMqdWAskA6QOJNE//8TGsBGAPrwD7G
 cv4RIesk3Vl2IClyZWgJ67pOKbLhu/jz5x6wshFhB0yleOp94I/MY8OmbgdyVpnO7F5vqzb1
 LRmfSPHu0D8zwDQyg3WhUHVaKQ54TOmZ0Sjl0cTJRZMyOmwRZUEawel6ITgO+QQS147IE7uh
 Wa6IdWKNQ+LGLocAlTAi5VpMv+ne15JUsMQrHTd03OySOqtEstZz2FQV5jSS1JHivAmfH0xG
 fwxY6aWLK2PIFgyQkdwWJHIaacj0Vg6Kc1/IWIrM0m3yKQLJEaL5WsCv7BRfEtd5SEkl9wDI
 pExHHdTplCI9qoCmiQPYaZM5uPuirA5taUCJEmW9moVszl6nCdBesG2rgH5mvgPCMAwsPOz9
 7n+uBiMk0ZSyTQARAQABwsF8BBgBCAAmAhsMFiEE5NMTj+LZ8vqBUv2R7qcmziEjWlgFAmf1
 LrEFCQeCXvQACgkQ7qcmziEjWljtgBAAnsoRDd6TlyntiKS8aJEPnFjcFX/LqujnCT4/eIn1
 bpbIjNbGH9Toz63H5JkqqXWcX1TKmlZGHZT2xU/fKzjcyTJzji9JP+z1gQl4jNESQeqO1qEO
 kqYe6/hZ5v/yCjpv2Y1sqBnPXKcm21fkyzUwYKPuX9O1Sy1VmP1rMzIRQHXnNapJJWn0wJAW
 079YqdX1NzESJyj4stoLxIcDMkIEvOy3uhco8Bm8wS88MquJoR0KlyBR30QZy9KoxmTiWKws
 Mn6sy4aX9nac3W0pD+EyR+j/J9SWSvOENAmn4Km+ONxz93+oVLWb+KHtQQloxOsadO0wwiaZ
 xUT7vJcxSgjrHugSs+mOLznX/D8PfG/+tYLFlddphcOGldzH0rxKfs53BplAUe+LEZY1AU8p
 0WDK2h097ZQ0eZiVZlvAKSjwsjow2tpqwamtfNKrFg/GFRbNZcoQuYsf3vBW1CiZ5JQ6Vh2A
 bCn+vBDsJwD9Hcht1eVRxnIq745SQ0naL48Q3HGpKdXZpJoBQZ8bSAFhRSb3m+P4PE272rLY
 6FCkqS+UeX7RBpPkkIDoL7WS9HdvDHuQ751D56WkTnIpoF+sgW6tOEcfgFrYf3rVvh6G3B8S
 FPSOJuHYnwzMFrDNxQQKb0uS/j1s2dnlS55MouCvd5pShM5iRFzE7k3CMeS4NkhFim0=
In-Reply-To: <20251201-rasdaemon-v3-1-8ad394bdc372@bootlin.com>
X-Provags-ID: V03:K1:N3U9fPESrsB+Fax+YtO9Lia6jMpTK73+/44YstuWMZzU73jDNP4
 MoyIZQB6iKHLTNv5S/CH5YLNRUhX8IRhZ11OeC+xu6/4ZEGp8s7RiRnIWo527lzOvZDVe07
 RQjGJepQfInMoS8lIW8R11nzY6TzAkprVwdCuuFDxQRLRPKI2gs56KpP2Met05qBOk1FoSQ
 XucL40RbPXJTVwaajlVRQ==
UI-OutboundReport: notjunk:1;M01:P0:7WEYIU6G2WM=;nQ8OJxem1gDEH3ELU9jDDmPsV0f
 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
 PRDwOmQyXbfkdbfewL4SHIni2cMAj
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1764606408; x=1765211208; i=fiona.klute@gmx.de;
 bh=UxVjma566chH+IJHQ9nFRetVv2fOzQbXxU5Lsq5tr04=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=LzpMOKeOBv9JA2EATOqiWx7bWAElfJrQsXqmbkDCfr9rrlCQ+aIm9MtK58YfAVMa
 +pio//tj9Gt4hLclHmuLfuqKfDCAq0KB8qNNJ7P2+O9SOWU2YH6+lEpSuBFpn8FAb
 zS8QmaeYoiVEPCWcuYCJO4pKeLWAmIEEfBdwLkfwTNe70AwpsMKa7Ox5R7sigxzq5
 zi7yw2gLPKh6lt/cnenAmu8+gCSC24d2qQP4+x0RgQsqV60mQlVLLO1ZgeP8sZqsf
 LGHuRAhvJCb67lp1Or0CM05VlworxTC6GempUyVwQb235Thoj/ywohAyCObXeAjau
 3AyeqXNxIOWhF3ZZfw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=LzpMOKeO
Subject: Re: [Buildroot] [PATCH v3 1/2] package/rasdaemon: Add rasdaemon
 package
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 01.12.25 um 15:08 schrieb Bastien Curutchet:
> Rasdaemon is a tool that aims to replace the edac-tool and provide a way
> to collect all hardware error events reported by the Linux kernel in a
> common framework.
> 
> Add a new package to support rasdaemon in the 'Hardware handling'
> section. It depends on libtraceevents to detect the ftrace events
> generated by the kernel and on sqlite to store these events.
> 
> Support for the PCIe AER events is optionnal and implies a dependency on
> pciutils so also add a dedicated 'sub-option' to enable it.
> 
> Add a SYSV init script to start / stop the daemon
> 
> Add myself to the DEVELOPERS file.
> 
> Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>

Reviewed-by: Fiona Klute <fiona.klute@gmx.de> (SysV init script)

Best regards,
Fiona

> ---
>   DEVELOPERS                       |  3 ++
>   package/Config.in                |  1 +
>   package/rasdaemon/Config.in      | 25 ++++++++++++++++
>   package/rasdaemon/S95rasdaemon   | 63 ++++++++++++++++++++++++++++++++++++++++
>   package/rasdaemon/rasdaemon.hash |  3 ++
>   package/rasdaemon/rasdaemon.mk   | 33 +++++++++++++++++++++
>   6 files changed, 128 insertions(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index db001d6bb0707a5877c0849fa85fa736377e60dd..b1ead6d26c4e8ff160bcc7ed85b0945ac5e551dc 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -341,6 +341,9 @@ F:	package/tcpdump/
>   F:	package/ti-uim/
>   F:	package/uhubctl/
>   
> +N:	Bastien Curutchet <bastien.curutchet@bootlin.com>
> +F:	package/rasdaemon/
> +
>   N:	Baxiche Su <baxiche@gmail.com>
>   F:	package/qt6/qt6multimedia/
>   
> diff --git a/package/Config.in b/package/Config.in
> index 12f327cb273526781d931b834e24d0df5024e80e..1a93cec2fa22e3a6e70acbf799b32b00d5e8b5de 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -584,6 +584,7 @@ endmenu
>   	source "package/pru-software-support/Config.in"
>   	source "package/pulseview/Config.in"
>   	source "package/qoriq-cadence-dp-firmware/Config.in"
> +	source "package/rasdaemon/Config.in"
>   	source "package/raspi-gpio/Config.in"
>   	source "package/rdma-core/Config.in"
>   	source "package/read-edid/Config.in"
> diff --git a/package/rasdaemon/Config.in b/package/rasdaemon/Config.in
> new file mode 100644
> index 0000000000000000000000000000000000000000..68cef3a313bf2b82a8306ed5e0ec581cd618531d
> --- /dev/null
> +++ b/package/rasdaemon/Config.in
> @@ -0,0 +1,25 @@
> +config BR2_PACKAGE_RASDAEMON
> +	bool "rasdaemon"
> +	depends on !BR2_STATIC_LIBS # libtraceevent
> +	select BR2_PACKAGE_LIBTRACEEVENT
> +	select BR2_PACKAGE_SQLITE
> +	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
> +	help
> +	  rasdaemon is a tool that collects all hardware error events
> +	  reported by the Linux Kernel from several sources (EDAC, MCE
> +	  PCI, ...) into one common framework.
> +	  See https://github.com/mchehab/rasdaemon for details.
> +
> +if BR2_PACKAGE_RASDAEMON
> +
> +config BR2_PACKAGE_RASDAEMON_AER
> +	bool "Enable AER support"
> +	select BR2_PACKAGE_PCIUTILS
> +	help
> +	  Enable handling of AER (Advanced Error Reporting) events on
> +	  PCIe
> +
> +endif
> +
> +comment "rasdaemon needs a toolchain w/ dynamic library"
> +	depends on BR2_STATIC_LIBS
> diff --git a/package/rasdaemon/S95rasdaemon b/package/rasdaemon/S95rasdaemon
> new file mode 100644
> index 0000000000000000000000000000000000000000..390ff9c9029ba9122217f13eb88bac7715c1c05f
> --- /dev/null
> +++ b/package/rasdaemon/S95rasdaemon
> @@ -0,0 +1,63 @@
> +#!/bin/sh
> +#
> +# S95rasdaemon	Starts Rasdaemon.
> +#
> +# shellcheck disable=SC2317 # functions are called via variable
> +
> +DAEMON="rasdaemon"
> +PIDFILE="/var/run/$DAEMON.pid"
> +
> +start() {
> +	printf "Starting %s: " "$DAEMON"
> +
> +	if ! grep -q debugfs /proc/mounts ; then
> +		echo "FAIL : debugfs is missing"
> +		return 1
> +	fi
> +
> +	start-stop-daemon --start --pidfile "$PIDFILE" --make-pidfile \
> +		--background --exec "/usr/sbin/$DAEMON" -- -f
> +	status=$?
> +	if [ "$status" -eq 0 ]; then
> +		echo "OK"
> +	else
> +		echo "FAIL"
> +	fi
> +	return "$status"
> +}
> +
> +stop() {
> +	printf "Stopping %s: " "$DAEMON"
> +	start-stop-daemon --stop --pidfile "$PIDFILE" --exec "/usr/sbin/$DAEMON"
> +	status=$?
> +	if [ "$status" -eq 0 ]; then
> +		echo "OK"
> +	else
> +		echo "FAIL"
> +		return "$status"
> +	fi
> +	while start-stop-daemon --stop --test --quiet --pidfile "$PIDFILE" \
> +		--exec "/sbin/$DAEMON"; do
> +		sleep 0.1
> +	done
> +	rm -f "$PIDFILE"
> +	return "$status"
> +}
> +
> +restart() {
> +	stop
> +	start
> +}
> +
> +reload() {
> +	restart
> +}
> +
> +case "$1" in
> +	start|stop|reload|restart)
> +		"$1"
> +		;;
> +	*)
> +		echo "Usage: $0 {start|stop|reload|restart}"
> +		exit 1
> +esac
> diff --git a/package/rasdaemon/rasdaemon.hash b/package/rasdaemon/rasdaemon.hash
> new file mode 100644
> index 0000000000000000000000000000000000000000..e1b600a4893bef2f58c86f6d742fb7cbcb480fc8
> --- /dev/null
> +++ b/package/rasdaemon/rasdaemon.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  7e12459f9477036491ac2b1e4c07cc3e8efea6dcd30525a263ab1f83910b773a  rasdaemon-0.8.4.tar.gz
> +sha256  39bc367cd7cd291d217447632b28a74be414a52b142b1875ac8789184aeca7b2  COPYING
> diff --git a/package/rasdaemon/rasdaemon.mk b/package/rasdaemon/rasdaemon.mk
> new file mode 100644
> index 0000000000000000000000000000000000000000..50ac97a37dcbe63443bddca505ebc7c929116e53
> --- /dev/null
> +++ b/package/rasdaemon/rasdaemon.mk
> @@ -0,0 +1,33 @@
> +################################################################################
> +#
> +# rasdaemon
> +#
> +################################################################################
> +
> +RASDAEMON_VERSION = 0.8.4
> +RASDAEMON_SITE = $(call github,mchehab,rasdaemon,v$(RASDAEMON_VERSION))
> +RASDAEMON_LICENSE = GPL-2.0+
> +RASDAEMON_LICENSE_FILES = COPYING
> +RASDAEMON_AUTORECONF = YES
> +
> +RASDAEMON_DEPENDENCIES = libtraceevent sqlite
> +# rasdaemon uses argp.h which is not provided by uclibc or musl by default.
> +# Use the argp-standalone package to provide this.
> +ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
> +RASDAEMON_DEPENDENCIES += argp-standalone
> +RASDAEMON_CONF_ENV += LIBS="-largp"
> +endif
> +
> +ifeq ($(BR2_PACKAGE_RASDAEMON_AER),y)
> +RASDAEMON_DEPENDENCIES += pciutils
> +RASDAEMON_CONF_OPTS += --enable-aer
> +else
> +RASDAEMON_CONF_OPTS += --disable-aer
> +endif
> +
> +define RASDAEMON_INSTALL_INIT_SYSV
> +	$(INSTALL) -m 0755 -D package/rasdaemon/S95rasdaemon \
> +		$(TARGET_DIR)/etc/init.d/S95rasdaemon
> +endef
> +
> +$(eval $(autotools-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
