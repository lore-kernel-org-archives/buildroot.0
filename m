Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E3FC4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 22:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20E7F60B93;
	Wed,  8 Nov 2023 22:26:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20E7F60B93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3CB8Ha6Ge-oU; Wed,  8 Nov 2023 22:26:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 529B760B6F;
	Wed,  8 Nov 2023 22:26:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 529B760B6F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A13091BF40B
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 22:26:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 86F5F60B6F
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 22:26:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86F5F60B6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mm7xdC4ywIha for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 22:26:48 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6859860AAF
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 22:26:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6859860AAF
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0E56260004;
 Wed,  8 Nov 2023 22:26:44 +0000 (UTC)
Date: Wed, 8 Nov 2023 23:26:44 +0100
To: Oleg Lyovin via buildroot <buildroot@buildroot.org>
Message-ID: <20231108232644.24817d72@windsurf>
In-Reply-To: <20231107132323.3324587-1-ovlevin@salutedevices.com>
References: <20231107132323.3324587-1-ovlevin@salutedevices.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699482405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QTpomQNRZSmrRXpX7zdycbSNM1km88TJkX6RYMGtH/Y=;
 b=VY8Dqf6WX5sKOejUV6+b+Ll5z0x0PvkQw2aN1y6NXSZC+G+3uBCGAJV5LyUZtzJNZAvJA4
 B6VdE6qbLQ1H60bStiIPkHafj3pOc++JwSUHDbitsScFQh0D975u7I1T+vhPNzhAYqXNHU
 mNs2oFdzZ1rPRCC/7/nq0aO8rWQ0c//oKiG8lFh8VWX+Kcigv9qAXDup8Sp6cjxFjE7pHH
 M8K+fKwUp8rEY4PaJN2k7FmtaTiqmNfwNyrT6fKClpFD6QoGyezQ46xmaivcxbw+YI5Y6h
 L/rqqhLuITTawCvGwhVQwEiUxWUXRWX+8opTgo1qigq/ISGnQaFVrHaJpPpHtg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VY8Dqf6W
Subject: Re: [Buildroot] [PATCH 1/1] package: dhcpcd: fix dhcpcd binary not
 stripped
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
Cc: John Stile <johns@msli.com>, olegartys@gmail.com,
 Oleg Lyovin <ovlevin@salutedevices.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Oleg,

On Tue, 7 Nov 2023 16:23:23 +0300
Oleg Lyovin via buildroot <buildroot@buildroot.org> wrote:

> By default dhcpcd installed with 555 permissions as it is
> configured in its Makefile.inc. Since 'w' bit is missing,
> strip fails and dhcpcd binary installed non-stripped.

Wow, very good finding!

> On ARM GCC 12 glibc configuration strip saves over 1MB of disk space.

Could you clarify in which configuration you found that over 1 MB of
disk space gets saved?

Here, my dhcpcd binary, unstripped looks like this:

-r-xr-xr-x. 1 thomas thomas 327K  8 nov.  23:22 dhcpcd

So, 327 KB. How can 1 MB be saved?

(Note: of course this doesn't remove anything to the relevance of your
patch, but I'm curious how you got that number).

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
