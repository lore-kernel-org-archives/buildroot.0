Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 817D3C432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 20:47:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D78FA60E90
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 20:47:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D78FA60E90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=grenoble.cnrs.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9491940025;
	Sat, 28 Aug 2021 20:47:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZCxbPKxbbHSb; Sat, 28 Aug 2021 20:47:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F03DA400EB;
	Sat, 28 Aug 2021 20:47:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E91371BF3E5
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 20:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9C3082BF5
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 20:47:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=grenoble.cnrs.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HqjSwnTF7bua for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 20:47:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E70F082BE7
 for <buildroot@busybox.net>; Sat, 28 Aug 2021 20:47:31 +0000 (UTC)
Received: from [IPv6:2a01:e0a:947:6e20:5479:30c4:413d:7107] (unknown
 [IPv6:2a01:e0a:947:6e20:5479:30c4:413d:7107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id BED08BFD72
 for <buildroot@busybox.net>; Sat, 28 Aug 2021 22:47:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grenoble.cnrs.fr;
 s=202106-grenoble.cnrs.fr; t=1630183648;
 bh=62nVkYyGBc5rJeWQrIif21DUx5kGp6O8aynZOlNXsxA=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=kThXT0BFA8RuASXv0/pfvb1gID8f5tgpY1UrFAP85zxaez8LCUx18M5Hp6R5DTdq9
 YT09GR/99l1dL9cM8ZZ+lFOu17F3i5dKEq7SCPWwHzZ6qu3RKJaFJXdKmF0qqk/1AL
 93wizR2bhmvdHTZF+nBNbT5xGAu5qU4htGnGWw7aJUS01dU1CE+t+O82vMnrhF79+u
 c76YlTTT6bfA3TVe/R2BOtfjiBEtyEr1f90QcrB3mwFtk92XCvWOOEFV30ksqGbSrJ
 d2D6Gx2WNLzPHbeu8FyLBE7Dp1oLu/BRL5fWMXerM9YLGfDgoOZK06w79FqYXWOZkQ
 SHWpz+b21OJHw==
To: buildroot@busybox.net
References: <20210828070547.B424F615B6@smtp3.osuosl.org>
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
Message-ID: <2fbac2fa-041c-8c84-6c05-96a670cc8a8a@grenoble.cnrs.fr>
Date: Sat, 28 Aug 2021 22:47:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210828070547.B424F615B6@smtp3.osuosl.org>
Content-Language: en-US
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2021-08-27
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello!

This morning, the autobuilder wrote:
> Detail of defconfig failures for master [...]

I took a look at these failures: some of them are known issues.

>    acmesystems_aria_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1536008767
>    acmesystems_aria_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1536008768
> acmesystems_arietta_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1536008770
> acmesystems_arietta_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1536008771

These have been fixed yesterday in commit
eaece8645b6fb6cbaef6ae8ac6aeacaaa7ced20c, but the tests above ran before
the fix was committed.

>     microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1536008997
> microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1536008999

This is a bug in AT91Bootstrap[1] that was fixed, for the defconfigs
using AT91Bootstrap 3, by upgrading to v3.10.3. C.f. commits
0744eef34d836bc8ef086ed657377bc15ed753a9,
0614f435a09e99c33f418a646eaa7647944c2f4c and
8ac2e5e46fd38b2da8cc292587e91d7b3d4710bf.

The two defconfigs above use AT91Bootstrap v4.0.0-rc2, which has the
same bug (in the 4.x branch, it was fixed between v4.0.0-rc3 and
v4.0.0-rc4). These failures can be fixed by upgrading to the final
release of AT91Bootstrap, namely v4.0.0.

>   microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1536008989

This fails with the message:

    mkfs.ext4: Could not allocate block in ext2 filesystem while
    populating file system
    Maybe you need to increase the filesystem size
    (BR2_TARGET_ROOTFS_EXT2_SIZE)

And indeed, adding

    BR2_TARGET_ROOTFS_EXT2_SIZE="100M"

fixes the failure.

I could submit patches, but I cannot test the generated images.

Regards,

Edgar Bonet.

[1] https://github.com/linux4sam/at91bootstrap/issues/127
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
