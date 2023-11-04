Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F49C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 17:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6DF354019E;
	Sat,  4 Nov 2023 17:40:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DF354019E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i5Yre8LWKqn4; Sat,  4 Nov 2023 17:40:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89468400BD;
	Sat,  4 Nov 2023 17:40:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89468400BD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 64A3E1BF21A
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 17:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B9A240167
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 17:40:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B9A240167
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ugHFemSnlUiV for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 17:40:19 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A9BF34014D
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 17:40:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9BF34014D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 91112E0002;
 Sat,  4 Nov 2023 17:40:14 +0000 (UTC)
Date: Sat, 4 Nov 2023 18:40:13 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231104184013.3d8f01c5@windsurf>
In-Reply-To: <20231104151944.84393-1-fontaine.fabrice@gmail.com>
References: <20231104151944.84393-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699119615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OCThqRJt463/VlXYIG+qs+Kjgiq85m4DYBPcrHp+4MI=;
 b=RRrfpQ0ILkBQ5j8RT32iEf/nqDtQEDvs/zhM2QTW3nnlJbPtAmMK3F4VyHWmP1BUt2jNH+
 tg1lmGcdRdzy4d0YOKW59R3UCmrbP/RLYnFSbB87xVG+0pefdL/Y8fGO3snNeqxr0zMs+r
 QnhUxNtlCQRA5IhwFFgtCVIl+OKj1SUJnsECF9Qginon5yfsYIjMfSOSPHpxB3Z6XaYAeN
 m2lAwnb7r4WuLaMQApevZpR91celgiyholEqO4+UP+la1+kHTlFJHTyYTswxhbbTmppKAK
 f8l2Y5UY25SAQPUoF6GPH2kZqO9Ca4jeOhjIuGITQX8X4pVW/CdIarKuvlMK3g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RRrfpQ0I
Subject: Re: [Buildroot] [PATCH 1/2] package/nut: replace NUT_FIX_CONFIGURE
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
Cc: Bernd Kuhls <bernd@kuhls.net>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  4 Nov 2023 16:19:43 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Replace NUT_FIX_CONFIGURE by an upstreamable patch
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...iler_family.m4-fix-cross-compilation.patch | 55 +++++++++++++++++++
>  package/nut/nut.mk                            |  9 +--
>  2 files changed, 57 insertions(+), 7 deletions(-)
>  create mode 100644 package/nut/0001-m4-nut_compiler_family.m4-fix-cross-compilation.patch

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
