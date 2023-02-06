Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5342C05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 11:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F77D415DD;
	Mon,  6 Feb 2023 11:35:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F77D415DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fo3vq-LbE5N3; Mon,  6 Feb 2023 11:35:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A5EA41570;
	Mon,  6 Feb 2023 11:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A5EA41570
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 589DC1BF397
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 11:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F2C9815AB
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 11:35:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F2C9815AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IZIqmZgx0iUG for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 11:35:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0EB281587
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D0EB281587
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 11:35:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id DC04B13F8E3;
 Mon,  6 Feb 2023 12:35:01 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 06 Feb 2023 12:35:01 +0100
Date: Mon, 6 Feb 2023 12:35:01 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <20230206113501.GD3565@scaer>
References: <20230131142003.1354787-1-troglobit@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230131142003.1354787-1-troglobit@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675683305;
 bh=r0FuWaIVouXk1fLP9dmlivq2rQnLLE/cRRBSIoKhVv8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tnuVM3EDnkI4LLhiLIqKoswGTfPnVVovVg7ZYs9HLbMwbTQyEXJdyw9tykK/oCvjK
 S44uC9AQDGnwwuJmdc4Q4Jj97iknhR/IPlXq1FgSNpZabdImRfWYpS4YzdUyaB/WE/
 SukiMl+dib/xqCXmNe0+WLmtHGbEn//aMFbwWl1tkd2sck6P0LWQsOMOV6jaij9bHJ
 63DJRGFzCksIDSCYVu/fvmVV9Cq2jej204i5SsHacxk5wZ6Y6cRhZWQCETOkTuILlz
 uHC0QlvunNy+zjMiCMbIR90h8+XjyjnoTUSxFjwbEQI2WF+o4vfwc3tk/WIe07WPP7
 f/jBN7MaO3nlg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tnuVM3ED
Subject: Re: [Buildroot] [PATCH 1/1] package/netopeer2: fix sysv init script,
 does not start
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Joachim, All,

On 2023-01-31 15:20 +0100, Joachim Wiberg spake thusly:
>  - The netopeer server forks to background by default, no need for '-b'
>  - The path to the daemon is /usr/sbin, not /usr/bin
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/netopeer2/S52netopeer2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/netopeer2/S52netopeer2 b/package/netopeer2/S52netopeer2
> index cf53a8f109..cadd6b9feb 100644
> --- a/package/netopeer2/S52netopeer2
> +++ b/package/netopeer2/S52netopeer2
> @@ -8,7 +8,7 @@ NETOPEER2_SERVER_ARGS=""
>  start() {
>  	printf 'Starting %s: ' "$DAEMON"
>  
> -	start-stop-daemon -S -b -q -p $PIDFILE -x "/usr/bin/$DAEMON" \
> +	start-stop-daemon -S -q -p $PIDFILE -x "/usr/sbin/$DAEMON" \
>  		-- $NETOPEER2_SERVER_ARGS
>  	status=$?
>  	if [ "$status" -eq 0 ]; then
> -- 
> 2.34.1
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
