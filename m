Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF58AC001DE
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 19:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D16A4218D;
	Fri, 28 Jul 2023 19:47:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D16A4218D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 872ZHgSFCKl7; Fri, 28 Jul 2023 19:47:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EF7042184;
	Fri, 28 Jul 2023 19:47:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EF7042184
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3D8E91BF312
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 19:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A2BB40363
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 19:47:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A2BB40363
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tE8TLm66nZhl for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 19:47:06 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E7A8440168
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 19:47:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7A8440168
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9A2CEFF804;
 Fri, 28 Jul 2023 19:46:57 +0000 (UTC)
Date: Fri, 28 Jul 2023 21:46:56 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230728214656.36e1e19d@windsurf>
In-Reply-To: <20230727214939.1578036-1-bernd@kuhls.net>
References: <20230727214939.1578036-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690573623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FbC1z/+D6dWB34ojEKfluYMnum7zAIlfetPNF2DXugg=;
 b=Fv33JNuvUyiaSNlmHqFPXYtMpYC9GnCYfzM3R6WZL7AZn6JEgaCj4K+2/2SgSgH6rVRqyq
 I2rt6cTfkvxSAs9jBhhwok8tPCKHn+ZXXLFYNdHfV1UZzVCCtTjc6QqUDM3gwU5Zyl8fVm
 jDQKTFk3S1ha9wp0d5AqU827qrEeWBWEdtJ/sbjQrnzn9o6mP0VZtaJZd7Md+3W5Sud38B
 RfCnMqGaDrhSraZ/NXs7WlSFo7I6Rb9ohiFojRckhP1mjRwzretVwTlBytWFFoVAeojCqL
 gZNQZXsi3RZVvxGzWfC4vbt1+dMk+aL27TAzTz7igSMC/vanFr3SHVMSE2GTwA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Fv33JNuv
Subject: Re: [Buildroot] [PATCH 1/1] package/gupnp: fix build with meson
 1.2.0
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
Cc: Rahul Bedarkar <rahulbedarkar89@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 27 Jul 2023 23:49:39 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/10f/10f30e804b3b497d603afa93bdd2b02fc66646f4/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  ...properly-spell-provide-in-wrap-files.patch | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/gupnp/0002-build-properly-spell-provide-in-wrap-files.patch

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
