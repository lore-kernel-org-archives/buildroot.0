Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3675DC4332F
	for <buildroot@archiver.kernel.org>; Wed,  9 Nov 2022 07:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 807334175A;
	Wed,  9 Nov 2022 07:44:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 807334175A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H4ll0hVDUjPl; Wed,  9 Nov 2022 07:44:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02DCE4175B;
	Wed,  9 Nov 2022 07:44:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02DCE4175B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DD1551BF2B9
 for <buildroot@lists.busybox.net>; Wed,  9 Nov 2022 07:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C473481EE9
 for <buildroot@lists.busybox.net>; Wed,  9 Nov 2022 07:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C473481EE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c46S7Hi_35yp for <buildroot@lists.busybox.net>;
 Wed,  9 Nov 2022 07:44:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72A2581EE8
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 72A2581EE8
 for <buildroot@buildroot.org>; Wed,  9 Nov 2022 07:44:12 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8AF24240016
 for <buildroot@buildroot.org>; Wed,  9 Nov 2022 07:44:09 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 09 Nov 2022 07:44:09 -0000
Message-Id: <20221109074415.C473481EE9@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1667979849; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6kMKGEFHdiudWtnm416LBYy1pPwBORMEB3P5Bpk02gE=;
 b=ZdzXihtZkMIh+iDd6GtrGeJ31nndyLy5t9GQx79QN4BjPUCZP/rocjgy0B8/5nabQVKt33
 0qnI8wJgQ9zVFJAl0gkP6nSKCaRRH5DkAhzMSgIoeU+1IlGcXNO460P/RbcX0GijpX8DFM
 RMdhO5ZnRhQLiYABrbrMRVq6Vf/ZCaz3EUqEh3VSid87hCUY8NYapQBFPf08uetYjBiyhG
 /ghmnZ9IaTGYpyl5k2Y9GjvP8GRcBScCnNL0GNLF0QlIJOudXKORwzfLGicgKjRi09yBkQ
 5pO+PYEa/W3UDGwh5t8PD+zGMjGlM0aHfaAkGB+3vV/ULP2tbZr3z55jZ96dZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZdzXihtZ
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-11-08
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

Autobuild statistics for 2022-11-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  6  |  1  |  1  |  8  |
  2022.08.x  | 15  | 17  |  0  | 32  |
    master   | 151 | 185 |  0  | 336 |
     next    | 42  | 96  |  0  | 138 |

Classification of failures by reason for master
-----------------------------------------------

                   libnss-3.84 | 16
glibc-2.36-66-ga1dc0be03c9d... | 15
          imagemagick-7.1.0-51 | 14
                      xz-5.2.7 | 10
                   linux-6.0.1 | 7 
                gerbera-1.10.0 | 6 
  gobject-introspection-1.72.0 | 5 
              host-pahole-1.24 | 5 
         s6-linux-init-1.0.6.3 | 5 
                     frr-8.3.1 | 4 
              host-rust-1.64.0 | 4 
/home/buildroot/autobuild/i... | 3 
                 dash-0.5.11.5 | 3 
                host-go-1.19.3 | 3 
host-spirv-llvm-translator-... | 3 
               libglib2-2.72.3 | 3 
                  bind-9.16.33 | 2 
                      crun-1.5 | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
gummiboot-2bcd919c681c952eb... | 2 
            host-binutils-2.37 | 2 
            host-binutils-2.38 | 2 
                linuxptp-3.1.1 | 2 
        ltp-testsuite-20220930 | 2 
                     lxc-5.0.1 | 2 
                       unknown | 2 
                 wolfssl-5.5.3 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
afboot-stm32-3566acd582e553... | 1 
                alsa-lib-1.2.8 | 1 
                  boost-1.80.0 | 1 
                    brltty-6.5 | 1 
              containerd-1.6.8 | 1 
                 coremark-1.01 | 1 
        edk2-edk2-stable202102 | 1 
                     efivar-38 | 1 
                   eigen-3.4.0 | 1 
                elfutils-0.186 | 1 
              erlang-22.3.4.22 | 1 
             fontconfig-2.13.1 | 1 
       freeradius-server-3.2.0 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
              fstrcmp-0.7.D001 | 1 
                     gmp-6.2.1 | 1 
              hyperfine-1.14.0 | 1 
            igh-ethercat-1.5.2 | 1 
                   json-c-0.16 | 1 
               libcap-ng-0.8.3 | 1 
               libdeflate-1.12 | 1 
                libgeos-3.11.0 | 1 
                libglvnd-1.4.0 | 1 
             libgpg-error-1.45 | 1 
                libkcapi-1.4.0 | 1 
          linux-5.10.145-cip17 | 1 
      linux-5.10.145-cip17-rt7 | 1 
            linux-fusion-9.0.3 | 1 
             lirc-tools-0.10.2 | 1 
          lttng-modules-2.13.1 | 1 
            lttng-tools-2.13.2 | 1 
                     lz4-1.9.4 | 1 
  matchbox-startup-monitor-0.1 | 1 
                  mender-3.4.0 | 1 
                  ntp-4.2.8p15 | 1 
            ocf-linux-20171122 | 1 
              open62541-v1.3.3 | 1 
               openpgm-5-3-128 | 1 
                   opensbi-0.9 | 1 
   openvmtools-11.3.5-18557794 | 1 
                   perl-5.34.1 | 1 
          perl-net-ssleay-1.85 | 1 
                    php-8.1.12 | 1 
                      pigz-2.7 | 1 
               pipewire-0.3.59 | 1 
                    qemu-7.1.0 | 1 
