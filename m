Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3288C4332F
	for <buildroot@archiver.kernel.org>; Fri, 25 Nov 2022 07:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D01D82153;
	Fri, 25 Nov 2022 07:37:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D01D82153
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L5dhkprd1adB; Fri, 25 Nov 2022 07:37:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FF4E82156;
	Fri, 25 Nov 2022 07:37:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FF4E82156
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F21E31BF5A6
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 07:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3C7382156
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 07:37:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3C7382156
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S6Ux0SVFZ1Os for <buildroot@lists.busybox.net>;
 Fri, 25 Nov 2022 07:37:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D4AA82153
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D4AA82153
 for <buildroot@buildroot.org>; Fri, 25 Nov 2022 07:37:51 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6306C24000C
 for <buildroot@buildroot.org>; Fri, 25 Nov 2022 07:37:48 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 25 Nov 2022 07:37:48 -0000
Message-Id: <20221125073754.C3C7382156@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1669361869; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yAFxd8EOVJz0CGFJ8SuEMo3Kg6DsaeVXVuzo/O5ZygY=;
 b=joV/NXUKncBltC1G8N7hxAIVHlMmDWgEl6nXyFliOVczNg7INhiwWalcQ3jcUt+1c0Ei73
 BWIf0IUL5mrCwgTvaeYD3uuDRTSQVJXOhgzN75lT1j3/GHnDe/1o0rtMXi6u3EXoT+UGRE
 KkW1H9nzemO+l0VWHEWnfSjiBd4SSROyBC8uIHKCq2DrjPCyfLK5qEB6SWI5DWaJthwTmO
 n1iMzdj7uWBD6v1Y2NtEYwBeBxPwf3RiYnRl59aFb5EuK3C9lrAWPOduVS3oryiLKHyAuU
 XAu1Nyav0C/cmDRpqlyzl481CW+NtQ9WwLy+AAuM5ADp9pdcpdm2NyloPAgCHg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=joV/NXUK
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-11-24
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

Autobuild statistics for 2022-11-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  3  |  1  |  0  |  4  |
  2022.08.x  |  9  |  8  |  0  | 17  |
    master   | 181 | 205 |  1  | 387 |
     next    |  5  | 15  |  0  | 20  |

Classification of failures by reason for master
-----------------------------------------------

                   linux-6.0.9 | 10
            host-binutils-2.38 | 9 
glibc-2.36-66-ga1dc0be03c9d... | 8 
                       unknown | 8 
                host-go-1.19.3 | 7 
               libglib2-2.72.3 | 6 
  gobject-introspection-1.72.0 | 5 
              host-pahole-1.24 | 5 
              host-rust-1.64.0 | 5 
                linuxptp-3.1.1 | 5 
                      xz-5.2.7 | 5 
                 dash-0.5.11.5 | 4 
                gerbera-1.10.0 | 4 
                     frr-8.3.1 | 3 
             libgpg-error-1.45 | 3 
            ocf-linux-20171122 | 3 
           python-numpy-1.23.4 | 3 
                tealdeer-1.6.1 | 3 
                wtfutil-0.41.0 | 3 
                 dmalloc-5.6.5 | 2 
                elfutils-0.186 | 2 
                   flann-1.9.2 | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
            host-binutils-2.39 | 2 
             host-cmake-3.22.3 | 2 
       host-gcc-initial-11.3.0 | 2 
host-spirv-llvm-translator-... | 2 
                  lcms2-2.13.1 | 2 
              libgcrypt-1.10.1 | 2 
             lirc-tools-0.10.2 | 2 
                    musl-1.2.3 | 2 
              open62541-v1.3.3 | 2 
   openvmtools-11.3.5-18557794 | 2 
                    php-8.1.12 | 2 
          python-orjson-3.7.11 | 2 
                  reaver-1.6.6 | 2 
                    sdl-1.2.15 | 2 
                 uclibc-1.0.42 | 2 
                 wolfssl-5.5.3 | 2 
                  xvisor-0.3.1 | 2 
                    zeek-4.1.1 | 2 
