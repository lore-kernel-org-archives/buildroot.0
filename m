Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB1CC47088
	for <buildroot@archiver.kernel.org>; Sat,  3 Dec 2022 07:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA2EE40165;
	Sat,  3 Dec 2022 07:42:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA2EE40165
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EzEu65rnlcy1; Sat,  3 Dec 2022 07:42:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC4FC4018B;
	Sat,  3 Dec 2022 07:42:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC4FC4018B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E974A1BF4DD
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 07:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C0EF81F62
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 07:42:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C0EF81F62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OYtSDNutKVFe for <buildroot@lists.busybox.net>;
 Sat,  3 Dec 2022 07:42:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B3D681E5D
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B3D681E5D
 for <buildroot@buildroot.org>; Sat,  3 Dec 2022 07:42:33 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E4C75240003
 for <buildroot@buildroot.org>; Sat,  3 Dec 2022 07:42:30 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 03 Dec 2022 07:42:30 -0000
Message-Id: <20221203074236.8C0EF81F62@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1670053351; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VEX4Xsv295ogWLgks0+Pmmrbmu1EFyxMHclqk8gnPOo=;
 b=gzPKF/yeAL3LdwA0rA6Ab1hJL0r+wlECR3TMd06wx2FGa3fXV2VSbhJ7aUXEtxFbawOOAB
 rDrlUXAJVB1LYoqxAvWePtRRdPUFtYOGFh7VPRqHq+TAKZweY2mNaxXX3JucsKCgZ1geCg
 YOID5jqV2xJm6RxU+ENkElLdbp1CMN6c+1H1SU06fRkSGS4SjlcCam8rXBLi0+3Q2soUkb
 NLfIuDeouX0ZjrFEuNfd2t3YIgNynnAna9QyMDhRMcDjsBKVQXZoD1eeip2Ozf2N/RINyP
 LYy5O2boHoUOFHYn5y1jKIZdm4IY+861OSvRMkkKSrBglj83Eigjl7q3Xqw0FA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gzPKF/ye
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-12-02
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

Autobuild statistics for 2022-12-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  7  |  0  |  0  |  7  |
  2022.08.x  | 27  | 22  |  0  | 49  |
    master   | 256 | 200 |  1  | 457 |
     next    | 21  | 23  |  0  | 44  |

Classification of failures by reason for master
-----------------------------------------------

            host-binutils-2.38 | 10
                   linux-6.0.9 | 10
              host-pahole-1.24 | 9 
           python-numpy-1.23.4 | 8 
                       unknown | 8 
              host-rust-1.64.0 | 7 
                linuxptp-3.1.1 | 7 
                host-go-1.19.3 | 6 
                      xz-5.2.7 | 5 
                  zabbix-5.4.9 | 5 
                elfutils-0.186 | 4 
glibc-2.36-66-ga1dc0be03c9d... | 4 
                libkcapi-1.4.0 | 4 
                     lxc-5.0.1 | 4 
            quickjs-2021-03-27 | 4 
                     frr-8.3.1 | 3 
            host-binutils-2.37 | 3 
                    php-8.1.12 | 3 
                    bat-0.19.0 | 2 
                      crun-1.5 | 2 
                  ffmpeg-4.4.3 | 2 
             fontconfig-2.13.1 | 2 
  gobject-introspection-1.72.0 | 2 
gummiboot-2bcd919c681c952eb... | 2 
      linux-5.10.145-cip17-rt7 | 2 
             lirc-tools-0.10.2 | 2 
        ltp-testsuite-20220930 | 2 
              memcached-1.6.16 | 2 
                 openssh-9.1p1 | 2 
                    sdl-1.2.15 | 2 
                tealdeer-1.6.1 | 2 
toolchain-external-codescap... | 2 
              traceroute-2.1.0 | 2 
                 uclibc-1.0.42 | 2 
ulog-0389d243352255f6182326... | 2 
               valgrind-3.19.0 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
               acpica-20220331 | 1 
                  acpid-2.0.34 | 1 
                alsa-lib-1.2.8 | 1 
  binutils-arc-2020.09-release | 1 
                  boost-1.80.0 | 1 
                    brltty-6.5 | 1 
              containerd-1.6.8 | 1 
                 dc3dd-7.2.641 | 1 
                 dmalloc-5.6.5 | 1 
                     efivar-38 | 1 
                  faad2-2.10.1 | 1 
                 fdk-aac-2.0.2 | 1 
                        ffmpeg | 1 
