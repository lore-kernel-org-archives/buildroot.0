Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B31ECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 20:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E5ED60BD2;
	Mon, 31 Oct 2022 20:50:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E5ED60BD2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PBVOWYBZWxvg; Mon, 31 Oct 2022 20:50:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3F8160B5E;
	Mon, 31 Oct 2022 20:50:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3F8160B5E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DABD41BF2F9
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 20:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B564681242
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 20:50:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B564681242
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P9npwhQFRs43 for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 20:50:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D22368109C
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D22368109C
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 20:49:59 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B88D4FF804;
 Mon, 31 Oct 2022 20:49:57 +0000 (UTC)
Date: Mon, 31 Oct 2022 21:49:56 +0100
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <20221031214956.37e0ef12@windsurf>
In-Reply-To: <20221031174632.377586-4-troglobit@gmail.com>
References: <20221031174632.377586-1-troglobit@gmail.com>
 <20221031174632.377586-4-troglobit@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667249398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uoHGtYz3zfWIjxyhfPVQ8j3Ux/KX2yYx5udL9JieOuM=;
 b=NoeHMCvt0a6EavUouwK1853CTaZD0qrCqQxbfjMpd2Hw4IPn+bx3bdJocKRvyholwwhjD+
 INeUAuyhEn3b2zY0s61vI76Rju5LLegcWhaYQbe943DpQIOtjxHNRnQm0k3O3ZYX4T4BW4
 gN2OlcWOWXvMmFJbBqS98jIyQJHee+1XhEZ4aLOu8TIIRVk3rbBmNffIRwn7gS+qAiK6CF
 rDjX5GEF2sqEjjxvh8jpVZ9M2F6fAd77al9110whxLiEGBzt5VCC8KxQlOIQ6INjLdhTUc
 eiZJkSZUZk9T8nsGNkNA4qLboYBXBRllhri8lGkaDR5fz5bweyAoi9sVAnbDeQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NoeHMCvt
Subject: Re: [Buildroot] [PATCH 3/3] package/ssdp-responder: fix warnings
 from check-package and shellcheck
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 31 Oct 2022 18:46:32 +0100
Joachim Wiberg <troglobit@gmail.com> wrote:

> +cmd()
> +{
> +	start-stop-daemon -q -p "$PIDFILE" -x "$DAEMON" "$@"
> +	status=$?
> +	[ $status -eq 0 ] && echo "OK" || echo "FAIL"
> +
> +	return $status
> +}

I don't think we're using this cmd construct anywhere else in the tree,
or did I miss some change in our coding style/policy?

>  
>  start() {
> -	printf 'Starting %s: ' "$NAME"
> -	start-stop-daemon -S -q -p $PIDFILE -x $DAEMON -- $DAEMON_ARGS
> -	[ $? = 0 ] && echo "OK" || echo "FAIL"

This all looked matching our coding style. Why are you changing this?
>  case "$1" in
> -    start|stop|restart)
> -	"$1"
> -	;;
> -    reload)
> -	restart
> -	;;
> -    *)
> -	echo "Usage: $0 {start|stop|restart|reload}"
> -	exit 1
> +	start|stop|restart)
> +		"$1"
> +		;;
> +	reload)
> +		restart
> +		;;
> +	*)
> +		echo "Usage: $0 {start|stop|restart|reload}"
> +		exit 1

I'm not sure what is the recommended indentation style in our init
scripts. Tabs? Spaces?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
