Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E98CC433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Apr 2022 20:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4FA19402F3;
	Tue,  5 Apr 2022 20:10:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hu0P-FYAMiX8; Tue,  5 Apr 2022 20:10:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 598D5405A8;
	Tue,  5 Apr 2022 20:10:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4DE291BF3A4
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 20:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46E3D60899
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 20:10:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OT6AtvyB3Wb7 for <buildroot@lists.busybox.net>;
 Tue,  5 Apr 2022 20:10:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E58B660803
 for <buildroot@buildroot.org>; Tue,  5 Apr 2022 20:10:08 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id r8so251982oib.5
 for <buildroot@buildroot.org>; Tue, 05 Apr 2022 13:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jgm2IezncjjWqpPpGIzpdNrQcci4UCsj11J2uhWLB+w=;
 b=Oebx1MAfuNFvnEXy6liTFa9kOnK1YsetUsqXf248G8nvw3LtLzakGouYaoRvQxNHdH
 U/+w7Ydlpygd/MQ/evo0rNrI3IR/JpcxnKqL+iCjdw0GJ/iANe83s2xNqyzNEh6o3VFg
 G7Mh9WMhUhuAxs7DRj5Rt1XyIcv3WtYypvPtVungm4iq7dwAsBFSPPDyyR84LVlUqEOZ
 ChH7RAdSRseFv9HXPOaF+V5k6ZROcUC+GwEd02HoYpKNuoLcHfk4aqUS6obgIUMGkG3q
 BQ9k0WNNyOMWFNKX1PzmkUFD7pe3jYi4J7sMTgsH0eMnpcPI85fs1y8RZ0snoiFyZ/0r
 r/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jgm2IezncjjWqpPpGIzpdNrQcci4UCsj11J2uhWLB+w=;
 b=CZgshDTK2XnLBd2yUqatcy/uBsPtDdyf5gXJoDuEfdUWfyz7RySRiVYveMBOeB6Vam
 t2e2JLknV8osOWKMYuOQylmw1qVwl72k564ONTtz6oosPDadQf56zuSB0OX0t6yKUCVx
 2dY1hVmmHgP8ogste1sUgmMXe5x/zymuN1HaF0/8RA7jSJZAMtem8QnvnG50ZpwzbJxe
 aY3ipkv2jIX01+9GfTFYDpsbd92AG0x4cFhXxnxkOnbMEpBD9y2f8ZbRGa6aWtexBXQD
 6/qa2lTchPY9xd+mT3Ybwza0ieAkSmqhiGU8cEPV4jZxcWlRaIoNamCrRWwb2mNCrq+P
 mqrA==
X-Gm-Message-State: AOAM532UJ4Qd4H8+IYSjQSUQnpo1hg2zJoHhJYwMv3KIxGwHaKHW3Jmg
 xh6TlVR8YEs7f+smz0sxnlmR54Dzc2vF97pZmSk=
X-Google-Smtp-Source: ABdhPJydD8Bs7Y4wDprJLPN+QeiZYkfN5I+E6qBAhYiFzj7XppTSFX0yBg1Cp0Qrawrm2BzCRFFz+mQNtRd5F1IsNAU=
X-Received: by 2002:a05:6808:1528:b0:2f9:65fa:b878 with SMTP id
 u40-20020a056808152800b002f965fab878mr2211707oiw.99.1649189407929; Tue, 05
 Apr 2022 13:10:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220405025054.966064-1-james.hilliard1@gmail.com>
 <0a44404b-c3f5-677f-cfbe-09a08f41adad@mind.be>
In-Reply-To: <0a44404b-c3f5-677f-cfbe-09a08f41adad@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 5 Apr 2022 14:09:56 -0600
Message-ID: <CADvTj4pJFiWHQszKZ=ULCtAiS1MbmDS6sdsoV81DTGbn9cBEnQ@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] package/aufs: don't set invalid
 AUFS_SITE if version is unset
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Apr 5, 2022 at 11:19 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 05/04/2022 04:50, James Hilliard wrote:
> > Fixes:
> > package/aufs/aufs.mk:24: *** AUFS_SITE (https://github.com/sfjro/aufs4-standalone/archive/) cannot have a trailing slash.  Stop.
> > make: *** [Makefile:84: _all] Error 2
>
>   How do you get this? I've tried a number of configurations, but I always get
>
> package/aufs/aufs.mk:21: *** No aufs version specified.  Stop.
> make: *** [Makefile:84: _all] Error 2
>
>   I could only reproduce with `make source`, but that's a bit a special case.

Something like this seems to hit it:
BR2_LINUX_KERNEL_EXT_AUFS=y
# BR2_LINUX_KERNEL_EXT_AUFS_SERIES_3 is not set
BR2_LINUX_KERNEL_EXT_AUFS_SERIES_4=y
# BR2_LINUX_KERNEL_EXT_AUFS_SERIES_5 is not set
BR2_LINUX_KERNEL_EXT_AUFS_SERIES=4
BR2_LINUX_KERNEL_EXT_AUFS_VERSION=""
BR2_PACKAGE_AUFS=y
BR2_PACKAGE_AUFS_SERIES=4
BR2_PACKAGE_AUFS_VERSION=""
# BR2_PACKAGE_AUFS_UTIL is not set

>
>   Regards,
>   Arnout
>
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >   package/aufs/aufs.mk | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/package/aufs/aufs.mk b/package/aufs/aufs.mk
> > index 4e95a350a0..b2dda771d9 100644
> > --- a/package/aufs/aufs.mk
> > +++ b/package/aufs/aufs.mk
> > @@ -8,6 +8,7 @@ AUFS_VERSION = $(call qstrip,$(BR2_PACKAGE_AUFS_VERSION))
> >   AUFS_LICENSE = GPL-2.0
> >   AUFS_LICENSE_FILES = COPYING
> >
> > +ifneq ($(AUFS_VERSION),)
> >   ifeq ($(BR2_PACKAGE_AUFS_SERIES),3)
> >   AUFS_SITE = http://git.code.sf.net/p/aufs/aufs3-standalone
> >   AUFS_SITE_METHOD = git
> > @@ -16,6 +17,7 @@ AUFS_SITE = $(call github,sfjro,aufs4-standalone,$(AUFS_VERSION))
> >   else ifeq ($(BR2_PACKAGE_AUFS_SERIES),5)
> >   AUFS_SITE = $(call github,sfjro,aufs5-standalone,$(AUFS_VERSION))
> >   endif
> > +endif
> >
> >   ifeq ($(BR_BUILDING):$(BR2_PACKAGE_AUFS):$(AUFS_VERSION),y:y:)
> >   $(error No aufs version specified)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