/home/buildroot/autobuild/i... | 1 
                  acpid-2.0.34 | 1 
        at91dataflashboot-1.05 | 1 
azure-iot-sdk-c-LTS_07_2022... | 1 
                    bat-0.19.0 | 1 
             batman-adv-2022.2 | 1 
                  botan-2.19.2 | 1 
                  cairo-1.16.0 | 1 
                 cdrkit-1.1.11 | 1 
                     efivar-38 | 1 
              erlang-22.3.4.22 | 1 
               fftw-quad-3.3.8 | 1 
             fontconfig-2.13.1 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                gnu-efi-3.0.15 | 1 
         gobject-introspection | 1 
google-breakpad-c85eb4a59b6... | 1 
                 gtkmm3-3.22.0 | 1 
              host-delve-1.8.0 | 1 
           host-libiberty-2.32 | 1 
      host-riscv-isa-sim-1.1.0 | 1 
                    lame-3.100 | 1 
libdill-32d0e8b733416208e04... | 1 
                libglvnd-1.4.0 | 1 
                libkcapi-1.4.0 | 1 
               libmdbx-0.11.12 | 1 
                   libnl-3.7.0 | 1 
               libsigsegv-2.14 | 1 
               lightning-2.1.3 | 1 
                         linux | 1 
      linux-5.10.145-cip17-rt7 | 1 
              liquid-dsp-1.4.0 | 1 
        ltp-testsuite-20220930 | 1 
          lttng-modules-2.13.1 | 1 
            lttng-tools-2.13.2 | 1 
                     lxc-5.0.1 | 1 
                  matio-1.5.23 | 1 
                       ncurses | 1 
             netsniff-ng-0.6.8 | 1 
                        ngircd | 1 
                  ntpsec-1_2_1 | 1 
                 openssh-9.1p1 | 1 
                    opus-1.3.1 | 1 
rtl8189es-e58bd86c9d9408c64... | 1 
rtl8821au-4235b0ec7d7220a63... | 1 
                 sqlite-3.39.4 | 1 
toolchain-external-codescap... | 1 
              traceroute-2.1.0 | 1 
           uboot-tools-2021.07 | 1 
             uccp420wlan-6.9.1 | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
