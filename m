Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF0DC43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 18:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A0F741C1C;
	Mon,  6 Jun 2022 18:35:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TVf6Aqu9SM0V; Mon,  6 Jun 2022 18:35:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81BB3414E6;
	Mon,  6 Jun 2022 18:35:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7CC501BF2E3
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 18:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68CFB414E6
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 18:35:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EQCP_jstoA-d for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 18:35:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4FA6A41496
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 18:35:00 +0000 (UTC)
Date: Mon, 06 Jun 2022 18:34:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
 s=protonmail3; t=1654540496; x=1654799696;
 bh=a9LNRmW3vcw12UTP2R1zeP0QdynHlWBqqPPZOe3mUXA=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=bOj/pDDG9SsZvzhxeVID/4vFFtk8VEPzGwPStlEx/IAwvAb+qsHjLbp+ezLIeGQGQ
 P18e37KVdWjxK5AsvrYteAj4Xm/MS1bdxTOS0ipydFDyQue6ArJ+99IBO5eRRt3El/
 r1PC4YOm7ESnm6uBEVbQ+qzuYAF2kFzjres+azLZUvwZ7Tt6B+GjZlo6bx5aBkj1NO
 RVTF+MK+9evT0mXMzGvvHgv/EHsQZZDEhX698G394HaxxpOAGEGK5sR/s9iTkQwCTG
 wwCGDRfRjA32n5DSeucqiG61PPFH8DEJ/SIJCSR8A+iq+pm+H3Shymble/rQjFCgqS
 upKWHFQOfaGyA==
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <xJc8DYTHFiixYvUB8xYOa6cn8VV-RTKs4uVaJxIC_z4TAgMeqhPtthwQgT5Zz39tM37tlFeeGNYz6lsbX2YW2_ejTQ19aHnQSVRYMBtTpso=@pm.me>
In-Reply-To: <92da4b94-b41c-c9c0-1ad1-394417374f3a@mind.be>
References: <20220604124523.22056-1-rknecht@pm.me>
 <92da4b94-b41c-c9c0-1ad1-394417374f3a@mind.be>
Feedback-ID: 8957232:user:proton
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] configs/docker_*: add build config for
 docker images
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
From: Roger Knecht via buildroot <buildroot@buildroot.org>
Reply-To: rknecht@pm.me
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

On Monday, June 6th, 2022 at 14:50, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> Hi Roger,
>
> On 04/06/2022 14:45, Roger Knecht via buildroot wrote:
>
> > Buildroot is not only great to build embedded systems but also to
> > create minimal docker images. Adding a default configuration for
> > docker images makes it easier to use.
>
>
> Thank you for your contribution. However, I feel it adds little to no value.
> The docker configurations are absolutely trivial, and they also don't add any
> testing surface.
Thank you for reviewing the patch.

> This compared to other boards, which find a combination of
> bootloader, kernel and image generation options that actually work, and which
> actually does add to the testing surface since the build of the kernel or
> bootloader sometimes breaks with newer toolchains or host OSes.
Is it a requirement for defconfigs to add test surface in order to be accepted?

Containers run on the host kernel so this patch cannot add test surface for
bootloader, kernel and image generation options.

I think it is better to compare the Docker defconfigs to QEMU instead of real
boards. If the bootloader, kernel and image generation settings are removed
from the QEMU defconfigs it results in a similar trivial config.

The simplicity of the config also follows the buildroot manual:
  "the configuration should be as minimal as possible, and should only build a
   working basic BusyBox system for the target platform"

>
> I've discussed with other maintainers, and they share this opinion.
>
> Therefore, I marked the patch as Changes Requested in patchwork.
I see the following options to add more value to the patch:

  1. Add a post-image.sh + Kconfig options to set the Docker image name and tags.
     The post-image.sh will then automatically load rootfs.tar as Docker image.
     This avoids running
       `docker image import output/images/rootfs.tar <image name>:<image tag>`
     after every build.

  2. post-image.sh will generate a start-docker.sh (similar to start-qemu.sh)
     which can used to run the Docker container. This avoids calling manually
       `docker run --rm -it <image name>:<image tag> /bin/sh`

Let me know if you have any other suggestions to bring more value to the patch.

Despite the trivial changes it may add the following value:
  - Faster full image builds for development
    Container images do not require building the kernel and bootloader. Therefore a
    full rebuild is faster. This may be useful for quick tests on target package changes.

  - Extend buildroot's user base beyond embedded systems
    If buildroot has an easy way to build container images it may attract more users outside
    the embedded world.

  - The run-time testing framework may run faster in a container than in QEMU (I didn't further
    investigate in that direction)

If this does not add enough value I have no hard feelings to drop the patch.

Thanks,
Roger
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
