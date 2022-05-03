Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DCBEC433EF
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 04:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C380C60EFF;
	Tue,  3 May 2022 04:43:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kruDoDf5fkkM; Tue,  3 May 2022 04:43:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 806F060F23;
	Tue,  3 May 2022 04:43:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F2E6A1BF33E
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 04:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CEA39407D7
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 04:43:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ukaJbW05p6Ml for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 04:43:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2DEC4405A6
 for <buildroot@buildroot.org>; Tue,  3 May 2022 04:43:30 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3EF0040007
 for <buildroot@buildroot.org>; Tue,  3 May 2022 04:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651553009; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mOU4FmxEPKNWiTXekRqxQtSknfxxP/L++EKx5uaXilQ=;
 b=Ey3R76OxnEo3emVc5JvSgNMe3LZrwVjs2T2Qjn4h83Rmy9BJtFJ0419ZculrsOXHIRmJay
 FWW5ju16tXkgRY+QokdvyRClH4++Cc0DoL58sbgXE1LZD9wpjsCXZ/KBOxq6zjhNZZZteo
 r3aqk5SfkmUJ5xsPHb9R/eVYoRMgfBxSkm4kQ3lTxNnwPVF9ok18vZTQjl37JD8l2MsE8j
 1F3P595Oink4YE+Bsr62pynS2cbaqwonCl0/fra08O/5F8p6obNJXpJl1ioLvRi0uVsGu3
 dZWWakCIg1av5GXX+48r0OYzm7dukJ02YVz/3V2/e5hJDEthEsshV7byQMs/QA==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 03 May 2022 04:43:29 -0000
Message-Id: <20220503044334.CEA39407D7@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-05-02
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

Autobuild statistics for 2022-05-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 24  |  4  |  0  | 28  |
    master   | 171 | 271 |  1  | 443 |

Classification of failures by reason for master
-----------------------------------------------

           optee-client-3.17.0 | 30
         host-gcc-final-10.3.0 | 16
                 uclibc-1.0.40 | 12
                pciutils-3.8.0 | 11
             libopenssl-1.1.1n | 10
                    git-2.31.2 | 9 
                host-go-1.18.1 | 9 
                     frr-8.2.2 | 8 
                  zchunk-1.2.2 | 8 
                 linux-5.15.33 | 7 
                busybox-1.35.0 | 6 
          host-gcc-final-9.4.0 | 6 
               protobuf-3.20.1 | 6 
glibc-2.34-109-gd64b08d5ba7... | 5 
                libressl-3.5.2 | 4 
 Makefile:732: target-finalize | 4 
            qpid-proton-0.35.0 | 4 
                 zlib-ng-2.0.6 | 4 
                bitcoin-0.21.2 | 3 
                 dash-0.5.11.5 | 3 
                  exempi-2.6.1 | 3 
         host-gcc-final-11.2.0 | 3 
                libcurl-7.83.0 | 3 
           libwebsockets-4.3.1 | 3 
                     refpolicy | 3 
                       unknown | 3 
                  bitwise-0.43 | 2 
docker-proxy-339b972b464ee3... | 2 
google-breakpad-c85eb4a59b6... | 2 
   libtorrent-rasterbar-1.2.15 | 2 
         linux-headers-5.15.33 | 2 
              liquid-dsp-1.4.0 | 2 
            python-ujson-5.2.0 | 2 
                   uacme-1.7.1 | 2 
                  vlc-3.0.17.4 | 2 
                 wavemon-0.9.4 | 2 
             18xx-ti-utils-8.8 | 1 
               apcupsd-3.14.14 | 1 
                     aufs-util | 1 
                    bat-0.19.0 | 1 
               belle-sip-4.4.8 | 1 
                  boost-1.78.0 | 1 
                   bullet-3.21 | 1 
                  cairo-1.16.0 | 1 
                  cmocka-1.1.5 | 1 
                 dmalloc-5.6.5 | 1 
        edk2-edk2-stable202102 | 1 
                elfutils-0.186 | 1 
                      fbv-1.0b | 1 
fs/ext2/ext2.mk:65: /home/a... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
         gobject-introspection | 1 
               gocryptfs-2.2.1 | 1 
                   gstd-0.14.0 | 1 
            host-binutils-2.37 | 1 
        host-gcc-initial-9.4.0 | 1 