qt-webkit-kiosk-a7720e50f2b... | 1 
            quickjs-2021-03-27 | 1 
                      rauc-1.8 | 1 
                tealdeer-1.6.1 | 1 
              tinymembench-0.4 | 1 
              traceroute-2.1.0 | 1 
                 wavemon-0.9.4 | 1 
                  xvisor-0.3.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/a3b933093e229673a8571f71392553ffd87d30db |     
    m68k     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/e432916a346fcd67871bb73bba2da2ffa9c3acb1 |     
 powerpc64   | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/b7eec9c1771104402a333d0e36c10cfae4ed7969 |     
 aarch64_be  | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/3ae1af9d540240bd02211802b644f758324ec353 |     
 powerpc64   | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/8f08db050b99908bb395b51a2c5271a05813c591 |     
  riscv32    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/fbc9aab0fe5b8df5bc4d768726b9511ae0a3b825 |     
    arm      | afboot-stm32-3566acd582e553... | NOK | http://autobuild.buildroot.net/results/d8554486f7825027bd1705e943560c9ffaa11461 |     
  aarch64    |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/61a2f5513a37d7fae474b7dd33970b90f7f41b27 |     
   sh4aeb    |          bind-9.16.33          | NOK | http://autobuild.buildroot.net/results/3e04f3c250f9868cf0b4ed7ab4ec74ef213d1928 | ORPH
   sh4aeb    |          bind-9.16.33          | NOK | http://autobuild.buildroot.net/results/f520fd568e290c3f0f67292b1a46a644bdf0c732 | ORPH
    arc      |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/6a631124dd5fa05f0413808f91336cca4ffd31e8 |     
microblazeel |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/ab836eaaa8bee7a1fb63de889ab3b462279ba9f4 |     
   x86_64    |        containerd-1.6.8        | NOK | http://autobuild.buildroot.net/results/851a1f338817500017ea2c34bd59f379594ec6e3 |     
   sh4eb     |         coremark-1.01          | NOK | http://autobuild.buildroot.net/results/4dc387eef5bbabbf61a1898c3e2d77db1441a14a |     
   sparc     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/5aa3f842caefbd1373f805704b95aa74d484c50c |     
microblazeel |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/0467dccd513f395bc7a88c33e0607012eb272790 |     
    sh4a     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/e3ee6da3810a8510d018ddf206dd8b5a1329ec44 | ORPH
 microblaze  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/5aba0e143f51be5912316d1f4a2740841979a6f0 | ORPH
  mips64el   |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/7f7cddc1e58f0f586457600070519da0e31fb026 | ORPH
    i686     |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/f9d04fe429cfc9b1aceb737c8026155442e81348 |     
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/5a680695a8a3d8b9ea76b441e191f56fc47f5a17 |     
  riscv64    |          eigen-3.4.0           | NOK | http://autobuild.buildroot.net/results/7cb6662af894da3a4811af3d0cd2363bbfa6d959 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/93a24a18167a74b12b4716aea5c07732d8988b25 | ORPH
  sparc64    |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/169dc20d87e2352171c11f03e4ad07edec696fec |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/1b6a2531a917c4eb08d2dae11f2d3a8c0dd1e0dc | ORPH
powerpc64le  |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/479d936440f01b2726b0af19df45393f2005ed9e |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/95a5762a42723c3f5ffc5c0c750c35cf3ed4fd98 |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/5ab2842aab6ab82b4ac93882bc2fcf57233b2ba9 |     
   xtensa    |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/3d4a09dcb379a0fc423010f18840c824571cc4de |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/e502b4cd5da5f75d8be7f6ad1245a8e158538813 |     
  mips64el   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/393ff04c860ebd5a0f87848016a605f2a806b47a |     
   mips64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/d491ca2a76028452c8bed05bcfa9413efad324ed |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/0e134d5d526037568896e8e586ee6171449dffd3 |     
   armeb     |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/0fb2b477328056e818f58916853301b312bd0dfe |     
  aarch64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/d57d975510d51f0519ed7b563447f4b785f7274d |     
  sparc64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/35b1ef4d9fd88c90b10b37f5081104980c2e847f |     
    m68k     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/f4cf3c65aa99e2754d4ae21fb928cba7885203cd |     
    i686     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/4607f132750eea3bb700eca14e10d8c572382083 |     
