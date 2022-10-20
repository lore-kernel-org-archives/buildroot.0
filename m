Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B01C433FE
	for <buildroot@archiver.kernel.org>; Thu, 20 Oct 2022 05:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F1754198C;
	Thu, 20 Oct 2022 05:42:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F1754198C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ugyKRd8YJwI6; Thu, 20 Oct 2022 05:42:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD2FB4199D;
	Thu, 20 Oct 2022 05:42:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD2FB4199D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C2FE51BF3DF
 for <buildroot@lists.busybox.net>; Thu, 20 Oct 2022 05:42:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9477F60C21
 for <buildroot@lists.busybox.net>; Thu, 20 Oct 2022 05:42:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9477F60C21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pJNahrP9pFUk for <buildroot@lists.busybox.net>;
 Thu, 20 Oct 2022 05:42:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3492760C02
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3492760C02
 for <buildroot@buildroot.org>; Thu, 20 Oct 2022 05:41:59 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8047EC000C
 for <buildroot@buildroot.org>; Thu, 20 Oct 2022 05:41:57 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 20 Oct 2022 05:41:57 -0000
Message-Id: <20221020054203.9477F60C21@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1666244517; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UGZDMx7XiFO06IDS/qQb30sUE5SzLRMPtNj7u+zLef8=;
 b=MQaO9NNCmjAVNQdGkub78re9Alw+fGXO4yNY8Z3Jivuu3KA6H/VctRUppN5CPZD4jjUz/T
 Jm479lsxylDUg/SLHQfzKWOQKD5Db+OnZ3PJgz/amRW+gIGeSvnzZPMpnE+RA+sd3VYTzx
 e26UCJpemQ2lQhPDGdIwleGDAnBFfNavmaohZWktztu4lxA6hHrMjYVCqF5wnKAhFkFjRV
 FkGkw48aHuSXq/URWnPvsGvavRGiMigAbXBFu8ngJe1R8Oe/K+Vo4xdyXLb6n8WyKJevYx
 AawNhw0VEd8GXF95UkWwQM9VwmBGBafd6P2mmhRVtCDohxqa/fwwnZkP0sFywQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MQaO9NNC
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-10-19
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

Autobuild statistics for 2022-10-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  2  |  2  |  0  |  4  |
  2022.08.x  |  8  | 11  |  0  | 19  |
    master   | 152 | 358 | 12  | 522 |

Classification of failures by reason for master
-----------------------------------------------

                   libnss-3.84 | 23
                      crun-1.5 | 17
                  autofs-5.1.8 | 15
glibc-2.36-44-g2628500f5dff... | 15
            ocf-linux-20171122 | 14
                        brltty | 12
        host-sentry-cli-1.59.0 | 12
                 systemd-250.4 | 12
                 sysvinit-2.99 | 11
        host-f2fs-tools-1.15.0 | 10
                      xz-5.2.7 | 10
                   linux-6.0.1 | 9 
            igd2-for-linux-2.1 | 8 
             batman-adv-2021.4 | 6 
            btrfs-progs-5.16.2 | 6 
casync-4ad9bcb94bc83ff36cfc... | 6 
  gobject-introspection-1.72.0 | 6 
            host-binutils-2.38 | 6 
               linux-pam-1.5.2 | 6 
                     file-5.41 | 5 
                gerbera-1.10.0 | 5 
                host-go-1.19.1 | 5 
             libgpg-error-1.45 | 5 
                elfutils-0.186 | 4 
         host-gcc-final-11.3.0 | 4 
               libcap-ng-0.8.3 | 4 
               libglib2-2.72.3 | 4 
                       unknown | 4 
android-tools-4.2.2+git2013... | 3 
dahdi-linux-5c840cf43838e06... | 3 
                 dash-0.5.11.5 | 3 
                 dmalloc-5.6.5 | 3 
                     efivar-38 | 3 
                       gsl-2.6 | 3 
            host-binutils-2.39 | 3 
              host-rust-1.64.0 | 3 
host-spirv-llvm-translator-... | 3 
              libarchive-3.6.1 | 3 
          linux-5.10.145-cip17 | 3 
      linux-5.10.145-cip17-rt7 | 3 
                linuxptp-3.1.1 | 3 
                    lxc-4.0.12 | 3 
                 mesa3d-22.1.6 | 3 
                   perl-5.34.1 | 3 
                 fdk-aac-2.0.2 | 2 
                  gensio-2.5.5 | 2 
                     gmp-6.2.1 | 2 
host-pahole-73383b3a39afe86... | 2 
              libgcrypt-1.10.1 | 2 
                   libqb-2.0.6 | 2 
                     mtd-2.1.3 | 2 
                    musl-1.2.3 | 2 
                  ntp-4.2.8p15 | 2 
               openpgm-5-3-128 | 2 
                    sdl-1.2.15 | 2 
              skalibs-2.10.0.3 | 2 
                xenomai-3.0.10 | 2 
                  assimp-5.2.5 | 1 
                    bat-0.19.0 | 1 
                  botan-2.19.2 | 1 
                    brltty-6.5 | 1 
                  cairo-1.16.0 | 1 
                  check-0.15.2 | 1 
                 dc3dd-7.2.641 | 1 
        edk2-edk2-stable202102 | 1 
                  exempi-2.6.1 | 1 
                  ffmpeg-4.4.3 | 1 
                     frr-8.3.1 | 1 
fs/axfs/axfs.mk:32: /home/a... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
            host-binutils-2.37 | 1 
         host-gcc-final-10.4.0 | 1 
         host-gcc-final-12.2.0 | 1 
       host-gcc-initial-10.4.0 | 1 
                  hostapd-2.10 | 1 
            igh-ethercat-1.5.2 | 1 
