Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E1EC433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Apr 2022 04:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9104C60D56;
	Sat,  9 Apr 2022 04:39:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t48dDkmzetgA; Sat,  9 Apr 2022 04:39:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1800660AA7;
	Sat,  9 Apr 2022 04:39:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 43C0D1BF276
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 04:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 32E5B84307
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 04:39:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K5SONsgWDPzD for <buildroot@lists.busybox.net>;
 Sat,  9 Apr 2022 04:39:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF51784303
 for <buildroot@buildroot.org>; Sat,  9 Apr 2022 04:39:43 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 15B41240002
 for <buildroot@buildroot.org>; Sat,  9 Apr 2022 04:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649479181; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qEmBuvQ/ObupzGnZpzpLKA5cLMQGJI8HvUVxbVxFqfw=;
 b=TrB18XzExgAYpzIXGFliWDRW1jcJUseZxwL+WdTwaB/qrOUDOMl2Iyd7DVNFbDTLSqYC4T
 nwjARDagoIgdzqse4O+u6n6bDGfm+c1osgGiuOakvhO0MPOa104mD0zVm6g/KCDZGmjDp6
 HUL9XJsMgQ9AaVnxq2sWVISVYjtG4tAaMfAQSvSN4SbNHYYBVY0W6b/IfAuPUvUX/mnCOc
 Ch2+sIqT70T5+FqB5v3DCH60jGAJKWDRzPzb0seQeN6194R2lKxLIhUbVVQ9YY8hmV13o/
 GwyILrGv3uY8JDS0EETfOZcDzya6FEe076g0dEeIhVU2DFavDTvoEArj5/bOJg==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 09 Apr 2022 04:39:40 -0000
Message-Id: <20220409043947.32E5B84307@smtp1.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-04-08
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

Autobuild statistics for 2022-04-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 17  |  4  |  0  | 21  |
    master   | 224 | 470 |  1  | 695 |

Classification of failures by reason for master
-----------------------------------------------

            host-binutils-2.32 | 35
          host-util-linux-2.38 | 34
                 dhcp-4.4.2-P1 | 24
         host-gcc-final-10.3.0 | 22
             libopenssl-1.1.1n | 18
                 uclibc-1.0.40 | 17
           argp-standalone-1.3 | 16
host-elf2flt-7e33f28df198c4... | 14
              fetchmail-6.4.29 | 12
                    git-2.31.1 | 12
                 zlib-ng-2.0.6 | 11
                libressl-3.4.3 | 10
          host-gcc-final-9.4.0 | 7 
                 linux-5.15.30 | 7 
                elfutils-0.186 | 5 
glibc-2.34-109-gd64b08d5ba7... | 5 
                   perl-5.34.1 | 5 
                python3-3.10.2 | 5 
                     refpolicy | 5 
                       unknown | 5 
       host-gcc-initial-10.3.0 | 4 
         linux-headers-5.15.30 | 4 
            qpid-proton-0.35.0 | 4 
toolchain-external-bootlin-... | 4 
               util-linux-2.38 | 4 
               aircrack-ng-1.6 | 3 
                    azmq-1.0.3 | 3 
                    belr-4.4.8 | 3 
                  cairo-1.16.0 | 3 
                 dash-0.5.11.5 | 3 
host-gdb-arc-2020.09-releas... | 3 
              libeXosip2-5.3.0 | 3 
              libgcrypt-1.10.0 | 3 
               libglib2-2.70.4 | 3 
              libuhttpd-3.14.1 | 3 
   linux-headers-5.10.104-cip3 | 3 
linux-headers-5.10.104-cip3... | 3 
    toolchain-external-bootlin | 3 
                   uacme-1.7.1 | 3 
                    vde2-2.3.2 | 3 
                  acpid-2.0.33 | 2 
               arptables-0.0.5 | 2 
atest-895b0183a89c15f5e2305... | 2 
                     aufs-util | 2 
                    bat-0.19.0 | 2 
                   expat-2.4.7 | 2 
       freeradius-client-1.1.7 | 2 
                     frr-8.2.2 | 2 
fs/ext2/ext2.mk:65: /nvmeda... | 2 
       gst1-plugins-bad-1.20.1 | 2 
         host-gcc-final-11.2.0 | 2 
                host-go-1.17.8 | 2 
               libcap-ng-0.8.3 | 2 
             libgpg-error-1.42 | 2 
                  libnspr-4.33 | 2 
                   linux-tools | 2 
                 minizip-3.0.5 | 2 
                    mpd-0.23.6 | 2 
                nodejs-14.18.3 | 2 
rtl8723bs-11ab92d8ccd71c80f... | 2 
toolchain-external-codescap... | 2 
               valgrind-3.18.1 | 2 
                    vlc-3.0.16 | 2 
                    4th-3.64.0 | 1 
                acpitool-0.5.1 | 1 
               apcupsd-3.14.14 | 1 
                arp-scan-1.9.7 | 1 
                  assimp-5.2.1 | 1 
             batman-adv-2021.4 | 1 
                bitcoin-0.21.2 | 1 
                  boinc-7.18.1 | 1 
                    brltty-6.4 | 1 
            btrfs-progs-5.16.2 | 1 
              bubblewrap-0.6.1 | 1 
                  cc-tool-0.27 | 1 
                clamav-0.103.5 | 1 
                  dhcpdump-1.8 | 1 
                 diffutils-3.8 | 1 
                 dmalloc-5.6.5 | 1 
           docker-cli-20.10.14 | 1 
              dropbear-2020.81 | 1 
                 duktape-2.7.0 | 1 
              e2fsprogs-1.46.5 | 1 
               erofs-utils-1.4 | 1 
                flannel-0.14.0 | 1 
              fluidsynth-2.2.6 | 1 
fs/cramfs/cramfs.mk:46: /nv... | 1 
fs/ext2/ext2.mk:65: /home/a... | 1 
fs/ext2/ext2.mk:65: /home/a... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /home/a... | 1 
fs/f2fs/f2fs.mk:64: /home/a... | 1 
fs/f2fs/f2fs.mk:64: /home/a... | 1 
fs/f2fs/f2fs.mk:64: /home/a... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/ubi/ubi.mk:51: /nvmedata... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                gnu-efi-3.0.10 | 1 
         gobject-introspection | 1 
google-breakpad-7515ab13768... | 1 
       host-gcc-initial-11.2.0 | 1 
        host-gcc-initial-9.4.0 | 1 
              host-rust-1.58.1 | 1 
                 host-wine-6.0 | 1 
                  hostapd-2.10 | 1 
                   hwloc-2.7.0 | 1 
            igh-ethercat-1.5.2 | 1 
                  janet-1.19.2 | 1 
               libdcadec-0.2.0 | 1 
              libdvdread-6.1.2 | 1 
                  libest-3.2.0 | 1 
               libgpgme-1.16.0 | 1 
               libiscsi-1.19.0 | 1 
                  libnfc-1.8.0 | 1 
                   libnl-3.5.0 | 1 
                   libnss-3.76 | 1 
               liboping-1.10.0 | 1 
              libosmium-2.17.3 | 1 
                  libsepol-3.3 | 1 
                  liburing-2.1 | 1 
               libvorbis-1.3.7 | 1 
                    musl-1.2.2 | 1 
                netdata-1.21.1 | 1 
                numactl-2.0.14 | 1 
            ocf-linux-20120127 | 1 
               openpgm-5-3-128 | 1 
               php-apcu-5.1.20 | 1 
                 pixman-0.40.0 | 1 
polkit-a2bf5c9c83b6ae46cbd5... | 1 
            python-ujson-4.2.0 | 1 
            quickjs-2021-03-27 | 1 
                      rauc-1.6 | 1 
                   rsync-3.2.3 | 1 
