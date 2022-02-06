Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E6AC433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 15:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1219640270;
	Sun,  6 Feb 2022 15:37:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v2EXWD_B_uPO; Sun,  6 Feb 2022 15:37:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65358400C1;
	Sun,  6 Feb 2022 15:37:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3D85C1BF325
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 15:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A43860B64
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 15:37:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HJOAe9I-PkEu for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 15:37:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8DFEA60B12
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 15:37:13 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id w20so20817789edc.1
 for <buildroot@buildroot.org>; Sun, 06 Feb 2022 07:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Lh62O2d50e+YYvNqo3XLoVditUS/0jSWyCX4fOL1z+4=;
 b=I/ojVY3+KfykpAAcsDXXAiUIwxaamN1vGPRlARODK5di9tLdiogcCWMCc6XVLOJU6D
 urNTq3kkPX/vDzlWhLp1dMIaBBuTQPdqyjXCBod/tOtssgVYsJce8jmwOx9nigUJbMzn
 HcfE6xa84EyHLKKQBI7xbZQCCyR5+0WnggHezQbfEeS8uLjwO9+0n2RfngrHFNantwkM
 2HVcBuJHJOL9aGMAyTWicxt8Zixiviah+SUPMnt2uRPlR1wU23upRYnUojI76mhlWPXI
 zCsiaV+skP7YQQ6TAEx4nFaLM7VHqJbHGMwqrKhxlByTmVgs/gat14DMSjeOqoN8tUI+
 KU7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Lh62O2d50e+YYvNqo3XLoVditUS/0jSWyCX4fOL1z+4=;
 b=7TWolFQG+0Z21yaYugj6MuRJ4xHWFKie0qN2VaLYNHE2NQzHt+CIb8RDJvX6LUeRYM
 WQKX9hzfcZvg68C4fokSEIVQnm1KDMXjDCPhelxvQOBpOTOGMdKSvmWMqUYeaax/S358
 HOJb1u8f3u04xo5fGJfHm4/Tx+8h12E0E9EyxGMAQT8eKZR3z1LMaQ0C7UILi+54o/Bl
 KblSFvE+wk01wrJRUQMfsNl5YOeitahTXoD0qFKrPITKDGN3Ph3QBJM3pdgiHIFx/EqR
 ponKP7k903wyQjTzHpan9Uqp06X60At8S7CjYR6UG78Ad00gO1O5kCRs3uiDNUVokToQ
 +lYQ==
X-Gm-Message-State: AOAM533sFdTtK0KQy8Q2PiR+jSyQANuHqsuFtJkOSwMUHtLzNlfL/XQ6
 /Qzf5DVPk7d5T4SEQxlQhkX9bg==
X-Google-Smtp-Source: ABdhPJxwJuY5E57PAweZrVgp2m9FUxfeeyCikFbG4vEMPy1K1Aj+9TLJ0ZinyRssWyUyvQub2hHFNA==
X-Received: by 2002:a50:d5cd:: with SMTP id g13mr9476388edj.268.1644161831646; 
 Sun, 06 Feb 2022 07:37:11 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id ss14sm534187ejb.199.2022.02.06.07.37.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Feb 2022 07:37:11 -0800 (PST)
Message-ID: <c76bab40-01a1-e4d0-3f04-02745f8ce26a@mind.be>
Date: Sun, 6 Feb 2022 16:37:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Joachim Wiberg <troglobit@gmail.com>, buildroot@buildroot.org
References: <20211205102010.2834942-1-troglobit@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211205102010.2834942-1-troglobit@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] docs/manual: add section on start
 script recommendations
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
Cc: thomas.petazzoni@bootlin.com,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/12/2021 11:20, Joachim Wiberg wrote:
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> ---
>   docs/manual/adding-packages-directory.txt | 96 +++++++++++++++++++++++
>   docs/manual/configure.txt                 |  1 +
>   2 files changed, 97 insertions(+)
> 
> diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
> index 4ceb3fd772..72e8dac5ff 100644
> --- a/docs/manual/adding-packages-directory.txt
> +++ b/docs/manual/adding-packages-directory.txt
> @@ -554,3 +554,99 @@ over time. Such patches should not be downloaded, and instead be added
>   locally to the package folder.
>   
>   If the +.hash+ file is missing, then no check is done at all.
> +
> +[[adding-packages-start-script]]
> +=== The +SNNfood+ start script
> +
> +Packages that provide a system daemon usually need to be started somehow
> +at boot.  Buildroot comes with support for several init systems, some
> +are considered tier one (see xref:init-system[]), while others are also
> +available but do not have the same level of integration.  The
> +recommended one in Buildroot is the BusyBox init.

  I think the intention is that systemd is at the same level as busybox init. 
