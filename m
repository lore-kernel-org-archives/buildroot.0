Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D2B0C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 04:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BA0160E38;
	Wed, 27 Apr 2022 04:41:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7U074GCDew5R; Wed, 27 Apr 2022 04:41:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5D6F60E53;
	Wed, 27 Apr 2022 04:41:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 62C571BF94B
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 04:41:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5EBFF60E53
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 04:41:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pzqXyICO7w7C for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 04:40:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1B3BE60E38
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 04:40:56 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 34F4FC0005
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 04:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651034455; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cuiE1Gdr8chczMv6WkZo9ZbjMeAHcgsEPOq7sjh+ct8=;
 b=aLDDoyFbF3BabCdGQK99rOmLTRIB2ame3wHu1mgouQ65rU0ZNf+ftcARSDQhKrIuUxLc5x
 SYU6rMdTzR/78RJfnTs5y8p7HU8zJo/qbNwQaGmr0d3/F4UblDDl9vFAacIZt8+B9Ixq7E
 LMsRIM7H8LIiaDrZOBmJIHHFaX+XZTcQRR1MYA5TOJ7IQ97ufpQQHq2dbSTfLa1FKQ2QU9
 8ov/rRiX+xnkaN6WSiwBQL5bdY6BDv/8L1bKRu/w6v8HbGlymB0VO3UMe9u6ogym2B2qCj
 DbpAI6QNelwM5C1/CdSMskGtJQK5oOYB4RlgLnmt+7LA7fG7aJiB1n7pG/IGDw==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 27 Apr 2022 04:40:55 -0000
Message-Id: <20220427044100.5EBFF60E53@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-04-26
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

Autobuild statistics for 2022-04-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 20  | 11  |  0  | 31  |
    master   | 230 | 371 |  0  | 601 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 64
         host-gcc-final-10.3.0 | 22
                  zchunk-1.2.2 | 14
             libopenssl-1.1.1n | 13
                 uclibc-1.0.40 | 12
               libevent-2.1.12 | 11
                 zlib-ng-2.0.6 | 11
                    git-2.31.2 | 10
           host-wayland-1.20.0 | 8 
                libressl-3.5.2 | 6 
                 linux-5.15.33 | 6 
              cryptsetup-2.4.3 | 5 
          host-gcc-final-9.4.0 | 5 
    toolchain-external-bootlin | 5 
glibc-2.34-109-gd64b08d5ba7... | 4 
              host-libcap-2.63 | 4 
         linux-headers-5.15.33 | 4 
                   perl-5.34.1 | 4 
                python3-3.10.2 | 4 
                     shim-15.4 | 4 
                  acpid-2.0.33 | 3 
                    bat-0.19.0 | 3 
                   gstd-0.14.0 | 3 
              libgcrypt-1.10.0 | 3 
                libssh2-1.10.0 | 3 
                 libv4l-1.22.1 | 3 
               pipewire-0.3.50 | 3 
            qpid-proton-0.35.0 | 3 
                     refpolicy | 3 
ulog-0389d243352255f6182326... | 3 
                       xenomai | 3 
                apparmor-3.0.4 | 2 
                     aufs-util | 2 
                 dash-0.5.11.5 | 2 
                elfutils-0.186 | 2 
             fontconfig-2.13.1 | 2 
                     frr-8.2.2 | 2 
fs/ext2/ext2.mk:65: /home/a... | 2 
fs/f2fs/f2fs.mk:64: /home/a... | 2 
  gobject-introspection-1.70.0 | 2 
gummiboot-2bcd919c681c952eb... | 2 
         host-gcc-final-11.2.0 | 2 
host-gdb-arc-2020.09-releas... | 2 
                host-go-1.18.1 | 2 
                   json-c-0.15 | 2 
ktap-23bc7a4a94bd9e4e1b8b7c... | 2 
               libcap-ng-0.8.3 | 2 
              libeXosip2-5.3.0 | 2 
                   libnss-3.77 | 2 
                 libsrtp-2.4.2 | 2 
   libtorrent-rasterbar-1.2.15 | 2 
           libwebsockets-4.3.1 | 2 
   linux-headers-5.10.104-cip3 | 2 
                   linux-tools | 2 
        ltp-testsuite-20220121 | 2 
                nodejs-14.18.3 | 2 
            quickjs-2021-03-27 | 2 
                tinifier-3.4.0 | 2 
                   uacme-1.7.1 | 2 
                acpitool-0.5.1 | 1 
                    brltty-6.4 | 1 
                  brotli-1.0.9 | 1 
          cryptodev-linux-1.12 | 1 
                    dhcp-4.4.3 | 1 
                 dmalloc-5.6.5 | 1 
           docker-cli-20.10.14 | 1 
        edk2-edk2-stable202102 | 1 
                      fbv-1.0b | 1 
                flannel-0.14.0 | 1 
                freeipmi-1.6.9 | 1 
fs/cramfs/cramfs.mk:46: /nv... | 1 
fs/ext2/ext2.mk:65: /home/a... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /home/a... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
        host-gcc-initial-9.4.0 | 1 
host-google-breakpad-c85eb4... | 1 
           host-nodejs-14.18.3 | 1 
             host-pahole-v1.23 | 1 
                libmad-0.15.1b | 1 
              libuhttpd-3.14.1 | 1 
               libvorbis-1.3.7 | 1 
               linknx-0.0.1.38 | 1 
           linux-5.10.104-cip3 | 1 
            linux-fusion-9.0.3 | 1 
linux-headers-5.10.104-cip3... | 1 
            lttng-tools-2.13.2 | 1 
                 mesa3d-21.3.8 | 1 
                    musl-1.2.2 | 1 
             netsniff-ng-0.6.8 | 1 
                  ntp-4.2.8p15 | 1 
                numactl-2.0.14 | 1 
                openobex-1.7.2 | 1 
                       opensbi | 1 
package/pcre2/pcre2.mk:33: ... | 1 
              pcre2-legal-info | 1 
         python-greenlet-1.1.2 | 1 
