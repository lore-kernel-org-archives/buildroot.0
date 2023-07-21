Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907FAEB64DD
	for <buildroot@archiver.kernel.org>; Fri, 21 Jul 2023 21:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4400541859;
	Fri, 21 Jul 2023 21:02:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4400541859
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OjpKIWbFgJvq; Fri, 21 Jul 2023 21:02:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 802124017B;
	Fri, 21 Jul 2023 21:02:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 802124017B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 42A2D1BF299
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 21:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B8E9612F7
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 21:02:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B8E9612F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4jvOHj9Z9yWn for <buildroot@lists.busybox.net>;
 Fri, 21 Jul 2023 21:02:44 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AB277610AB
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 21:02:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB277610AB
Received: by mail.gandi.net (Postfix) with ESMTPSA id AD805240006;
 Fri, 21 Jul 2023 21:02:41 +0000 (UTC)
Date: Fri, 21 Jul 2023 23:02:40 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230721230240.59ed6fda@windsurf>
In-Reply-To: <20230721180638.215414-1-bernd@kuhls.net>
References: <20230721180638.215414-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689973362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y5szMcUX1UF2LMxCHMWbr6X6AZDnty3CqgB7SjghQ6c=;
 b=K+xWqL2NHzOHENYLhXvxDk6m8O4ZP8pktg42q7QCCLqCCYHDZWOu+WWCFeKafwakpSNuR0
 RyFzGv7YlO3fVsd1zWpf/EAZ+Dp/U+Os8eGY3hDAm6GnM3/w0i2t1QPicw3BSFAwmXM84Q
 Ab+TDkEFtPOdm8yOXTcVX7XFhWZ7rJyOh4BrkoHR7W2DKttdtfNnLR06xZasq2uZQJVtJS
 8KFOZe3bHQwQ/j+/USmmYzuA5A3dWtyxK/9YtPdOJ4GyL+v3P3GNHLgmhIgZ/RAIt4s9u8
 3z/3Cg2dT5SbS4E44iFux7VfNvoT1GlTGRpIhiBJXnmWx9ig08eoFATDC+Dm4w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=K+xWqL2N
Subject: Re: [Buildroot] [PATCH 1/3] package/libopenssl: remove deprecated
 options
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

On Fri, 21 Jul 2023 20:06:36 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes configure warning:
> ***** Deprecated options: no-crypto-mdebug-backtrace, no-ssl2
> 
> no-ssl2 option was re-added in 2016:
> https://github.com/openssl/openssl/commit/e80381e1a3309f5d4a783bcaa508a90187a48882
> "We warn that it's deprecated, and ignore it otherwise."
> Quoting https://www.openssl.org/docs/man3.0/man3/SSLv23_method.html
> "Support for SSLv2 [... was] removed in OpenSSL 1.1.0."
> Therefore we do not need any legacy handling for
> BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL2.
> 
> no-crypto-mdebug-backtrace was removed in OpenSSL 3.0:
> https://github.com/openssl/openssl/blob/master/NEWS.md?plain=1#L161
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libopenssl/Config.in     | 4 ----
>  package/libopenssl/libopenssl.mk | 3 +--
>  2 files changed, 1 insertion(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
