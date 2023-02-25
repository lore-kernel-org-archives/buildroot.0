Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A52C7EE2D
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 09:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 313C040B8A;
	Sat, 25 Feb 2023 09:41:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 313C040B8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3-q3kox6mOlO; Sat, 25 Feb 2023 09:41:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6789640BA6;
	Sat, 25 Feb 2023 09:41:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6789640BA6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 063471BF5DF
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D3CF260B5D
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:40:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3CF260B5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sy7wsFvxfdzA for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 09:40:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DE8860B53
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9DE8860B53
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 09:40:20 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A6E92240002;
 Sat, 25 Feb 2023 09:40:16 +0000 (UTC)
Date: Sat, 25 Feb 2023 10:40:15 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230225104015.3f24e165@windsurf>
In-Reply-To: <20230224161543.27879-1-fontaine.fabrice@gmail.com>
References: <20230224161543.27879-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677318017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l2bF50InUni6jPCeDGt0KP5m/6cgkwrMmgS6Nwo7E3s=;
 b=G7r8CFIzWPm2d0LOi9VNB5CQB9FXHmQqK3Ph69q/IXFPXMBOEEQ+G39A3wUeP/cnv1uCYx
 SZIULlcbg2KT/Xfehd4E37Wl/pOV+UmpHh9HLLeqePASe5LhwEqoPUzbq0/ZBF39X92Hcq
 5uuq1q6udpWLNlIub5IS2IluTqQDJBAYiF5ids4CaAvaZ2bSt6hLSBtEATHZQgyu4wu0em
 2ACQRUtH/2/ySb8drD+/usUjQMz7VKW6xP4vw1JJoFyb/pSwegvNQ+ahOIYD7kE860GIxM
 8NcJPXbkJUr0v9KixKo6quhGN6zblJLBxRkc7MG40Cdvy5ICbeaL0exy9gDT+Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=G7r8CFIz
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/systemd: fix build with -Ofast
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
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@phobosdpl.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 24 Feb 2023 17:15:43 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Update -Ofast workaround as suggested by Yann E. Morin to avoid the
> following build failure raised since bump to version 252.4 in commit
> a2c823d1f548d5a0120d27d6c000603192360f7b and
> https://github.com/systemd/systemd/commit/60f97fee2d2f948c8e8963ea8ff767008cb93cae:
> 
> ../output-1/build/systemd-252.4/meson.build:397:8: ERROR: Problem encountered: -Ofast, -ffast-math, or -ffinite-math-only is specified in c_args.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/8f41c4984b645851724e554c3162b83bc312bee7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni and Yann E. Morin):
>  - Update workaround instead of disabling with -Ofast

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
