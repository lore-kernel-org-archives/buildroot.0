Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D370C001B0
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 15:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F37FF40412;
	Sun,  6 Aug 2023 15:40:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F37FF40412
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CCYGaA0Bu3tN; Sun,  6 Aug 2023 15:40:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 325C1401D8;
	Sun,  6 Aug 2023 15:40:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 325C1401D8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 876641BF947
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 15:40:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 599604011A
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 15:39:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 599604011A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zgUXGQObTBiL for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 15:39:24 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 49D2040412
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 15:39:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49D2040412
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A79A60003;
 Sun,  6 Aug 2023 15:39:21 +0000 (UTC)
Date: Sun, 6 Aug 2023 17:39:20 +0200
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20230806173920.5cf33387@windsurf>
In-Reply-To: <20230801223741.367162-1-romain.naour@gmail.com>
References: <20230801223741.367162-1-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691336361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kYvsQAy1VkTXxBLXKz1gwAYVGYj+IH+2CO+Mec5nTuI=;
 b=UoY3zgB+i3X6ci6VxRUOM2pxV4sBIBIkuTaJ+9c3GVA7VROuhBAjR6djJxSTVPuEoNUrx3
 9Q+FaiJWsfIFXxNE06L1wIHlQWHy14I6ZsMfBfBIrTaAs0C7mZrJNWbqzqC/mdXO+FgH/V
 Z5kvajUq8ydzwCDiYNKd2h8KgC9obIKlcj4s9dZGnkcyyJFg76S013ea0JPziYaL14xl0V
 omS6ZtpvPn/XisFwfnsSRmCY7ghgYavZXgtUWJy6RcQXraQsWVTtkVxr4wosbAzg/03WV2
 NPsCj0ae+nqZwegJVqIcUxhYPowHwq04uNTxHXpibXepQio1rbWQFAfm/BFWNA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UoY3zgB+
Subject: Re: [Buildroot] [PATCH] package/luvi: bump 2.14
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

On Wed,  2 Aug 2023 00:37:41 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> lua-openssl (0.7.8-0) bundled in luvi 2.13 fail to build with openssl-3.x
> 
> test-output/TestLuvi/build/luvi-2.13.0/deps/lua-openssl/src/lbn.c:28:27: error: expected ')' before 'SHLIB_VERSION_NUMBER'
>    28 |       "based on OpenSSL " SHLIB_VERSION_NUMBER
>       |                           ^~~~~~~~~~~~~~~~~~~~
> 
> Luvi 2.14 include an lua-openssl update to 0.8.2-0 fixing TestLuvi.
> 
> See:
> https://github.com/luvit/luvi/releases/tag/v2.14.0
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561386
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/luvi/luvi.hash | 2 +-
>  package/luvi/luvi.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
