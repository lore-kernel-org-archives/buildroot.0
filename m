Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A13EC6FD1F
	for <buildroot@archiver.kernel.org>; Wed, 22 Mar 2023 06:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C09A540108;
	Wed, 22 Mar 2023 06:36:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C09A540108
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EiL1tSszAXBO; Wed, 22 Mar 2023 06:36:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 470714032C;
	Wed, 22 Mar 2023 06:36:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 470714032C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E0F121BF228
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 06:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE60161398
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 06:36:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE60161398
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BAYro-4Jyyfq for <buildroot@lists.busybox.net>;
 Wed, 22 Mar 2023 06:36:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45A376139A
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 45A376139A
 for <buildroot@buildroot.org>; Wed, 22 Mar 2023 06:36:05 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5EB4720009
 for <buildroot@buildroot.org>; Wed, 22 Mar 2023 06:36:02 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 22 Mar 2023 06:36:02 -0000
Message-Id: <20230322063608.BE60161398@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1679466962; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=g38ucZ1qT5ZnwvGD16GefaegkqQPqMpFDqJD36xh+aM=;
 b=Ro60xvmVNrBmk/BkNBoyBA4w6pTW8keBZggJXgZpGsVLMg42RcwbxZExmoA+T9HTqfmQhb
 A/ezzc/yIl5FzAOpEJjb+J/GAhkt5ku/J2a2q9wDZYNnD9epEmWFsRj/vl+5jc8jrg0zHL
 Mz+t0yBVbwSuy84eBib+hqRgmCGAtfCU3spniDeGN+H1ZHGOJVWSn5OVcFB0Qn2RrkLgS1
 oYsMxkI2AcXrEDLQfb4Zu5uutbv8oEFIyCoolwNp8A653dctZSpobPCfVuH2eHI0WkuY5B
 xTY4Z3yWX/iwmBRvUlFfQM+e7CxFZtjv1py/CyuYypNJYuPBAJ/iNkuRNXJIjQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ro60xvmV
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-03-21
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

Autobuild statistics for 2023-03-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  8  | 12  |  0  | 20  |
    master   | 232 | 150 |  0  | 382 |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.72.0 | 9 
                  snmppp-3.5.0 | 7 
             bluez5_utils-5.66 | 6 
            host-binutils-2.38 | 6 
                    olsr-0.9.8 | 6 
                host-go-1.19.7 | 5 
                  linux-6.1.14 | 5 
                elfutils-0.186 | 4 
                   perl-5.36.0 | 4 
                xenomai-3.0.10 | 4 
        edk2-edk2-stable202208 | 3 
              libgcrypt-1.10.1 | 3 
               libvorbis-1.3.7 | 3 
                       unknown | 3 
                  xvisor-0.3.1 | 3 
                busybox-1.36.0 | 2 
                     frr-8.4.2 | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
                 haproxy-2.6.9 | 2 
            host-binutils-2.39 | 2 
              host-rust-1.68.0 | 2 
               host-zstd-1.5.4 | 2 
               libglib2-2.72.3 | 2 
     linux-5.10.162-cip24-rt10 | 2 
              liquid-dsp-1.4.0 | 2 
            ocf-linux-20171122 | 2 
                 openssh-9.1p1 | 2 
                     php-8.2.3 | 2 
                 uclibc-1.0.42 | 2 
                  assimp-5.2.5 | 1 
                  brotli-1.0.9 | 1 
                   bullet-3.21 | 1 
                  check-0.15.2 | 1 
             dahdi-linux-3.2.0 | 1 
               ding-libs-0.6.2 | 1 
                 fdk-aac-2.0.2 | 1 
                  ffmpeg-4.4.3 | 1 
             fontconfig-2.13.1 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /tm... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                      gdb-12.1 | 1 
glibc-2.36-81-g4f4d7a13edfd... | 1 
                   gvfs-1.48.1 | 1 
           heirloom-mailx-12.5 | 1 
host-gcc-final-arc-2020.09-... | 1 
               host-runc-1.1.4 | 1 
               ipmitool-1_8_19 | 1 
                  jack2-1.9.21 | 1 
                   json-c-0.16 | 1 
        liblog4c-localtime-1.0 | 1 
                   libnss-3.89 | 1 
              libsodium-1.0.18 | 1 
libuci-4b3db1179747b6a67790... | 1 
          linux-5.10.162-cip24 | 1 
        ltp-testsuite-20220930 | 1 
          lttng-modules-2.13.7 | 1 
                    mpir-3.0.0 | 1 
                  mupdf-1.21.1 | 1 
                    musl-1.2.3 | 1 
                    mutt-2.2.9 | 1 
                     pv-1.6.20 | 1 
            python-sip-4.19.25 | 1 
                    qemu-7.2.0 | 1 
                    sdl-1.2.15 | 1 