fs/cloop/cloop.mk:33: /home... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                gerbera-1.10.0 | 1 
 glslsandbox-player-2021.08.24 | 1 
google-breakpad-c85eb4a59b6... | 1 
            host-binutils-2.39 | 1 
host-spirv-llvm-translator-... | 1 
               libdeflate-1.12 | 1 
              libgcrypt-1.10.1 | 1 
                libglvnd-1.4.0 | 1 
             libgpg-error-1.45 | 1 
               libsigrok-0.5.2 | 1 
              libsodium-1.0.18 | 1 
              libuhttpd-3.14.1 | 1 
                 libusb-1.0.26 | 1 
               lightning-2.1.3 | 1 
          linux-5.10.145-cip17 | 1 
              liquid-dsp-1.4.0 | 1 
                mongodb-4.2.18 | 1 
                  mongoose-7.8 | 1 
              mosquitto-2.0.15 | 1 
                    musl-1.2.3 | 1 
                netdata-1.33.1 | 1 
                  netsurf-3.10 | 1 
               openblas-0.3.21 | 1 
           proxychains-ng-4.16 | 1 
            python-sip-4.19.25 | 1 
sconeserver-8d1935919a20133... | 1 
                 sudo-1.9.11p2 | 1 
                   trinity-1.9 | 1 
                 wolfssl-5.5.3 | 1 
               xfsprogs-5.14.2 | 1 
                  xvisor-0.3.1 | 1 
                       zip-3.0 | 1 
                     znc-1.8.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/5eaa85d25c9292f96283a812856417063cf9bafb |     
   armeb     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/c1205e5afa6638efda6a1453199f26cb96160428 |     
  mips64el   |        acpica-20220331         | NOK | http://autobuild.buildroot.net/results/b9d96b2f5e25d3d0e9d51a353481d690bc9fb498 |     
   mips64    |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/5ad75b391c688e118f1606b5ca772ec1eb1aa6b3 | ORPH
    or1k     |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/5c0e42897caab7a71b779fdee25ea6191283fcc7 |     
    i586     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/fad65fcedd983768afad8322fca482654ddd9b34 |     
   mipsel    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/5fa8b024813d30ecd09653f81364ae305cf000d7 |     
   arceb     |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/add11fa43f892ddcf6b2fc721c505db7f2aa8af2 |     
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/4ca54a85672d7b9328b1909b457e548c6032a493 |     
   mipsel    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/2a82a3149ba05d3c1bbc1bcba67440b7e5fb0479 |     
   x86_64    |        containerd-1.6.8        | NOK | http://autobuild.buildroot.net/results/7aaee5158b1eb1ac6910182ddf2571365823bdd3 |     
    or1k     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/be6c72165849c6fb476af146fda3d363dbb9e201 |     
   arceb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/201871021eb7c145d3ca5b5960dc3aed81fa704f |     
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/04a0d9ae62450a7d1d7babb6049dc22c9117b01c | ORPH
    i686     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/4e6f683d07c865f4376351d010f09da7f2d19d03 | ORPH
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/076b942a905a93ee6e4d207b0051166630f37aed |     
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/da6c0f617a79fe6d2b2abd695f0c20a0e318ff5b | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/2a03be2cf94efda8d7481d7d6f6f449473a2a391 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/06c4c5bd592b4f50b898f33ecef28da8f7ef2b88 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/46e3565af0303aa16dd5f8f4029d9413b9d5afe5 | ORPH
    sh4a     |          faad2-2.10.1          | NOK | http://autobuild.buildroot.net/results/1a333c79d3380e5e571e93187e4ef023a84559e8 |     
  aarch64    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/d6c07f59be1cf57acb58f6efa09d8db32589833b |     
    i686     |             ffmpeg             | TIM | http://autobuild.buildroot.net/results/3e5441a0609186d0704fbcafb5f2383e6e6b4624 |     
    arc      |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/02c6cbacf7decf4a4494c20d2c2f400521502f41 |     
   arceb     |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/b691e4390a9959a7e634e074a5e297b190af4f35 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/b774d01529316b327bc955c0c12177b33327f645 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/88aeac11b8927e5c032c9ba8f8c046a140d031de | ORPH
   xtensa    |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/a03dab91842d8d3086a96e836ccb108635aa888e |     
    arc      |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/445a8226038a16f1ba7f68f8fbb4657de2192f35 |     
   xtensa    |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/22fa2dada0405872e8f69352954238b9c843db66 |     
  powerpc    | fs/cloop/cloop.mk:33: /home... | NOK | http://autobuild.buildroot.net/results/acb9a52b29c7d9f27aba42f3864d67f54f61a7c9 |     
   nios2     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/0ae6373d27ab80f24d0a970da37779cd1a957af2 |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/3603a3e76a884b759b0d2c4766993731f47e94a9 |     
   arceb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/1c5bf0bbb3d9e7826245079a947f646c7843d0fd |     
   sparc     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/36d093f3fed694ee8999ae0a2c51b19767563292 |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/190629efee3e6c9b68bca59ec45ab3c6c0b75cfc |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/b12ac683b79bc90bc9b1a9af487a6816f2ee3f7e |     
   mipsel    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/056dda5a2ff2fa5a9af9564b4e9da23af56ce300 |     
  powerpc    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/04a4263eb22a65897005c33ff2cc78b0d45fef06 |     
    i686     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/377a8b95558018ee104f2a4731184fddc095d633 |     
   mipsel    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/9e6e00b62a1cab1924d8ee74979cbe41a96ff9d8 |     
   sh4eb     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/631a30f15b7fd57a62b8f1743452262f27f37f9b |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/132105d46ea6e3474ddc69f85a21660d14e90597 |     
    m68k     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/f4419d1fe166cae8efb4bee035010bd8a0119618 |     
   arceb     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/71f66f858df137e83560965913cf12955b24fd89 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/616ffd0d3268c13fe466e1b92eb7c050cb0977ac |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/0199b53f668e6c8db4ddb34b385e1fd863a393f7 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/43c215a06877f2b6fe4cb3714f85f8ac75d27927 |     
  aarch64    | glslsandbox-player-2021.08.24  | NOK | http://autobuild.buildroot.net/results/d096b39e1d11710f4d3d3980172c16ec31f1c3ff |     
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/278a2be8bda09a3707863b9fec43776d3ea5e6bc | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/4b3336ed67e1d29749e723e92ec14aab7ded080e | ORPH
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/287f6569a0aa23cad2df796d0622e5260e8eeb5d |     
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/72f2a42fdd9b463576dcea7cc94ec945e3e380cf |     
    i686     | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/1a43dbb69796b887b33072a719f0967ddce21e6a |     
    or1k     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/fb52c572611a3210e97146188496b19f4613a9f4 |     
   mips64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/592aaf275c6a1b666a8d3d18329259af8dbd2829 |     
   mipsel    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/ba44b5305dcfcea37d3fc25a352278ae3052beb4 |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/08f4e76a7e030a35e6d211b010746a11e2661fc3 |     
   nios2     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/418926a814c5e2ecd2ed915a7a7fba37a29b886a |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ee24e22d7502ceb5d123e18b24e1e51defa63203 |     
    i686     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/54a24899992052ac6299e2ac596ccb50c944af6e |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/30618bc4b166c242723e96df4144293cb0e995f3 |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a30a59ef2bfa38a8cad46025237d24e01b114636 |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/65ad092e00f47612e4dd12f6fcd2cd6885cb0c8c |     
  aarch64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f6db0e33de837edb7299a0b3f75782802a75110d |     
microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/9b1d58cc377ca5135e599fc3718d42e7aeba2b87 |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a231458619a1df6ff2ab537f5ab6b3426aa57fd0 |     
  sparc64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/7469259039bd925406b77021bb50f1f5de9e6487 |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/26e3e3055f92479fc34058848782dccbfde433d7 |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/bf6fc0d5dba51f06d1d4d5d8e7d9cdcb1bca1b1c |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/c2ec6af2127075591bc36282622531d5628c4465 |     
powerpc64le  |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/462f056d3849aa78e2dc844e2998dd9a6c0b48b6 |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/ea4bffd24d1f65dba31d783628c52fe6c8533cfa |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/0b1f0956cfac1d8b4d8d103fd19ae224a7aeb9e7 |     
   mipsel    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/588546df3ca888e6a86b72af9a6762a3be66c924 |     
    arc      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/0ae0e3c9df587bf454fc57343159536c44662557 |     
 powerpc64   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/36030ef6730c61787b641a8140703c54d1e9d191 |     
    mips     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/a03616a3a74533cc8972682dc195f210099ce761 |     
 aarch64_be  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/5881d20fce71df5095e7173bb156224d86e6e528 |     
    m68k     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/94d7210d19b19f8329fa3e5b734c936c7ee44f71 |     