powerpc64le  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/483ce5749d67543eb41387e2a89e7706cf0bccea |     
 aarch64_be  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/24df3d97b0c49950ee53ffb65cc82c3c69d96767 |     
   nios2     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/49e6de2d810f0ca51f4c3d4da43d22779cdc71d5 |     
   mipsel    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/3d1295ac7571294ddb82a68cb06027b9563d0c3f |     
    sh4a     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/a7e59180040c383d36f6049297af9e74adc3cba1 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/751acffb5101d2dcfbe219256b607a08a09fd714 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/f1d020062bd7050a3217f24be235eb0f1ad8e77b |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/4ca5c0870a149004e3e5d99271479e77cebe001c |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/23ae57ed2b488e6c6096f866038a24f1093133ce |     
    mips     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/9e00ba27e33bc54371df43f82791276276ae6ea2 |     
   nios2     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/6681e6fc5628cc287a80a7330acd96bf35b0bfef |     
 microblaze  | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/7a14b95337785657619716c9114807f41685ce5c |     
   sh4eb     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/78f60c83ec69fc86f5aa5104590d8da0d7932e84 |     
  riscv32    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/fdb2402cd867559c41eb49da3ee6101287dd8cd6 |     
    mips     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/72c0364559c1c18fdbccd991a5b28594309767fe |     
 microblaze  | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/f414e1037d60e28702d978889f07cc0ec0464da1 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/401dbf10306a96432f2de5dafbf95d6492c464b6 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/188cf1147449000b9d192dced087288e35878993 | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/a341d87b14d2cf20e887bc8b047caeb0b47d8510 | ORPH
 powerpc64   |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/20df165370b2bf4d41bd390fba256e795ab773d2 | ORPH
 powerpc64   |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/48a16a25ac732d375609db6469b530ae6ef4065c | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/73d570e5b624053c80770db108ee782a97e98607 | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/73cd4e1690419a3acf348a59afecfd080150ab1e | ORPH
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/0fdcc6cd65a035d1e418b87dbf83e55393cad032 |     
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/66142914debf093abc5638d28775acd2072ad04f |     
   xtensa    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/0e8a4fe2d32825adc809efb7169ed9e02ed62dae |     
   s390x     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/8a5586099ac2d6b59742dfc44b31f3f2a1210ec2 |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/d66d730a04fab2d4607a9be6a52bc19e58ed5f4f |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/650eee8c85877b841475ea94b9ffea0a5c5f3dfe |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/b8bfe682240a09130417c34df88bef83d9aa1e73 |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/10b8744ac74e95ec8d3dbc80a62f1d52990ed8c8 |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/04bb682073ccfc38a32ce1d0dd60b55fbdf7d299 |     
   xtensa    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/914f8e072c7a0944810fa66bd4a2828dccceeecb |     
 powerpc64   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/407a5feb9f5bd50f6df15c3f9ac350541f4d06a1 |     
   armeb     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/395862dea96d05cfefda7f5424bec8cf9036f451 |     
    m68k     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/afb5736dcc99b13fa46d4f9a09bb18ce46c2b805 |     
  aarch64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/d83d30b669f61e0a3a6da828a71e2b5f3201b32b |     
 powerpc64   |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/e6ec5be7255dd7dfd49a3a82381203eb030887a3 |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/d1322fa38f259f72557228f67145c0e50eb083dd |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/9078f1c41ba42a1c27a242d4414562d33219ddec |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/2ff6623026f6e55f661759ac6c36c3eddbd9d8f8 |     
  aarch64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/0a612d59c89867eeb3b9ac34179b91dd5b874a7d | ORPH
    arm      | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/6f32c44640fe2b0f06a8231f815ce0aab671d221 | ORPH
  riscv64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/b400a6de46e4537bedc63442dd3606d226cefd6d | ORPH
    mips     |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/6657c55462b38a1c66a0f77bb2f8b30dd3a1f00d | ORPH
 aarch64_be  |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/ad5b68ca3d08c031ba125e83fbb085abc03c7270 |     
  aarch64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/45de79033bfb943a394a21d3e3cd0e4cd4573416 | ORPH
 powerpc64   |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/7124a48214aee0ad86ca2a66a319317540207700 | ORPH
    or1k     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/7ae7f070dee4f75766d613795d379de35414d0a4 | ORPH
    mips     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/62971344b4b3f449e846a30f6dbc666f7afc7184 | ORPH
    sh4a     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/fd7d76eb6ac42c15ca503048f11b49296d5463a5 | ORPH
 powerpc64   |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/9c5432d92c136b558b8f9965709c53f2cb66cfef | ORPH
    mips     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/9a5f05ead92c236a8ae1a02df5111573df7f3b0e | ORPH
    arc      |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/db35ed75f52709fd1f6aa77357d2d5e13d4e0285 | ORPH
