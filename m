Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5047C001DB
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 21:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7178940907;
	Mon,  7 Aug 2023 21:54:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7178940907
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g7RCfFqJ1889; Mon,  7 Aug 2023 21:54:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C433408FB;
	Mon,  7 Aug 2023 21:54:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C433408FB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1A0EB1BF3F6
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 21:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1D7A408FB
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 21:54:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1D7A408FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BAUt5IPtsDf2 for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 21:54:46 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B3BC3408F5
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 21:54:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3BC3408F5
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5923F240002;
 Mon,  7 Aug 2023 21:54:42 +0000 (UTC)
Date: Mon, 7 Aug 2023 23:54:41 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230807235441.69eaa921@windsurf>
In-Reply-To: <20230726171923.334017-1-bernd@kuhls.net>
References: <20230726171923.334017-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691445282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ogz7x3DxLCm4u5BgK3hDbXaLWtgx2IhDP0AVsVXlXN0=;
 b=UKZaaMgPSw2HI8FqkI/y/Icy+/21QPbbNfxzahl5ElVSUnEoyC0Pks1oFA/l++7ATeImpJ
 U/ahTq56v7ThIf7tYQEwYtytOcayVDOU8/OBpzC+SQvUhWcUtM/VXe0Tvlyd6cBrTSq8HB
 Zo2vmYrQjW0GSsgciJRwfzzsqlCk5XTBLW6vpzn82RbMSWGrFF9ZKIVtUvBnucJU4wr7Gf
 VE7Oyr6grkzx/DcBMsNl0CFwRZbGpfHYMtd1izmEx4epR9CkFX8CrUHzKRK5aBUP9qDSAC
 046jeqFPOU4GbWkJ7bJ/As9oivHq7inm9Avfk6gGR9AqEDx556t5nfijzJnphw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UKZaaMgP
Subject: Re: [Buildroot] [PATCH 1/1] package/libglib2: bump version to 2.76.4
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
Cc: James Knight <james.d.knight@live.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Wed, 26 Jul 2023 19:19:23 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> From: James Knight <james.d.knight@live.com>
> 
> - Drop `iconv` option since it was obsolete and dropped [1][2].

This fix has nothing to do with the version bump. The issue already
exists in 2.76.1 that we have today in Buildroot, so mixing this fix
with a version bump does not make sense.

So I've applied a commit that only fixes the libiconv issue:

  https://gitlab.com/buildroot.org/buildroot/-/commit/ff050de534eed1dab152890d748952fc659882a0

(I hope I didn't screw it up)

No, we will need a new commit on top of that to bump to 2.76.4. When
doing changes in the bump, always wonder if they are related to the
bump or not. If they are not, they should be a separate commit.

> - Ensure `nls` is explicitly configured based on `BR2_SYSTEM_ENABLE_NLS`
>    being set.
> - Cleanup configuration and dependency options (ordering, having a
>    common variable to share between host/target builds, adding more
>    explicit assignment of options).

For example this has nothing to do with the bump, so it should be a
separate commit. Except that neither Yann nor myself find the sharing
of config options in a "common" variable to be relevant, so we'd prefer
not to have this change.

Once again, really important: a bump should do a bump, and *only*
things related to the bump. If something is not related to the bump =>
separate commit.

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