ulog-0389d243352255f6182326... | 1 
               valgrind-3.19.0 | 1 
                    zeek-4.1.1 | 1 
                     znc-1.8.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/80949cbf6754e180216dbd0635f267f406e2c2b5 | ORPH
   mipsel    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/0441430ff28666f7d058a48fb2fe79285a327937 |     
  mips64el   |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/f0273f762d41e1ee71f702de116231decc10b649 |     
 microblaze  |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/72023a6ef95c425f7864af5c0dd6d43ae99eca76 |     
   x86_64    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/f870f2f55824e5dfcdda9b1b3d99ca3676bdc856 |     
    i686     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/40d84e893faf1c7696837fb3a27064942040b730 |     
  powerpc    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/ddf8fc73d03b568dd0416c5c03f27414cf6daa7b |     
   arceb     |          brotli-1.0.9          | NOK | http://autobuild.buildroot.net/results/6db54c10c73fbee68575f517711f6d69144fb748 |     
    or1k     |          bullet-3.21           | NOK | http://autobuild.buildroot.net/results/1ae160399238436c3fbe69b57fd196bf5acbb887 |     
   mipsel    |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/92da87b912c0873b4e81bc23470503032d24c81a | ORPH
    mips     |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/ece0ee860b67d5e938b1b623b0168635480c5468 | ORPH
   nios2     |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/362ec8d42ffa03ed0eaf8160d5336837d94819ef | ORPH
   x86_64    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/25d632d2d40fc9cea02425e58ab31d0a80444d68 |     
   arceb     |        ding-libs-0.6.2         | NOK | http://autobuild.buildroot.net/results/59d746a27546b3a12bb44cd247dea3d55057393f |     
  aarch64    |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/8ad709135f00fa4eaa34d370c4a47e5f2bdb004c |     
   x86_64    |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/aa0c52267dd75addefdab92a15551395f2874751 |     
  aarch64    |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/8f90bbeb5e73ebc7ce22d8ae5e2893307b74a7f7 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/38ec06a7e6aded362ddf7e8a0138f7c7a5f36171 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/2ce7dee4f0d89513dea804b400a7a64fa420472d | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/00f681cb4cd801547a779c252cfd09d02dd70288 | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/e09a3ccc5dfdc49e65c9fa226cb7835d53dbf8fc | ORPH
  aarch64    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/187a7ee7ee002fd95312c9bc786fddf50ed9efc8 |     
    arc      |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/52da634e1cf1a7a6b83de2a65cfe050a232c6f0b |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/1f72e3f63a01f440df6f2914cfd24dde6e525c4d | ORPH
   xtensa    |           frr-8.4.2            | NOK | http://autobuild.buildroot.net/results/c05f2b2537501ed1154640ae0de6445f8e70798e |     
    arc      |           frr-8.4.2            | NOK | http://autobuild.buildroot.net/results/8f5befd365ad8ca20c33bc3f93fbfce0ff5c3632 |     
  sparc64    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/eb03c603d24d60275da09a3e2279623a139de61f |     
   arceb     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/ca063b64357b249337df2f29265ed3062f826f13 |     
  powerpc    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/3e5b9e5043759b30b7a70caac53b50efc4846332 |     
    arc      | fs/cramfs/cramfs.mk:46: /tm... | NOK | http://autobuild.buildroot.net/results/07f9fcc47dee37a8e5618866d734b6fa550a5cc6 |     
   sparc     | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/60eb17f53541228ebaba865de2f02cbd782953eb |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/331086d3c1897abc241cb0153af4735c631ee413 |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/bf882c6b173ecff6c9cd13407c68f64dbfdfffed |     
   nios2     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/ce5147d89a71925a0423d9181131374d4428e9a6 |     
    arc      | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/117e1b069a9f84e254215484e3a15fc8e32ae39a |     
   nios2     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/9c644e1eddfc7e280e91e9adfaf04c196ab8f210 |     
  aarch64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/38dc7893f95c3d5a953623e7fa7e534e3f2f64e7 |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/4292c9c8245a69c9ae0a98b11297d723edffd19d |     
