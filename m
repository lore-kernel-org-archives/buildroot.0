Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF1E3C6FD1C
	for <buildroot@archiver.kernel.org>; Thu, 23 Mar 2023 06:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B67F41857;
	Thu, 23 Mar 2023 06:45:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B67F41857
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id admt_YPftVRk; Thu, 23 Mar 2023 06:45:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B8724185C;
	Thu, 23 Mar 2023 06:45:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B8724185C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D4AC21BF844
 for <buildroot@lists.busybox.net>; Thu, 23 Mar 2023 06:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ADDEB4010E
 for <buildroot@lists.busybox.net>; Thu, 23 Mar 2023 06:45:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADDEB4010E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bajN4LDAfT6A for <buildroot@lists.busybox.net>;
 Thu, 23 Mar 2023 06:45:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CCCE40002
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3CCCE40002
 for <buildroot@buildroot.org>; Thu, 23 Mar 2023 06:45:45 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 68A30240002
 for <buildroot@buildroot.org>; Thu, 23 Mar 2023 06:45:43 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 23 Mar 2023 06:45:43 -0000
Message-Id: <20230323064548.ADDEB4010E@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1679553943; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=a6xZb0s0orZ4QuV0N1NQRp0MyVsQB+VDMOQygUY/ONk=;
 b=JVKzCEV90efnemj1uwyA3thNFdZIIqK0jvmEtQZC2/W+V9/o6xtYgRKk21LVAMI0D4oc+q
 j+NfJuiGJpMcNkf2BlSH8Yh87ZEvQ5uFil/b4Cwpt00kmFuBgHG/ZGefc8Nnm2T8zPFZu2
 WG65lj86jk8tV79q8cNUSL75LyXq4plQT1yJ8l0+RY+tOtVkujNCT309FZ0uJFDNp69Obx
 KdS7WV0tt2fLgDU6dR/GgXkZyv/8C5WinJtfucz0unNvXyXF2QXmb+BYapr7Z17XfMUPIk
 dBj/MqBSktddqPVfB47A0bCaBHWxLb+F+HoX/P8pBdU0HjZSQgzNoKFER6e24A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JVKzCEV9
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-03-22
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

Autobuild statistics for 2023-03-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 12  | 10  |  0  | 22  |
    master   | 219 | 153 |  5  | 377 |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.72.0 | 17
            host-binutils-2.38 | 13
             bluez5_utils-5.66 | 7 
                host-go-1.19.7 | 5 
                       unknown | 5 
         gobject-introspection | 4 
              host-rust-1.68.0 | 4 
fs/ubifs/ubifs.mk:49: /home... | 3 
glibc-2.36-81-g4f4d7a13edfd... | 3 
               libglib2-2.72.3 | 3 
          lttng-modules-2.13.7 | 3 
                 uclibc-1.0.42 | 3 
                busybox-1.36.0 | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
                     gmp-6.2.1 | 2 
                gnu-efi-3.0.15 | 2 
host-gdb-arc-2020.09-releas... | 2 
               host-qemu-7.2.0 | 2 
               libcap-ng-0.8.3 | 2 
                  linux-6.1.14 | 2 
            ocf-linux-20171122 | 2 
                     pv-1.6.20 | 2 
                   shadow-4.13 | 2 
                  snmppp-3.5.0 | 2 
                xenomai-3.0.10 | 2 
android-tools-4.2.2+git2013... | 1 
                  assimp-5.2.5 | 1 
                 augeas-1.12.0 | 1 
           crucible-2022.05.25 | 1 
                 dc3dd-7.2.641 | 1 
                     efivar-38 | 1 
                elfutils-0.186 | 1 
              erlang-22.3.4.22 | 1 
                  ffmpeg-4.4.3 | 1 
             fontconfig-2.13.1 | 1 
       freeradius-client-1.1.7 | 1 