rtl8188eu-60cb0b5a3cfc95e3f... | 1 
rtl8812au-aircrack-ng-3a640... | 1 
               sdl2_ttf-2.0.18 | 1 
              skalibs-2.10.0.3 | 1 
                  stunnel-5.60 | 1 
                 systemd-250.4 | 1 
toolchain-external-codescap... | 1 
               trousers-0.3.15 | 1 
ulog-0389d243352255f6182326... | 1 
                 wavemon-0.9.4 | 1 
           wpa_supplicant-2.10 | 1 
                       xenomai | 1 
                xenomai-3.0.10 | 1 
                xenomai-custom | 1 
               xfsprogs-5.14.2 | 1 
             zynaddsubfx-3.0.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |           4th-3.64.0           | NOK | http://autobuild.buildroot.net/results/a12c47f0935d9ba647fcf4fb816a863088ee47f9 |     
   mips64    |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/b71a57f60b74c0229ffbb26b1112bf866157b269 | ORPH
   mips64    |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/9de51b06766ba337acbf7b8d45bfcbbb3c7cb9da | ORPH
   mips64    |         acpitool-0.5.1         | NOK | http://autobuild.buildroot.net/results/bc97a2c008c2fbd56a95d426bdf44525b7ef8848 |     
   mipsel    |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/eb28edda2847830b9760eaa9cc62f79cf6171cd7 |     
    or1k     |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/9f280e34cbc0711cbb24f167a5fd2bd6a7ce20f8 |     
   sparc     |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/12539fc9215cf01faa0c6438ccf2f045cf0ae55a |     
   arceb     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/07cf98bf49396d54d9e4716baf3d01396e32f0f7 |     
   xtensa    |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/fdb49d399959582ec63d9d8deb695f1174b1f5da |     
   mipsel    |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/e1b9c8abef7a61346716fdcd24922ef4659360fe |     
   x86_64    |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/d10c06109332456ffd22f2d1831c8699f6cf270c |     
   xtensa    |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/2a7622b4c7ccc221696000c9d6c997463d6fd831 |     
    i586     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/fa69a4464314491993b81422e0aa0ac2b8e6bcb6 |     
 microblaze  |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/aa564043284becc3dd28b56b4032cccc59b81e1d |     
   sparc     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/9fbe2d58e73a4a8b4fa5c95dd03f185f979b27d1 |     
microblazeel |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/5d7e6fce0f8084585b1a045f438c3824a1361b00 |     
microblazeel |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/956ce334952c84e12002c0ac8c5ee7dcad8aa8fe |     
  powerpc    |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/5f7b274422cc01aa7beeed716f0cbdb6b2081eec |     
   x86_64    |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/28f53cc86873e0ea8e13439efd5ecea7dfe3ac54 |     
    m68k     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/9b116551408945d43f249e315edad8733012c035 |     
   sparc     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/b9b663e5f68c07a8a103948ac2ff51e2e23e8d39 |     
   arceb     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/53a120343a9b00b8748ede5a032f44507b8bccf8 |     
   sparc     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/29481a6ffb389c0d1a16dd593bd1b7d3a4a7bfc3 |     
  powerpc    |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/d637843b715ff416b262c1ff0a50ca227dc9406b |     
    arm      |         arp-scan-1.9.7         | NOK | http://autobuild.buildroot.net/results/5cb910e6be356fd11c6158ecd19a40268473dea8 |     
powerpc64le  |        arptables-0.0.5         | NOK | http://autobuild.buildroot.net/results/240ea895e070334fbfdccbcd8034e2e05a044c02 | ORPH
   mips64    |        arptables-0.0.5         | NOK | http://autobuild.buildroot.net/results/5f1d70bf1844f1e8a66fcb7b5e55be64b0f7a7e2 | ORPH
    mips     |          assimp-5.2.1          | NOK | http://autobuild.buildroot.net/results/92d5e010f0f149ff8686c2749a08c51b41f12fd6 |     
    arm      | atest-895b0183a89c15f5e2305... | NOK | http://autobuild.buildroot.net/results/f9fc6bbc7460e200361a58ad3faa321f54e74628 |     
    arm      | atest-895b0183a89c15f5e2305... | NOK | http://autobuild.buildroot.net/results/df71adf668db841b4530489bf20f0ecee31fc2ab |     
  sparc64    |           aufs-util            | NOK | http://autobuild.buildroot.net/results/3dd49380d53a29c101e91618de50f47a65e53c92 |     
 microblaze  |           aufs-util            | NOK | http://autobuild.buildroot.net/results/b4a1695ad7e42669d56a5e937c5a37d1f6e7d83f |     
 microblaze  |           azmq-1.0.3           | NOK | http://autobuild.buildroot.net/results/9693a68b7571b044b5c3c8f786870539a615804f |     
 microblaze  |           azmq-1.0.3           | NOK | http://autobuild.buildroot.net/results/357da25a9aa6853e43c4cd2f6c34d15dbf011918 |     
   x86_64    |           azmq-1.0.3           | NOK | http://autobuild.buildroot.net/results/b2cfeb4ca9df054437467df2810086c0d90f5335 |     
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/6f774aa104e938e63395787cd529ee71133fd06e |     
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/be37796d7161daa2e32d454d6da5613b24f6d544 |     
   nios2     |       batman-adv-2021.4        | NOK | http://autobuild.buildroot.net/results/d83b256d366ef88822d21bb73607ef7be69239ac |     
   x86_64    |           belr-4.4.8           | NOK | http://autobuild.buildroot.net/results/70dd49c36d30e85fb5f48e543fcd9095b082e02c |     
    i686     |           belr-4.4.8           | NOK | http://autobuild.buildroot.net/results/85235fd30dd3d18279222789a5a63a79f24c4238 |     
  riscv64    |           belr-4.4.8           | NOK | http://autobuild.buildroot.net/results/90e8145cfd006410dad9365db5b0941cda68a2af |     
   mipsel    |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/2ad7896c2169fbecaa86ac9128a0912306eb5254 |     
    sh4      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/e3d8224c3b8367e4eefbe2a0447594c378409dff |     
  powerpc    |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/255a646287b8b5c0f76b5bfa503f1e8eda1f8ce7 |     
    or1k     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/2c3968bc8a3bf1c8fa0390aee06ccf041bfd2880 | ORPH
   mipsel    |        bubblewrap-0.6.1        | NOK | http://autobuild.buildroot.net/results/5a1cc83a9ed58811766f048386f3e2e6a288bb79 |     
    arm      |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/512bf431d4bd5d230d25387c076a978627e0f649 |     
    arm      |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/a4eaac6ed52b058f216ecc595e6f593d7428f231 |     
    or1k     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/fe2d6afa7a42affd46d9d8893bfa0d121d654f6f |     
    i686     |          cc-tool-0.27          | NOK | http://autobuild.buildroot.net/results/908349be16cbc051735357a45a0d5a1167b923f4 |     
  riscv32    |         clamav-0.103.5         | NOK | http://autobuild.buildroot.net/results/fbc0786d95c9400bc2161aa6c26f3bf7e66cd2ac |     
   s390x     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/26f6393ffc1f45149312e37329363c6764f77e2e | ORPH
    or1k     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/0508c4f3a3d3caaacef21abf318f80549848f6f0 | ORPH
