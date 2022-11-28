Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41A2C4332F
	for <buildroot@archiver.kernel.org>; Mon, 28 Nov 2022 18:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B3914042B;
	Mon, 28 Nov 2022 18:02:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B3914042B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5UPWF0cXbRGr; Mon, 28 Nov 2022 18:02:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73A3F4063F;
	Mon, 28 Nov 2022 18:02:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73A3F4063F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4B94A1BF335
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 18:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33BC74063F
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 18:02:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33BC74063F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Zt8Ckxagyen for <buildroot@lists.busybox.net>;
 Mon, 28 Nov 2022 18:02:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F9374064D
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0F9374064D
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 18:02:22 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id b21so10921013plc.9
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 10:02:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uepwwndspNvTbH9IpKOPO27SEHlEka/m6dTXd5U7mc0=;
 b=q1m1SqaMMLG49mcmbboyVJZZFJcBDAGBxYH4y7Xc/NjnaivxYesp9jRgRBINPFIOt3
 bZrmK/3XT/ak7WGSCS3BWmQVoa0VLPF3BqeLDavRUf+K4dJx3Z/an28yZvm2InUsQgIH
 pMdcZ+WE9FVWj9WBcmGbklyT3puLb1cw/oen2uxr8F90qqG9lgCOoyhRWpvPNb0ulul0
 kuukuqVrFrpMx+QB5ibTCqASgdsFQ2PsOqigIym2EnvyBBCc8XnewcSB+VfXRTxXB4u+
 5p+GKLPoFP27M7rtuxyx4lyrCApnMyxK8S3geQJI/JCzgKwz+/gH2IlNaLKXm1AbKsDR
 0oZQ==
X-Gm-Message-State: ANoB5plM+d8KGCQT9EYlfeGGpwFH991LfrDLEkStOJXJjaKs8AmzqErC
 g2baQk7V7FMEx88FtQ9mok7pmrXHobsOBJki+p5eeFfOsXS9OQ==
X-Google-Smtp-Source: AA0mqf5QWpct2KBKFHWXTSvERGV8O4E4AcPZidhI6Qis7HR7MEJkMDtLGdpJVdC0Xni+Psyy01EQJEk+Efqn0ZPTr6s=
X-Received: by 2002:a17:902:a989:b0:188:d6c7:e7b7 with SMTP id
 bh9-20020a170902a98900b00188d6c7e7b7mr33205341plb.16.1669658542070; Mon, 28
 Nov 2022 10:02:22 -0800 (PST)
MIME-Version: 1.0
References: <20221124140627.3269192-1-stefan.hager@ginzinger.com>
 <CADvTj4rmM5-9_qvHqKCRA3FHebK5O3po2dtUg7bXkPW+Oii8pw@mail.gmail.com>
 <AM5PR06MB315361D4448EE9C17B1C3F65840E9@AM5PR06MB3153.eurprd06.prod.outlook.com>
 <CADvTj4p-u4aELr0Km=cGzh092dMXq0rq=gVOHV5jC=eQagrYXA@mail.gmail.com>
 <AM5PR06MB31539DCE3243B81D0E0B9D6584139@AM5PR06MB3153.eurprd06.prod.outlook.com>
