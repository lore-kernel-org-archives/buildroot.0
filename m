Return-Path: <SRS0=/mEu=MO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1735C4338F
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 21:00:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AD6E60EB5
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 21:00:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3AD6E60EB5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03285600CC;
	Thu, 22 Jul 2021 21:00:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IbFjHNcR1pc6; Thu, 22 Jul 2021 20:59:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB7BE60644;
	Thu, 22 Jul 2021 20:59:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 436271BF2F0
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 20:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3FF5783131
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 20:59:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XOgAN9zSVx4s for <buildroot@lists.busybox.net>;
 Thu, 22 Jul 2021 20:59:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC135830AB
 for <buildroot@busybox.net>; Thu, 22 Jul 2021 20:59:54 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id hs23so397610ejc.13
 for <buildroot@busybox.net>; Thu, 22 Jul 2021 13:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1mQNqzimpnACUZCOX8XUtpRi6RZiGuov1cX1GFemg0s=;
 b=Caqzmwxl1FmCMJ1yGMqw9uoxFYM5e+iVq5Q/pNB649vyrXTT61twFjpjXZFk9uPf0W
 +IuT79lV3k7B/LgZJY8X12goi8cem2mJZaSmIiPJbU4xqb/bAiI5ASkABw5Gg6PSJJwj
 IA3WsyT1cQ3oHUWmvMVsdxCcW4cR7X4+GuAG5/tBNc96NDE7jYLRMjteyV5ojSLeFfwz
 UNWMRx5tXyDqa+T1+XbWdRdvpZz39bwK9ebo9a1GkzfOOEgWEYVWDT3JD1QP2L04Q7Zv
 sYDS1ShgtkClZ2adH0fSHzmFazYmv/Ll+3UUsCTtE/JQ1dsR7p+0cHDigImrn6yp2MoC
 kJYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=1mQNqzimpnACUZCOX8XUtpRi6RZiGuov1cX1GFemg0s=;
 b=TsPhrsUby3XTubWpfmXY+KFLevafP5ujkvtYSX285GjM2jwBsHZSDMRvjXd/PQZX/Q
 0rHo0ttFt99lLYSQeaxdr8TIaK6nZmwxhsLIrtifpFhn5glGFOi6ZTa46bJ16UQXNG+7
 6/cNcT+d1UdMwT4efrIe6eNMlKrdEcCFbcOBwpc0TQV36/bLUicRVx6dku70N2quJIzg
 WOinkkeKtKlTRBvu8Sm9qJfrvRQcYUfqfavZspKzdKuMigQ9gLz9ofemjhH8oeUvKQni
 GthX3ok/D6VjTiSgd74/2ZZ2HOtIYlFCvEcnBbf7LpX4qshsKJoMyS6I3K7WF8oevOdR
 +ohQ==
X-Gm-Message-State: AOAM5310RiP0I9pa1sjBRd0y566jzVw9AAA08MS1X+Eb5yOjmzze+mWz
 3IacIsWoXXKl3UDaZO0mXZ6PnA==
X-Google-Smtp-Source: ABdhPJy3z/8U89VDJXHwkL1L2wjCfq/xxJG+A83kH0m8wvPjbPKAVFPSh/RMKqRzL3WPfkaaBc+DIw==
X-Received: by 2002:a17:906:f11:: with SMTP id
 z17mr1600795eji.385.1626987592887; 
 Thu, 22 Jul 2021 13:59:52 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id hq9sm9604971ejc.0.2021.07.22.13.59.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 13:59:52 -0700 (PDT)
To: Jared Bents <jared.bents@rockwellcollins.com>, buildroot@busybox.net
References: <20210611140732.47283-1-jared.bents@rockwellcollins.com>
 <20210611140732.47283-2-jared.bents@rockwellcollins.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <4b00bd0e-77db-d8be-33e6-8ba812694f26@mind.be>