rtl8188eu-903b6fcb821465fe9... | 1 
rtl8723bu-19b4bdc05483a1e79... | 1 
rtl8812au-aircrack-ng-3a640... | 1 
rtl8821au-4235b0ec7d7220a63... | 1 
                    ruby-3.1.0 | 1 
                sg3_utils-1.47 | 1 
       shadowsocks-libev-3.3.5 | 1 
              skalibs-2.10.0.3 | 1 
ti-sgx-km-cf7f48cb30abfd5df... | 1 
               valgrind-3.18.1 | 1 
                 wavemon-0.9.4 | 1 
                 wolfssl-5.2.0 | 1 
                wtfutil-0.41.0 | 1 
x264-35417dcd65a57321fbadf9... | 1 
                xenomai-3.0.10 | 1 
                xenomai-custom | 1 
                  zabbix-5.4.9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/c7a4f03b74036d4404eb42868cb0cedde81dc4b9 | ORPH
   mips64    |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/61adb75ed2b05058c67ec933ecbea32a4e9d9693 | ORPH
   mips64    |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/cd624b866f48f4d5b7d5a1c85a923fd065eaf57c | ORPH
  mips64el   |         acpitool-0.5.1         | NOK | http://autobuild.buildroot.net/results/9561667aa77a9f3eb55ff0ef6b5ff33354b57e7e |     
   x86_64    |         apparmor-3.0.4         | NOK | http://autobuild.buildroot.net/results/4b38a4fc42e3160d630b4dbe17b6ec70509debbc |     
   arceb     |         apparmor-3.0.4         | NOK | http://autobuild.buildroot.net/results/b4676fbffa009f25fcf5789722a4cc3bcc5602f6 |     
 aarch64_be  |           aufs-util            | NOK | http://autobuild.buildroot.net/results/e3a4d9ed56799b01999296a6acc3a6381a8fd8c7 |     
 microblaze  |           aufs-util            | NOK | http://autobuild.buildroot.net/results/892c192a602c2b5ebe4ddba66cfe33314e6db243 |     
    i686     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/6f2c8fdab7c62313ad5b5fd564db23fcfca5389f |     
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/15a669661649aa3d7b7d9e2b367fec3a19322d8b |     
    i586     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/8759860983cf633365f7a124d76d0f512d449bfb |     
 microblaze  |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/7e881d0bc26fce9de91a46bb71b77c16eb91b29c |     
    m68k     |          brotli-1.0.9          | NOK | http://autobuild.buildroot.net/results/2f222d5a86b4237b81ca31dba89f58b0e6e879db |     
   arceb     |      cryptodev-linux-1.12      | NOK | http://autobuild.buildroot.net/results/237b490de64161a2e9cc873e32b99cf71122d389 | ORPH
  powerpc    |        cryptsetup-2.4.3        | NOK | http://autobuild.buildroot.net/results/631c83ac2471d9dda1778cd136aed5d593f9584f |     
   armeb     |        cryptsetup-2.4.3        | NOK | http://autobuild.buildroot.net/results/42c4fd528a54622f28a3673eb38e0b7e9218b563 |     
    m68k     |        cryptsetup-2.4.3        | NOK | http://autobuild.buildroot.net/results/42985a30dc9c6ae002b9aebc7123d99baef83c08 |     
    sh4      |        cryptsetup-2.4.3        | NOK | http://autobuild.buildroot.net/results/a30d009c5b67808cabd9cb95f2e2721b8c5adb1f |     
  mips64el   |        cryptsetup-2.4.3        | NOK | http://autobuild.buildroot.net/results/2a6a7cf8f9f096d62d0a07bc2eb9bd3cc5530267 |     
   s390x     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/b57c0f3e9c80aee1b480b5e90edc7a7a2a8fc10a | ORPH
 aarch64_be  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/650c5c8dab94faab5750d99f76977769779a2d3d | ORPH
   sparc     |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/6b722d6ead28aef23139a1492e09e8a69f18d753 | ORPH
    i686     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/ae93e7a84898b90ce9f91a923e211dfba8b7ab97 | ORPH
   s390x     |      docker-cli-20.10.14       | NOK | http://autobuild.buildroot.net/results/d7dffda77581742299fc5c02b031029bcce5f845 |     
    i686     |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/09ccdfb6d4d78470fdcfac13816712307473e786 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/dfaf988b40cc95b1e2a4e1a5f72accc96fe33c90 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/ba2ef25411dff49c1451a6be4c0ecc5d163f2138 | ORPH
   s390x     |            fbv-1.0b            | NOK | http://autobuild.buildroot.net/results/0ff9a22d85b73a6534aabf5d03be8baefcf87d48 | ORPH
