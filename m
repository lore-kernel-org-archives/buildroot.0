Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E75A4D10F5A
	for <buildroot@archiver.kernel.org>; Wed, 26 Nov 2025 14:32:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 871938236D;
	Wed, 26 Nov 2025 14:32:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hq1SSEl8sihK; Wed, 26 Nov 2025 14:32:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AAAF81E46
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AAAF81E46;
	Wed, 26 Nov 2025 14:32:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D7597359
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 14:32:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD32140872
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 14:32:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iZP_9-V56tFD for <buildroot@buildroot.org>;
 Wed, 26 Nov 2025 14:32:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 61580407C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61580407C4
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 61580407C4
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 14:32:18 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.21.223]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MCsUC-1vFV7Z17Oy-009iRD; Wed, 26
 Nov 2025 15:32:09 +0100
Message-ID: <fbabe782-7e44-48ab-9437-0400080e817c@gmx.de>
Date: Wed, 26 Nov 2025 15:32:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bastien Curutchet <bastien.curutchet@bootlin.com>, buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251126-rasdaemon-v1-0-38c590f3e591@bootlin.com>
 <20251126-rasdaemon-v1-1-38c590f3e591@bootlin.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20251126-rasdaemon-v1-1-38c590f3e591@bootlin.com>
X-Provags-ID: V03:K1:geh0QjnnUzRbzsNUOyObfFXi2HxBU0NekvXBlanWFlR+TZlDYuT
 EKz1A9ibFaM8u0lkSzteMg/dGqIhROPEpgzjjynX4EotS8rrNL/HiRNOAqoxJpWDIQlM99l
 3AVsrtv07W6/l7Qhq2aTBrgOSju4bY6RKo7iMXC7xVwyXSyoC0vPn9hMJ5BvdYEYczaAb35
 on36toLzk4wW/irxUXeaw==
UI-OutboundReport: notjunk:1;M01:P0:gEJtiTDbHrM=;DEMT+wtMNWffb9jc7XRkKbVZVog
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1764167529; x=1764772329; i=fiona.klute@gmx.de;
 bh=EvNZGwUffW0IxYT0JX+3xiYmBj/wyiJwByVGtXD/6PI=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=W2SV8FSm5Nq3892HjfAdFGCYBOJq2Cv5QBnsjjUhWHUdwsHzCWHHxNwabVkPvM5X
 /hcWPUSSy28IZF0zRod6BkwIZfZQxG0Ghpx4XDVEK9j1a0mc7YuNpmmt0KEGrH0Cv
 0b4P7MGYEERXbOo/Kje+I0UMs7GGx2FvbV+s+xaTDS8oS+6oQpVprpSeUPI8Ojzur
 jWGleg1YVVCHuUV/bZS+/0PkWpjvBwV1Cz50SJWwq5gwpRUBfaWrltzZac0A5gLOi
 OKqvOlPBpqdMDGhuN2/lBZvngcEPrRE7rGYA4s3Z6DSOwtSKYiUITAYlkEJjzlTzZ
 YGvw58kbVV6QbYLUfw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=W2SV8FSm
Subject: Re: [Buildroot] [PATCH 1/2] package/rasdaemon: Add rasdaemon package
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

Am 26.11.25 um 11:20 schrieb Bastien Curutchet:
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
>   package/rasdaemon/Config.in      | 23 +++++++++++++++
>   package/rasdaemon/S95rasdaemon   | 62 ++++++++++++++++++++++++++++++++++++++++
>   package/rasdaemon/rasdaemon.hash |  1 +
>   package/rasdaemon/rasdaemon.mk   | 33 +++++++++++++++++++++
>   6 files changed, 123 insertions(+)
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
> index 0000000000000000000000000000000000000000..f6ceb3585ce5612ba598b182e6538a49d1adb8f8
> --- /dev/null
> +++ b/package/rasdaemon/Config.in
> @@ -0,0 +1,23 @@
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
> +	default y
> +	select BR2_PACKAGE_PCIUTILS
> +	help
> +	  Enable handling of AER (Advanced Error Reporting) events on
> +	  PCIe
> +
> +endif
> diff --git a/package/rasdaemon/S95rasdaemon b/package/rasdaemon/S95rasdaemon
> new file mode 100644
> index 0000000000000000000000000000000000000000..4f211f1eefb8cfe08b1150c91eb027dddf6085b9
> --- /dev/null
> +++ b/package/rasdaemon/S95rasdaemon
> @@ -0,0 +1,62 @@
> +#!/bin/sh
> +#
> +# S95rasdaemon	Starts Rasdaemon.
> +#
> +# shellcheck disable=SC2317 # functions are called via variable
> +
> +DAEMON="rasdaemon"
> +
> +start() {
> +	printf "Starting %s: " "$DAEMON"
> +
> +	if ! grep -q debugfs /proc/mounts ; then
> +		# rasdaemon fails silently if debugfs isn't mounted

Printing that instead of a comment would be helpful, so users without 
debugfs know why rasdaemon fails to start.

> +		echo "FAIL"
> +		return $?

This would return the exit status of "echo", which is practically always 
going to be 0. "return 1" would probably be more appropriate.

> +	fi
> +
> +	start-stop-daemon --start --exec "/usr/sbin/$DAEMON"
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
> +	start-stop-daemon --stop --exec "/usr/sbin/$DAEMON"
> +	status=$?
> +	if [ "$status" -eq 0 ]; then
> +		echo "OK"
> +	else
> +		echo "FAIL"
> +	fi
> +	# $DAEMON deletes its PID file on exit, wait for it to be gone
> +	while [ -f "$PIDFILE" ]; do

The PIDFILE variable isn't defined anywhere, that can't be right. 
Generally *all* start-stop-daemon calls should use --pidfile $PIDFILE so 
start-stop-daemon can keep track of exact process (in addition to 
--exec). Exactly how to manage the PID file depends on the behavior of 
the daemon, please see:
https://nightly.buildroot.org/#_handling_the_pid_file
(or docs/manual/adding-packages-directory.adoc in the repo, search for 
PID to find the section)

In any case, you need to set the PIDFILE variable in the init script. ;-)

Best regards,
Fiona

> +		sleep 0.1
> +	done
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
> diff --git a/package/rasdaemon/rasdaemon.hash b/package/rasdaemon/rasdaemon.hash
> new file mode 100644
> index 0000000000000000000000000000000000000000..768475ce597a63b1738388c2bdebcc3117f006a8
> --- /dev/null
> +++ b/package/rasdaemon/rasdaemon.hash
> @@ -0,0 +1 @@
> +sha256  7e12459f9477036491ac2b1e4c07cc3e8efea6dcd30525a263ab1f83910b773a  rasdaemon-0.8.4.tar.gz
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
