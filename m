Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9E2C04A95
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 21:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C27A60F1B;
	Fri, 23 Sep 2022 21:35:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C27A60F1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qo1vVrdVDNX6; Fri, 23 Sep 2022 21:35:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B6F560E7B;
	Fri, 23 Sep 2022 21:35:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B6F560E7B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 769481BF337
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 444A0410BD
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:35:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 444A0410BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FFb0by7paD7R for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 21:35:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB97C4098D
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EB97C4098D
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 21:35:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CDD2E240005;
 Fri, 23 Sep 2022 21:35:26 +0000 (UTC)
Date: Fri, 23 Sep 2022 23:35:25 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20220923233525.10e4012d@windsurf>
In-Reply-To: <20220921211027.25034-1-romain.naour@gmail.com>
References: <20220921211027.25034-1-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663968927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gHj+SLZllQm+tDljVXZJSwuzsdPVlUab9lCyt9uK0ao=;
 b=UQOKQIZntdlR5pVsfIPv2Yzw5tFDsAzckrB7Pw2HkRDOGVvZiT4Yj5kHtN7tTpqUH2IBG7
 hdwVQ4t1lUW/AFf2he6njQT0g9gzcV5m57sC09dB3JTSaRuTaLuT2dNHJG84BLFUusCwEg
 PQBG9vRld0/DfMSfqVOz3NfL4JQgq43/Jl4bRy+i/fRam4avN0nVJwNIDzgQv3YEPZ1TYG
 dpsXQibsqwGhsOuxuFqBBqw2tncBRQcDRoFGym0dzXll1SjcuQX70tcDugg6vZYtxXTlZe
 CkgukvP4n/rTJA2k+6YeZFG6hK2UluHSlB5p3Wyw2zZXaJuKFqPLS5RtVkJvFQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UQOKQIZn
Subject: Re: [Buildroot] [PATCH 1/3] Revert "toolchain/toolchain-external:
 update Arm ARM32 toolchain 11.2-2022.02"
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 21 Sep 2022 23:10:25 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> As reported to Linaro bug tracker [1] the Arm GNU Toolchain generated
> since 2022.02 doesn't work on all x86_64 host.
> 
> It still not fixed with 11.3.Rel1 release (2022.08).
> 
> Fixes #15006
> 
> [1] https://bugs.linaro.org/show_bug.cgi?id=5825#c19
> 
> This reverts commit 22d10e294cc9cd30fa8adc3672a337167e6241a3.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  .../toolchain-external-arm-arm/Config.in             |  8 ++++----
>  .../toolchain-external-arm-arm.hash                  | 12 +++++++-----
>  .../toolchain-external-arm-arm.mk                    |  6 +++---
>  3 files changed, 14 insertions(+), 12 deletions(-)

All three patches applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