microblazeel |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/d30375d72ffdd2de8aec4fee3aab7c450e40cb96 | ORPH
   mips64    |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/ae92ae04c5f8691ce46804469a586513a9f5ec1a | ORPH
    arm      |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/1dbdfe5a8452851a803dd3c731eb78bdc4502414 | ORPH
 powerpc64   |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/d885e7f5da90190444006f598687e41173186d35 | ORPH
  sparc64    |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/26bcf29503a9d6638d8f0013de690943ee6b2f54 | ORPH
    arc      |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/168bf3cc3492e3683145bcc48afe108ade6464a3 | ORPH
   s390x     |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/8a222ef9accbdc2b89a35c5f95508d27d5273f45 | ORPH
 aarch64_be  |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/770a2ec1878201d254c5c1bd460781d8009d2c73 | ORPH
  powerpc    |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/158a860430a0ba5dacd023fbb80c684fddde4388 | ORPH
  powerpc    |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/ad1ba8e0effe88754c2bd467261f7f1c5d563015 | ORPH
  powerpc    |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/f77c8620fe7733c2b490b73c18c506193faee332 | ORPH
   s390x     |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/176f2d2607e5fc7a9895c12c1a3dc0f75579b4e0 | ORPH
    mips     |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/5bdd1ea08f74f8d3e47b3117147c92b6f0f6fd09 | ORPH
  mips64el   |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/4b584f2ade4fc2768bc1885da557455593a2a8d7 | ORPH
   sparc     |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/3856365e2ac71f619031f9c8d857cd0f96116b63 | ORPH
   sparc     |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/88f8ffa5b9affa80f4a30a43a7ddd27c02c73b71 | ORPH
powerpc64le  |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/3037b6d593200313783e11699c39abe4e73e7f97 | ORPH
   s390x     |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/69cf857fee40e05cb8a5ca930546ea0220101f9f | ORPH
  riscv64    |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/fc312fa8dd62c1cda860a663d907b84955bb98fd | ORPH
 microblaze  |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/dff876dcb77112652894ae5cf43a218d923318f5 | ORPH
 powerpc64   |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/a65421ffc1f096b17e4969ad6d6dac340e74033e | ORPH
 powerpc64   |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/3bb94ba1487c4d34906486ecc9c036c124ac1c83 | ORPH
    i686     |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/4ff642c66b2e8fbfd6a5690d1baaf9b252083ecf | ORPH
 microblaze  |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/c53bcae9c3a5ced8bace4e84674c44062e4008ae | ORPH
  aarch64    |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/1d3285226f5d4de658418e84ab137dad9e652a24 | ORPH
    arm      |          dhcpdump-1.8          | NOK | http://autobuild.buildroot.net/results/c29a91b9b5e322c717c7964b9323afca3104d271 | ORPH
   arceb     |         diffutils-3.8          | NOK | http://autobuild.buildroot.net/results/c128d89ca1fad116628f687a854432a5cd0cc98a | ORPH
    i686     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/f808885dcbbe4322631fa57f72af23009babcb26 | ORPH
   x86_64    |      docker-cli-20.10.14       | NOK | http://autobuild.buildroot.net/results/24ca5c8cbcf0a561b0f49b66ffa4420d399930d6 |     
  riscv64    |        dropbear-2020.81        | NOK | http://autobuild.buildroot.net/results/d5587c155db3cf94f3e45a094dc4b93d8d8ef72d |     
   nios2     |         duktape-2.7.0          | NOK | http://autobuild.buildroot.net/results/547a140c82c8f7a3a82467d13b36f36f644dc8ad |     
    or1k     |        e2fsprogs-1.46.5        | NOK | http://autobuild.buildroot.net/results/c08ad7d8c7e96f31d5c2eb16fc7810e739ea4904 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/eb436c26b8de1a67c5650022d69c25c9666cff9d | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/79574484d4b13fb2d6ccdd3ca243dda08ae2cdf4 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/d96aab8aec857155ca16daa3d2ccc5ad493705ee | ORPH
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/f02001a74ee982582deb0e4e9a5fc5755ab7361a | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/683494a3e31f0ce23c40cb300caad3a0da1f2a81 | ORPH
    or1k     |        erofs-utils-1.4         | NOK | http://autobuild.buildroot.net/results/2c9b023a83aa0e8b0836104f80e3382a23bdc94f |     
  riscv64    |          expat-2.4.7           | NOK | http://autobuild.buildroot.net/results/3056192474d8662eee039493c2a8648baedcf618 |     
  riscv64    |          expat-2.4.7           | NOK | http://autobuild.buildroot.net/results/142d580f99dc5500d2bace8d750e9a89f019f67f |     
    i686     |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/1aa210fa50f4cdb450c93b5611b78106ca72bdf3 |     
   sparc     |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/5cf05b3547c7772c259330c2af12c97e59a4419a |     
   sparc     |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/b11496a86108f5badef848a31ea07066af912c99 |     
  mips64el   |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/151bc888ce885176b88b6c6a7ee5d5023149032e |     
    i686     |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/4f77030fd00f81160055233322d1b9604dfef1a4 |     
  powerpc    |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/7fbf9b6b61086bc74102e6d9bd398ff2cdcf3636 |     
   arceb     |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/1edc52c3a62f22de92c16bd071c7c06fe63b270f |     
    or1k     |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/7773c112453f5cb3f6b685566932a6fa61084df1 |     
    or1k     |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/ae87db382c1d5860acb1fadd1bde9e8981e2a7ef |     
    i686     |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/b8a6a61b5fb8b265a646ef1bd52855c298ada0eb |     
   sparc     |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/99e8e5566809fb65d8ff73326ee6e24cc7f56883 |     
  sparc64    |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/3b85cae210e335bbf73a4e60a598c47080b57718 |     
   s390x     |         flannel-0.14.0         | NOK | http://autobuild.buildroot.net/results/45695b3e74abb3c026b376dbbc070617bf8ed1ec |     
    mips     |        fluidsynth-2.2.6        | NOK | http://autobuild.buildroot.net/results/5581b88cb9598b3fd45d77cf6f47159ec52762bb |     
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/634c48c9971219c764511b790139f274c88af811 |     
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/3657809edc17b83764d18fac0265e17aa923b725 |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/490538cffd51b6ce1b1f703518f7d58725b5d54e |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/73a90a4f8f9181875d87668c72326efb57af8b84 |     
    arc      | fs/cramfs/cramfs.mk:46: /nv... | NOK | http://autobuild.buildroot.net/results/1be6653249dbfc204f009a3b49bdd36b03f3812e |     
 powerpc64   | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/cd283f3c62a44585a97526e7d22b958f1109049b |     
   xtensa    | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/e5c3c26971b73617573b0563552546be2af79919 |     
    mips     | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/606edc9d2ef2441842cf01348ba81fcc10d405b9 |     
   xtensa    | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/41bd98ca0bbbbd4845c3d95775c5e55c2527ef38 |     
    or1k     | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/8dc81be6640643cb989ca34e0aaf1b693d6939c9 |     
    arc      | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/54d8f0340fdd787f3fb4fa08d1325ac8d1fc7b03 |     
    arc      | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/e4c023fc7e47c523f0bbb70705f6d7a6c3d0571c |     
 microblaze  | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/aeea6b800f477c59511c2253e50c992135d11e74 |     
   sparc     | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/784174c1dafead8e747902e5ae1e7627e6fde76c |     
   xtensa    | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/f918db0d0268855419242eb5194e0f38930e4531 |     
  mips64el   | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/0ccc3253a3561effbb9ce3dede792d249c3b0608 |     
 powerpc64   | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/7c02a832d1dd393106fc6fdae04936f5ae6f6059 |     
    m68k     | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/6ce6e30f7e8996b23036b77eddb45a2bbc5bd9f1 |     
   s390x     | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/63c62e7e107761edbccd7f6ae1eed7d25498b481 |     
   sparc     | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/2247130db96f26f6ed94bdb3aab6f6bca796354e |     
    arc      | fs/ubi/ubi.mk:51: /nvmedata... | NOK | http://autobuild.buildroot.net/results/eec90c0d70c7efe4a47a9473503b6860eb832aa6 |     
   xtensa    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/9c5161b04cb9d075cbdfe0f91484e17c7ec31c35 |     
  powerpc    |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/ea958e7960b872e75ddeb52313b29d9e27507164 |     
    arc      |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/073e164dbbc81441ddeabfdfba96f2ac5ebcf4e2 |     
   sparc     |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/b863eea2b40919acc99be8e89f0d4ebe4ed55938 |     
    or1k     |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/7a235515f0b5b2a5b7dcf2900a1391b60cc6002d |     
    or1k     |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/e0b4ae579f1a8fdbd784aebd88e7c76c64f89220 |     
    mips     |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/945e6ee0d1a278cc38ba82f454bfa50fc117ff93 |     
    i586     |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/4a04c49de248bc705f81bfd801dd6d792a37ebc0 |     
    m68k     |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/b2fe20d214773be5790a8f2e052be7b42fa00dfd |     
   sparc     |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/b7b030bcdd6284fea48f65ad67f6755eb2097dac |     
   x86_64    |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/dd0373be49d0da9348b2696476bcb1fa74209591 |     
  mips64el   |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/b672538390f11c98ff9c262f4c6cd277fef8e488 |     
    or1k     |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/5e4e3027297050f32844f6582c3fb5f5464e24f9 |     
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/91ffd259d1d13764778dab51dc0a520ab8aeec27 |     
   mipsel    | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/367bf47bbfa3fdf0034b8b35803e1d10a3614001 |     
  riscv32    | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/a23ea83e74fc86878ea946558860f76e27c1db9d |     
