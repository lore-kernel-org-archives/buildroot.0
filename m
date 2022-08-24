Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D142C00140
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 05:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7DBD606C6;
	Wed, 24 Aug 2022 05:45:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7DBD606C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vrpqppEE6Th7; Wed, 24 Aug 2022 05:45:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43578606F5;
	Wed, 24 Aug 2022 05:45:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43578606F5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C02E51BF955
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 05:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 59947606F5
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 05:45:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59947606F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KBo3JTNPGZ9D for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 05:45:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF04B606C6
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DF04B606C6
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 05:45:38 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D8DB6100004
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 05:45:35 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 24 Aug 2022 05:45:35 -0000
Message-Id: <20220824054542.59947606F5@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1661319936; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Yp+dYBvHxKZRdfYVki726WCa/+4SzVR4gpmSvZpdtYI=;
 b=W4KW0muKfI9NRggSVt8FstaJdydGAbIuhGX46GgacJy0KHHjh5QqavAGX1qijE7C2/RNyt
 C+IxOt+QmB20Kn9hCUL3CNRFI75iBihA065RQvAUHPPJwyyzKh6CooZNnLkQGT1oxGDb7v
 DgB1N1X0AjQyNwnFCbJyDWtuk5NpQwrxZasdlCkfcqtkXAj/5nCl3EbtVnMfnPlhpghBip
 AihT/f5n+ttyrQO7snOu6M9SljbB8xiskpCgwL3YinSk2JTX/OKw5vPfiIYkwLA+sr5tu7
 iNAHdYve7ac5pKQ009BLNUITPmAdrTg7ggQF2sgxKPZzVgzYYN4oiEHL4vZfYw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=W4KW0muK
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-08-23
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

Autobuild statistics for 2022-08-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 11  |  3  |  0  | 14  |
  2022.05.x  | 36  | 29  |  0  | 65  |
    master   | 222 | 322 |  1  | 545 |

Classification of failures by reason for master
-----------------------------------------------

                    wipe-2.3.1 | 25
                   thttpd-2.29 | 20
                host-go-1.18.5 | 13
host-pahole-73383b3a39afe86... | 12
                 uclibc-1.0.42 | 12
                speexdsp-1.2.1 | 11
              host-rust-1.62.0 | 10
                 linux-5.17.15 | 10
                gerbera-1.10.0 | 9 
glibc-2.35-134-gb6aade18a7e... | 9 
                   speex-1.2.1 | 8 
dahdi-linux-5c840cf43838e06... | 7 
  gobject-introspection-1.70.0 | 6 
                 pixman-0.40.0 | 6 
       linux-5.10.109-cip5-rt4 | 5 
                       unknown | 5 
                     aufs-util | 4 
                    brltty-6.4 | 4 
                 dash-0.5.11.5 | 4 
               libglib2-2.72.3 | 4 
ulog-0389d243352255f6182326... | 4 
       freeradius-server-3.2.0 | 3 
                     frr-8.2.2 | 3 
             libgpg-error-1.45 | 3 
             libopenssl-1.1.1q | 3 
   openvmtools-11.3.5-18557794 | 3 
                   perl-5.34.1 | 3 
                    zeek-4.1.1 | 3 
     arm-trusted-firmware-v2.7 | 2 
                    bat-0.19.0 | 2 
                  boost-1.79.0 | 2 
           crucible-2022.05.25 | 2 
                elfutils-0.186 | 2 
          host-elf2flt-2021.08 | 2 
         host-gcc-final-11.3.0 | 2 
host-google-breakpad-c85eb4... | 2 
                ipmiutil-3.1.8 | 2 
               libcap-ng-0.8.3 | 2 
              libgcrypt-1.10.1 | 2 
                nodejs-16.16.0 | 2 
                    qemu-7.0.0 | 2 
                tealdeer-1.5.0 | 2 
toolchain-external-codescap... | 2 
                 wavemon-0.9.4 | 2 
                xenomai-3.0.10 | 2 
/home/buildroot/autobuild/i... | 1 
                  acpid-2.0.33 | 1 
               apcupsd-3.14.14 | 1 
                  bind-9.16.31 | 1 
                  cjson-1.7.15 | 1 
                 coreutils-9.1 | 1 
            cppcms-2.0.0-beta2 | 1 
              dieharder-3.31.1 | 1 
           docker-cli-20.10.17 | 1 
        edk2-edk2-stable202102 | 1 
             f2fs-tools-1.15.0 | 1 
                 fdk-aac-2.0.2 | 1 
                  ffmpeg-4.4.2 | 1 
             fontconfig-2.13.1 | 1 
       freeradius-client-1.1.7 | 1 
fs/ubi/ubi.mk:51: /home/tho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
             gdk-pixbuf-2.42.8 | 1 
          gitlab-runner-14.5.1 | 1 
                     gmp-6.2.1 | 1 
         gobject-introspection | 1 
                       gsl-2.6 | 1 
gummiboot-2bcd919c681c952eb... | 1 
              host-delve-1.8.0 | 1 
         host-gcc-final-12.1.0 | 1 
host-spirv-llvm-translator-... | 1 
                   hwloc-2.7.0 | 1 
                jailhouse-0.12 | 1 
              jpeg-turbo-2.1.3 | 1 
                   json-c-0.16 | 1 
                libcurl-7.84.0 | 1 
               libdeflate-1.12 | 1 
                libglvnd-1.4.0 | 1 
                libmdbx-0.11.8 | 1 
          libmicrohttpd-0.9.75 | 1 
                 libsigc-3.0.7 | 1 
             libtorrent-0.13.8 | 1 
   libtorrent-rasterbar-1.2.15 | 1 
           linux-5.10.115-cip7 | 1 
               lpc32xxcdl-2.11 | 1 
        ltp-testsuite-20220527 | 1 
          lua-cqueues-20200726 | 1 
                   luvi-2.13.0 | 1 
                 mesa3d-22.1.6 | 1 
                  mxs-bootlets | 1 
         mxs-bootlets-10.12.01 | 1 
                   ncurses-6.1 | 1 
                   neon-0.32.2 | 1 
                  netsurf-3.10 | 1 
                  ntp-4.2.8p15 | 1 
            ocf-linux-20120127 | 1 
              open62541-v1.3.2 | 1 
                 openssh-9.0p1 | 1 
                    parted-3.4 | 1 
                     php-8.1.9 | 1 
               pipewire-0.3.56 | 1 
               poppler-21.12.0 | 1 
                rocksdb-6.20.3 | 1 