powerpc64le  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/0846ce73d4ef493563bc416e4912716f153c698c |     
    arm      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/e11d3c8e2b3089281cb7d363fb53956b243dfe01 |     
   armeb     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/47dbc9591ea1e5b8a1cfb7eeeceac59615277dbb |     
 powerpc64   |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/97d2f41f9f8461f1a4f1bd4705aa29800e027363 |     
  aarch64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/9fab89ae0a7c8435687916ac6b7ad138f2123c4c |     
 powerpc64   |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/22c2dcdfaf1a3d2445b704a0d4404632e95609db |     
   s390x     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/6155cd775e78036f5c5af2e0caa0aa0b0dd0a0e5 |     
  sparc64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/d4271a54d38803ce603f4b1ce4d5dbefac9a6be4 |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/4e5174fe2b24742bf5b94c102524bce07269869b |     
   s390x     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/a62aa8f5e8a3bee0c816ccffe0250cfe3792bd7d |     
  riscv32    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/467459a5f6bdc9c9a8fe1babe34f9245e80d7252 | ORPH
   armeb     |        libdeflate-1.12         | NOK | http://autobuild.buildroot.net/results/967a7a46c2a0d3a3364d45765b33cea240c93f5b |     
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/89654352030409a2444861bf05eee779cc3cf38a | ORPH
  mips64el   |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/b4728e3c18899cb441abfce773ab06ce5c1c2007 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/b748619a508e228474aa9565e6baf0a91beb8885 | ORPH
 microblaze  |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/4394ec36b9b6348d5d5e2d554a8fef100aa8fd74 |     
microblazeel |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/bbe18fd81dffdcbb3794545990ae280e69c29d29 |     
microblazeel |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/78fb6520cd6fc7f435a4614912b1a2496b845ca9 |     
 microblaze  |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/06dfc8e8c45be37d80ed0f56f1d64dfcb40d81e9 |     
   mipsel    |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/a021afcfcf8f0ff402d883cace55c26949db605e |     
    arm      |        libsodium-1.0.18        | NOK | http://autobuild.buildroot.net/results/a32c665e47efa7fb22c06ed4b4d03937c8ae817c |     
  mips64el   |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/64d60d99f8db6df1c6e736a9554e67667a9d0d25 |     
    or1k     |         libusb-1.0.26          | NOK | http://autobuild.buildroot.net/results/abe0193b40a2faab383690fa6a435c0a16201601 |     
   mipsel    |        lightning-2.1.3         | NOK | http://autobuild.buildroot.net/results/e2a71dbfe4fcffab28bdf9371314f48c77fed9f0 |     
   sparc     |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/4ae934f36a921c5e08d83eb770b4d8678dcc4e04 | ORPH
    m68k     |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/2b36e1961d67a0023d35a78f954e40e4af6bed3f | ORPH
   x86_64    |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/40e80b8e93d079d5f3b2a7f60c9fffae71e22fdf | ORPH
   nios2     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/7772bf603f7e0ab05e66a38cec8f46f4a1a15724 | ORPH
    mips     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/aa02e12b4948c22c81decbba6bbb40624aac1001 | ORPH
   mips64    |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/d26d4e827839893b0bf339e5e56b179d3cf316d4 | ORPH
  riscv32    |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/268cd52111d9e2700ca53f564294f6a6fd0558a6 | ORPH
  mips64el   |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/4df6e7851d5d7175cc65360755915370491bee31 | ORPH
   s390x     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/398dc5695f1fe6545936caf571b152c95c5eaefc | ORPH
    mips     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/dfc3e431fccdad99342e5af772061f50239660db | ORPH
    m68k     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/9cad8e53607356a893baf2559c14fcce79310cd9 | ORPH
   mipsel    |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/0917141b0cf021fda0dbdd44cb4ac3d36a07fd7c | ORPH
   arceb     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/2bc6341c18bdb0478f0cb0cdf64b21fbc9516c09 | ORPH
 powerpc64   |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/5294fac7ed04945d47ea4eb2d1448bcbea5352bb |     
    or1k     |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/f9f75d2838d771b96a2845f37def07ba6c2d29c5 |     
   arceb     |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/8118aa23e2b458834c0547549274034083d811ff |     
    mips     |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/1e2dc8f8dfa4bf01c0325ddb4b3e43f32ea9adc5 |     
    mips     |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/c0558a928cc4fe8ad0ca9c51b2c5ae19328de526 |     
   mipsel    |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/423d7e05d99c41842992d0d0b53b927de0308544 |     
    or1k     |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/9004ce8ac4be91dd0901ab259df330cb6b48215f |     
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/34512dc5bf87cc6dd1fe1dab3334e866917dfafa |     
   mips64    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/2ef9349db816a663e627355f8af074c35e91f970 | ORPH
  sparc64    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/033c9bc1c9b3c0eb848d0030960b1c0a89bdf15d | ORPH
    i586     |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/66f5682f17e88b613a46b8a62d3ba59ad29aefe9 |     
