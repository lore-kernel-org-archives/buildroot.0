Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A7D7C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 19:49:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB35B61151
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 19:49:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB35B61151
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 706B5400CC;
	Sun, 17 Oct 2021 19:49:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 32_L95Kz-O45; Sun, 17 Oct 2021 19:49:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BD8540173;
	Sun, 17 Oct 2021 19:49:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C168E1BF59C
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 19:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AFE834017C
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 19:49:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FT5Qv5cZsuRN for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 19:49:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A09C40160
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 19:49:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4430:5ced:ec21:1036])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 46986780346;
 Sun, 17 Oct 2021 21:49:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634500182;
 bh=rrGNvJc4P5jry4a2jZvClwD+fM7oSPg1l8GoC0C964I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lemgMklrE0bvuY6iRFhe4ab1405j6zFMGunGiJspr2wT9xrvwATytbOajfwtgvP12
 XDnk6DJ5rX8LIK5Y/ufzZh2Ph8Y+lQNJgvz36ig7HLrZjlidgNuSmpqBuEhpTXmBrS
 dG2n8rUTv8JGGA52xJNqbQnfz5QupKfgXBOUF3dXQaUib9hWHoPICtE6fk5c0j6Suk
 WoLpedTXDxc74e7sKBFjnqgo9J7rNf8vZiwfDbeQzMPNJvYM6IIr/4G4vqGx+e3s6/
 QF4E1sKYCz7J+5sUy5ikxVJsMVxTNh+aqhUY0IimasORTjYxG2QS/lmTnfkp+VcpRu
 CV61NKK/6FtZA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Oct 2021 21:49:37 +0200
Date: Sun, 17 Oct 2021 21:49:37 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20211017194937.GI2400@scaer>
References: <20210912140658.253602-1-romain.naour@gmail.com>
 <20210912141140.253778-10-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210912141140.253778-10-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 12/16] package/qemu: bump to version 6.1.0
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Romain, All,

