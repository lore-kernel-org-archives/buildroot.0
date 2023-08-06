Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A44B0C04A6A
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 11:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59D3E818A7;
	Sun,  6 Aug 2023 11:48:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59D3E818A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mZ4mTeLOpRAH; Sun,  6 Aug 2023 11:48:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E4268175F;
	Sun,  6 Aug 2023 11:48:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E4268175F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 81B181BF293
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 11:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07314605A4
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 11:48:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07314605A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1dvHVSJn6Q7l for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 11:48:29 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0658F60672
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 11:48:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0658F60672
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3DE8660002;
 Sun,  6 Aug 2023 11:48:27 +0000 (UTC)
Date: Sun, 6 Aug 2023 13:48:26 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230806134826.14f8df53@windsurf>
In-Reply-To: <20230806105703.24653-1-ju.o@free.fr>
References: <20230806105703.24653-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691322507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LBeO7MNQD3dsOV46U1pulULal5uZYO0Wg1LV0XumVFA=;
 b=YMh3J2GgtJwpbwjFltdrFq465rJPsFT7Fm6ZZMKNKMsQn+L+ueD27k3VsjZHyTBl+EcwEh
 gHwYdgsOxP1Fw7ho9XBXX8Q+0N98bx63eJiQOtbAZ/LK4HzWMqpseDGvpWCo78UMYnfHFi
 pIvvIop4NMm3kM3EjGr6FScxViIL6xpLdAOMlYd2zeKSXKnI3jf4CVR+muiYjkZiD7qCIf
 FXyI6GRkez1iyCiI+1osIPjHF4Wl4oa83Lo2lKXLDfvQ9XfdxisifOFOkeWDfwKP7xQcnr
 UTmn0n6P+ase7lM06C4/lb4RTb9NxKLXpw+Fnl2frn0hKMA99QWUaKK81pi9xw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YMh3J2Gg
Subject: Re: [Buildroot] [PATCH 1/1] package/lsof: add LSOF_CPE_ID_VENDOR
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

On Sun,  6 Aug 2023 12:57:03 +0200
Julien Olivain <ju.o@free.fr> wrote:

> cpe:2.3:a:lsof_project:lsof is a valid CPE identifier for this package:
> https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alsof_project%3Alsof
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/lsof/lsof.mk | 1 +
>  1 file changed, 1 insertion(+)

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
