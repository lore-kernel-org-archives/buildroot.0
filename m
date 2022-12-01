Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C83CC43217
	for <buildroot@archiver.kernel.org>; Thu,  1 Dec 2022 07:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1B1B402A6;
	Thu,  1 Dec 2022 07:43:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1B1B402A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qJhZ3BDjv22i; Thu,  1 Dec 2022 07:43:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 317FD402C5;
	Thu,  1 Dec 2022 07:43:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 317FD402C5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3E2211BF2A2
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 07:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDC0040514
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 07:43:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDC0040514
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w7TrZPaph-1L for <buildroot@lists.busybox.net>;
 Thu,  1 Dec 2022 07:43:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 649B940150
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 649B940150
 for <buildroot@buildroot.org>; Thu,  1 Dec 2022 07:43:21 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 682ACE0003
 for <buildroot@buildroot.org>; Thu,  1 Dec 2022 07:43:18 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 01 Dec 2022 07:43:18 -0000
Message-Id: <20221201074324.CDC0040514@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1669880598; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9N2Udw8tfAng0nUcjdDD6mtx+VLX3FyDL1hB6t8eEvc=;
 b=MTEEzYuzO9yb1L+5Vk4aSL+gUTDFXgMtVOsDXxz1MYXESnGXN7suoF3+5dllymAhZ5GpXL
 mTMSkluiywrbXro1swxuASvmqwzCzNe5XgX9Qlen3U35eM0QsPHHRlrUQGaB+oy03zn+9E
 W++iXL3nzfRZJOtD7wDv34ByeVyRBRCh4+BZsU+xZMG30/7CfOfT7Ga+epufS8psDLwIO1
 q3JP84eJu0bZR5Ufo6tC+a7k5DwFzF+s/Uj6iJF2/Xud4k2hM60Dkg3GJDr6hDrdDwhDQf
 nvq6tPCXLftPc5ApvAfaZc6Q70ITdJIeBxq2YkO99FuYftG2D2j97MAU1dXH9Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MTEEzYuz
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-11-30
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

Autobuild statistics for 2022-11-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  8  |  1  |  0  |  9  |
  2022.08.x  | 24  | 20  |  0  | 44  |
    master   | 251 | 266 |  0  | 517 |
     next    | 19  | 24  |  0  | 43  |

Classification of failures by reason for master
-----------------------------------------------

                      xz-5.2.7 | 15
  gobject-introspection-1.72.0 | 14
                host-go-1.19.3 | 13
              host-pahole-1.24 | 10
            host-binutils-2.38 | 7 
              host-rust-1.64.0 | 7 
                   linux-6.0.9 | 7 
                       unknown | 7 
              libgcrypt-1.10.1 | 5 
                linuxptp-3.1.1 | 5 
                     lxc-5.0.1 | 5 
                elfutils-0.186 | 4 
                 fdk-aac-2.0.2 | 4 
glibc-2.36-66-ga1dc0be03c9d... | 4 
               libglib2-2.72.3 | 4 
             libgpg-error-1.45 | 4 
                    bat-0.19.0 | 3 
             cni-plugins-1.1.1 | 3 
                 dmalloc-5.6.5 | 3 
                gerbera-1.10.0 | 3 
            host-binutils-2.39 | 3 
                libkcapi-1.4.0 | 3 
        ltp-testsuite-20220930 | 3 
              open62541-v1.3.3 | 3 
           python-numpy-1.23.4 | 3 
                tealdeer-1.6.1 | 3 
                xenomai-3.0.10 | 3 
                  boost-1.80.0 | 2 
                    brltty-6.5 | 2 
                      crun-1.5 | 2 
                     efivar-38 | 2 
               fftw-quad-3.3.8 | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
                  gensio-2.5.5 | 2 
              hyperfine-1.14.0 | 2 
                   linux-tools | 2 
              liquid-dsp-1.4.0 | 2 
          lttng-modules-2.13.1 | 2 
              memcached-1.6.16 | 2 
                 mesa3d-22.2.2 | 2 
                   perl-5.34.1 | 2 
                      pigz-2.7 | 2 
            quickjs-2021-03-27 | 2 
rtl8192eu-1e15b6d451731bc4d... | 2 
                  tbb-2021.5.0 | 2 
                 uclibc-1.0.42 | 2 
uqmi-0a19b5b77140465c29e2af... | 2 
                 wolfssl-5.5.3 | 2 
                    zeek-4.1.1 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
                alsa-lib-1.2.8 | 1 
                  assimp-5.2.5 | 1 
                 augeas-1.12.0 | 1 
            btrfs-progs-5.16.2 | 1 
                   bullet-3.21 | 1 
                  cairo-1.16.0 | 1 
                  cmocka-1.1.5 | 1 
              containerd-1.6.8 | 1 
           crucible-2022.05.25 | 1 
                cryptopp-8.6.0 | 1 
        edk2-edk2-stable202102 | 1 
              erlang-22.3.4.22 | 1 
             f2fs-tools-1.15.0 | 1 
             fontconfig-2.13.1 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /tm... | 1 
