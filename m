Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E85EC433EF
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 19:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 713B682A4E;
	Thu, 24 Mar 2022 19:35:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YECMWcVCvySU; Thu, 24 Mar 2022 19:35:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83589826DF;
	Thu, 24 Mar 2022 19:35:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 674491BF379
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 19:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46F9E60A6F
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 19:35:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hRhKljl9yK6c for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 19:35:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9FE3860759
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 19:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1648150518;
 bh=/teshi+69wvL9iLiJhyystpWz/wUPgiojsQal1cBZzk=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=lyD2skAAkJbH7Me7VSPhHVmDjFHHRnzDimVMOvQ7G0YjEIhk0um6+nURtBFDLU4KM
 tppECzlAr2VhjwsjOjGH7Gjzyq3cpAgFpN0hrZdbHisaLyqOyt8V5PmEzibNYWZT69
 VTPMTyinMbl/JiXxLp7amO0n5rfIoxnm/RaZhkVU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.123]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MJE6F-1nndBG3T3r-00KjlK; Thu, 24
 Mar 2022 20:35:17 +0100
Date: Thu, 24 Mar 2022 20:35:15 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Dan Ambrosio via buildroot <buildroot@buildroot.org>
Message-ID: <20220324203515.5eeb9584@gmx.net>
In-Reply-To: <CAAKqzUSn-LBNag6UMxYbzL=1Yi0KgF+9OA0BmgMPN99VOTKJog@mail.gmail.com>
References: <CAAKqzUSn-LBNag6UMxYbzL=1Yi0KgF+9OA0BmgMPN99VOTKJog@mail.gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:3yAfiHAqc5823SqHoIDnjgM0ef28e0mBq4mTqFMnPLTKqU/e+dQ
 WXNNrvQowatGrEexHBuDCh3Mj+R9TzZKmpHngKqRhFJErGPpGs0dimr11dPh5SMjbg5N7i+
 sQ6ubuyGiOSKqqHRK59ANe/aVaYvGC2vPbxmS7SEOjAqnqRHgFhBhsVdd4cJXaERB6h6IGN
 YR7gDLVZt/HI51bn1YB0w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rrIPGznZ8s0=:YT/iYvkB2to7LgQ6Pbxrf2
 Tcha3PisNCNmm1Gbiysqo/9KLN2bvyb1ND82lpw8HN03d4HLosN5JeJDToffUiwvoOaV4R9sZ
 F7+Db5IjgNBn91s6eOtNJl0H9Ud7wyAPNpyR8NPoM0rxGTrDw8bfHYEDi1frnqOUq0wLFiVCt
 2btPR4IrckjFfai6o9OZx2S3vm4PlO1ZSLkwVEhmrPvHnEGzZ4RlgbwycxTx2zFPx7JIaHopC
 8/HxA/kL5zfOQiuN1r8ElOt41RNJNmfx8le8sy5XaelDsJftu1+dwtVzLcCVPq5fMwANafS35
 Pc3zoALUM1mMoHN5TZtZJr9lYfA82mjvsZSMo3UEX4ihKBcRkwRlRy9+GE4rCX5I9eH7uQVVC
 X9KqoOphVrwHI+yuAEq9v34SY2lSJ7dcWJaNPpKjBHLM/P1HoRNpCniGMTu0ijTSqFyGDeDnm
 1pBI2OUx6FBTO44lsdaL0LTiUUERSqPIVy6/zHHVndYMtHWVY3mR8hmBGX3adT0gy1W8wkXuZ
 sBZ25rJG8fNKzf1omIuojBb3+ipMG7mZpxHqLmnLBgBJpPtjKo4IEWuktVt3ObjCm+txoq3Xv
 D4e3LR3VOCgocrB3i+tBkF6ovz2Fh4L34oMju06G+oBASDGJzLM+tH7NalOxlScZjOxAr2iBz
 faWbLtpPxpCoeoh/GDETDE1+8TCLCjC5O3bhd8Pwa+wcZuFgXz7/IPd3GGrt7Wg4IWeTSTP/I
 cbLfrNzzGn71WjUVSk3qJrxKUyYnIC9aFPRq6v9k+pss0aMGExGUNwKdl0oCRfRL3H6otnAyj
 bAB4wlD4lCq28qgwxMLCU28nsS3BX9qJAv2PWhVDkGajDSZfRyOyCr60DiiaXBDKxnYILDG7r
 fsLAMWpp9EOBWHd5+lHFQFDGNWYZT3Opj41WeYaNssKrRX+gOjA5JnTT859lLKCwdPjq4WOJh
 tCgEYoSucEXyQXQgENdq7xlcWulvgAvevNW8Lsmebr947ThN0hWBJw97MmLhRlC+e6hlXYitF
 JS/zdBeyXuuQ4brWbTdHB2+Qt54XNPqcOnBzpqDzG1jIciujzBtND+/78uAikcXtN5bhWXemj
 RChhmzQ/hnHFRU=
