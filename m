Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0D9C43334
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 21:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54EC7831CA;
	Wed,  1 Jun 2022 21:36:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H86emCjWlf1F; Wed,  1 Jun 2022 21:36:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F19982ED2;
	Wed,  1 Jun 2022 21:36:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B94A41BF36A
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 21:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B5EB060BC6
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 21:36:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zutFFZ0R3WRm for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 21:36:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7B04660B2C
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 21:36:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8420F20004;
 Wed,  1 Jun 2022 21:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654119368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LOw/PIH+lBXOcvwpFjurSyQ3XAsUxuWuO2r/UCuPEWY=;
 b=QkL2bH25DJjbGjTFnvZU++0VCY1dECHnZ6dIjMKeW1OLSvoMvIfSJ0l6TsTQavhEebgXK2
 khGNHlfylxSa7mtmJSR0f+AmKFk4RdNJ1sH9idNYMK3c/xpMO58LZUgb5MiA0iIeAYiroq
 yR5N/ugejH9D6H20FsXBegBvsZKHWVE3Y9qkNVNloSnkDxDhp66R7HykprgBYTdHSliH27
 Q6PnXO1RPp5Rm+JslmE6gSGvLGNN2d/Ng0tdqbyEVx0o9e8ltu7VS9jdd1K4EqXFfOrp6I
 b/h6OFh9ykD6cAm5WAu2bBe9hT6t7hDV0uNTZaK4lkuP70f/2H5EEInPuuJdYw==
Date: Wed, 1 Jun 2022 23:36:07 +0200
To: Dimi Tomov <dimi@tpm.dev>
Message-ID: <20220601233607.336a4072@windsurf>
In-Reply-To: <4499743c804d1a5a091055a8bb58be72@tpm.dev>
References: <20220530203001.574908-1-dimi@tpm.dev>
 <20220601194746.29106-1-dimi@tpm.dev>
 <20220601225031.79aca2b0@windsurf>
 <4499743c804d1a5a091055a8bb58be72@tpm.dev>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/wolftpm: new package
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

Hello,

On Thu, 02 Jun 2022 00:03:39 +0300
Dimi Tomov <dimi@tpm.dev> wrote:

> Hello Thomas,
> 
> I have this working on a STM32MP157F-DK2 board with a ST33 TPM.
> 
> https://gist.github.com/tomoveu/8f0519cb8d75a5374a999f29640cf45c
> 
> Could it be that because I am using $make wolftpm-rebuild is saving me 
> from seeing the same errors?

I am not sure why you don't have the error about wolfssl being
unavailable. It was clearly failing to build here. I would need access
to your complete build log + output/build/wolftpm-<version>/config.log
to be able to (perhaps) say what's going on.

> ps: Do I need to submit v4?

No, I said the patch was applied. It's in our next branch, see:

  https://git.buildroot.org/buildroot/commit/?h=next&id=4bb884a3c61c6b71e33f69453a90eb2a367f64b7

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
