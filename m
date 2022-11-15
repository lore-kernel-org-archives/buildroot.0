Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62627C433FE
	for <buildroot@archiver.kernel.org>; Tue, 15 Nov 2022 07:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E904D404AB;
	Tue, 15 Nov 2022 07:39:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E904D404AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z0u7UfW4GlFo; Tue, 15 Nov 2022 07:39:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C1CB404AF;
	Tue, 15 Nov 2022 07:39:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C1CB404AF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 384261BF293
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 07:39:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06B0B404AB
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 07:39:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06B0B404AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Y30yg0lGEo8 for <buildroot@lists.busybox.net>;
 Tue, 15 Nov 2022 07:39:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C922640496
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C922640496
 for <buildroot@buildroot.org>; Tue, 15 Nov 2022 07:38:59 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AE27D1BF203
 for <buildroot@buildroot.org>; Tue, 15 Nov 2022 07:38:56 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 15 Nov 2022 07:38:56 -0000
Message-Id: <20221115073903.06B0B404AB@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1668497936; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Zvtc0vYelD0Qr4GoOc1HL8pYi4ELOH67EpAnbQxJNMo=;
 b=CJ3i7XAQlcDbT3pyasWd/K2h8FTejMjVyRvSCB6GlbT6fZ3ukd/VOZPt2XlmCTN/h5U3tT
 9l2pD6nYx5mG+8rokSYHOl3Vhm8F4Si3o4T0qvmo/M3/+CtYza0VA9fN56PMh19E+XVSGS
 SmNLB8PVHLxL8KNYx5rkleRV0jid/H8e6l9IAxsB+Z0ctOH5dksbuqD+qQbdtouoQ6B/jN
 1lcRvMRO/kr4DLk0fDbH5fnMZ3tBWJMcZdb+0bw9mg7W4VwmotwXzPU0RswNbR5iqbL2Zg
 coHnisJ9leUEdovpzI9oN5hwDd7JaW2Hau1+kjjj+W/PSdnchkigJ/U6h0/xWA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CJ3i7XAQ
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-11-14
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

Autobuild statistics for 2022-11-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  3  |  0  |  0  |  3  |
  2022.08.x  | 12  |  6  |  0  | 18  |
    master   | 154 | 178 |  0  | 332 |
     next    | 54  | 102 |  0  | 156 |

Classification of failures by reason for master
-----------------------------------------------

                   libnss-3.84 | 14
             lirc-tools-0.10.2 | 9 
glibc-2.36-66-ga1dc0be03c9d... | 8 
            host-binutils-2.38 | 5 
              host-pahole-1.24 | 5 
             libgpg-error-1.45 | 5 
                      xz-5.2.7 | 5 
              host-rust-1.64.0 | 4 
               libglib2-2.72.3 | 4 
                   linux-6.0.1 | 4 
                 dash-0.5.11.5 | 3 
fs/ubifs/ubifs.mk:49: /home... | 3 
              libgcrypt-1.10.1 | 3 
                   perl-5.34.1 | 3 
/home/buildroot/autobuild/i... | 2 
                    brltty-6.5 | 2 
             dahdi-linux-3.2.0 | 2 
                     frr-8.3.1 | 2 
                gerbera-1.10.0 | 2 
                     gmp-6.2.1 | 2 
  gobject-introspection-1.72.0 | 2 
host-gdb-arc-2020.09-releas... | 2 
                host-go-1.19.3 | 2 
              hyperfine-1.14.0 | 2 
                linuxptp-3.1.1 | 2 
           python-numpy-1.23.4 | 2 
        s6-linux-utils-2.6.0.0 | 2 
                tealdeer-1.6.1 | 2 
toolchain-external-codescap... | 2 
                       unknown | 2 
                xenomai-3.0.10 | 2 
/home/buildroot/autobuild/i... | 1 
                  acpid-2.0.34 | 1 
                alsa-lib-1.2.8 | 1 
android-tools-4.2.2+git2013... | 1 
                    bat-0.19.0 | 1 
                      crun-1.5 | 1 
dawgdic-16ac537ba9883ff01b6... | 1 
                 dhcp-4.4.3-P1 | 1 
                 dmalloc-5.6.5 | 1 
         docker-compose-2.11.2 | 1 
                     efivar-38 | 1 
                elfutils-0.186 | 1 
              erlang-22.3.4.22 | 1 
                  exempi-2.6.1 | 1 
                     exim-4.96 | 1 
                  ffmpeg-4.4.3 | 1 
                     file-5.43 | 1 
                   flann-1.9.2 | 1 
             fontconfig-2.13.1 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
          gitlab-runner-14.5.1 | 1 
               gocryptfs-2.2.1 | 1 
