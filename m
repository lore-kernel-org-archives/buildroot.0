Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18395C001DC
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 10:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B214F41BA7;
	Thu, 27 Jul 2023 10:49:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B214F41BA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OHTFd8Nc8shb; Thu, 27 Jul 2023 10:48:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C026941E09;
	Thu, 27 Jul 2023 10:48:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C026941E09
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9D9F91BF40B
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 10:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75EE141E52
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 10:48:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75EE141E52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JwWZYvAifsrQ for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 10:48:55 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2340441887
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 10:48:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2340441887
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5E01220007;
 Thu, 27 Jul 2023 10:48:51 +0000 (UTC)
Date: Thu, 27 Jul 2023 12:48:50 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230727124850.583e4311@windsurf>
In-Reply-To: <20230726155733.254342-1-bernd@kuhls.net>
References: <20230726155733.254342-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690454932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vVEFjX9cB0nrK0eskQkr3pRNIJnFqXUMLeUPOe+CiuQ=;
 b=O3tSbYWHVQYRSJL+KaXNSd9jtLT93vTMB1jC/KQr/Jevoptvp3amYcxj2Qrv4MlmJyUwW/
 mryAJd71XGOEYZmHe4y+qyPu1ybub4woZb4nNKq4RiuSApIDjaPY1x+fXKeoyk8izegUEv
 zvoiQfnYDh+vrvph/n+2tLd5FA6yhpHQ5Fy/mUbQb76uf6pHblvD6nIYcHDr8zajnbr08j
 DOcHOVaQkf7cuuAV7XuhaXOGTGNUQn706k/OY5uQq333Jx+a8buQv8+CNavFQ8+TInRsCL
 bsDFCqLSC8Pe1zpMlvHNoHrnZ5gd8xu8xZaGzIfFXsDJbLMwIz5+ACNIAfbejQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=O3tSbYWH
Subject: Re: [Buildroot] [PATCH 1/1] package/sofia-sip: bump version to
 1.13.16
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
Cc: Gregory Dymarek <gregd72002@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 26 Jul 2023 17:57:33 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/sofia-sip/sofia-sip.hash | 2 +-
>  package/sofia-sip/sofia-sip.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