microblazeel |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/9b36b24fced84246d9e06e12860b4fb05c335cfe | ORPH
 aarch64_be  |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/bc862024b4ad3ba151f480636f6493afb41796fd | ORPH
    arc      |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/6174f7b56f355c1314cd1c09c9165347c56c73c8 | ORPH
  aarch64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/29e813df17bd01f06b2a263ef632481fad5bdfc2 | ORPH
   sparc     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/acb6d4ebf95bf8d2ad0b6123d0c6d50cb1924096 | ORPH
  sparc64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/be966a396ed5df053f678e09f1904c0a4d7dd4d7 | ORPH
    or1k     |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/a213d05d089ac0dc477e56642dc979a6e4f5fe39 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/57c20d5c72b737a4af5501d977d0e9a09367a689 |     
  aarch64    |        libdeflate-1.12         | NOK | http://autobuild.buildroot.net/results/8bf532abaf08b25528d22d9e74127e004ec0244a |     
    or1k     |         libgeos-3.11.0         | NOK | http://autobuild.buildroot.net/results/d9866a1920fe3f5735f74838076412037fede42f |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/9a2f50723b9679d7422340131a431bc4b81dbe76 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/62cddf2e0f1c913a809b0bf2285ed75c99273c96 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/d1a4b4dd25fd105bd6141bec5c4ae268f8e4059c |     
  mips64el   |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/09eb647c036c67923d17f42e80693de1c54bb0be | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/3d29c144d3f7ec8ecb8f29b2e4d5db023b5bd774 | ORPH
   xtensa    |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/18513a6c34b76d3a2696d4371d547cb0cc5cad0f |     
   sparc     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/c5d80d06cf5bcb3265e2e4e7f5d1e580203ba1a7 |     
 powerpc64   |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/21c4abe04edabb034f985824137b0d8f076124f4 |     
    mips     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/ff8b76579ed7bd13ec53a88c1b24ed1a957e98e0 |     
microblazeel |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/1620da9462566d44f29c95735d883168939ff695 |     
    arm      |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/c8a4f89a1b11e6a5abebde0b09889b952b3dd4b3 |     
 aarch64_be  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/9538ea663a9e0bdd7d5f917839d9e4b11b80da05 |     
  aarch64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/fcd5b3a38c5c1bab6f16cce3ee8d5bec7ab5493d |     
powerpc64le  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/ac1b0b6e86a4bba133ce0903de77d97c9c559b5a |     
   mips64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/6e2dedbac2b639568e088a5649d990659a63272c |     
  aarch64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/e621395c4c1775da511ebdff95718da5af51e5b7 |     
    mips     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/ff7dad008c6802017ab43d89a220d5a43041a03f |     
   sh4eb     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/c3ddbcbf014d9fbeb23b442ff49932d7f3768817 |     
    mips     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/09f268aaec08f8d31c561c83de91ef74c2817fbb |     
    or1k     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/cceda5de0600825dcfe448c034aaefe38c6084b5 |     
   armeb     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/90b57bd39a93a06047e9ba2f4fc7af22099d580b |     
  sparc64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/7f4b713d87db652e2aa0e2f74fbacd76cfa9d5b5 |     
    mips     |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/f41b8e76bdb547eb6565e11174e551415f75e1e6 | ORPH
   mipsel    |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/3bdb1544c7563b4f0ab81894e090dbaac24a8e8e | ORPH
   sh4eb     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/5ef75ff777dbcc0d4d744af0f438602ff6904cdb | ORPH
   mips64    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/90046281e4b8ec85a2f946e04291a7d64c18ea8a | ORPH
   mips64    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/d657d0b4e7b508aaf92adc63a8fc8baa211f1717 | ORPH
   s390x     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/a02f5d6cd74267bfdd3d32c0cb56024c5b9c62e8 | ORPH
    arm      |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/85fc6ab82cffbde045d53f3810d9d6961a3a7ac4 | ORPH
    arc      |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/7e7ab0ff92d10668308d910db9f5fc52430e4fb4 | ORPH
 aarch64_be  |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/2ad75850be2493844e8520b61443d7d89760cea3 | ORPH
  sparc64    |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/509bfeb9083b5bd22a55291a376ea9e87ffe8231 | ORPH
    i686     |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/2b3c9c425dffb4a31db33a426b7f91cef0766843 |     
    mips     |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/58d9a71bd5360f88bd70343f7d2b760456f3dbee |     
   s390x     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/52ea1b256753785befb75fb83728bc2e9d56cb54 | ORPH
   armeb     |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/c21adeb74917d8a5e2fd09cc95b82a469f3511ab |     
 aarch64_be  |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/7f4ddaca83d871d7e615fa1c544a03774b661d73 |     
   arceb     |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/21b4766716bd8238186ad840db6968d9a4b1bdd1 |     
    i686     |       lttng-tools-2.13.2       | NOK | http://autobuild.buildroot.net/results/dc5d17b23ff5b485030a16a2d260a344e42a37ab |     
    i686     |           lxc-5.0.1            | NOK | http://autobuild.buildroot.net/results/0a45ce686a65b5ba298bfd5db0c4523917d93f80 |     
    arm      |           lxc-5.0.1            | NOK | http://autobuild.buildroot.net/results/5a36fdd08489cb8cd98b76cd98ac04ef61c67ea6 |     
