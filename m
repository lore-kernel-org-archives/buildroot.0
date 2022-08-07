Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E36F3C19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 12:40:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86A2C40169;
	Sun,  7 Aug 2022 12:40:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86A2C40169
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KpW56MbL2LWp; Sun,  7 Aug 2022 12:40:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B36BE40119;
	Sun,  7 Aug 2022 12:40:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B36BE40119
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 39A911BF2F0
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 12:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F3088131A
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 12:40:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F3088131A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Kn6pOnb3_XB for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 12:40:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E3D581300
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E3D581300
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 12:40:05 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 55415240003;
 Sun,  7 Aug 2022 12:40:02 +0000 (UTC)
Date: Sun, 7 Aug 2022 14:40:01 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220807144001.0d95432c@windsurf>
In-Reply-To: <20220807094432.3181119-1-fontaine.fabrice@gmail.com>
References: <20220807094432.3181119-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659876002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zsOBzLkypPGISpq4MvmqsdC341lyyqTSpzWgSFsoZxQ=;
 b=S2mUI+mQusQw7tT9oPAyR8jKMJ9202RMiHHeq0Aiw4UoLmQvzDw0F8etTt1K9wHoynta4k
 iRfU7xHil1uk6Byvx8V6eZymI6xp0oxZE4t6bgdyneJ6y+ONfu7hD/paKbA6RgpO24+ggo
 tNnn/8fQc8mxO5V/Ksv/6ypAyRtqOvxuc1IE9xH878WujZwT6G4Ol8grOv1zq2/GQwPhm3
 lmDlSQFVVij4y+WXeIwtJWr6/4ZSdZPCapb5bIwUjALSMwX2fgMTSoGVy5WCbX8NiKIO0J
 glmauvf2wWXTiHscKlbkpgv7EDH0ZXTARnRxy3e6FV143kFMULxc1IIAOJ5qFw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=S2mUI+mQ
Subject: Re: [Buildroot] [PATCH 1/1] package/boost: fix silent build
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

On Sun,  7 Aug 2022 11:44:32 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - https://bugs.buildroot.org/show_bug.cgi?id=14951
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/boost/boost.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master with an improved commit log, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
