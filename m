Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C4EC433F5
	for <buildroot@archiver.kernel.org>; Fri, 30 Sep 2022 05:32:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5222A40575;
	Fri, 30 Sep 2022 05:32:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5222A40575
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s6fOjEvS_RtK; Fri, 30 Sep 2022 05:32:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F01AB41190;
	Fri, 30 Sep 2022 05:32:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F01AB41190
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0F6741BF86D
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 05:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D347641D59
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 05:32:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D347641D59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q3Q42-F1Ufpg for <buildroot@lists.busybox.net>;
 Fri, 30 Sep 2022 05:32:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C272841D54
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C272841D54
 for <buildroot@buildroot.org>; Fri, 30 Sep 2022 05:32:36 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2427660003
 for <buildroot@buildroot.org>; Fri, 30 Sep 2022 05:32:34 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 30 Sep 2022 05:32:34 -0000
Message-Id: <20220930053240.D347641D59@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1664515954; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YtnorWptMMcjfWujwTQblkzzaSCfjUzoSSQmHxtFiGs=;
 b=P+BuE+pfjUoLIfgmZk2H7ApXwlg+/AOFf/WE84XxG42mdI8xugPlP5S3z79oxtCarqot/A
 G3Rue/Y2Ogr/cq/IEmuorjxUrzfQvUG649QaZYyUKQ3aUEBxyD8fJdr+SthKF79o0qtBJN
 euK0DxCe/z+AnLtPYlhtq5vsAJFRFyeX4eaBap6mOG9qOrnPq6kOlZUeiIn2akagZ9Fq4Z
 PASvJnOSP66Jmg2ZQHIiLbZuvlQ5mCNGGwHtm8MxTtOvsyXQBisCA+a/rYxUTy7TG1fP+J
 Ils1AaUXwKvs240PY4dLj0PaircFS3heYD46suP8czv+CVdiH/0QQWGj9sWN/w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=P+BuE+pf
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-09-29
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

Autobuild statistics for 2022-09-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  6  |  1  |  0  |  7  |
  2022.05.x  | 14  |  7  |  0  | 21  |
    master   | 143 | 275 |  0  | 418 |

Classification of failures by reason for master
-----------------------------------------------

            igd2-for-linux-2.1 | 18
                 sysvinit-2.99 | 17
                      crun-1.5 | 16
        host-sentry-cli-1.59.0 | 15
            host-binutils-2.38 | 14
                  autofs-5.1.8 | 11
glibc-2.36-44-g2628500f5dff... | 11
              libarchive-3.6.1 | 9 
dahdi-linux-5c840cf43838e06... | 7 
                gerbera-1.10.0 | 6 
                host-go-1.19.1 | 6 
                       unknown | 6 
                 linux-5.17.15 | 5 
            btrfs-progs-5.16.2 | 4 
                  gensio-2.5.2 | 4 
            host-binutils-2.39 | 3 
                   perl-5.34.1 | 3 
                 systemd-250.4 | 3 
                bitcoin-0.21.2 | 2 
                bpftool-v6.8.0 | 2 
                 dash-0.5.11.5 | 2 
        edk2-edk2-stable202102 | 2 
                elfutils-0.186 | 2 
             fontconfig-2.13.1 | 2 
fs/cpio/cpio.mk:117: /home/... | 2 
                   hdparm-9.63 | 2 
         host-gcc-final-10.4.0 | 2 
host-gdb-arc-2020.09-releas... | 2 
host-pahole-73383b3a39afe86... | 2 
                   json-c-0.16 | 2 
               libdeflate-1.12 | 2 
             libgpg-error-1.45 | 2 
                   libnss-3.83 | 2 
           linux-5.10.115-cip7 | 2 
                    lxc-4.0.12 | 2 
                  ntpsec-1_2_1 | 2 
                 syslinux-6.03 | 2 
                 zlib-ng-2.0.6 | 2 
/home/buildroot/autobuild/i... | 1 
                     ace-7.0.6 | 1 
afboot-stm32-3566acd582e553... | 1 
              alsa-lib-1.2.7.2 | 1 
              asterisk-16.25.2 | 1 
  binutils-arc-2020.09-release | 1 
                    brltty-6.4 | 1 
casync-4ad9bcb94bc83ff36cfc... | 1 
              containerd-1.6.8 | 1 
           crucible-2022.05.25 | 1 
                 dc3dd-7.2.641 | 1 
                    dhcp-4.4.3 | 1 
                 dmalloc-5.6.5 | 1 
docker-proxy-f6ccccb1c082a4... | 1 
                     efivar-37 | 1 
             f2fs-tools-1.15.0 | 1 
                      fio-3.28 | 1 
       freeradius-server-3.2.0 | 1 
