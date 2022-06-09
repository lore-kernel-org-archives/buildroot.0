Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C4BC43334
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 20:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21326826E7;
	Thu,  9 Jun 2022 20:33:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z9gvT5oTS3Ur; Thu,  9 Jun 2022 20:33:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4804F826C8;
	Thu,  9 Jun 2022 20:33:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 10A071BF35E
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C930826C8
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:33:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7IyciuKnd_PQ for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 20:33:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 16FE08266D
 for <buildroot@busybox.net>; Thu,  9 Jun 2022 20:33:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D56CFE000A;
 Thu,  9 Jun 2022 20:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654806818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TZ2KORbjD9ZfEmGJ4PvjevdM138dmv/1z0+PW+9+EmE=;
 b=e7zSYDhO1dg7QI20xG0R7pZ4rKxByOx+GRFrGEHwB1EujjCD+WoOZpeCREwEQ1ejV5sH5+
 Yy7L7Vzhh1apVbNbhe/KK8+TOsIcsX1u+5GPJ0Vhh3muFuDj3JPb7DBckqyzr3/fJXLJMN
 jRhx8+svSF6YxZJwaXx3IJ1r8py8DArJHTfotCF+rDTlp9DY7Pmjq/5pUZB5rlaQwH5Obg
 +KJ3tZdmAHU/w5+Pi4Kx6PYB5hHGrFqpT2aHDZyT67LkbuJJAeU/k6pgBOKflkGryIBhwz
 1YsOy/m82/2K7s8Pk+G0J6BsciReqcPCCOLVa0TXGPfbuCrRKTs0myPe0ATKcA==
Date: Thu, 9 Jun 2022 22:33:36 +0200
To: Baruch Siach via buildroot <buildroot@buildroot.org>
Message-ID: <20220609223336.4eebcd04@windsurf>
In-Reply-To: <7ae79f05b1e4275dc7f27bc67344ed5c23229116.1654784099.git.baruch@tkos.co.il>
References: <7ae79f05b1e4275dc7f27bc67344ed5c23229116.1654784099.git.baruch@tkos.co.il>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/rustc: add support for ARMv8 with
 32-bit software
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
Cc: buildroot@busybox.net, James Hilliard <james.hilliard1@gmail.com>,
 Oscar Gomez Fuente <oscargomezf@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  9 Jun 2022 17:14:59 +0300
Baruch Siach via buildroot <buildroot@buildroot.org> wrote:

> BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS is not enabled when ARMv8
> target hardware is combined with 32-bit software. That is because ARMv7
> (32-bit) toolchain is only enabled for BR2_ARM_CPU_ARMV7A which is
> mutually exclusive with BR2_ARM_CPU_ARMV8A.
> 
> Use ARMv7 toolchain for 32-bit software.
> 
> Cc: James Hilliard <james.hilliard1@gmail.com>
> Reported-by: Oscar Gomez Fuente <oscargomezf@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/rustc/Config.in.host | 7 +++++++
>  1 file changed, 7 insertions(+)

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
