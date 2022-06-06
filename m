Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FE4C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 18:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC38160DCB;
	Mon,  6 Jun 2022 18:47:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gx2a0L9_VHFq; Mon,  6 Jun 2022 18:47:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF1F360B0B;
	Mon,  6 Jun 2022 18:47:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AC14E1BF2E3
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 18:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5C4A409DB
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 18:47:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=pm.me
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SVpbXfn2dN6L for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 18:47:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DAD53405A0
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 18:47:12 +0000 (UTC)
Date: Mon, 06 Jun 2022 18:47:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
 s=protonmail3; t=1654541230; x=1654800430;
 bh=M90Vr/G8PqW1r0IfN+O6WpVPbIaV3dyawnRQWLtPwRI=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=IymrA0YpJIow67Cy+Hqw04lNxeBMv8hFDMyY4R8Rjfpp1JriQl2aXy3w9qBcRwcIQ
 t+T03T+PL3SDlmavQAzHDntJ+o5ffFRsgdnCy0FyubomYo/6yDqHt3QHtfpfP1RW6d
 tfV872H5y19B9yJHbCmJmZUDH9AfKFHqJ28eqVECDF/sHFKeVY5RCPcEYbYZ+p7Rqa
 1o8XQ/EhKQcOP/ks1gloROiU+RY4rNHaVvNrcspWf3gIofnIBMc6ZbPtsFMpVtvG5d
 aLmiDxmiuNnP/A0xqPxm+mAMEnUaYqrjvOo6/ALiUBXUd+/hHvs7Ndle0PJFFOSLgg
 quu1q2+sFmycA==
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <0dbp6yslTCRBatfrn6k1UP2LWacgM9lvSYHrTi3-pBGx4125WQ4ci6pq2PFfipv-H-SNeLnNLKvDflPOdYXteUZpqdA5S3JwCXP52OpvX6s=@pm.me>
In-Reply-To: <7d99a90c-2560-7aec-c28a-8e2616108332@mind.be>
References: <20220604124523.22056-1-rknecht@pm.me>
 <92da4b94-b41c-c9c0-1ad1-394417374f3a@mind.be>
 <7d99a90c-2560-7aec-c28a-8e2616108332@mind.be>
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

On Monday, June 6th, 2022 at 20:01, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 06/06/2022 14:50, Arnout Vandecappelle wrote:
>
> > Hi Roger,
> >
> > On 04/06/2022 14:45, Roger Knecht via buildroot wrote:
> >
> > > Buildroot is not only great to build embedded systems but also to
> > > create minimal docker images. Adding a default configuration for
> > > docker images makes it easier to use.
> >
> > Thank you for your contribution. However, I feel it adds little to no value.
> > The docker configurations are absolutely trivial, and they also don't add any
> > testing surface. This compared to other boards, which find a combination of
> > bootloader, kernel and image generation options that actually work, and which
> > actually does add to the testing surface since the build of the kernel or
> > bootloader sometimes breaks with newer toolchains or host OSes.
> >
> > I've discussed with other maintainers, and they share this opinion.
> >
> > Therefore, I marked the patch as Changes Requested in patchwork.
>
>
> Apologies, I meant that I marked it as Rejected.
Yeah, I was a bit confused since it sounded like a rejection in the first place. ;)
I saw this mail too late and I already replied to your first message.
No problem, I drop the patch then.

>
> > > How to build a Docker image with Buildroot:
> > > $ make docker_x86_64_defconfig
> > > $ make
> > >
> > > Create a Docker image from Buildroot rootfs:
> > > $ docker image import output/images/rootfs.tar buildroot-image:latest
> > >
> > > Run Docker container:
> > > $ docker run --rm -it buildroot-image:latest /bin/sh
> >
> > This part should be in a README file (board/docker/readme.txt).
>
>
> I added this comment for advise in case you would submit other contributions
> of defconfigs.
Thanks, will do it for future contributions.

Regards,
Roger
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