fs/ext2/ext2.mk:65: /home/t... | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                 fwts-22.09.00 | 1 
                    gdal-3.5.1 | 1 
          gitlab-runner-14.5.1 | 1 
               gocryptfs-2.2.1 | 1 
                   grpc-1.50.0 | 1 
            host-binutils-2.37 | 1 
               ipmitool-1_8_19 | 1 
                  kexec-2.0.25 | 1 
                  lcms2-2.13.1 | 1 
      libabseil-cpp-20220623.1 | 1 
                libglvnd-1.4.0 | 1 
               libmdbx-0.11.12 | 1 
                    libndp-1.8 | 1 
                   libnss-3.84 | 1 
                  libsepol-3.3 | 1 
                 libuwsc-3.3.5 | 1 
          linux-5.10.145-cip17 | 1 
      linux-5.10.145-cip17-rt7 | 1 
             lirc-tools-0.10.2 | 1 
                 luaposix-35.1 | 1 
                   luvi-2.13.0 | 1 
                  mender-3.4.0 | 1 
            micropython-1.19.1 | 1 
                    musl-1.2.3 | 1 
            ocf-linux-20171122 | 1 
                    php-8.1.12 | 1 
               poppler-22.10.0 | 1 
     portaudio-190700_20210406 | 1 
                 protobuf-21.8 | 1 
                     pv-1.6.20 | 1 
   python-greenlet-1.1.3.post0 | 1 
                python3-3.10.8 | 1 
                  reaver-1.6.6 | 1 
rtl8723ds-5ab2d3f3858dc4c83... | 1 
                    sdl-1.2.15 | 1 
                suricata-6.0.6 | 1 
               tcf-agent-1.7.0 | 1 
                tinifier-3.4.0 | 1 
toolchain-external-codescap... | 1 
              traceroute-2.1.0 | 1 
             uccp420wlan-6.9.1 | 1 
                  udisks-2.9.4 | 1 
               valgrind-3.19.0 | 1 
                  zabbix-5.4.9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/5921d81e1776d8f8e8ba248ea50d213c61a76cb8 |     
 microblaze  | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/e52298632fdb835e3f52e82e36a40aff16ecfe5e |     
   mips64    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/58231de67f05a03c520ca6e52646a75b947bd24b |     
    or1k     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/3f80a20d62ab052ce32539bffaf93b492c95bef5 |     
    or1k     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/ae848b0c632139880a3c8e44a65396aa43da4a16 |     
  mips64el   |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/329088024b26274a329c65fabbc0a65f1be740b5 |     
    sh4a     |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/942ff4acd03ecc1ce9850225e906d8ba13703c76 | ORPH
  riscv64    |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/16bdeaebc765f68635a675a8e99a22d341a5c653 | ORPH
    i586     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/313e990e49ab4bed6faa2118e7e9d9397adc4332 |     
   armeb     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/75d1c212824e32059d205f8aba6e784ad4e952c0 |     
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/10b072c9ed7a61ff3c15f5e93f3a68a1c7e01c7d |     
    arc      |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/5468abe0ef937c6b496ba4465fe85f15ce475b85 |     
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/d5b29fc7cddd39d42e6009bc178242e8053b4760 |     
  powerpc    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/7922e0eea8543214617a22ddd29fa63c310a9ebd |     
