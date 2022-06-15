Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7F2C433EF
	for <buildroot@archiver.kernel.org>; Wed, 15 Jun 2022 05:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C1CC418F0;
	Wed, 15 Jun 2022 05:32:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PXvllG2nANKV; Wed, 15 Jun 2022 05:32:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60937418F1;
	Wed, 15 Jun 2022 05:32:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CCB8F1BF956
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 05:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BCAD48346C
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 05:32:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pk9cYnIg13UU for <buildroot@lists.busybox.net>;
 Wed, 15 Jun 2022 05:32:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 22B0F831A7
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 05:32:43 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E86F660006
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 05:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1655271161; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9G7VDWNMfFvGllbWhbIDLXUzgeddZQ/J+miZSrMLgbg=;
 b=g1ySAhQNcNuYxo7knKq2yOH0EiCr9V+GPkXwYvTzvkggLzv0WgRRR88KYBjv5zaPjBoJVS
 sEFJ6qDJYVI4JPgq85tjOJICZ+n4e3usSsM6AceRwfr5l/u5sgYcstSuoG/efUzjnwtRRh
 /Hy4UizWIWRyuIAhRlSekBr/U7vUjXAlvzuw7gqO8SxfrRSn5AmC15j3o2n/utZzNoV0Hv
 rst/U5QoOFA1JW0L97p4O+qjv019+ilGQ7INabjXZDei7GW/F31dotx1lb4K4QceqaHhRC
 /g91Q+PwyMZPJr5srrnc9jH2frA7isjVcLrv9dIOJYI6O1ilEkBZExNR0aCE6g==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 15 Jun 2022 05:32:40 -0000
Message-Id: <20220615053247.BCAD48346C@smtp1.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-06-14
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

Autobuild statistics for 2022-06-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 15  |  7  |  1  | 23  |
  2022.05.x  | 15  | 19  |  0  | 34  |
    master   | 210 | 243 |  0  | 453 |

Classification of failures by reason for master
-----------------------------------------------

                 uclibc-1.0.41 | 18
host-pahole-73383b3a39afe86... | 17
                 linux-5.17.13 | 12
             libopenssl-1.1.1o | 11
                     refpolicy | 8 
                       unknown | 8 
                   perl-5.34.1 | 7 
                 zlib-ng-2.0.6 | 7 
                busybox-1.35.0 | 6 
glibc-2.35-96-g2c4fc8e5ca74... | 6 
           libfreeimage-3.18.0 | 5 
  gobject-introspection-1.70.0 | 4 
               gocryptfs-2.2.1 | 4 
                host-go-1.18.3 | 4 
                libressl-3.5.3 | 4 
               protobuf-3.20.1 | 4 
              swupdate-2022.05 | 4 
                   uacme-1.7.1 | 4 
                bitcoin-0.21.2 | 3 
dahdi-linux-5c840cf43838e06... | 3 
                elfutils-0.186 | 3 
                gnu-efi-3.0.10 | 3 
         host-gcc-final-10.3.0 | 3 
              libgcrypt-1.10.1 | 3 
               libglib2-2.70.4 | 3 
           linux-5.10.115-cip7 | 3 
                nodejs-16.15.0 | 3 
                 pixman-0.40.0 | 3 
                xenomai-custom | 3 
/home/buildroot/autobuild/i... | 2 
              alsa-utils-1.2.7 | 2 
                    bird-2.0.8 | 2 
                  bitwise-0.43 | 2 
                 dash-0.5.11.5 | 2 
                  ffmpeg-4.4.2 | 2 
           host-nodejs-16.15.0 | 2 
              host-rust-1.60.0 | 2 
              jpeg-turbo-2.1.3 | 2 
       linux-5.10.109-cip5-rt4 | 2 
                    musl-1.2.3 | 2 
                    ne10-1.2.1 | 2 
                    pppd-2.4.9 | 2 
    toolchain-external-bootlin | 2 
                 wavemon-0.9.4 | 2 
/home/buildroot/autobuild/i... | 1 
                  acpid-2.0.33 | 1 
               belle-sip-4.4.8 | 1 
                    brltty-6.4 | 1 
           docker-cli-20.10.14 | 1 
docker-proxy-339b972b464ee3... | 1 
        edk2-edk2-stable202102 | 1 
                  exempi-2.6.1 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
