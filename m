Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61D1C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 11:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDD6E605A9;
	Mon,  5 Feb 2024 11:47:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDD6E605A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xr5QALgVWNhA; Mon,  5 Feb 2024 11:47:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13FDB60F0D;
	Mon,  5 Feb 2024 11:47:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13FDB60F0D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C9A081BF281
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A297782C35
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:47:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A297782C35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k37E9-_3cWMG for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 11:47:23 +0000 (UTC)
Received: from smtpdh17-2.aruba.it (smtpdh17-2.aruba.it [62.149.155.117])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A7C882C33
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 11:47:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A7C882C33
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id WxRYrjByHD7V9WxRZrkcrt; Mon, 05 Feb 2024 12:47:21 +0100
Message-ID: <8d3fbd57-3100-46f5-8740-0998ead5b029@benettiengineering.com>
Date: Mon, 5 Feb 2024 12:47:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Maciej Grela <enki@fsck.pl>, buildroot@buildroot.org
References: <20231004131256.2113233-2-enki@fsck.pl>
 <20231006140511.3840643-3-enki@fsck.pl>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20231006140511.3840643-3-enki@fsck.pl>
X-CMAE-Envelope: MS4xfBtAbmqdb+MTu6y4Wn2FHEEnVfiGuwlGkhMH2Dj7z7dCe5LAXP70OqzkZhJitDQ8mKIg+9RLIynEHjhIwdKH04tdNtZFUDyedUqnBA8opyVq4DCvcpvn
 ix6tgVG6XCBXJa/WleSG69TyQFnc+Vae7ZtXUFHFZLeIg7nXy6gSIZeAvsrS576xYpdYAxSd+aANACIuPcoBff5Ssh0uKAlSqkU8WzOY3ujR3PflgKTAP0ob
 GVgxz1JRyOXPM68zrEf/iSSlRXDl6fy0DYl/4vANOPYRAHZYVsxxqqcnB9D3ZZW/
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1707133641; bh=M79eRBkUArALULKRn7H5Sc7O0MZWWvPN8mKhsAwSTbU=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=j4rYhMzbsEfjRb/uACmsdpjXP+XJdjGQd1s3WTahd5jDo39pG6rrE2LiWbH3R9dWq
 m/tBSrSJp2QzONTkO1r6ZDBt2m8NeXDN/d3gwJH/Gu1IBdQ/T8k7RVZ5bNwxDg6IUe
 LlrXEwBddFTn9Ym+gIQ6D79T416yecqL43NOF2WwSqkZvJhOKxSPwMnrMt3+jkS0TS
 y3nAMeP97xT5x/eUVeeQd1OkM8Rj0OAumEHnG6sMgXq1+X45ZHPjUD3WB34FeWtUSA
 t/zTOPSLOpSxtyAM67TuLglIcelTqObJNDq/CT45F85FK/bROUNolXGyUhZopK7yWB
 WG9ufo6b4luSg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=j4rYhMzb
Subject: Re: [Buildroot] [PATCH v3 2/3] package/dns320l-daemon: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Maciej,