fs/cpio/cpio.mk:117: /nvmed... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/yaffs2/yaffs2.mk:32: /nv... | 1 
              fstrcmp-0.7.D001 | 1 
  gobject-introspection-1.72.0 | 1 
                      grep-3.7 | 1 
           heirloom-mailx-12.5 | 1 
                 hiredis-1.0.2 | 1 
            host-binutils-2.37 | 1 
         host-gcc-final-11.3.0 | 1 
     host-moby-buildkit-0.10.0 | 1 
              host-rust-1.64.0 | 1 
host-spirv-llvm-translator-... | 1 
                   hwloc-2.8.0 | 1 
            igh-ethercat-1.5.2 | 1 
               ipmitool-1_8_19 | 1 
               libdcadec-0.2.0 | 1 
                    libev-4.33 | 1 
              libgcrypt-1.10.1 | 1 
               libglib2-2.72.3 | 1 
               libmdbx-0.11.11 | 1 
                    libndp-1.8 | 1 
                   libnl-3.6.0 | 1 
                   libqb-2.0.6 | 1 
              libsodium-1.0.18 | 1 
   libtorrent-rasterbar-1.2.15 | 1 
               lightning-2.1.3 | 1 
       linux-5.10.109-cip5-rt4 | 1 
                   linux-tools | 1 
            lttng-tools-2.13.2 | 1 
              memcached-1.6.16 | 1 
                mongodb-4.2.18 | 1 
                    mpv-0.33.1 | 1 
         mxs-bootlets-10.12.01 | 1 
                  ntp-4.2.8p15 | 1 
            ocf-linux-20120127 | 1 
              open62541-v1.3.3 | 1 
                 openal-1.22.0 | 1 
               openblas-0.3.21 | 1 
               openpgm-5-3-128 | 1 
   openvmtools-11.3.5-18557794 | 1 
                     php-8.1.9 | 1 
              procps-ng-3.3.17 | 1 
           python-numpy-1.21.2 | 1 
                  reaver-1.6.6 | 1 
rtl8723bu-d79a676a8d3f0bb6a... | 1 
             stress-ng-0.13.05 | 1 
                 sudo-1.9.11p2 | 1 
               tcf-agent-1.7.0 | 1 
toolchain-external-codescap... | 1 
             uccp420wlan-6.9.1 | 1 
uclibc-ng-test-0844445e7358... | 1 
                usbguard-1.1.1 | 1 
                 wavemon-0.9.4 | 1 
wireguard-linux-compat-1.0.... | 1 
                 wolfssl-5.5.0 | 1 
                xenomai-3.0.10 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/d3611e5830db1deca2193a779be55f974716cd38 |     
  sparc64    |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/2673edac4aeac012a1877be56e9b19bacdab8863 |     
    arm      | afboot-stm32-3566acd582e553... | NOK | http://autobuild.buildroot.net/results/24e87c9bf56f8bb8e7b6e0033a110fcee54a54a4 |     
    or1k     |        alsa-lib-1.2.7.2        | NOK | http://autobuild.buildroot.net/results/4635b338875988b7c0da2a2c996ffd02da2822a0 |     
    i686     |        asterisk-16.25.2        | NOK | http://autobuild.buildroot.net/results/309e88f9f143cfcaa91d8dfbdf588ccf1173886f |     
   s390x     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/2381ee0321e6c1cc4aab66b86ecbc858c7054f60 |     
  mips64el   |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/641c92b7cbc50e38f77d46ccb6cd4809869472c1 |     
  mips64el   |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/be403dac026c4eb47cac71972e93f501617c3227 |     
 aarch64_be  |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/f6ccb7cc2667319634668d5f255352a1e8700245 |     
   s390x     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/fa7b3226fe37e04d50de4166a901e93b8edd5eec |     
   nios2     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/7a3d65d89b114c58580bc0d3075973d1bfd6209f |     
   nios2     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/94b60aa99afbdd7e8feea0e0df277825fb65228f |     
   s390x     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/185f7d52d73e9faf4eb9d5a1e1889d87ada1cc1d |     
 microblaze  |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/62ab040b249b788a479aa842af8afbb60ebfd532 |     
    arm      |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/33cc8ff8967ed07a8dc3e0fc0b98fe670833cda4 |     
   x86_64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/799c3866eb3118195426d837560756dab04d5f36 |     
   arceb     |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/9014ec17289d8c33ab30b364d68772b76becfe92 |     
