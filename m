Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2B3CA0EC4
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 20:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABFE641874;
	Mon, 11 Sep 2023 20:56:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABFE641874
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wqATwrl07p86; Mon, 11 Sep 2023 20:56:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FEB6417BE;
	Mon, 11 Sep 2023 20:56:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FEB6417BE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5568F1BF3A9
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 20:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0076D6105D
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 20:56:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0076D6105D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T5dH1csF8DF8 for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 20:56:11 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E9EB96105A
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 20:56:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9EB96105A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3FD3C1C0009;
 Mon, 11 Sep 2023 20:55:51 +0000 (UTC)
Date: Mon, 11 Sep 2023 22:55:50 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230911225550.4fd56980@windsurf>
In-Reply-To: <ZPQ7D+xaRQDl1n8L@waldemar-brodkorb.de>
References: <ZPQ7D+xaRQDl1n8L@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694465769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2bJnMXVZxAmwJcT9LRH0e8A/dO2j13ZMQ1LrrRw0Gps=;
 b=Jek+dIjAmCF/BzTii2r1ZVCObS9TBa4cORTu7o02R/wK0IhUPtNDw4GFTcwVGSJuTJqW4c
 mnXTI6y//qhENBBQ7SSX0xAnFA7ndqUDovwmQezh8WIrbyyx7JjD3q1M3Wnb72roHtFcdL
 Ip0Cke3jWyoEJpZxQu/79gjCHl6FAGLjQMDgmxKMBlC922uMNdDS5dFcJHA+mADczzQ0Kj
 9fBHLRdNe9sglp9jIqJh0DNMTBUu1gPeVu2YZYLO939f8RdI2U1A5Vq5BHfj8BmRFr/c25
 /eh2Awb57MVJhVXxgri6RJl8r9wtbbKuno6iE62nnlElby34mIJbrAKWEn0rJQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Jek+dIjA
Subject: Re: [Buildroot] [PATCH] package/xterm: fix compilation with uClibc
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

On Sun, 3 Sep 2023 09:51:43 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Compile errors out with:
> ./util.c: In function 'decode_wcwidth':
> ./util.c:5506:26: error: 'wcwidth' undeclared (first use in this function); did you mean 'mk_wcwidth'?
>  5506 |             my_wcwidth = wcwidth;
>       |                          ^~~~~~~
>       |                          mk_wcwidth
> ./util.c:5506:26: note: each undeclared identifier is reported only once for each function it appears in
> 
> uClibc only exposes wcwidth when __USE_XOPEN is defined.

According to the wcwidth manpage, it's _XOPEN_SOURCE that needs to be
defined:

SYNOPSIS
       #define _XOPEN_SOURCE       /* See feature_test_macros(7) */
       #include <wchar.h>

       int wcwidth(wchar_t c);

I guess __USE_XOPEN is a more "internal" thing.

> diff --git a/package/xterm/0001-uClibc-wcwidth.patch b/package/xterm/0001-uClibc-wcwidth.patch
> new file mode 100644
> index 0000000000..ee0416ec78
> --- /dev/null
> +++ b/package/xterm/0001-uClibc-wcwidth.patch
> @@ -0,0 +1,13 @@
> +Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> +Upstream: N/A patch sent via email

Meh these upstream projects not using Git... :/

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