fs/axfs/axfs.mk:32: /home/b... | 1 
fs/btrfs/btrfs.mk:55: /home... | 1 
fs/cramfs/cramfs.mk:46: /tm... | 1 
fs/cramfs/cramfs.mk:46: /tm... | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
fs/ubi/ubi.mk:51: /tmp/inst... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                 glibmm-2.68.2 | 1 
                 haproxy-2.6.9 | 1 
            host-binutils-2.37 | 1 
            host-binutils-2.39 | 1 
               host-zstd-1.5.4 | 1 
               libdeflate-1.15 | 1 
                  libffi-3.4.4 | 1 
                 libpqxx-6.4.5 | 1 
                libzlib-1.2.13 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
              liquid-dsp-1.4.0 | 1 
        ltp-testsuite-20220930 | 1 
               mariadb-10.3.36 | 1 
                  matio-1.5.23 | 1 
          moby-buildkit-0.11.2 | 1 
                    musl-1.2.3 | 1 
             netsniff-ng-0.6.8 | 1 
                    olsr-0.9.8 | 1 
   openvmtools-11.3.5-18557794 | 1 
                   perl-5.36.0 | 1 
                     php-8.2.3 | 1 
           python-pyicu-2.10.2 | 1 
                    qemu-7.2.0 | 1 
                   sdl2-2.26.3 | 1 
              shellinabox-2.20 | 1 
             stress-ng-0.15.04 | 1 
           uboot-tools-2021.07 | 1 
uclibc-ng-test-6790eafe897b... | 1 
ulog-0389d243352255f6182326... | 1 
           v4l2loopback-0.12.7 | 1 
