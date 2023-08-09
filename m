Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346C7C001E0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 17:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5AF4402D5;
	Wed,  9 Aug 2023 17:42:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5AF4402D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yg-ZqcCGjZ35; Wed,  9 Aug 2023 17:42:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DA5641B9C;
	Wed,  9 Aug 2023 17:42:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DA5641B9C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2018F1BF3B9
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 17:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED198610B4
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 17:41:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED198610B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UHl3orp98y7Q for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 17:41:32 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C85B360E5C
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 17:41:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C85B360E5C
Received: by mail.gandi.net (Postfix) with ESMTPSA id AFED1240002;
 Wed,  9 Aug 2023 17:41:29 +0000 (UTC)
Date: Wed, 9 Aug 2023 19:41:28 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230809194128.0effdfb9@windsurf>
In-Reply-To: <20230808193157.2042920-1-bernd@kuhls.net>
References: <20230808193157.2042920-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691602890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IP92Zc7jcjNUV6hrLiR718LD5rsgVvi5j4EwCMXpvk0=;
 b=NouOA2pPBLxQXAbrq6OqFF9gX5O+BoFAR4wN/Js0dV2VNVYL+fpUuJtSpd2Qrmzk2zPhG5
 tDwbmA33XzVbW0ENvpz0tChIZRUrW3pw6HeHbdhV4sDbzrtMlQ5K2FO8/bkzMMj/zvsG/x
 xZ/TJGvOsuzGYsMUzTKetnHvJTIEpLqdP75qhYgiUg8TriOLMN8ucDZLYLY7MTa27kBClL
 D7ohPaO3f97t5c/BT5FWj/7OeoFrjHResajRwAHiWl5tMMoYunxBgD6C7DFrW93LtVtvVM
 iFYEjUR3L5AtOmZUy98Ns/x+6+kDe8iMum+VwCJJZvPTtqHm2wph5UGgQ5j9ww==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NouOA2pP
Subject: Re: [Buildroot] [PATCH 1/2] {linux,
 linux-headers}: security bump 4.{14, 19}.x / 5.{4, 10, 15}.x / 6.{1,
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

On Tue,  8 Aug 2023 21:31:56 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes CVE-2022-40982:
> https://downfall.page/
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00828.html
> https://www.phoronix.com/news/Linux-Git-INCEPTION-DOWNFALL
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  linux/Config.in                      |  2 +-
>  linux/linux.hash                     | 14 +++++++-------
>  package/linux-headers/Config.in.host | 14 +++++++-------
>  3 files changed, 15 insertions(+), 15 deletions(-)

And the fun of a new hardware vulnerability begins!

Both applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
