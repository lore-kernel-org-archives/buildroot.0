Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83EFAC4167D
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 17:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 327944F1BE;
	Thu,  2 Nov 2023 17:55:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 327944F1BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HaZd5jg7C7KA; Thu,  2 Nov 2023 17:55:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45A554F253;
	Thu,  2 Nov 2023 17:55:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45A554F253
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C50871BF350
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 17:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DE6B4F1BF
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 17:55:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DE6B4F1BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DYYZE2-Yr7e0 for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 17:55:23 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E1FA14F1B6
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 17:55:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1FA14F1B6
Received: by mail.gandi.net (Postfix) with ESMTPSA id 016201BF207;
 Thu,  2 Nov 2023 17:55:19 +0000 (UTC)
Date: Thu, 2 Nov 2023 18:55:19 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231102185519.2197beee@windsurf>
In-Reply-To: <20231015195938.1270893-1-fontaine.fabrice@gmail.com>
References: <20231015195938.1270893-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698947720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YOJKGEFiCQ+L/gXjddxCsuU97ZywuEo2+IG1qH4TkUI=;
 b=XmWBHzHJp5dW05ggB28oZIgGyWA3ey+InabnWdPTLGaSqaDGtvn/YfRs666ctaiiF4CUwD
 aWw5NPiolBgGCmC98ljFk1SOKlf6t96MIgUltGVphrVKbgezjfyjPYhYb9JZu670GxlmDZ
 2RppcCLNiQHeLEXYgQmdx3krgqxqvXQ8NpVmQ8IkhRoY+Y9TPzQLAkWhkny6qhC2E6v235
 w64yR02Gkb0rNd486zAVc0ySmLlS3LKp8ylPOgqYeJjthoZe9pP0uElD7hmctNlFEm9IeD
 fNBIX8Z27tWYSrQbnHHSbJ5ayO1O/ZFCCsALRd8jdGnjl/pTo8Pm8xaJzJRvyw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XmWBHzHJ
Subject: Re: [Buildroot] [PATCH 1/1] package/motion: fix build with
 gettext-gnu >= 0.22
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

On Sun, 15 Oct 2023 21:59:38 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure raised since bump of gettext-gnu to
> version 0.22 in commit f6a6e3a8363a32e5443c9eadc2ee047853640d1a:
> 
> fi.po:3435: 'msgstr' is not a valid C format string, unlike 'msgid'. Reason: In the directive number 1, the character 'l' is not a valid conversion specifier.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e426a245075f5a8615a3129187126804bf48a34b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/motion/0001-Gettext-0-22.patch | 164 +++++++++++++++++++++++++
>  1 file changed, 164 insertions(+)
>  create mode 100644 package/motion/0001-Gettext-0-22.patch

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
