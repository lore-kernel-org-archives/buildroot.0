Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1277C0015E
	for <buildroot@archiver.kernel.org>; Wed, 26 Jul 2023 20:37:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5887740A59;
	Wed, 26 Jul 2023 20:37:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5887740A59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Pai4u2kBlW6; Wed, 26 Jul 2023 20:37:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 984D240B81;
	Wed, 26 Jul 2023 20:37:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 984D240B81
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 81A951BF40D
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 20:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6864540649
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 20:37:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6864540649
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mtyx5FvQTfF6 for <buildroot@lists.busybox.net>;
 Wed, 26 Jul 2023 20:37:50 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 30E2340144
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 20:37:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30E2340144
Received: by mail.gandi.net (Postfix) with ESMTPSA id C7BE51C0003;
 Wed, 26 Jul 2023 20:37:47 +0000 (UTC)
Date: Wed, 26 Jul 2023 22:37:46 +0200
To: "Sannachi, Prabhu                            Collins"
 <prabhu.sannachi@collins.com>
Message-ID: <20230726223746.47041a83@windsurf>
In-Reply-To: <PH1P110MB1067DE8A34BD964056E6BCB6EE00A@PH1P110MB1067.NAMP110.PROD.OUTLOOK.COM>
References: <3s0rp7dwhe-1@m0346904.ppops.net>
 <PH1P110MB1067DE8A34BD964056E6BCB6EE00A@PH1P110MB1067.NAMP110.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690403868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dtiCMnKSs4gqnUZaCP4aodPrOC2Izd3dBJNluX/7fsA=;
 b=ODx1XuUcVekWInpjct41r5MyvDXsChwRlpEEv0R5K/HBwUl72N4aolk5QlLTK+K50gGFHJ
 ozif26quVyY+/YMIofKWax9EPV+ClVNp5cmbii/kWE5s2hyZRyV9FC9/c5MaNXhqNXPJVy
 tmINq39FdvTahx3j3WMgQAkRj2vNRuW2gtL6bqB9C3+lblMUByWuRCDhz1TYFYmFh+pALz
 MJXRqAAj4QtH7WZ4dzhTYCv7ODLrKfZcTerw+zcFPa7g2X3n0YHZZJg+lKpwfc4RKP5c08
 K1lxAI2MQ9zsfVqJxN6mlbdLvVZ30WrlKdyHT99ultiSqFtYYghKMevz53tHgw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ODx1XuUc
Subject: Re: [Buildroot] [External] [autobuild.buildroot.net] Your daily
 results for 2023-07-24
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Prabhu,

(Please Cc the Buildroot mailing list for such questions, thanks!)

On Wed, 26 Jul 2023 16:12:33 +0000
"Sannachi, Prabhu                            Collins" <prabhu.sannachi@collins.com> wrote:

> When I test the build with same configuration, I can reproduce the issue here.
> But issue happens when compiling using uclibc library toolchain only.  I don't see any issue with glibc toolchain.
> 
> Error shows cannot find hiredis library, but it has been added as dependency and built before redis-plus-plus package.
> 
> Issue is not related CPU and package.
> 
> Please suggest me how to proceed next.

So, the failure is at
http://autobuild.buildroot.net/results/6d3/6d310d52dbfe076cd470be71f02de32fb47fa904/.
This configuration uses static linking, perhaps this is what is causing
an issue.

I think you need to debug why it can't find hiredis:


CMake Error at CMakeLists.txt:149 (add_library):
  Target "redis++_static" links to target "hiredis::hiredis" but the target
  was not found.  Perhaps a find_package() call is missing for an IMPORTED
  target, or an ALIAS target is missing?


CMake Error at CMakeLists.txt:202 (add_library):
  Target "redis++" links to target "hiredis::hiredis" but the target was not
  found.  Perhaps a find_package() call is missing for an IMPORTED target, or
  an ALIAS target is missing?

A starting point is to look at the CMake logs, if available. I don't
really have a lot more to suggest, without looking more closely at the
issue.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