powerpc64le  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/6e54921826045bef42a90e0acba8a7b21e2bf648 |     
    or1k     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/088db34e1636ca3a350558857b3059e05b7e10a9 | ORPH
  powerpc    |          bullet-3.21           | NOK | http://autobuild.buildroot.net/results/69d42e966cfd230ee4f176fd70bf2f80a0673675 |     
  aarch64    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/96c77041655eeb8a68da4ad2cffb2276c1d224b4 |     
    arm      |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/399170cbcc1bfb425335c2fb1316bc8c9fdc1cab |     
  aarch64    |       cni-plugins-1.1.1        | NOK | http://autobuild.buildroot.net/results/8b6f053e9be71b1ceca484d1deb1893bd24b4523 |     
    i686     |       cni-plugins-1.1.1        | NOK | http://autobuild.buildroot.net/results/6b1da941051fc6cd9215d9c8f7b8c130c72d37e8 |     
    i686     |       cni-plugins-1.1.1        | NOK | http://autobuild.buildroot.net/results/fd09b0de313a2d7a156c5a8efcf514156109e8d6 |     
   x86_64    |        containerd-1.6.8        | NOK | http://autobuild.buildroot.net/results/e26508a84bd6eeaa4e750a77a17a64a192585f7f |     
   s390x     |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/fed3f525dd83b7b1fde287b748f8af5445a8ebf6 |     
    m68k     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/f023d40990e15ea249e8dea36b533e9ab60e7c01 |     
   sparc     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/05f525b0b1d5e13de8f7aaaf39b61af29e5a291e |     
   sh4aeb    |         cryptopp-8.6.0         | NOK | http://autobuild.buildroot.net/results/417ac045c1a24e212327b30fe2968441711d89cd |     
    i586     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/ef840cc025d5284b302f2d5f3f81d1a8d862023e | ORPH
    i686     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/3b7958b3697107c8b7f5b320e360d5a8c54cb894 | ORPH
    i686     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/a63994b1ef43023caabb9e6d9e474265a5ce1353 | ORPH
    i686     |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/7978f3e08598d59f9da911833f94af3778ff9637 |     
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/5056e00d4f8d9f871113a62cd92acb8e7dcbeb5e |     
   mipsel    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/69dc4cf645b6638fd74cb7e195fadfd11b482efb |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/721b6a926ee68727234bf59659cc0729af268960 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/dc97e14de9a08f9f240b95832c3bc276005e3568 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/c26879650529795ab712780b08e0603e0d5d7bcb | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/0bce956b537cbee0204aab4ac70596812aac1f0d | ORPH
  sparc64    |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/f876f3e62eada931ce10b4f370a4fbcb55db0d43 |     
    or1k     |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/64eb9d7f6966682fd6509fc4d86a35fa6b367a2c |     
   x86_64    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/e68e56a998a1b7eb389b22d833ebc222981bd9d4 |     
  powerpc    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/ad2a08c54df7934bad5306aaabc6f4e6530552b8 |     
   x86_64    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/8920d81dc79b32621b60543b2f37b5af6c8334d2 |     
  aarch64    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/dc7f88f313918b7c0ef6c062af47147cf34f02a2 |     
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/2ddea9e0b279a698171217e0654eb62d88af9818 | ORPH
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/e5cec054e4e845c8f1b697db5ed0bb50ce790fbb | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/ff4a182b7ffca86cf227ace092b6b18c0676666d | ORPH
    mips     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/79156a0311b07169f15078d3dcfb3ff59a299df8 |     
   s390x     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/b7a830c278a285cd5279f8c26da12b1d321b45d0 |     
  mips64el   | fs/cramfs/cramfs.mk:46: /tm... | NOK | http://autobuild.buildroot.net/results/a14764b7787677df176650d3631e13bb60be6b6c |     
   mipsel    | fs/ext2/ext2.mk:65: /home/t... | NOK | http://autobuild.buildroot.net/results/7ee5c9594808124cd39d629f88187e3393dfb10d |     
powerpc64le  | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/048862b44d5a2098133a9eaeacd6d1ae45acc6e5 |     
   x86_64    | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/bfd01840f9147f1a166b9428f20f8f09d4762198 |     
    arm      | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/045156aeaca8cb526ee0199bc7fe6aee76d0e12d |     
    or1k     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/8e628ca382f149b5a6c7c5d3083f5e2c55902756 |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/513035d7dc28dcd36ae81c75583ad1702da2c16e |     
   nios2     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/cc13c269f782465074fb436242490c9c0be39fc4 |     
    or1k     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/f39076b248c115aedf4b382395211c2f6731f54c |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/b0e058688e6917a36dd3cefb58b1c452170ea5fe |     
   sh4aeb    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/378a9f72a69b3c295cbb43cd850bc290a69acfcd |     
   x86_64    |         fwts-22.09.00          | NOK | http://autobuild.buildroot.net/results/39f5e4f08e3707e617fce9c6a026171ee32c0db4 |     
    or1k     |           gdal-3.5.1           | NOK | http://autobuild.buildroot.net/results/e2bc9564e8a7d65c9fe9c2398ca36791a2fc455f |     
   armeb     |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/7839ab1bda5660a600c9918e4c51ab43582f39b5 |     
   arceb     |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/fb655cb4469d43a31e3332adf5c9e86ae5fd1b0f |     
    sh4      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/ad97d1a246c62c04aeb9e3464d536c02b2b2d212 |     
powerpc64le  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/ba5737416347944a2c5f7af12e7c973e9d581ab4 |     
 powerpc64   |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/551501e4b790ef7ad307e8f32db6878118f10852 |     
  riscv64    |      gitlab-runner-14.5.1      | NOK | http://autobuild.buildroot.net/results/766c37748e7fdd15435ed382a32cae5e03712399 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/56e67626369e3ec63bf7dad65142899b3d333eff |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/d38d3b59a80ac4673313f908661f48295c45b00f |     
powerpc64le  | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/26675fbaee2de69e55bf16df95d28de9f5d79f71 |     
   arceb     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/e517bbdc3401e97f38dde59a6f3d47d1424f99fa |     
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/5490c9f8fdbd761bdde89d0df7bbcc86b107cea7 | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/debeb66372e827afe4561bc6a24888261f9ae30f | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/1849eae855276eaecb96058d113f11d99e2ff0ab | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/aefe9da3ecd4626cb13069647b6ee46a8a7593c4 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/d5383b6ffa09997e061f8c1b262f162cefb82821 | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/33919060c16100a3a5f21be40fbe7b00d69864ca | ORPH
microblazeel |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/dfa17396c75771b2ceba9cbd20061eb4ed4c6176 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/7ffce3efacf0a9dce768e3427c5cf35e1b9e7422 | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/6697c5df703baeb2f2765b8a081d2ed4aa43a494 | ORPH
   mipsel    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/289f4306b60f6cca6aea8fa2198e0a955dfa95cc | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/8807e24582a07aca59b50cfb4e2e742358df1eb8 | ORPH
 powerpc64   |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/4d86125001d3e94df18335946478d0829da625a4 | ORPH
 powerpc64   |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/65f06993a925a7189a6f98fa39ce145918338996 | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/2f91db5cfb2f6c8e3ab867c1c2a2832a16e18bdc | ORPH
    arm      |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/e3e9cc37fb51f4548196860a07ac8ed28baffa00 |     
    mips     |          grpc-1.50.0           | NOK | http://autobuild.buildroot.net/results/27a262a7c906a50bfbd9cab235f046a5d1b2bfc7 |     
   x86_64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/3fd9950557e1b9209ac497749891ce0e5f2bbd06 |     
    mips     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/d658777b8ccf6866c726f3310a40ba01cfe65815 |     
