Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D0C6C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 02:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1679700EE;
	Tue, 21 Feb 2023 02:15:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1679700EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t0_FFWYKvOXe; Tue, 21 Feb 2023 02:15:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2884A701F4;
	Tue, 21 Feb 2023 02:15:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2884A701F4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3BE0E1BF310
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 22:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 163E081BF5
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 22:48:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 163E081BF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IQNOmYThEH-e for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 22:48:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CA1981341
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1CA1981341
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 22:48:30 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9E10BE0002;
 Mon, 20 Feb 2023 22:48:28 +0000 (UTC)
Date: Mon, 20 Feb 2023 23:48:27 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230220234827.28c6b92f@windsurf>
In-Reply-To: <20230215200902.538238-1-giulio.benetti@benettiengineering.com>
References: <20230215200902.538238-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676933309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V5XM7BK0gRnnIEW4yOo4gI8drY6fqb7uLL4/wqSYdOc=;
 b=HbGxg3spkgdghCBqWpYwjmQsCjSacYuhPXTUPOSaNS0nDZsVGOFXHfP2mVCYa53hxyEJvx
 yjfpR0WdSuuvM6ftJ8wdj7F4HuVdMDyLc3/+ynfzhSfwz75UIlk15xod3Zzqj4lCihWlnC
 25lV9AOtC3vXnIJ8RWkHdMQkI3zfoXcI1MN/kDfI3HgyFEBnS+7ERgilr5yJckckgFXAgz
 V39fUeJ9A9VQdLNoEAOmlY8klIKFKF1/XjNEbiJY444txIwy5aZo1n80z6fSJ3/Ae/lOiw
 wYJcKCu/70hJyBx0fWbsScJ8Y/+XimxU+HUjOcMPc5j6XtPIczWP8SROKGXODQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HbGxg3sp
Subject: Re: [Buildroot] [PATCH 1/2] configs/bananapi_m2_ultra_defconfig:
 bump Linux to 6.1 and U-Boot to 2023.01
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
Cc: Lothar Felten <lothar.felten@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 15 Feb 2023 21:09:01 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  configs/bananapi_m2_ultra_defconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Both applied to next, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
