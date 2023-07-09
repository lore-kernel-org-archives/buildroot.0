Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDD1EB64DC
	for <buildroot@archiver.kernel.org>; Sun,  9 Jul 2023 16:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15D8D60BFE;
	Sun,  9 Jul 2023 16:29:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15D8D60BFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VggJeSm4a1-d; Sun,  9 Jul 2023 16:29:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58654606A9;
	Sun,  9 Jul 2023 16:29:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58654606A9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0B1401BF423
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 16:29:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6C09409A7
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 16:29:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6C09409A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3CgJDAgZxtPe for <buildroot@lists.busybox.net>;
 Sun,  9 Jul 2023 16:29:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19F36409A5
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 19F36409A5
 for <buildroot@buildroot.org>; Sun,  9 Jul 2023 16:29:42 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C46C01C0006;
 Sun,  9 Jul 2023 16:29:39 +0000 (UTC)
Date: Sun, 9 Jul 2023 18:29:38 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230709182938.00cef6ca@windsurf>
In-Reply-To: <20230709095058.1547133-1-bernd@kuhls.net>
References: <20230709095058.1547133-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688920180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cgGr8ub514a9jFmgBgdkrdV/fBbTAQjVDT3roaN41AY=;
 b=KQ23wzZ8kjWnSIl5/5Ejb5dyW7kdmOtqju99wpwfW4e6uoM2ycc/7uJWQIObZSFCVRNFdH
 cL7MvbG5y7oMjpnbztIzpvjo+s99hTDWIWSDcGmdIwuxXdi1KzvTAvZjmDCaDkHAfbkJze
 XRqJYVHfwqspywcFQ2CmEpAnCjxuRHTmvk67NQlgivsc/6UsvNuHiYrtK3U/lFLmORbRR7
 pGFLldcKqlUzaxWmrd/PUpMbKIItb0hbv1volG1fAPv+ips7NpHgS0GeUWL9l1wYuWVjD0
 zg0tYN7dtJxbL4d2aQWxXfBSZZjKMpkRZmaIOzDxGnAA5/7X9SWN+RzJis09kQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KQ23wzZ8
Subject: Re: [Buildroot] [PATCH 1/2] package/fwts: Fix build with
 BR2_OPTIMIZE_0
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

On Sun,  9 Jul 2023 11:50:57 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/fab/fabd031d38cb618cdb11b4a86cd853b0da61695b/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/fwts/fwts.mk | 4 ++++
>  1 file changed, 4 insertions(+)

I've applied, but of course it isn't really nice. Has this issue been
reported upstream?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