rtl8189es-39c17661136da48f8... | 1 
rtl8723ds-76146e85847beb242... | 1 
rtl8812au-aircrack-ng-4ab07... | 1 
rtl8821au-4235b0ec7d7220a63... | 1 
             stress-ng-0.13.05 | 1 
                 sudo-1.9.11p2 | 1 
toolchain-external-codescap... | 1 
           uboot-tools-2021.07 | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
                    vnstat-2.8 | 1 
                    xen-4.14.4 | 1 
                  xxhash-0.8.1 | 1 
                  zabbix-5.4.9 | 1 
                  zeromq-4.3.4 | 1 
                 zlib-ng-2.0.6 | 1 
                    zstd-1.5.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/4ebe5f6a68f2649a9e54abd728ee96954e991903 |     
  mips64el   |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/a1d1b1cf16cb9cb0f9f0df377244c618ed629264 | ORPH
   arceb     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/0285d386ef6169f6e46b785125c275355397a340 |     
 aarch64_be  |   arm-trusted-firmware-v2.7    | NOK | http://autobuild.buildroot.net/results/61714cd0260d91bc400e1e50573629e0f99cd732 |     
 aarch64_be  |   arm-trusted-firmware-v2.7    | NOK | http://autobuild.buildroot.net/results/236fac2df499ff3e506bea9b63de6fbe0f74858e |     
 aarch64_be  |           aufs-util            | NOK | http://autobuild.buildroot.net/results/c5827ed592b70d32c32270c33cf71082ba0bacca |     
 powerpc64   |           aufs-util            | NOK | http://autobuild.buildroot.net/results/f39770a59d9aedbb393a36a16e307da5c26efdc6 |     
microblazeel |           aufs-util            | NOK | http://autobuild.buildroot.net/results/facaf61004a2e20f650d8da081920ae5959816c1 |     
   arceb     |           aufs-util            | NOK | http://autobuild.buildroot.net/results/bd600d6f385f07dd3adb6405f1c2a27bd739cab7 |     
   armeb     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/04655d2acdfba749c4434375635f46b270bd7ac0 |     
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/e327955b03fa896a4d6e19a2dce38235adc7a921 |     
    sh4a     |          bind-9.16.31          | NOK | http://autobuild.buildroot.net/results/2f1432bdf3441032884216635f5f41bf7cba27b1 | ORPH
    arc      |          boost-1.79.0          | NOK | http://autobuild.buildroot.net/results/4c922b712c44521c2a056b8dac7a45b8e149b5b7 |     
   sparc     |          boost-1.79.0          | NOK | http://autobuild.buildroot.net/results/07002a999b4507a7459149c01572ca02b1da9fab |     
    mips     |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/a3c8fc4850407b3b0b4cc24829de424a3cd1f7a5 |     
   mipsel    |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/df59d59fb694b9871fb4417e738919baed5df0e5 |     
microblazeel |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/6e270dc4eeb84f782e422f8d851275f5430e11f3 |     
microblazeel |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/fe80572d467ae8e399a31d031155ec46fff26434 |     
  riscv64    |          cjson-1.7.15          | NOK | http://autobuild.buildroot.net/results/e804b18f04c876fad332a2cf890820a502dfee33 |     
   sh4eb     |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/bc15787bcca0041f26a992abe5273b387307c505 | ORPH
    or1k     |       cppcms-2.0.0-beta2       | NOK | http://autobuild.buildroot.net/results/2aab9d396a71927e7b35b2d9cf197b1888652ce5 | ORPH
powerpc64le  |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/4a458b1661667b5c480da7a1f49c38df7ec1d194 |     
powerpc64le  |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/65bbc62235b24405917a0958cb152395df0a97e1 |     
   nios2     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/5fa6a315c73079caf8acd9b0fe74fac543c5949e |     
   arceb     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/9692a9cbb4eebcff54d4885b5c9a184ead6ee01d |     
   arceb     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/d9dc5c3d4ae2ec35cc4bf70f30ea6bdff81ee03e |     
   arceb     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/d67d2c257c7f96d867e08d87966dc939d6cbb654 |     
   x86_64    | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/1cb17114c5f6df326923d318ab3ab91f2e6bf529 |     
    i686     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/6a0a52b7229a8d8917c1e349d42bf6c8fbef7a6e |     
    arc      | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/b52998d46f12d2880b078f6750e0386099a2d5e3 |     
 aarch64_be  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/2edc98eff4b7a27a526d96a8ee55f97ff57ae5fe | ORPH
   s390x     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/0d444f1edd0d2938c77d0dddc69ade585ba3e183 | ORPH
microblazeel |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/62796b26d9cd350f168237158e2ef57e035bb62b | ORPH
   sh4aeb    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/0c98e319cf1a7652d073988bd28261c02330bbd5 | ORPH
 microblaze  |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/2ef01486e32c0ae9aae0d4abe0ed2e44f0336492 |     
   x86_64    |      docker-cli-20.10.17       | NOK | http://autobuild.buildroot.net/results/eed2a9f04f267020e494b87e46c5eb720a384805 |     
   x86_64    |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/d17f4b4d510eef26b26cef5128a321214a0f3a4e |     
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/03e62c15d74eb16368688b6bd0c6934b210b171f | ORPH
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/e9024b88fa76a2da88b68924c146ec750b33f7b1 | ORPH
    or1k     |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/7dd11ec94e67ecd1967b9b76b79d03ccba42d6c5 |     
    i686     |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/e165991b0c445b5feb6cad68d131ce1fea46105d |     