xr819-xradio-4f0cfd5e869ca1... | 1 
                  zabbix-5.4.9 | 1 
                 zlib-ng-2.0.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/602519eb6b9632c09d8d33711864f5b84ce7b492 |     
   mips64    |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/85437e6dfbe2081f255379fd0658c5a8618a8f38 | ORPH
    arm      |     at91dataflashboot-1.05     | NOK | http://autobuild.buildroot.net/results/586ff481687e3555c3eda2017b82eeae9d09dc8f | ORPH
    arm      | azure-iot-sdk-c-LTS_07_2022... | NOK | http://autobuild.buildroot.net/results/b495d48a0a747b81f269f2bebd484a06d1f2cf64 |     
    i686     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/dd2f34835fd3b81c100472a7a904671fd1258d79 |     
  mips64el   |       batman-adv-2022.2        | NOK | http://autobuild.buildroot.net/results/3df9008dc3e63ad153b0e0bb0361d5c8e88f58f9 |     
   armeb     |          botan-2.19.2          | NOK | http://autobuild.buildroot.net/results/7940dfeb7c248d8eef9a1ef1cc1a886373d86bf5 | ORPH
   xtensa    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/013e3c130edc44d213bb10d43aa552104c3f9f9c |     
   armeb     |         cdrkit-1.1.11          | NOK | http://autobuild.buildroot.net/results/c94d143b112997e6f4d1337ac141a615fd10bcf8 |     
    sh4      |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/06119297aab59ab15f694fc023314d9a5385746c | ORPH
    sh4      |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/d697b074e4987adab143ede886862cb3fff9a20f | ORPH
    i686     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/566c0f8a4c9bb6dfd98c3ccb51f6cc74ac0b7b63 | ORPH
   sparc     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/8f109f1a04a6a2ff6d8c4c920e499fbaec3f72b9 | ORPH
    i686     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/bf87345c93ce2536a6ed5ccf3bd29c1d31d131c9 | ORPH
  powerpc    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/67e5f7265a069f0f5171d7461175762305d9afb7 | ORPH
    i586     |           efivar-38            | NOK | http://autobuild.buildroot.net/results/036229635c9aca50b879388066fe6d192f97a6d6 |     
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/74198c6926370671b61e141376c70937dccce139 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/6f5d7a3bbf77af3efb325d775ca7daf9784091f9 | ORPH
  aarch64    |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/69f6741b181cb105bee162a77cee5877849275f9 |     
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/4178560c6b387028ed434d691dc49e83e1c9a992 | ORPH
    mips     |          flann-1.9.2           | NOK | http://autobuild.buildroot.net/results/f62cc9c56fb9f3146cbf979065b70ade18f93b63 |     
    mips     |          flann-1.9.2           | NOK | http://autobuild.buildroot.net/results/6b6ebb4652173ee86688d5a7f106a6e786ac398c |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/2a4f761924c60e35cea4af0bee187c3758e378de | ORPH
    arc      |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/7d2ba034ea4334d3907c564fa2484ccf4ff4d902 |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/b8c225dafc385f606e1075ca00eecee5dad619e3 |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/259fd2e110f02a1b35f860c3073edb3c4ec553b0 |     
   mipsel    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/80bf061a5be261248f57f0d94eedad27b3a32b21 |     
  sparc64    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/27407776b8d5e8cc48a0bd2e20581e95edda67f0 |     
   x86_64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/6833860e23518ed5f6a151d8992bf8b72f452624 |     
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/2c5e76a09158d48d3c6c3f9a8a5ddfb45d39b8f1 |     
  powerpc    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/f67d07015ecd8ae35dc7b25e866714691a8fc5b8 |     
   x86_64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/aac5243f77ebe495ae8bc1c5d44cd156752b85a7 |     
   nios2     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/f14f05d2db171d026f0297999ba8be7173ba5874 |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/69450088dcb6d8d7f66a9aa00b9e82bd70de63aa |     
   x86_64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/33ab4d6ca0e61c70be201d2a38339a2e92a9a7bf |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/3393c6ab03a9d955db8a16266ddde16fc11ecd20 |     
   armeb     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/9bb97299236e676755bf745db74fd73f7aca1590 |     
    or1k     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/4e0045d3477f2a202523f2260b236f487749061f |     
    i686     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/9390cdf2708e67f17e66563305c2e66d770c92af |     
    arc      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/2bc3260d27703ca6b6b3afd88653ef5cd11b3bb1 |     
powerpc64le  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/58988a507b658122e0bd83ec6023dda95d64bf83 |     
  mips64el   |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/984f28e3a8df8f433a427bc2b97c0f8022373f5a |     
    sh4a     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/61b60dc136a64575bee6143c4c06bdbd48c511ff |     
   sh4aeb    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/b99d869202c6007bac62dc0fb72a4841a27de3ff |     
   nios2     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/33fa2b93232688c4dbbb88e869ee8549293019ef |     
 aarch64_be  | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/434380dc5e51e55a962b61ec3aba60b00d2b6855 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/3028fd2a5f909c233f6afb29bc2d8c495430380e |     
microblazeel | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/e25419c1a7a0420bc9960db5dab664cb71504915 |     
   nios2     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/280052ee240bc5325ca94ea156315ac71e336067 |     
    sh4a     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/44180088af0264737adff622a1b128efc874dcf2 |     
  mips64el   |         gnu-efi-3.0.15         | NOK | http://autobuild.buildroot.net/results/bdd367e3e135175fb05b5ab081b2309c6f27c440 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/79972ede39507a1f7423854f460073140520971c |     
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/6e9d9e6f7021350ec6a29aa69bf5fb38b044d8b3 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/f2b25786b508348c26108f8987414572d868ca43 | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/e393874d31704c1ff61afc36f9686286d2ccda32 | ORPH
    mips     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/161a1f331f126f69deb1d4df31cb1844764ac972 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/d43311ee9db019afd64bf3071bc4f7514377bd2b | ORPH
    mips     | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/88be60b961a0d031c7ec0356c449ba1ef817aa3f |     