imx-usb-loader-30b43d69770c... | 1 
                       kmod-29 | 1 
                libglvnd-1.4.0 | 1 
                  libsepol-3.3 | 1 
              liquid-dsp-1.4.0 | 1 
        lttng-babeltrace-1.5.7 | 1 
                numactl-2.0.14 | 1 
                opencv3-3.4.17 | 1 
                    php-8.1.11 | 1 
                proftpd-1.3.6e | 1 
                 protobuf-21.6 | 1 
    python-cryptography-38.0.1 | 1 
           python-pyqt5-5.15.6 | 1 
            python-ujson-5.2.0 | 1 
      qt5webkit-5.212.0-alpha4 | 1 
            quickjs-2021-03-27 | 1 
               tcf-agent-1.7.0 | 1 
              tinymembench-0.4 | 1 
toolchain-external-codescap... | 1 
              traceroute-2.1.0 | 1 
                 uclibc-1.0.42 | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
               valgrind-3.19.0 | 1 
                    volk-2.5.2 | 1 
                  xvisor-0.3.1 | 1 
                  xxhash-0.8.1 | 1 
                 zlib-ng-2.0.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/4a11b41ac097454ced5bfed4b93c2cf228b818eb |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/fbaf2814553ac6844b1b12043cef4a8af74741a2 |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/e054f275e07698632edb5ef48af7091a685812bb |     
    mips     |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/92e113771b5a1b80fe78a07c80a447021e586e0c | ORPH
   armeb     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/37bd95f169551f49a46c3dc445a3504bfbed2b9f |     
   mips64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/d3faeb2dd796ef05b3efca52c806dbeccefde046 |     
  riscv32    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/3d2819a5e9ffc1857f8d9fff0e3615d39d1c65e7 |     
 aarch64_be  |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/ff0d22c056159ea51b0fb868be809dec4cfef30f |     
   mips64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/2adf4c5061422b8758f9b2f65416a9e0a3f95e53 |     
   s390x     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/9f8e8c7f971714f00aee960a962fe3e72c65ee3f |     
   s390x     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/48311a912039de443aea0b2d67dfb0a8b5abff04 |     
   nios2     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/412781a4c6aabbca0441d52f049ea4acd33dbacb |     
    i686     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/5fcf404f270451c11aecf72261e47ca56c8de708 |     
microblazeel |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/36ed9293ef1d4414c80047e14562766dd4775284 |     
   s390x     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/765d90b6736e5724d387fc530f4dc76c982f7bb8 |     
  mips64el   |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/e8e252cf5d9cb3e01ad93feab5a09ec53b3e9c85 |     
    arm      |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/62d6d641934eebb4098ef1c50912f06af552c2f4 |     
  sparc64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/cce473d371fde10d4de3bf77e12bee6972889f6d |     
  riscv64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/f32f595bba34e8d4023998d5ec91eaf40f342794 |     
    i586     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/ae07a66c7835d1885266cd38a69ba58a5c09d68f |     
   x86_64    |       batman-adv-2021.4        | NOK | http://autobuild.buildroot.net/results/421550c768a4492e01f6c500990f07ccf5490ab9 |     
   arceb     |       batman-adv-2021.4        | NOK | http://autobuild.buildroot.net/results/fa85017d4f0b8b94c155c56d94b4bfa742741ad5 |     
    mips     |       batman-adv-2021.4        | NOK | http://autobuild.buildroot.net/results/2881ecfa1bca5cdc34b3b076cfda2ac36a02cce1 |     
    or1k     |       batman-adv-2021.4        | NOK | http://autobuild.buildroot.net/results/113c71333b7fb94fefc7112747b73b0c92271825 |     
   xtensa    |       batman-adv-2021.4        | NOK | http://autobuild.buildroot.net/results/33f70224be5e1a93bdff8fff709dfc927fd775f3 |     
   armeb     |       batman-adv-2021.4        | NOK | http://autobuild.buildroot.net/results/b21441e67e2d7d83e9c7b173bb11bbe97ba057fe |     
    mips     |          botan-2.19.2          | NOK | http://autobuild.buildroot.net/results/318956ea8e52e1399553590d8f078c3f79aea824 | ORPH
 powerpc64   |             brltty             | TIM | http://autobuild.buildroot.net/results/6f0b660645d3e7f4fdd51cb1f90d8f465590419c |     
powerpc64le  |             brltty             | TIM | http://autobuild.buildroot.net/results/dfeac5e875a488c8fa22b24aca307d5500774a56 |     
    or1k     |             brltty             | TIM | http://autobuild.buildroot.net/results/13215721fab687b04dbc6702537ebc39f9594805 |     
    or1k     |             brltty             | TIM | http://autobuild.buildroot.net/results/549f38bf8be08161e64f699897d28c3724f1dcdf |     
    sh4      |             brltty             | TIM | http://autobuild.buildroot.net/results/ee53045533a251b05bdce7afb12c48844e462b11 |     
    or1k     |             brltty             | TIM | http://autobuild.buildroot.net/results/782c47f8fe46ee06e38b198563bc498987b2bade |     
microblazeel |             brltty             | TIM | http://autobuild.buildroot.net/results/3d01e60acc09b23b779ae33a4049c5cb92b5112d |     
powerpc64le  |             brltty             | TIM | http://autobuild.buildroot.net/results/d21a867dde6818af074c605c1378df60c6174cba |     
   nios2     |             brltty             | TIM | http://autobuild.buildroot.net/results/bd1f86ada702f981fcf037fbda8bc4f834184abd |     
powerpc64le  |             brltty             | TIM | http://autobuild.buildroot.net/results/8190d672d5a5e269c8c7446c464e9c28c5935503 |     
  powerpc    |             brltty             | TIM | http://autobuild.buildroot.net/results/769889a2d3854253af28e5a185117bb29d42731d |     
 powerpc64   |             brltty             | TIM | http://autobuild.buildroot.net/results/2ccce94d44a01ec1eb9b9204b681d6583b96da39 |     
