Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC26C28D13
	for <buildroot@archiver.kernel.org>; Mon, 22 Aug 2022 05:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A88D81B9A;
	Mon, 22 Aug 2022 05:40:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A88D81B9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NVRr1Gs-OnUt; Mon, 22 Aug 2022 05:40:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CBBC8183D;
	Mon, 22 Aug 2022 05:40:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CBBC8183D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6A86A1BF48B
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 05:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F4A160BE6
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 05:40:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F4A160BE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m5LItUY6inMU for <buildroot@lists.busybox.net>;
 Mon, 22 Aug 2022 05:40:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F02E1606F2
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F02E1606F2
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 05:40:44 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 11DEC100007
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 05:40:40 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Mon, 22 Aug 2022 05:40:40 -0000
Message-Id: <20220822054049.3F4A160BE6@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1661146841; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=H9ZJ2Ai3pW8yhU2QXIB26xDK5K2iu6fMta4rSgUxqRk=;
 b=S9n1qT11VXEM/r3ZKkbgFpgNsJ210VCAZoEOIKxpP3y1mlx4v3hvcJLPvTmVJksEccj3JD
 QP3NzKD3YL+7bGGIxi8x2ozmnn8MI5jMky6Ls2CmqnXHQn6pFfLO/GRoMPHXIP8LMUeI9s
 ZbdgfYQPebYyEJJlrTxbyPg6sPGAebD2QvbIwK5TxXi7mOZNSbBov5BQ7s8s3ixt3hScxS
 aKmbc95MkHhn3Zer/Df1/3yEKZYEh8jjMJwsquio7BcdNZzavScGjyn2Fzis7cYwogv8/g
 vV8hQKDExEULtt6NiBZ2E9lIT4oBfuetL5JPXrYlq5UfMXKznnUayVxRypPdYg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=S9n1qT11
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-08-21
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

Autobuild statistics for 2022-08-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 15  |  5  |  0  | 20  |
  2022.05.x  | 41  | 36  |  0  | 77  |
    master   | 248 | 299 |  1  | 548 |

Classification of failures by reason for master
-----------------------------------------------

                    wipe-2.3.1 | 28
                   thttpd-2.29 | 26
                 uclibc-1.0.42 | 15
                speexdsp-1.2.1 | 11
host-pahole-73383b3a39afe86... | 9 
                 linux-5.17.15 | 9 
                   speex-1.2.1 | 8 
                host-go-1.18.5 | 7 
                       unknown | 7 
glibc-2.35-134-gb6aade18a7e... | 6 
                elfutils-0.186 | 5 
  gobject-introspection-1.70.0 | 5 
                gerbera-1.10.0 | 4 
host-python-pycryptodomex-3... | 4 
              host-rust-1.62.0 | 4 
dahdi-linux-5c840cf43838e06... | 3 
                 dash-0.5.11.5 | 3 
                  ffmpeg-4.4.2 | 3 
          host-elf2flt-2021.08 | 3 
host-spirv-llvm-translator-... | 3 
              jpeg-turbo-2.1.3 | 3 
             libopenssl-1.1.1q | 3 
                   perl-5.34.1 | 3 
                 pixman-0.40.0 | 3 
                 wavemon-0.9.4 | 3 
                wtfutil-0.41.0 | 3 
                    zeek-4.1.1 | 3 
/home/buildroot/autobuild/i... | 2 
                  acpid-2.0.33 | 2 
                    brltty-6.4 | 2 
                  exempi-2.6.1 | 2 
             f2fs-tools-1.15.0 | 2 
             fontconfig-2.13.1 | 2 
       freeradius-server-3.2.0 | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
               libcap-ng-0.8.3 | 2 
               libdeflate-1.12 | 2 
              libgcrypt-1.10.1 | 2 
             libgpg-error-1.45 | 2 
                libmdbx-0.11.8 | 2 
           linux-5.10.115-cip7 | 2 
                  mender-3.3.0 | 2 
                proftpd-1.3.6e | 2 
rtl8189es-39c17661136da48f8... | 2 
               tcf-agent-1.7.0 | 2 
uqmi-0a19b5b77140465c29e2af... | 2 
                xenomai-3.0.10 | 2 
/home/buildroot/autobuild/i... | 1 
                 a10disp-0.6.1 | 1 
android-tools-4.2.2+git2013... | 1 
     arm-trusted-firmware-v2.7 | 1 
                     aufs-util | 1 
                  bcg729-1.1.1 | 1 
                  boost-1.79.0 | 1 
                  botan-2.19.2 | 1 
           crucible-2022.05.25 | 1 
                 dfu-util-0.11 | 1 
                 dmalloc-5.6.5 | 1 
docker-proxy-f6ccccb1c082a4... | 1 
              dropbear-2022.82 | 1 
              erlang-22.3.4.22 | 1 
                      fio-3.28 | 1 
             flare-engine-1.12 | 1 
                     frr-8.2.2 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/romfs/romfs.mk:32: /home... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubi/ubi.mk:51: /home/tho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
                    gdal-3.5.1 | 1 
                     gmp-6.2.1 | 1 
         gobject-introspection | 1 
                   grpc-1.48.0 | 1 
                    grub2-2.06 | 1 
gummiboot-2bcd919c681c952eb... | 1 
       host-gcc-initial-11.3.0 | 1 
               host-zeek-4.1.1 | 1 
                       iw-5.16 | 1 
jq-a17dd3248a666d01be75f6b1... | 1 
                libcurl-7.84.0 | 1 
               libdcadec-0.2.0 | 1 
libdill-32d0e8b733416208e04... | 1 
               libglib2-2.72.3 | 1 
                libglvnd-1.4.0 | 1 
        liblog4c-localtime-1.0 | 1 
                   libnss-3.81 | 1 
   libtorrent-rasterbar-1.2.15 | 1 
       linux-5.10.109-cip5-rt4 | 1 
          lttng-modules-2.13.1 | 1 
               mariadb-10.3.35 | 1 
                 mesa3d-22.1.6 | 1 
                    musl-1.2.3 | 1 
                nodejs-16.16.0 | 1 
                  ntp-4.2.8p15 | 1 
            ocf-linux-20120127 | 1 
              open62541-v1.3.2 | 1 
                 openmpi-4.0.0 | 1 
                   opensbi-0.9 | 1 
                 opensc-0.22.0 | 1 
                     pv-1.6.20 | 1 
          python-orjson-3.7.11 | 1 
            python-scipy-1.8.1 | 1 
            python-ujson-5.2.0 | 1 
                    qemu-7.0.0 | 1 
rtl8723bu-19b4bdc05483a1e79... | 1 
rtl8723ds-76146e85847beb242... | 1 
rtl8812au-aircrack-ng-4ab07... | 1 
                    sdl-1.2.15 | 1 
                tealdeer-1.5.0 | 1 
           tesseract-ocr-5.0.1 | 1 
uclibc-ng-test-0844445e7358... | 1 
ulog-0389d243352255f6182326... | 1 
                usbguard-1.1.1 | 1 
                    volk-2.5.1 | 1 
                  zabbix-5.4.9 | 1 
                 zlib-ng-2.0.6 | 1 
                    zstd-1.5.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/4a764cb4fb157769d648f4e8ba2d282569506851 |     
    arm      | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/984106e3608291cab10c5aecd5e86c3a298cdbf6 |     
    mips     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/02016afc04a662dc7add12f006b3e0b2c6d2d388 |     
    arm      |         a10disp-0.6.1          | NOK | http://autobuild.buildroot.net/results/30eb6b9fdb63553200aefdc742527be74bfaea7b |     
  mips64el   |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/928991a9c0c4dbe70be95aa91b876143c11c71ba | ORPH
   mips64    |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/5b3afa5f55f1faa477a84eb8c92f9819a2c424e1 | ORPH
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/e00624dc687dc83e55c97ebde0569c653df558cd |     
 aarch64_be  |   arm-trusted-firmware-v2.7    | NOK | http://autobuild.buildroot.net/results/44beed8872b8285ce018ebfb51d04d30a25e54b1 |     
 microblaze  |           aufs-util            | NOK | http://autobuild.buildroot.net/results/ce3172ecdc4279e46d240f71b70d81f612819439 |     
  riscv64    |          bcg729-1.1.1          | NOK | http://autobuild.buildroot.net/results/a31e8fe4d72cf47462d7acdef923a54f32b6b378 |     
    arc      |          boost-1.79.0          | NOK | http://autobuild.buildroot.net/results/85aef2785f5534edb3de4eb0c34b6b987f0d34d5 |     
    m68k     |          botan-2.19.2          | NOK | http://autobuild.buildroot.net/results/279285a45c82726fab582a785c85579cd6dc8fff | ORPH
powerpc64le  |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/a3e19831c7e233297b606800f69f7bf776f0ac0b |     
microblazeel |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/507a1284ff1a916cf70dd3054a678a540e56e4e4 |     
    i586     |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/1b58205e81b909611763564a6752d89fe1cb71bc |     
 microblaze  | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/3bf0209ee79a9676804c351c62d12f6f08cfa835 |     
  aarch64    | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/e4b585db548692cd98ac4a87570bf5ec087b0dfb |     
 aarch64_be  | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/666b3160808f4eb36f1a716a253dd22b2d41a0eb |     
   s390x     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/cfc616ab90740826cd6844c94f291a9246dea518 | ORPH
   sh4eb     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/7c368620425b3a48bfa532793016dc80cfa6bd41 | ORPH
    sh4a     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/3ad106971f7d7115d4ebf89e6f1ffa160b96d02a | ORPH
    or1k     |         dfu-util-0.11          | NOK | http://autobuild.buildroot.net/results/29e5320079c964a419025bbafabc3f148afcc945 | ORPH
  powerpc    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/1e70ab560a96487d8e13b9e7b700e7f8ae7e54ce | ORPH
powerpc64le  | docker-proxy-f6ccccb1c082a4... | NOK | http://autobuild.buildroot.net/results/c6115049c570cb7a47b47284612fdd9e51769c96 |     
  riscv64    |        dropbear-2022.82        | NOK | http://autobuild.buildroot.net/results/1de77c2340a5366ae352f55b6de9512d12bc5656 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/817136f977f871f22a2ae5205631c78056bdd730 | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/0d0f5eacea1775e57046d458f6166f433a27f1fc | ORPH
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/e0e90cd5479688d8958cffee6dede39fd8830301 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/4a9ad52e00a546ab4be3cc1b2e185b5da63a3ad4 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/7552906ffa2457b834f27bc03d7d0ce9e33f27c2 | ORPH
  aarch64    |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/975a6ff23bb2f66c1099f0f4e43e2d9d18a4ec42 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/79c82b7c10b42981dc91ace278e33f6bf603c990 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/642be21be66321e04cbd10dfbc90a4d589c87853 |     
    or1k     |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/49e4f9c9e8a6d643fda25bdc2b862e357d94a67c |     
    or1k     |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/5dd72e0cff1c141bcee037d255bbc6cbf2bda589 |     
powerpc64le  |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/cdd0266594b6ee518d63cd85636fd146ca9ef125 |     
powerpc64le  |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/7df42aaf7bc7e1fd9409f8a6c895f1953e5fb11f |     
powerpc64le  |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/0c0267618ef3daf4d4aa71735f3dbcc8a7a41a41 |     
  sparc64    |            fio-3.28            | NOK | http://autobuild.buildroot.net/results/4e4aacfae261c479178e5cb3b9281e5cd8a4b29c |     
   mips64    |       flare-engine-1.12        | NOK | http://autobuild.buildroot.net/results/eec99be5dbb2b755b52d8599a06032ca592aa7a6 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/e75415e21af157190ef91dad746b6e43f9fde26a | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/f2b81d2a3f74d4c6311bce8fa1ed758e428caad7 | ORPH
   s390x     |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/915b5c91b26ac42f600d277b7ead4efb48a62e20 |     
 powerpc64   |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/81734ee7acccd71fcdf6996f8c14f27e5fb15999 |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/5e59ef5decb9ce6e60b7a23553656c405566ee33 |     
    sh4a     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/16b4a12f9db2f810fdc8495280ef1c6dfefb723e |     
   s390x     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/ee5c98172c57e3407ea57679df64d58cf8a18762 |     
 microblaze  | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/be686a3a05e1e19271deb19baa7672896767fb06 |     
  mips64el   | fs/romfs/romfs.mk:32: /home... | NOK | http://autobuild.buildroot.net/results/b398d0c17a4e6418624ca87250732b59de78ad51 |     
    arc      | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/b8a9f55b59831807f8fdf5e79193fc865df7b283 |     
   arceb     | fs/ubi/ubi.mk:51: /home/tho... | NOK | http://autobuild.buildroot.net/results/c03519cf035c44bf36ca37a62139f5e63b7d741e |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/3388dc929020525388b37916bae8c8c9c90a05b3 |     
    m68k     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/6101bbf76d4af8cd988dfc193851f05269178d51 |     
   mips64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/be2ac3102658d342ed2ea7d75342e37407066d53 |     
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/a4e57921e2fbc39e556d41671405692c522541ed |     
    m68k     | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/6c09e853b3b54eca52e7c80e385747bf55904d45 |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/99535137b264544704fea025e7945e09a3e6dbdf |     
  sparc64    | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/2318425c0c170dfa0fe8a05cc86521cfe115defc |     
    or1k     |           gdal-3.5.1           | NOK | http://autobuild.buildroot.net/results/77ad5bf917b4054ff7562543eafc3e2cb8c3241a |     
   x86_64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/e8fd3858d07c51d8c0e554fdf9ac58a13031e65a |     
    sh4      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/d6206d9988c4df3d79907026b7e06ce771a134c3 |     
   nios2     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/775a1066a5fa028da53808326b8e030e217eae3a |     
   sparc     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/9e5414cc308770c54c7f8d306540fd3181aa675f |     
   mipsel    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/b6e2f96412cc642c054c9d18690b13670d2b2b59 |     
   sh4aeb    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/fd921b437a9b57baf66c2f596a1168165a842484 |     
microblazeel | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/857155d74dec50be915f5c7e6bf640f0890b04be |     
   nios2     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/b9fe0e8d3978d91a4781748b163b32f242a5d27c |     
   mipsel    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/eeb0285ef1280777e73dda4a85806095c9df97f1 |     
    sh4a     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/d6b548cb838058b7637a6f2fa265bc06fc93fbff |     
    m68k     |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/df22209db5cdb1e9195d9f35d5918e484fbd40d3 | ORPH
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/391eb9551f4912bd062dc73ffec52a42e1103bcc |     
   x86_64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/107a5053e28065b665494458867e97477d1b8b44 | ORPH
  sparc64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/3d94e08139d96b6a75d83abed1219be4a76d9fa3 | ORPH
    i686     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/245abeec88eb3c4693f588c32be557a71fb2d747 | ORPH
   armeb     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/7d552492294f89fae92602fe4caa7596a1caaf03 | ORPH
  sparc64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/15a32b3a50c3859d6e0520234d724a09ce3e959d | ORPH
  mips64el   |          grpc-1.48.0           | NOK | http://autobuild.buildroot.net/results/6e4e03c9bd9d4b6cdc730e118311b2119c5a5074 |     
    arm      |           grub2-2.06           | NOK | http://autobuild.buildroot.net/results/1c1f6fff067b988bb48f3db24fb44b30caf4b1f0 |     
    i686     | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/c28d6499c0e0b636d89bd653aa6d5aa1b3294649 |     
  riscv64    |      host-elf2flt-2021.08      | NOK | http://autobuild.buildroot.net/results/cec3591994c68c3403c7b1dfeab2bdf18777e126 | ORPH
    m68k     |      host-elf2flt-2021.08      | NOK | http://autobuild.buildroot.net/results/af650f604ee2259d05b182b40a5fb1571c56c0b9 | ORPH
  riscv64    |      host-elf2flt-2021.08      | NOK | http://autobuild.buildroot.net/results/4c0aa9ab63fc97fc2f11da200c3b813a1c7091f4 | ORPH
   armeb     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/0231fdac653e6b20ffa31528ef22c9cd68b7e1ca |     
   mips64    |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/51772df437555101aae7db08ed1ac3c09748c553 |     
   mips64    |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/c4c3f7da26cd610199e04c0e5b8d070e2961c678 |     
    i586     |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/bdc00fbd4f332eaf6817dace87abf3e6266bc2c0 |     
powerpc64le  |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/bf55e7532a981109339849a5626869302a77adf5 |     
    i686     |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/fc865e6023d32eb881dce191dc34281f6a389218 |     
    i486     |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/65aff01fe1f7d7189f374c54caba2c029b0baca0 |     
  mips64el   |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/312203feab71920fd98528997a9479ba0be7dc29 |     
   armeb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/feb0b23ebf524d35d2b5e96411f820327a03bf6e |     
   mipsel    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/742d64eea60dc1390cbdda4428470734817ef0a0 |     
   armeb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/4a6c549ac0fdf60fe81d7ec72ee9ecc87eaf6e66 |     
    arc      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/4a6930287cc28efd47daa10a2876e4ab73a31b99 |     
   sparc     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/aea4b7ed83d11c2e7d0c9368ad6d301aa5032733 |     
   mipsel    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/105a94664c2d5f0d3c03a0c54bdcb2939003fa15 |     
   sparc     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/3249e844a8430fffb0d5671e45e11d0c8a004770 |     
   xtensa    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/43a761e890b2cc71354ae13f187dff0e45b9fee8 |     
   x86_64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/6f98c842285f7bb174645f5dc6447e7d08745d86 |     
    arm      | host-python-pycryptodomex-3... | NOK | http://autobuild.buildroot.net/results/14a73aeeeee33a1cfcc6fd8299ed9f58d9891047 |     
  powerpc    | host-python-pycryptodomex-3... | NOK | http://autobuild.buildroot.net/results/95d99d263c2872ea5dfc7250feee9cc3eed2e97b |     
    arm      | host-python-pycryptodomex-3... | NOK | http://autobuild.buildroot.net/results/0e514e25f1aa8a1b134894838d91276b5b09ba08 |     
    mips     | host-python-pycryptodomex-3... | NOK | http://autobuild.buildroot.net/results/98d5e6c3270f35f71507cec0cd9b68ae188f007b |     
  sparc64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/ff0e9195ffb4ad3013522d5ae940236dff3610ce |     
    mips     |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/2cc9142f75857953aeb7f673727afd26b1a9ab0a |     
   armeb     |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/e3eb3306987b3ebfe02a1d4a301a8a7679d5d524 |     
   mipsel    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/f99831d646a608d917dd544e85578107f4c7fc80 |     
   armeb     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/b92664f61794697d21c9d6dc2e42c2dc555ec625 | ORPH
   x86_64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/04a89c2cb83e9a45812fe7915d40fc7f86a1f382 | ORPH
    i686     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/971450babf609326a418649e7badd964bae1ddfa | ORPH
   sparc     |        host-zeek-4.1.1         | NOK | http://autobuild.buildroot.net/results/4d11e8bea1f7ed0b04cd7e123ed2f352e7a9e77f |     
    m68k     |            iw-5.16             | NOK | http://autobuild.buildroot.net/results/7199f01903c470c2fb1a62756053df0619af384c |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/4e91541436bd070ee06da6e6b6e3239a53ec58af |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/f636bb0124c6059b5c1feac6ef7d9d977d6cd872 |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/acd18ab7506a5aa0e7a71a09e9ad3025f9c40849 |     
    arc      | jq-a17dd3248a666d01be75f6b1... | NOK | http://autobuild.buildroot.net/results/df295f66a1bdeb37b93ae64467e8a6c5c82553f9 |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/c0c56185560aa240158b6f24ab366e28d47c6853 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/0b96c2435daefce138d94cc8fb0d0be3481de3a3 |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/d4f8e8580b0188e998c45951c04d791601708882 |     
   armeb     |        libdcadec-0.2.0         | NOK | http://autobuild.buildroot.net/results/b64e9542329332b96ab57ce5fdba3f24a110a140 |     
  aarch64    |        libdeflate-1.12         | NOK | http://autobuild.buildroot.net/results/ba63fb34d34b88b079ec19c3eda33c489ee86f71 |     
  aarch64    |        libdeflate-1.12         | NOK | http://autobuild.buildroot.net/results/2c2e15f056473811c054f5354b681c7e8d8e4594 |     
  riscv64    | libdill-32d0e8b733416208e04... | NOK | http://autobuild.buildroot.net/results/a294492db81b6fd105dac88d8f5c8bc1a222bb8e |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/e5031c84bfb06ab3d791e2a39a8dae408eaa6f07 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/52a487cce59bb9d09185d40773767e11692c775d | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/d3f4b8dc4b39c47dd2e073795631a3616631e26b |     
   mips64    |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/b7b74a1049d97c4c38c739bd3e191a6067d8a764 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/db09029af49e44b6a12605515907047fb2cf07d9 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/038a46565176a38a5ba1b92c534c3323dd6902cf | ORPH
  riscv64    |     liblog4c-localtime-1.0     | NOK | http://autobuild.buildroot.net/results/b5512ae183a793c1521fdebd76c4e77073a11bfb |     
microblazeel |         libmdbx-0.11.8         | NOK | http://autobuild.buildroot.net/results/3fbe97acbc9c9523d766a3c58d2caa92d5115588 |     
microblazeel |         libmdbx-0.11.8         | NOK | http://autobuild.buildroot.net/results/c9570b7ced08151dea4c2c20234198b4899f85bc |     
   sh4aeb    |          libnss-3.81           | NOK | http://autobuild.buildroot.net/results/36d5df9add055f44907616708dcb36c8ad01fbcc |     
   sparc     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/91379461ea240979cea5ebe971fb8b7f614c7a73 |     
   sparc     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/a9e37f7021e6acbedd5cf76f8290487a18c7b0b0 |     
   arceb     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/7dde45ab1e81fbdc74586b3e1caff63c2b266af2 |     
   x86_64    |  libtorrent-rasterbar-1.2.15   | NOK | http://autobuild.buildroot.net/results/b1d8649d4c5de8374f8669853bcb114f7b40edb7 |     
  powerpc    |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/233a90ae964a2c92e35d9b5cf4dcedd159a18d11 | ORPH
    m68k     |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/dbd4a02f6b9ccb6b1c5e4fec9a64d3252216d906 | ORPH
   mipsel    |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/5618005d1d4df619402b551926e3bb3abf56a410 | ORPH
    arm      |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/6a61b26a1ba60312ac5296e80974fa3955c68884 | ORPH
  mips64el   |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/3d911e164d634308fd4390e3286ac3c8c8ab7866 | ORPH
   sh4aeb    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/58a6d3bcf816abb3f4cf61856d22ec80e9907359 | ORPH
   xtensa    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/e52d4db2a9e54b33debd2c17e398bce3f7291d27 | ORPH
   s390x     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/79691aaec4b242ddb4329112b1b94e20cde366c7 | ORPH
   s390x     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/d9e8a802bc250a9c96949e2df969aa8af243b4cc | ORPH
    mips     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/40d4b208c269650b818c4ba44da5388fd0bb3a28 | ORPH
    mips     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/f0bd299fc643adc1479a8e46e9fae44882ddf403 | ORPH
    or1k     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/010572d61fad583c0a30ceb6861279b08463bbf6 | ORPH
    or1k     |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/a4d7412e36f29ef3138708839c6c5977ac7e9b86 |     
   mipsel    |        mariadb-10.3.35         | NOK | http://autobuild.buildroot.net/results/78dfc20e5aadd4a6bc11574325108d788adb3457 | ORPH
   x86_64    |          mender-3.3.0          | NOK | http://autobuild.buildroot.net/results/0d920bfd52dc2b53ab108594e7ea80b75520fae3 |     
   s390x     |          mender-3.3.0          | NOK | http://autobuild.buildroot.net/results/e1376920195b60ad1e33d5ee4ed95349501ea651 |     
    mips     |         mesa3d-22.1.6          | NOK | http://autobuild.buildroot.net/results/2cfb04216aaadd766ba43af826f52452ab33d2e9 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/42b37f89e1e1e7b346aec7d9192cf3e3cfc83530 |     
   x86_64    |         nodejs-16.16.0         | NOK | http://autobuild.buildroot.net/results/d58a7b6b65ae9ed76cf676e544d0504af02f42c1 |     
    m68k     |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/ec71c97bed02820867c5708a1ee703f0c17116c3 | ORPH
   arceb     |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/ef132d1b73c1ec187b4c8d05be71f1402869249d | ORPH
   mips64    |        open62541-v1.3.2        | NOK | http://autobuild.buildroot.net/results/1c9f4c6f49a982f228c03e9518a0fda15ed550fd | ORPH
    arc      |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/f550d624b1f6d136e01f59c56a17f37fc647037a | ORPH
  riscv32    |          opensbi-0.9           | NOK | http://autobuild.buildroot.net/results/bfb4dcb68781ede0103ed66606a349347aa100b9 |     
    arc      |         opensc-0.22.0          | NOK | http://autobuild.buildroot.net/results/e050c32588dfecdc59e92c4ac3b819e75479fdb7 |     
    or1k     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/3465f325c4114620bdbdf94198519954c3f0cc0d |     
   xtensa    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/681aafecfed0f25e4d03f69ef9132a981d7739b6 |     
   x86_64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/04ea29317b77372f705ecd97fa70bdaf285c9657 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/311f3762c0b0536d6724946a42925df7c3f86695 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/c62a5fde370cbab499982b00fd682b227be11a6b |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/044aa47605e58477389b6d37c0ca8e74e7302240 |     
   sparc     |         proftpd-1.3.6e         | NOK | http://autobuild.buildroot.net/results/c9e85e3df4a8fb992740f06273067261cd5f334d |     
   sparc     |         proftpd-1.3.6e         | NOK | http://autobuild.buildroot.net/results/64b59652b9bad184b32b7a1b611b4c4dc1a037d0 |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/ba5643f9c42cccf6f0e58e9b0aff3fb566bf7d4a | ORPH
  sparc64    |      python-orjson-3.7.11      | NOK | http://autobuild.buildroot.net/results/a0066853ffd29d0d0eec217cf87d61f1db12b810 |     
    sh4      |       python-scipy-1.8.1       | NOK | http://autobuild.buildroot.net/results/3ab18052bf04ea7df3c56a59bf6a422e5fdc7018 |     
    arc      |       python-ujson-5.2.0       | NOK | http://autobuild.buildroot.net/results/ec0ade75e8be09ba630830305bb5b22504b7eac7 |     
   mipsel    |           qemu-7.0.0           | NOK | http://autobuild.buildroot.net/results/059e2408d022b076c5b88a68d44410d79b0c5f90 |     
  sparc64    | rtl8189es-39c17661136da48f8... | NOK | http://autobuild.buildroot.net/results/d3e92a316d0405f5d7e8859f8b6fbac63d2c04cb |     
 powerpc64   | rtl8189es-39c17661136da48f8... | NOK | http://autobuild.buildroot.net/results/546b227edf426fb4abfe598f22aeae40a8eb2a66 |     
    or1k     | rtl8723bu-19b4bdc05483a1e79... | NOK | http://autobuild.buildroot.net/results/1abbbf749132695856d1a35f39a3b9963773e319 | ORPH
 aarch64_be  | rtl8723ds-76146e85847beb242... | NOK | http://autobuild.buildroot.net/results/94a4107308e46b66af9a31715ee6b5fcea6ca2cc |     
    or1k     | rtl8812au-aircrack-ng-4ab07... | NOK | http://autobuild.buildroot.net/results/9342b42c9b8daf087bd4a9ab9a07acce4bfaa658 |     
    sh4a     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/88e6ab512a963534729b821a65f3d0040c748e76 | ORPH
    sh4a     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/b5295820dcd92b2fcdd76306b93f4a04ee9bdaca | ORPH
  powerpc    |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/44b9af17f4506357f98ec0c65394dab31fb937e1 | ORPH
    m68k     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/c6fb8f301eae0e238f2eb194f37211997ad6b701 | ORPH
    mips     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/e50479e16fc90594cb466e29e26ff144738a5599 | ORPH
   sparc     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/3f6b81a27cfe58cebfd80ba7f3e1f45382f1a7f3 | ORPH
   x86_64    |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/937d25252f59c5bf8ba5583789e3ef69975e7270 | ORPH
    arm      |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/c4dbc40b15b3ff9d36017c67cc11ab505d8f4f10 | ORPH
   s390x     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/d66aceb45434e6b0f3f968840df835aa3831a550 | ORPH
    sh4a     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/e68c367200a988097b6d284d09f56d13f60629b4 | ORPH
  powerpc    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/9bdcd5648777d37fc7742a83b0eb9986dde58769 | ORPH
   mips64    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/db80dccf0ba6088f55f37cc4e5957a3120cc56ab | ORPH
 aarch64_be  |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/42bb9fcbe7b767ce6157612e4dc5a7dec2679f84 | ORPH
   x86_64    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/414ac0381bcaa40038c3cdc67091eecba7a11928 | ORPH
  powerpc    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/5b858be9a2fbaa1e1c2d99e80922e468e6b0a104 | ORPH
 aarch64_be  |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/eb2d8b0b815c73e1cd96edab4deb1c3b760acfdc | ORPH
   mips64    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/b595246d617a3ad3a3fafd26e38bd78993bb3aa6 | ORPH
    m68k     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/94bc3c3b578bb266aeae87e91228ca9f8f3c4b0a | ORPH
   mipsel    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/898cdadaa66735d487d57696c24bd27f74b32ad3 | ORPH
   s390x     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/d09ad6d928865c8b19d4bf260d207b0a0fe7b206 | ORPH
 microblaze  |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/364030db6d69aff6c7b7569bf18c0f6065541d39 |     
 microblaze  |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/cb6a26da6de35bc44b16951640accc1920603596 |     