Date: Thu, 22 Jul 2021 22:59:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210611140732.47283-2-jared.bents@rockwellcollins.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v9 2/3] package/libvirt: add daemon libvirtd
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 11/06/2021 16:07, Jared Bents wrote:
> Update to add the libvirtd daemon for libvirt
> 
> Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
> 
> --
> History:
> v8:
>   - Split off from patch adding libvirt
> 
> v8->v9:
>   - N/A
> ---
>  package/libvirt/Config.in   |  20 ++++++
>  package/libvirt/S91virtlogd |  65 ++++++++++++++++++
>  package/libvirt/S92libvirtd | 132 ++++++++++++++++++++++++++++++++++++
>  package/libvirt/libvirt.mk  |  49 +++++++++++--
>  4 files changed, 260 insertions(+), 6 deletions(-)
>  create mode 100644 package/libvirt/S91virtlogd
>  create mode 100644 package/libvirt/S92libvirtd
> 
> diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
> index f7999fea88..ae5c8aac8a 100644
> --- a/package/libvirt/Config.in
> +++ b/package/libvirt/Config.in
> @@ -24,6 +24,26 @@ config BR2_PACKAGE_LIBVIRT
>  
>  	  https://libvirt.org/
>  
> +if BR2_PACKAGE_LIBVIRT
> +
> +config BR2_PACKAGE_LIBVIRT_DAEMON
> +	bool "libvirtd"
> +	default y
> +	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> +	select BR2_PACKAGE_DNSMASQ
> +	select BR2_PACKAGE_EBTABLES
> +	select BR2_PACKAGE_IPTABLES
> +	select BR2_PACKAGE_IPROUTE2
> +	# These are required because there is no way to unequivocally select a modern netcat
> +	select BR2_PACKAGE_NMAP      if !BR2_PACKAGE_NETCAT_OPENBSD
> +	select BR2_PACKAGE_NMAP_NCAT if !BR2_PACKAGE_NETCAT_OPENBSD

 I believe Carlos' initial patch selected netcat, not netcat-openbsd. Note that
netcat-openbsd has pretty different command-line options, so in any other than
the most trivial cases they're not compatible...