hawktracer-2ec19d7192334414... | 1 
            host-binutils-2.37 | 1 
            host-binutils-2.39 | 1 
              host-delve-1.8.0 | 1 
       host-gcc-initial-11.3.0 | 1 
                   json-c-0.16 | 1 
               libcap-ng-0.8.3 | 1 
               libdeflate-1.12 | 1 
                libglvnd-1.4.0 | 1 
               libvorbis-1.3.7 | 1 
                libxml2-2.10.3 | 1 
          linux-5.10.145-cip17 | 1 
        ltp-testsuite-20220930 | 1 
          lttng-modules-2.13.1 | 1 
mali-driver-3d697de9bce8bc6... | 1 
                 mesa3d-22.2.2 | 1 
                     mtd-2.1.5 | 1 
                    musl-1.2.3 | 1 
                nodejs-16.17.1 | 1 
                  ntp-4.2.8p15 | 1 
                numactl-2.0.16 | 1 
            ocf-linux-20171122 | 1 
              open62541-v1.3.3 | 1 
                 openssh-9.1p1 | 1 
   openvmtools-11.3.5-18557794 | 1 
                oprofile-1.4.0 | 1 
package/qt6/qt6base/qt6base... | 1 
   python-pycryptodomex-3.15.0 | 1 
qt-webkit-kiosk-a7720e50f2b... | 1 
            quickjs-2021-03-27 | 1 
rtl8189es-39c17661136da48f8... | 1 
sconeserver-8d1935919a20133... | 1 
                    sdl-1.2.15 | 1 
              strongswan-5.9.8 | 1 
              tinymembench-0.4 | 1 
                 uclibc-1.0.42 | 1 
               valgrind-3.19.0 | 1 
                  vlc-3.0.17.4 | 1 
                    volk-2.5.2 | 1 
                 wavemon-0.9.4 | 1 
                 wolfssl-5.5.3 | 1 
                wtfutil-0.41.0 | 1 
                  zabbix-5.4.9 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/0c433150361de52f96cb5c0746124a9b751830ac |     
   x86_64    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/4fc73642d868118efe19d38cd31adf3ce5c8e7b4 |     
   s390x     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/12e148d8ae955fff03dd57f970b65440242b50fd |     
   mips64    |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/dc3daef6fe634bccc4be3f40d7888bacbb16aa59 | ORPH
   mips64    |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/8852e756715e6208678b08f89e42ec6060e7bf65 |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/54bc7d43deb8ccfc1eff4b7aa4028e9daf5839a2 |     
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/a1dde1e3f6e4d55f979913546ab0b37df9dc1480 |     
   x86_64    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/4552b5826024fea18bbe79c09a9d9ecae2fb48bb |     
microblazeel |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/85415ffc7626688d1917a3b4fc5271028a80e413 |     
  riscv64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/1ffc11182900b41e30338fd878e58ed61634e9fd |     
   x86_64    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/e9b0f01c48f7b7ab40f62c575c788cdbf83c3bd6 |     
    i686     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/0e69503ae35aa6919f17ba9e0ed95d1038c404ac |     
   sh4eb     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/df15bfc2ed0cb122a1d4535e0be53c3956ed78bd | ORPH
    arm      |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/63bed53153a888236a830c9fa489abc595990077 | ORPH
powerpc64le  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/2d7ad79a796c0908777c48db38337f6ebd168a29 | ORPH
  riscv64    | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/290cd6926c0ed1981abf63a9929575306583a6a5 |     
   xtensa    |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.net/results/3da84b2489bff0ecdc334815225dc5509c67f425 | ORPH
  powerpc    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/591a303616037d986eb305817f2f5392cbf0725c | ORPH
   s390x     |     docker-compose-2.11.2      | NOK | http://autobuild.buildroot.net/results/10f87c18a13bb04668d36b94868641953053ac8b |     
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/5c80623fad61f0c59dafd35aa0d401823c6c4161 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/d2c3cf4a66ce14635a6142e36d49899bb123402f | ORPH
  sparc64    |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/28b0290a6b03a2ae3d972b9d4f756bb21c95619d |     