microblazeel | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/16f8515e2208c1d9e66705c991227b4c8518e125 |     
    i686     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/eb6698c5abd80bd413bd959cc4a458ca293ea414 |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/19347dbfb179ef1c1e16e0746a63d0bf513a9148 |     
   sparc     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/6cf0406976d8c7f938cb41e8284a05371e1fdf9b |     
    or1k     |            gdb-12.1            | NOK | http://autobuild.buildroot.net/results/8b31d35a8fe738f7c67cd1a04e4a1b4821d4d3a5 | ORPH
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/93a0ee72ce9cc1a2d3bf5bb33a53958d61c58cf8 |     
 powerpc64   |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/961b6abf8aa769d7619b4e5fc48a227d7f705d69 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/8a0ec3b13022f7559b4275f7396c962991758614 | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/9296d23d8af6fc451d9f5c7401aec2786d0cd6fe | ORPH
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/e474d8c360037ef3a81dd7814822286537c59c3c | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/80bd4b98937dd6c0a8e70e88f13b1653d2b821be | ORPH
 microblaze  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/daca04f55da05e5320c82aa7aa4b6d0458919828 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/df6313e82dccf2ba3c661723821856d886b6c68d | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/8c30018d8f6c63fa3a73b7e9ea7aab296957cb54 | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/a7646bb47257aa1d1a651a620f5f210e01c878e2 | ORPH
 aarch64_be  |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/bfcae99efa6fcfc8321ca34359809580a5839a07 | ORPH
    sh4a     |         haproxy-2.6.9          | NOK | http://autobuild.buildroot.net/results/c71e0867c90a31ab4d5f09e1bef94ba442d1070c |     
 aarch64_be  |         haproxy-2.6.9          | NOK | http://autobuild.buildroot.net/results/e70116f017a8effd89cdc590c1b11c7fe3614775 |     
   sh4eb     |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/676990dc0e86967790612fababcbc7130b602ef4 |     
  riscv64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/14d585e6cf54fad9cece0fcdec4e738c39b0f8eb |     
   sh4aeb    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/87d0aba849cae1205aa9bf8f41e854e02785687b |     
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/91770053bf05d44ceafc86bcb9e8653c28d20ca7 |     
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/5ce2740ad7829b03208377cff5a02be530cb2ffc |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/b07121940e7c1a439bb4b3e32e9aafe24dd55cec |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/180e2cdba2eb7d8e7c0acc49e2e3066ad34b004b |     
    or1k     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/0c6ebeae0ef450fd1a34eb3d20c04d84022f2ca1 |     
    i686     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/364a73ef5c3796dc34f783cdf65e4ecc0f225038 |     
   arceb     | host-gcc-final-arc-2020.09-... | NOK | http://autobuild.buildroot.net/results/a45d2aa0242206af65f9bc98fdfa220303d715cf |     
    i686     |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/9d074c24c43cef4bf142815b6b2c6b4cfb2fb5f6 |     
   mips64    |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/6a37d16fec6ceb724b70d565777b7cd654bcc167 |     
