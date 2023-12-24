Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90118C46CD3
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 18:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 01BC740137;
	Sun, 24 Dec 2023 18:18:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01BC740137
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QNvpH1YFfddd; Sun, 24 Dec 2023 18:18:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8B7B404D8;
	Sun, 24 Dec 2023 18:18:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8B7B404D8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6A0201BF3BB
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 18:18:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 123AE81CE3
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 18:18:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 123AE81CE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yuzLL8PCwEkG for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 18:18:07 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 726FC81BF5
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 18:18:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 726FC81BF5
Received: by mail.gandi.net (Postfix) with ESMTPSA id 77F3EFF805;
 Sun, 24 Dec 2023 18:18:03 +0000 (UTC)
Date: Sun, 24 Dec 2023 19:18:02 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20231224191802.5aea90d4@windsurf>
In-Reply-To: <20231212214610.374636-1-ju.o@free.fr>
References: <20231212214610.374636-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703441883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U6AKCoO5pQe6OjdFA2tatXHVgAQ8A/Y6NvVo2NCVezA=;
 b=M0shD64PrhBcvaDg8OW1CVqrXadPgbMgMrbQRoVaWiuElVxfCWOjJWr1wcLSGfTvdnjbBZ
 wUw8Nra16DQVUCEhFFGiGGV0wa7ytgwKjM4okIMfL4jrnxrbCpDEDRKDUHLfTGNZGI8A6+
 sbtD6Kpq4LC1YXossG9GW0JNG0gJ4lO9C4AdoeA0iyzK0kVGWmufxJVzLMdCAO2nWxw7Ic
 FUid9pytMrLhVwjSzCNyb3k3+WBmYFjqIv60DkRMewqGcQTQ/HWEqdE1HatFHO6WExhfDB
 n8ANJJgwpFd9AqIdDtY07AFSbljsUKOnbkeZVDuyKkXpoRkzmVwa7KBS6XD9dA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=M0shD64P
Subject: Re: [Buildroot] [PATCH 1/1] package/octave: add libreadline search
 prefix
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

Hello Julien,

On Tue, 12 Dec 2023 22:46:10 +0100
Julien Olivain <ju.o@free.fr> wrote:

> Since commit b36e4b10f3 "package/octave: bump to version 8.1.0",
> Octave fails to find readline automatically if octave and readline
> packages are both enabled in Buildroot the configuration.
> 
> The readline search prefix need to be explicitly passed during octave
> configuration. This commit adds this search prefix to fix this build
> issue.
> 
> Fixes:
> 
>     checking for readline... (cached) no
>     checking for readline/readline.h... (cached) yes
>     checking for readline/history.h... (cached) yes
>     configure: WARNING: I need GNU Readline 4.2 or later
>     configure: error: this is fatal unless you specify --disable-readline
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

This looked good and relevant, but I'm unable to reproduce the issue,
which probably means there is something more to this.

Build:

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_OCTAVE=y
BR2_PACKAGE_READLINE=y
# BR2_TARGET_ROOTFS_TAR is not set

with:

./utils/docker-run make octave

and it builds just fine, readline is properly detected as it should be.

For the sake of completeness, I also re-did this build on commit
b36e4b10f3, which is when Octave was bumped to 8.1.0, which you said
was the commit that introduced the issue. But it also builds fine.

Could you double check what was your failing configuration, maybe
investigate what is different to understand the root cause?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