powerpc64le  |         flannel-0.14.0         | NOK | http://autobuild.buildroot.net/results/956bf6c609d5371ee91e0db4fe0e1d5f8eeeebc8 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/59390fce0e022f48282656edfdbade0292e3b3ed | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/167e7ca3ad25e1d139576a1e5d696c93133c9960 | ORPH
    arm      |         freeipmi-1.6.9         | NOK | http://autobuild.buildroot.net/results/26090162396b1b8cedfc58e1790ced528fcc35c6 |     
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/2e464ee87558a046a2c892a06141cab4789e2fc2 |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/a0869ba045fc49ecc7e687e0502b190db9dcd93c |     
    mips     | fs/cramfs/cramfs.mk:46: /nv... | NOK | http://autobuild.buildroot.net/results/e8f2b1a3adc244ff63cffe523975a3a91947a0bc |     
    mips     | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/702a5f9aec7d554516b9c0bbe2e244bfda25162a |     
  mips64el   | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/26b47975955e8cf792ad2d06756588e8c1224033 |     
    sh4      | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/23005397734a9948a806132fda5e8b35c8ec69dc |     
  sparc64    | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/d680d008928ac982b2932d3c76302ff9e6b26f3b |     
   mips64    | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/01f59e2cce3e1f029ccc1416b412475c194b72be |     
   mipsel    | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/34b05ca28129b3250d6bf468c9fe3c27aa6f0c47 |     
   xtensa    | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/70844c9e77680638131ca8e6564a241f43795173 |     
   mipsel    | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/26c1e541efdcda892802d82d48eb46e2cbcb5f4d |     
   mips64    | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/b7f9e35e29407a7acb99d6b077d79cf3fc2e16e6 |     
   sparc     | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/cf5253f9408c4294a09fdb70bcca3628f60b4fea |     
    or1k     | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/e20537c36a74319b9a2d62725bc16db312af8b04 |     
 powerpc64   | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/2a89642f4273b93d0494c6ac574fa93fc4e34d10 |     
   mips64    | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/97ddb884fff339ce1fc247a2337930bc50621511 |     
    arc      | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/cd4de3dbc84221df272f4bbdcbd279782e5f7290 |     
    sh4      | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/de88869908f745f383a79fd36bd6f2328fc8fab6 |     
   sh4eb     | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/a6e45ff3d1f46213517f51303230cb8f05368d80 |     
    sh4a     | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/85607f95637cb8829e71cfe6e5289a3e055865d9 |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/ad3808dfe1d99dfdda90a8695a3074c234fc638d |     
    i686     | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/736cc3a3a4a7e544308e38a3fd93dbce4d365916 |     
   armeb     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/af3021af42ffc4612a705ecca573879cbb046225 |     
  powerpc    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/4d0b5f23874bd55b76b7a904d199c05c4029a491 |     
   armeb     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/622d3358ae2d7cc17f56d9b39d39bb0e5fcfc02c |     
    or1k     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/210882507bfa1e414f3bda67d14ca1eceae22bc5 |     
    arm      |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/a421f1afd92bb13560f95b84d34b33792e58840f |     
    mips     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/d5c5f68d9ff0e0ab844d79e9086fe166f7c3d5bd |     
    i586     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/e5b69260b67ab7c8e6acb3454b5955f502112df4 |     
microblazeel |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/e1eaf3678bc0a34a03f0351f6d5496a092bb374a |     
    arc      |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/58dd7b4d56e6a4b7146d0d9c0c7c5aafba116df6 |     
 aarch64_be  |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/2bd0a02941e161d340215a9903d1c452f14348bd |     
    sh4a     | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/758c66961d10daee05c1d5ec88fefd77da8fc5f9 |     
  riscv32    | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/d224390c8635210313c79cae905a87bb7462c9c0 |     
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/27b66dbf19c679eb08a276c711c8ac541a1ad721 |     
   nios2     | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/0740be3fe941992228a2d36e2a9f6385c6a0f5df |     
   s390x     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/e42084e48d9f8825c836c2a19daea16e1c449c6f | ORPH
   s390x     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/e03b14fe9daa3698e244bb474d973e339eea79f0 | ORPH
    mips     |          gstd-0.14.0           | NOK | http://autobuild.buildroot.net/results/8cffe37b363c48a52e5db1650887883c3c4ee0ee | ORPH
    mips     |          gstd-0.14.0           | NOK | http://autobuild.buildroot.net/results/c58242b70940db9ddfa5344d4d265b740775e98f | ORPH
    arm      |          gstd-0.14.0           | NOK | http://autobuild.buildroot.net/results/4f7a6322932d0f9775d7ea602cf09a053981a43a | ORPH
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/e81187a5c20071aa534cd947ec50ea918cf047a2 |     
    i686     | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/05e87b1365c5d33c337c6ebe9466c095e96a13c6 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/3faa4478412557ff2830b065ec26f8e2e6ac7392 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ab0183d0858ccc2cfb5f391fbb30ae0e6a1f21bc |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/cac0cbd898af3e1ad736c2e86f32fee9225b5469 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/1ae0c628d0edce9f1a379d5ea7d95db77f7d1c2c |     
microblazeel |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/c0a93f37a59891096424e5d89218634be36fea81 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e5d531412e90fa5cff3c8ebc9a8480fd11bd2e42 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/7bc1ee5385b0cfe2ddc95b39a2546315485eb8f3 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ceba157665dedb9d9ca5160a64b6cd2a3e84bacc |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e7c89bea0f5f2bf504dfae84bd102c39e2b7094e |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/4a6a5ab2e4b28da768d011ac36f41feb2cac47a1 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/4f77aad88cb142f099435eb23ea008f83628d3cc |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/3f3772fb3501ef16bb14ec5fa3cd2b0092c2d79e |     
   x86_64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b9833a1830357ac1886eb8b7d91d8077cf1ebb5e |     
   armeb     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/dd31e46d35a04e385e6f9afa02eb9d16b0098654 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/5f7b975e3848db37daea01dd3d7f4a518a35be89 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/6f87c2ebed76f06230d8d8d08f4be2c643230223 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/5820db16d1129d4cb0ac7dcbca6ee8b90a0594fc |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/75fadca40832378cc52307997690cd9bb2d5f578 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d6f25e5f62b9bfece7fd37b2fc7791de9754f9dc |     
    arm      |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/78fe3a91737b2532caf80b4763fdaad5933eaa9d |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/c1d9ccc49dd3bfca72d8e547b11c8eca50a7e534 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/f08212a63ca560ad8029eb431ffe1780e115bc84 |     
powerpc64le  |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/888d19da1ea61930dfbaf2a80d1af2c09d7f7145 |     
  sparc64    |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/0a6b76819f9962d86f6b62b99e2fa015427c2a25 |     
 powerpc64   |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/67f24adb69c448f7be2c998bf9aa5dbe3bd50e3e |     
   nios2     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/56e5be5f241e04b49433250e59ea73a591bb9318 |     
   x86_64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/83556f21a04c062a9340cfcaea4aaa7ac53a8232 |     