powerpc64le  |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/f3d5d6fb7a06803a93ab9f1e1b16749b0c94d107 |     
 aarch64_be  |      tesseract-ocr-5.0.1       | NOK | http://autobuild.buildroot.net/results/b9246a37fcf6be4fabfc491daddadfb09e0a320a |     
   sparc     |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/b739dbc6e48ea6ee92f460d4f72a3a3ba9bec881 | ORPH
    or1k     |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/a14cca1429687b7253f8e351589486017e8c039e | ORPH
powerpc64le  |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/f82245eb76f13c7970ce206b3b556a11b93376ae | ORPH
  aarch64    |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/4dee677f36abfb40585a51624b93451367e45cb4 | ORPH
  riscv32    |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/3b341f78863b3e4974e851265908f9ef6f08da0d | ORPH
    mips     |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/d399db485e2f72157766140d519bcf403dcaf0ea | ORPH
    sh4      |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/2691dee5f47b0b08feb9cf5aa5ce9fdbbd366cc4 | ORPH
 microblaze  |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/51e5138200570587a557cce3ebac9d3ca6380817 | ORPH
  powerpc    |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/49cd3af00f3f503980383ef47a94255f5279def4 | ORPH
   sparc     |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/eac89a8d7a65a1750783f830c9ddbd83c14549fd | ORPH
 aarch64_be  |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/086889de2cb349d22a0708c74fd3603c72ca7880 | ORPH
   armeb     |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/d650b02aef6c657b4095de3c0cd305ee829ca336 | ORPH
  sparc64    |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/f4be0277df81ee87b56b58c613279d5782907297 | ORPH
microblazeel |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/33c9efd0838f6ace9a4be817014441405b91d162 | ORPH
  aarch64    |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/b01ef6a1dc536a23cb5666ab2238c99b16040f85 | ORPH
   x86_64    |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/fa6d0d3297ba32833a3915de86979aec591c3f65 | ORPH
   x86_64    |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/df0cc9a03267a2694994849e5971f62561e9ddc2 | ORPH
   x86_64    |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/d2a8d5be4851c11e62a1fd7c8bb8a3493958d9d7 | ORPH
   armeb     |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/03637b8d83bfb4913ec007474d83ec07bd63250c | ORPH
 powerpc64   |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/35e9dc48afce9f4958016b7c95e1ce0245147f78 | ORPH
   sh4eb     |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/f758037b29f54b3ca1c2d267a54020ec18fea26f | ORPH
 aarch64_be  |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/496267dec7205af4e1c2e5ab85530fb3d132ad02 | ORPH
   s390x     |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/1c35b2daa0ad558fda6bd21c5ba80194874e0e02 | ORPH
  sparc64    |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/75c83b8284864257d542ce3eeb3ae9c77fc52c3d | ORPH
    arc      |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/745e6896d0b81cc93d9062e4a5cf90c7d9461473 | ORPH
 powerpc64   |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/747b2c163a8b095016873dc83cd358ce3ee327e6 | ORPH
   xtensa    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/f0c7c286c519a6f591867e37a4d09f4cc8cd449d |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/c1faec26dc2c503f20680f7002da7f30f92027e8 |     
    arc      |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/dda9da5eb64e9690618d2af0c4c85317ce11696c |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/b8d25a4b3d400d1b2491349d0e7d8fdb5491f452 |     
   xtensa    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/9faa77432ec8c6ec97dd70e4864621f562fa8f8d |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/0cc5d074881c389979c1fd355e9d3d3aee41861d |     
   xtensa    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/c0dd4d36da96ffbeaee1c30cdbc8ab905c47c406 |     
   xtensa    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/f533bbb836171c48626b701fb531b67412ec0c59 |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/68794e83f73676673b577a542d13991073a7c4cd |     
   xtensa    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/5b88754ea6aa4ea0b0ba214e3cf7118bbf264785 |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/52eef8959b404b22bdc036a384361e3b6bd7eca4 |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/fddaa1cd53ca59effdafec6d042bf0182f66c9f7 |     
   xtensa    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/6784565ab3286bf7886b763705736a0327f64fb6 |     
   xtensa    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/8fc1010f19bbd83412fb9ea8e88ccfa51290144b |     
   xtensa    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/43d6a732234dc2c3f814b05abc08cd8f467be759 |     
powerpc64le  | uclibc-ng-test-0844445e7358... | NOK | http://autobuild.buildroot.net/results/767730fe86588ab5196dde8ea973c5531c2d862a |     
  sparc64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/91d1569d87b2eed0e0f65f2507ad8a4cccd459a3 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/243b2db9db90f416f78e78ca48e4f7b9986dd71b |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/19e5810b9ec8d4c025c1c4b644e80e6b5621f7bd |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/f8c33926fef4ace0ce4fbb969dfe5ebe645dbc24 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/3f82e663e4fe49284e0cb3df3fcdebc380241150 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/75726329201266e16d75cddc0bf6ecfc238a1332 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/21490f6e09f261dcd7d667f1461fc921bfabe721 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/24a283650b035049d88f7267878fc70a2bac681c |     
    mips     | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/c653108a3b7c6bc9efd6f1b8e71b137bbd2282b0 |     
 aarch64_be  | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/2fb15174458904a2911a2ff393b23ea7fa2ef936 |     
 microblaze  |         usbguard-1.1.1         | NOK | http://autobuild.buildroot.net/results/ba8427d7e25a816035be453b71ddc8a428dce5b6 |     
  powerpc    |           volk-2.5.1           | NOK | http://autobuild.buildroot.net/results/fd021d20e4d0c091f9b47a67ae562b833894e68d |     
   nios2     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/5f2ba4c83115221fd8ebb705b5ac838272d16828 |     
   nios2     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/4b64a0ff3ce8a10532ab0bd87b10d1dfe80bfe62 |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/36652e6cfa79e427655dbce3acca0f52b4817bcb |     
    m68k     |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/94dd2e6c7fe2099a9020446605374253e816aa69 | ORPH
powerpc64le  |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/10f89a762661320e52f1f4527dc89e9c210b0403 | ORPH
    i686     |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/62024d0db8808f713279111fc088e77c906f85ee | ORPH
    m68k     |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/96d0db0d848c7115f7bbddf584517ab6842404e4 | ORPH
  aarch64    |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/c90975a7bafe725c0c88c09c54667bbf0c7e4e1a | ORPH
   x86_64    |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/845915afa88edeb5debc70f91a5a2fe20e4cec78 | ORPH
    arm      |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/c8124a410363832b947348fda3ab823e417ad714 | ORPH
  riscv32    |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/544a0de4fb82e514683f90f883a8574bd9bccb7f | ORPH
    sh4a     |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/930f564cbd0a092c41b0dcf0b14ed21b12f347c5 | ORPH
  sparc64    |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/6490b57bfdda9273b43a6ea9db2457ebde615cf1 | ORPH
   armeb     |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/ffcd3cad896a84ff54ebaf1ab9796eafb13fea30 | ORPH
   sparc     |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/8c02a10c696d1f83b2269d1902df25c280b943c8 | ORPH
    arc      |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/e652b84a7951c2650f487a01f1fd95cd05620e90 | ORPH
microblazeel |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/f0909d69362d1e7773a062b4077149b54b477acf | ORPH
powerpc64le  |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/5fa35d4fa3e6fb84edafbfdde34b2db7f0c497f2 | ORPH
    arm      |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/121b0e4942a223c821051ddc98d9656b330b8105 | ORPH
  riscv64    |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/7dfe963a33b81a948d4cbe673856bc901d09baad | ORPH
  powerpc    |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/71995a2e3e7ec3c4445c38f6dd5ec14eec5dbb14 | ORPH
   s390x     |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/c72ebbce59258a3c00a9be620ab9654ddd0c4922 | ORPH
 aarch64_be  |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/39377e574b8c47a78000d9ba60015461e74d5569 | ORPH
 powerpc64   |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/6e0fa14241be0775aabde4e30849d892b8fc2e48 | ORPH
 aarch64_be  |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/a7fc211c34f7efe9857802fac698139733984291 | ORPH
 powerpc64   |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/a92d0ec2ec74aec84e9adee90752a686a44b237d | ORPH
   mipsel    |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/69f4cb8c1480b8716007621cce7e4e35812e3953 | ORPH
  aarch64    |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/c27a4cbbc1c14f705c3ca74f5c43176c23f3f7ce | ORPH
   x86_64    |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/84bfee5f3cea257f030ffbf654cac83330539328 | ORPH
    i686     |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/9d8c465c220197ea8c03aa0f8b943056b032d43e | ORPH
   arceb     |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/8c101fd7658c5afa0b02f42804de9189975e2350 | ORPH
   x86_64    |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/37ec8b9cb026b292f86596107fd6679f2380627d |     
powerpc64le  |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/30aa20eaf7f41880811777c0fa6a174e47758145 |     
   x86_64    |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/efb2c1a59c9767a24a5d43370f6717c5141e9d4b |     
 powerpc64   |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/981d0e75a26544af7e32275d6298e27a4c7265bb |     
   mipsel    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/fdf9b25de0d1a712fa58fe8bbd1bc8e3ca33f0cb |     
   nios2     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/c4f7ac5bf4748bd494eb67e554d6ededf636a2ce |     
   mipsel    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/5c284bc007980630e96361089a1306953b4b3112 |     
    arm      |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/188b9db6c8f8c85fd005b16e285a589863d0c382 |     
   xtensa    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/3a97d69c465816be5b42afa10081900eebb169df |     
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/c3beacef599c7666a2f4de3ccc74038af89863bc | ORPH
 microblaze  |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/5c7ff4baeb07b79ae10c02536161aa468c048347 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

           libfreeimage-3.18.0 | 2 
               belle-sip-4.4.8 | 1 
                  exempi-2.6.1 | 1 
                 musepack-r475 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/48d58060852c79873675a5e33dc54a83a2d87962 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/b3d8c539372faa8649c4606bc734b944f8de6184 |     
    m68k     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/d0e83bd3a23cc66c643b83c028eb84e6ae0e3eaf |     
   x86_64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/3b5fa0b970dfaf40c590546641f32f885dfb7df9 |     
   x86_64    |         musepack-r475          | NOK | http://autobuild.buildroot.net/results/1a9d8ea5132d011a14e4f37fd0ef02f69ca4e91c | ORPH


Classification of failures by reason for 2022.05.x
--------------------------------------------------

                 linux-5.17.15 | 3 
/home/buildroot/autobuild/i... | 2 
                busybox-1.35.0 | 2 
           libfreeimage-3.18.0 | 2 
                 wavemon-0.9.4 | 2 
             18xx-ti-utils-8.8 | 1 
                     ace-7.0.6 | 1 
                  acpid-2.0.33 | 1 
                apparmor-3.0.4 | 1 
                arp-scan-1.9.7 | 1 
                     aufs-util | 1 
                    brltty-6.4 | 1 
                  check-0.15.2 | 1 
                     frr-8.2.2 | 1 
fs/axfs/axfs.mk:32: /home/t... | 1 
fs/ubi/ubi.mk:51: /home/tho... | 1 
               gocryptfs-2.2.1 | 1 
host-google-breakpad-c85eb4... | 1 
host-pahole-73383b3a39afe86... | 1 
                   hwloc-2.7.0 | 1 
               libdcadec-0.2.0 | 1 
                libglvnd-1.3.2 | 1 
                 mesa3d-21.3.8 | 1 
                   perl-5.34.1 | 1 
                 pixman-0.40.0 | 1 
               poppler-21.12.0 | 1 
               protobuf-3.20.1 | 1 
                     pv-1.6.20 | 1 
                    ruby-3.1.2 | 1 
             stress-ng-0.13.05 | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/94539e6ffc6c42342803018cabf0c68c1313d111 |     
   xtensa    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/4cad3477b4aa1c371743dc4bdc5a07a02d8f4795 |     
    m68k     |       18xx-ti-utils-8.8        | NOK | http://autobuild.buildroot.net/results/5bbf6745a014bac5f98877349f8ea05e01294a1a |     
microblazeel |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/499459950323e5400abcc282ecfaa47d295af14f |     
  mips64el   |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/d5d4f991d4bcd8112dd19b8158fee1ca3296da79 | ORPH
    arc      |         apparmor-3.0.4         | NOK | http://autobuild.buildroot.net/results/8de150f95b6ec3c7e098996904b5a56f85538404 |     
  riscv64    |         arp-scan-1.9.7         | NOK | http://autobuild.buildroot.net/results/bb5b7c7bf7fc0ee19b17b9ac9ff293f459d47239 |     
   nios2     |           aufs-util            | NOK | http://autobuild.buildroot.net/results/41902619043c80a8062b09823e7fd0f2b5c78ea6 |     
