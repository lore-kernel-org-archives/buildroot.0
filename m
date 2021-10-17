Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF7A3C433F5
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 19:50:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31241610A0
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 19:50:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 31241610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDCC460655;
	Sun, 17 Oct 2021 19:50:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xlcR3sz9kpFS; Sun, 17 Oct 2021 19:50:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 414E560684;
	Sun, 17 Oct 2021 19:50:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0228B1BF97A
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 19:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B74328104C
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 19:50:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2ZPTBmLBM7Yq for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 19:50:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA25B8103B
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 19:50:18 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4430:5ced:ec21:1036])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 643F878031A;
 Sun, 17 Oct 2021 21:50:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634500217;
 bh=iRQTKUwna4J3S9D8uGkgYa+RKeSk7/egBUDIqe8cdeU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lNhViRl02hsEnGE0jFwWDqFMjRaFSpZg1ETP0/s+Wv01uT3DjbopMH8Lrgu5lElUS
 HVm7IOKReSsCwIh7BRl1lh3BmKmkq0gqM0vKFzeMKffqjxVPsnE3rHLorg95hPnXUK
 yPGfk6vWL82SjdiSkfkLDWKgSyVnycUh7r94MpuwfWUV15MMVk972qGbmXqZXpAzs8
 IptzMJYakR128czTCTn1VL3VZTAntiIbt0MuGjyZCVGkA5+Cr+8baqArRLLrZPRuvu
 GpPl/xo5g9u0sgdWy1f9UtWAh+xfLNCrXo1PAU3h0vjmnhNHjfvrGapqjOQa5gwVb1
 8kVIK3iPg64cw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Oct 2021 21:50:13 +0200
Date: Sun, 17 Oct 2021 21:50:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20211017195013.GK2400@scaer>
References: <20210912140658.253602-1-romain.naour@gmail.com>
 <20210912141140.253778-12-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210912141140.253778-12-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 14/16] support/testing: test_ubi: add image
 format on the qemu command line
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Romain, All,

On 2021-09-12 16:11 +0200, Romain Naour spake thusly:
> Adding the Image format on the Qemu command line avoid this warning:
> 
> "WARNING: Image format was not specified for 'output/TestUbi/images/rootfs.ubi' and probing guessed raw.
>          Automatically detecting the format is dangerous for raw images, write operations on block 0 will be restricted.
>          Specify the 'raw' format explicitly to remove the restrictions."
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/testing/tests/fs/test_ubi.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/testing/tests/fs/test_ubi.py b/support/testing/tests/fs/test_ubi.py
> index 8148e5f336..eeb55b1d59 100644
> --- a/support/testing/tests/fs/test_ubi.py
> +++ b/support/testing/tests/fs/test_ubi.py
> @@ -32,7 +32,7 @@ class TestUbi(infra.basetest.BRTest):
>                             kernel_cmdline=["root=ubi0:rootfs",
>                                             "ubi.mtd=0",
>                                             "rootfstype=ubifs"],
> -                           options=["-drive", "file={},if=pflash".format(img)])
> +                           options=["-drive", "file={},if=pflash,format=raw".format(img)])
>          self.emulator.login()
>          cmd = "mount | grep 'ubi0:rootfs on / type ubifs'"
>          _, exit_code = self.emulator.run(cmd)
> -- 
> 2.31.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