powerpc64le  |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/bf1756aa314c29edede1412ea84a8de53543d3ca |     
   mips64    |           lxc-5.0.1            | NOK | http://autobuild.buildroot.net/results/b49a4848f40ab069a25e07069e5497471a710511 |     
 aarch64_be  |           lxc-5.0.1            | NOK | http://autobuild.buildroot.net/results/50b7343fd3816c8a5b682930765249e07f84abf6 |     
  mips64el   |           lxc-5.0.1            | NOK | http://autobuild.buildroot.net/results/2467bd3c13b6450f4a3342c30940f8d01c4262b8 |     
   mips64    |           lxc-5.0.1            | NOK | http://autobuild.buildroot.net/results/e7a29698608e4f529b9c90e649d12ed62083181b |     
    sh4      |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/81f73cc5a0b4c6d69de8e8a6b15d207183e4f753 | ORPH
  mips64el   |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/0bde41bb700100d8df5ebdb1b64dfdc76c7af475 | ORPH
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/81158b07dce24960cd90b32191d7bccc30b4f51c |     
    arm      |          mongoose-7.8          | NOK | http://autobuild.buildroot.net/results/1dde28a64a19a603ff87d0e1e972334b40d21224 |     
    or1k     |        mosquitto-2.0.15        | NOK | http://autobuild.buildroot.net/results/32e4d0590ac9a95d00f924c6281cc52ff4adb3dc |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/d1e5b97927d992510142350d7ebcb43aed7018f4 |     
    or1k     |         netdata-1.33.1         | NOK | http://autobuild.buildroot.net/results/17521bbc54fe00e958c9a622d5333098d30f21e2 |     
