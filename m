Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 919D2C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 16:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 293748479F;
	Tue, 26 Jul 2022 16:46:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 293748479F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h5IeDYe6YgH8; Tue, 26 Jul 2022 16:46:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43F4184789;
	Tue, 26 Jul 2022 16:46:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43F4184789
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D3CC21BF3D9
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 16:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9ECC4411A9
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 16:46:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9ECC4411A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i2lHuRWVCz8X for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 16:46:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93D6041198
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 93D6041198
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 16:46:05 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CA544240006;
 Tue, 26 Jul 2022 16:46:02 +0000 (UTC)
Date: Tue, 26 Jul 2022 18:46:01 +0200
To: Vincent Fazio <vfazio@xes-inc.com>
Message-ID: <20220726184601.09b011ee@windsurf>
In-Reply-To: <20220726151536.2937333-1-vfazio@xes-inc.com>
References: <20220726151536.2937333-1-vfazio@xes-inc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658853963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MwYc/DK87rfEna4qdVDA1hYCL4cEkbbWqS5qKRzcbeg=;
 b=Jf/h3Kfqc9gLr5DZvmJIl+az0Lroh5ASnsYsDTFNFJohwEMU0NUZ5oaaH1t3QHQOhBVfXe
 HLJNcB5UZ9eudxlV6VwRMNaPlzU01yO35OpwdpsLYNE8SWcnnQx8smq9IWYoiyilOWUwPI
 wHUg42bjJut7Rzqxf8wosr04aVH6HCQczHfGtlcoimHMAYtLKIF7P4jEvcJR0hWYjNvlUy
 Dblm9/yF+a4Zf4r3QqGW3CI3dSzX3R4o3Z8kFIg8SohDZAr3uDqFcBL8JhtNLIWu8Qmyfq
 rqZWPQdLjTuYnT2cvtbtRrXSeutTq10UJcnL6P+Sey5f4QG/OCSb7/hLGzcDwQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Jf/h3Kfq
Subject: Re: [Buildroot] [PATCH] package/mesa3d-headers: fix install of
 dri.pc
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, "Yann E
 . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 26 Jul 2022 10:15:36 -0500
Vincent Fazio <vfazio@xes-inc.com> wrote:

> With the version bump to 22.x, the dri.pc file was no longer deployed as
> it was believed to not be provided.
> 
> While it was temporarily missing from upstream as part of deprecating
> the classic driver, it was reintroduced prior to the 22.0 release via:
>   https://gitlab.freedesktop.org/mesa/mesa/-/commit/3ae3569d822c2546c4c748090f8a6c8016f763ea
> 
> This file is still necessary to build Xorg server. See previous commits:
>   9014c21cac
>   7468b60e7c
> 
> Fixes: 6c25d1099 ("package/{mesa3d, mesa3d-headers}: bump version to 22.1.3")
> 
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> ---
>  package/mesa3d-headers/mesa3d-headers.mk | 10 ++++++++++
>  1 file changed, 10 insertions(+)

For some reason, the lines you re-added had bogus indentation (spaces
instead of tabs), which was reported by check-package. I fixed that up
and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
