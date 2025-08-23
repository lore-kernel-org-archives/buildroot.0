Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C12FCA0EE4
	for <buildroot@archiver.kernel.org>; Sat, 23 Aug 2025 18:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D57D83C54;
	Sat, 23 Aug 2025 18:16:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UrJIANAQMsOJ; Sat, 23 Aug 2025 18:16:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B36F83D52
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B36F83D52;
	Sat, 23 Aug 2025 18:16:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7AE9AE4
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 18:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C2CA400DA
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 18:16:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rCu3iFDTM-cC for <buildroot@buildroot.org>;
 Sat, 23 Aug 2025 18:16:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 15723400B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15723400B8
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 15723400B8
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 18:16:26 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.102.142]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MfHAH-1uIm5T4A6V-00fc0I; Sat, 23
 Aug 2025 20:16:25 +0200
Message-ID: <3a50c498-08e6-4762-963b-4e05eac149fc@gmx.de>
Date: Sat, 23 Aug 2025 20:16:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
References: <20250823150543.3233205-1-romain.naour@smile.fr>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20250823150543.3233205-1-romain.naour@smile.fr>
X-Provags-ID: V03:K1:bujq1HyeRWJzURTB0KNrfEFS9VUnn4YViAdGSnGS4BZ3sMjoLlO
 JgZYTuGNI8x1FnuG2YSdN8oippMLb2u13bok36Oiuz9dqOtbtgNEAZUt8rqQ5q8r2zEJ8PJ
 SRDRF8G1H31qEeS6kbZgeBNX9VUw66PyRd4MMA6FeIPfIasPKkd5sbE3Yj5LMdFp+1o8IJp
 WVuHbwsXYUxlLokZnm+3g==
UI-OutboundReport: notjunk:1;M01:P0:ia6WJVoRaNU=;kdc2wu4Yog/qsbO+yYLluVQITBE
 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
 8mUSJLmNMdLti50Lcoo
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1755972985; x=1756577785; i=fiona.klute@gmx.de;
 bh=vS1eSu5g+Z2d+xvPSBkMrS7l8+J0lZcyI2jYbT68/b4=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=RSIHcjk68Y0HmWLuUrepR9V0s7+bJtzg5kff7fY0ppRvjl4XNtqEfPBPNlrSnswu
 cyQFFvUabkvOSIwIfH7cGCSjw9Wm6KUFG3bR90ZK4GFD6ig+izu8IH/A+yCk/9aTD
 BZFpCOBIMoxtGuyVer2cSLjhklFZavCfPMDita3wpzYT/6fWVKVgdfC09i38PWxCw
 2IDP90hooGaS1kfHowfCSQWM+xT36nx7f4R/Y8o9AVPTsRXK87EqvhHxHAN/d5RRa
 2VMG2MvIbNWd00Brp3d6Qy/j8m+OmCJ/enNUtEJ36BkcPqrOn85KhEg8c/EgEYD/7
 Xm0I/Xb3+NggXjmgYw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=RSIHcjk6
Subject: Re: [Buildroot] [PATCH 1/4] package/busybox: add httpd server
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

Hi Romain,

a few nits on the init script below.

Am 23.08.25 um 17:05 schrieb Romain Naour via buildroot:
> In order to remove thttpd package from Buildroot, we have to replace it
> from our testsuite (TestWget and TestLibCurl).
> 
> Busybox provide an httpd server applet but it's not enabled in our
> default busybox configuration.
> 
> For the sake of those tests, add a new busybox option to build and
> install the Busybox's httpd server and its init script.
> 
> Cc: Julien Olivain <ju.o@free.fr>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>   package/busybox/Config.in  |  6 +++++
>   package/busybox/S90httpd   | 54 ++++++++++++++++++++++++++++++++++++++
>   package/busybox/busybox.mk | 16 +++++++++++
>   3 files changed, 76 insertions(+)
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
> index 0000000000..c148d19adf
> --- /dev/null
> +++ b/package/busybox/S90httpd
> @@ -0,0 +1,54 @@
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
> +start() {
> +	printf 'Starting %s: ' "$DAEMON"
> +	# shellcheck disable=SC2086 # we need the word splitting
> +	start-stop-daemon -S -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \

Preferably use long options for start-stop-daemon for clarity.

> +		-- $HTTPD_ARGS
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
> +	start-stop-daemon -K -q -p "$PIDFILE"

The stop command should use --exec/-x, too, as a safeguard to ensure the 
right process is stopped.

> +	status=$?
> +	if [ "$status" -eq 0 ]; then
> +		# httpd does not remove the pid file on exit
> +		rm -f "$PIDFILE"

At this point it's only certain that start-stop-daemon sent SIGTERM 
successfully, not that the service actually stopped. For services that 
do not delete their PID file on exit the init script should wait for the 
process to stop, see package/busybox/S01syslogd for example, also for 
the other points.

> +		echo "OK"
> +	else
> +		echo "FAIL"
> +	fi
> +	return "$status"
> +}
> +
> +restart() {
> +	stop
> +	sleep 1

If the stop command waits for the process to actually stop as mentioned 
above, this sleep isn't needed any more.

Best regards,
Fiona

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