powerpc64le  |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/ed4e1380b1c671eb1035bd21e1dff17a4edb88d6 |     
    i686     |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/085b60a7e90a4e30bdfddcc61a5bedc39f899ce2 |     
    i686     |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/c4727ec1e1c6134a8732e9f4ccce029674fba49f |     
    arm      |        host-runc-1.1.4         | NOK | http://autobuild.buildroot.net/results/50d7c84711aa3efb876838b0eaaf5b591669c334 |     
  powerpc    |        host-rust-1.68.0        | NOK | http://autobuild.buildroot.net/results/32282380b9255890e8daabcdd5b4eb198b0e78c1 |     
   x86_64    |        host-rust-1.68.0        | NOK | http://autobuild.buildroot.net/results/1b267e955c95bfca2cca02affc75826caa39ab9b |     
   armeb     |        host-zstd-1.5.4         | NOK | http://autobuild.buildroot.net/results/048951e32d08e7cdc592dcfae9487112264ea90c |     
   armeb     |        host-zstd-1.5.4         | NOK | http://autobuild.buildroot.net/results/8460604ef428ac25c626a0c8c9ec91fadd93125b |     
    or1k     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/f1431a2e22e29d9c85faad4147b0f8c87a34ec29 |     
    m68k     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/e0bd9cf1539cae2c00d9d100eead802008a87da7 |     
  riscv64    |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/edcbeb61e1f6c603f7f075044fdc732588412ab7 |     
    i486     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/04066abf340f69ffa8a60612d6bd34cb9c219d71 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/1aae5196a5b8112d805855d1a70133071e3de972 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/5502b7cb2de9f301280c33a68fe4ef320b6ba4fb | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/75305abafc94434bbafdd4c225776302b42514fd |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/dcefba617a417ac70c007dd40d1a65876f165f6e |     
  riscv64    |     liblog4c-localtime-1.0     | NOK | http://autobuild.buildroot.net/results/77342f58e382bcc300dc9d21a0068cc691ac9568 |     
    or1k     |          libnss-3.89           | NOK | http://autobuild.buildroot.net/results/9eeafc5e395790b8282d19b4135907406aa5b0f1 |     
   arceb     |        libsodium-1.0.18        | NOK | http://autobuild.buildroot.net/results/7ff1442d5c4e7b038aac803c5633d0a6dbbd8a5a |     
  mips64el   | libuci-4b3db1179747b6a67790... | NOK | http://autobuild.buildroot.net/results/1dd0a18beca8e98ea382f1e49bcaf217e032ae97 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/af58e9f7a8c03981a74e2f8487546d4743c19122 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/ef21def5afce119d47df77ca1c26a49c85efc7ad |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/307feef2708fb37ac5605f9fb963771d5482d44b |     
   mipsel    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/37ca002716cd162f39892e56716582cc59284863 | ORPH
    mips     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/548158297a0be118cc39f172dbf70d85a41a047f | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/b13feb2db6468352d74c17bcfc9b1a27c88392bc | ORPH
   mipsel    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/1369df483823a510e0ca583f551785f07ea00267 | ORPH
  mips64el   |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/70187213f49f8bf81e43ac1767eee1972648e755 | ORPH
  powerpc    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/9926a3d75323859a293d7671573e1a6bc9b00d34 | ORPH
  mips64el   |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/5ce0899c339d5312b8647cec15b800972d044683 | ORPH
   armeb     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/a837bad6c4fed013f3c6cbf194bfb683e0552f97 | ORPH
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/5c6532d9989e5099e6cd5eb2bf1cfd985a2f140b |     
   sh4aeb    |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/0724d9acdfb23ffc1cec47694cacd0ddfbf2867c |     
  powerpc    |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/9137ad8f91284f0c8d98a25ea5cd9059501543a8 |     
    arc      |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/59b636e44e24a468e6b07556b1423f5c80d40b48 |     
   armeb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/f9e9f9ce3f8c4bcabf9e2864eee3dd056005f493 |     
   s390x     |          mupdf-1.21.1          | NOK | http://autobuild.buildroot.net/results/87128e9967cff20078c65ab847877aa44cc409d9 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/61cc2cb5900a7533e857e6f98ba03eca846d9eef |     
    arm      |           mutt-2.2.9           | NOK | http://autobuild.buildroot.net/results/262f249859a8a68d78c5c052041dfde71bd8604b |     
    arc      |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/6c4e41f5b0e680e31f4f5969b3cf51ab7bc39d00 | ORPH
 microblaze  |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/ebdb018faa30bffe6d1d450d5df3823ff2cd4d65 | ORPH
  aarch64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/a0417f011586e519bc5d14abd3a70237f379592e | ORPH
   s390x     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/e8107315abcb6ae64f1d394bb6760cdc0c54d426 | ORPH
 powerpc64   |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/1cd26d20fb1635f56890a6bffe7907cd1aa3286b | ORPH
   sparc     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/56fa118708cfa5995e7a211d3be9bf97d2152979 | ORPH
 powerpc64   |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/f3eb465d774dd14c44118f85e9b6b172e9e8bfa5 | ORPH
  mips64el   |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/185229b2b358a562b350731131cec5f430651bb9 | ORPH
  sparc64    |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/61741866fc62d6e71568efbe81f596a7f68331ed | ORPH
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/d9c759787ff4d923ad68c94f81ddd8318def96a9 | ORPH
   armeb     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/615c48f5f64aa4572a7623d51939d81ab8e8fe04 |     
   xtensa    |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/3d261e44e4710dc1d5b50a1fb36b7ee3e1e391cd |     
  sparc64    |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/7139213d105b9f0715795c04f20b9bab5f871a7b |     
   sparc     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/eb6ac97478e99db36c1036d16242006dfbb194f3 |     
    or1k     |           php-8.2.3            | NOK | http://autobuild.buildroot.net/results/c6177929685e7a958bde7648d8b886d2694c7213 |     
 aarch64_be  |           php-8.2.3            | NOK | http://autobuild.buildroot.net/results/735fc42bfda3f856b95a242f6127e7731bdf47e8 |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/70cfd887efdbb295b0d98540486ac65d4f6c0909 | ORPH