wireguard-linux-compat-1.0.... | 1 
                 wolfssl-5.5.3 | 1 
                  xvisor-0.3.1 | 1 
                    zeek-4.1.1 | 1 
               zxing-cpp-1.4.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/20ede2da30d7cf30e2b024c07ee98bf558ff3ec7 |     
    mips     |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/c6ef17b4fb1df340004c9441d97a95892ac05a67 | ORPH
  riscv64    |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/271a2abfe3dd911942c5ab9c3ab85dcbc582a209 | ORPH
  aarch64    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/a3eebd34cc61b0cbfbf75a9c10d603627556256e |     
   mips64    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/ebb03a874733d8cc6df8c9e8c9f1bc35e9536fb7 |     
 microblaze  |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/0b2d8b7f58bb0d695acaa8e8a734581f4065dae0 |     
    mips     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/a4832baf86a9f9d7a5cbe6f8489cf396a1b5f71c |     
   mips64    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/3aed7ccf7e248c899188e463a43f57e879063dbc |     
    i586     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/390f2915c7d5ddc39be0cfe48b76c99988149605 |     
    sh4a     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/c5516e78eb0efb96d1d261252f8ea5b0babb1768 |     
    mips     |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/637ff72f2aa3834512c51eaefb511357edb023bc | ORPH
  mips64el   |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/087ac8d51f5f4f74cb8a65a46cc5b5b28510d9f6 | ORPH
    i686     |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/fbe191333d1c98f6b380317beeca8d2283f0eb4a |     
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/49a02ef042c4e1276e00a852a8ebf3758844c600 | ORPH
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/ce2dee24df65e38cf61fe4d0ae910ffe4f2fecba |     
    or1k     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/a43efce3e97221108b3cbfb7ce1df737532fe3a3 | ORPH
  powerpc    |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/b9c13fc080ea56d30b65b4e9292bec4ee46c36ce |     
    arm      |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/7c7ab03fb9b3e720c0b6bb83f679e89469fcb56c |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/db16a0d747d825f50ac3dfbb63c3cd2b064a2274 | ORPH
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/cdc6ae10931df5fdbff573da3e5a7e8573a4ca42 |     
   x86_64    | fs/axfs/axfs.mk:32: /home/b... | NOK | http://autobuild.buildroot.net/results/07c754b9fec6eeedc370598a40c7ae25aa272e37 |     
 powerpc64   | fs/btrfs/btrfs.mk:55: /home... | NOK | http://autobuild.buildroot.net/results/87965bcb843f7ed7620b5e08eabdca66a4ba1c7b |     
   mipsel    | fs/cramfs/cramfs.mk:46: /tm... | NOK | http://autobuild.buildroot.net/results/f8d237e55bb60e20ef95f77309b34ca772b793ee |     
  aarch64    | fs/cramfs/cramfs.mk:46: /tm... | NOK | http://autobuild.buildroot.net/results/105e5b1a5ad2ba5dd740188422fe234ff1f98b5d |     
   sparc     | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/d658e72234e6753d2f661928fea8fe90f573807d |     
   s390x     | fs/ubi/ubi.mk:51: /tmp/inst... | NOK | http://autobuild.buildroot.net/results/0aaa0ccc7167f1ab22c0df2a30731eab753955c5 |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/60660a9848a4687626fcd400ddfefedb7700d416 |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/97571cf9e039b1cc69f00aaddf993c0e82a312c5 |     
    mips     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/edf6b903950963450af61a697f0c01fdcb007223 |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/a6037bcb21662d774234d226a4bbacb8e55c1df6 |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/25e324ec013378a23d310316bb3f33c4632d6fd5 |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/afdf60039981aac3a9d02c73c1765948c16272a1 |     
    i686     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/5a0e649fac8102f6cddc854f28f2a8c891be0f9d |     
   x86_64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/6e4f73bb0e0fb1f644b66a4092e8352fdcedcbdd |     
    i686     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/f14a660f85b839ebfc50fb44366205c8609c67c2 |     
  aarch64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/568a28f9841aff37d664fd6b9ef7e12e10af444c |     
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/51f96c3d6082ec370f2773994a1917bf33bd2f6f |     
 microblaze  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/fbb125f3c0f8a0bff64c64f297eb8ed1653fa3fb |     
  sparc64    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/43fc58428c520641c3c77246790ed4998690122b |     
    arm      | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/7cd7c10abd7519bd20b31ab633c9a2d518b72703 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/956078bc006179362a3422e7778ce57d8104edfa |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/85c72953e7210645d2cd462614327954a128513b |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/1a06f668743d9f1cde7da01589ff19b0fe001df2 |     
    or1k     |         glibmm-2.68.2          | NOK | http://autobuild.buildroot.net/results/fe726996f485f9a27933f39dc70f52421e0f101e |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/00c8f6dc5e78a5d84f393a2b00121cd5aa60214f | ORPH
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/8b8afea757ff151a76b68828e62ee893cc793bf6 | ORPH
  mips64el   |         gnu-efi-3.0.15         | NOK | http://autobuild.buildroot.net/results/888d1d67876d3b7bd974bd71d9306a1fad7b4b62 |     
  mips64el   |         gnu-efi-3.0.15         | NOK | http://autobuild.buildroot.net/results/397dc77a4f0071c5edea1f550d56279832bff902 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/a4ece2048c7e2faa8c4986c6cef4ff02b7b6d6b4 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/8bbac6438a76e8771e7e806d986417e1cfe9b4aa |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/3cc92bdb212c3926a7165b315859abd44bb399ad |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/8fe655cfa6fb1788a59451a92fc247a9b95f512a |     
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/c720cb555dad08fd7e647daa2a41644f09473244 | ORPH
microblazeel |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/25b916966e57444f358bd6f53e1ee13c0f3796df | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/05b3058a94dd60e39fa33844cc6b05b916ce026e | ORPH
 microblaze  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/1844f8fee28811dd7912f7470a3d5e9aa2596abf | ORPH
