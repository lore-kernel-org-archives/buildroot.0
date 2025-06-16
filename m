Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48B4C71135
	for <buildroot@archiver.kernel.org>; Mon, 16 Jun 2025 10:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6804C80892;
	Mon, 16 Jun 2025 10:53:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M_CZ2wcuODmf; Mon, 16 Jun 2025 10:53:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4C6480814
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4C6480814;
	Mon, 16 Jun 2025 10:53:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CDBA2151
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 10:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ADAE8807F4
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 10:53:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZJ1sDv1ZHAgc for <buildroot@buildroot.org>;
 Mon, 16 Jun 2025 10:53:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 300B5807E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 300B5807E2
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 300B5807E2
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 10:53:05 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.113.127]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MmlTC-1v7HuS3C6Q-00Zkvk for
 <buildroot@buildroot.org>; Mon, 16 Jun 2025 12:53:03 +0200
Message-ID: <95ab2877-1937-4c1f-9c77-5e7df62f4a3d@gmx.de>
Date: Mon, 16 Jun 2025 12:53:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <684e3ab3.050a0220.c7c39.8aa1@mx.google.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <684e3ab3.050a0220.c7c39.8aa1@mx.google.com>
X-Provags-ID: V03:K1:WGvaoj0OnKUseN0Uckawe6mwPJHwUdwxwMBqQII1pBL5a52ZfjD
 TukCXycqTvQsaxw47mkFahQSE5OpW2vaThP82OpGDq+lWDgjLEVwgtkfOwlcFXrB66hiCS3
 uceBms4xQxyeJSY2Ix2K6G9HY85TTbHoRZsx0RqREl9bvnXrUsUqEhxWAf21L6nZMOSmEJn
 dXijRSOTgJVw4fcpnUFjA==
UI-OutboundReport: notjunk:1;M01:P0:GtfEYVspIpA=;I7XPDiGd+lqrtNS/SG8E1GK35dZ
 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
 LRfHRHlEpQKpw0lOMHlDz4LVwjTzD3TmmQjg+Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1750071184; x=1750675984; i=fiona.klute@gmx.de;
 bh=jzwZnz2RcMAWeYWwztas5+3otYJl8QueHvLiKtg1hB8=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=kvRq+/m8d+oUpJJBbfZ0h/clrhnzEf23P4LTLBEaPCVspEwdSUXwpXV34G8ai39g
 ISBp+Ugs27c5pl6QkfF+dqedLkjJxpebjjKk/wYACioPBY7VN+7bBRtSUOWaj1VTy
 MggrlQ5BBoblwX79uHSWHMzz4oAdPPh1SO07h6rhHbRt6NJkC75m4Vw4M3NPsZNKD
 57t7YllOpHzTQyzBlZBJM9DW2ooFHYaQKfcJW1xTDt+vD8Ik3/7b/+N4so3GK7t/a
 PuGgMrKvwIEHeOjD0GD3bHlinHxi+vCJ6oZm0RKACnaxvnAmJViaKk4IS/hzAcONK
 65641IlBMGGx4T3ZgA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=kvRq+/m8
Subject: Re: [Buildroot] [autobuild.buildroot.org] Daily results for
 2025-06-14
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi everyone,

you might've noticed there are a lot of autobuild failures for 
host-gobject-introspection errors recently. One example:
https://autobuild.buildroot.org/results/b9904209e13c1e4ce496aaff2f194064d2a6c691/

 From the error messages it looks like *something* links against system 
libreadline, which then links against libncursesw from host-ncurses 
(probably due to the LD_LIBRARY_PATH override), isn't fully compatible, 
and then the warning

> /bin/sh: /home/autobuild/autobuild/instance-22/output-1/host/lib/libncursesw.so.6: no version information available (required by /usr/lib/libreadline.so.8)

somehow ends up in the linker command line (which seems like a bug in 
itself, probably in in GOI, regardless of library paths).