powerpc64le  |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/97a579e46b7c0d7727fb34a9a61d2c68e6c528be |     
   armeb     |           exim-4.96            | NOK | http://autobuild.buildroot.net/results/66c360d94986b8762c70c2f50a3cbaddee3e7adb |     
   armeb     |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/6e226f1ba0b920a9aa5a3df6caf601a25150e42b |     
    arm      |           file-5.43            | NOK | http://autobuild.buildroot.net/results/e50f33615c6b65786e0000826fdea558e7866c1e | ORPH
    mips     |          flann-1.9.2           | NOK | http://autobuild.buildroot.net/results/1bdd4eb2e597dba3f982895a6459507302cffe00 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/1f80fd2bc71210d31bcaa51a6418d55431fc19d8 | ORPH
   xtensa    |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/bbfed3b04370f789c015a911c53b6beea8ced85b |     
   xtensa    |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/7d621f2325e6931fdb61a08e560dc7ba9487d530 |     
   armeb     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/65a4ddd6b1bb3fb8a9f495063c62b56449b17d6f |     
    mips     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/facbd3e5455c4c6c8d76c61bb4334a6c463d87bb |     
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/078087811ee5c499c75ac532962c13c9f1e8da8b |     
   nios2     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/b7ebb8528197998fda38d82a7efec636666813d1 |     
    mips     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/ce5744c89948052828882c6c9e14226bb20e38fa |     
   arceb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/f1076662f0e29fbbce25d8e013631e45ad47ac03 |     
  mips64el   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/db233f0248d785c8c978bfd1fe9b977e18e74eb8 |     
    i686     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/5037fcb747ae381bbc86da1a48f4fdec9630b10a |     
   x86_64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/c05c826e6a1185cbf16c4bc05124250ddf484ff7 |     
  riscv64    |      gitlab-runner-14.5.1      | NOK | http://autobuild.buildroot.net/results/d2c9818abc34173a65f158d90a9d8ec870151b57 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/b9317969c95b6712b354f7578f20e4870be9b183 |     
 microblaze  | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/84d295c292421682aa47cee303059b9d11dcc82d |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/707a8437343856c94eb84f113e78afe4e921a787 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/22e4bdecf5aea000b3a6ccc4ddc750e8bfab3cdc |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/d2876fefbee1e7cf8aeea77a9c40af1881675c41 |     
    mips     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/32459bc2f5020e3dce522f7898bed366de3c8eb7 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/7eec059abd816d41b9aebc2a0e0c94c7dce963b1 |     
 microblaze  | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/ab4121f949671619e4bafc99128d9929699de003 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/6ccd818ef27146defa84aacbb93faafc460cc284 | ORPH
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/bf9024a2f632cdd9b8bbba7eb01037010f18cfdb | ORPH
 microblaze  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/e3131104a7bdfc71db1ac4f53407d913c9cdbd17 | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/3a7741784dd351e3913a84fee0902ee4acb46a8b | ORPH
   x86_64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/414d4aa18ced0e7bbd7f3837645f193de1ac7c88 |     
 aarch64_be  | hawktracer-2ec19d7192334414... | NOK | http://autobuild.buildroot.net/results/1c17d7aa546be7ebffbfbdc2f003e814625fb7f6 |     
  riscv64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/96cda21b61818d03df9ad05086bc8d6161423fad |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/d8293f7bd8c84e61d85f443cb8242c22f339425f |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/0066c139447db1eb6daaef190e2f48fd8e290c42 |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/69befaffcadd8d91a7d1900d30e53b567288c8bc |     
   sh4eb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/43aa0fbb17f2cfb84e9c681773cb0cd4d6f1dd39 |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/023a3bcedf9c230faf5f8a5fbf358db307b9a673 |     
  aarch64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/1c96f5fd0c11f48ebb405253e7944988bbbf9342 |     
    arm      |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/ed35e22252484e1eeda54889b23e317f0cb8704e |     
    arm      |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/61b1a54e02448e8d9d25b33c8212eda43a25f4ff |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/9c4b107b07cceeb03fa02c90b2b8082513db59d4 | ORPH
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/64cc24ab585bc75e204c474e66a655e16dd62c8d | ORPH
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/ff10455109cb5904e6839ce3da9a3e7f24ecc024 |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/d6fefde525695c8c72e8f62268a363af45da666a |     
 aarch64_be  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/abb6f22c999852987dc4d65ba4672e8720b72b63 |     
    arm      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/3d9e249764a07e65689a8c438086f06848fa5d4f |     
  riscv64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/4b61d316134eef8224326ebbb5f5e765880fa013 |     