microblazeel |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/6c7b3f99419bf30847b636ac523c56dcac3633bd |     
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/3364cde17eb7af55cb34be7d8766e052187970f5 | ORPH
    m68k     |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/a20c5c65448c71ab233745d6b0b9173462e31be4 | ORPH
    m68k     |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/cc0df5a8cd0affa5436a2ec04da5ae106448f75d | ORPH
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/5a3b30c769ee39e776ebdda650ad076dcbee3fea |     
 powerpc64   | fs/axfs/axfs.mk:32: /home/t... | NOK | http://autobuild.buildroot.net/results/1014b8a6e0c090fd64bb3217d26196b9986d1ae7 |     
   mips64    | fs/ubi/ubi.mk:51: /home/tho... | NOK | http://autobuild.buildroot.net/results/113fb4e9c3dbaf8e44dc2489358cb13efe3082f1 |     
   x86_64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/79edd951fa35b2f19b46e2dd236bef87fe4dfc8d |     
    arm      | host-google-breakpad-c85eb4... | NOK | http://autobuild.buildroot.net/results/5b07c65075ad8df5b8b2096baa31382a114286e9 |     
   xtensa    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/2cef0443e1f99c220682e52fc81ca7c860d46294 |     
   x86_64    |          hwloc-2.7.0           | NOK | http://autobuild.buildroot.net/results/7f18e42ed1509b302f579644603581e587095e43 |     
    arm      |        libdcadec-0.2.0         | NOK | http://autobuild.buildroot.net/results/fff37670ee808c9716a39c1d02ca7a6f972bfb47 |     
    i686     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/e281850c702307bfecfba97745f26f0f41aa8510 |     
    arm      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/c7bf8bb74191c375f9a1e3879f789cc9e07c4a36 |     
   xtensa    |         libglvnd-1.3.2         | NOK | http://autobuild.buildroot.net/results/ad2b6a1422ca2708815aa7324ff434fdedb1c011 | ORPH
    arc      |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/bd6ea8de8dd3c476a7c569b141b0e0b5ae4b5089 | ORPH
 powerpc64   |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/871c911419c4efd1f3562d3035bd2ebff7d40c86 | ORPH
    m68k     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/e0d70c17c149bd75009b65a4afd12d9419262e9e | ORPH
   x86_64    |         mesa3d-21.3.8          | NOK | http://autobuild.buildroot.net/results/0f85d0fb1fad866315ed8a17c307c669a3e01297 |     
   arceb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/c97b88ffa69e71dcd22bd93cfd335ca75892d374 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/48fcfb447dff6f1f3e56ffbb1954bff407be861f |     
   xtensa    |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/a6d2ced7526a4e6d32ceb89d357097c22d3b0a15 |     
 microblaze  |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/b484276b8c2e17fc817bfa6981672403caf7acaa |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/d2951345b472cd32427041670d286f5c7c398e25 | ORPH
  riscv64    |           ruby-3.1.2           | NOK | http://autobuild.buildroot.net/results/46d107d162210158fdc56e3c6e657826cee675c7 |     
   sparc     |       stress-ng-0.13.05        | NOK | http://autobuild.buildroot.net/results/6c4b2feba028230624915df9cf966fb2210e906e |     
   mips64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/d66df6e7449e74b455352f2974c36d03af682f5f |     
  sparc64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/8966387a6223119b152217e264c8af788b5bb6ea |     


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org        |   version    |   upstream   | orph?
-------------------------------+----------+----------------------------------------------+--------------+--------------+-------
                           ace |  DISTRO  | https://release-monitoring.org/project/242395 | 7.0.6        | 7.0.8        |     
                        acpica |  DISTRO  | https://release-monitoring.org/project/00018 | 20200717     | 20220331     |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/13117 | 3.37.2       | 42.0         |     
                       agentpp |  DISTRO  | https://release-monitoring.org/project/21316 | 4.5.3        | 4.5.4        |     
                        alfred |  DISTRO  | https://release-monitoring.org/project/241870 | 2022.1       | 2022.2       |     
                  alsa-plugins |  DISTRO  | https://release-monitoring.org/project/00041 | 1.2.6        | 1.2.7.1      |     
                 android-tools |  GUESS   | https://release-monitoring.org/project/13989 | 4.2.2+git... | 13.0.0_r3    |     
                     angularjs |  DISTRO  | https://release-monitoring.org/project/21321 | 1.8.2        | 1.8.3        |     
                      apitrace |  DISTRO  | https://release-monitoring.org/project/06170 | 10.0         | 11.1         |     
                      apparmor |  DISTRO  | https://release-monitoring.org/project/94819 | 3.0.4        | 3.0.7        |     
                     armadillo |  DISTRO  | https://release-monitoring.org/project/07006 | 9.900.2      | 11.2.3       |     
                        assimp |  DISTRO  | https://release-monitoring.org/project/06988 | 5.2.1        | 5.2.4        |     
                      asterisk |  DISTRO  | https://release-monitoring.org/project/09838 | 16.25.2      | 19.6.0       |     
                   at-spi2-atk |  DISTRO  | https://release-monitoring.org/project/07840 | 2.34.2       | 2.38.0       |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/07841 | 2.36.0       | 2.44.1       |     
                         atkmm |  DISTRO  | https://release-monitoring.org/project/07962 | 2.36.1       | 2.36.2       |     
                         audit |  DISTRO  | https://release-monitoring.org/project/15225 | 3.0.7        | 3.0.8        |     
              autoconf-archive |  DISTRO  | https://release-monitoring.org/project/00142 | 2021.02.19   | 2022.02.11   |     
                       avrdude |  DISTRO  | https://release-monitoring.org/project/10751 | 6.4          | 7.0          |     
                        avro-c |  DISTRO  | https://release-monitoring.org/project/59411 | 1.11.0       | 1.11.1       |     
               azure-iot-sdk-c |  DISTRO  | https://release-monitoring.org/project/21322 | LTS_01_20... | 3033-01-05   |     
                        babeld |  DISTRO  | https://release-monitoring.org/project/00154 | 1.9.2        | 1.12.1       | ORPH
                 balena-engine |  DISTRO  | https://release-monitoring.org/project/141616 | 20.10.12     | 20.10.18     | ORPH
                           bat |  DISTRO  | https://release-monitoring.org/project/241901 | 0.19.0       | 0.21.0       |     
                        batctl |  DISTRO  | https://release-monitoring.org/project/14740 | 2021.0       | 2022.2       |     
                    batman-adv |  DISTRO  | https://release-monitoring.org/project/19529 | 2021.4       | 2022.2       |     
                     bats-core |  DISTRO  | https://release-monitoring.org/project/10587 | 1.4.1        | 1.7.0        |     
                     bctoolbox |  DISTRO  | https://release-monitoring.org/project/14746 | 4.4.8        | 5.1.55       | ORPH
                         bdwgc |  DISTRO  | https://release-monitoring.org/project/17108 | 8.0.6        | 8.2.0        |     
                     belle-sip |  DISTRO  | https://release-monitoring.org/project/14378 | 4.4.8        | 5.1.55       |     
                          belr |  DISTRO  | https://release-monitoring.org/project/80042 | 4.4.8        | 5.1.55       |     
                    berkeleydb |  GUESS   | https://release-monitoring.org/project/138386 | 5.3.28       | 18.1.5       | ORPH
                          bind |  DISTRO  | https://release-monitoring.org/project/14923 | 9.16.31      | 9.18.6       | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/07981 | 2.37         | 2.39         |     
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/13618 | 0.21.2       | 23.0         |     
                         boinc |  DISTRO  | https://release-monitoring.org/project/00211 | 7.18.1       | 7.20.2       |     
                        bonnie |  DISTRO  | https://release-monitoring.org/project/00212 | 1.03e        | 2.00a        | ORPH
                         boost |  DISTRO  | https://release-monitoring.org/project/06845 | 1.79.0       | 1.80.0       |     
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/21578 | 4.3.1        | 5.2.0        |     
                        brltty |  DISTRO  | https://release-monitoring.org/project/00220 | 6.4          | 6.5          |     
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/00227 | 5.16.2       | 5.19         | ORPH
                        bullet |  DISTRO  | https://release-monitoring.org/project/07669 | 3.21         | 3.24         |     
                        c-icap |  DISTRO  | https://release-monitoring.org/project/21325 | 0.5.7        | 0.5.9        | ORPH
                c-icap-modules |  DISTRO  | https://release-monitoring.org/project/21326 | 0.5.4        | 0.5.5        | ORPH
                         cairo |  DISTRO  | https://release-monitoring.org/project/00247 | 1.16.0       | 1.17.6       |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/10888 | 0.0.25       | 0.303.1      | ORPH
                     capnproto |  DISTRO  | https://release-monitoring.org/project/11515 | 0.9.1        | 0.10.2       |     
                        ccache |  DISTRO  | https://release-monitoring.org/project/00257 | 3.7.12       | 4.6.1        | ORPH
                       chartjs |  DISTRO  | https://release-monitoring.org/project/85785 | 2.9.4        | 3.9.1        |     
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/00276 | 3.3          | 20200710     |     
                      checksec |  DISTRO  | https://release-monitoring.org/project/17677 | 2.5.0        | 2.6.0        |     
                    cifs-utils |  DISTRO  | https://release-monitoring.org/project/00287 | 6.15         | 7.0          |     
                        circus |  DISTRO  | https://release-monitoring.org/project/21726 | 0.16.1       | 0.17.1       |     
                        clamav |  DISTRO  | https://release-monitoring.org/project/00291 | 0.103.7      | 0.105.1      |     
                         clang |  DISTRO  | https://release-monitoring.org/project/11811 | 11.1.0       | 14.0.6       |     
                         cmake |  DISTRO  | https://release-monitoring.org/project/00306 | 3.22.3       | 3.24.1       |     
                           cog |  DISTRO  | https://release-monitoring.org/project/21333 | 0.12.4       | 0.13.90      |     
                      collectl |  DISTRO  | https://release-monitoring.org/project/00330 | 4.3.2        | 4.3.3        |     
                   compiler-rt |  GUESS   | https://release-monitoring.org/project/17705 | 11.1.0       | 900          |     
                    containerd |  DISTRO  | https://release-monitoring.org/project/16460 | 1.6.6        | 1.6.8        |     
                          crda |  DISTRO  | https://release-monitoring.org/project/00363 | 4.14         | 4.15         |     
                      cryptopp |  DISTRO  | https://release-monitoring.org/project/14487 | 8.6.0        | 8.7.0        |     
                cups-pk-helper |  DISTRO  | https://release-monitoring.org/project/17717 | 0.2.6        | 0.2.7        | ORPH
                      cutelyst |  DISTRO  | https://release-monitoring.org/project/21335 | 2.11.0       | 3.5.0        |     
                        dacapo |  DISTRO  | https://release-monitoring.org/project/20546 | 9.12-MR1-... | 9.12-vbump   |     
                          dado |  DISTRO  | https://release-monitoring.org/project/58442 | 1.8.3-1      | 2.0.0-3      |     
                          daq3 |  DISTRO  | https://release-monitoring.org/project/212345 | 3.0.5        | 3.0.9        |     
                    datatables |  DISTRO  | https://release-monitoring.org/project/141588 | 1.10.20      | 1.12.1       |     
            datatables-buttons |  DISTRO  | https://release-monitoring.org/project/141589 | 1.6.1        | 2.2.3        |     
       datatables-fixedcolumns |  DISTRO  | https://release-monitoring.org/project/141590 | 3.3.0        | 4.1.0        |     
         datatables-responsive |  DISTRO  | https://release-monitoring.org/project/141591 | 2.2.3        | 2.3.0        |     
                          dbus |  DISTRO  | https://release-monitoring.org/project/05356 | 1.12.22      | 1.14.0       | ORPH
                   dbus-broker |  DISTRO  | https://release-monitoring.org/project/271475 | 29           | 32           |     
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/15086 | 7.2.641      | 7.2.646      | ORPH
                   debianutils |  DISTRO  | https://release-monitoring.org/project/21341 | 4.11         | 5.7          | ORPH
                         delve |  DISTRO  | https://release-monitoring.org/project/40149 | 1.8.0        | 1.9.0        |     
                        dialog |  DISTRO  | https://release-monitoring.org/project/00431 | 1.3-20220117 | 1.3-20220728 | ORPH
                docker-compose |  DISTRO  | https://release-monitoring.org/project/06185 | 1.24.1       | 2.10.0       |     
             double-conversion |  GUESS   | https://release-monitoring.org/project/07454 | 3.2.0        | 3.2.1        |     
                            dt |  DISTRO  | https://release-monitoring.org/project/21844 | 18.32        | 21.27        | ORPH
                          edk2 |  DISTRO  | https://release-monitoring.org/project/125953 | edk2-stab... | 202205       |     
                    efibootmgr |  DISTRO  | https://release-monitoring.org/project/00663 | 17           | 18           |     
                        efivar |  DISTRO  | https://release-monitoring.org/project/00664 | 37           | 38           |     
                           efl |  DISTRO  | https://release-monitoring.org/project/06128 | 1.26.1       | 1.26.2       |     
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/00667 | 21.12        | 22.05        |     
                      elfutils |  DISTRO  | https://release-monitoring.org/project/05679 | 0.186        | 0.187        | ORPH
                        elixir |  DISTRO  | https://release-monitoring.org/project/00673 | 1.9.4        | 1.13.4       |     
                           ell |  DISTRO  | https://release-monitoring.org/project/17781 | 0.49         | 0.52         |     
                         empty |  DISTRO  | https://release-monitoring.org/project/20564 | 0.6.21b      | 0.6.22b      | ORPH
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/00698 | 0.25.1       | 0.25.3       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/00707 | 22.3.4.22    | 25.0.4       |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/17060 | 1.0.21       | 1.0.22       |     
               erlang-goldrush |  DISTRO  | https://release-monitoring.org/project/09692 | 0.1.9        | 0.2.0        |     
                   erlang-jose |  DISTRO  | https://release-monitoring.org/project/16913 | 1.11.1       | 1.11.2       |     
                  erlang-lager |  DISTRO  | https://release-monitoring.org/project/00727 | 3.9.1        | 3.9.2        |     
                erlang-p1-acme |  DISTRO  | https://release-monitoring.org/project/45375 | 1.0.16       | 1.0.19       |     
           erlang-p1-cache-tab |  DISTRO  | https://release-monitoring.org/project/08757 | 1.0.29       | 1.0.30       |     
              erlang-p1-mqtree |  DISTRO  | https://release-monitoring.org/project/20220 | 1.0.14       | 1.0.15       |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/09302 | 0.6.10       | 0.8.0        |     
                erlang-p1-pkix |  DISTRO  | https://release-monitoring.org/project/20539 | 1.0.8        | 1.0.9        |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/09222 | 1.0.27       | 1.0.28       |     
                erlang-p1-stun |  DISTRO  | https://release-monitoring.org/project/09151 | 1.0.47       | 1.2.5        |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/10455 | 1.1.13       | 1.1.15       |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/08643 | 1.0.23       | 1.0.25       |     
                erlang-p1-xmpp |  DISTRO  | https://release-monitoring.org/project/12752 | 1.5.6        | 1.5.8        |     
                erlang-p1-yaml |  DISTRO  | https://release-monitoring.org/project/10243 | 1.0.32       | 1.0.33       |     
               erlang-p1-yconf |  DISTRO  | https://release-monitoring.org/project/45378 | 1.0.12       | 1.0.13       |     
                erlang-p1-zlib |  DISTRO  | https://release-monitoring.org/project/09283 | 1.0.10       | 1.0.12       |     
                       ethtool |  DISTRO  | https://release-monitoring.org/project/00763 | 5.18         | 5.19         |     
                      execline |  DISTRO  | https://release-monitoring.org/project/05482 | 2.8.0.1      | 2.9.0.1      |     
                        exempi |  DISTRO  | https://release-monitoring.org/project/00767 | 2.6.1        | 2.6.2        |     
                      fakeroot |  DISTRO  | https://release-monitoring.org/project/12048 | 1.26         | 1.29         | ORPH
                           feh |  DISTRO  | https://release-monitoring.org/project/00790 | 3.7.1        | 3.9          |     
                     fetchmail |  DISTRO  | https://release-monitoring.org/project/00801 | 6.4.29       | 6.4.32       |     
                        ffmpeg |  DISTRO  | https://release-monitoring.org/project/05405 | 4.4.2        | 5.1          |     
                   fftw-double |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.10       | ORPH
              fftw-long-double |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.10       | ORPH
                     fftw-quad |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.10       | ORPH
                   fftw-single |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.10       | ORPH
                          file |  DISTRO  | https://release-monitoring.org/project/00807 | 5.41         | 5.42         | ORPH
                           fio |  DISTRO  | https://release-monitoring.org/project/00806 | 3.28         | 3.31         |     
                       flannel |  DISTRO  | https://release-monitoring.org/project/07421 | 0.14.0       | 0.19.1       |     
                  flare-engine |  DISTRO  | https://release-monitoring.org/project/21433 | 1.12         | 1.13.04      |     
                    flare-game |  DISTRO  | https://release-monitoring.org/project/21434 | 1.12         | 1.13.04      |     
                          flot |  DISTRO  | https://release-monitoring.org/project/07184 | 0.8.3        | 4.2.3        | ORPH
                          fltk |  DISTRO  | https://release-monitoring.org/project/00823 | 1.3.7        | 1.3.8        | ORPH
                           fmc |  GUESS   | https://release-monitoring.org/project/145761 | fsl-sdk-v2.0 | 0.2.0        |     
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/00826 | 4.7.0        | 6.1.2        | ORPH
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/00827 | 2.13.1       | 2.14.0       | ORPH
                           frr |  DISTRO  | https://release-monitoring.org/project/18555 | 8.2.2        | 8.3          |     
                fuse-overlayfs |  DISTRO  | https://release-monitoring.org/project/101220 | 1.5.0        | 1.9          |     
                          fwts |  DISTRO  | https://release-monitoring.org/project/17383 | 21.11.00     | 22.07.00     |     
                           gcr |  DISTRO  | https://release-monitoring.org/project/11801 | 3.40.0       | 3.41.1       | ORPH
                    gdk-pixbuf |  DISTRO  | https://release-monitoring.org/project/09533 | 2.42.8       | 2.42.9       | ORPH
                        gensio |  DISTRO  | https://release-monitoring.org/project/67634 | 2.2.9        | 2.5.2        |     
                       gerbera |  DISTRO  | https://release-monitoring.org/project/18420 | 1.10.0       | 1.11.0       |     
                  gesftpserver |  DISTRO  | https://release-monitoring.org/project/59393 | 1            | 2            | ORPH
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/00898 | 0.20.1       | 0.21         | ORPH
                           git |  DISTRO  | https://release-monitoring.org/project/05350 | 2.31.2       | 2.37.2       |     
                 gitlab-runner |  DISTRO  | https://release-monitoring.org/project/11337 | 14.5.1       | 15.3.0       |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/21353 | 2.70.1       | 2.72.2       | ORPH
                        glibmm |  DISTRO  | https://release-monitoring.org/project/07960 | 2.68.2       | 2.72.1       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/01181 | 0.9.9.5      | 0.9.9.8      | ORPH
                       gnu-efi |  DISTRO  | https://release-monitoring.org/project/01202 | 3.0.14       | 3.0.15       |     
                      gnuradio |  DISTRO  | https://release-monitoring.org/project/01217 | 3.8.2.0      | 3.10.3.0     |     
                            go |  DISTRO  | https://release-monitoring.org/project/01227 | 1.18.5       | 1.19         |     
         gobject-introspection |  DISTRO  | https://release-monitoring.org/project/01223 | 1.70.0       | 1.72.0       | ORPH
                          gpsd |  DISTRO  | https://release-monitoring.org/project/06846 | 3.23.1       | 3.24         |     
                          gqrx |  DISTRO  | https://release-monitoring.org/project/09771 | 2.14.4       | 2.15.9       |     
                       granite |  DISTRO  | https://release-monitoring.org/project/05410 | 6.0.0        | 7.0.0        | ORPH
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/13139 | 3.36.1       | 42.0         | ORPH
                           gsl |  DISTRO  | https://release-monitoring.org/project/01267 | 2.6          | 2.7.1        | ORPH
                         gssdp |  DISTRO  | https://release-monitoring.org/project/01262 | 1.4.0.1      | 1.5.2        |     
                      gst1-imx |  DISTRO  | https://release-monitoring.org/project/21846 | 0.13.1       | 2.1.0        |     
                         gtest |  DISTRO  | https://release-monitoring.org/project/18290 | 1.12.0       | 1.12.1       |     
                        gtkmm3 |  DISTRO  | https://release-monitoring.org/project/07963 | 3.22.0       | 4.7.1        |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/07724 | 3.24.7       | 5.5.1        |     
                         gupnp |  DISTRO  | https://release-monitoring.org/project/01281 | 1.4.3        | 1.5.3        |     
                      gupnp-av |  DISTRO  | https://release-monitoring.org/project/01282 | 0.14.0       | 0.14.1       |     
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/01285 | 5.2.14       | 5.3.4        | ORPH
                          gvfs |  DISTRO  | https://release-monitoring.org/project/05496 | 1.48.1       | 1.50.2       | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/01298 | 2.6.1        | 2.6.3        |     
                       haveged |  DISTRO  | https://release-monitoring.org/project/11695 | 1.9.15       | 1.9.18       |     
                        hdparm |  DISTRO  | https://release-monitoring.org/project/01304 | 9.63         | 9.64         |     
                      hiawatha |  DISTRO  | https://release-monitoring.org/project/13375 | 11.1         | 11.2         |     
                        hidapi |  DISTRO  | https://release-monitoring.org/project/05594 | 0.11.0       | 0.12.0       | ORPH
                         hplip |  DISTRO  | https://release-monitoring.org/project/01327 | 3.17.10      | 3.22.6       | ORPH
                       htpdate |  DISTRO  | https://release-monitoring.org/project/132187 | 1.3.5        | 1.3.6        |     
                        hwdata |  DISTRO  | https://release-monitoring.org/project/05387 | 0.358        | 0.361        | ORPH
                         hwloc |  DISTRO  | https://release-monitoring.org/project/13501 | 2.7.0        | 2.8.0        |     
                          i2pd |  DISTRO  | https://release-monitoring.org/project/21355 | 2.40.0       | 2.43.0       |     
                   ibm-sw-tpm2 |  DISTRO  | https://release-monitoring.org/project/18952 | 1661         | 1682         |     
                           icu |  DISTRO  | https://release-monitoring.org/project/16134 | 70-1         | 71-1         | ORPH
                     ifenslave |  DISTRO  | https://release-monitoring.org/project/21670 | 2.9          | 2.13         | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/21673 | 0.8.16       | 0.8.37       | ORPH
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/01372 | 7.1.0-45     | 7.1.0-46     | ORPH
                        imlib2 |  DISTRO  | https://release-monitoring.org/project/21676 | 1.7.3        | 1.9.1        |     
                          inih |  DISTRO  | https://release-monitoring.org/project/11600 | 55           | 56           |     
                 inotify-tools |  DISTRO  | https://release-monitoring.org/project/08864 | 3.20.2.2     | 3.22.6.0     | ORPH
             intel-mediadriver |  DISTRO  | https://release-monitoring.org/project/20341 | 22.5.1       | 22.5.2       |     
                intel-mediasdk |  DISTRO  | https://release-monitoring.org/project/21814 | 22.5.1       | 22.5.2       |     
               intel-microcode |  DISTRO  | https://release-monitoring.org/project/20614 | 20210608     | 20220809     | ORPH
                         iperf |  DISTRO  | https://release-monitoring.org/project/01388 | 2.1.6        | 2.1.8        |     
                        iperf3 |  DISTRO  | https://release-monitoring.org/project/01389 | 3.10.1       | 3.11         |     
                      iproute2 |  DISTRO  | https://release-monitoring.org/project/01392 | 5.18.0       | 5.19.0       |     
                      irrlicht |  DISTRO  | https://release-monitoring.org/project/01403 | 1.8.4        | 1.8.5        |     
                         irssi |  DISTRO  | https://release-monitoring.org/project/01404 | 1.2.3        | 1.4.2        |     
                           isl |  DISTRO  | https://release-monitoring.org/project/13286 | 0.24         | 0.25         | ORPH
                            iw |  DISTRO  | https://release-monitoring.org/project/01410 | 5.16         | 5.19         |     
                           iwd |  DISTRO  | https://release-monitoring.org/project/18380 | 1.25         | 1.29         |     
                         jack2 |  DISTRO  | https://release-monitoring.org/project/21358 | 1.9.20       | 1.9.21       |     
                         janet |  DISTRO  | https://release-monitoring.org/project/155612 | 1.23.0       | 1.24.0       |     
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/15715 | 1.0.3        | 1.0.4        |     
                        jasper |  DISTRO  | https://release-monitoring.org/project/01421 | 2.0.33       | 3.0.6        |     
         jitterentropy-library |  DISTRO  | https://release-monitoring.org/project/29701 | 3.3.1        | 3.4.0        |     
                    jpeg-turbo |  DISTRO  | https://release-monitoring.org/project/01648 | 2.1.3        | 2.1.4        |     
         jquery-datetimepicker |  DISTRO  | https://release-monitoring.org/project/13910 | 2.4.5        | 2.5.20       |     
               jquery-keyboard |  DISTRO  | https://release-monitoring.org/project/21681 | 1.18.12      | 1.30.4       | ORPH
                 jquery-mobile |  DISTRO  | https://release-monitoring.org/project/59395 | 1.4.3        | 1.4.5        | ORPH
                     jquery-ui |  DISTRO  | https://release-monitoring.org/project/21815 | 1.10.4       | 1.13.2       |     
              jquery-ui-themes |  DISTRO  | https://release-monitoring.org/project/21816 | 1.10.4       | 1.13.2       |     
           json-for-modern-cpp |  DISTRO  | https://release-monitoring.org/project/11152 | 3.10.5       | 3.11.2       | ORPH
                         jszip |  DISTRO  | https://release-monitoring.org/project/141558 | 3.10.0       | 3.10.1       |     
                         kexec |  DISTRO  | https://release-monitoring.org/project/12689 | 2.0.24       | 2.0.25       | ORPH
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 5.97.0       |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 5.97.0       |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 5.97.0       |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 5.97.0       |     
                        kismet |  DISTRO  | https://release-monitoring.org/project/06966 | 2022-02-R1   | 2022-08-R1   | ORPH
                          kmod |  DISTRO  | https://release-monitoring.org/project/01517 | 29           | 30           |     
                          kodi |  DISTRO  | https://release-monitoring.org/project/20547 | 19.4-Matrix  | 20.0a2-Nexus |     
     kodi-audiodecoder-modplug |  DISTRO  | https://release-monitoring.org/project/21818 | 19.0.2-Ma... | 20.2.0-Nexus |     
    kodi-audiodecoder-nosefart |  DISTRO  | https://release-monitoring.org/project/21819 | 19.0.2-Ma... | 20.2.0-Nexus |     
     kodi-audiodecoder-sidplay |  DISTRO  | https://release-monitoring.org/project/21820 | 19.0.1-Ma... | 20.2.0-Nexus |     
     kodi-audiodecoder-snesapu |  DISTRO  | https://release-monitoring.org/project/21802 | 19.0.2-Ma... | 20.2.0-Nexus |     
     kodi-audiodecoder-stsound |  DISTRO  | https://release-monitoring.org/project/21801 | 19.0.1-Ma... | 20.2.0-Nexus |     
    kodi-audiodecoder-timidity |  DISTRO  | https://release-monitoring.org/project/21800 | 19.0.2-Ma... | 20.2.0-Nexus |     
   kodi-audiodecoder-vgmstream |  DISTRO  | https://release-monitoring.org/project/21799 | 19.0.0-Ma... | 20.2.0-Nexus |     
        kodi-audioencoder-flac |  DISTRO  | https://release-monitoring.org/project/17755 | 19.0.1-Ma... | 20.2.0-Nexus |     
        kodi-audioencoder-lame |  DISTRO  | https://release-monitoring.org/project/21798 | 19.1.2-Ma... | 20.3.0-Nexus |     
      kodi-audioencoder-vorbis |  DISTRO  | https://release-monitoring.org/project/21797 | 19.0.1-Ma... | 20.2.0-Nexus |     
         kodi-audioencoder-wav |  DISTRO  | https://release-monitoring.org/project/21796 | 19.0.1-Ma... | 20.2.0-Nexus |     
     kodi-inputstream-adaptive |  DISTRO  | https://release-monitoring.org/project/21795 | 19.0.7-Ma... | 20.2.3-Nexus |     
 kodi-inputstream-ffmpegdirect |  DISTRO  | https://release-monitoring.org/project/177174 | 19.0.3-Ma... | 20.4.0-Nexus |     
         kodi-inputstream-rtmp |  DISTRO  | https://release-monitoring.org/project/21794 | 19.0.1-Ma... | 20.2.1-Nexus |     
        kodi-jsonschemabuilder |  DISTRO  | https://release-monitoring.org/project/05511 | 19.4-Matrix  | 20.0a2-Nexus |     
      kodi-peripheral-joystick |  DISTRO  | https://release-monitoring.org/project/21793 | 19.0.3-Ma... | 20.1.2-Nexus |     
       kodi-peripheral-xarcade |  DISTRO  | https://release-monitoring.org/project/21791 | 19.0.4-Ma... | 20.1.2-Nexus |     
              kodi-pvr-argustv |  DISTRO  | https://release-monitoring.org/project/21788 | 19.2.1-Ma... | 20.4.1-Nexus |     
              kodi-pvr-dvblink |  DISTRO  | https://release-monitoring.org/project/21787 | 19.0.1-Ma... | 20.2.0-Nexus |     
            kodi-pvr-dvbviewer |  DISTRO  | https://release-monitoring.org/project/21786 | 19.1.0-Ma... | 20.3.0-Nexus |     
               kodi-pvr-filmon |  DISTRO  | https://release-monitoring.org/project/21785 | 19.0.1-Ma... | 20.2.1-Nexus |     
            kodi-pvr-hdhomerun |  DISTRO  | https://release-monitoring.org/project/21784 | 19.1.0-Ma... | 20.3.0-Nexus |     
                  kodi-pvr-hts |  DISTRO  | https://release-monitoring.org/project/21783 | 19.0.6-Ma... | 20.3.0-Nexus |     
           kodi-pvr-iptvsimple |  DISTRO  | https://release-monitoring.org/project/21782 | 19.2.1-Ma... | 20.5.2-Nexus |     
 kodi-pvr-mediaportal-tvserver |  DISTRO  | https://release-monitoring.org/project/21781 | 19.0.2-Ma... | 20.2.0-Nexus |     
               kodi-pvr-mythtv |  DISTRO  | https://release-monitoring.org/project/21780 | 19.0.11-M... | 20.2.7-Nexus |     
              kodi-pvr-nextpvr |  DISTRO  | https://release-monitoring.org/project/21779 | 19.0.3-Ma... | 20.2.3-Nexus |     
                 kodi-pvr-njoy |  DISTRO  | https://release-monitoring.org/project/21778 | 19.0.1-Ma... | 20.2.0-Nexus |     
              kodi-pvr-octonet |  DISTRO  | https://release-monitoring.org/project/100437 | 19.0.0-Ma... | 20.2.0-Nexus |     
                 kodi-pvr-pctv |  DISTRO  | https://release-monitoring.org/project/21777 | 19.0.1-Ma... | 20.3.0-Nexus |     
              kodi-pvr-plutotv |  DISTRO  | https://release-monitoring.org/project/241527 | 19.0.3-Ma... | 20.1.0-Nexus |     
              kodi-pvr-stalker |  DISTRO  | https://release-monitoring.org/project/21776 | 19.0.3-Ma... | 20.2.2-Nexus |     
                 kodi-pvr-vbox |  DISTRO  | https://release-monitoring.org/project/21775 | 19.0.0-Ma... | 20.2.0-Nexus |     
             kodi-pvr-vdr-vnsi |  DISTRO  | https://release-monitoring.org/project/21774 | 19.0.5-Ma... | 20.3.1-Nexus |     
               kodi-pvr-vuplus |  DISTRO  | https://release-monitoring.org/project/21773 | 19.0.0-Ma... | 20.3.1-Nexus |     
                kodi-pvr-waipu |  DISTRO  | https://release-monitoring.org/project/241529 | 19.2.1-Ma... | 20.5.0-Nexus |     
                  kodi-pvr-wmc |  DISTRO  | https://release-monitoring.org/project/21772 | 19.0.2-Ma... | 20.2.1-Nexus |     
               kodi-pvr-zattoo |  DISTRO  | https://release-monitoring.org/project/100438 | 19.7.15-M... | 20.2.1-Nexus |     
    kodi-screensaver-asteroids |  DISTRO  | https://release-monitoring.org/project/21771 | 19.0.1-Ma... | 20.1.0-Nexus |     
    kodi-screensaver-asterwave |  DISTRO  | https://release-monitoring.org/project/21770 | 19.0.1-Ma... | 20.1.0-Nexus |     
   kodi-screensaver-biogenesis |  DISTRO  | https://release-monitoring.org/project/21768 | 19.0.1-Ma... | 20.1.0-Nexus |     
      kodi-screensaver-cpblobs |  DISTRO  | https://release-monitoring.org/project/21767 | 19.0.1-Ma... | 20.1.0-Nexus |     
    kodi-screensaver-greynetic |  DISTRO  | https://release-monitoring.org/project/21765 | 19.0.1-Ma... | 20.1.0-Nexus |     
 kodi-screensaver-matrixtrails |  DISTRO  | https://release-monitoring.org/project/21764 | 19.0.1-Ma... | 20.1.0-Nexus |     
     kodi-screensaver-pingpong |  DISTRO  | https://release-monitoring.org/project/21763 | 19.0.1-Ma... | 20.1.0-Nexus |     
         kodi-screensaver-pyro |  DISTRO  | https://release-monitoring.org/project/21761 | 19.0.1-Ma... | 20.1.0-Nexus |     
         kodi-screensaver-rsxs |  DISTRO  | https://release-monitoring.org/project/21760 | 19.0.2-Ma... | 20.1.0-Nexus |     
        kodi-screensaver-stars |  DISTRO  | https://release-monitoring.org/project/21759 | 19.0.0-Ma... | 20.1.0-Nexus |     
            kodi-texturepacker |  DISTRO  | https://release-monitoring.org/project/05511 | 19.4-Matrix  | 20.0a2-Nexus |     
           kodi-vfs-libarchive |  DISTRO  | https://release-monitoring.org/project/177173 | 19.2.0-Ma... | 20.2.0-Nexus |     
                  kodi-vfs-rar |  DISTRO  | https://release-monitoring.org/project/21900 | 19.0.1-Ma... | 20.1.0-Nexus |     
                 kodi-vfs-sftp |  DISTRO  | https://release-monitoring.org/project/21899 | 19.0.1-Ma... | 20.1.0-Nexus |     
    kodi-visualisation-fishbmc |  DISTRO  | https://release-monitoring.org/project/21758 | 19.0.1-Ma... | 20.1.0-Nexus |     
       kodi-visualisation-goom |  DISTRO  | https://release-monitoring.org/project/21757 | 19.0.1-Ma... | 20.1.0-Nexus |     
     kodi-visualisation-matrix |  DISTRO  | https://release-monitoring.org/project/177172 | 19.0.1-Ma... | 20.1.0-Nexus |     
  kodi-visualisation-shadertoy |  DISTRO  | https://release-monitoring.org/project/21756 | 19.1.2-Ma... | 20.2.0-Nexus |     
   kodi-visualisation-spectrum |  DISTRO  | https://release-monitoring.org/project/21755 | 19.0.1-Ma... | 20.1.0-Nexus |     
  kodi-visualisation-starburst |  DISTRO  | https://release-monitoring.org/project/85703 | 19.0.1-Ma... | 20.1.0-Nexus |     
   kodi-visualisation-waveform |  DISTRO  | https://release-monitoring.org/project/21753 | 19.0.2-Ma... | 20.1.0-Nexus |     
                       lensfun |  DISTRO  | https://release-monitoring.org/project/01548 | 0.3.2        | 0.3.95       |     
                         libao |  DISTRO  | https://release-monitoring.org/project/07629 | 1.2.0        | 1.2.2        | ORPH
                   libapparmor |  DISTRO  | https://release-monitoring.org/project/94819 | 3.0.4        | 3.0.7        |     
                   libblockdev |  DISTRO  | https://release-monitoring.org/project/09397 | 2.26         | 2.27-1       | ORPH
                     libbluray |  DISTRO  | https://release-monitoring.org/project/01565 | 1.3.1        | 1.3.2        |     
                        libbpf |  DISTRO  | https://release-monitoring.org/project/141355 | 0.8.0        | 0.8.1        |     
                        libbsd |  DISTRO  | https://release-monitoring.org/project/01567 | 0.11.3       | 0.11.6       |     
                        libcap |  DISTRO  | https://release-monitoring.org/project/01569 | 2.64         | 2.65         |     
                     libcgroup |  DISTRO  | https://release-monitoring.org/project/01575 | 0.42.2       | 3.0.0        |     
                     libcodec2 |  DISTRO  | https://release-monitoring.org/project/14605 | 1.0.1        | 1.03         |     
                    libdeflate |  DISTRO  | https://release-monitoring.org/project/242778 | 1.12         | 1.13         |     
                       libdmtx |  DISTRO  | https://release-monitoring.org/project/12833 | 0.7.5        | 0.7.7        |     
                       libdnet |  DISTRO  | https://release-monitoring.org/project/06308 | 1.14         | 1.16.1       | ORPH
                      libevdev |  DISTRO  | https://release-monitoring.org/project/20540 | 1.12.1       | 1.13.0       |     
                       libfuse |  GUESS   | https://release-monitoring.org/project/00861 | 2.9.9        | 3.11.0       | ORPH
                    libgdiplus |  DISTRO  | https://release-monitoring.org/project/06440 | 6.0.5        | 6.1          |     
                       libgit2 |  DISTRO  | https://release-monitoring.org/project/01627 | 1.4.3        | 1.5.0        |     
                      libglade |  DISTRO  | https://release-monitoring.org/project/01174 | 2.6.4        | 3.40.0       | ORPH
                       libglfw |  DISTRO  | https://release-monitoring.org/project/01180 | 3.3.6        | 3.3.8        |     
                      libgpgme |  DISTRO  | https://release-monitoring.org/project/01239 | 1.17.1       | 1.18.0       | ORPH
                    libgphoto2 |  DISTRO  | https://release-monitoring.org/project/12558 | 2.5.27       | 2.5.30       | ORPH
                      libgsasl |  DISTRO  | https://release-monitoring.org/project/01563 | 1.10.0       | 2.0.1        | ORPH
                        libgsm |  DISTRO  | https://release-monitoring.org/project/12587 | 1.0.19       | 1.0.22       |     
                       libgtk2 |  DISTRO  | https://release-monitoring.org/project/13942 | 2.24.33      | 4.6.7        |     
                     libiberty |  DISTRO  | https://release-monitoring.org/project/07981 | 2.32         | 2.39         |     
                       libical |  DISTRO  | https://release-monitoring.org/project/01637 | 1.0.1        | 3.0.14       |     
                      libiconv |  DISTRO  | https://release-monitoring.org/project/10656 | 1.15         | 1.17         | ORPH
                       libidn2 |  DISTRO  | https://release-monitoring.org/project/05597 | 2.3.2        | 2.3.3        |     
                        libiio |  DISTRO  | https://release-monitoring.org/project/15689 | 0.23         | 0.24         |     
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/21479 | 0.10.3       | 2.2.1        |     
                      libinput |  DISTRO  | https://release-monitoring.org/project/05781 | 1.20.1       | 1.21.0       |     
                      libkcapi |  DISTRO  | https://release-monitoring.org/project/16828 | 1.1.5        | 1.4.0        | ORPH
                       libldns |  DISTRO  | https://release-monitoring.org/project/14817 | 1.8.1        | 1.8.3        |     
                     liblinear |  DISTRO  | https://release-monitoring.org/project/21363 | 2.44         | 2.45         |     
                       libmdbx |  DISTRO  | https://release-monitoring.org/project/141559 | 0.11.8       | 0.11.9       |     
                      libmhash |  DISTRO  | https://release-monitoring.org/project/21488 | 0.9.9.9      | 1.4          | ORPH
                     libmodbus |  DISTRO  | https://release-monitoring.org/project/09728 | 3.1.7        | 3.1.8        |     
                     libmspack |  DISTRO  | https://release-monitoring.org/project/16827 | 0.10.1alpha  | 1.9.1        |     
                   libnetconf2 |  DISTRO  | https://release-monitoring.org/project/31639 | 2.1.11       | 2.1.18       |     
                        libnfs |  DISTRO  | https://release-monitoring.org/project/07325 | 4.0.0        | 5.0.2        | ORPH
                      libnftnl |  DISTRO  | https://release-monitoring.org/project/01681 | 1.2.1        | 1.2.3        |     
                       libnice |  DISTRO  | https://release-monitoring.org/project/01683 | 0.1.18       | 0.1.19       |     
                         libnl |  DISTRO  | https://release-monitoring.org/project/01684 | 3.6.0        | 3.7.0        | ORPH
                     libnpupnp |  DISTRO  | https://release-monitoring.org/project/75209 | 4.2.2        | 5.0.0        |     
                        libnss |  DISTRO  | https://release-monitoring.org/project/02503 | 3.81         | 3.82         |     
                        libolm |  DISTRO  | https://release-monitoring.org/project/29706 | 3.2.9        | 3.2.12       |     
                   libopenh264 |  DISTRO  | https://release-monitoring.org/project/21365 | 2.2.0        | 2.3.0        |     
                   libpagekite |  DISTRO  | https://release-monitoring.org/project/21366 | 0.91.190530  | 0.91.201110  |     
            libpam-radius-auth |  DISTRO  | https://release-monitoring.org/project/57834 | 1.4.0        | 2.0.0        | ORPH
                       libpeas |  DISTRO  | https://release-monitoring.org/project/06871 | 1.30.0       | 1.32.0       | ORPH
                       libpqxx |  DISTRO  | https://release-monitoring.org/project/21367 | 6.4.5        | 7.7.4        |     
                         libqb |  DISTRO  | https://release-monitoring.org/project/09399 | 2.0.3        | 2.0.6        |     
                       librsvg |  DISTRO  | https://release-monitoring.org/project/05420 | 2.50.7       | 2.54.4       |     
                    libselinux |  DISTRO  | https://release-monitoring.org/project/01717 | 3.3          | 3.4          |     
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/01718 | 3.3          | 20200710     |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/01719 | 3.3          | 20200710     |     
                      libshout |  DISTRO  | https://release-monitoring.org/project/11084 | 2.4.5        | 2.4.6        | ORPH
                       libsigc |  DISTRO  | https://release-monitoring.org/project/07961 | 3.0.7        | 3.2.0        | ORPH
                       libsoup |  DISTRO  | https://release-monitoring.org/project/11483 | 2.74.2       | 3.0.7        |     
                  libtextstyle |  DISTRO  | https://release-monitoring.org/project/00898 | 0.20.1       | 0.21         | ORPH
                      libtirpc |  DISTRO  | https://release-monitoring.org/project/01740 | 1.3.2        | 1.3.3        |     
                       libtool |  DISTRO  | https://release-monitoring.org/project/01741 | 2.4.6        | 2.4.7        | ORPH
          libtorrent-rasterbar |  DISTRO  | https://release-monitoring.org/project/04166 | 1.2.15       | 2.0.7        |     
                       libupnp |  DISTRO  | https://release-monitoring.org/project/21315 | 1.14.12      | 1.14.13      |     
                      libupnpp |  DISTRO  | https://release-monitoring.org/project/15849 | 0.21.0       | 0.22.2       |     
                       liburcu |  DISTRO  | https://release-monitoring.org/project/07134 | 0.13.1       | 0.13.2       |     
                         libuv |  DISTRO  | https://release-monitoring.org/project/10784 | 1.43.0       | 1.44.2       |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/05097 | 8.10.6       | 8.13.0       |     
                       libvirt |  DISTRO  | https://release-monitoring.org/project/224041 | 7.10.0       | 8.6.0        |     
                        libwpe |  DISTRO  | https://release-monitoring.org/project/17789 | 1.12.0       | 1.12.2       |     
                  libxkbcommon |  DISTRO  | https://release-monitoring.org/project/01780 | 1.4.0        | 1.4.1        |     
                       libxml2 |  DISTRO  | https://release-monitoring.org/project/01783 | 2.9.14       | 2.10.0       |     
                     libxmlrpc |  DISTRO  | https://release-monitoring.org/project/09024 | r3119        | 1.54.05      |     
                       libxslt |  DISTRO  | https://release-monitoring.org/project/13301 | 1.1.35       | 1.1.36       |     
                       libyang |  DISTRO  | https://release-monitoring.org/project/18554 | 2.0.194      | 2.0.231      |     
                        libzip |  DISTRO  | https://release-monitoring.org/project/10649 | 1.8.0        | 1.9.2        |     
                      lighttpd |  DISTRO  | https://release-monitoring.org/project/01817 | 1.4.65       | 1.4.66       |     
                          lilv |  DISTRO  | https://release-monitoring.org/project/01818 | 0.24.12      | 0.24.18      |     
                         links |  DISTRO  | https://release-monitoring.org/project/01822 | 2.26         | 2.27         | ORPH
                      linphone |  DISTRO  | https://release-monitoring.org/project/01823 | 4.4.8        | 5.1.56       | ORPH
                linux-firmware |  DISTRO  | https://release-monitoring.org/project/141464 | 20220310     | 20220815     |     
                       live555 |  DISTRO  | https://release-monitoring.org/project/12414 | 2021.05.03   | 2022.07.14   | ORPH
                           lld |  DISTRO  | https://release-monitoring.org/project/01830 | 11.1.0       | 14.0.6       |     
                         lldpd |  DISTRO  | https://release-monitoring.org/project/14019 | 1.0.9        | 1.0.15       | ORPH
                          llvm |  DISTRO  | https://release-monitoring.org/project/01830 | 11.1.0       | 14.0.6       |     
                       log4cxx |  DISTRO  | https://release-monitoring.org/project/15330 | 0.12.1       | 0.13.0       |     
                          lpty |  DISTRO  | https://release-monitoring.org/project/11671 | 1.0.1-1      | 1.2.2        |     
                         lrzip |  DISTRO  | https://release-monitoring.org/project/01842 | 0.641        | 0.651        |     
                         ltris |  DISTRO  | https://release-monitoring.org/project/21503 | 1.2          | 1.2.5        |     
              lttng-babeltrace |  DISTRO  | https://release-monitoring.org/project/00155 | 1.5.7        | 1.5.8        |     
                  lttng-libust |  DISTRO  | https://release-monitoring.org/project/07135 | 2.13.1       | 2.13.4       |     
                 lttng-modules |  DISTRO  | https://release-monitoring.org/project/07141 | 2.13.1       | 2.13.5       |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/07136 | 2.13.2       | 2.13.7       |     
                           lua |  DISTRO  | https://release-monitoring.org/project/01847 | 5.1.5        | 5.4.4        |     
                lua-resty-http |  DISTRO  | https://release-monitoring.org/project/13887 | 0.15-0       | 0.16.1       |     
                           luv |  DISTRO  | https://release-monitoring.org/project/21510 | 1.43.0-0     | 1.44.2-0     |     
                          luvi |  DISTRO  | https://release-monitoring.org/project/21512 | 2.13.0       | 2.14.0       |     
                           lv2 |  DISTRO  | https://release-monitoring.org/project/230934 | 1.18.2       | 1.18.8       |     
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/05354 | 2.03.14      | 2.03.16      | ORPH
                           lxc |  DISTRO  | https://release-monitoring.org/project/01860 | 4.0.12       | 5.0.1        |     
                          lynx |  DISTRO  | https://release-monitoring.org/project/01863 | 2.8.9rel.1   | 2.9.0        |     
                           lz4 |  DISTRO  | https://release-monitoring.org/project/01865 | 1.9.3        | 1.9.4        | ORPH
                    lzma-alone |  DISTRO  | https://release-monitoring.org/project/242840 | 9.22         | 2201         | ORPH
                          lzop |  DISTRO  | https://release-monitoring.org/project/07486 | 1.03         | 1.04         |     
                          make |  DISTRO  | https://release-monitoring.org/project/01877 | 4.2.1        | 4.3          | ORPH
                  makedumpfile |  DISTRO  | https://release-monitoring.org/project/131396 | 1.7.0        | 1.7.1        |     
                       mariadb |  DISTRO  | https://release-monitoring.org/project/01887 | 10.3.35      | 10.10.1      | ORPH
                         matio |  DISTRO  | https://release-monitoring.org/project/01893 | 1.5.22       | 1.5.23       |     
                       mbedtls |  DISTRO  | https://release-monitoring.org/project/13824 | 2.28.1       | 3.2.1        |     
                       mbuffer |  DISTRO  | https://release-monitoring.org/project/15518 | 20211018     | 20220418     |     
                        mcelog |  DISTRO  | https://release-monitoring.org/project/08093 | 187          | 188          |     
                         mdevd |  DISTRO  | https://release-monitoring.org/project/16553 | 0.1.4.0      | 0.1.6.0      |     
                 mediastreamer |  DISTRO  | https://release-monitoring.org/project/21746 | 4.4.8        | 5.1.55       | ORPH
                     memtest86 |  DISTRO  | https://release-monitoring.org/project/01966 | 5.01         | 5.31b        |     
                        mesa3d |  DISTRO  | https://release-monitoring.org/project/01970 | 22.1.6       | 22.1.7       |     
                  mesa3d-demos |  DISTRO  | https://release-monitoring.org/project/16781 | 8.4.0        | 8.5.0        |     
                mesa3d-headers |  DISTRO  | https://release-monitoring.org/project/01970 | 22.1.6       | 22.1.7       |     
                         meson |  DISTRO  | https://release-monitoring.org/project/06472 | 0.63.0       | 0.63.1       |     
                      metacity |  DISTRO  | https://release-monitoring.org/project/15392 | 2.25.1       | 3.44.0       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/21519 | 0.02         | 2.8.0        |     
                   micropython |  DISTRO  | https://release-monitoring.org/project/10539 | 1.19         | 1.19.1       |     
                         mimic |  DISTRO  | https://release-monitoring.org/project/21521 | 1.1.0        | 1.3.0.1      |     
                      minetest |  DISTRO  | https://release-monitoring.org/project/01978 | 5.5.1        | 5.6.0        |     
                 minetest-game |  DISTRO  | https://release-monitoring.org/project/21522 | 5.5.1        | 5.6.0        |     
                       minizip |  DISTRO  | https://release-monitoring.org/project/17546 | 3.0.6        | 10.2         |     
                  minizip-zlib |  DISTRO  | https://release-monitoring.org/project/05303 | 1.2.11       | 1.2.12       |     
                        moarvm |  DISTRO  | https://release-monitoring.org/project/21100 | 2022.06      | 2022.07      |     