gummiboot-2bcd919c681c952eb... | 1 
          host-gcc-final-8.4.0 | 1 
          host-gcc-final-9.4.0 | 1 
            igh-ethercat-1.5.2 | 1 
                iptables-1.8.8 | 1 
     kvm-unit-tests-2022-03-08 | 1 
               libcap-ng-0.8.3 | 1 
                    libev-4.33 | 1 
             libgpg-error-1.42 | 1 
                   libnss-3.79 | 1 
              libsodium-1.0.18 | 1 
              libuhttpd-3.14.1 | 1 
           libwebsockets-4.3.1 | 1 
                  matio-1.5.22 | 1 
         multipath-tools-0.8.9 | 1 
             netsniff-ng-0.6.8 | 1 
                  ntp-4.2.8p15 | 1 
            ocf-linux-20120127 | 1 
                    opus-1.3.1 | 1 
         python-greenlet-1.1.2 | 1 
           python-orjson-3.6.7 | 1 
            python-ujson-5.2.0 | 1 
            quickjs-2021-03-27 | 1 
rpi-userland-14b90ff9d9f031... | 1 
rtl8189es-39c17661136da48f8... | 1 
rtl8723bs-11ab92d8ccd71c80f... | 1 
rtl8821au-4235b0ec7d7220a63... | 1 
       shadowsocks-libev-3.3.5 | 1 
toolchain-external-bootlin-... | 1 
                  udisks-2.9.4 | 1 
ulog-0389d243352255f6182326... | 1 
wireguard-linux-compat-1.0.... | 1 
                 wolfssl-5.2.0 | 1 
                       xenomai | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/5eb07f554c09ea71cce22f68328ab1f2f767eacf |     
  mips64el   | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/721e8064d3e43e2ac6945907ea62b4fa9b02a54b |     
    or1k     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/3981ab8a727776f968143cb72bfcda060faa002d |     
   mips64    |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/888c33dafb3106efa22a44536bdfbfe13c4643ea | ORPH
 microblaze  |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/dd5a99faff7f946e3d0fea8611b350df85e3330e |     
  aarch64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/b601427a17162951f935ce88505b1496d15af084 |     
   xtensa    |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/ea1a71c1ef463ff63a1ac8f7df42d58125758463 |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/a7d0e21898da705d3dfb59b175c351a93d21f574 |     
  nds32le    |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/e9cbdc21cb10ebaa8e3e3fda9f76f7ea3cf11506 |     
   s390x     |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/e0a54e872cbd7a3af83bc1934ceaefc9b3d9ed53 |     
   s390x     |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/2eeeb9076d425cbbe37fac52a76b6fe89f8217ef |     
 aarch64_be  |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/69d8f7f199b4a8c908afca1d99242ee73e0b7470 |     
    m68k     |          bitwise-0.43          | NOK | http://autobuild.buildroot.net/results/7f727b72ab171bb707e065649542a51179f14fc8 |     
    m68k     |          bitwise-0.43          | NOK | http://autobuild.buildroot.net/results/40f40b43e264095767d5dd937664db7134e620d3 |     
 microblaze  |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/f16ca29116d3b0e520faeefddb69c45585bf9178 |     
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/76d11d66ad89f6fda398a4984950d3b304669cbf | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/305962f64d64a273a39f6492bf74d110e9d0df17 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/095d177b01f9ddf491833016578b663e31ebc3ea | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/a315876ade350012311489cbf2904e4fcade91a9 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/4bd77c8e68dfdb5262b00a66156e67b8df6137ae | ORPH
    m68k     |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/5df610da2925e3bf71decce1604d69ff90a5ba53 | ORPH
   mips64    | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/59092393504d934eaedceead78b7ab70117fa9f3 |     
    arm      | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/5b1e60d1984841762195ccbab2fa4d0f6fc464fb |     
    i686     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/aa85b16e942e293498b3f39bc1fa870de8179a01 |     
    mips     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/36ae958b6ce9e47c8cbb7f43108b3d950ebd0626 | ORPH
   x86_64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/afefacf826933da5a37d8beba09026d10704ddc3 | ORPH
