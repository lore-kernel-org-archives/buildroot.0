Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F43BC433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Jul 2022 05:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C19C381450;
	Tue, 12 Jul 2022 05:32:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C19C381450
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0wz7SckSmT26; Tue, 12 Jul 2022 05:32:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 701DA81433;
	Tue, 12 Jul 2022 05:32:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 701DA81433
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B86271BF308
 for <buildroot@lists.busybox.net>; Tue, 12 Jul 2022 05:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 567F14026F
 for <buildroot@lists.busybox.net>; Tue, 12 Jul 2022 05:32:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 567F14026F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UOxqsDUczXC7 for <buildroot@lists.busybox.net>;
 Tue, 12 Jul 2022 05:32:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44127401A0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 44127401A0
 for <buildroot@buildroot.org>; Tue, 12 Jul 2022 05:32:48 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1DDF040002
 for <buildroot@buildroot.org>; Tue, 12 Jul 2022 05:32:46 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 12 Jul 2022 05:32:46 -0000
Message-Id: <20220712053252.567F14026F@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1657603966; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cLXOCXGtnW1vUDxg9iYryb1ZLQcWIEL1Q8d2Ys+mt68=;
 b=d9PDuouphOJdDdE4cCZvysRD10qKGPNgZZxCQxmrhQPcfjuSy06rOu3hPOn3NNIWj1M8eH
 alIRj0zP7rtifggL0WOsy52+18qacyLCbgdLFKjr/6ZWPBb1nxrr6ZtNagkB/mDZ8mMgUQ
 ewSiliK+ngbxw6sj5pSB8yps/1zzVZ73NryaBwLDhzmepBEnnCtSwXQA/J1zZe2oMa2qqL
 m3KzLQbevpLKxuyFKnv+Z14DIpZkT5Iurg4oUy1jUM+FDQ+VoL2BJPUSY37UGU6y+Qe+1G
 yJyKBAYDCexA77tZjeUpoZFL/QUSGOEnpgIdEaYymFNttycSRavuIvI/0C7jsQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=d9PDuoup
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-07-11
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

Autobuild statistics for 2022-07-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 14  |  4  |  0  | 18  |
  2022.05.x  | 20  | 25  |  0  | 45  |
    master   | 162 | 204 |  0  | 366 |

Classification of failures by reason for master
-----------------------------------------------

              alsa-utils-1.2.7 | 23
                       unknown | 21
                 uclibc-1.0.41 | 14
                   speex-1.2.1 | 10
               protobuf-3.20.1 | 9 
           libfreeimage-3.18.0 | 7 
                speexdsp-1.2.1 | 7 
                 zlib-ng-2.0.6 | 7 
host-pahole-73383b3a39afe86... | 6 
              host-rust-1.60.0 | 6 
                 libvpx-1.12.0 | 6 
                busybox-1.35.0 | 4 
glibc-2.35-96-g2c4fc8e5ca74... | 4 
             libopenssl-1.1.1q | 4 
                libcurl-7.84.0 | 3 
                libressl-3.5.3 | 3 
                 linux-5.17.13 | 3 
                 linux-5.17.15 | 3 
                 pixman-0.40.0 | 3 
dahdi-linux-5c840cf43838e06... | 2 
                     frr-8.2.2 | 2 
                harfbuzz-4.4.0 | 2 
                iptables-1.8.8 | 2 
               libglib2-2.70.4 | 2 
                   perl-5.34.1 | 2 
              swupdate-2022.05 | 2 
               unixodbc-2.3.11 | 2 
                       xenomai | 2 
                 a10disp-0.6.1 | 1 
                     ace-7.0.6 | 1 
              alsa-lib-1.2.7.1 | 1 
                     aufs-util | 1 
                    bat-0.19.0 | 1 
                   delve-1.8.0 | 1 
        edk2-edk2-stable202102 | 1 
                  ffmpeg-4.4.2 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                  gauche-0.9.9 | 1 
                    glog-0.6.0 | 1 
                     gmp-6.2.1 | 1 
                gnu-efi-3.0.10 | 1 
               gocryptfs-2.2.1 | 1 
         host-gcc-final-10.3.0 | 1 
          host-gcc-final-9.4.0 | 1 
         host-protobuf-c-1.4.0 | 1 
                 host-wine-6.0 | 1 
              jpeg-turbo-2.1.3 | 1 
                 libbsd-0.11.3 | 1 
               libcap-ng-0.8.3 | 1 
              libgcrypt-1.10.1 | 1 
                   libnss-3.80 | 1 
                 libp11-0.4.11 | 1 
                libselinux-3.3 | 1 
               lighttpd-1.4.65 | 1 
       linux-5.10.109-cip5-rt4 | 1 
           linux-5.10.115-cip7 | 1 
          lttng-modules-2.13.1 | 1 
                   luvi-2.13.0 | 1 
                    musl-1.2.3 | 1 
            ocf-linux-20120127 | 1 
                    pimd-2.3.2 | 1 