microblazeel |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/731b699f02994c00406cb79b41572c30a34621bd |     
   mipsel    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/de5fab7cd4512bcc99605bf33173ccb5a6074b21 |     
  aarch64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/6c1c1793e52c1e9924aad7262fe4f105aba5a5b4 |     
  aarch64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/078785a7c20df5d25af325d152a216d1dad37e16 |     
  aarch64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/d97f084bcbd86a32ec7e5b8fa3cd68348fca2f02 |     
   mipsel    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/430b87128de150fdb72315200c3c9261f28879d2 |     
   armeb     |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/a182d72e922fa2e6b4bb000efc1c259fb01beb5c | ORPH
   mipsel    |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/e3c61fc88e569ae3e85839e7012f79fe216bf022 | ORPH
  riscv64    |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/aa8c56127a136f31530afb45b2a225d295636f41 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/3a94c5a60a8606924a57a14a97e68eaf5c8bda9a |     
  aarch64    |        libdeflate-1.12         | NOK | http://autobuild.buildroot.net/results/967118f4c3fe58e20548b9d019d14859b5c7dc7c |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/123ed684b0bdb8e3a55cd9cbc4316671ac7f36c6 | ORPH
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/51d5421c0fa8f05b920d4ab055216e52f17f3d95 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/f744243259494eae630fbd3bc9d328eac0edbbc2 | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/500d1aeb0157aa88bac1e8bc266ba96c9a2b0bb2 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/53801e370b67604e500d7e276ba309999d534864 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/0e27c5bca1a12110c6dbee229b5e5e27e7fdf8b3 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/3731a521e41ad05e75b6b422ac59b3a2d3735685 |     
    mips     |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/d006613a644705d71c3d010bfeb617aa587d6035 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/a8d2afdaa06b9e30c417ce4a49c3413ec00178f2 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/3fe11fdffa6fad0ab6e8eec89469fed90c4201f1 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/a0acec332688722864da8cf8c29e94e5cd42cd0d | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/415184d8eb0455ac196e90f6f3d0351e921447c6 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/633fef388c8a59e1aa32ca85751065c3f7082974 | ORPH
   x86_64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/2223d6d8ac7fd904e3f13ed340d4b08c7d8bc4ff |     
  sparc64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/22e7f73c60034f61bfb08ab82e7efa8f5163d5f8 |     
   sparc     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/adba0fbf2c5d5cdb54d7c3c069aa1d43da02caed |     
    mips     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/413c0d576b21cf1d1ab755b12893d6a3801b8ae5 |     
   mips64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/efcf5e9497a53b1e324caed7db3c03ad316d59d9 |     
    mips     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/1074143dbea60567cd83be0a23f7c0214d470de9 |     
   mipsel    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/a8e8c4dd66f7b12c7f2287ff88e82885d56eb46c |     
   sparc     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/0b972530853ef56448291a1273f5e87c06232b98 |     
  sparc64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/35c647ddced63169ad7382f565156c1a37d4abec |     
   sparc     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/c29493c59741f30b1c53afe3bbac1794c357d44d |     
   mipsel    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/c30a0c1cbe725d0552b08cdb58535545466e8b07 |     
  powerpc    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/b16e518767bc5e2b3b11796fcb6f148a94c3a4c9 |     
    arm      |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/96d360e2d7795c7e4f1e45330e8b92fa030f5770 |     
  aarch64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/3e8142051703bdf402a94139d143854fcd718746 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/fd8ffb1680e667cac6dfe28cc801c673b50cd0e9 |     
   xtensa    |         libxml2-2.10.3         | NOK | http://autobuild.buildroot.net/results/a840bc8e30cb5cafb3ab4c830ba8147edce09e81 |     
microblazeel |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/eec15435ef4e6289f70e68191d7b1dbbbd8ef3ad | ORPH
   mipsel    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/8d8ae2c48c3a1f35773eb6f889e3f09e3cc5bcba | ORPH
 powerpc64   |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/6bb066d5665e70ea6819ac536cc7588c73f59df1 | ORPH
  aarch64    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/40036857609ed0a5deda21eb766c39264b27b872 | ORPH
 powerpc64   |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/aa04819ef54fa4023d7f942e81366b63c5f6757f | ORPH
    arm      |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/213da2ee155b04035534a1146c0a800b1825e678 |     
powerpc64le  |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/fc5b9be6c230045ac1db8677375daa5be6056aa8 |     
   mipsel    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/14c9811d9676e4abea33ec707bf306917d265eea | ORPH
   nios2     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/eca3fd00a7c12b79236e81fc1461eea06ebdfded | ORPH