powerpc64le  |      docker-cli-20.10.14       | NOK | http://autobuild.buildroot.net/results/2f6ee164aa439c8d8248243155b49099412c876e |     
    i686     | docker-proxy-339b972b464ee3... | NOK | http://autobuild.buildroot.net/results/9b464685ca423266e66bd959e70503f9acc0ab7d |     
   x86_64    |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/45c8139886e13667c874076cd98e2a81357c69cc |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/a4f5b99bd8ed20a18f71af4e74c5065bd45d3f60 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/5f902ecb4b8b27d9eb159b6136506ae1f1b2262f | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/fb92e7a87903eff70597202ddf9b990901a7d42d | ORPH
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/46a1d2334c088e349f628839927a2886ad27c45c |     
powerpc64le  |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/aa274fedb0c0cb594e74b9d3c60bff5e78e5e819 |     
powerpc64le  |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/f326bf6bb7f55ccf2c2c700f082bf4aa511b47a1 |     
   s390x     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/d22600a072b48a9019bffc37313b2153925ffe50 |     
    or1k     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/ee15db5a38e540a88da471bb8b4b5d4c2c9a7205 |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/368ed3c5788317fac41593630511e8c4446be5c5 |     
microblazeel | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/bdb3d9f588bb4fe15c1d224cb50f917cd2ea0097 |     
    i586     | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/6f16b18877361e797801393e4a892c9101723bc6 |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/97d855c19ec9fe710697b3eb83f76e94b08f89dd |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/cb4b09db61baf703443114ae9d6b581f1643091f |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/050d583205a1ad7bfbf32ad929780b4a3947a15b |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/a4bbed704ec8d7b95436792c08513e78ce448f77 |     
  powerpc    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/76ac5f6c6007cef8dc4fa597201d63906217d166 |     
 microblaze  | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/86eaac5fd3092fd4c6496603e9f03477959bffe0 |     
  mips64el   |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/273b8927e63cc50be679dba3db04024eb59fcd7c |     
  mips64el   |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/4d4cac1ebf81ce74f5ca0f46e33de48227aefee1 |     
   x86_64    |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/b16904b74534bf5aa9d400a161d79260da76017e |     
  sparc64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/cd924a1a9b5d78a3b855b505c4dcd38092ac7402 | ORPH
   armeb     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/0363e5485b4bf37238e806fb9472cd23358ffa14 | ORPH
  sparc64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/a1814abfa05fed12f96df0c5b25b5b08eaa4844c | ORPH
    i686     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/1aeafc719a2fe32736cd422638cf5242469d4030 | ORPH
   x86_64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/e2158c64ffe9be9f42f484e35552ccc56995641b |     
  riscv64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/86a22b5032a533e9614a9a118b2d30604e07c529 |     
   x86_64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/087d11b0a100258253adcb159f80152e8c0d09bc |     
  riscv64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/83072b8fb60c4c8cef8595f5bced57eadabe3dfa |     
    i686     | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/3aa456e1e8f11b5f6f25bcbc0c5eb03d7beb12c4 |     
  powerpc    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/248d659be3117738d99b77451b0b255b5e0acb47 |     
    i686     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/4d5a6b6900ffccdaadaf10cdad29258ca18cabfa |     
  powerpc    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/87d50b6d3285e172c4960fd3ec9fd60fb68f0b97 |     
  powerpc    |      host-gcc-final-8.4.0      | NOK | http://autobuild.buildroot.net/results/7c85080f1ad086545ed5fd755e7704450486b617 |     
   x86_64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/17c1572da3752eff3b82a5fd40c36960916ddf72 |     
  mips64el   |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/889374099f3325b06c5b1e7ce28ec1cda25a8524 |     
   mips64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/3f7c0a978ddef604e7f144d331f0b0a84b87d287 |     
    i486     |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/9bc51d4beaae96e087b6675b9b7e284ce684ca12 |     
  mips64el   |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/f8c62219e86f89b38c0ab9694365b123bb7bb894 |     
