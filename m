Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2FFC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 19:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83C4461249;
	Mon,  6 Nov 2023 19:37:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83C4461249
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xeAMhbe43KOo; Mon,  6 Nov 2023 19:37:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAF26611CB;
	Mon,  6 Nov 2023 19:37:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAF26611CB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AFEF61BF2EA
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 888F641721
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:37:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 888F641721
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BgVRaIbPvNYc for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 19:37:37 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 80ACC41720
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 19:37:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80ACC41720
Received: by mail.gandi.net (Postfix) with ESMTPSA id 87C3F20002;
 Mon,  6 Nov 2023 19:37:34 +0000 (UTC)
Date: Mon, 6 Nov 2023 20:37:32 +0100
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Message-ID: <20231106203732.3f52cf42@windsurf>
In-Reply-To: <20231106070831.1205739-1-marcus.folkesson@gmail.com>
References: <20231106070831.1205739-1-marcus.folkesson@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699299454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1TMsulDSvg/J8OOFn+ursJN48+nt+/tya/BFgtlbU5A=;
 b=V0aGfM4fiKGFsVtBY1SIr5GVAvPjMPSL7aEioTFDnEXIl6/EYGQu+6TLNdVRy8uVjIlxY2
 J8M9eEc5i0h3g3lc4Zhj7yeVXlirhQ2wddcIsTY178NDMyowARI4EW0gDt6x3nK/ZiaV2G
 9OnfMWXJh4/bInULLEySYLsdKZOx8qrao1LDfKTwACIHJkHUCxoQunkq0h5zc6vcNtpE7w
 992p+XSTr0OhnaVcMRxJYv/tlM4xfM/qiZI4r1YH9KO1asP7c8rAXVCF0FJFYTEevISQoi
 jGWuDr2GLdvF05qQ3ec8zxUBF1Nkyjtju5nmGEYMfaUqcJ0qzYl/3ua1VOMSKw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=V0aGfM4f
Subject: Re: [Buildroot] [PATCH] package/libcamera-apps: bump to version
 1.3.0
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

On Mon,  6 Nov 2023 08:08:31 +0100
Marcus Folkesson <marcus.folkesson@gmail.com> wrote:

> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  package/libcamera-apps/libcamera-apps.hash | 2 +-
>  package/libcamera-apps/libcamera-apps.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
