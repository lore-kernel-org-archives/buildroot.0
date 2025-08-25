Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C97CA0FE1
	for <buildroot@archiver.kernel.org>; Mon, 25 Aug 2025 10:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67B9761CE8;
	Mon, 25 Aug 2025 10:51:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f1Zd5GgpFIRQ; Mon, 25 Aug 2025 10:51:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69C0B61C35
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69C0B61C35;
	Mon, 25 Aug 2025 10:51:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 97A35CA
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 10:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 760A961CAA
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 10:51:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vwvb_rXpRmES for <buildroot@buildroot.org>;
 Mon, 25 Aug 2025 10:51:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C67706108B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C67706108B
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C67706108B
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 10:51:48 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.122.97]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N9dwj-1uTnZK2Eqr-00zZBt; Mon, 25
 Aug 2025 12:51:43 +0200
Message-ID: <5ba0a34f-b75c-49a6-a17f-d930a8b49316@gmx.de>
Date: Mon, 25 Aug 2025 12:51:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
References: <20250823194953.3458533-1-romain.naour@smile.fr>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20250823194953.3458533-1-romain.naour@smile.fr>
X-Provags-ID: V03:K1:ca+AS1h5ParaIV3QODi1N5dJF0qoPp45WAn5H4zXuxk59bizVpU
 PJe8Nt/7h40zoqN9Fwu1CQDP+pqPB1oYCsp+uz2oqf5iaWrJ9fYXL58uD4Hy+x6eot0f67R
 q/l76TMBzQHzGVP+E7DIMmhBeEZ7Mwf7IJD1MjwTlq7HNQFAAjUzVCJDuJqziG5VY8ar0HC
 riRhsJLPOpD3sQwDYdZIg==
UI-OutboundReport: notjunk:1;M01:P0:9Y8ayloI2PQ=;FIL9VqFBuZcMizmHU2faphm+lck
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1756119103; x=1756723903; i=fiona.klute@gmx.de;
 bh=3QQl1rtwGeVe5RrnmCK4HBxdliufrZ6OTdKEbQdv9ME=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=HXRm9G1lLKdrbQCkuIS1ER/iwIC2URiZZ3X+YMyUs2zFYs92lWgzc1b+/7vGe+WD
 0SBlch5NkASfi1V/Dk/xSsYlD4IKvnXaIEGdvvpNQd0bpx4s5eFgLyNUUVPtavP2l
 ZoQ8GC9yscLz3+pNZx9f3Uhz9MCzmCHOAEuSmUDvGLMMOqkZEu0J5Bgr97PrvD1kp
 WzpkL0+0Z7xB3c4BzLMY7zmd82Rw5jnI5VvkRQ4ZPLBQoEgGTmLwySOXQ+93wF0ye
 We134tjVI2r37kZArczTex4hrOIBbsaapVOTHlCrvf3i84BXN9T8uw+aQ6KpwnCSW
 d7QOKsHvFPe+5WCkqg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=HXRm9G1l
Subject: Re: [Buildroot] [PATCH v2 1/4] package/busybox: add httpd server
 startup script
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

Am 23.08.25 um 21:49 schrieb Romain Naour:
> In order to remove thttpd package from Buildroot, we have to replace it
> from our testsuite (TestWget and TestLibCurl).
> 
> Busybox provide an httpd server applet but it's not enabled in our
> default busybox configuration.
> 
> For the sake of those tests, add a new busybox option to build and
> install the Busybox's httpd server and its init script.
> 
> Import S90thttpd from thttpd package to S90httpd but with some changes
> following S01syslogd init script as a reference [1].
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/3dc80614442cc3942a372a8c31abd22c1bc96241
> 
> Cc: Julien Olivain <ju.o@free.fr>
> Cc: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Reviewed-by: Fiona Klute <fiona.klute@gmx.de>

Init script looks good now, thanks!

Best regards,
Fiona

