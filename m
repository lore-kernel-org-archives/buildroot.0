Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12CEFA373F
	for <buildroot@archiver.kernel.org>; Mon, 24 Oct 2022 21:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9487160B10;
	Mon, 24 Oct 2022 21:01:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9487160B10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XnpBqieSbp1y; Mon, 24 Oct 2022 21:01:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C786260ACD;
	Mon, 24 Oct 2022 21:01:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C786260ACD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 940001BF338
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 21:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6DEB34033A
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 21:01:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DEB34033A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4mrmAny-4Qgk for <buildroot@lists.busybox.net>;
 Mon, 24 Oct 2022 21:01:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 163AE40339
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 163AE40339
 for <buildroot@buildroot.org>; Mon, 24 Oct 2022 21:01:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CAB6E60006;
 Mon, 24 Oct 2022 21:01:36 +0000 (UTC)
Date: Mon, 24 Oct 2022 23:01:35 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20221024230135.2df13e3d@windsurf>
In-Reply-To: <20221024195436.409490-1-ju.o@free.fr>
References: <20221024195436.409490-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666645297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y6WMaXXPw7D7DHqPrsyxDFCvWSMzZIedQSrrS9y9pY4=;
 b=lW/gdp7aprUsadZV5ySEVKkkytW303CfEjGkJVD5qqwigVZlyD8tocsR8ZuakCEaw19KLM
 1XPM4qunTVYJfrAhFNfYjZdB+SvHGM4PGKyOHcb2bqnoaHDhxCoYly2o+NMHO0+0YpOd85
 UjQ4lpVgFqVmI0GmNoJ4xcebCAcUksR7Uaw3/0jooThgso3oYOl0ns5WY0bPB0qSifdSak
 5h3LSqq0yO2ketEeGorPD+uVNqBoMl3XeDAGj9tvxU397qbiWffWOenibldNaQlPOn2I8C
 8tfxk8iY1wQOz61wMuKKHQivsggDGIkqNgIyku4znt1KOs44YEpDTdTWwREwTQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lW/gdp7a
Subject: Re: [Buildroot] [PATCH 1/1] package/python-distro: bump to version
 1.8.0
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

On Mon, 24 Oct 2022 21:54:36 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Also adds md5 file hash published on:
> https://pypi.org/pypi/distro/json
> 
> For change log since 1.7.0, see:
> https://github.com/python-distro/distro/releases/tag/v1.8.0
> 
> Most notable change is the upstream support for Buildroot
> (included in python module docs and tests).
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Tested on commit bd6e792 with commands:

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