microblazeel |           lz4-1.9.4            | NOK | http://autobuild.buildroot.net/results/ea8ca7dc62794d6dff55c18acf54896714590566 | ORPH
powerpc64le  |  matchbox-startup-monitor-0.1  | NOK | http://autobuild.buildroot.net/results/223f43dd76ee907c5f25c4fee94a0f5d75614dd5 |     
powerpc64le  |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/150ee2cc4bd5ebbc7a1eca1de27261902e0d4a1b |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/d812572da88a83c443c1879a53955a59b89ba95d | ORPH
    or1k     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/9aa90380e36576c537249962f978d042d70e6661 | ORPH
   sparc     |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/7cd2010a89bcc0636d3324d28a046cf164a24df3 | ORPH
   mipsel    |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/f036b893a5519a2739d386744e56d6c06a131896 |     
  riscv32    |          opensbi-0.9           | NOK | http://autobuild.buildroot.net/results/436fa16fe3854c170d6ed3a408bec9cc2fbe2746 |     
    i586     |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/7aef5fd23a271369e3b89c0cf28ede4ce77fd3cb |     
   sparc     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/bc7fd4d9fe1eba6e1e281078551e8de916528320 |     
   sh4eb     |      perl-net-ssleay-1.85      | NOK | http://autobuild.buildroot.net/results/7c788bbdb624557e045b0a7a9b82721202e1322c |     
    arm      |           php-8.1.12           | NOK | http://autobuild.buildroot.net/results/8773514b0d55f0e38ed86a09ee399ccc8d1fc88a |     
 microblaze  |            pigz-2.7            | NOK | http://autobuild.buildroot.net/results/becdd217882469871641923af2df3f2934c1228f |     
  sparc64    |        pipewire-0.3.59         | NOK | http://autobuild.buildroot.net/results/eb3eaee469ac1973283e148ee4704355d20952b9 |     
   mipsel    |           qemu-7.1.0           | NOK | http://autobuild.buildroot.net/results/c63da26e05d9e39340af1785c077912c419a52a8 |     
   x86_64    | qt-webkit-kiosk-a7720e50f2b... | NOK | http://autobuild.buildroot.net/results/090886f52c82323511386b21a8c9d2cfe5a5aab6 |     
    or1k     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/d1bf9934c9657d0d5a8039edec955892eefbf1d4 |     
   x86_64    |            rauc-1.8            | NOK | http://autobuild.buildroot.net/results/3f8125952382b50767cc170971f4af8309a5ffe4 |     
    arm      |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/3f2e218e88537e1ad298b6a39f4ab3469e1a9740 |     
   x86_64    |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/48e7b4730e61754651bbb8c4cb9ead4d5d1bb679 |     
   mipsel    |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/a2790a7cb9e14d0ca8cfec4d79f967af0709f096 |     
   s390x     |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/d46a0f8c68351ad0e6b9b6786a0fe42ac4188de9 |     
  aarch64    |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/1767fafc839e7084b98b6eced2e2d6ecf828ca41 |     
powerpc64le  |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/5ee62b3ddb9d953407e31bb52696352bbb4e94ed |     
   armeb     |        tinymembench-0.4        | NOK | http://autobuild.buildroot.net/results/eaef3c167483b09ccb333eb981e0f8cd12aecda3 |     
   sh4eb     |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/453ad55f41b774d4d94ca9de4643eaeb5e0dc831 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/f66b6e1b0f67d2a401696fd9bcdac25d31170fc7 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/f2c1650ea66b4e60a0bc15290ff8a7df49589d48 |     
   s390x     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/ceaa54c34472592f21c4fd77114ff8a909e492d4 | ORPH
    arm      |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/bb312c3d4c5bacf572a61b5fdc1c003ad056be10 |     
  riscv32    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/a601bda0c1443f0614a60633095068ee4c1cbfbe |     
   x86_64    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/d106aea311b19bc743f4f07db36c682e818d1120 |     
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/83413fcdd2c9ad082e5d1268f568021fe2be8fcc | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/9d13f343040164a400346f8f6e4baf9767df4b18 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/a577fa280526dfd26c3121f8f4f565bedc84ffe1 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/4ed02e556827fcc9cecc8f9b6165f795ba0b0afa | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/6b62a45b8c49b49c8ba91680b2787195c9086e7f | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/cd1ce4060721f5e4b66d98bf257b1bd78a58b775 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/84aac77ffa1d3a3546d7949a2cb364a9c79e184a | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/b8f36aba979f6389de4cc946a1dd07d2ee3c3c5b | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/a187c182f2099684e6ed9fc976aa46e7e374f134 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/eabc0636ed32344acafde40efc61dbb86788dd7a | ORPH


Classification of failures by reason for next
---------------------------------------------

                   aubio-0.4.9 | 12
