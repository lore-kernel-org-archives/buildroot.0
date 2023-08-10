Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9AC7C001E0
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 19:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5601540246;
	Thu, 10 Aug 2023 19:50:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5601540246
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OsBncmdQNH9c; Thu, 10 Aug 2023 19:50:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 241DB41E38;
	Thu, 10 Aug 2023 19:50:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 241DB41E38
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 793EB1BF5A6
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 19:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 526D9611B5
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 19:49:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 526D9611B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uh9m-MyPR1k5 for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 19:49:27 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E81B61037
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 19:49:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E81B61037
Received: by mail.gandi.net (Postfix) with ESMTPSA id 150C640005;
 Thu, 10 Aug 2023 19:49:23 +0000 (UTC)
Date: Thu, 10 Aug 2023 21:49:23 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230810214923.538f39f5@windsurf>
In-Reply-To: <ZNRnDHlV2LzgmGjI@waldemar-brodkorb.de>
References: <ZNRnDHlV2LzgmGjI@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691696964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4WOtRyk6F/ccgEhP7y+590rRzXPLV0ifxNuW15q+t5U=;
 b=V1PyFTLOG+dEOY8SAEpguzxdJBqAUOmkvD1FV1ZIS4i0EyZr0oa3V7/Z+rylZAmVNwxOhT
 vaQ5qp792m8Noy49hBQePdv/rdgSTs9egzdywaEsLni1LCv7tAmH6Swi3ZhCqbvz6ZIa18
 m9fAKWIucA09AInfBgh4cA4arV0hnnJcHqSJ1OHeAwcres5D34eqFKiao6vyoTgQBckBWZ
 hbD49zwk1TiCoWs1+7+E834HK9etLbUAXU/3I8x94NHX6Kk2yOeKwfT3qUfiSsufqHsWFE
 kIdONrTVsApwYr1gek45KUHYMuJJ3qvaDs1vz8i7JYwsMlA2bBMA/8QxEJNbNw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=V1PyFTLO
Subject: Re: [Buildroot] [PATCH/next] package/musl: enable m68k with MMU
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

On Thu, 10 Aug 2023 06:26:52 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Support for m68k with MMU in musl was added in 2018 with
> commit f81e44a0d96c88e052e51982f9fdd6fe0a212b46.
> 
> Tested with qemu_m68k_q800_defconfig.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/musl/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