powerpc64le  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/1e15d17c24934d3b15188f3dbfd168ebc5238f7a |     
   mipsel    |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/dd255297533964616abf4b63a48e3fbacae21681 | ORPH
    arc      |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/c5f43bbc69c8d5ec4a8e03f3df734c49be5a34ba | ORPH
    i686     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/662058374cdd5ff8c0f68400bce1675eb0583bdb | ORPH
   s390x     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/f0c923a9378090891bd6a712b6f9cb245bb3f16c | ORPH
    mips     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/de6bec1f85103725bc2227eb19c62132e98aafa3 | ORPH
   sh4aeb    |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/c9e713af5f4b478108cb19ad050c2c5823796f12 | ORPH
   xtensa    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/f7760b2fe8fbadf08cf57924fbbfe42f58b785fb |     
  aarch64    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/86c927fb296b7e7a5d63c28124229c85a6d35dd3 |     
   s390x     | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/2ec48e270cf1feef4631129bf10c185f7f23a153 |     
microblazeel | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/2a342b83e74c286c123b9dc5155ee1fb578719a6 |     
    i686     | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/79c0b77870694fcc0da5cd34e525dd2df2267453 |     
   x86_64    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/45b25ad1b6ea71255b8201a7a931849c56147a81 |     
  aarch64    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/62694be0ba16d26bdd1b06e9178ad04fb084325d |     
