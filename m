Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E785EC3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 22:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EFF961098;
	Wed, 20 Dec 2023 22:11:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EFF961098
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zw-RNLEwZ2oK; Wed, 20 Dec 2023 22:11:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDCE761096;
	Wed, 20 Dec 2023 22:11:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDCE761096
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4AEEF1BF471
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 22:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1155C42189
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 22:11:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1155C42189
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UgNONjTVCpdU for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 22:11:42 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8114E41732
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 22:11:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8114E41732
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8AE9A1C0005;
 Wed, 20 Dec 2023 22:11:39 +0000 (UTC)
Date: Wed, 20 Dec 2023 23:11:38 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231220231138.1f82761f@windsurf>
In-Reply-To: <20231218194001.544887-4-adam.duskett@amarulasolutions.com>
References: <20231218194001.544887-1-adam.duskett@amarulasolutions.com>
 <20231218194001.544887-4-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703110299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0jvOd9aSbD5V+w1ZHQxeSp/HJG6JAE5IIe7h5vU3SNE=;
 b=O+FpvfPwUVdj8XfT7NFT2Tn14iagfn/XvxJG3QgY5pLmpprorgK5ehJumwKvWL8tsE0UWD
 B5LWl23e1vFLn4rp4GEsfXeywfUwrML1WzpFu0EA6qElh1HzvqR/mu5HEN6OMHOI8Ob/A0
 b+Wn9t5E8s0XQ938mCqq1qCX+ZvkE4k7pWYyfWhWmoOawgJ4Dm0Oqz2oEhm/YTA8ypaSj8
 IvoOsTlFL1cujOMC8fyo01gKtLtGBFdaNRmtI4EPliC8WAHT/1ov1i8q0lj1JWyTN79KZX
 yBmSET3HhRbt4NXiu1bLQZhG8SnhjUrLotfueMjOUvkQrMrRM3X4mq5z5xKGSQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=O+FpvfPw
Subject: Re: [Buildroot] [PATCH v2 04/14] package/tllist: new package
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

On Mon, 18 Dec 2023 12:39:49 -0700
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
> v1 -> v2: Fix the sha256sum of 1.1.0.tar.gz

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
