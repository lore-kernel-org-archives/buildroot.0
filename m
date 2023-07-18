Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80469EB64DD
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 21:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE5E66103F;
	Tue, 18 Jul 2023 21:12:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE5E66103F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WlEZlEdlNCjF; Tue, 18 Jul 2023 21:12:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1273E61038;
	Tue, 18 Jul 2023 21:12:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1273E61038
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EF7F31BF350
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 21:12:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B677781F77
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 21:12:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B677781F77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DrSfR6ONygYP for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 21:12:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6B578132F
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A6B578132F
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 21:12:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 37B6D60003;
 Tue, 18 Jul 2023 21:12:22 +0000 (UTC)
Date: Tue, 18 Jul 2023 23:12:20 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230718231220.0f9c9d88@windsurf>
In-Reply-To: <20230716161000.398460-1-bernd@kuhls.net>
References: <20230716161000.398460-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689714744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Yk+8nxNEYGwFzSHG8MtugDKtIvwO2IllAnvo//H7r0=;
 b=CAVl7bZx3O+95JVLNAjgAsnwpQLD9tWeuIJ8l/wfYrvY5ncL11zNJSNXo+rstV7vr3eVWR
 TI1gh3cPpfXvxwjLSkvy2Nygl4091DQ5l3VKF8yP49qckdMYQ/MlQd69EL83UjRAu23oNu
 67+5FavUWbqQPiWbpI5T6oRt7DYLFVFzZ97joYrmw+mFXJGqhCupajqsAS5oZsY6dd7vrP
 8eBf0OqHZzQwmLelAWyUIAFPhVwsSpTp6BmZWOICF8zNviNMwu/4FnH1EYyCvLTWnfP4Lh
 7rU2rf8jGnXvJTD9oOhuHT88QsV1SDz21QpWUxytnTscYBt2LRedyuLLosCYrg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CAVl7bZx
Subject: Re: [Buildroot] [PATCH 1/1] package/gnuradio: bump version to
 3.10.7.0
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 16 Jul 2023 18:10:00 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Removed all patches, they are included in this release.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .checkpackageignore                           |  2 -
>  ...g-missing-vector-in-blockinterleaver.patch | 42 -------------------
>  ...rleaving.h-add-missing-cstddef-heade.patch | 33 ---------------
>  package/gnuradio/gnuradio.hash                |  2 +-
>  package/gnuradio/gnuradio.mk                  |  2 +-
>  5 files changed, 2 insertions(+), 79 deletions(-)
>  delete mode 100644 package/gnuradio/0001-blocks-Including-missing-vector-in-blockinterleaver.patch
>  delete mode 100644 package/gnuradio/0002-blocks-blockinterleaving.h-add-missing-cstddef-heade.patch

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
