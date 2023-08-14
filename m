Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC7BC001DB
	for <buildroot@archiver.kernel.org>; Mon, 14 Aug 2023 14:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B8AE61081;
	Mon, 14 Aug 2023 14:38:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B8AE61081
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CGusYKOSBmWk; Mon, 14 Aug 2023 14:38:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D16B6107D;
	Mon, 14 Aug 2023 14:38:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D16B6107D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 43F291BF385
 for <buildroot@lists.busybox.net>; Mon, 14 Aug 2023 14:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1CCFB61089
 for <buildroot@lists.busybox.net>; Mon, 14 Aug 2023 14:38:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CCFB61089
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oNpRjkBbE9J6 for <buildroot@lists.busybox.net>;
 Mon, 14 Aug 2023 14:38:18 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7BD0861081
 for <buildroot@buildroot.org>; Mon, 14 Aug 2023 14:38:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BD0861081
Received: by mail.gandi.net (Postfix) with ESMTPSA id D5C37FF807;
 Mon, 14 Aug 2023 14:38:14 +0000 (UTC)
Date: Mon, 14 Aug 2023 16:38:12 +0200
To: Paul Cercueil <paul@crapouillou.net>
Message-ID: <20230814163812.6a7d5267@windsurf>
In-Reply-To: <20230814064247.333044-1-paul@crapouillou.net>
References: <20230814064247.333044-1-paul@crapouillou.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692023895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=01PjQjusTr9m6Rv/TqAg6vTLcmMRj+PQmpDz28xRBsg=;
 b=KPLNJFACIZSRlYcMO5wK/E4URwYj7rPkfypJvZNLsOfht+BYCVTfpi5w9Q8edLH+SiUAnj
 8LyyP0dbksBpn9Nv5mgKW/BXSDGfL7PVSvt4cqKNneBDkliTVANlHWX3XBjSuwzPRrkiCa
 4WWgfS7SXMSBxN8txl179EO/CEreXPP3vHzujJsoAzDhUyC12ZAwKVska5PuidsVwC5cgv
 +tQGmRNAIiQ9wtyHaRWXNSr0lSGFnawquDPrIrryzLgCFJzNQ8BptX2kjwrQc8sqh0+DTJ
 aJE5Vhu3st1k4KVFYQYqhjqsAZu/xRyaJZ74TFdiPvrVJ0bcVundj7eNQFS4Ow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KPLNJFAC
Subject: Re: [Buildroot] [PATCH 1/1] package/libiio: bump to version v0.25
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

Hello,

On Mon, 14 Aug 2023 08:42:47 +0200
Paul Cercueil <paul@crapouillou.net> wrote:

> The changelog is available here:
> https://github.com/analogdevicesinc/libiio/releases/tag/v0.25
> 
> Remove the 0001 patch as it is included in the v0.24 version.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../0001-iiod-serial.c-fix-sparc-build.patch  | 76 -------------------
>  package/libiio/libiio.hash                    |  2 +-
>  package/libiio/libiio.mk                      |  2 +-
>  3 files changed, 2 insertions(+), 78 deletions(-)
>  delete mode 100644 package/libiio/0001-iiod-serial.c-fix-sparc-build.patch

The .checkpackageignore file needs to be updated to remove the line
related to 0001-iiod-serial.c-fix-sparc-build.patch.

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
