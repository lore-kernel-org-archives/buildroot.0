Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8253EB64DD
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 05:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E51E560A97;
	Tue, 25 Jul 2023 05:40:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E51E560A97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0YPC36cpV77z; Tue, 25 Jul 2023 05:40:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B91D60A9C;
	Tue, 25 Jul 2023 05:40:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B91D60A9C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8C4521BF319
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 05:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E874818BE
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 05:40:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E874818BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SUKAKdnwf-QZ for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 05:40:17 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F3699817AC
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 05:40:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3699817AC
Received: by mail.gandi.net (Postfix) with ESMTPSA id D3952240006
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 05:40:13 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 05:40:13 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20230725054019.4E874818BE@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1690263613; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=h1xPfyp5XJGsEifG1l1NuAnjb66WtijA8/m7QJ42jv8=;
 b=icGsbe0h1N9Wo3r9y97HSlELCt6Wp1wZotWMHxa91d/oTVBc5aO1jtRh2NAr8cA7HVdIk8
 J/KcEvoU5xd2inUHMrnhB1sHcc13vWXvH4+k/4xQdE27zIgsDtYpsomGWK0zHJof0nmJtH
 bOi83HrJKPIkDiDiafA6F/Afr4o3HeirPVAUoaM0ZRUwBfSvIYM8W4ykH+4Lx//PLafdMl
 0jRMYTOlde3IuPw0EVCl8T1bYusEtjOSkAI6P5FCeVxK6qk/o2WvEgB3Hu3xKNSDEiVfkZ
 I0AYJ+dYqpbszniNuId9ZvDnuKgcT/s4wb6Kq3RsygPQBvGDHj8bYTkfjxVjCQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=icGsbe0h
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-07-24
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Autobuild statistics for 2023-07-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  6  |  2  |  0  |  8  |
  2023.05.x  |  4  |  5  |  0  |  9  |
    master   | 98  | 124 |  2  | 224 |

Classification of failures by reason for master
-----------------------------------------------

                   gupnp-1.4.3 | 11
            host-binutils-2.39 | 8 
         host-sentry-cli-2.8.0 | 7 
                       unknown | 6 
  gobject-introspection-1.74.0 | 5 
                host-go-1.20.6 | 5 
                   linux-6.4.5 | 4 
                gnu-efi-3.0.15 | 3 
               host-qemu-8.0.2 | 3 
          linux-5.10.162-cip24 | 3 
                    olsr-0.9.8 | 3 
              open62541-v1.3.4 | 3 
                  bind-9.16.42 | 2 
                elfutils-0.189 | 2 
              fluent-bit-2.1.7 | 2 
glibc-2.37-2-g9f8513dc64119... | 2 
         gobject-introspection | 2 
             host-ccache-4.8.2 | 2 
              host-rust-1.71.0 | 2 
          lttng-modules-2.13.7 | 2 
                 mpg123-1.31.3 | 2 
                 opensc-0.23.0 | 2 
ulog-0389d243352255f6182326... | 2 
             util-linux-2.39.1 | 2 
                  xvisor-0.3.2 | 2 
             batman-adv-2022.3 | 1 
             berkeleydb-5.3.28 | 1 
                bpftool-v7.1.0 | 1 
                    brltty-6.5 | 1 
                  check-0.15.2 | 1 
                cracklib-2.9.8 | 1 
           dmraid-1.0.0.rc16-3 | 1 
        edk2-edk2-stable202305 | 1 
             f2fs-tools-1.16.0 | 1 
             fontconfig-2.14.2 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
            gdk-pixbuf-2.42.10 | 1 
                haveged-1.9.18 | 1 
            host-binutils-2.40 | 1 
          host-elf2flt-2021.08 | 1 
