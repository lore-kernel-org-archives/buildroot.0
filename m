Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07976E7070A
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 10:31:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3D7E83C0F;
	Thu, 21 Sep 2023 10:31:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3D7E83C0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fEjz8c-2fYJA; Thu, 21 Sep 2023 10:31:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10C6983C4A;
	Thu, 21 Sep 2023 10:31:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10C6983C4A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0A1E71BF990
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 10:31:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CACD483C0F
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 10:31:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CACD483C0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q3rKVnJdL0_L for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 10:31:52 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 56C38812AF
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 10:31:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56C38812AF
Received: by mail.gandi.net (Postfix) with ESMTPSA id 46E5420002;
 Thu, 21 Sep 2023 10:31:49 +0000 (UTC)
Date: Thu, 21 Sep 2023 12:31:48 +0200
To: Daniel Lang <dalang@gmx.at>
Message-ID: <20230921123148.3a5c9d15@windsurf>
In-Reply-To: <20230921041518.72066-2-dalang@gmx.at>
References: <20230921041518.72066-2-dalang@gmx.at>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1695292309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MBV8i2ANKk0bbWwwyiLc1JxbTUmmarSNSRrhXrNP4/4=;
 b=hkhNYXXQDk3o6n+Kwsaa/OhtogWQDdk7PBYq/TykGhzNOLdFTCQyDOBtgecMNIgQBH8EB8
 pBLpu1iDINErEFncnszTxqrYh4pxEEQNM3Xw2z4YATEmVh60zHhNdmAQQzZsOgOpxkXee4
 SDsv1j+XgN2s3UiFKa5f6gpnvp6g2WbKG2AUPP748tot6cP4GGZQiWyvMZz72O0cQGcHzo
 dya0JxJbFetpWuVaOl478BYULr6QWBeV2+PhtGawiXchQRWhmHVlZ6bQ2SIPrTAus3PeGG
 7u+56Q/wZKcXYUMWUUnJXvaWpJHSVw4BGFWGMTvFop7VECuiIzfaJzIRpGn+Lw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hkhNYXXQ
Subject: Re: [Buildroot] [PATCH] package/sysstat: drop CVE-2022-39377 from
 IGNORE_CVES
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

On Thu, 21 Sep 2023 06:15:18 +0200
Daniel Lang <dalang@gmx.at> wrote:

> As off 2022-11-22 CVE-2022-39377 is listed as affecting sysstat
> < 2.16.1 instead of < 2.17.1.

Hm, the comment below talks about 12.6.1, here's you talking about
2.16.1 vs. 2.17.1. Could you clarify this?

> -# NVD is not up-to-date; 12.6.1 includes c1e631eddc50, which fixes the issue

                            ^^^^^^ here

> -SYSSTAT_IGNORE_CVES += CVE-2022-39377

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
