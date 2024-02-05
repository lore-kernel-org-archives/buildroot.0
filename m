Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66985C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 13:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 211E160F3B;
	Mon,  5 Feb 2024 13:32:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 211E160F3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OuHtNPmarvio; Mon,  5 Feb 2024 13:32:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8935D60F0B;
	Mon,  5 Feb 2024 13:32:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8935D60F0B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1768F1BF40D
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E365D60F0B
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:32:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E365D60F0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LjWOnnYWZeBv for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 13:32:30 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 657E160F0A
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 13:32:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 657E160F0A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6BABEC000E;
 Mon,  5 Feb 2024 13:32:27 +0000 (UTC)
Date: Mon, 5 Feb 2024 14:32:26 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240205143226.1aefed76@windsurf>
In-Reply-To: <20240111030022.2676853-1-james.hilliard1@gmail.com>
References: <20240111030022.2676853-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707139947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pW0mREgJkXGRnFCrf/zCIRxk28z8tdy/ekonyP/++ok=;
 b=MSfMIAH2Y57hwJEoU3rDpx4GvJJjmcGSADsXd8gETbn8juWbbDAhbhBVFJo0PO/GewrMiy
 6vrHkufHIAjOdvZjyzZBbOq0ehztLRyFEfPp1atCq0KWgIYrerHrdyfnY4N/7oaQ/pJivG
 cK/ttjRd6pIw5ePxfCAPw7RLTi84uxku6qOo3beCM6Pwz8gW9cgBqfm33SBU1RiXy6Fc9q
 xO2IwViVk40URJme6vDTO2dWnrYJzM9oJr/3h38HiOEMxwbUmcLHTwLWpRwzj3V3pPAAuP
 Ht1ROycJIYFvby12UXJIpz1sxm/nTmRpG28ekgq0g6PRW/830tjVg3rsz/8x2g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MSfMIAH2
Subject: Re: [Buildroot] [PATCH 1/2] package/python-tcolorpy: new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 10 Jan 2024 20:00:21 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/Config.in                            |  1 +
>  package/python-tcolorpy/Config.in            |  7 +++++++
>  package/python-tcolorpy/python-tcolorpy.hash |  5 +++++
>  package/python-tcolorpy/python-tcolorpy.mk   | 14 ++++++++++++++
>  4 files changed, 27 insertions(+)
>  create mode 100644 package/python-tcolorpy/Config.in
>  create mode 100644 package/python-tcolorpy/python-tcolorpy.hash
>  create mode 100644 package/python-tcolorpy/python-tcolorpy.mk

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
