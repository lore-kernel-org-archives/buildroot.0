Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 066A0C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 20:49:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B444860E6A;
	Sat,  4 Nov 2023 20:49:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B444860E6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SWOvDiA3eQK9; Sat,  4 Nov 2023 20:49:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A69D60DE5;
	Sat,  4 Nov 2023 20:49:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A69D60DE5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 83F401BF5AE
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 57D71820F9
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:49:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57D71820F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9chTKPYC2_0G for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 20:49:15 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A417820F7
 for <buildroot@busybox.net>; Sat,  4 Nov 2023 20:49:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A417820F7
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7B237C0002;
 Sat,  4 Nov 2023 20:49:10 +0000 (UTC)
Date: Sat, 4 Nov 2023 21:49:09 +0100
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20231104214909.7a3d34a0@windsurf>
In-Reply-To: <20231002165302.3341402-1-francois.perrad@gadz.org>
References: <20231002165302.3341402-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699130950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v3e0eX+TyRPdPSu5pAQ2c9Ah78Gpk2yUb6hco+R+fZU=;
 b=jTWvg20lt1uFq11/6k7bskhaua+spPDIs1osIaJm+o2crJEaBAMtlsM+hO9BepbiCeEylD
 YtvhwsnXpCXtRrgFWpdNrxmWqFaGiwGHXL9UAfjFxM3zRlI9kqL9yXpZN4ViJg7l9AVKdJ
 WXv2pDNOStOxEeZDMMOzu3Zgp6hpw1ATbQFfzXEsAlDWJeHP90LewcngY/NW0HpHGr86N0
 5RgXKNZk/e3YZDMZgPcUDtBuu1esYv6H8A62gJzpW58gIgy7pzNhOyAyHG8+NPjUFH90us
 zmI2uD67iexiofGXaappRMoM7QGjwlfyeivd8/pBeisCCbQ3p3REER6EcmCsIg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jTWvg20l
Subject: Re: [Buildroot] [PATCH 1/2] package/perl-module-build-tiny: bump to
 version 0.047
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  2 Oct 2023 18:53:01 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> LICENSE: switch to Perl Artistic
> see https://metacpan.org/release/LEONT/Module-Build-Tiny-0.047/diff/LEONT/Module-Build-Tiny-0.039#LICENSE
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  .../perl-module-build-tiny/perl-module-build-tiny.hash    | 8 ++++----
>  package/perl-module-build-tiny/perl-module-build-tiny.mk  | 4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)

Both applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