microblazeel |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/829bd90f83cc65c0f46fd3225a6b8064c343d42b | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/8811cb83ca69ab02e710f76d526e0fa6bb8f5428 | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/ef0ebde24216b1b620a1e442da415bd1400a0a01 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/ceb7b43f9dd1e4bba91e766446e52d927a1b58ad | ORPH
microblazeel |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/86438e01ae2250eb868eba0a984c0e61e3ac2f1e | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/bbf8d4e47f5417535585b4f2fcec780b4a197539 | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/b9ff51bd817ea5dda64f4d441166e17e5d1a6776 | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/dee81144234e21bb0d6ee1dab055d0aba6e8ac80 | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/a82145dd1842111ed64d0c9e63badec54d3fe71e | ORPH
microblazeel |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/2d57ec52778bc2b303aec4095a2a043d2da206ae | ORPH
 microblaze  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/e5162947a3551d209c1b05371c44d9a68a7a7b0d | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/c99e7a036b4cc2e8120d850dc4c847592b1ff6de | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/2f78951683f81d5bf02321370fe789e6e021a7d1 | ORPH
 aarch64_be  |         haproxy-2.6.9          | NOK | http://autobuild.buildroot.net/results/ca7f5074fe5e011ceddb464956d331dd5e2bf8d3 |     
 aarch64_be  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/783fff503440e8b739edb7da56c8b9225facdbf8 |     
    sh4a     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/1fe9d27b2da74bbb542e207aa20084924184160e |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f3423a24ef0d4693b5729e95d0413a8f35022bdf |     
  riscv64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/42729fd0e0fbebe2fe8c7ebed3e1ea0b75f48b1e |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/2d8b9bacc225a03c4fb5157e628adf07c2f1fe7b |     
    or1k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/94283f3bfd03d232f2379691bf310c524390ba96 |     
    mips     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/115c7cd363dd43686e42c719b4a784c72660305a |     
  riscv32    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/84bd646b24fd9332785a87b852109501b48c29b1 |     
   sh4aeb    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/62375106148d635bfb5f4b28948430f292bdb625 |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/61781c8aecf9d703de7afc24418b19fed515337d |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e64e7664a1cda03dc4b59dc5e556128df8813677 |     
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e15ce92ad83585956b86ac1e2462dbece7d5ce0c |     
  aarch64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ad32a3e792d3b7f0d0e6b88a7fb3ae2d9e824201 |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/20bd67fc7c9fa2f460d91050bc288ad93a5129de |     
    arc      |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/743f24b36c86dd57f99a33ab0cc8f7c0704dbc6f |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/d19638291280d5216631b7854585fb27671bc803 | ORPH
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/9d22c1ef2f43a4e750a1233ae243fdc9cb7fd4c7 | ORPH
powerpc64le  |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/70b672d380248a388c6e61679de46201e63e83de |     
    i686     |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/d2d3db40c89addf9c989f803190af3a468179f06 |     
  mips64el   |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/f534e471557daf79a6207ac36033a2ff218de772 |     
    i586     |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/dca32a80ddabc0c0bf4327c75b2926fce5e97203 |     
  mips64el   |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/901ba29b11b855270b28df0daa7bfe6410674c0e |     
 powerpc64   |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/7af556ee574c7298054f2005c8599acad08cac2c |     