powerpc64le  |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/f1988aed0b9cdb8357c1da7b8b9e96a9560e6c0a | ORPH
   x86_64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/4e9158a5cf2e19de0f825ff46b5fa518d8111d71 |     
    m68k     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/83b94d14883ffa8d4736af40df56b0cb18704256 |     
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/78d500c3c64aac8a6316b3ae2ffd9ff06587d9fd |     
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/e7d5295814745553a36ecc883d0f34b4a01c51bd |     
   sparc     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/3cb31c04e5566f6f2bc944b86b5513e2d0b88098 |     
  sparc64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/e4e8b469554e573463ed37b76a1de81d2f74098b |     
 microblaze  |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/05bf95901ef9478b83a10b88e0ab23de4247ea6c |     
  sparc64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/5e0a55071c2fe4f76aa836c66c3b78f63a91a568 |     
   mips64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/1786b321e1f0578198938f56bab02f67f09422e1 |     
  mips64el   |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/bed74dc968b9de8ab3a067b901fb45ee37cad634 |     
   nios2     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/e87d56d3095d33cc55d96190a1e347a09a6b9b6e |     
   arceb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/896fc1a4753bb66b35da45070038b772cc34382b |     
   x86_64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/eed90ebbb5d02e2d604dd9367b340d1afab2f4a0 |     
   mips64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/a1c31054cd684f440850b84035c0e63168761b16 |     
    i686     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/1daa77e95bee8b58345bff3eef594a62b7825db7 |     
   mips64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/9f621cbe2d0c0b523675ad6373abda7be042df09 |     
   arceb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/41108fe5135aac33acad80a6ff6a14fd9a5c78b5 |     
 powerpc64   | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/6aa9404bb38813f9e6dc81ec1670156ebdda840c |     
    i686     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/17474acdd9c57de7bff5996b525cfbd05c621eab |     
 powerpc64   | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/983db8350ee015af9268cd6b5069633f97711519 |     
 powerpc64   |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/18b40d13a2b085560c6f3b74fb1d16ded972bfd5 | ORPH
   xtensa    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/e317e562158bbf2fa1f81408dc3bc11737e9d6b8 | ORPH
   mipsel    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/44dbf5da89b0d6e89782ea34a393462b1a2e02af | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/75551f61ddb47b3af5f71344dc7d887aee2538e2 | ORPH
  powerpc    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/739ed97487b531c1ee8237479a4d3c99cd570550 | ORPH
    i686     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/110a79954de26ba6f7804c3c8b77995a4d3d78ec | ORPH
  powerpc    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/c3f91d57612510dc740e347c8a085b6b306d528c | ORPH
  aarch64    |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/671f30a2eb0d4a1dcf001308a2f0c1fa98325ef0 |     
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/0d3aadfd013c0b13c92390837861d1cc14b62c87 |     
   x86_64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/55d584ba7a435abdc5f728282815c88de83b6be0 |     
    i686     |           efivar-38            | NOK | http://autobuild.buildroot.net/results/d1ff546372b268f035e7cf6b0bd3550735d28238 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/62753da2956ab1c636029572511dc0b1ec62bf2e | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/4f4f58e6e4d0fe51d1a884d2310e1b498c1884f6 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/073dd09a2880f4272c78bfb25e57ab1cbad7e072 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/954384bc1586dedaf5aee4fd2b8c705a17259822 | ORPH
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/3d6ba6a133b68c117b9dc410a5e20005d4ebb59d |     
  mips64el   |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/1bdddb2e1856719234b0d1b6e503c4d78995eb3d |     
  powerpc    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/cfebec63f96ae482ea2229f43d114d9917353941 |     
    arc      |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/30f62594d9ddb08804096840b51af457d2dcefd0 |     
   armeb     |           file-5.41            | NOK | http://autobuild.buildroot.net/results/21f180fd5375724a3ff16ed5e53c33713e8578fc | ORPH
   mipsel    |           file-5.41            | NOK | http://autobuild.buildroot.net/results/0675dc14089e511eab207e3199d00a57ea5c6467 | ORPH
   xtensa    |           file-5.41            | NOK | http://autobuild.buildroot.net/results/900f497dafc73eda2e435cb879b45610fcc71ad8 | ORPH
  mips64el   |           file-5.41            | NOK | http://autobuild.buildroot.net/results/2dbb592db1b48d96d073349578214e6312a955a6 | ORPH
   x86_64    |           file-5.41            | NOK | http://autobuild.buildroot.net/results/5da673c1f5c3e7eb72afeca622534e4b47dbfcb7 | ORPH
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/5e1644ae3918a38b7c470c435aa24b8be492b812 |     
  mips64el   | fs/axfs/axfs.mk:32: /home/a... | NOK | http://autobuild.buildroot.net/results/a7e3a874e1b84f61e6f4700aba385bfff6f93e6b |     
 powerpc64   | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/d7d8871d1e94a18f5f99e0650d3e1ae348262fb3 |     
 powerpc64   | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/14b96bce717c4e265343c038140c575ada9db58c |     
 microblaze  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/748c863915fc60ad1fa1a77b3b89b3fc3959888c |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/357987b6d31b14648f74d08443abb5819616fb33 |     
   arceb     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/b666fa63795e4649429a24c92d445c409496a419 |     
    or1k     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/fb30074418663243986f649f2db48c503a4d44bb |     
  powerpc    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/39116036672cb3dd4373b97a9838f0abf6ee8dec |     
    arc      |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/413446b13e8d36965effbc6180e01f16693af032 |     
 powerpc64   |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/f19604c8805e17418b3137ca5b25562102d3fcbf |     
   x86_64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/9f8bc57ec3ba6078c9001148d772d88d58384b2a |     
    mips     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/8fa75fa041ad3a8e0d5eab203c2ec54ff3c29b57 |     
   mipsel    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/0ac19064e46eb2d2ebccd6155fcde076c0643c02 |     
  sparc64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/5f3043c2c978e041d5b3a6fb4d5d1fcf05cf0407 |     
   x86_64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/a42ff368863ffa9cd7a750acab91c13fef428b86 |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/61ba7f22ea7ef8f88a69ca75dd191f076ce1e462 |     
    arc      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5815bb03c23c910f6477e3dbfa8afc34c3a0e45e |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8543e8a1461baafd3c9e24d5493536649c12c8e6 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c6d2604467a492da5964a772bfb368bbde1baedd |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1a6592a500021e118792af92b193b217eb74ca06 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f11847f3d9009767601da9cb73db888cad99c7ba |     
   sh4eb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/da8ab8c68950f153165a05032fac5f4e2d4938db |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/83339736d35d4e833460df9597e9807044f846e1 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/71da25323c2487142ff845d56641d9e99b03448f |     
    arc      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6174cba06943c6d36173a6e85add6b32358d8261 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/bdbf5fdf373edbabf98ccd89de0c324c149763c8 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2765ab2c6a68abef5db3151ae1450dd88840cbbf |     
   x86_64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5d721bc46c18b899eec4111ad67b4dcab1edf73a |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6c8cad096e85f7d16d4773782c6fa5a8cb4202de |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d1e2b48ee68755bb01d5f134c286c7273c54dc2c |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/2467bae7c6abbeabc7573150f794315daeb78652 | ORPH
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/b110b0c7e89589d82f72c0930d2a4de8df49db82 | ORPH
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/c7b0ed42ef86f94f9114ff352fe55867b13bf29e | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/0eebbcd5519ccc06f167b8ed8b2af12f5487f8b9 | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/4f02f7e18ac2fca682cc03134c24df115bc519a3 | ORPH
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/e0e8fb301d61d91b609a7b79cea0a3e21d683aea | ORPH
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/55ff2b6832d38b8ab5947d6135ee89b14c7a603c | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/328312053808e3e144af61cea81c64af8aa6e333 | ORPH
  powerpc    |            gsl-2.6             | NOK | http://autobuild.buildroot.net/results/b08c35feeaea9e28373bcd6c7871449ccc6652f2 | ORPH
  powerpc    |            gsl-2.6             | NOK | http://autobuild.buildroot.net/results/95ed2eb218d12740fc3b5aaa41a47f6e455e96e2 | ORPH
  powerpc    |            gsl-2.6             | NOK | http://autobuild.buildroot.net/results/92aa845462606b5fa40e764f7c6b7438e9fe3a69 | ORPH
 powerpc64   |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/bd6f3c9cf1eb4c6d1b9a2d5340928c6e61852729 |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f2277d43beef37a3a5beadf8647b62638c8a2a27 |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/20006cdd56a49bb5cf5f46ea1f1b0b78d8bb0145 |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/0abf680303125dee0dcad067f2c4888bb0b8d14b |     
   xtensa    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/c7ade9d4e0f08dea1baffb9469daf9f2c6409a74 |     
    i686     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/fe3595dc36fa008d120c3118219d8059a7342117 |     
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e9946f1a86860a367364d4b4643efca4a0753f9a |     
  riscv64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/394ade72945f66d3c2932513e976dbc6954eb35b |     
 microblaze  |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/b9eab680916103372be57b9eb6e568d5e6db8d89 |     
   sparc     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/bf083c608cafa36ea77588637ad027ea6f272575 |     
   x86_64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/8a80d972453cd9adfd8c42a1fd248c97fc27cef5 |     
  riscv32    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/319a832125df11e26eb432067af929e56feef132 |     
 microblaze  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/b587d41eaeece0de0297ea58d46d4f0d9090e40e |     
 powerpc64   |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/aff2c9f613bca4c6c791d4fcba98f450e3c0bd2f |     
    arc      |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/c259d2cdb4d362a780068ef5e10c5aa0334a9509 |     
    or1k     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/e2715bfc5dde8cf69a6e825d10ce387a061bf104 |     
  powerpc    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/4761230b3a77dc79afb7661edc305dff6aac1e14 |     
 microblaze  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/b7abc383ee6614384a6210445a31eb1e016f7247 |     
powerpc64le  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/43f53c5b47a09c257eca5b0506a4e346acc7dfe6 |     
    arm      |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/903d7ce02765a5703543e33037683ddaa4749835 |     