glibc-2.36-66-ga1dc0be03c9d... | 10
            host-binutils-2.38 | 7 
          imagemagick-7.1.0-51 | 4 
                elfutils-0.186 | 3 
              host-pahole-1.24 | 3 
    host-python-greenlet-2.0.0 | 3 
                    norm-1.5.8 | 3 
         s6-linux-init-1.0.6.3 | 3 
                tealdeer-1.6.1 | 3 
                  botan-2.19.2 | 2 
                 dash-0.5.11.5 | 2 
                gerbera-1.10.0 | 2 
  gobject-introspection-1.72.0 | 2 
                   linux-6.0.1 | 2 
                    lxc-4.0.12 | 2 
                   perl-5.34.1 | 2 
            python-bunch-1.0.1 | 2 
                     ace-7.0.6 | 1 
                apparmor-3.0.4 | 1 
                    attr-2.5.1 | 1 
                   bdwgc-8.2.2 | 1 
                    brltty-6.5 | 1 
                   bzip2-1.0.8 | 1 
             cni-plugins-1.1.1 | 1 
                      crun-1.5 | 1 
             f2fs-tools-1.15.0 | 1 
               fftw-quad-3.3.8 | 1 
       freeradius-server-3.2.0 | 1 
fs/ubi/ubi.mk:51: /tmp/inst... | 1 
                     gmp-6.2.1 | 1 
              host-delve-1.8.0 | 1 
                host-go-1.19.3 | 1 
                   json-c-0.16 | 1 
                   libnss-3.84 | 1 
              mosquitto-2.0.15 | 1 
                    musl-1.2.3 | 1 
                nerdctl-0.17.1 | 1 
            ocf-linux-20171122 | 1 
                 openssh-9.1p1 | 1 
    python-cryptography-38.0.3 | 1 
                sysklogd-2.4.4 | 1 
                 systemd-250.4 | 1 
              traceroute-2.1.0 | 1 
                       unknown | 1 
                 wolfssl-5.5.2 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/59c6ad7782d069f77071b6c35d04616c61b4962d |     
   arceb     |         apparmor-3.0.4         | NOK | http://autobuild.buildroot.net/results/d10cb0eb6add9ae32e48cae48645835966a05372 |     
  mips64el   |           attr-2.5.1           | NOK | http://autobuild.buildroot.net/results/1660de16a8faf44853e684e2c6aa0e61cb375171 |     
    or1k     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/6c28080753c93efa8cd94cf420b464f9f7896472 |     
microblazeel |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/64a7013e11a1146def40368b0dc080a57607731c |     
powerpc64le  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/97f044f3e7eb7741c8f356c53a75e84026cf26ba |     
   mips64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/7f8e2f27dda885142ac9c0153539451248d64b88 |     
 aarch64_be  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/3521b03354687dfb5657481ff656553108afabc6 |     
   armeb     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/adc3526133e5c4a2b00341f16d8ac95ac98268ee |     
    arc      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/67425bc47d05fbf3c63a5c00f1d51db9e28a3b88 |     
 microblaze  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/5df07a7fe130584e9772aa40f7b3abe89a1df2a1 |     
   s390x     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/b2c12ec897bf3383b13777ef3d13334c32e22663 |     
    sh4a     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/cf755351adba608c40b9c6920726d007f0204e00 |     
  powerpc    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/d8cadba3fe5dc75c1c10c4f14cda7b82a062de75 |     
   armeb     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/d386861ba4ce57c03f95a7b7a98fe6280e1dd8b0 |     
  riscv64    |          bdwgc-8.2.2           | NOK | http://autobuild.buildroot.net/results/d9e28ecd0bf28d119ac3c75d2cb0814f6ac87067 |     
  sparc64    |          botan-2.19.2          | NOK | http://autobuild.buildroot.net/results/d6b1e4ba4f36378f8e26ca27e77e1c10ba2665f8 | ORPH
   x86_64    |          botan-2.19.2          | NOK | http://autobuild.buildroot.net/results/118cabf5bcd3aa874b9bd78224bd359bf95ffe2f | ORPH
powerpc64le  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/c959a740eedf0313656f7bd3a28184c589bcf5d6 |     
powerpc64le  |          bzip2-1.0.8           | NOK | http://autobuild.buildroot.net/results/ac4e2c4f0c576f2e8a1727f6f6dfefe124389388 | ORPH
powerpc64le  |       cni-plugins-1.1.1        | NOK | http://autobuild.buildroot.net/results/04e90c8b6658a6d72f628bf9d764419d189fa35d |     
    m68k     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/6473328e2a103175d943233436b5a976d648ad7c |     
 microblaze  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/1b150f1658ddee3c6fa76d7cbc00c40636d5e18f | ORPH
   sparc     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/3dc4775a96676355351db036546a70936e03a183 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/3dd4085a08e2f837c0388cdf6391efae616515ab | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/30e466d1726bdf0250c76263e8474ad40b90e3a3 | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/d42af765b54eee22c80fc23e075e29a151824595 | ORPH
    or1k     |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/b9fb7e2121846e5de56d0b92ae9ceae7826f773a |     
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/cb36c4ac2ae6833e39f5b871675e45891750caf9 | ORPH
 microblaze  |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/b5a527457ffd7a849376f319ccfd436edc08f880 |     
 powerpc64   | fs/ubi/ubi.mk:51: /tmp/inst... | NOK | http://autobuild.buildroot.net/results/8fdadc1754dd5410953b599278396c1cee19ae4d |     
    m68k     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/125fed5878b39975611e3969c4d7291329012106 |     