rtl8189es-39c17661136da48f8... | 1 
rtl8812au-aircrack-ng-37e27... | 1 
                   tor-0.4.7.8 | 1 
                   uacme-1.7.1 | 1 
           uboot-tools-2021.07 | 1 
ulog-0389d243352255f6182326... | 1 
               valgrind-3.19.0 | 1 
                xenomai-custom | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         a10disp-0.6.1          | NOK | http://autobuild.buildroot.net/results/f4ff352a74795341e470a192373678e7767d6058 |     
 microblaze  |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/0d3058cfafc88ffc9f095df83ecc1004f2ccf922 |     
    or1k     |        alsa-lib-1.2.7.1        | NOK | http://autobuild.buildroot.net/results/49a39548338a5ab72f629e155ab6fbb87939a978 |     
 powerpc64   |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/16eb0922f397334122c71bb1945eab105b5a4bb0 |     
  riscv64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/8d51eddb59b57c2aac0690c65f40240851a770fb |     
  aarch64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/6e33a7f66ff1cde26250d44284d9ce8bc4b03b64 |     
    arc      |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/db0a160ca8c500bffca84141e0333e2bb90b6d78 |     
   mips64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/91301c0e01fa320f77b7a72c266d1f5ba0438d8e |     
   sparc     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/2cbe9c2acaef80f583e926ffe2a4bfd06684f67a |     
  riscv64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/29df7af9fa7fbbf19e10c62829d055fe81fcc19e |     
    arc      |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/88c98462f3b0b9e54a166427f5bb4e19d75e136e |     
  powerpc    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/88db9217e403eb90669c80757a490e0114aedf59 |     
   s390x     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/11b292b89c5711835a101c5e310eca2d8c59cc35 |     
    mips     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/30e97859926fc63cde14378eab6a6ee88dcb1863 |     
  mips64el   |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/d29f8cf7caeb3617d05be88135d398f699c006bd |     
    i686     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/147838d88a2341c8add50684a2dc93e8d07a2361 |     
   sparc     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/d99004b766251d43b2642b46cfeb2261d4709c44 |     
    or1k     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/29f6f6cc1f93ae438f1d50874cc0eea13960bc0b |     
   nios2     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/ec0a97e0b3c854c2197889e27c483413d13d0e26 |     
    or1k     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/0acbdfa134034db296781f2e9b5373df1e26ab9b |     
  sparc64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/2f50cb636ee34e68072fb8b3326abffb22e12b96 |     
microblazeel |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/90ff709bc890f16d021f85237be04096199242a5 |     
   nios2     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/0984849a3416f0a50ff1ffc8650959731303a0a7 |     
    arc      |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/7ed2487fae16996e4821bdef83790281d6eee787 |     
microblazeel |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/22eba8cc9352fde1babd022694514e36fa13a616 |     
   arceb     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/fcb26da1c729f1a9d796b2fb3f89e025461147b0 |     
   arceb     |           aufs-util            | NOK | http://autobuild.buildroot.net/results/47bfe3f8f6c25958005d4e6d7c88f0f7b3a5d040 |     
    i586     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/42c91c240e2350568df11d2d5d6bd03aea7c3c9c |     
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/2ff863813ac0cb477128ba53103493aa2b7de4ad | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/fa876d20929aaa558fe66604e884c6f849f98ded | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/9b8c516ebd7abff50e55b703e09d44856757572f | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/afde8b62113ae7d7e02bf4d23b6d8ee320d5c78d | ORPH
 microblaze  | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/88b0ad6d4071df374527b35aaa72fdd9e420e375 |     
microblazeel | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/f1c9ff967c86562da87fd0c9ab1c1625a6563a47 |     
  aarch64    |          delve-1.8.0           | NOK | http://autobuild.buildroot.net/results/a5ed19a90a9f9999e9c9d468dc871e21ea08ccfe |     
    i686     |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/7d4a744d4df6aab90a9845cf55e4b8b745bfb27b |     
