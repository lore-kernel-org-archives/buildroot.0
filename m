Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25B3C433F5
	for <buildroot@archiver.kernel.org>; Sun, 15 May 2022 04:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C167414E7;
	Sun, 15 May 2022 04:44:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q1Dbhar3B88o; Sun, 15 May 2022 04:44:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA7B94146F;
	Sun, 15 May 2022 04:44:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 94A301BF5D7
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 04:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 811374146F
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 04:44:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5CiB5e1fdn6n for <buildroot@lists.busybox.net>;
 Sun, 15 May 2022 04:44:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3EE2141298
 for <buildroot@buildroot.org>; Sun, 15 May 2022 04:44:40 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3CEC540004
 for <buildroot@buildroot.org>; Sun, 15 May 2022 04:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652589878; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Jvc/ap0AqacW+6ZrCLsLg8A8VTOU9pm3iAZTwTh2xXg=;
 b=cY1/pVuCpJlFXpJrDE8IGgvdNDLfuYVZC9cSzQJb7ue3gfRV7odPYa6Y5yxq3+jExg8+Ne
 lYQ6/I+w9btsu8wKnJoMzMpCSOA4gjw9I24UUXhngPWZQgNLR3aN1aW5PA9qMRFFHCmRuF
 Hgx/h2wDB7KrKHq5AVCyKLeHw8dOV+rSfgF/RAYaPVwkWExdYQHaZnsGqyKm7cOQBLYvku
 k0Igp7aqKELCxhSmCWQTZMWXxCcTqfElmEJCDRY5YEWFFRybgy5voIhbkKs/K/q9voJhng
 nAbGyGlQxTSwBWdrivyUaCViXdkHrCOiZyaK5kQ3l5c9fTM+JRf9TfMyqMDO/w==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 15 May 2022 04:44:38 -0000
Message-Id: <20220515044444.811374146F@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-05-14
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

Autobuild statistics for 2022-05-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 28  | 10  |  0  | 38  |
    master   | 168 | 228 |  0  | 396 |

Classification of failures by reason for master
-----------------------------------------------

glibc-2.35-6-g491f2ef1f0ff8... | 26
         host-gcc-final-10.3.0 | 23
           optee-client-3.17.0 | 16
                 uclibc-1.0.40 | 8 
             libopenssl-1.1.1o | 7 
               protobuf-3.20.1 | 7 
                       unknown | 6 
                pciutils-3.8.0 | 5 
            qpid-proton-0.35.0 | 5 
    toolchain-external-bootlin | 5 
                 zlib-ng-2.0.6 | 5 
                libressl-3.5.2 | 4 
                  linux-5.17.7 | 4 
package/nodejs/nodejs.mk:28... | 4 
           docker-cli-20.10.14 | 3 
                host-go-1.18.2 | 3 
                   libnss-3.78 | 3 
           libwebsockets-4.3.1 | 3 
toolchain-external-bootlin-... | 3 
                busybox-1.35.0 | 2 
                   eigen-3.4.0 | 2 
                  exempi-2.6.1 | 2 
       host-gcc-initial-10.3.0 | 2 
host-pahole-73383b3a39afe86... | 2 
                mongodb-4.2.18 | 2 
               openblas-0.3.20 | 2 
               pcsc-lite-1.9.6 | 2 
               acpica-20200717 | 1 
                alsa-lib-1.2.6 | 1 
                    apg-2.3.0b | 1 
                arp-scan-1.9.7 | 1 
                   atftp-0.7.5 | 1 
                    bat-0.19.0 | 1 
                    bird-2.0.8 | 1 
                bitcoin-0.21.2 | 1 
                  boost-1.79.0 | 1 
                    brltty-6.4 | 1 
              containerd-1.6.2 | 1 
dahdi-linux-5c840cf43838e06... | 1 
                 dash-0.5.11.5 | 1 
               ding-libs-0.6.2 | 1 
                     frr-8.2.2 | 1 