microblazeel | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/05e4ca8d7896d42490240fe73b662d26c235ac30 |     
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/b89bef6d2a81c9e7f788e0df3cede90ef8cc3d42 |     
  mips64el   |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/bf8a2dedd9c0d46153cbd3c14c1af9596f10a2be |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/2cc1a0840ed6366c567d3ba063512ffc36f1b1ca |     
   mipsel    | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/2587e0bd0a9c82da1e16207fac23cda5331caf0d |     
  sparc64    |    gst1-plugins-bad-1.20.1     | NOK | http://autobuild.buildroot.net/results/6a9006d879341bd671adefb5d29dab353a8b1ef9 | ORPH
 powerpc64   |    gst1-plugins-bad-1.20.1     | NOK | http://autobuild.buildroot.net/results/b8c4272e2dd748bb39317e6af2857b31e9c72b75 | ORPH
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/18ff8892bf06760d10bca47672ba79c1878254f5 |     
    sh4a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/522f3e88f23a51aaee31cee71b968982e61a2143 |     
    sh2a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/f0f2c5a203e76cde05b094253ebdfd5ee2c96229 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/a514600406f4c774f0684292ea82800a43172852 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/c53fca648afe07046eebfbfac42ac34a8a0ee627 |     
   sh4eb     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/1fb627734a1b286dde2093e3c23f5fc3d4173c3e |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/cc65c8f39990f4a08bc98b6563f2e3109b1a4895 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/9e1ef4a46cb4739ae31639475ede71b8833d939d |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/ee1d142ff5278351f63427cbc1e2899c3842beba |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/2b92cd95900cd3cd92645d41a4415777be087b9e |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/81faa40015d19ecc8e88be2c7a0dbbeaa1efea30 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/64b571c8b8abfb682b3b6677ce656ead32bf2b3b |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/8e8c63ede8badfc951836aef9f602b9c7a995048 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/d4083ec035838dffe74060f9d0ebd86847898326 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/0bc600fc998af4777e3d99e0e26deb9589cce834 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/67ebc8518d388e7f73a54c18ea43c9bc14135ea4 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/2569b9eee4a08e96f6269b32d7c31e5c8b10da3f |     
   sh4aeb    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/56e4f2f08d0eaf98c4217bd2ec498bb42cd3fbc1 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/d14ce4d0dcfcd79dbf53b952057416f7bcf23af3 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/62ffca2f0d7a53e47542f98e1c39ce685c76d44a |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/a4e7498dbdcc306f896ac7a59b8c223d87b4743c |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/d479b6c5f3ea6166a795a1312a529d5395fa39d6 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/8790c1904fd80b6457b95e5746e4ebeb9c815c90 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/a206d3d4f6b23e7e9fba7d4792328bf1681116d0 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/f0fd59b581c57f9eaea896d9cc088eb53a560821 |     
    sh4a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/87f6affaf51e23cfedd23c2e8984057e94509201 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/579b5ccf18a478903f10c1e181c7e4d9a9760961 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/ef3e46347fe9426edec6a16b0a9d04bc8b26c797 |     
    sh4a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/c1bca2f8c2f0f58a61099708be75cc9997b2acee |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/19dc993560c34ebab035516b296fdb7b656eb76e |     
    sh4a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/743fb0ccdc953276d1477543f437a9ad1c058140 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/0875cb8a7ff8f3d70d826f8b54e8f5f41bd027f7 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/ba4056ce948e7772f6bfdac9305c883414331749 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/74331bc2eeaf938d14aacfa10f2db08076321c74 |     
   sh4eb     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/12a5e8f9aac09587093e3ee0d8f7406b2b0b9b91 |     
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/4811da7c46ecf6ae74e2ad3196a47efc3e5ae29b | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/a32e135e73cfb9f04be48cd3a8fc017e29cf88b1 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/76077179663ac98e4948f4d6d0cddeae82849ca3 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/e8b3722cf486687593b866b0ad4cf3186580a6c2 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/342c78c77f8ac8bb187096955b594a16492ad63b | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/290b9ac74c104cc648bf257e56813aa6d5146df5 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/49f0b9fbab4160ab6ff17ea55099012b883c90c8 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/bf5b11c457bad3c4ddc5e55ad829c8fa25e051e9 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/7d9d43dc4f481592e6a54c76840b2317394c366a | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/6d99ff453f25a7fdf993c34bcb40c652cc2d9a2f | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/95c9b60d6cb48516e021845c168446f53cf49b13 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/39d7ba0f13e0c9d4df502ded490f91eea03e8296 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/2007a34833d139fc0bd0d56c0052afa4d3f8494f | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/25839099505f3dccea96cfc5a8da13f618cd529b | ORPH
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/942630620a87ce6e2ad6681a31011be6a8589efa |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/962b42067a09264a482111332b9b03d1c2513eac |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/bd46f4d92de60a5441b6464c72a7048e14fddfa4 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/1916e68a10f63f335d158b6716977d7904df32f5 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/8900f0b00a5ff19a6c4b6daa6ce40b8ba0afdbeb |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/5a4ced96aa6300979748960dd41cf8f03e7128ab |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a7e9725e727482eede69c96a1df33deb1bfeed3a |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/f1e51a21890b2db32cd9a054b72434fa7ce02494 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/78840a1930adabe7f1bac147705af46f196dc063 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/fc05669d96a9c3abb522c2a1b84563618e693b01 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/833da410af22e6e5285bb6b577f864ee182dca67 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d8b2d86185a84104dbe967d73f61a57806cf65e6 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/313659ca76aef184f97e9931274c5c7a6aa71087 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/2fe2820f37ffafef8f47ed8df3060ea44c1f4b01 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/40203f9a170fb3ef75ee0cc1a1bfc3596e957597 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/cb2ae9be3b17246be37143cacfcecb6a33ec7c37 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/719323f06418e0d777d1af98387d9ce94cd4b7a9 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/7889247bc1a11077ea28e87f2f7d231000b64e35 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b95285f8547b06f3f0c3882dbc948013bbc04146 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/0d0097417452c05049be0b45a89de04bfae50286 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ac9b637c604d392817f1f91fa8e00c73b03fd543 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/33d708fc22f8d90709041135155c9a3d3bde29ec |     
powerpc64le  |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/5f50111fc4c4e53b4bc76eec748f63eb3a32cc4d |     
 microblaze  |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/8e6c56b37020481580139f3ac59d2363342596db |     
    i686     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/3ce698fd1bee5813277e71f3db0c5cde17d76cf3 |     
 powerpc64   |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/920b2ad0e54d842677a170c81faf13f6c0717b2a |     
  sparc64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/8cddd9dfb6e51edd7b34b6aeccb7d771c7881989 |     
