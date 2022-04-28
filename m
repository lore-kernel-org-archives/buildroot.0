Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE52C433F5
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 21:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDF4341BA0;
	Thu, 28 Apr 2022 21:22:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L8IC_Bd6cObL; Thu, 28 Apr 2022 21:22:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE6F241BC3;
	Thu, 28 Apr 2022 21:22:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EC8A91BF2E4
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBA9661172
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:22:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c3LbJHYR4GI0 for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 21:22:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D9A0D607CE
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 21:22:40 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EAFFEE0005;
 Thu, 28 Apr 2022 21:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651180959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mwRt0UZPj7My1jALfawU89sBW5/5ngFQ+b+DBxZ1XiI=;
 b=VMDbyEM0eVpGWWdxrsO+49MoHKc9Yml1aTLimJ3ggQlCgUSW0XfncwBK0FsLSVaYy60iR1
 gpaQ5lOJ/XUyy0umJCPqcrnpoCyQPRcm87c8q8wvBEkHTXtSgozhH7JL8MGs8f9hGcBRpE
 xISnDvWtH94S+wXdVvG2x8D2MEHeM0ibI+325Buhe1ijwwHxjcIOS9voCXNY/3iX/pL3je
 iIrbhYV4wCfMLivGJ0eZs595KHAIs3+ITeTPasNA1k1NGpOxCQAJ8Zwwt3qvAPU9JctAOZ
 z60ukXvRJ3Wk05roMVWwqpqwVgCit3KDsaLr3dLlRQRGCQA+Lqa0SUK/SoNyZA==
Date: Thu, 28 Apr 2022 23:22:37 +0200
To: Kristof Havasi <havasiefr@gmail.com>
Message-ID: <20220428232237.602ccb13@windsurf>
In-Reply-To: <CADBnMvhgaozAgZgy3njckjL1i0U6bZ0fLrq-kdFF-qpGhFWgmw@mail.gmail.com>
References: <CADBnMvhgaozAgZgy3njckjL1i0U6bZ0fLrq-kdFF-qpGhFWgmw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] Build regression after 2022.02.01
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

Hello Kristof,

On Thu, 28 Apr 2022 19:39:11 +0200
Kristof Havasi <havasiefr@gmail.com> wrote:

> I just updated from 2022.02 to 2022.02.01.
> 
> My build broke due to 8945ba49480a7885d10444
> "toolchain/toolchain-external: error if BR2_TOOLCHAIN_EXTERNAL_PATH is not set"
> 
> I selected a bootlin toolchain for armv7, which is installed on the
> build system and is available
> via PATH. As the help string of BR2_TOOLCHAIN_EXTERNAL_PATH describes, if it is
> empty, then PATH will be searched.
> 
> If I revert the above commit the build succeeds like before.
> 
> I could see the reason behind the check in the commit for the case,
> where the toolchain is yet to be downloaded, but then the lines ended
> up in the wrong
> branch of the if/else statement.
> 
> In case the toolchain is already available via PATH, I suggest to
> follow the previous logic
> and description in the help text:
>      "If empty, the compiler will be searched in $PATH."

Thanks for your report. I believe that commit 8945ba49480a7885d10444 is
incorrect, so I sent a patch to propose to revert it:

  https://patchwork.ozlabs.org/project/buildroot/patch/20220428212011.534725-1-thomas.petazzoni@bootlin.com/

Let's see the feedback from the original author and the other Buildroot
maintainers who applied. Maybe I missed something, but my belief is
that the patch is incorrect.

Again, thanks for your report, much appreciated!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