fs/axfs/axfs.mk:32: /home/a... | 1 
fs/ubi/ubi.mk:51: /nvmedata... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
               git-crypt-0.6.0 | 1 
                gnu-efi-3.0.10 | 1 
               gocryptfs-2.2.1 | 1 
              host-delve-1.8.0 | 1 
          host-elf2flt-2021.08 | 1 
          host-gcc-final-9.4.0 | 1 
        host-gcc-initial-9.4.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
           host-nodejs-16.15.0 | 1 
          host-rust-bin-1.60.0 | 1 
          janus-gateway-0.11.6 | 1 
                   json-c-0.15 | 1 
                      less-590 | 1 
               libcap-ng-0.8.3 | 1 
                    libev-4.33 | 1 
              libgcrypt-1.10.1 | 1 
               libglib2-2.70.4 | 1 
          libmicrohttpd-0.9.75 | 1 
               libsigrok-0.5.2 | 1 
               libtalloc-2.3.3 | 1 
              libuhttpd-3.14.1 | 1 
                 libusb-1.0.25 | 1 
                libzlib-1.2.12 | 1 
       linux-5.10.104-cip3-rt3 | 1 
            lttng-tools-2.13.2 | 1 
make: *** wait: No child pr... | 1 
              memcached-1.6.12 | 1 
                 mesa3d-21.3.8 | 1 
                     mtd-2.1.3 | 1 
                  ndisc6-1.0.5 | 1 
                  nginx-1.20.1 | 1 
                numactl-2.0.14 | 1 
            ocf-linux-20120127 | 1 
                   perl-5.34.1 | 1 
               pipewire-0.3.50 | 1 
polkit-a2bf5c9c83b6ae46cbd5... | 1 
               poppler-21.12.0 | 1 
                    pppd-2.4.9 | 1 
                    qemu-7.0.0 | 1 
      qt5webkit-5.212.0-alpha4 | 1 
                     refpolicy | 1 
                rng-tools-6.15 | 1 
rtl8189es-39c17661136da48f8... | 1 
       shadowsocks-libev-3.3.5 | 1 
              strongswan-5.9.5 | 1 
               tcf-agent-1.7.0 | 1 
toolchain-external-codescap... | 1 
uclibc-ng-test-0844445e7358... | 1 
ulog-0389d243352255f6182326... | 1 
wireguard-linux-compat-1.0.... | 1 
                       xenomai | 1 
                  zchunk-1.2.2 | 1 
               zziplib-0.13.72 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20200717         | NOK | http://autobuild.buildroot.net/results/27c7c677a61cfb3fa86e450abf2dfd92aa0296d6 |     
    m68k     |         alsa-lib-1.2.6         | NOK | http://autobuild.buildroot.net/results/4a469dca9c96bf8ebe7ff966a2f6e6148a0e1d04 |     
microblazeel |           apg-2.3.0b           | NOK | http://autobuild.buildroot.net/results/90f8a133f9a2e9b2257454483e80886471f14fad |     
  riscv64    |         arp-scan-1.9.7         | NOK | http://autobuild.buildroot.net/results/155353fe1938dbff96ef1adf58e437bf7d5f4523 |     
    m68k     |          atftp-0.7.5           | NOK | http://autobuild.buildroot.net/results/bac97d1469887c430f0b16b11950857b7ffaf55e | ORPH
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/884677b6a21b1b298fc0fb9ac22e3a576f52e8b6 |     
  nds32le    |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/6eaf796dffa3d8ad019f8dac046d4591ca87a96a |     
 aarch64_be  |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/4d81602899b640a11ba38db200e2ca045b13d440 |     
    m68k     |          boost-1.79.0          | NOK | http://autobuild.buildroot.net/results/d05aa44b3a42ef054ed8a608d7175533f9880724 |     
  powerpc    |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/c0817428d57de8ea1c09a548e2461879bd4e33f1 |     
    m68k     |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/6da3bdb8eb81bd5c5441c1c1f48b61d58e1ed49a | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/1618b5876206f43c7b2988fbb377b3738f86c9f0 | ORPH
