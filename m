Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10721C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 02:10:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAFB0700AD;
	Tue, 21 Feb 2023 02:10:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAFB0700AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8uGfzt25Rqds; Tue, 21 Feb 2023 02:10:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0ADC770296;
	Tue, 21 Feb 2023 02:10:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0ADC770296
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6370D1BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3724549986
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:34:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3724549986
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u3O9IEo0BiQX for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 21:34:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9565D42D6B
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9565D42D6B
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 21:34:20 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7E074FF807;
 Mon, 20 Feb 2023 21:34:18 +0000 (UTC)
Date: Mon, 20 Feb 2023 22:34:17 +0100
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Message-ID: <20230220223417.5b1c3c08@windsurf>
In-Reply-To: <20230220221721.3ebb047b@windsurf>
References: <20230220071846.2334907-1-marcus.folkesson@gmail.com>
 <20230220221721.3ebb047b@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676928858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6d/QI3ucdXVuiPwMzMUphHLIzXqnm4wlF+sMCFS16jk=;
 b=GLUZPE9YfbadgA+ATzxhwJq1DaPka7Ggmcdkf41olI91e2MXXrkifOo4Ao34JqauilCgEb
 m0T337RoJxMAEdfB6NRzvZL0jrcc0xLrnHGJnbMSKrkA1+76zCLL+X+ycwZbOTu38AGCRT
 Z1vvHgMrJBGjew0enXvTC+Ggh/a2pQZR3I+8mU7yRYzkfVz/bwoMhr/wtav7sVifMyciRg
 Fu9RtGQ9KCMtTWMiK6y5fEig6i0QKZIA24zLHK5gaYGF7B6NvIjK40/9fqI+PMARmYYmSz
 xSSu0/Lxz5lZt9yLXk556g+ESA4MaWnSKobyCzOKAQ/WDgL5ulaFSgY7OWWziw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GLUZPE9Y
Subject: Re: [Buildroot] [PATCH v2] package/libcamera-apps: enable LIBAV
 only if libdrm is present
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 20 Feb 2023 22:17:21 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> I need to do some test builds, but I believe this patch is not correct.

I confirm the patch is not correct: if you have a configuration with
libcamera-apps and libdrm (but ffmpeg disabled), it builds just fine,
and DRM support in camera-apps is enabled.

In this configuration, your patch forces a dependency on ffmpeg, which
is not correct.

Could you have a look at my previous suggestion instead?

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
