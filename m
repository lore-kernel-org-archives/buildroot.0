Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC27C00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 08:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE9B660DF9;
	Mon,  8 Aug 2022 08:41:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE9B660DF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I3hIHhkjMjCb; Mon,  8 Aug 2022 08:41:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB08C60C1D;
	Mon,  8 Aug 2022 08:41:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB08C60C1D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3C1701BF591
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 08:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1669781D7C
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 08:41:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1669781D7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kxb7aGNuA0W0 for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 08:41:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC65681D70
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC65681D70
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 08:41:38 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3726E240007;
 Mon,  8 Aug 2022 08:41:35 +0000 (UTC)
Date: Mon, 8 Aug 2022 10:41:33 +0200
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20220808104133.6479c0a5@windsurf>
In-Reply-To: <20220807210317.9415-1-heiko.thiery@gmail.com>
References: <20220807210317.9415-1-heiko.thiery@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659948096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w0GOm0IWS2hva5IDzleg8+/9OfVhyCLMFsC7tmmWoRI=;
 b=cK34oPZFKoiAvevh2w6SGUzGqKIbMI0ewQq+rW/JBPlzUC1rmDFwIP99FB+Lz/1QymFUJi
 DD5tymTrdnwJKhfiLOzBs9Y7th6wj2NY5Jh0Zarfyb7OBYk/FTRyAaGHhUIvL6YvZcxOhb
 Y9OIjoIJHP7if5NCDbODaC03imDNaK09lmCG25UrBC2dpbCaU4DodovabzZty8/W53iozp
 JIKr77jc9X3VZ3OfCP9T5H9ecus3HlapewGra9NjqOBglgfbK+s+Aj+0/91v+GsJOKNmyp
 AfsISNxZ1PnVJfcjJm64QreVKVbrcG9ncVQrJuHXWuIZih2JtWiKxdIH97W9Cw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cK34oPZF
Subject: Re: [Buildroot] [PATCH] configs/kontron_bl_imx8mm_defconfig: fix
 build failure with u-boot 2022.04
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

Hello Heiko,

Thanks for the patch!

On Sun,  7 Aug 2022 23:03:18 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> +-HOSTLDLIBS_mkeficapsule += -lgnutls -luuid
> ++HOSTLDLIBS_mkeficapsule += \
> ++	$(shell pkg-config --libs gnutls uuid 2> /dev/null || echo "-lgnutls -luuid")

Do you understand why this is needed?

In the build failure reported by Gitlab CI, it fails to find libgnutls,
even though host-gnutls has been built before. So the -lgnutls that was
in HOSTLDLIBS_mkeficapsule should have been sufficient, provided
$(HOST_LDFLAGS) are properly used.

Of course, I have nothing against using pkg-config, but I was just
wondering if we have an explanation on what was going on. And is
pkg-config fixing it because it's return a full path to the library?

Obviously, one issue with your patch is that it's going to fix the
problem only for the kontron defconfig, which is why I was interested
to see if there wasn't a better solution.

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