powerpc64le  |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/cb904208512895b7078281397f61603025b45546 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/a48d89d934d81f6622a03d8486604c28606ba861 | ORPH
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/f7332b565d4003c9ccb267100be22ec3114ba366 |     
microblazeel |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/a174dc40b2fb34a4bdfd8ce0e26d41a562e9b7b2 |     
 aarch64_be  |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/37f1800bffc25a137ba7740e60e3a7175ab3ba62 |     
   s390x     |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/c8df444f4c39f83e254dbb642a5852a1c956f7bb |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/e40d1bbfd93ff17b225f218c0c8f85afed3af25b |     
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/d2784685f4512579435638984312d144aaf2152d |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/3d6fa32395e89b31f11a7ce89194eda654115358 |     
  sparc64    | fs/ubi/ubi.mk:51: /home/tho... | NOK | http://autobuild.buildroot.net/results/fefdd2dd2a331f4c3c8d3dfee2dea4ad5a892f20 |     
  riscv32    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/6ee9ff7d49fb919c25a0338ae6edf86fddc9c1d6 |     
   mips64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/441a9b4ac495b4e11bc0369a9e2b2b1045061199 |     
  mips64el   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/a2ee357b38f43c0a11f3c35e2a65adec73a976a4 |     
   sh4aeb    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/6ce4eb5d6d3c303b94bdf7034df2f7aec4af5a5b |     
   armeb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/d79ddbf3f27a2276ae7134bf720bd0238a71cc99 |     
    arm      | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/32c4626820fc97194a4407bc648b9b854fddadea |     
    or1k     | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/19f746aa6fa93bd5d8952d433d96f77919251200 |     
   mips64    |       gdk-pixbuf-2.42.8        | NOK | http://autobuild.buildroot.net/results/1f7c93cae901052801469aa003318ee95f5b71d1 | ORPH
    i686     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/07beb4439ce24d95c4dcf816efcae9dac655d4da |     
   mips64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/ec494ef40cd29f6d6ce57cd12eb4b10f322b89ec |     
   nios2     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/458ecb246246bc18958a4c36e117f2f7aad30c12 |     
  riscv32    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/aeef76b539b246bd18880277f43f08e5ea09cb70 |     
   xtensa    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/649f52d38c217aafdf9dbc5104af14c48d2c245d |     
  aarch64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/28ada038a9766f9fb5561c625ddbfbc70ceef5f3 |     
   arceb     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/c0435b19cf3c305eab88a73295cbf7677c3fb96b |     
 aarch64_be  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/17790768bf5183acb469d26fa16f227f47a1e132 |     
   xtensa    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/7c3683a6360c5781c04db28976fc8bec45e1b93c |     
    arm      |      gitlab-runner-14.5.1      | NOK | http://autobuild.buildroot.net/results/5c00b376efd6295bd7aac5e305bb7e34f62033fd |     
  riscv32    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/c1890c570019ada4bfef1f5ddcff27f6cfb819ae |     
   nios2     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/0bfd755e6aef3ecdf361795920f2fd8e4126083c |     
   nios2     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/e0378d3d9d40ce1a1819b6f46bfdf7f947ae4356 |     
 powerpc64   | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/bd105855e30ca23fde8526ad98ead7cdb2ac26df |     
   mipsel    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/246d6389c5f05ef08d786f3244f257c9bb62b24d |     
    or1k     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/f317cba37b7cd970c876337f156a87522d2a3cf5 |     
   nios2     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/19df04362d53fdb5366ccb6eb3c9b46af42c2524 |     
    sh4a     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/853289b50a2b22ae0d17213f6a2ed52021bc0a07 |     
microblazeel | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/02435aff012d6ff86ef9fc2d60333ba589462dd4 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/188ef450eaaf9bc8d9af42b3a3643df12b4194fe | ORPH
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/b88a55690b56369d8eca9670555552d937eb7912 |     
   nios2     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/4fbb974d3cb2439868137e0fc3044e4c00b82598 | ORPH
 microblaze  |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/82f817a702f8b80cbb80bc8b419528a743c9a4cb | ORPH
   s390x     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/a36968ebda3272d75a962f98111b4d3f9147aed8 | ORPH
   s390x     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/9d2851a5270660f9654d86425273fc4a53490b28 | ORPH
  sparc64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/a47a9d3e4d5b130698453b33407fccaac354702d | ORPH
    or1k     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/98b51b549412ba2f6b4ca0decda6869df74e03d1 | ORPH
  powerpc    |            gsl-2.6             | NOK | http://autobuild.buildroot.net/results/e640dd20cad5daef5fcf4ffbf7d36c54720fdfb1 | ORPH
    i686     | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/04a4b699501c10edc92d95a2f5e1293da3f54585 |     
    arm      |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/ec0653dcaa4c8cef004987afffed3444433a4b51 |     
  riscv64    |      host-elf2flt-2021.08      | NOK | http://autobuild.buildroot.net/results/2bdc9010810fc03eb0867bb1255d8c32c449d428 | ORPH
  riscv64    |      host-elf2flt-2021.08      | NOK | http://autobuild.buildroot.net/results/7015e2c39867acf3c7313fc01ea1e57bbda3664b | ORPH
microblazeel |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/4510bda9650b36103416abe7c23ed2dfb592c6e4 |     
   arceb     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/0d2fc0ed07e7b64f716f2fe033c61c7b896356ff |     
 powerpc64   |     host-gcc-final-12.1.0      | NOK | http://autobuild.buildroot.net/results/795d23ec30ab4842ba0f00749c6b41f3fdfdb386 |     
  mips64el   |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/a61f85b347228363a18926680dc7afa8cfbb8a1a |     
