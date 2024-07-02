Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BBEC3065C
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 20:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 904664155D;
	Tue,  2 Jul 2024 20:15:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id phCdXbFGSdXx; Tue,  2 Jul 2024 20:15:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27C284156E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27C284156E;
	Tue,  2 Jul 2024 20:15:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 40EF31BF976
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 20:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2DC854156E
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 20:15:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iLJCLVK1pU0W for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 20:15:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D9D524155D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9D524155D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D9D524155D
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 20:15:47 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1087F13F838;
 Tue,  2 Jul 2024 22:15:43 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 02 Jul 2024 22:15:42 +0200
Date: Tue, 2 Jul 2024 22:15:42 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fiona Klute <fiona.klute@gmx.de>
Message-ID: <ZoRf7pXimhw4wh-s@landeda>
References: <20240702165708.3796162-1-fiona.klute@gmx.de>
 <20240702165708.3796162-2-fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240702165708.3796162-2-fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1719951345;
 bh=mfGWfDfumtcKKxzOXxIJEfHUnPFEBPCH+SYjRlgIK3Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nyw5rnKWspw3Wk6L1Ld8VVXUeHQs9S3VYIeXlkXJNvi/mmhCWf5eApJPqXzYYMCBW
 xpFFKaMQGgf6JE1ifYK+u4qcvBUv0T14WewZ3PYoQScqPcdV7h3Dm7tVbEJ+MlmReu
 JOMve60crqTI9Dz9p4ODh2lGQ251XzDUszZzIppHyrQY9ITrjUl1nTokN7QqsQxn42
 reP1skHK97UnFuLRIgCFmg0qxMHwLLpuJQ4QqXcAxmTUgLKi/NJ1SybB1ZKRh6V1jp
 7aJ+QRfNNiPwrHKhfLkJsdy6+vDC9t1MUKOQmVFiQirKPyrMFrFtRxX552j2jvnsZg
 KkD7YwDiOOLwg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nyw5rnKW
Subject: Re: [Buildroot] [PATCH v2 1/4] package/openssh: don't kill open
 sessions on restart
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fiona, All,

On 2024-07-02 18:57 +0200, Fiona Klute via buildroot spake thusly:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> The previously used "killall sshd" stopped all instances of sshd. With
> OpenSSH before 9.8 that meant not only the listening server, but also
> instances serving currently open sessions, possibly including the one
> used to send the restart command, preventing it from completing the
> "start" part of "restart" and leaving the system unreachable over SSH.
> 
> Instead, use the PID file that sshd creates by default to target only
> the listening server. This leaves any open SSH sessions unaffected.

Rather than play with the PID ourselves, can we use start-stop-daemon
instead? Currently, we run sshd and it daemonises all by itself, but if
we pass -D, then start-stop-daemon will be able to do that, and handle
the PID file automatically for us.

Regards,
Yann E. MORIN.

> With OpenSSH 9.8 open sessions are handled by the separate
> sshd-session binary so killall does not hit them any more, but
> a targeted "kill" command is still desirable.
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> ---
[--SNIP--]
> diff --git a/package/openssh/S50sshd b/package/openssh/S50sshd
> index 22da41d1ca..f1ff9dfec1 100644
> --- a/package/openssh/S50sshd
> +++ b/package/openssh/S50sshd
> @@ -3,6 +3,8 @@
>  # sshd        Starts sshd.
>  #
> 
> +PIDFILE="/var/run/sshd.pid"
> +
>  # Make sure the ssh-keygen progam exists
>  [ -f /usr/bin/ssh-keygen ] || exit 0
> 
> @@ -14,15 +16,25 @@ start() {
> 
>  	printf "Starting sshd: "
>  	/usr/sbin/sshd
> -	touch /var/lock/sshd
>  	echo "OK"
>  }
> +
>  stop() {
>  	printf "Stopping sshd: "
> -	killall sshd
> -	rm -f /var/lock/sshd
> +	pid="$( cat "${PIDFILE}" 2>/dev/null || true )"
> +	if [ -z "${pid}" ]; then
> +		echo "ERROR: not running"
> +		return 1
> +	fi
> +	kill "${pid}"
> +	# SSHD deletes its PID file when exiting, wait for it to
> +	# disappear.
> +	while [ -f "${PIDFILE}" ]; do
> +		sleep 0.1
> +	done
>  	echo "OK"
>  }
> +
>  restart() {
>  	stop
>  	start
> @@ -44,4 +56,3 @@ case "$1" in
>  esac
> 
>  exit $?
> -
> --
> 2.45.2
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
