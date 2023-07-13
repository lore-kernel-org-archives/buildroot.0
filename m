Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D65BC0015E
	for <buildroot@archiver.kernel.org>; Thu, 13 Jul 2023 20:30:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3403940575;
	Thu, 13 Jul 2023 20:30:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3403940575
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MSIQVYEtbVOG; Thu, 13 Jul 2023 20:30:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81F2F417A1;
	Thu, 13 Jul 2023 20:30:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81F2F417A1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 844321BF3D0
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 20:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A802408AF
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 20:30:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A802408AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9bssJU4tDxtr for <buildroot@lists.busybox.net>;
 Thu, 13 Jul 2023 20:30:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52AE740575
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 52AE740575
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 20:30:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 03506C0005;
 Thu, 13 Jul 2023 20:30:38 +0000 (UTC)
Date: Thu, 13 Jul 2023 22:30:36 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230713223036.1aaf36ac@windsurf>
In-Reply-To: <20230713202024.1662441-1-bernd@kuhls.net>
References: <20230713202024.1662441-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689280239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qZxkmU9G10aXg24kTqzBzPhg7b6DzNH3Adp//gXQARc=;
 b=GZmEUnBB+KduwISF/r+MM2Uu0ie1JxKagdO7wRmPI/TeAgvlvQskcE6uOCFT5bzKFy/hvU
 WqmWp4jzlqUgiuzrKdjSst5wVVht4zC9IdDYoVfWv4cGHpJZe+aqN4WhI1GZ43HX+dmBix
 kf+NaoGkorVnRRYAfcDGwNS8LAwMEo4a6LAVxM03yWVZ4U/6W3nZywDnwD/HYK9Vu6MQ70
 3tnetH10Nx6d1K7UXPfxYUF5kCmgccdlQtP5sFfD9qC/AjLFI8DHe82bZcJ62XiAIuTjcH
 QTv4MfH30r6IYdr9ni2YHByJTCd+1E3Ckku02Ps7h+mDiX/GmksZoXtEQyh82A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GZmEUnBB
Subject: Re: [Buildroot] [PATCH 1/1] package/ghostscript: security bump
 version to 10.01.2
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

On Thu, 13 Jul 2023 22:20:24 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes CVE-2023-36664:
> https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-36664
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/ghostscript/ghostscript.hash | 4 ++--
>  package/ghostscript/ghostscript.mk   | 2 +-
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