powerpc64le  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e53f44819cbb59b728f7162c6f5b112c1173f8a8 |     
    sh4      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/1474d8251838455384163742ddcdc92d13b3f271 |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/44fe3e438ea5ef14d73d5301597a17878f83714e |     
   nios2     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/0d39856aee6a46d2b9956ca2209de5747f438a72 |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e7b70b7757778cd1020e73e3c3df2d3ff0631f38 |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/083b80925d21ff9b8b357a6ad1f71f027547ef21 |     
   s390x     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/e466b52efd15a099ab7f55db8a8b8c76b155ebaa |     
    i686     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/36b19d03265c2c199b41c3011f4849b9274be9ce |     
   nios2     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/ce24c991173ceed4751a9a607741028409d61ed8 |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/08facbc88ce653102cff9436dc279b6731184023 |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/bfcbcfd106966af68d99330a72bca8d4c4a9add2 |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/d7bb7cc76f87209c06c2ea12da271b1d9aef16cc |     
  aarch64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/83556212a8d3e5d67aa2847758354dbb58c2c2de |     
powerpc64le  |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/98f188807a7c3076940d920d4a5cdc14ea74bb14 |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/7f27cc905fc48cac5520a73f1ccc92127d4157b3 |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/b6654cab8dd6b2940d747f452d33feca0fcc01b5 |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/6fe3f078c0d12e3a3a52d89e38b44e5985c9d550 |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/3956180f90f2093f07329861f73c4f2a85e63b41 |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/da84ed48d8c169427597412eb964b985e620d231 |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/6cd9c0df079acdd16a8cd21cfde23557ecda6c46 |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/3d5e500225773bcc1b3b8da5b1c0da428fabe5f8 |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/c57791b77d5b2455aaaa4af611bb916153aab835 |     
    arc      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/de64a4d1bb0261cc864376351f11c42b81f5cc60 |     
  aarch64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/576995b8d4689f2192e6b94dc6c8330aac3b8493 |     
  aarch64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/512a829a920316d338f6273d121253d90ea7d140 |     
powerpc64le  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/366d2236f9ea2351b1b885477ad1c0bdd2c069c4 |     
    sh4      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/4916b10b564bbc320a9ffb6c74d691ddd9fafcd6 |     
 powerpc64   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/692455e4e519ef79091b9081f34501714bbb80ab |     
 powerpc64   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/09609dce4d176d312328f8a5344a35d7d0864fd9 |     
 powerpc64   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/6ffb273670d6f61a435f8e2dda98885fec6d85bd |     
   s390x     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/aee2a90455fea2a075ac9746d9bbe7ec9627fabd |     
    sh4      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/2be8dc9b73cc91449314c80bf7526d7f5d63066e |     
 powerpc64   |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/d2dbe39e0addab563d41c2a5eab06ada369a1b9d |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/ad05bc78e1799e03299d0bfe11ca7a973348b6a9 |     
   mipsel    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/3b5f1fa3a4b2fc48fd55492b8290069bd53fde3c |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/5540a2bfdbf06fc4638d80bea921d8311704d673 |     
 powerpc64   |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/955e36555c1da296c1c81abad85dd918dc506092 |     
   armeb     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/3209ee58670c6c40f79b29a3ff14b70c943467ed |     
   mipsel    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/86234f4ad451124e6d48d7275a6b4b49655eeb6d |     
   armeb     |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/0ae633ef851cc77e4d513843001c68097761d96f | ORPH
   armeb     |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/c147d1c306b3308739bc8f0b422f6435391aa1cc | ORPH
    or1k     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/1bf47ec1b0171d44620ebeb90a0079de08cc023c |     
   armeb     |          kexec-2.0.25          | NOK | http://autobuild.buildroot.net/results/ca715e77de03f168e5dfd72def77fefb08d160e9 | ORPH
    or1k     |          lcms2-2.13.1          | NOK | http://autobuild.buildroot.net/results/076e470ce372838636b140a9d69e9ea7f09b39b8 |     
  mips64el   |    libabseil-cpp-20220623.1    | NOK | http://autobuild.buildroot.net/results/67bac70a7b9048e30082514e01813557fd640bf0 |     
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/6bbb2091c6dd785c7a01ac2fd4eb82ee8528ff58 | ORPH
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/955e34a7fa2a21d984ec8efd5712b61668c4add2 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/8e992e453f367d95a9d8d60ccc9d72d71b0c9828 | ORPH
    arm      |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/483f70501d5e1eebb7191c1f56b3f4ac5eaf4754 | ORPH
    arm      |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/0f473d764c88984e27bc301950367b41e5412fb3 | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/232f0d01fde07e5bc89249d0a2a73590ddb4bddb |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/e9cd62b9f5f2a1c65196dfe8578ed49a59eb6978 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/39217077c2c8b51d1c77647373759edb22c352a4 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/242c33e4df1589f574f94ffa48bbc89a0fe8cfd1 |     