powerpc64le  |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/c11bd8f72ece8cd7ce0f89303a8101a95a8a7e00 |     
   mips64    |        openblas-0.3.21         | NOK | http://autobuild.buildroot.net/results/ef7b8cb4a08f85754e6b5a0875807e7c4edea10c | ORPH
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/c22007dbac6aa1aba2bf73e578a95f292d510d96 | ORPH
  sparc64    |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/1420091dd3815c6c4b6bf6bf44a45ac3ace1728d | ORPH
    arm      |           php-8.1.12           | NOK | http://autobuild.buildroot.net/results/01b3937b7bb874398a169dc93fbb16e7e251cc3d |     
   sh4aeb    |           php-8.1.12           | NOK | http://autobuild.buildroot.net/results/9556b6bd4c4d08ec29e9995a6ddc5c6fce48a067 |     
    or1k     |           php-8.1.12           | NOK | http://autobuild.buildroot.net/results/77fc3fa241b4fa95a60a9428af75dd1df87519d6 |     
    mips     |      proxychains-ng-4.16       | NOK | http://autobuild.buildroot.net/results/8bf61602a2d611f00369daa484be622f1843ad9c | ORPH
    mips     |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/1bdfadfb88957f4a72f53c93d9b1b49e75f78530 |     
    mips     |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/c52276568e79b6b1d440d3d67cf1bb64c499bcea |     
  powerpc    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/09da383c4503eeb6f162bd851ff309b5732687db |     
    arm      |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/9e3d95ecb6815563a0ba37b10daaca377e81eca5 |     
   mipsel    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/fea2fdf75934e94463bfeb35213f5edb90fd6752 |     
    sh4      |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/c802b0d069a866db1a6766c39952c8bbb855cf3d |     
   mipsel    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/0d103376ad40c148179a657e26e34377d5c6b332 |     
    i686     |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/ca6d51511fc939440af1717dff5e906bc208f33b |     
    i586     |       python-sip-4.19.25       | NOK | http://autobuild.buildroot.net/results/25cfbec758c42f6ade65a48a2ea79250ca8f8c8c |     
   sh4aeb    |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/0879620c7244470b870e7e2cbf1d96508820da81 |     
   sh4aeb    |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/2c6336e56c1194fed1981ac42428815623346b48 |     
   sh4eb     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/b55dcdbbb3406f9f399aaeb05e6f6e542660c8a7 |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/658e4244c2247d72cf4b5d33cd95a60e9f697949 |     
microblazeel | sconeserver-8d1935919a20133... | NOK | http://autobuild.buildroot.net/results/24faa9cf0d4c9d4a7c5b56dfa8bad7e2c4034caa |     
   sh4aeb    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/c8bf6478b1dba7b8b8a4a3723c1b3ad5454d0c6a | ORPH
    sh4      |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/d9d3202b7d0bbe22c0b5259483ca512fbaa63c02 | ORPH
   mipsel    |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/9ec92a3673e32aacf7610ac2363b505214f4c090 | ORPH
  sparc64    |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/cc05f17a2f4d7d00fdf846c73b8dd9fbcd98cf5b |     
  sparc64    |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/a790f92eb57c799b8196e0461a8b515a01567591 |     
   mips64    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/2a091a8afa3f26efe5c5516713181d391ef2831f | ORPH
  mips64el   | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/188ca4dc1b52075325676cd1d228c853a07c4808 | ORPH
 microblaze  |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/c592b8643948972ec281532bc3579289bf35a542 |     
    arm      |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/a137de01d6f49327eed0e5b39adbbd3034258489 |     
   x86_64    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/829597ec243c49c894180f5778e7fef956c4dd2d | ORPH
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/78723d063079f9ea1289fbbd1f14382ea996b7f9 |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/680fb435a9e84e343792c302f2e3d14b3729a4dc |     
  sparc64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/311843df574b80a677243a1e02da718441e0c367 |     
powerpc64le  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/a95a0abb3d75bcea357eb53fcfc22c2c45abd0af |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/ae133b0b2316064ba592e6aa33dee51acce125e0 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/54c2933d530c4e3faa17265c739d8957a1a28d4f |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/69176384c9b535a1b0ee400565ac17f006b8897e |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/74f5961cf86474b4299fee43b13f523cb0e75c64 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/6c05991d31e1d9fcfba4bcaf9e5708723fbe6654 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/a12ab4cb030102ef7f5bd706a54a5deca30ec9ae |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/4e26502dbfbc52387c83c762cdb6ee2f2bb79ce4 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/66fdbf0752ea7d8e3eae818b87e3bca7a4262c2e |     
  powerpc    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/e3f4212f1144895073444918f7d2541bb44a55ba | ORPH
    i686     |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/db74a18afedcb3369e6a49596a5a6947a70415c9 | ORPH
    arm      |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/3e9086bcc266708d79f27a47466efd864e1898fe |     
   armeb     |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/09287cd0db49e8958c09a14f73b9ba813ccfb4d8 | ORPH
  aarch64    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/803301f72e9295014baf42bbb8b40ef244c5d0d8 |     
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/e3b944520bc94c38fcf649fd33de97c3c9b52b8e | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/0690d3204cfc15e3397637b9a7a4ab2cdad1a709 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/199b1a388797fe7d503a3542e1d980a27eac1086 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/783a74eb972999e31337ebddfeff4d753918650a | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/e63eef89ced51b85b97c8b222b072aef9274ea14 | ORPH
 aarch64_be  |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/0c0d9a1642c52d1016d80201140b065354f254d9 |     
 aarch64_be  |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/3efae366232366f84fb10f93f32dcc54b7932826 |     
 microblaze  |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/2d0fe9485a6baf32bbeab2fd246a522bd9788297 |     
  sparc64    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/9dc7f500d10e8347ccb637060730a459f2d137c6 |     
   nios2     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/4a2af0fe0f1269ebf23fffa9fce907b16823b72b |     
   armeb     |            zip-3.0             | NOK | http://autobuild.buildroot.net/results/2bd3d233358c338b940f973dad34afa8c6e7c1e9 |     
 microblaze  |           znc-1.8.2            | NOK | http://autobuild.buildroot.net/results/7e810a484980046276ff4f5e8bd83f2366568502 |     