powerpc64le  |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/aea8eade9c9355a7111a48ac708276c55bde5eec | ORPH
 powerpc64   |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/b6c1fb696ce441f08e5ee4b35063b9182af54802 | ORPH
 aarch64_be  |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/2e3cb8c9073475fe97cfdddc8bc952695c67abcd | ORPH
    mips     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/876567947f34c11e1bece00aba306422416e1b16 | ORPH
   mipsel    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/f17eb3f5df1f86199bd2e13e65015906f3d4f683 | ORPH
  mips64el   |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/adfbb2f19390a7444ee464c8e8475909465f8c29 | ORPH
  aarch64    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/b5b6a62bca9664fdb9f33a971ff732aa83585a06 | ORPH
  sparc64    |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/fe7171ac19fe379418d37b789f3b6ad46b4cb410 |     
   armeb     |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/4a4c77036c61373412deff91e0148fdaf976a8fb |     
  aarch64    | mali-driver-3d697de9bce8bc6... | NOK | http://autobuild.buildroot.net/results/0e9207ab5806efc3885c27d1e98c7625574e57a3 |     
    arc      |         mesa3d-22.2.2          | NOK | http://autobuild.buildroot.net/results/defdb5bce37b352338d3e6348a1e815a8a5f5c16 |     
    mips     |           mtd-2.1.5            | NOK | http://autobuild.buildroot.net/results/cf2e3f2109c5db597b93650779e4833fcc6a6df4 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/e7c26093791ac5b3aec17f6a3e01b919d22d4855 |     
   x86_64    |         nodejs-16.17.1         | NOK | http://autobuild.buildroot.net/results/d92b888bf89f6cd5d7a2da190e970bc0b3a8f476 |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/4ded95019cc5dcdc03503a6ded89267612a50145 | ORPH
    or1k     |         numactl-2.0.16         | NOK | http://autobuild.buildroot.net/results/b53bb5dba211b63ac6a62d40f701f2d39f9b43cc |     
    sh4      |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/e79367d44dac300d5ff2f9d09f2b9a7e47a36f66 | ORPH
    arm      |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/4b024fe4d1b1341c9605cd95f6e3714f1f2d3582 | ORPH
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/dc554220b7419b04f1d04f699862bf6abedbdf19 | ORPH
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/ca0b116a4f8991b71beb8e109aa9ce583f3945e4 |     
powerpc64le  |         oprofile-1.4.0         | NOK | http://autobuild.buildroot.net/results/06619e3922d4f2da776ae0174dd42af9d0d303c0 |     
  sparc64    | package/qt6/qt6base/qt6base... | NOK | http://autobuild.buildroot.net/results/3808db83faa76814a443d58d19af6cfc61b58cfc |     
    or1k     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/ebd748be36dd85ebdb220745a91937a366b9f536 |     
    arc      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/a9a935819044ee3030812ffef4f2b0d351def446 |     
   x86_64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/fecac3898b9e96a227264a86c4195d80c740c64a |     
   mipsel    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/0fbbd37fc76c57e8c70b52455888759d30a260f8 |     
    mips     |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/3812411448de61a875e8bcd2dd014140c22e1cc1 |     
    arm      |  python-pycryptodomex-3.15.0   | NOK | http://autobuild.buildroot.net/results/43b381496c8114907a4fc431a30c73ce93fff025 |     
    i686     | qt-webkit-kiosk-a7720e50f2b... | NOK | http://autobuild.buildroot.net/results/e6beb8a0ea0dd11849da8ef3c8518dcf4de51263 |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/6607facfc1d9a6e7d4397c1c603de1ab304636f1 |     
 aarch64_be  | rtl8189es-39c17661136da48f8... | NOK | http://autobuild.buildroot.net/results/6178fbfbe9fe762645b1907c4ceb032a00e75a89 |     
    arm      |     s6-linux-utils-2.6.0.0     | NOK | http://autobuild.buildroot.net/results/6bd6279e79e38f0f96b141d3037764ec25f7816e |     
    mips     |     s6-linux-utils-2.6.0.0     | NOK | http://autobuild.buildroot.net/results/5245f3662c001fd4461f2918c41b11357b3ed813 |     
   mipsel    | sconeserver-8d1935919a20133... | NOK | http://autobuild.buildroot.net/results/426699caed34d3f126fd7ee519be670421470535 |     
    sh4      |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/5bb7769679b09a2bbd72bb1cdd3095dbeea73969 | ORPH
    arm      |        strongswan-5.9.8        | NOK | http://autobuild.buildroot.net/results/cdeaa7e3937008eb1d659ac9aa01d4aeea435287 |     
   s390x     |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/a238ebba9b0f8d631e3d604b85eea81177ea22c2 |     
   s390x     |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/19bcb6839cad8717789af60130ad8e683a2d7447 |     
    arm      |        tinymembench-0.4        | NOK | http://autobuild.buildroot.net/results/e0c0ec2cedaf66cfc6033c4c7dfa2b50c804dd3d |     
  mips64el   | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/712bd2481232ca78a5167fe6136db8b7adb37bb1 | ORPH
   mips64    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/0abc1503cea89614f420cf9fc23a92d4c6afe661 | ORPH
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/9957035e742550348a181655dd930a6ba31f44ff |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/f4bbaa2223d2fc8f8b2a09a66054757907f44179 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/f936f3348346cd0c3132bff08ff42b32b5346054 |     
    i686     |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/b560558359e1336d748758d97feca8dda31f194f | ORPH
    arm      |          vlc-3.0.17.4          | NOK | http://autobuild.buildroot.net/results/85875bc39718b9c57c6dfcdd20860d17cc2a7a94 |     
  powerpc    |           volk-2.5.2           | NOK | http://autobuild.buildroot.net/results/740eb365c5a5b315616f5427e49c488531a98d32 |     
   armeb     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/eae690cdf88f8f81d142c794d6b44612ddb6473d | ORPH
    arm      |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/5ab308a77f274bf9844376fe868dae2012b92068 |     
   mips64    |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/9dd505938a04dc2ed5a54f38ac4ba96cf0457d1a |     
   armeb     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/b58aebb7cf79c77afe4a0e7a12e3eeda3e3a00a3 |     
   mipsel    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/830bbf6a4cf8e0bfbfce90b6beba304011c7937d |     
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/94f59b2c7de7e9858ec43c87838c15173ca1b2b9 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/2bd748d7a3548d1c3d82af8ec88dff1cfc964f04 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/27eda6d4cfa81ef6fdcba54b87828131c3a94c6a | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/245b06146bd41db8f6c28af68fe84b711040a0fa | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/cb1f5afbaff46379562b4f9ebc8f62a94207841f | ORPH
    mips     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/66eec8a76eb471c4176a10d84f041ecf5e6add8c |     
    m68k     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/364084d76a46586088732ffc36b99ddf24604bad |     


