Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13189C46CD2
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 16:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8785405A0;
	Sun, 24 Dec 2023 16:47:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8785405A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IXLKLvl00Bzl; Sun, 24 Dec 2023 16:47:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3507405A1;
	Sun, 24 Dec 2023 16:47:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3507405A1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8FE601BF30F
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 16:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4362D415B5
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 16:46:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4362D415B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pX1vGZmIglrr for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 16:46:29 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CBE9A415A6
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 16:46:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBE9A415A6
Received: by mail.gandi.net (Postfix) with ESMTPSA id B590E1BF203;
 Sun, 24 Dec 2023 16:46:25 +0000 (UTC)
Date: Sun, 24 Dec 2023 17:46:24 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20231224174624.7359b44b@windsurf>
In-Reply-To: <20231224081321.19791-1-bernd@kuhls.net>
References: <20231224081321.19791-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703436386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3JrOrRwh0WhERE0arQCCMgu/u0bAwMrYJRgKZrEsKJM=;
 b=A5WsGrsdsMjIlQkXiNxVvxD1WKvC4ZAcZYSLhqJqIPExfi7N0Ofl01ViEweMSyEI7nW0od
 S3a8QYS3hlJyluzp7srjuZnl8ap+6wh3Kpn1rTcRBBuQsVhNKjVAMe0JWNBvChdhD1Eyi5
 15lgBIG6A1V0AERLPcDzOn4ImyRcAVdC13Bi33oryXVT17XtVcqdsQcBdaZTgV23cbE3jd
 MGKc9VMk//hBjG6Pi5Fgx4KzKsbUyclmM53+4XRSOyhrPn1BtOlJ8EG2+/aG7eYaqTD2Zc
 uV2b76UxxYVyIvZ2m0fRH6aVd5vRLiuGpcKZ4mitORyhc7PmbxD5RoM3ItrtSA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=A5WsGrsd
Subject: Re: [Buildroot] [PATCH 1/6] package/onevpl-intel-gpu: bump version
 to 23.4.3
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>,
 Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 24 Dec 2023 09:13:16 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/onevpl-intel-gpu/onevpl-intel-gpu.hash | 2 +-
>  package/onevpl-intel-gpu/onevpl-intel-gpu.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Thanks, series applied. While applying/testing those patches, I found a
dependency problem in onevpl-intel-gpu, which I fixed in a separate
commit:

  https://gitlab.com/buildroot.org/buildroot/-/commit/120f961fc6d4a8902487f17a13646be60f6f7ce1

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