host-gdb-arc-2020.09-releas... | 1 
imx-lib-3f777974c0c146817e2... | 1 
               libcap-ng-0.8.3 | 1 
               libdeflate-1.15 | 1 
               libglib2-2.76.1 | 1 
                libglvnd-1.4.0 | 1 
               libsigsegv-2.14 | 1 
     linux-5.10.162-cip24-rt10 | 1 
        ltp-testsuite-20230127 | 1 
                     lxc-5.0.2 | 1 
                     mtd-2.1.5 | 1 
                  ntpsec-1.2.2 | 1 
                 openssh-9.3p2 | 1 
                     php-8.2.8 | 1 
                     pv-1.6.20 | 1 
            python-sip-4.19.25 | 1 
       python-stack-data-0.6.2 | 1 
         redis-plus-plus-1.3.5 | 1 
                    sdl-1.2.15 | 1 
                   shadow-4.13 | 1 
             stress-ng-0.15.07 | 1 
               valgrind-3.21.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |       batman-adv-2022.3        | NOK | http://autobuild.buildroot.net/results/161409acc4465fe4545c83c5cbc054c09a6657cc |     
    sh4      |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/78f109789effea1287e9c74b3a09b51db3019fb2 | ORPH
   xtensa    |          bind-9.16.42          | NOK | http://autobuild.buildroot.net/results/8316e0aad2692918525e7d54f53109b1d272e468 | ORPH
   xtensa    |          bind-9.16.42          | NOK | http://autobuild.buildroot.net/results/afd59d9eb5d43694a512896e187266a1b2596ccb | ORPH
   x86_64    |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.net/results/d73fe61db69fdc8fe1596fe92971679269aa4aa7 |     
    mips     |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/9bfbaf389ee17a2f6d75f270e013305b858e9667 |     
  mips64el   |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/1f1636ed5b4a339ffc63209736d11a5370123dad | ORPH
  riscv64    |         cracklib-2.9.8         | NOK | http://autobuild.buildroot.net/results/462cd3a80faa1eb386eeb4542acfbb68ef4261fc |     
   x86_64    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/323bcde1a4790da2da584e8ae1238123c8e42848 | ORPH
  aarch64    |     edk2-edk2-stable202305     | NOK | http://autobuild.buildroot.net/results/eab98f8ee4a5e3da5a0266a1b8a57c659f675c15 |     
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/6eaa4007aeb690e24c8d414a61685eaec6d8d520 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/b1de69c36b012601c961c4e528323c02e145493a | ORPH
   armeb     |       f2fs-tools-1.16.0        | NOK | http://autobuild.buildroot.net/results/f7205870ce35b70607890a94104d3277fc555ba6 |     
 aarch64_be  |        fluent-bit-2.1.7        | NOK | http://autobuild.buildroot.net/results/df6fa823283cdb6ad2c20578b9a5013abd54322f |     
   s390x     |        fluent-bit-2.1.7        | NOK | http://autobuild.buildroot.net/results/20d3cb8547ffbcc5f4bdea0f0d62c37ae3bbf344 |     
  riscv64    |       fontconfig-2.14.2        | NOK | http://autobuild.buildroot.net/results/04b85033701ee2802618688e140bc5139dbd3042 | ORPH
    arc      | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/f5e20943b4f35088b5863cdc6ed4ea2e344c5ef7 |     
    arc      | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/6fb19205107395f7b004e78ec5a2138b59cb9291 |     
   xtensa    | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/3eba3ef676399cd7c4d3ef8416d3a17ed8674aec |     
powerpc64le  |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/31edb37e6ac4d57764222899be5cbaee2ab89446 | ORPH
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/7307c074048d1ceec745f9704bae5b162492c5f1 |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/98fa97ae9555dd8a835d7c96a9e8aa8a2930cd58 |     
  mips64el   |         gnu-efi-3.0.15         | NOK | http://autobuild.buildroot.net/results/780151d3b54061719afc15711ab83027dd404103 |     
  mips64el   |         gnu-efi-3.0.15         | NOK | http://autobuild.buildroot.net/results/e06afd74242a90d0d6841b9593024b4df8bf7cbe |     
  mips64el   |         gnu-efi-3.0.15         | NOK | http://autobuild.buildroot.net/results/1f12f605730168ec224aab8e08f045b04cd7b756 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/7148e119e4ae8ac166fa1652ca885cbe566141dc |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/a618936b857221b2de6029e03abd04ebf67c73de |     
    or1k     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/a314a8ae0d0246823e789e690455ea0d24a22152 | ORPH
    or1k     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/31e004e8812b2f36cb16f3fd53a0b0a980509aa8 | ORPH
   nios2     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/8a98a08267937651c66babfc060fcb6ac469a3c9 | ORPH
  sparc64    |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/ff559b7ac3452026d3d0a2f310a1f4b5e41528fb | ORPH
   x86_64    |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/2a24728f8e6a0a5334943afbb0db89faec829946 | ORPH
