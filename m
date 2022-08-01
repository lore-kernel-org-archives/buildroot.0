Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 826F1C00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 16:51:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B5B74056D;
	Mon,  1 Aug 2022 16:51:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B5B74056D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kqqdHaWKo-c3; Mon,  1 Aug 2022 16:51:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 448BE4053C;
	Mon,  1 Aug 2022 16:51:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 448BE4053C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D26EA1BF315
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 16:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA6E881D4D
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 16:51:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA6E881D4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PvqeP9pz9a3E for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 16:51:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 394F981D35
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 394F981D35
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 16:51:43 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E796F20003;
 Mon,  1 Aug 2022 16:51:39 +0000 (UTC)
Date: Mon, 1 Aug 2022 18:51:38 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220801185138.2d468966@windsurf>
In-Reply-To: <20220801150139.14406-1-bernd.kuhls@t-online.de>
References: <20220801150139.14406-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659372700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qrx2qahzCxOWdd8ZUsfgujk5qqf53yjdj3F2TPTzyuA=;
 b=NZj6r0LfiuKhz7UdhJXuhwOQInv4pbgq07MbdnjEauG64PIsyLGtJjmdgzXO/K3KOfsDtK
 lv7c/8Nc0EGcmpTWdA4Cct/ZbqGED56s55wFSJy8ruiS1FGfGRJ0QdYL3opOcWDpN+6gag
 utXvqKfIU50/2bkcpTx1N4yQ1FIUGIVuyNgoH0QS+u2QBQJGPLYC1Wm6zKCRZhZIgeJvh7
 p+FeN5mgTjuU6tbwibiBb8XKZZoC7zAaNj62zy18sTecA7nVZqZZ/OHzgO4+ER3/BTmDyM
 pBVsQQNwN2FyKwDx9880SkkAyAXSmhYHdErFdb0Au4dHxL7M2KnQMmMZmr2Lsg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NZj6r0Lf
Subject: Re: [Buildroot] [PATCH v2 1/1] package/exim: ignore CVE-2020-28017
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  1 Aug 2022 17:01:39 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> +# fixed in version 4.94.2
> +EXIM_IGNORE_CVES += CVE-2020-28017

Could you please submit a bug to the NIST maintainers so that they
adjust their CVE database accordingly? I already reported some bugs,
and provided you give good information about how the CVE has been fixed
(reference to upstream commit, and indication of which release it is
part of), they are responsive and willing to fix the database.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
