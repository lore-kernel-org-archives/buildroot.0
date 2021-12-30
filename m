Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE64C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 16:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64B59828DE;
	Thu, 30 Dec 2021 16:35:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yLF2Bl2-M_7K; Thu, 30 Dec 2021 16:35:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7372828C5;
	Thu, 30 Dec 2021 16:35:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 163181BF3CB
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 16:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA000828C5
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 16:35:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 10VYZQBOsDH7 for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 16:35:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A26C582813
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 16:35:16 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id D6FEE200003;
 Thu, 30 Dec 2021 16:35:14 +0000 (UTC)
Date: Thu, 30 Dec 2021 17:35:13 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Vincent Fazio <vfazio@xes-inc.com>
Message-ID: <20211230173513.21e06b0e@windsurf>
In-Reply-To: <20211104141910.1840914-1-vfazio@xes-inc.com>
References: <20211104141910.1840914-1-vfazio@xes-inc.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/nvidia-driver: bump version to
 390.144
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Vincent,

On Thu,  4 Nov 2021 09:19:10 -0500
Vincent Fazio <vfazio@xes-inc.com> wrote:

> Adds support for Linux kernel 5.11.
> 
> Define IGNORE_CC_MISMATCH for kernel module builds to avoid an issue
> where NVIDIA's `cc_version_check` in kernel/conftest.sh may falsely
> detect a mismatch and fail due to matching on the pkgversion substring
> of the GCC version string in the kernel's include/generated/compile.h.
> 
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> ---
>  package/nvidia-driver/nvidia-driver.hash | 4 ++--
>  package/nvidia-driver/nvidia-driver.mk   | 3 ++-
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/nvidia-driver/nvidia-driver.hash b/package/nvidia-driver/nvidia-driver.hash
> index 7f2248d0f9..9e6deb0061 100644
> --- a/package/nvidia-driver/nvidia-driver.hash
> +++ b/package/nvidia-driver/nvidia-driver.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
> -sha256 51adb28f0ed4548f35a88a93ad6767ebd807fa14f418bf5e51a6d63a3ff7f275  NVIDIA-Linux-x86-390.132.run
> -sha256 b6b4b8af37e78e026c9ebdf4a5c64ea412dfcb710931dd028c22dac228de659d  NVIDIA-Linux-x86_64-390.132-no-compat32.run
> +sha256 8bb6e8de89e8f8325466af29cf0fa235c988d19137f7fe3eb6bfae1d5e305e74  NVIDIA-Linux-x86-390.144.run
> +sha256 d9b36e51253592d7aeecb9758ebccf30348ab364c88f95aa5ba33c767470949c  NVIDIA-Linux-x86_64-390.144-no-compat32.run
>  sha256 bd28b0c5aeeb00eb11d3ec6f6f3449d4b3a40100914258332734a53527997526  LICENSE

Sorry for the slow feedback, but could you check those hashes? Indeed,
I don't get the same here:

ERROR: NVIDIA-Linux-x86-390.144.run has wrong sha256 hash:
ERROR: expected: 8bb6e8de89e8f8325466af29cf0fa235c988d19137f7fe3eb6bfae1d5e305e74
ERROR: got     : fa586d11fcf103f81eda7d859a2a8ccdeb7371f4742fe942cb4a9b0aeb6bbb30
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

However, *before* doing a test, please keep aside your existing
NVIDIA-Linux-x86-390.144.run and
NVIDIA-Linux-x86_64-390.144-no-compat32.run from your download folder,
and verify their hashes. We indeed want to see if you got the hashes
wrong in the .hash file, or if really NVidia changed the files they are
serving.

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
