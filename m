Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B34C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 16:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FC40416C2;
	Wed,  1 Nov 2023 16:38:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FC40416C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aqWDzoID-B3H; Wed,  1 Nov 2023 16:37:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BCEAE431B0;
	Wed,  1 Nov 2023 16:37:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCEAE431B0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 317BC1BF841
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 16:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BC084E6A1
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 16:37:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BC084E6A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HuglaCsq1LaL for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 16:37:55 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E7A7B4BA46
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 16:37:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7A7B4BA46
Received: by mail.gandi.net (Postfix) with ESMTPSA id B3038240002;
 Wed,  1 Nov 2023 16:37:52 +0000 (UTC)
Date: Wed, 1 Nov 2023 17:37:51 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231101173751.153f9b41@windsurf>
In-Reply-To: <20231010164554.2954023-1-adam.duskett@amarulasolutions.com>
References: <20231010164554.2954023-1-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698856673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CcSttkzPkW2WTJiiEwGzjzpHp4VDh5U7LsUdiw16k1M=;
 b=RdJl7cwqnEoiB6axp6jifk4Tya4Tc7Kb/Yyw/EDUOdaIOBMuEQpdwxEZPVcJEX+M+nTgjZ
 HCzTg7qUnqC/RdbesEKfYJBa0/2cFiGHsHUVwKwKJ4KIL7JYUetO4V2GZ8sC5qTHewny8G
 0ZCNYF5Ockm04tEpXHxN9K4jXXCm0wvKWcAObeKqoFd/E85MhQYlw14ty47nbjd9bJlZjH
 8Fpc5pFCArUJnXrmoZmVoUWqPxgAYQhRBbw4FB7YcWoiSPY2hprslpUjNVoobWBxddcIp9
 fL876LDFgxsjw2WjKU0LHYbSI9VpYhdPX2mTiGNZPXsnqyU3oJL/wx4A57Aqzg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RdJl7cwq
Subject: Re: [Buildroot] [PATCH 1/2] package/postgresql/postgresql.service:
 set locale for initdb to C
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>, Peter Seiderer <ps.report@gmx.net>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 10 Oct 2023 18:45:53 +0200
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> From: Peter Seiderer <ps.report@gmx.net>
> 
> From this patch from Sept. 20, 2020, postgresql.service is still broken on
> startup:

Which "this patch" ?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