microblazeel |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/ee3d03065920025e4e2ad83b4bf090ca5c12e648 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/896b41002156f9fdff6c7e36330336b4c5176664 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/33898a94bc8725f9c15f41542a6e4bf0190a39dc | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/24935eb0748cfce3cccc1207b203bbcbe86da235 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/05ce60d84ddaa6c4dd4fdee46d585b37ac084b2b | ORPH
 microblaze  |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/182ed447ea4565794dc9936d144caaf9ffd156b0 |     
 microblaze  |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/262b8ac41f91fbb1a7ce379da71db2d4e5106540 |     
microblazeel |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/de50b1007c7358a28f5993c284e6eaf1f83b2b11 |     
 microblaze  |        libmdbx-0.11.12         | NOK | http://autobuild.buildroot.net/results/06d9f3c5ad6a4415685dea6c5fb2f7aed910aa6e |     
  riscv64    |           libndp-1.8           | NOK | http://autobuild.buildroot.net/results/c0fc787138310153ba0f7414ade43c7a77529534 |     
microblazeel |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/d00d22f1bfee5c175f3266ff16124632906463c3 |     
   mips64    |          libsepol-3.3          | NOK | http://autobuild.buildroot.net/results/f88af8d84c87d3ffd617dd422bbcc52c3a7c1a29 |     
   nios2     |         libuwsc-3.3.5          | NOK | http://autobuild.buildroot.net/results/58de6a2806671317241f79804a5bee28b418ecf4 |     
    mips     |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/f09528ca04cf561c8e389bcc52c85b45bf6eb05c | ORPH
   mipsel    |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/63ed82bfe38d45539118b969d037ee3477eecac1 | ORPH
powerpc64le  |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/0853ff119035f25a5ed75cf81af8516ff0827089 | ORPH
   nios2     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/32049f5c6a04c015f7fd6378f58d348c9bc29900 | ORPH
  riscv32    |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/60c860b84c8c371bcda7e3a2d75748a3dc274c09 | ORPH
  sparc64    |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/6e2d885fc7cc4aec47b4707d4236cae729750467 | ORPH
   mips64    |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/649af3a1c3984b6c6b6412e32ec02e9e0c21995a | ORPH
  mips64el   |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/d4561c20cf1c3172efc6b5ca6f9e269081c77343 | ORPH
    sh4a     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/3e14b63c01baf8cc57b5570101ec00db9ff7661a | ORPH
    i686     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/3952894c5d3a19cea3cc406785eb9005ece49520 | ORPH
    arm      |          linux-tools           | NOK | http://autobuild.buildroot.net/results/c631f670a7350691769d76940d6c55dc57232d0d | ORPH
    mips     |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/10521ee7c6259523eb4c741cc8311681ff1d095e |     
    arc      |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/a94820cbb3e8cf5f3ddf7a440ee1e84e87d3ac8a |     
 powerpc64   |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/22064e5820e4c9bbbd161935488c99b42d077364 |     
    mips     |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/ad83f864e427804609e1514f2f0413a336cad7cc |     
   s390x     |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/df1a0519cd407fc05efa7f2bf1452d2ce44b32a6 |     
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/f8f6e0c529af4bafef7fb00116c091846870e7aa |     
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/0d1aba349528eb8e045a32f8f99d55faf9fff834 |     
  riscv64    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/14853c23f6040de02bf44af756c4bc9563869039 | ORPH