host-pahole-73383b3a39afe86... | 1 
              host-rust-1.60.0 | 1 
            igh-ethercat-1.5.2 | 1 
                  jack2-1.9.20 | 1 
              jpeg-turbo-2.1.3 | 1 
                   json-c-0.15 | 1 
                 libbsd-0.11.3 | 1 
              libgcrypt-1.10.1 | 1 
                libgeos-3.10.2 | 1 
               libglib2-2.70.4 | 1 
             libgpg-error-1.42 | 1 
                 libpng-1.6.37 | 1 
             libsndfile-1.0.31 | 1 
              libuhttpd-3.14.1 | 1 
                linphone-4.4.8 | 1 
       linux-5.10.104-cip3-rt3 | 1 
   linux-headers-5.10.104-cip3 | 1 
linux-headers-5.10.104-cip3... | 1 
          lua-cqueues-20200726 | 1 
luajit-f2b37f51f69ba7e9f8de... | 1 
make: *** wait: No child pr... | 1 
                mongodb-4.2.18 | 1 
         multipath-tools-0.8.9 | 1 
                    musl-1.2.2 | 1 
                    ne10-1.2.1 | 1 
             netsniff-ng-0.6.8 | 1 
                numactl-2.0.14 | 1 
                   perl-5.34.1 | 1 
polkit-a2bf5c9c83b6ae46cbd5... | 1 
                    pppd-2.4.9 | 1 
    python-cryptography-37.0.1 | 1 
            quickjs-2021-03-27 | 1 
                  ramsmp-3.5.0 | 1 
               target-finalize | 1 
    toolchain-external-bootlin | 1 
toolchain-external-bootlin-... | 1 
             uccp420wlan-6.9.1 | 1 
           v4l2loopback-0.12.5 | 1 
                  waffle-1.6.1 | 1 
                       xenomai | 1 
                  zabbix-5.4.9 | 1 
                    zstd-1.5.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |       18xx-ti-utils-8.8        | NOK | http://autobuild.buildroot.net/results/def215a3890e720a03f338ae96107bd9fbe3cfcd |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/03b142bd681a91134112b46ea23de392bba3f680 |     
 microblaze  |           aufs-util            | NOK | http://autobuild.buildroot.net/results/ec74bbfb773ca0cdaaa35d62dda56a057cb5f14e |     
   armeb     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/b4440135e85e69cb80c0e55d4cf4e9d06b7bac1b |     
   xtensa    |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/d706581074a66fa735877515c4c5e9f4bc086a7e |     
  sparc64    |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/c9377f9b175cd5a5dc8751501468aaf60ff612b0 |     
   sh4aeb    |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/0b05286ffc6853a82441f498b4d22a3a32b52c95 |     
    or1k     |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/8c0501c0b4a06498d54d7d61975ea7662c0775c6 |     
    m68k     |          bitwise-0.43          | NOK | http://autobuild.buildroot.net/results/efc869bade22bba9949791124665c23d0514ad76 |     
  riscv64    |          bitwise-0.43          | NOK | http://autobuild.buildroot.net/results/1322767432a75acb6cf76db747a49922368bf77f |     
   arceb     |          boost-1.78.0          | NOK | http://autobuild.buildroot.net/results/ca4060df60ed3d0c6102d9702b153fc7f921c865 |     
   sparc     |          bullet-3.21           | NOK | http://autobuild.buildroot.net/results/24569e22efcc5fff562a33bd50b5480fe30915dd |     
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/9c3eda6aea54bb82491f6d5460130c58ad49a2c5 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/883c1ad558d4fecb34fabc9b1fd20354a4ef7e12 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/c2fd9ea2a675c834c4f3ef3d63f31d4247a7cea0 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/6b3eec8257139c6321dda696b4c8f6f8484a66c7 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/c0f4899d8113f5a9f9f615649211eaa6f79a2ad8 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/b053b9c1592e3fc5c9c140a96c062d9b39e73df2 | ORPH
    or1k     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/e1a6e86cd3a431ec6685cd55660fe3991ef955b9 |     
    arm      |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/57bb0c8d2c93bce0bab07048c739ad8d8f490a87 |     
  riscv32    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/897bd97cd7fcc43dd789bc5758c6e7bdc1122605 | ORPH
powerpc64le  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/3e8965063158d79eb7b01edb7bca4c56fa7866b3 | ORPH
powerpc64le  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/a5b031f20742b1ba2c2af4784cc441474f10b8dd | ORPH
   mips64    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/2784364044c86879e90a5e6c1ebbcbf83817ab28 | ORPH
