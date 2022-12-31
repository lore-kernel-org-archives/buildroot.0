Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E1BC4332F
	for <buildroot@archiver.kernel.org>; Sat, 31 Dec 2022 16:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E859A607FE;
	Sat, 31 Dec 2022 16:15:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E859A607FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V3bWRe62EMjK; Sat, 31 Dec 2022 16:15:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D907260A91;
	Sat, 31 Dec 2022 16:15:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D907260A91
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7CCA41BF47D
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 16:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5666C400A3
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 16:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5666C400A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6B1cv6XJ4P-M for <buildroot@lists.busybox.net>;
 Sat, 31 Dec 2022 16:15:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63C244004D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 63C244004D
 for <buildroot@buildroot.org>; Sat, 31 Dec 2022 16:15:00 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:37e6:2c2e:a294:8f1b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1FE8813F838;
 Sat, 31 Dec 2022 17:14:49 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 31 Dec 2022 17:14:39 +0100
Date: Sat, 31 Dec 2022 17:14:39 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221231161439.GN2498764@scaer>
References: <20221231093425.237228-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221231093425.237228-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672503298;
 bh=Q/VBjkegkig8ED6B560R6gmi6wuUzIQYrIgVaoKCQFA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l1/1vEm4itKdVSE5Xag8vzwpZEfGIj+v9NiyOFwPrOdkVLHTX6yqtF+Zq8xnPsxdj
 8Vabne7yFWS4UwiDvogbagnqkfivBaMg3GAOwVYMadEf2+U8o2HPKEODgyNYHxb3ZM
 GUGA9KPGxKAlIw+OsVkV4GrmSB/I8N4Hw0jxLFnBjKaqPrR11qoUj4M+QB5bVpnCaK
 S16MLXfTCMek0lUnwzTkCjpnwIEEFljGPjJJsnsZwv17pakCIQhACn40AtovUEGYqW
 z5/IFIwUMBdV6CzT01cwZu41Uoebtx+FfRLFCE3x6dfICygDyonqqoRfZhx2660mvY
 nl/jwXQm5lZQg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=l1/1vEm4
Subject: Re: [Buildroot] [PATCH 1/1] package/modem-manager: fix static build
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
Cc: Aleksander Morgado <aleksander@aleksander.es>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-12-31 10:34 +0100, Fabrice Fontaine spake thusly:
> Fix the following static build failure raised since bump to version
> 1.20.2 in commit b95334b71fbdde0f7621b58ed35fa98df9e0966d:
> 
> FAILED: src/ModemManager
> /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/bin/m68k-linux-gcc  -o src/ModemManager src/ModemManager.p/meson-generated_.._mm-daemon-enums-types.c.o src/ModemManager.p/main.c.o src/ModemManager.p/mm-auth-provider.c.o src/ModemManager.p/mm-base-bearer.c.o src/ModemManager.p/mm-base-call.c.o src/ModemManager.p/mm-base-manager.c.o src/ModemManager.p/mm-base-modem-at.c.o src/ModemManager.p/mm-base-modem.c.o src/ModemManager.p/mm-base-sim.c.o src/ModemManager.p/mm-base-sms.c.o src/ModemManager.p/mm-bearer-list.c.o src/ModemManager.p/mm-broadband-bearer.c.o src/ModemManager.p/mm-broadband-modem.c.o src/ModemManager.p/mm-call-list.c.o src/ModemManager.p/mm-context.c.o src/ModemManager.p/mm-device.c.o src/ModemManager.p/mm-dispatcher.c.o src/ModemManager.p/mm-dispatcher-connection.c.o src/ModemManager.p/mm-dispatcher-fcc-unlock.c.o src/ModemManager.p/mm-filter.c.o src/ModemManager.p/mm-iface-modem-3gpp.c.o src/ModemManager.p/mm-iface-modem-3gpp-profile-mana
 ge