powerpc64le  |         gtkmm3-3.22.0          | NOK | http://autobuild.buildroot.net/results/17263ac51f197031106eb7fd595126a2720f0397 |     
powerpc64le  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e28ae9a281d9146ea12105c2ca9bb6a901636a0f |     
    mips     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/57d168a75368314e31a596ad95245b2736536703 |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/668de87bb713a97251f1fb75c1e46596b933a453 |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a8f5d218c0d7911181d61b43298c79a8933065ca |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/812b3588d2dc35e12f4a1df78d5d0ffac4b81434 |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/99a7b74bbe45f0d75c5737fee3e9f11726053e18 |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/4a4459c4365022133d35660625e093dd6597ed1b |     
microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/6c1b78f8c103a4de190a66859f78d6a066be1c65 |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/98d2376f0f9351ce35ac363318af447357edd670 |     
  mips64el   |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/8c2ba20ff462bc6c263af5ff6571c50fc6fa5d5f |     
   mipsel    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/76e9bf1677d718262ba5fb3fdfe446a4593264b7 |     
   sparc     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/2afd285bf363019056f24555eedee9c08e7b8d2e |     
   x86_64    |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/4536950f5df6a70168d6faa5a292f676ffc61c39 |     
   x86_64    |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/2040665851c1ff5aafc8e81dde7985608aa18f99 |     
microblazeel |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/2252b4768b850c7b45e1c2a046e95fcd4769170e |     
 aarch64_be  |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/9b527e65025dc2b1cfc17fbd95bbd82ab1ec8a4f |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/42f61c4fc637b75676ded4c6197e12b4da224824 |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/9a7b3762b3987858bbe7a78cbb0413a30f2b5aa4 |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/d73d32fc715e71913315a032e4b3c20a39ff1c60 |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/ea61dd6ce19b74cdeba1c4fba87a5a677940912c |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/bb7b14de750d8b3e387147afef1fb786dfbf526c |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/fa18b8626602cb8be4d5a60f60ec8fdb795669f4 |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/7790a8beaf767e50684f060d8c02d56f1b560800 |     
  powerpc    |      host-libiberty-2.32       | NOK | http://autobuild.buildroot.net/results/1ac08fdca9a38b3ced0cf8fec127dae81b33af2c |     
   s390x     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/c94834711d208b0480c2bf45aedc5e785715d57f |     
   xtensa    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/7842abf97cf4a76a36f13b419fb8cb87419ce0a2 |     
   mips64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/83fe96310f4aa12f406c7f1b2b58cc06fb7e2239 |     
   sparc     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/5df782a74bdd477c9d2c5b566c7946ece595421d |     
   x86_64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/23bb78f6c093e1b2e75b452ab03a9cc105702557 |     
 powerpc64   |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/9e8e30f40f67c6cf80a857ae2b84b2d43e27041c |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/f40350a440b7333c758a31725aaca1ada3f8b6ba |     
   s390x     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/8de14a2292d28a0b0da37fde5a44306176223990 |     
  sparc64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/6b64dd323c69bdd0877d0113ef260e0821c1ebe8 |     