microblazeel |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/4470a319f3286d6e834af7bcaad8f1fcf91d92b8 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/0a9f4fb42700805938d180f4555450df494547b0 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/b3aa3b904d3830b864ae6a74609809bcd60df66c |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/f788cf9e11ce848c00034061106db58b0a6d59b1 |     
  riscv64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/3f8faa5357f52a79ef94ac19473be8a3873bd6f6 |     
 microblaze  |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/f1f7604b032e8f950b9114ce7de7da91bc285c48 |     
   x86_64    |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/c3a7bd063bf9d0f6597d111ac5d45486e8ca61ff |     
powerpc64le  |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/9ba02da2b7ab14cf6b7d761edab21cc60cfd0144 |     
  mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/857fc94446363aecf96346354ca1aa2f20dc589c |     
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/ca2a6754c224012412ca7d3d22659f69019950d6 |     
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/33eeaf18bad628fd7017f02e961575d83a94d59b |     
  aarch64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/fa61188d35f41daf7cd9164ceafe4684fe5c08cc |     
 microblaze  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/5095ff0f2d4042fbf50fa2f97b2498534282c646 |     
   sparc     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/51643b4f0875563af1da8ad16e4235dd910c8b6f |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/3f5aa26c9d17d994dd371a4b298033900f939045 |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/e39058b6823795fa16de6487e57b05586ceb2645 |     
  sparc64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/d51f3405670139a6776f12faef3e872c304b1399 |     
   xtensa    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/01ba7a775400b5fa2a0293a4567d826cb8687aae |     
    m68k     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/300c38b60b610cd9e3951f21ddef57151e52bf4a |     
microblazeel |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/bdbce15e30447054494075245f5968d85f2b3d72 |     
 microblaze  |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/0ed64f6dc430ecd67dc9b0b9b03b450ff32296c6 |     
 powerpc64   |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/9a16e31b1b49ba45fbef1a8a9b0ef6d8c3ee85db |     
    m68k     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/900840c239b0d91edc0a95a302709399fcad5031 |     
  mips64el   |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/9ce2372c5687d39e242f1ac1326adebcf80e5974 |     
    m68k     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/87ba17dc66b50191c1f79fc5c79521e497d5db1b |     
  riscv64    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/bf58ed50d9352efefecb25c2cdd904a876d4328c |     
 powerpc64   |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/f3b634d665ccdc828dfd1a99d7cab08e65ec3c7c |     
  riscv32    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/477dbf161dee7c3cba225a86035da5cb0f2e4e96 |     
    arc      |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/3576edc8a27d1ce89902dc5e70e4fb92756d7c2d |     
   x86_64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/2320411ae15e0c27c002e92c84cedd090d22d388 | ORPH
   armeb     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/6b302d32ec0d377d3c4eaa1c4c25d8a26d241803 | ORPH
  aarch64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/9812b259abf4e8c0957741ddd16b9ad4bf034b4a | ORPH
  aarch64    |          hostapd-2.10          | NOK | http://autobuild.buildroot.net/results/67f5896a90cd6b3e497f1ba8fc8eeb381ceff499 |     
  mips64el   |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/c57d1eddd89b5c5d1b23e40130dc96197ece5e7f |     
 powerpc64   |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/25fd4abb66d762199624c630c4ee1c96123156e2 |     
   mipsel    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/7f21cc319fdb43f5393588008c8ccc48e2b41ef4 |     
powerpc64le  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/844dde054acdf32a316f76de318160c4e7381215 |     
   mipsel    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/9d20a4f9b4885d86e3733517e0a963999ddcd3ff |     
    arm      |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/8c6c2cae3da4788f3907a928a25d7d9d1bd4044f |     
 aarch64_be  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/10f7f642a4202ebb7c542cb97c24e38a713f8c6e |     
  sparc64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/32529307a19e94518cec841ffab7af35f6a784ba |     
   mipsel    |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/064b61ff692421cf1c206b54c20017c4801ac8ab |     
    or1k     | imx-usb-loader-30b43d69770c... | NOK | http://autobuild.buildroot.net/results/ca1f740d844cd8cd1c8999f1447259cb4b02d4ea | ORPH
   x86_64    |            kmod-29             | NOK | http://autobuild.buildroot.net/results/7f4628ce3bb96505c99edfb2d04f99e92638e1cf |     
  aarch64    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/2a62c597130cf382f64cf5f4dce87fd070af152b |     
   mipsel    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/cff2d2ca1156326aa9afa7bd6d943ec5efb9ec84 |     
    mips     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/1b29ff7ebbf8c12f667096eda9187d7322198990 |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/36d2917455f18218648ad5a64b9a67cddeeaf510 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/7512e3f765a24572433db3ebe4aa77419b489eeb |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/14cda905550aefac1cf3199283f18b22eacdfa7a |     
   mips64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/685bd3daed60f0439f34e200c5b2561e5fb70ad9 |     
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/dc696d66b4db52300e4916820ee31ec5ace9dea0 | ORPH
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/89268ef3021c0f760c77ad1c4407523d56aa1771 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/4fc9d1d4885c27cada2da5e643640deb6ba317ae |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/76594fcdf4d4245c4e94652d7d3692fa46ab41d4 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/c5d2ed1b26a9e1bf11babc81f927120b27b81cbb |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/c2e91fd8ff80b72f524f2d8fc84a26835dcf530b |     
   mips64    |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/fe2042622141305c9b8d7e654080483140a8f9c9 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/c3195b011a5e49049ef459ad262ee2002edf2fbe | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/11804108045d1b1f8b8107e1044a283b83bcc7d9 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/f395d7f718e69a4971ec5be2775fbc53a0f3590e | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/4ace9ef9dd6daa4033ccde29ccb81216104c8042 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/5c00a103a5b94e9683c53cf468b77817a1d7c1c9 | ORPH