And we generally don't distinguish between busybox init and SysV init.

  I made a few other small changes to the text and applied to master, thanks.

  Regards,
  Arnout

> +
> +All packages providing a system daemon must provide a start script for
> +BusyBox init, and should provide a systemd unit file.  For consistency,
> +the init script must follow the style and composition as defined in the
> +reference: +package/busybox/S01syslogd+.  There is no recommendation for
> +systemd unit files, but if a package comes with its own unit file, that
> +is preferred over a local one.  Provided of course that the unit file
> +is compatible with a Buildroot system.
> +
> +The name of the start script is composed of the +SNN+ and the daemon
> +name.  The +NN+ is the start order number which needs to be carefully
> +chosen.  For example, a program that requires networking to be up should
> +not start before +S40network+.  The scripts are started in alphabetical
> +order, so +S01syslogd+ starts before +S01watchdogd+, and +S02sysctl+
> +start thereafter.
> +
> +------------------------------
> +01: #!/bin/sh
> +02:
> +03: DAEMON="syslogd"
> +04: PIDFILE="/var/run/$DAEMON.pid"
> +05:
> +06: SYSLOGD_ARGS=""
> +07:
> +08: # shellcheck source=/dev/null
> +09: [ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
> +10:
> +11: # BusyBox' syslogd does not create a pidfile, so pass "-n" in the command line
> +12: # and use "-m" to instruct start-stop-daemon to create one.
> +13: start() {
> +14: 	printf 'Starting %s: ' "$DAEMON"
> +15: 	# shellcheck disable=SC2086 # we need the word splitting
> +16: 	start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "/sbin/$DAEMON" \
> +17: 		-- -n $SYSLOGD_ARGS
> +18: 	status=$?
> +19: 	if [ "$status" -eq 0 ]; then
> +20: 		echo "OK"
> +21: 	else
> +22: 		echo "FAIL"
> +23: 	fi
> +24: 	return "$status"
> +25: }
> +26:
> +27: stop() {
> +28: 	printf 'Stopping %s: ' "$DAEMON"
> +29: 	start-stop-daemon -K -q -p "$PIDFILE"
> +30: 	status=$?
> +31: 	if [ "$status" -eq 0 ]; then
> +32: 		rm -f "$PIDFILE"
> +33: 		echo "OK"
> +34: 	else
> +35: 		echo "FAIL"
> +36: 	fi
> +37: 	return "$status"
> +38: }
> +39:
> +40: restart() {
> +41: 	stop
> +42: 	sleep 1
> +43: 	start
> +44: }
> +45:
> +46: case "$1" in
> +47: 	start|stop|restart)
> +48: 		"$1";;
> +49: 	reload)
> +50: 		# Restart, since there is no true "reload" feature.
> +51: 		restart;;
> +52: 	*)
> +53: 		echo "Usage: $0 {start|stop|restart|reload}"
> +54: 		exit 1
> +55: esac
> +------------------------------
> +
> +*Note:* programs that support reloading their configuration in some
> +fashion (+SIGHUP+) should provide a +reload()+ function similar to
> ++stop()+.  The +start-stop-daemon+ supports +-K -s HUP+ for this.
> +It is recommended to always append +-x "/sbin/$DAEMON"+ to all the
> ++start-stop-daemon+ commands to ensure signals are set to a PID that
> +matches +$DAEMON+.
> +
> +Both start scripts and unit files can source command line arguments from
> ++/etc/default/foo+, in general, if such a file does not exist it should
> +not block the start of the daemon, unless there is some site specirfic
> +command line argument the daemon requires to start.  For start scripts a
> ++FOO_ARGS="-s -o -m -e -args"+ can be defined to a default value in and
> +the user can override this from +/etc/default/foo+.
> diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
> index c9eef567f4..60860d2c71 100644
> --- a/docs/manual/configure.txt
> +++ b/docs/manual/configure.txt
> @@ -377,6 +377,7 @@ good solution.
>   Note that if +systemd+ is chosen as init system, /dev management will
>   be performed by the +udev+ program provided by +systemd+.
>   
> +[[init-system]]
>   === init system
>   
>   The _init_ program is the first userspace program started by the
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
