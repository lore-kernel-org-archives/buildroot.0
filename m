Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9754BEB64DC
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 20:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BAA0403E9;
	Sat,  1 Jul 2023 20:44:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BAA0403E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z--DgKVJdq-M; Sat,  1 Jul 2023 20:44:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E4574010C;
	Sat,  1 Jul 2023 20:44:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E4574010C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DD1B71BF2B7
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 20:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ADD9381E63
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 20:44:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADD9381E63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ME_zWuPYNIy0 for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 20:44:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8354081E60
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8354081E60
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 20:44:19 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5AC6F1C0002;
 Sat,  1 Jul 2023 20:44:16 +0000 (UTC)
Date: Sat, 1 Jul 2023 22:44:15 +0200
To: Konstantin Menyaev via buildroot <buildroot@buildroot.org>
Message-ID: <20230701224415.31c0c417@windsurf>
In-Reply-To: <20230616012324.75426-1-KAMenyaev@sberdevices.ru>
References: <20230616012324.75426-1-KAMenyaev@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688244256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EVgSmjnDSgCi0iolnAdLMZpD6Uwa7ykSetCwRO1fu5I=;
 b=gdNPYs/eNAnX3DkX3+Mgz1eR33jKGtNjVSEd6DX45pYnkVF/CDnAsQR0pFEUwSQgkhUcsk
 KTA1wCh77W8qm8SMfdYiVEYBpUxVVyzAdt+am0XmLz75SGVonM/Cu0vTbpryDuw9rMCCy2
 1+qty9DqAgNk8YadMJb8/HLdHFw0ykfVLGLNMuNF2Hlo7QEbebtIlqMz3GWkRThADk9LQ2
 W+AYYxwZl7VsM9tIyn5g8TgU0T+PaEArCrb+q5LZ5hcPspuhRiH1OsZWbPakRGlWXzqx2H
 lguDSWbUL1XhEPTlNX9UaiF8T9CTo6tVaUve4Okgjbi3jPlQZJ6ShbIx2QcjVA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gdNPYs/e
Subject: Re: [Buildroot] [PATCH 1/1] package/dnsmasq: provide pidfile along
 with -x flag
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
Cc: KAMenyaev@sberdevices.ru, sdfw_system_team@sberdevices.ru
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Konstantin,

Thanks for your contribution. See below for some feedback.

On Fri, 16 Jun 2023 04:23:24 +0300
Konstantin Menyaev via buildroot <buildroot@buildroot.org> wrote:

> From: Konstantin Menyaev <KAMenyaev@sberdevices.ru>
> 
> Use pidfile for more accurate process match.
> Useful in multiple process instances.
> 
> Signed-off-by: Konstantin Menyaev <KAMenyaev@sberdevices.ru>
> ---
>  package/dnsmasq/S80dnsmasq | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/package/dnsmasq/S80dnsmasq b/package/dnsmasq/S80dnsmasq
> index b052259e87..b2cd56adef 100644
> --- a/package/dnsmasq/S80dnsmasq
> +++ b/package/dnsmasq/S80dnsmasq
> @@ -1,16 +1,21 @@
>  #!/bin/sh
>  
> +NAME="dnsmasq"
> +DAEMON="/usr/sbin/$NAME"
> +PIDFILE="/var/run/$NAME.pid"

This is not correct, as it doesn't match the coding style documented at
https://nightly.buildroot.org/#adding-packages-start-script. I've
therefore changed this to match the expected coding style, which
allowed to drop the ignored check-package warning from
.checkpackageignore about "Variables".

See the final commit at:

  https://gitlab.com/buildroot.org/buildroot/-/commit/0c4c7da2f33cd701f614709e85a097a8751d81a4

I hope I didn't mess up the script while doing this.

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