microblazeel |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/4d883abf94a78a03d14b09f53a83235d6a9cf710 |     
   arceb     |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/d57c2a28ec4d8e8dcdcff61ec1367d904ac584c4 |     
  sparc64    |         bpftool-v6.8.0         | NOK | http://autobuild.buildroot.net/results/ac76aa43e0e2eee8d9d3b126b2f2a993f14af289 |     
    i686     |         bpftool-v6.8.0         | NOK | http://autobuild.buildroot.net/results/027ac540e4c109e0f6127afec8762bd8b5ba3ae6 |     
  powerpc    |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/c0983c72ed48f0e0983d2543a8f24609ed78a5ab |     
   mips64    |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/4884d1b213d89969ea09efc3cc1609bc3c55e0e2 | ORPH
 aarch64_be  |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/aae1e343fd5ff3b52e7164cb4fc102e0b4e52d4c | ORPH
 aarch64_be  |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/707521041483756f3d9d3fa7878c13d3822b40d7 | ORPH
    or1k     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/5c0541354c76f8cd3e40e797e16e69a9736fc386 | ORPH
  sparc64    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/6c986133b525c1df3a455b953ffcaa7bc40022bf |     
   x86_64    |        containerd-1.6.8        | NOK | http://autobuild.buildroot.net/results/368adcc6f0ec1a8fe77b2bb4dd4f4f9344cda7f6 |     
    arm      |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/429bc5719e928dcb851a0a67a0ba419c9e73f43a |     
   sparc     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/ae35c920e12d423402c879e8ad805b829690b905 |     
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/371ad5198adc7de1e37acd3a38c7689b40445533 |     
   sh4eb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/cccf9551537c7bd0db34db337273ec76690cbb03 |     
 microblaze  |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/b1650dd9841424f2fdf343be542a8761bd255e0c |     
   x86_64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/0a6c7294238b72a03d18be6e30b958cd8082a626 |     
 microblaze  |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/1d3e7f4af66afa1a61cf18402abf09c7a40b6433 |     
  aarch64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/f169510c801df22b2ba7b91332e01e69755fedae |     
    or1k     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/763a8171c0ea403e128a4f8e0039c3b0cfbc3e36 |     
    i686     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/542d7ad83c752d7b81f74cbdbfcfb88806764aee |     
    or1k     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/348f694b82c69e15fc8b456c40852bab6b5a63e4 |     
   sparc     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/c15c2b9fa7c800cb36a246febf592df53831ba66 |     
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/a4a41a91b1c9fc65149dec682025ef48bc9ed345 |     
  mips64el   |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/5e26e9e69833c8e80a696e35eb38ff07bcec0361 |     
  sparc64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/8e27538f21633d901821063c866b6907831b1f68 |     
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/ce53eac5b071cb23d25157add6996c46de0c6949 |     
    m68k     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/5234c017443c6a5643cc560216cbce0f6a0fd79a |     
   arceb     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/8b9759aabc1d08b87ae6c8ca360ac50d3a7070e6 |     
microblazeel | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/958f276b41fb240478de2e3799f4d855d5d8853f |     
 aarch64_be  | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/1c590f2195fe400dc8eb3080c16418cf93cb904b |     
    or1k     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/230872a5ad18a0ae497023f993f6a896b90bdecf |     
    arc      | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/fc1bbcdf79c6ed5fbadf20eddf9ce3b5b70ad91d |     
 aarch64_be  | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/ac93663bb6e3625e6abf4e9579ec6254440be24d |     
 powerpc64   | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/7baf152b46a8f8834ffebea675b27f8fa3e767e7 |     
    sh4      |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/68ad0ccb303b3c5256ccf3392b6305073fa2123b | ORPH
    mips     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/09bd72a2d94f3dc3d0c240e061e4ca08453db809 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/3793090857d5e1eaecd9d76f66107d99a1d68c42 | ORPH
    sh4a     |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/58437782b054fa6a4c9c2574ff58e62f50f42486 | ORPH
    i686     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/334457213b10cafb86dd4109a469dfcb6c7d2968 | ORPH
   x86_64    | docker-proxy-f6ccccb1c082a4... | NOK | http://autobuild.buildroot.net/results/f43ec4285299f3e964da8e308d507d59729970e7 |     
  aarch64    |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/b0341417d396644a3b4a3225b7125b5a8a180bc0 |     
    i686     |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/165d642093bffed1ba7bf6de049791a9d286b3fc |     
   x86_64    |           efivar-37            | NOK | http://autobuild.buildroot.net/results/07db79617ff9743ce86a182c5fbd6fbfb496b8a9 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/83f04979921f80cc321c67c655470d2b36974006 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/e71b9b280e0bdbae805ffa48374202870489bb21 | ORPH
    or1k     |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/93c69fabc929571aeb91ed6acf7990b813b57c04 |     
    m68k     |            fio-3.28            | NOK | http://autobuild.buildroot.net/results/ca0088c1017fc1c2cae7a38458e30bffd89c7da0 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/21cfc551edd766bce3ad584ec5b2dcb5da067e86 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/d63dda28056cfa3a610b19e76385f8aef13ff489 | ORPH
   x86_64    |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/55b7e3576a40fef5ec5ef389170d4a66315e2327 |     
   nios2     | fs/cpio/cpio.mk:117: /home/... | NOK | http://autobuild.buildroot.net/results/dca5673c23ade326aea6d53be6ce03c5ee2d5c7b |     
  sparc64    | fs/cpio/cpio.mk:117: /home/... | NOK | http://autobuild.buildroot.net/results/ab140559c9c5ed5f6ac3be7505063359afbbf7d5 |     
 microblaze  | fs/cpio/cpio.mk:117: /nvmed... | NOK | http://autobuild.buildroot.net/results/3d23956a0a89e6b749bb10fc1867ef6a565968f3 |     
   xtensa    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/8e270407d4fa21831d540df59b649ff124a1fb45 |     
  aarch64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/c1a12ebdc78224a6f2c51146b335393e9a2e307a |     
 powerpc64   | fs/yaffs2/yaffs2.mk:32: /nv... | NOK | http://autobuild.buildroot.net/results/8d83260f91205665402a87c2a0d8929364cce538 |     
    arm      |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/b46202cd0ef3ef1208c62002853b7e8759a77c45 |     
   sh4eb     |          gensio-2.5.2          | NOK | http://autobuild.buildroot.net/results/be9dfd459291826b48f9a0cdf3a80b9aa002dd56 |     
   mips64    |          gensio-2.5.2          | NOK | http://autobuild.buildroot.net/results/1c9f0123d711c72d1269f051f54da21aa95b7991 |     
  sparc64    |          gensio-2.5.2          | NOK | http://autobuild.buildroot.net/results/6e009c6ff2f4e90ed60aef21200bfb08b706065e |     
   mips64    |          gensio-2.5.2          | NOK | http://autobuild.buildroot.net/results/6659d154be0982723304d42037c43cb5f38165d2 |     
  sparc64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/34373bc4e5e6c97d8a338ab0e68a5e18b2b766fc |     
    mips     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/15ef59d6ee69ac349fb3e46b3d77a1b2206c18cd |     
