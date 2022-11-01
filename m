Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AAE1C4332F
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 20:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B52C8410A4;
	Tue,  1 Nov 2022 20:41:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B52C8410A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G1tH344PHIoG; Tue,  1 Nov 2022 20:41:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A54E3409BE;
	Tue,  1 Nov 2022 20:41:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A54E3409BE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3A10C1BF834
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1132B81463
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:41:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1132B81463
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pIlOijuHsuoQ for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 20:41:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0C7D81460
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E0C7D81460
 for <buildroot@busybox.net>; Tue,  1 Nov 2022 20:41:07 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4A787FF802;
 Tue,  1 Nov 2022 20:41:05 +0000 (UTC)
Date: Tue, 1 Nov 2022 21:41:03 +0100
To: Baruch Siach via buildroot <buildroot@buildroot.org>
Message-ID: <20221101214103.1d0db42e@windsurf>
In-Reply-To: <5c28d160a68a33114f598450fed73bb1d774d9dc.1667321825.git.baruch@tkos.co.il>
References: <5c28d160a68a33114f598450fed73bb1d774d9dc.1667321825.git.baruch@tkos.co.il>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667335266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aD0+eoiDaID3zKaYUJnYVSQm2ejIGZDMJInNCq3KZIo=;
 b=RZchjYgj6PpFosfe9ScCcXqOjQ896fG9A+8NrQ5GVxFcv0M3Kq77NXipOgpOvTqLd7BYgV
 7OxJvJGvRou3bly/qi7W8ikyLTtmhJNKmFAD+j4tukmsz9GEYOIpBFpBb5XtC33H2zpd9G
 ISB+zoZd4iRGnz19zb7tr7wDR195ibd45CqzXoGEN+IsSBUC2z74OBUAlObYkzm6idks8B
 x+LtLGsdMJiqYtwk/Dpp+WJZg3BjV4rk2tGjH9PAm/y9InU7c0TYSVNdufRmiWZZj3uYEg
 Lzeotg8ZuHkY455hSIY7pZWPalFLrb4X2sXRoGRlFxlj50eN9+uRXpAmsmk9iw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RZchjYgj
Subject: Re: [Buildroot] [PATCH] package/strace: bump to version 6.0
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

On Tue,  1 Nov 2022 18:57:06 +0200
Baruch Siach via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/strace/strace.hash | 4 ++--
>  package/strace/strace.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
