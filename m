Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F51EEB56E
	for <buildroot@archiver.kernel.org>; Fri,  8 Sep 2023 20:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21FEF41DAD;
	Fri,  8 Sep 2023 20:24:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21FEF41DAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DzVR1_QnvrWM; Fri,  8 Sep 2023 20:24:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BC9041D81;
	Fri,  8 Sep 2023 20:24:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BC9041D81
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DE54C1BF2BA
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 20:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A8E7460BBE
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 20:24:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8E7460BBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SksW8EhxzlhQ for <buildroot@lists.busybox.net>;
 Fri,  8 Sep 2023 20:24:11 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7B48060881
 for <buildroot@buildroot.org>; Fri,  8 Sep 2023 20:24:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B48060881
Received: by mail.gandi.net (Postfix) with ESMTPSA id F3E3F1C0009;
 Fri,  8 Sep 2023 20:24:07 +0000 (UTC)
Date: Fri, 8 Sep 2023 22:24:07 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20230908222407.1740ce1f@windsurf>
In-Reply-To: <20230906201358.2714756-1-christian@aperture.us>
References: <20230906201358.2714756-1-christian@aperture.us>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694204648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TOPaSBimM2K+XWHoXWjO8uKCJuY7j4oVTmzPPoY467Y=;
 b=c90Un1jyF9MADv7O1XBgfIzEU0WEEaBGhUynl7+OQXEUbZjYOOec9kUZdw9O5YoGaO1Xx0
 hoIWf3otASwMkORut4SnZ/qUEAmEoP5asi3IYn1Jbd5/eb08+VkI4UKYe8ZuVz9PDkX+wt
 0vLt8/V3AfE1J+sz0kUcmS6R7IIpaOQwZ2esdBWhYaRlPAN1UcPlJ8mUzxCJ2I74wSCkpk
 OzGTPG4DnAt5bo3JQ0IkUhJ97Ct/73UWYO8S0g/SWtnRDUiKuZY8XKWmMD3cQqqvyTxVxA
 89iox5P138z3aFh5J6GbaSBp0gh1tqUo/iUmd9j3nB8WzknBR3UMbP6MNMiy+w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=c90Un1jy
Subject: Re: [Buildroot] [PATCH 1/1] package/go: security bump to version
 1.20.8
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
Cc: Anisse Astier <anisse@astier.eu>, Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  6 Sep 2023 13:13:58 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> go1.20.8 (released 2023-09-06) includes two security fixes to the html/template
> package, as well as bug fixes to the compiler, the go command, the runtime, and
> the crypto/tls, go/types, net/http, and path/filepath packages.
> 
> CVE-2023-39318: html/template: improper handling of HTML-like comments within script contexts
> CVE-2023-39319: html/template: improper handling of special tags within script contexts
> CVE-2023-39321: crypto/tls: panic when processing post-handshake message on QUIC connections
> 
> https://go.dev/doc/devel/release#go1.20.0
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>

This is not relevant for the master branch, which already has 1.21.1.
However, this patch is applicable to 2023.08.x. For 2023.05.x and
2023.02.x, the 1.19.x series is used, so we would need an updated to
1.19.13 I believe.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