microblazeel |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/5e9ea467c9d25a0b6c09709c6c264e1f8b3582f5 |     
    m68k     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/bbbe27adc05df501bb0b4af271deaf6c70fedc75 |     
 aarch64_be  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/88271fe372372684cd45effcd675b83b60f29173 |     
    or1k     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/4503e36ef9f0fb6c39825bf9991e13ed281f5428 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/31f92953d6adcfbb642033aa25928b586fd8ecc6 |     
   sh4eb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/fd67354799c4dd24fb9301fd59dc57d0aecff89d |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/03d2f220c9849c5c6dc7bfcb4b24245d4ffc9bea |     
   x86_64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4c4574cad44522833a9fbcaf2ebb141c2568a1b3 |     
   x86_64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c71a482a803b9b6a347767f7331505548a231bf3 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/03c343d06c1c12ce81de07d3b4f52c7642ea4a34 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9a977181ccc598cf0dcc6e60917be8933561bd1e |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4212c0c7b330a68bd4be75f4da6527765c8dd35d |     
   sh4aeb    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ecb19fee3224b7e7d301e81b53c50f10910a325c |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e9a2177e62a1ad6dea781ddc9af4b300f940864c |     
   sh4eb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/eaab7760e13e28cda7f73d64de729e81374ba419 |     
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/4416ed70a4cc822fba24a25c736c72c01c2fb2e0 | ORPH
  powerpc    |            grep-3.7            | NOK | http://autobuild.buildroot.net/results/ffbb408f4723b4811d4771da36f341fa056a5116 |     
  sparc64    |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/e5efc06eb5abf4f4b7d0e40ef8279386f49bd71c |     
   mipsel    |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/b65b429591ad0dbb6bd3eaf7452f5db1b1972148 |     
   sh4eb     |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/3dc34188af61d7994a85cd8d9e5219de67f2f0a4 |     
  riscv64    |         hiredis-1.0.2          | NOK | http://autobuild.buildroot.net/results/e520cba1a13b0957236bd081a7ffe49de668402d |     
   x86_64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/106850496c7b6697d79d6586b71e581b39f448ca |     
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/af094cf833ec8e57d1ff0e1b15056ef354c773b9 |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/3cc248da53ac6900fafcf4b16143db1987d666d2 |     
    or1k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/9d0584d09c668a72a911c332023cfa6e2e245c58 |     
  riscv64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/5981e91d60971f826f97c83ac11ecdc579fe32a5 |     
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/bd6372ef29fad365168741e7b9ccce4637ae0fa9 |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/40cadffe906015107951f2a5b3b8a533c627c646 |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/be0fef6f0f3df0d5474479fe2e25da1127954e3c |     
    m68k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/9c33eebfa753a3f477f34966e2c4cf61556cdcc1 |     
microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/5e3d616b0719f9e7f1641a01bebd854bef3f8068 |     
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/eb44d4382c6decb9bc2fc6f837eaf514585509b2 |     
  riscv32    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/3b1f282c7aa20c975f161ba101a85ee169bca27a |     
    sh4a     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/1b42b5e43c4b70e90c8943671e3eb01a39bce1fe |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/bed40fc6588a0ca01adf8e9fd9d910430f10dddf |     
  riscv32    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f9abcc463089f5beee605822193f142b7fb33c12 |     
  aarch64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/d26c38f26ebaf1b6d2fca3cb744d5cb52e3959ca |     
   nios2     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/a4e55f0f12a6150190b3fc81e315ba9b39c2efed |     
microblazeel |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/73f854ef46073d4ec415671b52e949f42794fb4b |     
 aarch64_be  |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/e7586beca0c099570f837bfd3df3fe546bcb6c92 |     
   s390x     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/461b66d7a253c78e70ff8ce2ca4fe26fdab6ae0e |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/088b9c4e9a7f233ace2c4cd51958bcce5cd9545b |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/f0c8d44421d6ca2f2119bfe553b74b92e47b09ec | ORPH
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/3b8b63ef899341e8d55b410065ab0483af7c928e | ORPH
  aarch64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/f401c16c7aa4db288b89cee47438a467343fd62a |     
powerpc64le  |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/bcad704daccfcd6fbeec921fc505f0ee702425b7 |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/aff39c71ee913fc67b0a380967bcfb6cdf4696b5 |     
   armeb     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/ef1ca1cb7ea841238911888b70e9b00d2aaedb61 |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/3c632c6b6d17e92888278143e49dab1d1c938d05 |     
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/e124352fe87859cef7499f63a362aecdaa6a95da |     
   mips64    |   host-moby-buildkit-0.10.0    | NOK | http://autobuild.buildroot.net/results/25e5518b7bd5bc2e2b85c3ee8dd126a7868de225 |     
  aarch64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/30cd265832c6a8c9b92a747c3b1edb3f1a5c07b4 |     
  powerpc    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/4e807753017aad29601e82e3c14e9d336265bb4e |     
  sparc64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/7f89459988da9550f231835f5fa22ec76332e314 |     
   mipsel    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/407929373b3207f5967b8903ced656b4b9377fb3 |     
    m68k     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/66c06641990587fa9f32a57e73132895a819910a |     
   mipsel    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/b8b24a9fc1ad7803dc43ba38feb75e888e20c61d |     
  mips64el   |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/bdae417249d95fa60830b0244262fb8600b0a537 |     
 aarch64_be  |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/db67dcbba28d5479ebff65eb6c315694c742cf6f |     
   mipsel    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/e87d805413f0de62e9455e372e46ccc68ee4f0c0 |     
   arceb     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/46d243ea0441c9d7447a53b7c56fc3bcf56b8413 |     
 microblaze  |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/48f6790c734f067890ee7e4acf5044bdaedcf571 |     
   mipsel    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/42640c0af023155ab55bfbee32e1e0b1054c7474 |     
 powerpc64   |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/290240d99b629424e21b214804361dff0e022bfb |     
    arc      |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/e770fc91b396e1cfc71775be243bfff23cc21386 |     
    arm      |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/d6bc81369b240b37ce91e504f56553ba257c499d |     
    or1k     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/f94beec804b1188219f1353268d4d2d1b32a2f0b |     
 powerpc64   |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/7495fc8fc97bd0674f88bec7f2de7761fd4abd42 |     
   arceb     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/68d48e8a14968af62d9be747e0cd68ae5fa32ea9 |     
   x86_64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/e49af99ed10bc7eaba4496a0eea3968e3b636fd9 | ORPH
   x86_64    |          hwloc-2.8.0           | NOK | http://autobuild.buildroot.net/results/009935b7e1d0fb1f2122704f3541c45ab48f4296 |     
   sh4eb     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/53c79ce1c252edad58d3b3ddaebd4b153e915ab0 |     
  sparc64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/1daeb92a28b9ed82fded87f6b0e415ff043ce297 |     
 powerpc64   |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/252d96c57ec90e2b75c51b4d41a9adc9524c818c |     
   mipsel    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/583dd0dd4286d7b44ca438bdd7d157ad9dc37df3 |     
powerpc64le  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/a48f6814a0d079606d28f0d6e7bfbaa067525991 |     
    i686     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/67b0bbd83b4e81dd78edb001117841d0a987542d |     
    or1k     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/47fd263545e35c132e3f9ab818a5c275be66c7d5 |     
   sparc     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/4f1fb53e66ff59754dae28a01fb91a0ac08c2b2b |     
