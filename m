Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 942C3C433FE
	for <buildroot@archiver.kernel.org>; Fri, 11 Nov 2022 22:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 410B560F2F;
	Fri, 11 Nov 2022 22:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 410B560F2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ar9aHdjTEBxg; Fri, 11 Nov 2022 22:52:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84A1960C2A;
	Fri, 11 Nov 2022 22:52:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84A1960C2A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6BEC41BF290
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 22:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4703D60E52
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 22:52:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4703D60E52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oTCnEGEZRpre for <buildroot@lists.busybox.net>;
 Fri, 11 Nov 2022 22:52:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B8D561001
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1B8D561001
 for <buildroot@buildroot.org>; Fri, 11 Nov 2022 22:52:15 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5AE8E40003;
 Fri, 11 Nov 2022 22:52:13 +0000 (UTC)
Date: Fri, 11 Nov 2022 23:52:12 +0100
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20221111235212.223c7e92@windsurf>
In-Reply-To: <20221111202921.3999-1-bernd.kuhls@t-online.de>
References: <20221111202921.3999-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668207133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4mj7dthVcbUWgj4iu9v9iPENjEtvCr4w8YYpWOKa0EY=;
 b=G9ADoqrqIiL23YD4KM0ueZk/lYUuy8oJQTradjnsbBqIA+ftR5qc3Yj5/19HX+u0FWvcci
 jeihP4ax4iW4i2GehglANV6NRHHCZKK1WCwZdqB3KV0IPRB9n55gQkdqhGAfz1DD6Aevpj
 9lDWTUUFl52yFqGtretanqI2HMXAtTcVTFwsYonlJZI7PeFinxWrTqwApZjdDH6OXeMylR
 j0QSEzgkFztp96c+9ugG18sB7A288T6d2Z+94dx/61WYah8cpEc9P/M0Jj/+9x953a3vRj
 aG++e+lt/f/KecW7W93DGtA+iwi0e7ElFHPWmiZWN5aYjbkfPJdEvQGA6x8nWg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=G9ADoqrq
Subject: Re: [Buildroot] [PATCH v2 1/1] package/alsa-utils: update
 dependency for topology support
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

On Fri, 11 Nov 2022 21:29:21 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> This is a follow-up patch for
> https://git.busybox.net/buildroot/commit/?id=28497102e1788df3628bd3324a3304a03c7942d0
> which created a new option for topology support in alsa-lib, this
> dependency was not ported over to alsa-utils.
> 
> Fixes:
> http://autobuild.buildroot.net/results/a9c9f5157365efe8271bf69dab0d5a5532b196ea/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: Updated dependency handling (Thomas)

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