powerpc64le  |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/fc67f051cb1fceb003c93647270d0493747cf612 |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/4eb20299f9549b89c4917b785e08eed356e592cf |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/cbe18868fe424831d12e27f83586da861be5bee4 |     
    arm      | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/2daee7301ddf7722fa44d5ee9ecc9a775758ce78 |     
   mips64    | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/5b65a13bd6bb27d475a2a9beb7cd396345c477ac |     
 microblaze  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/e7c0fc705aaaaeaea62d87bad620f270d136a789 |     
   armeb     |          gauche-0.9.9          | NOK | http://autobuild.buildroot.net/results/3e496c53721ddc94e3412ad0c963f42525380976 |     
    mips     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/3d12ec2b63226868bfce0d107e4a3b96f739160c |     
  powerpc    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/3eef85e19b2523d2854c672e085ccbf3f933bd69 |     
    sh4a     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/12944b1b4e2c2bec212e391007e88a7ddcc239f8 |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/959f31f352e435be92859774773348a91876977c |     
    arm      |           glog-0.6.0           | NOK | http://autobuild.buildroot.net/results/19845971b36121dad1e637d2d19d6fd4132ab0e5 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/156ae43974a3f81129fed844f2a11e2079f92bb1 | ORPH
  mips64el   |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/8c380f85107b4dc3b198b295e3b5db3ffece60c2 |     
  riscv64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/1f49e45ec19f25dd4b71cfd5b9340af81de80c47 |     
  mips64el   |         harfbuzz-4.4.0         | NOK | http://autobuild.buildroot.net/results/7734e745534ef481b654d70d423269050d7221dc |     
    mips     |         harfbuzz-4.4.0         | NOK | http://autobuild.buildroot.net/results/69b50136b7f51564940cc5ef3c4ed62d2d2a69ed |     
    i586     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/f3a23fe485dbc1d6154c77c2e9642c09b0ac2831 |     
 microblaze  |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/4e434f3bef1f8a547d1047ad873632d0afa52f31 |     
   mips64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/940aabc61f0effdcccc78eec6f6fb026c971fff1 |     
