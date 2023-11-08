Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59049C4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 22:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FA4560669;
	Wed,  8 Nov 2023 22:33:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FA4560669
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2bM33bPEkRYu; Wed,  8 Nov 2023 22:33:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FBED606B0;
	Wed,  8 Nov 2023 22:33:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FBED606B0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 23DFD1BF40B
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 22:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF22F81F7E
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 22:32:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF22F81F7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mKCuK1IxEqzu for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 22:32:55 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C18C81F0F
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 22:32:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C18C81F0F
Received: by mail.gandi.net (Postfix) with ESMTPSA id 23D5B240005;
 Wed,  8 Nov 2023 22:32:51 +0000 (UTC)
Date: Wed, 8 Nov 2023 23:32:51 +0100
To: Woodrow Douglass via buildroot <buildroot@buildroot.org>
Message-ID: <20231108233251.7cc6779f@windsurf>
In-Reply-To: <20231107154424.1602940-1-wdouglass@carnegierobotics.com>
References: <20231107154424.1602940-1-wdouglass@carnegierobotics.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699482772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZL/8myEWAxSr3EpZFNzzcfSSYHWKvH5g2wyxWsSH0I8=;
 b=nV+4XOxjKdMDJcqXKgiP1qR+WDKBoJIcnMUv7ia0V2aUH42IxWwCBTIHdku0o97bCdsKg7
 iH1lfB8LfNeGUKqXQmSoizHSP8Xn5yV18iKv+NGysmU6e8yW6sjP/KRbnkqyIk5kNBHaeK
 q0oTmJrUTFM2eYJHV9YhEJcN8hW/eehkETd4jc6/HMMpwi+mTsGOyDcd6tdb1Z9n20h7DF
 KZANzzDh9ysk4o9NiP3ZnlPzCJ8vpGAxEWeVdsThckdbT7mJpEnp5h1ntFJ1+eLYPzdxXX
 1CfyWF7qf2R75nB1s+tcvPU/mG1wW+geaE1xD562BCmnCSZkdoI8J3L7ry8HTA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nV+4XOxj
Subject: Re: [Buildroot] [PATCH 1/1] package/opencv4: bump version to 4.8.1
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
Cc: Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Woodrow,

On Tue,  7 Nov 2023 10:44:24 -0500
Woodrow Douglass via buildroot <buildroot@buildroot.org> wrote:

> Also, bump package/opencv4-contrib to keep in lock-step. This should address CVE-2023-2617 and CVE-2023-2618
> 
> Signed-off-by: Woodrow Douglass <wdouglass@carnegierobotics.com>

Thanks a lot for the patch!

The commit title should have mentioned that's it's a security bump. The
commit log should also be more affirmative: "should address" is not
good enough. Does it address, or doesn't it?

Both CVEs are fixed in OpenCV 4.7.0, so bumping from 4.6.0 to 4.8.1
indeed brings the fixes for those CVEs.

I adjusted the commit title and commit log and pushed to master. Thanks
for your contribution!

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