powerpc64le  |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/392ed65083ef7f45513d7a3ed8637b3fc4f4c5c2 |     
powerpc64le  |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/ed39c149afd55f18271a04eb5a6a289e5f005c11 |     
    i686     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/aec4e19ad6bef2040360045ab681f65f09c19afa | ORPH
  aarch64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/dc20dc2ce458c6fb1178b4d9799181cdbc365b0b | ORPH
  powerpc    |           lame-3.100           | NOK | http://autobuild.buildroot.net/results/23e8e00d11376f0558c7888f649c91bdc2831457 |     
    or1k     |          lcms2-2.13.1          | NOK | http://autobuild.buildroot.net/results/4028ccd5bd570268a0144a0c79dfacc3b50a826a |     
  powerpc    |          lcms2-2.13.1          | NOK | http://autobuild.buildroot.net/results/28d3617d565e5a3f5ce839655038e85ceee0ecd5 |     
   sh4aeb    | libdill-32d0e8b733416208e04... | NOK | http://autobuild.buildroot.net/results/51f1711e9723d4757773dde372c6bb87ef1af1ab |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/c5f9d7f0ebcc199ab177db7191344838c9b81f34 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/1cb760d61fecffe6e73493a1d525fc02d13f066f | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/4cdb315f3d8f35d54d437585cf243d848a1deec9 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/2b9a21dbc6d513e8b35deded72cb9f729e45e301 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/c88f3bea789182043d7b42c384736d0cbc3bd2e3 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/eac188f832753eda718c9cb983e755274cf143d0 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/9efd9625b1470cc3501f5646d339041f982c6243 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/c4efbc0801d4cac4a9635d79dbd87849e12fa372 |     
    m68k     |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/17ee29aec0ff64b5d70f4ac6017e56eaffa8a07f | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/3069bda7ac7fd3a727f849c0485749edf2ce6853 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/60bdcade47a2b951c0a3d797d55d12c94a39d04d | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/52677422f39f2e9ecd37da93d53b3e1864f17992 | ORPH
microblazeel |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/73a6b7e74daef4e6ac1ba677507a7cf28d27f9f6 |     
   x86_64    |        libmdbx-0.11.12         | NOK | http://autobuild.buildroot.net/results/962e8507340155137ba104d385b100c000293179 |     
   mips64    |          libnl-3.7.0           | NOK | http://autobuild.buildroot.net/results/e57e3560aad67a214f08422002c16ecae49140e8 | ORPH
  powerpc    |        libsigsegv-2.14         | NOK | http://autobuild.buildroot.net/results/3ec4d667da09c04094b0bc7d8fd3cf43a960e360 |     
    i686     |        lightning-2.1.3         | NOK | http://autobuild.buildroot.net/results/4d302cf177d7e8b87f845437f6af390be84f3fab |     
 powerpc64   |             linux              | NOK | http://autobuild.buildroot.net/results/a56e911793f51dacc9a97e7c7dd39a3e2a85263b |     
   arceb     |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/10c86e21b796d1bce84e1aeabb182518b8e29cd7 | ORPH
   sh4aeb    |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/8eceacc99a56fd25629db5a0db1585bfc1f9fc35 | ORPH
   nios2     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/de97631d18c7ef8bdac42fbdf9cccacafbb674d6 | ORPH
   s390x     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/5299d4075f2386fee348b1ed0602a256e323798b | ORPH
    m68k     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/cd55f6dc9dfff91d62f0cb9b36650ebce225619b | ORPH
   s390x     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/6d6d1298c46e87d923fe47e495fcd786c82c08ad | ORPH
   x86_64    |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/007bae7f357c5340355e8928ac5fc603bbec018a | ORPH
   s390x     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/65b7efcd6e56dbd11099adfbc816955bc5e036bf | ORPH
   mips64    |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/a0d090aaea332263cb03049a4f8269b6550696b2 | ORPH
  powerpc    |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/a450cb8d8d765d077d9d7142ac56afad45d1b752 | ORPH
    sh4a     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/2b727d04e65421115440b5d7eefb5a173f0a9655 | ORPH
   nios2     |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/c29a6fea94d09f92f5ab3ae9b770bc996c245622 |     
   armeb     |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/2926b13b7bf4493664fac6169214d94347ab8810 |     
    mips     |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/bcd2db39b44597a1a713cade0a4b81e5b1e74eff |     