In-Reply-To: <AM5PR06MB31539DCE3243B81D0E0B9D6584139@AM5PR06MB3153.eurprd06.prod.outlook.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 28 Nov 2022 14:02:10 -0400
Message-ID: <CADvTj4pqJYfn7yXPhxE8ofYqHNeZNjqUxgwf4qHr7Uhx7-todQ@mail.gmail.com>
To: Hager Stefan <Stefan.Hager@ginzinger.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uepwwndspNvTbH9IpKOPO27SEHlEka/m6dTXd5U7mc0=;
 b=iIQOF9GkezYzORIK6UAMbfw61KAlJb1+cOwi0/nCKDhig7/MsjjGKEfrMhvb63ivEs
 a8+vZ1eFwdlgmQ3j2Hk7IeDTPFw2w1XsGvqkVLfnrUmSsSADhR14hhWDgCF2KQoJ/aJB
 KPJ2QO2NqHvAM67H+q9UVlVEW8eruAucnWWVU4K+iXnDdtYPO48HAmKeSe/bsvEMXseE
 L6uezW32wX84WCAgWPaMWeA8HtxpR6JT0ZkJ2hTlqI3xHgXCeTEazanM169HUWGChUa4
 L9+FWSsrcdnn50a9T+tz8/hAoyqjPDP761FRKOoYhr7S0d5ZRzjrJt3wsk4Sj/zmuWs1
 541w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=iIQOF9Gk
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Nov 28, 2022 at 11:17 AM Hager Stefan
<Stefan.Hager@ginzinger.com> wrote:
>
> Hi James!
>
> Thanks four your great work!
> I was able to successfully build it.
>
> Unfortunately i could not build (linking error) the example program label_image.
> I use this to verify if the inference results are the same across different Versions
> on the target hardware.
>
> This is what i did:
> $ make freescale_imx8mpevk_defconfig menuconfig
> => in Menuconfig: activated C++ Support in the Toolchain Section; activated tensorflow-lite; activated host environment-setup;
> $ make
> # everything built fine
>
> $ source output/host/environment-setup
> $ cd output/build/tensorflow-lite-2.11.0/tensorflow/lite/buildroot-build/examples/label_image/
> $ make label_image
> # linking error, full log:
>
> Consolidate compiler generated dependencies of target fft2d_fftsg
> [  1%] Built target fft2d_fftsg
> Consolidate compiler generated dependencies of target farmhash
> [  1%] Built target farmhash
> Consolidate compiler generated dependencies of target fft2d_fftsg2d
> [  1%] Built target fft2d_fftsg2d
> Consolidate compiler generated dependencies of target tensorflow-lite
> [ 94%] Built target tensorflow-lite
> [ 94%] Building CXX object examples/label_image/CMakeFiles/label_image.dir/bitmap_helpers.cc.o
> [ 95%] Building CXX object examples/label_image/CMakeFiles/label_image.dir/label_image.cc.o
> [ 95%] Building CXX object examples/label_image/CMakeFiles/label_image.dir/xxx/buildroot/output/build/tensorflow-lite-2.11.0/tensorflow/core/util/stats_calculator.cc.o
> [ 96%] Building CXX object examples/label_image/CMakeFiles/label_image.dir/__/__/profiling/memory_info.cc.o
> [ 96%] Building CXX object examples/label_image/CMakeFiles/label_image.dir/__/__/profiling/profile_summarizer.cc.o
> [ 96%] Building CXX object examples/label_image/CMakeFiles/label_image.dir/__/__/profiling/profile_summary_formatter.cc.o
> [ 97%] Building CXX object examples/label_image/CMakeFiles/label_image.dir/__/__/profiling/time.cc.o
> [ 97%] Building CXX object examples/label_image/CMakeFiles/label_image.dir/__/__/tools/command_line_flags.cc.o
> [ 98%] Building CXX object examples/label_image/CMakeFiles/label_image.dir/__/__/tools/delegates/default_execution_provider.cc.o
> [ 98%] Building CXX object examples/label_image/CMakeFiles/label_image.dir/__/__/tools/delegates/delegate_provider.cc.o
> [ 98%] Building CXX object examples/label_image/CMakeFiles/label_image.dir/__/__/tools/evaluation/utils.cc.o
> [100%] Building CXX object examples/label_image/CMakeFiles/label_image.dir/__/__/tools/tool_params.cc.o
> [100%] Linking CXX executable label_image
> xxx/buildroot/output/host/lib/gcc/aarch64-buildroot-linux-gnu/11.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: ../../libtensorflow-lite.so: undefined reference to `tsl::profiler::TraceMeRecorder::Record(tsl::profiler::TraceMeRecorder::Event&&)'
> xxx/buildroot/output/host/lib/gcc/aarch64-buildroot-linux-gnu/11.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: ../../libtensorflow-lite.so: undefined reference to `tsl::profiler::internal::g_trace_level'
> xxx/buildroot/output/host/lib/gcc/aarch64-buildroot-linux-gnu/11.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: ../../libtensorflow-lite.so: undefined reference to `tensorflow::profiler::ScopedMemoryDebugAnnotation::ThreadMemoryDebugAnnotation()'
> xxx/buildroot/output/host/lib/gcc/aarch64-buildroot-linux-gnu/11.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: ../../libtensorflow-lite.so: undefined reference to `tsl::profiler::GetCurrentTimeNanos()'
> collect2: error: ld returned 1 exit status
> make[3]: *** [examples/label_image/CMakeFiles/label_image.dir/build.make:351: examples/label_image/label_image] Error 1
> make[2]: *** [CMakeFiles/Makefile2:436: examples/label_image/CMakeFiles/label_image.dir/all] Error 2
> make[1]: *** [CMakeFiles/Makefile2:443: examples/label_image/CMakeFiles/label_image.dir/rule] Error 2
> make: *** [Makefile:166: examples/label_image/CMakeFiles/label_image.dir/rule] Error 2
>
> This did peviously work with tensorflow-lite v2.8.
> Maybe i am missing something?
>
> I guess this is broken in v2.11.0.
> A fix may be in their master: https://github.com/tensorflow/tensorflow/commit/8562f9764937db51a4742fd10057463880579329