powerpc64le  | docker-proxy-339b972b464ee3... | NOK | http://autobuild.buildroot.net/results/e203ed0071a672bd7d20bd2c04b103b879770019 |     
    i586     | docker-proxy-339b972b464ee3... | NOK | http://autobuild.buildroot.net/results/679aac095035010b593c5763862a9472444abed5 |     
   x86_64    |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/45c73e793162768255222a677f2d225629ee657b |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/6c3c62ad358208e64eb5e6cc617505b54d3cd68e | ORPH
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/2872fe90e1dfe92fdaa90c2d86d84e53a42484cb |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/7678dcb5c33862a5e1b7b18889f7838b874953c0 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/377841f090c7205866c75f62560e580d277c22ec |     
  powerpc    |            fbv-1.0b            | NOK | http://autobuild.buildroot.net/results/596787e39002a0fb33b90e7a9478e8efba96beac | ORPH
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/4ff84b7b5f809c2125dfea633d4717bf75856e5e |     
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/ad6105e664e75f3f045bec1380cef8c03433c509 |     
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/be976910e64b082a941d578aff09c13cd470d06a |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/6082b2f2ffbe94f9b8cfa33a0dc1a1d405a51ab7 |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/622f9dbc5a294be6c486851b5b600de7e4da2ce0 |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/92da906bc3bd38618c0bc4f75c25c7cc8e4ce8e0 |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/96164f1dd31b37b7cdab0d02d5df798aefcf3c6c |     
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/41597218c051a4a884476e4b629ad9520249d500 |     
 powerpc64   | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/99d0408719693dd6ca1598af1c6c4dc7ea080564 |     
  mips64el   | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/e11bca2e945041a840b039eb4f84eed05016a9d3 |     
   sparc     | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/82238c0461d52b5563640269c596d92ede643e50 |     
    i686     | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/9371f5c5cc2062528d7f7c73597f1b29379e859a |     
   xtensa    | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/667d68d45730f1eb38863b468959801779f252bd |     
 powerpc64   | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/09a3b307afbb8c9af0bca643d2a867ae2011c0c2 |     
   mipsel    | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/3e6eec1509b79c5e65234fd04dc236cc6c73ac00 |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/52b9bda80949a836008aa721cb55ce73c9764c08 |     
 microblaze  | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/353f3fc65057ffbc82d8e6c423e7b153677de685 |     
   arceb     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/72c67947f19390d6bc470021b129e2db5d949f35 |     
    mips     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/1fa84f3baab4d49659b023fb94d4e60e2308be0f |     
   x86_64    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/a1a011c9c4809904d2e7239326f823aa944c94dc |     
   x86_64    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/13674bcfadd389a427975a2924a2f51b00e6bc66 |     
    arm      |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/08540a857537b356c5e79671d82cb232fa366a88 |     
   sh4eb     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/99f73afcf61f5e8f44d87fa886f8d5e6f1fa1cec |     
   mipsel    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/4258ec7f174e9ae8e732927efb2079c581a1b106 |     
 microblaze  |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/faf57017b86cb2f66574c0d0560fb51ce7ec60d4 |     
   sparc     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/c367c09b414952c0809cfa750366266bd4ae3a64 |     
   arceb     | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/f32cbc334650f73bf4f3cdeb054ee413ec07d590 |     
   sh4aeb    | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/716140b649fdf330cd33c77331339aeec19a0c53 |     
  riscv32    | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/9e712c5d1e09fc6052ff2861c7bf4d09f33f8d6f |     
  powerpc    | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/cfae2354d22412eb8d122d81daf7e1f7c97a7d51 |     
   nios2     | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/476901566cab3a2524f6ec83f8665c7cc27e2510 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/3cc24fa5f71fb5df972a0764edd16a4f0636b6a4 |     
  aarch64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/d365ae3f07b54a9d4b0b20a958e8471f0c4aff53 |     
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/c183588184e91ba9a1f3561b154e7c75834aef2d |     
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/82c222aba5c39184da32743ec01632c275f3074f |     
    or1k     |          gstd-0.14.0           | NOK | http://autobuild.buildroot.net/results/d4af04650468e59e7dabdad29041b5284b213c1c | ORPH
 microblaze  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/685dd9452e584efeb8088e0ac0bc43fa329d44b9 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/3396ff29fc882dfa7ae61f328330537363f0f45c |     
    i686     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/303e2efe7f45ca172264540b18dfc4caf2ebbb64 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/504b082e64fab66aeaf6f93d027436e8fb444259 |     