My problem is that I can't reproduce the issue, and without that I don't 
see how I can figure out where exactly things go wrong. I tried on my 
regular build system, and also with the 
registry.gitlab.com/buildroot.org/buildroot/base:20250218.2110 image, 
and both built host-gobject-introspection just fine with config from the 
linked autobuild run (and a few others I've tried).

Does anyone else have an idea, or a suggestion how to replicate the 
autobuild environment (because there must be some difference if it 
consistently fails there, but not with the container)?

Best regards,
Fiona


Am 15.06.25 um 05:14 schrieb Buildroot Notifications:
> Hello,
> 
> Autobuild statistics for 2025-06-14
> ===================================
> 
>        branch |  OK | NOK | TIM | TOT |
>    2025.02.x  |  6  |  5  |  0  | 11  |
>    2025.05.x  |  5  | 12  |  0  | 17  |
>      master   |  3  | 486 |  0  | 489 |
> 
> Classification of failures by reason for master
> -----------------------------------------------
> 
> host-gobject-introspection-... | 55
>            host-binutils-2.43.1 | 53
>                    bcg729-1.1.1 | 28
>                libselinux-3.8.1 | 23
>     host-bootgen-xilinx_v2025.1 | 21
>                         unknown | 19
>                     avrdude-8.0 | 16
>                  elfutils-0.192 | 16
> host-binutils-arc-2023.09-r... | 15
>                      bmx7-7.1.1 | 14
>               batman-adv-2024.4 | 13
>              host-binutils-2.42 | 12
>                 host-vde2-2.3.3 | 11
>                    ntp-4.2.8p18 | 8
>                      gpm-1.20.7 | 7
>           host-mariadb-10.11.11 | 7
>                    linux-6.15.2 | 7
>                   openal-1.22.0 | 7
>                      yajl-2.1.0 | 7
> amazon-ecr-credential-helpe... | 6
> host-am335x-pru-package-5f3... | 6
>                     bash-5.2.37 | 5
>                    cjson-1.7.18 | 5
>                     cvs-1.12.13 | 4
> libmodplug-d1b97ed0020bc620... | 4
>                libopenssl-3.5.0 | 4
>                  python3-3.13.3 | 4
>                   apitrace-10.0 | 3
>               berkeleydb-5.3.28 | 3
>                         cfm-0.3 | 3
>              gettext-gnu-0.22.4 | 3
>                host-json-c-0.18 | 3
>                  libesmtp-1.1.0 | 3
>                  libsepol-3.8.1 | 3
>            linux-5.10.162-cip24 | 3
>                   agentpp-4.6.1 | 2
>                      azmq-1.0.3 | 2
>                 bctoolbox-4.4.8 | 2
>                    bcusdk-0.0.5 | 2
>                        dht-0.27 | 2
>    ffmpeg-n6.1.2-27-ge16ff06adb | 2
>    gobject-introspection-1.84.0 | 2
>                   hddtemp-0.4.3 | 2
>             host-doxygen-1.8.18 | 2
>                   host-gdb-14.2 | 2
>             host-squashfs-4.6.1 | 2
>               libargtable2-2.13 | 2
>                 libcap-ng-0.8.5 | 2
>                libebur128-1.2.6 | 2
>                   libsoxr-0.1.3 | 2
> libsvgtiny-ea9d99fc8b231c22... | 2
>       linux-5.10.162-cip24-rt10 | 2
>                   logsurfer-1.8 | 2
>                     perl-5.40.2 | 2
>                 pulseaudio-17.0 | 2
>            aardvark-dns-v1.14.0 | 1
>                 alsa-lib-1.2.14 | 1
>                 asterisk-22.3.0 | 1
>                     atop-2.11.0 | 1
>                      bat-0.25.0 | 1
> check-11970a7e112dfe243a2e6... | 1
>            chocolate-doom-3.0.1 | 1
> cpuinfo-8a1772a0c5c447df2d1... | 1
>            cryptodev-linux-1.13 | 1
>               dahdi-linux-3.3.0 | 1
>                       daq-2.0.7 | 1
>                     duma-2.5.21 | 1
>                      dust-1.1.2 | 1
>                 ebtables-2.0.11 | 1
>                   expect-5.45.4 | 1
> glibc-2.41-5-gcb7f206537240... | 1
>                graphite2-1.3.14 | 1
>                  haveged-1.9.19 | 1
>          host-berkeleydb-5.3.28 | 1
> host-firmware-utils-86739f2... | 1
>           host-gcc-final-13.4.0 | 1
>                   host-gdb-15.2 | 1
>    host-gdb-arc-2023.09-release | 1
>     host-python-glslang-11.13.0 | 1
>                host-rust-1.86.0 | 1
>   host-softether-4.30-9700-beta | 1
>                    jack2-1.9.22 | 1
>                   lapack-3.12.1 | 1
>                  libdrm-2.4.124 | 1
>                   libiconv-1.15 | 1
>                   libjcat-0.2.1 | 1
>                  libkrb5-1.21.3 | 1
>                    libnl-3.11.0 | 1
>               libopenmpt-0.7.13 | 1
>                  libressl-3.9.2 | 1
> make: *** Waiting for unfin... | 1
>                 mbedtls-3.6.3.1 | 1
>             oath-toolkit-2.6.12 | 1
>                  openocd-0.12.0 | 1
>                 procps-ng-4.0.5 | 1
>                   samba4-4.21.4 | 1
>               util-linux-2.40.2 | 1
>                   watchdog-5.16 | 1
>                        x265-3.5 | 1
>                xlib_libXt-1.3.0 | 1
> 
> 
> Detail of failures for master
> -----------------------------
> 
>      arch     |             reason             | OK? |                                       url                                       | orph?
> -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
>     armeb     |      aardvark-dns-v1.14.0      | NOK | https://autobuild.buildroot.org/results/4ee53570e4068bd530985ee3b485d34588cb14fe | ORPH
>     armeb     |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/a9b64aa9b6a20728105e90fa4d9eb832e8145dfe |
> powerpc64le  |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/33e4bd2afbe2a72c9329387c9349d522e2feb2c2 |
> powerpc64le  |        alsa-lib-1.2.14         | NOK | https://autobuild.buildroot.org/results/259a93e985f21be8052308d4a3643f4bbe224409 |
>    riscv64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/13dc14444d6c2d0a76dee704c6b0ffe15fabe934 | ORPH
> powerpc64le  | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/f844173bcf80827460a18a7706a64045af11287f | ORPH
>    riscv64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/b9ccbcf4b75c6f62129ea10763de08070ed88e4c | ORPH
>      i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/e3d3e2b2e2256b5a3d454684d4435e31b5610113 | ORPH
>      i586     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/8a3dd4b0596c642543c3c2af4e9ae19b7fdc019c | ORPH
>     x86_64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/e8967e6b1f624f1fcbd08814e76098b8ba3876ce | ORPH
>     x86_64    |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/9478d4d168cede376545877a14e34483fb144605 |
> microblazeel |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/12ebfdbf9330e34bd46c93530c0ec218ee4e5a8c |
>   microblaze  |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/2bfe027b902de951f7add5d7bbbefd847de44218 |
>   microblaze  |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/0f28771511c7a411b1851257d91210edcbcd0858 |
>     xtensa    |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/a8ad8fc45c0ac9ff5e4c81a08e3e5d5f71e02612 |
>     s390x     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/da0884b6f97ee6855e13dc2986fca701fd99665d |
>     x86_64    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/294043b9afd407d124a6216b82ace9f727e1534b |
> powerpc64le  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/b5e3e49b078972989363de446e38efed3eb0eff3 |
>   microblaze  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/c24562941fefcec7e4dfd701e7de5e8a8cf76928 |
>   powerpc64   |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/d3be204267a03e08e6a7b40d10b4bd21d9280ed4 |
>   microblaze  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/78397c923b4e2beb88b551a0686bf27a0e604eb1 |
>     x86_64    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/10404fa55388535ed3c24d65a05aeba9da414158 |
>   microblaze  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/08eec838441d1b687a63613a08950689d776ca12 |
>      or1k     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/ae95c4d801fc6facb37b319aa8bf0a421947eab5 |
>   microblaze  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/74cdbd583251855166a2d8355b725306923f7197 |
> microblazeel |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/06ec61d248030c6ec8b884a402ed34e11e831e88 |
> microblazeel |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/bb5c9aed7a168c5721812be10a4f9d26fb9195ef |
> microblazeel |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/04fbbfc86d761b8e758a80e393eb476b286d4c8f |
>    powerpc    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/e096bc22c3ce8747555f1a0fb21595434c5b6318 |
> powerpc64le  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/ca8d64421ff367bd20b6d45f1c89158a51aa0b58 |
>      arm      |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/03922879f74e0785ad684702b2c439f5d23f2f50 |
> microblazeel |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/b64278df1b0c36b0f1cdae28abf294632fa61f2e |
>    powerpc    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/6f09235a52a4062bed897b8a0bc0575b8489278d |
>    sparc64    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/ff78924075141e6769d1b703df99a87d4703f9d7 | ORPH
>    powerpc    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/70493bf59eb769753262c424de3cbdd81e479059 | ORPH
>   aarch64_be  |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/499e4918f8dbb569e4a4c79e0d8efd046f981835 | ORPH
>     sh4eb     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/faf3fbbd9e13124e86efb24e2d528754dc504fb9 | ORPH
>     s390x     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/f88e35094e0674ad0c58f9b7b61cbe482b6dbf8a | ORPH
>     x86_64    |           bat-0.25.0           | NOK | https://autobuild.buildroot.org/results/2da1075e1dbaa0e68cc82f97105cfc3ad01e9ff7 |
>     sparc     |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/ac4ae650befd795984bfe330b3c97f604c130256 |
>      m68k     |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/97ce0ad0976fc987a4321b185ea425567e4551cc |
>      or1k     |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/55ecf2dccdb3cff77121c0d4f1c8ec7a2cd96178 |
> microblazeel |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/671736bcf3eb1b94c8f7004586b3ebab2916ee15 |
>     sh4eb     |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/a6a448109c68b49bddae8f3d5f58005438cd80c5 |
>    sparc64    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/fb5ff2b1622c9ec3772df5cd92a628ffdf603a70 |
>     armeb     |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/3545e0847e5347c56da875515507bce590040110 |
>     sh4eb     |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/14f3278cab618af1f058227b332d703cf816d390 |
>      arm      |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/b53a09fba4fdd5fe114afbf42311f5958b739620 |
>   microblaze  |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/d7dfd7b90b7a30a94e8bd90db516d4c26fd38fd1 |
>   microblaze  |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/9090b66468c44515f878c3e2547992f6a364f6da |
>     x86_64    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/307f8722b6620f75b67a19bd554115f4d884cd5d |
>     mipsel    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/ae0fede4768aa2eae654dcc6b49ef47b9633e494 |
>     x86_64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/80bae8ed84e0574f8289ffa32c9aa8a964770cfc |
>     xtensa    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/8ea2a74e13d7b0d770a58750c54a5bce53f74910 |
>      i686     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/6d6205044305c5834bdc22d343fa0ad470fae920 |
>    sparc64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/f4ec5bea7794fef5627ab7df35b802d93ec355aa |
>   powerpc64   |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/c373cb7bd826f329b9fd28abb258b65753435d80 |
>      arm      |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/ae37cc4824ef735d098df5cec27a9f3c934d05e4 |
>     s390x     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/507dfcc41052d9a5eb971a35f25f0c93975f25e8 |
>   powerpc64   |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/190281035790b3090880041f03c43281beaa5c95 |
>      i586     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/5ba01954b0ba5cb2d7f952b4d66ff67412675fa6 |
>     sh4eb     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/5648cf2d50c6e51c087563858ed0acbbce1f9f98 |
>      m68k     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/fef2b82d09b8a17b20bdbce55df2e78a32a54528 |
>    riscv64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/bb85fc17d6433d4d5c0c4e7206f1751ee1fad49d |
>    sparc64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/bc5c55f6db1fcb55c8db46bf098decda7fbb0ccf |
>   microblaze  |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/6a324f35e84f425b84d2301b4d99dc76905bd2d4 |
> powerpc64le  |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/4955233d4aea6d4b000e59d3d7fa08b51ea07659 |
>   microblaze  |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/35b9373e628b9957b0f23c00780b3c3312bed068 |
>    powerpc    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/a83c877a220f9bc435f6f91d259e5ce031732873 |
>   powerpc64   |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/7fe197ba3e12c92c1a5eb67bc7f6b4459ede5cc1 |
> microblazeel |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/fb6d43911b258a8f20bf3c201ff848d0750f1199 |
>    sparc64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/a2bcd579691f68434c449407cb5c59c2d307eec4 |
>      arm      |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/dbe49b09f4d4135b91024c3f689026b6afe4f1a8 |
>     xtensa    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/469712c80c15307a7c016dbdfd33389333326f64 |
>   powerpc64   |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/39fd5c0e5afe693c73c68d44d92e4897db3548f5 |
>      i586     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/5b1bf625201f062286f8065e3797426e1868fcfa |
>   powerpc64   |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/530338fb3d9aef0bfa2f0405eec7a14c3dfceaf2 |
>    aarch64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/e853094dfb47a2d1cf1ab7287361f4410142d6da |
>      arc      |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/08e31e7f0e1b6c2806db8fa78c1e5310ee55ea40 |
>     x86_64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/e5c291aaf2c0141fa319b43a28fa02604c235dc5 |
> microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/b09537d05b24dffdd3bcd0225dc26c825bc1f1bf | ORPH
>     sparc     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/2f56152a69f3ff7e4a4408720262c44b7854d42d | ORPH
>   powerpc64   |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/e25805af3d1ab60ef758ec3966f5b9d06aa507f8 |
>   powerpc64   |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/25856e92ee7f525007ce9c2081f8fc18817842c7 |
>      arm      |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/8dd7fb9fd11468bb3125d738bb5808714d4671f4 | ORPH
>     armeb     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/a3d7b2ba933f12a53f445b6268bdec802d5491ea | ORPH
>      arm      |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/05f88914079824383b56f7c5b7a7ac4f0a070dfd | ORPH
>      m68k     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/09877ad890de361293e19695293e84553c347c7b | ORPH
>    riscv32    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/0b605bdaab5943b517921c9d21446d50ad6d20d9 | ORPH
>   microblaze  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/0804af6abc926c3316c446943e025ce084688431 | ORPH
>     arceb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/a4d990eeaf155e741770dcd3094fd8580e9aeda5 | ORPH
>     xtensa    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/5c1bd7b3c4282ce107e178a97ec4345c3a86a207 | ORPH
>   microblaze  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/de98a88db7526596470cce997d134dd979386ab7 | ORPH
>   microblaze  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/4b7e1904b03f30af6249284326bf7ca1d5bfb20a | ORPH
>   microblaze  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/20e9c30e2830d519f3752f0b2e4ef060bab19fd6 | ORPH
>     armeb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/2f7337bdaa42c7633214ab8de1af45b153a776c0 | ORPH
> microblazeel |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/47fc9cec76c8e63d3428a7779f207857a5a584ee | ORPH
> microblazeel |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/c6ae1747ab06c36b6a13092ecfbc85a9e4e16420 | ORPH
>      arm      |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/3eb12569eb1bcd926f4e0e45c53ffdce96122272 | ORPH
>   microblaze  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/64ae8b60ecfa2e1e121a9a6e6af5fc1603b7eb07 | ORPH
>      sh4a     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/c53152a70ffcbabcfab59aa1c439a4c2d47a5193 | ORPH
>     sparc     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/ed6ef6087da7b7eec31b9873925ecafff9b7b7f4 |
>     sparc     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/608550e1dbccdb0ac3c51d3ed742be69e1df8a27 |
>      arc      |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/d815087966963a04cbf1dbcc18b449e1288ddb53 |
> powerpc64le  | check-11970a7e112dfe243a2e6... | NOK | https://autobuild.buildroot.org/results/ddaf0606639002c5613ba8399f99a0a17595b0e6 | ORPH
>     sparc     |      chocolate-doom-3.0.1      | NOK | https://autobuild.buildroot.org/results/1405a13b637925ada3851a2571c0f98d68dc2e2a |
>   microblaze  |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/432145da738c66f9dce86ba74a81ea209f47a8e3 |
>      arm      |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/a381ce84fab82e2f0ee8faa5cc411798601998a7 |
>     xtensa    |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/2cf1d28088e120b4ad72fba690bb3f761b0539be |
>   powerpc64   |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/5dac7bfb240f5fca276d4ee13881a2b6968e69f6 |
>     armeb     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/c3c0d56373bff0c53af84d7fdeea830e4a94be9c |
>      arm      | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/5ab0bf5839b2e7ebafc521f169c9240e6f36e4df |
>    powerpc    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/b50505f8bd90e08bdeec3139fcaf688a3a2f92c3 | ORPH
>    sparc64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/5d28ad90fc57e069ca6891f1402e22116774382c | ORPH
>     x86_64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/ff8f300568bfc6c93876005cf39d0291334a4877 | ORPH
>      i686     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/913d876a4b88bb43f73809743fb03993d460481b | ORPH
>      mips     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/90bebcfcec2b7ee1d8820ef95bab4462da16c4ca | ORPH
>    riscv64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/851d2c5702e89b81a1e9ba5a14c90adf61742864 | ORPH
>    sparc64    |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/2eab05b9c2d27f945ac0993309aa820bdd8b54e6 |
>      arm      |            dht-0.27            | NOK | https://autobuild.buildroot.org/results/fce4046f84adda99cb08a8c63fa81ea2bcb97aea |
>      i686     |            dht-0.27            | NOK | https://autobuild.buildroot.org/results/8f4e7a3eb0f7068591f1861a0180e6c9685362cd |
>      arc      |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/b0771f4cf5e7d2cb647428d370f37e4d056f31a4 | ORPH
> powerpc64le  |           dust-1.1.2           | NOK | https://autobuild.buildroot.org/results/331024f564a1516d0ed64e1c67695a9b947ca448 | ORPH
>    sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/008d4a820a5bca3d22679709b294268ba4dc6fbf |
>   aarch64_be  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/f0a86f03adb2c3663d1e1d38271645837585c37e | ORPH
>     x86_64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/3808788feaae7ec94d1f2199eb5bd78e15bcc95e | ORPH
> microblazeel |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/27e26de9659e3f008edf6adb0de4314b799610fd | ORPH
>     armeb     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/8e70507ff9322a9088a142e55d2e87260792b2fd | ORPH
>      arm      |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/231b24c0ff7c23f3282f829f905ee31f954d92b2 | ORPH
>    sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/97f309d886b0f91204c8842e8ad77cc254e950a6 | ORPH
>   microblaze  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/a130dd86cb4b09b7b3bb015ded72e36b253acaa6 | ORPH
>      mips     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/f5918fb496fd164cd74b9d314bf2b2fbc1b4d987 | ORPH
>     mips64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/c0ffa42abba155b8b1d840cae90548a99f392f10 | ORPH
>     armeb     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/31da7a855ef3554b40faefae5cf908c23fc0d6d2 | ORPH
> microblazeel |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/44822b034ce23f226e6420fbb55ca7b872441c9e | ORPH
>    sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/7766baa62a2534c9722401e123ca5ceefcc89c59 | ORPH
>   aarch64_be  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/e6381603ea30921159b86dced9eac6e3859bedea | ORPH
> powerpc64le  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/ee7b2c84230308ca28449c3073bb33fd32831fd2 | ORPH
> microblazeel |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/7cb01185f4bebf83fead838013bbfb3db28ab46a | ORPH
>     x86_64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/30373b1b4027cdcac573dd9ab1be4ce30956bf3a | ORPH
>     s390x     |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/f30341adfa51d130302ed3ad05803792ee74834b | ORPH
>   microblaze  |  ffmpeg-n6.1.2-27-ge16ff06adb  | NOK | https://autobuild.buildroot.org/results/846e18185c70825d48faf34cf5f8aa36fd21f908 |
>      arc      |  ffmpeg-n6.1.2-27-ge16ff06adb  | NOK | https://autobuild.buildroot.org/results/4399de46d3e37cb666a8414de11a467f6a24971e |
>   aarch64_be  |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/14b8767c8d74fb544982f627461de68a94799b5b | ORPH
>     sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/39f140576c2c4f4a57ec25cce83b02ad3901fec3 | ORPH
>     sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/a6aa21e22b8622b6ea59383ed03e8c67e884993f | ORPH
>      arc      | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/67ea30a714400821a54315e4e906e60867c7e0f9 |
>    sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/1e3512328fe8ae5c31aea96252e3fa74b111d941 | ORPH
>    sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/21bc4653356161067f81e3caf60d95f184eedf09 | ORPH
>      m68k     |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/2c12654265a78fd0beb405f1b0a0f9cae022e56f |
>     sh4aeb    |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/428a40a018496ac7d68fa20952b68b020a933000 |
>      or1k     |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/c7f1f094f407a24843785a68bb69fbe9022c0d49 |
>     s390x     |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/84d28ac02e3f2c4a7f5529e4b53c9e71140eedec |
>     arceb     |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/0716a562de057d8cbdd9250c43edce31215652c5 |
>     mips64    |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/f01db957c7c5155b3c9c7314ce829ed5a8ef1e1c |
>   powerpc64   |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/e74c27ca42f9ebd194c4cf387afc574cf6a5e0eb |
> powerpc64le  |        graphite2-1.3.14        | NOK | https://autobuild.buildroot.org/results/b24c121599e1583af5773e0fd0b6aa1fa61a1362 | ORPH
>     mips64    |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/7c52b6de5c950af07f0be6c564a819548ba4f8ed |
>    powerpc    |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/d4e08c6f472d7505d79f4babf2b7aede71691b82 |
>     armeb     |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/b08797170e196b293a0cb882b8d1f91d72ddc931 |
>      arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/21ad282606587077a3c3b6802037c3973abd940e |
>      arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/b3406df408cc9d939230b0047925abad6849c5d0 |
>      arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/7b7f6a53b100274c023bf765b87439be32981b70 |
>      arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/3816ec22af6ee954bbe2ac3116490e66811371e9 |
>      arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/5086200d24f7469f218aeed8ef1071dc55d81760 |
>      arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/cdfddf131e3d9f939c2055cf5501f3d39945c637 |
>    powerpc    |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/e58dc32accec2cc4550141aa9c045fdfac3bafc1 | ORPH
>     mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/67e4268fdc68ce418a0c2acb136debf4e10b05ac |
>     mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/8b5b808363be0839f7f8601049d426e9999b2617 |
>      mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/190a67181fa3be287f55a383c82584abd1b88ad0 |
>      i586     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/11a34e8c742323319099745de53f2ae3336bdee5 |
>     mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/3d132106a3c25323c2ef6af5d37c65db6d99d278 |
>     mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/1b1317ec88032fff37bd290f47ef86aa34187d8f |
>     x86_64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/c21de59f46ebce4bfc1a358371aea7526fbb5f78 |
>      mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/ea9c50c5cc8bd6568f944485401764316f02541e |
>     mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/47653f1e2aee6f8b73069a3b4015fa639ccb456b |
>    mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/42c1ada2b48275159fc76d255467687412b40880 |
>     mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/3b6413c3a0af51d710c96bcc209b9d100f922c96 |
>      i586     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/4af08826316223011d91103a0114f0ef6110dfac |
>    mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/886f519550e4424d2e6d6a51ae793b49a3b23461 |
>    mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b59a568d07188be4d7512737bf05fb90e8e3b353 |
>     mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9eabb8077304018aa6329a3536204174a1730585 |
>    mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/592a4e2b0bc3d9fa83e7dd51d7e20b6f96e1fa4e |
>      i686     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/336ff3cdf31a989c27218978f567a833d2ea3113 |
>      mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/718afc471888febde2e6c04f5243426b679c66dc |
>     mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/18352112b0b8cc0633943889e10d4f986f27a16b |
>     mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a3a8263e9992ce87b2410c173f8fa37e658f593d |
>      mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/8878ea02f3a3f68b674d81f0a612695d88777a6a |
>      mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a0f89238af437804d3107d237d648b3a4b79788e |
>     mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/04ba8d784c1530432096f954fb36f49fbeb0d3cd |
>    mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/77b8da8f211c1480eeed2258269caf108e36d2c4 |
>    mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/4e09769835ecbf6d2553d4c4c27df165d41fb207 |
>     mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/03ccc807d2da2890ceb75b6a005c1926de1163fe |
>    mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f73a09ede16ae523af9f7dfb3ae9f9dc5a18e14c |
>    mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/03aa0eb2a4356e90679c4149eb737cadaa7b4c61 |
>     mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e4993b81fa5e6ad0aec915285c7ad5e222c2f001 |
>     mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/58ff388589d071962e86d3e534aa5dcff0811815 |
>     mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/36e123f36e96de6953b28e3aedc9aa176706c2f1 |
>    mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2018526485d4aa5ff3f49641004784ee3ca43168 |
>    mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/6086616436b3dfd6b500993b671d5609b9bc3680 |
>     mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/86f036dd9fb4fd5d03a5f6a5aed23ba137c72573 |
>     mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/7ce5e4aa7a4359f78349a7c7fdc68b7a7ae35822 |
>     mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/8bed3ee098635e4033ff7a8fa97111f7e7b4dac5 |
>    mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e166111231b813850ffb2913b47ccc11fb8fabe6 |
>      mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a84c03c0c13fe01f5a5bebdc8dbecfc79a713971 |
>     mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ff1e5d45214ea6c92e7945d0564114ebc7af412a |
>      mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/845f79e487afc382f91d0bd68ff1bf471652303a |
>     mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2d367d1791f35164cab042f41ccf104c822f872f |
>     mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b12e5c451deb486b2fa298552a0890bff89955ea |
>      mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/0d55d60d268f97846a1152f498bbe948eaae8c23 |
>    mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e48032a2f5207b572b51f00c2fe3a6f0aed365b4 |
>    mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/996990c6c24a888e0f346af8aca7fd52ca2ce2b1 |
>    mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f42931eb77d700b2c68248e4f512a23f840fc178 |
>      mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/67ab851d8d2fd1ff85b252c08b131c98a725fc3f |
>     mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/227419b4a7733644b9bcb33296800d6be7181a16 |
>    mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/847f7794732be22e2936abc69041c78499348992 |
>      mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/98b968cf94657070d6072aae139511a20bc4b393 |
>     mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/3ad17b5ef035dbef2d63a79eef92a6d1c0403660 |
>      mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/48c05c8f2cc4a958c4ef90680a8e28fa6e285eee |
>      mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/49801ad35e97a82c417415b55cc34a9cf48d52fc |
>      mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/cf74712ae717f6093aa388150579b08588ae7930 |
>     mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/3d10073285fa5c9b8021b2c2df124766aa727186 |
>    mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/809b7df131b5d6bb73d44f51b645b1d7e0f933eb |
>    mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/80af37929a98298ae98fc4626d2757fa41076214 |
>     mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d1f65c201ca17e403ef73b3ca003a129b95eef1a |
>    riscv64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9890b4f3b96e66762bb033ccc8c66ea77db69ffc |
>      mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e2cef81afed0bbccca6191571274bf249ae680c5 |
>    riscv64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d4c00a136559ed33be1fcdab9b9ce566f45d65b9 |
>     mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b89ec8706fc084efab30bf030c2c997f03f69aa1 |
>    mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/749be88d4df4dab6b3adfbb8b5d915816efa5418 |
>     mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2498a81f9e21e8f35d9641ae7d0fe7dd08c29a40 |
>    mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d3352c5779f78c1e04a392f10d46dc6109b43751 |
>     arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/3c65ad0f049fbaaeb4cb70e9037836dafa9a8715 |
>      arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/176457cdbdd39f1860ecd3e80795775b96224ab8 |
>     arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/2ac12f9e2a26de2e92c4cd7af897fb8f16337b05 |
>     arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/688e7862076316b4ce5f104c4dbe3159d7434fe8 |
>     arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/2894e464d9e83e866d9df390c9592f270e6d8752 |
>     arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/1e1e7d1ebbf9693f8008d60faab0f4496d903e90 |
>      arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/063d59ce23d8a31cf0bb680d58cce30b27c2f58b |
>     arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/134d80f8159f96e90c37f72d57afd5af875d2e9f |
>      arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/a6525ee55766b866377e6354db692bfc00d6abb8 |
>      arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/26ea6bb4f56dfa903d26ade4b3cd9b3df8f92e82 |
>      arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/043e653385c508734e99c17853855bb4f6d8a26f |
>      arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/5c305fe5975c8b3a5213ab711629b33c94fc7754 |
>     arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/8b74a1ce1f740d328f18c569663722b1b266668b |
>      arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/a7f13aa5f0a7f1dcbc80811e14fd5b7048a16389 |
>      arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/53d031e21321e7f64d59d465dc477f5ed335c5ff |
>      sh4a     |  host-bootgen-xilinx_v2025.1   | NOK | https://autobuild.buildroot.org/results/e28f37135284615a146f1237a14e2f6034788d20 |
>     sparc     |  host-bootgen-xilinx_v2025.1   | NOK | https://autobuild.buildroot.org/results/c215a2f97fafadee76217796f42abb50b28faef5 |
>     xtensa    |  host-bootgen-xilinx_v2025.1   | NOK | https://autobuild.buildroot.org/results/e12076d8fec618e0dc614d44ce8d367e39ce5efd |
>     armeb     |  host-bootgen-xilinx_v2025.1   | NOK | https://autobuild.buildroot.org/results/ba60ed9d6c1b8e463392fec26c8e0bb6cce7ce7f |
>     armeb     |  host-bootgen-xilinx_v2025.1   | NOK | https://autobuild.buildroot.org/results/0db0486ad4817f805fa9e4cabe86ee06150932a4 |
>     armeb     |  host-bootgen-xilinx_v2025.1   | NOK | https://autobuild.buildroot.org/results/79d9d4dd3eba9f99ce80658333755ef31baa2688 |
>     xtensa    |  host-bootgen-xilinx_v2025.1   | NOK | https://autobuild.buildroot.org/results/242b2c4441b2a3064e1930b37143a645e31d41a1 |
>      mips     |  host-bootgen-xilinx_v2025.1   | NOK | https://autobuild.buildroot.org/results/7cce0100ca9b13d70557e423d25d843b65c8bd79 |
>    sparc64    |  host-bootgen-xilinx_v2025.1   | NOK | https://autobuild.buildroot.org/results/48d5b1ce5ce284a18169674e3dfab88df27c4c6a |
>   microblaze  |  host-bootgen-xilinx_v2025.1   | NOK | https://autobuild.buildroot.org/results/1ca103ae031463a63bcb56c6e6b2e69b64335275 |
>     s390x     |  host-bootgen-xilinx_v2025.1   | NOK | https://autobuild.buildroot.org/results/fa5d90f2314038520d8e6eb01508b5ddf4ab43b8 |
>   microblaze  |  host-bootgen-xilinx_v2025.1   | NOK | https://autobuild.buildroot.org/results/f1de83cf0eaf39974969fe80a4c284ab46a7c5ed |
>      arm      |  host-bootgen-xilinx_v2025.1   | NOK | https://autobuild.buildroot.org/results/ebf184093d363cd8d9a6454445ac83bddb7ff780 |
>     sparc     |  host-bootgen-xilinx_v2025.1   | NOK | https://autobuild.buildroot.org/results/43fe3d3c46aa775bd63665d2dcac0e74c269a0ba |
>      arc      |  host-bootgen-xilinx_v2025.1   | NOK | https://autobuild.buildroot.org/results/e6cbcaec60bb4f70c53463b9e88c971b51d44c77 |
>     armeb     |  host-bootgen-xilinx_v2025.1   | NOK | https://autobuild.buildroot.org/results/d54af15b4b1ea379beb446780bb3091b7a892729 |
>   powerpc64   |  host-bootgen-xilinx_v2025.1   | NOK | https://autobuild.buildroot.org/results/955b9d58ffd1f8cb6c1bcbe8d9e440b54463d245 |
>     sh4eb     |  host-bootgen-xilinx_v2025.1   | NOK | https://autobuild.buildroot.org/results/0156081cc26461063e787fb7b1ec612158ec4c35 |
> microblazeel |  host-bootgen-xilinx_v2025.1   | NOK | https://autobuild.buildroot.org/results/6a5a11f9c7455ce7b16c0352580ab17dce6041df |
>     s390x     |  host-bootgen-xilinx_v2025.1   | NOK | https://autobuild.buildroot.org/results/b4870d72e63381e6dccbbd9dffdda25e65fb0ac9 |
>   powerpc64   |  host-bootgen-xilinx_v2025.1   | NOK | https://autobuild.buildroot.org/results/3017d0e19e2a0c7660aa4b6f11d0879e2dceb496 |
>    riscv64    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/a3e7c5e2bc836edcc2726885991b3eb231d7e5e6 | ORPH
>     mipsel    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/290478f5cc1608648d3ded9e127548a2eb5f53d2 | ORPH
>      sh4a     | host-firmware-utils-86739f2... | NOK | https://autobuild.buildroot.org/results/e21e67b3f45f7fef15afce62798e81f4c7e2b174 |
>      i686     |     host-gcc-final-13.4.0      | NOK | https://autobuild.buildroot.org/results/d6f74ad9e167c58e1adbc8fef8ed41334c45b64d |
>     s390x     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/dd2dec350253229e1c2b686866986456b70ea5b0 | ORPH
>     armeb     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/9000a939e138b96a4eeaf22db1a3c96d7646a8dc | ORPH
>     s390x     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/cae7803829b61cd11fd9ae7eea1f583353bbe2a1 | ORPH
>     arceb     |  host-gdb-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/803376d7f5f6792152dafec8a35dc0a51b44f9b5 | ORPH
>      i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e252044acbfa2a9555a077b187e2d7d695d33416 | ORPH
>   powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9f11c8e9ea42c07c5538f4abacc09ce87294224e | ORPH
>   powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7bf6135ad4315f30f021aa63a3ed63d7caab1c03 | ORPH
>      arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1fe9b4873bd357e3fe273aef6b1c6714afe17969 | ORPH
>     sh4aeb    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1e58370e64d4e7acc222674c7fe5ee58ffb72aa5 | ORPH
>      arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7ad84c58878e7dd6c134531613a141bbb64b7f86 | ORPH
>      i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/336c967bb3af8d6ff9b504ad76482a408b2b9c9a | ORPH
>     s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/52d7fcfa35628fa6699d6f724f1d0d2d49a662d3 | ORPH
>     s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/87698280a0cd9d83ea3e1b38537bdc026c327fe9 | ORPH
>     s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/771bd3804f45b615737c79d3c257f6a657d8fc3a | ORPH
>    aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4ac4d713b6c87efb381c8d73cca01919ef98892b | ORPH
>    sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b9872b0a4bdadc5d7cf601496cb18e29db8c426f | ORPH
> powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4e6d7302f6da91f23462a0c35421d943fb930b89 | ORPH
>     x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/34b4d516dd84b5dd6d8dd03e8f667767ff3326b9 | ORPH
>      sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4b5816bdbd8fec957c89417addbbfb374369ce4e | ORPH
>     x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/196908a663cfb3998dc689263d0ad83a7e0edb00 | ORPH
> powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/44a59a9bf578ef56012d57cf01f33441ff68909a | ORPH
>   powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/08e146473c93596327fd7163c471d7ed4bf6d7c8 | ORPH
> powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3f95537fd746d23c0f4deba24a4b9e88057210c4 | ORPH
>     s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2f89c6d93868918595dc19326841c99b0deafce0 | ORPH
>     s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e7e931eb0821e0ea7c6b7285f57dbb26c8ce41f5 | ORPH
>    powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/bf03eacb77a247a8ed64244c64091c143115284d | ORPH
>      m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/675b371f1e39d9813ce1f006d23ba7f69a1a9db3 | ORPH
>      m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d0f73b4c9c6988c47b0187d26831f43fdda6b770 | ORPH
>     s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f48419cf05d8447aa2fcd21ebf6a973e22406de6 | ORPH
>      sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ce299a09b280360b313f2bb83cbda7e9efd75014 | ORPH
>    sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b8574700d29b023553282808533c0ae79262507f | ORPH
>      mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ae873bf7fdc383c48615dfecf22c7ca9a94c453c | ORPH
>   powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a5fcee9568efccd35f8acda38b70c66088fa264f | ORPH
>    aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0ef64ec085838f63c3772ebecb638bdae69cf56a | ORPH
>      arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/bbf7c4c1ce12cce5bea6ab38466d50350895ddbc | ORPH
>     s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ef9cde84e1b1324dda25f5a8bf39ba80ac20cce0 | ORPH
>     x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f01859a479fb952a10e97ebc48519353d42efd24 | ORPH
>     sh4aeb    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/bb12d8397f545c3845f00228cf25eb9afec38a0e | ORPH
>      m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a48ccee7e9eea14b1a4af239e9a39d83fcb4c6c7 | ORPH
>     x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/30aeeb0bbfb9b3d5f864e843645fff86037da1c0 | ORPH
>      m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/058103b0ca7b9d424a734d04183ecf2619dcca2c | ORPH
> powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8d250350b9fbd9e284c5daf16d8627e5e1b79515 | ORPH
> powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0139b71506a403f29add10f4e7d6894b17703ebe | ORPH
> powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1072c02a502dd24e912dd70a412766b2decbb634 | ORPH
>    sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/334206e13683eedb7cb0623fcbfb51d2393ed707 | ORPH
> powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d633e9d97de51cc38d044f8defc5e9d0fa0ed64f | ORPH
>      mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/31a29de828de6ea8515784d1f720c34411b785fb | ORPH
>    aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/edc9ba4d99b6b8d0f49ea74708a98f30c330c8f5 | ORPH
>     s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9f16b0150ffa7f6fcb86733d502871bb943356ae | ORPH
>    sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3aff7811d81ead2e6ebdd27bc29d1498e8c16a7d | ORPH
>      i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e829c03f208846c52fd9f19f2852cba8156aa8de | ORPH
>    sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a969186773e7183deb30b3531a2db4b0bed94253 | ORPH
>    sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f10ba9ba0ebefa354d874204f71669c1322b1877 | ORPH
>     x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/941e3dd0dc55b7a83054da75f7b84a6d283cc5d4 | ORPH
>      sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2f7077c528870323649f80eaeccf3ec01d772f7a | ORPH
>      or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f310e72507bb25de245880bddc97aa047a4f52d3 | ORPH
>     x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3938714658fde468f761257a8a75432a2f708cdd | ORPH
>     mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7f8a5ef62b75aa7738f914e1b6e43a21a6f1dca3 | ORPH
>      i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3b99a914a56c44cb2e2b8b608f3c19d9ef0bbb72 | ORPH
>     xtensa    |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/69cc4a4bcf5d6dded1ce54deba5bcfedd5fe267f |
>      or1k     |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/e985ab47afd66b42271b091f3867a4776d47e6a2 |
>    powerpc    |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/5aa35cbe9a15914dda70b48af90fcec60a7e10e2 |
>    sparc64    |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/87471a6429f88f082a312a4014f7173ca3ef5522 | ORPH
>    sparc64    |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/4ff361741886a4206eaa0a4c685417a7c716361a | ORPH
> powerpc64le  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/2ad013045e0a8264db524bd20baa9457c3f97b81 | ORPH
> microblazeel |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/5ab627d175a6a8a56d0ed142a3f54d388ab96dd3 | ORPH
>    sparc64    |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/3c3d621971b2ddf688286ef9e7534ca13a31d2be | ORPH
> powerpc64le  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/de4faef284ff0a28a42e2521f02c02a1d0d699b1 | ORPH
>     s390x     |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/97552fc5303cd48351898292964686f98ccb8679 | ORPH
>     x86_64    |  host-python-glslang-11.13.0   | NOK | https://autobuild.buildroot.org/results/04b115384643c911287a033a8f1296db7efda5a0 |
>     x86_64    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/a8830d2d4b932dd3453d3792883f59955dbbf4ef |
>   microblaze  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/89e1d7ce695ac655d1f1a2fa85b8677026cdc3c1 | ORPH
> powerpc64le  |      host-squashfs-4.6.1       | NOK | https://autobuild.buildroot.org/results/ff5ae9132bcc864ed156de6b815951d8d690b2c0 |
>      or1k     |      host-squashfs-4.6.1       | NOK | https://autobuild.buildroot.org/results/cf4cf18e8387192d13efa5ef446961624db242f8 |
>      or1k     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/bf320242d4b412bf771fbbf1909b6ae4cf39c887 | ORPH
> powerpc64le  |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/1451336400095c2f9e638403c3cf957924ffbb9c | ORPH
>    aarch64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/7f7a71f374769cafe243151fa9283d958e3fa923 | ORPH
>     sh4aeb    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/db06665cb77d27864420e81e056a6aafd8bf803d | ORPH
>      or1k     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/b168135568493b8569834502633e462d9bf334a0 | ORPH
> powerpc64le  |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/647cb12389703270dfd3fa0a8f0dc6fa60b25f0b | ORPH
>      or1k     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/e713fdcdaf42d97da69a1e3d3b0299d34994be05 | ORPH
>     s390x     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/bacdbf61d762606a9d2a21d73de882e21adf32fe | ORPH
>    sparc64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/dddf9a8d120c4225824cfe74d38835c56fbcb37a | ORPH
>    riscv64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/63cf862e431806021bb7f7401fe56d4fb3bfd39f | ORPH
>     mipsel    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/d0890e48e35bfca2a426dc1d39b26b1b0ab42a55 | ORPH
>      m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/659d48e3d04b4de7aebfa157f49fe123d2c761d7 |
>     xtensa    |         lapack-3.12.1          | NOK | https://autobuild.buildroot.org/results/b996b65c959c65a7519668fac22363c7cb41fd90 |
>    sparc64    |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/415d81abfc1dcccb81ea2a30c1f40ad64d22f413 | ORPH
>     xtensa    |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/cd7b43725f66333e0875cbec34e5c9bed9e0c6ae | ORPH
>    riscv64    |        libcap-ng-0.8.5         | NOK | https://autobuild.buildroot.org/results/aa165d9c8b57daf043c07cb154c2a87d903553ab |
>    riscv64    |        libcap-ng-0.8.5         | NOK | https://autobuild.buildroot.org/results/ed56adf174a24d22671f1a64c057e11ba6e0b92e |
>     sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/7384e6316fd8308579abc61ed5825c7fadb61660 |
>    riscv64    |        libebur128-1.2.6        | NOK | https://autobuild.buildroot.org/results/da6db264fd2004c65c15353f7ab975d87c560e68 |
>     x86_64    |        libebur128-1.2.6        | NOK | https://autobuild.buildroot.org/results/82548d9570ab9581ea2d5cdd51cf440a9e30716b |
>     x86_64    |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/d114c5f0a9da2ab5c38842715eb8131a99a53daf | ORPH
>   powerpc64   |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/36d7136da53f9212435c43e852758456ece7b7bb | ORPH
>     x86_64    |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/ac10e66d39c0b3f98e7527ea5e39ae44215ec3c4 | ORPH
>      or1k     |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/7e0d16745cf097afa671055e96537675ba2fd857 | ORPH
>     s390x     |         libjcat-0.2.1          | NOK | https://autobuild.buildroot.org/results/593fe565b508a0f903019ad22b176a75c45a6078 |
>     arceb     |         libkrb5-1.21.3         | NOK | https://autobuild.buildroot.org/results/c0fd603080389e7ce5d16fc6bef6926ce77eb9b2 |
>   microblaze  | libmodplug-d1b97ed0020bc620... | NOK | https://autobuild.buildroot.org/results/e3ea8ed6276989e3a05f91bd8e2b8f5f64c3378c | ORPH
>   microblaze  | libmodplug-d1b97ed0020bc620... | NOK | https://autobuild.buildroot.org/results/2b50eab97d6b8a287898f677e39f1479711478ff | ORPH
>   microblaze  | libmodplug-d1b97ed0020bc620... | NOK | https://autobuild.buildroot.org/results/e2c861f19636620330af99c33155b8b8cc662d8c | ORPH
>   microblaze  | libmodplug-d1b97ed0020bc620... | NOK | https://autobuild.buildroot.org/results/73f5c0f08c431e06af4787574fd1f4e5e036994e | ORPH
> powerpc64le  |          libnl-3.11.0          | NOK | https://autobuild.buildroot.org/results/4e4509ab4b41fd5891a237a04f21be4c25bc8c0e | ORPH
>   aarch64_be  |       libopenmpt-0.7.13        | NOK | https://autobuild.buildroot.org/results/e26711daa91016c852141337fedf2953e94cc89d |
>    riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/2c6833208d7e027f041e626a49e27885382e1532 | ORPH
>    riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/7e2c726ad836c1b879288b1f9293d016f267cc03 | ORPH
>    riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/edd21457ecb57bf9a9f48542cad03c883479449e | ORPH
>    riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/e6e0a339c2064cc1b17f2189df40739384208687 | ORPH
>    powerpc    |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/0b21d0ebff265c559af4e4ea8cca7635f96116f2 | ORPH
>      arm      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/27c0cacfa01586d7b079c52ef8af56b3747e075f |
>      or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/4c34fd48fbde4c8ca01f091cc02ff812e26483b3 |
>      or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/a421d4e537a4ab1b2ca2aeb36997dcbea0b135c7 |
>    powerpc    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/d420781054c2793d911651e728d145ffd9a97dd3 |
>      or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/bcd1eac8418e1bd072223fcb7b99a588aca21110 |
>      or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/47262416f88e660787cf7660885a2c3f12cfcc98 |
> microblazeel |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/bc08c0aa8d4eb02997b1361d5cb395a02b89d8aa |
>      arm      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/13aba66a8354d4f8efe968d823a9126f53c31e49 |
> microblazeel |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/ee09d9956eb78608268877d303e1313a3b7147d1 |
>     sh4eb     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/f45d1dd3d69128f7bddbf57e8a772ac9cff6a007 |
>      m68k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/82d720ed5bcba85ee746c26d4affa99b1c92deed |
>      or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/7f771cf05207d9f00a15df298835e9ce9387e3b3 |
>   microblaze  |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/942d6377a7759a97625619415137c549a6a90599 |
>      or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/c7fe2ed4f10cb54207e34e943dc715c32e964e31 |
>      or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/c15bd663d4b6e4aafb9e45f628119e91134cc6c7 |
>      or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/4f6eb19430a521846bd9fa43c98a8ea94ea19855 |
>      or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/40b06d465980739638f5a19972ee9b7d760a4ce1 |
> microblazeel |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/7b47f0d2d11fa9eef4bb92cacf3eddc42876930c |
>      or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/e5a0efd1190089d850883fbe821eff2126c69288 |
>      or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/76cc38f04e4f0fb0ea8e151c05b051568b3fda3e |
>      sh4      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/aa45079a72695e9f30bee8fb3f7fe37df64b76fb |
>      or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/8fe86acdff0e2ec0a9a49f63d6d4163f01d3c640 |
>      or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/65fb48baa99ccf4cb79eff6af683416aee2cbe63 |
>     xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/c2820b190bdf6168f5d1cbf4a3278d6ca5ee53bc |
>     xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/509b3f12c13f00d50d1f2e92876fb232f36c98f2 |
> powerpc64le  |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/fadde8f32a51bdda205cca2a8b1babd16428d282 |
>      arc      |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/3c5d35aa8a90defa35c70084c265e087bb28618e |
>   powerpc64   |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/d6dfcd9b8eb9afa85583eb4663f57a8b7a059811 |
>     armeb     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/aeed92eab72aab804a9bec4f94559ca243ec7643 | ORPH
>   powerpc64   | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/c66b1b6d28d7407a2b6000e916b083c65e05fd2f | ORPH
>     sh4aeb    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/7bb2d58cd575036937b769957f7c171c85311084 | ORPH
>     xtensa    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/0d75d0f4794f5a73d8ad52e8bf05b87879e4e5ff | ORPH
>     mipsel    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/6accdea55582b56822ffe96a2f2aaa7d8c27b603 | ORPH
>   powerpc64   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/7f2560145b4736f82245ac82679a1538db652c52 | ORPH
>      arm      |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/77bf937cb7c57b18958c36210cb1d9c01c82595d | ORPH
>     x86_64    |          linux-6.15.2          | NOK | https://autobuild.buildroot.org/results/e6ed493d985d61a56d20ab79e856b991587642c0 | ORPH
>      i686     |          linux-6.15.2          | NOK | https://autobuild.buildroot.org/results/099751e5cde20a749ee3f6b4ea501fd2b65c4ec8 | ORPH
>     sh4aeb    |          linux-6.15.2          | NOK | https://autobuild.buildroot.org/results/2024d3dff82b0ae91d6d504565f7de28dc6c71b0 | ORPH
>      m68k     |          linux-6.15.2          | NOK | https://autobuild.buildroot.org/results/95a57d484afd9816aa4ea6d1b94bc855e00eb001 | ORPH
>      arc      |          linux-6.15.2          | NOK | https://autobuild.buildroot.org/results/3033fbca015efdf5184a8f367df77aeb01092ac1 | ORPH
>     sh4eb     |          linux-6.15.2          | NOK | https://autobuild.buildroot.org/results/b20fb9f2c179a9d5f9a5046241e5835a0469de3d | ORPH
>      m68k     |          linux-6.15.2          | NOK | https://autobuild.buildroot.org/results/ad318af7a0b6f90882f3791b38790c9ca551e350 | ORPH
>     s390x     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/d9bb9aedb578f98bc8411ea065caba41ee4e5032 |
>     armeb     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/02cf1ee070f63bb39723685351f62fd8d60bb6d3 |
>    aarch64    | make: *** Waiting for unfin... | NOK | https://autobuild.buildroot.org/results/590bc0211651a35b3eac8580f9f884a925c423d5 |
>   aarch64_be  |        mbedtls-3.6.3.1         | NOK | https://autobuild.buildroot.org/results/3d62754c5a777113eecf771ce49aa51a24edd3bb |
>     armeb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/1df6f56aa0c04b9990b2c6786c022348f5cb26bd |
>     sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/283fb0154feb95d92f983c6596f0a0e1127dcf76 |
>     sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/c12ce5a15b76347bfa3dd4567e350fe2531b5895 |
>     sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/6341325ab76ca909fd6024edbc7efb1135b2c699 |
>     armeb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/9f4d59c4f1a7e239833fcbd7b1b14586b638b27a |
>      arc      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/8d6b76cbe2643abf64ba8e5bc7ad3cb7153bdc54 |
>     xtensa    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/3a513e8a07e4fadf556a35b6055b99e891c5a11b |
>    riscv64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/2f93b3b7f93f8dfd4202d0cda81bccff8f7f5fb2 |
> microblazeel |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/2b22f0a2cffcccfc509ac80c6c1cc8f3e4aff166 |
>   aarch64_be  |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/24d51ae5c64b875cbd293312aa71d199a3d066ac | ORPH
>   aarch64_be  |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/5b371672e3638c700b9f515aa94dc4d2188901fc | ORPH
>    sparc64    |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/00fe84ee510b2e4bde1577c3c8dadbe2a40cf600 | ORPH
>     x86_64    |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/bd8d7266e07daaea05c7d0519d65a8a391bd082a | ORPH
>      i686     |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/f69868409e66c0b792de979eb05a475b7657c651 | ORPH
>     mipsel    |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/2bd36a7cfbc3fb5f51fcb1f11d3d3b1c9089951b | ORPH
>     x86_64    |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/63cf58a1959ee8bda19f5d62d27b3446c1615b1f | ORPH
> microblazeel |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/c51378bb6c566a964e210cae062ccb70db19bf31 | ORPH
>     xtensa    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/66735177d163cbf7b669728c72020febc7d976db |
>     sparc     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/62ffec58c961865f23f447bfc1c409ef1f1e2915 |
>      arm      |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/279e45d94d28cd5b99243fec541b78b825fabf6e | ORPH
>      arm      |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/925ff60ca1c32dae61011ef5b50bfa1551c58156 | ORPH
> microblazeel |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/fd65507722c8ec13e652d478eb4fd5ba5fff8d62 | ORPH
>      sh4      |         python3-3.13.3         | NOK | https://autobuild.buildroot.org/results/16cfae1469b1c1a77dc9e0c24642fecfc43152dc |
>      sh4a     |         python3-3.13.3         | NOK | https://autobuild.buildroot.org/results/83fe8c9b06eccb502c8cc1e5a6b39876fcdedea1 |
>     sh4eb     |         python3-3.13.3         | NOK | https://autobuild.buildroot.org/results/757da836204b57456c56058ace84a8a9337cc1be |
>     sh4eb     |         python3-3.13.3         | NOK | https://autobuild.buildroot.org/results/d650df4e18c8d6b6621496f4c8a226b16eb67cf0 |
> microblazeel |         samba4-4.21.4          | NOK | https://autobuild.buildroot.org/results/d365aba26b2a685f68dd3834bd5cac8de7bd92c2 |
>    mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/ff9b1a0251fbe73cd6c91051e8b38f9b4fbe36fa |
>      sh4      |            unknown             | NOK | https://autobuild.buildroot.org/results/c02246aba5db7993df14137f941f3121b85c4ee5 |
>      m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/bcef376cfc7dd0604aa1ebeb5c0390ef480e2c5c |
>     mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/e02a334af9cf3d88a282bcc271e35a9069a0ed5f |
>      or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/e1b9e856fd26c7b19325a0203902a29328b7917d |
>    mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/40b30def4fdc79afa6a9ac959a78b5ea89d325dc |
>     sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/07bf1bd3d84b2b157a58c0a1b371f35f55fd0e1c |
>     x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/5fa2480fd4f76c0d556b68343bf1accdaae4cfc1 |
>     s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/b4893f3e14bb3499d3b1a1affca24e3cfefef550 |
>    mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/019f72c304eebd50d498df3555792f10926bafa7 |
> powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/a7c0daa75e5593c2056af4e4e286631eebc9f459 |
>      i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/dcac672598cdb833f213d9cab870fdc29fa86e37 |
>     arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/c5150c1143a9f4ae2d93c3550fb7682a537f1af9 |
> powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/462864a370ab96900a2e9c9a8fee948a36cf4001 |
>     sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/a8eed18a227e08686660f08a05dca14b0c024877 |
>    sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/2c4a2641341535986bfdd3f3d35de3661012bc0e |
>    sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/f2c0d3d91e662026477e6810984ac3d3e0ceb271 |
> microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/8df027bec0f8dd382bcc4d7f05a37c447fea88c7 |
>      i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/a3c2e9b0b8073873d6032ba0a503064cc49356c4 |
>    riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/a9a881c24e00a8bb8538c0f2b121af153be352f8 | ORPH
>      arm      |         watchdog-5.16          | NOK | https://autobuild.buildroot.org/results/859db341b358d6d11dfc201b87b44136f482728d |
> microblazeel |            x265-3.5            | NOK | https://autobuild.buildroot.org/results/5c97dc91c8ed1f8de01719b6df364f26ef30becd |
> powerpc64le  |        xlib_libXt-1.3.0        | NOK | https://autobuild.buildroot.org/results/fac77239e7c7ee18a62f113873dca02c4c21545d | ORPH
>     armeb     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/f43552bee31d8358c88b9834b4f60653eeae2249 | ORPH
>    powerpc    |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/6b6a16c37b4c69863c8a7f8b4f94e96eab500dcd | ORPH
> powerpc64le  |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/61dc30b7c88315fdcd9dcc1af976de22fcb5cfc1 | ORPH
>     armeb     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/06a8c25e07f129ab4d0a6ae31525d55a1ef7f7e8 | ORPH
> microblazeel |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/a7d8b4e790805b80c62f548bb341279d17e17d6f | ORPH
>      sh4      |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/fd5832488f843b2d50667541d7648854be6de748 | ORPH
> microblazeel |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/e025fc5d5c0a3ea3ecee1bdc42633bf7048c3859 | ORPH
> 
> 
> Classification of failures by reason for 2025.02.x
> --------------------------------------------------
> 
>          edk2-edk2-stable202411 | 1
>                  elfutils-0.192 | 1
>          host-berkeleydb-5.3.28 | 1
>               libgphoto2-2.5.27 | 1
> x264-baee400fa9ced6f5481a72... | 1
> 
> 
> Detail of failures for 2025.02.x
> --------------------------------
> 
>      arch     |             reason             | OK? |                                       url                                       | orph?
> -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
>     x86_64    |     edk2-edk2-stable202411     | NOK | https://autobuild.buildroot.org/results/15de5ec901ca041f5c54d19ab8b414a035794acd |
>    sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/72714bb181f81c6dfafaf4e6dc43af252f3541b2 | ORPH
>   powerpc64   |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/8963c2325e303fc46773ecfcd3f92109c9df5626 | ORPH
>     armeb     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/c02502bc9e26288ba983ffca83b85bf9cbcf856a | ORPH
>      i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/71b20dd1c1da0936278f46b0f2e587477665bc12 |
> 
> 
> Classification of failures by reason for 2025.05.x
> --------------------------------------------------
> 
>                 bctoolbox-4.4.8 | 3
>                      bmx7-7.1.1 | 3
>                     avrdude-8.0 | 1
>                  elfutils-0.192 | 1
>             ghostscript-10.05.1 | 1
>                host-rust-1.86.0 | 1
>        passt-2025_02_17.a1e48a0 | 1
>           python-remi-2022.7.27 | 1
> 
> 
> Detail of failures for 2025.05.x
> --------------------------------
> 
>      arch     |             reason             | OK? |                                       url                                       | orph?
> -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
>    aarch64    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/dd2f53eb6cff87eb46f3d44057123bbd7c3560e1 |
>      m68k     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/092d9ec92387121fff357a1bf9210744d61a33b3 | ORPH
>   aarch64_be  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/72bf91c63ad93f1f8410188ae8b9d83b2308592b | ORPH
>      sh4      |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/53b3408e8dbe89c9f56ef7566886f98f59e91a90 | ORPH
>   powerpc64   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/1ab995b88f6a5e26749f4fd06aa79797b8a12a37 | ORPH
>    sparc64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/40efbf1114113612d24917a4f1b4b082cdbaae9c | ORPH
>     s390x     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/b7aaca6ed489685c4f183815b17b875084959580 | ORPH
>    sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/5a6a9811602f1e4e7fac98e40b8d57d268f173da | ORPH
>      or1k     |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/6782071acff38527cd9c274ae4200e6515d32a8e |
>    powerpc    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/0936094cb35e41cf52f37383e6e7e72ca3d0f812 |
>     mipsel    |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/4ee4e9d90a00e878333ac6364b7414353664a216 | ORPH
>   microblaze  |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/a16cf5105d4b726b5d4136a2d8f82abcfdc0faba |
> 
> 
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
