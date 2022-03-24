Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A896C433F5
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 19:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8B8A84468;
	Thu, 24 Mar 2022 19:39:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PqoIQMGtEkul; Thu, 24 Mar 2022 19:39:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C40C88429E;
	Thu, 24 Mar 2022 19:39:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CC8CF1BF379
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 19:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8128608B7
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 19:39:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZEmGPkuX_v7K for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 19:39:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 450AA60759
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 19:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1648150773;
 bh=tIOm/BhONTNsAKzz0pf2xHgJCjOx4f3/PpAi8+8EPJQ=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=EJCz+UJWCPaW989yPLbHmcmI3TETTczghsq2ZaeBqYUC/2INzYfo5XqLco0pwU1dp
 Xso0f2QTUr6B2YlFr8NvounNWf8NHlQuGoac3bI8otyqOVgst3Ll+R3cOw9AyFGzgq
 A4SdAuTGbnWlEwSo6WcOUtsfVX6Oo6HCb0bZJrv4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.123]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MdebB-1o6o7g2B9t-00ZjPK; Thu, 24
 Mar 2022 20:39:33 +0100
Date: Thu, 24 Mar 2022 20:39:32 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Dan Ambrosio via buildroot <buildroot@buildroot.org>
Message-ID: <20220324203932.73119c70@gmx.net>
In-Reply-To: <20220324203515.5eeb9584@gmx.net>
References: <CAAKqzUSn-LBNag6UMxYbzL=1Yi0KgF+9OA0BmgMPN99VOTKJog@mail.gmail.com>
 <20220324203515.5eeb9584@gmx.net>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:tM73Q6CfDTDEGc6fy6pn25d2hVvBOpUJPtKc4KQXWOqEEn+kovC
 kCcTT78qMsAIjnrVnEAB92UvWOruc+jNGMmvUwUKhjAOSDv6pQipADWeCM6AZnojIaTnzMI
 HMR81lvx3PwPpvmOlPYkPoQHAtgOPh08EPuVyD1IJuVeqy+vjSD6WLIR/dPJBhsB/uyd/hK
 qbfnb46L/fyspnS6trH4w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rmZEtxLni3c=:mFyncpNguk3Btx+Xgh/kyL
 6msRqOoVvbGLlJzkPC42H1+RKxjsdFiUAwLxyv4W7N5na2Pn1pL9FkvqcbkXAAZ9Fuz9Wzh17
 uUOV9oMhw5dlkobWQwL2usWpIVeI3vM6pQ3mPkhBU1YvVt7pHY7e5zIXEaYD6C/vpLVXHaqYM
 zKGtDRbJmf2cihLpO50qsYK0xyA5CpWeJ3WTKt4Y0Wk6bkRkjbQ2ZFpj2mHLiDYBpuGep38+P
 GW/nrhTeWen7ZQy4QNhGGehT5F8dSwWRT1LbJ9IhuccqD7ROGtYTrbncQhjPk2tLpmqLv7QdS
 EMkI++i701d5ags/qI79AeQ3vFk3htA3yMYyFCDPfbnsp/5R1fQRTH2xYrXP8qgONA9YPGUIO
 Ac+vHfR3fYs3+lsm4iDYBW2fXdnRUxsB4Dlv0lyaz2JdelB5hMKGthUkgVyrpzdTQ/rsbn5hm
 y/09bPFnmhveGhG2+2GOkc8vyYR6/PC1B8nHnO1PRyGhmymSCC5tzMVNKUoZKoX5p4J1sJWcT
 YnDpBXy/cDvRslxpVm/lchzj6JK/OF+M9vWSPgC+Z937mzymvKlmxQdsX3sqJx1aMirfgTpIi
 vpS/qejObMhshCGOyqtXk+Yt98tieECcOT9Shm3snMMTEhlDbC4OIx9Zz/OsNtHQD8EihG7sw
 0fdn3JhZpgGta6FcvpZx66vG9Ni4HxQ/Le8rk1HIzqPcMAHGNVPCXls5KsA09uUnBP5f9ySD5
 9Gz/bzLu0eQsyZDeoB/Amw4dlDV5auWE+8vArV3Wk7AIims0xvMMT3hmUM1kqkG9nIO3tQFod
 dPe8uE72XTwcSG1+dCzH2WgUI1Zk7t90xibug3IcOWUg+ZFf7X8VpXFxdwQwkK+3S7MMYhwRI
 tUAoGSDh7vdt28hnwGP/jDIaig8aZYbTmPEEL7A1ma0VnjPqvbKIfDdWc8h6G4wL46WuCqFoN
 srJXHl5EtdyF28Jv5ykmueeJ0X9/yzD9UON/gtIUdbaHdoxx5ODIWQvpH/ISc3OLcmfOt5uFK
 SOD7UwD5ETd3VGbl9HKUDffD620ci2r+80i1JgN0HQkN1ZyDIAL0GsaPTOFDMbvBCwLI/lUvp
 cX3r+TyWpWWuVM=
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

On Thu, 24 Mar 2022 20:35:15 +0100, Peter Seiderer <ps.report@gmx.net> wrote:

> Hello Dan,
>
> On Thu, 24 Mar 2022 09:38:04 -0600, Dan Ambrosio via buildroot <buildroot@buildroot.org> wrote:
>
> > Hello,
> > I recently upgraded my buildroot project from 2021.02.6 to the latest
> > LTS (2022.02) and ran into a compilation error with the wireshark
> > package when BR2_CCACHE is enabled.
> >
> > It seems like a cmake argument is being passed through to ccache.
> >
> > >>> wireshark 3.4.12 Building
> > PATH="/home/builder/output/oc_general/host/bin:/home/builder/output/oc_general/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
> >  /usr/bin/make -j17  -C
> > /home/builder/output/oc_general/build/wireshark-3.4.12/
> > [  0%] Building C object tools/lemon/CMakeFiles/lemon.dir/lemon.c.o
> > /home/builder/output/oc_general/host/bin/ccache: invalid option -- 'D'
> > Usage:
> >     ccache [options]
> >     ccache compiler [compiler options]
> >     compiler [compiler options]          (via symbolic link)
> >
> > Common options:
> >     -c, --cleanup             delete old files and recalculate size counters
> >                               (normally not needed as this is done
> >                               automatically)
> >     -C, --clear               clear the cache completely (except configuration)
> >     -F, --max-files=N         set maximum number of files in cache to N (use 0
> >                               for no limit)
> >     -M, --max-size=SIZE       set maximum size of cache to SIZE (use 0 for no
> >                               limit); available suffixes: k, M, G, T (decimal)
> >                               and Ki, Mi, Gi, Ti (binary); default suffix: G
> >     -p, --show-config         show current configuration options in
> >                               human-readable format
> >     -s, --show-stats          show summary of configuration and statistics
> >                               counters in human-readable format
> >     -z, --zero-stats          zero statistics counters
> >
> >     -h, --help                print this help text
> >     -V, --version             print version and copyright information
> >
> > Options for scripting or debugging:
> >         --dump-manifest=PATH  dump manifest file at PATH in text format
> >     -k, --get-config=K        print the value of configuration key K
> >         --hash-file=PATH      print the hash (<MD4>-<size>) of the file at PATH
> >         --print-stats         print statistics counter IDs and corresponding
> >                               values in machine-parsable format
> >     -o, --set-config=K=V      set configuration item K to value V
> >
> > See also <https://ccache.dev>.
> > [  0%] Built target cli_main
> > make[4]: *** [tools/lemon/CMakeFiles/lemon.dir/build.make:66:
> > tools/lemon/CMakeFiles/lemon.dir/lemon.c.o] Error 1
> > make[3]: *** [CMakeFiles/Makefile2:10914:
> > tools/lemon/CMakeFiles/lemon.dir/all] Error 2
> >
> > FYI, 2021.02.6 did not exhibit this behavior.
>
> Seems this comes form the configure step:
>
> 	[...] /usr/bin/cmake [...] -DLEMON_C_COMPILER=/home/seiderer/Work/Buildroot/build_rpi0w_mesa_v3d_001/host/bin/ccache /usr/bin/gcc [...]
>
>
> With
>
> --- a/package/wireshark/wireshark.mk
> +++ b/package/wireshark/wireshark.mk
> @@ -25,7 +25,7 @@ WIRESHARK_CONF_OPTS = \
>         -DENABLE_ILBC=OFF \
>         -DENABLE_PCAP=ON \
>         -DENABLE_SMI=OFF \
> -       -DLEMON_C_COMPILER=$(HOSTCC)
> +       -DLEMON_C_COMPILER="$(HOSTCC)"
>
>  ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
>
>
> this changes to
>
> 	[...] /usr/bin/cmake [...] -DLEMON_C_COMPILER="/home/seiderer/Work/Buildroot/build_rpi0w_mesa_v3d_001/host/bin/ccache /usr/bin/gcc" [...]
>
> but the build fails this time with
>
> [...]
> cd .../build/wireshark-3.4.12/tools/lemon && "/home/seiderer/Work/Buildroot/build_rpi0w_mesa_v3d_001/host/bin/ccache /usr/bin/gcc" [...]lemon.c
>
> /bin/sh: line 1: .../host/bin/ccache /usr/bin/gcc: No such file or directory
>
>
> With
>
> --- a/package/wireshark/wireshark.mk
> +++ b/package/wireshark/wireshark.mk
> @@ -25,7 +25,7 @@ WIRESHARK_CONF_OPTS = \
>         -DENABLE_ILBC=OFF \
>         -DENABLE_PCAP=ON \
>         -DENABLE_SMI=OFF \
> -       -DLEMON_C_COMPILER=$(HOSTCC)
> +       -DLEMON_C_COMPILER=/usr/bin/gcc
>
>  ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
>
> The build succeeds...

Or better:

--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -25,7 +25,7 @@ WIRESHARK_CONF_OPTS = \
        -DENABLE_ILBC=OFF \
        -DENABLE_PCAP=ON \
        -DENABLE_SMI=OFF \
-       -DLEMON_C_COMPILER=$(HOSTCC)
+       -DLEMON_C_COMPILER=$(HOSTCC_NOCCACHE)

 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 WIRESHARK_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic

Regards,
Peter

>
> Regards,
> Peter
>
>
> >
> > Thanks,
> >
> > Dan Ambrosio
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