microblazeel |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/077767804df09d9abef519d8790f56b4fa0387de |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/00e4ed7274bfe0b09efcfd3238d0527247e56387 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/cf5f63b0116a763ad80478f1dc505935dc734d3e |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/8ebafc2065f0e22d80884c612f946c55873fdc21 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b61457b25b87c47cbeafbd99d3f6a11005b42ff5 |     
   x86_64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/8c8367f61db741573ebde69ea6167b437cc2e234 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/9a99912da52af0c19b5c2db5dbb5322af8406eba |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/96bd0007d6573f6c5d5d541386aa52a12a09dbfb |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a91e4ab8bd9fee7c9897adfce13335deed47dbc7 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/015ae6dad4e43a11c79a86dd9bdcc54bc578e15c |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/c4d696c90e1946b5faa6283117d24924b6c0af1e |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/edc2421babd08fba0f2f31d9cdfc3a3dc7dcc16d |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/1d1cf30ea0c94a4a0833798674a8389459eea134 |     
powerpc64le  |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/4c4c18511171603db3045416ff596447b501cb82 |     
    i686     |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/0c2af3d05158d5072d85703d1b6136e4e00e6b4b |     
 microblaze  |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/05c8bb7d00df83f0dade8ccbb87fa3706f9a2b72 |     
  riscv32    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/473c0ec5f2c19ce0a4271ae2e4bc787611c500d0 |     
   s390x     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/ec821159d6aa015a434fcc631aca921156f6dcb7 |     
  sparc64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/7bb56c56c45d003f656484a7c696611495136566 |     
  sparc64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/7c350955ef51d8542a113d322cfedad2cb77a9c0 |     
 powerpc64   |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/e02c070add1f070558451283bcb0e8845104c9ac |     
 powerpc64   |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/e1da083ba8e76897578fd238c57736412948ab1c |     
    arc      |     host-gcc-initial-9.4.0     | NOK | http://autobuild.buildroot.net/results/f71ac600b17256dbd47debb243e224c8573b045a |     
   mips64    |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/9e7bddcaa8faf77400b86471be7189bb0d5975a8 |     
  mips64el   |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/677809bb668e64d482bad5470d5dd45f0dd09871 |     
  aarch64    |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/4a3adc09f7d6bb482975aba53f0d73e3e1f12cab |     
  mips64el   |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/843a2e7e988df85e879786184b82d8b1e90e165f |     
  aarch64    |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/0efddf88312cf54c6d8ca2e3f2385eb2180c0e20 |     
  mips64el   |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/b877845b13b672309030408fc62d9b73e23e194f |     
    i686     |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/b6c4fb8c5ea192d24152e87f6cbeab58a1f80905 |     
  aarch64    |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/3023f745a63d3099fa5526f7028decbb7e808084 |     
   mips64    |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/961dfbc817f0943e4570ecd8e92abe5ddcdc19f4 |     
    arm      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/5a62dd759cbc674e74f32dbf24b73b0285f8829f |     
   mipsel    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/d11a74c7540f334b2cba8f5305f3edd51a835ea9 |     
   nios2     |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/b9d564837f09f55d8b1753631df72601d8a6d545 |     
    or1k     |          jack2-1.9.20          | NOK | http://autobuild.buildroot.net/results/35ea9d9eadccb9d83733878ac57e6e651b212e93 |     
    or1k     |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/a4369472441a451ca0402dc55a22ec1949ef1a38 |     
    or1k     |          json-c-0.15           | NOK | http://autobuild.buildroot.net/results/530c7260d520dbe14f0fcf174c8c989893a0b63d |     
   sh4aeb    |         libbsd-0.11.3          | NOK | http://autobuild.buildroot.net/results/7f780cce9847d499a8ad8030f65ef5bafef20f32 |     
  mips64el   |         libcurl-7.83.0         | NOK | http://autobuild.buildroot.net/results/3e840c896e4b8aacc9d784f16a6388eac4178246 |     
 aarch64_be  |         libcurl-7.83.0         | NOK | http://autobuild.buildroot.net/results/8812ffdf42a3adf2df834c4b6e36316cd932821e |     
    i686     |         libcurl-7.83.0         | NOK | http://autobuild.buildroot.net/results/825b0ae84d5212200710628689079ec54a4bda3f |     
 powerpc64   |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/e170dbf2de87d7ec2fab6345442cf9d6e5fcd38a | ORPH
    or1k     |         libgeos-3.10.2         | NOK | http://autobuild.buildroot.net/results/ba69fb11849ad05274531ca455dedfe954067ae3 |     
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/f6c24241294d404c7be17a053e978e856b8cffba |     
  aarch64    |       libgpg-error-1.42        | NOK | http://autobuild.buildroot.net/results/5aacf272955ac477b9b73cdbd0e70c838ae57623 | ORPH