powerpc64le  |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/3832c28c1a623cd3546f025a9bd4abd0188e01df |     
   s390x     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/4bde4e41884f67d7a2f201399eb7d55268ad629d |     
  sparc64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/4cab7569236d120bf3fb18923d8ec78c6f6b9f1a |     
   s390x     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/7361e870a39a39ed7c642a12da0f2163857a1f77 |     
    arc      |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/8bdc26fcb7727f0b3106183bd897bf30fc3261ba |     
    arm      |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/c1bbb0a48f3b7b96eb685c45bcd50d9af6394184 |     
    arm      |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/8745b988296733b7b71a78596577d549594e2122 |     
    arc      |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/26eef4794baf9ababb7508ddde69aceb3336c12e |     
   arceb     |    host-gcc-initial-11.2.0     | NOK | http://autobuild.buildroot.net/results/421d979a491ac89671d888e4a4176de71c0504d3 |     
   arceb     |     host-gcc-initial-9.4.0     | NOK | http://autobuild.buildroot.net/results/ed9e07db072847f64ee63aaf49374fb8b3dc6e4d |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/82e4afa031128dd9050c1db060a34da7a7d261fb | ORPH
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/39570a9fb5fca4d91d6a18590c33bf4350b0a127 | ORPH
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/478085eac777f9b903f28166cd9cbd57567c842a | ORPH
  mips64el   |         host-go-1.17.8         | NOK | http://autobuild.buildroot.net/results/92abf7fee96562ce944fc1b3a6d6891a648b3758 |     
  mips64el   |         host-go-1.17.8         | NOK | http://autobuild.buildroot.net/results/f70b2bc40845074c4c992b689258f0d207edc0f8 |     
   x86_64    |        host-rust-1.58.1        | NOK | http://autobuild.buildroot.net/results/de23800fcc85eebe4f94c296a4b56b4015859f93 |     
   s390x     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/28e25f8ae4e2ef8fcb5bd0237f6a8e0a8f536245 | ORPH
    m68k     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/bcc94406f378c5e13d73fd2bd30df82a0b0777b7 | ORPH
   x86_64    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/5315bfd0b94d425cb723fba63c247f3b5de3711e | ORPH
    mips     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/e908f07afe7f7eab5402a60dbe479f396aca780b | ORPH
    arc      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/ff4be6327dfa7ad2abb28d5f90170ceb26e536d6 | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/7b3b304c94996846a771be83ca2091eb478a6390 | ORPH
microblazeel |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/0677051b4abca12764c5a77edc9037fa00c8c817 | ORPH
   mipsel    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/c4c708060cc17c7a098ba369214858d7e8ba7816 | ORPH
    arc      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/8267308aafd410d8ff9950b786bf97015bd44693 | ORPH
powerpc64le  |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/4fcc4d87a3efdc39b221e59e46ee563e73466a94 | ORPH
    m68k     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/47d7cd63a655c7f6a56a787ecf0944efd7eddffb | ORPH
  mips64el   |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/205f30bcf2067ce26e997f65bfbb708c47d21fac | ORPH
  riscv64    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/06a46531673a7bee529454debff528e163a388b2 | ORPH
    m68k     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/92f18baa09a69777ff72219e6d80f08d803965a1 | ORPH
    m68k     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/f4a701b3b52dda0e000beb5e8e2418065e29644e | ORPH
   xtensa    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/7243a05ef88e0af57769fa69562dde7c185df32f | ORPH
  riscv64    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/1c89cd282cca8ec9779c7ef1b6834a621fb05390 | ORPH
   nios2     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/65866521d3978242bee70e24c65ae29f22652662 | ORPH
  powerpc    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/b014701bf780bb77139582885382f91643fd79c6 | ORPH
  aarch64    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/fe9e2f3af4065cfdc19533e110ff2ccf09eb61eb | ORPH
  sparc64    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/5f629395f0b289e5ddeafacce5e44168bfb4a7e7 | ORPH
   nios2     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/964aa9f16856e53ce9c96014a74240144cc7e33d | ORPH
    m68k     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/169e46cab9a5c4741c0ce8916de5183b9f6b36ac | ORPH
  aarch64    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/823bfa4a662f925e67a43ea79ef45546e20b26a2 | ORPH
  powerpc    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/e1134760ac461f1bc1224a90a75d25309d3b632c | ORPH
microblazeel |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/74eb61fb633cca38a269111bc81a7a6bbac2f7c4 | ORPH
  mips64el   |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/dbf9db288e0431709b8cbabfe7856ed9754f5428 | ORPH
  riscv32    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/40fd4e8169e5ad726f174fdfb125b34092437243 | ORPH
    sh4      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/56bb82aa014ac62826f9de64f8aa5871619f6836 | ORPH
    arc      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/39516b983ba16563970f1d8826fe52421de580b3 | ORPH
   xtensa    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/0145e7eeddab9187d330d7c71c8728c76e2c9857 | ORPH
  riscv32    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/c917986918ec618e0f1953c1763d1e5ce3f0020a | ORPH
  powerpc    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/e8e8a672acc4794f7a97e5dc2c5af98b039a396c | ORPH
   sparc     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/67096e0a791dfd137168c53d8756abcd5cbc72af | ORPH
    i686     |         host-wine-6.0          | NOK | http://autobuild.buildroot.net/results/2e3ed92a6a09c4fdc5baf5cd043eeb501355887d |     
  powerpc    |          hostapd-2.10          | NOK | http://autobuild.buildroot.net/results/55016cf7e2bf99935b77073f84b2df5b05516c20 |     
   x86_64    |          hwloc-2.7.0           | NOK | http://autobuild.buildroot.net/results/6e8426a7e6a3c7451de3a0d7fb99df5fe9910f17 |     
microblazeel |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/cbf2ac5eb9bc68637916db34fdbd55d554b2478e |     
 microblaze  |          janet-1.19.2          | NOK | http://autobuild.buildroot.net/results/7f9fca5ca1eb1283813fdb4ae7aaeb08aafb41e1 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/ccd573b147e8c6074c79a5beebb0a81a00d434f0 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/d9b400e9a79c25419a7d753bd9ea7f75d39a4a38 |     
    arm      |        libdcadec-0.2.0         | NOK | http://autobuild.buildroot.net/results/1cc23955fd08e0c30e90139969ab92e640d3d609 |     
    m68k     |        libdvdread-6.1.2        | NOK | http://autobuild.buildroot.net/results/12dbdb5ab7c8492f14c3b666924f5c78b2007569 |     
   x86_64    |          libest-3.2.0          | NOK | http://autobuild.buildroot.net/results/8550043b735f0ce95ad8e6773863fabc8ba4650f |     
 microblaze  |        libeXosip2-5.3.0        | NOK | http://autobuild.buildroot.net/results/5cb00af9ecd5daa6f0382df85d32cc12449cc1fc |     
    or1k     |        libeXosip2-5.3.0        | NOK | http://autobuild.buildroot.net/results/5d3cecec12587761b019f70d0a5ed8dc46aa0e1e |     
 microblaze  |        libeXosip2-5.3.0        | NOK | http://autobuild.buildroot.net/results/3e8cd93ea7663b02525e8a3ff42846e4df67ff5b |     
    i686     |        libgcrypt-1.10.0        | NOK | http://autobuild.buildroot.net/results/fa05f89053300781dec082ad96a0449461a9571a | ORPH
  powerpc    |        libgcrypt-1.10.0        | NOK | http://autobuild.buildroot.net/results/5498041d300e6d21afe05ef4e85eca0c02945eee | ORPH
 powerpc64   |        libgcrypt-1.10.0        | NOK | http://autobuild.buildroot.net/results/9db3ade4e299d54fc130d7d366c9ba73f31805d6 | ORPH
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/9de3386050e2319ff42d03f8d82fc588996660d5 |     
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/6c34d29ad7925ac0044b9912da430b11c1865a6c |     
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/90dc31b0b0b2fa1ad77621d31428b4557980638c |     
  aarch64    |       libgpg-error-1.42        | NOK | http://autobuild.buildroot.net/results/e2bee94ce05a0415958e4bd8c0b02c1d98070964 | ORPH
  aarch64    |       libgpg-error-1.42        | NOK | http://autobuild.buildroot.net/results/7456a040f0da7edff2f038bd1594b574d3f90e70 | ORPH
    or1k     |        libgpgme-1.16.0         | NOK | http://autobuild.buildroot.net/results/ae124205834f510a1337cccb97b98347ff064568 | ORPH
   mipsel    |        libiscsi-1.19.0         | NOK | http://autobuild.buildroot.net/results/2072eb041dfd4f12ebe906f73c2f65e94be4d0ee |     
    arm      |          libnfc-1.8.0          | NOK | http://autobuild.buildroot.net/results/89ad5809d002313e52baa4a2f60f7a0a9a295104 |     
 aarch64_be  |          libnl-3.5.0           | NOK | http://autobuild.buildroot.net/results/e95536cc3f5254bae3650638907e361eb5e4aa48 | ORPH
    mips     |          libnspr-4.33          | NOK | http://autobuild.buildroot.net/results/2804139073f107717eff57403a82bed2daa3cd7e |     
    mips     |          libnspr-4.33          | NOK | http://autobuild.buildroot.net/results/c596a757a426d0be95a9c3314f3b996015ca2ae3 |     
