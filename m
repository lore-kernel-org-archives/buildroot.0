Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 726DDC4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 20:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A60882273;
	Fri,  3 Nov 2023 20:16:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A60882273
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hXEA_n5AhANQ; Fri,  3 Nov 2023 20:16:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F46D822DD;
	Fri,  3 Nov 2023 20:16:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F46D822DD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1F3D31BF33D
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 20:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB2674047C
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 20:16:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB2674047C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GR_OZg1Hv6IX for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 20:16:15 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 59E3840441
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 20:16:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59E3840441
Received: by mail.gandi.net (Postfix) with ESMTPSA id 180BE20004;
 Fri,  3 Nov 2023 20:16:11 +0000 (UTC)
Date: Fri, 3 Nov 2023 21:16:11 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231103211611.0dc93419@windsurf>
In-Reply-To: <20231103000650.195673-2-adam.duskett@amarulasolutions.com>
References: <20231103000650.195673-1-adam.duskett@amarulasolutions.com>
 <20231103000650.195673-2-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699042572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Abs0lsQLKJBKecz8/sGW7Tb0Awh2jzTW3AQzMigrR2o=;
 b=VzMw4WYaaqGQTcoeYSArLCxGzdcmvqz87dsZ+ftXyF90E9QNtPY7zLc8Nhsb/d4IXhk5nG
 UxycNYtcwba22WH9DoKJrTOQYG8t7eEZIJ7xb5OiPSWCWZgDQUyxgWVVr8cmcSA8B+VIWg
 Oe7gRZ/XdH71FAeRflDmnxlSvtOA5EZOLbOIDegSAHeCuEXRuZ+b79ZP/Mxh4fV1pvnpqK
 Ib0t7H8Yh7YCAxxgN0r7+GmoSzZkjJuqYE4AeW6URa2AsYYIrnuPrBxN9FwLqnKvdP2UAp
 DmbtNKF+sFV+E/K6X+jTB+ZPzqaEcCbTaofx8eID0ax+O3ArpgDQ82d8zIF75A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VzMw4WYa
Subject: Re: [Buildroot] [PATCH] package/nodejs: bump version to 20.9.0
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
Cc: Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  2 Nov 2023 18:06:50 -0600
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> - Refactor 0001-add-qemu-wrapper-support.patch for 20.9.0
> 
> - NodeJS now requires GCC 10.1 header. However, as there is no
>   BR2_TOOLCHAIN_GCC_AT_LEAST_10_1, we round up to BR2_TOOLCHAIN_GCC_AT_LEAST_11.
> 
> - Drop the --without-dtrace and --without-etw config options as they no longer
>   exist.
> 
> - Update support/testing/tests/package/test_nodejs.py to use
>   BR2_TOOLCHAIN_EXTERNAL_BOOTLIN, otherwise the test fails as the
>   gcc version selected will be 7.
> 
> - Update the hash file for LICENSE.txt due to numerous changes, such
>   as the addition of new libraries and updated dates. No new license
>   types are added.
> 
> Tested with: ./support/testing/run-tests tests.package.test_nodejs
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  package/nodejs/Config.in                      |  8 +--
>  .../0001-add-qemu-wrapper-support.patch       | 51 ++++++++++++-------
>  ...ules-cjs-loader.js-adjust-default-pa.patch |  2 +-
>  package/nodejs/nodejs-src/nodejs-src.mk       |  4 --
>  package/nodejs/nodejs.hash                    | 15 +++---
>  package/nodejs/nodejs.mk                      |  2 +-
>  support/testing/tests/package/test_nodejs.py  |  3 ++
>  7 files changed, 50 insertions(+), 35 deletions(-)

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
