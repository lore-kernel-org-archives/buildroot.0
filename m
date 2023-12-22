Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD83CC41535
	for <buildroot@archiver.kernel.org>; Fri, 22 Dec 2023 08:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BD5360FA7;
	Fri, 22 Dec 2023 08:07:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BD5360FA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QvIDVOlwXnZ9; Fri, 22 Dec 2023 08:07:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CB0E60BC0;
	Fri, 22 Dec 2023 08:07:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CB0E60BC0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 779CA1BF2F7
 for <buildroot@lists.busybox.net>; Fri, 22 Dec 2023 08:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 509AC83D96
 for <buildroot@lists.busybox.net>; Fri, 22 Dec 2023 08:07:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 509AC83D96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R9z6Udp_kspV for <buildroot@lists.busybox.net>;
 Fri, 22 Dec 2023 08:07:17 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E209183C87
 for <buildroot@buildroot.org>; Fri, 22 Dec 2023 08:07:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E209183C87
Received: by mail.gandi.net (Postfix) with ESMTPSA id A28DBFF806;
 Fri, 22 Dec 2023 08:07:13 +0000 (UTC)
Date: Fri, 22 Dec 2023 09:07:12 +0100
To: Davis <davikovs@gmail.com>
Message-ID: <20231222090712.4ef84484@windsurf>
In-Reply-To: <CAHQn7pKD3HBJ96Pe90+gvsNehuALXGbXarqLDDcn8_M5hSKDrA@mail.gmail.com>
References: <20231218183230.1899-1-davikovs@gmail.com>
 <20231220212445.16494c0f@windsurf>
 <CAHQn7pKn5-Ss+zVkEzGow6TNm8xc2kmfkWMEXe2zZbYmFOmQPw@mail.gmail.com>
 <20231221084252.287ba580@windsurf>
 <CAHQn7pKD3HBJ96Pe90+gvsNehuALXGbXarqLDDcn8_M5hSKDrA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703232434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Z4RfdKC2TSZ4Amwh4GEZ8TRa0rnWUhpZUuspYYY/Y8=;
 b=LUmm7LHASfmJq97x7uneUt2dMc0LsxyBKM8p/rS36doUeylrE25eJIPnOiUo9H7aMJRHpY
 4fkuOpCFOVCL2cPh0ofxXzVI9pKWjj2MQRfHEeeOqUMMypHpHZ8Lxrox5WYs5aHFOLVkyv
 S5scOnbX1OwovZFAuKlD1T7Ganoz9m7ScWj876ocQtjPNCJzX39vOFvXpDAyAd1Xc9MuGS
 +pw/okWhaUVoiNwVCYx+RNmH19AwMbIhQsTtIyyUGW2hLcb1UKl5hKiKSLjr0mN2XWtAcj
 9U+/9Em50mr19Xq7+UDOkU8oa8UAZWgr9I7AvxBs/+wbD0Ie+He0U/h5q2bClA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LUmm7LHA
Subject: Re: [Buildroot] [PATCH 1/1] package/{bluez5_utils,
 bluez5_utils-headers}: bump to version 5.71
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

Hello Davis,

On Fri, 22 Dec 2023 00:41:23 +0200
Davis <davikovs@gmail.com> wrote:

> Just one more question, BlueZ itself is covered by a license that allows
> persons not affiliated with BlueZ or Buildroot to bump the package version,
> correct?

I don't even see how the license of a software could prevent that. And
"affiliated with BlueZ or Buildroot" has absolutely no legal meaning.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