powerpc64le  |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/092d2e6fe68232fd17987d923524d17a0f56fd34 |     
   arceb     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/ff6b7885091bd6d77cd522d08c669234164a34df |     
    arm      |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/74c4aa855986a591c6166b00ac1626b7c574cbb5 | ORPH
   arceb     |        ding-libs-0.6.2         | NOK | http://autobuild.buildroot.net/results/0f2c20f8159455ad93f77e0a4e372b79bcbd7d9d |     
   x86_64    |      docker-cli-20.10.14       | NOK | http://autobuild.buildroot.net/results/f388d8ac80a10645d5fca0bc04cb99e382076eb4 |     
powerpc64le  |      docker-cli-20.10.14       | NOK | http://autobuild.buildroot.net/results/0fe8c66e4e47fce4f4ea7597272c069b36aec0dc |     
  aarch64    |      docker-cli-20.10.14       | NOK | http://autobuild.buildroot.net/results/902992b08dafbc32bc313c17505ba115da3200a7 |     
   sparc     |          eigen-3.4.0           | NOK | http://autobuild.buildroot.net/results/ec672d22cba01d8ef49500ffee7cea78e3fb66dc |     
    arm      |          eigen-3.4.0           | NOK | http://autobuild.buildroot.net/results/357b57148c650d5fa5e6f4f789c2fcb4f145e6f3 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/c5c0ea313a1bdcc11dcff143bb1ed4906100401c |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/9e280273451b44a1f20c20876720496c7d3ac369 |     
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/5be220c9c73fd38b7c1dc1fc2370df4608b166fb |     
  riscv32    | fs/axfs/axfs.mk:32: /home/a... | NOK | http://autobuild.buildroot.net/results/919bf6fadf1f98bdd6702d75f442faaef0555a9d |     
 microblaze  | fs/ubi/ubi.mk:51: /nvmedata... | NOK | http://autobuild.buildroot.net/results/f2452d8ab0858bcdf6069cf2fa09db649319a2b1 |     
microblazeel | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/78199f3ff6be05f43009ec9d0e158f3293cb2a77 |     
   mips64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/fce58875331c6cb6d63d80f62664f6177be7e42f |     
    i686     |        git-crypt-0.6.0         | NOK | http://autobuild.buildroot.net/results/e85c481659421439963d59107f115305c309bb18 | ORPH
   nios2     | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/18c00b882f7601a2d1464b67846e2bc8fc483790 |     
  aarch64    | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/3e42ac893d522e4af6b1c1722be4cdfec59fd085 |     
  riscv32    | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/4fd40d8edc7fb89add17fc9aaa5dd8fbdc38402f |     
   nios2     | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/e0313399f08fd10d7490cb8feec5ef3ec3c3fb60 |     
 aarch64_be  | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/2d5dc0c04c77e96ec1a53ba2fd63fd5ec3afed29 |     
   arceb     | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/868073a9f740890814a0d08a622e9dabf7723f8d |     
    or1k     | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/38fd7959374d98fa14df94a54ddaf7c837487c72 |     
   mipsel    | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/3d8155f15dc9fe076f60e86b18daf64e01f437b8 |     
   s390x     | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/3693149172aa179831b8e040ab2e4d604fdf2fdd |     
   s390x     | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/aee653607fc52a55ec1fe556dc66c3255531f008 |     
  riscv32    | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/1dd22d92f0d7f70504b074ae1349a866c0ab6e7e |     
  sparc64    | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/8f0c98c0ec20e053faa2321dec7e33aaec26b071 |     
    mips     | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/b5bdeaa06dda179b81ace5528237eacbfb76a866 |     
powerpc64le  | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/5b1a7a4de16dbe5e1e600d0068154ee49d63064d |     
 powerpc64   | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/f9099c9eb20bcb4f738b998beb46c78b8a60a11c |     
    sh4a     | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/0019ada82327c2265d148f2b36a93fca61ac9eb3 |     
    arm      | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/1ba20982d5ec0edc751a11a2d5639f5f6477b9bc |     
    i686     | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/bc84effd3907a7fd208c902ae21e8029bc2cf166 |     
    i686     | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/3d91f3685ae6c3e1f765d419ea2c0da4cb0eb3be |     
   sh4aeb    | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/a4e4e13e176648f85bc6fb40e6f11ef96ae13388 |     
