Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED66C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 22:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B68282F80;
	Thu, 10 Feb 2022 22:18:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WHLq3E197fTY; Thu, 10 Feb 2022 22:18:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7BC682CE4;
	Thu, 10 Feb 2022 22:18:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C3B3F1BF2CA
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 22:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABB6E60761
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 22:18:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bwJmEK1ppwXt for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 22:18:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 813F760750
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 22:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644531494;
 bh=ACYAJnSUPRleX+UUxQFWVpjhtl2zGe3Rz03t7KorFig=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=FU3ke1ZHqIp4pRU9D9p8rv34VdhRfgaH+TlvU7L6DZATxgYpuRGYyvgpEnpYDbtAu
 UZoqXooyp6FsPdj+Ku10nYk3ZEGnCNlJd/CR+MYnDq/IJKOVlWBM2eyqUvhn8AauXW
 JiR7yKlaQQM9FPvR/fjLJiZfJHd8aotv8E4OIxlc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.34]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MuDc7-1o9pE31Ilh-00uWne; Thu, 10
 Feb 2022 23:18:14 +0100
Date: Thu, 10 Feb 2022 23:18:13 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20220210231813.236e2aae@gmx.net>
In-Reply-To: <874k56tmqu.fsf@dell.be.48ers.dk>
References: <20220210192905.4500-1-ps.report@gmx.net>
 <20220210192905.4500-14-ps.report@gmx.net>
 <874k56tmqu.fsf@dell.be.48ers.dk>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:uvrqZ4rNl2rYyORx5eqHdOp2XV11qilRz3Ll7e5B603FXBH02Y5
 e79HBps4OPatKKIxON7Nkkk03tWCSjnygfD8M/wHylpAlHRcU7fuHRxO94Swk1o4oz4TmCK
 Y4GVkIeUBoZo5doNnidJEdelgoO3ZSyY9avh17+xAlwmGbKPAm6vC34gZed06XXgnR1CwLJ
 2+xL7ys1Xc+Ysb+j1zoOA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Pq0Ub5YIqco=:A+Lgo/sB3Q8/aLZgZ1KeuE
 9aCZxcadTHNGyFMTacDhUo3C6j/z/LQZJPIt4TPpq4JwNI/4r9koEiu/foGcmM3ZZsOoSE5mk
 9i9cFgTGM5y50hNAoUVRH7BXNPbn/gCm2Mm4bds6IKYJVDuMnVJRUPuTn4XIfOUPPDXXVSwtV
 fPrEJHANBwXYYQ3+t6NRhS92190UTyYVWKI59joiGpfMB+FF7REaHzhk9ZYQ5eJGHBv5cgTzH
 6+dOT4rNyGmKqBZWTyy51vYUhRFzo5gVxWr15n8xkV86FibxGtNPdx6szR+WcdCUSlYcoFbx5
 iTG+54iAlZJP715Sve7F1M4IvckkPv4+dUxAaoP2Afsmcv0bgeydkWu7iuDOHynByd9Ma94WW
 /ZSHNdY1yU85LUfl9dGohpdzhbT02VcyqM/V/9CjV0x950xvnSmgm3s58WC+t4KzVyoNMi8F/
 shaARJ3U/HRabqiflw4B1C4uiZr2LmDra0EbHonIRUCz7AdTQ2sCzjPlW72QhrKGIO1NM7Z+t
 QgJXz1Y20rD58HlSwCJvxInw7TBRWkpkOO3q59osGRhuTfTgv+b0O9JzUgpAKc45yPh7Kj9Yj
 1OVgoXBuAQhZ+oivhUswF7Brqxl7oWSCe8pQxzOcLtDPd/8YPIJQqBOQTHRGp33MJ+Cu/f+60
 3ganuMns3uDsXkqacBCg3NJpIGgPfS1IELVJD+fBqE9tx9cGDSWThIK5+L7I+Ac7VSwezF4XF
 PrpO7YmRq8bi80pMTx3FDmETCwxXyCt03LGvuZ1j/Y1tR8b8mTxwoZCiHnapvbWWsCsXnc/lH
 U22wUdB3mc5l39hQb7a5IwTPtn8OETiKTNbDi/VmTQPcVHD/Qwk2RseEq6z6rIdLksalWRTmP
 TjYpVBVxTMEpwfmiuGHabvfRHqbaEhi3ZExQETMpP8ayBM8PULw21Y+bsFzcjT7W90aJyrfrS
 JeCsSn7Idvhb645AE6V8RqkIIFYeJJ5ffkyT+b9zD9P3NNh55KSbzwep0GvI2/uUzp2lK7nNp
 64to7S3A/mltXM/9qsw6Fzf8DGMlpSS0NVrsGQgrywNY4J5n8GTwg+zLmswNQuuxIZC73GtyR
 R5+SZOsjLJkSH8=
Subject: Re: [Buildroot] [PATCH v2 13/13]
 package/gst1-plugins-bayer2rgb-neon: fix plugin install
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
Cc: Eloi Bail <eloi.bail@savoirfairelinux.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Peter,

On Thu, 10 Feb 2022 22:50:17 +0100, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:
>
>  > - fix plugin install path, add '-with-plugindir=/usr/lib/gstreamer-1.0',
>  >   otherwise the plugins are installed with duplicated build path
>  >   (as detected by step_check_build_dir)
>
>  > - remove GST1_PLUGINS_BAYER2RGB_NEON_INSTALL_STAGING (no need to install
>  >   the plugin to staging)
>
>  > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>
> Committed, thanks.
>
> You have this as the last patch of the series, but is it related to the
> 1.20 bump or is this a fix that should also be backported to the LTS
> branch?
>

Observed the failure only after the 1.20.0 version bump..., but did not find
any explanation why the failure should depend (or not depend) on the version
bump...., but I think the patch should do no harm for the 1.18.x version...,
so should be save for the LTS branch (specially the drop of install staging)...

Regards,
Peter
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