Classification of failures by reason for next
---------------------------------------------

                   aubio-0.4.9 | 2 
                      crun-1.5 | 2 
    host-python-greenlet-2.0.0 | 2 
                  jack2-1.9.21 | 2 
              alsa-utils-1.2.8 | 1 
                     efivar-38 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                      gdb-12.1 | 1 
glibc-2.36-66-ga1dc0be03c9d... | 1 
            host-binutils-2.38 | 1 
                libdnet-1.16.1 | 1 
               libglib2-2.72.3 | 1 
                   linux-6.0.1 | 1 
                    lxc-4.0.12 | 1 
                numactl-2.0.16 | 1 
                 openssh-9.1p1 | 1 
                      rauc-1.8 | 1 
                 systemd-250.4 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |        alsa-utils-1.2.8        | NOK | http://autobuild.buildroot.net/results/03dcac67cbc5650386686f75082dcc1bfaad8c47 |     
 powerpc64   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/b06e0ff6882d60b4b5fd285ad2932470531d9d72 |     
    arm      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/1902ed8ac5a84f0d98026d9cbfe69e7612ee4068 |     
   x86_64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/50d46062f670d97e25d776daa8b9832014d95188 |     
   mipsel    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/4c03732a3801f6d7931d94463ea34a6d9d5e4e6b |     
powerpc64le  |           efivar-38            | NOK | http://autobuild.buildroot.net/results/2f5fb5331a2d119403cd29667045206893cc1353 |     
    or1k     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/8037e488d9e6eca984297c34c50f17872af08c51 |     
    or1k     |            gdb-12.1            | NOK | http://autobuild.buildroot.net/results/0ff13a7abcfa83ec92ed8d4e3a3fc1f4563eefc3 | ORPH
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/fb4e8b6631b311be66b81bc66ceb0922ae4536d3 |     
    or1k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a597ef84f054597e58a9a3152f66ecd1b5d0b488 |     
   s390x     |   host-python-greenlet-2.0.0   | NOK | http://autobuild.buildroot.net/results/9198b33b9f1ad3d0c549738bd9476d1b003e520c |     
    arm      |   host-python-greenlet-2.0.0   | NOK | http://autobuild.buildroot.net/results/46f5874e8298d72e2ef2f28d9db61fe5a892ab72 |     
    arm      |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/ad9450201d49e5aceb430f04f06683e9d37162ee |     
   s390x     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/9442a58d9012f2ada94487b895d96f1548df6d2f |     
    arc      |         libdnet-1.16.1         | NOK | http://autobuild.buildroot.net/results/2a5247ab19cefdb7e9adaf0e60cb246c23104a25 | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/9844a7854f587cfefe2615d674e6923539fbc9eb |     
    mips     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/39c3469a65f11d4d33d49352c9f7242a6d149bb0 | ORPH
 aarch64_be  |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/2ff36b78c9104c708b758270558df0a5e8b69e6c |     
   sparc     |         numactl-2.0.16         | NOK | http://autobuild.buildroot.net/results/bdf19038bfdda1c01926837fff1b2f881d96e6ea |     
    mips     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/7556e4957f4f510f2f385b956f828afc623ea321 | ORPH
    or1k     |            rauc-1.8            | NOK | http://autobuild.buildroot.net/results/a15aebeb623bcfbfa9faf9e2026725cbb20cbbdb |     
 aarch64_be  |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/14c827a52d38211fef8eb435e42daa44b518681a |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/9cb5cb2bd727d9dceb4c956cab354d662733f9be |     