Classification of failures by reason for next
---------------------------------------------

                   libnss-3.84 | 11
glibc-2.36-66-ga1dc0be03c9d... | 8 
          imagemagick-7.1.0-51 | 5 
                   aubio-0.4.9 | 4 
                host-go-1.19.3 | 4 
                       unknown | 4 
                elfutils-0.186 | 3 
                      xz-5.2.7 | 3 
                   bdwgc-8.2.2 | 2 
                      crun-1.5 | 2 
                     efivar-38 | 2 
                  gensio-2.5.5 | 2 
                gerbera-1.10.0 | 2 
  gobject-introspection-1.72.0 | 2 
            host-binutils-2.38 | 2 
              host-rust-1.65.0 | 2 
                libkcapi-1.4.0 | 2 
                tealdeer-1.6.1 | 2 
/home/buildroot/autobuild/i... | 1 
  binutils-arc-2020.09-release | 1 
                  boost-1.80.0 | 1 
                 dash-0.5.11.5 | 1 
                   flann-1.9.2 | 1 
                flannel-0.14.0 | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
            host-binutils-2.39 | 1 
         host-gcc-final-11.3.0 | 1 
     host-moby-buildkit-0.10.0 | 1 
         host-sentry-cli-2.8.0 | 1 
host-spirv-llvm-translator-... | 1 
              hyperfine-1.14.0 | 1 
                  jack2-1.9.21 | 1 
libeastl-45469730d641868ce0... | 1 
               libmdbx-0.11.13 | 1 
                   linux-6.0.1 | 1 
                    norm-1.5.8 | 1 
                  ntp-4.2.8p15 | 1 
                numactl-2.0.16 | 1 
            ocf-linux-20171122 | 1 
                 openssh-9.1p1 | 1 
                 pango-1.50.11 | 1 
                   perl-5.34.1 | 1 
          perl-net-ssleay-1.85 | 1 
                    php-8.1.12 | 1 
              procps-ng-3.3.17 | 1 
         s6-linux-init-1.0.6.3 | 1 
                  scrypt-1.3.1 | 1 
              skalibs-2.12.0.1 | 1 
toolchain-external-codescap... | 1 
              traceroute-2.1.0 | 1 
             uccp420wlan-6.9.1 | 1 
                 uclibc-1.0.42 | 1 
                          udev | 1 
               valgrind-3.19.0 | 1 
                 wolfssl-5.5.2 | 1 
               xfsprogs-5.14.2 | 1 
                 zlib-ng-2.0.6 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/577ed953bd72a94a0594a30d29b4f4d57729fb96 |     
microblazeel |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/1dfafce081e73ea7268a0ad0f8827ae7d0c432ff |     
    i686     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/de720a0476537c1c560e09fca0f5da2cece25976 |     
    sh4      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/f85905db4bb1b22c7db4a95cc297afb7a4ddca1b |     
   s390x     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/f20718cb40422e81c02570f45eebdd11a86d0972 |     
  riscv64    |          bdwgc-8.2.2           | NOK | http://autobuild.buildroot.net/results/96202121c042bb30ed25ab75b25aaf27f3353073 |     
  riscv64    |          bdwgc-8.2.2           | NOK | http://autobuild.buildroot.net/results/494047c128e8a623359c27777d0c1501a4128220 |     
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/ea4eea908c0a1a5032a657f6cc2bf6adb669a5b9 |     
    arc      |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/9ce5e73afc14fc4d8c66b939961cb7b0e43723dd |     
    or1k     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/934111122bded6ad99fed89b475bc729a24ef1ea |     
    i686     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/ee0c80a378c8d082812dd1fd3950df60b9a381f9 |     
 microblaze  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/f4c9404fa32596659cd6c06ef6cd0d09d56de107 | ORPH
   x86_64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/73276ab47e601c327a0cd17c596fb3b0eb606398 |     
   mipsel    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/0209772653e21013fbc2b68ede42b453531f8027 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/27bb2f665427c42dd8b2626c70c0820fa9bc68cb | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/cf39ac8da9f5b17644d0051e1d0a4ced3522d205 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/b2328c26cb058308d6943bd449967ea97a64a33d | ORPH
  mips64el   |          flann-1.9.2           | NOK | http://autobuild.buildroot.net/results/dfad9ce87f9d2c0762e2aac9722ca3380241bdf8 |     
  aarch64    |         flannel-0.14.0         | NOK | http://autobuild.buildroot.net/results/cb872cbd45cc06c09570d9db72b7ffcfec343089 |     
   x86_64    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/44f9efc800fcb188a423bbe2c0af703930ba4972 |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/9ad4afe195fa9a0f322898b32fef986f1e809eec |     
 aarch64_be  |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/ba08af1823c645dfaca390bd1b6f92e767ff9b72 |     
    arc      |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/2be0f002acd0f5f2ff7e6ef99b47ef2f4d3bcf1f |     
  riscv32    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/626b0a493610738292c96eabfa89c6e35be988b5 |     
   sparc     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/03fdf4ad9396b50ecada979df447cab860c7af6a |     
   mipsel    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/4b555d67d78134b80d733ff99a8c1ef80908bc48 |     