powerpc64le  |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/0e01d4d28f2ccff057d2009510300104ca387876 |     
   x86_64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/740850df3e1831247386aa47148e530041c0a3ea |     
    arc      |     host-gcc-initial-9.4.0     | NOK | http://autobuild.buildroot.net/results/8a3f1aa37743cf9ab86a8ebe79ee949db6b373ac |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/20a68a1c7b9c98ff0ab9757162ebc9a04d2485c5 | ORPH
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/8217d1925180f619d4340805305210421f2f359b | ORPH
   mips64    |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/6e12597335b4bf9a7d252e4534a9b8596d6dd128 |     
    i586     |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/ca51d035aae0ebd8e3e92f4ea958ba07784381d7 |     
    arm      | host-google-breakpad-c85eb4... | NOK | http://autobuild.buildroot.net/results/c0c6640136a0568608fb64daddaf0f27c56acd33 |     
  mips64el   |        host-libcap-2.63        | NOK | http://autobuild.buildroot.net/results/10d8ca86d2e4c44ff458b68b637125625c0c9880 |     
  mips64el   |        host-libcap-2.63        | NOK | http://autobuild.buildroot.net/results/4d9d8f207535274c26664cd2d78147ab290d186f |     
  mips64el   |        host-libcap-2.63        | NOK | http://autobuild.buildroot.net/results/f85e6e007830a87651d9866b76ebf7fa740bf9a7 |     
    arm      |        host-libcap-2.63        | NOK | http://autobuild.buildroot.net/results/7c71a78c75a6dc5b117ecbe843d8874b7f07a30f |     
   s390x     |      host-nodejs-14.18.3       | NOK | http://autobuild.buildroot.net/results/d1f49b451b56e3cf6a97d27e8db5b85b0cb58ca9 |     
  riscv64    |       host-pahole-v1.23        | NOK | http://autobuild.buildroot.net/results/fda31e3f41826ba1b6b19b64627fdc09d7b4f401 |     
  powerpc    |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/83b8944f01d587190c9a1846ce79ae5a5651a989 |     
   x86_64    |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/c9d58581f8490d8b83ae0e038e63ea8538922ae9 |     
   x86_64    |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/bc5e00284417c2bb27232602f6b90a37b114953c |     
  powerpc    |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/0466fa16a1a9e49fbcd4ec5cf9acf323724aa6a3 |     
    arm      |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/56d52b54401eca07f39b5d03ab351f6a45108333 |     
    arc      |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/295fb36876a983a6347f8342a8cc0f4cc7991324 |     
  sparc64    |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/c227166c2825ae4e884936fbe627f3997e0e19b7 |     
    or1k     |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/b5fb9089eae0a7d1dc63a21f71bbf4402e52007a |     
  riscv64    |          json-c-0.15           | NOK | http://autobuild.buildroot.net/results/0ff7d67dafe4858cbdb6cb521f7b737f6b794d32 |     
    or1k     |          json-c-0.15           | NOK | http://autobuild.buildroot.net/results/b232e8b7c5d0b0546ba54c74d5c85619f9d4371f |     
  riscv32    | ktap-23bc7a4a94bd9e4e1b8b7c... | NOK | http://autobuild.buildroot.net/results/c886c60adc2cc57db865e7228b05e3b9222054a3 |     
   sparc     | ktap-23bc7a4a94bd9e4e1b8b7c... | NOK | http://autobuild.buildroot.net/results/67cca8d26b266b341b9e37cae6863864c14feb96 |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/2fce65c62b09125213a40e8a6c2668dae5e1f38f |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/055d10a832db7ed0767162d1afc69075e7ba6ced |     
  mips64el   |        libevent-2.1.12         | NOK | http://autobuild.buildroot.net/results/e63c5cb69b85765a6991770ec9b5dbdf622d3339 |     
    mips     |        libevent-2.1.12         | NOK | http://autobuild.buildroot.net/results/cdbfef2bb173674ced82588ec39e4b5f0aba5462 |     
  powerpc    |        libevent-2.1.12         | NOK | http://autobuild.buildroot.net/results/84f2f41ce048a742aacc41dd6821bb75ffb3cea0 |     
   armeb     |        libevent-2.1.12         | NOK | http://autobuild.buildroot.net/results/18084d3080a466e8aa5576a2c7135e9f8a81eea5 |     
 aarch64_be  |        libevent-2.1.12         | NOK | http://autobuild.buildroot.net/results/2855a58518691b8ea23670154bfae54b5411efce |     
  mips64el   |        libevent-2.1.12         | NOK | http://autobuild.buildroot.net/results/924d8723dbe156aac51c944a99d43c6d1ab077ae |     
    i686     |        libevent-2.1.12         | NOK | http://autobuild.buildroot.net/results/dd57608a5573cb74e3d3b2b4978eb28a5975e22b |     
  sparc64    |        libevent-2.1.12         | NOK | http://autobuild.buildroot.net/results/bcbae42451d967740bc232b2984233d8be7ea3eb |     
    i686     |        libevent-2.1.12         | NOK | http://autobuild.buildroot.net/results/831a405fed2b066999c3278b8af7e5380c8a7aff |     
   s390x     |        libevent-2.1.12         | NOK | http://autobuild.buildroot.net/results/e1b9f900a153e211072d2e1599e6a8f049fc0ea8 |     
    sh4a     |        libevent-2.1.12         | NOK | http://autobuild.buildroot.net/results/273f9aa354a08ef3af6140b8dec086408bf5d574 |     
   mipsel    |        libeXosip2-5.3.0        | NOK | http://autobuild.buildroot.net/results/f1f6384abe816b91307014e440872ac6a32aedcf |     
  powerpc    |        libeXosip2-5.3.0        | NOK | http://autobuild.buildroot.net/results/fea8e6397e52562b5af94874ae0c844cb6b9bdd0 |     
 powerpc64   |        libgcrypt-1.10.0        | NOK | http://autobuild.buildroot.net/results/43445863f6605c260c34626c89b5d302d6724684 | ORPH
    i686     |        libgcrypt-1.10.0        | NOK | http://autobuild.buildroot.net/results/2cca15de1f824b577fbe1add62b75a663f99ac6f | ORPH
  powerpc    |        libgcrypt-1.10.0        | NOK | http://autobuild.buildroot.net/results/7f37b2970cd9f142a59f7c12ebfdb0c134022931 | ORPH
   armeb     |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/f755e19d2d5c8dfe3b777f726b007d4cf98ef220 | ORPH
 powerpc64   |          libnss-3.77           | NOK | http://autobuild.buildroot.net/results/5be2f66f9be8e2d6de3be6e36bcca9f8580f3b61 |     
  aarch64    |          libnss-3.77           | NOK | http://autobuild.buildroot.net/results/4305cea1ae5bf47326fca4fb1e36aa7a553a0c16 |     
    or1k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/351129be90462019eabb092280b2055ea33ccbc4 |     
    or1k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/757df9c93e81cfa7a10c4c3659e1fad51717cfa7 |     
    m68k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/3e13548c911c1d0b238639a62d2d20e4923a89c1 |     
    arc      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/eb89dd21ae7251c3103ac538c3e9ff95c84d13e0 |     
    m68k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/23c66efd06ce76e128a12e931b178adb2cdb040d |     
    m68k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/ab75af1978a622087aaae83cfad663f9851d7820 |     
    arc      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/532f1596e1b54a8004d71cf59a37de52a29bdad9 |     
