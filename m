Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A77EC54EAA
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 21:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93CBE82199;
	Mon, 30 Jan 2023 21:11:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93CBE82199
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fm0yav3XVDEt; Mon, 30 Jan 2023 21:11:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D28EB81380;
	Mon, 30 Jan 2023 21:11:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D28EB81380
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3A9651BF44A
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 21:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0822940BCA
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 21:11:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0822940BCA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1QWV3G6Sl7He for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 21:11:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD7C640B84
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DD7C640B84
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 21:11:52 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AB5AB1BF206;
 Mon, 30 Jan 2023 21:11:50 +0000 (UTC)
Date: Mon, 30 Jan 2023 22:11:49 +0100
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230130221149.459c14d6@windsurf>
In-Reply-To: <20230130174339.36794-2-bernd.kuhls@t-online.de>
References: <20230130174339.36794-1-bernd.kuhls@t-online.de>
 <20230130174339.36794-2-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675113111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KcR4sSee1gDbDsIhV/jhy0riyyrcNG2cZdTEvGLwqxI=;
 b=RZQlSN+sMFKxh0UaYiMKm7H2IGvbb/6CU8b8+wyM1KTSoDynMaP4Vq72s1g0BtJZzsFAFx
 4eikjZe5J1DaLAYKoUSKMAOLZ8Uqcxna4RNq+5hxAUwjXauijOslBYS3jVzqVFpvlSwbdE
 oYD1U+gXzAr1AdgsPbvnudQu89INo8FM0dE14j9MHa3g31djPq+d7mth9wA32U6u5C53dQ
 WLGUHxKe1onmrFLuHBPya5zUjR/QKV/RYGPoneBNg3MAcYBvn7396svORUWFY2AbwGZu8R
 QH/cqmMuHJO2jeKjTRpeqN5KGBJ5D/vLKnDCaXMbDXcB5y+JYnroHyMPgy0XoA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RZQlSN+s
Subject: Re: [Buildroot] [PATCH 2/5] package/libva: switch to meson
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Louis-Paul Cordier <lpdev@cordier.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 30 Jan 2023 18:43:36 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> -# From https://github.com/intel/libva/releases/download/2.17.0/libva-2.17.0.tar.bz2.sha1sum
> -sha1  997f7b3111bc5a4d32ec72e9d7f9fcfca41e4923  libva-2.17.0.tar.bz2
>  # Locally computed
> -sha256  f3e5eb27c305e05a9bb62703d1915a127301cc0c4f9f209025767432230c4eac  libva-2.17.0.tar.bz2
> +sha256  8940541980ef998a36cd8f6ad905e81838ea4ddf56dc479ed2bebd12711e6001  libva-2.17.0.tar.gz

Are you sure about this hash?

ERROR: libva-2.17.0.tar.gz has wrong sha256 hash:
ERROR: expected: 8940541980ef998a36cd8f6ad905e81838ea4ddf56dc479ed2bebd12711e6001
ERROR: got     : 2f3bb42b54c6c10f23ba61c00402354b7e408c6325d69cf7b353cf35e1f025c0
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Could you double check?

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