> +	select BR2_PACKAGE_RADVD
> +	help
> +	  Build the libvirt daemon (libvirtd) otherwise build only the
> +	  utility programs.
> +
> +endif
> +
>  comment "libvirt needs udev /dev management"
>  	depends on BR2_USE_MMU
>  	depends on BR2_PACKAGE_LIBVIRT_ARCH_SUPPORTS
> diff --git a/package/libvirt/S91virtlogd b/package/libvirt/S91virtlogd
> new file mode 100644
> index 0000000000..03d17b5dbd
> --- /dev/null
> +++ b/package/libvirt/S91virtlogd
> @@ -0,0 +1,65 @@
> +#!/bin/sh
> +
> +DAEMON="virtlogd"
> +EXECFILE="/usr/sbin/$DAEMON"
> +PIDFILE="/var/run/$DAEMON.pid"
> +
> +VIRTLOGD_ARGS=""
> +
> +# shellcheck source=/dev/null
> +[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
> +
> +start() {
> +	printf 'Starting %s: ' "$DAEMON"
> +	# shellcheck disable=SC2086 # we need the word splitting
> +	start-stop-daemon -S -q -p "$PIDFILE" -x "$EXECFILE" \
> +		-- -d $VIRTLOGD_ARGS
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
> +	start-stop-daemon -K -q -p "$PIDFILE" -x "$EXECFILE"
> +	status=$?
> +	if [ "$status" -eq 0 ]; then
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
> +	start
> +}
> +
> +# On receipt of SIGUSR1 virtlogd will re-exec() its binary, while maintaining
> +# all current logs and clients. This allows for live upgrades of the virtlogd
> +# service.
> +reload() {
> +	printf 'Reloading %s: ' "$DAEMON"
> +	start-stop-daemon -K -s USR1 -q -p "$PIDFILE" -x "$EXECFILE"
> +	status=$?
> +	if [ "$status" -eq 0 ]; then
> +		echo "OK"
> +	else
> +		echo "FAIL"
> +	fi
> +	return "$status"
> +}
> +
> +case "$1" in
> +	start|stop|restart|reload)
> +		"$1";;
> +	*)
> +		echo "Usage: $0 {start|stop|restart|reload}"
> +		exit 1
> +esac
> diff --git a/package/libvirt/S92libvirtd b/package/libvirt/S92libvirtd
> new file mode 100644
> index 0000000000..736519f3d0
> --- /dev/null
> +++ b/package/libvirt/S92libvirtd
> @@ -0,0 +1,132 @@
> +#!/bin/sh
> +
> +DAEMON="libvirtd"
> +EXECFILE="/usr/sbin/$DAEMON"
> +PIDFILE="/var/run/$DAEMON.pid"
> +
> +LIBVIRTD_ARGS=""
> +
> +# shellcheck source=/dev/null
> +[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
> +
> +trap 'rm -f "$TMP_MODULE_LIST" "$TMP_PIDFILE_LIST"' EXIT
> +
> +is_alive() {
> +	[ -e "$1" ] \
> +	&& exe="/proc/$(cat "$1" 2>/dev/null)/exe" \
> +	&& [ -s "$exe" ] \
> +	&& [ "$(readlink -f "$exe")" = "$2" ]
> +}
> +
> +load_modules() {
> +	printf 'Loading kernel modules: '
> +	kver="$(uname -r)"
> +	TMP_MODULE_LIST="$(mktemp -q)" || {
> +		echo 'FAIL creating temporary modules list'
> +		exit 1
> +	}
> +	[ -d "/lib/modules/$kver/kernel/drivers/net" ] && \
> +		find "/lib/modules/$kver/kernel/drivers/net" \
> +		-name "tun.ko*" >> "$TMP_MODULE_LIST"
> +	[ -d "/lib/modules/$kver/kernel/drivers/vhost" ] && \
> +		find "/lib/modules/$kver/kernel/drivers/vhost" \
> +		-name "vhost?net.ko*" >> "$TMP_MODULE_LIST"
> +	[ -d "/lib/modules/$kver/kernel/drivers/net" ] && \
> +		find "/lib/modules/$kver/kernel/drivers/vfio" \
> +		-name "*.ko*" >> "$TMP_MODULE_LIST"
> +	while read -r f; do
> +		m="$(basename "${f%.ko*}")"
> +		if modprobe -q "$m"; then
> +			printf '%s ' "$m"
> +		else
> +			echo "FAIL on $m"
> +			exit 1
> +		fi
> +	done < "$TMP_MODULE_LIST"
> +	echo "OK"
> +}
> +
> +#
> +# If libvirtd dies it leves behind one stale dnsmasq per virtual network that
> +# must be killed before starting libvirtd again.
> +#
> +rm_stale_dnsmasq() {
> +	[ -d /var/run/libvirt/network ] || return 0
> +	TMP_PIDFILE_LIST="$(mktemp -q)" || {
> +		echo "Could not create temporary pidfile list"
> +		exit 1
> +	}
> +	find /var/run/libvirt/network -name '*.pid' > "$TMP_PIDFILE_LIST"
> +	while read -r pidfile; do
> +		if is_alive "$pidfile" /usr/sbin/dnsmasq; then

 It would be better IMHO to use start-stop-daemon itself instead of is_alive.
You would get error messages in case the process doesn't exist, but IMHO that's
fine (if libvirt doesn't stop them, they're expected to still be running...).

 That said, I committed as is.

> +			start-stop-daemon -K -q -p "$pidfile" -x /usr/sbin/dnsmasq
> +			status=$?
> +			if [ "$status" -ne 0 ]; then
> +				echo "Could not stop stale dnsmasq daemons"
> +				exit 1
> +			fi
> +			rm -f "$pidfile"
> +		fi
> +	done < "$TMP_PIDFILE_LIST"
> +}
> +
> +start() {
> +	if is_alive "$PIDFILE" "$EXECFILE"; then
> +		# libvirtd is already running. Leave it alone.
> +		printf 'Starting %s: FAIL\n' "$DAEMON"
> +		return 1
> +	fi
> +	rm_stale_dnsmasq

 We don't normally do such cleanups in init scripts, we just do the start
assuming the daemon is not yet running.

 Again, I left it as is.

> +	load_modules
> +	printf 'Starting %s: ' "$DAEMON"
> +	# shellcheck disable=SC2086 # we need the word splitting
> +	start-stop-daemon -S -q -p "$PIDFILE" -x "$EXECFILE" \
> +		-- -d $LIBVIRTD_ARGS
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
> +	start-stop-daemon -K -q -p "$PIDFILE" -x "$EXECFILE"
> +	status=$?
> +	if [ "$status" -eq 0 ]; then
> +		rm_stale_dnsmasq
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
> +	start
> +}
> +
> +# On receipt of SIGHUP libvirtd will reload its configuration.
> +reload() {
> +	printf 'Reloading %s: ' "$DAEMON"
> +	start-stop-daemon -K -s HUP -q -p "$PIDFILE" -x "$EXECFILE"
> +	status=$?
> +	if [ "$status" -eq 0 ]; then
> +		echo "OK"
> +	else
> +		echo "FAIL"
> +	fi
> +	return "$status"
> +}
> +
> +case "$1" in
> +	start|stop|restart|reload)
> +		"$1";;
> +	*)
> +		echo "Usage: $0 {start|stop|restart|reload}"
> +		exit 1
> +esac
> diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
> index b2c9eebbfe..8cc77f3c0e 100644
> --- a/package/libvirt/libvirt.mk
> +++ b/package/libvirt/libvirt.mk
> @@ -24,7 +24,6 @@ LIBVIRT_CONF_OPTS = \
>  	-Ddriver_interface=enabled \
>  	-Ddriver_libxl=disabled \
>  	-Ddriver_lxc=disabled \
> -	-Ddriver_network=disabled \
>  	-Ddriver_openvz=disabled \
>  	-Ddriver_qemu=disabled \
>  	-Ddriver_remote=enabled \
> @@ -38,19 +37,14 @@ LIBVIRT_CONF_OPTS = \
>  	-Dglusterfs=disabled \
>  	-Dhost_validate=enabled \
>  	-Dinit_script=$(if $(BR2_INIT_SYSTEMD),systemd,none) \
> -	-Dlibssh=disabled \
> -	-Dlibvirtd=disabled \
>  	-Dlogin_shell=disabled \
>  	-Dnetcf=disabled \
> -	-Dnss=disabled \
>  	-Dnumad=disabled \
>  	-Dopenwsman=disabled \
>  	-Dpciaccess=enabled \
>  	-Dpm_utils=disabled \
>  	-Dsanlock=disabled \
> -	-Dsasl=disabled \
>  	-Dsecdriver_apparmor=disabled \
> -	-Dssh2=disabled \
>  	-Dstorage_mpath=disabled \
>  	-Dstorage_iscsi=disabled \
>  	-Dstorage_iscsi_direct=disabled \
> @@ -122,6 +116,28 @@ else
>  LIBVIRT_CONF_OPTS += -Dlibpcap=disabled
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBVIRT_DAEMON)$(BR2_PACKAGE_LIBSSH),yy)
> +LIBVIRT_CONF_OPTS += -Dlibssh=enabled
> +LIBVIRT_DEPENDENCIES += libssh
> +else
> +LIBVIRT_CONF_OPTS += -Dlibssh=disabled
> +endif
> +
> +# Network is used by daemon, only
> +ifeq ($(BR2_PACKAGE_LIBVIRT_DAEMON),y)
> +LIBVIRT_CONF_OPTS += -Dlibvirtd=enabled -Ddriver_network=enabled
> +else
> +LIBVIRT_CONF_OPTS += -Dlibvirtd=disabled -Ddriver_network=disabled
> +endif
> +
> +# Can't build nss plugin without network
> +ifeq ($(BR2_PACKAGE_LIBVIRT_DAEMON)$(BR2_PACKAGE_LIBNSS),yy)

 Instead of having these yy options, I've put all the options that depend on the