>  r.c.o src/ModemManager.p/mm-iface-modem-3gpp-ussd.c.o src/ModemManager.p/mm-iface-modem.c.o src/ModemManager.p/mm-iface-modem-cdma.c.o src/ModemManager.p/mm-iface-modem-firmware.c.o src/ModemManager.p/mm-iface-modem-location.c.o src/ModemManager.p/mm-iface-modem-messaging.c.o src/ModemManager.p/mm-iface-modem-oma.c.o src/ModemManager.p/mm-iface-modem-sar.c.o src/ModemManager.p/mm-iface-modem-signal.c.o src/ModemManager.p/mm-iface-modem-simple.c.o src/ModemManager.p/mm-iface-modem-time.c.o src/ModemManager.p/mm-iface-modem-voice.c.o src/ModemManager.p/mm-plugin.c.o src/ModemManager.p/mm-plugin-manager.c.o src/ModemManager.p/mm-port-probe.c.o src/ModemManager.p/mm-port-probe-at.c.o src/ModemManager.p/mm-private-boxed-types.c.o src/ModemManager.p/mm-sms-list.c.o -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 -static '-Wl,-rpath,$ORIGIN/../libmm-glib' -Wl,-rpath-link,/home/autobuild/autobuild/instance-11/output-1/build/modem-manager-1.20.2/build/libmm-glib -Wl,--start-group src/libport.a 
 sr
>  c/libkerneldevice.a src/libhelpers.a libmm-glib/libmm-glib.so.0.9.0 libqcdm/src/libqcdm.a libmm-glib/generated/tests/libmm-test-generated.a -Wl,--export-dynamic /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libgmodule-2.0.a /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libglib-2.0.a -pthread -lm /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libpcre.a /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libgio-2.0.a /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libgobject-2.0.a /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libffi.a /home/aut
 ob