On 2021-09-12 16:11 +0200, Romain Naour spake thusly:
> Remove upstream patches.
> Drop 0003-meson-add-tests-option.patch and disable the fp-bench build by default [1]
> 
> Qemu now requires at least gcc 7.x to build.
> 
> Disable optional dependency for eBPF RSS loader.
> 
> See:
> https://wiki.qemu.org/ChangeLog/6.1#Build_Information
> 
> [1] https://lists.nongnu.org/archive/html/qemu-devel/2021-03/msg00947.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> This version bump will break test_ubi since it requires qemu 2.8.0 to pass (due to a qemu bug).
> The test will be updated/fixed in the follow-up commits.
> ---
>  .../0002-Fix-build-with-64-bits-time_t.patch  | 98 -------------------
>  ...fp-disable-fp-bench-build-by-default.patch | 28 ++++++
>  ....c-fix-fuse-lseek-on-uclibc-or-musl.patch} |  0
>  .../qemu/0003-meson-add-tests-option.patch    | 94 ------------------
>  .../0004-Makefile-ignore-long-options.patch   | 41 --------
>  ...5-block-export-fuse.c-fix-musl-build.patch | 46 ---------
>  package/qemu/Config.in                        |  6 +-
>  package/qemu/Config.in.host                   |  5 +-
>  package/qemu/qemu.hash                        |  2 +-
>  package/qemu/qemu.mk                          |  6 +-
>  10 files changed, 37 insertions(+), 289 deletions(-)
>  delete mode 100644 package/qemu/0002-Fix-build-with-64-bits-time_t.patch
>  create mode 100644 package/qemu/0002-tests-fp-disable-fp-bench-build-by-default.patch
>  rename package/qemu/{0006-block-export-fuse.c-fix-fuse-lseek-on-uclibc-or-musl.patch => 0003-block-export-fuse.c-fix-fuse-lseek-on-uclibc-or-musl.patch} (100%)
>  delete mode 100644 package/qemu/0003-meson-add-tests-option.patch
>  delete mode 100644 package/qemu/0004-Makefile-ignore-long-options.patch
>  delete mode 100644 package/qemu/0005-block-export-fuse.c-fix-musl-build.patch
> 
> diff --git a/package/qemu/0002-Fix-build-with-64-bits-time_t.patch b/package/qemu/0002-Fix-build-with-64-bits-time_t.patch
> deleted file mode 100644
> index 934c0e28fd..0000000000
> --- a/package/qemu/0002-Fix-build-with-64-bits-time_t.patch
> +++ /dev/null
> @@ -1,98 +0,0 @@
> -From 839e51aa452345b440f8d2d0df84ab58bdedfcd1 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Sat, 14 Nov 2020 21:54:17 +0100
> -Subject: [PATCH] Fix build with 64 bits time_t
> -
> -time element is deprecated on new input_event structure in kernel's
> -input.h [1]
> -
> -This will avoid the following build failure:
> -
> -hw/input/virtio-input-host.c: In function 'virtio_input_host_handle_status':
> -hw/input/virtio-input-host.c:198:28: error: 'struct input_event' has no member named 'time'
> -  198 |     if (gettimeofday(&evdev.time, NULL)) {
> -      |                            ^
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/a538167e288c14208d557cd45446df86d3d599d5
> - - http://autobuild.buildroot.org/results/efd4474fb4b6c0ce0ab3838ce130429c51e43bbb
> -
> -[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=152194fe9c3f
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - contrib/vhost-user-input/main.c | 10 +++++++++-
> - hw/input/virtio-input-host.c    | 10 +++++++++-
> - 2 files changed, 18 insertions(+), 2 deletions(-)
> -
> -diff --git a/contrib/vhost-user-input/main.c b/contrib/vhost-user-input/main.c
> -index 6020c6f33a..e688c3e0a9 100644
> ---- a/contrib/vhost-user-input/main.c
> -+++ b/contrib/vhost-user-input/main.c
> -@@ -15,6 +15,11 @@
> - #include "standard-headers/linux/virtio_input.h"
> - #include "qapi/error.h"
> - 
> -+#ifndef input_event_sec
> -+#define input_event_sec time.tv_sec
> -+#define input_event_usec time.tv_usec
> -+#endif
> -+
> - enum {
> -     VHOST_USER_INPUT_MAX_QUEUES = 2,
> - };
> -@@ -113,13 +118,16 @@ vi_evdev_watch(VuDev *dev, int condition, void *data)
> - static void vi_handle_status(VuInput *vi, virtio_input_event *event)
> - {
> -     struct input_event evdev;
> -+    struct timeval tval;
> -     int rc;
> - 
> --    if (gettimeofday(&evdev.time, NULL)) {
> -+    if (gettimeofday(&tval, NULL)) {
> -         perror("vi_handle_status: gettimeofday");
> -         return;
> -     }
> - 
> -+    evdev.input_event_sec = tval.tv_sec;
> -+    evdev.input_event_usec = tval.tv_usec;
> -     evdev.type = le16toh(event->type);
> -     evdev.code = le16toh(event->code);
> -     evdev.value = le32toh(event->value);
> -diff --git a/hw/input/virtio-input-host.c b/hw/input/virtio-input-host.c
> -index 85daf73f1a..2e261737e1 100644
> ---- a/hw/input/virtio-input-host.c
> -+++ b/hw/input/virtio-input-host.c
> -@@ -16,6 +16,11 @@
> - #include <sys/ioctl.h>
> - #include "standard-headers/linux/input.h"
> - 
> -+#ifndef input_event_sec
> -+#define input_event_sec time.tv_sec
> -+#define input_event_usec time.tv_usec
> -+#endif
> -+
> - /* ----------------------------------------------------------------- */
> - 
> - static struct virtio_input_config virtio_input_host_config[] = {
> -@@ -193,13 +198,16 @@ static void virtio_input_host_handle_status(VirtIOInput *vinput,
> - {
> -     VirtIOInputHost *vih = VIRTIO_INPUT_HOST(vinput);
> -     struct input_event evdev;
> -+    struct timeval tval;
> -     int rc;
> - 
> --    if (gettimeofday(&evdev.time, NULL)) {
> -+    if (gettimeofday(&tval, NULL)) {
> -         perror("virtio_input_host_handle_status: gettimeofday");
> -         return;
> -     }
> - 
> -+    evdev.input_event_sec = tval.tv_sec;
> -+    evdev.input_event_usec = tval.tv_usec;
> -     evdev.type = le16_to_cpu(event->type);
> -     evdev.code = le16_to_cpu(event->code);
> -     evdev.value = le32_to_cpu(event->value);
> --- 
> -2.29.2
> -
> diff --git a/package/qemu/0002-tests-fp-disable-fp-bench-build-by-default.patch b/package/qemu/0002-tests-fp-disable-fp-bench-build-by-default.patch
> new file mode 100644
> index 0000000000..9bc8d43d59
> --- /dev/null
> +++ b/package/qemu/0002-tests-fp-disable-fp-bench-build-by-default.patch
> @@ -0,0 +1,28 @@
> +From f82238299d3c4cd23ca60cfc0cf4271f5c860873 Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@gmail.com>
> +Date: Wed, 25 Aug 2021 21:55:53 +0200
> +Subject: [PATCH] tests/fp: disable fp-bench build by default
> +
> +Fixes:
> +https://lists.nongnu.org/archive/html/qemu-devel/2021-03/msg00947.html
> +
> +Signed-off-by: Romain Naour <romain.naour@gmail.com>
> +---
> + tests/fp/meson.build | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/tests/fp/meson.build b/tests/fp/meson.build
> +index 07e2cdc8d2..c96460b7f1 100644
> +--- a/tests/fp/meson.build
> ++++ b/tests/fp/meson.build
> +@@ -631,6 +631,7 @@ fpbench = executable(
> +   dependencies: [qemuutil],
> +   include_directories: [sfinc, include_directories(tfdir)],
> +   c_args: fpcflags,
> ++  build_by_default: false,
> + )
> + 
> + fptestlog2 = executable(
> +-- 
> +2.31.1
> +
> diff --git a/package/qemu/0006-block-export-fuse.c-fix-fuse-lseek-on-uclibc-or-musl.patch b/package/qemu/0003-block-export-fuse.c-fix-fuse-lseek-on-uclibc-or-musl.patch
> similarity index 100%
> rename from package/qemu/0006-block-export-fuse.c-fix-fuse-lseek-on-uclibc-or-musl.patch
> rename to package/qemu/0003-block-export-fuse.c-fix-fuse-lseek-on-uclibc-or-musl.patch
> diff --git a/package/qemu/0003-meson-add-tests-option.patch b/package/qemu/0003-meson-add-tests-option.patch
> deleted file mode 100644
> index b52a7aaf2f..0000000000
> --- a/package/qemu/0003-meson-add-tests-option.patch
> +++ /dev/null
> @@ -1,94 +0,0 @@
> -From c24f6cc8f847a4f90cd8fe0f94604862c5ac4a5e Mon Sep 17 00:00:00 2001
> -From: Romain Naour <romain.naour@gmail.com>
> -Date: Mon, 21 Dec 2020 22:12:14 +0100
> -Subject: [PATCH] meson: add tests option
> -
> -tests/fp/fp-bench.c use fenv.h that is not always provided
> -by the libc (uClibc).
> -
> -To workaround this issue, add an new meson option to
> -disable tests while building Qemu.
> -
> -Fixes:
> -http://autobuild.buildroot.net/results/53f5d8baa994d599b9da013ee643b82353366ec3/build-end.log
> -
> -Signed-off-by: Romain Naour <romain.naour@gmail.com>
> -Signed-off-by: Adam Duskett <aduskett@gmail.com>
> -Refresh for 6.0.0
> ----
> - configure         | 7 +++++++
> - meson.build       | 5 ++++-
> - meson_options.txt | 2 ++
> - 3 files changed, 13 insertions(+), 1 deletion(-)
> -
> -diff --git a/configure b/configure
> -index 18c26e0389..7cceae4418 100755
> ---- a/configure
> -+++ b/configure
> -@@ -460,6 +460,7 @@ meson=""
> - ninja=""
> - skip_meson=no
> - gettext="auto"
> -+tests="auto"
> - fuse="auto"
> - fuse_lseek="auto"
> - multiprocess="auto"
> -@@ -1549,6 +1550,10 @@ for opt do
> -   ;;
> -   --disable-libdaxctl) libdaxctl=no
> -   ;;
> -+  --disable-tests) tests="disabled"
> -+  ;;
> -+  --enable-tests) tests="enabled"
> -+  ;;
> -   --enable-fuse) fuse="enabled"
> -   ;;
> -   --disable-fuse) fuse="disabled"
> -@@ -1915,6 +1920,7 @@ disabled with --disable-FEATURE, default is enabled if available
> -   xkbcommon       xkbcommon support
> -   rng-none        dummy RNG, avoid using /dev/(u)random and getrandom()
> -   libdaxctl       libdaxctl support
> -+  tests           build tests
> -   fuse            FUSE block device export
> -   fuse-lseek      SEEK_HOLE/SEEK_DATA support for FUSE exports
> -   multiprocess    Out of process device emulation support
> -@@ -6422,6 +6428,7 @@ NINJA=$ninja $meson setup \
> -         -Dzstd=$zstd -Dseccomp=$seccomp -Dvirtfs=$virtfs -Dcap_ng=$cap_ng \
> -         -Dattr=$attr -Ddefault_devices=$default_devices \
> -         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
> -+        -Dtests=$tests \
> -         -Dvhost_user_blk_server=$vhost_user_blk_server -Dmultiprocess=$multiprocess \
> -         -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek -Dguest_agent_msi=$guest_agent_msi \
> -         $(if test "$default_features" = no; then echo "-Dauto_features=disabled"; fi) \
> -diff --git a/meson.build b/meson.build
> -index e3386196ba..7f4efdc347 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -2381,7 +2381,10 @@ subdir('scripts')
> - subdir('tools')
> - subdir('pc-bios')
> - subdir('docs')
> --subdir('tests')
> -+if get_option('tests').enabled()
> -+  subdir('tests')
> -+endif
> -+
> - if gtk.found()
> -   subdir('po')
> - endif
> -diff --git a/meson_options.txt b/meson_options.txt
> -index f6f64785fe..81bffbfe87 100644
> ---- a/meson_options.txt
> -+++ b/meson_options.txt
> -@@ -111,6 +111,8 @@ option('fuse_lseek', type : 'feature', value : 'auto',
> - 
> - option('vhost_user_blk_server', type: 'feature', value: 'auto',
> -        description: 'build vhost-user-blk server')
> -+option('tests', type : 'feature', value : 'auto',
> -+       description: 'Tests build support')
> - option('virtfs', type: 'feature', value: 'auto',
> -        description: 'virtio-9p support')
> - option('virtiofsd', type: 'feature', value: 'auto',
> --- 
> -2.29.2
> -
> diff --git a/package/qemu/0004-Makefile-ignore-long-options.patch b/package/qemu/0004-Makefile-ignore-long-options.patch
> deleted file mode 100644
> index 2d14b70c03..0000000000
> --- a/package/qemu/0004-Makefile-ignore-long-options.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From 14833e24dea49303ebc2464813601054b6cdfcac Mon Sep 17 00:00:00 2001
> -From: Alexey Neyman <stilor@att.net>
> -Date: Wed, 21 Jul 2021 19:08:46 -0700
> -Subject: [PATCH] Makefile: ignore long options
> -
> -When searching for options like -n in MAKEFLAGS, current code may result
> -in a false positive match when make is invoked with long options like
> ---no-print-directory. This has been observed with certain versions of
> -host make (e.g. 3.82) while building the Qemu package in buildroot.
> -
> -Filter out such long options before searching for one-character options.
> -
> -Signed-off-by: Alexey Neyman <stilor@att.net>
> -Message-Id: <20210722020846.3678817-1-stilor@att.net>
> -Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ----
> - Makefile | 8 +++++---
> - 1 file changed, 5 insertions(+), 3 deletions(-)
> -
> -diff --git a/Makefile b/Makefile
> -index 6c36330eef..401c623a65 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -129,9 +129,11 @@ endif
> - # 4. Rules to bridge to other makefiles
> - 
> - ifneq ($(NINJA),)
> --MAKE.n = $(findstring n,$(firstword $(MAKEFLAGS)))
> --MAKE.k = $(findstring k,$(firstword $(MAKEFLAGS)))
> --MAKE.q = $(findstring q,$(firstword $(MAKEFLAGS)))
> -+# Filter out long options to avoid flags like --no-print-directory which
> -+# may result in false positive match for MAKE.n
> -+MAKE.n = $(findstring n,$(firstword $(filter-out --%,$(MAKEFLAGS))))
> -+MAKE.k = $(findstring k,$(firstword $(filter-out --%,$(MAKEFLAGS))))
> -+MAKE.q = $(findstring q,$(firstword $(filter-out --%,$(MAKEFLAGS))))
> - MAKE.nq = $(if $(word 2, $(MAKE.n) $(MAKE.q)),nq)
> - NINJAFLAGS = $(if $V,-v) $(if $(MAKE.n), -n) $(if $(MAKE.k), -k0) \
> -         $(filter-out -j, $(lastword -j1 $(filter -l% -j%, $(MAKEFLAGS)))) \
> --- 
> -2.27.0
> -
> diff --git a/package/qemu/0005-block-export-fuse.c-fix-musl-build.patch b/package/qemu/0005-block-export-fuse.c-fix-musl-build.patch
> deleted file mode 100644
> index 0da6b3ff73..0000000000
> --- a/package/qemu/0005-block-export-fuse.c-fix-musl-build.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -From 4d5280c066eb46a31556044fb52c2618928b0019 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Mon, 9 Aug 2021 10:04:07 +0200
> -Subject: [PATCH] block/export/fuse.c: fix musl build
> -
> -Fix the following build failure on musl raised since version 6.0.0 and
> -https://gitlab.com/qemu-project/qemu/-/commit/4ca37a96a75aafe7a37ba51ab1912b09b7190a6b
> -because musl does not define FALLOC_FL_ZERO_RANGE:
> -
> -../block/export/fuse.c: In function 'fuse_fallocate':
> -../block/export/fuse.c:563:23: error: 'FALLOC_FL_ZERO_RANGE' undeclared (first use in this function)
> -  563 |     } else if (mode & FALLOC_FL_ZERO_RANGE) {
> -      |                       ^~~~~~~~~~~~~~~~~~~~
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/b96e3d364fd1f8bbfb18904a742e73327d308f64
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status: sent to qemu-devel@nongnu.org]
> ----
> - block/export/fuse.c | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/block/export/fuse.c b/block/export/fuse.c
> -index ada9e263eb..07e31129a6 100644
> ---- a/block/export/fuse.c
> -+++ b/block/export/fuse.c
> -@@ -635,6 +635,7 @@ static void fuse_fallocate(fuse_req_t req, fuse_ino_t inode, int mode,
> -             offset += size;
> -             length -= size;
> -         } while (ret == 0 && length > 0);
> -+#ifdef FALLOC_FL_ZERO_RANGE
> -     } else if (mode & FALLOC_FL_ZERO_RANGE) {
> -         if (!(mode & FALLOC_FL_KEEP_SIZE) && offset + length > blk_len) {
> -             /* No need for zeroes, we are going to write them ourselves */
> -@@ -654,6 +655,7 @@ static void fuse_fallocate(fuse_req_t req, fuse_ino_t inode, int mode,
> -             offset += size;
> -             length -= size;
> -         } while (ret == 0 && length > 0);
> -+#endif
> -     } else if (!mode) {
> -         /* We can only fallocate at the EOF with a truncate */
> -         if (offset < blk_len) {
> --- 
> -2.30.2
> -
> diff --git a/package/qemu/Config.in b/package/qemu/Config.in
> index 391fd5faaf..763550dbd6 100644
> --- a/package/qemu/Config.in
> +++ b/package/qemu/Config.in
> @@ -5,14 +5,16 @@ config BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
>  		|| BR2_x86_64 || BR2_arm \
>  		|| BR2_powerpc64 || BR2_powerpc64le
>  
> -comment "QEMU requires a toolchain with wchar, threads"
> +comment "QEMU requires a toolchain with wchar, threads, gcc >= 7"
>  	depends on BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
>  	depends on BR2_USE_MMU
> -	depends on !(BR2_TOOLCHAIN_HAS_THREADS && BR2_USE_WCHAR)
> +	depends on !(BR2_TOOLCHAIN_HAS_THREADS && BR2_USE_WCHAR) || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
>  
>  config BR2_PACKAGE_QEMU
>  	bool "QEMU"
>  	depends on BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_USE_WCHAR # gettext
>  	depends on BR2_USE_MMU # fork()
> diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
> index fedf90d8b7..a5b38c081b 100644
> --- a/package/qemu/Config.in.host
> +++ b/package/qemu/Config.in.host
> @@ -37,6 +37,7 @@ config BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
>  config BR2_PACKAGE_HOST_QEMU
>  	bool "host qemu"
>  	depends on BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS || BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
> +	depends on BR2_HOST_GCC_AT_LEAST_7
>  	select BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE \
>  		if !BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE && BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
>  	select BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE \
> @@ -93,11 +94,7 @@ config BR2_PACKAGE_HOST_QEMU_VIRTFS
>  
>  config BR2_PACKAGE_HOST_QEMU_USB
>  	bool "USB passthrough support"
> -	depends on BR2_HOST_GCC_AT_LEAST_4_9 # host-libusb
>  	help
>  	  Enables USB passthrough support from guest to host.
>  
> -comment "USB passthrough support needs a toolchain w/ host gcc >= 4.9"
> -	depends on !BR2_HOST_GCC_AT_LEAST_4_9
> -
>  endif
> diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
> index 5e873791b8..0613fce493 100644
> --- a/package/qemu/qemu.hash
> +++ b/package/qemu/qemu.hash
> @@ -1,4 +1,4 @@
>  # Locally computed, tarball verified with GPG signature
> -sha256  87bc1a471ca24b97e7005711066007d443423d19aacda3d442558ae032fa30b9  qemu-6.0.0.tar.xz
> +sha256  eebc089db3414bbeedf1e464beda0a7515aad30f73261abc246c9b27503a3c96  qemu-6.1.0.tar.xz
>  sha256  6f04ae8364d0079a192b14635f4b1da294ce18724c034c39a6a41d1b09df6100  COPYING
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index 520618cd55..95f3dfe54f 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -QEMU_VERSION = 6.0.0
> +QEMU_VERSION = 6.1.0
>  QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
>  QEMU_SITE = http://download.qemu.org
>  QEMU_LICENSE = GPL-2.0, LGPL-2.1, MIT, BSD-3-Clause, BSD-2-Clause, Others/BSD-1c
> @@ -186,6 +186,7 @@ define QEMU_CONFIGURE_CMDS
>  			--enable-kvm \
>  			--enable-attr \
>  			--enable-vhost-net \
> +			--disable-bpf \
>  			--disable-bsd-user \
>  			--disable-containers \
>  			--disable-xen \
> @@ -215,7 +216,6 @@ define QEMU_CONFIGURE_CMDS
>  			--disable-opengl \
>  			--disable-vhost-user-blk-server \
>  			--disable-virtiofsd \
> -			--disable-tests \
>  			$(QEMU_OPTS)
>  endef
>  
> @@ -351,6 +351,7 @@ define HOST_QEMU_CONFIGURE_CMDS
>  		--extra-ldflags="$(HOST_LDFLAGS)" \
>  		--meson=$(HOST_DIR)/bin/meson \
>  		--ninja=$(HOST_DIR)/bin/ninja \
> +		--disable-bpf \
>  		--disable-bzip2 \
>  		--disable-containers \
>  		--disable-curl \
> @@ -362,7 +363,6 @@ define HOST_QEMU_CONFIGURE_CMDS
>  		--disable-vnc-jpeg \
>  		--disable-vnc-png \
>  		--disable-vnc-sasl \
> -		--disable-tests \
>  		$(HOST_QEMU_OPTS)
>  endef
>  
> -- 
> 2.31.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