powerpc64le  |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/e934d51a0c71df79c5e7f615aa7964c28a706222 |     
powerpc64le  |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/e1c71b73e1fc807433afa50f0924bc67e6973401 |     
    i586     |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/b71e92544601721c42bfd6d69cccccac69a26095 |     
   mips64    |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/63f2af77382ea47a51849083c18c33a5a6476b83 |     
  mips64el   |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/fd79953d3d1e7c734764cc4eaaa31303d82cb56f |     
  mips64el   |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/ea035b6757d13503cc56eebcc55ec5d5975a3850 |     
powerpc64le  |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/1d9f6bd529efbda104101f3d4b6c12f831751623 |     
  mips64el   |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/f11d5284d9443a034bf45fd9d8fb5dbf970bdb27 |     
  mips64el   |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/08d228648ae67acf9da039217ef024e8cdd4fa5d |     
powerpc64le  |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/c6474b8795eebfea58cc3759b5d1e4b83903dac0 |     
  mips64el   |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/03d8f16bfd6fd1d6c841ae5a3b892dc26eeb055c |     
  mips64el   |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/c98e10166d187dbe9ecc91928b61a9a8ae36cffc |     
    arm      | host-google-breakpad-c85eb4... | NOK | http://autobuild.buildroot.net/results/f403f2c722c26826ea83037bedd116a9edae2ab6 |     
    arm      | host-google-breakpad-c85eb4... | NOK | http://autobuild.buildroot.net/results/88ea8ca255abc200872b154a8c7f281dd2b54411 |     
    arc      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/2615b6a6394d5701a813505ea0bd5c8375d0b254 |     
 aarch64_be  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/129e055f51dedc26a88cce6bbc7d6ef5987c52bd |     
   mips64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/0e962caf5d0074cf91a86d46aa9609b1b23d7387 |     
 powerpc64   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/f23cbeb2e96d54dfa161d55f6c217f4dabbd6c39 |     
   x86_64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/81574d7d05e029da09eebe738e715f603e9170bc |     
 microblaze  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/8f2b63e60b61b6c7bc616e93ec3e297236019c9a |     
   arceb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/46796e800ec39215b08fcaba5bc1ff05c1e6f42a |     
   nios2     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/5ee03cda7e2b6a1d8f6312ffda78433100600977 |     
 aarch64_be  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/279b4e7a6a74a9b54f5960bd6994c73dc3664b67 |     
  aarch64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/cef9222c9680117efcdf5c36b877b2fbfb69c69f |     
    arm      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/5d9af7882b297852c982f45f654ecab876e56716 |     
  sparc64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/cad082c1a97b10f5a4b607783ec3caca558501a4 |     
   s390x     |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/3e83eca28eb7c6749d0eb45f06be5fb6135d0126 |     
   x86_64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/a10aa8305a4376525b9d39b7af3d5c996478e064 |     
    i686     |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/6c77c80140cf866ac98941ff1308da9236a3bb6f |     
  aarch64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/4d9f35e3c5b420f58e90bdf8388b7af1e037479f |     
   s390x     |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/69709dc3ab1b0a8c123eea46a105dd538ecec6cd |     
   s390x     |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/b8c4a88ecfe614a74918e2c1fbe590ce897e810e |     
    mips     |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/abf7e05d68f0a3d50529eb5c9b9c2573e4e0d97a |     
   x86_64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/2c873ee73256688c550d69d5fee045acffe49067 |     
    arm      |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/dd077c5cadcaba097132be71ab91f97cc27300fc |     
    arm      |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/ea436bce63bc0b7af16523dadbb1119ae1902aa6 |     
  riscv32    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/20cd6840c1afdc7571d23217babd45a61f2913f9 | ORPH
   x86_64    |          hwloc-2.7.0           | NOK | http://autobuild.buildroot.net/results/3ac8906ba2037db35480c421dbfeb937c38d37b6 |     
   x86_64    |         ipmiutil-3.1.8         | NOK | http://autobuild.buildroot.net/results/d64aa8fe32f56304998759404eb4e3007beba9f2 |     
   x86_64    |         ipmiutil-3.1.8         | NOK | http://autobuild.buildroot.net/results/631fd4af2605810c49b206069c7fc601cd4d2f16 |     
   x86_64    |         jailhouse-0.12         | NOK | http://autobuild.buildroot.net/results/844039d3d6480d3898c8490f6d0d3da3a706347b |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/244258e4d86c6ec6710abe5afed7258bc6aed90b |     
    or1k     |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/04530b2f76011817fc8b64378513b440d2f0239e |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/c277b5765e7d53f244b05084dfbc3c3b65c2c1fe |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/9c6fa6d92804c301eeaab7119ac834bcbcb408f5 |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/74d481fab8fa57016711aaaff638b7b1d5bfbdb9 |     
  aarch64    |        libdeflate-1.12         | NOK | http://autobuild.buildroot.net/results/1888e266484d1c696723418b73208be470557ac2 |     
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/43c367f1dc8f5a567e8b3f9c4f8ce1f31a4018ef | ORPH
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/ceb44e6ce2703be188e2b59a908cce2b5df14b73 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/de4e355ba6a128154115bae7b745ad6009afb3ed |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/038ecc02790f2b752bd70e82010c0e74843efec2 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/d50f6d43b3a792c606c0be2ab9681cdcb714b510 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/55b98fdf03cbf6473c4199b993a685a37753abdc |     
   mipsel    |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/74a6986c6a4993f626d52dc2b654adc789e09b30 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/0c594c97f399501983c5c05caaf231f5b83507c3 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/46e7cb9451dc334d559bc6f84b5362b5ab8acf94 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/1f237f58f99d67b36e3dba2b7a285133902dffe1 | ORPH
 microblaze  |         libmdbx-0.11.8         | NOK | http://autobuild.buildroot.net/results/2574cf2c6c54f87225180b5444dbf19813491f19 |     
   xtensa    |      libmicrohttpd-0.9.75      | NOK | http://autobuild.buildroot.net/results/0e8929abbfb9d1f74c490abf5569f3a043c87396 |     
   sparc     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/e62f330e01f4a3270fb4750086b4b6d13df7f599 |     
   sparc     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/8fe50fc17332ac28d35b12b6d58699a51258f96a |     
    m68k     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/df37f6d5bf7ddb3776255a590a3bc8eeef1fbd36 |     
    m68k     |         libsigc-3.0.7          | NOK | http://autobuild.buildroot.net/results/edf062a325cbcb3cf94783c2a3a52ab3f4903e52 | ORPH
  aarch64    |       libtorrent-0.13.8        | NOK | http://autobuild.buildroot.net/results/e07f633694af1d5e985cef3179a031ba3e365127 | ORPH
 aarch64_be  |  libtorrent-rasterbar-1.2.15   | NOK | http://autobuild.buildroot.net/results/6ed0982e3c490810562d12385fa3e3cdbbebb198 |     
   sparc     |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/44c56adfdffcc7104b0f106595d97c16ff4680f7 | ORPH
   nios2     |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/318735418937cbaccf716e183ca57f7398bc8323 | ORPH
  powerpc    |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/4dc1bdfa438531849bfbac5f57ed9103eb1741f9 | ORPH
   mipsel    |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/fbd6269fd8fc0a02833fde6e000d1b55d7cb4240 | ORPH
  mips64el   |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/97ef64210dc0a74a2c11efe2e4f2cd15d3163690 | ORPH
    m68k     |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/57767d5de9bd702f722b75523c421454c37082ae | ORPH
 powerpc64   |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/3fcc92bdb0b5014882988f6d2c43cc1fdb87d0aa | ORPH
   mips64    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/537336e2a8083c0e224d40b07a42a8d210a0eb10 | ORPH
  riscv32    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/6b743c4335565b715442b2896d0088cbfd8dc2b7 | ORPH
  powerpc    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/d8bb858d788beb7e072f4ccdf2fddcc3a1beffa3 | ORPH
    m68k     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/4bd22a961db58f5bb3c869f518925e5a9a7f7aac | ORPH
   mips64    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/01715e981c55dcca5dc502bf64a5b62d84604e4e | ORPH
 microblaze  |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/8f7b65f4de3b97af20596b58de2fd5abe449dc93 | ORPH
   mipsel    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/1920d55b974c22f965e2f00bdbc04b64343eb722 | ORPH
   sparc     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/bba96773a53336a5275663d9e064d301c52e7baf | ORPH
    arm      |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/b733928adcde435d207fa81566c609ecc338c2e0 | ORPH
   armeb     |        lpc32xxcdl-2.11         | NOK | http://autobuild.buildroot.net/results/2edb8f69ce1776b6488052c46fb853f88bd1d8d4 | ORPH
   mips64    |     ltp-testsuite-20220527     | NOK | http://autobuild.buildroot.net/results/22bc8cfddcdcd66570be109c232ae48f7a419d6a |     
   sh4eb     |      lua-cqueues-20200726      | NOK | http://autobuild.buildroot.net/results/ded25f4a275511e0b6718593f7fc4bf5670aacdc |     
 aarch64_be  |          luvi-2.13.0           | NOK | http://autobuild.buildroot.net/results/321f84d0183c7ca68d155791d49708ffbf824d6f |     
   x86_64    |         mesa3d-22.1.6          | NOK | http://autobuild.buildroot.net/results/9d0a0e3f105493f2af3d50039adeae8f3a71c96f |     
    arm      |          mxs-bootlets          | NOK | http://autobuild.buildroot.net/results/dcbeb73d152c79c18b1fa3bef3b4fa07635d7b36 |     
    arm      |     mxs-bootlets-10.12.01      | NOK | http://autobuild.buildroot.net/results/d925d76c62056f0e731d34e01f228cc05a2cf62e | ORPH
    arc      |          ncurses-6.1           | NOK | http://autobuild.buildroot.net/results/7e9b0062adde48b2681025012002dd49d1d6f5b4 | ORPH
  riscv64    |          neon-0.32.2           | NOK | http://autobuild.buildroot.net/results/df99eebe3e8b02f267033ea2f8a7a0fa9427ba6e | ORPH
   x86_64    |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/da1a60e57ec0836bcd9b8603f8f1f365708c8720 |     
   x86_64    |         nodejs-16.16.0         | NOK | http://autobuild.buildroot.net/results/74124f72dd69d77a7a633d4cf20a537b1387e046 |     
    i586     |         nodejs-16.16.0         | NOK | http://autobuild.buildroot.net/results/f4e21bf50e21cd4fc45103fcbd67dfaed3da488e |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/88fa426827f2db0308803d1b6556d46687a7a79d | ORPH
 microblaze  |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/4043961b61496f63cd81814f74a4911b278feb70 | ORPH
   nios2     |        open62541-v1.3.2        | NOK | http://autobuild.buildroot.net/results/c5bacef26b244b49a5e817ace656b24c519a6b3f | ORPH
    m68k     |         openssh-9.0p1          | NOK | http://autobuild.buildroot.net/results/26b9dc5ab7737a012fac3eb828a1ab21ed9604aa | ORPH
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/48645031ba3228e8d21e768c3735206049876df4 |     
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/40ac8c5aa0060963a85048ce3f3bbab9e1c199a1 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/102ff6bd03cc900ff2a889cd139df3cd40a1773c |     
   arceb     |           parted-3.4           | NOK | http://autobuild.buildroot.net/results/67e712cf65d3c8f1e7d5204ecfce878ac3060f53 |     
    arm      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/953982a4420031c478d7f11898fcc27a72a69eb9 |     
  aarch64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/5ddb415081d5043de270d3ea3e6c98540858af3c |     
  aarch64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/c1b90314bed02b1433b68abfed327054b9f33716 |     
 microblaze  |           php-8.1.9            | NOK | http://autobuild.buildroot.net/results/0e916bcf52f5f5eee7448cc74f252c5bc2cb1586 |     
    sh4a     |        pipewire-0.3.56         | NOK | http://autobuild.buildroot.net/results/bc3a4bc8224bb97670178237cc2ab053b6dc0296 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/d150a567c51c31838ee0089206affdda4f002c8a |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/9ec39b1314b01bf642846b0e209d712ec68d82e1 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/4738eb84d253f45366a50754af07455f11a4ccf1 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/700c7f7ce1e8021f14edba6603e3384abfab1690 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/e2c2b671e128c2c5470fc06d74ef5ee30d6c1b70 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/7e270c59fa76f3eb99d846763ce258c8900de8eb |     
   xtensa    |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/09fd138f18bae27fa98cfd5ee4da666175daedb6 |     
    mips     |           qemu-7.0.0           | NOK | http://autobuild.buildroot.net/results/7e31a83dcd34e57b687017be57378309f3237b4e |     
    mips     |           qemu-7.0.0           | NOK | http://autobuild.buildroot.net/results/e112675833bb758ac6792c6216901f21fb244248 |     
 powerpc64   |         rocksdb-6.20.3         | NOK | http://autobuild.buildroot.net/results/5bed0f4173dd1a7623d3d3c02e5c0955b7ec8ab8 |     
    or1k     | rtl8189es-39c17661136da48f8... | NOK | http://autobuild.buildroot.net/results/5392dc5ac22469f740d7398f2f0064d8cc783617 |     
 microblaze  | rtl8723ds-76146e85847beb242... | NOK | http://autobuild.buildroot.net/results/1a583790b5b7331c3f4366fc0c5cdbabb3f3b6a7 |     