On 06/10/23 16:05, Maciej Grela wrote:
> dns320l-daemon is a simple system management daemon for the D-Link DNS-320L
> NAS. It handles power, Wake-on-LAN, temperature, fan speed and some LEDs.
> 
> Signed-off-by: Maciej Grela <enki@fsck.pl>
> ---
>   package/Config.in                             |  1 +
>   .../0001-listen-on-localhost.patch            | 21 ++++++++++
>   package/dns320l-daemon/Config.in              |  8 ++++
>   package/dns320l-daemon/S50dns320l-daemon      | 42 +++++++++++++++++++
>   package/dns320l-daemon/dns320l-daemon.hash    |  1 +
>   package/dns320l-daemon/dns320l-daemon.mk      | 32 ++++++++++++++
>   6 files changed, 105 insertions(+)
>   create mode 100644 package/dns320l-daemon/0001-listen-on-localhost.patch
>   create mode 100644 package/dns320l-daemon/Config.in
>   create mode 100644 package/dns320l-daemon/S50dns320l-daemon
>   create mode 100644 package/dns320l-daemon/dns320l-daemon.hash
>   create mode 100644 package/dns320l-daemon/dns320l-daemon.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 228e9eb1e3..f1c451890f 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2684,6 +2684,7 @@ menu "System tools"
>   	source "package/dcron/Config.in"
>   	source "package/ddrescue/Config.in"
>   	source "package/debianutils/Config.in"
> +	source "package/dns320l-daemon/Config.in"
>   	source "package/docker-cli/Config.in"
>   	source "package/docker-compose/Config.in"
>   	source "package/docker-engine/Config.in"
> diff --git a/package/dns320l-daemon/0001-listen-on-localhost.patch b/package/dns320l-daemon/0001-listen-on-localhost.patch
> new file mode 100644
> index 0000000000..50da024024
> --- /dev/null
> +++ b/package/dns320l-daemon/0001-listen-on-localhost.patch
> @@ -0,0 +1,21 @@
> +# HG changeset patch
> +# User Maciej Grela <enki@fsck.pl>
> +# Date 1696540279 -7200
> +#      Thu Oct 05 23:11:19 2023 +0200
> +# Node ID eca5ed65582402e64c36145290c214aee84b012b
> +# Parent  1f945ce22321a876143b38aaf5610c8915172b90
> +Subject: [PATCH] Listen on localhost by default
> +Signed-off-by: Maciej Grela <enki@fsck.pl>
> +
> +diff -r 1f945ce22321 -r eca5ed655824 dns320l-daemon.ini
> +--- a/dns320l-daemon.ini        Tue Dec 09 12:24:29 2014 +0100
> ++++ b/dns320l-daemon.ini        Thu Oct 05 23:11:19 2023 +0200
> +@@ -4,7 +4,7 @@
> +
> + [Daemon]
> + ServerPort = 57367
> +-ServerAddr = 0.0.0.0
> ++ServerAddr = 127.0.0.1
> + SyncTimeOnStartup = 0
> + SyncTimeOnShutdown = 0
> + DeviceShutdownDelay = 30
> diff --git a/package/dns320l-daemon/Config.in b/package/dns320l-daemon/Config.in
> new file mode 100644
> index 0000000000..35bd30a9e5
> --- /dev/null
> +++ b/package/dns320l-daemon/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_DNS320L_DAEMON
> +	bool "dns320l-daemon"
> +	depends on BR2_USE_MMU # fork()
> +	select BR2_PACKAGE_INIPARSER
> +	help
> +	  MCU Daemon for the D-Link DNS-320L
> +
> +	  https://www.aboehler.at/hg/dns320l-daemon
> diff --git a/package/dns320l-daemon/S50dns320l-daemon b/package/dns320l-daemon/S50dns320l-daemon
> new file mode 100644
> index 0000000000..3bc2a60d0b
> --- /dev/null
> +++ b/package/dns320l-daemon/S50dns320l-daemon
> @@ -0,0 +1,42 @@
> +#!/bin/sh
> +
> +DAEMON="dns320l-daemon"
> +
> +start() {
> +	printf 'Starting %s: ' "$DAEMON"
> +	start-stop-daemon -S -x "/usr/bin/$DAEMON"
> +	status="$?"
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
> +	start-stop-daemon -s INT -K -x "/usr/bin/$DAEMON"
> +}
> +
> +poweroff() {
> +	printf 'Stopping %s: ' "$DAEMON"
> +	start-stop-daemon -s TERM -K -x "/usr/bin/$DAEMON"
> +}
> +
> +restart() {
> +	stop
> +	sleep 1
> +	start
> +}
> +
> +case "$1" in
> +	start|stop|restart)
> +		"$1";;
> +	reload)
> +		restart;;
> +	*)
> +		echo "Usage: $0 {start|stop|restart|poweroff}"
> +		exit 1
> +		;;
> +esac
> diff --git a/package/dns320l-daemon/dns320l-daemon.hash b/package/dns320l-daemon/dns320l-daemon.hash
> new file mode 100644
> index 0000000000..4396eb8f5d
> --- /dev/null
> +++ b/package/dns320l-daemon/dns320l-daemon.hash
> @@ -0,0 +1 @@
> +sha256  eac74a64f0d4127748e629b8a5f723eab58ac83064a3f249f97b85bcd7faf061  tip.tar.bz2
> diff --git a/package/dns320l-daemon/dns320l-daemon.mk b/package/dns320l-daemon/dns320l-daemon.mk
> new file mode 100644
> index 0000000000..bc24a553c2
> --- /dev/null
> +++ b/package/dns320l-daemon/dns320l-daemon.mk
> @@ -0,0 +1,32 @@
> +################################################################################
> +#
> +# dns320l-daemon
> +#
> +################################################################################
> +
> +DNS320L_DAEMON_VERSION = 1.0
> +DNS320L_DAEMON_SOURCE = tip.tar.bz2
> +DNS320L_DAEMON_SITE = https://www.aboehler.at/hg/dns320l-daemon/archive

URL has moved to:
https://gitlab.aboehler.at/andreas/dns320l-daemon

and there are no Releases or git tags, so can you use as VERSION the
latest git SHA1?

Thank you
Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas

> +DNS320L_DAEMON_LICENSE = GPL-3
> +DNS320L_DAEMON_DEPENDENCIES = iniparser
> +DNS320l_DAEMON_PATCH = 0001-listen-on-localhost.patch
> +
> +define DNS320L_DAEMON_BUILD_CMDS
> +	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> +		CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
> +endef
> +
> +define DNS320L_DAEMON_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/dns320l-daemon $(TARGET_DIR)/usr/bin/
> +	$(INSTALL) -D -m 0600 $(@D)/dns320l-daemon.ini $(TARGET_DIR)/etc/
> +endef
> +
> +define DNS320L_DAEMON_INSTALL_INIT_SYSTEMD
> +	$(INSTALL) -D -m 0644 $(@D)/dns320l-daemon.service $(TARGET_DIR)/lib/systemd/system/
> +endef
> +
> +define DNS320L_DAEMON_INSTALL_INIT_SYSV
> +	$(INSTALL) -D -m 0755 package/dns320l-daemon/S50dns320l-daemon $(TARGET_DIR)/etc/init.d/S50dns320l-daemon
> +endef
> +
> +$(eval $(generic-package))


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
