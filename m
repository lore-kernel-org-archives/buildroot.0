Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F90BC001DF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 15:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 961064016F;
	Sun, 30 Jul 2023 15:08:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 961064016F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 60SPNxwHKkzu; Sun, 30 Jul 2023 15:08:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70B2140280;
	Sun, 30 Jul 2023 15:08:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70B2140280
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 04DE71BF393
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 15:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC28D60EF6
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 15:08:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC28D60EF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sA1NVNdcs7Xy for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 15:08:49 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E9DD60EF2
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 15:08:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E9DD60EF2
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 05E43B0037C;
 Sun, 30 Jul 2023 17:08:44 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:48340])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 30 Jul 2023 17:08:44 +0200
MIME-Version: 1.0
Date: Sun, 30 Jul 2023 17:08:44 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <50d4fcd31983bde7b248a088e983a0c7@free.fr>
References: <20230607202439.188050-1-ju.o@free.fr>
 <20230729233927.572fd26c@windsurf>
 <50d4fcd31983bde7b248a088e983a0c7@free.fr>
User-Agent: Webmail Free/1.6.1
Message-ID: <d769c819d6035b23c52bc041bdd13477@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690729726;
 bh=zC2l3H0taeXA9atPBECdGWIpDjjjcehjWha/TLvzL0E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cCQtamXLysgaySq3v/DQ2JwDENRbcN+TMFR4+y/q2uzF32Pn/BojMM1ciNeuI/8r8
 p6caYlch2dqojz1MRg54T1tv6Ly+l8KGjc8xeWA3/e1f4Ik1t1bfWdfTTh2r065KI6
 IfDH5/get5wDhrNHrzu8Rz7wPGaj1MP9Pj5B7CGa8YTwn9neLotDKq4cLRl2ipiOaa
 mXOYyycxHgaO0i647ItfRW3Dg3N26vBWoa+l6gBxEtz4KktJV2g/gvK34vCwCvvSyf
 Ey5Ex9sPug0JMeipYrxs05YVzUVEX/1niwYsnkJ4rp3wWUbJgwXIvdAox2tBdj0wnt
 g+Gm3/xXL+sZA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cCQtamXL
Subject: Re: [Buildroot] [PATCH 1/2] package/glslsandbox-player: bump to
 version v2023.04.05
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

As you mentioned, links were missing. I added them. Sorry about that.