> ---
> V2: update S90httpd following S01syslogd init script as a reference (Fiona Klute)
>      See: https://gitlab.com/buildroot.org/buildroot/-/commit/3dc80614442cc3942a372a8c31abd22c1bc96241
> ---
>   package/busybox/Config.in  |  6 ++++
>   package/busybox/S90httpd   | 59 ++++++++++++++++++++++++++++++++++++++
>   package/busybox/busybox.mk | 16 +++++++++++
>   3 files changed, 81 insertions(+)
>   create mode 100644 package/busybox/S90httpd
> 
> diff --git a/package/busybox/Config.in b/package/busybox/Config.in
> index 3c2aa515f8..659c6aebfc 100644
> --- a/package/busybox/Config.in
> +++ b/package/busybox/Config.in
> @@ -69,6 +69,12 @@ config BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES
>   comment "Busybox individual binaries need a toolchain w/ dynamic library"
>   	depends on BR2_STATIC_LIBS
>   
> +config BR2_PACKAGE_BUSYBOX_HTTPD
> +	bool "Install the httpd server startup script"
> +	help
> +	  Install the httpd server startup script,
> +	  that just start at the boot the busybox httpd server
> +
>   config BR2_PACKAGE_BUSYBOX_WATCHDOG
>   	bool "Install the watchdog daemon startup script"
>   	help
> diff --git a/package/busybox/S90httpd b/package/busybox/S90httpd
> new file mode 100644
> index 0000000000..0d43ea3e74
> --- /dev/null
> +++ b/package/busybox/S90httpd
> @@ -0,0 +1,59 @@
> +#!/bin/sh
> +
> +DAEMON="httpd"
> +PIDFILE="/var/run/$DAEMON.pid"
> +
> +HTTPD_ARGS="-h /var/www/data"
> +
> +# shellcheck source=/dev/null
> +[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
> +
> +# BusyBox' httpd does not create a pidfile, so pass "-f" in the command line
> +# and use "--make-pidfile" to instruct start-stop-daemon to create one.
> +start() {
> +	printf 'Starting %s: ' "$DAEMON"
> +	# shellcheck disable=SC2086 # we need the word splitting
> +	start-stop-daemon --start --background --quiet --make-pidfile \
> +		--pidfile "$PIDFILE" --exec "/usr/sbin/$DAEMON" \
> +		-- -f $HTTPD_ARGS
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
> +	printf 'Stopping %s: ' "$DAEMON"
> +	start-stop-daemon --stop --quiet --pidfile "$PIDFILE"
> +	status=$?
> +	if [ "$status" -eq 0 ]; then
> +		echo "OK"
> +	else
> +		echo "FAIL"
> +	fi
> +	while start-stop-daemon --stop --test --quiet --pidfile "$PIDFILE" \
> +		--exec "/usr/sbin/$DAEMON"; do
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
> +case "$1" in
> +	start|stop|restart)
> +		"$1";;
> +	reload)
> +		# Restart, since there is no true "reload" feature.
> +		restart;;
> +	*)
> +		echo "Usage: $0 {start|stop|restart|reload}"
> +		exit 1
> +esac
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index 532932ec8f..d7eda71db6 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -258,6 +258,19 @@ define BUSYBOX_SET_SELINUX
>   endef
>   endif
>   
> +ifeq ($(BR2_PACKAGE_BUSYBOX_HTTPD),y)
> +define BUSYBOX_SET_HTTPD
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_HTTPD)
> +endef
> +define BUSYBOX_INSTALL_HTTPD_SCRIPT
> +	if grep -q CONFIG_HTTPD=y $(@D)/.config; then \
> +		mkdir -p $(TARGET_DIR)/var/www/data ;\
> +		$(INSTALL) -m 0755 -D package/busybox/S90httpd \
> +			$(TARGET_DIR)/etc/init.d/S90httpd ; \
> +	fi
> +endef
> +endif
> +
>   # enable relevant options to allow the Busybox less applet to be used
>   # as a systemd pager
>   ifeq ($(BR2_PACKAGE_SYSTEMD):$(BR2_PACKAGE_LESS),y:)
> @@ -418,6 +431,7 @@ define BUSYBOX_KCONFIG_FIXUP_CMDS
>   	$(BUSYBOX_SET_WATCHDOG)
>   	$(BUSYBOX_SET_SELINUX)
>   	$(BUSYBOX_SET_LESS_FLAGS)
> +	$(BUSYBOX_SET_HTTPD)
>   	$(BUSYBOX_SET_INDIVIDUAL_BINARIES)
>   	$(BUSYBOX_DISABLE_IP_LINK_CAN)
>   	$(PACKAGES_BUSYBOX_CONFIG_FIXUPS)
> @@ -447,6 +461,7 @@ define BUSYBOX_INSTALL_INIT_OPENRC
>   	$(BUSYBOX_INSTALL_IFPLUGD_SCRIPT)
>   	$(BUSYBOX_INSTALL_CROND_SCRIPT)
>   	$(BUSYBOX_INSTALL_TELNET_SCRIPT)
> +	$(BUSYBOX_INSTALL_HTTPD_SCRIPT)
>   endef
>   
>   define BUSYBOX_INSTALL_INIT_SYSTEMD
> @@ -461,6 +476,7 @@ define BUSYBOX_INSTALL_INIT_SYSV
>   	$(BUSYBOX_INSTALL_IFPLUGD_SCRIPT)
>   	$(BUSYBOX_INSTALL_CROND_SCRIPT)
>   	$(BUSYBOX_INSTALL_TELNET_SCRIPT)
> +	$(BUSYBOX_INSTALL_HTTPD_SCRIPT)
>   endef
>   
>   # Checks to give errors that the user can understand

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
