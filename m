Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DED3C00528
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 21:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 364C260EC4;
	Sun,  6 Aug 2023 21:40:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 364C260EC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zqlPZBZRwbbu; Sun,  6 Aug 2023 21:40:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D95D60E76;
	Sun,  6 Aug 2023 21:40:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D95D60E76
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 204F11BF30C
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 21:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA27E60D6B
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 21:40:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA27E60D6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9DxHb4ycwcO6 for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 21:40:14 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DC08A60E51
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 21:40:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC08A60E51
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4F19240002;
 Sun,  6 Aug 2023 21:40:10 +0000 (UTC)
Date: Sun, 6 Aug 2023 23:40:09 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230806234009.27e80112@windsurf>
In-Reply-To: <20230805173905.1571097-2-bernd@kuhls.net>
References: <20230805173905.1571097-1-bernd@kuhls.net>
 <20230805173905.1571097-2-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691358011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZJQsBylgiqZdclln1i0q+WtoLcVClSNimosA1ayyYfs=;
 b=XurdzU7myjIjYnX8YX7dL605/oRUz2WPJsCNQeOa4Dz9swUo8/M2Cz0Fkb62aXaCLj7n9H
 TQN+MkWLXssJaBhZjLgbVRhGGHKYyPC9hOzaHF0ly5x5EhKFSwhtFQOJ/zzXt1dDXymLBA
 iqPT5ZuOL+AvMTHah0VJwhBAJf37oBhl4O7EhUTxSCw2X5l+rFC6yLCUc/sjWVFqdnusYN
 MwjWRTYEBUXDPuYnZeDb5Nww382CEUKmqRZx/7nKmW2Wd0QCm0LvInVvguUjefQY+P9SK5
 QjHE1kVsdnbbBQelu2UywytpXI2AxurelSxHjCP0rlr47ujiFNFPu8tMgu3cwA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XurdzU7m
Subject: Re: [Buildroot] [PATCH 2/2] package/python-constantly: fix build
 with python 3.12
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  5 Aug 2023 19:39:05 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .../0001-Update-versioneer.py-to-0.21.patch   | 2715 +++++++++++++++++
>  1 file changed, 2715 insertions(+)
>  create mode 100644 package/python-constantly/0001-Update-versioneer.py-to-0.21.patch

I'm not too fan of this. This is a huge patch, and this pull request
https://github.com/twisted/constantly/pull/27 has been pending since
December 2021, a year and a half ago. There's no sign of it being
considered.

Why is this dependency of python-twisted so poorly maintained? No
release since 2015, no commits since 2018. Can this be discussed with
upstream?

Thanks,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
