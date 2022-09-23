Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACC9C07E9D
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 21:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B19314098D;
	Fri, 23 Sep 2022 21:33:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B19314098D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5bW8mcDd1pKW; Fri, 23 Sep 2022 21:33:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9711B40294;
	Fri, 23 Sep 2022 21:33:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9711B40294
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 01C051BF337
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:33:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D132D40220
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:33:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D132D40220
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xaNa8_rNlRvB for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 21:33:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7841A40151
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7841A40151
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 21:33:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 79211240005;
 Fri, 23 Sep 2022 21:33:29 +0000 (UTC)
Date: Fri, 23 Sep 2022 23:33:28 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20220923233328.2955c3f3@windsurf>
In-Reply-To: <20220922191350.29423-1-ps.report@gmx.net>
References: <20220922191350.29423-1-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663968809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tiprQavze2a9dtjM0i/4ixlHTl43Cfc0O+3Zw2za6Ys=;
 b=bUM3udd9WmeY7MXwMBxrSOnpisDF1EhuXf8eiRAqPyDDlu2oh2PMww1h9xBR71ncu9kufz
 mU37WzLogVa2WqfPo+So5QMyTPhD4ut3Yfx2W6SNdeZVSjOxU62yd1nZFn3WOgZHsPBnXk
 q9YpakHLbaozWc8LHZr/i+AhXhIIaZe6/M4S3+i2DNWY5sNioHbDMS5KaMKe6UFX55674R
 pFOtM2pULWZpmtId2nkSyK+JbXvY1t9PlG2J2kkDKxjYDdJcac15oc/cQ6WN+TytNZls7v
 LSn7NORNVy+spMFJ5dKJgdiOBf+F4n5bidz/zzrBVgWyip97yK6nmP6tHZaJDQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bUM3udd9
Subject: Re: [Buildroot] [PATCH v1] DEVELOPERS: remove Peter Seiderer
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

Hello Peter

On Thu, 22 Sep 2022 21:13:50 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> No review/patches from my side the last few months, so drop my
> DEVELOPERS entry.
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  DEVELOPERS | 35 -----------------------------------
>  1 file changed, 35 deletions(-)

Thanks a lot Peter for all your contributions to Buildroot. It is sad
to see you go, but your contributions have been greatly appreciated. I
hope that you will nevertheless have the chance to get back to
Buildroot at some point in the future.

Patch applied, of course!

Once again, thanks a lot, and all the best!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
