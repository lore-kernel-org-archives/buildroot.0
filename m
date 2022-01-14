Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02497C433F5
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 04:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56E22813D3;
	Fri, 14 Jan 2022 04:51:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FdH6BpAU--t5; Fri, 14 Jan 2022 04:51:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A415B813A9;
	Fri, 14 Jan 2022 04:51:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5B23E1BF2B7
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 04:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 49932813A9
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 04:51:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gfiLMcv5_59J for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 04:51:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 392888139D
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 04:51:38 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id x193so10855106oix.0
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 20:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wkp10go/tNjx4YZa3Shh9MvbI8apT4JY8AcSvzQh6j0=;
 b=ooH3iDhqwK7UYnQQqXo3IjnadBmYy9C3wP+lgi0sb74mjXyRQlKgpcJ5xCycc4oA61
 rEadbDEMch8Hw5Cue3uSOHfWxmuY3CguNl23Wcdzrs6IGQ/jlS/LfVHUnC9GB3ZC2th9
 Cr2RKSN2+B94pViGKo7ktDQCj88EUZHHDXN1Ar3WVmDMUhhP8KNRKXRzgSWZ2zqB/0+E
 lU9rUVF01BNi7znKMWGggJDogPBtO1SzmhtiyQN78vOesJVRlqSwNx02/DwUACN4xdiA
 QJ/qNPqNwPrOzSGtlRP03gCUng27ZCP/234PaqLWN632jNy3iwWeHO4VI6jJ8VcQ8Dx2
 aYrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wkp10go/tNjx4YZa3Shh9MvbI8apT4JY8AcSvzQh6j0=;
 b=cdFXi1QHHcFW1+ya0vwEsH2B+XcfDpyVaPAt0YaTuTXvUnUK8B0avhFWeEVOTE/Sy/
 RCM0fnT5DJXi408qZkbew0i8qeyoAA8a2cRDwxKJ3Xvq8O1c97fSx7L8rUgfsbYtVT/0
 bcqjuuMbkdcSScO/nrnWB3VIxw1BRYmSaIyBC4QC08QOg9PQ2ahkjGNx/RA0bx/47IpH
 Ahwi8dLI3tVf2fkx9JhkilxNWc6VZmD0boxHzRoz3U0n6rCd7CZL8uYPZxulghBL9Lu7
 hN5rl2OAqY6BBOTPeIfEXx87tgP3x+z4718yt18fSSGlB5QhdIGeuC6TIrySosL4fOpR
 7+sA==
X-Gm-Message-State: AOAM531tZvunYNlsEpyBMDLJHhwo4ky2oQq1KOOwmI1Xz/Qrmum3fPzM
 Q4+mpQ7h5TKMjWThTX4OUnLjwMPQ591wyPjmVc8=
X-Google-Smtp-Source: ABdhPJxVgNV4mSzXiC63bQ+OBvt9qasXJbqI+wfGcCE19CpBZ/TOECQvZWr6X1te1Q1p6QUXLIpC6TjlfVxKdXLksbQ=
X-Received: by 2002:a05:6808:118b:: with SMTP id
 j11mr5898195oil.65.1642135897033; 
 Thu, 13 Jan 2022 20:51:37 -0800 (PST)
MIME-Version: 1.0
References: <20220112203939.606775-1-james.hilliard1@gmail.com>
 <20220113204451.23849f67@windsurf>
In-Reply-To: <20220113204451.23849f67@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 13 Jan 2022 21:51:25 -0700
Message-ID: <CADvTj4rvv7EeMHDf-Vn6-1n=GMevGBgeUcTmAm_0fdxDTTnR5w@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5/qt5base: disable broken
 qmake sysrootify
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
Cc: Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Jan 13, 2022 at 12:44 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello James,
>
> On Wed, 12 Jan 2022 13:39:39 -0700
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > Currently the qmake gcc sysrootify path logic causes issues with
> > per-package directories, disable automatic gcc sysroot for qt5base
> > install and override all qt.conf paths manually to point to their
> > correct locations.
> >
> > Redirect HostData to STAGING_DIR as mkspecs need to be available there
> > instead of the HOST_DIR for cross compilation to work.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  package/qt5/qt5base/qt.conf.in | 18 +++++++++++++++---
> >  package/qt5/qt5base/qt5base.mk |  2 ++
> >  2 files changed, 17 insertions(+), 3 deletions(-)
>
> Do you have a bit more details on what this changing, i.e how this is
> making things better?
>
> I have no doubt that it can make things better, but it would be useful
> in the commit log to have extra details on what specific
> details/aspects it is fixing/improving.

Well it seems to prevent invalid paths causing these errors:
/home/buildroot/buildroot/output/per-package/qt5base/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld:
cannot find /lib64/libc.so.6
/home/buildroot/buildroot/output/per-package/qt5base/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld:
cannot find /usr/lib64/libc_nonshared.a
/home/buildroot/buildroot/output/per-package/qt5base/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld:
cannot find /lib/ld-linux-aarch64.so.1
collect2: error: ld returned 1 exit status
make[4]: *** [Makefile:122: ../../lib/libQt5Svg.so.5.15.2] Error 1
make[3]: *** [Makefile:48: sub-svg-make_first-ordered] Error 2
make[2]: *** [Makefile:49: sub-src-make_first] Error 2
make[1]: *** [package/pkg-generic.mk:295:
/home/buildroot/buildroot/output/build/qt5svg-5.15.2/.stamp_built]
Error 2

>
> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
