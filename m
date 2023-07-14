Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EFE5EB64DC
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 10:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A65B061441;
	Fri, 14 Jul 2023 10:21:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A65B061441
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ulljwYg4W2wx; Fri, 14 Jul 2023 10:21:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E31B86141A;
	Fri, 14 Jul 2023 10:21:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E31B86141A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 102CF1BF313
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 10:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC15A421B4
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 10:21:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC15A421B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G3M6fBMg3X-6 for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 10:21:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABC4F421A2
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ABC4F421A2
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 10:21:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D1D7D4000A;
 Fri, 14 Jul 2023 10:21:33 +0000 (UTC)
Date: Fri, 14 Jul 2023 12:21:32 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230714122132.6f8c1d2e@windsurf>
In-Reply-To: <20230714050251.3063758-1-bernd@kuhls.net>
References: <20230714050251.3063758-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689330094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8w271Qjdd2xUHFrkssOCvr4GEJD4WgY+aRLmLO8oKhM=;
 b=TShDfDi2WZRKbbVkGKgpIvYPUANtoCaoQ74/V/tnsBx1fYPYRC+Obho3UGKv3fEKBrj++o
 0G5UZHTw1r0FsCZOvPSQstfCY7mWPGYuznEwvdmuV7rgFfJeIUWB9GnVQWlvpUloUxw1YI
 u4Bs6nfmVBsBeUWvYc/GZllqmu6yx92Ikyuc1bREUQYcEnfzcB0b37g7sPk+T8HQpvuIyq
 DPMdeQaLJxjU1HVX1w046QAftTuKpUw3fHTPm1tGii+q/3UlGOSzpssMCqWS/9qgYY93ox
 w3XcGxnJQtBfADeNGvuiPe+A5Hq8MMWGlYIIOQfoPi/DKZWan2APHujV9KZc8g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TShDfDi2
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{3,
 4}.x series
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

On Fri, 14 Jul 2023 07:02:51 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  linux/Config.in                      | 2 +-
>  linux/linux.hash                     | 4 ++--
>  package/linux-headers/Config.in.host | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)

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