microblazeel |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/f3482fba52f88bb47fe20b8050c0e20ebbd9bd63 |     
   arceb     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/cce322386a756340bd6fe2827608702723738ae7 |     
   arceb     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/26196542423ad3e1d571b98937590e84abdcacd9 |     
microblazeel |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/455e89ae5c68eff01263b8e24708255170ef09ea |     
 aarch64_be  |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/03efe29d7769b376e2f820c6eaf329126a2c043a |     
   sparc     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/047607ec80e3f43f243e9c4c6b1cb33033d1965f |     
    or1k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/6c2a9c2a4172dacf11acac990a2e6df367b592ae |     
    arc      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/44f3120f97bc635f1d268e84ae24d1f0d48f78d6 |     
   sparc     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/0e7ba8d6f5a72f723fc7529fc2580f557dacb46e |     
   xtensa    |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/c68b55aef4cbc1a63eda44b17c44da14658ec72f |     
  riscv64    |         libpng-1.6.37          | NOK | http://autobuild.buildroot.net/results/59ef636befe86daa082d373bac024fdbc41044f3 |     
   x86_64    |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/7ffdca96adb9633c6f7b4678e3cc9d66cbdbabf0 | ORPH
    m68k     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/6648068ca99727ee673d07d90128219b606d1c43 | ORPH
microblazeel |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/d2ecb3cbec1aba280d4b9e00efcd4ec0707363a3 | ORPH
   sparc     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/33161f0f1d4a595ba9e24c59cd9b0fa4fa68dba9 | ORPH
   arceb     |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/355ddb9242ef61f6e0b449c82cc647f536d98599 |     
   armeb     |  libtorrent-rasterbar-1.2.15   | NOK | http://autobuild.buildroot.net/results/048e2b57191faea488cea8ff3c632d8ccf2c88ba |     
  mips64el   |  libtorrent-rasterbar-1.2.15   | NOK | http://autobuild.buildroot.net/results/f6183ec74b548469be17c356da35ce64b6e8efb2 |     
   mips64    |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/42ddb0cf98d665fc64661ea5ecd96dc8701aab3c |     
   s390x     |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/e1f0abd281223e56b7f8211643593542225ada30 |     
    arm      |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/501b5cc3b5586f2b6b7f0daba2502afe1a3c8eff |     
   s390x     |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/2324b792db5d58276eac153b9e108e89888d220c |     
   x86_64    |         linphone-4.4.8         | NOK | http://autobuild.buildroot.net/results/d876a6cd18403974a8c96c55e3236644e10031b0 | ORPH
    m68k     |    linux-5.10.104-cip3-rt3     | NOK | http://autobuild.buildroot.net/results/f008ac20f985774aeffe09ecbaf6848edbd7fe13 | ORPH
  mips64el   |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/fa54a6de2abca0448102905206758bfcc4098674 | ORPH
    arm      |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/d2b0e166dda666173409c6840b7422a20e6107c7 | ORPH
   sparc     |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/eef746b648836a673e0f21862a05809d5db6a59c | ORPH
    i686     |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/412492e19b41f95ff2445df6b7564cb0fa48873b | ORPH
  powerpc    |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/1bdfffba7a3cd474ad3ba174f015d1cb91d9a7d0 | ORPH
