Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0261C433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 16:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48CD34179E;
	Thu, 21 Apr 2022 16:30:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4oLLJ-j6ePVn; Thu, 21 Apr 2022 16:30:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB10E41606;
	Thu, 21 Apr 2022 16:30:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 09DCF1BF3D9
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 16:30:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC94384089
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 16:30:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cR87uadO2OFw for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 16:30:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp1.osuosl.org (Postfix) with ESMTP id C469483F95
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 16:30:12 +0000 (UTC)
Received: from pwmachine.localnet (unknown [92.186.13.154])
 by linux.microsoft.com (Postfix) with ESMTPSA id 1845120E57E0;
 Thu, 21 Apr 2022 09:30:08 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1845120E57E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1650558610;
 bh=PKE7fXpsJQOP2nsOnkKVwT0fjW/fsYGurISE7U1bV0w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fI4lzwOE1c5upXUyZZPSY/++bLd71aKhzwQu3zYgRVLnjz34w09m53Agn9dHFILTn
 hUmieAFwlxqisKolVOuyYuoIXVjpVblafunrNz1TkC99BKCqjNjh+HxcJ/WdOVx+u+
 qnAJO9idSmW0rc5pj06x12xa5fdxesd9/9wXeR4I=
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org, Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 21 Apr 2022 17:30:06 +0100
Message-ID: <2626500.mvXUDI8C0e@pwmachine>
Organization: Microsoft
In-Reply-To: <6813316c-23f9-3521-1eca-df43f9205d34@mind.be>
References: <20220414172857.35100-1-flaniel@linux.microsoft.com>
 <6813316c-23f9-3521-1eca-df43f9205d34@mind.be>
MIME-Version: 1.0
Subject: Re: [Buildroot] [RFC PATCH v1 0/1] New "docker" ready qemu config
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
Cc: Gerome Burlats <gerome.burlats@smile.fr>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi.

Le mardi 19 avril 2022, 22:16:43 BST Arnout Vandecappelle a =E9crit :
> On 14/04/2022 19:28, Francis Laniel wrote:
> > Hi.
> > =

> > =

> > First, I hope you are fine and the same for your relatives.
> > =

> > In this contribution, I added a new qemu config for x86_64.
> > This configuration is mainly based on qemu_x86_64_defconfig but it adds
> > kernel CONFIG_ to be able to use docker.
> > It also adds package related to docker like DOCKER_CLI and CONTAINERD.
> =

>   We don't like adding "demo" defconfigs that are basically another
> defconfig with some packages enabled. It's true that there is some value =
to
> knowing which combination of packages can provide a certain super-feature,
> but the problem is that the basic config (in this case, qemu_x86_64) is n=
ot
> going to be useful for most people.
> =

>   In this particular case, there isn't even that much "combination". Just
> docker-engine and docker-cli.
> =

>   The kernel config options do have value, but these should instead be set
> by containerd (or docker-engine, or docker-proxy, as appropriate), using
> CONTAINERD_LINUX_CONFIG_FIXUPS.

Sorry, I did not check docker-engine.mk before writing this contribution.
I was not aware of PACKAGE_NAME_LINUX_CONFIG_FIXUPS and will rework my sysd=
ig =

0.29.1 contribution to make use ot it!

> =

>   Regards,
>   Arnout
> =

> > The CONFIG_ options added were checked with moby check-config script [1=
].
> > =

> > I was able to build and execute the image with start-qemu.sh:
> > Welcome to Buildroot
> > buildroot login: root
> > # docker run --rm hello-world
> > Unable to find image 'hello-world:latest' locally
> > latest: Pulling from library/hello-world
> > 2db29710123e: Pull complete
> > Digest:
> > sha256:10d7d58d5ebd2a652f4d93fdd86da8f265f5318c6a73cc5b6a9798ff6d2b2e67
> > Status: Downloaded newer image for hello-world:latest
> > =

> > Hello from Docker!
> > This message shows that your installation appears to be working correct=
ly.
> > =

> > Sadly, the image has to a bit big (more than 300M) but I think it is fi=
ne
> > since this image will only be used for virtualization.
> > =

> > If you say any way to improve this contribution, feel free to share it!
> > =

> > Francis Laniel (1):
> >    qemu_x86_64_docker: add new qemu defconfig
> >   =

> >   DEVELOPERS                             |   2 +
> >   board/qemu/x86_64_docker/linux.config  | 112 +++++++++++++++++++++++++
> >   board/qemu/x86_64_docker/post-build.sh |  11 +++
> >   board/qemu/x86_64_docker/readme.txt    |   7 ++
> >   configs/qemu_x86_64_docker_defconfig   |  49 +++++++++++
> >   5 files changed, 181 insertions(+)
> >   create mode 100644 board/qemu/x86_64_docker/linux.config
> >   create mode 100755 board/qemu/x86_64_docker/post-build.sh
> >   create mode 100644 board/qemu/x86_64_docker/readme.txt
> >   create mode 100644 configs/qemu_x86_64_docker_defconfig
> > =

> > Best regards and thank you in advance.
> > ---
> > [1] https://github.com/moby/moby/blob/master/contrib/check-config.sh

Best regards.


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
