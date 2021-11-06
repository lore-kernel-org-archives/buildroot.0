Return-Path: <SRS0=GWv0=PZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E396BC433F5
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 10:49:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A953D6124D
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 10:49:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A953D6124D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 857116F94F;
	Sat,  6 Nov 2021 10:49:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O5dMDz28oe2v; Sat,  6 Nov 2021 10:49:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E83826F94D;
	Sat,  6 Nov 2021 10:49:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3AC051BF476
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 10:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A28540092
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 10:48:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id np5cAYE-OseH for <buildroot@lists.busybox.net>;
 Sat,  6 Nov 2021 10:48:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 34A3840038
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 10:48:57 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 4C0F66000A;
 Sat,  6 Nov 2021 10:48:55 +0000 (UTC)
Date: Sat, 6 Nov 2021 11:48:55 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Bartosz Bilas <b.bilas@grinn-global.com>
Message-ID: <20211106114855.31d1c486@windsurf>
In-Reply-To: <20211106100244.293028-1-b.bilas@grinn-global.com>
References: <20211106100244.293028-1-b.bilas@grinn-global.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] configs/stm32mp157*: uboot needs openssl
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  6 Nov 2021 11:02:44 +0100
Bartosz Bilas <b.bilas@grinn-global.com> wrote:

> Fixes:
>  https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850755
>  https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850753
>  https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850754
> 
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> ---
>  configs/stm32mp157a_dk1_defconfig     | 1 +
>  configs/stm32mp157c_dk2_defconfig     | 1 +
>  configs/stm32mp157c_odyssey_defconfig | 1 +
>  3 files changed, 3 insertions(+)

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