microblazeel |      host-nodejs-16.15.0       | NOK | http://autobuild.buildroot.net/results/a8f935e221af42b0b3c8ab4b2687a1aaaf2e2097 |     
    arm      |      host-nodejs-16.15.0       | NOK | http://autobuild.buildroot.net/results/abeae86911f8d9f8d36f66a4c98766c80764540e |     
   xtensa    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/3e6f7b6c53742fc0b5421ffaeb99ed7424d0cf3b |     
   s390x     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/b1799fd40215e868e5714f80c3b3116c3739fb22 |     
    arc      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/f2ab3193b7637aa80dd9e7ad1f926cef446c1f63 |     
    arc      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/93adf35a465e5fc444612f13b095bee8013b8134 |     
    mips     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/74e45fd0672e56398fa2380de72017c655d3cfc5 |     
   mips64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/daa9b037dd0b4dd600f5affe8f6b69b86ae5fad0 |     
  aarch64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/cc0c726ac2f4ab761329b0e37dee088364309466 |     
   s390x     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/f6915be257e67c12155c05fa123c0be8ab650dea |     
   mipsel    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/cba31b3468ea82f9fd15cdfa6a8edb0c89c477fb |     
   mipsel    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/487938816d71318ea422127d18041556cd71952b |     
   s390x     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/f58a954e5b7f8f4d3a6099b1eb41e2184cd7dab0 |     
    arc      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/634c5dbf876a8d5c3df065098b1faa06a09a2ee3 |     
   mips64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/79dc8575d481ec5b37cc33eac7ecd9b0d69b8143 |     
  powerpc    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/0dc3aee8b4339bd69012a5787ff39146e38b7e03 |     
  sparc64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/6b54b6623eca3495b77ea9cd0266e621ce5cd6ff |     
   armeb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/81f565309f22de0aa7db4862a2f4db919f937ed3 |     
   mips64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/283b22dfad5a0241be9f1cbeed754594399767d5 |     
  sparc64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/474e349b53c5db36ce8c5d839da551b583a0fb5d |     
  aarch64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/8575703e441d08cef3d5667a4baa17ab25d1e9ea |     
  aarch64    |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/7c9a7ecccedd8337a3c592c2bde7a20acf136d2d |     
   x86_64    |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/2527118436d070954f86acb687520d804590b2a1 | ORPH
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/d0dbc9d5ea71a0e3c14cd365ca0bb57bf7825702 |     
    or1k     |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/1dee34b2a20c8fd4092a22cd9e57fa5d812979bb |     
   armeb     |   kvm-unit-tests-2022-03-08    | NOK | http://autobuild.buildroot.net/results/42c7c06adf2a9c7ad7ff95a2c3e86dd8c13951a0 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/cc53d1785bc9d3a6be71ef988bc65c4115c3f86e |     
   armeb     |           libev-4.33           | NOK | http://autobuild.buildroot.net/results/a3994c767ef2a1afd5698dcf9117448c2d0f6461 | ORPH
   x86_64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/ef15254e1a56db388fce365f3e2142a47e456a27 |     
    i586     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/d1b48a3ef5ad5db83cc5c8c56c8e93adc7ee90d4 |     
   nios2     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/cc5dbac4b120c48e3405216b1ca0f0dd9eca6086 |     
   mipsel    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/8e59c3805474f5e63f90efe8448e5c044db5a387 |     
    arm      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/bbdb426fa9c4bdca1f7e287ed2644e039ee4f54e |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/6f62663d8a990dacbff62f42395ba07e58697931 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/6816a5c3d652c66990b6489e721973e9987fbeb3 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/a2dd41e934989b1e248c4848e8a0738aa99e6e4d | ORPH
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/f4e08db185b71c6577eaeeb91b8cb76541429f4f |     
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/454b67ca662c409beddb9d12e3c0a1970641fa3f |     
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/2661599bf504ac2d9faf278cfaf7d356c95bdb53 |     
  aarch64    |       libgpg-error-1.42        | NOK | http://autobuild.buildroot.net/results/a9bcc5dd05b9b90ffb4f32a179a65f442c294885 | ORPH
    arm      |          libnss-3.79           | NOK | http://autobuild.buildroot.net/results/eaf94eb66094d5074a5cde36a099e9a4fec4d354 |     
   xtensa    |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/6424aeeb30a915732dd5c88f640df8ccaa8b8848 |     
   arceb     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/30643b4d5546881557e41d5b33427cfa6993e7ff |     
    or1k     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/394ea25ce621fc687d32b51d8cd05271a475e7af |     
   arceb     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/038cd066af9384ebc1faef4224c05e9ed8fccdcf |     
