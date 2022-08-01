Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 243E7C00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 20:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A74E44019E;
	Mon,  1 Aug 2022 20:25:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A74E44019E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nisro7SGalOL; Mon,  1 Aug 2022 20:25:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4F214015F;
	Mon,  1 Aug 2022 20:25:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4F214015F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C30FF1BF25B
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 20:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BBC340448
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 20:25:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BBC340448
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N88zyrwoR3GL for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 20:25:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9501040442
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9501040442
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 20:25:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1C0D840002;
 Mon,  1 Aug 2022 20:25:35 +0000 (UTC)
Date: Mon, 1 Aug 2022 22:25:35 +0200
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220801222535.1064c89d@windsurf>
In-Reply-To: <bf923353-f8b8-e93e-b911-f337f0f46da4@mind.be>
References: <20220730105534.645046-1-bernd.kuhls@t-online.de>
 <20220730174036.48ca64aa@windsurf>
 <bf923353-f8b8-e93e-b911-f337f0f46da4@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659385536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b9zqgoOWv64VOtwEIGeS1p4i1ADcPC59Fsbt2aRj8Ys=;
 b=CoF2bWBjz1tolTRWtlFlLuCIihvoL86pEWyc7Im8W1ezQwvDA50y/pfjV4naP+jmUZmqfw
 d7hSKWEozGg7+ayJKBhbpECQSe3YQfXpABZozAbFROoC/6AsfegfRZhNeu/h2v1eLW9Nbl
 VwRJYtHSoHmaBK2rlWo5UAQpayNGkYsJsmulbGVSYLajXdbGYovGzRd/BRQG9noJ/dtT/s
 YbBPKbHDxhiUXQ9ktMA7bHMvUTnEEFJSU9ewLfcj+PuVbY1/N0FagOy/gyLnjvapxJGF9+
 49OuLpLtsJHtUyqRZ5HEeG2tNbM7rdVstHWpdL7nTgb+a4L+mImRP42ACjnqvA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CoF2bWBj
Subject: Re: [Buildroot] [PATCH 1/1] package/tvheadend: fix build error with
 c++ disabled
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 30 Jul 2022 18:28:43 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

> > It is apparently an optional dependency, so why do we select it in
> > Config.in?  
> 
>   It is select'ed by transcoding support, but in the .mk file the optional 
> dependency is always added just in case there's something else in tvheadend that 
> starts using it.

This is not what's happening: Bernd's patch adds:

+ifeq ($(BR2_PACKAGE_LIBVPX)$(BR2_INSTALL_LIBSTDCPP),yy)
+TVHEADEND_CONF_OPTS += --enable-libvpx
+TVHEADEND_DEPENDENCIES += libvpx
+else
+TVHEADEND_CONF_OPTS += --disable-libvpx
+endif

inside the 

ifeq ($(BR2_PACKAGE_TVHEADEND_TRANSCODING),y)
...
endif

condition.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