mobile-broadband-provider-info |  DISTRO  | https://release-monitoring.org/project/10267 | 20190618     | 20220725     | ORPH
                 moby-buildkit |  DISTRO  | https://release-monitoring.org/project/20836 | 0.10.0       | 0.10.3       |     
                       mongodb |  DISTRO  | https://release-monitoring.org/project/02008 | 4.2.18       | 6.0.1        |     
                      mongoose |  DISTRO  | https://release-monitoring.org/project/07603 | 7.2          | 7.7          |     
                         monit |  DISTRO  | https://release-monitoring.org/project/05483 | 5.26.0       | 5.32.0       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/06360 | 6.12.0.122   | 6.12.0.184   |     
                     mosquitto |  DISTRO  | https://release-monitoring.org/project/06078 | 2.0.14       | 2.0.15       |     
                          most |  DISTRO  | https://release-monitoring.org/project/02013 | 5.1.0        | 5.2.0        |     
                           mpd |  DISTRO  | https://release-monitoring.org/project/14864 | 0.23.8       | 0.23.9       |     
                        mpg123 |  DISTRO  | https://release-monitoring.org/project/12413 | 1.25.15      | 1.30.2       | ORPH
                           mpv |  DISTRO  | https://release-monitoring.org/project/05348 | 0.33.1       | 0.34.1       |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/12278 | 3.3.0        | 4.1.1        |     
                         msmtp |  DISTRO  | https://release-monitoring.org/project/02024 | 1.8.14       | 1.8.22       |     
                         mstpd |  DISTRO  | https://release-monitoring.org/project/235098 | 0.1.0        | 0.05         |     
                           mtd |  DISTRO  | https://release-monitoring.org/project/02026 | 2.1.3        | 2.1.4        |     
                        mtools |  DISTRO  | https://release-monitoring.org/project/02028 | 4.0.38       | 4.0.40       |     
                           mtr |  DISTRO  | https://release-monitoring.org/project/02029 | 0.94         | 0.95         | ORPH
                         mupdf |  DISTRO  | https://release-monitoring.org/project/02034 | 1.18.0       | 1.20.3       |     
                          mutt |  DISTRO  | https://release-monitoring.org/project/02035 | 2.2.6        | 2.2.7        |     
                          mxml |  DISTRO  | https://release-monitoring.org/project/13545 | 3.3          | 3.3.1        |     
                          nano |  DISTRO  | https://release-monitoring.org/project/02046 | 6.3          | 6.4          | ORPH
                          ncdu |  DISTRO  | https://release-monitoring.org/project/06045 | 1.17         | 2.1.2        |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/02057 | 6.1          | 6.3-20220820 | ORPH
                        ndisc6 |  DISTRO  | https://release-monitoring.org/project/21531 | 1.0.5        | 1.0.6        | ORPH
                       nerdctl |  DISTRO  | https://release-monitoring.org/project/242901 | 0.17.1       | 0.22.2       |     
                        netcat |  DISTRO  | https://release-monitoring.org/project/21534 | 0.7.1        | 1.218        | ORPH
                       netdata |  DISTRO  | https://release-monitoring.org/project/11046 | 1.33.1       | 1.36.1       |     
                     netopeer2 |  DISTRO  | https://release-monitoring.org/project/114978 | 2.1.23       | 2.1.36       |     
                       netsnmp |  DISTRO  | https://release-monitoring.org/project/02062 | 5.9          | 5.9.3        | ORPH
                        nettle |  DISTRO  | https://release-monitoring.org/project/02073 | 3.8          | 3.8.1        | ORPH
               network-manager |  DISTRO  | https://release-monitoring.org/project/21197 | 1.36.4       | 1.38.4       | ORPH
       network-manager-openvpn |  DISTRO  | https://release-monitoring.org/project/69977 | 1.8.14       | 1.8.18       |     
           networkd-dispatcher |  DISTRO  | https://release-monitoring.org/project/242008 | 2.1          | 2.2.3        |     
                      nftables |  DISTRO  | https://release-monitoring.org/project/02082 | 1.0.1        | 1.0.5        |     
                       nghttp2 |  DISTRO  | https://release-monitoring.org/project/08651 | 1.41.0       | 1.48.0       |     
                         nginx |  DISTRO  | https://release-monitoring.org/project/05413 | 1.20.1       | 1.23.1       |     
             nginx-modsecurity |  DISTRO  | https://release-monitoring.org/project/68639 | 1.0.2        | 1.0.3        |     
                         ninja |  DISTRO  | https://release-monitoring.org/project/02089 | 1.10.2.g5... | 1.11.0       |     
                        nodejs |  DISTRO  | https://release-monitoring.org/project/08251 | 16.16.0      | 18.7.0       |     
                          noip |  DISTRO  | https://release-monitoring.org/project/21539 | 2.1.9        | 3.0.0        | ORPH
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/02511 | 6.1.2        | 8.2.2        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/21843 | 390.151      | 390.154      |     
               nvidia-modprobe |  DISTRO  | https://release-monitoring.org/project/141657 | 450.57       | 515.65.01    | ORPH
                          nvme |  DISTRO  | https://release-monitoring.org/project/09074 | 1.12         | 2.1.2        | ORPH
                     ocf-linux |  DISTRO  | https://release-monitoring.org/project/21541 | 20120127     | 20171122     | ORPH
                          ogre |  DISTRO  | https://release-monitoring.org/project/33334 | v1.12.12     | 13.4.4       |     
                     open62541 |  DISTRO  | https://release-monitoring.org/project/16896 | v1.3.2       | 1.3.3        | ORPH
                        openal |  DISTRO  | https://release-monitoring.org/project/08172 | 1.22.0       | 1.22.2       |     
                      openblas |  DISTRO  | https://release-monitoring.org/project/02540 | 0.3.20       | 0.3.21       | ORPH
                  opencl-clhpp |  DISTRO  | https://release-monitoring.org/project/271141 | 2.0.16       | 2022.05.18   |     
                  opencore-amr |  DISTRO  | https://release-monitoring.org/project/21548 | 0.1.5        | 0.1.6        | ORPH
                       opencv3 |  DISTRO  | https://release-monitoring.org/project/06615 | 3.4.17       | 4.6.0        |     
                       opencv4 |  DISTRO  | https://release-monitoring.org/project/06615 | 4.5.5        | 4.6.0        |     
                openfpgaloader |  DISTRO  | https://release-monitoring.org/project/241709 | 0.6.1        | 0.9.0        |     
                      openipmi |  DISTRO  | https://release-monitoring.org/project/02549 | 2.0.32       | 2.0.33       | ORPH
                       openjdk |  GUESS   | https://release-monitoring.org/project/176098 | 11.0.14.1+1  | 20+11        |     
                    openlayers |  DISTRO  | https://release-monitoring.org/project/06847 | 6.14.1       | 7.0.0        |     
                       openmpi |  DISTRO  | https://release-monitoring.org/project/02554 | 4.0.0        | 4.1.4        | ORPH
                 openpowerlink |  DISTRO  | https://release-monitoring.org/project/21550 | 2.7.1        | 2.7.2        |     
                        openrc |  DISTRO  | https://release-monitoring.org/project/11687 | 0.43.3       | 0.45.2       |     
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/10998 | 11.3.5-18... | 12.0.5       |     
                          opkg |  DISTRO  | https://release-monitoring.org/project/59397 | 0.4.5        | 0.6.0        | ORPH
                    opkg-utils |  DISTRO  | https://release-monitoring.org/project/59396 | 0.4.5        | 0.5.0        |     
                  oracle-mysql |  DISTRO  | https://release-monitoring.org/project/00334 | 5.1.73       | 8.0.30       | ORPH
                          ortp |  DISTRO  | https://release-monitoring.org/project/21691 | 4.4.8        | 5.1.55       | ORPH
                     osm2pgsql |  DISTRO  | https://release-monitoring.org/project/02575 | 1.6.0        | 1.7.0        |     
                         pango |  DISTRO  | https://release-monitoring.org/project/11783 | 1.50.8       | 1.50.9       | ORPH
                       pangomm |  DISTRO  | https://release-monitoring.org/project/07958 | 2.48.2       | 2.50.0       |     
                    parprouted |  DISTRO  | https://release-monitoring.org/project/10309 | 0.7          | 0.65         | ORPH
                        parted |  DISTRO  | https://release-monitoring.org/project/02596 | 3.4          | 3.5          |     
                      patchelf |  DISTRO  | https://release-monitoring.org/project/02598 | 0.13         | 0.15.0       | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/02601 | 1.2.6        | 1.3.5        | ORPH
                     pcm-tools |  DISTRO  | https://release-monitoring.org/project/21377 | 202110       | 202207       | ORPH
                          pdbg |  DISTRO  | https://release-monitoring.org/project/21378 | 3.5          | 3.6          |     
                          perl |  DISTRO  | https://release-monitoring.org/project/13599 | 5.34.1       | 5.36.0       |     
                perl-crypt-cbc |  DISTRO  | https://release-monitoring.org/project/11930 | 2.33         | 3.04         |     
               perl-date-manip |  DISTRO  | https://release-monitoring.org/project/02785 | 6.86         | 6.88         |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/02807 | 4.046        | 4.050        |     
             perl-file-listing |  DISTRO  | https://release-monitoring.org/project/02892 | 6.14         | 6.15         |     
    perl-file-sharedir-install |  DISTRO  | https://release-monitoring.org/project/11851 | 0.13         | 0.14         |     
              perl-html-parser |  DISTRO  | https://release-monitoring.org/project/02967 | 3.76         | 3.78         |     
              perl-http-daemon |  DISTRO  | https://release-monitoring.org/project/02975 | 6.12         | 6.14         |     
             perl-http-message |  DISTRO  | https://release-monitoring.org/project/02977 | 6.36         | 6.37         |     
              perl-libwww-perl |  DISTRO  | https://release-monitoring.org/project/03024 | 6.62         | 6.67         |     
                perl-mail-dkim |  DISTRO  | https://release-monitoring.org/project/11868 | 1.20200824   | 1.20220520   |     
               perl-mime-tools |  DISTRO  | https://release-monitoring.org/project/11809 | 5.509        | 5.510        |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/05966 | 9.24         | 9.26         |     