Classification of failures by reason for 2022.08.x
--------------------------------------------------

fs/ubifs/ubifs.mk:49: /home... | 3 
                host-go-1.18.8 | 3 
                    4th-3.64.1 | 1 
                    brltty-6.4 | 1 
docker-proxy-f6ccccb1c082a4... | 1 
glibc-2.35-134-gb6aade18a7e... | 1 
               host-runc-1.1.4 | 1 
              host-rust-1.62.0 | 1 
               libglib2-2.72.3 | 1 
       linux-5.10.109-cip5-rt4 | 1 
           linux-5.10.115-cip7 | 1 
               log4cplus-2.0.8 | 1 
              open62541-v1.3.2 | 1 
                python3-3.10.8 | 1 
                    sdl-1.2.15 | 1 
ulog-0389d243352255f6182326... | 1 
                 wavemon-0.9.4 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |           4th-3.64.1           | NOK | http://autobuild.buildroot.net/results/2cabd66c0cea0d68e2d1112713eda7867bbc30c4 |     
   mipsel    |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/7ffd293b2087da7c816ca40fd35bcbda17b6c8ce |     
powerpc64le  | docker-proxy-f6ccccb1c082a4... | NOK | http://autobuild.buildroot.net/results/1206a79839bdc9837b40f50be8d172938565669e |     
microblazeel | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/406228cdf3519dbe7fdc70a1d4d979ebee084d8c |     
   xtensa    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/7fb7b720feee1d28b0c5e30c2aefee026320e958 |     
   x86_64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/f9a898e1d3bced868039e096eca3cfe8a9079e46 |     
    or1k     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/65e48f6060e67d6eb611de0f56381f58fe2c8990 |     
  mips64el   |         host-go-1.18.8         | NOK | http://autobuild.buildroot.net/results/b10d54ec5e9e70e00d9a0f0c6b59f79a489f0144 |     
  mips64el   |         host-go-1.18.8         | NOK | http://autobuild.buildroot.net/results/4494a3c93fc663dfff7bca2e5af96d2d6d61633d |     
    i686     |         host-go-1.18.8         | NOK | http://autobuild.buildroot.net/results/7ae280ab00fb558fa215cf6c7e48a45d69781171 |     
   x86_64    |        host-runc-1.1.4         | NOK | http://autobuild.buildroot.net/results/e4780ef68af60f25b0d0b5bc521d2ba56b9d4c3e |     
  aarch64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/a2b4cc5a50d063ddc6b8cc9415b3af4d6db2f307 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/39ebf2fd8d553256111f6f7d51a766fbb8a11126 |     
    m68k     |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/060ba25ae939bbc9c6013be308febec4b5360f8a | ORPH
 powerpc64   |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/a379fc2d038fd0790ddc30c22572febd9cef5ab2 | ORPH
    arc      |        log4cplus-2.0.8         | NOK | http://autobuild.buildroot.net/results/80b4c5bd2b5a1a8254bb13be98cbf96e975ad2a1 | ORPH
   arceb     |        open62541-v1.3.2        | NOK | http://autobuild.buildroot.net/results/defa9e25cb93fda42fc8971a65a844fc285fee2f | ORPH
   x86_64    |         python3-3.10.8         | NOK | http://autobuild.buildroot.net/results/1bd41a5ec495e7af167acdb736fb47bfef354413 |     
    sh4a     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/9ae4b71b9da9ef42100df918cb529110f1c18857 | ORPH
    mips     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/54d73a4d1396246f5992c3e46899c9776c72522b |     
    arc      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/d635d7fe6fc882ad20c9315df481c48018a5480c | ORPH
   mips64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/4b2ca0bf43b3eec2fc8d075e436dd71060c788b7 |     


Gitlab CI results for 2022-12-02
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
          freescale_imx6dlsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3406470642  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/3406470789  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3406470842  |      
               orangepi_zero_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3406470849  |      
                qemu_riscv64_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/3406470889  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3406470899  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/3406470907  | ORPH 
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3406470931  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3406471000  |      



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