microblazeel |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/4b7de253987e168e785cfd503b04db2ce92d9c30 |     
   sh4aeb    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/33990da897d9b0a9d1ff9eb8184774c80fb850ca |     
    sh4      |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/53b8b13b986645858ca9172d504da598b13dbe92 |     
  sparc64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/42b21b17fc0cde2cbe9d31b1368fcc03837be836 |     
    or1k     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/f44028b9ae34689e827a535724cbd79289f1b44c |     
  riscv32    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/bea40ffe520fc7de23a6fb147f13a95327773aaa |     
 microblaze  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/e78cd04a0d9143247391485d6048c614fca90d58 |     
   nios2     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/98b6dae1b9fb495bcfcd052d1f009f54e805490e |     
   mipsel    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/5999b858ad6eb9ba04bc2f39161ff1c168b0aa33 |     
    arc      |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/e663c3a2d8cb2432cbf35d6d8df2e438af66d069 |     
   nios2     |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/502cdfb0fdcf459ce6d562af2a569d8f5e08dfc3 |     
    arm      |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/252256e6e671c6e9d1b87730fac0a7e2ce065a7f |     
  riscv64    |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/a01fada82d369605485cad10787956ea3c0960ec |     
  riscv64    |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/9c854da01cee00b0dbc314862884486226a9f39b |     
   s390x     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/9e12d878a5ebb9f315e7a4c5168d3890147afffd |     
   s390x     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/dab2926a9729a88dd64063a8f0ba1796581e6247 |     
   nios2     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/2d669f000d942cfc53f1f0c334209509192760ed |     
   s390x     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/106c37271e2a4a770b0eeea23736badfcfa31ac7 |     
  mips64el   |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/5b9fd1e4f87546937dfe535f134556bd12514680 |     
  aarch64    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/f65b127d23ab3f0a3ac5d5d94de8ccea82406206 |     
    i686     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/5437b61cfadc444a199cd7dff6b6ea1f1caa91db |     
    or1k     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/5dde7547fc9f222794e44233078ebaf8d2368083 |     
   mipsel    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/611d3cf2b23e124d6af5deb488623a885835515d |     
   armeb     |        libdcadec-0.2.0         | NOK | http://autobuild.buildroot.net/results/142b1ec2885dbb7c9ed6b7de4e1a33112ef4c38d |     
  aarch64    |        libdeflate-1.12         | NOK | http://autobuild.buildroot.net/results/19df8590e8311a531699c25f5e7b84ed379bd054 |     
 microblaze  |        libdeflate-1.12         | NOK | http://autobuild.buildroot.net/results/cf0dad9981861cde952cfdf8a438f981e2d792ab |     
    arm      |           libev-4.33           | NOK | http://autobuild.buildroot.net/results/2edf2d8a4006ec716a9f5d060ee879069a404e2a | ORPH
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/fe067d979c4979de3619e3c3fc69d82ce58cebd2 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/ce9dcd35a3e5c216f6c5797a65618d11456678e5 |     
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/a50b395012d91c1a93b2e05fd32244824702237d | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/337fbd011a06925e79c50b8e521e57dec34b0336 | ORPH
 microblaze  |        libmdbx-0.11.11         | NOK | http://autobuild.buildroot.net/results/f21d6de37a38b470468724a33f986d42b8aa0519 |     
  riscv64    |           libndp-1.8           | NOK | http://autobuild.buildroot.net/results/46979c6281d73796f84989729fcd29fc7fb5a6fc |     
 aarch64_be  |          libnl-3.6.0           | NOK | http://autobuild.buildroot.net/results/c0be5b337e88cce30d33852f0d6a29ebedd6b582 | ORPH
   mips64    |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/8d9d204eb6a265e5542f86538c8e8dcd921f7ada |     
  mips64el   |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/1111eeabc8e6b2f0f09597141e57b96719a4f2c6 |     
    or1k     |          libqb-2.0.6           | NOK | http://autobuild.buildroot.net/results/a1d823854f46f6a58d2d2198ebff7b0f8c33c102 |     
    arm      |        libsodium-1.0.18        | NOK | http://autobuild.buildroot.net/results/4abc3b43db9b634c6febbc585b6b352dd46e650e |     
    mips     |  libtorrent-rasterbar-1.2.15   | NOK | http://autobuild.buildroot.net/results/730b94d94664405180005e0e3d6c7b474ad09cf9 |     
   x86_64    |        lightning-2.1.3         | NOK | http://autobuild.buildroot.net/results/ddd3f03b6dd34ea2355e84cb1867701f5c332930 |     
 microblaze  |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/a95e0447e42b430ae99d5c9b2a58ef0c8792aed4 | ORPH
   sh4eb     |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/1308ee818042f3ca2181ee43e5e8dac7d8a426a5 | ORPH
 powerpc64   |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/fdc19d67231b18b4ac01288b523a3a6d23f9a9e0 | ORPH
  sparc64    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/6999faf6b00d1e51574bc2f5f6c0b20a73e96fc0 | ORPH
  powerpc    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/c815da44a082a3d355be27ccceed2085615f593d | ORPH
   s390x     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/c124ab1edaa938d5e045e450890e089eddc462ee | ORPH
   arceb     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/744b95174f809fafafc8e6f4f97aee5225fcc32c | ORPH
    arm      |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/eee5d93d69767445065e842c8eabd0ecd7c0e309 | ORPH
   mipsel    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/b25a7698d21064ecddc5aa3494b08fb172674549 | ORPH
  mips64el   |       lttng-tools-2.13.2       | NOK | http://autobuild.buildroot.net/results/451fefada66c8533f04410e2235a572cacd1b822 |     
 aarch64_be  |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/ee8474321dc676c3a36647445f262299894e2708 |     
 powerpc64   |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/98563773d5d1a6296ff7c6c6ea51bd1313567d06 |     
    or1k     |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/c9638774980e50a81074cf394233135384184d50 | ORPH
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/77ff0f9fbead0225f8bf1826fd3ebe3fa2bf7bdc |     
   xtensa    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/c999eeff5b6decfb81d6d6ca1272bf121f6d2cfd |     
    arm      |     mxs-bootlets-10.12.01      | NOK | http://autobuild.buildroot.net/results/63fc66966d655543b86dd24ce29472f6cc3e4575 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/147e127f0fc676d56531d1de3609fad30146d22e | ORPH
    m68k     |          ntpsec-1_2_1          | NOK | http://autobuild.buildroot.net/results/0978701ad892f17030995db66a60b9f637669e3b | ORPH
    i686     |          ntpsec-1_2_1          | NOK | http://autobuild.buildroot.net/results/402c7e70627e092d72f251ab80e2429fdbdc8aea | ORPH