microblazeel | rtl8812au-aircrack-ng-4ab07... | NOK | http://autobuild.buildroot.net/results/4c428e53661d5fb361e61464ba1de51a56016664 |     
   armeb     | rtl8821au-4235b0ec7d7220a63... | NOK | http://autobuild.buildroot.net/results/5e2c31057b4e1cbd21d3b34de48f485aedb454ed |     
    sh4a     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/2e6693cae90213340a574849e1ac4cca94625557 | ORPH
    i686     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/f7dcc8286819eb02309e6fecb5ab78c2c115d444 | ORPH
   mipsel    |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/2ceb3bbf6877c84a334e03bc1dd088146933ebd7 | ORPH
microblazeel |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/09812c91552b1f7ccbc6dc075665fe819ba2d4d0 | ORPH
   armeb     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/30f980e0103e76b22acb48eafc0af69842354627 | ORPH
    mips     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/ab160fed756d1ad3b2735e5fb695af1a778d0eff | ORPH
    m68k     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/7b44372e5e33c89ead6ffae15ae42196f4827318 | ORPH
 powerpc64   |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/345d780e6fa79f12acb966ec402d0fb1b4b3f199 | ORPH
    sh4      |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/29c21e368239d110593a456c8c60e4ff31f649e6 | ORPH
   x86_64    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/e9449626e017aa2d47fb7f0eabc2861196dea0ca | ORPH
   nios2     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/25a2b8b6668a0959516dc694e4545297569729df | ORPH
    mips     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/7f7d0fb092cc23cd60953794faed02991b719a5d | ORPH
   sparc     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/36927166985b6f91ae29de332fbe149c7740490e | ORPH
   armeb     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/f093e18568b52dd9fcc81f9d10ea303cc849677a | ORPH
 aarch64_be  |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/04e6f4413c3fdf4eb2035af7538a535b54a44c78 | ORPH
    arc      |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/54d1685504838ea7c3ce5297763cd28a80660929 | ORPH
  sparc64    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/264b0938b0ca00b334c5e0e06868ada8418f2c2c | ORPH
   mips64    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/a6f8323df14ddf7c9a1ef4b2c742156c6100279f | ORPH
   s390x     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/dc178ed212d95254e4321df01a86dcd96fdcf76e | ORPH
   sparc     |       stress-ng-0.13.05        | NOK | http://autobuild.buildroot.net/results/1cd9bac13f496dc3bd9923b61acf4cfe5610f8dc |     
   sparc     |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/4f69f077c2259e2f34a1d569ed44a1c19464df53 | ORPH
  sparc64    |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/837968f11f0486a6714787ec55e3b9d25e534f78 |     
  powerpc    |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/d27e17a85082ec01ba0d5735f158f8fbccaa8219 |     
    sh4a     |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/3b5567b3e231935f5b8f6a828ca5bf0c4f63e53c | ORPH
    mips     |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/57715e10a0df770f4e4ac7e6712036b53371817b | ORPH
   x86_64    |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/0707524860eaa3e67b0ca4d8b98b5f539da91e5c | ORPH
   x86_64    |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/453baed9c356c3e50f45d78a65cf2858ab916449 | ORPH
   mipsel    |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/4fe7759b8ac21d137638b6f2e229bec64e6ce1d0 | ORPH
   s390x     |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/8df60ef7f0760d30e8ee6c0ff50833623f48c767 | ORPH
   mips64    |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/a55b6edd2f2cfa14640f783e9392cba317643d9e | ORPH
 powerpc64   |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/cc04ddb2e9bf3b6482c0d5d549ba728507fe252f | ORPH
  mips64el   |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/07ec160693ec12632355f1dc68880b6ff4bbc629 | ORPH
   mipsel    |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/db4cc8f38b8fa96a2be356f6fc3fffcde19f5349 | ORPH
    or1k     |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/084627739f4e7ccaf9658209ba9ab6d626158e67 | ORPH
   sparc     |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/ee53f699de5e797897a92b2105212e133bdcdc0b | ORPH
   mips64    |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/088fd48216a8d4c53f6752d36edded3854ecc667 | ORPH
   armeb     |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/6a9308fe69cab8e43450cfcf4ce13ebe9aae366c | ORPH
   sparc     |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/9f24b5622c89998bdc80c3de8c1257a17867dd82 | ORPH
    arm      |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/64aedfbc87c087a22bccbe9e197d5139b4dfd103 | ORPH
    i686     |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/2e6d2dbb13ad76e3f9c7598f2c139269ff890700 | ORPH
   mips64    |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/102f4d1a657bf5552654ed2cca35cc1c6e68b608 | ORPH
