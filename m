Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA29EB64DA
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 19:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4369741F14;
	Wed, 12 Jul 2023 19:50:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4369741F14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ci6bQPTS52Tm; Wed, 12 Jul 2023 19:50:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3190C41F1C;
	Wed, 12 Jul 2023 19:50:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3190C41F1C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3526E1BF3BD
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 19:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D690A40347
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 19:49:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D690A40347
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7DP-1HXfXMZa for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 19:49:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1BDC4015A
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E1BDC4015A
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 19:49:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A8F7AFF802;
 Wed, 12 Jul 2023 19:49:46 +0000 (UTC)
Date: Wed, 12 Jul 2023 21:49:45 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230712214945.727d7b41@windsurf>
In-Reply-To: <20230712070335.1648184-1-james.hilliard1@gmail.com>
References: <20230712070335.1648184-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689191387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sguImbY/Dgi2SB5VPC4b0nFUvoga9HV9+uhmwSKC/vY=;
 b=m+t/l8xGcPRh2uap8XEYi17coF5E3Nm3349DaXWu/bx7CDNJzkmofZdQH/xNW7iPxgfQeH
 DHu88aqBR5IfJ605QOblE0X6xwGNxXvNKKiJ50p0/w46Z0psf4JYvxYa6X2MpjLSfTYmDe
 1WmTvpaQJQ9icLdNgeVr0B1sZH1kKvBQylRljC5gD+EtDEi50C+HD4JJpwaF5bQvubp5VT
 AAlOdWJC9+6Q+ysGCem4JfwaNP0Qp1/BMDahe3fO3dMXt86BfsBRMKBfqSpqaKpIZRtwUY
 zWB7UIaqjVYJXIpXZ4zGMooYGCFwSwSnOW2WpZsNFS5kDz3OK4M3acs6VW1KPQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=m+t/l8xG
Subject: Re: [Buildroot] [PATCH 1/1] package/icu: bump to version 73-2
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

On Wed, 12 Jul 2023 01:03:35 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/icu/icu.hash | 2 +-
>  package/icu/icu.mk   | 2 +-
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