powerpc64le  |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/ec399804c0360b9feb792556ff4aaf71ca70dd99 |     
  aarch64    |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/d043c6d49fee32fdbebec4d14e90a212dd6cce5a |     
   sh4aeb    |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/32a3adf920185f5544d327176950e84c0bf52e94 |     
   x86_64    |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/72f2664839ef34f3e26efeab784d5a34ce47ea9e |     
    arc      |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/dd8cb5912b7442446b29730a2042412cf0356bb2 |     
 microblaze  |         luaposix-35.1          | NOK | http://autobuild.buildroot.net/results/949e2a2881e58480ddfd926f969f2c3e0631e6b3 |     
 aarch64_be  |          luvi-2.13.0           | NOK | http://autobuild.buildroot.net/results/a5e4aa8f91f0900f2eb719f4a80e8e8dc1d58d47 | ORPH
    i686     |           lxc-5.0.1            | NOK | http://autobuild.buildroot.net/results/11c6b2c7654002d53ba68e892bf69a2904d67d0d |     
    sh4a     |           lxc-5.0.1            | NOK | http://autobuild.buildroot.net/results/2ee651af2ff42b50a0252b54d1c1b255d6cde68f |     
 aarch64_be  |           lxc-5.0.1            | NOK | http://autobuild.buildroot.net/results/ee34aab48d6ab8d41878192507a241cdb18c8508 |     
    mips     |           lxc-5.0.1            | NOK | http://autobuild.buildroot.net/results/4bea65cc334546bec901d168f739696cfd62c1a4 |     
 aarch64_be  |           lxc-5.0.1            | NOK | http://autobuild.buildroot.net/results/c356a46c74ea4e2032df5d337080ad75f510bfa4 |     
   sparc     |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/09c47fd1a29ab046c11a93ca5bde3b0f58e13cb3 | ORPH
   sparc     |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/0c1a5afa57ff0186e5b1f19b5d5cc4e3d35c3ec7 | ORPH
   s390x     |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/5ad7400fe847523f17aed91b9426be420118552e |     
   x86_64    |         mesa3d-22.2.2          | NOK | http://autobuild.buildroot.net/results/7520e987eb012b00b74cb493bd552114f7ede844 |     
   x86_64    |         mesa3d-22.2.2          | NOK | http://autobuild.buildroot.net/results/2d63ca1e167765c432c42197bcf427fc4fbafba8 |     
  aarch64    |       micropython-1.19.1       | NOK | http://autobuild.buildroot.net/results/b27e0ba81a713ae56a52620d7cee5b61936cf175 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/40189c68b34c7d95d7f230b77f25fea7c310aec9 |     
   armeb     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/3494a3636e0c4d135e9f7ea49fb65011925e93d5 | ORPH
   s390x     |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/c2d421fcf4655f692dc0df0ee227a7a532963454 | ORPH
 aarch64_be  |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/2aafa0f47781bf93e29caffcd86294d4bd3c8274 | ORPH
 aarch64_be  |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/4d23fc3c31333fb71a935a572f0084f5a84a69cd | ORPH
   xtensa    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/5834aae8c77178409281b56a82f3f6d1b22468e4 |     
   sparc     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/85495ed3929c1a221fc69a762ecdf4118daa12eb |     
microblazeel |           php-8.1.12           | NOK | http://autobuild.buildroot.net/results/316ce6dae7fcb4562002023e6bc1e582b3dcf9a1 |     
 microblaze  |            pigz-2.7            | NOK | http://autobuild.buildroot.net/results/b6b323b7f82718d2d0964c5bfeef77cd27f78323 |     
 microblaze  |            pigz-2.7            | NOK | http://autobuild.buildroot.net/results/ab4dc470511c19efea2eedd0ce3d91390e3caf8e |     
   xtensa    |        poppler-22.10.0         | NOK | http://autobuild.buildroot.net/results/28984c6f2815ff345f29d9d5517258021370fccc |     
    mips     |   portaudio-190700_20210406    | NOK | http://autobuild.buildroot.net/results/64f9657ae5ef32fd9ed4564b0006aa84c43b0521 | ORPH
   nios2     |         protobuf-21.8          | NOK | http://autobuild.buildroot.net/results/468b4eb9471b160c6dcda0e88a5eeefebb637b16 |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/9c92ceb7dfce9098baf12cd628eaf056e59238d4 | ORPH
powerpc64le  |  python-greenlet-1.1.3.post0   | NOK | http://autobuild.buildroot.net/results/95f1eb58039379022bb53dff3a15c6da75030351 |     
  aarch64    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/cfd1a34dd12858dceb4db6effaa2524ff61cbb2c |     
   mipsel    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/2d8939279c016d173d2c377505dd7cb8ad0e5443 |     
    mips     |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/c34e91ec3ba9071a32b8cf345153ac51e290d04a |     
   x86_64    |         python3-3.10.8         | NOK | http://autobuild.buildroot.net/results/0d403311d9fa370d4f7289b6d154c5fb3c7ba5e9 |     
 microblaze  |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/195b87e93d0b874eff7985c80db04879d80c5b70 |     
    or1k     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/7ecfb89515eef27f0e767a2e5aa24b6a62233b52 |     
   arceb     |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/788b2782266bd83a916c087b31ecf31990944762 |     