perl-mojolicious-plugin-aut... |  DISTRO  | https://release-monitoring.org/project/21729 | 1.37         | 1.39         |     
                  perl-net-dns |  DISTRO  | https://release-monitoring.org/project/03147 | 1.33         | 1.34         |     
                 perl-net-http |  DISTRO  | https://release-monitoring.org/project/03152 | 6.21         | 6.22         |     
                 perl-net-ssh2 |  DISTRO  | https://release-monitoring.org/project/03163 | 0.72         | 0.73         |     
               perl-net-ssleay |  DISTRO  | https://release-monitoring.org/project/06575 | 1.85         | 1.92         |     
            perl-package-stash |  DISTRO  | https://release-monitoring.org/project/11885 | 0.39         | 0.40         |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/14338 | 0.52         | 0.61         |     
                perl-type-tiny |  DISTRO  | https://release-monitoring.org/project/14406 | 1.012004     | 1.016008     |     
                      perl-uri |  DISTRO  | https://release-monitoring.org/project/03485 | 5.10         | 5.12         |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/03527 | 2.0134       | 2.0207       |     
                      php-amqp |  DISTRO  | https://release-monitoring.org/project/15603 | 1.10.2       | 1.11.0       |     
                      php-apcu |  DISTRO  | https://release-monitoring.org/project/11010 | 5.1.20       | 5.1.21       |     
                     php-gnupg |  DISTRO  | https://release-monitoring.org/project/21743 | 1.5.0        | 1.5.1        | ORPH
                 php-memcached |  DISTRO  | https://release-monitoring.org/project/17400 | 3.1.5        | 3.2.0        | ORPH
                       php-pam |  DISTRO  | https://release-monitoring.org/project/241707 | 2.2.3        | 2.2.4        |     
                    php-xdebug |  DISTRO  | https://release-monitoring.org/project/13302 | 3.0.4        | 3.1.5        |     
                        pigpio |  DISTRO  | https://release-monitoring.org/project/21577 | 79           | 7301         |     
                      pinentry |  DISTRO  | https://release-monitoring.org/project/03643 | 1.1.1        | 1.2.0        | ORPH
                 pkcs11-helper |  DISTRO  | https://release-monitoring.org/project/91990 | 1.28         | 1.29.0       | ORPH
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/12753 | 1.6.3        | 1.9.3        | ORPH
                          poco |  DISTRO  | https://release-monitoring.org/project/05418 | 1.11.2       | 1.12.2       |     
                          poke |  DISTRO  | https://release-monitoring.org/project/179926 | 2.1          | 2.4          | ORPH
               policycoreutils |  DISTRO  | https://release-monitoring.org/project/03680 | 3.2          | 20200710     |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/03686 | 21.12.0      | 22.08.0      |     
                       postgis |  DISTRO  | https://release-monitoring.org/project/03694 | 3.2.2        | 3.2.3        |     
                      powertop |  DISTRO  | https://release-monitoring.org/project/03702 | 2.13         | 2.14         |     
                     procps-ng |  DISTRO  | https://release-monitoring.org/project/03708 | 3.3.17       | 4.0.0        | ORPH
                       proftpd |  DISTRO  | https://release-monitoring.org/project/07609 | 1.3.6e       | 1.3.7e       |     
                          proj |  DISTRO  | https://release-monitoring.org/project/21570 | 8.1.1        | 9.0.1        |     
                       prosody |  DISTRO  | https://release-monitoring.org/project/03709 | 0.11.13      | 0.12.1       |     
                      protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 21.4         | 21.5         |     
          pru-software-support |  DISTRO  | https://release-monitoring.org/project/21825 | 6.0.1        | 6.1.0        |     
                        psmisc |  DISTRO  | https://release-monitoring.org/project/03721 | 23.4         | 23.5         | ORPH
                          ptpd |  GUESS   | https://release-monitoring.org/project/03726 | 1.1.0        | 2.3.1        | ORPH
                         putty |  DISTRO  | https://release-monitoring.org/project/05749 | 0.76         | 0.77         |     
                python-aiocoap |  DISTRO  | https://release-monitoring.org/project/21243 | 0.4.1        | 0.4.4        |     
        python-aiohttp-remotes |  DISTRO  | https://release-monitoring.org/project/21248 | 1.1.0        | 1.2.0        |     
                python-aiojobs |  DISTRO  | https://release-monitoring.org/project/21252 | 0.3.0        | 1.0.0        |     
                python-alembic |  DISTRO  | https://release-monitoring.org/project/03766 | 1.8.0        | 1.8.1        |     
              python-alsaaudio |  DISTRO  | https://release-monitoring.org/project/10072 | 0.8.4        | 0.9.2        |     
                  python-arrow |  DISTRO  | https://release-monitoring.org/project/05314 | 1.2.0        | 1.2.2        |     
                python-asgiref |  DISTRO  | https://release-monitoring.org/project/18462 | 3.3.4        | 3.5.2        |     
                  python-attrs |  DISTRO  | https://release-monitoring.org/project/15099 | 21.4.0       | 22.1.0       |     
               python-autobahn |  DISTRO  | https://release-monitoring.org/project/07015 | 22.6.1       | 22.7.1       |     
                   python-avro |  DISTRO  | https://release-monitoring.org/project/59411 | 1.11.0       | 1.11.1       |     
                  python-babel |  DISTRO  | https://release-monitoring.org/project/11984 | 2.9.1        | 2.10.3       |     
                 python-bcrypt |  DISTRO  | https://release-monitoring.org/project/09047 | 3.2.0        | 3.2.2        |     
         python-beautifulsoup4 |  DISTRO  | https://release-monitoring.org/project/03779 | 4.10.0       | 4.11.1       |     
                  python-bleak |  DISTRO  | https://release-monitoring.org/project/26271 | 0.12.1       | 0.15.1       |     
               python-bluezero |  DISTRO  | https://release-monitoring.org/project/21929 | 0.6.0        | 0.7.1        |     
                  python-boto3 |  DISTRO  | https://release-monitoring.org/project/08778 | 1.24.8       | 1.24.56      |     
               python-botocore |  DISTRO  | https://release-monitoring.org/project/08748 | 1.27.8       | 1.27.56      |     
                 python-bottle |  DISTRO  | https://release-monitoring.org/project/11101 | 0.12.21      | 0.12.23      |     
                python-canopen |  DISTRO  | https://release-monitoring.org/project/23230 | 1.0.0        | 2.0.0b1      |     
               python-channels |  DISTRO  | https://release-monitoring.org/project/21937 | 2.3.1        | 3.0.5        |     
         python-channels-redis |  DISTRO  | https://release-monitoring.org/project/21936 | 2.4.1        | 4.0.0b1      |     
                python-chardet |  DISTRO  | https://release-monitoring.org/project/03798 | 4.0.0        | 5.0.0        |     
     python-charset-normalizer |  DISTRO  | https://release-monitoring.org/project/55366 | 2.1.0        | 3.0.0b2      |     
                python-cheroot |  DISTRO  | https://release-monitoring.org/project/20163 | 8.2.1        | 8.6.0        |     
               python-cherrypy |  DISTRO  | https://release-monitoring.org/project/03799 | 12.0.1       | 18.8.0       |     
               python-colorama |  DISTRO  | https://release-monitoring.org/project/03807 | 0.4.4        | 0.4.5        |     
               python-colorlog |  DISTRO  | https://release-monitoring.org/project/12509 | 6.4.1        | 6.6.0        |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/19734 | 1.1.29       | 1.5          |     
               python-crossbar |  DISTRO  | https://release-monitoring.org/project/21696 | 21.3.1       | 22.6.1       |     
               python-cssutils |  DISTRO  | https://release-monitoring.org/project/13259 | 2.5.1        | 2.6.0        |     
                 python-cython |  DISTRO  | https://release-monitoring.org/project/12679 | 0.29.30      | 3.0.0a11     |     
                 python-daemon |  DISTRO  | https://release-monitoring.org/project/03816 | 2.2.3        | 2.3.1        |     
                 python-daphne |  DISTRO  | https://release-monitoring.org/project/21939 | 2.4.1        | 3.0.2        |     
           python-dataproperty |  DISTRO  | https://release-monitoring.org/project/21697 | 0.54.2       | 0.55.0       |     
              python-decorator |  DISTRO  | https://release-monitoring.org/project/03819 | 5.1.0        | 5.1.1        |     
                python-dialog3 |  DISTRO  | https://release-monitoring.org/project/03823 | 3.5.1        | 3.5.3        |     
                 python-django |  DISTRO  | https://release-monitoring.org/project/03828 | 4.0.6        | 4.1b1        |     
              python-dnspython |  DISTRO  | https://release-monitoring.org/project/13190 | 2.1.0        | 2.2.1        |     
                 python-docker |  DISTRO  | https://release-monitoring.org/project/03847 | 4.1.0        | 6.0.0b2      |     
               python-docutils |  DISTRO  | https://release-monitoring.org/project/03849 | 0.18.1       | 0.19         |     
               python-dominate |  DISTRO  | https://release-monitoring.org/project/19648 | 2.6.0        | 2.7.0        |     
                   python-dpkt |  DISTRO  | https://release-monitoring.org/project/10497 | 1.9.7.2      | 1.9.8        |     
               python-dtschema |  DISTRO  | https://release-monitoring.org/project/100908 | 2022.8       | 2022.8.2     |     
                  python-ecdsa |  DISTRO  | https://release-monitoring.org/project/08370 | 0.17.0       | 0.18.0b2     |     
               python-engineio |  DISTRO  | https://release-monitoring.org/project/15064 | 4.2.1        | 4.3.4        |     
            python-entrypoints |  DISTRO  | https://release-monitoring.org/project/12081 | 0.3          | 0.4          |     
                python-esptool |  DISTRO  | https://release-monitoring.org/project/11619 | 4.1          | 4.2.1        |     
               python-filelock |  DISTRO  | https://release-monitoring.org/project/11739 | 3.3.0        | 3.8.0        |     
                  python-flask |  DISTRO  | https://release-monitoring.org/project/03867 | 2.1.2        | 2.2.2        |     
            python-flask-login |  DISTRO  | https://release-monitoring.org/project/03868 | 0.6.1        | 0.6.2        |     
              python-fonttools |  DISTRO  | https://release-monitoring.org/project/07388 | 4.34.4       | 4.36.0       |     
             python-frozenlist |  DISTRO  | https://release-monitoring.org/project/41138 | 1.3.0        | 1.3.1        |     
                    python-git |  DISTRO  | https://release-monitoring.org/project/06459 | 3.1.24       | 3.1.27       |     
                 python-gitdb2 |  DISTRO  | https://release-monitoring.org/project/12730 | 4.0.7        | 4.0.9        |     
                python-gobject |  DISTRO  | https://release-monitoring.org/project/13158 | 3.42.1       | 3.42.2       |     
               python-httplib2 |  DISTRO  | https://release-monitoring.org/project/03887 | 0.19.1       | 0.20.4       |     
               python-humanize |  DISTRO  | https://release-monitoring.org/project/19799 | 3.11.0       | 4.0.0        |     
                 python-ifaddr |  DISTRO  | https://release-monitoring.org/project/19908 | 0.1.7        | 0.2.0        |     
                python-ipython |  DISTRO  | https://release-monitoring.org/project/01399 | 7.31.1       | 8.4.0        |     
                python-iso8601 |  DISTRO  | https://release-monitoring.org/project/17228 | 0.1.14       | 1.0.2        |     
                  python-iwlib |  DISTRO  | https://release-monitoring.org/project/51611 | 1.5          | 1.7.0        |     
         python-jaraco-classes |  DISTRO  | https://release-monitoring.org/project/20150 | 2.0          | 3.2.2        |     
       python-jaraco-functools |  DISTRO  | https://release-monitoring.org/project/20165 | 2.0          | 3.5.1        |     
               python-jmespath |  DISTRO  | https://release-monitoring.org/project/08749 | 1.0.0        | 1.0.1        |     
             python-jsonschema |  DISTRO  | https://release-monitoring.org/project/03898 | 4.5.1        | 4.14.0       |     
                python-keyring |  DISTRO  | https://release-monitoring.org/project/03901 | 19.2.0       | 23.8.2       |     
             python-kiwisolver |  DISTRO  | https://release-monitoring.org/project/16910 | 1.1.0        | 1.4.4        |     
                python-libusb1 |  DISTRO  | https://release-monitoring.org/project/12301 | 2.0.1        | 3.0.0        |     
                   python-mako |  DISTRO  | https://release-monitoring.org/project/03915 | 1.1.5        | 1.2.1        |     
               python-markdown |  DISTRO  | https://release-monitoring.org/project/03916 | 3.3.4        | 3.4.1        |     
              python-markdown2 |  DISTRO  | https://release-monitoring.org/project/03917 | 2.4.1        | 2.4.3        |     
             python-markupsafe |  DISTRO  | https://release-monitoring.org/project/03918 | 2.0.1        | 2.1.1        |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/03919 | 3.4.3        | 3.5.3        |     
                python-maturin |  DISTRO  | https://release-monitoring.org/project/42653 | 0.13.1       | 0.13.2       |     
           python-mbstrdecoder |  DISTRO  | https://release-monitoring.org/project/21702 | 1.1.0        | 1.1.1        |     
        python-memory-profiler |  DISTRO  | https://release-monitoring.org/project/38508 | 0.58.0       | 0.60.0       |     
                python-mistune |  DISTRO  | https://release-monitoring.org/project/06189 | 0.8.4        | 2.0.4        |     
         python-more-itertools |  DISTRO  | https://release-monitoring.org/project/12201 | 8.10.0       | 8.13.0       |     
                  python-msgfy |  DISTRO  | https://release-monitoring.org/project/29716 | 0.1.0        | 0.2.0        |     
         python-networkmanager |  DISTRO  | https://release-monitoring.org/project/12909 | 2.1          | 2.2          |     
               python-networkx |  DISTRO  | https://release-monitoring.org/project/07791 | 2.6.3        | 2.8.5        |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/02509 | 1.21.2       | 1.23.2       |     
               python-oauthlib |  DISTRO  | https://release-monitoring.org/project/05377 | 3.1.1        | 3.2.0        |     
          python-opcua-asyncio |  DISTRO  | https://release-monitoring.org/project/131612 | 0.8.4        | 0.98.9       |     
                 python-orjson |  DISTRO  | https://release-monitoring.org/project/31737 | 3.7.11       | 3.7.12       |     
              python-paho-mqtt |  DISTRO  | https://release-monitoring.org/project/06084 | 1.4.0        | 1.6.1        |     
               python-paramiko |  DISTRO  | https://release-monitoring.org/project/03954 | 2.10.3       | 2.11.0       |     
                 python-pathpy |  DISTRO  | https://release-monitoring.org/project/21703 | 12.0.1       | 12.5.0       |     
           python-pathvalidate |  DISTRO  | https://release-monitoring.org/project/21704 | 2.5.0        | 2.5.2        |     
                    python-pbr |  DISTRO  | https://release-monitoring.org/project/03960 | 5.6.0        | 5.10.0       |     
                 python-pep517 |  DISTRO  | https://release-monitoring.org/project/47623 | 0.12.0       | 0.13.0       |     
                    python-pip |  DISTRO  | https://release-monitoring.org/project/06529 | 21.2.4       | 22.2.2       |     
                python-portend |  DISTRO  | https://release-monitoring.org/project/20203 | 2.5          | 3.1.0        |     
         python-prompt-toolkit |  DISTRO  | https://release-monitoring.org/project/08742 | 3.0.20       | 3.0.30       |     
               python-protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 21.4         | 21.5         |     
                 python-psutil |  DISTRO  | https://release-monitoring.org/project/03978 | 5.8.0        | 5.9.1        |     
               python-psycopg2 |  DISTRO  | https://release-monitoring.org/project/03979 | 2.9.1        | 2.9.3        |     
                   python-pudb |  DISTRO  | https://release-monitoring.org/project/03980 | 2021.1       | 2022.1.2     |     
                     python-py |  DISTRO  | https://release-monitoring.org/project/03981 | 1.10.0       | 1.11.0       |     
                python-pycares |  DISTRO  | https://release-monitoring.org/project/19900 | 4.2.1        | 4.2.2        |     
                  python-pydal |  DISTRO  | https://release-monitoring.org/project/21582 | 20220609.1   | 20220814.1   |     
               python-pydantic |  DISTRO  | https://release-monitoring.org/project/29768 | 1.8.2        | 1.9.2        |     
             python-pyelftools |  DISTRO  | https://release-monitoring.org/project/16219 | 0.27         | 0.29         |     
                 python-pygame |  DISTRO  | https://release-monitoring.org/project/17480 | d61ea8eabd56 | 2.1.2        |     
               python-pygments |  DISTRO  | https://release-monitoring.org/project/03986 | 2.7.4        | 2.13.0       |     
             python-pyhamcrest |  DISTRO  | https://release-monitoring.org/project/11633 | 2.0.2        | 2.0.4        |     
                  python-pyicu |  DISTRO  | https://release-monitoring.org/project/12004 | 1.9.7        | 2.9          |     
              python-pylibftdi |  DISTRO  | https://release-monitoring.org/project/21583 | 0.18.1       | 0.20.0       |     
               python-pymodbus |  DISTRO  | https://release-monitoring.org/project/15600 | 2.2.0        | 2.5.3        |     
                python-pymupdf |  DISTRO  | https://release-monitoring.org/project/17320 | 1.18.14      | 1.20.2       |     
               python-pyparted |  DISTRO  | https://release-monitoring.org/project/15558 | 3.11.6       | 3.12.0       |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/20104 | 5.15.6       | 5.15.7       |     
               python-pyroute2 |  DISTRO  | https://release-monitoring.org/project/20081 | 0.5.7        | 0.7.2        |     
                  python-pysmb |  DISTRO  | https://release-monitoring.org/project/21589 | 1.2.7        | 1.2.8        |     
          python-pytablereader |  DISTRO  | https://release-monitoring.org/project/21592 | 0.26.1       | 0.31.3       |     
          python-pytablewriter |  DISTRO  | https://release-monitoring.org/project/21593 | 0.46.1       | 0.64.2       |     
                   python-pytz |  DISTRO  | https://release-monitoring.org/project/06537 | 2021.3       | 2022.2.1     |     
                 python-pyudev |  DISTRO  | https://release-monitoring.org/project/08485 | 0.22.0       | 0.23.2       |     
                  python-pyzmq |  DISTRO  | https://release-monitoring.org/project/04104 | 19.0.2       | 23.2.1       |     
                  python-redis |  DISTRO  | https://release-monitoring.org/project/03992 | 3.5.3        | 4.3.4        |     
                python-reentry |  DISTRO  | https://release-monitoring.org/project/21596 | 1.3.2        | 1.3.3        |     
                  python-regex |  DISTRO  | https://release-monitoring.org/project/05548 | 2021.4.4     | 2022.8.17    |     
                   python-remi |  DISTRO  | https://release-monitoring.org/project/21597 | 2021.3.2     | 2022.7.27    |     
      python-requests-oauthlib |  DISTRO  | https://release-monitoring.org/project/11803 | 1.3.0        | 1.3.1        |     
               python-rpi-gpio |  DISTRO  | https://release-monitoring.org/project/12026 | 0.7.0        | 0.7.1        |     
                    python-rsa |  DISTRO  | https://release-monitoring.org/project/08808 | 4.8          | 4.9          |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/19641 | 2.1.74       | 2.2          |     
                  python-scipy |  DISTRO  | https://release-monitoring.org/project/04768 | 1.8.1        | 1.9.0        |     
          python-secretstorage |  DISTRO  | https://release-monitoring.org/project/04020 | 3.1.2        | 3.3.3        |     
       python-semantic-version |  DISTRO  | https://release-monitoring.org/project/06514 | 2.8.5        | 2.10.0       |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/21603 | 1.4.3        | 1.9.5        |     
           python-setproctitle |  DISTRO  | https://release-monitoring.org/project/11699 | 1.2.2        | 1.3.2        |     
             python-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 63.2.0       | 65.2.0       |     
        python-setuptools-rust |  DISTRO  | https://release-monitoring.org/project/122284 | 1.5.0        | 1.5.1        |     
