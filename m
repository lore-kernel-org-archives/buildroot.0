Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89CF8C47073
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 21:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4618D6F4CA;
	Thu,  4 Jan 2024 21:32:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4618D6F4CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6qkivh5s8Q4U; Thu,  4 Jan 2024 21:32:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7606D6F4E7;
	Thu,  4 Jan 2024 21:32:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7606D6F4E7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 105EA1BF414
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDA8E42D9F
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:31:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDA8E42D9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JKdLLuiW3ISw for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 21:31:14 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D7F0242D9C
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 21:31:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7F0242D9C
Received: by mail.gandi.net (Postfix) with ESMTPSA id EBD1940002;
 Thu,  4 Jan 2024 21:31:11 +0000 (UTC)
Date: Thu, 4 Jan 2024 22:31:11 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240104223111.2764a105@windsurf>
In-Reply-To: <20240103192625.2787462-1-bernd@kuhls.net>
References: <20240103192625.2787462-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704403872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IoMFW/OeS76yq94jk5n+sX4N2fNE8KAOQ2TJKEYeLho=;
 b=BpN+dqOI4YjvFuYGUDGV4x4suqh9FCeiKtJIBocC/cZY3+U+R8JrTlG/0g/QEUX4bIWv7z
 7/QICN3htyJu13fHagvVnY3sK3MPou+PBI0TZjdzugdVjr5/RkReekEINOVKgFTOkdm7xy
 sgaoskFCOB9pAq+TaRKnYtoH6Axs6HFfkaGmvXJa8UqPlSLWJgZTNIJUazeqEPU9GtgASh
 5ih5aEPUUjAdhnpFYP7wwktEvwmRc+oo6I4BjjlHJU+IlQRtz9nuxnny6PTo5RB2m/xsKh
 iWvUdMxIqaAF3jkThis+wQsWZ5cqeZP27lp3m+Mv/txE12cvQ+i4jV8nV0Q1jg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BpN+dqOI
Subject: Re: [Buildroot] [PATCH 1/1] package/tvheadend: bump version
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  3 Jan 2024 20:26:25 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Updated license hash due to upstream commit
> https://github.com/tvheadend/tvheadend/commit/3cf5acdc714dc025b2246d2395478fcfd058afeb
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/tvheadend/tvheadend.hash | 4 ++--
>  package/tvheadend/tvheadend.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
