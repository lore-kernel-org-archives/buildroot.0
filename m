Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA124C4332F
	for <buildroot@archiver.kernel.org>; Mon, 28 Nov 2022 18:58:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5673581934;
	Mon, 28 Nov 2022 18:58:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5673581934
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VI_-pHnoLUTT; Mon, 28 Nov 2022 18:58:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76659817D3;
	Mon, 28 Nov 2022 18:58:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76659817D3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 23C621BF377
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 18:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2E7160AFD
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 18:58:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2E7160AFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5KlWC5oirs8U for <buildroot@lists.busybox.net>;
 Mon, 28 Nov 2022 18:57:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41EC260A91
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 41EC260A91
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 18:57:58 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([62.216.209.77]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MIdiZ-1pBbPj3c73-00Efie; Mon, 28
 Nov 2022 19:57:54 +0100
Date: Mon, 28 Nov 2022 19:57:50 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <20221128195750.196cfe66@gmx.net>
In-Reply-To: <20221128190024.5380be46@gmx.net>
References: <notmuch-sha1-bd80a5e4a125bbe0e62e6253fdfa7610e4834e90>
 <166962622413.3066484.1675129521759030444@Monstersaurus>
 <20221128190024.5380be46@gmx.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:maoimC16FlLUQdqcYOYeTib8s0JUFRqbPxGrONYevOcRF93RRIC
 vdv2xolOUEsYEE709jF2Y+DjI9X+2wIEuiUXPglKNDwtdVyCwMZfEN28dutCo3muY2ldJZ5
 ukacnqlAw1/Nd4Rl7U05BfKgAjtZ4iSPe0OqHOkOVKDdhd6MVNfRzh8ktp4I8kesHHdt/Qp
 jo2OvBYBztHZT0rV1cBuQ==
UI-OutboundReport: notjunk:1;M01:P0:XvFD53Uxhjc=;/Pfu8Fzthbezuz6Jjs11UVLriGX
 Fr7AuaMOYa6F0FaWtqgLF0w9Cl/CvaDUcx0MZuPX8ksKkeufY1/qxiVIoeTDdoTYYEZqid1R/
 8YTxR/z6EsocMc0WY2D/ju9N8zrY70xAFNsDuTWktphH27LRhzncCfz2RGHGhDMc2jVDqwolj
 tyclrI0I95MnFbB/6qc0YmNgtQSi67kM089ZR4wsFlxG8ieP07RIdDhnf7fj13aIAaaABTE5x
 12tQSumrRKhZSlHeCI6/SfUNDCEuM2Cx2eWL96gS32mdf5eO/cgzeO9pv0Kwxbh2R6nFXeNjt
 gu29XgV3khF2WVb6FbblsAnjpzESIREhXJWra2UwDIl9HTHddJM40gXQog/11elBE6G64J0Hy
 wmgtNVw8Riy88ssmh8uIpgZtphVVPeAigjFNnkUxilmHwlUMMI3Gu68Xlc464vstHONj/3IEa
 8gU0Z4ybStTAw4VbPXuKjqNQHHCE5MPSVKtn0QYU3M/n0OOqZdA3DdBS2yFjFdZ5jblXcoSN4
 4pmk5dLalYK8ptRu9wG1/7aXCXUI7LxuNOVvnxR/ngH9eE7WiF81619qtKqSbE/gIdzy91Axi
 dcgCP0ugJCmC/eRAtsGtDrYwRQd64Sir4UXuzI4/OXfrb1DJzOtXNAg5kKNL0FTQ2kWLRFlLF
 xdnI0aN7S2Oxhe1KosTlklvISyFFSkaMqVoYKCOsDaCcNmON2ul11reUIeLrVEDgGMPrgG+s+
 8qul3LK8kh5M4YED0jR3lVvxyoOe7N/1HFVpZs9gGeY01U1z7MvGImakz1e2S0179dK4fhtYB
 vOYPpWAXbzaNSVdIEa085xujn6nOLgdnIQrVs/tW00OPqwmOfgnLAoZuKZRa+Pg6wDwruH77Q
 LvxOvQOxE5R30+IZR3bKt35A4y+bN1r7h8doM1ZsPfzqcOnEKZFrv873ehGTCoyXbRURilpWE
 NV7YycbGfIjiLWPw53Oa3Fkpy/o=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1669661875; bh=hqVxXWewD5lwm3ISwgVE4naoT5odao/zrXjju+3kI+s=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=SI+rBbX7nGYOz2IAwvuwroPHth4o6AfHlwzaZlzuX2ejmmcYVWIQYb+0jlpvJYxBQ
 /CuKhHHDyAtzGOaJK1lPcO0WgL4CPRW8givLF+xwMz8FREPAr0vb5bAYtnOOheGXPu
 ZBNd0NvLl+MzrqH6BScExhVJxNwUwcEmG6zpCCcTpAjGMwncJe+ia3Y6TqRjm67XsN
 CvSDRXCOhhFYqnqJ532b6oXA2LOPFTYJci7Gjmci/amublACvBmTJqJTam3Q0qv3gW
 YkXyzeC5vEKwlnzG378hF/EGnqakwDsnyNtV8RB9fM+QD+Eg5FeVAyO8XSQ8DTkKVI
 MHtBLa65qdsqQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=SI+rBbX7
Subject: Re: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2022-11-26
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Kieran,

On Mon, 28 Nov 2022 19:00:49 +0100, Peter Seiderer <ps.report@gmx.net> wrote:

> Hello Kieran,
>
> On Mon, 28 Nov 2022 09:03:44 +0000, Kieran Bingham <kieran.bingham@ideasonboard.com> wrote:
>
> > Hi Thomas,
> >
> > + Buildroot list
> >
> > Quoting Thomas Petazzoni (2022-11-27 07:39:11)
> > > Hello,
> > >
> > > Autobuilder failures
> > > ====================
> > >
> > > Below is a list of build failures reported by the Buildroot autobuilders
> > > in relation to packages or CPU architectures you are in charge of.
> > > Please help us improving the quality of Buildroot by investigating those
> > > build failures and sending patches to fix them.
> > >
> > > Results for the '2022.02.x' branch
> > > ----------------------------------
> > >
> > > Build failures related to your packages:
> > >
> > >     arch     |             reason             |                                       url
> > > -------------+--------------------------------+---------------------------------------------------------------------------------
> > >   aarch64    | libcamera-1966b9a58436fab51... | http://autobuild.buildroot.net/results/5ea8f180e4909f8157565238b25f567fcf1f3beb
> >
> > Upon a quick examination I can see the following highlights in
> > build-end.log here:
> >
> > ...
> > Run-time dependency GTest found: YES 1.11.0
> > ...
> >     lc-compliance application: YES
> > ...
> >     lc-compliance            : enabled
> > ...
> > [117/121] Linking target src/lc-compliance/lc-compliance
> > FAILED: src/lc-compliance/lc-compliance
> > /home/buildroot/autobuild/run/instance-3/output-1/host/bin/aarch64-linux-gnu-g++  -o src/lc-compliance/lc-compliance src/lc-compliance/lc-compliance.p/.._cam_event_loop.cpp.o src/lc-compliance/lc-compliance.p/.._cam_options.cpp.o src/lc-compliance/lc-compliance.p/environment.cpp.o src/lc-compliance/lc-compliance.p/main.cpp.o src/lc-compliance/lc-compliance.p/simple_capture.cpp.o src/lc-compliance/lc-compliance.p/capture_test.cpp.o -Wl,--as-needed -Wl,--no-undefined -Wl,--start-group -lstdc++fs -Wshadow -include config.h '-Wl,-rpath,$ORIGIN/../libcamera:$ORIGIN/../libcamera/base:/home/buildroot/autobuild/run/instance-3/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/../lib64' -Wl,-rpath-link,/home/buildroot/autobuild/run/instance-3/output-1/build/libcamera-1966b9a58436fab51f8270aad6a228b935e4fac4/build/src/libcamera -Wl,-rpath-link,/home/buildroot/autobuild/run/instance-3/output-1/build/libcamera-1966b9a58436fab51f8270aad6a228b935e4fac4/build/src/libcamera/base -Wl,-rpat
 h-
>  li
> >  nk,/home/buildroot/autobuild/run/instance-3/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/../lib64 src/libcamera/libcamera.so.0.0.0 src/libcamera/base/libcamera-base.so.0.0.0 -latomic /home/buildroot/autobuild/run/instance-3/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libevent_pthreads.so /home/buildroot/autobuild/run/instance-3/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libevent.so -lpthread -L/home/buildroot/autobuild/run/instance-3/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib -lgtestd -Wl,--end-group
> > /home/buildroot/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-linux-gnu/7.3.1/../../../../aarch64-linux-gnu/bin/ld: cannot find -lgtestd
> > collect2: error: ld returned 1 exit status
> >
> > I don't think we've changed anything (on the libcamera side) regarding
> > gtest/lc-compliance in quite some time ... so I'm surprised to see this
> > error pop up?
>
> The following patch/hack fixes the problem here:
>
> 	$ diff -u ./host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/pkgconfig/gtest.pc_orig ./host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/pkgconfig/gtest.pc
> --- ./host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/pkgconfig/gtest.pc_orig	2022-11-28 18:44:57.547871537 +0100
> +++ ./host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/pkgconfig/gtest.pc	2022-11-28 18:45:06.676052468 +0100
> @@ -5,5 +5,5 @@
>  Description: GoogleTest (without main() function)
>  Version: 1.11.0
>  URL: https://github.com/google/googletest
> -Libs: -L${libdir} -lgtestd -lpthread
> +Libs: -L${libdir} -lgtest -lpthread
>  Cflags: -I${includedir} -DGTEST_HAS_PTHREAD=1
>
>
> More of an gtest package problem than a libcamera one, mind the
> libgtestd vs. libgtest, the other way round was fixed by 'package/gtest:
> fix gtest.pc/gmock.pc library names for the debug build' ([1]), seems
> something changed since the introduction of the patch (or the conditional
> introduced by the patch is wrong)....

Seems package/gtest/0001-pkg-config-fix-gtest.pc-gmock.pc-library-names-for-t.patch
is no longer needed since the bump of gtest to 1.22 ([2], see gtest commit [3])...

Regards,
Peter


[2] https://git.buildroot.net/buildroot/commit/?h=2022.02.x&id=c59eee8118a2da55002ae16e416e3700ce4c60f4
[3] https://github.com/google/googletest/commit/ca3ffd90f2726f6c0c6e790f05c7c88491a16466


>
> The given .config sets:
>
> # BR2_ENABLE_DEBUG is not set
> BR2_ENABLE_RUNTIME_DEBUG=y
>
> Regards,
> Peter
>
> [1] https://git.buildroot.net/buildroot/commit/?id=1afea0b11b140a6d50aff726f2570702cc984a6e
>
> >
> > --
> > Kieran
> >
> >
> > > Thanks for your contribution to Buildroot!
> > >
> > > --
> > > http://autobuild.buildroot.net
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