daemon together, after the rest of the options.


 Regards,
 Arnout

> +LIBVIRT_CONF_OPTS += -Dnss=enabled
> +LIBVIRT_DEPENDENCIES += libnss
> +else
> +LIBVIRT_CONF_OPTS += -Dnss=disabled
> +endif
> +
>  ifeq ($(BR2_PACKAGE_NUMACTL),y)
>  LIBVIRT_CONF_OPTS += -Dnumactl=enabled
>  LIBVIRT_DEPENDENCIES += numactl
> @@ -143,6 +159,13 @@ else
>  LIBVIRT_CONF_OPTS += -Dreadline=disabled
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBVIRT_DAEMON)$(BR2_PACKAGE_LIBGSASL),yy)
> +LIBVIRT_CONF_OPTS += -Dsasl=enabled
> +LIBVIRT_DEPENDENCIES += libgsasl
> +else
> +LIBVIRT_CONF_OPTS += -Dsasl=disabled
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
>  LIBVIRT_CONF_OPTS += -Dselinux=enabled -Dsecdriver_selinux=enabled \
>  	-Dselinux_mount=/sys/fs/selinux
> @@ -151,6 +174,13 @@ else
>  LIBVIRT_CONF_OPTS += -Dselinux=disabled -Dsecdriver_selinux=disabled
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBVIRT_DAEMON)$(BR2_PACKAGE_LIBSSH2),yy)
> +LIBVIRT_CONF_OPTS += -Dssh2=enabled
> +LIBVIRT_DEPENDENCIES += libssh2
> +else
> +LIBVIRT_CONF_OPTS += -Dssh2=disabled
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LVM2),y)
>  LIBVIRT_CONF_OPTS += -Dstorage_lvm=enabled
>  LIBVIRT_DEPENDENCIES += lvm2
> @@ -209,4 +239,11 @@ endef
>  
>  LIBVIRT_PRE_INSTALL_TARGET_HOOKS += LIBVIRT_CREATE_SYMLINKS
>  
> +ifeq ($(BR2_PACKAGE_LIBVIRT_DAEMON),y)
> +define LIBVIRT_INSTALL_INIT_SYSV
> +	$(INSTALL) -D -m 0755 package/libvirt/S91virtlogd $(TARGET_DIR)/etc/init.d/S91virtlogd
> +	$(INSTALL) -D -m 0755 package/libvirt/S92libvirtd $(TARGET_DIR)/etc/init.d/S92libvirtd
> +endef
> +endif
> +
>  $(eval $(meson-package))
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