Subject: Re: [Buildroot] Suspected ccache Issue With wireshark
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
Cc: Dan Ambrosio <dambrosio@outrider.ai>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Dan,

On Thu, 24 Mar 2022 09:38:04 -0600, Dan Ambrosio via buildroot <buildroot@buildroot.org> wrote:

> Hello,
> I recently upgraded my buildroot project from 2021.02.6 to the latest
> LTS (2022.02) and ran into a compilation error with the wireshark
> package when BR2_CCACHE is enabled.
>
> It seems like a cmake argument is being passed through to ccache.
>
> >>> wireshark 3.4.12 Building
> PATH="/home/builder/output/oc_general/host/bin:/home/builder/output/oc_general/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
>  /usr/bin/make -j17  -C
> /home/builder/output/oc_general/build/wireshark-3.4.12/
> [  0%] Building C object tools/lemon/CMakeFiles/lemon.dir/lemon.c.o
> /home/builder/output/oc_general/host/bin/ccache: invalid option -- 'D'
> Usage:
>     ccache [options]
>     ccache compiler [compiler options]
>     compiler [compiler options]          (via symbolic link)
>
> Common options:
>     -c, --cleanup             delete old files and recalculate size counters
>                               (normally not needed as this is done
>                               automatically)
>     -C, --clear               clear the cache completely (except configuration)
>     -F, --max-files=N         set maximum number of files in cache to N (use 0
>                               for no limit)
>     -M, --max-size=SIZE       set maximum size of cache to SIZE (use 0 for no
>                               limit); available suffixes: k, M, G, T (decimal)
>                               and Ki, Mi, Gi, Ti (binary); default suffix: G
>     -p, --show-config         show current configuration options in
>                               human-readable format
>     -s, --show-stats          show summary of configuration and statistics
>                               counters in human-readable format
>     -z, --zero-stats          zero statistics counters
>
>     -h, --help                print this help text
>     -V, --version             print version and copyright information
>
> Options for scripting or debugging:
>         --dump-manifest=PATH  dump manifest file at PATH in text format
>     -k, --get-config=K        print the value of configuration key K
>         --hash-file=PATH      print the hash (<MD4>-<size>) of the file at PATH
>         --print-stats         print statistics counter IDs and corresponding
>                               values in machine-parsable format
>     -o, --set-config=K=V      set configuration item K to value V
>
> See also <https://ccache.dev>.
> [  0%] Built target cli_main
> make[4]: *** [tools/lemon/CMakeFiles/lemon.dir/build.make:66:
> tools/lemon/CMakeFiles/lemon.dir/lemon.c.o] Error 1
> make[3]: *** [CMakeFiles/Makefile2:10914:
> tools/lemon/CMakeFiles/lemon.dir/all] Error 2
>
> FYI, 2021.02.6 did not exhibit this behavior.

Seems this comes form the configure step:

	[...] /usr/bin/cmake [...] -DLEMON_C_COMPILER=/home/seiderer/Work/Buildroot/build_rpi0w_mesa_v3d_001/host/bin/ccache /usr/bin/gcc [...]


With

--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -25,7 +25,7 @@ WIRESHARK_CONF_OPTS = \
        -DENABLE_ILBC=OFF \
        -DENABLE_PCAP=ON \
        -DENABLE_SMI=OFF \
-       -DLEMON_C_COMPILER=$(HOSTCC)
+       -DLEMON_C_COMPILER="$(HOSTCC)"

 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)


this changes to

	[...] /usr/bin/cmake [...] -DLEMON_C_COMPILER="/home/seiderer/Work/Buildroot/build_rpi0w_mesa_v3d_001/host/bin/ccache /usr/bin/gcc" [...]

but the build fails this time with

[...]
cd .../build/wireshark-3.4.12/tools/lemon && "/home/seiderer/Work/Buildroot/build_rpi0w_mesa_v3d_001/host/bin/ccache /usr/bin/gcc" [...]lemon.c

/bin/sh: line 1: .../host/bin/ccache /usr/bin/gcc: No such file or directory


With

--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -25,7 +25,7 @@ WIRESHARK_CONF_OPTS = \
        -DENABLE_ILBC=OFF \
        -DENABLE_PCAP=ON \
        -DENABLE_SMI=OFF \
-       -DLEMON_C_COMPILER=$(HOSTCC)
+       -DLEMON_C_COMPILER=/usr/bin/gcc

 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)

The build succeeds...

Regards,
Peter


>
> Thanks,
>
> Dan Ambrosio
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