Fix is in master but it's not that specific commit, should be this one:
https://github.com/tensorflow/tensorflow/commit/081c2e4e3cf021efb2853a485a18b563e88f6117

Pushed the fix to my github branch and v2 series:
https://patchwork.ozlabs.org/project/buildroot/patch/20221128175851.1913859-8-james.hilliard1@gmail.com/

> I can try to use their master branch to see if that issue was addressed in the next days. Alternatively i can Test v2.10.1.
>
> Maybe we need to wait for the next release v2.12?
>
> Best Regards
> Stefan
>
> From: James Hilliard <james.hilliard1@gmail.com>
> Sent: Friday, November 25, 2022 17:16
> To: Hager Stefan <Stefan.Hager@ginzinger.com>
> Cc: buildroot <buildroot@buildroot.org>; Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Subject: Re: [Buildroot] [RFC PATCH 00/10] tensorflow-lite: new package
>
> On Fri, Nov 25, 2022 at 5:07 AM Hager Stefan <Stefan.Hager@ginzinger.com> wrote:
> >
> > Hi James!
> >
> > Tanks for your Feedback!
> >
> > Yes TFlite 2.8.0 is not the "latest" Release.
> >
> > I'm absolutly with you that using special Versions is a bad idea in general.
> > On the other hand, it was my fear that it may be difficult to prove that everything works properly with newer Libs even if the build succeeds.
> > It was hard work for me get it running and I was happy that everything works even with the known limitations. But i learned a lot ; )
>
> It seems to build fine with normal libraries and without all the
> manual copy hacks:
> https://patchwork.ozlabs.org/project/buildroot/list/?series=330091&submitter=&state=*&q=&archive=both&delegate=
>
> See if that works for you, I refactored your patchset and it seems to
> build without
> issues now using system libraries.
>
> I also uploaded that series to my personal github if that's easier for
> you to test:
> https://github.com/jameshilliard/buildroot/tree/tensorflow-lite
>
> >
> > Maybe it is the best to bump to Version 2.11.0 and they try it again with buildroot's own packages where they exist.
> > But this will take some time, maybe next year for the 23.04 Release.
>
> I bumped it to 2.11.0 and fixed the build issues I ran into:
> https://patchwork.ozlabs.org/project/buildroot/patch/20221125160724.1725476-8-james.hilliard1@gmail.com/
>
> >
> > And next time i need to add the [Buildroot] tag to the subject so my mail sorting rule will work for my own mails...
>
> I think you also accidentally dropped the mailing list from your reply as well.
>
> >
> > Best Regards
> > Stefan
> >
> >
> >
> >
> > From: James Hilliard <james.hilliard1@gmail.com>
> > Sent: Thursday, November 24, 2022 15:54
> > To: Hager Stefan <Stefan.Hager@ginzinger.com>
> > Cc: buildroot@buildroot.org <buildroot@buildroot.org>; Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Subject: Re: [Buildroot] [RFC PATCH 00/10] tensorflow-lite: new package
> >
> > On Thu, Nov 24, 2022 at 10:14 AM Stefan Hager
> > <stefan.hager@ginzinger.com> wrote:
> > >
> > > Hello,
> > >
> > > this RFC patch series proposes a way to integrate the Tensorflow-lite runtime (TFLite) into Buildroot.
> > >
> > > This first RFC just integrates the TFLite C++ sahred library.
> > > After a sucessful first integration the next step wuld be to activate the python library for TFlite.
> > > As a third step i plan to integrate the NPU Backend Driver for TFLite to use accelerated inference on the i.MX8MP NPU (neural processing unit) for C++ an Python.
> > > All of this currently works locally as a proof of concept for a few users.
> > >
> > > The currently used Version of TFLite is 2.8.0 (official) which is proven to work.
> >
> > This is an outdated release right? Are there issues with 2.11.0?
> >
> > >
> > > TFlite comes with a bunch of external source dependencies which are downloaded by separate hidden packages and then built by the main TFLite package.
> > > TFLite needs its own versions of libabseil, eigen and flatbuffers wich may conflict with the Versions provided by Buildroot.
> >
> > I'm unable to find any documentation indicating this is actually the case.
> >
> > I skimmed the cmakelists and it doesn't seem to have strict version
> > requirements:
> > https://github.com/tensorflow/tensorflow/blob/v2.11.0/tensorflow/lite/CMakeLists.txt
> >
> > Have you tried building against the normal buildroot versions of these packages?
> >
> > > Since i can not gurantee that TFlite will work with other Versions of this packages i decided to only let TFlite be activated if this packages are not activated in Buildroot.
> >
> > This is probably not the right approach, other packages may depend on
> > or select the normal versions(flatbuffers seems especially problematic).
> >
> > >
> > > Currently TFlite only supports a limited set of processor architectures (ARMV8A: only 64-bit Support no 32-bit (doesn't build); ARMV7A: only 32-bit Support).
> > > Anyone else may activate further platforms if needed, but testing needs to then be done by them.
> > >
> > > How to build a minimal config with TFLite:
> > > ===============================================
> > > $ make raspberrypi4_64_defconfig menuconfig
> > > Activate TFLite in menuconfig: Target packages -> Libraries -> [*] tensorflow-lite
> > > $ make tensorflow-lite
> > >
> > > I'm hoping for Comments to prepare a first patchset.
> > >
> > > Stefan Hager (10):
> > >   tensorflow-lite-abseil-cpp: new package
> > >   tensorflow-lite-clog: new package
> > >   tensorflow-lite-abseil-cpuinfo: new package
> > >   tensorflow-lite-eigen: new package
> > >   tensorflow-lite-farmhash: new package
> > >   tensorflow-lite-fft2d: new package
> > >   tensorflow-lite-flatbuffers: new package
> > >   tensorflow-lite-gemmlowp: new package
> > >   tensorflow-lite-ruy: new package
> > >   tensorflow-lite: new package
> > >
> > >  package/Config.in                             |   1 +
> > >  package/tensorflow-lite-abseil-cpp/Config.in  |   5 +
> > >  .../tensorflow-lite-abseil-cpp.hash           |   3 +
> > >  .../tensorflow-lite-abseil-cpp.mk             |  14 ++
> > >  package/tensorflow-lite-clog/Config.in        |   5 +
> > >  .../tensorflow-lite-clog.hash                 |   3 +
> > >  .../tensorflow-lite-clog.mk                   |  14 ++
> > >  package/tensorflow-lite-cpuinfo/Config.in     |   5 +
> > >  .../tensorflow-lite-cpuinfo.hash              |   3 +
> > >  .../tensorflow-lite-cpuinfo.mk                |  14 ++
> > >  package/tensorflow-lite-eigen/Config.in       |   5 +
> > >  .../tensorflow-lite-eigen.hash                |   9 +
> > >  .../tensorflow-lite-eigen.mk                  |  14 ++
> > >  package/tensorflow-lite-farmhash/Config.in    |   5 +
> > >  .../tensorflow-lite-farmhash.hash             |   3 +
> > >  .../tensorflow-lite-farmhash.mk               |  14 ++
> > >  package/tensorflow-lite-fft2d/Config.in       |   5 +
> > >  .../tensorflow-lite-fft2d.hash                |   3 +
> > >  .../tensorflow-lite-fft2d.mk                  |  15 ++
> > >  package/tensorflow-lite-flatbuffers/Config.in |   5 +
> > >  .../tensorflow-lite-flatbuffers.hash          |   3 +
> > >  .../tensorflow-lite-flatbuffers.mk            |  14 ++
> > >  package/tensorflow-lite-gemmlowp/Config.in    |   5 +
> > >  .../tensorflow-lite-gemmlowp.hash             |   3 +
> > >  .../tensorflow-lite-gemmlowp.mk               |  14 ++
> > >  package/tensorflow-lite-ruy/Config.in         |   5 +
> > >  .../tensorflow-lite-ruy.hash                  |   3 +
> > >  .../tensorflow-lite-ruy.mk                    |  14 ++
> > >  ...2sse-since-this-is-only-useful-on-x8.patch |  34 +++
> > >  ...build-a-shared-library-instead-of-st.patch |  55 +++++
> > >  ...build-tflite-with-external-delegates.patch |  59 +++++
> > >  ...epositories-and-git-pull-configurati.patch | 203 +++++++++++++++
> > >  package/tensorflow-lite/Config.in             |  56 +++++
> > >  package/tensorflow-lite/tensorflow-lite.hash  |   3 +
> > >  package/tensorflow-lite/tensorflow-lite.mk    | 232 ++++++++++++++++++
> > >  35 files changed, 848 insertions(+)
> > >  create mode 100644 package/tensorflow-lite-abseil-cpp/Config.in
> > >  create mode 100644 package/tensorflow-lite-abseil-cpp/tensorflow-lite-abseil-cpp.hash
> > >  create mode 100644 package/tensorflow-lite-abseil-cpp/tensorflow-lite-abseil-cpp.mk
> > >  create mode 100644 package/tensorflow-lite-clog/Config.in
> > >  create mode 100644 package/tensorflow-lite-clog/tensorflow-lite-clog.hash
> > >  create mode 100644 package/tensorflow-lite-clog/tensorflow-lite-clog.mk
> > >  create mode 100644 package/tensorflow-lite-cpuinfo/Config.in
> > >  create mode 100644 package/tensorflow-lite-cpuinfo/tensorflow-lite-cpuinfo.hash
> > >  create mode 100644 package/tensorflow-lite-cpuinfo/tensorflow-lite-cpuinfo.mk
> > >  create mode 100644 package/tensorflow-lite-eigen/Config.in
> > >  create mode 100644 package/tensorflow-lite-eigen/tensorflow-lite-eigen.hash
> > >  create mode 100644 package/tensorflow-lite-eigen/tensorflow-lite-eigen.mk
> > >  create mode 100644 package/tensorflow-lite-farmhash/Config.in
> > >  create mode 100644 package/tensorflow-lite-farmhash/tensorflow-lite-farmhash.hash
> > >  create mode 100644 package/tensorflow-lite-farmhash/tensorflow-lite-farmhash.mk
> > >  create mode 100644 package/tensorflow-lite-fft2d/Config.in
> > >  create mode 100644 package/tensorflow-lite-fft2d/tensorflow-lite-fft2d.hash
> > >  create mode 100644 package/tensorflow-lite-fft2d/tensorflow-lite-fft2d.mk
> > >  create mode 100644 package/tensorflow-lite-flatbuffers/Config.in
> > >  create mode 100644 package/tensorflow-lite-flatbuffers/tensorflow-lite-flatbuffers.hash
> > >  create mode 100644 package/tensorflow-lite-flatbuffers/tensorflow-lite-flatbuffers.mk
> > >  create mode 100644 package/tensorflow-lite-gemmlowp/Config.in
> > >  create mode 100644 package/tensorflow-lite-gemmlowp/tensorflow-lite-gemmlowp.hash
> > >  create mode 100644 package/tensorflow-lite-gemmlowp/tensorflow-lite-gemmlowp.mk
> > >  create mode 100644 package/tensorflow-lite-ruy/Config.in
> > >  create mode 100644 package/tensorflow-lite-ruy/tensorflow-lite-ruy.hash
> > >  create mode 100644 package/tensorflow-lite-ruy/tensorflow-lite-ruy.mk
> > >  create mode 100644 package/tensorflow-lite/0001-Deactivated-neon2sse-since-this-is-only-useful-on-x8.patch
> > >  create mode 100644 package/tensorflow-lite/0002-Added-option-to-build-a-shared-library-instead-of-st.patch
> > >  create mode 100644 package/tensorflow-lite/0003-Added-option-to-build-tflite-with-external-delegates.patch
> > >  create mode 100644 package/tensorflow-lite/0004-Removed-source-repositories-and-git-pull-configurati.patch
> > >  create mode 100644 package/tensorflow-lite/Config.in
> > >  create mode 100644 package/tensorflow-lite/tensorflow-lite.hash
> > >  create mode 100644 package/tensorflow-lite/tensorflow-lite.mk
> > >
> > > --
> > > 2.36.1
> > >
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot@buildroot.org
> > > https://lists.buildroot.org/mailman/listinfo/buildroot
>
>
> From: James Hilliard <james.hilliard1@gmail.com>
> Sent: Friday, November 25, 2022 17:16
> To: Hager Stefan <Stefan.Hager@ginzinger.com>
> Cc: buildroot <buildroot@buildroot.org>; Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Subject: Re: [Buildroot] [RFC PATCH 00/10] tensorflow-lite: new package
>
> On Fri, Nov 25, 2022 at 5:07 AM Hager Stefan <Stefan.Hager@ginzinger.com> wrote:
> >
> > Hi James!
> >
> > Tanks for your Feedback!
> >
> > Yes TFlite 2.8.0 is not the "latest" Release.
> >
> > I'm absolutly with you that using special Versions is a bad idea in general.
> > On the other hand, it was my fear that it may be difficult to prove that everything works properly with newer Libs even if the build succeeds.
> > It was hard work for me get it running and I was happy that everything works even with the known limitations. But i learned a lot ; )
>
> It seems to build fine with normal libraries and without all the
> manual copy hacks:
> https://patchwork.ozlabs.org/project/buildroot/list/?series=330091&submitter=&state=*&q=&archive=both&delegate=
>
> See if that works for you, I refactored your patchset and it seems to
> build without
> issues now using system libraries.
>
> I also uploaded that series to my personal github if that's easier for
> you to test:
> https://github.com/jameshilliard/buildroot/tree/tensorflow-lite
>
> >
> > Maybe it is the best to bump to Version 2.11.0 and they try it again with buildroot's own packages where they exist.
> > But this will take some time, maybe next year for the 23.04 Release.
>
> I bumped it to 2.11.0 and fixed the build issues I ran into:
> https://patchwork.ozlabs.org/project/buildroot/patch/20221125160724.1725476-8-james.hilliard1@gmail.com/
>
> >
> > And next time i need to add the [Buildroot] tag to the subject so my mail sorting rule will work for my own mails...
>
> I think you also accidentally dropped the mailing list from your reply as well.
>
> >
> > Best Regards
> > Stefan
> >
> >
> >
> >
> > From: James Hilliard <james.hilliard1@gmail.com>
> > Sent: Thursday, November 24, 2022 15:54
> > To: Hager Stefan <Stefan.Hager@ginzinger.com>
> > Cc: buildroot@buildroot.org <buildroot@buildroot.org>; Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Subject: Re: [Buildroot] [RFC PATCH 00/10] tensorflow-lite: new package
> >
> > On Thu, Nov 24, 2022 at 10:14 AM Stefan Hager
> > <stefan.hager@ginzinger.com> wrote:
> > >
> > > Hello,
> > >
> > > this RFC patch series proposes a way to integrate the Tensorflow-lite runtime (TFLite) into Buildroot.
> > >
> > > This first RFC just integrates the TFLite C++ sahred library.
> > > After a sucessful first integration the next step wuld be to activate the python library for TFlite.
> > > As a third step i plan to integrate the NPU Backend Driver for TFLite to use accelerated inference on the i.MX8MP NPU (neural processing unit) for C++ an Python.
> > > All of this currently works locally as a proof of concept for a few users.
> > >
> > > The currently used Version of TFLite is 2.8.0 (official) which is proven to work.
> >
> > This is an outdated release right? Are there issues with 2.11.0?
> >
> > >
> > > TFlite comes with a bunch of external source dependencies which are downloaded by separate hidden packages and then built by the main TFLite package.
> > > TFLite needs its own versions of libabseil, eigen and flatbuffers wich may conflict with the Versions provided by Buildroot.
> >
> > I'm unable to find any documentation indicating this is actually the case.
> >
> > I skimmed the cmakelists and it doesn't seem to have strict version
> > requirements:
> > https://github.com/tensorflow/tensorflow/blob/v2.11.0/tensorflow/lite/CMakeLists.txt
> >
> > Have you tried building against the normal buildroot versions of these packages?
> >
> > > Since i can not gurantee that TFlite will work with other Versions of this packages i decided to only let TFlite be activated if this packages are not activated in Buildroot.
> >
> > This is probably not the right approach, other packages may depend on
> > or select the normal versions(flatbuffers seems especially problematic).
> >
> > >
> > > Currently TFlite only supports a limited set of processor architectures (ARMV8A: only 64-bit Support no 32-bit (doesn't build); ARMV7A: only 32-bit Support).
> > > Anyone else may activate further platforms if needed, but testing needs to then be done by them.
> > >
> > > How to build a minimal config with TFLite:
> > > ===============================================
> > > $ make raspberrypi4_64_defconfig menuconfig
> > > Activate TFLite in menuconfig: Target packages -> Libraries -> [*] tensorflow-lite
> > > $ make tensorflow-lite
> > >
> > > I'm hoping for Comments to prepare a first patchset.
> > >
> > > Stefan Hager (10):
> > >   tensorflow-lite-abseil-cpp: new package
> > >   tensorflow-lite-clog: new package
> > >   tensorflow-lite-abseil-cpuinfo: new package
> > >   tensorflow-lite-eigen: new package
> > >   tensorflow-lite-farmhash: new package
> > >   tensorflow-lite-fft2d: new package
> > >   tensorflow-lite-flatbuffers: new package
> > >   tensorflow-lite-gemmlowp: new package
> > >   tensorflow-lite-ruy: new package
> > >   tensorflow-lite: new package
> > >
> > >  package/Config.in                             |   1 +
> > >  package/tensorflow-lite-abseil-cpp/Config.in  |   5 +
> > >  .../tensorflow-lite-abseil-cpp.hash           |   3 +
> > >  .../tensorflow-lite-abseil-cpp.mk             |  14 ++
> > >  package/tensorflow-lite-clog/Config.in        |   5 +
> > >  .../tensorflow-lite-clog.hash                 |   3 +
> > >  .../tensorflow-lite-clog.mk                   |  14 ++
> > >  package/tensorflow-lite-cpuinfo/Config.in     |   5 +
> > >  .../tensorflow-lite-cpuinfo.hash              |   3 +
> > >  .../tensorflow-lite-cpuinfo.mk                |  14 ++
> > >  package/tensorflow-lite-eigen/Config.in       |   5 +
> > >  .../tensorflow-lite-eigen.hash                |   9 +
> > >  .../tensorflow-lite-eigen.mk                  |  14 ++
> > >  package/tensorflow-lite-farmhash/Config.in    |   5 +
> > >  .../tensorflow-lite-farmhash.hash             |   3 +
> > >  .../tensorflow-lite-farmhash.mk               |  14 ++
> > >  package/tensorflow-lite-fft2d/Config.in       |   5 +
> > >  .../tensorflow-lite-fft2d.hash                |   3 +
> > >  .../tensorflow-lite-fft2d.mk                  |  15 ++
> > >  package/tensorflow-lite-flatbuffers/Config.in |   5 +
> > >  .../tensorflow-lite-flatbuffers.hash          |   3 +
> > >  .../tensorflow-lite-flatbuffers.mk            |  14 ++
> > >  package/tensorflow-lite-gemmlowp/Config.in    |   5 +
> > >  .../tensorflow-lite-gemmlowp.hash             |   3 +
> > >  .../tensorflow-lite-gemmlowp.mk               |  14 ++
> > >  package/tensorflow-lite-ruy/Config.in         |   5 +
> > >  .../tensorflow-lite-ruy.hash                  |   3 +
> > >  .../tensorflow-lite-ruy.mk                    |  14 ++
> > >  ...2sse-since-this-is-only-useful-on-x8.patch |  34 +++
> > >  ...build-a-shared-library-instead-of-st.patch |  55 +++++
> > >  ...build-tflite-with-external-delegates.patch |  59 +++++
> > >  ...epositories-and-git-pull-configurati.patch | 203 +++++++++++++++
> > >  package/tensorflow-lite/Config.in             |  56 +++++
> > >  package/tensorflow-lite/tensorflow-lite.hash  |   3 +
> > >  package/tensorflow-lite/tensorflow-lite.mk    | 232 ++++++++++++++++++
> > >  35 files changed, 848 insertions(+)
> > >  create mode 100644 package/tensorflow-lite-abseil-cpp/Config.in
> > >  create mode 100644 package/tensorflow-lite-abseil-cpp/tensorflow-lite-abseil-cpp.hash
> > >  create mode 100644 package/tensorflow-lite-abseil-cpp/tensorflow-lite-abseil-cpp.mk
> > >  create mode 100644 package/tensorflow-lite-clog/Config.in
> > >  create mode 100644 package/tensorflow-lite-clog/tensorflow-lite-clog.hash
> > >  create mode 100644 package/tensorflow-lite-clog/tensorflow-lite-clog.mk
> > >  create mode 100644 package/tensorflow-lite-cpuinfo/Config.in
> > >  create mode 100644 package/tensorflow-lite-cpuinfo/tensorflow-lite-cpuinfo.hash
> > >  create mode 100644 package/tensorflow-lite-cpuinfo/tensorflow-lite-cpuinfo.mk
> > >  create mode 100644 package/tensorflow-lite-eigen/Config.in
> > >  create mode 100644 package/tensorflow-lite-eigen/tensorflow-lite-eigen.hash
> > >  create mode 100644 package/tensorflow-lite-eigen/tensorflow-lite-eigen.mk
> > >  create mode 100644 package/tensorflow-lite-farmhash/Config.in
> > >  create mode 100644 package/tensorflow-lite-farmhash/tensorflow-lite-farmhash.hash
> > >  create mode 100644 package/tensorflow-lite-farmhash/tensorflow-lite-farmhash.mk
> > >  create mode 100644 package/tensorflow-lite-fft2d/Config.in
> > >  create mode 100644 package/tensorflow-lite-fft2d/tensorflow-lite-fft2d.hash
> > >  create mode 100644 package/tensorflow-lite-fft2d/tensorflow-lite-fft2d.mk
> > >  create mode 100644 package/tensorflow-lite-flatbuffers/Config.in
> > >  create mode 100644 package/tensorflow-lite-flatbuffers/tensorflow-lite-flatbuffers.hash
> > >  create mode 100644 package/tensorflow-lite-flatbuffers/tensorflow-lite-flatbuffers.mk
> > >  create mode 100644 package/tensorflow-lite-gemmlowp/Config.in
> > >  create mode 100644 package/tensorflow-lite-gemmlowp/tensorflow-lite-gemmlowp.hash
> > >  create mode 100644 package/tensorflow-lite-gemmlowp/tensorflow-lite-gemmlowp.mk
> > >  create mode 100644 package/tensorflow-lite-ruy/Config.in
> > >  create mode 100644 package/tensorflow-lite-ruy/tensorflow-lite-ruy.hash
> > >  create mode 100644 package/tensorflow-lite-ruy/tensorflow-lite-ruy.mk
> > >  create mode 100644 package/tensorflow-lite/0001-Deactivated-neon2sse-since-this-is-only-useful-on-x8.patch
> > >  create mode 100644 package/tensorflow-lite/0002-Added-option-to-build-a-shared-library-instead-of-st.patch
> > >  create mode 100644 package/tensorflow-lite/0003-Added-option-to-build-tflite-with-external-delegates.patch
> > >  create mode 100644 package/tensorflow-lite/0004-Removed-source-repositories-and-git-pull-configurati.patch
> > >  create mode 100644 package/tensorflow-lite/Config.in
> > >  create mode 100644 package/tensorflow-lite/tensorflow-lite.hash
> > >  create mode 100644 package/tensorflow-lite/tensorflow-lite.mk
> > >
> > > --
> > > 2.36.1
> > >
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot@buildroot.org
> > > https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