microblazeel | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/f33be64ea94b3d4eb88a7cbccc7128e43fe0f4d9 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/0fc66939f838435b1b32c59ca69c117eb061270b |     
   nios2     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/95a7465173126afc1537ae464c5692ea97d16047 |     
    or1k     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/055624f9b37fb58489117197ed3e34502bfe73ee |     
    sh4a     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/10777ac4d1bf206cb3fd22abe13a407886ee361d |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/6a17f97dee8aeb3fd65197c28d21eaaa308127fa |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/c6af13e537be452c16a8817f156cc07115731fe9 |     
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/c04796aba92bc46ef6a13ef18cdf431f9fd0cb1e | ORPH
  powerpc    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/5341bccbb1ab7b0294405e0a31b4ae1e54278161 | ORPH
    mips     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/01f7ac591fd05b81818e131d21cfdc2481fbb2a2 |     
  riscv32    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/db181db7a9985a16a1260b89b555e2026cdd415a |     
   mips64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/88d940139362f88c0045dac5eaa447a5a5a70fb4 |     
microblazeel |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/b5743cc5795a72c78e31592fc01f03d2d7100e7f |     
  riscv64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/5af269aea72b455ee87d80cdbe859234c2120464 |     
  aarch64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/f8f7ab5be2c4ec90c3096271b4e61fbcec8df45f |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/2dcda9734ef255b96cd3ef0fb0d802a2280b562d |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/b8ded40a45aa58de4b87de9f2993ea2c3b6173bd |     
  riscv64    |   host-moby-buildkit-0.10.0    | NOK | http://autobuild.buildroot.net/results/1040eead8f0f2fc47cc158c9d34f2429b98f9e61 |     
  sparc64    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/692c1d53c931e5bbc2a95222556aa211e8c49b24 |     
   x86_64    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/12052dbf60baa9c7109ed0ea5c6b0987c0377007 |     
    or1k     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/a639a1a4dbd617878d3a124e07bc318ebf1c86e7 |     
  riscv32    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/c5dad1991a8c2761758f756bb114c084f30a887e | ORPH
   x86_64    |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/414eb6e1b417dc3173f0d9c2865d3a596978ca25 | ORPH
   nios2     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/b3ea762c83b38bcf2fc88c0a9d3cbf98f71b25dc | ORPH
   mipsel    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/1d5201f65fc7544ca5dd1c4ee182ff37eb9400ae | ORPH
 aarch64_be  |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/38e8a5b0eedb7eac89856305f01344e5e7ae8b9b | ORPH
    mips     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/c59087e3809ef39dc8f113b5fef42a14fec34a83 | ORPH
   arceb     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/1fbb737a58c76af1688e1c323f364d3cdb5730ba | ORPH
   x86_64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/82613fe861eff7325bdec9823d6d08132bee7e9c |     
  powerpc    | libeastl-45469730d641868ce0... | NOK | http://autobuild.buildroot.net/results/ad44f0001040b2b32645feb4f7310890abca0bcd |     
   mips64    |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/cd08664678b7939725d0bd0a382cb613ad9206a6 |     
    arm      |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/65fd02cdd88eaf0443a58fc09ea69c80773832cf |     
    sh4a     |        libmdbx-0.11.13         | NOK | http://autobuild.buildroot.net/results/4e3d82af87ea5998bf70ee6ee4975638bd4ea34c |     
  sparc64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/0afb0f589fc984e105f1c0715b1abe7a59ecf6b2 |     
   s390x     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/89c1f4ddb3be06dd37d29cf3569025541c0239d5 |     
   nios2     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/b23d153fdf12386382694f85a4496839b7bc6c2d |     
   s390x     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/9a0996e33cc5e5041be472dae0b44612dd1944e1 |     
  sparc64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/f83c8b03da5dd7a456615618c00560f6af30622f |     
 aarch64_be  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/8fbd9e8a58c9211b75f9de5ad69e534e0c666281 |     
    arm      |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/c65c3e50377ca578d8c113a610dcffa1d6a36781 |     
powerpc64le  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/daffe1d541d45bd93b6889922ce49c1ae31651e1 |     
    or1k     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/fece42dc607febbce0ce48ecf97453e4f1ed7d07 |     
  sparc64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/5f4a2c0655f14bef075c096b94c6de397eb52157 |     