microblazeel |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/e63144cf861c95e802ae004660bac6c8031fc0cd |     
    m68k     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/c86b31baf3ad77df0248ff167df3c543863dffa4 |     
 microblaze  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/7c38bad36f6ee38d4262d7c27b1d725089de0844 |     
   arceb     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/809660665eea1f31d609c91018fa52d5eb43947f |     
   xtensa    |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/18a1494ebf316d6c18194f722f5d09021767f705 |     
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/00012ef316cc020d54c5b61b150c8a0c04792db9 |     
   arceb     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/5ee5b931465f4476817b880cadff03fe7b941e49 |     
    mips     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/cb01df98f5484c2deae60bdad1c161ac7de17d43 | ORPH
    arc      |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/81dc1da3395096694114c893726eb1abca0c89f0 | ORPH
   armeb     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/17a76e5c66843e70786c193052a15551c6e8840e | ORPH
   mipsel    |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/0cc7c9bbfe3abe4c887b92ba104d734cd43c2a00 | ORPH
    arm      |        libsodium-1.0.18        | NOK | http://autobuild.buildroot.net/results/b870e0174cc7d816eeda58fb6e21a19f74043536 |     
  mips64el   |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/4f4b09c535418060d25728a82134e92584259df1 |     
    arm      |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/4c6a4124d271a64f0f51027fb2ee9e66e3f16555 |     
 microblaze  |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/6c42d5ddc3ee34c62f2b9f1aced76395305c0995 | ORPH
microblazeel |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/397935c7c0adad04aa69a16555bdfcb8a48804fd | ORPH
    m68k     |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/0ebde6e196abd6ba326eaba4ebe1b0e1b2857e4d | ORPH
 powerpc64   |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/bf359271c12176fefe2ac054227cc6fb18b8e291 | ORPH
   mipsel    |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/5a4bb1aa059978f998f6ee3eb37855f2b527309d | ORPH
    i686     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/71adf7aec25fac9d47d4b540201f9bd01531f712 | ORPH
   s390x     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/c24d573ee6cdb938fd2096dd8a5c0e6f781f0c8b | ORPH
 powerpc64   |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/ada7ad990b7ac7e4ef1f190c83ebec26ab7be2ba | ORPH
   mips64    |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/c43852ee81dddc90e16434626538f48c3cd9cfb2 | ORPH
    m68k     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/fe2a3886fa87b5c2b37b5c8ece13aa9925d109c9 | ORPH
   nios2     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/bc8cce2c28f27d7417c8931b535ddf6fa20e2697 | ORPH
   nios2     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/95cbdd7f759cba19b450c760a3a1bfd8d7d94ecc | ORPH
powerpc64le  |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/e1f93b83b513d5caede98dd03c5ad35a62f8fa04 | ORPH
  powerpc    |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/c2925f139f7c5ed456f5c1f08286cda306ab8085 | ORPH
 powerpc64   |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/8d46de573a15edda627efcba3859862369a54fba | ORPH
    or1k     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/997f95e3f80e5e2972a75bfe7b27e34dd03fd98a | ORPH
  powerpc    |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/675a9be64e02776c12c62d2c8be4d7603040a041 | ORPH
   nios2     |          matio-1.5.22          | NOK | http://autobuild.buildroot.net/results/467eaccd34e9e7ada38e48f745e4d1a8cbecf1e0 |     
    arm      |     multipath-tools-0.8.9      | NOK | http://autobuild.buildroot.net/results/de6f5dc4c4e68ca4589892d162f1375ba24f7796 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/3cc08ca982cef00ecfa0c81672e1db23d4a3a07b |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/507ef1244861128a7938887c5fb8ebcb20a1298f |     
  aarch64    |           ne10-1.2.1           | NOK | http://autobuild.buildroot.net/results/969f6d1799d09402628628fa69c3f63162380079 |     
  aarch64    |           ne10-1.2.1           | NOK | http://autobuild.buildroot.net/results/bc23060987fe1c2f721b9eb0d7a2320519b9db20 |     
    mips     |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/c502722458138c3fb3e14130492d343ddc2cd6f4 |     
    arm      |         nodejs-16.15.0         | NOK | http://autobuild.buildroot.net/results/4be8f0febfeec49fafd3ad4042c342b764aa5a6e |     
  aarch64    |         nodejs-16.15.0         | NOK | http://autobuild.buildroot.net/results/14318e864c8608f3e076a0596d3748cb00070745 |     
   x86_64    |         nodejs-16.15.0         | NOK | http://autobuild.buildroot.net/results/be189c76ae0f49e76aec1978942109837e048470 |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/1e9a9bd755ecfd063fbd80a463ec873b72885120 | ORPH
    arm      |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/a87367fe3b1c2e0b7a8b4c789c453cd02227943c | ORPH
   armeb     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/5500302dd707e807f16838730b4625c0789a748a | ORPH
   armeb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/11a3b88fe3ea4abb4377401fa02f1dd581b89c2e |     
 microblaze  |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/d732ed9a0cb6bf284580d8b3d6a91df942ca29f6 |     
   mips64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/cfdd6f7a740890b6a065dc951406d2e56d12810f |     
  powerpc    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/083acbb003146a61bf608184c51385b49e18f50b |     