microblazeel |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/3c2793ba4474aaba1eb479ae469649e5dcbc8e9b |     
   sparc     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/84e2cbfe7e6f6e34138f4bc35dcc23a5ac50d021 |     
   arceb     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/c2a7b678d0c0882aa52e8e06350e4adfdaab726c |     
   sparc     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/9ddbbd126d651fe28ce8075e001f3685ddb6aec2 |     
 microblaze  |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/cc4e5ae89b455798bf2a62dd77426d06954014a3 |     
   sparc     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/dee788682c3a3435f4748d28383689b798a90218 |     
    mips     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/4a3952f867bb5d521a010aba1d4e4da1ca098f6b | ORPH
   mipsel    |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/14e414ec14d3beda5a964c603113795955bd807b | ORPH
    arc      |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/67dfd2a57cc8238f439e7f56acf158f61ee4b953 | ORPH
    i586     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/bca323b09e210c8576ec48b6f6e85d54f7045917 | ORPH
   mips64    |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/6781efb7aebe2d6f70d844f8e3d02057105e82d8 | ORPH
   mipsel    |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/a84e588408dee4081bb493b81525c55506c9d29d | ORPH
   x86_64    |         libsrtp-2.4.2          | NOK | http://autobuild.buildroot.net/results/cad54a1edf476a31f28d5e7da8c90b29aa6c5578 |     
  mips64el   |         libsrtp-2.4.2          | NOK | http://autobuild.buildroot.net/results/c346780ed664c9fe8c7112e4c256cfe8080a7af5 |     
  mips64el   |         libssh2-1.10.0         | NOK | http://autobuild.buildroot.net/results/71586902a58bcd982e1d8e133dbd21a60f34b720 |     
   sparc     |         libssh2-1.10.0         | NOK | http://autobuild.buildroot.net/results/e306395c86aac6abceefb7ab82d58afae378baa8 |     
    arm      |         libssh2-1.10.0         | NOK | http://autobuild.buildroot.net/results/a8e257b123dd91391f49c98cbb3496affc019042 |     
    mips     |  libtorrent-rasterbar-1.2.15   | NOK | http://autobuild.buildroot.net/results/d4b0203aab5adc58e4b4b17a85abeae9bd697edd |     
  riscv32    |  libtorrent-rasterbar-1.2.15   | NOK | http://autobuild.buildroot.net/results/f35efcb86f81d1d82e1928f63a57c972631cac3c |     
  mips64el   |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/a3d0373e575a02276de0085544e1ff37a0d789dd |     
  powerpc    |         libv4l-1.22.1          | NOK | http://autobuild.buildroot.net/results/8e258f43a4e7e70f1d08468097990f9965b53207 |     
    arc      |         libv4l-1.22.1          | NOK | http://autobuild.buildroot.net/results/9e9f2401aaad47a8beff5f537e3a4206472ddb24 |     
    i686     |         libv4l-1.22.1          | NOK | http://autobuild.buildroot.net/results/b7b2253ac902b441cc6ff12500b56bd15c413d71 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/e0c0e8b5f32a80f31d09f825d97490aa2772d841 |     
  mips64el   |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/4454c38d308dd28ca02a2c3b88624b7bf12e5c8d |     
 aarch64_be  |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/a9b95e7b9b5f543071d6ed4ef970a3029d8da9a2 |     
   xtensa    |        linknx-0.0.1.38         | NOK | http://autobuild.buildroot.net/results/ce5753193ec4518c75ee0ab9270b577397ca1c02 | ORPH
    sh4a     |      linux-5.10.104-cip3       | NOK | http://autobuild.buildroot.net/results/3602b8953af70356f8e475d86c890d7120ed8f9f | ORPH
