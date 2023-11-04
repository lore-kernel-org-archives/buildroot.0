Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 551C2C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 18:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE7D9402E0;
	Sat,  4 Nov 2023 18:37:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE7D9402E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d_ZROF4FECSi; Sat,  4 Nov 2023 18:37:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F323140176;
	Sat,  4 Nov 2023 18:37:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F323140176
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0AE3E1BF5AE
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 18:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D166482191
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 18:37:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D166482191
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PwuK8bAQKvTE for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 18:37:08 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 94B2E82190
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 18:37:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94B2E82190
Received: by mail.gandi.net (Postfix) with ESMTPSA id 85885E0003;
 Sat,  4 Nov 2023 18:37:06 +0000 (UTC)
Date: Sat, 4 Nov 2023 19:37:05 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20231104193705.6c3205dc@windsurf>
In-Reply-To: <20231004180602.53327-1-bernd@kuhls.net>
References: <20231004180602.53327-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699123026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FaNNvN+svIv2VNFxYLN7JJHJ8hniVM/3uxu9CLuynZQ=;
 b=U6DzHNFiuuQnVrvPVv5IteSvkRalipAwLUwGRIfQx2mgu8aaEAsK5qlabQKAUUamr3JN5h
 UhgrBVR4A0aMjb+1v+SyqitTD4vxTwDLEfPp065XatrieikqfkXLe+PyzTI99cCaGLBfkX
 2Cis3Z1xDQ6dUSRdjPq1sQrf4TE1iiWdUPNkj6FaJJFp1Jtnr/JgCGymu4YsYyP5rmMaPH
 SQceKaalcCznHD6pbbF8Sjbs8SNt2g0WhRP1VY+FiiBMtOa+hKm26M4ZOde4Sj4xfgwLFu
 SA3MwC3E0IprifQAiIfhfFB4sMWHg+f1Q0vSa2rbKi7qREW1X0JfPEfChOs7Ig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=U6DzHNFi
Subject: Re: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 23.2.1
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
Cc: Romain Naour <romain.naour@gmail.com>, "Yann E
 . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  4 Oct 2023 20:06:02 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Rebased patches 0002 & 0004.
> Removed patch 0006 which is included in this release.
> 
> Release notes:
> https://gitlab.freedesktop.org/mesa/mesa/-/blob/23.2/docs/relnotes/23.2.1.rst
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/mesa3d-headers/mesa3d-headers.mk      |  2 +-
>  ...tion-to-disable-optional-neon-suppor.patch |  4 +-
>  package/mesa3d/0004-Fix-uClibc-build.patch    | 19 ++++----
>  ...5-Gallium-driver-includes-Intel-sour.patch | 46 -------------------
>  package/mesa3d/mesa3d.hash                    |  5 +-
>  package/mesa3d/mesa3d.mk                      |  2 +-
>  6 files changed, 17 insertions(+), 61 deletions(-)
>  delete mode 100644 package/mesa3d/0006-meson-ensure-i915-Gallium-driver-includes-Intel-sour.patch

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