microblazeel |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/fdb5679536aa32c481c303f10205a30c6020d7ee |     
   mipsel    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/9bdb0bbb211bbff4c0f813716a2b2361c22edabb |     
 microblaze  | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/7b374dab25fea7ea67babce9917643cd8ceb923b |     
    mips     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/82617b85391d84bb46350e94dd26361e1c5a8da2 |     
    mips     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/668bc9e68cd23e752b9d7444a8df79f92bfd6cee |     
   nios2     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/668b114ccff3eae40bf07532fd18dff77e880be2 |     
powerpc64le  | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/4f9a4036bbace7e82c973e86a12306ecfce517b3 |     
    or1k     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/8f38abd7c75a3dad8ab77bafd8f8eba1c3f53cef |     
    or1k     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/1725f09a51906ca51d98448aac718fe0d04d9309 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/d17517c9c4f368703c8f3665c494c73f49ba04d7 |     
   mipsel    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/c897c1e93ef048e8c9144a66a987cd9ce6957f26 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/a00fc95e7a2cf7007016fe8b1cd22cca51d91f6d | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/52d9d2bd3861271d455e6e24db882087b8a5df59 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/5c6beef33f60f5ab4e3344c82206de58327806a3 | ORPH
powerpc64le  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/867508140b8a38353c742ba578fbb860abcfdf4e |     
    i686     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/70b1a093e401e9879002d5cae68f3d37c573d002 |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/88804d761ae414406966d4b802c816a91871e507 |     
   sh4aeb    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/22c25b6ac849c560539ae29f22de5600b4c90841 |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/5cff59b3dd3690cf9c3dd2a15704fda58e77f906 |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/2734e50cd25b2e8004628c9e75ce7dd40c24c5a2 |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/7592832a2bc54f93533e3ba1b40ef0926be28f1b |     
  riscv64    |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/21bfb0ad9ac634d5321e5525755fb9e37a5e4067 |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/0104257330b4ec2c1105678633706050b55b24d4 |     
   arceb     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/60486e2b74c6f8695ae0a4a74bf10c4202aae9cc |     
    or1k     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/9fc481805c7a227b2ed4f930469ac8ce308ebf95 |     
   arceb     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/4199300da1be62adc6d3443aa57c8dee4dd6935b |     
    arc      |   host-python-greenlet-2.0.0   | NOK | http://autobuild.buildroot.net/results/55205853debc9101196420e021513e4c25256823 |     
    mips     |   host-python-greenlet-2.0.0   | NOK | http://autobuild.buildroot.net/results/2a85550924dec47fb55186705db42fac1ef9654b |     
   sparc     |   host-python-greenlet-2.0.0   | NOK | http://autobuild.buildroot.net/results/82483f21f37333c1bb277b94e8923bd3ab7c9655 |     
  aarch64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/6d84cf9ad52e1fc997267fc8acc6368fc7edc656 | ORPH
   arceb     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/5dcaf5b88a54a795e77fd39e374b7cf73c023c83 | ORPH
    m68k     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/adc5f677e8bcedaf45358d1b62a6b04d3582845b | ORPH
   x86_64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/50e6290759422d7042baa0a52de3bed6d545cdd0 | ORPH
  riscv64    |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/83d87a7e36613b83e79e15e31792e3557c65b965 |     
  sparc64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/d9cc26939d52e5b41b7ec9f91042e16a8a836587 |     
   mips64    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/8e901e4b1dd10b4810dc48f40b1b2cd9cea8de2e | ORPH
    m68k     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/be226448066dc471bb013972dbe5e77675cfdeb5 | ORPH
 aarch64_be  |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/8d55a23d4757df361bac678d5388e16500558a15 |     
  powerpc    |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/a24fda878fb83cef5179eb43bb9a9b27b8409acf |     
    or1k     |        mosquitto-2.0.15        | NOK | http://autobuild.buildroot.net/results/f2d8e41c5d2f0699b67eaab1253ef98ddedfe072 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/c178e103d8836597cc72a74443d9a704880aa135 |     
    i686     |         nerdctl-0.17.1         | NOK | http://autobuild.buildroot.net/results/8dd56eee44eaaa683a2c33cd3aabbe9b9ac0da88 |     
    or1k     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/bc53c7cad211b0006896171517b67e9a22ae602e | ORPH