microblazeel |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/5d13151bca8dd4d011efb7e4ff87498badefd378 | ORPH
    mips     |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/0682afb06a1616d944890702b2128c9836500460 | ORPH
 powerpc64   |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/00a6fea29039bc9bc3063a1fceeb44e1d7a1a1bc | ORPH
 microblaze  |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/1be4878d2d5f251a31e7c75a10f9a0f9d4eb1c4f | ORPH
   mips64    |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/540684047c70787a2a57c60b7591532cd51aadef | ORPH
    arc      |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/33f495d9fca5931bcc768d45ee7f23934788352a | ORPH
   s390x     |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/4d4a576f8bf1b710765f48eeab29e72d3dd43cac | ORPH
    arc      |  linux-headers-5.10.104-cip3   | NOK | http://autobuild.buildroot.net/results/428140ababedd35ac9cc020bf26652b7984efdd1 | ORPH
  powerpc    |  linux-headers-5.10.104-cip3   | NOK | http://autobuild.buildroot.net/results/f312333571f32873695d7316564b52c4735596d3 | ORPH
 microblaze  | linux-headers-5.10.104-cip3... | NOK | http://autobuild.buildroot.net/results/6e71fa1b9c1f21445bf6d0c53f8f9667202a8f54 | ORPH
   xtensa    |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/d4c3b24f65befc9197a32e4069286218ac634186 | ORPH
 microblaze  |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/29c973a5bd46939d99c81dfc98b95550aa8c05d9 | ORPH
    i686     |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/23b10d10776290b01a9a8fa67287d08171fa9dee | ORPH
    arc      |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/961f40bca95e3bb1b2b7151fcaedcba53c751dbd | ORPH
    mips     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/139a2b173da44e6d1ca401a9a4762787933bdaf5 | ORPH
  sparc64    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/8432b9176cd0bda05024dbaec18593ab4e1df9e4 | ORPH
  mips64el   |     ltp-testsuite-20220121     | NOK | http://autobuild.buildroot.net/results/06758dffb5a0e7cda9ecfc4c38bb22244b553533 |     
    or1k     |     ltp-testsuite-20220121     | NOK | http://autobuild.buildroot.net/results/8bd637d52cb27fd10fb8e2cd5c023615149c98b9 |     
  mips64el   |       lttng-tools-2.13.2       | NOK | http://autobuild.buildroot.net/results/940d2a46e588431b7fd8d0dbc8dc55853f52c1d7 |     
   x86_64    |         mesa3d-21.3.8          | NOK | http://autobuild.buildroot.net/results/e9a0c312e2b2c71fcd0e00cffdde4cd18c544e90 |     
  powerpc    |           musl-1.2.2           | NOK | http://autobuild.buildroot.net/results/ca1e1297f8fc5e682a49f95e55e8d44d25852b69 |     
   x86_64    |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/a33a8616f71e7a525fbcfd151c615c5088d0d23b |     
   x86_64    |         nodejs-14.18.3         | NOK | http://autobuild.buildroot.net/results/63102d82ffe91264347b06626991d55c0a4b5eee |     
   mipsel    |         nodejs-14.18.3         | NOK | http://autobuild.buildroot.net/results/ca105073c74bd37671b74b374f10644838e492f4 |     
    m68k     |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/9c4318301aa13137cbff420053b6eeecc2c7e584 | ORPH
 microblaze  |         numactl-2.0.14         | NOK | http://autobuild.buildroot.net/results/266f006bbde67c8f13477eb6973e6de993ab7b67 |     
   sparc     |         openobex-1.7.2         | NOK | http://autobuild.buildroot.net/results/5724865d2e32a4cfa207930d6f181d417d91fae9 |     
  riscv64    |            opensbi             | NOK | http://autobuild.buildroot.net/results/c8bbd73f180ab32b32a2acf463a1ba14bbfbd300 |     
   x86_64    | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/098c2eb1e19a55ce9965c4aa04f3389f98fa5c6f |     
  aarch64    |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/40f08c3180ba3a7be34642c704e2391bd35dfac5 | ORPH
    i686     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/8c14bfa6fc5101d05bfc926a47db2e6f415be967 |     
microblazeel |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/76a3dbe5ef56994066a70f3f8c84e2ba044d3476 |     
    arc      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/b6064fb3e967cdd7f7baa5dfb9a6c76afa08dd35 |     
microblazeel |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/57f4bac20319d3671062b07c2409d1ee4e857d6b |     
  powerpc    |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/e3077d373f48fab2cc4f767581bf9b16f1c383c3 |     
   sparc     |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/99d94b7f5ad344a701bc0453875ae38797f16ef8 |     
    mips     |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/5d2cc2464c07ba68f12ae271a9a5cae017cea19a |     
   mipsel    |     python-greenlet-1.1.2      | NOK | http://autobuild.buildroot.net/results/5c33e894e1a8e08392e90361988b40691f97d2d7 |     
   nios2     |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/1482acb3eb3af595978ce57e0b8ca7cd12dd8bbf |     
  sparc64    |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/d15d7d618916eda7bd40eb80f5f4f1e98de62db8 |     
  mips64el   |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/a707d8849b2f10242775df74af4bd0bcd358cf85 |     
powerpc64le  |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/a160cfdc9dfc036c4dc41af1c796f8838d91c573 |     
   mips64    |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/a3b9ce5abe59204fb48828fbcc9fc17cb5155315 |     
 powerpc64   |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/1d36206d3a52fb0396dad56f050150cedb74b987 |     
  mips64el   |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/ab24ee404851ed92ca1270a181c8410c62816c15 |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/025aec1a0b387b257d3abbf9ba349cba34127a9b |     
    or1k     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/6cd51fdced2974fae9e6efa775520b8b25ccda27 |     
  aarch64    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/6f928378502776fa69e27180385e4e73a9f94cc3 |     
    mips     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/2b917265f5ad590b86ce406264cca4aa391c2ce0 |     
   mips64    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/d5aa9acc709c7835b948cda7e65f7d8e116eadf2 |     
  riscv64    | rtl8188eu-903b6fcb821465fe9... | NOK | http://autobuild.buildroot.net/results/9ea060cc35e859ebc73c65fe2d1f7478f9b4fa8d |     
 microblaze  | rtl8723bu-19b4bdc05483a1e79... | NOK | http://autobuild.buildroot.net/results/64247bb0afc2b6b4c00a257b974fa9a396e43926 | ORPH
   arceb     | rtl8812au-aircrack-ng-3a640... | NOK | http://autobuild.buildroot.net/results/abf8ce5b7f191bb9cbc19e24f9a5eb29b1cea349 |     
   s390x     | rtl8821au-4235b0ec7d7220a63... | NOK | http://autobuild.buildroot.net/results/9a55831ed1a99cf1937e6c54d9cf52a0b3b7ae7c |     
  riscv64    |           ruby-3.1.0           | NOK | http://autobuild.buildroot.net/results/dc81c084764d64c28b9abed33aaffe729717b71a |     
    m68k     |         sg3_utils-1.47         | NOK | http://autobuild.buildroot.net/results/196c0c2f977653306bab72c2ca9b148cb67bc300 |     
 microblaze  |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/cb08fa978fcc845953bc2543568af3f1a232388d |     
 aarch64_be  |           shim-15.4            | NOK | http://autobuild.buildroot.net/results/d64c38a3ce8021bbc8afcba4a2eed8a78d462255 |     
   armeb     |           shim-15.4            | NOK | http://autobuild.buildroot.net/results/b4b5dfdd51f7bcca158e0423c78f86c3b17d1748 |     
 aarch64_be  |           shim-15.4            | NOK | http://autobuild.buildroot.net/results/21972d44e3704895eb2948bb74d1df34c29d59c0 |     
   armeb     |           shim-15.4            | NOK | http://autobuild.buildroot.net/results/a1f65a267233753024c13e95625d613e34d11f0e |     
    or1k     |        skalibs-2.10.0.3        | NOK | http://autobuild.buildroot.net/results/0e17451e17c7be4e3f867dab39a3b4722da1cb90 |     
    arm      | ti-sgx-km-cf7f48cb30abfd5df... | NOK | http://autobuild.buildroot.net/results/17e4da346d062570b9a84ab8eb1ce93c6d7384be |     