microblazeel |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/3d9a7514d0a31c1923655ff5beb4bfef84a4415a |     
   mipsel    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/efc777495cc40f1a58b408544053547b6f2d80ca |     
   mipsel    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/881140a7c748c826abbe4d1c97380f3f49b25549 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/7cdb747fd42c84eb7e03e943b6c8e0d9200290f0 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/0e5489f89e6101cb23d5f7cbd83090ff45edbf3d |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/0dfba9dd9c268c06ce7b272095242980145066f6 |     
   armeb     |           pppd-2.4.9           | NOK | http://autobuild.buildroot.net/results/0c409757d76ad42ee68ae2e9dff9ab1c8c4a1721 | ORPH
  sparc64    |           pppd-2.4.9           | NOK | http://autobuild.buildroot.net/results/5795762056924bb758c418baf628a152be10b96a | ORPH
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/285042ea88cbe8e612ce43f7ca39c18d2d6db708 |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/6fd5fce0c402e1493b0b68790512b3fbd0caffad |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/c7ef2660dc330c4a9c34a930d711dea4b2d3ebe9 |     
    sh4      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/d44c146da5f9e4c1bd186c246a11a829ae0a3d1b |     
   mips64    |     python-greenlet-1.1.2      | NOK | http://autobuild.buildroot.net/results/d32522cd015b7a09e993e82bde4de6754ee20e0a |     
   x86_64    |      python-orjson-3.6.7       | NOK | http://autobuild.buildroot.net/results/ae981944923c110f68bc61efb1a6c0d623d65069 |     
   nios2     |       python-ujson-5.2.0       | NOK | http://autobuild.buildroot.net/results/ef09a4ff3087530a5e01dc781da057a254b8b99b |     
   sh4aeb    |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/c1820ac64faab7b34004ffca6765b0b383f7d8a4 |     
 aarch64_be  |           refpolicy            | NOK | http://autobuild.buildroot.net/results/78bd3931c319a6f893ffb6c193c37fd2e62de596 |     
    i686     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/c7854f4f4fdd60a257b1402a8f0c935aaefe558f |     
 powerpc64   |           refpolicy            | NOK | http://autobuild.buildroot.net/results/62b831806ba3cdc5d92d8ebf3ba955b83f4f1eab |     
