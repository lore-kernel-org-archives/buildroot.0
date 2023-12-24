Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF5F9C46CD2
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 17:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A980981D5A;
	Sun, 24 Dec 2023 17:55:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A980981D5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I7qTMy6RRyfL; Sun, 24 Dec 2023 17:55:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1039F81AF4;
	Sun, 24 Dec 2023 17:55:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1039F81AF4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DAB571BF398
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 17:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3FE981442
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 17:54:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3FE981442
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XOM_SkUz8kQt for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 17:54:13 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A4934813E5
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 17:54:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4934813E5
Received: by mail.gandi.net (Postfix) with ESMTPSA id 01853E0003;
 Sun, 24 Dec 2023 17:54:10 +0000 (UTC)
Date: Sun, 24 Dec 2023 18:54:10 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20231224185410.05829447@windsurf>
In-Reply-To: <20231224094515.1349572-1-bernd@kuhls.net>
References: <20231224094515.1349572-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703440451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mhjDTeXF8QowlAYe4FJqO3aN8WZWReRr8+VgqKJZCrM=;
 b=mIGm3BnVPsOIzQ2Ua4aNCh98218WNCwdEbd2CdiBAgdVCP9aWoEzpJ8Fd3/gvkk4d3fHdz
 usK1OBK6lSftFiWGR6JNnOfkYkEfH5iYqJXwu8E7QWWC/EPdk32iN6KUGpFiDu+ygm2x7J
 56UHBM5y0eXGKTREBHYmmZWXHs7X+zUdsdIT46XYkqA2GD5jbMzdYNL6vw7vdveTTs0jXt
 TL9P4f7SUQhPE0N6rnBNAaaWdrQUmqIQqZMupsGMDhMl925Nr4kO7eSmCrL42oN0mo8huH
 fsZTrMKO2zenwBngQV0xYyNQBbeFWPHxfqm+zY/cx3AjzrMwR+dTp6qjZ2V9eQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mIGm3BnV
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-inputstream-adaptive: bump
 version to 20.3.15-Nexus
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

On Sun, 24 Dec 2023 10:45:15 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .../kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash    | 2 +-
>  package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk  | 2 +-
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