powerpc64le  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/527c7f75b37ed2e98eb6f656dcf7f416b5a99c3a |     
   x86_64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/f42fbc4d9c0b346f76ecc10630dff77a4886fded |     
 aarch64_be  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/e57f4dab7bcd1252935106d4493a6e9aa895aacc |     
  sparc64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/6fab545191267660631bccb3285f5ca8460d857b |     
   mipsel    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/467ced4b4ec970a0205b220c3d2e6138cb9d50b2 |     
  aarch64    |     host-protobuf-c-1.4.0      | NOK | http://autobuild.buildroot.net/results/0e0dc796de1d726d68f9998acc48f041b6ca796e |     
   mipsel    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/9d4ffd0b1af8c04f167f5ce6e45633e0af2c0e72 |     
   s390x     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/04eeb1c7eaaa89e65893ec779784328b04bf88ff |     
  aarch64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/74ca00fc56148d6a643892ff1fa721d7c6a4c59a |     
    mips     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/c875164d93fe1ed857119d388763a1a9ee617a3e |     
   armeb     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/57e9e6695c5839d7adab5fd1ff997baf7749f41f |     
    mips     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/517821b9de043d0a71caa048f9529d0c08bb3aac |     
    i686     |         host-wine-6.0          | NOK | http://autobuild.buildroot.net/results/01bd4929b278fce6a09d786b42ca8f798f3a840c |     
    mips     |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/5a6fbe5cb6ca77dc782ae1e134584e47392d1b30 | ORPH
   mips64    |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/46e07e061d26117f559fe3fadeab37d145caf495 | ORPH
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/39d786d931477a59310b71752f758573679c9639 |     
   sh4aeb    |         libbsd-0.11.3          | NOK | http://autobuild.buildroot.net/results/32245101e3bf259ff760d3b71a8fb5baa6771bcd |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/dae5d1fb69953a0f0013a54d024823f594b19a9e |     
 microblaze  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/bd276076e7e380a755c7decec43ba7299d6058e4 |     
  riscv32    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/19a0a79bc82c0e73b57a62f91a9189fe6e9ae12f |     
 microblaze  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/a54331b0ed149597c54a61f6845167df42a12f57 |     
   x86_64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/d4cea93ba195f440354e48fa62dfeff238f63501 |     
  riscv64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/512e817e7daefc23b5056b312860d406808eb582 |     
  powerpc    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/0421b1ba9fefeee339e2cfc4925e577c12017640 |     
  powerpc    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/5ce4f3489bf29b6d3ccdf771d925eb8460348f93 |     
  mips64el   |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/d827755b76e19dcdb63a93338f63bc488863c601 |     
    m68k     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/dd8746b4cb06cdbed2b92469f1e831e2a00cdfa9 |     
   xtensa    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/58c7d88f8873863ff49103a6b64029a60865cc8f |     
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/589c07049b82e9026c8a5cb271a0ca02d2677cdd | ORPH
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/2e27ae966749fcf9d543452afecc5b884e3975d2 |     
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/d8783011ccc5b55c7f4541fd8f1b23ab7b92dbf1 |     
   x86_64    |          libnss-3.80           | NOK | http://autobuild.buildroot.net/results/a23ec0ebd259035220f780c15044fae4bd2a7ef2 |     
    arc      |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/5cb1d717c44bfdc39b610f0ef609acd7ef2be09e |     
 aarch64_be  |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/923dadf0016e2aff22f990e9bb20d56114830ad7 |     
    or1k     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/b6c6397c2fb70c47e87ece556789d9335a2cf511 |     
  aarch64    |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/7aff1979cd521583a8c797c6054bcddea2b85115 |     
   arceb     |         libp11-0.4.11          | NOK | http://autobuild.buildroot.net/results/171ba5ceb67af595d41910e337c952f448a7f798 | ORPH
   armeb     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/be1aebfe8a4326eb1d6ea3c9246a08e87d87e20f | ORPH
    or1k     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/8128dea9eaa1d625ee3aaecfd30add23d3b9634d | ORPH
   xtensa    |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/efdff773da14714f11650fde3d03d9b10f397e6f | ORPH
    or1k     |         libselinux-3.3         | NOK | http://autobuild.buildroot.net/results/037432861a4f7a11d0830fa56fc25392a6002604 |     
   nios2     |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/9f3c433fc90c3bb1539bca92abf68afb4a9947c5 |     
    or1k     |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/243f30a17a27d176d3873d8a71a28b9e7ae95ae0 |     
 aarch64_be  |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/f2796b7c02157016c68a4478530bf84d8619b892 |     
    arc      |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/a884f255d6400031f3e90af5d437c114f7a3eeda |     
microblazeel |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/e0e0a0f7edfedcc26949c62b9a7c7d1367a29c37 |     
microblazeel |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/4126275fb037e8cfe5caefa81e761b5d16ed7242 |     
   arceb     |        lighttpd-1.4.65         | NOK | http://autobuild.buildroot.net/results/e2b2552a3f5aaf9e5b4a9e8a3aac4d97538f7245 |     
    i686     |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/82956f9d3263262fa61dec016e37eaaabf7cb419 | ORPH