powerpc64le  |          libnss-3.76           | NOK | http://autobuild.buildroot.net/results/572f73ada0669f5c8d7d0af1d65aaa9e3892bdd0 |     
   sparc     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/181abe6364ef91ade151640c1cc871f4d8216014 |     
    arc      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/4f7d4a8ee43833629ac5d1d781e33c82b921cad1 |     
 microblaze  |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/bcad113f48ee49819ff42bb92c1066dbc2e81ddc |     
    arm      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/d3a6aaaac3b7bfd3c3e5d44b01d335746bf83a21 |     
  aarch64    |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/c49607642b5efe6ea44bfd5b792de12ab78ed2d3 |     
 microblaze  |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/8d92a134cdefe25dadb2d84a78b691734a6ff6d5 |     
   arceb     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/3d72d9bb9df0936dffc897950fb8fe430f5b2000 |     
microblazeel |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/7935f5ccbe5185857ae03825e503536bbdfc2f3f |     
   sparc     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/c2cb2d8291e2560f31f6761d469cb59b60944665 |     
microblazeel |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/831188e8d32265fa629fd3d5f75acf9b77c3bb9b |     
   arceb     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/0e2119b208e6d5e399db5c630a10a934faa00daf |     
    arm      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/60b45238449a9ee7934a41ccf9d8c41bdfcf0cbb |     
   xtensa    |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/a4a6b54e965b30c304114113b4aded743cd98e50 |     
   arceb     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/7f978026d45721d16e73c53bbd24353f409e3c3c |     
    arc      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/94b41e7f665fc7cd293912b29cca1aa029f3f5c5 |     
microblazeel |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/37f8220e0297dd9f2aa62f68a652d0ea59c3839b |     
   sparc     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/90f6073962285234f45b8804b1fe6a421cf88f56 |     
 microblaze  |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/6aa37a31dabe7fd6288e825ba4183b3e04ebd449 |     
   mips64    |        liboping-1.10.0         | NOK | http://autobuild.buildroot.net/results/3f0d3d59aa1031e6fc924b027a6742297dabdcac |     
    i686     |        libosmium-2.17.3        | NOK | http://autobuild.buildroot.net/results/769769c6279fb448f9cb3059459e763ce42c0918 |     
 microblaze  |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/33c37c21fdbac54542c89b220d8bc8bb5caef5b3 | ORPH
   arceb     |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/896dc1d8d2621da3e9ade4ec45d064cd5ba00bbe | ORPH
   arceb     |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/3d08069eccb7b5fef398a5e50905abef384ac710 | ORPH
   mips64    |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/f5a052eeb7f1d0ad16b5011fd6a022ff7f1f5733 | ORPH
   x86_64    |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/d70592e331d2708b59b74255f4e85a28e4782cc8 | ORPH
microblazeel |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/ed4090a317fa81051ff6c168c0a5aff5fcff07f4 | ORPH
  powerpc    |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/6bf4d96a2a3f0db3d7f6ad5dc140690203cf1033 | ORPH
   xtensa    |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/e5c3323aadf41f59ed87acab837821c04679c8e3 | ORPH
    or1k     |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/5ae5be6af21c54e4015e51fe82a085521713358b | ORPH
   mipsel    |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/ebd27a93ed660f32a98be8e023f5577f94b1abc7 | ORPH
   mips64    |          libsepol-3.3          | NOK | http://autobuild.buildroot.net/results/9e02bbe34ca65eb7bf40c3f3550b49558d9f9276 |     
   mips64    |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/06ba26b096e6b30f8eed67e56c9b890560faf5f0 |     
  mips64el   |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/697362bd7711610a60836c9722e86423ea330256 |     
   mips64    |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/f4a44b93ebdd835c11a9c842e636974f09c9ece6 |     
    m68k     |          liburing-2.1          | NOK | http://autobuild.buildroot.net/results/672f340bfcb80e84be91f668417379d31f12ef1e |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/bc2b8300892bca013f37024275cfd1c6b83065a1 |     
   mips64    |         linux-5.15.30          | NOK | http://autobuild.buildroot.net/results/d6f83048a7f4b69d78364ff1ca80d7b3591457c4 | ORPH
   arceb     |         linux-5.15.30          | NOK | http://autobuild.buildroot.net/results/9bf097e3f0047e04403c25bae059e7e1093304b0 | ORPH
