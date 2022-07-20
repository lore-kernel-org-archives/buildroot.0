Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5742C43334
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 11:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8ADB040C21;
	Wed, 20 Jul 2022 11:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8ADB040C21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kQTj6bwLKCho; Wed, 20 Jul 2022 11:44:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9417640C1C;
	Wed, 20 Jul 2022 11:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9417640C1C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9C1981BF2F0
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 11:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B9AE610C8
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 11:44:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B9AE610C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ALmi1a1JpH-C for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 11:44:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E29360BE1
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2E29360BE1
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 11:44:10 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6FEB71C0006;
 Wed, 20 Jul 2022 11:44:07 +0000 (UTC)
Date: Wed, 20 Jul 2022 13:44:06 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220720134406.00dad15e@windsurf>
In-Reply-To: <20220709070708.212797-1-bernd.kuhls@t-online.de>
References: <20220709070708.212797-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658317448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OOq9GioA7mVhKeVqkynDErrSZd6JKswXrp8RI+KlJJg=;
 b=RgAWg73YD6X9rFgr5V426dsrb6wk0Qg8JEmlQxTBk5GFx8VWtDRClXxqnuFkGbTz18gp1/
 4GAhwnZswP2o4wFOEWXJjeisZ/O3gkLBbMkL4i8CyiDBC/SW7XFJnEPPweNd9BSKvOEoul
 Z+2GU3RxnX/jjhVRfVSGA1ymuhy3LrGxC+oGeQgaHlSFy/RBIk6E5hw90wM6990GxtQ2Pz
 QQfb3Aj8x6vT6mERAaAwyP0WTSN88rKWpuHviduU2quT42nTfihJe+hOrg5tQI+DzVL8J8
 jtnpoM6++PFx4KnS4HyDbWLINvaWlTS95neDYYx2DeNazu5VOuHI2LjKh5D0HA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RgAWg73Y
Subject: Re: [Buildroot] [PATCH 1/1] package/libvpx: vp8 encoder needs c++
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
Cc: Spenser Gilliland <spenser@gillilanding.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  9 Jul 2022 09:07:08 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Encoding rate control interface for v8 is implemented in c++:
> https://github.com/webmproject/libvpx/commit/65a1751e5b98bf7f1d21bcbfdef352af34fb205d
> and was added to libvpx in v1.12.0 which was added to buildroot with
> https://git.busybox.net/buildroot/commit/?id=e4ff284ba88ea0cb41c190165cb42a174c5faa23
> 
> Disable vp8 encoding when toolchain lacks c++.
> 
> Fixes:
> http://autobuild.buildroot.net/results/a3524b954e53002973b423ce23b4c43ff5281ab5/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libvpx/libvpx.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

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