microblazeel |           refpolicy            | NOK | http://autobuild.buildroot.net/results/89f8bda1f2a5f38197b85d2deee89079aca975c3 |     
microblazeel |           refpolicy            | NOK | http://autobuild.buildroot.net/results/54adab86e42b44478b4df3799c125f6910f87866 |     
   mipsel    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/b65e610b772c6d2b33ea740b018e833cf3ae5a97 |     
   sparc     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/20eecc81b894474cbf22bc392870f9fda5424994 |     
 aarch64_be  |           refpolicy            | NOK | http://autobuild.buildroot.net/results/332915c87db0cc4b45633b453558f7bbd5b780a2 |     
    arm      | rpi-userland-14b90ff9d9f031... | NOK | http://autobuild.buildroot.net/results/3ce20ec8419918d29b4868d9229681d8724f12db |     
   sparc     | rtl8189es-39c17661136da48f8... | NOK | http://autobuild.buildroot.net/results/f8f05e3ddaadc3742d264050b44125b543fc4aeb |     
  sparc64    | rtl8723bs-11ab92d8ccd71c80f... | NOK | http://autobuild.buildroot.net/results/325080ca34d75003af3f6cf77955ca6d40109018 |     
    or1k     | rtl8821au-4235b0ec7d7220a63... | NOK | http://autobuild.buildroot.net/results/7d9f4a6d165955161dd98e9c38b432677cde0309 |     
    mips     |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/6e8848c3bcaf0328bb444241ba1d913767c7cd47 |     
    arm      |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/967c4fc1778b7ba7bf4597f09727681f0fc9111d |     
   x86_64    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/eaa56dcfdf62f07ab9ef2bb1d7ba60f2bb152d55 |     
    arm      |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/1672eb08629311657cef5ef87e6852011534934f |     
    mips     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/e60000ad85479fc493a581a7d083165995651dfb |     
   mips64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/1658bc175092322a900962aee363268f94d2ba63 |     
   mips64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/e076e1d9432e3d0b01f987e339c3701b364adbdb |     
   armeb     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/c552bc154c28c7d91786bc66d59c0c188ab71d6d | ORPH
    mips     |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/532f4cf8b6ceab49def3f98457600ede89f38c91 |     
    i586     |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/0daffc9adafd81b2ed459e2b9e0dc49df3774da5 |     
  sparc64    |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/f7cc6f944daa0f57bac89d24a4094f1c46ef35df |     
   s390x     |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/7b2b2eeaa67dfa9888fd0b24a96a2415e6f2976f |     
    arm      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/84d6b29675d64d48eeeefe1d5973979d856df6c6 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/4d4f5df2200b06482ac5439a81fd662c377a03ae |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/e06d20b397ec71fef271b9cb11375418d9ab1a79 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/1cb9c812c9155229c9bd3c8bf5c3a53cd285e277 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/fda763d3ca97219686402eee74bdc8ae2e5d0c68 |     
    arc      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/6ceedeeaf840bb4d4cf13f0f9cbe2084198909a8 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/3bdc992309ac372a9067798a0cd96b23a867433d |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/a5b7f5eac8e45bace8c57eb9d63ebe0fcc883676 |     
    arc      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/0a2d7efc1cfe3d162a6b58e5d052a7b43e3792cc |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/977fc2884cdcbbbd036ad05fbb5112aa2ddeb0c6 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/3dd68c30e8c6411e65959a05908b5edb98817c27 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/56978d3832988afd71f76b4e998e1667605b5b0c |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/266a22a6f5e038ff364a04d2e9932b946e23d6a6 |     
   armeb     |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/dcf7308f4b988c00d1fdd9a94a4901b54896a641 |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/f85405ca0676321f5ae5fd7e0cefe9c72e5989a3 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/cb519c029719605149edd993142b9d6c5260798c |     
    arc      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/cfa18618f8a8fd0da9bb64090104d9d167f1cc93 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/9d6c9379868ff3962e4aff5d00633cf80a9ea885 |     
 powerpc64   |          udisks-2.9.4          | NOK | http://autobuild.buildroot.net/results/df18407cc560d8415136ee7f5892e64d31b62a0d |     
 aarch64_be  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/75ab20d8f88471ba31d855c51c2671f8960765cc |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/4cc9a79a58b175379ea06049fced601b3355266e |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/c497cc9cede0492788a212354eb3cd655c748145 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/2837672db4f23dce4a87cbd30d5da7d62a6313cd |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/5fd4b3579eae787fddc4ef76f604e3adf2f9674d |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/3f1ac2c93bfdb3c266337885af3f1612e1d18852 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/2895bd6c7c444cef67e576e176a71c29f183833d |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/04f7c99484e86cb8b3cb582c03da9c9625ac530e |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/e609f4a9c5b496bbc6f886f4b90ec760e7d7f53d |     
  sparc64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/7c218ff04b9605ecb1346e739a9582f37cf23707 |     
 powerpc64   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/da324ec75c5d3a38fd0739b19b3ea7ba0708a029 |     
   xtensa    | wireguard-linux-compat-1.0.... | NOK | http://autobuild.buildroot.net/results/65042d47e5eb760e7178f7a119df29af842d90f0 |     
    arm      |         wolfssl-5.2.0          | NOK | http://autobuild.buildroot.net/results/dde07c903f5658ef70fa253941540f17a279f0e7 |     
   s390x     |            xenomai             | NOK | http://autobuild.buildroot.net/results/63d420fb9e3cf778fc735a69453b1127d7b5b04f |     
    i686     |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/fdc3f7bad352bbb16b852e8f390c243e86fff32e |     
   mipsel    |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/2f0778591c98eb9835d52f993f0f1ab2d9338395 |     
 powerpc64   |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/6acf68370f08f6efadf5d1322d5301366151d79a |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/761febb77c9c408f60f8b8d2babc8aa8ee913deb | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/314fb92cb9a4b716f04fd9aebd3221e3ca6a00a4 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/865f5c5a8f93e2399da3ca15bb4fa4ae79856bd0 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/97e77ffc75baabf507e6e2c531f0bae89a9df277 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/2f7748f7e48a66a44849d286a28a1d3402f74ae6 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/83b40d03eb3a4d159f6710447b84dfbb4c398789 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/5f04cd4794febdef579eab7a73640071d2254ba7 | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                  exempi-2.6.1 | 2 
           libfreeimage-3.18.0 | 2 
                    bat-0.19.0 | 1 
                       frr-8.1 | 1 
                       libuwsc | 1 
