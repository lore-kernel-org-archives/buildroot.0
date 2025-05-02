Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC7EC3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91F2580DBE;
	Fri,  2 May 2025 10:26:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t4_PgYI_Hczx; Fri,  2 May 2025 10:26:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD64680E15
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD64680E15;
	Fri,  2 May 2025 10:26:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 73A1A229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 653BE407DA
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:26:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nlZoFE2CL8u9 for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:26:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 223E34002C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 223E34002C
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 223E34002C
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:26:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3F3191C1112; Fri,  2 May 2025 12:26:43 +0200 (CEST)
Message-ID: <5b0b6922-a570-4179-a622-9fd1493eb00e@rnout.be>
Date: Fri, 2 May 2025 12:26:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: Titouan Christophe <titouanchristophe@gmail.com>
References: <20250331171212.1059104-1-fiona.klute@gmx.de>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250331171212.1059104-1-fiona.klute@gmx.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746181603; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=7QIIq0Ynult2k01L68IooZKOpr0vH6U8hPFNaVk2Dxs=;
 b=cTyuMbeGGjEKNOz4shnLbQgZjcWOwPKYQMsY6FY7H3mmgM2htfrx0ScDL5lzcr+w2CEJAq
 VWT6aFnOULBGdLvNkSwNvrZECLq7jY0mQ7K11GBabKHUhDTrFwK6Jf870YvLnHRaobZEbx
 +zd3pqUEKGIF8kutbtiDcFZLflWgVApb3ad41deb1D1AypBokkR+9dH5EOhh1Sn4i8XE7s
 Yl7nrAm6Fd+rfn+KxCD6VapdFvl/KG4i+PEvVV18wXzMezqHHPk15AHIbKlWOSjwtSFs3u
 fWcj3NFBeqSMfkIlUCwUse6bGDc3kSLvG5pxlHQrlO09UBWlOQ6zePQRGayMPg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=cTyuMbeG
Subject: Re: [Buildroot] [PATCH 1/1] package/mosquitto: fix init script
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 31/03/2025 19:12, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> Restart would regularly fail because it did not wait for the old
> process to be gone before starting the new one. Rewrite the script
> according to current style to fix that, and add reload support (see
> mosquitto docs for limitations of reload).
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
> 
> Policy question: Mosquitto supports configuring a PID file in the
> configuration, but not on the command line. Using that would improve
> the init script: We could let Mosquitto fork to background on its own,
> instead of via start-stop-daemon. The default config would be easy to
> adjust, but it would require people already using Mosquitto with
> custom config files to adjust those to add the pid_file setting. Would
> that be preferable for Buildroot? If yes, I can update the patch.
> 
>   .checkpackageignore            |  1 -
>   package/mosquitto/S50mosquitto | 79 +++++++++++++++++++++++++---------
>   2 files changed, 59 insertions(+), 21 deletions(-)
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 5350c6633a..2f9c65c8a3 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -823,7 +823,6 @@ package/mono-gtksharp3/0001-Fixes-MONO_PROFILE_ENTER_LEAVE-undeclared.patch lib_
>   package/mono-gtksharp3/0002-Mono-compilation-error-branch.patch lib_patch.Upstream
>   package/mono/0001-Fix-linkage-with-a-system-libatomic_ops-shared-library.patch lib_patch.Upstream
>   package/mono/0002-Ongoing-work-on-the-cmake-build.patch lib_patch.Upstream
> -package/mosquitto/S50mosquitto Shellcheck lib_sysv.Indent lib_sysv.Variables
>   package/motion/S99motion Shellcheck lib_sysv.Indent lib_sysv.Variables
>   package/mpir/0001-mpn-arm-udiv.asm-workaround-binutils-bug-14887.patch lib_patch.Upstream
>   package/mpv/0001-fix-powerpc64-altivec.patch lib_patch.Upstream
> diff --git a/package/mosquitto/S50mosquitto b/package/mosquitto/S50mosquitto
> index 5241a071d7..89989179c1 100644
> --- a/package/mosquitto/S50mosquitto
> +++ b/package/mosquitto/S50mosquitto
> @@ -1,35 +1,74 @@
>   #!/bin/sh
>   
> +DAEMON="mosquitto"
> +PIDFILE="/var/run/$DAEMON.pid"
> +MOSQUITTO_CONF="/etc/mosquitto/mosquitto.conf"
> +
> +[ -f "$MOSQUITTO_CONF" ] || exit 0
> +
>   start() {
> -	printf "Starting mosquitto: "
> -	start-stop-daemon -S -q -m -b -p /var/run/mosquitto.pid \
> -		--exec /usr/sbin/mosquitto \
> -		-- -c /etc/mosquitto/mosquitto.conf
> -	[ $? = 0 ] && echo "OK" || echo "FAIL"
> +	printf "Starting %s: " "$DAEMON"
> +	start-stop-daemon --start --background --make-pidfile \
> +		--pidfile "$PIDFILE" --exec "/usr/sbin/$DAEMON" \
> +		-- -c "$MOSQUITTO_CONF"
> +	status=$?
> +	if [ "$status" -eq 0 ]; then
> +		echo "OK"
> +	else
> +		echo "FAIL"
> +	fi
> +	return "$status"
>   }
> +
>   stop() {
> -	printf "Stopping mosquitto: "
> -	start-stop-daemon -K -q -p /var/run/mosquitto.pid
> -	[ $? = 0 ] && echo "OK" || echo "FAIL"
> +	printf "Stopping %s: " "$DAEMON"
> +	start-stop-daemon --stop --pidfile "$PIDFILE" \
> +		--exec "/usr/sbin/$DAEMON"
> +	status=$?
> +	if [ "$status" -eq 0 ]; then
> +		echo "OK"
> +	else
> +		echo "FAIL"
> +		return "$status"
> +	fi
> +	while start-stop-daemon --stop --test --quiet --pidfile "$PIDFILE" \
> +		--exec "/usr/sbin/$DAEMON"; do
> +		sleep 0.1
> +	done
> +	rm -f "$PIDFILE"
> +	return "$status"
>   }
> +
>   restart() {
>   	stop
>   	start
>   }
>   
> +reload() {
> +	printf "Reloading %s config: " "$DAEMON"
> +	start-stop-daemon --stop --signal HUP -q --pidfile "$PIDFILE" \
> +		--exec "/usr/sbin/$DAEMON"
> +	status=$?
> +	if [ "$status" -eq 0 ]; then
> +		echo "OK"
> +	else
> +		echo "FAIL"
> +	fi
> +	return "$status"
> +}
> +
>   case "$1" in
> -  start)
> -	start
> -	;;
> -  stop)
> -	stop
> -	;;
> -  restart|reload)
> -	restart
> -	;;
> -  *)
> -	echo "Usage: $0 {start|stop|restart}"
> -	exit 1
> +	start)
> +		start;;
> +	stop)
> +		stop;;
> +	restart)
> +		restart;;
> +	reload)
> +		reload;;
> +	*)
> +		echo "Usage: $0 {start|stop|restart|reload}"
> +		exit 1
>   esac
>   
>   exit $?

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