powerpc64le  |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/a1a6bd87c61eceebb97a065a061304141b9a802c | ORPH
  mips64el   |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/7b494435134364f282d8bc04556c8c0933b65d0f | ORPH
   xtensa    |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/5b5d3a73c5762549c929866f32d34a89dddd2e81 | ORPH
   sparc     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/94188a2ca1a3f2179b56cdb7e32a7f44a653b268 | ORPH
    m68k     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/9a46906bd0693c5e3605c86bc3ddffb7f5834d94 | ORPH
 powerpc64   |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/c61ccdc20567eddeb8500d762092a258e8db0007 | ORPH
    mips     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/4e2db506d66444645f23e392f422a768dca5b321 | ORPH
   sparc     |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/ca1d6050bc409d4389e9066566fa7eb8f2a8aae7 |     
 aarch64_be  |          luvi-2.13.0           | NOK | http://autobuild.buildroot.net/results/6af97cb4f707e8bf317c11aa283fbc564f23015e |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/c35a4929ee60736df61df51ef0002b76a353c0c6 |     
   x86_64    |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/23df61d7fb09cb4e27959a9144fcdf931e7daecf | ORPH
  powerpc    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/66c266e449f4c37e36ae64745f88ad811fa500e4 |     
  powerpc    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/51831629e40d310f373ae9df05eaea7a6fbb8108 |     
    or1k     |           pimd-2.3.2           | NOK | http://autobuild.buildroot.net/results/4a83a20650a75bcd22d62832db95d3b2141a44a3 |     
    arm      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/107844303ed171b8dc5b28513733bd2df0ed0ea0 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/9e2f002573c182d3a0d73e69727e6946fedd3af8 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/edd3261d8f79f1a9e1acc499b8a9485a59863194 |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/0caec8629f91d6f793d5e70cb9e085a992a8459b |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/01cea28ef5417bae955395442b794032779e5d93 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/0d78c3eb6fe4e5561cc34864abe5ff38bdb343c4 |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/c5c766db237b04e1d8fac9c16271737a1c93dea7 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/ced76f9070beb06de522e5b44e7932e99a674774 |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/9b4f1dc3cb89612745c8a31ef1d5235592baf18f |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/be82f827b9468807704c3ab433ce7f5d92414eec |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/9f830a7e8b656e2ce4133cdc64e7a50c86f267b2 |     
    sh4      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/884b5ca74a88082b7fdde49b4b47697c58c46798 |     
   s390x     | rtl8189es-39c17661136da48f8... | NOK | http://autobuild.buildroot.net/results/d2c41ab3f08d3b13af3e16589813a0142ef5441f |     
   armeb     | rtl8812au-aircrack-ng-37e27... | NOK | http://autobuild.buildroot.net/results/50824bff8cb16ded840e87fbc2af79dac84a32cb |     
    i686     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/715ee00e151a2a049c45ed158cbbd0abc270e224 | ORPH
 powerpc64   |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/e84fdc88d1f4a53f206f748ce7bfb6dddb34aede | ORPH
 powerpc64   |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/a6b5ed02a41d079745f087bf81e9095f580ea4d3 | ORPH
    i686     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/78e2ae5890cd24234d99ec25b1067617b065f4eb | ORPH
   mipsel    |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/b240fcdfc7af90cbe4574558fc18d79ce13d987a | ORPH
   sh4eb     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/89cb73f04b95f9a9bbad5175e63db0a2ff4da0e4 | ORPH
 powerpc64   |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/a11d7e9119248173fb28136ff92317d0b01c382a | ORPH
   arceb     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/78cdb0ed010cf9260ae8505961b73ec39aa9d546 | ORPH
    mips     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/272c6f3f1b78d480f5f6564633c0e818ab7a4749 | ORPH
   mips64    |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/b7704635e6fe5c1883be3d513045ce116b62bc02 | ORPH
  powerpc    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/3530d3bb96c5f244b0e2979f8c2c4a89fc80124e | ORPH
 aarch64_be  |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/3e22b0ef593a60675e56704b6d860a4bd295d660 | ORPH
    mips     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/f2ba3212f5e5a63c5464727cb05433e5a5d700da | ORPH
   armeb     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/3470b1305466575803378ea46f025e0682e9db12 | ORPH
   mips64    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/5fae8db1df09a8c0ddfc860759f6e701fc7f666b | ORPH
   nios2     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/458517e50f30c5642b46f3c6742e40115bcc8931 | ORPH
    or1k     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/855b7c1e25c71a926e1a2cd59a49c5450ab27e17 | ORPH
   mips64    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/ba2cfc5cc2adaa8233fed737e215251cbe076264 |     
    arm      |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/ad3c06f0c6f365d75e3c4346ccdee269bddbe382 |     
   s390x     |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/f693c58b04d07cf524f94c5c7834069d90b0bb5e |     
  powerpc    |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/7404a4f6e1380d8e3d439c6acc8f9a0386987aae |     
