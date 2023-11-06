Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D32A2C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EC44421C8;
	Mon,  6 Nov 2023 22:29:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EC44421C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R29oVEnWU7bv; Mon,  6 Nov 2023 22:29:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15A88410BA;
	Mon,  6 Nov 2023 22:29:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15A88410BA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C17F91BF271
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97D1561286
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:25:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97D1561286
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iNa4vCgTQGcD for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:25:54 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A728A612C6
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:25:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A728A612C6
Received: by mail.gandi.net (Postfix) with ESMTPSA id 04DE760005;
 Mon,  6 Nov 2023 22:25:51 +0000 (UTC)
Date: Mon, 6 Nov 2023 23:23:36 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231106232336.7c7b5798@windsurf>
In-Reply-To: <20231105073544.2883766-1-james.hilliard1@gmail.com>
References: <20231105073544.2883766-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699309552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q1OW3yYlxgmF8qG2z1SOloga0hFWsZl6/oTRlvZmdsI=;
 b=ISiJ3AMVI8zExxrQTPXIO6vWkpex4QOWBZeXRd6ukNF3paRSM00JWxf599JaNDbFznW+qF
 qcD05Vqv7yUlijhC5S8Ex87fpiBv2Y19p3h5QKDcMP0ubcmbBMgNRPcrxhGYBMzXorG/5e
 4Po07/HQcmSvfOAUS1uC2v0v2tRirwP+/sLXgAwfyBYTzkSmBlwGJI1zOeMXOY7KZXb75O
 wKsFh28e0syLYHMOZV25IAIxedc9w0VLOd5InvNeUXi3ZsmTJjI2a5zVPcwZG6O7vmlba6
 sFIt24CcVonL44VlUkd1DJ1GccHH66FNGBaBOO4Y1VcDDi/l/wNfwOD+9hfSwQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ISiJ3AMV
Subject: Re: [Buildroot] [PATCH 1/1] package/python-httplib2: bump to
 version 0.22.0
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

On Sun,  5 Nov 2023 01:35:44 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-httplib2/python-httplib2.hash | 4 ++--
>  package/python-httplib2/python-httplib2.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
