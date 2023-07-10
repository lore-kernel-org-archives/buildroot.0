Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AFA6EB64D9
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 16:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCF9460FCE;
	Mon, 10 Jul 2023 16:11:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCF9460FCE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zHbrdokeVUjI; Mon, 10 Jul 2023 16:11:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DF8B60FC7;
	Mon, 10 Jul 2023 16:11:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DF8B60FC7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DF4FD1BF414
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 16:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B88E260FC7
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 16:11:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B88E260FC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4N4JAf0C42H7 for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 16:11:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF7B560FC2
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF7B560FC2
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 16:11:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 81E74240008;
 Mon, 10 Jul 2023 16:11:30 +0000 (UTC)
Date: Mon, 10 Jul 2023 18:11:29 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230710181129.00e6f485@windsurf>
In-Reply-To: <20230707151705.276916-1-bernd@kuhls.net>
References: <20230707151705.276916-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689005490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1uvT2DIpat32ZHPV2MZ2Hf/VEHM39daOssHHbzXztAc=;
 b=hQsMfWfX38GBkENYh9SRUNQhBncBqYSWZDp4CKE4E5Mlb+GHE1QbWoI5iobIdRWZMpsTUv
 NzirxOatZYWdVIpe1i1hHFFaPVlt2P/uWdb2+pxxa2o7YNJ62c8KaH3SMTXWQMJzMeoRz3
 dW1eu1TZjKvivO5MybwcYkUE2hkPrHGbByxX2I90uaXmxXt9z3rurRz0laoi6d+djMhyjq
 dug8kaRg7z/ns8gozaCD9aDXNd7lxzsJQE+IDceyEBAKepkTiEF6JHdHV2Ex/AYnpDMKFz
 QPLjOtNgVPB32gzKKhPB/dk3WNWk0veuFbP/f7GFvRTigj7Yol19+eTdI1Tr5A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hQsMfWfX
Subject: Re: [Buildroot] [PATCH 1/1] package/xmrig: bump version to 6.20.0
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

On Fri,  7 Jul 2023 17:17:05 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Changelog: https://github.com/xmrig/xmrig/blob/master/CHANGELOG.md
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/xmrig/xmrig.hash | 2 +-
>  package/xmrig/xmrig.mk   | 2 +-
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