qt-webkit-kiosk-a7720e50f2b... | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/beba75fc9d06fc518895c5e1ed48fe31291d2c51 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/c76fcfc73e7f8355ae20301440b1da0833308ec1 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/16d97e5fc0d341ef8e4dbdefb2cd66be2e6f49a3 |     
  mips64el   |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/f5439103aaf5b1a933b93c71869e0f2fefa14c00 |     
 powerpc64   |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/16ee4b1c908bde1c80ebd92143e5c2c47d7309e8 |     
   mipsel    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/550c062920efdcb4a6164f0a273c5e19dd4858b6 |     
   nios2     |            libuwsc             | TIM | http://autobuild.buildroot.net/results/70444ef8cd63485a56a4d051e59283fc502c016d |     
  aarch64    | qt-webkit-kiosk-a7720e50f2b... | NOK | http://autobuild.buildroot.net/results/02a5d7d6447fc7e3590d9a160f5c79cab5c311ff |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

                 linux-5.17.13 | 2 
                     refpolicy | 2 
                 uclibc-1.0.41 | 2 
                  bind-9.16.27 | 1 
                    bird-2.0.8 | 1 
                 dash-0.5.11.5 | 1 
                     frr-8.2.2 | 1 
host-google-breakpad-c85eb4... | 1 
host-pahole-73383b3a39afe86... | 1 
              jpeg-turbo-2.1.3 | 1 
             libopenssl-1.1.1o | 1 
                nodejs-16.15.0 | 1 
               openpgm-5-3-128 | 1 
           powerpc-utils-1.3.8 | 1 
               protobuf-3.20.1 | 1 
                       unknown | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4a     |          bind-9.16.27          | NOK | http://autobuild.buildroot.net/results/eb6d30e7f86dbf82cd374fa43c4cd5208637269b | ORPH
  nds32le    |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/72e3a34f56d5f88f5e417426c1e03c4bcf3a949a |     
   sh4aeb    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/21a82cf7558260c482f0e47974cee0fd4f599202 | ORPH
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/3d289a91dde25f562f78771024d3fb5818f8ecfd |     
    arm      | host-google-breakpad-c85eb4... | NOK | http://autobuild.buildroot.net/results/cde4302f5cd1d8d1b67dacad33ef1aaa9c376d4d |     
  mips64el   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/183b78436d7ffb21b1017100b585dea270a7bec1 |     
    or1k     |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/9227f795271f8f6b83cc790614fac81a685a0ddb |     
   sh4eb     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/b41309e8bd9e4df986228aced7d82c2c8b8bee10 |     
 aarch64_be  |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/c249f5499de7313c35dd9ee4be293d3949f8378b | ORPH
  mips64el   |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/427831f4285eb371b298289d0d07ebe50aae640f | ORPH
   x86_64    |         nodejs-16.15.0         | NOK | http://autobuild.buildroot.net/results/ae581b6997f77a4102b99337998f5461191cfa69 |     
    m68k     |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/57da97e183de61fdba22ca89528f296fc84c03dd |     
powerpc64le  |      powerpc-utils-1.3.8       | NOK | http://autobuild.buildroot.net/results/06d449bf0c267bf72d967fa4859c3e5c35040c3c | ORPH
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/6e5283d7d0f88fd922f06ed0b4c206706227f8b4 |     
    i686     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/033ca21010d2e53ccaee32b33fc7789e3da26028 |     
    or1k     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/ee06eaf3cba13b935dbde56047ec26541b7a51cf |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/e54a1c74c8721bc87049ea128226dc55521fe1d1 |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/7cd987a816d0a613bed1a8295d63e58142ce2f95 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/afe60f0602ee3fd97ed1d510ef638959a8a336e8 |     


Gitlab CI results for 2022-06-14
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
                  TestOci | https://gitlab.com/buildroot.org/buildroot/-/jobs/2580341318  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/2580341645  | ORPH 



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