powerpc64le  | rtl8192eu-1e15b6d451731bc4d... | NOK | http://autobuild.buildroot.net/results/53264fad6a60372caa37b9a0618c70be57afeb0b |     
  sparc64    | rtl8192eu-1e15b6d451731bc4d... | NOK | http://autobuild.buildroot.net/results/961c2c4388b0749c558ddf1f8ed29db0f4533872 |     
 powerpc64   | rtl8723ds-5ab2d3f3858dc4c83... | NOK | http://autobuild.buildroot.net/results/fa2482674d789e7674dc0d83c5f54393beed4d70 |     
   sh4aeb    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/36d1ebccec3b8ad448d3ae17719ad173e403996c | ORPH
   armeb     |         suricata-6.0.6         | NOK | http://autobuild.buildroot.net/results/b5d57b6a218a24aeb18ce12ea017a22bcdadfd28 |     
    i686     |          tbb-2021.5.0          | NOK | http://autobuild.buildroot.net/results/64a11dab4d91f8a7380838a3c12a0501da327627 |     
    i686     |          tbb-2021.5.0          | NOK | http://autobuild.buildroot.net/results/0765b283f2d600d3da920659a8e36447ca46ca18 |     
 microblaze  |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/2d7469848de0158d4095a600952e0cc7391ef1a3 |     
 powerpc64   |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/83faaa6236c9ab653b5e80bb5b6c08c53e92c339 |     
    mips     |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/7a596a5b975f55656fd259a11951bcccf7798a84 |     
   mipsel    |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/f9caa6bd0b893e4bb708c7f0f06f03803770813e |     
    i586     |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.net/results/548f4d5e3cf561a26e31eb7e37cffde3979fb417 |     
    mips     | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/8fc5512956f5336024976a7da2a9033875d5036d | ORPH
  powerpc    |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/d3eae21b276d185930134fb08f06c4b2f7461fa3 |     
   arceb     |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/cb023eee3bcdabbb308acf5c07b0d844c3975c34 | ORPH
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/8b477889246cd444d3a1de1d7d7b6d8dd4e88e54 |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/a6d088500ea3cd6bff567da24a9e514b5bf398d5 |     
powerpc64le  |          udisks-2.9.4          | NOK | http://autobuild.buildroot.net/results/2ffe96a2cf4785c22dce7ec2d8203e61415b9c8b |     
   sh4eb     |            unknown             | NOK | http://autobuild.buildroot.net/results/3af6f946f78fb004954e4f484a014767cee24e92 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/66941ca2addbaac06faea69afdc02df6df39f220 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/d2342a6d743d8d44cb6d9306ff2241558550cd2c |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/5562d79416ac1d301e47e12d01b109436e097d57 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/bcdfa9f0680acf4d43b5037a622b1e035c94c4b5 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/411f57bf0f800bd7baf70f6ea5768dd9509b11a6 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/357fc04607f1143fe975230385c9083038396ef2 |     
   nios2     | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/184506cb26693cb3d1ab9b2c8ff8d7ab5c8a2089 | ORPH
  sparc64    | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/3e769608883a85c06f5e65dd3e67e2f35c02625a | ORPH
  powerpc    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/501a39f75d7bc679061afb308b860b220642b4b6 | ORPH
  riscv32    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/13a5665699dd8fe02489889f6b8e6dad84184b1d |     
  riscv32    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/7ef1858494f86d8cbdc73d8f658d661394f9f4c1 |     
powerpc64le  |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/b6c7f06357d634a36dcc6b31eb27a9319a82bbe0 |     
   nios2     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/79e1ea85a1efce0d1e2e7396aa06a9f19122abcf |     
   mips64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/67eb01338c0ead7b7922832d1cdfb5f23f29672c |     
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/0c6baf68e1aaa42597d630d62e673bf9083b59a5 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/dd70c2d706f660dc8962d2dd2809d7815cdd3cd2 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/240c18aa222684fc62856adbc84853cd1eafcb58 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/b91552b5316e1f7386c2c14b071294df7ff88363 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/a2a2eb2c1d2665802e91177d7ec4001233a14010 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/a7166cf1cfde1156a20a418f496a86a5b65478c4 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/07da378e107f55687e945d2ea03338cb98c50f95 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/87671ac612a94d070924300bdc2d973b97ee2a57 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/69e3cefac78338c34f96234b83a8865584bfc5cb | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/a0dca3d6e0fd618655df972095a3678d69c6d360 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/2285e784bc0a9aa74c5871048a78e8940b9945d8 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/e8eca3b7297faa6dd577cc7bf38e68dd6345043d | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/acabd6a46aedbc82cf2ccf2dcfd9af81b1d0133a | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/87c2262bd46ce3b8cada84d4bd9780bb74dd4303 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/917b3565571862831699b9b677670922f51ef88b | ORPH
    mips     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/ce3138b1ac1b2cd2c51789d21959bfba543a1922 |     
microblazeel |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/5008992750140607d9ce82349407ce4367b6dfb9 |     
    arc      |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/228f10447fcdfc2e4ea54afdb746b1b9729e65dd |     


Classification of failures by reason for next
---------------------------------------------

                elfutils-0.186 | 3 
                       unknown | 3 
                   aubio-0.4.9 | 2 
                gerbera-1.10.0 | 2 
glibc-2.36-66-ga1dc0be03c9d... | 2 
              host-pahole-1.24 | 2 
                 dash-0.5.11.5 | 1 
                  ffmpeg-4.4.3 | 1 
  gobject-introspection-1.72.0 | 1 
              hyperfine-1.14.0 | 1 
          imagemagick-7.1.0-51 | 1 
      linux-5.10.145-cip17-rt7 | 1 
              open62541-v1.3.3 | 1 
    python-cryptography-38.0.3 | 1 
         python-greenlet-2.0.0 | 1 
                      xz-5.2.7 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/c0643b6dab491c41f63e7e5e95c5e566e95d296f |     
   x86_64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/fc1c62f280299f71bc780bfa03cc02a8918d3d6e |     
    or1k     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/2e67bf41a77fe0bc786fcfdf74e7c1ea458bf6cc | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/a2001fad9eb09a268c9b25999bc87121607d316a | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/33478741f60e38364fdcd67ec4ee59de8988979c | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/40df40af33619d7219733c56f252fa0d9cb8f86a | ORPH
  aarch64    |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/587168f816cba1c174a49cd4140e6c6e4518c4a3 |     
  powerpc    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/c3c5afdbb23bc83f61383d3e40d32741956315c3 |     
    mips     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/650f99c8837d6f4c01b2699b7089fb51efd331a4 |     
 microblaze  | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/d1d69d595569221e85cd91cfb22962c8ed22e8c1 |     