>  uild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libz.a /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libmount.a /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libblkid.a -Wl,--end-group
> /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/opt/ext-toolchain/bin/../lib/gcc/m68k-buildroot-linux-uclibc/11.2.0/../../../../m68k-buildroot-linux-uclibc/bin/ld: attempted static link of dynamic object `libmm-glib/libmm-glib.so.0.9.0'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/9803d593305df36c4a8d67aac2fb4c9a3120a072
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Upstream accepted your patch now, so I did an actual backport.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...n-hardcode-building-a-shared-library.patch | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 package/modem-manager/0001-meson-Un-hardcode-building-a-shared-library.patch
> 
> diff --git a/package/modem-manager/0001-meson-Un-hardcode-building-a-shared-library.patch b/package/modem-manager/0001-meson-Un-hardcode-building-a-shared-library.patch
> new file mode 100644
> index 0000000000..435499a8f9
> --- /dev/null
> +++ b/package/modem-manager/0001-meson-Un-hardcode-building-a-shared-library.patch
> @@ -0,0 +1,54 @@
> +From b075b757dca1681835dc1492e60de7688db78218 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sat, 31 Dec 2022 10:18:32 +0100
> +Subject: [PATCH] meson: Un-hardcode building a shared library
> +
> +Use library() instead of shared_library() to allow specifying which kind
> +of library to build with "meson setup --default-library ..."
> +
> +This will avoid the following static build failure:
> +
> +FAILED: src/ModemManager
> +/home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/bin/m68k-linux-gcc  -o src/ModemManager src/ModemManager.p/meson-generated_.._mm-daemon-enums-types.c.o src/ModemManager.p/main.c.o src/ModemManager.p/mm-auth-provider.c.o src/ModemManager.p/mm-base-bearer.c.o src/ModemManager.p/mm-base-call.c.o src/ModemManager.p/mm-base-manager.c.o src/ModemManager.p/mm-base-modem-at.c.o src/ModemManager.p/mm-base-modem.c.o src/ModemManager.p/mm-base-sim.c.o src/ModemManager.p/mm-base-sms.c.o src/ModemManager.p/mm-bearer-list.c.o src/ModemManager.p/mm-broadband-bearer.c.o src/ModemManager.p/mm-broadband-modem.c.o src/ModemManager.p/mm-call-list.c.o src/ModemManager.p/mm-context.c.o src/ModemManager.p/mm-device.c.o src/ModemManager.p/mm-dispatcher.c.o src/ModemManager.p/mm-dispatcher-connection.c.o src/ModemManager.p/mm-dispatcher-fcc-unlock.c.o src/ModemManager.p/mm-filter.c.o src/ModemManager.p/mm-iface-modem-3gpp.c.o src/ModemManager.p/mm-iface-modem-3gpp-profile-man
 ag
>  er.c.o src/ModemManager.p/mm-iface-modem-3gpp-ussd.c.o src/ModemManager.p/mm-iface-modem.c.o src/ModemManager.p/mm-iface-modem-cdma.c.o src/ModemManager.p/mm-iface-modem-firmware.c.o src/ModemManager.p/mm-iface-modem-location.c.o src/ModemManager.p/mm-iface-modem-messaging.c.o src/ModemManager.p/mm-iface-modem-oma.c.o src/ModemManager.p/mm-iface-modem-sar.c.o src/ModemManager.p/mm-iface-modem-signal.c.o src/ModemManager.p/mm-iface-modem-simple.c.o src/ModemManager.p/mm-iface-modem-time.c.o src/ModemManager.p/mm-iface-modem-voice.c.o src/ModemManager.p/mm-plugin.c.o src/ModemManager.p/mm-plugin-manager.c.o src/ModemManager.p/mm-port-probe.c.o src/ModemManager.p/mm-port-probe-at.c.o src/ModemManager.p/mm-private-boxed-types.c.o src/ModemManager.p/mm-sms-list.c.o -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 -static '-Wl,-rpath,$ORIGIN/../libmm-glib' -Wl,-rpath-link,/home/autobuild/autobuild/instance-11/output-1/build/modem-manager-1.20.2/build/libmm-glib -Wl,--start-group src/libport.a
  s
>  rc/libkerneldevice.a src/libhelpers.a libmm-glib/libmm-glib.so.0.9.0 libqcdm/src/libqcdm.a libmm-glib/generated/tests/libmm-test-generated.a -Wl,--export-dynamic /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libgmodule-2.0.a /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libglib-2.0.a -pthread -lm /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libpcre.a /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libgio-2.0.a /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libgobject-2.0.a /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libffi.a /home/au
 to
>  build/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libz.a /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libmount.a /home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libblkid.a -Wl,--end-group
> +/home/autobuild/autobuild/instance-11/output-1/per-package/modem-manager/host/opt/ext-toolchain/bin/../lib/gcc/m68k-buildroot-linux-uclibc/11.2.0/../../../../m68k-buildroot-linux-uclibc/bin/ld: attempted static link of dynamic object `libmm-glib/libmm-glib.so.0.9.0'
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/9803d593305df36c4a8d67aac2fb4c9a3120a072
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status:
> +https://gitlab.freedesktop.org/mobile-broadband/ModemManager/-/merge_requests/944]
> +---
> + libmm-glib/meson.build | 2 +-
> + plugins/meson.build    | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/libmm-glib/meson.build b/libmm-glib/meson.build
> +index 42f8ac61..de668dab 100644
> +--- a/libmm-glib/meson.build
> ++++ b/libmm-glib/meson.build
> +@@ -129,7 +129,7 @@ deps = [include_dep]
> + 
> + libname = 'mm-glib'
> + 
> +-libmm_glib = shared_library(
> ++libmm_glib = library(
> +   libname,
> +   version: mm_glib_version,
> +   sources: sources,
> +diff --git a/plugins/meson.build b/plugins/meson.build
> +index f849bb53..9e081beb 100644
> +--- a/plugins/meson.build
> ++++ b/plugins/meson.build
> +@@ -18,7 +18,7 @@ if enable_tests
> +     libmm_test_generated_dep
> +   ]
> + 
> +-  libmm_test_common = shared_library(
> ++  libmm_test_common = library(
> +     'mm-test-common',
> +     sources: sources,
> +     include_directories: top_inc,
> +-- 
> +2.35.1
> +
> -- 
> 2.35.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
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