powerpc64le  | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/831c8c195e02ea4bfcf10cd984c65997ba9ec636 |     
    i686     | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/e67d4ca66a8f1809c534662e482626a7031d3f3d |     
  riscv32    | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/01d41ca37075f200ec746316793cedd336d1ba96 |     
   s390x     | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/3e9e37ee83c1ab9d08d0a090a23d21fc8f5ec6c9 |     
   nios2     | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/557cc3d0187eb4b3cf1005a1cdee67b72648944a |     
   s390x     | glibc-2.35-6-g491f2ef1f0ff8... | NOK | http://autobuild.buildroot.net/results/a9b0777be0563c2ef4d321bc1385889bf8b6f245 |     
  mips64el   |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/59a6b5113ea04dc9f4e64bb40bbe7ebe0ccaed87 |     
  riscv64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/a877735ecb80d3a8b3a0c89b081a7aabe69f9f65 |     
    arm      |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/b3fdb85c2cd462c00d86c7c2bfd3db95f95da36d |     
   armeb     |      host-elf2flt-2021.08      | NOK | http://autobuild.buildroot.net/results/6ca5c1a5624c8e33e988b848f39399d900a5a015 | ORPH
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/42965d286285d5d6cfbb39f6195c87fa05dd3283 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/58f28f97920ee789316dfa8cd953b5f7f55b5950 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d5c00c26571b94adf0555f4e7541e5028ca64be3 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/c5ffe91fd05cb088cbd40119a348c92b294c3303 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/2cbbeaaf43492d6ab8436a5889dd13917e065922 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/3998dbee56b0853a86728554c46173ee0f88c6d7 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/3d8b08096f4234c5a5af5dd4291ac21aab0be940 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/29fe74710002da2bd01af5d80d13613ca9fd50aa |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/1bc4afcfec33b2cbfd5e58e95571832b825d9ede |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/126cc99f7319d35fa1e3ddf784ec27168550b4c3 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b43cd7cbf594cac78c23b90fd0305f2698d873b0 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ac1fa43314cb08810862913d742fd34a93d17343 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/7ee0ba2ea8e17e42bee3dd152d2dee0fb7811163 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/4f095ed236514f942d1f2c85b6865cfedb38d196 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/f4f6e37da5edf496620fd21e02a7e2d26720cb9f |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/09265901bc26d3df06a9eebaf0ec37efdb78acf4 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/20c9986dec87ec1fa0c572e8a98dc8454dd90c99 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/c06f33fe2bfda025e9c6938e9fc578e30424a34c |     
   x86_64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a83841745c661929976f6577f9317254afe56ca7 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a1ba7ad2b637b1ef9ece91ea2ff19854ec467acc |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/fa1e11406faf70af19311ea388d2e147defd73a5 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/dbd2e68937d87e1fe449de621710626d48efdd72 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a445715a57a20e9f529022fd5e35dc19b4bc89d3 |     
  sparc64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/05ddb3884bfd3ab67b0d00e98f06faf349a7e3d0 |     
    arc      |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/357a74d53af96d4b868a9d5b9f9ce9432e0c53b5 |     
   x86_64    |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/2418106d30e07cf09834941e610c75dde78816d2 |     
    arc      |     host-gcc-initial-9.4.0     | NOK | http://autobuild.buildroot.net/results/bcdf160a3d5ffcccd4402f65aca153faca4b32c2 |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/609144e4977f3945d381c4055dd659bcaec8024e | ORPH
  mips64el   |         host-go-1.18.2         | NOK | http://autobuild.buildroot.net/results/996162c5111c0ec22246564e846c6f405e2f99c7 |     
  aarch64    |         host-go-1.18.2         | NOK | http://autobuild.buildroot.net/results/0bef1475792a388826508dd63c99ec341a41e18f |     
  mips64el   |         host-go-1.18.2         | NOK | http://autobuild.buildroot.net/results/56430bc98fe2fccdc9318cd6f3a3bf8b399e30f9 |     
   mipsel    |      host-nodejs-16.15.0       | NOK | http://autobuild.buildroot.net/results/5e6526b667646feff4ac4b457e3cd5fa5fa07b6a |     
  nds32le    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/f37c57665d85c6ea9fb72448cb1a255744fc6064 |     
   x86_64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/56d78a9513aa5f3a663c06d36e8e708b3e9a7aec |     
   armeb     |      host-rust-bin-1.60.0      | NOK | http://autobuild.buildroot.net/results/0a624e54cb1bafc0d09b2a44e26bb333c4c1727f |     
 microblaze  |      janus-gateway-0.11.6      | NOK | http://autobuild.buildroot.net/results/8c18792cb9a26dbdfd07ac69f44ca340bc62a980 |     
    or1k     |          json-c-0.15           | NOK | http://autobuild.buildroot.net/results/02207a489f5541c4e056ac71ad52baa7d4ca5b5a |     
  riscv64    |            less-590            | NOK | http://autobuild.buildroot.net/results/f686ef75c2774390b8b534ae825db492b21e6032 | ORPH
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/200fea0d293056abc0bdfbba0ed93256d43400e2 |     
   armeb     |           libev-4.33           | NOK | http://autobuild.buildroot.net/results/f18dbea67e773a036749e53eff55e87310ff999f | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/628de1ccf36106e7858004f703c7e14af838c3ac | ORPH
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/4812503a43c99fa75ac8b9420071d8eac493d6f9 |     
   xtensa    |      libmicrohttpd-0.9.75      | NOK | http://autobuild.buildroot.net/results/d1a218d97858b5dba4d96ff593071c9c9e9013e3 |     
 powerpc64   |          libnss-3.78           | NOK | http://autobuild.buildroot.net/results/16db668ce0a7750dce4f4ee97a41b2ef9f3a0ea6 |     
    mips     |          libnss-3.78           | NOK | http://autobuild.buildroot.net/results/d87b84b08b15a0dee043161f2688f628ebc1adcd |     
