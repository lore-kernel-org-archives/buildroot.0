Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB0BC3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 17:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D397400BA;
	Sat, 23 Dec 2023 17:01:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D397400BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id poYXqShab-o9; Sat, 23 Dec 2023 17:01:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22CE1404FF;
	Sat, 23 Dec 2023 17:01:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22CE1404FF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DD53C1BF2C2
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 17:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3E9081EB2
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 17:01:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3E9081EB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id As8pb050QfZ9 for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 17:01:17 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B83E98164B
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 17:01:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B83E98164B
Received: by mail.gandi.net (Postfix) with ESMTPSA id C6A7940003;
 Sat, 23 Dec 2023 17:01:13 +0000 (UTC)
Date: Sat, 23 Dec 2023 18:01:13 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20231223180113.704d83b1@windsurf>
In-Reply-To: <20231206200730.1948165-1-giulio.benetti@benettiengineering.com>
References: <20231206200730.1948165-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703350874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qjEeGpPvDVjrVdGwK7sa1gtT+md0pemOUjcXUAue//w=;
 b=RzrLoiENNUuBu/+UPO3iGuYTx0Yp14djsSyHYK+/W6y59M914HS5fnckD7NjfUg5FBSX9p
 awPXxqLXDe3QUELQy/k8/o9V14pWf6ZfyldGjXFx5QibAO0GmMAvV3vOomj2+pUpYk+YjX
 kaj5lDrMDF4NzEQrUTpdnB2ctll2z01ZLk+9Dt6kxBDoNvQU3x389JOOt6KFAqvSvuC+S2
 96MxH5JtjSdZR8vqofe5+aRbjPJX3mCA1ZdslijVmh5+sXFMtLDmwnZCeS3khbN+VkZZHR
 oCDnOT5QQOCDUjk344nIcEWpgQpBC/oFPuz/r2wpEz/U4TvCjjpowrJhUAhjXA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RzrLoiEN
Subject: Re: [Buildroot] [PATCH] package/rtl8188eu: bump to 2023-12-04
 version on v5.2.2.4 branch
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  6 Dec 2023 21:07:30 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> This version allows to build with Linux 6.7
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/rtl8188eu/rtl8188eu.hash | 2 +-
>  package/rtl8188eu/rtl8188eu.mk   | 2 +-
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