microblazeel |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/bbfb782456e6c311a42be7a6f697112a830e81cd |     
   mips64    |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/4fa1edeb849f6aecaac3163a3003d942215b763a |     
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/1fea01b3fbfa9d479264c77a59e61cded8133acc |     
   nios2     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/c2438e2d7e42abc48e970251d9b0f6a301961ba7 | ORPH
   nios2     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/5157df48d6c733df2b056c66e3a3b0553efbb27c | ORPH
    or1k     |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/c1acf2206edb5127055baa30ce7ed1e52957abe8 |     
   arceb     |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/efff8a069b5a7c23577229d8d6f3c16788c3e3fb |     
   armeb     |       lttng-tools-2.13.2       | NOK | http://autobuild.buildroot.net/results/3c0831f2e95e2ac6a4efe273ff1db41b1eae45e7 |     
 aarch64_be  |           lxc-5.0.1            | NOK | http://autobuild.buildroot.net/results/fce4d9baf4a536757d93a4c737dc1640b8c943b1 |     
   nios2     |          matio-1.5.23          | NOK | http://autobuild.buildroot.net/results/0de97cf24d6e564e6cb2ebc9e544ea558a28b9d0 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/f7348b2028157fd430993177cfb65018d5297ab0 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/4a66287354e6ca43010be2065d1953a336a7f3e8 |     
    arc      |            ncurses             | NOK | http://autobuild.buildroot.net/results/052500bd2c0da9c767244eb2b5cf9ec3c6759395 |     
   s390x     |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/7dc03ae5ea37c1c7df856cb856ed857ccee32ca4 |     
   nios2     |             ngircd             | NOK | http://autobuild.buildroot.net/results/07f981813b15ca730d4f797999a9f906e3ddc804 |     
microblazeel |          ntpsec-1_2_1          | NOK | http://autobuild.buildroot.net/results/1a4c48292ae77eddcdfb2910b7994aae4ec08044 | ORPH
   arceb     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/cf46f6f2dc7990b2cfad95076c1ba200c379c454 | ORPH
 powerpc64   |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/b50322263f077d1d9fa23c6647fe18916c2a0f21 | ORPH
    arc      |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/0566ac1526cce6b44768c852c59862ba68d9999a | ORPH
  aarch64    |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/660ae09d4a15ace9a95fff31f159216e169adaf8 | ORPH
    arm      |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/b81efb19c3c7d1a9f79ca980d89cf06c0af068fb | ORPH
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/7738267ee2d397e47912646d1ec0f98f2c7828a5 | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/056f97401b1112cb30e73a0d361f870f5457631b |     
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/362c197d01426ec4d4d9ba1351776652cc440b3c |     
   armeb     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/7733a4114a63d5fc1d32d3002246bbc47e4dca2a | ORPH
    or1k     |           php-8.1.12           | NOK | http://autobuild.buildroot.net/results/8aa534062a1a56fcda41ca35c76c599998011fd0 |     
  sparc64    |           php-8.1.12           | NOK | http://autobuild.buildroot.net/results/c383b6b9dc6e3f9fa35bd5ea0e96419658dbfe63 |     
 powerpc64   |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/846d2dac85f248c6ccdd0700c839405fbd18819b |     
  aarch64    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/89a12dd6c60d60a08f4f5360ab5022a9ee98b893 |     
   sh4eb     |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/afa344334cda68ecae15a7e980f002aa7c7e0e86 |     
    mips     |      python-orjson-3.7.11      | NOK | http://autobuild.buildroot.net/results/e52fbf7cb921496ee6b7471f72844d202c8e38c3 |     
   armeb     |      python-orjson-3.7.11      | NOK | http://autobuild.buildroot.net/results/091296e6be6a3ecc1ab074aa27c129fb30122834 |     
    arc      |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/def437f44b200054bb8964fff1478b0d2ca994a9 |     
    arc      |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/bfd1ecbd76a7bf38c51a1d65f972c46b0fc762da |     
 powerpc64   | rtl8189es-e58bd86c9d9408c64... | NOK | http://autobuild.buildroot.net/results/a49773cc73741685e55e785434dfc859e8f246ef |     
  sparc64    | rtl8821au-4235b0ec7d7220a63... | NOK | http://autobuild.buildroot.net/results/e0899f0ce387ed4c06888b317f74430faaf04a9a |     
    sh4      |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/0f20a61b6de790cf50762804e5913e071e5fe4c9 | ORPH
    sh4      |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/f70aae364316ea1df43e164b4c046bbb743044da | ORPH