python-setuptools-scm-git-a... |  DISTRO  | https://release-monitoring.org/project/28329 | 1.1          | 1.4          |     
                     python-sh |  DISTRO  | https://release-monitoring.org/project/10429 | 1.14.2       | 1.14.3       |     
           python-simplesqlite |  DISTRO  | https://release-monitoring.org/project/21608 | 0.45.2       | 1.3.0        |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/13626 | 4.19.25      | 5.0.0        |     
               python-socketio |  DISTRO  | https://release-monitoring.org/project/21611 | 5.4.0        | 5.7.1        |     
              python-soupsieve |  DISTRO  | https://release-monitoring.org/project/27570 | 2.2.1        | 2.3.2.post1  |     
             python-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/04034 | 1.3.10       | 1.4.40       |     
           python-sqliteschema |  DISTRO  | https://release-monitoring.org/project/29718 | 1.2.1        | 1.3.0        |     
               python-sqlparse |  DISTRO  | https://release-monitoring.org/project/04038 | 0.3.0        | 0.4.2        |     
                python-systemd |  DISTRO  | https://release-monitoring.org/project/07314 | 234          | 235          |     
                python-tempora |  DISTRO  | https://release-monitoring.org/project/21225 | 1.14.1       | 5.0.2        |     
                 python-thrift |  DISTRO  | https://release-monitoring.org/project/21614 | 0.13.0       | 0.16.0       |     
                python-tornado |  DISTRO  | https://release-monitoring.org/project/07498 | 6.0.4        | 6.2          |     
                   python-tqdm |  DISTRO  | https://release-monitoring.org/project/11524 | 4.40.1       | 4.64.0       |     
              python-traitlets |  DISTRO  | https://release-monitoring.org/project/12211 | 5.1.0        | 5.3.0        |     
                python-twisted |  DISTRO  | https://release-monitoring.org/project/04071 | 22.2.0       | 22.4.0       |     
               python-txtorcon |  DISTRO  | https://release-monitoring.org/project/19661 | 21.1.0       | 22.0.0       |     
         python-typing-inspect |  DISTRO  | https://release-monitoring.org/project/209826 | 0.7.1        | 0.8.0        |     
                  python-ujson |  DISTRO  | https://release-monitoring.org/project/04076 | 5.2.0        | 5.4.0        |     
 python-unittest-xml-reporting |  DISTRO  | https://release-monitoring.org/project/72281 | 3.0.4        | 3.2.0        |     
                python-urllib3 |  DISTRO  | https://release-monitoring.org/project/04078 | 1.26.10      | 1.26.11      |     
             python-validators |  DISTRO  | https://release-monitoring.org/project/19818 | 0.15.0       | 0.20.0       |     
               python-watchdog |  DISTRO  | https://release-monitoring.org/project/05341 | 2.1.6        | 2.1.9        |     
                python-wcwidth |  DISTRO  | https://release-monitoring.org/project/08743 | 0.1.9        | 0.2.5        |     
             python-weasyprint |  DISTRO  | https://release-monitoring.org/project/11057 | 55.0         | 56.1         |     
                  python-webpy |  DISTRO  | https://release-monitoring.org/project/04090 | 0.40         | 0.62         |     
       python-websocket-client |  DISTRO  | https://release-monitoring.org/project/07288 | 0.58.0       | 1.3.3        |     
             python-websockets |  DISTRO  | https://release-monitoring.org/project/08100 | 10.0         | 10.3         |     
               python-werkzeug |  DISTRO  | https://release-monitoring.org/project/04092 | 2.1.2        | 2.2.2        |     
                  python-wrapt |  DISTRO  | https://release-monitoring.org/project/06108 | 1.12.1       | 1.14.1       |     
                python-wtforms |  DISTRO  | https://release-monitoring.org/project/11805 | 2.3.3        | 3.0.1        |     
                   python-xlib |  DISTRO  | https://release-monitoring.org/project/12180 | 0.27         | 0.31         |     
             python-xlsxwriter |  DISTRO  | https://release-monitoring.org/project/12031 | 3.0.1        | 3.0.3        |     
                   python-yarl |  DISTRO  | https://release-monitoring.org/project/12895 | 1.7.2        | 1.8.1        |     
               python-zeroconf |  DISTRO  | https://release-monitoring.org/project/12681 | 0.29.0       | 0.39.0       |     
                  python-zlmdb |  DISTRO  | https://release-monitoring.org/project/66674 | 22.3.1       | 22.6.1       |     
                       python3 |  DISTRO  | https://release-monitoring.org/project/13254 | 3.10.5       | 3.10.6       |     
          qcom-db410c-firmware |  DISTRO  | https://release-monitoring.org/project/235382 | 1034.2.1     | 1036.1       |     
                          qpdf |  DISTRO  | https://release-monitoring.org/project/05542 | 10.5.0       | 10.6.3       |     
                   qpid-proton |  DISTRO  | https://release-monitoring.org/project/15198 | 0.35.0       | 0.37.0       |     
                       qt5coap |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.3.1        |     
                        qt5knx |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.3.1        |     
                       qt5mqtt |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.3.1        |     
                      qt5opcua |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.3.1        |     
                  qt5webengine |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.8       | 6.3.1        |     
                        quazip |  DISTRO  | https://release-monitoring.org/project/04141 | 1.2          | 1.3          |     
                           qwt |  DISTRO  | https://release-monitoring.org/project/04147 | 6.1.6        | 6.2.0        | ORPH
               rabbitmq-server |  DISTRO  | https://release-monitoring.org/project/05585 | 3.8.2        | 3.10.7       |     
                         ragel |  DISTRO  | https://release-monitoring.org/project/12105 | 6.10         | 7.0.4        | ORPH
                        ranger |  DISTRO  | https://release-monitoring.org/project/07426 | 1.7.2        | 1.9.3        |     
                     refpolicy |  DISTRO  | https://release-monitoring.org/project/21663 | 2.20220106   | 2.20220520   |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/16520 | 3.3          | 20200710     | ORPH
                         rhash |  DISTRO  | https://release-monitoring.org/project/13843 | 1.4.2        | 1.4.3        | ORPH
              riemann-c-client |  DISTRO  | https://release-monitoring.org/project/21389 | 1.10.5       | 2.0.1        | ORPH
                       rocksdb |  DISTRO  | https://release-monitoring.org/project/15560 | 6.20.3       | 7.4.5        |     
                         rsync |  DISTRO  | https://release-monitoring.org/project/04217 | 3.2.3        | 3.2.5        | ORPH
                       rsyslog |  DISTRO  | https://release-monitoring.org/project/04218 | 8.2204.1     | 8.2208.0     |     
                      rt-tests |  DISTRO  | https://release-monitoring.org/project/59450 | 2.3          | 2.4          |     
                          rtty |  DISTRO  | https://release-monitoring.org/project/87994 | 7.4.0        | 8.0.1        |     
                          rust |  DISTRO  | https://release-monitoring.org/project/07635 | 1.62.0       | 1.63.0       |     
                      rust-bin |  DISTRO  | https://release-monitoring.org/project/07635 | 1.62.0       | 1.63.0       |     
                         rygel |  DISTRO  | https://release-monitoring.org/project/04751 | 0.40.2       | 0.40.4       |     
                    s390-tools |  DISTRO  | https://release-monitoring.org/project/10714 | 2.21.0       | 2.23.0       |     
                            s6 |  DISTRO  | https://release-monitoring.org/project/05485 | 2.10.0.3     | 2.11.1.2     |     
                        s6-dns |  DISTRO  | https://release-monitoring.org/project/16547 | 2.3.5.1      | 2.3.5.4      |     
                 s6-linux-init |  DISTRO  | https://release-monitoring.org/project/16552 | 1.0.6.3      | 1.0.8.0      |     
                s6-linux-utils |  DISTRO  | https://release-monitoring.org/project/16551 | 2.5.1.5      | 2.6.0.0      |     
                 s6-networking |  DISTRO  | https://release-monitoring.org/project/16550 | 2.4.1.1      | 2.5.1.1      |     
             s6-portable-utils |  DISTRO  | https://release-monitoring.org/project/16549 | 2.2.3.2      | 2.2.5.0      |     
                         s6-rc |  DISTRO  | https://release-monitoring.org/project/16548 | 0.5.2.2      | 0.5.3.2      |     
                      safeclib |  DISTRO  | https://release-monitoring.org/project/21385 | 3.7.1        | 01022022     |     
                        samba4 |  DISTRO  | https://release-monitoring.org/project/04758 | 4.15.7       | 4.16.4       |     
                 sane-backends |  DISTRO  | https://release-monitoring.org/project/04760 | 1.0.32       | 1.1.1        |     
                         scons |  DISTRO  | https://release-monitoring.org/project/04770 | 3.1.2        | 4.4.0        |     
                     sdbus-cpp |  DISTRO  | https://release-monitoring.org/project/70626 | 1.1.0        | 1.2.0        |     
                          sdl2 |  DISTRO  | https://release-monitoring.org/project/04779 | 2.0.22       | 2.24.0       |     
                    sdl2_image |  DISTRO  | https://release-monitoring.org/project/04781 | 2.0.5        | 2.6.2        |     
                    sdl2_mixer |  DISTRO  | https://release-monitoring.org/project/04782 | 2.0.4        | 2.6.2        | ORPH
                      sdl2_net |  DISTRO  | https://release-monitoring.org/project/04783 | 2.0.1        | 2.2.0        | ORPH
                      sdl2_ttf |  DISTRO  | https://release-monitoring.org/project/04784 | 2.0.18       | 2.20.1       |     
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/04778 | 2.0.23       | 2.0.25       | ORPH
                     sdl_sound |  DISTRO  | https://release-monitoring.org/project/10262 | 1.0.3        | 2.0.1        | ORPH
                        sdparm |  DISTRO  | https://release-monitoring.org/project/04787 | 1.10         | 1.12         |     
                       sedutil |  DISTRO  | https://release-monitoring.org/project/15203 | 1.15.1       | 1.20.0       |     
                selinux-python |  DISTRO  | https://release-monitoring.org/project/01717 | 3.3          | 3.4          |     
                semodule-utils |  DISTRO  | https://release-monitoring.org/project/01717 | 3.3          | 3.4          | ORPH
                    sentry-cli |  DISTRO  | https://release-monitoring.org/project/135642 | 1.59.0       | 2.5.2        |     
                 sentry-native |  DISTRO  | https://release-monitoring.org/project/135639 | 0.4.1        | 0.5.0        |     
                       ser2net |  DISTRO  | https://release-monitoring.org/project/21655 | 4.3.4        | 4.3.7        |     
                          serd |  DISTRO  | https://release-monitoring.org/project/230531 | 0.30.10      | 0.30.14      |     
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/05524 | 1.12         | 2.2          | ORPH
                          shim |  DISTRO  | https://release-monitoring.org/project/10719 | 15.4         | 15.6         |     
                       skalibs |  DISTRO  | https://release-monitoring.org/project/05486 | 2.10.0.3     | 2.12.0.1     |     
                         slang |  DISTRO  | https://release-monitoring.org/project/04829 | 2.3.2        | 2.3.3        | ORPH
                 smartmontools |  DISTRO  | https://release-monitoring.org/project/04835 | 7.2          | 7.3          | ORPH
                        sngrep |  DISTRO  | https://release-monitoring.org/project/17075 | 1.4.7        | 1.5.0        | ORPH
                        snmppp |  DISTRO  | https://release-monitoring.org/project/21318 | 3.4.9        | 3.4.10       |     
                         snort |  DISTRO  | https://release-monitoring.org/project/212335 | 2.9.19       | 2.9.20       |     
                        snort3 |  DISTRO  | https://release-monitoring.org/project/13263 | 3.1.18.0     | 3.1.39.0     |     
                     softether |  DISTRO  | https://release-monitoring.org/project/21383 | 4.30-9700... | 4.38-9760... |     
                          sord |  DISTRO  | https://release-monitoring.org/project/230536 | 0.16.8       | 0.16.12      |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/10152 | 0.7          | 0.8          |     
                       spandsp |  DISTRO  | https://release-monitoring.org/project/12600 | 3.0.0-6ec... | 3.0.0        |     
                    sphinxbase |  DISTRO  | https://release-monitoring.org/project/20548 | 5prealpha    | 0.8          |     
                     spi-tools |  DISTRO  | https://release-monitoring.org/project/20628 | 1.0.1        | 1.0.2        |     
                     sqlcipher |  DISTRO  | https://release-monitoring.org/project/11213 | 4.5.1        | 4.5.2        |     
                      squashfs |  DISTRO  | https://release-monitoring.org/project/04879 | 4.5          | 4.5.1        |     
                         squid |  DISTRO  | https://release-monitoring.org/project/04880 | 5.3          | 5.6          | ORPH
                        sratom |  DISTRO  | https://release-monitoring.org/project/14903 | 0.6.8        | 0.6.12       |     
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/08127 | 1.20.7.1     | 1.21.9       | ORPH
                        stella |  DISTRO  | https://release-monitoring.org/project/06861 | 6.6          | 6.7          |     
                        strace |  DISTRO  | https://release-monitoring.org/project/04897 | 5.18         | 5.19         |     
                        stress |  DISTRO  | https://release-monitoring.org/project/08048 | 1.0.4        | 1.0.5        |     
                     stress-ng |  DISTRO  | https://release-monitoring.org/project/12538 | 0.13.05      | 0.14.03      |     
                    strongswan |  DISTRO  | https://release-monitoring.org/project/04899 | 5.9.5        | 5.9.7        |     
                       stunnel |  DISTRO  | https://release-monitoring.org/project/04901 | 5.60         | 5.65         |     
                          sudo |  DISTRO  | https://release-monitoring.org/project/04906 | 1.9.11p2     | 1.9.11p3     | ORPH
                    supervisor |  DISTRO  | https://release-monitoring.org/project/16289 | 4.2.2        | 4.2.4        | ORPH
                       synergy |  DISTRO  | https://release-monitoring.org/project/05718 | 2.0.12-beta  | 2.3.2        |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/16898 | 0.29.2       | 0.29.3       |     
                       sysprof |  DISTRO  | https://release-monitoring.org/project/21649 | 1.2.0        | 3.44.0       |     
                       sysrepo |  DISTRO  | https://release-monitoring.org/project/34820 | 2.1.64       | 2.1.84       |     
                       sysstat |  DISTRO  | https://release-monitoring.org/project/04931 | 12.4.2       | 12.6.0       | ORPH
         system-config-printer |  DISTRO  | https://release-monitoring.org/project/08855 | 1.5.15       | 1.5.16       | ORPH
                       systemd |  DISTRO  | https://release-monitoring.org/project/05440 | 250.4        | 251          |     
             systemd-bootchart |  DISTRO  | https://release-monitoring.org/project/11774 | 233          | 234          |     
                      sysvinit |  DISTRO  | https://release-monitoring.org/project/21648 | 2.99         | 3.04         | ORPH
                         tclap |  DISTRO  | https://release-monitoring.org/project/04942 | 1.2.4        | 1.2.5        |     
                        tcllib |  DISTRO  | https://release-monitoring.org/project/04943 | 1.20         | 1.21         |     
                 tesseract-ocr |  DISTRO  | https://release-monitoring.org/project/04954 | 5.0.1        | 5.2.0        |     
                        thrift |  DISTRO  | https://release-monitoring.org/project/05581 | 0.14.1       | 0.16.0       | ORPH
                      tinifier |  DISTRO  | https://release-monitoring.org/project/241900 | 3.4.0        | 3.5.0        |     
                       tinyssh |  DISTRO  | https://release-monitoring.org/project/14678 | 20210601     | 20220801     |     
                       tinyxml |  DISTRO  | https://release-monitoring.org/project/10162 | 2.6.2_2      | 2.6.2        | ORPH
                           tio |  DISTRO  | https://release-monitoring.org/project/20587 | 1.40         | 1.47         |     
                          tmux |  DISTRO  | https://release-monitoring.org/project/04980 | 3.1c         | 3.3a         |     
                           tor |  DISTRO  | https://release-monitoring.org/project/04991 | 0.4.7.8      | 0.4.7.10     |     
                     tpm-tools |  DISTRO  | https://release-monitoring.org/project/21640 | 1.3.9.1      | 1.3.9.2      |     
                    tpm2-abrmd |  DISTRO  | https://release-monitoring.org/project/16819 | 2.3.3        | 2.4.1        | ORPH
                   tpm2-pkcs11 |  DISTRO  | https://release-monitoring.org/project/18777 | 1.7.0        | 1.8.0        |     
                     tpm2-totp |  DISTRO  | https://release-monitoring.org/project/18790 | 0.2.1        | 0.3.0        |     
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/12683 | 3.1.0        | 3.2.0        | ORPH
                     trace-cmd |  DISTRO  | https://release-monitoring.org/project/07873 | 2.9.7        | 3.1.2        |     
                          ttyd |  DISTRO  | https://release-monitoring.org/project/13890 | 1.6.3        | 1.7.1        |     
                        tzdata |  DISTRO  | https://release-monitoring.org/project/05021 | 2021e        | 2022c        |     
                         uacme |  DISTRO  | https://release-monitoring.org/project/22795 | 1.7.1        | 1.7.2        |     
                   uboot-tools |  DISTRO  | https://release-monitoring.org/project/05022 | 2021.07      | 2022.07      |     
                          uftp |  DISTRO  | https://release-monitoring.org/project/21638 | 5.0          | 5.0.1        |     
                       uftrace |  DISTRO  | https://release-monitoring.org/project/195039 | 0.10         | 0.12         |     
                           uhd |  DISTRO  | https://release-monitoring.org/project/12572 | 3.15.0.0     | 4.2.0.1      |     
                       unionfs |  DISTRO  | https://release-monitoring.org/project/17617 | 2.1          | 3.2          |     
                      upmpdcli |  DISTRO  | https://release-monitoring.org/project/15848 | 1.5.12       | 1.5.19       |     
                        upower |  DISTRO  | https://release-monitoring.org/project/05056 | 0.99.19      | 0.99.20      |     
                      usbredir |  DISTRO  | https://release-monitoring.org/project/16012 | 0.12.0       | 0.13.0       |     
                    util-linux |  DISTRO  | https://release-monitoring.org/project/08179 | 2.38         | 2.38.1       | ORPH
               util-linux-libs |  DISTRO  | https://release-monitoring.org/project/08179 | 2.38         | 2.38.1       | ORPH
                           uuu |  DISTRO  | https://release-monitoring.org/project/259328 | 1.4.224      | 1.4.240      |     
                           uvw |  DISTRO  | https://release-monitoring.org/project/33083 | 2.11.0_li... | 2.12.1_li... |     
                  v4l2loopback |  DISTRO  | https://release-monitoring.org/project/10956 | 0.12.5       | 0.12.7       |     
                          vala |  DISTRO  | https://release-monitoring.org/project/05065 | 0.52.4       | 0.56.2       | ORPH
                      valijson |  DISTRO  | https://release-monitoring.org/project/18452 | 0.6          | 0.7          |     
                           vim |  DISTRO  | https://release-monitoring.org/project/05092 | 9.0.0008     | 9.0.0234     | ORPH
                   vis-network |  DISTRO  | https://release-monitoring.org/project/270536 | 9.1.0        | 9.1.2        |     
                        vnstat |  DISTRO  | https://release-monitoring.org/project/07283 | 2.8          | 2.9          |     
                          vpnc |  DISTRO  | https://release-monitoring.org/project/15955 | 0.5.3r550... | 0.5.3        | ORPH
                           vte |  DISTRO  | https://release-monitoring.org/project/10895 | 0.66.2       | 0.68.0       | ORPH
                         vuejs |  DISTRO  | https://release-monitoring.org/project/89353 | 3.2.33       | 3.2.37       |     
                  vuejs-router |  DISTRO  | https://release-monitoring.org/project/234796 | 4.0.15       | 4.1.3        |     
                vulkan-headers |  DISTRO  | https://release-monitoring.org/project/88835 | 1.2.203      | 1.3.225      | ORPH
                           waf |  DISTRO  | https://release-monitoring.org/project/05116 | 2.0.23       | 2.0.24       |     
                       wayland |  DISTRO  | https://release-monitoring.org/project/10061 | 1.20.0       | 1.21.0       |     
             wayland-protocols |  DISTRO  | https://release-monitoring.org/project/13997 | 1.25         | 1.26         | ORPH
                     waylandpp |  DISTRO  | https://release-monitoring.org/project/16969 | 0.2.8        | 1.0.0        |     
                     webkitgtk |  DISTRO  | https://release-monitoring.org/project/05355 | 2.36.5       | 2.36.6       |     
                          webp |  DISTRO  | https://release-monitoring.org/project/01761 | 1.2.2        | 1.2.4        |     
       webrtc-audio-processing |  DISTRO  | https://release-monitoring.org/project/15929 | 0.3.1        | 1.0          | ORPH
                        weston |  DISTRO  | https://release-monitoring.org/project/13745 | 10.0.1       | 10.0.2       |     
                          wine |  DISTRO  | https://release-monitoring.org/project/05134 | 7.0          | 7.15         |     
        wireguard-linux-compat |  DISTRO  | https://release-monitoring.org/project/62379 | 1.0.20211208 | 1.0.20220627 |     
                wireless-regdb |  DISTRO  | https://release-monitoring.org/project/15257 | 2022.02.18   | 2022.08.12   |     
                   wireplumber |  DISTRO  | https://release-monitoring.org/project/235056 | 0.4.8        | 0.4.11       | ORPH
                     wireshark |  DISTRO  | https://release-monitoring.org/project/05137 | 3.4.12       | 3.7.2        | ORPH
                       wolftpm |  DISTRO  | https://release-monitoring.org/project/256219 | 2.4.0        | 2.5.0        |     
                wpebackend-fdo |  DISTRO  | https://release-monitoring.org/project/17547 | 1.12.0       | 1.12.1       |     
                     wpewebkit |  DISTRO  | https://release-monitoring.org/project/17557 | 2.36.5       | 2.36.6       |     
                        xapian |  DISTRO  | https://release-monitoring.org/project/15919 | 1.4.19       | 1.4.20       |     
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/15047 | 1.1.1        | 20220111     |     
   xdriver_xf86-input-keyboard |  DISTRO  | https://release-monitoring.org/project/15902 | 1.9.0        | 2.0.0        |     
   xdriver_xf86-input-libinput |  DISTRO  | https://release-monitoring.org/project/05782 | 1.2.0        | 1.2.1        |     
                           xen |  DISTRO  | https://release-monitoring.org/project/05181 | 4.14.4       | 4.16.2       |     
                      xfsprogs |  DISTRO  | https://release-monitoring.org/project/05188 | 5.14.2       | 5.19.0       | ORPH
                        xinetd |  DISTRO  | https://release-monitoring.org/project/06382 | 2.3.15       | 2.3.15.4     |     
                     xorgproto |  DISTRO  | https://release-monitoring.org/project/17190 | 2022.1       | 2022.2       |     
                  xscreensaver |  DISTRO  | https://release-monitoring.org/project/05269 | 6.03         | 6.04         |     
                xtables-addons |  DISTRO  | https://release-monitoring.org/project/07736 | 3.17         | 3.21         | ORPH
                         xterm |  DISTRO  | https://release-monitoring.org/project/05272 | 371          | 372          | ORPH
                            xz |  DISTRO  | https://release-monitoring.org/project/05277 | 5.2.5        | 5.2.6        | ORPH
                           yad |  DISTRO  | https://release-monitoring.org/project/05280 | 0.40.0       | 12.0         |     
                      yaml-cpp |  DISTRO  | https://release-monitoring.org/project/05284 | 0.6.3        | 0.7.0        | ORPH
                        zabbix |  DISTRO  | https://release-monitoring.org/project/05492 | 5.4.9        | 6.2.1        |     
                          zeek |  DISTRO  | https://release-monitoring.org/project/267106 | 4.1.1        | 5.0.0        |     
                           zfs |  DISTRO  | https://release-monitoring.org/project/11706 | 2.1.4        | 2.1.5        |     
                           zic |  DISTRO  | https://release-monitoring.org/project/16905 | 2021e        | 2022c        |     
                          zlog |  DISTRO  | https://release-monitoring.org/project/21624 | 1.2.15       | 1.2.16       |     
                           zsh |  DISTRO  | https://release-monitoring.org/project/05307 | 5.8.1        | 5.9          |     

Packages having CVEs
====================