microblazeel |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/5f65a2c13b8bcdf849705982e53f6ddc03ccb287 |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/817e2d79299588857ef262f0b3de82515c22a12a |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/01accc6c0d0319308f87c2637219a01a2a1b496c |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/a677fd0eaca92562ae1a5a3921d53093247dc575 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/0a6fe3028c03078463ddad95fd017ba19f288120 |     
    arm      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/1a2e9be5f8538238e99ae1e4de2649d8422617fd |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/30befffcca61f929c7177dca13d01069c06db713 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/1a18022ca057bd27bac6117ac71f2a100410e9b4 |     
   arceb     |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/94482f1a72d23c99e1185ab843d6dddb4a3ddf9e |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/71bd419d106352b924a0f611c27300e9c4d7f94c |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/3f5fb72fa3372ceaf576de845060866356f24a33 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/108c56a8191ddced68fe079b74227cc9c3500098 |     
    arc      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/11c2d0bedf0d8f98904ad1ab9c3c02e926308a1a |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/24c6ab889144037b882792a9dbc598111114077a |     
   arceb     |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/f7e5ac49d8b39f69d6effab63fb0b30bcea517ae |     
  sparc64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/b5453ffcaf1c3524490fcc1b76159486787775b1 |     
    arc      |        unixodbc-2.3.11         | NOK | http://autobuild.buildroot.net/results/a3fae0d5ff796ab9131fbfb091a6ce5ac631db02 |     
   xtensa    |        unixodbc-2.3.11         | NOK | http://autobuild.buildroot.net/results/462dc4d2373af0093ce1dba21b3720fea1fafd3e |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/8a46c4eb2df73e04b7fa02a187211a39aee70c3b |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/7f5c34966654b67518b3c650e2b2db1e68f1c180 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/5d90572e35c8c035e433901c8223371dbc9b7b7c |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/a175f81352d39efa5d68772fbbc00e384711dfd5 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/25e8779f185e5d3609001abb7390af203777bd38 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/ba95e82019221c19f37a8fda6a2490f526f7afee |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/4a82eeaaeded51365ab11d83959acc5e81adb099 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/dca5dc8843b7df798d2a89bbc52011dadceaee3a |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/e2a1ef666275258f74d07a6a780fd2f06aa2a170 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/ec60bf7fd58a98eb6bebb492470bec27c9b6767a |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/57d8f93bdfd3c2e26732c188f30b330bd96b8877 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/c9e1bd25a3c7c01fb7eb9082d8b9c32bfe124365 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/c3f82848581b259f78549d4fb9919e36c4234973 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/f6a0549faef0ad1fb365040ce1c751fdace2f3ce |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/2e3f854c918b0ae3da60feb60f480c51d6b69a04 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/71b372a7c2806b0868359f459526813d1e5b9287 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/7487c93fdb2396a1a6b5d4086d01282add5d4b77 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/a1c5f09e46f5ee8f682b0b55eeabfe2af9d9e9a0 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/567e295481991b4c3db1bf29ada8f0939cb352cf |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/eddf9a18437282415df931570c77d512102e0212 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/73cd00959c4a4d282d6ffb5915f042a5573d9e92 |     
powerpc64le  |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/799b1bbe6bdae1842f9bec787275fb5f050b5c0b | ORPH
    arc      |            xenomai             | NOK | http://autobuild.buildroot.net/results/eee367b0920837b7796afc5f027c6e4e509d525a |     
    mips     |            xenomai             | NOK | http://autobuild.buildroot.net/results/1c4b2adebb0ec1cf4f2193de4f50de42db8a9a13 |     
  sparc64    |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/dba8f2984e5bc31c05a9fdfe09ab9c87184962a3 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/eacb3215359fff2c7ee4804642f92f1532362b66 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/7734ea36ccaf2ad25df289287f67ea303dc6032b | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/769627355e835c75eec58de3401679fc9805a6f6 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/c9ae4f9191c5745f53c17c79ef922749f6c9411f | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/a657b6797f9c753e6b5d184df2d2171d0739c12c | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/dd46425984f59d93d704c029a256127a1baba673 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/671a1ee7fa7a4e9d10bfd1cafba122972c46d8ea | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

kvm-unit-tests-kvm-unit-tes... | 1 
           libfreeimage-3.18.0 | 1 
                 uclibc-1.0.41 | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/ac2afb20e23248b10af42cfec444baa5dd8b3534 |     
    i686     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/0a715e1e4610e06815b925877ab489989a864ac4 |     
    arm      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/4b8e592ccd513d7b81a96e461345f17e3ea165e5 |     
   mipsel    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/6f620f3a8b6f0bee95bd602b765f6f1f5fa085db |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

              host-rust-1.60.0 | 2 
                   uacme-1.7.1 | 2 
                 uclibc-1.0.41 | 2 
/home/buildroot/autobuild/i... | 1 
              containerd-1.6.2 | 1 
          host-gcc-final-8.4.0 | 1 
                host-go-1.18.3 | 1 
