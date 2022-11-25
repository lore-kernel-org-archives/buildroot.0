Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF049C4332F
	for <buildroot@archiver.kernel.org>; Fri, 25 Nov 2022 16:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86F75401F1;
	Fri, 25 Nov 2022 16:17:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86F75401F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iGQoTvYeW1pV; Fri, 25 Nov 2022 16:17:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 58F3B40586;
	Fri, 25 Nov 2022 16:17:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58F3B40586
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 622D51BF5DA
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 16:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A737401F1
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 16:17:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A737401F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yn-EgadJlHzO for <buildroot@lists.busybox.net>;
 Fri, 25 Nov 2022 16:17:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1041401E1
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B1041401E1
 for <buildroot@buildroot.org>; Fri, 25 Nov 2022 16:17:02 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id 4so4410597pli.0
 for <buildroot@buildroot.org>; Fri, 25 Nov 2022 08:17:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CQ8L5GOMAVGjngQpvQQ1MaLtsAoLP//bUsowZLsQjzo=;
 b=WG6FBLrWgNr9GU2LPuOYdYo3yMzrWzkAzWYSrHKSpayZPNJPre1c7ADejDiROpZmlo
 lcAgv0OUOCuCJnThE34GS1x0K1FLTTyerrDWO+tCUr28VH2C6LBAEelwx7scwUVOewAw
 G6ABi+bzwDrMI3J/DkA4rj/QckoZ/5Jyq77CXhk/luriZx0Ss/Q6bdsfkcxFxQmrqvdH
 yVMJP/tbaLz0yG3IPbAd8lT2zMUGJ7b163NvZYRnD1FQrwmtEi4PEh8sWS+6ulcyZJQW
 3nePBCUDZEBUioHSUY5CZkDmBeNOiclHz8PMAJQOpZPl8OU7M50DaJfxjt9+Wk5VO87W
 Zy9g==
X-Gm-Message-State: ANoB5pkoni8Bxy01j7qnliyW/eVDS5JUgs3r+e4HNx+AsZZD7/d6v/Pz
 07b1bMz+VvjfuzHr6LPyj8XQyw7y/q+L/tiGsc+Lebz7mVUI6A==
X-Google-Smtp-Source: AA0mqf57XJP786CdXM4n7GdylSp7A8nYRkmdDkLtYw2XFna4m+Nh+SpBOzhc9iBmy6RkxpiS3po+cV93JH6L0Qk3Ykk=
X-Received: by 2002:a17:903:22c4:b0:184:cb7e:ba36 with SMTP id
 y4-20020a17090322c400b00184cb7eba36mr19024054plg.57.1669393021973; Fri, 25
 Nov 2022 08:17:01 -0800 (PST)
MIME-Version: 1.0
References: <20221124140627.3269192-1-stefan.hager@ginzinger.com>
 <CADvTj4rmM5-9_qvHqKCRA3FHebK5O3po2dtUg7bXkPW+Oii8pw@mail.gmail.com>
 <AM5PR06MB315361D4448EE9C17B1C3F65840E9@AM5PR06MB3153.eurprd06.prod.outlook.com>
In-Reply-To: <AM5PR06MB315361D4448EE9C17B1C3F65840E9@AM5PR06MB3153.eurprd06.prod.outlook.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 25 Nov 2022 12:16:50 -0400
Message-ID: <CADvTj4p-u4aELr0Km=cGzh092dMXq0rq=gVOHV5jC=eQagrYXA@mail.gmail.com>
To: Hager Stefan <Stefan.Hager@ginzinger.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CQ8L5GOMAVGjngQpvQQ1MaLtsAoLP//bUsowZLsQjzo=;
 b=A6XqLayrUEzpczbnwc2tncGWD+y3dqk44Ef0pLcbfaofoMV0FDHDduO1CI/zDukxkV
 b3i5QBQvREI5CAYFkaVwc20nQM+TWktwhODl2wmU/eQOQSWMIa2haNvbWkelptHmEBXB
 Lw81OMA67R7528tE9XSDsiFUKg51C+i5ruycJqSfiE+I1JNfSYO5Ccb4fL3OqM7iE6O+
 Aqrk73nfR623cF6YlzWh1Tqa6SbXN2xjiI/Ihsf2F82WOZsgrlgThhuytj7MLgtjXJIN
 mN7Pdjo2KBd8G4a9Ht2AYFI3BwVrATE0x6CHt2d5em96tGVjFZPqst3KTdCQBkSZNYtE
 SvfA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=A6XqLayr
