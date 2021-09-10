Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A230C433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 07:11:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14AB0611B0
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 07:11:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 14AB0611B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1F95606AA;
	Fri, 10 Sep 2021 07:11:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SXcJGRZrEU_b; Fri, 10 Sep 2021 07:11:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D77D66068B;
	Fri, 10 Sep 2021 07:10:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 98AD11BF2F5
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 07:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92BC583032
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 07:10:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=ideasonboard.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3_h4vDyN7ak2 for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 07:10:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 27E128301F
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 07:10:56 +0000 (UTC)
Received: from [192.168.0.20]
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD26B883;
 Fri, 10 Sep 2021 09:10:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1631257854;
 bh=+qv7T3OHjmwp5Bezwk72IIVdJ11NLpbEKgyVqwqgX5E=;
 h=From:Subject:To:References:Date:In-Reply-To:From;
 b=n6OJqyVtBYx/yd8h69sEWyeFmVUMpE9jDGUUIJJ7eJCnrbTMFVERIw1Cb1A2+hBfP
 0EDaktC/zhXqtz3MTNgQ+FI98ojtTWAHrPpwcCneQjcO3OjrxkWpKevdhQ2upMetA0
 YAx9s7w4IT9tWgDm5XDLykpGTEqgCxX5v59fxD34=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20210909235635.2987074-1-james.hilliard1@gmail.com>
Message-ID: <a3e49ad8-34b4-fab9-5daf-5f921641c07f@ideasonboard.com>
Date: Fri, 10 Sep 2021 08:10:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210909235635.2987074-1-james.hilliard1@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/libcamera: bump to version
 e355ca0087cd93ef80f74c61018e9e9228a93313
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hi James,

On 10/09/2021 00:56, James Hilliard wrote:
> Drop patch that is now upstream.
> 

Great, I'd been meaning to get this updated too.

There's actually a couple of fixes in the tree now that will solve other
build failures that I've had reports from buildroot with.

So lets see if this helps reduce the ci noise.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com.



> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...ra-add-dependencies-to-libcamera_dep.patch | 37 -------------------
>  package/libcamera/libcamera.hash              |  2 +-
>  package/libcamera/libcamera.mk                |  2 +-
>  3 files changed, 2 insertions(+), 39 deletions(-)
>  delete mode 100644 package/libcamera/0001-libcamera-add-dependencies-to-libcamera_dep.patch
> 
> diff --git a/package/libcamera/0001-libcamera-add-dependencies-to-libcamera_dep.patch b/package/libcamera/0001-libcamera-add-dependencies-to-libcamera_dep.patch
> deleted file mode 100644
> index aa8d659cf3..0000000000
> --- a/package/libcamera/0001-libcamera-add-dependencies-to-libcamera_dep.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From 1a2fd4526e0858827f47a7e9359df34f0d0e3108 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Thu, 27 May 2021 21:00:21 +0200
> -Subject: [PATCH] libcamera: add dependencies to libcamera_dep
> -
> -Add dependencies to libcamera_dep to avoid the following build failure
> -with qcam on sparc v8 which is raised since commit
> -a8310248fc26cc1e1b791af5e9394c1d20bee269:
> -
> -FAILED: src/qcam/qcam
> -/srv/storage/autobuild/run/instance-0/output-1/host/bin/sparc-linux-g++  -o src/qcam/qcam src/qcam/qcam.p/meson-generated_.._qt5-feathericons_qrc.cpp.o src/qcam/qcam.p/meson-generated_moc_main_window.cpp.o src/qcam/qcam.p/meson-generated_moc_viewfinder_qt.cpp.o src/qcam/qcam.p/.._cam_options.cpp.o src/qcam/qcam.p/.._cam_stream_options.cpp.o src/qcam/qcam.p/format_converter.cpp.o src/qcam/qcam.p/main.cpp.o src/qcam/qcam.p/main_window.cpp.o src/qcam/qcam.p/message_handler.cpp.o src/qcam/qcam.p/viewfinder_qt.cpp.o src/qcam/qcam.p/dng_writer.cpp.o -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 -Wshadow -include config.h '-Wl,-rpath,$ORIGIN/../libcamera' -Wl,-rpath-link,/srv/storage/autobuild/run/instance-0/output-1/build/libcamera-3a1f67a8031ac5ad96a11d5dc8b2e8976290497b/build/src/libcamera -Wl,--start-group src/libcamera/libcamera.so /srv/storage/autobuild/run/instance-0/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libQt5Core.so /srv/storage/autobuild/run/instance-0/output-
 1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libQt5Gui.so /srv/storage/autobuild/run/instance-0/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libQt5Widgets.so /srv/storage/autobuild/run/instance-0/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libtiff.so -Wl,--end-group
> -/srv/storage/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: src/qcam/qcam.p/main_window.cpp.o: undefined reference to symbol '__atomic_fetch_add_4@@LIBATOMIC_1.0'
> -/srv/storage/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /srv/storage/autobuild/run/instance-0/output-1/host/sparc-buildroot-linux-uclibc/sysroot/lib/libatomic.so.1: error adding symbols: DSO missing from command line
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/d0726b2253f1f3d006e057f3b32c646c4b9b5f7a
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status: https://bugs.libcamera.org/show_bug.cgi?id=39]
> ----
> - src/libcamera/meson.build | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/src/libcamera/meson.build b/src/libcamera/meson.build
> -index cc2b8669..af3533ad 100644
> ---- a/src/libcamera/meson.build
> -+++ b/src/libcamera/meson.build
> -@@ -160,6 +160,7 @@ libcamera_dep = declare_dependency(sources : [
> -                                        libcamera_public_headers,
> -                                    ],
> -                                    include_directories : libcamera_includes,
> -+                                   dependencies : libcamera_deps,
> -                                    link_with : libcamera)
> - 
> - subdir('proxy/worker')
> --- 
> -2.30.2
> diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
> index 78197b9aeb..52c584bc16 100644
> --- a/package/libcamera/libcamera.hash
> +++ b/package/libcamera/libcamera.hash
> @@ -1,4 +1,4 @@
> -sha256  fa9efe38397392a338c0ed9d0bf3ac1480d4d1c96b0597e422f8b9fb36f43398  libcamera-3a1f67a8031ac5ad96a11d5dc8b2e8976290497b-br1.tar.gz
> +sha256  a5ed581416719b914140eda76ca8a4e0e9c944b859f8fb018fc17497278c5ae1  libcamera-e355ca0087cd93ef80f74c61018e9e9228a93313-br1.tar.gz
>  
>  # license files
>  sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> index 11a6961da5..677da8ac4c 100644
> --- a/package/libcamera/libcamera.mk
> +++ b/package/libcamera/libcamera.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
> -LIBCAMERA_VERSION = 3a1f67a8031ac5ad96a11d5dc8b2e8976290497b
> +LIBCAMERA_VERSION = e355ca0087cd93ef80f74c61018e9e9228a93313
>  LIBCAMERA_SITE_METHOD = git
>  LIBCAMERA_DEPENDENCIES = \
>  	host-openssl \
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