host-pahole-73383b3a39afe86... | 1 
           libfreeimage-3.18.0 | 1 
                 libusb-1.0.25 | 1 
                 linux-5.17.13 | 1 
          lttng-modules-2.13.1 | 1 
                    lv2-1.18.2 | 1 
               mariadb-10.3.35 | 1 
                  ndisc6-1.0.5 | 1 
                    ne10-1.2.1 | 1 
                    pimd-2.3.2 | 1 
               protobuf-3.20.1 | 1 
qt-webkit-kiosk-a7720e50f2b... | 1 
              swupdate-2022.05 | 1 
toolchain-external-bootlin-... | 1 
ulog-0389d243352255f6182326... | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/4758365f56852b3f492be4ebd0066e036d7a06be |     
powerpc64le  |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/5f30e00263db7802357f926a739af9978b73041a |     
  powerpc    |      host-gcc-final-8.4.0      | NOK | http://autobuild.buildroot.net/results/b689e15f5d67b9b1ea55e582c343b03758abe549 |     
  mips64el   |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/10c453771fa8a07317ffecc4788c17f0d64e0e8a |     
  sparc64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/63b1219bd35751761d2c3b732796e45b6fd86c5d |     
   mipsel    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/c001d0a30b6f1c24a9563a8b6548f42717ebff92 |     
  sparc64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/fa05fdab8a1e2aa5308073ed3bebd726c996defc |     
   x86_64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/d3ad7d2f8c394e39ed06e5ba9ab10294d831e79c |     
  mips64el   |         libusb-1.0.25          | NOK | http://autobuild.buildroot.net/results/bc9a28823fc1426974f7fb6249665fc599a3106b |     
 powerpc64   |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/d43530ad94ce5c69e5924d25e3f3d05991eba69b | ORPH
microblazeel |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/05e0a29b20431deab51997b53f1a13e37a7999ee |     
    i686     |           lv2-1.18.2           | NOK | http://autobuild.buildroot.net/results/1f540961970035c58a0c0b2b00ef2f32ce7a7018 |     
   sparc     |        mariadb-10.3.35         | NOK | http://autobuild.buildroot.net/results/a2cc9e114c253ca0e5f7e81bdda519adcf175040 | ORPH
    arm      |          ndisc6-1.0.5          | NOK | http://autobuild.buildroot.net/results/c2ff6f2a7da32848fff52c47378b9fe83f1e19bc | ORPH
  aarch64    |           ne10-1.2.1           | NOK | http://autobuild.buildroot.net/results/6638fa188e47c12229584482c0e9200f91ae4671 |     
    mips     |           pimd-2.3.2           | NOK | http://autobuild.buildroot.net/results/2f369fb60c1340a9101faec26f15b4f797ff96fe |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/06a84c95e920d68045b90b17b4f4d8102dce27f5 |     
    i686     | qt-webkit-kiosk-a7720e50f2b... | NOK | http://autobuild.buildroot.net/results/aa1008056ca07a37789e23af4c187b2e6e187212 |     
    i586     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/aff0e0174774d47e14ee8134799fa6b2a90c4bb4 |     
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/1ad61170f082744435c341548fc60f71b5a9f513 | ORPH
    or1k     |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/c128552105296e7bda59ab9b274dc77b68112e85 |     
    i686     |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/8c62282121e29d12c0a0e5f1f407aefd19cf2b40 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/4c111829910d4fbf8702522eb152266a1fffdd3e |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/002e9ad1ee0c8886d85d57dfb5827a97d5a9b530 |     
  aarch64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/cc865a70902ae6c7b65380b23b2f8ebac8d2bf98 |     


Gitlab CI results for 2022-07-11
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
           TestCrudiniPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2702466494  | ORPH 
...ystemSystemdRoIfupdown | https://gitlab.com/buildroot.org/buildroot/-/jobs/2702466451  | ORPH 
...ystemSystemdRwIfupdown | https://gitlab.com/buildroot.org/buildroot/-/jobs/2702466467  | ORPH 
   TestIso9660Grub2Hybrid | https://gitlab.com/buildroot.org/buildroot/-/jobs/2702466365  | ORPH 
        TestLuajitLuazlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/2702466646  | ORPH 
               TestMender | https://gitlab.com/buildroot.org/buildroot/-/jobs/2702466698  | ORPH 
      TestPerlIOSocketSSL | https://gitlab.com/buildroot.org/buildroot/-/jobs/2702466741  | ORPH 
       TestPythonPy3Flask | https://gitlab.com/buildroot.org/buildroot/-/jobs/2702466842  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/2702466844  | ORPH 



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

