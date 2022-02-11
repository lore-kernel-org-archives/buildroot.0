Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 419E1C433F5
	for <buildroot@archiver.kernel.org>; Fri, 11 Feb 2022 05:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA4E7812F4;
	Fri, 11 Feb 2022 05:08:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id We6DVxtmpWRi; Fri, 11 Feb 2022 05:08:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5043812A4;
	Fri, 11 Feb 2022 05:08:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A92E61BF8A8
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 05:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C40440448
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 05:08:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s99wB_rEJvlJ for <buildroot@lists.busybox.net>;
 Fri, 11 Feb 2022 05:08:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd02102.aruba.it (smtpcmd02102.aruba.it [62.149.158.102])
 by smtp4.osuosl.org (Postfix) with ESMTP id D583240356
 for <buildroot@buildroot.org>; Fri, 11 Feb 2022 05:08:49 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id IOApnpEP9BBmwIOApnBOKC; Fri, 11 Feb 2022 06:08:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644556127; bh=l6cghepXy7jE26AteD6BeiXkPo8DBrtnj/8s1DQSeo0=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=h2bXsuwdY1aYNF2OzO/1uTSFA09+VAUmai5Jha5IoNlj5xuZYvusmFFvKTXi09X5c
 iiG2wsRdfMiRvd7cRfXjzq6qQAaT2lks6rjnJ14B789iKvcPENslLlx2Exis5Z/gs3
 rtu4IUYor7Uu2gS1I7ROgPhf4LjMcqebYGTQO08xUy0/pz0B+adF2q0s25z1KFmVd8
 a8kpNtq4r0FDBg/upOc2ZlCmLpatwPw9kxXHxMYvhB1VVU88v4hZxfhjReJ7EB2RiU
 1nDCroWq/uAKt7KHFN+7zhfmn9odm3DrV79yLqhgtUeI8rc71xK4nwuqmgIh49Rk3L
 9hGlV64bELOaw==
Message-ID: <b27cfde0-356c-c6cb-95e1-c4fa219b222f@benettiengineering.com>
Date: Fri, 11 Feb 2022 06:08:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Peter Korsgaard <peter@korsgaard.com>, Neal Frager <neal.frager@xilinx.com>
References: <20220210081932.3114763-1-neal.frager@xilinx.com>
 <874k56wgqs.fsf@dell.be.48ers.dk>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <874k56wgqs.fsf@dell.be.48ers.dk>
X-CMAE-Envelope: MS4wfBMHXXU43ad/0N4hgnY0/W0wOJ+ga8mv+TOd8Tf4xHwKTO677Mgc94KGqZTVPCkVKIFiw32CYfGbT9dx+HiYQvvljG3N4xUrWj3wV+YPRDZ3AVDabbVK
 la2ekMPgvJIf6gMrrgxq4GlPmIckSiMz49rfqszEPtzySyTlGkBpBvrVYNeKTbTydHKCFq6ORXKVAcfM6ZwFF6JzqHhE0Gwaa4W8nMAvGsOtAvu6/AThJ5T1
 9cb8yoIzhS5h0bcfdnkye9XHCxraazvX0fXKHTSZN2SIjmi3lEvfiZ07b2E9Z9sal4o70W+Hta2z6k15MvmXFEOumHPTNyLKrrMShAKgAUo=
Subject: Re: [Buildroot] [PATCH v4 1/2] configs/zynqmp_zcu106: bump
 ATF/U-Boot/Linux to Xilinx 2022
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
Cc: luca@lucaceresoli.net, michal.simek@xilinx.com, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi All,

On 10/02/22 22:31, Peter Korsgaard wrote:
>>>>>> "Neal" == Neal Frager <neal.frager@xilinx.com> writes:
> 
>   > This patch:
>   > - bumps ATF to Xilinx v2.6: mainline v2.6 requires patch to build
>   > - bumps U-Boot to Xilinx 2022.01: important drivers not in mainline
>   > - bumps Linux to Xilinx 5.15: important drivers not in mainline
>   > - deletes board/zynqmp/patches directory: patches already in mainline
>   > - modifies board/zynqmp/genimage.cfg: U-Boot 2022.01 uses u-boot.itb format
>   > - adds extlinux.conf to vfat bootfs
>   > - modifies U-Boot to unified xilinx_zynqmp_virt_defconfig (supports all boards)
>   > - adds support for SPL pm_cfg_obj.c loading to PMU firmware
>   > - enables support for host machines without OpenSSL required by U-Boot and Linux
> 
>   > V3-> V4:
>   > * cleaned up commit log messages
>   > * added version history
>   > ---
> 
> [snip]
> 
>   > +++ b/configs/zynqmp_zcu106_defconfig
>   > @@ -1,34 +1,39 @@
>   >  BR2_aarch64=y
>   > -BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches/"
>   > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
>   > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>   > +BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
>   >  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
>   >  BR2_LINUX_KERNEL=y
>   >  BR2_LINUX_KERNEL_CUSTOM_GIT=y
>   >  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/Xilinx/linux-xlnx.git"
>   > -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xilinx-v2017.4"
>   > +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xlnx_rebase_v5.15"
> 
> xlnx_rebase_v5.15 is a branch. A git version should point to a tag og a
> sha1 so the build is reproducible.

Thank you Peter!
I've missed this, and for completeness I point where manual talks about it:
https://buildroot.org/downloads/manual/manual.html#generic-package-reference
```
Note: Using a branch name as FOO_VERSION is not supported, because it 
does not and can not work as people would expect it should:
1. due to local caching, Buildroot will not re-fetch the repository, so 
people who expect to be able to follow the remote repository would be 
quite surprised and disappointed;
2. because two builds can never be perfectly simultaneous, and because 
the remote repository may get new commits on the branch anytime, two 
users, using the same Buildroot tree and building the same 
configuration, may get different source, thus rendering the build non 
reproducible, and people would be quite surprised and disappointed.
```

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

>   > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="xlnx_rebase_v2.6"
> 
> Same for xlnx_rebase_v2.6
> 
>   >  BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
>   >  BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
>   >  BR2_TARGET_UBOOT=y
>   >  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   >  BR2_TARGET_UBOOT_CUSTOM_GIT=y
>   > -BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/xilinx/u-boot-xlnx.git"
>   > -BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="228801a215909365ae1dcdd799034195ad7264f7"
>   > -BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_zcu106_revA"
>   > +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/Xilinx/u-boot-xlnx.git"
>   > +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xlnx_rebase_v2022.01"
> 
> And xlnx_rebase_v2022.01
> 
> I think I earlier asked you not to change the URL when it is not needed,
> please leave the existing /xilinx/ URL.
> 


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