powerpc64le  |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/fda6e65bc19f5832a2007bb594b29c781ac70910 | ORPH
  sparc64    |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/aa70af6f147ff7886cfd564475850fdb47245a07 | ORPH
  mips64el   |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/0461e4084fcfd81e59d977468fcc4cf1e248ae5f |     
   mips64    |        openblas-0.3.21         | NOK | http://autobuild.buildroot.net/results/f2440b87d491e0ffd65313ec465a1588b69be564 | ORPH
powerpc64le  |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/dc69f071f06805450c2a5f56101221bf7af84097 |     
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/99c3fd501f9e3e083c8736c880e5f95d2156b981 |     
   xtensa    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/c56c7f1d6808b936a463cf2dcdbca136e0e0241d |     
 aarch64_be  |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/cfea62d716aa37d3eb67e08f7b54058095d314bd |     
    or1k     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/f1d736055179be2cf656b7acd856befeb0387a3b |     
   armeb     |           php-8.1.9            | NOK | http://autobuild.buildroot.net/results/b031ee5a66f707517cfaaaea7cf34e4224494ba5 |     
powerpc64le  |        procps-ng-3.3.17        | NOK | http://autobuild.buildroot.net/results/b411e3b17fffb271af45eac5e30fda7f1bb924bd | ORPH
   armeb     |      python-numpy-1.21.2       | NOK | http://autobuild.buildroot.net/results/a54be837a6f3e1a175c9d991bdb40ddaeb20abe1 |     
    arc      |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/1342a439cd92fad455fcf4d51b521dd0b0a56620 |     
 powerpc64   | rtl8723bu-d79a676a8d3f0bb6a... | NOK | http://autobuild.buildroot.net/results/f07b736ab8cb5a4b92d6597dbe5e437dd46ca6ed |     
   mipsel    |       stress-ng-0.13.05        | NOK | http://autobuild.buildroot.net/results/3cbbeb89dd3584900b86b07731a2e255aefa149b |     
    m68k     |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/778217d4eb1358e5f7f5706ec6eb606eb2c74e71 | ORPH
   x86_64    |         syslinux-6.03          | NOK | http://autobuild.buildroot.net/results/915fbe36ced76a405a3bd1fc8932cdd36d6542a3 | ORPH
   x86_64    |         syslinux-6.03          | NOK | http://autobuild.buildroot.net/results/ed62e737852526fa8aa376d1e84d707a454d7246 | ORPH
   armeb     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/542a3b07e395a678d8f39abbf6ec232f8fb01f7a |     
    mips     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/9ca9a2f78f47d54a30318c3af07836bef57b2464 |     
   nios2     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/5d2358571898ce62d80a503bd44f9b6d677550fa |     
 aarch64_be  |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/24cb55bca4f7bb473ecb4f328abf6cb7ae135674 | ORPH