powerpc64le  |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/86a01523230b6c5906e7350c244f2de15d1464cb | ORPH
 microblaze  |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/d721af283e9d8e0f2ef2dbe506f01d48cbc385c6 | ORPH
   mips64    |  linux-headers-5.10.104-cip3   | NOK | http://autobuild.buildroot.net/results/3c3a9fc1a1e0002ae8169fd47b3003ebb86935f6 | ORPH
   x86_64    | linux-headers-5.10.104-cip3... | NOK | http://autobuild.buildroot.net/results/8b933496d9a843eb52dce688afc7e327202cdced | ORPH
    mips     |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/816d7a3ad77ba051fff7fba7f2a38fc31549c360 | ORPH
 powerpc64   |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/a70fc90e1a7886f1c14bcdf720be02cc3557ec54 | ORPH
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/33c68dd9c8cf0a387131d43467e8e7065d068901 |     
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/453e0bed80ece2b5c8074dcd5e1ecb593d70a4db |     
    or1k     |      lua-cqueues-20200726      | NOK | http://autobuild.buildroot.net/results/30eb17e8a6793b2404b4db7a2b2d348d899f2d3d |     
   armeb     | luajit-f2b37f51f69ba7e9f8de... | NOK | http://autobuild.buildroot.net/results/cac73c24710eecc564b65e26ca3642ce06935d40 |     
   s390x     | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/76dcf5f13a480bc824a5c51335312ca8ecc608d4 |     
    sh4      | Makefile:732: target-finalize  | NOK | http://autobuild.buildroot.net/results/31ba602ad19588b6fef1dfc5881db85e7e468c86 |     
   x86_64    | Makefile:732: target-finalize  | NOK | http://autobuild.buildroot.net/results/460bb90d3513a352b53245aed4ed5b1647bd99e4 |     
    arm      | Makefile:732: target-finalize  | NOK | http://autobuild.buildroot.net/results/603a6a5c61097b416c5e09dde581e037fe2faec1 |     
   s390x     | Makefile:732: target-finalize  | NOK | http://autobuild.buildroot.net/results/6293ad08a620324aa79fc0d2f1d4e878de912748 |     
   x86_64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/e3d53f28045e3a877eab3c1c403f89ddaa077f23 |     
 powerpc64   |     multipath-tools-0.8.9      | NOK | http://autobuild.buildroot.net/results/d7e88ef95635b2050458ba8246e69e83bad39f50 |     
  powerpc    |           musl-1.2.2           | NOK | http://autobuild.buildroot.net/results/4edb7ac176606d06b0859054fb6d3deec9cb0442 |     
  aarch64    |           ne10-1.2.1           | NOK | http://autobuild.buildroot.net/results/bf107699d8eba948b9e2a8d30eaf9cd77b9fa1e2 |     
   mipsel    |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/7c335a7da9c5c30fca9819cf6e45ae1d82590774 |     
    or1k     |         numactl-2.0.14         | NOK | http://autobuild.buildroot.net/results/b7e3856cc4a2cda436f5cfb9fac380e1b93cb5bf |     
    mips     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/88f525b896d769bee6ed108d5c0ca9fa11e53f1e |     
 aarch64_be  |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/22fce56472d6a38bbb272546b6c8854c9dc53cec |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/42f9281da1d59631ecf25c1c17c7eaee0e7cf503 |     
  riscv32    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/aa5ec8b3704962b284ae3a26942cebfdfedd3a08 |     
microblazeel |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/6645ca2525b483692acd386a121d00c5b1fe542e |     
  powerpc    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/60464413a00fc5e69921bdb28d92bcda1b0fc1aa |     
  mips64el   |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/007af6d1331c045bc075c98142ff42178b7202e2 |     
 microblaze  |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/3c2366c01fbb9cb699e348a1c2a11d0c7bd007e7 |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/cdfb3662e4eacb2f66b770744072c8047899aa01 |     
   sparc     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/6eeb6cb3dea9f57c2ad0b5ddbec322dcb798b579 |     
  riscv32    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/5185961acd4b1bfc98a6d19c6ee5e51e4e657d0d |     
   sparc     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/ba0c8ab68d2ef262473d9034e08ebab060c49352 |     
  riscv64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/41295c1fb61a6e7e4e51d8ea9c06c4c139efc63a |     
  riscv64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/0fcbd9316fef1f6c131a912e21476cfb7eadeb7e |     
    or1k     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/190ee385a21cf0fc03f645dbc6a91ecd167ffc3b |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/6d0d55d24573fb380e477ff83c9e1cee9918c646 |     
   sparc     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/cfac8dce1e623faee5f709984c6a4416ca028a25 |     
  riscv32    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/037e45dd0ba6d4d8876f06e8375262ae04cd3457 |     
    or1k     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/210f7e894d43bd00825f36bd9837bc64d1ecdec7 |     