powerpc64le  |         sqlite-3.39.4          | NOK | http://autobuild.buildroot.net/results/16395c07e69c6b8ab3ddd47c7220763a2ce291cb |     
   s390x     |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/b468fc9701ff872b08f4829a40659cc7b8778f68 |     
  sparc64    |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/8de297b540a1829dc3e2e678cf1f24fc6b95b7b1 |     
  sparc64    |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/0d45344064581f8c6f44cc6db4da281466c2c27c |     
  mips64el   | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/abc34f52bdd1c74d6f420ad1677594940e93bc65 | ORPH
  mips64el   |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/dbb9e1e4300f2f65c5a5069e371e7f859a041498 |     
  aarch64    |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/c8465bac67d81704c69662c0f281ed1d5c1cd132 |     
   s390x     |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/16f63d44001dbb28ac56b1b0bf27503e6f4f630f | ORPH
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/f4ca151fb5f8f86bfae80130ca94de400d70c564 |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/6aeb8c957ce11292103b7f7980b2dd392a434963 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/872cb74d6ff96b588260f5f5b5eadfec6d1d6fc3 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/dda2094a10f15a1ce74aa19c6403ecfa72938a9f |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/53c4b3cb3ab6558f2aea4df0f6a927fe2a38f8a3 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/cae8844a612eec9fc1b653dd23d1cd6186728680 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/634a8b03f8383e9ef89f29bf16eb208b794fb6d7 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/f796971154c42c0e99d8cbb6e66fe5a478777dd8 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/60b292a18222c1fe211f5dd0478cafb7229e5f53 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/2bfa8a42c78df2f7fec62cb5a73773783f9fc593 |     
    i686     | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/4736dd637949628c188240dd9ebcfb4747020f20 | ORPH
   armeb     |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/1b955c5f109961877428601e34899ba178c9b29d |     
   armeb     |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/126cab893b0d0b76f9be5062339910229d83cfb3 |     
  aarch64    |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/322750657d62bae50875e47eb08c6ec1c3587802 |     
    arm      |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/b50892b322881b9c6a36e9143126c855113da821 |     
powerpc64le  |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/cde5127a6f606972fdc2a3b8f3bcbbd729725260 |     
   armeb     | xr819-xradio-4f0cfd5e869ca1... | NOK | http://autobuild.buildroot.net/results/434c1d2a5104090366519278314bf750324d3710 |     
   x86_64    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/447ce1f1cfbe29c8e372b9a3d2008286503ee799 |     
  aarch64    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/5c35fb48e2249ff625d79290f400cd869a8a4f44 |     
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/b636cb5ba5a8eb42a735742e34ad38b3aa198d41 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/2881e94887a2564caddf91afa0d45efde300a306 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/b8e8f01ea810614747f5daa96707315064e2dcb3 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/81c607791ea251dbbaefdeea8627f3f8fbe450a0 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/26279e3a88a830cc9fc17b171dc399cc17a367ab | ORPH
   x86_64    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/627db30b51efc3a09d4425f9c58bf1de0c9eb815 |     
microblazeel |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/3baff7b60feda3123eae2d19861eab432fe091d0 |     
  powerpc    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/95bf0f84e6a7ac7102a29bd31d2d823264184631 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/fbbf3dd8188adab87846aefa25b8b8e422d256a0 | ORPH


