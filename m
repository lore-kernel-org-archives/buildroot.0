Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D67B0C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 17:48:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 827E960B87;
	Thu, 10 Feb 2022 17:48:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UklWXAqq90Ln; Thu, 10 Feb 2022 17:48:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C885760B69;
	Thu, 10 Feb 2022 17:47:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3BF2A1BF228
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 17:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 273F840184
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 17:47:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=othermo.de
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JZBxf4eGjoQc for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 17:47:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout-b-105.mailbox.org (mout-b-105.mailbox.org [195.10.208.50])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 79BC240144
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 17:47:52 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:3:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-b-105.mailbox.org (Postfix) with ESMTPS id 4Jvkjb4vXzz9stZ
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 18:47:47 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=othermo.de; s=MBO0001; 
 t=1644515265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b0MuJWDXY1sLWwzMVxigGNj1nsqQr4hVXGqCTQBg6mg=;
 b=Z96h4gZhwfR7KuP+jofIho4bu1TY6XOD3jk/4R2Dbk7PoYcjE5t8ar7Mvf3sRqMqvcVYXp
 aWNEQrdfv7vPwBFFGPRZwMz8Ajsel6Hg7gUUz/MsHvd5O0L/E6FNvW+YR/rhj/S01vbrte
 yfbIeWjse98bglFDzF3c4V0KMHISBqmi1EFKlgNGbpMOLBfhmosj6leH3nVviWSH7aGJbi
 vlcLezwbp5BiJh33x+yYJ0Lg+RUFYkkzDW5xvo4kVrF9sYNowO0182MSkS3ioew7fybsTj
 0O1Yd6XCqyCPP4EYiZ3UI95Ec/bZ5+JlbncVPUUNPtbO+P6WBRZX2EcgvkYz5A==
Message-ID: <be6f793b-c825-98c7-dcd4-a4335ba5191c@othermo.de>
Date: Thu, 10 Feb 2022 18:47:40 +0100
MIME-Version: 1.0
Content-Language: en-US
To: buildroot@buildroot.org
References: <20220209214326.21671-1-heiko.thiery@gmail.com>
 <d83325d3-e945-eea8-cbf7-560cf0350a57@othermo.de>
From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
In-Reply-To: <d83325d3-e945-eea8-cbf7-560cf0350a57@othermo.de>
Subject: Re: [Buildroot] [PATCH] package/rauc: bump to version 1.6
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10.02.22 18:37, Marcus Hoffmann wrote:
> Hi!
> 
> On 09.02.22 22:43, Heiko Thiery wrote:
>> For release notes see: https://github.com/rauc/rauc/releases/tag/v1.6
>>
>> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> 
> Builds and works fine on a raspberrypi CM4.

Rereading that, this sounds slightly off... built *for* raspberrypi cm4.

> 
> Tested-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