powerpc64le  |       python-sip-4.19.25       | NOK | http://autobuild.buildroot.net/results/b80a4819c8c93ed0f7987128877dd6053d210b82 |     
    mips     |           qemu-7.2.0           | NOK | http://autobuild.buildroot.net/results/6b3187ce54d2144678788e8858d437f8e3c9c149 |     
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/6923a756360498999fb3e022f302bc0b69fd4ff0 | ORPH
   sparc     |          snmppp-3.5.0          | NOK | http://autobuild.buildroot.net/results/b5b30a77563e2bdbb735b284ec47c7765d802145 |     
   mips64    |          snmppp-3.5.0          | NOK | http://autobuild.buildroot.net/results/11947f8d7d7c3758edc76bb479a41685387a51ab |     
    i686     |          snmppp-3.5.0          | NOK | http://autobuild.buildroot.net/results/0bffaf5f0c43e378d5467e47c831014e0b79b0d4 |     
powerpc64le  |          snmppp-3.5.0          | NOK | http://autobuild.buildroot.net/results/e55a9448f6db8b0e77eb39ec741d79d28cc6e01b |     
 microblaze  |          snmppp-3.5.0          | NOK | http://autobuild.buildroot.net/results/e5f508f71da132ca4630c25828d20aa6b3bba61a |     
  sparc64    |          snmppp-3.5.0          | NOK | http://autobuild.buildroot.net/results/f22ecb3f23c735d000b97fabd544e16757777b28 |     
 aarch64_be  |          snmppp-3.5.0          | NOK | http://autobuild.buildroot.net/results/b9f67466da4b9e9614451b765e2f9f050a9cb05c |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/b7aca02de3ad9171e118bd93bb589ccc2d36b750 |     
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/4650141c047c542b842ec0c4831b348d76feecb9 |     
  riscv64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/c61228874e38b560ba144fb5def72cd7d363dcbd |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/a3807f857c72667086f310b21dbb705f3e37e1a5 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/6473af77f914f805efc58e5b1d3cd3d4adaea8ac |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/8872d05c9e1801a5d0d7c777d36f88eafc6a10a6 |     
   mips64    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/955b6a50ab52eaa04ef8997682123316d250b5e4 | ORPH
  powerpc    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/d60714f8a1420bae10ab33d5209b2efd3038daab |     
  powerpc    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/a4ca45abc895447258111479b72e738abe1c41ac |     
   x86_64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/fdf211aab3a05f25462227b4aee0883118b44b53 |     
   s390x     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/da8a2ffc750ee7710dd5db6f4fc6bd57816e97f8 |     
   x86_64    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/8a1b2400f6d9a021703a41b202f9ee7fcf685a02 |     
  aarch64    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/75a81596fc364c950c1613e1780c225e8e5ce768 |     
  riscv32    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/384b7164eca47e13505c0b2df29e66e28f817a74 |     
   sparc     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/331570a4233fd476625df9dec7bb4b08f60a3182 |     
    i686     |           znc-1.8.2            | NOK | http://autobuild.buildroot.net/results/fde3c541a5bf24f5990b22b0d77f09c933182a35 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

  gobject-introspection-1.72.0 | 2 
                  acpid-2.0.34 | 1 
                elfutils-0.186 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                      gdb-12.1 | 1 
            host-binutils-2.38 | 1 
            host-binutils-2.39 | 1 
                    libndp-1.8 | 1 
                   poco-1.12.2 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/c4b98a6c36c6cfb662b69b6dcbe9c779bfce71ef | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/173ecf8720398b362cdbe6e6578067f71eb0b7ef | ORPH
   mipsel    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/52fa19a799f86969cecaadc097eb3268da14bae8 |     
   mips64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/35af516c8acd88fb60742d6078df2a42e540014b |     
   arceb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/6a6268f78dc50a1761d998d39dd9c34aaceabc9d |     
    or1k     |            gdb-12.1            | NOK | http://autobuild.buildroot.net/results/8aa4fd45174de02d6156a7d02932ee2ffd126fcb | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/6ed12effd30e615c9d120b7fa4129ec5b6bdc4a9 | ORPH
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/8816ca208a50225db4fae15e80d5d141578d5a73 | ORPH
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ed0bf9a251bb689e41f2865b4995c6164c38d994 |     
   x86_64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/f380d4d6a964ea40cc3d31422a99e6ba8c0207ec |     
  riscv64    |           libndp-1.8           | NOK | http://autobuild.buildroot.net/results/fca7a89b73e5d123af927a068c967cf3d22304c6 |     
powerpc64le  |          poco-1.12.2           | NOK | http://autobuild.buildroot.net/results/54886beb2cd4e2a82c1f768a39887d0c60172996 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