CVEs for the 'master' branch
----------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-4465    | https://security-tracker.debian.org/tracker/CVE-2007-4465   
                        apache | CVE-2007-5000    | https://security-tracker.debian.org/tracker/CVE-2007-5000   
                        apache | CVE-2007-6388    | https://security-tracker.debian.org/tracker/CVE-2007-6388   
                        apache | CVE-2007-6420    | https://security-tracker.debian.org/tracker/CVE-2007-6420   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-0455    | https://security-tracker.debian.org/tracker/CVE-2008-0455   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2008-2939    | https://security-tracker.debian.org/tracker/CVE-2008-2939   
                        apache | CVE-2009-1195    | https://security-tracker.debian.org/tracker/CVE-2009-1195   
                        apache | CVE-2009-1890    | https://security-tracker.debian.org/tracker/CVE-2009-1890   
                        apache | CVE-2009-1891    | https://security-tracker.debian.org/tracker/CVE-2009-1891   
                        apache | CVE-2009-2699    | https://security-tracker.debian.org/tracker/CVE-2009-2699   
                        apache | CVE-2010-0408    | https://security-tracker.debian.org/tracker/CVE-2010-0408   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2010-0434    | https://security-tracker.debian.org/tracker/CVE-2010-0434   
                        apache | CVE-2010-1452    | https://security-tracker.debian.org/tracker/CVE-2010-1452   
                        apache | CVE-2014-0231    | https://security-tracker.debian.org/tracker/CVE-2014-0231   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2022-27607   | https://security-tracker.debian.org/tracker/CVE-2022-27607  
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2021-45078   | https://security-tracker.debian.org/tracker/CVE-2021-45078  
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                       busybox | CVE-2022-28391   | https://security-tracker.debian.org/tracker/CVE-2022-28391  
                       busybox | CVE-2022-30065   | https://security-tracker.debian.org/tracker/CVE-2022-30065  
                         cairo | CVE-2019-6461    | https://security-tracker.debian.org/tracker/CVE-2019-6461   
                         cairo | CVE-2019-6462    | https://security-tracker.debian.org/tracker/CVE-2019-6462   
                         cairo | CVE-2020-35492   | https://security-tracker.debian.org/tracker/CVE-2020-35492  
                       connman | CVE-2022-32292   | https://security-tracker.debian.org/tracker/CVE-2022-32292  
                       connman | CVE-2022-32293   | https://security-tracker.debian.org/tracker/CVE-2022-32293  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                      cryptopp | CVE-2021-43398   | https://security-tracker.debian.org/tracker/CVE-2021-43398  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                     darkhttpd | CVE-2020-25691   | https://security-tracker.debian.org/tracker/CVE-2020-25691  
                   dbus-broker | CVE-2022-31212   | https://security-tracker.debian.org/tracker/CVE-2022-31212  
                   dbus-broker | CVE-2022-31213   | https://security-tracker.debian.org/tracker/CVE-2022-31213  
                       dnsmasq | CVE-2021-45951   | https://security-tracker.debian.org/tracker/CVE-2021-45951  
                       dnsmasq | CVE-2021-45952   | https://security-tracker.debian.org/tracker/CVE-2021-45952  
                       dnsmasq | CVE-2021-45953   | https://security-tracker.debian.org/tracker/CVE-2021-45953  
                       dnsmasq | CVE-2021-45954   | https://security-tracker.debian.org/tracker/CVE-2021-45954  
                       dnsmasq | CVE-2021-45955   | https://security-tracker.debian.org/tracker/CVE-2021-45955  
                       dnsmasq | CVE-2021-45956   | https://security-tracker.debian.org/tracker/CVE-2021-45956  
                       dnsmasq | CVE-2021-45957   | https://security-tracker.debian.org/tracker/CVE-2021-45957  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                       dovecot | CVE-2022-30550   | https://security-tracker.debian.org/tracker/CVE-2022-30550  
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                        erlang | CVE-2020-35733   | https://security-tracker.debian.org/tracker/CVE-2020-35733  
                         exfat | CVE-2022-29973   | https://security-tracker.debian.org/tracker/CVE-2022-29973  
                          exim | CVE-2020-28017   | https://security-tracker.debian.org/tracker/CVE-2020-28017  
                         exiv2 | CVE-2007-6353    | https://security-tracker.debian.org/tracker/CVE-2007-6353   
                        ffmpeg | CVE-2021-38291   | https://security-tracker.debian.org/tracker/CVE-2021-38291  
             freeradius-server | CVE-2002-0318    | https://security-tracker.debian.org/tracker/CVE-2002-0318   
             freeradius-server | CVE-2011-4966    | https://security-tracker.debian.org/tracker/CVE-2011-4966   
                        giflib | CVE-2022-28506   | https://security-tracker.debian.org/tracker/CVE-2022-28506  
                           git | CVE-2022-24765   | https://security-tracker.debian.org/tracker/CVE-2022-24765  
                           git | CVE-2022-24975   | https://security-tracker.debian.org/tracker/CVE-2022-24975  
                           git | CVE-2022-29187   | https://security-tracker.debian.org/tracker/CVE-2022-29187  
                         glibc | CVE-2010-4756    | https://security-tracker.debian.org/tracker/CVE-2010-4756   
                         glibc | CVE-2019-1010022 | https://security-tracker.debian.org/tracker/CVE-2019-1010022
                         glibc | CVE-2019-1010023 | https://security-tracker.debian.org/tracker/CVE-2019-1010023
                         glibc | CVE-2019-1010024 | https://security-tracker.debian.org/tracker/CVE-2019-1010024
                         glibc | CVE-2019-1010025 | https://security-tracker.debian.org/tracker/CVE-2019-1010025
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                            go | CVE-2020-29509   | https://security-tracker.debian.org/tracker/CVE-2020-29509  
                            go | CVE-2020-29511   | https://security-tracker.debian.org/tracker/CVE-2020-29511  
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                         grub2 | CVE-2021-3981    | https://security-tracker.debian.org/tracker/CVE-2021-3981   
                         grub2 | CVE-2021-46705   | https://security-tracker.debian.org/tracker/CVE-2021-46705  
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                heirloom-mailx | CVE-2004-2771    | https://security-tracker.debian.org/tracker/CVE-2004-2771   
                   imagemagick | CVE-2007-1667    | https://security-tracker.debian.org/tracker/CVE-2007-1667   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2017-5509    | https://security-tracker.debian.org/tracker/CVE-2017-5509   
                   imagemagick | CVE-2017-5510    | https://security-tracker.debian.org/tracker/CVE-2017-5510   
                   imagemagick | CVE-2017-5511    | https://security-tracker.debian.org/tracker/CVE-2017-5511   
                        jasper | CVE-2015-8751    | https://security-tracker.debian.org/tracker/CVE-2015-8751   
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                       libkrb5 | CVE-2009-0846    | https://security-tracker.debian.org/tracker/CVE-2009-0846   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libmpeg2 | CVE-2022-37416   | https://security-tracker.debian.org/tracker/CVE-2022-37416  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libtirpc | CVE-2021-46828   | https://security-tracker.debian.org/tracker/CVE-2021-46828  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                       libxml2 | CVE-2016-3709    | https://security-tracker.debian.org/tracker/CVE-2016-3709   
                       libxslt | CVE-2022-29824   | https://security-tracker.debian.org/tracker/CVE-2022-29824  
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2020-15888   | https://security-tracker.debian.org/tracker/CVE-2020-15888  
                           lua | CVE-2020-15945   | https://security-tracker.debian.org/tracker/CVE-2020-15945  
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                       mbedtls | CVE-2022-35409   | https://security-tracker.debian.org/tracker/CVE-2022-35409  
                      minetest | CVE-2022-35978   | https://security-tracker.debian.org/tracker/CVE-2022-35978  
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-18381   | https://security-tracker.debian.org/tracker/CVE-2017-18381  
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          nasm | CVE-2020-18974   | https://security-tracker.debian.org/tracker/CVE-2020-18974  
                       ncurses | CVE-2021-39537   | https://security-tracker.debian.org/tracker/CVE-2021-39537  
                       ncurses | CVE-2022-29458   | https://security-tracker.debian.org/tracker/CVE-2022-29458  
                         nginx | CVE-2021-3618    | https://security-tracker.debian.org/tracker/CVE-2021-3618   
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2013-0169    | https://security-tracker.debian.org/tracker/CVE-2013-0169   
                       openjdk | CVE-2022-21540   | https://security-tracker.debian.org/tracker/CVE-2022-21540  
                       openjdk | CVE-2022-21541   | https://security-tracker.debian.org/tracker/CVE-2022-21541  
                       openjdk | CVE-2022-34169   | https://security-tracker.debian.org/tracker/CVE-2022-34169  
                      openjpeg | CVE-2015-1239    | https://security-tracker.debian.org/tracker/CVE-2015-1239   
                      openjpeg | CVE-2016-9675    | https://security-tracker.debian.org/tracker/CVE-2016-9675   
                      openldap | CVE-2015-3276    | https://security-tracker.debian.org/tracker/CVE-2015-3276   
                      openldap | CVE-2022-29155   | https://security-tracker.debian.org/tracker/CVE-2022-29155  
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                          opus | CVE-2022-25345   | https://security-tracker.debian.org/tracker/CVE-2022-25345  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                        polkit | CVE-2021-4034    | https://security-tracker.debian.org/tracker/CVE-2021-4034   
                    postgresql | CVE-2017-8806    | https://security-tracker.debian.org/tracker/CVE-2017-8806   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                          pppd | CVE-2018-11574   | https://security-tracker.debian.org/tracker/CVE-2018-11574  
                python-aiohttp | CVE-2022-33124   | https://security-tracker.debian.org/tracker/CVE-2022-33124  
                 python-django | CVE-2022-36359   | https://security-tracker.debian.org/tracker/CVE-2022-36359  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
                    python-pip | CVE-2018-20225   | https://security-tracker.debian.org/tracker/CVE-2018-20225  
                python-twisted | CVE-2022-24801   | https://security-tracker.debian.org/tracker/CVE-2022-24801  
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2022-35414   | https://security-tracker.debian.org/tracker/CVE-2022-35414  
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
               rabbitmq-server | CVE-2020-5419    | https://security-tracker.debian.org/tracker/CVE-2020-5419   
               rabbitmq-server | CVE-2021-22116   | https://security-tracker.debian.org/tracker/CVE-2021-22116  
               rabbitmq-server | CVE-2021-22117   | https://security-tracker.debian.org/tracker/CVE-2021-22117  
               rabbitmq-server | CVE-2021-32718   | https://security-tracker.debian.org/tracker/CVE-2021-32718  
               rabbitmq-server | CVE-2021-32719   | https://security-tracker.debian.org/tracker/CVE-2021-32719  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                         rsync | CVE-2022-29154   | https://security-tracker.debian.org/tracker/CVE-2022-29154  
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-1050    | https://security-tracker.debian.org/tracker/CVE-2018-1050   
                        samba4 | CVE-2018-1057    | https://security-tracker.debian.org/tracker/CVE-2018-1057   
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2020-14409   | https://security-tracker.debian.org/tracker/CVE-2020-14409  
                           sdl | CVE-2020-14410   | https://security-tracker.debian.org/tracker/CVE-2020-14410  
                           sdl | CVE-2022-34568   | https://security-tracker.debian.org/tracker/CVE-2022-34568  
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                         squid | CVE-2021-46784   | https://security-tracker.debian.org/tracker/CVE-2021-46784  
                     tcpreplay | CVE-2022-25484   | https://security-tracker.debian.org/tracker/CVE-2022-25484  
                     tcpreplay | CVE-2022-27416   | https://security-tracker.debian.org/tracker/CVE-2022-27416  
                     tcpreplay | CVE-2022-27418   | https://security-tracker.debian.org/tracker/CVE-2022-27418  
                     tcpreplay | CVE-2022-27939   | https://security-tracker.debian.org/tracker/CVE-2022-27939  
                     tcpreplay | CVE-2022-27940   | https://security-tracker.debian.org/tracker/CVE-2022-27940  
                     tcpreplay | CVE-2022-27941   | https://security-tracker.debian.org/tracker/CVE-2022-27941  
                     tcpreplay | CVE-2022-27942   | https://security-tracker.debian.org/tracker/CVE-2022-27942  
                     tcpreplay | CVE-2022-28487   | https://security-tracker.debian.org/tracker/CVE-2022-28487  
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2022-2056    | https://security-tracker.debian.org/tracker/CVE-2022-2056   
                          tiff | CVE-2022-2057    | https://security-tracker.debian.org/tracker/CVE-2022-2057   
                          tiff | CVE-2022-2058    | https://security-tracker.debian.org/tracker/CVE-2022-2058   
                          tiff | CVE-2022-2867    | https://security-tracker.debian.org/tracker/CVE-2022-2867   
                          tiff | CVE-2022-2868    | https://security-tracker.debian.org/tracker/CVE-2022-2868   
                          tiff | CVE-2022-2869    | https://security-tracker.debian.org/tracker/CVE-2022-2869   
                          tiff | CVE-2022-34526   | https://security-tracker.debian.org/tracker/CVE-2022-34526  
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2022-0529    | https://security-tracker.debian.org/tracker/CVE-2022-0529   
                         unzip | CVE-2022-0530    | https://security-tracker.debian.org/tracker/CVE-2022-0530   
                  v4l2loopback | CVE-2022-2652    | https://security-tracker.debian.org/tracker/CVE-2022-2652   
                           vim | CVE-2022-2257    | https://security-tracker.debian.org/tracker/CVE-2022-2257   
                           vim | CVE-2022-2264    | https://security-tracker.debian.org/tracker/CVE-2022-2264   
                           vim | CVE-2022-2284    | https://security-tracker.debian.org/tracker/CVE-2022-2284   
                           vim | CVE-2022-2285    | https://security-tracker.debian.org/tracker/CVE-2022-2285   
                           vim | CVE-2022-2286    | https://security-tracker.debian.org/tracker/CVE-2022-2286   
                           vim | CVE-2022-2287    | https://security-tracker.debian.org/tracker/CVE-2022-2287   
                           vim | CVE-2022-2288    | https://security-tracker.debian.org/tracker/CVE-2022-2288   
                           vim | CVE-2022-2289    | https://security-tracker.debian.org/tracker/CVE-2022-2289   
                           vim | CVE-2022-2304    | https://security-tracker.debian.org/tracker/CVE-2022-2304   
                           vim | CVE-2022-2343    | https://security-tracker.debian.org/tracker/CVE-2022-2343   
                           vim | CVE-2022-2344    | https://security-tracker.debian.org/tracker/CVE-2022-2344   
                           vim | CVE-2022-2345    | https://security-tracker.debian.org/tracker/CVE-2022-2345   
                           vim | CVE-2022-2522    | https://security-tracker.debian.org/tracker/CVE-2022-2522   
                           vim | CVE-2022-2571    | https://security-tracker.debian.org/tracker/CVE-2022-2571   
                           vim | CVE-2022-2580    | https://security-tracker.debian.org/tracker/CVE-2022-2580   
                           vim | CVE-2022-2581    | https://security-tracker.debian.org/tracker/CVE-2022-2581   
                           vim | CVE-2022-2598    | https://security-tracker.debian.org/tracker/CVE-2022-2598   
                           vim | CVE-2022-2816    | https://security-tracker.debian.org/tracker/CVE-2022-2816   
                           vim | CVE-2022-2817    | https://security-tracker.debian.org/tracker/CVE-2022-2817   
                           vim | CVE-2022-2819    | https://security-tracker.debian.org/tracker/CVE-2022-2819   
                           vim | CVE-2022-2845    | https://security-tracker.debian.org/tracker/CVE-2022-2845   
                           vim | CVE-2022-2849    | https://security-tracker.debian.org/tracker/CVE-2022-2849   
                           vim | CVE-2022-2862    | https://security-tracker.debian.org/tracker/CVE-2022-2862   
                           vim | CVE-2022-2874    | https://security-tracker.debian.org/tracker/CVE-2022-2874   
                           vim | CVE-2022-2889    | https://security-tracker.debian.org/tracker/CVE-2022-2889   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28038   | https://security-tracker.debian.org/tracker/CVE-2021-28038  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                          yasm | CVE-2021-33454   | https://security-tracker.debian.org/tracker/CVE-2021-33454  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

CVEs for the '2022.02.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-4465    | https://security-tracker.debian.org/tracker/CVE-2007-4465   
                        apache | CVE-2007-5000    | https://security-tracker.debian.org/tracker/CVE-2007-5000   
                        apache | CVE-2007-6388    | https://security-tracker.debian.org/tracker/CVE-2007-6388   
                        apache | CVE-2007-6420    | https://security-tracker.debian.org/tracker/CVE-2007-6420   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-0455    | https://security-tracker.debian.org/tracker/CVE-2008-0455   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2008-2939    | https://security-tracker.debian.org/tracker/CVE-2008-2939   
                        apache | CVE-2009-1195    | https://security-tracker.debian.org/tracker/CVE-2009-1195   
                        apache | CVE-2009-1890    | https://security-tracker.debian.org/tracker/CVE-2009-1890   
                        apache | CVE-2009-1891    | https://security-tracker.debian.org/tracker/CVE-2009-1891   
                        apache | CVE-2009-2699    | https://security-tracker.debian.org/tracker/CVE-2009-2699   
                        apache | CVE-2010-0408    | https://security-tracker.debian.org/tracker/CVE-2010-0408   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2010-0434    | https://security-tracker.debian.org/tracker/CVE-2010-0434   
                        apache | CVE-2010-1452    | https://security-tracker.debian.org/tracker/CVE-2010-1452   
                        apache | CVE-2014-0231    | https://security-tracker.debian.org/tracker/CVE-2014-0231   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2022-27607   | https://security-tracker.debian.org/tracker/CVE-2022-27607  
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2021-45078   | https://security-tracker.debian.org/tracker/CVE-2021-45078  
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                       busybox | CVE-2022-28391   | https://security-tracker.debian.org/tracker/CVE-2022-28391  
                       busybox | CVE-2022-30065   | https://security-tracker.debian.org/tracker/CVE-2022-30065  
                         cairo | CVE-2019-6461    | https://security-tracker.debian.org/tracker/CVE-2019-6461   
                         cairo | CVE-2019-6462    | https://security-tracker.debian.org/tracker/CVE-2019-6462   
                         cairo | CVE-2020-35492   | https://security-tracker.debian.org/tracker/CVE-2020-35492  
                        clamav | CVE-2016-1405    | https://security-tracker.debian.org/tracker/CVE-2016-1405   
                       connman | CVE-2022-32292   | https://security-tracker.debian.org/tracker/CVE-2022-32292  
                       connman | CVE-2022-32293   | https://security-tracker.debian.org/tracker/CVE-2022-32293  
                    containerd | CVE-2022-31030   | https://security-tracker.debian.org/tracker/CVE-2022-31030  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                      cryptopp | CVE-2021-43398   | https://security-tracker.debian.org/tracker/CVE-2021-43398  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                     darkhttpd | CVE-2020-25691   | https://security-tracker.debian.org/tracker/CVE-2020-25691  
                       dnsmasq | CVE-2021-45951   | https://security-tracker.debian.org/tracker/CVE-2021-45951  
                       dnsmasq | CVE-2021-45952   | https://security-tracker.debian.org/tracker/CVE-2021-45952  
                       dnsmasq | CVE-2021-45953   | https://security-tracker.debian.org/tracker/CVE-2021-45953  
                       dnsmasq | CVE-2021-45954   | https://security-tracker.debian.org/tracker/CVE-2021-45954  
                       dnsmasq | CVE-2021-45955   | https://security-tracker.debian.org/tracker/CVE-2021-45955  
                       dnsmasq | CVE-2021-45956   | https://security-tracker.debian.org/tracker/CVE-2021-45956  
                       dnsmasq | CVE-2021-45957   | https://security-tracker.debian.org/tracker/CVE-2021-45957  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                       dovecot | CVE-2022-30550   | https://security-tracker.debian.org/tracker/CVE-2022-30550  
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                        erlang | CVE-2020-35733   | https://security-tracker.debian.org/tracker/CVE-2020-35733  
                         exfat | CVE-2022-29973   | https://security-tracker.debian.org/tracker/CVE-2022-29973  
                          exim | CVE-2020-28017   | https://security-tracker.debian.org/tracker/CVE-2020-28017  
                          exim | CVE-2022-37451   | https://security-tracker.debian.org/tracker/CVE-2022-37451  
                         exiv2 | CVE-2007-6353    | https://security-tracker.debian.org/tracker/CVE-2007-6353   
                        ffmpeg | CVE-2021-38291   | https://security-tracker.debian.org/tracker/CVE-2021-38291  
                      freetype | CVE-2022-27404   | https://security-tracker.debian.org/tracker/CVE-2022-27404  
                      freetype | CVE-2022-27405   | https://security-tracker.debian.org/tracker/CVE-2022-27405  
                      freetype | CVE-2022-27406   | https://security-tracker.debian.org/tracker/CVE-2022-27406  
                    gdk-pixbuf | CVE-2021-46829   | https://security-tracker.debian.org/tracker/CVE-2021-46829  
                        giflib | CVE-2022-28506   | https://security-tracker.debian.org/tracker/CVE-2022-28506  
                           git | CVE-2022-24765   | https://security-tracker.debian.org/tracker/CVE-2022-24765  
                           git | CVE-2022-24975   | https://security-tracker.debian.org/tracker/CVE-2022-24975  
                           git | CVE-2022-29187   | https://security-tracker.debian.org/tracker/CVE-2022-29187  
                         glibc | CVE-2010-4756    | https://security-tracker.debian.org/tracker/CVE-2010-4756   
                         glibc | CVE-2019-1010022 | https://security-tracker.debian.org/tracker/CVE-2019-1010022
                         glibc | CVE-2019-1010023 | https://security-tracker.debian.org/tracker/CVE-2019-1010023
                         glibc | CVE-2019-1010024 | https://security-tracker.debian.org/tracker/CVE-2019-1010024
                         glibc | CVE-2019-1010025 | https://security-tracker.debian.org/tracker/CVE-2019-1010025
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                        gnutls | CVE-2022-2509    | https://security-tracker.debian.org/tracker/CVE-2022-2509   
                            go | CVE-2020-29509   | https://security-tracker.debian.org/tracker/CVE-2020-29509  
                            go | CVE-2020-29511   | https://security-tracker.debian.org/tracker/CVE-2020-29511  
                            go | CVE-2022-1705    | https://security-tracker.debian.org/tracker/CVE-2022-1705   
                            go | CVE-2022-1962    | https://security-tracker.debian.org/tracker/CVE-2022-1962   
                            go | CVE-2022-28131   | https://security-tracker.debian.org/tracker/CVE-2022-28131  
                            go | CVE-2022-30630   | https://security-tracker.debian.org/tracker/CVE-2022-30630  
                            go | CVE-2022-30631   | https://security-tracker.debian.org/tracker/CVE-2022-30631  
                            go | CVE-2022-30632   | https://security-tracker.debian.org/tracker/CVE-2022-30632  
                            go | CVE-2022-30633   | https://security-tracker.debian.org/tracker/CVE-2022-30633  
                            go | CVE-2022-30635   | https://security-tracker.debian.org/tracker/CVE-2022-30635  
                            go | CVE-2022-32148   | https://security-tracker.debian.org/tracker/CVE-2022-32148  
                            go | CVE-2022-32189   | https://security-tracker.debian.org/tracker/CVE-2022-32189  
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                         grub2 | CVE-2021-3981    | https://security-tracker.debian.org/tracker/CVE-2021-3981   
                         grub2 | CVE-2021-46705   | https://security-tracker.debian.org/tracker/CVE-2021-46705  
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2022-0711    | https://security-tracker.debian.org/tracker/CVE-2022-0711   
                heirloom-mailx | CVE-2004-2771    | https://security-tracker.debian.org/tracker/CVE-2004-2771   
                   imagemagick | CVE-2007-1667    | https://security-tracker.debian.org/tracker/CVE-2007-1667   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2017-5509    | https://security-tracker.debian.org/tracker/CVE-2017-5509   
                   imagemagick | CVE-2017-5510    | https://security-tracker.debian.org/tracker/CVE-2017-5510   
                   imagemagick | CVE-2017-5511    | https://security-tracker.debian.org/tracker/CVE-2017-5511   
                   imagemagick | CVE-2022-1114    | https://security-tracker.debian.org/tracker/CVE-2022-1114   
                   imagemagick | CVE-2022-2719    | https://security-tracker.debian.org/tracker/CVE-2022-2719   
                   imagemagick | CVE-2022-32545   | https://security-tracker.debian.org/tracker/CVE-2022-32545  
                   imagemagick | CVE-2022-32546   | https://security-tracker.debian.org/tracker/CVE-2022-32546  
                   imagemagick | CVE-2022-32547   | https://security-tracker.debian.org/tracker/CVE-2022-32547  
                        jasper | CVE-2015-8751    | https://security-tracker.debian.org/tracker/CVE-2015-8751   
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                        libbpf | CVE-2021-45940   | https://security-tracker.debian.org/tracker/CVE-2021-45940  
                        libbpf | CVE-2021-45941   | https://security-tracker.debian.org/tracker/CVE-2021-45941  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                       libkrb5 | CVE-2009-0846    | https://security-tracker.debian.org/tracker/CVE-2009-0846   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libmpeg2 | CVE-2022-37416   | https://security-tracker.debian.org/tracker/CVE-2022-37416  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libtirpc | CVE-2021-46828   | https://security-tracker.debian.org/tracker/CVE-2021-46828  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                       libxml2 | CVE-2016-3709    | https://security-tracker.debian.org/tracker/CVE-2016-3709   
                       libxslt | CVE-2022-29824   | https://security-tracker.debian.org/tracker/CVE-2022-29824  
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2020-15888   | https://security-tracker.debian.org/tracker/CVE-2020-15888  
                           lua | CVE-2020-15945   | https://security-tracker.debian.org/tracker/CVE-2020-15945  
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                       mbedtls | CVE-2022-35409   | https://security-tracker.debian.org/tracker/CVE-2022-35409  
                        mender | CVE-2022-29555   | https://security-tracker.debian.org/tracker/CVE-2022-29555  
                      minetest | CVE-2022-35978   | https://security-tracker.debian.org/tracker/CVE-2022-35978  
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-18381   | https://security-tracker.debian.org/tracker/CVE-2017-18381  
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          nasm | CVE-2020-18974   | https://security-tracker.debian.org/tracker/CVE-2020-18974  
                       ncurses | CVE-2021-39537   | https://security-tracker.debian.org/tracker/CVE-2021-39537  
                       ncurses | CVE-2022-29458   | https://security-tracker.debian.org/tracker/CVE-2022-29458  
                         nginx | CVE-2021-3618    | https://security-tracker.debian.org/tracker/CVE-2021-3618   
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2013-0169    | https://security-tracker.debian.org/tracker/CVE-2013-0169   
                       openjdk | CVE-2022-21540   | https://security-tracker.debian.org/tracker/CVE-2022-21540  
                       openjdk | CVE-2022-21541   | https://security-tracker.debian.org/tracker/CVE-2022-21541  
                       openjdk | CVE-2022-34169   | https://security-tracker.debian.org/tracker/CVE-2022-34169  
                      openjpeg | CVE-2015-1239    | https://security-tracker.debian.org/tracker/CVE-2015-1239   
                      openjpeg | CVE-2016-9675    | https://security-tracker.debian.org/tracker/CVE-2016-9675   
                      openldap | CVE-2015-3276    | https://security-tracker.debian.org/tracker/CVE-2015-3276   
                      openldap | CVE-2022-29155   | https://security-tracker.debian.org/tracker/CVE-2022-29155  
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                          opus | CVE-2022-25345   | https://security-tracker.debian.org/tracker/CVE-2022-25345  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                        polkit | CVE-2021-4034    | https://security-tracker.debian.org/tracker/CVE-2021-4034   
                    postgresql | CVE-2017-8806    | https://security-tracker.debian.org/tracker/CVE-2017-8806   
                    postgresql | CVE-2022-2625    | https://security-tracker.debian.org/tracker/CVE-2022-2625   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                          pppd | CVE-2018-11574   | https://security-tracker.debian.org/tracker/CVE-2018-11574  
                python-aiohttp | CVE-2022-33124   | https://security-tracker.debian.org/tracker/CVE-2022-33124  
                 python-django | CVE-2022-36359   | https://security-tracker.debian.org/tracker/CVE-2022-36359  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
                    python-pip | CVE-2018-20225   | https://security-tracker.debian.org/tracker/CVE-2018-20225  
                  python-pyjwt | CVE-2022-29217   | https://security-tracker.debian.org/tracker/CVE-2022-29217  
                python-twisted | CVE-2022-24801   | https://security-tracker.debian.org/tracker/CVE-2022-24801  
                 python-web2py | CVE-2022-33146   | https://security-tracker.debian.org/tracker/CVE-2022-33146  
               python-werkzeug | CVE-2022-29361   | https://security-tracker.debian.org/tracker/CVE-2022-29361  
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2021-3611    | https://security-tracker.debian.org/tracker/CVE-2021-3611   
                          qemu | CVE-2021-3750    | https://security-tracker.debian.org/tracker/CVE-2021-3750   
                          qemu | CVE-2021-3947    | https://security-tracker.debian.org/tracker/CVE-2021-3947   
                          qemu | CVE-2021-4206    | https://security-tracker.debian.org/tracker/CVE-2021-4206   
                          qemu | CVE-2021-4207    | https://security-tracker.debian.org/tracker/CVE-2021-4207   
                          qemu | CVE-2022-1050    | https://security-tracker.debian.org/tracker/CVE-2022-1050   
                          qemu | CVE-2022-26353   | https://security-tracker.debian.org/tracker/CVE-2022-26353  
                          qemu | CVE-2022-26354   | https://security-tracker.debian.org/tracker/CVE-2022-26354  
                          qemu | CVE-2022-35414   | https://security-tracker.debian.org/tracker/CVE-2022-35414  
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
               rabbitmq-server | CVE-2020-5419    | https://security-tracker.debian.org/tracker/CVE-2020-5419   
               rabbitmq-server | CVE-2021-22116   | https://security-tracker.debian.org/tracker/CVE-2021-22116  
               rabbitmq-server | CVE-2021-22117   | https://security-tracker.debian.org/tracker/CVE-2021-22117  
               rabbitmq-server | CVE-2021-32718   | https://security-tracker.debian.org/tracker/CVE-2021-32718  
               rabbitmq-server | CVE-2021-32719   | https://security-tracker.debian.org/tracker/CVE-2021-32719  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                         rsync | CVE-2022-29154   | https://security-tracker.debian.org/tracker/CVE-2022-29154  
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-1050    | https://security-tracker.debian.org/tracker/CVE-2018-1050   
                        samba4 | CVE-2018-1057    | https://security-tracker.debian.org/tracker/CVE-2018-1057   
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2020-14409   | https://security-tracker.debian.org/tracker/CVE-2020-14409  
                           sdl | CVE-2020-14410   | https://security-tracker.debian.org/tracker/CVE-2020-14410  
                           sdl | CVE-2022-34568   | https://security-tracker.debian.org/tracker/CVE-2022-34568  
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                        sqlite | CVE-2022-35737   | https://security-tracker.debian.org/tracker/CVE-2022-35737  
                         squid | CVE-2021-46784   | https://security-tracker.debian.org/tracker/CVE-2021-46784  
                     tcpreplay | CVE-2022-25484   | https://security-tracker.debian.org/tracker/CVE-2022-25484  
                     tcpreplay | CVE-2022-27416   | https://security-tracker.debian.org/tracker/CVE-2022-27416  
                     tcpreplay | CVE-2022-27418   | https://security-tracker.debian.org/tracker/CVE-2022-27418  
                     tcpreplay | CVE-2022-27939   | https://security-tracker.debian.org/tracker/CVE-2022-27939  
                     tcpreplay | CVE-2022-27940   | https://security-tracker.debian.org/tracker/CVE-2022-27940  
                     tcpreplay | CVE-2022-27941   | https://security-tracker.debian.org/tracker/CVE-2022-27941  
                     tcpreplay | CVE-2022-27942   | https://security-tracker.debian.org/tracker/CVE-2022-27942  
                     tcpreplay | CVE-2022-28487   | https://security-tracker.debian.org/tracker/CVE-2022-28487  
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2022-2056    | https://security-tracker.debian.org/tracker/CVE-2022-2056   
                          tiff | CVE-2022-2057    | https://security-tracker.debian.org/tracker/CVE-2022-2057   
                          tiff | CVE-2022-2058    | https://security-tracker.debian.org/tracker/CVE-2022-2058   
                          tiff | CVE-2022-2867    | https://security-tracker.debian.org/tracker/CVE-2022-2867   
                          tiff | CVE-2022-2868    | https://security-tracker.debian.org/tracker/CVE-2022-2868   
                          tiff | CVE-2022-2869    | https://security-tracker.debian.org/tracker/CVE-2022-2869   
                          tiff | CVE-2022-34526   | https://security-tracker.debian.org/tracker/CVE-2022-34526  
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                       unbound | CVE-2022-30698   | https://security-tracker.debian.org/tracker/CVE-2022-30698  
                       unbound | CVE-2022-30699   | https://security-tracker.debian.org/tracker/CVE-2022-30699  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2022-0529    | https://security-tracker.debian.org/tracker/CVE-2022-0529   
                         unzip | CVE-2022-0530    | https://security-tracker.debian.org/tracker/CVE-2022-0530   
                      usbguard | CVE-2019-25058   | https://security-tracker.debian.org/tracker/CVE-2019-25058  
                  v4l2loopback | CVE-2022-2652    | https://security-tracker.debian.org/tracker/CVE-2022-2652   
                           vim | CVE-2022-2257    | https://security-tracker.debian.org/tracker/CVE-2022-2257   
                           vim | CVE-2022-2264    | https://security-tracker.debian.org/tracker/CVE-2022-2264   
                           vim | CVE-2022-2284    | https://security-tracker.debian.org/tracker/CVE-2022-2284   
                           vim | CVE-2022-2285    | https://security-tracker.debian.org/tracker/CVE-2022-2285   
                           vim | CVE-2022-2286    | https://security-tracker.debian.org/tracker/CVE-2022-2286   
                           vim | CVE-2022-2287    | https://security-tracker.debian.org/tracker/CVE-2022-2287   
                           vim | CVE-2022-2288    | https://security-tracker.debian.org/tracker/CVE-2022-2288   
                           vim | CVE-2022-2289    | https://security-tracker.debian.org/tracker/CVE-2022-2289   
                           vim | CVE-2022-2304    | https://security-tracker.debian.org/tracker/CVE-2022-2304   
                           vim | CVE-2022-2343    | https://security-tracker.debian.org/tracker/CVE-2022-2343   
                           vim | CVE-2022-2344    | https://security-tracker.debian.org/tracker/CVE-2022-2344   
                           vim | CVE-2022-2345    | https://security-tracker.debian.org/tracker/CVE-2022-2345   
                           vim | CVE-2022-2522    | https://security-tracker.debian.org/tracker/CVE-2022-2522   
                           vim | CVE-2022-2571    | https://security-tracker.debian.org/tracker/CVE-2022-2571   
                           vim | CVE-2022-2580    | https://security-tracker.debian.org/tracker/CVE-2022-2580   
                           vim | CVE-2022-2581    | https://security-tracker.debian.org/tracker/CVE-2022-2581   
                           vim | CVE-2022-2598    | https://security-tracker.debian.org/tracker/CVE-2022-2598   
                           vim | CVE-2022-2816    | https://security-tracker.debian.org/tracker/CVE-2022-2816   
                           vim | CVE-2022-2817    | https://security-tracker.debian.org/tracker/CVE-2022-2817   
                           vim | CVE-2022-2819    | https://security-tracker.debian.org/tracker/CVE-2022-2819   
                           vim | CVE-2022-2845    | https://security-tracker.debian.org/tracker/CVE-2022-2845   
                           vim | CVE-2022-2849    | https://security-tracker.debian.org/tracker/CVE-2022-2849   
                           vim | CVE-2022-2862    | https://security-tracker.debian.org/tracker/CVE-2022-2862   
                           vim | CVE-2022-2874    | https://security-tracker.debian.org/tracker/CVE-2022-2874   
                           vim | CVE-2022-2889    | https://security-tracker.debian.org/tracker/CVE-2022-2889   
                       wavpack | CVE-2022-2476    | https://security-tracker.debian.org/tracker/CVE-2022-2476   
                     webkitgtk | CVE-2022-2294    | https://security-tracker.debian.org/tracker/CVE-2022-2294   
                       wolfssl | CVE-2022-34293   | https://security-tracker.debian.org/tracker/CVE-2022-34293  
                     wpewebkit | CVE-2022-2294    | https://security-tracker.debian.org/tracker/CVE-2022-2294   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28038   | https://security-tracker.debian.org/tracker/CVE-2021-28038  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                  xscreensaver | CVE-2021-34557   | https://security-tracker.debian.org/tracker/CVE-2021-34557  
                          yasm | CVE-2021-33454   | https://security-tracker.debian.org/tracker/CVE-2021-33454  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