Classification of failures by reason for next
---------------------------------------------

              alsa-utils-1.2.8 | 1 
                   aubio-0.4.9 | 1 
             cni-plugins-1.1.1 | 1 
                 dhcp-4.4.3-P1 | 1 
                       gsl-2.6 | 1 
              host-pahole-1.24 | 1 
host-spirv-llvm-translator-... | 1 
          imagemagick-7.1.0-51 | 1 
                  jack2-1.9.21 | 1 
                    lxc-4.0.12 | 1 
                    norm-1.5.8 | 1 
                    opus-1.3.1 | 1 
    python-cryptography-38.0.3 | 1 
                 wavemon-0.9.4 | 1 
                 wolfssl-5.5.2 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        alsa-utils-1.2.8        | NOK | http://autobuild.buildroot.net/results/b7bea7e0641b982d4cf472c09c130776bc0d9948 |     
   x86_64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/31e5f6fc44689c4d725df9c7f1982de54923f39f |     
powerpc64le  |       cni-plugins-1.1.1        | NOK | http://autobuild.buildroot.net/results/a6174b769edcd27b32ae5e74356644504e9ed303 |     
    arm      |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.net/results/618c7ad654274ae1cadcd9c34f4dab58a18d754b | ORPH
  powerpc    |            gsl-2.6             | NOK | http://autobuild.buildroot.net/results/b3aa35efbac5b7739fe706f2ecd7271b1df2caa0 | ORPH
  mips64el   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/888fd62711bc80ce53e7aa4dc1f10aede487857a |     
   x86_64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/511396271ee23ac2ae029e001f857ebb773edeab | ORPH
 microblaze  |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/b46665a9fd38822f1a670818a8d8a3c56bf81629 | ORPH
    arc      |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/e09fcf3ce14891b430eb61953a119926b4c502e6 |     
powerpc64le  |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/33a3ecb696b244f605c3f0a26710d307ee72f7c6 |     
    i686     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/94c3af3195bafea2595cb24f5b6a875b57dedd63 | ORPH
    arm      |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/224ada4c6461f8ee9a535c65cda3f8eb98c3bc41 | ORPH
   x86_64    |   python-cryptography-38.0.3   | NOK | http://autobuild.buildroot.net/results/340c4389b369b091a7a648a98a926c5d09afd65e |     
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/5542f5699a6e6665e68776e51b332ad12e8cbe2b | ORPH
    arm      |         wolfssl-5.5.2          | NOK | http://autobuild.buildroot.net/results/5a8505046d0b621d882566845ba69c14169d4cb7 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                  exempi-2.6.1 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/6f1086271e3a8f744b269aad4dd2744e1ecbb713 |     


Classification of failures by reason for 2022.08.x
--------------------------------------------------

                       unknown | 2 
               collectd-5.12.0 | 1 
                host-go-1.18.8 | 1 
                    ruby-3.1.2 | 1 
ulog-0389d243352255f6182326... | 1 
                 wolfssl-5.5.3 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        collectd-5.12.0         | NOK | http://autobuild.buildroot.net/results/6ff6d10e64d4c74b9f4dbfb5090aed1a9c0084ce |     
  mips64el   |         host-go-1.18.8         | NOK | http://autobuild.buildroot.net/results/aa7677123b76fe5187284d3af6e55f4d5a1018ef |     
  riscv64    |           ruby-3.1.2           | NOK | http://autobuild.buildroot.net/results/9bd7c8431e4857d1a1d71dc1db1e3314718a6c09 |     
    sh4      | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/e21e82806f3c0ddc0cfc2d273155555ebde5cb72 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/288ff0e7a9ad571230a4eaba4e1687082a22731c |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/861cd5ec3da01dc75de79d81ea1e5a3a2c745ccf |     
  mips64el   |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/f029bfb45c045e1742b4d0c171829ec13fa411b6 |     
  mips64el   |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/5c4eb02ad4b12e1856dd3bf3b1349024af6d8fe1 |     



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