microblazeel |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/5084d9ff62b582772db30ad8a56212b5694e8028 |     
   mipsel    |        host-rust-1.68.0        | NOK | http://autobuild.buildroot.net/results/733b2225ada07997c3d6b2910f17113a63fb12ad |     
 powerpc64   |        host-rust-1.68.0        | NOK | http://autobuild.buildroot.net/results/c7cd62e532d18832cbffdb8847e8bd01d3f75398 |     
    mips     |        host-rust-1.68.0        | NOK | http://autobuild.buildroot.net/results/079da0b72f3e03af65a5004f86c0394be2182e27 |     
   x86_64    |        host-rust-1.68.0        | NOK | http://autobuild.buildroot.net/results/f03ef1c4c04c1a2f9223a9e4370a5f56513b44ed |     
    sh4      |        host-zstd-1.5.4         | NOK | http://autobuild.buildroot.net/results/4db6ea3482a4408420db4ff33f338d2041fd3f18 |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/8d60c5888763dcefceeaf8ba4f265ab5123b4283 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/f3c8c048601daea161c1bb307af2e38d0ee1623f |     
   armeb     |        libdeflate-1.15         | NOK | http://autobuild.buildroot.net/results/139baf84e2a97fd24ffebf79e6a481b96598fdb4 |     
  mips64el   |          libffi-3.4.4          | NOK | http://autobuild.buildroot.net/results/246114732329107ee1da2d4e5a51c22fc7f9d2e2 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/91bcfb39aaedbf9ac8340993ed10b431c25e69d6 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/8a9a48e1eaf733df4dc4e4f7152a6c99f787b6fb |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/c6e1b02400e56e95d8662aaff67a29bf10db6e37 |     
 microblaze  |         libpqxx-6.4.5          | NOK | http://autobuild.buildroot.net/results/604b86a47f0ae0d35263877049e3ed578b7bbac7 |     
   mips64    |         libzlib-1.2.13         | NOK | http://autobuild.buildroot.net/results/09e6fe91b222b511fc6513576aa138a37f29c538 | ORPH
   nios2     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/d7beb9e587bb5e397637472452a859b563d47cff | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/072ce946caf018ad16a1ab00581d08baefe89ce4 | ORPH
   sh4aeb    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/f091a2f17035b391de4024cee0c9f949b8855021 | ORPH
   mips64    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/2a62fb0e227fb6920249b280b5cb8509e4b0937a | ORPH
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/43dc58c600e52b070eb1998445d17aeed32ed97a |     
    i686     |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/b45bea9fc0795025bc72048086d84bf56e5bf253 |     
    arc      |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/a99e353637ad1e45f2e1a1e2258dbb51b2f6a1cd |     
  sparc64    |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/1f55e841fcaae276a8baa57c60f171f5fa006865 |     
 microblaze  |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/57ed73b9f4fb738035e047b206c074a51b8387df |     
microblazeel |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/6cb1ab49f259e672bceacc083610f96d0ddee7d6 | ORPH
   nios2     |          matio-1.5.23          | NOK | http://autobuild.buildroot.net/results/378557e465409e17181e67ecdba9b60d7405cc1b |     
   x86_64    |      moby-buildkit-0.11.2      | NOK | http://autobuild.buildroot.net/results/439eedfdbbe86eac779847fdd88483aef22bc5c9 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/720d07e965989934f4e3e585b579ea2caa5ae6f5 |     
  aarch64    |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/833ac608bf660be0b9fc65c079fdf1523cf7d254 |     
   sh4eb     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/836664f8f0bd5551a0cc61d97ece0d1a295724c2 | ORPH
  sparc64    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/763eac53a8e0f82b819aedf560a88f03f1db7717 | ORPH
 powerpc64   |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/e81ebef9c0a1916e0722488aec8046a284325252 | ORPH
  aarch64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/18318a53406787e2f8c9646e970b373814f15725 |     
   sparc     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/46fb0e7c36a8a87c2373ccdc1be7689f588086a6 |     
   armeb     |           php-8.2.3            | NOK | http://autobuild.buildroot.net/results/1581a28a8b8c1efe55fc60e6d1a133b684a32aff |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/ed4df9666e304f8d0edf97fdc0cd6d4be07b8f1b | ORPH
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/ece734f06a8cd717654431b7506c0c2b7ac712ff | ORPH
   sh4aeb    |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/ab2461ee04a77ae79f8d5a336aa737c5cb2bd6a1 |     