microblazeel |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/d2b90eafdbf595aaa99ba603e513f6e2bb31e960 |     
   xtensa    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/656935e8c0206786149b54d85077c768ab39f299 |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/a597d6fe31273f5e931d41670f1292cb8c78a6d5 |     
    i586     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/0bc5ad6c131d0260b0f536ca41ea71b13b08c12a |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/040a2ddc2f0d4f5a38c5a29d82f3e8e54e7832c4 |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/efda460246b1ac6e5d5ee45304d40a137871c0ef |     
   sparc     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/d70f05f658c0bf4447104c8aa3f835a2cbcb61eb |     
  aarch64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/fc85171f14b940ab60c266c376f8f16e7e50a2f4 |     
  sparc64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/0522d8bd7982a071ebd00c7be79d26d8f5011e84 |     
   nios2     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/3e65e55cf4832c0ea9ac8546f6adbf9805e1fc55 |     
  mips64el   |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/8bd0a86a082cb047882078ef28a2edb8fd2db453 |     
    arm      |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/1a56fb1490bd1bc5527fc44cf5266feb637c672b | ORPH
 powerpc64   |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/5f3cdc036a38b9255db3379a5b03abdbb4209efc | ORPH
  mips64el   |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/80e54eab330bad0c7069a073e35bd67bd320dc77 | ORPH
  mips64el   |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/cd08aed6ae8dc00d7aec05a79a1dcf338d68fd37 | ORPH
    mips     |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/99f6742dbcfc07c5b2c626b525f938241e35e216 | ORPH
  powerpc    |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/1b9cfac23b34dd7c468f13bad8d1dd4ef0f01c5f | ORPH
  mips64el   |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/a6d77256b750a578c8d64da0577a89c01926840a | ORPH
  aarch64    |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/1794571f275ea5cbdd5c233f38148d7b93aaa4cb | ORPH
    arm      |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/4031ef729ffbbdd8ffd0bd5d150587a325ff2f0c | ORPH
 powerpc64   |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/eea36a2d5e2ef9001d4ece3073eb69ec5cc5f2b7 | ORPH
 powerpc64   |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/f0408cac637260e0971920e2013d261bf83904d0 | ORPH
   arceb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/4e2201634e3987fa88691f617c5d9880252c0f29 |     
microblazeel | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/86d75ca749e91607513b0e5e6cca5d05b0fc7259 |     
    sh4      |           pppd-2.4.9           | NOK | http://autobuild.buildroot.net/results/2911535a1a72ac609c058bfa91b38510263b2d19 | ORPH
    m68k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/191eaa0ca5182d2b1e74749a4a331474ed68e8c8 |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/20d15544536d00e4390adb25e4628fb65088032c |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/4869e0671251837a9af0aebb34d10be486a76ef1 |     
    m68k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/46f8d05d648ac17be0ae33d1f17f1cf5b42b44c0 |     
    sh4      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/a4b2175f844e96215cf6ba1614bf05ab7ba644c5 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/2782ffaabe6d2933296ebe42e7f0b0719ad61847 |     
powerpc64le  |   python-cryptography-37.0.1   | NOK | http://autobuild.buildroot.net/results/80146f96793b33a2b491afe5f4953daf3af7c643 |     
    or1k     |       python-ujson-5.2.0       | NOK | http://autobuild.buildroot.net/results/54f2faf089d1c884eaa483802b64a0013c39b228 |     
   xtensa    |       python-ujson-5.2.0       | NOK | http://autobuild.buildroot.net/results/62cd0a8f4d58ed85ec28bce5e7b07998530a9015 |     
