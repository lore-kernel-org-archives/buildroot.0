Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AAF0D6408D
	for <buildroot@archiver.kernel.org>; Fri,  8 Nov 2024 21:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25E5760873;
	Fri,  8 Nov 2024 21:25:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zU5fp2zMDoN1; Fri,  8 Nov 2024 21:25:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E65526079B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E65526079B;
	Fri,  8 Nov 2024 21:25:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E0D1FD8F
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 21:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C1F2160797
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 21:25:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tl97a1NbyKmM for <buildroot@buildroot.org>;
 Fri,  8 Nov 2024 21:25:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 485816079B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 485816079B
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 485816079B
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 21:25:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id BFF7D78032A;
 Fri,  8 Nov 2024 22:25:34 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:34538])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 08 Nov 2024 22:25:34 +0100
MIME-Version: 1.0
Date: Fri, 08 Nov 2024 22:25:34 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, Martin Kepplinger <martink@posteo.de>, Thomas
 Devoogdt <thomas.devoogdt@barco.com>
In-Reply-To: <20241022204333.2045190-1-thomas@devoogdt.com>
References: <20241022204333.2045190-1-thomas@devoogdt.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <6399601e298573bbf98ee6e18415d530@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731101138;
 bh=BEiPcXyHTtPsjp1/6nrcBGvxy4bD/YWBrYbu5zYQJj8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=utl15zYKrqklYmsQ1PLpiIdLYfetOz9m3MymKVPF1az8ACmHPUADWaZFd7uCjXLNJ
 l8We1jDmzHdgB1GdwLe2kz5HimEpT/Z2LT9541bnNTpmRhSjOBwE0GjXMmPXAnPbC1
 mRwK75ghJVlBU4Soz3nz7hpdBjF74BlUYdIN+9snSMFG5QUiVnmC0YWomJnUlL1C/4
 d1qfdVVDn6c5rhKHFeFc1CBaKnd/5Ug3KHejd3Cs+ZKQtcGMbqOkP9NnCaykOe+zRz
 memAw7Tn6KpzDlENjF/cVSr0Zj4Ejq29+OCDPLkYm94yTS4YX/NgkKixDzpVy5B1vl
 uGy3XdXbFZIuw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=utl15zYK
Subject: Re: [Buildroot] [PATCH v1] package/x11vnc: add and rework compile
 patches
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 22/10/2024 22:43, Thomas Devoogdt wrote:
> From: Thomas Devoogdt <thomas.devoogdt@barco.com>
> 
> Add the "Upstream" field to the patch message for:
>  - 0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
>  - 
> 0002-scan-limit-access-to-shared-memory-segments-to-current-user.patch
> 
> Add a compile patch for GCC >= 10 which enables -fno-common by default.
> 
> Fixes:
>  - 
> https://autobuild.buildroot.org/results/b22/b2231fe06fe56036a5ddbe61cb8556b046e3a7b7/build-end.log
>  - 
> https://autobuild.buildroot.org/results/8af/8afbcc63818d3e1586731e178f16635e773d5600/build-end.log
>  - ...
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>

Applied to master, thanks.

