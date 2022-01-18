Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DEDC433EF
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 13:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7C0B60E09;
	Tue, 18 Jan 2022 13:06:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KUX0GJIwFGkp; Tue, 18 Jan 2022 13:06:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B66C60E3D;
	Tue, 18 Jan 2022 13:06:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 853311BF5A8
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 13:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 734EC4092E
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 13:06:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=grenoble.cnrs.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5AeOCqR_tqdl for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 13:06:02 +0000 (UTC)
X-Greylist: delayed 00:07:10 by SQLgrey-1.8.0
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F224E40928
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 13:06:01 +0000 (UTC)
Received: from [147.173.65.159] (pulsar.grenoble.cnrs.fr [147.173.65.159])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 6C0EAC26E1
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 13:58:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grenoble.cnrs.fr;
 s=202106-grenoble.cnrs.fr; t=1642510727;
 bh=eeg03Or9LaqJaNY6K1LjN7Ui+KWcFfulFldPMfqrESg=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=aNJoMKCb+6GF7ITLdOZz5L30D+LLia9RodTsRSKk9gSXwgBfYSnnKcjEPngUcnevf
 3E74VlRY8kteb55J7oywpVoDESSOs4pBG5M5Jr4517NJeT0R3eXNPfny+a3UWhKG5h
 KOVCjSRbT0neSgwJrX+OXbVcWc+wEZnnp4Wg9CRiRW6duIyv295vBeq/u3tnhShons
 bvLPDh5MuZeATTgtwewCymAc+ttcNR4zTfXIvncDYEPi0LlZXqbgXdNN48nT5BId8L
 i9gccFMsQOkxYy4PROy4B0exqJKjk4lR2XnwcNM0dxXFW2QOnQrqiLUnwzSQsRdMov
 6g5USga/9xcWw==
To: buildroot@buildroot.org
References: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
 <20220118104338.2081259-3-giulio.benetti@benettiengineering.com>
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
Message-ID: <a81bcbfc-f5ac-f013-7831-5bc5321e2a43@grenoble.cnrs.fr>
Date: Tue, 18 Jan 2022 13:58:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220118104338.2081259-3-giulio.benetti@benettiengineering.com>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH 02/28]
 configs/acmesystems_acqua_a5_512mb_defconfig: enable NEON/VFPV4 FPU
 strategy
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi!

[Replying to list only, hoping it is the right etiquette.]

Giulio Benetti wrote:
> --- a/configs/acmesystems_acqua_a5_512mb_defconfig
> +++ b/configs/acmesystems_acqua_a5_512mb_defconfig
> @@ -1,6 +1,7 @@
>  BR2_arm=y
>  BR2_cortex_a5=y
>  BR2_ARM_ENABLE_VFP=y
> +BR2_ARM_FPU_NEON_VFPV4=y
>  BR2_ARM_INSTRUCTIONS_THUMB2=y
>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
>  BR2_SYSTEM_DHCP="eth0"

I think this may be missing some dependencies, as this change does not
survive `save defconfig'. I tried the following from a clean tree:

    git pull # from master
    git am ~/tmp/saved-patch.email  # the patch above
    make acmesystems_acqua_a5_512mb_defconfig
    make nconfig
        # no changes to configuration
        <F6> Save
        <F9> Exit
    make savedefconfig
    git diff

And git showed me that the patch had just been reverted on the worktree.
According to arch/Config.in.arm, BR2_ARM_FPU_NEON_VFPV4 depends on
BR2_ARM_CPU_HAS_NEON, which is not mentioned in my .config. It also
appears that BR2_ARM_ENABLE_NEON selects BR2_ARM_CPU_HAS_NEON. Would
BR2_ARM_ENABLE_NEON be the canonical way of making
BR2_ARM_FPU_NEON_VFPV4 acceptable? I am a bit confused by the VFP
selection logic in arch/Config.in.arm, so I am not sure that would be
the right approach.

As a follow up question, if this issue is fixed, what would be the
simplest way of testing the floating point implementation on the board?
I was thinking about adding gnuplot, which doesn't have any
dependencies, and having it do some computations. I do not know,
however, whether this would exercise the NEON SIMD extensions.

Best regards,

Edgar.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