microblazeel |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/2dc36a6b97a5f0aa23acf5bc55d594c2e5e6c6ba | ORPH
  riscv32    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/4fd1caa8a66478492377999d3fb1ad3582708f50 | ORPH
    i686     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/ff78a1a20b4faa61283cb7a0665f3cf4c5e7d241 | ORPH
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/6c7c81026f27b44249efebcbb490069a2ceb6931 | ORPH
    or1k     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/2dbf4edf71570b1e2b5a108f0a249478f278479b |     
  mips64el   |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/69f9cd7c71191bf35222578c3d8844686ed1fc03 |     
 aarch64_be  |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/508b5f6c3c4711cdeca9eb84c5918089b3632b23 |     
  aarch64    |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/09f968286fe0e57d9ec5dc0150e5eb274463668b |     
    mips     |   python-cryptography-38.0.3   | NOK | http://autobuild.buildroot.net/results/ef2103c232e8c0277047b83bb2f64b4fe0071eff |     
    m68k     |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/60bcd0a1225bb428d8bb17526264ff10416d5359 |     
  aarch64    |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/8bf14c4a33ab451c8c1a318523ce7a8dae86a009 |     
   mips64    |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/57dfb32529e5c69dbed709235d4426fd91e404ff |     
    arc      |         sysklogd-2.4.4         | NOK | http://autobuild.buildroot.net/results/ffcbe901cf6da8ccb21eff491d289dd664dd11d3 |     
 powerpc64   |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/68c17056490d441c7f862349e9c7e471b4570162 |     
   mipsel    |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/63dcfcc2ae1ad8f8f794f5f127f738bbefdbd128 |     
powerpc64le  |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/132093ba35aa71fee413a8c7557f0eee0d35ebf6 |     
  sparc64    |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/20a7cfcacee404abb93d725c4768630f9aa6508a |     
    sh4      |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/50ff06fece4f50740a0d5e4b229fb0882c01010b |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/2f6df5264035c9c3e744a120c62b03a0e67f7e1b |     
   mipsel    |         wolfssl-5.5.2          | NOK | http://autobuild.buildroot.net/results/f4c65d5b6f14ec80425bc8b46dd9184ba7007aa9 |     
microblazeel |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/442b63bff8908a0cc23583a75322499bbe296c31 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                 libwpe-1.12.3 | 1 
                       mongodb | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         libwpe-1.12.3          | NOK | http://autobuild.buildroot.net/results/c4fbbde4cf112313265366e7722513f747802f40 |     
   x86_64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/ce56838503a57795991d17feefb94c76c4080efb |     


Classification of failures by reason for 2022.08.x
--------------------------------------------------

                gerbera-1.10.0 | 2 
          gitlab-runner-14.5.1 | 2 
            igd2-for-linux-2.1 | 2 
          imagemagick-7.1.0-51 | 2 
                    4th-3.64.1 | 1 
                    attr-2.5.1 | 1 
             fontconfig-2.13.1 | 1 
glibc-2.35-134-gb6aade18a7e... | 1 
            python-ujson-5.2.0 | 1 
                       unknown | 1 
               valgrind-3.19.0 | 1 
                 wavemon-0.9.4 | 1 
                wtfutil-0.41.0 | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |           4th-3.64.1           | NOK | http://autobuild.buildroot.net/results/d2746852913ba77c1bb29e5b552c080b649fff2c |     
  mips64el   |           attr-2.5.1           | NOK | http://autobuild.buildroot.net/results/302dc13dd79b066e5451bfcc2048cf9ef6430ffe |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/4963210b90d5dc4388fd8f1c3e65d9c1d48d141b | ORPH
  powerpc    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/9d03a1089a45601cb040ec82cf2eefe8ba46619d |     
    m68k     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/a891122148084c64dae7904bb0ce2e238be175d4 |     
  riscv64    |      gitlab-runner-14.5.1      | NOK | http://autobuild.buildroot.net/results/eb716a5643593a7f0bd3a3a851dace40e4cd4446 |     
  riscv64    |      gitlab-runner-14.5.1      | NOK | http://autobuild.buildroot.net/results/1740483e42379ae4b010f0155937e8dbb2c8df18 |     
   nios2     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/ffc879b70af4a63eaadd7ca1a7308e3a2def5ee3 |     
   nios2     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/6d4642957679784ef091bb012ee8db15f061ebb7 |     
  sparc64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/908142fa37d2c5dabcefe777f16fb06be9dc8832 |     
   s390x     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/1941cbfbad5f11a9adcec8b21b70030a4f4df3c4 | ORPH
 powerpc64   |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/e15e8bfed312589c59ea3d8c341a544166ab30b9 | ORPH
   xtensa    |       python-ujson-5.2.0       | NOK | http://autobuild.buildroot.net/results/bdfe38978ae16a597cedbedf45d8c9c6fa43aff4 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/c7ec48c9d14d8b3c8b9c9ba7fee16a6f3eb08eb9 |     
   mips64    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/79b383d4094d415e7079c7c9645c9dc4cc0a69fc | ORPH
 aarch64_be  |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/d23ac4c55efeeff449013b5747d35e1cdcd9e3fb | ORPH
   x86_64    |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/833ab570da3b5c45a5572e93eb6828ca48a91301 |     


Gitlab CI results for 2022-11-08
================================


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