> ---
>  .checkpackageignore                           |  2 -
>  ...ld-on-32bit-arches-with-64bit-time_t.patch |  8 ++--
>  ...-to-shared-memory-segments-to-curre.patch} |  8 ++--
>  .../0003-Fix-build-with-fno-common.patch      | 48 +++++++++++++++++++
>  4 files changed, 58 insertions(+), 8 deletions(-)
>  rename 
> package/x11vnc/{0002-scan-limit-access-to-shared-memory-segments-to-current-user.patch 
> => 0002-scan-limit-access-to-shared-memory-segments-to-curre.patch} 
> (81%)
>  create mode 100644 package/x11vnc/0003-Fix-build-with-fno-common.patch
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index f38b900735..24be828232 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -1364,8 +1364,6 @@ 
> package/x11r7/xdriver_xf86-video-nouveau/0001-nouveau-fixup-driver-for-new-X-ser
>  package/x11r7/xdriver_xf86-video-tdfx/0001-cross.patch 
> lib_patch.Upstream
>  
> package/x11r7/xserver_xorg-server/0001-include-misc.h-fix-uClibc-build.patch 
> lib_patch.Upstream
>  package/x11r7/xserver_xorg-server/S40xorg Shellcheck 
> lib_sysv.Variables
> -package/x11vnc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch 
> lib_patch.Upstream
> -package/x11vnc/0002-scan-limit-access-to-shared-memory-segments-to-current-user.patch 
> lib_patch.Upstream
>  package/xen/0001-9pfs-include-linux-limits.h-for-XATTR_SIZE_MAX.patch 
> lib_patch.Upstream
>  package/xen/0002-Fix-build-with-64-bits-time_t.patch 
> lib_patch.Upstream
>  package/xen/0003-libs-light-fix-tv_sec-printf-format.patch 
> lib_patch.Upstream
> diff --git 
> a/package/x11vnc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch 
> b/package/x11vnc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
> index 87dc3c994f..a9af88e55d 100644
> --- 
> a/package/x11vnc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
> +++ 
> b/package/x11vnc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
> @@ -1,4 +1,4 @@
> -From daecf59cc8b294265666482a4766aaa3148c308b Mon Sep 17 00:00:00 2001
> +From 8ca0465fda181bd20e5d30c36fb2aea56ed27b6b Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Sat, 30 Nov 2019 11:43:32 -0800
>  Subject: [PATCH] Fix build on 32bit arches with 64bit time_t
> @@ -8,8 +8,7 @@ input.h [1]
> 
>  [1] 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=152194fe9c3f
> 
> -[Retrieved from:
> -https://github.com/LibVNC/x11vnc/commit/daecf59cc8b294265666482a4766aaa3148c308b]
> +Upstream: 
> https://github.com/LibVNC/x11vnc/commit/daecf59cc8b294265666482a4766aaa3148c308b
>  Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>  ---
>   src/uinput.c | 25 +++++++++++++++++++++----
> @@ -107,3 +106,6 @@ index 28fbad3..d71bcde 100644
>   	ev.type = EV_KEY;
>   	ev.code = (unsigned char) scancode;
>   	ev.value = down;
> +--
> +2.43.0
> +
> diff --git 
> a/package/x11vnc/0002-scan-limit-access-to-shared-memory-segments-to-current-user.patch 
> b/package/x11vnc/0002-scan-limit-access-to-shared-memory-segments-to-curre.patch
> similarity index 81%
> rename from 
> package/x11vnc/0002-scan-limit-access-to-shared-memory-segments-to-current-user.patch
> rename to 
> package/x11vnc/0002-scan-limit-access-to-shared-memory-segments-to-curre.patch
> index e4dbdf1894..05977375d8 100644
> --- 
> a/package/x11vnc/0002-scan-limit-access-to-shared-memory-segments-to-current-user.patch
> +++ 
> b/package/x11vnc/0002-scan-limit-access-to-shared-memory-segments-to-curre.patch
> @@ -1,10 +1,9 @@
> -From 69eeb9f7baa14ca03b16c9de821f9876def7a36a Mon Sep 17 00:00:00 2001
> +From 3870280eca9c10a3607440209e9caf6d7749e379 Mon Sep 17 00:00:00 2001
>  From: =?UTF-8?q?Gu=C3=A9nal=20DAVALAN?= <guenal.davalan@uca.fr>
>  Date: Wed, 18 Nov 2020 08:40:45 +0100
>  Subject: [PATCH] scan: limit access to shared memory segments to 
> current user
> 
> -[Retrieved from:
> -https://github.com/LibVNC/x11vnc/commit/69eeb9f7baa14ca03b16c9de821f9876def7a36a]
> +Upstream: 
> https://github.com/LibVNC/x11vnc/commit/69eeb9f7baa14ca03b16c9de821f9876def7a36a
>  Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>  ---
>   src/scan.c | 2 +-
> @@ -23,3 +22,6 @@ index 43e00d2..12994d5 100644
> 
>   	if (shm->shmid == -1) {
>   		rfbErr("shmget(%s) failed.\n", name);
> +--
> +2.43.0
> +
> diff --git a/package/x11vnc/0003-Fix-build-with-fno-common.patch 
> b/package/x11vnc/0003-Fix-build-with-fno-common.patch
> new file mode 100644
> index 0000000000..eccfd3872a
> --- /dev/null
> +++ b/package/x11vnc/0003-Fix-build-with-fno-common.patch
> @@ -0,0 +1,48 @@
> +From 08d57adf499264fcd32461a4092cd799c474d669 Mon Sep 17 00:00:00 2001
> +From: Alexander Tsoy <alexander@tsoy.me>
> +Date: Tue, 28 Jan 2020 22:21:01 +0300
> +Subject: [PATCH] Fix build with -fno-common
> +
> +GCC 10 defaults to -fno-common
> +
> +Upstream: 
> https://github.com/LibVNC/x11vnc/commit/a48b0b1cd887d7f3ae67f525d7d334bd2feffe60
> +Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> +---
> + src/util.c | 3 +++
> + src/util.h | 6 +++---
> + 2 files changed, 6 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/util.c b/src/util.c
> +index a82a1a4..6a52ebf 100644
> +--- a/src/util.c
> ++++ b/src/util.c
> +@@ -47,6 +47,9 @@ int hxl = 0;
> + #ifdef LIBVNCSERVER_HAVE_LIBPTHREAD
> + MUTEX(x11Mutex);
> + MUTEX(scrollMutex);
> ++MUTEX(clientMutex);
> ++MUTEX(inputMutex);
> ++MUTEX(pointerMutex);
> + #endif
> +
> + int nfix(int i, int n);
> +diff --git a/src/util.h b/src/util.h
> +index 35c1afd..99b5dd1 100644
> +--- a/src/util.h
> ++++ b/src/util.h
> +@@ -102,9 +102,9 @@ extern struct timeval _mysleep;
> + #ifdef LIBVNCSERVER_HAVE_LIBPTHREAD
> + extern MUTEX(x11Mutex);
> + extern MUTEX(scrollMutex);
> +-MUTEX(clientMutex);
> +-MUTEX(inputMutex);
> +-MUTEX(pointerMutex);
> ++extern MUTEX(clientMutex);
> ++extern MUTEX(inputMutex);
> ++extern MUTEX(pointerMutex);
> + #endif
> +
> + #define X_INIT INIT_MUTEX(x11Mutex)
> +--
> +2.43.0
> +
> --
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