microblazeel |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/fff8c385f68d0cf067d08bfe0319864ca56f27ae |     
powerpc64le  |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/d2e556dc54f7225cbaf1e1aa76a4bdf5dc57ce69 |     
   mips64    |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/780a0c996e622dfcd7428e1dedfdfc68bf6a491d |     
   mipsel    |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/36b69d3657624f83a4c4aece5a7e87f2e4aeb150 |     
   nios2     |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/284268f58a76dcd66f44624feaa04b275bf0a16a |     
    mips     |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/63f072428f885a9057eebaa769bc739e0afa2135 |     
    mips     |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/1412e1deeef5f44b373e92893d9f894454a9cc07 |     
 powerpc64   |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/5f21d21e0a82183d469daf3ca8f98235b78bab1b |     
   mipsel    |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/986f5b8dac229612c582596fcfb435e9647a8f9d |     
    or1k     |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/86ea5a99ffda929d0c45e70f8157a66310e8b5f0 |     
    mips     |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/3a18c51606b21d936b6a9719d7d80329a6b72b2b |     
   sparc     |         haveged-1.9.18         | NOK | http://autobuild.buildroot.net/results/347a74d7a1df07f9b0ee7d9b74e95392b851d5c7 |     
    m68k     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/33ed7acfb7d916d44d570e30202b7c074caf8f0a |     
   mips64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/8e49c0b308196e404ee6b68cf1cdaa49e04448ba |     
    or1k     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/adf4993149186aa1b775460cb833e51d3e75dc2a |     
   s390x     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/78b52a72564230b407d81a24fb8eac4e8f99c7b6 |     
 microblaze  |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/051a437ff8010ac39842a73823f885bdca50e35e |     
   sh4eb     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/5318de4fb0f5ce3a3166a38c56af16be3ccddf0a |     
  sparc64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/29c411a33367c59319b0c6dd283c2b917a591d94 |     
   sparc     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/0f0a74a48eae8c7840ed4d31a3cd8dc5c5e61126 |     
 aarch64_be  |       host-binutils-2.40       | NOK | http://autobuild.buildroot.net/results/ccc28810a434b35dac7174c2c23941281c34a51c |     
   sparc     |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/1332c870a856dcb0600b20e4ebaff9e0b195926c | ORPH
  riscv64    |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/11c25c423f0d96c0b686acc3869d8f263cd06082 | ORPH
  riscv64    |      host-elf2flt-2021.08      | NOK | http://autobuild.buildroot.net/results/aeb074140cf58d05832bd10682d097cd666150ed | ORPH
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/9e06e470189758d58f528f551efead09f201584a | ORPH
  riscv32    |         host-go-1.20.6         | NOK | http://autobuild.buildroot.net/results/02cb93786108fac9a863e3da6ef15fa69b354d1c |     
  aarch64    |         host-go-1.20.6         | NOK | http://autobuild.buildroot.net/results/93225d2425ddada18de926f54fee0c93f17b5424 |     
  mips64el   |         host-go-1.20.6         | NOK | http://autobuild.buildroot.net/results/c8c1cc14d2845e1c1f43b0b3805d1ca0a5ebe6f1 |     
  mips64el   |         host-go-1.20.6         | NOK | http://autobuild.buildroot.net/results/310b630991465ad2edf6bdbb5fa0f0edc04b2034 |     
   armeb     |         host-go-1.20.6         | NOK | http://autobuild.buildroot.net/results/52dd49f0fdd0d539621011fc83a5791ea020e8fd |     
    or1k     |        host-qemu-8.0.2         | NOK | http://autobuild.buildroot.net/results/fee01d35f60df5584f6611e0a58fee40930e657e |     
    or1k     |        host-qemu-8.0.2         | NOK | http://autobuild.buildroot.net/results/09e617894a13761c6a9e0286d1fae621985b42c1 |     
  mips64el   |        host-qemu-8.0.2         | NOK | http://autobuild.buildroot.net/results/cc614b218548d98bd7ea50d4110ff4e165bfd37b |     
  sparc64    |        host-rust-1.71.0        | NOK | http://autobuild.buildroot.net/results/6847cf77590cdc56d621211a1ea06ee6c4e91030 |     
  sparc64    |        host-rust-1.71.0        | NOK | http://autobuild.buildroot.net/results/a763030b29018a58b42d36694d945b2938f40dc4 |     
   mips64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/55a2fea76359e91b976ec81bf8cfbf925652c1c7 |     
   mips64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/c907524bff22faa691ac0de54743f27d9e9d2f54 |     
   sparc     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/7593ac2f51f7696d9c3cee750091e9db88656697 |     
    or1k     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/f52e717cdbedf0ede288c9734b7eadc9f59f439e |     
   nios2     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/bb412c2e677b27fc3aaad5353ec6fbd0a93c8619 |     
 microblaze  |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/e986adc231b270996e94f0e1b3a8b022f0007b4c |     
  riscv32    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/3745b281ebe5a721124961ac3ca5d604c4eb29c4 |     
    arm      | imx-lib-3f777974c0c146817e2... | NOK | http://autobuild.buildroot.net/results/a2de02b70569368a718a03983f2904b7ee87e906 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/a0c0e67b921a52295803ea4d3c294657a54b28e5 |     
    arm      |        libdeflate-1.15         | NOK | http://autobuild.buildroot.net/results/a25634974a6420d53a91fe866fdb0e0bf1cd0c0a |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/75f3d7c1041a14404ed298cb2ec8c19cdd71c1a6 |     
    mips     |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/e8eb1c03b19e59260b953576df552afd0df15d77 | ORPH
   arceb     |        libsigsegv-2.14         | NOK | http://autobuild.buildroot.net/results/42d4e21979688d488b591a03bcd87fbd61e6878e |     
  mips64el   |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/055acae599f3d7ef0930479b774ca9f46c1c9421 | ORPH
   xtensa    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/d1c5632b95feda80c1e1df25c5a2a868eaca4973 | ORPH
   nios2     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/cc760a43d020cbfec6d3312099e3add1c7bd0318 | ORPH
  powerpc    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/2a01fc49ffb302f2af8a19c2acfed3e50f4d162d | ORPH
    arc      |          linux-6.4.5           | NOK | http://autobuild.buildroot.net/results/3172fd871e57138c031fc69fd484eb796f9b120f | ORPH
   x86_64    |          linux-6.4.5           | NOK | http://autobuild.buildroot.net/results/0dbb3275db8adf62003302f7fd3cbb08669e6d13 | ORPH
  mips64el   |          linux-6.4.5           | NOK | http://autobuild.buildroot.net/results/55181c0045ac063177a28faf629bd0faeae73e9b | ORPH
 aarch64_be  |          linux-6.4.5           | NOK | http://autobuild.buildroot.net/results/51b0be80b2bc75a369375fb773b4884f0fd71d83 | ORPH
   mips64    |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/f0641139973ba0444cafa6427e1055a2d1bf458b |     
    arm      |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/6d1c823992020301cb2dc694502837a76640bc50 |     
   arceb     |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/64d2ca4ed600268b9dcdb2e162dcca8aaf1e47ff |     
  powerpc    |           lxc-5.0.2            | NOK | http://autobuild.buildroot.net/results/391eae2b965957596c465043e6774ed04936f70c |     
 powerpc64   |         mpg123-1.31.3          | NOK | http://autobuild.buildroot.net/results/64dccf2be1a46ca784959089486f3a663ddd1983 |     
  sparc64    |         mpg123-1.31.3          | NOK | http://autobuild.buildroot.net/results/ab14f3e0a961fa7b57a80f38f9fafbe8d6ef81bb |     
   mips64    |           mtd-2.1.5            | NOK | http://autobuild.buildroot.net/results/ca9112305650e499e9c86450157fcaf10f701770 | ORPH
    m68k     |          ntpsec-1.2.2          | NOK | http://autobuild.buildroot.net/results/e45b65f2aa323df075d54ff43b0401b5ac7c6eb5 | ORPH
    mips     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/d03febc03eda18db12e8558ad1a79271fb74e1aa | ORPH
  aarch64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/362568aea667f33c38c87c414240e02ec92e8d21 | ORPH
  aarch64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/a487b06017c75393118b36d639e19e8d932b68fb | ORPH
   mips64    |        open62541-v1.3.4        | NOK | http://autobuild.buildroot.net/results/7c948499aea7ed581f638260d8a71a6c77498289 | ORPH
  mips64el   |        open62541-v1.3.4        | NOK | http://autobuild.buildroot.net/results/e248fa310ce24b89b4f70cb69b942e9794cfb8ec | ORPH
 aarch64_be  |        open62541-v1.3.4        | NOK | http://autobuild.buildroot.net/results/3ac78383c4e49d4f86d334d0d9d4fb1b00490128 | ORPH
   sparc     |         opensc-0.23.0          | NOK | http://autobuild.buildroot.net/results/2474819d6660be2181bc44962517e2f91c3eff54 | ORPH