microblazeel | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/344086afc2b7afa3e413c2bde1727be932ed0eb6 |     
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/7c912aa1ea53fe9b3ae3801eac5bc9c1ea362b51 | ORPH
    m68k     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/cc5a71bddccb0a9577f9b01a3e4062ca048c5cd5 |     
microblazeel |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/c4e3aa9664930fb00c76949284a36c31f71908fe |     
   mipsel    |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/d8263a002cc34f8e2221babd3052186198b1d5ce | ORPH
  mips64el   |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/b59ec5820c21b57c6fb9f914039c50ed6180183a | ORPH
  sparc64    |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/231c0d4c61487456dabc0e28b859d7ec52e9ac76 | ORPH
microblazeel |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/ad5a4826f47a7e02f7dc5627da0299991d6b2af1 | ORPH
 powerpc64   |   python-cryptography-38.0.3   | NOK | http://autobuild.buildroot.net/results/c0fc837b420c80d5d784da87847fd8874c1d6abe |     
  sparc64    |     python-greenlet-2.0.0      | NOK | http://autobuild.buildroot.net/results/13de56539f5ffb5333c8688484038bf8fec20550 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/426d0cce734196b6c2cd95d84fa9d0fbf356614a |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/fe4a01fcf495d0cb0c0f26e6c34703469a0cb27f |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/ee68ea1c514a72d6e7fccf42d8ef9b048b685a07 |     
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/82856c5c872da3c64d06ddb879f22767cd477ea6 | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

            igd2-for-linux-2.1 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/47bd304aa5280707312c0621bca022d76a549f18 |     


Classification of failures by reason for 2022.08.x
--------------------------------------------------

                       unknown | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
              alsa-lib-1.2.7.2 | 1 
dahdi-linux-5c840cf43838e06... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                gerbera-1.10.0 | 1 
  gobject-introspection-1.70.0 | 1 
       host-gcc-initial-11.3.0 | 1 
                host-go-1.18.8 | 1 
host-pahole-73383b3a39afe86... | 1 
            igd2-for-linux-2.1 | 1 
              libgcrypt-1.10.1 | 1 
                 libwpe-1.12.3 | 1 
           linux-5.10.115-cip7 | 1 
                mongodb-4.2.18 | 1 
                  ntp-4.2.8p15 | 1 
                    qemu-7.0.0 | 1 
            quickjs-2021-03-27 | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/7f68e04f5e2e0c022e5b711b16595b20c0c9c0a2 |     
  sparc64    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/f7a1c17fd534ec38ae5978ec84daf4ee1c8b49d5 |     
  aarch64    |        alsa-lib-1.2.7.2        | NOK | http://autobuild.buildroot.net/results/0e541937fec1d8a21731af3bf53065312b0e4706 |     
 aarch64_be  | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/08875758ffa82b962b36622418d20061b150e368 |     
   x86_64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/75cd20fef9a9d975fb31706a75533a562ec4ae71 |     
    or1k     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/7c1ee87bfc33ad0392b81f20d5dacbacf858afd9 |     
  sparc64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/c8bdbad9727200225b7c90fbf812e43144c102c2 | ORPH
   armeb     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/28ae7c883063ca328d07004d49a1e7dc9e10c517 |     
  mips64el   |         host-go-1.18.8         | NOK | http://autobuild.buildroot.net/results/81bdbd88d29c05ec0d19ccc40444afb5a8443e1e |     
  sparc64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/44224d02cbddf92bb3d74405bdf3b05baf994205 |     
   nios2     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/7e121626602c1c44987b9d4f4b63f637ff5c3d8e |     
    arm      |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/44fde1d5f778684034115c5ccbaf11514ac3d682 | ORPH
    arm      |         libwpe-1.12.3          | NOK | http://autobuild.buildroot.net/results/29d2ba0f8c92e9081cff5741333faf5849a406c1 |     
   xtensa    |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/91a89f361d13cbf10109b0740330711016e4c958 | ORPH
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/003fd20e2e7ede2f97174f0a5669e5ad74f3f989 |     
   sh4eb     |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/f4756d6e8c8d940ecfeb5660f09117174da6797e | ORPH
    i686     |           qemu-7.0.0           | NOK | http://autobuild.buildroot.net/results/7a942de15e60d306a59e33769da5f048d56120a5 |     
   sh4aeb    |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/f14651917b913e1f1557fbe6c16a31c9d0558978 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/37a85222d0d59328af43e49f2459bd31af2bcb76 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/7de8bedb990b8fd86c1bb774263f6907c3284ccd |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
