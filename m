Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C84C001DB
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 10:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 244AB41B97;
	Sat, 12 Aug 2023 10:50:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 244AB41B97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Qpst9Qs37uY; Sat, 12 Aug 2023 10:50:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2114040350;
	Sat, 12 Aug 2023 10:50:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2114040350
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 87DA91BF288
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 10:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5407E60E30
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 10:50:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5407E60E30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wn1CfjeUhPZb for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 10:50:54 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4C0C760C0E
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 10:50:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C0C760C0E
Received: by mail.gandi.net (Postfix) with ESMTPSA id 591C3E0004;
 Sat, 12 Aug 2023 10:50:52 +0000 (UTC)
Date: Sat, 12 Aug 2023 12:50:51 +0200
To: Bartosz Bilas <b.bilas@grinn-global.com>
Message-ID: <20230812125051.4b8b0b84@windsurf>
In-Reply-To: <20230811093421.300794-1-b.bilas@grinn-global.com>
References: <20230811093421.300794-1-b.bilas@grinn-global.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691837452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2D7UwhRLJCI9LKg2oHlR817iiuzoMjI4aU81N9G3kpU=;
 b=Jj81Gi9dOKyRIJWfr0bO2DL4oQ+LiZbOe3aHiWWMzxGfNc95zI9ClSazHEIg7LmF/A/tDJ
 mYGah6v8SJVX6pBf5kUcBYGb5ZUaKVHMEjnYP2RCVLbD/9vO8x18SL4jqI5baCHx/ezP6J
 sPUftxOSTqMmJAjCyHoeT9KM+XDOVtQHeWxft/gfmhpgTHSDg85iahE/WwTHah/6/elp4n
 MJV3L4DOmQPO1SLKB4ItyZVyetRmme3TfT5JT41NenNQf3k0hCfrAUuWhdR/V5Cvc4DUSr
 eMQQEG2OZjrh5GdDnALOVomYqTiY5ONJVVT01+QChLv1nvg/T5xQ54MSw9kfrg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Jj81Gi9d
Subject: Re: [Buildroot] [PATCH] gdb: disable source-highlight
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

On Fri, 11 Aug 2023 11:34:21 +0200
Bartosz Bilas <b.bilas@grinn-global.com> wrote:

> It's being found from the host's source-highlight library
> which results in the following build errors:
> 
> ../../gdb/source-cache.c:37:10: fatal error: srchilite/sourcehighlight.h: No such file or directory
>    37 | #include <srchilite/sourcehighlight.h>
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[4]: *** [Makefile:1645: source-cache.o] Error 1
> make[4]: *** Waiting for unfinished jobs....
> 
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>

Thanks patch applied to master, after updating the commit title to use
"package/gdb: " as the prefix, to follow our convention.

Also, I am wondering if the same should not be done for the host
variant of gdb. Indeed, we don't want to rely on the system-provided
source highlight if it's not built by Buildroot. Could you have a look
into this, and if it makes sense, send a patch?

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