powerpc64le  |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/afc9f01925bfb234d7b9957d5f9cbab75116db54 | ORPH
    sh4      |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/b1ff79d59c09fa10005ecc1e837798cab7007dc3 | ORPH
  mips64el   | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/07f1584fc9b68910ed88ea0eb3830ff96b65ffdd | ORPH
  mips64el   | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/155934b61e901aa1e15eedaff0e336a5fe5551ea | ORPH
   mips64    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/3045c03ab296fb763c48fc7c9c6f986753fd7d62 | ORPH
 powerpc64   |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/0a19b8d29dd823d1e970c77a5fa2d14bb30898e6 |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/45b4ce958d9e6bee1defc5daa8178b434832f2d3 |     
    arc      |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/14dbbd0b62ca085b0e66b3e6f038285fc06f12b0 |     
   xtensa    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/cec8b56c5e8cf6dea37cc21807aeb623d3b4a010 |     
   xtensa    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/5dd9d51553469b2ebfd2756a3afb24306d8cc070 |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/77a93e6449f4d043aec545ef7d05dec5265f5dc6 |     
   xtensa    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/ccaf3561200c190c19981791a68b3a37b01faf83 |     
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/5f42712e30fc423a7185b809c531430f07408fea |     
   xtensa    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/42857d4ce84937f8c28e1996011554f5b096ba37 |     
   xtensa    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/bf0d84a16395655f7320a20b3b78180ac0ceb5f9 |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/38cca2ddd2ec990a70b1c56e332b659d0c72390e |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/4a6884c8c7585d22f333046470fa4f6cf706c602 |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/4534336513f6e63b8787b3db4e1ea674b0573133 |     
   sh4aeb    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/99bb64e7a023c870aeee3eadf0c6964ede33e7a4 |     
   x86_64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/0850709d0102a5b872e9277cc737724a9109536e |     
  riscv64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/e1bc2c9e606ffbecdd1f26f1be8934d2277d9330 |     
 microblaze  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/e9f2680b8dcb15a79d2801b55b8bd2e192c5204f |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/8eb4fc3912f9309eb433e6e42ea3c369dd282383 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/7f672d5994430a77b6191c02f329347d1d34a1d5 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/f32a618d7d40695bac217e864016e4ca5eac9b8c |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/18e7934dd0e011bf37283ff83b542b85ea59c06f |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/e9b3f2048f73bf1faa9991b86d4c21b3c40f593a |     
  aarch64    | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/c3238c16ba095e0b7336925db22b2347e36a3c82 |     