powerpc64le  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/9a174459b7fa6ff5c3474251f9891e52f5f125ab |     
    i686     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/7c0ee1ef546758a44e92284ccd7ed54ddc0dd441 |     
   s390x     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/76528c63f0e041eee314329f4ad7d7a21bd25e3c |     
 microblaze  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/c738a370271b098f262e4758e600cb79ddd4e1bb |     
   sparc     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/2386227b2c59cac4ac0cc7a4f96b1d4160b0419c |     
   s390x     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/4a99989d5b54428286426d2fab846b7214ec067c |     
 microblaze  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/81944839fb883301d9a89d7e0ce837044867bcc2 |     
microblazeel |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/65de55706c547373c177b4f8f3b11ec72d43c388 |     
  powerpc    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/6c4639c944a054c6b9d4488108478d46fe912a9e |     
 microblaze  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/3dea917cc4d2c064f9478d095f48bcf4c68e539f |     
    arm      |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/23cee4db30539cbeb2258d534ac639a179697177 |     
 powerpc64   |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/085c4cbbcfaf2a218bd90cad377a803617cce557 |     
   arceb     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/ddfd742faccc2d9a8036e0efbb1206deff38a416 |     
 powerpc64   |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/34197473a31b52725cd50734e8bd74538c475115 |     
 powerpc64   |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/3349b1b993cd6378c7d1679026164b9c43b445f1 |     
 powerpc64   |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/df7c3e215019154226d804e8489c50279dff8da7 |     
powerpc64le  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/1ea2c89a3f584ee759623414944bc99bb92d8ff0 |     
   sparc     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/ef2c0c71774beb5938bd0fec2fac5614380aea46 |     
 aarch64_be  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/8bffb177c665599de778be32e301f0dc0b63016f |     
   arceb     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/5bd00c22dcfea959f23406b30fb0be400619866d |     
    arc      |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/757a6f14306badafb453cc3780fe062586c2b1e6 |     
  sparc64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/33e0c151d8ce99b5bc0ee4111ffdefa8e2dca300 |     
powerpc64le  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/7aff30ab3d72b594117c300144faf673f8386de7 |     
    m68k     |          libqb-2.0.6           | NOK | http://autobuild.buildroot.net/results/832012b1dfb6d64a03e58571645700b78a533627 |     
   mips64    |          libqb-2.0.6           | NOK | http://autobuild.buildroot.net/results/1d5af2b455faa56677261096f43ed06c7ebdeac2 |     
  mips64el   |          libsepol-3.3          | NOK | http://autobuild.buildroot.net/results/e956588c5a7723ca94bc8bb72776af4f1d1b0363 |     
   x86_64    |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/207dc8976deae08cfbf0108f59d49a222bc60005 | ORPH
    arc      |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/4301733f400bd136268fa4320e905cbc7103147c | ORPH
  riscv32    |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/402a1680c21690a653d07b92445549590211d1f4 | ORPH
    sh4a     |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/912dc3eab87132bddd72f9a4703f6ae28f2a145a | ORPH
    arm      |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/23ae7a94f35f4940e6893afcf3aa915d35841dc7 | ORPH
 aarch64_be  |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/3e3fdd346d5d9918684f4ff43a92ddc92eb78d5b | ORPH
    arm      |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/70ff43d39f88c50e937112701055e4b520fd5ed5 | ORPH
    m68k     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/7a4dd5a180323d8ae18d749d28ba2b96473ea986 | ORPH
  powerpc    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/bb1cba858db7d9bd557635f4634991b2d149e59e | ORPH
  mips64el   |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/d96fc8fbbb444cfd6c0ad9ca2c291f37c16e78ef | ORPH
    mips     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/48bed0d207a328e58ac797aebce1c47cc747b930 | ORPH
    i586     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/14f65003074ccde76c9185be9e11363e95ba6e3d | ORPH
   sh4aeb    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/31a843f18832a0daf10a0c0b5077520774e72730 | ORPH
  mips64el   |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/a1b9b7b5709bbadb64277e13c0b406a94f77286c | ORPH
   mips64    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/5a5d0ab12796038e1833212cccae6274c974bf8f | ORPH
   arceb     |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/a57ca0f45556a05d1384e6e18d925128401f66a6 | ORPH
   x86_64    |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/032e9a2d69f3286948755e6edf92429ae5c75688 | ORPH
   xtensa    |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/b0919104f9346185d97ab998d4518c1ccaabf6be | ORPH
   arceb     |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/b78c76d671cd1eb71fd6a21603d8b3f1c4f250a7 | ORPH
    m68k     |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/c6b46073a4ec0419e2e2e9b0f5877a4ba4645118 | ORPH
    sh4      |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/bb01a5f7faea8ac375031bf7d221c00df76c3e01 | ORPH
    mips     |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/11b969aa97dc06ec7932a4a79f00c6721e9356b8 |     
 aarch64_be  |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/61d6835372ce12932e0215d24d237846e8b86655 |     
 aarch64_be  |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/94f3f6f798a501668944d77412ee3e98a15cf1b6 |     
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/cb6f9192e7acc08d51cfcc6641e57e9a79a7d8c5 |     
   mips64    |     lttng-babeltrace-1.5.7     | NOK | http://autobuild.buildroot.net/results/dbd68ce26423f4ff0a56f8075664bbc8ce9b5534 |     
   nios2     |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/420dff9e081be3f46c0cf971b0f1359bd4467448 |     