microblazeel |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/052bf8711fdd1b0e890be043e6c9bc9c256772f9 |     
  powerpc    |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/4dca360cf5c405659f4f0e457f7132cb9e19d50b |     
 powerpc64   |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/8d8f2f652c3038d6e5bc4088a99c871c438b730a |     
  riscv32    |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/5ca459319ba4b9500ec0bd41d0ceb7fda0aca5f3 |     
   sh4eb     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/10b69ee67d181a4249932211170156300b2a0bf8 |     
    sh4      |          ramsmp-3.5.0          | NOK | http://autobuild.buildroot.net/results/95ac618911fd0c78d3f3cca7963ada7fed506d95 |     
   arceb     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/a75f8c2e64941e73a08ca3fdc9585920f1e047f4 |     
   sh4eb     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/3e2c31821d8ae735bcda9c7e0c3083f10da11cc4 |     
 powerpc64   |           refpolicy            | NOK | http://autobuild.buildroot.net/results/462d92e213be122c93c33f33918fde72f3fc20a4 |     
   s390x     |        target-finalize         | NOK | http://autobuild.buildroot.net/results/f97bbd11fe61df1a1b58ec50838e5190bd98be5f |     
  sparc64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/9fb410319cac8d71a6c80c30997ad6abb97fa6f2 |     
 microblaze  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/4710aacd46e4ddd524ee960d1a91a2b44ce1582d | ORPH
   armeb     |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/f89484e1312208016d8b88e0e402818a4e36041b |     
  mips64el   |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/bb67ffbeade725e6f10e7486cb560ee0e9d8138f |     
  sparc64    |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/28cdbe484d9e36a117288965dabd2bb27d8ecc21 | ORPH
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/a417826a2c720090bb3e08651142bb5e4dbd37a0 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/aecce20d82729fd3b5859e99e2910ec899f33812 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/a3376450c619c8bba3c8547c9c295a7e740cba33 |     
    arc      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/2b85033a946c7c0b9579802751c82254a81670ec |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/951a09ead6da52b196253b6281452d4698c61bc3 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/53677af307be493fff5c53b4a3aecab79049ca48 |     
   arceb     |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/67b0779f696b7c61fd3bf4bd154b6e1bb56123c6 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/41ab8c08f9d0f27729f7645fc4812f04e7e8006c |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/4a5d4d647e1952c89451b1233e98cc61c2a43d88 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/2630979e9101a1a4c44e476c3b70cb7c20bbcc6c |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/1424511dc6ee172fbda0f4e1c6793760743ae6cd |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/7f2d4dbb1699b854693d3dad1aa0fd013b36cb1e |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/79f2589bd5d705b9906dbc5f1573dfb473d9eea7 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/04a7d476295bd5fd8d87d5d3a9c6e38d9289edd4 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/c718f1fb8fa77638946ec0d4c54e03aecb6375b4 |     
   nios2     |      v4l2loopback-0.12.5       | NOK | http://autobuild.buildroot.net/results/640f8f61c7f433ffe5e9a6759eecc9a03f735569 |     
  powerpc    |          vlc-3.0.17.4          | NOK | http://autobuild.buildroot.net/results/26e821e5ecbe02488dbcbf8e1465efad5ae5be39 |     
   sparc     |          vlc-3.0.17.4          | NOK | http://autobuild.buildroot.net/results/e12a9475e5ece77c53ca3957972b62ff4a3353d4 |     
   s390x     |          waffle-1.6.1          | NOK | http://autobuild.buildroot.net/results/7327f9c6b731053673a827abbb0f4d89691d658a |     
    or1k     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/183f91b25b13cfce85b96e4bc26a91b7baa82696 |     
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/fd59cb042c1add96cce73b17cc8d6541cbf2e6ff |     
 aarch64_be  |            xenomai             | NOK | http://autobuild.buildroot.net/results/2ccaa8243633af2e50ebe32641b452d0bed3a677 |     
 aarch64_be  |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/6c75a5c8a69a884a49b962e2f805184b36356966 |     
    arc      |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/73d4f3a34e719f8568987c728adb268ed0acc6ba |     
    m68k     |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/16caa6651dc17b567ee7ba4cf61c1207ede56c6a |     
   xtensa    |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/a2df1d54c78096be7d50e27a16ebb126e0c6a8c3 |     
    i686     |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/18778e6d25c0712dc30923fd69134b3b39ec21bd |     
    or1k     |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/b0ed854b17237da7ee667b0090241bbe71e003aa |     
   x86_64    |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/2c1ff4f70ed56408f4e751b21c70407fcdbd2cdf |     
   x86_64    |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/199c719521303e292ff41a17aaeb737d60d1bfc8 |     
   x86_64    |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/82517abd49dcf82c17fabaf9680353d5a6cc4279 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/2879ead65f006e5424de0ead69634b84023c0762 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/631fe56b48815e2d5a954546da471211d486378d | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/707c1a0de1813fc971b029737beb0037b077a991 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/48515f5f89383207596b1fdb2d573a86f566a37d | ORPH
 microblaze  |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/d0ce11e8c2c78c5ff8001c9a56ca25c7962840ca |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                  exempi-2.6.1 | 1 
                       frr-8.1 | 1 
                tinifier-3.4.0 | 1 
                       unknown | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/412636219e30d0b84f7a6cab6b8b1072269fb5f2 |     
   xtensa    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/20b59feb6f874b566ce445f49aed93e7eb86e45a |     
    arm      |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.net/results/d925e9f2fe99747546548d279cdac11e606d83d3 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/467e3f5f6007cb64837f715a8df6b9704ddd3008 |     


Gitlab CI results for 2022-05-02
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
   TestIso9660Grub2Hybrid | https://gitlab.com/buildroot.org/buildroot/-/jobs/2401319399  | ORPH 
            TestLibshdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/2401319448  | ORPH 
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2401319518  | ORPH 
           TestPythonAvro | https://gitlab.com/buildroot.org/buildroot/-/jobs/2401319580  | ORPH 
         TestPythonPy3Can | https://gitlab.com/buildroot.org/buildroot/-/jobs/2401319586  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/2401319636  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2401319650  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2401319651  | ORPH 



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