microblazeel |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/4230ce834efbce4c41573e044dafeb2f162bcbd9 | ORPH
  aarch64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/aeef1ff7a85cc5a840139cc79f9e25196d22dcab | ORPH
  sparc64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/47da6191b36af5375206ac712ce8d211d8b4a70b | ORPH
  mips64el   |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/1253d84356402245d5d0e1a6f7a8142e90431b26 | ORPH
   armeb     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/a274bd18af505233b02a5be9ade0c2790a5bc794 | ORPH
   x86_64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/66bfde56c8329ad355930013e7c9d9b760e4c360 | ORPH
    sh4a     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/79cb34bd7c9da45056a194f3ddce11b6a510047e | ORPH
  mips64el   |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/89a7eac87456dd786b53765cca6e131f4ffdb83b | ORPH
 microblaze  |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/62e317e1542955982d685da15bfc87d52ef3d95a | ORPH
   armeb     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/cb8f3d7608a4f5145b1c0e1e68c25de75604bd0e | ORPH
   s390x     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/e09d335eb1f44c513d82481a9a553a0876e9bdad | ORPH
   armeb     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/b2c30f6d7809813b3b31011655dc718974772b2f | ORPH
   x86_64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/b6c6f84531961d5d33d6d323e3dddbcb9282c745 | ORPH
    mips     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/4abcf730bf5619cfedea5e073fa588e69b0f1cc4 | ORPH
    arm      |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/2de88e70b6e1740168bac7a4b82a4a1711fc9e64 | ORPH
   armeb     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/5a2c242acf26a05ef7a00481a2933771979c9c52 | ORPH
microblazeel |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/7390f50e8a83833cc9ad5617e672438fe6fca906 |     
   mips64    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/1777beecc5d54b3ec9948611cccf25bc32acc7e1 | ORPH
 powerpc64   |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/2e2261509355177d0baa5dcc98c2df7d2b36d397 | ORPH
   x86_64    | uclibc-ng-test-0844445e7358... | NOK | http://autobuild.buildroot.net/results/3cbd6f8007d1b5276b91e9f1688402f86b1f2049 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/91ae1a0a2ad954f6092b594140e6b1d6b59574a4 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/e2e0e5b069518a9ed20a77aecccad3589720da80 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/717eace46d8132541203eace04086c75b4fe4a88 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/1e4cb324c342573326f8d9bdb4118edc01907534 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/faf5e4ed318b0dd6a751f388bbf84fafefcacb86 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/63580c8335bc0cbc1b842dc208692e79846dc1a5 |     
   sh4aeb    |         usbguard-1.1.1         | NOK | http://autobuild.buildroot.net/results/94c4e2b42b2f2dd0eea5c789d97121a80e5f8ba9 |     
   nios2     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/302082c11bea0360ceffcc1924fd442c2da4aedf | ORPH
   sparc     | wireguard-linux-compat-1.0.... | NOK | http://autobuild.buildroot.net/results/6d177100c5ac8b3c3345078c7f2e19f27afd3b84 |     
   armeb     |         wolfssl-5.5.0          | NOK | http://autobuild.buildroot.net/results/a0ddb31d1c26b7746177d3137e6d6f0b31ae1efc |     
    mips     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/bc6e3333432229b4defdec5606d1b05b441e790d |     
    arm      |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/01b1a84647011ddccbf0a1bab1d98030c0f751f1 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/0fd5968660d2c7206c0a85183b2210019e31f218 | ORPH
  riscv64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/c1f876facec93f668d95d01c110891e418b1013b | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                    bat-0.19.0 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/d48d133e0d79d9ebb958b02075efdf8444a04f04 |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

         graphicsmagick-1.3.37 | 2 
/home/buildroot/autobuild/i... | 1 
          lua-cqueues-20200726 | 1 
                  nginx-1.20.1 | 1 
                       xenomai | 1 
               xfsprogs-5.14.2 | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/7350b38767704579719dd089a2b5bf15ce00a950 |     
    or1k     |     graphicsmagick-1.3.37      | NOK | http://autobuild.buildroot.net/results/e1697575e08b9d09bcaa37de881ead7ca81b3998 |     
   x86_64    |     graphicsmagick-1.3.37      | NOK | http://autobuild.buildroot.net/results/1a017e2e35a8c5084b4a794730c241645515aee9 |     
 aarch64_be  |      lua-cqueues-20200726      | NOK | http://autobuild.buildroot.net/results/4c26d9d76a751395ef42aff8e01df41a7d99eca7 |     
  riscv32    |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/70f3e49c9082bc718a49cbde21d8283ecdc85380 |     
   nios2     |            xenomai             | NOK | http://autobuild.buildroot.net/results/5488b8577f14d8d353bbc892e550943808dd4b43 |     
    arm      |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/25dfbf47fff767668334eaf55bcbb657ecb97e47 | ORPH



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