powerpc64le  |           vnstat-2.8           | NOK | http://autobuild.buildroot.net/results/6d2ee211a5a32688237e649d788fc9f79a42f74e |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/06a21ceeca5cb1ed932b77e02118af73e31ea9a7 |     
   s390x     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/e5747b04ea04a92ca588cee67dcedd0c122344de |     
   armeb     |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/950567147e704ed49238123c91dd6786eb8cdf48 | ORPH
    m68k     |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/fb71b6cbffc76dc6b32d53adf094454e14378788 | ORPH
   mipsel    |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/92ab786b2f9cd962b16c088638b1e103cda26112 | ORPH
    arm      |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/1fdfe1412da9e9de4e65f0282a0ef95f988db558 | ORPH
   xtensa    |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/401ef42a06966cee66665b7fbf4bb8009f426ac0 | ORPH
    i686     |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/a873dc9daaf1aaa33dc366603a993bfac3875fb4 | ORPH
microblazeel |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/a3a532868edf3dae710fb8d86347a719fbbf050e | ORPH
  riscv32    |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/ac5190042990943542c46917d490d45941498167 | ORPH
   armeb     |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/b586cbf00fc1f50a3110e424904cba203819877b | ORPH
   nios2     |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/178f8b5b41a8f6cbf1229e106b54edb79756c81b | ORPH
   arceb     |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/3d9409cd77d902c7a4e4388718e9dfc47c3ed6d4 | ORPH
   xtensa    |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/7f24e812a4a1acf59a991d17eaf0e5559230664e | ORPH
    arm      |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/75622418ba580f5bcfc88450a22dcb58cef7fcad | ORPH
    arm      |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/7f0f0be817ebdfecc84cf40d29133ed381c267d4 | ORPH
   arceb     |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/4287295728c5941e1b161a43f3056a371eb90a12 | ORPH
   s390x     |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/12672982e67d3aace99c2d66e2f1617948d38599 | ORPH
  sparc64    |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/a5069bd6cb81a9097b85bb76af1da4dd5a72ed9b | ORPH
powerpc64le  |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/4742dc03a5e87dc1ce8f118a6af2257df4e46167 | ORPH
 aarch64_be  |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/a3594c8f9dcd2675fdf73488246fcf6855ee2b1d | ORPH