Subject: Re: [Buildroot] [RFC PATCH 00/10] tensorflow-lite: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Nov 25, 2022 at 5:07 AM Hager Stefan <Stefan.Hager@ginzinger.com> wrote:
>
> Hi James!
>
> Tanks for your Feedback!
>
> Yes TFlite 2.8.0 is not the "latest" Release.
>
> I'm absolutly with you that using special Versions is a bad idea in general.
> On the other hand, it was my fear that it may be difficult to prove that everything works properly with newer Libs even if the build succeeds.
> It was hard work for me get it running and I was happy that everything works even with the known limitations. But i learned a lot ; )

It seems to build fine with normal libraries and without all the
manual copy hacks:
https://patchwork.ozlabs.org/project/buildroot/list/?series=330091&submitter=&state=*&q=&archive=both&delegate=

See if that works for you, I refactored your patchset and it seems to
build without
issues now using system libraries.

I also uploaded that series to my personal github if that's easier for
you to test:
https://github.com/jameshilliard/buildroot/tree/tensorflow-lite

>
> Maybe it is the best to bump to Version 2.11.0 and they try it again with buildroot's own packages where they exist.
> But this will take some time, maybe next year for the 23.04 Release.

I bumped it to 2.11.0 and fixed the build issues I ran into:
https://patchwork.ozlabs.org/project/buildroot/patch/20221125160724.1725476-8-james.hilliard1@gmail.com/

>
> And next time i need to add the [Buildroot] tag to the subject so my mail sorting rule will work for my own mails...

I think you also accidentally dropped the mailing list from your reply as well.