powerpc64le  |          libnss-3.78           | NOK | http://autobuild.buildroot.net/results/8b472803c0577f01d0244307c93ec83b9addec80 |     
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/0321fcb104fa1b8309c9d3108be4924ffb2045a5 |     
    sh4      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/c8a3233d14e69c6a422f6755e2a6c36e0594db73 |     
  powerpc    |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/facd9447445429366d48c36d96f37b678437bd6a |     
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/9c5f7ec10c9a5610a109348f13882784515ea9c5 |     
   sparc     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/cc123e5125e8a118fcf49141292773d9eb5e4987 |     
 microblaze  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/25ffd1323743c2b77f675c5b31702e8e6975f8dd |     
  powerpc    |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/455a1606261a2df69619ce74ff18c3b29c392ef2 |     
   sparc     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/a37c51d9650e2c5a36ad8c7822bc9a2c5593f082 | ORPH
   sparc     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/6efc397461c1cdfdcb9982c63e75d208ef38e515 | ORPH
 aarch64_be  |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/620cb8d542c2e0c263233f5b746cbc9be1bd9547 | ORPH
   arceb     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/74a012e5d52a2956508641f24e817f41acfb9c64 | ORPH
    arc      |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/535460de752cc3eb361d115bf7a59c6944108b6a |     
  powerpc    |        libtalloc-2.3.3         | NOK | http://autobuild.buildroot.net/results/b49e24ad16881eb4e70c0bac7b2866382d7095e9 |     
  mips64el   |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/059523a28fe8adb2d5fe537a89eb1b3224513405 |     
    arm      |         libusb-1.0.25          | NOK | http://autobuild.buildroot.net/results/755caf4d7475cf9b9e41374cc8e5681b3e4a7486 |     
  sparc64    |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/33c42fbf5e768c32ea95b42674e47a04e9f8d694 |     
   nios2     |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/9bc338bcb6cfe168cbd8b9b4da62943240ee0579 |     
    mips     |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/f2944bf8cafb22241125b08b4e3cb3d8ae24e499 |     
    m68k     |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/bd51f85c516208b98cdf7c2acd2409c686c63cfd | ORPH
    m68k     |    linux-5.10.104-cip3-rt3     | NOK | http://autobuild.buildroot.net/results/b9a9c264c5343ea5795c6cfb297f179265562f9c | ORPH
    m68k     |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/773e1fd9473520b5d48420b9f2be72b6af175343 | ORPH
   s390x     |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/9b7a2bda98ce0bfa9070f1b79f19aba1a6fc02d0 | ORPH
 powerpc64   |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/70a23c6be1e3b85e793661c58402b3cf6f640bed | ORPH
   s390x     |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/3c6a79291b87af63dff0f478c0e9a4aa4ded0178 | ORPH
   mipsel    |       lttng-tools-2.13.2       | NOK | http://autobuild.buildroot.net/results/c481c5a348f1defe745b16e0cc2549e6fe3e82a0 |     
   s390x     | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/670d561894756f704fde8f0af7899e1d5e50c339 |     
    arm      |        memcached-1.6.12        | NOK | http://autobuild.buildroot.net/results/ffa6c2ed63ac1ba0cdc3f96e1bbcc771a4e15f0e | ORPH
    i686     |         mesa3d-21.3.8          | NOK | http://autobuild.buildroot.net/results/c2f1ef60324b7a07dd8c074877b4d0033f75ef6b |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/3c02338bf03fd2cb972c8a5c00d885dbd52ff350 |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/ca52a106305e643dfcc9f2bfb31844d87767ca92 |     
    m68k     |           mtd-2.1.3            | NOK | http://autobuild.buildroot.net/results/635f51f046caefd42a0a48e4ee4b078880a81b74 |     
    arm      |          ndisc6-1.0.5          | NOK | http://autobuild.buildroot.net/results/a9c5a022da64aa75fec6220373ccad0382b5ee84 | ORPH
  riscv32    |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/aab175f9b72c08c36cd48f57b51003a5bbb1ae1e |     
    or1k     |         numactl-2.0.14         | NOK | http://autobuild.buildroot.net/results/1dbdf0d591376f28906bca45eb3c82b781685eb6 |     
    arc      |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/67c0f661e7cae5ad09c65db076bb8954a459a62a | ORPH
  mips64el   |        openblas-0.3.20         | NOK | http://autobuild.buildroot.net/results/3c751127965dcb28f7e5ea9c517875400124ffb4 | ORPH
  mips64el   |        openblas-0.3.20         | NOK | http://autobuild.buildroot.net/results/417d07c986036a2a702d0e359ff7df36a970db74 | ORPH
  riscv32    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/73f2103b50db648f39553aa2b9af179160d3bd1d |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/00ce745425757b398f99fa9732ab151de4cb303b |     
  riscv64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/e5da9bada293b2ab651b6995777eb39bde4151b4 |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/547d18feb4aba381b5afd04732c9caafafaf10d2 |     
