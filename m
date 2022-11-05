Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A20C433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 20:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 76AE6403C2;
	Sat,  5 Nov 2022 20:02:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76AE6403C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DDAPRStcl8by; Sat,  5 Nov 2022 20:02:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6AB340273;
	Sat,  5 Nov 2022 20:02:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6AB340273
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 17BF31BF873
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 20:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7AAE81E00
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 20:02:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7AAE81E00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 46NaqO5cm7kK for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 20:02:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0FD781DFD
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B0FD781DFD
 for <buildroot@busybox.net>; Sat,  5 Nov 2022 20:02:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BBDFE40005;
 Sat,  5 Nov 2022 20:02:18 +0000 (UTC)
Date: Sat, 5 Nov 2022 21:02:17 +0100
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20221105210217.208d5cf6@windsurf>
In-Reply-To: <20221105080348.1228426-1-francois.perrad@gadz.org>
References: <20221105080348.1228426-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667678539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dDjBX1AtNqafuD/nQcNA5KEo/FRy7RgGODlCKJBNGVA=;
 b=G2vIm3Uzo9LXjZwlZtAeZt3onlxzxvw9GvEloUazprSVlpLWcKIKmPPzGVazAF8Q4XrgeY
 qMLcVs6j+LkReq/SfIdWEwKlxnUfyE6X3YuBCfhwdUdHz35dHS/mTtbmRoNKJsngLyStAr
 BFKv5QOeAtd8SyBm4mGOEoZDqKlQSkzuQTse+HOioAmzFVMixNDTBGEMOS73iWXTVKAaXj
 YJZcaMCk3pzVrliVyHAYcoYGuFhWAFfLSGBLtnzYJLuQMKK5Mq5rJesgp6RpBaK3hmkaWJ
 JYIolblN8mP3inKsbgZzeV6NihTHZfm4C5ttwPbHQVwFlvHt6thSPHZK0MLneA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=G2vIm3Uz
Subject: Re: [Buildroot] [PATCH] package/gdk-pixbuf: bump to version 2.42.10
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

On Sat,  5 Nov 2022 09:03:48 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/gdk-pixbuf/gdk-pixbuf.hash | 4 ++--
>  package/gdk-pixbuf/gdk-pixbuf.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