microblazeel |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/6552ab2dccc26b9ba5653ece7bf7594f48887ea3 | ORPH
    arm      |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/2b776ff5ba45da54ac72b1e5bc127c1eb16ea7ae | ORPH
  riscv64    |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/aff1316c91280e876d35719811cde6bb784638fb | ORPH
  riscv32    |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/c1bcf2d782b5330ad38818b269dbcde15d8dc56d | ORPH
   mips64    |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/77d7dfe757d460f8d3a9701b535922d2dcabcd71 | ORPH
   s390x     |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/f43a6c79382505acfc6abc1b7027534b40eb65dd | ORPH
  aarch64    |           xen-4.14.4           | NOK | http://autobuild.buildroot.net/results/e72af986f61d6264aae1d748e32d2966de7b743e |     
    m68k     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/7623fbe820bede480b1e646b5ed0f8f264890026 |     
   sh4eb     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/62dac1abe447391c0932522a3230ed613d393c1a |     
  riscv32    |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/04e2160ebf489961a8af007d5dbe9a7ac65b1475 | ORPH
   mipsel    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/d8e50506170ea2f781d8c0a033d5e042c9ec5877 |     
 powerpc64   |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/047ff9dd48ad60bd97b9416e39a2d051699c0021 |     
   xtensa    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/47a531b8b9bf049d4f7d7e0c9eca6c898f8db9cf |     
    arc      |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/2995fa4f3a865ffcc458ed43f92cbfcca0d63006 |     
  aarch64    |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/a50e1bd5d5bce84607857b731bf8cedd56d71c9f |     
  riscv64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/5ca1fdb017fa84777e3bbad4ddef8b852a5d8dd0 | ORPH
microblazeel |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/dccf4275304779b9cebbb060b831bf77470d9174 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                    bat-0.19.0 | 1 
           libfreeimage-3.18.0 | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/951245414ff36cda25c0e6a7cb5ed532216962a7 |     
   x86_64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/1de21d0d72fe464a94a14ed56b71cdc75fc7fb17 |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/6b5079afc997adc603da43b7dd23241620b5e5d3 |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

                       unknown | 3 
host-pahole-73383b3a39afe86... | 2 
       linux-5.10.109-cip5-rt4 | 2 
                     refpolicy | 2 
/home/buildroot/autobuild/i... | 1 
           docker-cli-20.10.14 | 1 
                     frr-8.2.2 | 1 
glibc-2.35-134-gb6aade18a7e... | 1 
                gnu-efi-3.0.10 | 1 
                   gstd-0.14.0 | 1 
              host-delve-1.8.0 | 1 
          host-gcc-final-9.4.0 | 1 
                host-go-1.18.3 | 1 
                libmdbx-0.11.8 | 1 
                nodejs-16.16.0 | 1 
                openjpeg-2.5.0 | 1 
               openpgm-5-3-128 | 1 
                 pixman-0.40.0 | 1 
               protobuf-3.20.1 | 1 
                 uclibc-1.0.41 | 1 
               valgrind-3.19.0 | 1 
                       xenomai | 1 
                xenomai-custom | 1 
                    zstd-1.5.2 | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/01e6675749a851c6e470f6358e8a553516d5fc42 |     
    i686     |      docker-cli-20.10.14       | NOK | http://autobuild.buildroot.net/results/cb0239285ab826a2816cd717d849553c2d7d1543 |     
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/1953a53440e594156c6a37ce96ec0bfde7a03a16 |     
   nios2     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/4c98a91edce9886200bd906089cf764a37f3b56d |     
    arm      |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/c41dbc36bf5bc157a460654539cd65a3caff4d5a |     
microblazeel |          gstd-0.14.0           | NOK | http://autobuild.buildroot.net/results/0eba794b3ecd0c6b4ef1a29f02c3bc37d5613644 | ORPH
    arm      |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/cb8312d4b8880fc6d6a0ffe4c3f7521a08fed724 |     
 powerpc64   |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/97766ed6761e6896271008730a7cd23dcfc343ae |     
   mips64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/c40c6669865ca45aed2222a8b96922b79e349e41 |     
    arc      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/2afc0ea3ff596b687f2729c49055872e35ace50f |     
 powerpc64   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/6388367c6b463f6937049262b75f64fb4210aa2a |     
 microblaze  |         libmdbx-0.11.8         | NOK | http://autobuild.buildroot.net/results/218ba3b41e58f322fc0d08881bdcf982a2b606cc |     
 microblaze  |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/a984eb2631fbaed34b06b37a5d1061891613294b | ORPH
 aarch64_be  |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/c68ec94deb046ab85a431d6a42584c8fc72d4fd7 | ORPH
   x86_64    |         nodejs-16.16.0         | NOK | http://autobuild.buildroot.net/results/704eaf6ffc6b8d5a74031606282e3a03a304ae05 |     
    i686     |         openjpeg-2.5.0         | NOK | http://autobuild.buildroot.net/results/cbd4da8027ce190c0da54ad13ddd83f1990bb6ff |     
    sh4      |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/d910aba6ba30dcac7c0deee073b326d126b33169 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/f80d97b8cb92ccb893e0b1f27ea3627243ccb29f |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/211f6ef3b6ce61976660049a9585a41b84d3fd8b |     
  mips64el   |           refpolicy            | NOK | http://autobuild.buildroot.net/results/03d6978ff699d0d85549672f8f8f3b0fa6ce2d27 |     
    or1k     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/1e041f182600fa732cfadb794631f5fee871a423 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/8239526f7dbd0f817ea409d69e574099e314dcc2 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/45ea1651b30d34c24edc59a6cecc0f5dfa7762c1 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/b85af0146dd718e9855baac82baa525c48d59051 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/07f1f860d9eccec55650fb19d6bc89b24b216e88 |     
   mipsel    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/02a7d97b5dc3d8f068314c62d6ee230e40c87a13 | ORPH
   s390x     |            xenomai             | NOK | http://autobuild.buildroot.net/results/d5ccb56ecd2a288c52b8aecf98b0360577cef30e |     
  riscv32    |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/71447eff1c4001048c7662345cc702ad8650460c |     
 microblaze  |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/1302fa2099706881079fb346b74da7d69502f3cb |     


Gitlab CI results for 2022-08-23
================================


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
