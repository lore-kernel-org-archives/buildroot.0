Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 300B6EB64DD
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 20:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB7B861037;
	Tue, 18 Jul 2023 20:58:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB7B861037
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e-0lSydbwjF8; Tue, 18 Jul 2023 20:58:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1782C60B4C;
	Tue, 18 Jul 2023 20:58:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1782C60B4C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1E8001BF350
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 20:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF57E81F75
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 20:58:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF57E81F75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c2I2WhxruyVl for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 20:58:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D835781F74
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D835781F74
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 20:58:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ECBD8FF802;
 Tue, 18 Jul 2023 20:58:03 +0000 (UTC)
Date: Tue, 18 Jul 2023 22:58:02 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230718225802.4368f233@windsurf>
In-Reply-To: <20230716085259.3684479-1-bernd@kuhls.net>
References: <20230716085259.3684479-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689713884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tYyZhhmOHMsHFT4FoHDQOIV3m4+JxBhMERrNkRK58rg=;
 b=mRunQGwCDbv6lTXpISg2mnR+lw/8IirSapTWJqSh66L9kzzbhrk2wGKvU4UPk4gqP+s+Cb
 jc7+U/pQQoxxI6y73CtFx5kPXk0F6pwLWmEjDwWVkU5qpinm7BfyzSlY8N7bOIO6NBv3yM
 R0hBgDmbv0Q01V4tfVXheMY9hbNUoi279Ba1f2Ir3Tfsmsizlu8idj1IrUHXWhFSe5W0zV
 w6ZQkCKg00ifYeVUxqiUrlrEaZrfpsT+mHt95Bf/KBZEWQsF6ostRfEq+aKOJmSbths3M4
 RAfct8WHE/nLDpoH4uu7c+0INVu/XJnv4eHMGJ3OagTDJRvfDsZtX5tH4UiU5Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mRunQGwC
Subject: Re: [Buildroot] [PATCH 1/1] package/pipewire: remove optional
 dependency to vulkan
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 16 Jul 2023 10:52:59 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/8b4/8b4d12de72a1407e74bd9b9b79f4e01ae86510ba/
> 
> vulkan.pc is provided by the package vulkan-loader which is not
> part of buildroot yet.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/pipewire/pipewire.mk | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)

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
