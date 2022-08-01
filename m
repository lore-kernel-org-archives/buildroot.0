Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57E3C00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 20:00:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60B43605A2;
	Mon,  1 Aug 2022 20:00:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60B43605A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E9m5f_Aj4Ytz; Mon,  1 Aug 2022 20:00:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E6ED6059F;
	Mon,  1 Aug 2022 20:00:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E6ED6059F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E553D1BF290
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 19:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE76A409DA
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 19:59:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE76A409DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pFGFnSXIAkak for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 19:59:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 454684077D
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 454684077D
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 19:59:52 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4C3C720002;
 Mon,  1 Aug 2022 19:59:49 +0000 (UTC)
Date: Mon, 1 Aug 2022 21:59:48 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20220801215948.1d0d749d@windsurf>
In-Reply-To: <20220726175344.7126-1-ju.o@free.fr>
References: <20220726175344.7126-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659383989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A46N98EDVQCDNjDQU4SNytFgluRbGkKxsDmKbbhYum0=;
 b=TDjuC4s+d8UVZPeIJJqpTT2K2M0o/0o3sLZkc8hU988jBGQdZ4MxDT4yH5EVG3+eIXFsfc
 mYpT6qALcEwvWdLiZYpoTxYQOf+6d3vAxYLxBE+bYcT1/mvVO61Yi9UPM9jW3fmGBoXj9B
 izc3aTlgL0fO3hJ77Zr2nMTVV5yNIt46AAXTjas9loYmwcrs44/1b9zLIxo59hHQlXkzkm
 RStXjfrEnvZD26xpyC8HyMJCSFlIqyVT6thMg5I7H8sBdp8lStCo1bIy4zCNORNL1CCZ9+
 zty0MZttZx+/6cXTsfuKTnnTF6DdD6PjP9M501IX30g9b24caTPlM4j6+ex8Tg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TDjuC4s+
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add test for ola
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

On Tue, 26 Jul 2022 19:53:44 +0200
Julien Olivain <ju.o@free.fr> wrote:

> This test relies on the OLA Dummy plugin presenting a test device
> and port.  It starts the daemon, performs few configuration commands,
> covers the Python bindings and also test the OLA web interface.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> This OLA test was suggested in:
> https://lists.buildroot.org/pipermail/buildroot/2022-July/647089.html

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