microblazeel |         opensc-0.23.0          | NOK | http://autobuild.buildroot.net/results/24ff25a56046ab26d54aa7a3ef2173deffc2b89b | ORPH
  sparc64    |         openssh-9.3p2          | NOK | http://autobuild.buildroot.net/results/9dd14a097092ae088de302581cd46a2c6d380183 | ORPH
    sh4a     |           php-8.2.8            | NOK | http://autobuild.buildroot.net/results/959f033c8c705ee6e97e26c8311ce0605c1cf0bd |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/d317844fd712697310d9ab59b9877358486ea0d3 | ORPH
powerpc64le  |       python-sip-4.19.25       | NOK | http://autobuild.buildroot.net/results/976407f6331fbd0c25ed26e608dac9e414933d64 |     
 powerpc64   |    python-stack-data-0.6.2     | NOK | http://autobuild.buildroot.net/results/36895dbade30f0d74428546cf640ebc702da567c |     
 microblaze  |     redis-plus-plus-1.3.5      | NOK | http://autobuild.buildroot.net/results/6d310d52dbfe076cd470be71f02de32fb47fa904 |     
    sh4a     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/4cc3c0eeff3003e22259e8b72052ab24c4663762 | ORPH
   xtensa    |          shadow-4.13           | NOK | http://autobuild.buildroot.net/results/2ce276a590c5b3426a8217b5388aebca98d45e4b |     
  aarch64    |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/3128439d218c584cb9ab41ab712112d8938f411b |     
    or1k     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/5a661768328066a6b50e86be04f5d50e657bb485 |     
