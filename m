Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD637C001DF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 10:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9949A60A8C;
	Sun, 30 Jul 2023 10:27:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9949A60A8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qYzrJfsMzWOD; Sun, 30 Jul 2023 10:27:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF7BC60AFF;
	Sun, 30 Jul 2023 10:27:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF7BC60AFF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 667D61BF8C7
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 407E881E16
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:27:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 407E881E16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X9InW-pPmfyV for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 10:27:55 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4131081E0F
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 10:27:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4131081E0F
Received: by mail.gandi.net (Postfix) with ESMTPSA id 427F71C0007;
 Sun, 30 Jul 2023 10:27:53 +0000 (UTC)
Date: Sun, 30 Jul 2023 12:27:52 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230730122752.35b5ee86@windsurf>
In-Reply-To: <20230708200447.3919009-5-bernd@kuhls.net>
References: <20230708200447.3919009-1-bernd@kuhls.net>
 <20230708200447.3919009-5-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690712873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EEFvIfHKO5bxSF9bVQITsuOM3qiwx5DgbGx8knvnhM4=;
 b=gb1LE4OzokXVzPS26gWOOmFxAPgtlFWkxh5ELsF1/uPLE7rk+DMH5z1IQ+X09HRsqo1u6v
 9v7iZ/0Cp+U0jijDOtCEt54c7Kx6mPDY48OV45RzVUK2wY8e6uE4ZRtAHFp/niezMw2DvE
 Msvv9E7f7ulmWs9mCQcKznU97uYgtgOFoBSczxR1ck67Stkfc/UdduExE98ZPATdZEFQl3
 UBD4Qc3+aHL9IUEV6+FSeZHHODvyKX2vPOviNo4DLoxCTITF7fTU4lZJL50EwqzLwb73pP
 iWf1cvIiga9uEJEuJVA3NaVQhVfRVzQzJoigeAdp/kfX/UntonEOS+fX2L8iGw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gb1LE4Oz
Subject: Re: [Buildroot] [PATCH 5/7] package/libvips: add optional support
 for libheif
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
Cc: Pieter De Gendt <pieter.degendt@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  8 Jul 2023 22:04:45 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libvips/libvips.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

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
