Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B2DCFD2F6
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 20:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B7CD616E1;
	Thu, 27 Nov 2025 20:19:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r394urMJJedX; Thu, 27 Nov 2025 20:19:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38A3F60DA6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38A3F60DA6;
	Thu, 27 Nov 2025 20:19:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 92A562A9
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:19:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 848BD4142C
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:19:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tbRU0KEFd3Jr for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 20:19:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B080141425
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B080141425
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B080141425
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:19:14 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.127.152]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MUXtS-1vXY9x3Urg-00T2lG; Thu, 27
 Nov 2025 21:19:05 +0100
Message-ID: <d55497b0-e169-4205-ab93-f6a2b0b5f868@gmx.de>
Date: Thu, 27 Nov 2025 21:19:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bastien Curutchet <bastien.curutchet@bootlin.com>, buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251127-rasdaemon-v2-0-c57284751172@bootlin.com>
 <20251127-rasdaemon-v2-1-c57284751172@bootlin.com>
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
In-Reply-To: <20251127-rasdaemon-v2-1-c57284751172@bootlin.com>
X-Provags-ID: V03:K1:GXjpVScph7UT7gYZhdl+FN2KUiwfdHsuUXUJhszaA+o4MS6vjjg
 zNiolXCHNhYAOu5ZcJrtKKWT0Cmww4er9Y6yQRRafwqZcXbHdu26GHGJ6K6ERygG+ls/2hw
 M5qeeGZ6u/jRAwsRTgvh61ItyzQPqlwavD4Fi1Y6Ps87N81eu3SRySCZGMWIcDBBfeyGQvc
 I78103hoMC9ZD8ozKHpgA==
UI-OutboundReport: notjunk:1;M01:P0:bwpWo1mtegg=;P4Cwov73jY5kRok7fIrnUD8N07W
 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
 8fgEKGv0itje2ItsOhp/cPwb6N/9F
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1764274746; x=1764879546; i=fiona.klute@gmx.de;
 bh=4pABAa44k288hxHeVCSe+CLrXH+0y7hezBarq7dG1g0=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=uBiqFC8e3AJog13yEDSNjQHrcn0uAYuoTTinm3Lvrr0UgciLOyFZGuSem1I4li8i
 Oa0EZLK46KVol8JjmsuOprq+9uzSDMbp3xVgHOUZKVx6xCRjsAUo1Nuw/e+p6seRs
 +wi2ENFbM/65H0XwJ0FBFpwx5X32pspDHNGPZSTrM7j8GkE4MB+tECBZTP9lP1Pae
 ofwrzWQmx82K1uZVUDy5iNXuCsajMhwbbVLynpnP2yaGGDSDewwsFy47Lwx2ZyxDE
 KqcN4nymAEqPLTOT50VlY9hz+2/qw43Uo2fDmzVHFlFwt9RdA26zSS/LCVTTE4ayT
 v2PiQ7VoYJT6km3tyA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=uBiqFC8e
Subject: Re: [Buildroot] [PATCH v2 1/2] package/rasdaemon: Add rasdaemon
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

Hi Bastien!

Am 27.11.25 um 15:14 schrieb Bastien Curutchet:
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
> ---
>   DEVELOPERS                       |  3 ++
>   package/Config.in                |  1 +
>   package/rasdaemon/Config.in      | 25 +++++++++++++++
>   package/rasdaemon/S95rasdaemon   | 69 ++++++++++++++++++++++++++++++++++++++++
>   package/rasdaemon/rasdaemon.hash |  3 ++
>   package/rasdaemon/rasdaemon.mk   | 33 +++++++++++++++++++
>   6 files changed, 134 insertions(+)
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
> index 0000000000000000000000000000000000000000..23c084ac8508cf4f45614e7cc44db94c61aa42e3
> --- /dev/null
> +++ b/package/rasdaemon/S95rasdaemon
> @@ -0,0 +1,69 @@
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
> +		--exec "/usr/sbin/$DAEMON"
> +	status=$?
> +	if [ "$status" -eq 0 ]; then
> +		echo "OK"
> +		# rasdaemon automatically forks itself into background
> +		# so the $PIDFILE created by start-stop-daemon doesn't match
> +		# the final's rasdaemon PID.
> +		pidof "/usr/sbin/$DAEMON" > "$PIDFILE"

For a service that can't create a PID file, please make it run in 
foreground (no forking) [1] and use start-stop-daemon --background 
together with --make-pidfile. That way the PID file created by 
start-stop-daemon will be correct. See the S01syslogd example in the 
docs, it's doing exactly that. :-)

Creating the PID file using pidof has the same problem as implementing 
"stop" with "killall": There's no check you're getting the right process 
(even though it might mostly work, as long as there never is more than 
one instance running).

[1] At a glance, rasdaemon seems to have an option: 
https://github.com/mchehab/rasdaemon/blob/2f461caf9613e8dfe87be315dbe083b60560d1e7/man/rasdaemon.1.in#L54-L57

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
> +
> +exit $?

Not needed, the exit code of the last command in the script 
automatically becomes the exit code of the script.

Best regards,
Fiona

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