CVEs for the '2022.05.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-4465    | https://security-tracker.debian.org/tracker/CVE-2007-4465   
                        apache | CVE-2007-5000    | https://security-tracker.debian.org/tracker/CVE-2007-5000   
                        apache | CVE-2007-6388    | https://security-tracker.debian.org/tracker/CVE-2007-6388   
                        apache | CVE-2007-6420    | https://security-tracker.debian.org/tracker/CVE-2007-6420   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-0455    | https://security-tracker.debian.org/tracker/CVE-2008-0455   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2008-2939    | https://security-tracker.debian.org/tracker/CVE-2008-2939   
                        apache | CVE-2009-1195    | https://security-tracker.debian.org/tracker/CVE-2009-1195   
                        apache | CVE-2009-1890    | https://security-tracker.debian.org/tracker/CVE-2009-1890   
                        apache | CVE-2009-1891    | https://security-tracker.debian.org/tracker/CVE-2009-1891   
                        apache | CVE-2009-2699    | https://security-tracker.debian.org/tracker/CVE-2009-2699   
                        apache | CVE-2010-0408    | https://security-tracker.debian.org/tracker/CVE-2010-0408   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2010-0434    | https://security-tracker.debian.org/tracker/CVE-2010-0434   
                        apache | CVE-2010-1452    | https://security-tracker.debian.org/tracker/CVE-2010-1452   
                        apache | CVE-2014-0231    | https://security-tracker.debian.org/tracker/CVE-2014-0231   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2022-27607   | https://security-tracker.debian.org/tracker/CVE-2022-27607  
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2021-45078   | https://security-tracker.debian.org/tracker/CVE-2021-45078  
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                       busybox | CVE-2022-28391   | https://security-tracker.debian.org/tracker/CVE-2022-28391  
                       busybox | CVE-2022-30065   | https://security-tracker.debian.org/tracker/CVE-2022-30065  
                         cairo | CVE-2019-6461    | https://security-tracker.debian.org/tracker/CVE-2019-6461   
                         cairo | CVE-2019-6462    | https://security-tracker.debian.org/tracker/CVE-2019-6462   
                         cairo | CVE-2020-35492   | https://security-tracker.debian.org/tracker/CVE-2020-35492  
                        clamav | CVE-2016-1405    | https://security-tracker.debian.org/tracker/CVE-2016-1405   
                       connman | CVE-2022-32292   | https://security-tracker.debian.org/tracker/CVE-2022-32292  
                       connman | CVE-2022-32293   | https://security-tracker.debian.org/tracker/CVE-2022-32293  
                    containerd | CVE-2022-31030   | https://security-tracker.debian.org/tracker/CVE-2022-31030  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                      cryptopp | CVE-2021-43398   | https://security-tracker.debian.org/tracker/CVE-2021-43398  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                     darkhttpd | CVE-2020-25691   | https://security-tracker.debian.org/tracker/CVE-2020-25691  
                       dnsmasq | CVE-2021-45951   | https://security-tracker.debian.org/tracker/CVE-2021-45951  
                       dnsmasq | CVE-2021-45952   | https://security-tracker.debian.org/tracker/CVE-2021-45952  
                       dnsmasq | CVE-2021-45953   | https://security-tracker.debian.org/tracker/CVE-2021-45953  
                       dnsmasq | CVE-2021-45954   | https://security-tracker.debian.org/tracker/CVE-2021-45954  
                       dnsmasq | CVE-2021-45955   | https://security-tracker.debian.org/tracker/CVE-2021-45955  
                       dnsmasq | CVE-2021-45956   | https://security-tracker.debian.org/tracker/CVE-2021-45956  
                       dnsmasq | CVE-2021-45957   | https://security-tracker.debian.org/tracker/CVE-2021-45957  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                       dovecot | CVE-2022-30550   | https://security-tracker.debian.org/tracker/CVE-2022-30550  
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                        erlang | CVE-2020-35733   | https://security-tracker.debian.org/tracker/CVE-2020-35733  
                         exfat | CVE-2022-29973   | https://security-tracker.debian.org/tracker/CVE-2022-29973  
                          exim | CVE-2020-28017   | https://security-tracker.debian.org/tracker/CVE-2020-28017  
                          exim | CVE-2022-37451   | https://security-tracker.debian.org/tracker/CVE-2022-37451  
                         exiv2 | CVE-2007-6353    | https://security-tracker.debian.org/tracker/CVE-2007-6353   
                        ffmpeg | CVE-2021-38291   | https://security-tracker.debian.org/tracker/CVE-2021-38291  
                    gdk-pixbuf | CVE-2021-46829   | https://security-tracker.debian.org/tracker/CVE-2021-46829  
                        giflib | CVE-2022-28506   | https://security-tracker.debian.org/tracker/CVE-2022-28506  
                           git | CVE-2022-24765   | https://security-tracker.debian.org/tracker/CVE-2022-24765  
                           git | CVE-2022-24975   | https://security-tracker.debian.org/tracker/CVE-2022-24975  
                           git | CVE-2022-29187   | https://security-tracker.debian.org/tracker/CVE-2022-29187  
                         glibc | CVE-2010-4756    | https://security-tracker.debian.org/tracker/CVE-2010-4756   
                         glibc | CVE-2019-1010022 | https://security-tracker.debian.org/tracker/CVE-2019-1010022
                         glibc | CVE-2019-1010023 | https://security-tracker.debian.org/tracker/CVE-2019-1010023
                         glibc | CVE-2019-1010024 | https://security-tracker.debian.org/tracker/CVE-2019-1010024
                         glibc | CVE-2019-1010025 | https://security-tracker.debian.org/tracker/CVE-2019-1010025
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                        gnutls | CVE-2022-2509    | https://security-tracker.debian.org/tracker/CVE-2022-2509   
                            go | CVE-2020-29509   | https://security-tracker.debian.org/tracker/CVE-2020-29509  
                            go | CVE-2020-29511   | https://security-tracker.debian.org/tracker/CVE-2020-29511  
                            go | CVE-2022-1705    | https://security-tracker.debian.org/tracker/CVE-2022-1705   
                            go | CVE-2022-1962    | https://security-tracker.debian.org/tracker/CVE-2022-1962   
                            go | CVE-2022-28131   | https://security-tracker.debian.org/tracker/CVE-2022-28131  
                            go | CVE-2022-30630   | https://security-tracker.debian.org/tracker/CVE-2022-30630  
                            go | CVE-2022-30631   | https://security-tracker.debian.org/tracker/CVE-2022-30631  
                            go | CVE-2022-30632   | https://security-tracker.debian.org/tracker/CVE-2022-30632  
                            go | CVE-2022-30633   | https://security-tracker.debian.org/tracker/CVE-2022-30633  
                            go | CVE-2022-30635   | https://security-tracker.debian.org/tracker/CVE-2022-30635  
                            go | CVE-2022-32148   | https://security-tracker.debian.org/tracker/CVE-2022-32148  
                            go | CVE-2022-32189   | https://security-tracker.debian.org/tracker/CVE-2022-32189  
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                         grub2 | CVE-2021-3981    | https://security-tracker.debian.org/tracker/CVE-2021-3981   
                         grub2 | CVE-2021-46705   | https://security-tracker.debian.org/tracker/CVE-2021-46705  
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2022-0711    | https://security-tracker.debian.org/tracker/CVE-2022-0711   
                heirloom-mailx | CVE-2004-2771    | https://security-tracker.debian.org/tracker/CVE-2004-2771   
                   imagemagick | CVE-2007-1667    | https://security-tracker.debian.org/tracker/CVE-2007-1667   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2017-5509    | https://security-tracker.debian.org/tracker/CVE-2017-5509   
                   imagemagick | CVE-2017-5510    | https://security-tracker.debian.org/tracker/CVE-2017-5510   
                   imagemagick | CVE-2017-5511    | https://security-tracker.debian.org/tracker/CVE-2017-5511   
                   imagemagick | CVE-2022-1114    | https://security-tracker.debian.org/tracker/CVE-2022-1114   
                   imagemagick | CVE-2022-2719    | https://security-tracker.debian.org/tracker/CVE-2022-2719   
                   imagemagick | CVE-2022-32545   | https://security-tracker.debian.org/tracker/CVE-2022-32545  
                   imagemagick | CVE-2022-32546   | https://security-tracker.debian.org/tracker/CVE-2022-32546  
                   imagemagick | CVE-2022-32547   | https://security-tracker.debian.org/tracker/CVE-2022-32547  
                        jasper | CVE-2015-8751    | https://security-tracker.debian.org/tracker/CVE-2015-8751   
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                       libkrb5 | CVE-2009-0846    | https://security-tracker.debian.org/tracker/CVE-2009-0846   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libmpeg2 | CVE-2022-37416   | https://security-tracker.debian.org/tracker/CVE-2022-37416  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libtirpc | CVE-2021-46828   | https://security-tracker.debian.org/tracker/CVE-2021-46828  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                       libxml2 | CVE-2016-3709    | https://security-tracker.debian.org/tracker/CVE-2016-3709   
                       libxslt | CVE-2022-29824   | https://security-tracker.debian.org/tracker/CVE-2022-29824  
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2020-15888   | https://security-tracker.debian.org/tracker/CVE-2020-15888  
                           lua | CVE-2020-15945   | https://security-tracker.debian.org/tracker/CVE-2020-15945  
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                       mbedtls | CVE-2022-35409   | https://security-tracker.debian.org/tracker/CVE-2022-35409  
                        mender | CVE-2022-29555   | https://security-tracker.debian.org/tracker/CVE-2022-29555  
                      minetest | CVE-2022-35978   | https://security-tracker.debian.org/tracker/CVE-2022-35978  
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-18381   | https://security-tracker.debian.org/tracker/CVE-2017-18381  
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          nasm | CVE-2020-18974   | https://security-tracker.debian.org/tracker/CVE-2020-18974  
                       ncurses | CVE-2021-39537   | https://security-tracker.debian.org/tracker/CVE-2021-39537  
                       ncurses | CVE-2022-29458   | https://security-tracker.debian.org/tracker/CVE-2022-29458  
                         nginx | CVE-2021-3618    | https://security-tracker.debian.org/tracker/CVE-2021-3618   
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2013-0169    | https://security-tracker.debian.org/tracker/CVE-2013-0169   
                       openjdk | CVE-2022-21540   | https://security-tracker.debian.org/tracker/CVE-2022-21540  
                       openjdk | CVE-2022-21541   | https://security-tracker.debian.org/tracker/CVE-2022-21541  
                       openjdk | CVE-2022-34169   | https://security-tracker.debian.org/tracker/CVE-2022-34169  
                      openjpeg | CVE-2015-1239    | https://security-tracker.debian.org/tracker/CVE-2015-1239   
                      openjpeg | CVE-2016-9675    | https://security-tracker.debian.org/tracker/CVE-2016-9675   
                      openldap | CVE-2015-3276    | https://security-tracker.debian.org/tracker/CVE-2015-3276   
                      openldap | CVE-2022-29155   | https://security-tracker.debian.org/tracker/CVE-2022-29155  
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                          opus | CVE-2022-25345   | https://security-tracker.debian.org/tracker/CVE-2022-25345  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                        polkit | CVE-2021-4034    | https://security-tracker.debian.org/tracker/CVE-2021-4034   
                    postgresql | CVE-2017-8806    | https://security-tracker.debian.org/tracker/CVE-2017-8806   
                    postgresql | CVE-2022-2625    | https://security-tracker.debian.org/tracker/CVE-2022-2625   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                          pppd | CVE-2018-11574   | https://security-tracker.debian.org/tracker/CVE-2018-11574  
                python-aiohttp | CVE-2022-33124   | https://security-tracker.debian.org/tracker/CVE-2022-33124  
                 python-django | CVE-2022-36359   | https://security-tracker.debian.org/tracker/CVE-2022-36359  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
                    python-pip | CVE-2018-20225   | https://security-tracker.debian.org/tracker/CVE-2018-20225  
                  python-pyjwt | CVE-2022-29217   | https://security-tracker.debian.org/tracker/CVE-2022-29217  
                python-twisted | CVE-2022-24801   | https://security-tracker.debian.org/tracker/CVE-2022-24801  
                 python-web2py | CVE-2022-33146   | https://security-tracker.debian.org/tracker/CVE-2022-33146  
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2022-35414   | https://security-tracker.debian.org/tracker/CVE-2022-35414  
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
               rabbitmq-server | CVE-2020-5419    | https://security-tracker.debian.org/tracker/CVE-2020-5419   
               rabbitmq-server | CVE-2021-22116   | https://security-tracker.debian.org/tracker/CVE-2021-22116  
               rabbitmq-server | CVE-2021-22117   | https://security-tracker.debian.org/tracker/CVE-2021-22117  
               rabbitmq-server | CVE-2021-32718   | https://security-tracker.debian.org/tracker/CVE-2021-32718  
               rabbitmq-server | CVE-2021-32719   | https://security-tracker.debian.org/tracker/CVE-2021-32719  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                         rsync | CVE-2022-29154   | https://security-tracker.debian.org/tracker/CVE-2022-29154  
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-1050    | https://security-tracker.debian.org/tracker/CVE-2018-1050   
                        samba4 | CVE-2018-1057    | https://security-tracker.debian.org/tracker/CVE-2018-1057   
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2020-14409   | https://security-tracker.debian.org/tracker/CVE-2020-14409  
                           sdl | CVE-2020-14410   | https://security-tracker.debian.org/tracker/CVE-2020-14410  
                           sdl | CVE-2022-34568   | https://security-tracker.debian.org/tracker/CVE-2022-34568  
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                        sqlite | CVE-2022-35737   | https://security-tracker.debian.org/tracker/CVE-2022-35737  
                         squid | CVE-2021-46784   | https://security-tracker.debian.org/tracker/CVE-2021-46784  
                     tcpreplay | CVE-2022-25484   | https://security-tracker.debian.org/tracker/CVE-2022-25484  
                     tcpreplay | CVE-2022-27416   | https://security-tracker.debian.org/tracker/CVE-2022-27416  
                     tcpreplay | CVE-2022-27418   | https://security-tracker.debian.org/tracker/CVE-2022-27418  
                     tcpreplay | CVE-2022-27939   | https://security-tracker.debian.org/tracker/CVE-2022-27939  
                     tcpreplay | CVE-2022-27940   | https://security-tracker.debian.org/tracker/CVE-2022-27940  
                     tcpreplay | CVE-2022-27941   | https://security-tracker.debian.org/tracker/CVE-2022-27941  
                     tcpreplay | CVE-2022-27942   | https://security-tracker.debian.org/tracker/CVE-2022-27942  
                     tcpreplay | CVE-2022-28487   | https://security-tracker.debian.org/tracker/CVE-2022-28487  
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2022-2056    | https://security-tracker.debian.org/tracker/CVE-2022-2056   
                          tiff | CVE-2022-2057    | https://security-tracker.debian.org/tracker/CVE-2022-2057   
                          tiff | CVE-2022-2058    | https://security-tracker.debian.org/tracker/CVE-2022-2058   
                          tiff | CVE-2022-2867    | https://security-tracker.debian.org/tracker/CVE-2022-2867   
                          tiff | CVE-2022-2868    | https://security-tracker.debian.org/tracker/CVE-2022-2868   
                          tiff | CVE-2022-2869    | https://security-tracker.debian.org/tracker/CVE-2022-2869   
                          tiff | CVE-2022-34526   | https://security-tracker.debian.org/tracker/CVE-2022-34526  
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                       unbound | CVE-2022-30698   | https://security-tracker.debian.org/tracker/CVE-2022-30698  
                       unbound | CVE-2022-30699   | https://security-tracker.debian.org/tracker/CVE-2022-30699  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2022-0529    | https://security-tracker.debian.org/tracker/CVE-2022-0529   
                         unzip | CVE-2022-0530    | https://security-tracker.debian.org/tracker/CVE-2022-0530   
                  v4l2loopback | CVE-2022-2652    | https://security-tracker.debian.org/tracker/CVE-2022-2652   
                           vim | CVE-2022-2257    | https://security-tracker.debian.org/tracker/CVE-2022-2257   
                           vim | CVE-2022-2264    | https://security-tracker.debian.org/tracker/CVE-2022-2264   
                           vim | CVE-2022-2284    | https://security-tracker.debian.org/tracker/CVE-2022-2284   
                           vim | CVE-2022-2285    | https://security-tracker.debian.org/tracker/CVE-2022-2285   
                           vim | CVE-2022-2286    | https://security-tracker.debian.org/tracker/CVE-2022-2286   
                           vim | CVE-2022-2287    | https://security-tracker.debian.org/tracker/CVE-2022-2287   
                           vim | CVE-2022-2288    | https://security-tracker.debian.org/tracker/CVE-2022-2288   
                           vim | CVE-2022-2289    | https://security-tracker.debian.org/tracker/CVE-2022-2289   
                           vim | CVE-2022-2304    | https://security-tracker.debian.org/tracker/CVE-2022-2304   
                           vim | CVE-2022-2343    | https://security-tracker.debian.org/tracker/CVE-2022-2343   
                           vim | CVE-2022-2344    | https://security-tracker.debian.org/tracker/CVE-2022-2344   
                           vim | CVE-2022-2345    | https://security-tracker.debian.org/tracker/CVE-2022-2345   
                           vim | CVE-2022-2522    | https://security-tracker.debian.org/tracker/CVE-2022-2522   
                           vim | CVE-2022-2571    | https://security-tracker.debian.org/tracker/CVE-2022-2571   
                           vim | CVE-2022-2580    | https://security-tracker.debian.org/tracker/CVE-2022-2580   
                           vim | CVE-2022-2581    | https://security-tracker.debian.org/tracker/CVE-2022-2581   
                           vim | CVE-2022-2598    | https://security-tracker.debian.org/tracker/CVE-2022-2598   
                           vim | CVE-2022-2816    | https://security-tracker.debian.org/tracker/CVE-2022-2816   
                           vim | CVE-2022-2817    | https://security-tracker.debian.org/tracker/CVE-2022-2817   
                           vim | CVE-2022-2819    | https://security-tracker.debian.org/tracker/CVE-2022-2819   
                           vim | CVE-2022-2845    | https://security-tracker.debian.org/tracker/CVE-2022-2845   
                           vim | CVE-2022-2849    | https://security-tracker.debian.org/tracker/CVE-2022-2849   
                           vim | CVE-2022-2862    | https://security-tracker.debian.org/tracker/CVE-2022-2862   
                           vim | CVE-2022-2874    | https://security-tracker.debian.org/tracker/CVE-2022-2874   
                           vim | CVE-2022-2889    | https://security-tracker.debian.org/tracker/CVE-2022-2889   
                       wavpack | CVE-2022-2476    | https://security-tracker.debian.org/tracker/CVE-2022-2476   
                     webkitgtk | CVE-2022-2294    | https://security-tracker.debian.org/tracker/CVE-2022-2294   
                       wolfssl | CVE-2022-34293   | https://security-tracker.debian.org/tracker/CVE-2022-34293  
                     wpewebkit | CVE-2022-2294    | https://security-tracker.debian.org/tracker/CVE-2022-2294   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28038   | https://security-tracker.debian.org/tracker/CVE-2021-28038  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                          yasm | CVE-2021-33454   | https://security-tracker.debian.org/tracker/CVE-2021-33454  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
