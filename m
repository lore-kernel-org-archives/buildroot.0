Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B19CAC3DA6E
	for <buildroot@archiver.kernel.org>; Mon, 25 Dec 2023 10:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CA07415D7;
	Mon, 25 Dec 2023 10:22:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CA07415D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nxzea2cNRGxR; Mon, 25 Dec 2023 10:22:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C352741587;
	Mon, 25 Dec 2023 10:22:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C352741587
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 349761BF5DB
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 10:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A93681372
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 10:22:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A93681372
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ify-U_zKJ-xq for <buildroot@lists.busybox.net>;
 Mon, 25 Dec 2023 10:22:00 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C6ADD80AA3
 for <buildroot@buildroot.org>; Mon, 25 Dec 2023 10:21:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6ADD80AA3
Received: by mail.gandi.net (Postfix) with ESMTPSA id C167A1C0002;
 Mon, 25 Dec 2023 10:21:56 +0000 (UTC)
Date: Mon, 25 Dec 2023 11:21:55 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20231225112155.71fe2115@windsurf>
In-Reply-To: <20231223230513.2660613-1-ju.o@free.fr>
References: <20231223230513.2660613-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703499717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SXbRedfIrLdPEYRvz41jLBZHMwufUrGpSqnSx1SO3Xs=;
 b=XHhl2luHKlkYvdjpaiaQjP74QrKXJme1/6VYmu2+rnD/em28be0mZtOx845xF7opJOYK59
 FKo2DKYxlLsUgk/lda3JdRiK6HLKFPiN0XP7YehySd5G2pC8txChtjSORA3gUSeRNwWMm5
 anHj7UcybweImJeANSPgzQf2XuXMGPG5P5lpcZM47Y2PH20cWly5Jy2fid4OLf9hOcs/By
 YJr4+lW2k6vs/XQih5P+52mnN4TiK3l3kPoZ2AFzvJJTXfC9V4DUCcrW/D3FOGva+UxxY7
 gJ0KGEl/hoAbSLJVACCb7gc39AYte8pK50lpDdHNCbWFvff7P2XJrZl5Zw2qdg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XHhl2luH
Subject: Re: [Buildroot] [PATCH 1/1] package/python-ml_dtypes: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 24 Dec 2023 00:05:13 +0100
Julien Olivain <ju.o@free.fr> wrote:

> ml_dtypes is a stand-alone implementation of several NumPy
> dtype extensions used in machine learning libraries.
> 
> https://github.com/jax-ml/ml_dtypes
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested on branch master at commit 9212a71 with commands:

Even though the upstream package is named ml_dtypes with an underscore,
I renamed it to python-ml-dtypes in Buildroot, as we really use - as a
separator in package names. With that changed: applied to master,
thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