microblazeel |         linux-5.15.30          | NOK | http://autobuild.buildroot.net/results/aa5f8bf39a388c23bdc3bb2665a421e621ebf6b7 | ORPH
    mips     |         linux-5.15.30          | NOK | http://autobuild.buildroot.net/results/85fa893bd10437b5b1cf74c56d6a71eec71f785c | ORPH
   sparc     |         linux-5.15.30          | NOK | http://autobuild.buildroot.net/results/c251c6111522890e5c5e2ca623e858b2f489ecd0 | ORPH
  powerpc    |         linux-5.15.30          | NOK | http://autobuild.buildroot.net/results/955341ce8baba8c6a7a20a369f99dc3afa0a6651 | ORPH
 microblaze  |         linux-5.15.30          | NOK | http://autobuild.buildroot.net/results/5881a2e57a0b54f21357bafbedadb709d86166b8 | ORPH
   xtensa    |  linux-headers-5.10.104-cip3   | NOK | http://autobuild.buildroot.net/results/76bb10d4b3ee2f2dd706d9fc0eba592a8ab49151 | ORPH
  mips64el   |  linux-headers-5.10.104-cip3   | NOK | http://autobuild.buildroot.net/results/80269eb8a7f4039c62a933c0f71af1d9d6ea1b48 | ORPH
  powerpc    |  linux-headers-5.10.104-cip3   | NOK | http://autobuild.buildroot.net/results/6a36294d1b4b73f285ce8a6079a38f969e7f256d | ORPH
   sparc     | linux-headers-5.10.104-cip3... | NOK | http://autobuild.buildroot.net/results/457f6aa01bd1b27a284e9c7d697419e2a5c06fb9 | ORPH
  mips64el   | linux-headers-5.10.104-cip3... | NOK | http://autobuild.buildroot.net/results/c4e87b87c49f308b371e71149997e4cd147a7769 | ORPH
    mips     | linux-headers-5.10.104-cip3... | NOK | http://autobuild.buildroot.net/results/5a526008538b007ef9e02c7a5ae430c483b16cb0 | ORPH
  sparc64    |     linux-headers-5.15.30      | NOK | http://autobuild.buildroot.net/results/8e293497e24b5549e5a0b73f6bf58c5b8ace0b98 | ORPH
   x86_64    |     linux-headers-5.15.30      | NOK | http://autobuild.buildroot.net/results/d35784903c53baffd97bac07d5b595685771dc9a | ORPH
   arceb     |     linux-headers-5.15.30      | NOK | http://autobuild.buildroot.net/results/a66b4f0516cfac90c60e56340acede9fc336afd2 | ORPH
  mips64el   |     linux-headers-5.15.30      | NOK | http://autobuild.buildroot.net/results/27ff0498f9c097f44151738ebcbc84344fb13d56 | ORPH
   arceb     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/5f02b0fa31730ca9a6c4f1d52f8a983ee2c95fe8 | ORPH
    i686     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/1ff6df0a574226717dfd08719273e491afae7420 | ORPH
   nios2     |         minizip-3.0.5          | NOK | http://autobuild.buildroot.net/results/77152ea0b8e3ec3745db5b24194b137086663e6d |     
    mips     |         minizip-3.0.5          | NOK | http://autobuild.buildroot.net/results/5dfc853ffe538be4044d95e186574d3ceb38cac5 |     
    m68k     |           mpd-0.23.6           | NOK | http://autobuild.buildroot.net/results/bcf72b4c372445b3ef918958ee95c1785efa59e8 |     
    mips     |           mpd-0.23.6           | NOK | http://autobuild.buildroot.net/results/a8754431aad8808ae2d67e32d4a7973b00eda1c1 |     
  powerpc    |           musl-1.2.2           | NOK | http://autobuild.buildroot.net/results/6f49403d2b7680fea9bfd6629ab03ddbfe4049ed |     
powerpc64le  |         netdata-1.21.1         | NOK | http://autobuild.buildroot.net/results/5e7dae5ec0dd2e7c610ebe734c27b130a240725e |     
   x86_64    |         nodejs-14.18.3         | NOK | http://autobuild.buildroot.net/results/533df95f7ac701384915fa2940e53ecd946988cc |     
   mipsel    |         nodejs-14.18.3         | NOK | http://autobuild.buildroot.net/results/558c31222fe2c86f685aed5a39aa43faf711b7cb |     
microblazeel |         numactl-2.0.14         | NOK | http://autobuild.buildroot.net/results/db387b0f03738a1ad7e3fe2ecc95cc212446a25a |     
   x86_64    |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/b260eff00490ae6cfbf790fba755162fa09b8d1a | ORPH
  sparc64    |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/f420f46fe7c6761b3c26ceb766ccc29c46b99746 |     
    or1k     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/0950e59b3efe3d48ce2b68e73b35198437804352 |     
   sparc     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/0684a0b83a044eb3b7dd57b98553abaec7e294fa |     
    m68k     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/def203839a2459babf7e0b1f66459dbbb9876958 |     
   arceb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/a38392260f5116b9a27dec749a89bfc8df2b814f |     
    arc      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/7f0bfce784f7af768d53bf6ca768be4d9cae4bec |     
    arm      |        php-apcu-5.1.20         | NOK | http://autobuild.buildroot.net/results/00879c5060b79ff2d1c2c9bf71580f2c175c8d3e |     
    mips     |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/210cef4c7083807558d0a8d6d14ae2ff9a3d0aaa |     
microblazeel | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/62a2393da02138ed2701564b1d69a54f0e6d49cc |     
    i686     |       python-ujson-4.2.0       | NOK | http://autobuild.buildroot.net/results/4d97a7531009be0ba06b84c33e1e29d780ef7522 |     
    arc      |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/d1c46e7c09c818bf57b4c2aca235f1615af45c62 |     
 powerpc64   |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/6f891f76709b69ecc7c643a5ebce620a5e286956 |     
   nios2     |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/9bd6033fd063894a986f104f98b1be915c407208 |     
   x86_64    |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/e10e0dc7948b6d72b7f60263bbe45204fcf98517 |     
 microblaze  |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/275a760a3323e34e1f7b1d128b572e4e7add60e8 |     
   xtensa    |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/f541449da85663b73a1dd735552e63c4d4c061a5 |     
   mipsel    |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/a1adf38555d26da2cb98bf1a2a3ecb19a8e18896 |     
    i686     |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/19e4f38499426814e18c392cfa0128a55fc839a4 |     
  powerpc    |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/60876da99c712d0fb13ccc6d05a6c0e35428c303 |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/6a727ca55fae29f0df39e75cb098c024fae745f3 |     
  sparc64    |            rauc-1.6            | NOK | http://autobuild.buildroot.net/results/f5e390d96b8e3d7ea480cc3792e82207c3d074d4 |     
 microblaze  |           refpolicy            | NOK | http://autobuild.buildroot.net/results/6ba78f4ef9ae5ca7c4bdf4a7cf339376b438fef6 |     
  riscv32    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/0027177d7d6f007769e4dd0501ae4050167e81e7 |     
    m68k     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/37c67e5384e47d0b06995929022be55f222a5c94 |     
 microblaze  |           refpolicy            | NOK | http://autobuild.buildroot.net/results/efb1818c1696e1d7fa16fb71f942aefb635ce5bb |     
 microblaze  |           refpolicy            | NOK | http://autobuild.buildroot.net/results/199da862bfd5cb312858ac297d5d9b3e47eadc75 |     
    i586     |          rsync-3.2.3           | NOK | http://autobuild.buildroot.net/results/c6c1a4636357682034b2bbfacde61df58771f95a | ORPH
 powerpc64   | rtl8188eu-60cb0b5a3cfc95e3f... | NOK | http://autobuild.buildroot.net/results/d6658408464bbaca9b04c600a80b38c6643d3aef |     
   mipsel    | rtl8723bs-11ab92d8ccd71c80f... | NOK | http://autobuild.buildroot.net/results/bfaac0c6c91e32d918ce3bd35a97f518dccc3c15 |     
   sparc     | rtl8723bs-11ab92d8ccd71c80f... | NOK | http://autobuild.buildroot.net/results/ec14df025600314c13cbab2b54faa8480e0e0725 |     
 powerpc64   | rtl8812au-aircrack-ng-3a640... | NOK | http://autobuild.buildroot.net/results/b2a71dc442b9a45a8f63121b76c731749322f243 |     
    or1k     |        sdl2_ttf-2.0.18         | NOK | http://autobuild.buildroot.net/results/3716f3779f70834fdf315e6d2c6bf5b364b22186 |     
    or1k     |        skalibs-2.10.0.3        | NOK | http://autobuild.buildroot.net/results/caf9242115823d2e1b31ff173080ad5d9b3ebdd3 |     
  riscv32    |          stunnel-5.60          | NOK | http://autobuild.buildroot.net/results/6fbb5d7e4049e6f7b4c81fde421de845df057115 |     
   s390x     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/b209fe065f86a4046cecaba237892f88f3137e23 |     
   mips64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/2b71aa48e51fafc97a0a293e218e36b0a14c2067 |     
   nios2     |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/746347de80a19954453d1b1762932271b3116b26 |     
   nios2     |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/1ea124ff7ed55cb9fa44f4cc4ebbaa6f2e253f81 |     
 aarch64_be  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/da00dc18f48c5dd579ce03bf9630087682a40c6e | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/04523162bc62d693190f4f4a0b37fed471e43f55 | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/f6bd4e43928f428dce2f23df7e99615380a39df0 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/72c7305f9464a1cbfdf692a9505c3e040e962871 | ORPH
   mipsel    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/bffdd1bbb5f1025d9a0c209f7f72f56290c7c3d6 | ORPH
  mips64el   | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/dd0ea835a8c6387bf9a9425a47e0dcb110dc4780 | ORPH
    mips     | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/2d12a9a771ec51ac767120a9996b3e4dc85bb2d0 | ORPH
   xtensa    |        trousers-0.3.15         | NOK | http://autobuild.buildroot.net/results/09acf74117dba66bb95a6c9569a2dae610402305 |     
   x86_64    |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/223f5a2b92442d21b4a3bad09ce4fde8da167af3 |     