powerpc64le  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/e765b6aa38e1806c0bad04097eb26b4cd80a30e0 |     
   arceb     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/a4ac4acad94b9ae5c8d34024c5174355eae83d60 | ORPH
   sparc     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/5c6302a03afccc8a2c5324876499aa94541be215 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/50a397f90a2c8be9e078b745fc49fbab7d4abed8 | ORPH
microblazeel |         numactl-2.0.16         | NOK | http://autobuild.buildroot.net/results/af28172943829268155b37707ee4b8a4400b8820 |     
   mipsel    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/1c0d0b9961ec86a433d2dcd2c7067c98200500f9 | ORPH
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/38de0d735218164fb263a4b15cf58950fc073f7d | ORPH
 aarch64_be  |         pango-1.50.11          | NOK | http://autobuild.buildroot.net/results/9dbcb1d72d8de6b874adb0e31a29c31aed677a1f | ORPH
   mips64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/c7a7a2f1253ce47595ee1b59f3dcaaeb72b7983d |     
 aarch64_be  |      perl-net-ssleay-1.85      | NOK | http://autobuild.buildroot.net/results/d6ae8cf90d280c555785cbaf6433cdf146582a10 |     
microblazeel |           php-8.1.12           | NOK | http://autobuild.buildroot.net/results/df71209ec0d72c9729b7ce55fb52df6f5796cc8a |     
   s390x     |        procps-ng-3.3.17        | NOK | http://autobuild.buildroot.net/results/4c015d3d5720170e9cf6923622d6e6e2b90fad38 | ORPH
 microblaze  |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/955abd1a331a332fbdb2a4e0779d18d001800bef |     
   arceb     |          scrypt-1.3.1          | NOK | http://autobuild.buildroot.net/results/75e2c2ade8cb691a9942d6e639df5cf0c1a728f9 |     
    or1k     |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/106e452a5197d32bb53c3a88477250cf033050ba |     
powerpc64le  |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/1d0d0c70fca97e68e7e38960437e01001728f4ae |     
 powerpc64   |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/d9e822806286d99d28140facf6f32530ccaefc5a |     
   mips64    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/1d8cdb9958e0fc65903cb33b4c28598f8a566ac6 | ORPH
    or1k     |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/2aab313f742b4d031fc2c96ff1cfbaa813498d8a |     
    arc      |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/b5a9af95f4006686c34d0470c01aace44573722e | ORPH
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/838d3c0a916f5a14085bfa99fa346407c3f1bab8 |     
  aarch64    |              udev              | NOK | http://autobuild.buildroot.net/results/72e5ec2f1436b20016c59194141778404b2c3b72 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/b4696bf1c423b5c80f4acc75cd5b53fa9e39fe46 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/e69782507807b1044017e32e8a759d61ef828e02 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/1ca6c451e6b178e875dc6bfcf13a4d68580ab0dc |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/70e22f7fb6bf56b9f7acafd5d478efcd0b397748 |     
   mips64    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/74eb925bb4885ffce88952924868e627e0b355c7 | ORPH
  riscv32    |         wolfssl-5.5.2          | NOK | http://autobuild.buildroot.net/results/4636ac77c9a318cbc22dd1e84371ae680575c4a9 |     
    mips     |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/1ad71cdda02bbcf75bee51fcf8b61ad4c8314f94 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/83cb9edab95076333dcb9ccce3d32e69c5ab31ed | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/9fdb2ca6f3d0186d45fe6eb72bea7a53d91bb18b | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/6456bc61307dde95016d8ae73fe6ef68829800d3 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/cd4b566ca6da0d041c7f5e8e9cc66857503250c3 | ORPH


Classification of failures by reason for 2022.08.x
--------------------------------------------------

              host-rust-1.62.0 | 1 
            igd2-for-linux-2.1 | 1 
          imagemagick-7.1.0-51 | 1 
                 pixman-0.40.0 | 1 
                 uclibc-1.0.42 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/a742bcc841f5655070d9c9ad1e8c61880184340e |     
  mips64el   |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/57456aa1cd04917ee0e760e9619150fe9fc8675f |     
microblazeel |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/394e6d7734b27bea5fc48c21b4bbd822a69af267 | ORPH
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/4eba16b1639eb626d13c9c420c7ba0d8dfafe768 |     
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/59e66384e430d04724100d02f6bfa530d214b956 |     
 powerpc64   |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/4f9ceae3cee1e8e74d937891b5657b79fb3d9672 |     


Gitlab CI results for 2022-11-14
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
        TestPythonPy3Argh | https://gitlab.com/buildroot.org/buildroot/-/jobs/3316432002  | ORPH 
                TestRedis | https://gitlab.com/buildroot.org/buildroot/-/jobs/3316432102  | ORPH 



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

