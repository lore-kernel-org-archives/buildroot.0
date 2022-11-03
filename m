Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3913EC4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 22:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C260B40BD4;
	Thu,  3 Nov 2022 22:50:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C260B40BD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tUX_SBg7yKVb; Thu,  3 Nov 2022 22:50:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 993B340BD3;
	Thu,  3 Nov 2022 22:50:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 993B340BD3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7B59B1BF331
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 22:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54E3A409B2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 22:50:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54E3A409B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7MXnBGldImsp for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 22:50:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 069D54098C
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 069D54098C
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 22:50:23 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CFE351C0006;
 Thu,  3 Nov 2022 22:50:21 +0000 (UTC)
Date: Thu, 3 Nov 2022 23:50:20 +0100
To: Woody Douglass <wdouglass@carnegierobotics.com>
Message-ID: <20221103235020.70bb8e8e@windsurf>
In-Reply-To: <70a53e0eb3fdc514641a9cb83dd42aa5bd0f1be6.camel@carnegierobotics.com>
References: <70a53e0eb3fdc514641a9cb83dd42aa5bd0f1be6.camel@carnegierobotics.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667515822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t5YnRhvgugidx8DpPoZrML01hd1lKyemirlDAxC7Fws=;
 b=oPPDgi/a+lC81t/Ma9ebMMDN3LqNAmKvW/Yz32W9Bzx1HQdv5NR8J+ahRmXt9ofnSof+Fi
 cZYrhfvTsYDaY0yeIgExPzJGXuG0or9UXobkXIcw99HIiKzqnLzTiC9pQQiSVDpe89it7c
 Ais0k8ElkOCGzmQVK+vxfgOSTjjFFnh31BlBr2WLqnRfI89gY5FYv7IpJbS5pPumAEGNtU
 6ghPGNcjQ/lZuq62o9sr3bF2kflXcF3I29BlVwyo+d9TrsU2dfDS8rcAx9A1dwdvZxnl6n
 nY6dPJmpPB+6CGQoE5HVsUZBTOoW2RWtT8MZ3hOlFWD6EEIztsigec/INe194w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oPPDgi/a
Subject: Re: [Buildroot] [PATCH 1/1] package/opencv4: add support for
 opencv4_contrib repository for extra modules
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
Cc: "fontaine.fabrice@gmail.com" <fontaine.fabrice@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Woody,

On Thu, 3 Nov 2022 22:30:21 +0000
Woody Douglass <wdouglass@carnegierobotics.com> wrote:

> This adds a separate opencv4_contrib package to manage
> downloading/unpacking that repository. These extra modules
> are useful for a lot of applications, but not necessary
> for minimal installs, so they are all given dedicated Kconfig
> options
> 
> Signed-off-by: Woodrow Douglass <wdouglass@carnegierobotics.com>

Thanks a lot for your patch! One issue is that because you did not send
it with "git send-email", it arrived on the mailing list badly damaged
(line-wrapped)  by your e-mail client.

Also, one thing that really should be explained in the commit log is
that the opencv4-contrib is only useful to download additional source,
but that it actually gets built as part of the opencv4 package itself,
which is why opencv4-contrib is a dependency of opencv4 and not the
other way around.

Even though this is quite unusual, it should be noted that it is not
the first case we have: nginx modules are handled in the same way
(see nginx-upload, nginx-dav-ext, nginx-naxsi, nginx-modsecurity).

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