powerpc64le  |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.net/results/578cffdca995e5bb3edcf1feab28890c85ad7b75 |     
powerpc64le  |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.net/results/683d83b46f8051fccd7aed086682037ba43ad48e |     
   nios2     |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/466a485374e2cc4257edd6cae4e199bf248aa57e |     
   mips64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/c74f942740e6f542654b40444b51fb327ed2b73d |     
   nios2     |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/c1e80861fab29f32ec27a93530cb0dba90b4dd57 |     
   nios2     |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/a221fe9707c82e8b34c5c1ae060df5c9b0f78a08 |     
   mips64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/0c032a58ac0bf388499c0f6c3210db822df5e860 |     
   mipsel    |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/3702af75bd8d5d74c83e10fe828ef0d2afbd54a6 |     
    arm      |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/fe1254c7330ab1e678a1dc25a6e28136aadc3de2 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/74495ff2c0fcffb8859ac61a8604153b120a5107 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/39897ab8df013f276c7313cf29ff5f408ebb049e |     
   arceb     |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/47bae259ccee3ab71623f32be9e81f3d94aa3e89 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/a0482f847f9c8ff82af508ff04768c49d7741e70 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/f4777961a3787a31c96bf8b4e1e350226476e6a9 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/3e45653dfedf2ddd90f45db37224c230da8cbad0 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/021668532c7d15ad40c4adc43fa2ab39bd55717d |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/654cd0944cbdb3f5c3c02a9117e4ea0b0996da05 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/f6c74882de9d4db38dc8468b31c15111cf789ccf |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/36cbe46e11913deeb3cb9759ab83bb6194b97bf9 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/bd456389a937faeb09cb07be7e1249538529e38f |     
    arc      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/6a23ba34e8aac821af6fbe9fa041f4e93dd4a089 |     
    mips     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/08ffe36804cf0fb36b3d5b32540303d9342b4129 |     
 powerpc64   | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/5042ee79f47c2d6dd59f692b6620f2c4e572b262 |     
   xtensa    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/87da7cfc7515a19ebf20e6dffaf443d2fabf8901 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/8017528d905fc1aa6105491c9b4957f924bc62ef |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/33192a9c76f8ef60471fc81b804bad8500073775 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/6717ad218072977862d927cbb33d5f9a81ba948a |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/10770de992fd348a2ebdee3d8077a02526b5f8dd |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/a5b7e0c3f779283c9a5ff1298ceceeee82e835f4 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/e85a11c98a2de3faa2a9c2f535cc0b5c35e648d8 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/ca792d99433a8486b12cf696aef0860478f84115 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/115ad43bbe92de15b8ce1ac8b4db5d996e98514d |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/760a4eeb5bdf5a2a3bc7aefa04e7692b7da1a80e |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/1de2759db47eca5abaff5c1d7549d721bc4d5fd8 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/11513bd817a0c410470ec16afacfc9131340f1f4 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/557e9e156d98d8cf92f7f4a714ba8fce38ec87df |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/509d1e5e9e067ecc7005c303995dcd40a6411ae0 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/f57f140ab51cd4c281139cc2ff871cb13612b301 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/71160c06b0959eb1c7d099127caae087db3c7d37 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/6f6359bc28fa05592d52b8b738885a83801f58b2 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/1c46106648ee597f2164898a3943c7ca08d50739 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/f774f6409469be90af72ac5dbdd7b2d5e207f03b |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/642441584f0507d100fd293ed4216ed26ef05f20 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/c1927c5d7e7c49d959dc15c38356cd1fee072d91 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/1be930f2a9e19e4c680709be3192c0f934c480b7 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/f16c350ced56beb157b79b2669b158123f907eae |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/74a60db3dead40fafbf2455681659632e4029423 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/b665087a9b354d455118395259bee2110137870f |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/e7acc2e6e06bba42598e6b499f3322fb5f93016c |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/8f7b5e50e3c0a98a8c6af4e75090f159b4e7cf08 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/16d000861d6afba00dfb82868653c004fd13ff73 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/7430b9376d4f025d080feb11c725512bb1163e59 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/0f7683957623baa33dc072ea88698ef81c051d61 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/eb38fdfa0f91c0f92026f136046ef111c3f0b249 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/649634e589126975f788e9e92345318bbec18f88 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/e0057060ce91e1ef11d6699ead246a5bc34daf7d |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/5258cc2dc2606203b6c724676f77b5ea40a8ecad |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/c9520ff49ac7321780a3d0b63e719f280affb5ac |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/e5ecc7709a91659c4ea81e3fcdef24e19ccc8406 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/ac4df46ef5c5ae27bc071664e95b31010d1d725b |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/6eadd85f52c4d635cacbe72d0a03c33349e267bb |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/661868cf556938f8e1e05d33b4f91facac23f858 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/b915c9d91ac6b645dcc4cf4c755c220c72289b6a |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/ff970f481f75e652bf677226d85fc69ee8af6da9 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/16c6f715d11b00790b9621f883b8447d42bf15fb |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/a915e050ccdc2b1c9c5fde6d17245c0936a731a5 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/d9b980ea2b8a65f58919a018a1fea739db894c93 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/f1c80304f779f026fedf60ef3b1bb46e63b34100 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/c74b27364890512242a11068300a121ba631313a |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/b7194b15e7d80e3cad745414118caa926847d06f |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/92b23c30c653dcd3f30fc4db28c95e49a1689553 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/40b8aa0c19917f64c3f272f5479068e7631ffcc3 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/6505bc2929c9553730ae4ed4f6c47ccd39a6756a |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/d3e21603790b44c1739fd45ce90fd8cbdccf8be7 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/6eef062b0c84d732dddbf03ca23c840918f5d850 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/03a4b50af55bccfbb235c0452d1503944b501913 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/fc48a39f421aef8bfee7ebccb8fb2be1c3121531 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/9537c79c6d3e7c0b360124e5cd9e9d998f2789b2 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/a8c15481cbbf572d9554f5ae41872a2a9cd8acc1 |     
   sh4aeb    |            unknown             | NOK | http://autobuild.buildroot.net/results/760be94953fe23b54c4512ad3f50952ce3139604 |     
    sh4a     |            unknown             | NOK | http://autobuild.buildroot.net/results/136f2bf461914953f9645c8764f1d5cbf3d0b9c0 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/dd281a1e647fef9bb09cc43e4381c480e958c214 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/4b990c9cf0e0b444050e6209fd41010b9db4da4b |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/85e64bcdd960e28b4c89601b04caa9caff7c095f |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/5700219be474d41523740849997f407ffb6776c7 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/f0e1718d7613c5aa186b2e7d025e8d21415e93e4 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/6a4ad39303205caf67cea5c3701ea1c609480eb1 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/b109cbb9fc3037a33eeaadcb9771dcf9c7bc4c15 |     
   mips64    |        valgrind-3.18.1         | NOK | http://autobuild.buildroot.net/results/b0a6be0bc69c0c4d142903dbf86dd0868d4ba697 | ORPH
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/756a07f6205db3c35089b04551dee41bf38ecc44 |     
    arm      |         wolfssl-5.2.0          | NOK | http://autobuild.buildroot.net/results/929082b3d3c8efb31eca4091d310dd2ddab396e6 |     