microblazeel |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/eeff70c32fc5174cfc6c350c5746e6db961b4b49 |     
   x86_64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/2411a05475a075f2b39246b33f6870812ac510ca |     
   sh4eb     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/7033ab8fc04f43b5951176b4116beec14613d2c1 |     
   sh4aeb    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/3ea14656ea410dd7af742ada3ff4110f4277b0fa |     
 microblaze  |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/2e949ed43af04195793ca356c2628896a7d71a3d |     
  mips64el   |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/13c6e4625e4881bf27077886b0f9d2f4ff894a79 |     
  mips64el   |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/82976b94e87d793e096ea74f438c52e019866357 |     
    or1k     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/98d1e1a5e9913fa55524b7f8c36fd6e2bc3866e1 |     
    i586     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/384e0ca894dbc0ec72cea76141de890f1ce484db |     
microblazeel |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/9a12376221c6ad3933c695fbc72b036a35be9981 |     
  sparc64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/28b2193bec8a5bbe56d2b02f2a275d69d934a090 |     
   mipsel    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/0e8409cbcfa5d20d494b237e9b8d013d2308e914 |     
microblazeel | package/nodejs/nodejs.mk:28... | NOK | http://autobuild.buildroot.net/results/c24e9daf89aedf6cb5faf8d8470eac69dc82f11c |     
    i686     | package/nodejs/nodejs.mk:28... | NOK | http://autobuild.buildroot.net/results/a5db80f22f8b000e56eb61db95a225fd0c1954b3 |     
    arm      | package/nodejs/nodejs.mk:28... | NOK | http://autobuild.buildroot.net/results/bd1e3238f294152d54ee8f5579431606309dbff3 |     
   s390x     | package/nodejs/nodejs.mk:28... | NOK | http://autobuild.buildroot.net/results/4a4ccd016205c2e0a4e06c8f5dac7317860b7d5b |     
  powerpc    |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/b040fd193a61948e01a401052c6d97bfeb73ebda | ORPH
  nds32le    |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/68014f3bb54fb39bf724c660e7d2c2932dc674e5 | ORPH
    arm      |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/0fee1eab7dace60bc9ac9d6021954f6ec5d8873f | ORPH
 powerpc64   |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/3300516a8eb872e309ae350bef72831ab3c3533b | ORPH
    arm      |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/7ee90b92023dbedcaa4564c997d6398a2b116c2a | ORPH
   arceb     |        pcsc-lite-1.9.6         | NOK | http://autobuild.buildroot.net/results/6c3a5401811de36636d1498f77c8e39f7fb63f3d | ORPH
   sparc     |        pcsc-lite-1.9.6         | NOK | http://autobuild.buildroot.net/results/fa4e9ed7d5700b50cde62b333938511ceb1ad048 | ORPH
 microblaze  |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/d826efad78064e59699163437831a246ce87bb5b |     
  mips64el   |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/51031937917fe522de72ac5629ca8a8719cda6df |     
 aarch64_be  | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/587485bcfd85dfd974608aa00b9bd0c42a3a61d8 |     
   xtensa    |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/ce91e899fc916aa2903e08fdc0a810c77e9bcc1e |     
   nios2     |           pppd-2.4.9           | NOK | http://autobuild.buildroot.net/results/f5b89fac5640f1b95923ca59e294595888cf9dba | ORPH
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/feb69c9710bbb495a114d2789bfa6123720e5028 |     
    m68k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/180be99f13b7a0d1f45ba131419e3e3fdb17d65a |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/34bde8a853dac4ad958aa1e92699208f0079323a |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/65e8e9ec5baef1d1b24e507ba359ab2586e80623 |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/6c04142572ab3a120bdf6a62b7beba748689b22c |     
    sh4      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/3ce66f514caeafc812a2b19e2d731b56e89c0042 |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/2baca0e602aa190dc478882c792c5e2e1440b104 |     
   mipsel    |           qemu-7.0.0           | NOK | http://autobuild.buildroot.net/results/1849f6d05728624fd293a015812b8d0f9d192e62 |     
  powerpc    |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/ffa8102bca388eea91bad3be98ad8620033131dc |     
   mips64    |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/8529aa558d69f983956892ccf8219b39055539c8 |     
    m68k     |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/ca4ebaacdfc06f08a5e0e2f146d2cfd6591aa748 |     
