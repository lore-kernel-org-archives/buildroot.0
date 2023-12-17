Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B85C3DA6E
	for <buildroot@archiver.kernel.org>; Sun, 17 Dec 2023 21:43:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD04081E2F;
	Sun, 17 Dec 2023 21:43:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD04081E2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id quDCsf-StUD9; Sun, 17 Dec 2023 21:43:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2500481E2B;
	Sun, 17 Dec 2023 21:43:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2500481E2B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3612E1BF37F
 for <buildroot@lists.busybox.net>; Sun, 17 Dec 2023 21:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09A2F81E2B
 for <buildroot@lists.busybox.net>; Sun, 17 Dec 2023 21:43:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09A2F81E2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ffrc-cXu8o7Q for <buildroot@lists.busybox.net>;
 Sun, 17 Dec 2023 21:43:15 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8ED6681E2A
 for <buildroot@buildroot.org>; Sun, 17 Dec 2023 21:43:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8ED6681E2A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 078CC1BF203;
 Sun, 17 Dec 2023 21:43:11 +0000 (UTC)
Date: Sun, 17 Dec 2023 22:43:11 +0100
To: Baruch Siach via buildroot <buildroot@buildroot.org>
Message-ID: <20231217224311.57b7bad3@windsurf>
In-Reply-To: <dc1be561d66161495c91667e02c816e6d48880ac.1702320987.git.baruch@tkos.co.il>
References: <dc1be561d66161495c91667e02c816e6d48880ac.1702320987.git.baruch@tkos.co.il>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1702849392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZI9vNlmL+19+JGE/rivkAjiEnOtXZUQzeH/W65ywNIQ=;
 b=lReFVEERvooA18S6NQINb3G+QAkSG3ke8erCzTDlcF6/qyh6rU/MFPA7yN+izqkze2FuZg
 DkYWP2JIGN+lUrVoFTaLGiBB+6ommahOhhIoDsUVn6ExL/iX3+bBzQ5PpmgV0MBTbIVXtv
 DMbtHJsxX5yCBDWVnFR4BqoX+J7eQCwbhfH3Jwx2qgyzaaO41vDQCWdpSGUALfZeMHUiEt
 Ooyb/nPcnV9pSUDlxNkFlVSs5s4JaB2HAM4k88wYl9WHSLEM8bqotA1QdVpO6Je7MHwOOY
 8hQeRTAj8Yw3NYoRSCffG+3zl9TfeotqOTfyajvW1FqraY7nYjSjFYvNTpig2w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lReFVEER
Subject: Re: [Buildroot] [PATCH] package/libcurl: fix build with GnuTLS and
 no verbose
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 11 Dec 2023 20:56:27 +0200
Baruch Siach via buildroot <buildroot@buildroot.org> wrote:

> diff --git a/package/libcurl/0001-gnutls-fix-build-with-disable-verbose.patch b/package/libcurl/0001-gnutls-fix-build-with-disable-verbose.patch
> new file mode 100644
> index 000000000000..cc7f89f9762c
> --- /dev/null
> +++ b/package/libcurl/0001-gnutls-fix-build-with-disable-verbose.patch
> @@ -0,0 +1,33 @@
> +From 3b1ed6573bbb95831e5acd01ecac95f2cb2b9a60 Mon Sep 17 00:00:00 2001
> +From: Baruch Siach <baruch@tkos.co.il>
> +Date: Mon, 11 Dec 2023 20:45:01 +0200
> +Subject: [PATCH] gnutls: fix build with --disable-verbose
> +
> +infof() parameters must be defined event with --disable-verbose since
> +commit dac293cfb702 ("lib: apache style infof and trace
> +macros/functions").
> +
> +Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> +Upstream: https://github.com/curl/curl/pull/12505

From what I can see at https://github.com/curl/curl/pull/12505, it
seems like your patch has been merged, but you changed it compared to
what you submitted here.

Could you submit an updated patch to Buildroot, which adds the upstream
applied version of your fix?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
