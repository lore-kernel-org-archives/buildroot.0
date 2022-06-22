Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A941AC43334
	for <buildroot@archiver.kernel.org>; Wed, 22 Jun 2022 20:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 506E6612A8;
	Wed, 22 Jun 2022 20:35:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 506E6612A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GmJ6GXrmLAfv; Wed, 22 Jun 2022 20:35:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FE0260E82;
	Wed, 22 Jun 2022 20:35:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FE0260E82
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E4F0D1BF3B9
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 20:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC4DC417A5
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 20:35:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC4DC417A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XUsJSHVlcAfd for <buildroot@lists.busybox.net>;
 Wed, 22 Jun 2022 20:35:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 655624177F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 655624177F
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 20:35:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d108:8c48:c119:a22b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 64803B004B6;
 Wed, 22 Jun 2022 22:35:37 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 22 Jun 2022 22:35:37 +0200
Date: Wed, 22 Jun 2022 22:35:37 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20220622203537.GD2608@scaer>
References: <20220622184824.289640-1-aduskett@gmail.com>
 <20220622184824.289640-3-aduskett@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220622184824.289640-3-aduskett@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1655930141;
 bh=1D0CVZ0MA9bwQpZPiayqdGo3gMu9IU0TwLV1Pdf2AHM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gMllwjWbQHLlIfqbv/quD0dGp41DMP4bolBRuQGBKrVQO8oy2p4a09y9HwPleUEhq
 p9+UL4Wljvivf/bESf6Y1SCdwB9pRSJiYfN/yR5ld0zKGef8dqhxIgQq4HPMfZvvDF
 9NR6bjJ0HzeER60C+wMZ9YuqnJ537gpDQoSrORDNIlHJbRe4QBEDKoVf2j5FMhJMTy
 8W1+kA71YZtYgmYqBigUwYfnpx1CcgM3/NUQwNCgM+ptwxPSiyFK8PZBmBhxdSyKXJ
 hIZP0uRVuTb9qZ1X9pZik+kZUmyXX1tYa21u4iZSRWH5h1pGMf4rBFy8gqoCXOW36l
 ihVAnIxb2J8dQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gMllwjWb
Subject: Re: [Buildroot] [PATCH 3/5] package/mender/S42mender: fix check-pkg
 and shellcheck warnings
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Anisse Astier <anisse@astier.eu>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adam, All,

On 2022-06-22 11:48 -0700, Adam Duskett spake thusly:
> Copy the basic syntax of package/polkit/S50polkit and change the following:
> 
>   - Add DAEMON, DAEMON_PATH, PIDFILE and DAEMON_ARGS variables.
>   - Fix shellcheck warning SC2166 on line 16.
>   - Fix shellcheck warning SC2181 on lines 29 and 34 by assigning the return
>     code from the start-stop-daemon binary to a variable, and then check the
>     value of the variable.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mender/S42mender | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/package/mender/S42mender b/package/mender/S42mender
> index dc60f94f8b..29008beca0 100644
> --- a/package/mender/S42mender
> +++ b/package/mender/S42mender
> @@ -2,6 +2,10 @@
>  #
>  # Starts mender service.
>  #
> +DAEMON="mender"
> +DAEMON_PATH="/usr/bin/mender"
> +PIDFILE="/var/run/${DAEMON}.pid"
> +DAEMON_ARGS="-daemon"
>  
>  start() {
>  	# If /var/lib/mender is a symlink to /var/run/mender, and
> @@ -9,8 +13,7 @@ start() {
>  	#     create the directory pointed to by the symlink.
>  	#   - the filesystem is RW (i.e. we can rm the symlink),
>  	#     replace the symlink with an actual directory
> -	if [ -L /var/lib/mender \
> -	     -a "$(readlink /var/lib/mender)" = "/var/run/mender" ]
> +	if [ -L /var/lib/mender ] && [ "$(readlink /var/lib/mender)" = "/var/run/mender" ]
>  	then
>  		if rm -f /var/lib/mender >/dev/null 2>&1; then
>  			mkdir -p /var/lib/mender
> @@ -23,15 +26,16 @@ start() {
>  
>  	printf "Starting mender service: "
>  	umask 077
> -
> -	start-stop-daemon -S -q -b -m -p /var/run/mender.pid \
> -		--exec /usr/bin/mender -- daemon
> -	[ $? = 0 ] && echo "OK" || echo "FAIL"
> +	start-stop-daemon -bmSqp "$PIDFILE" -x ${DAEMON_PATH} -- ${DAEMON_ARGS}
> +	status=$?
> +	[ "${status}" = 0 ] && echo "OK" || echo "FAIL"
>  }
> +
>  stop() {
>  	printf "Stopping mender service: "
> -	start-stop-daemon -K -q -p /var/run/mender.pid
> -	[ $? = 0 ] && echo "OK" || echo "FAIL"
> +	start-stop-daemon -Kqp "$PIDFILE"
> +	status=$?
> +	[ "${status}" = 0 ] && echo "OK" || echo "FAIL"
>  }
>  restart() {
>  	stop
> @@ -49,7 +53,7 @@ case "$1" in
>  		restart
>  		;;
>  	*)
> -		echo "Usage: $0 {start|stop|restart}"
> +		echo "Usage: $0 {start|stop|reload|restart}"
>  		exit 1
>  esac
>  
> -- 
> 2.36.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