powerpc64le  |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/8bbed37e1443ebc48d814ead4b15bbc1b2dac500 |     
    arm      |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/b52205898dcad4ab5717a6dbe57c9d356b33518a |     
    sh4      |         mesa3d-22.1.6          | NOK | http://autobuild.buildroot.net/results/3dd22b1deba18939e8817423a541190889b1b0fe |     
    or1k     |         mesa3d-22.1.6          | NOK | http://autobuild.buildroot.net/results/76050d07a4989400d4a6cefc8b0b59c767b01450 |     
  sparc64    |         mesa3d-22.1.6          | NOK | http://autobuild.buildroot.net/results/ff98389a47aa06e2740afd8eeb5f2ac17ee8670c |     
   armeb     |           mtd-2.1.3            | NOK | http://autobuild.buildroot.net/results/e60f8a11db830f77135dc9433ed15f8dc212590a |     
    i686     |           mtd-2.1.3            | NOK | http://autobuild.buildroot.net/results/b3ac995e7a6535eb227ff99d226eec74d943f6c5 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/29c4158361ae65738aa23e33448dcab67401213c |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/e011ef6cebadec443b2b4425ca65be04907c6c59 |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/c0100d4171bed8f2546c951a808b5271d3f904a0 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/6d9f97ed138378d6338a5710cd24cc19299ad860 | ORPH
    or1k     |         numactl-2.0.14         | NOK | http://autobuild.buildroot.net/results/05a36b46fe0d9befc99714cd60a29d2affd3c271 |     
   mips64    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/9c35d0e92d9b7afe383f7c997948b722fba5de37 | ORPH
   arceb     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/06ec0e688e4894bb213f4bb22f532ab7dd0b06f9 | ORPH
powerpc64le  |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/55c279534853bbd5319e003742e3865ff8663c14 | ORPH
   arceb     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/6184133576407e91aed6a1ece107dba1ad9d07b5 | ORPH
    or1k     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/463e20a20ea3613580db6046f45760ce4c26785f | ORPH
   xtensa    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/6a72a8c689a11f915e2f96ddf8165b209769b729 | ORPH
   x86_64    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/e392fd20e2875b60427139ce8464c5963ca55cfa | ORPH
  mips64el   |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/6b8e0736416bb38f045465b47680f2666d759060 | ORPH
 aarch64_be  |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/5b0083b2dd7ad6a2bf6f4351ecb0b6c489014f56 | ORPH
   s390x     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/ccbef6f5a077e89c9ddb19fa84d775bc2ddf29ae | ORPH
   s390x     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/cb2dffbe25ab4fa20650c0582b64e4eeb34c013c | ORPH
   nios2     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/6e0b7a838884d1c73073966ae89f92a3a2bae5c5 | ORPH
microblazeel |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/f0d2702be334c37083ac523c48c33ea56923da6e | ORPH
  mips64el   |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/b9e25f7fa363ea4d338a62f7616158a324a163f1 | ORPH
  riscv32    |         opencv3-3.4.17         | NOK | http://autobuild.buildroot.net/results/e6b02cbb847ad0e0e75cf1aac410ef9d951ee39a |     
 powerpc64   |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/46b7723fce29938cdf656c011b24e11adf032d07 |     
    arc      |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/ec0f86e8666ed49ad6b91427c6e05d75dc248028 |     
   xtensa    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/6bc47cb51024d3644cf03a640248a37618c47f16 |     
    or1k     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/b734d395caeec5be10a57217db196f35a55e2057 |     
    or1k     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/fd0587ef3340193d7f5d2ab2a8ff59dbe48b018f |     
 microblaze  |           php-8.1.11           | NOK | http://autobuild.buildroot.net/results/e7399ff7296ca898f7d1c5a7e8eef45af02e7afd |     
    m68k     |         proftpd-1.3.6e         | NOK | http://autobuild.buildroot.net/results/a5b7dfc739e4b28cfdae15734f4d2c10a995c260 |     
    m68k     |         protobuf-21.6          | NOK | http://autobuild.buildroot.net/results/755d9df18af870d26bf398b22c6f75e525a4b9d9 |     
   mipsel    |   python-cryptography-38.0.1   | NOK | http://autobuild.buildroot.net/results/c7ff8dc92f7aeb0c7f72c3279020059657500d2c |     
   mipsel    |      python-pyqt5-5.15.6       | NOK | http://autobuild.buildroot.net/results/d9cac2df4e4ea06d74a1e858efec8c68c23cd81b |     
   nios2     |       python-ujson-5.2.0       | NOK | http://autobuild.buildroot.net/results/8c8d50bfc15c6045fa459a86860a372a81bcb864 |     
    arc      |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/d4f4d23c586ed69c7ebc96ce717d0d4c6d429933 |     
    or1k     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/5b320e76528ac0b5d76c6950d9d370fc531dee3a |     
    sh4a     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/35d9e72e4ec3ce9ddccc8bee9f372040540ccf7c | ORPH
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/f6dfea186c830c04b87466cb6e86fdf72b9fda7d | ORPH
    or1k     |        skalibs-2.10.0.3        | NOK | http://autobuild.buildroot.net/results/cc48c402acb0cb20965dde7e36bc686bf13b8296 |     
    or1k     |        skalibs-2.10.0.3        | NOK | http://autobuild.buildroot.net/results/e44a7d66dbd22732269a74d18c783b4b6160d348 |     
   mips64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/903c64b78b24ce5cd56b439a7e4faa7c78e09b7d |     
    mips     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/5c13df2abb5117373156315dc8307e03ccf38495 |     
  aarch64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/942e961f2848bc26215c99d4979d33cbe7a41b51 |     
    i686     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/c2269164d5e9fcf9d34356fc3e394a105771d45a |     
   x86_64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/f6dbde29a50cebed497b1338b28851de1bc3e29b |     
    mips     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/6ac259fb5662a998246c09ac8d63f651354f4669 |     
  riscv64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/1e06684254d0072c6684460a398a54de899777bf |     
    sh4      |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/d387c9a2eadc4f568c156351629606743ae3a9cc |     
    arc      |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/66f337c1ec7c06eb786f4c68286d98a77e22c5c1 |     
   sh4aeb    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/712c2b789bfc1e4002868cfeed11c2306e38207e |     
   mipsel    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/8a8c44258c482ec6fd295c5ff86cc41095d7ef98 |     
    arm      |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/a29c6ae512a13b1d628011ef54fc93c77f4e1d5e |     
  sparc64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/76b9c8d4110bce29df5de58a5ef8946fd61ad3e0 | ORPH
  aarch64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/2f7e6d9cd28ca9fb955442cc92e2227513f7dead | ORPH
    or1k     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/3d0c9980345be2df048cb2a06c990746fdd1bc85 | ORPH
   armeb     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/fea204d2bdec217f845913cb5ac70892eb80a01b | ORPH