powerpc64le  |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/53750676d8efef10757d147979bc8413842bc7e6 |     
    arc      |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/46f5f9802a25148f6dc2c9e9d06b01f19ee2d7ec |     
   mipsel    |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/5bab0ec725e10a61fe531409b3afcda36b0ac02e |     
   sparc     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/69d54bf5b3a48db55ffd54162f380f4a466b9a4b |     
    arm      |         rng-tools-6.15         | NOK | http://autobuild.buildroot.net/results/1fc9c7d272c43eab13ce39f3ffd0816bb73d27dc |     
   xtensa    | rtl8189es-39c17661136da48f8... | NOK | http://autobuild.buildroot.net/results/9d7a95cab71089535a3a59e5b06b6e365529055e |     
  mips64el   |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/1372d63206f56816aba44cff04bbc255493de181 |     
   mipsel    |        strongswan-5.9.5        | NOK | http://autobuild.buildroot.net/results/f2f8dfc1ea5c598b04e9e4e9f2504c633d4edfbc |     
    arm      |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/eb45134957b8bd5d26f48baf27a0e2644caaeac1 |     
   nios2     |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/6cf6f22b84ec631c3aebdf04bc3440dfd9a16165 |     
   nios2     |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/9123cc658aaab245bc9df7d0d2c01fd760b812a1 |     
   nios2     |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/7dd99a0c8872f5d42c8bb745773c7da1c3b1cd73 |     
  sparc64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/2c6eef0dbe0472b9c9d1410030eb33dfb7cb4a81 |     
  sparc64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/e1e33706a64a87d7c26aaf66bfa13019b757ec81 |     
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/966e09630419fc595d721f80dfdfb9839d669074 | ORPH
    i586     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/0a81a3b2c4ee34eea3a5bb17f40935695ec8b824 | ORPH
 microblaze  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/13c2c0c40679271efc32ddfe5bf20c815a9e7de0 | ORPH
   mips64    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/641f153192e5df9dc850da4ff4a4f45218a224bb | ORPH
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/6b7162b320518481dfbabdf539269e6f54e98867 |     
  riscv64    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/6dcb0811219d9988b38f452c0d609fbea8244969 |     
    arc      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/4ddfe30fe2ee1f84724cdc862d490c0869fbc211 |     
   arceb     |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/7e19d2bc8a4aebb885ce2adcc49c5ad7d18b8519 |     
    arc      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/a7574c6ddaa4b5fbbe7fc86e3fa16321c4f4a8be |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/2198205b8e8cb83a0dea6c4834e7104c61ddfa31 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/743a4eae47b2bdaa69f3bcecd8d19a9a2d5cd8cb |     
  riscv64    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/a1875a2f2ba83fdc65cb7c0abead9ee88a4caad3 |     
   mipsel    | uclibc-ng-test-0844445e7358... | NOK | http://autobuild.buildroot.net/results/1c3ffef2baca388616cc4c8dfe5efa8a7229d061 |     
   s390x     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/32af0bbb7b413adae9d84ec3b0f99f4c5acc4212 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/cbb1dc753e0e36ad87b6f56b934c38347a2b8eed |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/0ac0588338b68ecfa0cc03eca5cc8778c045c3d8 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/298974d87bc1f578d67de2b1861e2f11f6c22374 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/1f2939ccb8e86f533f6bcb2d281ba77611b5cd42 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/77269c14c234f5b97e2e6c613304fd1350fb26a1 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/65dcc57f8f13a6aba67f1a8f78dec00c0eecf092 |     
   sparc     | wireguard-linux-compat-1.0.... | NOK | http://autobuild.buildroot.net/results/b60e1e53987fa06505405fa03fe88972456b7031 |     
