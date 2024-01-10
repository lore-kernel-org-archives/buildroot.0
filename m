Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FFEC47073
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 20:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9463A400C1;
	Wed, 10 Jan 2024 20:47:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9463A400C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ktmhmzDy6nMB; Wed, 10 Jan 2024 20:47:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A47FC436D7;
	Wed, 10 Jan 2024 20:47:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A47FC436D7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DDCAE1BF5B3
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B697F6152D
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:47:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B697F6152D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ocIt6MXZIXQE for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 20:47:23 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5299061452
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:47:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5299061452
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7FB5CE0008;
 Wed, 10 Jan 2024 20:47:20 +0000 (UTC)
Date: Wed, 10 Jan 2024 21:47:19 +0100
To: Jesse Taube <mr.bossman075@gmail.com>
Message-ID: <20240110214719.3c288ec0@windsurf>
In-Reply-To: <20231109035947.1852675-2-Mr.Bossman075@gmail.com>
References: <20231109035947.1852675-1-Mr.Bossman075@gmail.com>
 <20231109035947.1852675-2-Mr.Bossman075@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704919640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nlaaxSVXsf/EFgw2SsSJGYr57Et0er9FQ7BhTbt5xXc=;
 b=lCRISm/hWIIEHkLn4X4QwEQ8UrLhj0fs+T4KQnCUxUe3hmzIudk4A7UhyIj2WTLoRMeDh2
 F6hZHn0fH5aox1dz2IleLZ98k+wmR0CGzs1aPtoL7l/gY8iur9Vri9b3CFszr7tp81RaIJ
 D7JjEDu++yCAiZIEkFZlssmkMnlEcCmi7IODalOVJPlkqAGK1HdSn1lVk06XfOxnDWM2uv
 BM4bkDRKLD0LhTgkyTJA0FYnjFL6XCXyaAzXG6rirOe80G3ICvW4UlN8crly+HpwZoeQ0V
 10hFnhAWjNJM5PqvMeIfRx3ZfM5fKJfpzCzuHI2vPwAPlM/BiCPdZuIUYnOOvA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lCRISm/h
Subject: Re: [Buildroot] [PATCH v1] configs/imxrt1050-evk: Use zImage
 instead of uImage
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  8 Nov 2023 22:59:47 -0500
Jesse Taube <mr.bossman075@gmail.com> wrote:

> imxrt1050-evk was using uImage switch to using zImage
> now.
> 
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
>  board/freescale/imxrt1050evk/genimage.cfg   | 2 +-
>  board/freescale/imxrt1050evk/uboot.fragment | 2 +-
>  configs/imxrt1050-evk_defconfig             | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

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
