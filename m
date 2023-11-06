Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77036C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36B334177E;
	Mon,  6 Nov 2023 22:07:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36B334177E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jp7uX1E9dipD; Mon,  6 Nov 2023 22:07:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DDB241C0A;
	Mon,  6 Nov 2023 22:07:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DDB241C0A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 855A41BF271
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5185C82328
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:07:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5185C82328
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NdPp4D_goXq6 for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:07:35 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C17B8228E
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:07:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C17B8228E
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6C66340004;
 Mon,  6 Nov 2023 22:07:33 +0000 (UTC)
Date: Mon, 6 Nov 2023 23:07:32 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231106230732.24a3d18c@windsurf>
In-Reply-To: <20231105030034.2771365-1-james.hilliard1@gmail.com>
References: <20231105030034.2771365-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699308453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RpGzs12kRY4QY02R1D4fVscSuh35vboGdaRlLvsVVGQ=;
 b=WIZvw9xToz7nD5ockM8g8jCSdblFW0Tlg9ZkkhhI1pjKBkZhEuGOgRM48dgfdjJXFJhlNy
 yE+msDXL6t5x6oAgEX2HQfM7Wghfeq+KUedbBnE2NPVDlMr/aQe/7ToG6eMZWO1D9lkaH4
 0fAMap5B2qp8MSBQdNljY6DToJpNARpCD7knsZo+cuGqDRlDz70qa84LQ6qlA1uXjhkHTN
 2Mpkhb6GlH28KKQDLPdRLBpMrbCifvReFO9DW6FhNCFSVrUHcICvsafIjYgUN0nncZtsKn
 Tpz6PrzkW3XZ8s5XuvAbi44Ww7DxX1YlWaMnbQ8iGixQjaeT9gYHu5dKm2mpLA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WIZvw9xT
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cheroot: bump to version
 10.0.0
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

On Sat,  4 Nov 2023 21:00:34 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Drop no longer required python-six runtime dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-cheroot/Config.in           | 1 -
>  package/python-cheroot/python-cheroot.hash | 4 ++--
>  package/python-cheroot/python-cheroot.mk   | 4 ++--
>  3 files changed, 4 insertions(+), 5 deletions(-)

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