powerpc64le  |            xenomai             | NOK | http://autobuild.buildroot.net/results/674492a25de5638f96aeb0df11f7442c047597cd |     
    i586     |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/d0a3535d62b214db7371f1b6441f6e07759d41ee |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/418be79567116a3a46ecfb107e4a4d778c177b3d | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/ee9ab07bd4b08e60fc5a903b41c8e0df0a08af31 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/35410f243e128914e2926e368e098d99e66b94e1 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/83dee2d43b01bbb52b3a407e0751c30fb45418fc | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/cfcc592a23a495db37cad91406aaff03b628b548 | ORPH
    arm      |        zziplib-0.13.72         | NOK | http://autobuild.buildroot.net/results/fb54fece4c79645568cb2b862a7046dc13714c00 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

tvheadend-1295dd2be863f5beb... | 3 
                  cairo-1.16.0 | 1 
                    dhcp-4.4.3 | 1 
google-breakpad-7515ab13768... | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                 uclibc-1.0.40 | 1 
                  uhd-3.15.0.0 | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/6e570ca5853ce7840a0005da15160e98956fdb45 |     
  riscv64    |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/3e539d9f5ecc5cfb07c3bcdef4194927ada475c4 | ORPH
   mipsel    | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/d36c3d348f00b1011b14c3f2ac8d8ba475f359b0 |     
powerpc64le  | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/e5a75ee8aa55b2f67629d7c12f45aa3244070ec7 |     
  mips64el   | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/63b4634122b471109b2eba1a473e606fb8cd9dad |     
    m68k     | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/0478b7f8110fc262de840098255b5d450594f8ce |     
 powerpc64   | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/7a11d569f0db2b9035baad6f5ccdb4d7ae5f3a87 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/59c4d56dedbb58651fb4a7a9df72c38b3b81838c |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/44a4f4854fee31b849f752e13801dc377fe63516 |     
   nios2     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/bf779fdbaaaa1b1c083a43d97078e774db8d1725 |     



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