>
> Best Regards
> Stefan
>
>
>
>
> From: James Hilliard <james.hilliard1@gmail.com>
> Sent: Thursday, November 24, 2022 15:54
> To: Hager Stefan <Stefan.Hager@ginzinger.com>
> Cc: buildroot@buildroot.org <buildroot@buildroot.org>; Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Subject: Re: [Buildroot] [RFC PATCH 00/10] tensorflow-lite: new package
>
> On Thu, Nov 24, 2022 at 10:14 AM Stefan Hager
> <stefan.hager@ginzinger.com> wrote:
> >
> > Hello,
> >
> > this RFC patch series proposes a way to integrate the Tensorflow-lite runtime (TFLite) into Buildroot.
> >
> > This first RFC just integrates the TFLite C++ sahred library.
> > After a sucessful first integration the next step wuld be to activate the python library for TFlite.
> > As a third step i plan to integrate the NPU Backend Driver for TFLite to use accelerated inference on the i.MX8MP NPU (neural processing unit) for C++ an Python.
> > All of this currently works locally as a proof of concept for a few users.
> >
> > The currently used Version of TFLite is 2.8.0 (official) which is proven to work.
>
> This is an outdated release right? Are there issues with 2.11.0?
>
> >
> > TFlite comes with a bunch of external source dependencies which are downloaded by separate hidden packages and then built by the main TFLite package.
> > TFLite needs its own versions of libabseil, eigen and flatbuffers wich may conflict with the Versions provided by Buildroot.
>
> I'm unable to find any documentation indicating this is actually the case.
>
> I skimmed the cmakelists and it doesn't seem to have strict version
> requirements:
> https://github.com/tensorflow/tensorflow/blob/v2.11.0/tensorflow/lite/CMakeLists.txt
>
> Have you tried building against the normal buildroot versions of these packages?
>
> > Since i can not gurantee that TFlite will work with other Versions of this packages i decided to only let TFlite be activated if this packages are not activated in Buildroot.
>
> This is probably not the right approach, other packages may depend on
> or select the normal versions(flatbuffers seems especially problematic).
>
> >
> > Currently TFlite only supports a limited set of processor architectures (ARMV8A: only 64-bit Support no 32-bit (doesn't build); ARMV7A: only 32-bit Support).
> > Anyone else may activate further platforms if needed, but testing needs to then be done by them.
> >
> > How to build a minimal config with TFLite:
> > ===============================================
> > $ make raspberrypi4_64_defconfig menuconfig
> > Activate TFLite in menuconfig: Target packages -> Libraries -> [*] tensorflow-lite
> > $ make tensorflow-lite
> >
> > I'm hoping for Comments to prepare a first patchset.
> >
> > Stefan Hager (10):
> >   tensorflow-lite-abseil-cpp: new package
> >   tensorflow-lite-clog: new package
> >   tensorflow-lite-abseil-cpuinfo: new package
> >   tensorflow-lite-eigen: new package
> >   tensorflow-lite-farmhash: new package
> >   tensorflow-lite-fft2d: new package
> >   tensorflow-lite-flatbuffers: new package
> >   tensorflow-lite-gemmlowp: new package
> >   tensorflow-lite-ruy: new package
> >   tensorflow-lite: new package
> >
> >  package/Config.in                             |   1 +
> >  package/tensorflow-lite-abseil-cpp/Config.in  |   5 +
> >  .../tensorflow-lite-abseil-cpp.hash           |   3 +
> >  .../tensorflow-lite-abseil-cpp.mk             |  14 ++
> >  package/tensorflow-lite-clog/Config.in        |   5 +
> >  .../tensorflow-lite-clog.hash                 |   3 +
> >  .../tensorflow-lite-clog.mk                   |  14 ++
> >  package/tensorflow-lite-cpuinfo/Config.in     |   5 +
> >  .../tensorflow-lite-cpuinfo.hash              |   3 +
> >  .../tensorflow-lite-cpuinfo.mk                |  14 ++
> >  package/tensorflow-lite-eigen/Config.in       |   5 +
> >  .../tensorflow-lite-eigen.hash                |   9 +
> >  .../tensorflow-lite-eigen.mk                  |  14 ++
> >  package/tensorflow-lite-farmhash/Config.in    |   5 +
> >  .../tensorflow-lite-farmhash.hash             |   3 +
> >  .../tensorflow-lite-farmhash.mk               |  14 ++
> >  package/tensorflow-lite-fft2d/Config.in       |   5 +
> >  .../tensorflow-lite-fft2d.hash                |   3 +
> >  .../tensorflow-lite-fft2d.mk                  |  15 ++
> >  package/tensorflow-lite-flatbuffers/Config.in |   5 +
> >  .../tensorflow-lite-flatbuffers.hash          |   3 +
> >  .../tensorflow-lite-flatbuffers.mk            |  14 ++
> >  package/tensorflow-lite-gemmlowp/Config.in    |   5 +
> >  .../tensorflow-lite-gemmlowp.hash             |   3 +
> >  .../tensorflow-lite-gemmlowp.mk               |  14 ++
> >  package/tensorflow-lite-ruy/Config.in         |   5 +
> >  .../tensorflow-lite-ruy.hash                  |   3 +
> >  .../tensorflow-lite-ruy.mk                    |  14 ++
> >  ...2sse-since-this-is-only-useful-on-x8.patch |  34 +++
> >  ...build-a-shared-library-instead-of-st.patch |  55 +++++
> >  ...build-tflite-with-external-delegates.patch |  59 +++++
> >  ...epositories-and-git-pull-configurati.patch | 203 +++++++++++++++
> >  package/tensorflow-lite/Config.in             |  56 +++++
> >  package/tensorflow-lite/tensorflow-lite.hash  |   3 +
> >  package/tensorflow-lite/tensorflow-lite.mk    | 232 ++++++++++++++++++
> >  35 files changed, 848 insertions(+)
> >  create mode 100644 package/tensorflow-lite-abseil-cpp/Config.in
> >  create mode 100644 package/tensorflow-lite-abseil-cpp/tensorflow-lite-abseil-cpp.hash
> >  create mode 100644 package/tensorflow-lite-abseil-cpp/tensorflow-lite-abseil-cpp.mk
> >  create mode 100644 package/tensorflow-lite-clog/Config.in
> >  create mode 100644 package/tensorflow-lite-clog/tensorflow-lite-clog.hash
> >  create mode 100644 package/tensorflow-lite-clog/tensorflow-lite-clog.mk
> >  create mode 100644 package/tensorflow-lite-cpuinfo/Config.in
> >  create mode 100644 package/tensorflow-lite-cpuinfo/tensorflow-lite-cpuinfo.hash
> >  create mode 100644 package/tensorflow-lite-cpuinfo/tensorflow-lite-cpuinfo.mk
> >  create mode 100644 package/tensorflow-lite-eigen/Config.in
> >  create mode 100644 package/tensorflow-lite-eigen/tensorflow-lite-eigen.hash
> >  create mode 100644 package/tensorflow-lite-eigen/tensorflow-lite-eigen.mk
> >  create mode 100644 package/tensorflow-lite-farmhash/Config.in
> >  create mode 100644 package/tensorflow-lite-farmhash/tensorflow-lite-farmhash.hash
> >  create mode 100644 package/tensorflow-lite-farmhash/tensorflow-lite-farmhash.mk
> >  create mode 100644 package/tensorflow-lite-fft2d/Config.in
> >  create mode 100644 package/tensorflow-lite-fft2d/tensorflow-lite-fft2d.hash
> >  create mode 100644 package/tensorflow-lite-fft2d/tensorflow-lite-fft2d.mk
> >  create mode 100644 package/tensorflow-lite-flatbuffers/Config.in
> >  create mode 100644 package/tensorflow-lite-flatbuffers/tensorflow-lite-flatbuffers.hash
> >  create mode 100644 package/tensorflow-lite-flatbuffers/tensorflow-lite-flatbuffers.mk
> >  create mode 100644 package/tensorflow-lite-gemmlowp/Config.in
> >  create mode 100644 package/tensorflow-lite-gemmlowp/tensorflow-lite-gemmlowp.hash
> >  create mode 100644 package/tensorflow-lite-gemmlowp/tensorflow-lite-gemmlowp.mk
> >  create mode 100644 package/tensorflow-lite-ruy/Config.in
> >  create mode 100644 package/tensorflow-lite-ruy/tensorflow-lite-ruy.hash
> >  create mode 100644 package/tensorflow-lite-ruy/tensorflow-lite-ruy.mk
> >  create mode 100644 package/tensorflow-lite/0001-Deactivated-neon2sse-since-this-is-only-useful-on-x8.patch
> >  create mode 100644 package/tensorflow-lite/0002-Added-option-to-build-a-shared-library-instead-of-st.patch
> >  create mode 100644 package/tensorflow-lite/0003-Added-option-to-build-tflite-with-external-delegates.patch
> >  create mode 100644 package/tensorflow-lite/0004-Removed-source-repositories-and-git-pull-configurati.patch
> >  create mode 100644 package/tensorflow-lite/Config.in
> >  create mode 100644 package/tensorflow-lite/tensorflow-lite.hash
> >  create mode 100644 package/tensorflow-lite/tensorflow-lite.mk
> >
> > --
> > 2.36.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