powerpc64le  |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/2d0943d69a9d662326665b27b8db3efbb577daf3 |     
    i686     | x264-35417dcd65a57321fbadf9... | NOK | http://autobuild.buildroot.net/results/690ca6eec221405bc5b9b7a9a2b44c4d3f4ab541 |     
microblazeel |            xenomai             | NOK | http://autobuild.buildroot.net/results/2feed7ef70493353b5317fe4909f03ef0249caac |     
    mips     |            xenomai             | NOK | http://autobuild.buildroot.net/results/1f64caa92576f5d94367896d368c60b294882b0f |     
   s390x     |            xenomai             | NOK | http://autobuild.buildroot.net/results/22e3385b754c63f0ad62c6284e8d125d679a2f08 |     
    i686     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/e2be0820c3e2363bd9650e44e4cbcc54f5c7bc76 |     
   nios2     |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/ef06fc2c1b6ed472fc91b78b160f63dfd3a81ab4 |     
    sh4a     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/428919229275bf1a12ac06255537147a9c073d87 |     
    or1k     |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/ca618dde69bbc1aaddd8ede4512180148777bf8a |     
  powerpc    |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/30e035269c44448fe07ac357ff52bb4fc3ea42c6 |     
   sparc     |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/2fcd0e23a65e257935bd205ed7a92a00523f4a77 |     
   x86_64    |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/c65be16b7a2e00c65110d30ddd5632548397551e |     
    arm      |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/d870b9c171b594fe615c2372174e2b7711152a49 |     
    arc      |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/cd1c60e58132e3f0ff98875b3856e76189dac6a4 |     
   sparc     |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/17309224fca025f8c864452a8dfd42a8251e103b |     
  mips64el   |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/9429917baf78d96cf6cc9f82353e5fa4cd49626d |     
    arm      |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/cf478381a494783fc9fd6b7155a2733630e3f107 |     
    mips     |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/de0fd789c272785e049b0c9b8a33898b0c7f7290 |     
   xtensa    |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/263d55b7dff56d6290e6834238d7bd9ddd273bf5 |     
   armeb     |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/fc311b31c275338789aceecaafb1658f83e39fc9 |     
   sparc     |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/eecbe3abd169fda152f3c567de5b39c180ed9f2c |     
  powerpc    |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/0aea4e2009f82c076e1dd734a495c0188abcc160 |     
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/a450c451659ddf11dd0bdeeca399613706956cd8 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/348359fbe3dc89f5a15b11a6c473588e0e6ee65a | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/f8447d50fe41d5615c98dad1e7a7a4dc7edf80d2 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/f5ae0f56fd9c622c7ebdeea24ce9fdfe6592362b | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/4854b360c826bc5e5ef6aa72217b69271d4b8c19 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/4ca1c83beb954c7074126a329a4a923241e8161d | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/af93bdf451a2aabc7df61e520910bf6a87d70d7a | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/329ae22acba3e88a2b5e5849ed0b70e3f111c8b0 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/1530aa8c136e35049387ab0f28eb93aff811fab8 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/246ed0fdfd4ecce3d42e70cd919593285423fa16 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/fc7f6713ec21dfa96bd8202855ffe0bab4e6e961 | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

tvheadend-1295dd2be863f5beb... | 4 
             host-pahole-v1.23 | 2 
                 wavemon-0.9.4 | 2 
                    bat-0.19.0 | 1 
                  exempi-2.6.1 | 1 
           host-nodejs-14.18.3 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/f8653de73738cc4ffb2c68c9ecb90ba67bc31583 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/f1c4ded3dfd972e673cd67b6f289d37cb00a6569 |     
   mipsel    |      host-nodejs-14.18.3       | NOK | http://autobuild.buildroot.net/results/1477ca6e8ef7066acecf40fb3d40e153c644532b |     
   sparc     |       host-pahole-v1.23        | NOK | http://autobuild.buildroot.net/results/d392d94acb4a009f2a40782de83cebe4a3691d3c |     
   mipsel    |       host-pahole-v1.23        | NOK | http://autobuild.buildroot.net/results/f1b790b2cbd045b5425f88cb8acf1b24977164c9 |     
  powerpc    | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/711cca66b0dd1d99462269c70b15c262793e3356 |     
microblazeel | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/edabb37af1736272378b1bc94998e2569e6281d1 |     
   x86_64    | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/12d4dae6e8e36b42e2200739ac03a4ee003e5a07 |     
    arm      | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/9ac8218c9f438de2718044b1931115134c3ec7e2 |     
   sparc     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/4491ae212e717e2e9052c4b6b5bf285bb55e6d4a |     
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/43c5e0de7b311eb73713948e7df002c4ca6805a2 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