microblazeel |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/c342951842b7bd0585465bb67c1cd2d235555039 | ORPH
    arm      |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/3650c2360e59d6040275917441167f077b9f6d05 | ORPH
 microblaze  |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/44cbdcf9c60c4bbebfe3aa49dde18ae43529ea2b | ORPH
    arm      |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/10bb774224a7728d11b55b622d18dfa250807f77 | ORPH
   s390x     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/446bc0cca9335b41ec811cfdcf498aea3b2b515d | ORPH
    or1k     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/9b72d789a6f8354543ad32581980e8a286922499 | ORPH
   mips64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/47bd2072c29cc95c8bd663e0fe352ea5da5d8788 | ORPH
 microblaze  |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/866bf58a6cc13d2ea7b9ca5e3aa23ec2d711ac72 |     
   armeb     |        tinymembench-0.4        | NOK | http://autobuild.buildroot.net/results/4769b87b4bf98150bfccdbf8300ad3478f7fe634 |     
    mips     | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/c456216a2bcc762700b2aa3560b6bdf79a2010e6 | ORPH
  aarch64    |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/dcc8f864b025a838337487e51dee7f190692159e |     
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/eeb289c0606270f7769f435e1c1ee9b3c136bab8 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/3ac465887fbff95ff2274040323607e3ef0cfd86 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/b18e34c6f119b99a42a027b7ac6b2bb6cba4cd0e |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/77eb9989329355ba3bd8a456f67bedf066c6496d |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/aeb606c9e74d43467562d357592c26eb786302a3 |     
   armeb     | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/df2bbbbe7dadbb40b04064464d7436e6ab092d3c | ORPH
  powerpc    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/a7b6ba51a73385015592ed3d35b7dcb3de186e7b | ORPH
  powerpc    |           volk-2.5.2           | NOK | http://autobuild.buildroot.net/results/7c955e9fa5493228632d63474945618568603bb2 |     
 aarch64_be  |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/0c986f3e755dcdaa616ec12ebd7265cc74922c09 |     
    mips     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/a155b33dd7845890a8a96b0fe84b65d8274b9762 |     
  aarch64    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/9bf99ff1f91f1852c34be32fe056dc259024d109 |     
   s390x     |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/5dc510c6d3588db0db604517a5881ac7565fa249 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/3cf2e4cd06ff07747f82d76415350c443cbc2090 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/6e4689e491502aa0c99d7b75d54292a2d511235b | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/4fe01bc6379bef710308205196c33284fee99073 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/bc1fad293e53af8a5518d0583d031347256d63ba | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/4aef168dd2ccdefced0c752c16b0ec74d54ac707 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/58b3e9687dbae9dff00b7d6ee20d64fc21da0ce0 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/18f141befaf054261488328491a82e3ed8b79437 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/7366bde38545f53d22641cc25902c58695360a91 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/0d8a23e5ebada15750e47f2f0d8a6b4d03fa3d1f | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/c25a0b48de43b341bf36dbda27198a584438e370 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/717e5a44238d9495468f9862b9368489482135fa | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

            igd2-for-linux-2.1 | 1 
                   rsync-3.2.5 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/d81d45617212dda52e12cf246d4759fb42d90a68 |     
   x86_64    |          rsync-3.2.5           | NOK | http://autobuild.buildroot.net/results/aa61b0479809c09b981db4a48b28aef5d895fced | ORPH


Classification of failures by reason for 2022.08.x
--------------------------------------------------

            igd2-for-linux-2.1 | 2 
            openssh-legal-info | 2 
host-pahole-73383b3a39afe86... | 1 
              host-rust-1.62.0 | 1 
                ipmiutil-3.1.8 | 1 
                  ndisc6-1.0.5 | 1 
   openvmtools-11.3.5-18557794 | 1 
package/openssh/openssh.mk:... | 1 
                       unknown | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/474193ca12c396f66e392c0f79ec08b42e398202 |     
 powerpc64   |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/07c463064c894b752d2b6bc75f8fbc0602ae645e |     
    arm      |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/caf8dd10305e9c6036d7901fb0ebf40ee0d0572e |     
   xtensa    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/dee79943c4d6f6dafb74af23012fa6be3b9d4d42 |     
    i586     |         ipmiutil-3.1.8         | NOK | http://autobuild.buildroot.net/results/215feec403a6ec28120c62c95b7a731552e13b97 |     
    arm      |          ndisc6-1.0.5          | NOK | http://autobuild.buildroot.net/results/42f31eb4285ab9791a6ea4b9f97ab0327e006d5c | ORPH
   mipsel    |       openssh-legal-info       | NOK | http://autobuild.buildroot.net/results/a908392732e7b95f2d681988ce23626e26720835 | ORPH
   sparc     |       openssh-legal-info       | NOK | http://autobuild.buildroot.net/results/ca64f55666708c8e5d848f3602bc5a9329948bc2 | ORPH
  aarch64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/0b2e01043aec8b0d736434554b78acd96b845d61 |     
  aarch64    | package/openssh/openssh.mk:... | NOK | http://autobuild.buildroot.net/results/4baff817e811a2c0b93f28843ad18a3bc5e48f3f |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/e683b8662d1f169d1b6f35380a6fff3663aead2f |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