On 30/07/2023 14:12, Julien Olivain wrote:
> Hi Thomas,
> 
> I'm glad to see there is some interest in graphical runtime testing!
> 
> On 29/07/2023 23:39, Thomas Petazzoni wrote:
>> Hello Julien,
>> 
>> On Wed,  7 Jun 2023 22:24:38 +0200
>> Julien Olivain <ju.o@free.fr> wrote:
>> 
>>> License hash changed due to copyright year update.
>>> 
>>> Signed-off-by: Julien Olivain <ju.o@free.fr>
>>> ---
>>>  package/glslsandbox-player/glslsandbox-player.hash | 4 ++--
>>>  package/glslsandbox-player/glslsandbox-player.mk   | 2 +-
>>>  2 files changed, 3 insertions(+), 3 deletions(-)
>> 
>> Both applied to master. Nice to see an OpenGL test case in automated
>> tests! I'm curious to understand more how it works:
>> 
>> - How does glslsandboxplayer knows that we want the frames to be
>>   generated as .ppm files?
> 
> The last frame screen dump as a .ppm is requested with the '-D'
> argument in the program invocation, see [1] and [2].
> 
> I'll provide here a bit more insights, in case other people would like
> to write other graphical tests ;)
> 
> glslsandbox-player was designed as a tool for stressing, benchmarking,
> testing and debugging OpenGL ES 2 GPU drivers. So it includes its own
> screenshot feature. It was also designed to run in reduced
> environments (non-linux, static-only, C90, POSIX.1, ...). This is why
> there is no fancy getopt_long() or other dependencies on modern
> graphics formats libraries.
> 
> glslsandbox-player is implementing the screenshot with a good old
> glReadPixel() call, then a fwrite() in [3].
> 
> Even if all of this is a bit outdated, it still continuing to catch
> hardware and GPU driver software bugs in modern implementations (up to
> OpenGL ES 3.2, and also in Vulkan drivers, thanks to Mesa Zink [4] or
> other adaptation layers).
> 
> You could achieve the same behavior with any application having its
> own builtin screenshot feature, for example with weston:
> 
>     # start compositor (with debug protocol to allow screenshots)
>     weston --debug ...other-options...
>     # do the screenshot by calling the client program
>     weston-screenshooter
> 
> This will generate a files with the date, matching
> "wayland-screenshot-*.png".
> 
> 
> Regarding the validity of the output:
> 
> This test is "just" checking a non-empty PPM file is generated. This
> is because, quoting the OpenGL ES 2.0 spec at [5] in Appendix A, "The
> OpenGL ES specification is not pixel exact". I did not wanted to
> introduce a test that would fail every now an then. I also wanted to
> include a sufficiently "complex" workload, while remaining fast (a
> Mandel fractal was a good candidate for that).
> 
> Testing for a non-empty file could be seen as a bit weak. In fact, it
> implicitly relies on the fact that glslsandbox-player validates return
> codes of every library, system and OpenGL calls. It is programmed to
> fail in case an unexpected code is seen. See for example [6]. Since
> the PPM screenshot is made at the end of the rendering, and cleanup
> routines are also checking return codes, the mere presence of this PPM
> file AND a clean return code of the glslsandbox-player invocation
> means a lot. It means that all the plumbing between all the involved
> components returned "OK": compilation of LLVM, Mesa, libdrm, Kernel,
> client application... and a simple execution of all of that also
> returned "OK".
> 
> This is a peculiarity of glslsandbox-player. A "normal" OpenGL
> application would not validate every single call, mainly for
> performance reasons (this is why glslsandbox-player has also those
> --disable-strict-{egl,gles} build time configure options).
> 
> Since OpenGL ES has some invariance rules (continue reading [6]), some
> image checksums could be added in other graphic tests.
> 
> The glslsandbox-player in its testsuite some of this kind of tests,
> for example [7].  I thought it was not really relevant to include
> those kind of checks in this test.
> 
> Also, the DRM VKMS display driver includes CRC checksumming functions,
> see [8] [9] through debugfs, which could be leveraged to validate the
> Kernel display controller "view" is the same as the user space client
> screenshots. For example, we can compare the CRC of the screenshot
> with the CRC of the display controller driver. See below for VKMS
> details.
> 
> 
>> - What role does the DRM vkms driver play in the story?
> 
> To run correctly, OpenGL ES requires a "valid context" created by EGL
> (with eglCreateContext()). The EGL API always requires a "valid
> display" to be initialized, see [10].
> 
> There is many non-standard hacks to run offscreen without a valid
> display, but they are outside the Khronos specs, and sometimes non
> portable from one GPU driver version to another.
> 
> Without a display, we usually end up with eglInitialize() failing with
> error EGL_BAD_DISPLAY or EGL_NOT_INITIALIZED and stop there.
> 
> With KMS/DRM, the user space client application is also controlling
> its swap chain, see [11], so the application needs a DRM driver to
> talk to.
> 
> For such a test to work, the tested application must discover the DRM
> driver on its own (or must be configurable to use a specific DRM
> driver). glslsandbox-player can do both, see [12] and [13]. Here,
> since we have only one DRM vkms driver, we let the application
> discover it.
> 
> To me, VKMS with Mesa llvmpipe/swrast is the best software-only
> solution for the moment. It allows to run Qemu with "-display none"
> while emulating some kind of display in the virtual
> machine. Obviously, this limits to simple GPU workloads that could
> still fit in a software llvmpipe/swrast implementation. With a Qemu
> Aarch64 virt (possibly with SMP), we can still reach decent
> performance for simple runtime tests.
> 
> Virtio-GPU would have been another option, but requires QEmu emulate a
> display, and access an OpenGL implementation. This would put too many
> requirements on the testing environment.
> 
> Finally, other GPU vendor implementation usually require to emulate
> some hardware to probe their drivers. This solution can be ruled out
> for now.
> 
> 
>> Thanks for this work!
>> 
>> Thomas
> 
> I hope this demystifies a bit all the hidden magic behind this test.
> I also hope to see other graphic runtime tests! ;)
> 
> Best regards,
> 
> Julien.

[1]  
https://git.buildroot.org/buildroot/tree/support/testing/tests/package/test_glslsandbox_player.py?id=1367f3e465500129998631419cf645c0180c71a1#n45
[2]  
https://github.com/jolivain/glslsandbox-player/blob/v2023.04.05/README.md#running-glslsandbox-player
[3]  
https://github.com/jolivain/glslsandbox-player/blob/v2023.04.05/src/glslsandbox-player.c#L274
[4]  https://docs.mesa3d.org/drivers/zink.html
[5]  
https://registry.khronos.org/OpenGL/specs/es/2.0/es_full_spec_2.0.pdf#page=169
[6]  
https://github.com/jolivain/glslsandbox-player/blob/v2023.04.05/src/gles_helper.c#L292
[7]  
https://github.com/jolivain/glslsandbox-player/blob/v2023.04.05/tests/tst-textures.at#L17
[8]  
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/gpu/drm/vkms/vkms_composer.c?h=v6.4.7#n107
[9]  https://docs.kernel.org/gpu/drm-uapi.html#display-crc-support
[10] 
https://registry.khronos.org/EGL/sdk/docs/man/html/eglInitialize.xhtml
[11] 
https://github.com/jolivain/glslsandbox-player/blob/v2023.04.05/src/native_gfx_kms.c#L761
[12] 
https://github.com/jolivain/glslsandbox-player/blob/v2023.04.05/src/native_gfx_kms.c#L416
[13] 
https://github.com/jolivain/glslsandbox-player/blob/v2023.04.05/src/native_gfx_kms.c#L526

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