powerpc64le  |           qemu-7.2.0           | NOK | http://autobuild.buildroot.net/results/356d8c1b3e86b9380adc47948f30ac57427a902b |     
    arm      |          sdl2-2.26.3           | NOK | http://autobuild.buildroot.net/results/fa979b699ddc31739ddea8f94182d0e8c3896377 |     
 aarch64_be  |          shadow-4.13           | NOK | http://autobuild.buildroot.net/results/df6a16a55bf02cf2d7377f9636913f0b3bca574f |     
   nios2     |          shadow-4.13           | NOK | http://autobuild.buildroot.net/results/758d4fd297fbd77ef846d3a3d4c207021f866752 |     
   xtensa    |        shellinabox-2.20        | NOK | http://autobuild.buildroot.net/results/caf1c3bab517eb86f11a4577dec3aa8e07281d37 |     
    or1k     |          snmppp-3.5.0          | NOK | http://autobuild.buildroot.net/results/0036c7a84c5ec9d3b88b06cde7b15e25218a7466 |     
   mipsel    |          snmppp-3.5.0          | NOK | http://autobuild.buildroot.net/results/0454f9386aa91bbebe350531e491deeb1a0488ad |     
   xtensa    |       stress-ng-0.15.04        | NOK | http://autobuild.buildroot.net/results/ec97778014af43afc7869071f72ca1ec96af368b |     
    arm      |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/4c480d0713ea7d4324e40c1dad2c5f4e996164a1 | ORPH
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/de15238230e81c4a491f4b6d4246eedc87ce54d1 |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/4bfe833a579d96d588d0cff9281f7fe2d88b4fd0 |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/aec2bf1f8ddc0990a54ec391ce851da8654f212b |     
    mips     | uclibc-ng-test-6790eafe897b... | NOK | http://autobuild.buildroot.net/results/3491efa65cac9381ee674a74f042a63c12ac9da6 |     
    or1k     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/914e124dafa986cf54ffe9daca9be1537fa3d2e5 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/e275c3da3db383cc7ec894c2e2086fa8a3698745 |     
    m68k     |            unknown             | TIM | http://autobuild.buildroot.net/results/a10b609d1fcb50d4fc0526a510c14bcff795cfa4 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/b02db7ff181dbb7908ad6d1ac37f806d1b1231b8 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/618ad97f3dbb454b041181052ce7dc9f55bb7593 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/9f21841a1dc1227e5b79a09fae087e4a92201dff |     
   sparc     |      v4l2loopback-0.12.7       | NOK | http://autobuild.buildroot.net/results/468e5ebf2917952ba11a54c7e6032b6a8fce1451 |     
 aarch64_be  | wireguard-linux-compat-1.0.... | NOK | http://autobuild.buildroot.net/results/a6f004a548cd918ed73cd2b9080b009f3a5ab575 |     
   mipsel    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/68f589f2bac46d581c218d2128fad8d3262edd4d |     
    i586     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/1e9d4ce1ca468a06a433cb0f0c5a20f7a1c4b0a7 |     
    m68k     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/8e16615ce589f49936eb5c38577da5bd527a1148 |     
  aarch64    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/f37998ce2f707a6ce1d6e6dda055fff443480baf |     
 aarch64_be  |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/2db2988d495f9d06d058fb532a2dcfa9ef6e207c |     
    mips     |        zxing-cpp-1.4.0         | NOK | http://autobuild.buildroot.net/results/8ecc5311ce40269078a22b7af6a97e88b3240beb |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

             containerd-1.6.16 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                     gmp-6.2.1 | 1 
         host-gcc-final-11.3.0 | 1 
                       kmod-30 | 1 
              libgcrypt-1.10.1 | 1 
                  ntp-4.2.8p15 | 1 
                     php-8.2.3 | 1 
             stress-ng-0.13.05 | 1 
                       unknown | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |       containerd-1.6.16        | NOK | http://autobuild.buildroot.net/results/298570c7d507d1e9692dd11a72690adce2e33f6e |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/ea7fc083706afb928279a221c7f8b69c11bef34a |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/c0ed2e2be05d86692fa16797643c24f3f3c859a5 | ORPH
   arceb     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/690dd860e113b0cf069c8881fce89e4d651bf6a7 |     
   xtensa    |            kmod-30             | NOK | http://autobuild.buildroot.net/results/24d7ede76eea797098e1c7b3f5420a34441fe465 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/571d21fc5680e03bf324791a745a4a2838dc0cf4 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/630da36dbafc563d3ed9474991b08ee4901d88fc | ORPH
    or1k     |           php-8.2.3            | NOK | http://autobuild.buildroot.net/results/440064d3aa0f4f4b1706ccd3ff1f20c9e5f7a9a3 |     
   sparc     |       stress-ng-0.13.05        | NOK | http://autobuild.buildroot.net/results/15c2a3bb4c0c0f82c3884f31d102de504e69d0da |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/c10d424b09e45cdcdb9def39cf5e54a17be6819b |     


Gitlab CI results for 2023-03-22
================================


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
