Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2334C4332F
	for <buildroot@archiver.kernel.org>; Mon, 28 Nov 2022 18:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6AE3B400E7;
	Mon, 28 Nov 2022 18:01:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AE3B400E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wvqc6fhR9hct; Mon, 28 Nov 2022 18:01:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 850164025D;
	Mon, 28 Nov 2022 18:01:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 850164025D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1D7371BF335
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 18:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0460E40921
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 18:01:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0460E40921
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EDDAhIZw55oW for <buildroot@lists.busybox.net>;
 Mon, 28 Nov 2022 18:01:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D11BE408EC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D11BE408EC
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 18:01:02 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([62.216.209.77]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MNKhs-1pONt33eFm-00OnDL; Mon, 28
 Nov 2022 19:00:59 +0100
Date: Mon, 28 Nov 2022 19:00:49 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <20221128190024.5380be46@gmx.net>
In-Reply-To: <166962622413.3066484.1675129521759030444@Monstersaurus>
References: <notmuch-sha1-bd80a5e4a125bbe0e62e6253fdfa7610e4834e90>
 <166962622413.3066484.1675129521759030444@Monstersaurus>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:Y0d+hzR1I1+qAwTKUPaY87WxOgA003OhD8IvLHzCx+GRNR7iPH6
 pxL8jRWhhJprcZVzJmEhr8tYD6uRA7Ldv2xg/PxpBMg4lQBzcaPQBHnPfEJaUqQflIabZZ9
 TNr73C/q0ALQyvTbZdXaLj/2pGiYCo0BXQIXOh7/NGq7tT/IfRrt6/9dqyJroCNFD9x1fNz
 JQ0C6Hb1FllyEKyyuKk0A==
UI-OutboundReport: notjunk:1;M01:P0:/g44O17sbBU=;FucZx8jGYzuwVtxB4HQNfccZMvz
 JCJNWDvFhHcP+G7JUG9UTKsxY0JaKgKV2/oriOktc2dLzpAtlxX2MomUfAhU4RnQnPCt1CtZ0
 ZFWiX4LtEcQ4mJSXoEFw6hBFiGrXyr8QxmK1hyXMyKzi8Lzw+62xA1G7h0jQaor0CHEgoUms7
 GLywJ0TtkVPhz7mJruaBV5GdTfV/GgqT5kyrxvUq7hS6KMb3CY1ZOjwHu+95BzEpgeH2/2On/
 s3F1+I0QmE78Ub1FxRKyh9t6yrKuLUj0dkti68hEt1neQ1wJ6H8XPKb3lxyxWfhgaByMw9458
 IRe2Oh4EzFfewxy+bKC96e08hRSTftBZ5looyGEOH/GMsQCn8tA+V8ug0C6qHAdwpQjPuARYr
 G9fpnY5gP2W01C/5DhaQm1ziYM5TfJS0SIimqiuYu0pQkx821cNdFLjuA6Z8cxnE1phWuZ86s
 KxA0B81YZkJ2iZxovbemoDCcrsY757GBZyfPpxkZMIvaABMtzIlUjFzK/l3JonrRaFNGSIHQT
 EOz1nqz2GvM/JmsEdrfl4zs676Rh7yZI8p4mbDgRbvumh7bWSGEHIN/eCmNBXH5YBJEmco18h
 fyFkBq6pDPYlVA5xdAcuSPuCQYyjFRrvzfoiIYhjgT7JvpoCPBogqyMNWWgQzCBpjoW8ervMV
 mXLy1LbQ+w8zzLI7TJiqCdVj67iCx6AT8HWSdt2LZtDHzQ2/gew+f2Fw3PLOmlyZ5mVEsSCQC
 qZLhl5uLPINGK2FpAuLfLr7VOKQHCZmOKX3yXitIeSjRYdXQ+HKJ7gXwVenJy+eyX1bkqRmdP
 iFbdWwWe0MEQWdRc18uDvJUF0aXYxnwiw9G/X84MWgKJg0kxOzKGkeUcQYtUCj6SrDUvGPEnT
 9ctKm0qx+kgoZP6TYlyqTzy8dMsuBOeWPaOpAeO/RTUHAPN/S0Ja/JMXoFUtR9SZrjNHW9s/c
 eK3pNFAt1lJP4iuRdbtIwzYczrc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1669658460; bh=BRCffT4c//pbhve2SWjYGem+mCqw1dkhHJxB+jLa7oA=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=RTxewIOXQU19bhI9Cp+J6YL7TFaaWdphQcbOox0q1ZalSRQn9EZyxiZpm/cHx3fwU
 tJ1AjvEVVPb+B/xkmKzDNFg/xgX4eZdi7IrfZFb9ZNG7ntA1OaEPMsSBz8Vgb27SV/
 2yrJ8hzfQARhu8BITz3masReZaWkxYSJzP/mHSX/kXmQxXaXmO2Fu7bbZT55ewX4ru
 UDLAO42HCNc9YjTcd51LwnDMC/uY2SAGkU6PE2Oxg5rMhW8L3JjbNbz4IxfRyxSv5Y
 njDqGdbRMtM3cpNAmUsjap2ptguFR1rrdqEytwJZedzE30g/ynN9fDjjVcwuvSlh85
 wf6u3fZZ7jYVA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=RTxewIOX
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

On Mon, 28 Nov 2022 09:03:44 +0000, Kieran Bingham <kieran.bingham@ideasonboard.com> wrote:

> Hi Thomas,
>
> + Buildroot list
>
> Quoting Thomas Petazzoni (2022-11-27 07:39:11)
> > Hello,
> >
> > Autobuilder failures
> > ====================
> >
> > Below is a list of build failures reported by the Buildroot autobuilders
> > in relation to packages or CPU architectures you are in charge of.
> > Please help us improving the quality of Buildroot by investigating those
> > build failures and sending patches to fix them.
> >
> > Results for the '2022.02.x' branch
> > ----------------------------------
> >
> > Build failures related to your packages:
> >
> >     arch     |             reason             |                                       url
> > -------------+--------------------------------+---------------------------------------------------------------------------------
> >   aarch64    | libcamera-1966b9a58436fab51... | http://autobuild.buildroot.net/results/5ea8f180e4909f8157565238b25f567fcf1f3beb
>
> Upon a quick examination I can see the following highlights in
> build-end.log here:
>
> ...
> Run-time dependency GTest found: YES 1.11.0
> ...
>     lc-compliance application: YES
> ...
>     lc-compliance            : enabled
> ...
> [117/121] Linking target src/lc-compliance/lc-compliance
> FAILED: src/lc-compliance/lc-compliance
> /home/buildroot/autobuild/run/instance-3/output-1/host/bin/aarch64-linux-gnu-g++  -o src/lc-compliance/lc-compliance src/lc-compliance/lc-compliance.p/.._cam_event_loop.cpp.o src/lc-compliance/lc-compliance.p/.._cam_options.cpp.o src/lc-compliance/lc-compliance.p/environment.cpp.o src/lc-compliance/lc-compliance.p/main.cpp.o src/lc-compliance/lc-compliance.p/simple_capture.cpp.o src/lc-compliance/lc-compliance.p/capture_test.cpp.o -Wl,--as-needed -Wl,--no-undefined -Wl,--start-group -lstdc++fs -Wshadow -include config.h '-Wl,-rpath,$ORIGIN/../libcamera:$ORIGIN/../libcamera/base:/home/buildroot/autobuild/run/instance-3/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/../lib64' -Wl,-rpath-link,/home/buildroot/autobuild/run/instance-3/output-1/build/libcamera-1966b9a58436fab51f8270aad6a228b935e4fac4/build/src/libcamera -Wl,-rpath-link,/home/buildroot/autobuild/run/instance-3/output-1/build/libcamera-1966b9a58436fab51f8270aad6a228b935e4fac4/build/src/libcamera/base -Wl,-rpath-
 li
>  nk,/home/buildroot/autobuild/run/instance-3/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/../lib64 src/libcamera/libcamera.so.0.0.0 src/libcamera/base/libcamera-base.so.0.0.0 -latomic /home/buildroot/autobuild/run/instance-3/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libevent_pthreads.so /home/buildroot/autobuild/run/instance-3/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libevent.so -lpthread -L/home/buildroot/autobuild/run/instance-3/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib -lgtestd -Wl,--end-group
> /home/buildroot/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-linux-gnu/7.3.1/../../../../aarch64-linux-gnu/bin/ld: cannot find -lgtestd
> collect2: error: ld returned 1 exit status
>
> I don't think we've changed anything (on the libcamera side) regarding
> gtest/lc-compliance in quite some time ... so I'm surprised to see this
> error pop up?

The following patch/hack fixes the problem here:

	$ diff -u ./host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/pkgconfig/gtest.pc_orig ./host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/pkgconfig/gtest.pc
--- ./host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/pkgconfig/gtest.pc_orig	2022-11-28 18:44:57.547871537 +0100
+++ ./host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/pkgconfig/gtest.pc	2022-11-28 18:45:06.676052468 +0100
@@ -5,5 +5,5 @@
 Description: GoogleTest (without main() function)
 Version: 1.11.0
 URL: https://github.com/google/googletest
-Libs: -L${libdir} -lgtestd -lpthread
+Libs: -L${libdir} -lgtest -lpthread
 Cflags: -I${includedir} -DGTEST_HAS_PTHREAD=1


More of an gtest package problem than a libcamera one, mind the
libgtestd vs. libgtest, the other way round was fixed by 'package/gtest:
fix gtest.pc/gmock.pc library names for the debug build' ([1]), seems
something changed since the introduction of the patch (or the conditional
introduced by the patch is wrong)....

The given .config sets:

# BR2_ENABLE_DEBUG is not set
BR2_ENABLE_RUNTIME_DEBUG=y

Regards,
Peter

[1] https://git.buildroot.net/buildroot/commit/?id=1afea0b11b140a6d50aff726f2570702cc984a6e

>
> --
> Kieran
>
>
> > Thanks for your contribution to Buildroot!
> >
> > --
> > http://autobuild.buildroot.net
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