powerpc64le  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/1b581b29ae197321690977cccd00f67d5d6d1252 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/574d37ead641603c53950ac81ca82bd0289b18dc |     
    sh4a     |            unknown             | NOK | http://autobuild.buildroot.net/results/8d33f563631eb2b6bf466a33d54d0db2d4ecad1e |     
   sh4aeb    |            unknown             | NOK | http://autobuild.buildroot.net/results/754399d7f98f85fb991520d717839900727c40fb |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/0f56ef2c2ac8569862b614d0ae71344cf09d8d01 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/49a66ac246c5b296ee353956d5e3712b2471780e |     
    sh4a     |            unknown             | NOK | http://autobuild.buildroot.net/results/c268655d46368c2e146ad0170233c25934c5b214 |     
  riscv64    |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/36a8df8783292cc6584eaeaebb9677b9727bc536 | ORPH
 microblaze  |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/f08796720248c77472030c7fd345d7f1681cdcba | ORPH
   mips64    |        valgrind-3.21.0         | NOK | http://autobuild.buildroot.net/results/711edd81867d15b4b49f9eedb8897d95f39bc886 | ORPH
  aarch64    |          xvisor-0.3.2          | NOK | http://autobuild.buildroot.net/results/75c3275c5b3550ebc702631c1189885011c49813 |     
  aarch64    |          xvisor-0.3.2          | NOK | http://autobuild.buildroot.net/results/da3ead679bd5fe2a944f9159f4d2ae1806160c27 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                  linux-6.1.38 | 1 
               madplay-0.15.2b | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          linux-6.1.38          | NOK | http://autobuild.buildroot.net/results/2bc55970befe5cfb1153bc94280d8ae90ad584dd | ORPH
   armeb     |        madplay-0.15.2b         | NOK | http://autobuild.buildroot.net/results/77b351da45de828049c005eb1e8d43fda97414dd | ORPH


Classification of failures by reason for 2023.05.x
--------------------------------------------------

                  boost-1.82.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
              host-rust-1.68.2 | 1 
      libabseil-cpp-20220623.1 | 1 
          linux-5.10.162-cip24 | 1 


Detail of failures for 2023.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          boost-1.82.0          | NOK | http://autobuild.buildroot.net/results/5ac345ad370187447f170f4d971c733110f97522 |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/468cb7f17048c8408c5c40c8dd50b0350775c64a | ORPH
   armeb     |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/60c17b261a34930c7319aac44145bbcdc5b59061 |     
  mips64el   |    libabseil-cpp-20220623.1    | NOK | http://autobuild.buildroot.net/results/a1ac3f1c21c8c57dd41505500eae21034df32f86 |     
  mips64el   |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/098f2baf50179a56a61dbe1426376844f6788f41 | ORPH


Gitlab CI results for 2023-07-24
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/4725186390  | ORPH 
...arc64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4731049666  | ORPH 
         TestGrubX8664EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/4725186190  | ORPH 
          TestGrubi386EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/4725186198  | ORPH 
      TestIso9660Grub2EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/4725186306  | ORPH 
   TestIso9660Grub2Hybrid | https://gitlab.com/buildroot.org/buildroot/-/jobs/4725186317  | ORPH 
                 TestLuvi | https://gitlab.com/buildroot.org/buildroot/-/jobs/4725186517  | ORPH 
               TestMender | https://gitlab.com/buildroot.org/buildroot/-/jobs/4725186525  | ORPH 
           TestNoTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/4725186250  | ORPH 
                  TestOci | https://gitlab.com/buildroot.org/buildroot/-/jobs/4725186333  | ORPH 
   TestSELinuxSystemdExt4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4725186368  | ORPH 
...SELinuxSystemdSquashfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/4725186370  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