powerpc64le  |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/07d50132818b757c3f67b4c31fd90898bff151b9 |     
   arceb     |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/f53c145a70b8927ada2967939cc8d08537a43deb |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/0f62bb4c15d5080a7990a9653e8afc6a7b2d23b0 |     
  riscv64    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/72121ad14d914d9a524f364de4b99182185d50a5 |     
    arm      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/38b2697d9f8f3af95ec50d16a657f4aef84b90fa |     
   arceb     |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/8eabddb07fe4c2d89ac4e5b9ac4f555f0dcd59c4 |     
    arm      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/5ceb335c29a6456ee684f2ed08ffba5e08cb6db4 |     
    arm      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/85013da86ac524c1c20523bea3493bf30cc5220c |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/d2e27c5e978f7e841c932e2423a1881787f619a4 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/23de3dc5c58951cb90d319f34dad7ac28b6c61b3 |     
   arceb     |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/0c47bcb4913dbc9159095bb32e11af0cdef4ba05 |     
  riscv64    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/90976dee399ac9da3eadb2a45e2fbbc12ad368e0 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/05c4000a01a3a9d54b877e6d7c0c9beb9a50e232 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/7e22c76698c2696330c1adc6ea7f5ac1dd2eda2e |     
   arceb     |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/83bf56cdf0091963b4af465337b19c24bd325328 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/fae93a1136b7cd8ce21d2d08e720086fe4777657 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/518c9dec427049e7d5aa61c8a66abffe67cc6962 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/c5356d0fe53e4b335b6f57b1592bdf039a931256 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/7bf06eb5c95486c7e56b8735ddfe7ff784f44ad7 |     
  sparc64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/b5b65c59ae5d51755219caac16456cd645d22fe8 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/e40760c4f4e5cf2421d786cdb975293f04f5b97c |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/3babb456ebcca06f39fb6ff822e13b28e8ccbb4b |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/8fd0184e5539ad43868f251c7059f9749129522d |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/0c76d37d6fd6952cb6b1b6a7c95fe17481fe9001 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/c4c3b68e5d95dbb1ec4d2f74079b40adbe57ac86 |     
   x86_64    |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/21e088d8eede616ef51cabeca20dcf6e11945945 | ORPH
   x86_64    |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/83e8744a1183f6e19204d7a2824fef99f304d99f | ORPH
    or1k     |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/956ea633dcb2e914bfb86fe94ede01d6fe1cd4b2 | ORPH
   mipsel    |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/041eeacdf379280a4a4ac64e856a40d9eddbcb17 | ORPH
    mips     |        valgrind-3.18.1         | NOK | http://autobuild.buildroot.net/results/ffa2dbfd6d5efcc50d447c0e759fb4ffce0b59b9 | ORPH
    i586     |        valgrind-3.18.1         | NOK | http://autobuild.buildroot.net/results/78f04ef8d38e35a79c338faa33eb0de3863ff04b | ORPH
    mips     |           vde2-2.3.2           | NOK | http://autobuild.buildroot.net/results/9a3227c506878e1f9d5e607f5f711f52ad9e1d87 |     
powerpc64le  |           vde2-2.3.2           | NOK | http://autobuild.buildroot.net/results/4c630b932e619be995c0279fbbca4e3c6fa98760 |     
   s390x     |           vde2-2.3.2           | NOK | http://autobuild.buildroot.net/results/5afcb93d8a29541137deab9efbe240a77107d7b0 |     
  riscv64    |           vlc-3.0.16           | NOK | http://autobuild.buildroot.net/results/e0a97a2e72f4a7d63fb8ebf64d28c2dd6149135a |     
   mipsel    |           vlc-3.0.16           | NOK | http://autobuild.buildroot.net/results/54ea8802bf49c093be02707c7643f3f4e37e2b77 |     
  riscv64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/1c95400f28658c8a8be372279ebc4fdbb1136da9 |     
    i686     |      wpa_supplicant-2.10       | NOK | http://autobuild.buildroot.net/results/962ea00c72f7dffd2d17f660c417879d795d0de9 |     
   nios2     |            xenomai             | NOK | http://autobuild.buildroot.net/results/6f8af07430cddce2915fa100cb6ba51fba95426b |     
   s390x     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/d924564bf73716fd32f707a11e6a63a97ccfae58 |     
   nios2     |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/e476b72f58dcc78684998b9d1fbb513b2e02addc |     
    mips     |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/d392421876ba645204cc23b0ea7878febe2f188c | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/fa57044fab9ddd37cfa6ab4f8c5b93d751741d81 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/a108e4f7821a3474c6082b048a7e2db343049140 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/ed92b4dade2164ebfdb48c0e9e3fe8774c138d56 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/ae7c4ff1f64294167dfaf31205b384c2271e1c84 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/e83cb428f40418d89e15f871c0f494dca6061239 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/1ba6e79efb7d4f00d203260098c8ca7567fdc329 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/c438aa3867768aaa7a680419981135f4a8d8a482 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/088ef8af823c90762d057b885064a8a405defb94 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/3a900c6cbc5e32c5970cdab5ef24efe2136f697a | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/e44bb9415160e330a0f6b75e4eb462a870c9d4e9 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/6d33eab4b504c28669dad865dc0485c8fcfe6b14 | ORPH
   xtensa    |       zynaddsubfx-3.0.6        | NOK | http://autobuild.buildroot.net/results/4d0298ba518e2ef091ab75ad7a4aba262645086f |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                 dhcp-4.4.2-P1 | 2 
                       unknown | 1 
                    vlc-3.0.16 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/29cc4eafa994913c069fac374415bda8e60cbc22 | ORPH
  powerpc    |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/f89488229cb691e6fcc73bd43b6257d6874aac46 | ORPH
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/c4d7fd15d254f426b61e349216fd3b1875fe7e24 |     
    arm      |           vlc-3.0.16           | NOK | http://autobuild.buildroot.net/results/124e8bdcdf3a6edec9ea6a97333d376f575df876 |     


Gitlab CI results for 2022-04-08
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                amarula_a64_relic | https://gitlab.com/buildroot.org/buildroot/-/jobs/2302805241  |      
                      bananapi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2302805337  |      
                 bananapi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2302805338  |      
                 bananapi_m2_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2302805339  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/2302805346  |      
                     csky_gx6605s | https://gitlab.com/buildroot.org/buildroot/-/jobs/2302805363  |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/2302805388  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/2302805391  |      
            friendlyarm_nanopi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2302805400  | ORPH 
       friendlyarm_nanopi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2302805401  | ORPH 
           friendlyarm_nanopi_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/2302805408  |      
     friendlyarm_nanopi_neo_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2302805410  |      
            friendlyarm_nanopi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2302805412  |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/2302805416  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/2302805443  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/2302805444  |      
                    licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/2302805453  |      
      microchip_sama7g5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/2302805465  |      
        minnowboard_max-graphical | https://gitlab.com/buildroot.org/buildroot/-/jobs/2302805466  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2302805532  |      
                    orangepi_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2302805541  | ORPH 
                     orangepi_win | https://gitlab.com/buildroot.org/buildroot/-/jobs/2302805549  |      
               qemu_ppc64_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/2302805597  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/2302805630  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
