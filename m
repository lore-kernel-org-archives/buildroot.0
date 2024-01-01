Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55306C4706F
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 21:24:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02C384357C;
	Mon,  1 Jan 2024 21:24:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02C384357C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vhXrO4JRlzTB; Mon,  1 Jan 2024 21:24:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2DB14365E;
	Mon,  1 Jan 2024 21:24:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2DB14365E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 950451BF3ED
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 708DB60E3F
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:18:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 708DB60E3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OGJHnV5OWnoo for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 21:18:21 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 745D860A87
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 21:18:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 745D860A87
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8CCC660002;
 Mon,  1 Jan 2024 21:18:18 +0000 (UTC)
Date: Mon, 1 Jan 2024 22:18:17 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240101221817.1bdbf634@windsurf>
In-Reply-To: <20231230220911.1447212-1-fontaine.fabrice@gmail.com>
References: <20231230220911.1447212-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704143898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=netbkzQw701BGWS/pXcYyB1Rnpgm6QLKW00bQVRILZY=;
 b=YiS/rYoI1uIYiRRfi45CssLOPzXVGxUC1seEyeTgqYyIM521SoX3+YPXMzj2xevLokbpv1
 ETp/YhEmzJKEtVqacv3BucLHzBT+ClfdQ3M/8n5xgyVzP4AUuWfSF287MY8MBC7lDYUT/h
 XhwvZkIY1RGo/lqalAEHiO+Y01AiX4W88WzzQG7LJaN3qKWY9BlUH8vNtXJtQs722RlFOD
 faOqlbjQu7sRT4pIk2j4Jo04aH9FSCcMRxm8W9gRvWp4mAfrCldK5F2VQvxOY9BS6KaOoL
 qr31uvtoG/tBLI/LncVnROzWBCvEFao+flyuY5zotP2VtEP36hUlo3Ch9g0KMg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YiS/rYoI
Subject: Re: [Buildroot] [PATCH 1/1] package/rhash: bump to version 1.4.4
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

On Sat, 30 Dec 2023 23:09:11 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> build-shared has been replaced by "build" with
> https://github.com/rhash/RHash/commit/851d459dbf530b7e1f64d4140d3c314ad054c70a
> 
> https://github.com/rhash/RHash/releases/tag/v1.4.4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/rhash/rhash.hash | 6 +++---
>  package/rhash/rhash.mk   | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)

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
