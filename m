Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71AB8C433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 06:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D221C61016;
	Thu,  6 Oct 2022 06:41:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D221C61016
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XvfUEhclEdQl; Thu,  6 Oct 2022 06:41:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8AEA61012;
	Thu,  6 Oct 2022 06:41:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8AEA61012
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ED0401BF31B
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 06:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B221D61012
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 06:41:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B221D61012
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N_9_TPigfUJd for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 06:41:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7145261010
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7145261010
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 06:41:48 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8DCE310000C
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 06:41:45 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 06 Oct 2022 06:41:45 -0000
Message-Id: <20221006064151.B221D61012@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1665038505; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GbXz0Ar7QzRVfPAOHlDapYcO08zfhb2vSK/HcJPnc+U=;
 b=Kiu41aP5ELs6SvQfgoyLXq05ajIBXsjYFRlK+2vAE4OeEQmRonENRoG3rbh+o1L15Etsf3
 knc1x3xnlUqmp41Fcy49SCL5t19fS39EjC+VSUiDq9/crV2BqQwot5ouUQzwZyaMq68z/e
 bz8Y/rCVK28VqYXxjL3NTSBdFUSFq6SZzKXBoQWA9Jlb09A/mefiN7by+f4OiO87ZjCPEg
 IRJWMZkh+hBO2pFKNYtwf4/k+XuTcyYL78WLHw4PMHN0Jchqdl2mmeeB/Xa7OT3Lbsm+yd
 bJEPt5/7291cfEjPepdKqM7lpbXGOcbHU/SYeKJ8LnDU1E8JhgvkMzURfn+x+Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Kiu41aP5
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-10-05
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

Autobuild statistics for 2022-10-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  4  |  1  |  0  |  5  |
  2022.05.x  | 19  | 11  |  0  | 30  |
  2022.08.x  |  5  | 10  |  0  | 15  |
    master   | 180 | 395 |  0  | 575 |

Classification of failures by reason for master
-----------------------------------------------

                      crun-1.5 | 31
glibc-2.36-44-g2628500f5dff... | 24
            host-binutils-2.38 | 16
                  autofs-5.1.8 | 15
        host-f2fs-tools-1.15.0 | 13
        host-sentry-cli-1.59.0 | 12
                host-go-1.19.1 | 11
                 sysvinit-2.99 | 11
             host-cmake-3.22.3 | 10
host-pahole-73383b3a39afe86... | 10
       host-gcc-initial-11.3.0 | 9 
            igd2-for-linux-2.1 | 9 
              libarchive-3.6.1 | 9 
package/acpica/acpica.mk:40... | 9 
                 linux-5.17.15 | 8 
            btrfs-progs-5.16.2 | 6 
                   hdparm-9.63 | 6 
              host-rust-1.64.0 | 6 
                    lxc-4.0.12 | 6 
                  gensio-2.5.5 | 5 
               libglib2-2.72.3 | 5 
                 systemd-250.4 | 5 
                       unknown | 5 
             acpica-legal-info | 4 
casync-4ad9bcb94bc83ff36cfc... | 4 
  gobject-introspection-1.72.0 | 4 
                tealdeer-1.5.0 | 4 
                 uclibc-1.0.42 | 4 
dahdi-linux-5c840cf43838e06... | 3 
                elfutils-0.186 | 3 
                gerbera-1.10.0 | 3 
            host-binutils-2.39 | 3 
         host-gcc-final-10.4.0 | 3 
host-gdb-arc-2020.09-releas... | 3 
                 host-lzo-2.10 | 3 
           linux-5.10.115-cip7 | 3 
                   perl-5.34.1 | 3 
            quickjs-2021-03-27 | 3 
               apcupsd-3.14.14 | 2 
                  boost-1.80.0 | 2 
                    brltty-6.4 | 2 
              dieharder-3.31.1 | 2 
                     efivar-37 | 2 
                 fdk-aac-2.0.2 | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
         host-gcc-final-11.3.0 | 2 
       host-gcc-initial-10.4.0 | 2 
                host-gmp-6.2.1 | 2 
           host-python3-3.10.7 | 2 
                libglvnd-1.4.0 | 2 
             libgpg-error-1.45 | 2 
              memcached-1.6.16 | 2 
                    musl-1.2.3 | 2 
toolchain-external-codescap... | 2 
                wtfutil-0.41.0 | 2 
/home/buildroot/autobuild/i... | 1 
android-tools-4.2.2+git2013... | 1 
                  assimp-5.2.1 | 1 
                  bcg729-1.1.1 | 1 
                 binutils-2.38 | 1 
                bitcoin-0.21.2 | 1 
                  botan-2.19.2 | 1 
                  cairo-1.16.0 | 1 
                  check-0.15.2 | 1 
                  cjson-1.7.15 | 1 
              containerd-1.6.8 | 1 
           crucible-2022.05.25 | 1 
                 dash-0.5.11.5 | 1 
              dropbear-2022.82 | 1 
        edk2-edk2-stable202102 | 1 
                  faad2-2.10.0 | 1 
             fontconfig-2.13.1 | 1 
       freeradius-client-1.1.7 | 1 
fs/axfs/axfs.mk:32: /home/a... | 1 
fs/cpio/cpio.mk:117: /home/... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubi/ubi.mk:51: /tmp/inst... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                     gmp-6.2.1 | 1 
                       gsl-2.6 | 1 
           heirloom-mailx-12.5 | 1 
            host-binutils-2.37 | 1 
              host-delve-1.8.0 | 1 
         host-gcc-final-12.2.0 | 1 
       host-gcc-initial-12.2.0 | 1 
host-gcc-initial-arc-2020.0... | 1 
              host-libcap-2.65 | 1 
                host-pcre-8.45 | 1 
               host-runc-1.1.4 | 1 
host-spirv-llvm-translator-... | 1 
              jpeg-turbo-2.1.4 | 1 
                   json-c-0.16 | 1 
      libabseil-cpp-20220623.1 | 1 
                libcurl-7.84.0 | 1 
              libgcrypt-1.10.1 | 1 
                  libgta-1.2.1 | 1 
                   libnl-3.6.0 | 1 
                   libnss-3.83 | 1 
              libostree-2022.5 | 1 
                   libqb-2.0.6 | 1 
                libselinux-3.3 | 1 
              libudfread-1.1.2 | 1 
         linux-headers-5.17.15 | 1 
            lttng-tools-2.13.2 | 1 
         mxs-bootlets-10.12.01 | 1 
                  ntp-4.2.8p15 | 1 
                  ntpsec-1_2_1 | 1 
            ocf-linux-20120127 | 1 
                 opencv4-4.6.0 | 1 
   openvmtools-11.3.5-18557794 | 1 
              procps-ng-3.3.17 | 1 
           python-numpy-1.21.2 | 1 
                python3-3.10.7 | 1 
qt-webkit-kiosk-a7720e50f2b... | 1 
rtl8189es-39c17661136da48f8... | 1 
                    rtty-7.4.0 | 1 
                    sdl-1.2.15 | 1 
                    stella-6.7 | 1 
                sysklogd-2.4.4 | 1 
               valgrind-3.19.0 | 1 
                 wavemon-0.9.4 | 1 
                 wolfssl-5.5.1 | 1 
                    zstd-1.5.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/3cd106b5b52b011aae0759f57567bfcbd22c68df |     
   nios2     |       acpica-legal-info        | NOK | http://autobuild.buildroot.net/results/9d9479f30d1261a3867230cff73182132cff6fd6 |     
    mips     |       acpica-legal-info        | NOK | http://autobuild.buildroot.net/results/e9bc2a3a206576f59331b6609752735e5bee492d |     
 aarch64_be  |       acpica-legal-info        | NOK | http://autobuild.buildroot.net/results/95a94787c556bbec4f5f994581092e03066128d7 |     
 powerpc64   |       acpica-legal-info        | NOK | http://autobuild.buildroot.net/results/d048b7d5570651613219af5f1791459af318d445 |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/91609390ce820fdcef36890095a619806284b110 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/50c2669055f103b1e003b35ffa6cdcbf628ac70f |     
   arceb     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/8501843aad0e70ad6d5dade6060b5e248c3b709a |     
   mipsel    |          assimp-5.2.1          | NOK | http://autobuild.buildroot.net/results/0b1ef0e272235600f5e9bb9e4825568def354906 | ORPH
    sh4a     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/2fde5215729db02dcb969229b43f2a0d7b727ce0 |     
    arm      |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/5f998022cb0347defc9a6528f902d0803f948949 |     
 microblaze  |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/6c15e85848739c148a2dce7a34b1cd4872f1fe5a |     
 microblaze  |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/9ccd1ea55e60d08bc39f3a7beb9d110e65d92ac5 |     
  sparc64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/d85284c1ab2ea75c0e30f6873f27038c96a75180 |     
  aarch64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/797794e17cedd3417a792390866bb079e7c00840 |     
    arm      |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/236ee8b0a7c94a2e24b730ac22036acc4609b137 |     
    i686     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/9a810d4606cc00765240e425a70ef82cc179e159 |     
   mips64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/884952100a4328360b93623832fa6c6ffb096ea7 |     
   mipsel    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/ce5db4faf547a7c0e462514d3686c803a0e113fb |     
  mips64el   |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/30622b9468f5e53096e308ce8ccf796ab26fa9aa |     
  sparc64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/ec0060c8e3285038860792b99e3a43cc05204682 |     
   mipsel    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/af924276c6f8c9b9a72a5b0505f55e64508600ff |     
  mips64el   |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/d6fb25cb565c39cc99212556c4fa653484b9cfce |     
  aarch64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/ce423da208c3e26d8b4cae7f62fa93e6339f3cb2 |     
  riscv64    |          bcg729-1.1.1          | NOK | http://autobuild.buildroot.net/results/6016f0705531499a89e1415409f258f8d1b9e2f7 |     
   mipsel    |         binutils-2.38          | NOK | http://autobuild.buildroot.net/results/39cf94c193f3d8c2899a7dc71d51761968f4e9db |     
  aarch64    |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/03495fd7b2a67a6ab40b55bc8e09f6c543f7965d |     
    arc      |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/5f713e509bccc72320a9babc95d873c8808e5331 |     
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/d20e1553dee6b89df5fef063b0bfd6295be1ca12 |     
  sparc64    |          botan-2.19.2          | NOK | http://autobuild.buildroot.net/results/4aafab65ab964beaca144617bfb4949884537305 | ORPH
powerpc64le  |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/1a7169f683df11442122201fa0db5efd00de0e28 |     
   mipsel    |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/d7f68b6570bf1a1e3012e8bfa017b23f3fa073e0 |     
  aarch64    |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/e32ebf1c13e83d30af00bb818d04602c923b6e47 | ORPH
    or1k     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/9f4089a5aff43327e7715e3503af0b4d679ac0fc | ORPH
 microblaze  |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/96ba04fc28908f0dc48ab4878c157e4bd44ddca7 | ORPH
   sh4aeb    |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/801872b8e92ded6695b3fdf4f6ef6bbba1e41e1c | ORPH
 aarch64_be  |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/0a489651e3a6d5d022f1ae5d10039833cac63e85 | ORPH
 aarch64_be  |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/fd6bb0811fbe423c9423476f88c0fe008cbf1006 | ORPH
    or1k     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/8d7d3ec9464c0e0b7595c5d583ef9e02fb463e75 |     
   nios2     | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/ee606607992eb9ac93206ba57f8f70caf717033b |     
  sparc64    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/81b921ef5561479ac5a1e6cca102c20549d91296 |     
   s390x     | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/5ec4d65da580feb37759aad5dd47a0a2a8c8892c |     
   nios2     | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/992e349152823acc729bfbd1b4c2d93b945920e7 |     
   mips64    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/38a41214af0422f4cb7e87f7ba1b59991772ed4e | ORPH
  riscv64    |          cjson-1.7.15          | NOK | http://autobuild.buildroot.net/results/8d09b65eb15026caa80fcb1069fa75ff178ca347 |     
   s390x     |        containerd-1.6.8        | NOK | http://autobuild.buildroot.net/results/055afb8f34f99d0171f81640e362deb88a501fd4 |     
  aarch64    |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/051c06845046054094614f7825309a5eac472fb4 |     
 microblaze  |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/958ab2ed8e165b78db79488f2fc2e54facccd7a4 |     
  riscv32    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/fb6da040ef5af1a689c0a17a31f1aba7f5902235 |     
   nios2     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/e310ff84e73146ea0e1b2837207c873a670a7d1a |     
   armeb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/257241273359cb65e15cbe8fdeca56c3ebbcd98a |     
    sh4a     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/8fb08a3db11ce5b44eed2a9c6e55e52fee63fea7 |     
  mips64el   |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/3fc492b6a6f3b3033ef774e126d409fb067b0625 |     
   x86_64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/264d56ced51821da3a023a2e9b6c7049c5161249 |     
   mipsel    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/d92a37a91ecc8a8345a9420a2daba8ce1a056f33 |     
  sparc64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/ba424496d4d53fec21ae0b6451bb92edce16874a |     
    arc      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/6b66ce4884a467bd57ebf418d9260adad2d5e231 |     
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/83d3a391c918d87c51aabf8b602c2725f9f82df3 |     
   xtensa    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/5c2d4bfa3b1641b104476aceb78be6c6e0a1ad38 |     
  aarch64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/d872f7d5fbdfa32b557d90e26e023e51c99ce739 |     
 aarch64_be  |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/1b75d4200b9d98844dc5580b0796888efb89fb45 |     
  mips64el   |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/702a82b963915249de51325a9ea8dde95fbef9b9 |     
 microblaze  |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/4f9f8899f427736a1106501860eecee31fcbab91 |     
    mips     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/5ef4d5e4f047e599619e0e0602ae6a07b3d49caf |     
   mips64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/c0bc8dea0cca5852ecc717be87157d24f44f8886 |     
   arceb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/1ebcb38dbcfced98c5deea3c2a6a71cbaee8b7e0 |     
   mips64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/c01e5eaf8c06655616a262596fbe450c75a63959 |     
  mips64el   |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/596b9b6b5b01f3fbdb1edb3da55f58bb46083af2 |     
  sparc64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/88a79b26efb0c484bb872861545adab60f95d1cc |     
   mipsel    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/98b556a61b7870eaf1b4c107067951836bee0856 |     
  mips64el   |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/3738fa596e02b0062d91e8adb4b6e833d222c296 |     
    arc      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/33555158e68969659803f6b1e0c7b388dba31a9f |     
    i686     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/c3c94516d67e522835d3d0351e2d968a8d2ee4c6 |     
 aarch64_be  |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/ab186e07284c13ad156ee91a356f457af1309cd1 |     
   arceb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/3f3313946e0def8220070cb855034c5b443adb43 |     
   x86_64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/f0812048a9a8321a9e4411f35c9d908baf6f5ea6 |     
 aarch64_be  |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/a6b24011bb92a6615687038a34f7864dff98376e |     
   mipsel    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/6a4ad730f72f93746ba3d37ee84bb789ff70529e |     
   armeb     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/712ab4a6f02e3c3ccd3e30015890cbcb0ecfc7e0 |     
  aarch64    | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/61b4d165ba40709512133d858abcf002e6d38162 |     
 aarch64_be  | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/cf94d1fdd86e410d881bf6a1fcc84c7551800e87 |     
 microblaze  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/b9d0ff1622015a7274d35d1a6cca79194dba4481 | ORPH
 microblaze  |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/dce071b4364184d73c3e9b8e5993f627b7c1c7b8 |     
 microblaze  |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/222ede270a1221b991065671a97e6a913d78fe68 |     
    or1k     |        dropbear-2022.82        | NOK | http://autobuild.buildroot.net/results/6a76f2e69026e5fb4199999dbc36f7d98f6e6591 |     
  aarch64    |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/7ae67075cbf52b9d63693ee1d6d13b69b8a0bf36 |     
    i486     |           efivar-37            | NOK | http://autobuild.buildroot.net/results/d108dfab0b34b6454c3b49d9d038ae15d9aed85b |     
  mips64el   |           efivar-37            | NOK | http://autobuild.buildroot.net/results/c165f6020f5ef6c8f566546358b136f24175ee9d |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/ebb72edcb04af2ea3380bbe2eeb9ec7bb242c117 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/8ad6e1d338b4c1867350928933c527a3ae10ddf4 | ORPH
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/17fd3ea7eba6d63be699b28d2e07df717d26a036 | ORPH
    sh4a     |          faad2-2.10.0          | NOK | http://autobuild.buildroot.net/results/9ce3dc547587357a849372813c12aa1c5fe4e81a |     
   x86_64    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/a75db18ef35c05567a969ef02f890a1cbb0283d7 |     
    sh4      |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/4cf1a0ea0b5737a1bb9a70c6b8aad38c258139da |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/602421847a0a635b619aa589858b247f22a7fd66 | ORPH
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/3785c36781adea77a6c0a2d68353ca29e856cab8 |     
   mips64    | fs/axfs/axfs.mk:32: /home/a... | NOK | http://autobuild.buildroot.net/results/eda3e07f289f9473719bea7aaa40b8bd963d8d32 |     
   s390x     | fs/cpio/cpio.mk:117: /home/... | NOK | http://autobuild.buildroot.net/results/8abd7312ced88c0d4778b88b1143cd80dc0e52a0 |     
 powerpc64   | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/04eac64d1f22ffa0e5deb9bd49325b04335aadd3 |     
 aarch64_be  | fs/ubi/ubi.mk:51: /tmp/inst... | NOK | http://autobuild.buildroot.net/results/4d330201948a5ea0418ae2c0296258f4e58b7fb6 |     
  powerpc    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/4afc11ac62a19a4bad18132675e1245a009f9e76 |     
    arc      | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/89c5b0e3019c3a28e56d188639d6841b8a7cb69e |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/33e562e72ea8a0727e0606637bd15e14aeb1effc |     
   s390x     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/0f7a45e7509cd18abacfe180bd0dbc7faa671e74 |     
  powerpc    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/44e51c5f4734ff19955ee4ca5fb3aa5d35588f67 |     
   sparc     |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/5f5cf0c17efa99d698d1392e3c370ab130527f11 |     
 aarch64_be  |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/b3c47d7f5f15ec7e446e94c1980ce2740eb38492 |     
   sparc     |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/a9374a01bb51b57379b3fddc68817c1214b07313 |     
powerpc64le  |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/75f47c04d17291649e819419b7c51f9ec1308c1a |     
    or1k     |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/e92fcfadc34eda383da986250424ba590d076024 |     
   mips64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/2e67a53c75592b66e87dac67bec81c2e168fe28a |     
    sh4      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/9c083b6d08a7f733f391a7a62e6a049624d676ef |     
  mips64el   |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/dd6d4cac1501efd4b5c68f8bffcbd5d786fe9bee |     
    sh4a     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/283ab0ab172457e534f03cdcc7940268989d59dd |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8cb54ac34109d415985d43c28f603a0cb4af3062 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f39548293d79692c41ca1beb56da579e78846651 |     
    sh4a     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/86792fb815231e22465b67c1af9c524e92aa2cbf |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/30e9fd7b564a5305f5200b09b5ca0da7e23ebea5 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/faf901a7b49beb845f571cb06759ce389e8d17dc |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a79a932fd8c9c3079c60c0d992702460ad0d5bf3 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7f9df5e70f12ba1d7dab09f53ec1a33e4a4cca5d |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2cb38cd80024a46cb09e721082d6eca3f8aaafc7 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4d5d3e2feee687f2b80495ca42a8eda39ca35052 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/871bc2a7b9bee02a678e595af4a443def78a7887 |     
   x86_64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/dbbcb4c096e31142f5aac855d34aff670513fbdf |     
   arceb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/86c43289074dc4cf17d30cbfc5b45fd31ca7cc82 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c01f817cd28b46df17e137642447f9e17172336a |     
   sh4aeb    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4cb726b77ae54671c4229debba75e1243809328c |     
    sh4a     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9497818cc0dfdf14964b7a52a091b10b4f6b66a6 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/32e138ee90206fd3320730c1466479e6d5eac10d |     
   arceb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/76899407bb0410d657754ed373ad16b0b4088a80 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1b45e2bbd31e41238cfb4c8e3baffb59f48b6555 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8d5c9e8debe66582eaaa79179941b6a46852de35 |     
   sh4eb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7cddf14ede013861d752472f1ca67484dd9cad1b |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/aab1eb7615c99bf819ca3aac5d8281acf3aa5268 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d568e967bdceaf441970d3d27ad8d62d12a222e5 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a7678744c76463b27e00974a8d13785dee46ae7f |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/7612c3cc3d983f9665c8d839b17772f7772d32c0 | ORPH
 microblaze  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/3efbe245d56fc3d654368c16af6297a637c56c2b | ORPH
   mipsel    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/c44bcfdb3479ad39451490bb61cbbcef250372a7 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/41e113fbae4284437d5f0a8b778d31193583d718 | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/6b40206b6296e3d8869caa09d0e4039fe598b4a4 | ORPH
  powerpc    |            gsl-2.6             | NOK | http://autobuild.buildroot.net/results/e5aa8dac401368587b0c007e405d3f64f3bd65d0 | ORPH
   s390x     |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/2ffb3b2a3a306a9da5058a7a43cf0b09a7ea1881 |     
   s390x     |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/a9ecde22c5702139f9549217c5dda8671d0636e8 |     
   x86_64    |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/92d5c48af045c5f42a2ea891d793894334fde13a |     
  riscv32    |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/b2fb16195dfad3e37d1a4a8308e5710ee24d88a9 |     
  mips64el   |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/b844dc1dfb999d03771199a52d38d2069ec14773 |     
  sparc64    |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/d86e612cdb5e9ef1a9f1d88f2516e61497d5af4f |     
   sh4aeb    |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/14ba95ac73b7e12b8948a3b33a1a57f660e54fc3 |     
    sh4      |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/936d756a66f42cf28314a129725016b961103dad |     
  riscv32    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/55b1fc81dd31c44728f0e2e21330a207a28fd441 |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/b070316213b0e99d66042d8b39c3440e23f6bf16 |     
    sh4a     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/73d7c61014ee433b3ac6f0055ec7ef97ff349f8e |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f116ec75f8de0e63ea01de32e33cc77846f8e79d |     
    sh4a     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/9ca46406235c24416e48f117408ee607c88bc2b5 |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/344706adf3362212254029177235030e5454a402 |     
   nios2     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a3d96ba3e7966f2439a06a7742143f499e71a1d1 |     
   sh4eb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e3a61a7983faa4eae771969488a5a9375b927dc3 |     
    m68k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/db089c1d3d896d7515eef90e8ca50f86a8474640 |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/baea360c9ea5b8d7f3c7290dccc58ffad2496baa |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/6fedaf50a4b8a0c74fb684e534f1c370df153fc4 |     
   nios2     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e4cf134ee15748ef036f6f4895733066210356aa |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ae52e74e781b7d55169a07bd7ee332a259f6e6b6 |     
powerpc64le  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/2c6326f9607d71e3b7e203dda0f963216fd84c36 |     
   nios2     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/3f10ca9f9e5ad3c35262a0bdf30a7c8a040a48c1 |     
  riscv64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ffee2f749f37b6675076bb285a8759c586922290 |     
   s390x     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/79cd053b0245b5f89b88135b2997e7d0ed6c30f7 |     
    arc      |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/3a97084d02ff3afde5a64c36c5477cacf1f5b07c |     
microblazeel |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/22c1794bb8f87c4433712e8632d90694af8e8e8d |     
    or1k     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/b073b6db135a1457e0eef6260b83c09beaaa86ae |     
powerpc64le  |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/5ac026553cad49a3ada3aa48fe8048f3d3d35015 |     
 microblaze  |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/57b7f62a444c95ea33c36a43ba3f77aaaaa983dd |     
   arceb     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/58807d4717f692a0e318c26f5545dba49eb4e9b6 |     
 aarch64_be  |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/b3f319065ee50f23f90217dc13e8c92a8630d8cb |     
    or1k     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/f93ead85280ffb034233a5fa416c8481f7b0083e |     
  aarch64    |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/3805fd1886b7b26533e82ea340d1ef42493bd469 |     
powerpc64le  |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/d1c6a5295551309ded20c3593e11afd517eb2cf3 |     
   arceb     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/47e87d7826872f4bf84c44e73614a93d4fcf70c0 |     
   mips64    |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/7c013471eab5c61dcc61cad559e5232645777b10 |     
    arm      |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/c1ab0265d41c569231d41262e4595b2c8630d1ac |     
   arceb     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/83c51ee6853e99bf63b513aff2f92fece1a2894b |     
   sh4aeb    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/0054da2e806673ea3373bad02ef7409564b8accf |     
   s390x     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/10dd74f1ca995257186a2aea58338274158903d7 |     
 microblaze  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/accfde92379d5f3c6b7cab4d05049129754918fd |     
powerpc64le  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/1881008d9a52dc2fbdacc6082d33a37d3b630311 |     
powerpc64le  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/6e3bfbaaa138ec6c916924d93707fa7732bf96d9 |     
  riscv32    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/0a58d391a62d16c32efbb9ca58e0437d04ccb6ae |     
    arm      |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/3bfbc270c1b6c0426d1b21e9c933a080b15860e7 |     
microblazeel |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/a3d52ebee93789036e9bd75fbd24e07ccacffdd1 |     
powerpc64le  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/0ab13b7715fe8b47b21d2e1101f93e225c48d50f |     
   nios2     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/b0c0659268d53783f276d1ba24b19dc2480aa848 |     
   armeb     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/ff1603cc89f1b1968f41787210ad387ba5861fa8 |     
   x86_64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/260ff1f54c22388e26f411779aade2c3a75a5471 |     
  aarch64    |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/962ae0a976727581a6a4c6cba91819a9ca0ed9fa |     
   mipsel    |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/4e965fbc043a76fdc04b796909807f2c0ada1bd4 |     
   mips64    |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/007c8201a08c39206110f1e00d4c924bbfe61c03 |     
   mipsel    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/85c0982cc5151a8e26f9cb1aa929ad4c50c0f333 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/6584e5a0f8d39b4df3b839dad21b0b4b8aec4d2c |     
 microblaze  |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/35ba3a8f4ee8c004a8c211681d8bf0c17a0d6131 |     
  powerpc    |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/17a527c54d6ee4ae51c325a3879a80ad9bac45b1 |     
   sparc     |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/88069002a31bbb02bd2232d091105b7452d5000c |     
    sh4a     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/4931729f33ca988f069372800b1d8e729e07d2c7 |     
  riscv64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/307dead51de7baa89fcb9cf3bda984775dee4fab |     
 aarch64_be  |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/2b3e4f05451a6afad4d8a7509aad0545f316d001 |     
   xtensa    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/89b969ef741f9df1bfa8fb5deda9e87c7b6f4448 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/ffa842fa7d687e1894a9115b46273be054ea2f8f |     
  mips64el   |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/f18568987e6458d824741b8275a6894b886d8556 |     
    m68k     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/31cde30a585081af30d00e0c050c7982a3c217ee |     
   s390x     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/06c9111a8229a5f23e4427e80152e10e25721d90 |     
    or1k     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/0a087053a4fdca75beccf8b769ed998ee9d424f8 |     
    or1k     |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/f5b9a71bf79b2d8970fab10cb1039678b696459a |     
    arc      | host-gcc-initial-arc-2020.0... | NOK | http://autobuild.buildroot.net/results/49f70eb744dde01718d3351fb906bc3a6b1d24e2 |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/34987decdc8942e69a5bee5cd361483d579d5b15 | ORPH
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/d3d4c1746c63ddb39cc8174bef12f39cdd746d30 | ORPH
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/c352be4e2f288a9726c840120d38e9f43d4c7d80 | ORPH
 microblaze  |         host-gmp-6.2.1         | NOK | http://autobuild.buildroot.net/results/0d83dd85b0e1ee9e22e872571603499be964d439 | ORPH
microblazeel |         host-gmp-6.2.1         | NOK | http://autobuild.buildroot.net/results/a2e8c3cb5d4f6e1c457fc887effb9be789a8d75c | ORPH
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/fdb2dc415c0851dadb31648e08d12d21e9684acd |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/fc51949ef931284f31ac8c7e0b512eb3816a47e9 |     
  aarch64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/327c4f310ac8022ecdbb0f1984afc1d8663c31c5 |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/dee70d0a06fd04f8f9b15f7f29f2205376eebdc9 |     
    i586     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/5f3239859c73011b5daf9e5fb073b3ab423e16c2 |     
  mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/ea70d95f8413a399455cb2f6e0384dad08c1a2ac |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/a85ce4fb8a9e57f8641a849c9babe50d8b3a5132 |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/6e3467346c622df588fc0ffbdabff91ba2a21e09 |     
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/2390e7ad74639d9390503f39568b8eee3101ff75 |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/3fd4389df929030fb5f6fd029a249826b4d2321e |     
  mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/056a0ad46ad84555663159f9ea50e29802af58e0 |     
    sh4a     |        host-libcap-2.65        | NOK | http://autobuild.buildroot.net/results/f65d611a4774d7e51b391e94699f8cd6c387c42b |     
    m68k     |         host-lzo-2.10          | NOK | http://autobuild.buildroot.net/results/88563315d34568a8218034d366c45b9896e969dd | ORPH
   armeb     |         host-lzo-2.10          | NOK | http://autobuild.buildroot.net/results/a76e968e14ad0b8d2b5c89cb8d2bd870f3676885 | ORPH
  sparc64    |         host-lzo-2.10          | NOK | http://autobuild.buildroot.net/results/7b5ecb7ac144b1b11db55d32d7c0257ae1b0028c | ORPH
  mips64el   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/e9f759ea0ec27dd08f993ce69cd101b3b0f97a6e |     
 powerpc64   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/a3c2c9f787b2b8d5fcef720abb35169647df3222 |     
   xtensa    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/a35e557446915344f887f271e5bc109c1add4ed6 |     
powerpc64le  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/4fcb2392dc9497bad9a50d050c9158a7c9e6c761 |     
 aarch64_be  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/815cf472c5a583b6a24188f6883bd29afb497896 |     
 powerpc64   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/74b9eb06edad89f9e9092d84d6bff5ea1c8b6d78 |     
    i586     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/45102b9fbd5d393922ab9b10a9547d4a659f3ff2 |     
   mipsel    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/85495f89fc827ef33c5aa6bc96e66b57fd7c8b9f |     
    or1k     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/71392437a1e4d229a6c3098dd31f190320a40268 |     
    m68k     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/b1b6c4a1677e87f2f88b62a97743226dbe384468 |     
    sh4      |         host-pcre-8.45         | NOK | http://autobuild.buildroot.net/results/682b1308f7330238cf935f7ea3c26634efcf3c9f | ORPH
microblazeel |      host-python3-3.10.7       | NOK | http://autobuild.buildroot.net/results/788e3bd806ed73be39c9257e0d0852f0060b8524 |     
   x86_64    |      host-python3-3.10.7       | NOK | http://autobuild.buildroot.net/results/1f741e37553f527a2cc4bff5f9c7959e9b3be19c |     
  aarch64    |        host-runc-1.1.4         | NOK | http://autobuild.buildroot.net/results/c7feef14ac5569967c45d2d7ff2c214b35d71d8c |     
powerpc64le  |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/2cb104189329e2bc535433144c27a2b1de1e1a5b |     
   mipsel    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/bb49a204c39911afdb130a1b61c14fe3d87c56e3 |     
  sparc64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/6380da5275e90edee616bed290434fb656a80917 |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/9c6058aa13664e0445b025dc357c5ad121f8ab7d |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/190b000375770bc9aadfad1a9ef9b5baa38b8802 |     
   mipsel    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/92b326e996b357c7fbbd69ae6e9a3b6b848dd413 |     
  mips64el   |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/d98618eb5560c9bdb8d715f4fd43abcd8a211ac2 |     
powerpc64le  |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/2d85e82dce1f4877d699b0e3c81f3cb21b48a35c |     
   mipsel    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/6361e9b2d59535898ca6525f171a4bf2e88d94ac |     
   mipsel    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/32912d94bcba126e95495ac1259ef26dd0a25014 |     
   xtensa    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/1eab5beadd0cfd6576dd90d9a165fe7f985db683 |     
   xtensa    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/f881b59f3f7eddb1fe38cce6b891627293f13208 |     
   sh4aeb    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/2567d82fe0e28916628e7f4ba0db4c19a630e092 |     
    or1k     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/d0e7fe874ff23341b7b7203a6e258de9ffc472fe |     
   armeb     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/5c1ec0f64ee7fe4e515b4b1ac2721bdb7ecd300a |     
    or1k     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/6c2bdcf91ac43d346b55e7a9858bb46eadca576a |     
 powerpc64   |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/1c80469b5efc88877287a5bb13d3bce4ed712f20 |     
 microblaze  |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/2e1b787ac66493c3e3d2b6010677c8cd62fb1b5f |     
    arm      | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/4cdbe8bb21618fe02d10e5fa73deb0f80a373cb1 | ORPH
  sparc64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/fffa25ef13b1bdc32484ced148317bc8449a0fd2 |     
 microblaze  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/b1e335563fcf5a5fb83e2a23d146f1412c044095 |     
 aarch64_be  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/edfafc687b34cbec8d49d56a48f480e0046ec54a |     
    m68k     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/f70bd078919e2cf4ff8fe901cc8d24ff18a01efe |     
   s390x     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/676be29db95925188a161eaea7a1141709ae77a6 |     
    i586     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/4e9973bab6596debe0ba6976a6b6db26c5d258dc |     
  mips64el   |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/997a6151b7cf0cc1987345a03a1b94bc626e6dec |     
 microblaze  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/212db3867dba5281f0944c5c7070e68e86a23f30 |     
   s390x     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/f5a0022eeca10240fc233ee09b1364870b045753 |     
    or1k     |        jpeg-turbo-2.1.4        | NOK | http://autobuild.buildroot.net/results/56fc8b39b297a683042292aa97640ed577d6b2bd |     
  riscv64    |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/61f464d737ad44a3e606f82375072dfb7a631684 |     
  mips64el   |    libabseil-cpp-20220623.1    | NOK | http://autobuild.buildroot.net/results/40594321f7337a1d0b7248670675721b9f82e4bf |     
   x86_64    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/5ba807e1cd103b8b27b4f0848944af40253cccd4 |     
    mips     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/833cf56317799782c08f14c94de51d7e0817fed8 |     
 microblaze  |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/f79ee8c5325ff61dff0ac81c3a1c36a89aab9c19 |     
 aarch64_be  |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/30494cf147a90387c7557213b0cd53380ea5a24b |     
  mips64el   |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/dd5efc4e45584fd42e3920523b08106fd52cb6d9 |     
  sparc64    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/3091f097b53502d54b9331c6ca413ddd3f7ac3f1 |     
  aarch64    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/10306a333cd623d2c3369c72e3aa4f92db3e3268 |     
   nios2     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/2c1fc943883bd787dda371ddf0ec9fc00116c3d8 |     
    sh4      |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/02dcd31c328fb399c4d26ac521adba9e870966cd |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/869cd350387bfdee4294c0af56c164076bea931c |     
    arm      |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/dac2abeab4ab487b289825f59944b9a28e663539 | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/c4497773604d15107eaefa4c5c59570cf06ca29c |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/f605619ed72c2ca240113ccd75a8ba3c32100d16 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/cf8f70d04b5c132abdc3c9936a4799006fab6490 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/e79b8dcd7cfd80e8812f3b2d12d1ff467341ad91 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/fa81249d99edb5d950dbd83788360c86596a5d11 |     
    m68k     |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/d9ddf894ad703a8ece18fde6fdd4eecc237e9d17 | ORPH
    m68k     |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/1b8f4366c7302dbf68bdd6e5ff13666bd5bd7df2 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/562ea0e5fbf65463f7b9e4dbfc11429262ac56b8 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/a3d4560837a4aa6ad23721b701674f0e8a284d00 | ORPH
  riscv64    |          libgta-1.2.1          | NOK | http://autobuild.buildroot.net/results/626820909061252015522835bc13e94d560b9510 |     
  mips64el   |          libnl-3.6.0           | NOK | http://autobuild.buildroot.net/results/7bf57a632aae460dbfc5982cee12d524f0c645f5 | ORPH
 microblaze  |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/5ff90b65dd8dac7c1ae148038d19c9fdd70f5ef2 |     
   s390x     |        libostree-2022.5        | NOK | http://autobuild.buildroot.net/results/f47e5bb15e51870afa8f4a84aca5e4052250f577 |     
    or1k     |          libqb-2.0.6           | NOK | http://autobuild.buildroot.net/results/b41a0cdf2dc693b923802b12ae208e3319edda2c |     
    or1k     |         libselinux-3.3         | NOK | http://autobuild.buildroot.net/results/79c612e9626b70f9ab8528ce42f69388d8120755 |     
   armeb     |        libudfread-1.1.2        | NOK | http://autobuild.buildroot.net/results/4248560949b2a00d7b99382769178accff561c61 |     
   mips64    |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/749d83b148acc1639c124fc4fb716ee9a7a8f294 | ORPH
   arceb     |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/daa5b5077abd76e8dde56b11796db6e882d450ce | ORPH
  sparc64    |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/9551365c36072f9ee4c929c0a50c2c4094ade5f2 | ORPH
  powerpc    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/12a610a849c49a75cb45df4fd6865875a31d6796 | ORPH
    arm      |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/af79cc0f5745d2f05c24a474e05b32e79d3f49dd | ORPH
  powerpc    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/2b5c0d04b1d31e440ba8c37fe6a5bddf39aa3610 | ORPH
    mips     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/ff9669b38ea70114ddf1367823ca9fe9519c066f | ORPH
   x86_64    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/11a9f2595c2119897d9eb2b0632e3efc5c1c2068 | ORPH
  riscv32    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/b03b4962007ed93d000babd3d45341e8e7316b1d | ORPH
  powerpc    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/32e4f3528fa929a4cae79a26563698d87a237120 | ORPH
   mipsel    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/1cfc8d93d68ca54c3e9728890c7b9e9223613ebe | ORPH
  powerpc    |     linux-headers-5.17.15      | NOK | http://autobuild.buildroot.net/results/ab0d8b9d9e6ed68af3265ee300ff96ca22b9a13a | ORPH
   x86_64    |       lttng-tools-2.13.2       | NOK | http://autobuild.buildroot.net/results/6e344c72a14610fc2a0ec3de072f5a7b61a49af5 |     
   s390x     |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/4d4ed5ce8f2846209510f512feab9613f4aa4388 |     
   x86_64    |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/032a5fc642e1ae2adf4a9ecdd746d9ef75a33eb1 |     
  aarch64    |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/6c6e3864b8dc04d42822a6ccaf451b6bb8ae2ca9 |     
 powerpc64   |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/2a0283cfafde46c6ab4fd4ec967f60c758bdacbd |     
   mipsel    |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/62755579ccef6c8de235bba27158357c99eafdce |     
    mips     |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/f107acac1d74dcd77b52495423251e35e180eeea |     
   sparc     |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/ebbc15108c5c9c794d57bbfde02bcca25e82dd51 | ORPH
   mipsel    |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/e302ff7620ecfc5ca308576cbe0769430be0e3da | ORPH
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/b4d70207c737d69eb3f3f803f5fb49493f4fe057 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/324cc0f2231c65200c166e1f1cf63e438f4cac18 |     
    arm      |     mxs-bootlets-10.12.01      | NOK | http://autobuild.buildroot.net/results/498e9ab4129197e8db06a3f5a4eb0468f01d36ee | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/621f529d5182b194f2b96d6032b01eb7255da4d2 | ORPH
    i686     |          ntpsec-1_2_1          | NOK | http://autobuild.buildroot.net/results/8aceb78e9b06185eb56d2f3869df85235c982d2b | ORPH
   s390x     |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/df409fbdd15b828b7f0b474e7ee26a2ac25e7de7 | ORPH
    arm      |         opencv4-4.6.0          | NOK | http://autobuild.buildroot.net/results/cbbfc678ed38e3e05e21d71b70e937798e037e6a |     
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/799986beb77b7a7d62b00664540a594d75d0619d |     
   xtensa    | package/acpica/acpica.mk:40... | NOK | http://autobuild.buildroot.net/results/9c9434c4ec18e893951e4d22a6e364ff747f4754 |     
    arc      | package/acpica/acpica.mk:40... | NOK | http://autobuild.buildroot.net/results/9c64e298c0936fae451ab2ce539598672a178b56 |     
powerpc64le  | package/acpica/acpica.mk:40... | NOK | http://autobuild.buildroot.net/results/bae281ba0a4b20bfe2a9963f7cbf8f3ef78a6a52 |     
    or1k     | package/acpica/acpica.mk:40... | NOK | http://autobuild.buildroot.net/results/4ac9ed28ee92d76326aa5e2287f52e34c4e8ad07 |     
   x86_64    | package/acpica/acpica.mk:40... | NOK | http://autobuild.buildroot.net/results/e031b1801ae40c7bf1a9b72106d7576db9bbd322 |     
   mipsel    | package/acpica/acpica.mk:40... | NOK | http://autobuild.buildroot.net/results/2ef2829d18aacf9b56d6ea268940945a746bebeb |     
    arc      | package/acpica/acpica.mk:40... | NOK | http://autobuild.buildroot.net/results/91b21c339346cedbcf8fa7bd623dcc48098352e8 |     
    mips     | package/acpica/acpica.mk:40... | NOK | http://autobuild.buildroot.net/results/0e27ac019ad3bcac168b89452251071ecf3eb996 |     
  powerpc    | package/acpica/acpica.mk:40... | NOK | http://autobuild.buildroot.net/results/13cb41484e7d9e24cc0f6b15282c6ce8cc6e0f1b |     
  mips64el   |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/7775c8946aabf0bd7b0dc623eb071806ac034a9c |     
  mips64el   |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/dd808f88c22aeea26addb79cbfa52dbc4982cfa5 |     
  powerpc    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/09ffc05f0e3202bc068d531b70b1a98a5cf41744 |     
  sparc64    |        procps-ng-3.3.17        | NOK | http://autobuild.buildroot.net/results/e32d9cd8fa67cc5012d2c504f14f4fea427b7cd0 | ORPH
  powerpc    |      python-numpy-1.21.2       | NOK | http://autobuild.buildroot.net/results/9d484300ea78c627fe4ade50cbc5f20b2732e29c |     
   arceb     |         python3-3.10.7         | NOK | http://autobuild.buildroot.net/results/0a8d5cf2346c0e4f37ceb507ed6886b954474768 |     
    i686     | qt-webkit-kiosk-a7720e50f2b... | NOK | http://autobuild.buildroot.net/results/14c4f7f9f674b54c91df87e3ee93bdd554fb31a4 |     
 microblaze  |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/3e69bab7b618093b3638ed4e4aee7957cc916a53 |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/b27007811f1488adffbf0e1d440457dafcb8ebf1 |     
    or1k     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/493e8696826ccd23b40e1747c5d3451ff163f906 |     
    mips     | rtl8189es-39c17661136da48f8... | NOK | http://autobuild.buildroot.net/results/074df1426929c3a24b83e25f74bcf6ce2ccb9b21 |     
   sparc     |           rtty-7.4.0           | NOK | http://autobuild.buildroot.net/results/16422af9469de114e552124542508c3b18ea8f19 |     
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/0bebf7dd427b1e047345d16d1e708c5f6fca3be0 | ORPH
  aarch64    |           stella-6.7           | NOK | http://autobuild.buildroot.net/results/c174353526bc07b752fd5dd77d26832bbd94841a |     
   xtensa    |         sysklogd-2.4.4         | NOK | http://autobuild.buildroot.net/results/07c38e9ba086587e148975ddf65db36f29ee36cf |     
  sparc64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/cf9d377790b800d8e47cf4368e6fc822d7abbe2f |     
    mips     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/2b39a2551d420a83ad8d8612e2ed3515f431eae5 |     
   armeb     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/fa55906bd6b6605432f14cdc70f9afae02c1bcec |     
   nios2     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/1dc4083ca5d686feb70a817ed5517aa9bd8e250a |     
   nios2     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/4f50b91a2c12dc27a0d434cc71d7657824381d7f |     
    arm      |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/42ed37b5f3ba6fdc2190482564b7a449db752085 | ORPH
   s390x     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/b6c467298657438efb78b87e84b53a723a601506 | ORPH
 microblaze  |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/1b939d42f8aa09dd242368c66cf7107ce65b23c5 | ORPH
   mips64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/6d920fadf2a32a87c7670fedbcdee3a952811b32 | ORPH
   mipsel    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/69f80062352a6a3ce2f638104483c1da60d6bb3b | ORPH
  mips64el   |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/1837b1cb4846f5ab7f9bba3be139d8d75b0690da | ORPH
    arm      |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/67f7cbdfaa9b3285dd5457e45da4a3ac0821f3ac | ORPH
   s390x     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/950c1f87eb9aebcb9bf5c6c8515e94dff6fb453a | ORPH
  aarch64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/55235e586fa07dedb8cc3450321dee4b7faaba60 | ORPH
    mips     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/de1b87619a8908c20940c16813e42be439a00f03 | ORPH
 aarch64_be  |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/044873f9b56ae3bda9f04f84f4ed5011760fd80f | ORPH
  sparc64    |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/3421959dc622bbeb7e7fcbc41eb44f13b959b2de |     
powerpc64le  |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/d2008966c46f094a20ec92bac1a0754fffddbe89 |     
powerpc64le  |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/7263bc45194454c04d4e547d5c03a96f0d8f04b5 |     
 powerpc64   |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/a7f9aecd656e8725b631a81ee007bfc5a4c42181 |     
   mips64    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/b1b6caaf65ef53567334c3673fbf4f1683a26aa2 | ORPH
   mipsel    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/efe6d14a8b3d5a6cce479af205dd3bd0f04e07bc | ORPH
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/5ea9cb6144ecc0169a2f50957711456b7f0a0c2b |     
   sparc     |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/ae0faf1e78b639b9a9ed7bf8120be162b5ae7886 |     
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/591ddf7973e3a2c4ebdfe152c7221c37cbffc1bb |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/0895a86ca20aa4ae435d2c03d6c14d50ccaafde5 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/2e8284715825e1fe2ec43662f0f50c20d438a5f4 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/44e057f330edf64a38e4293d3c525c2f79b19d87 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/d97c4ac431fe40e5a01eba3c5f59411163ff38da |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/6e2e13c4a2752348352be66a2feff353e92ee336 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/14a5cc87c74a98e01efd95ed4a075c001bccdda3 |     
    i686     |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/11c3a895e5688913c1bb3470d03a5f33160ece28 | ORPH
 aarch64_be  |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/7ac4e919435fe7f53cedd2fcde354a3f9143c3af | ORPH
   armeb     |         wolfssl-5.5.1          | NOK | http://autobuild.buildroot.net/results/ffec4a8fea643acf277b24ebc26be121967fe508 |     
   s390x     |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/0738995a4c9368464f99b3f99197a8b0b16e1a3f |     
   x86_64    |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/d854e7a904e95df7c647e9b3981cd59099862652 |     
microblazeel |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/829405e4097fca0c038b421764b84ecd211010b8 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

            igd2-for-linux-2.1 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/b17e761a29d6a610b63a7647028e9adbd096eb9e |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

host-pahole-73383b3a39afe86... | 2 
              host-rust-1.60.0 | 2 
                 coreutils-9.1 | 1 
                host-go-1.18.6 | 1 
            igd2-for-linux-2.1 | 1 
               valgrind-3.19.0 | 1 
                 wavemon-0.9.4 | 1 
                       xenomai | 1 
                     zfs-2.1.4 | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/8d4c6d5eac97a498065dddb52ad7dec2c1fe65e3 | ORPH
    i686     |         host-go-1.18.6         | NOK | http://autobuild.buildroot.net/results/b3f5204b83ce8517f5755a54742f5abc365ae915 |     
   mips64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/4c14c665dc719111f252dba06579c3a73e788a2f |     
 powerpc64   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/99878480489b80d8a22511d9a8890af0707ff574 |     
   s390x     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/1f790b4b117dbee9a0560fec899f4088081a20cb |     
   s390x     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/88c6ffa6b3a047e0704e34f8b478a48ed9874560 |     
 aarch64_be  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/e6bb244c51af257d6857d7d5a5698ffb48ebe3e5 |     
   mips64    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/417e585c25bd0f4c0ffbacd1c7c45832d1c857c0 | ORPH
   nios2     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/a34e305c76a685e456400865299d666f57d490a4 | ORPH
 aarch64_be  |            xenomai             | NOK | http://autobuild.buildroot.net/results/d68883629616fec507c783dce9d565f9e7f126f2 |     
 microblaze  |           zfs-2.1.4            | NOK | http://autobuild.buildroot.net/results/a8fb87336b09fef8787a7889dfcccf14fe1215b9 |     


Classification of failures by reason for 2022.08.x
--------------------------------------------------

                       unknown | 2 
             f2fs-tools-1.15.0 | 1 
glibc-2.35-134-gb6aade18a7e... | 1 
host-pahole-73383b3a39afe86... | 1 
               libdcadec-0.2.0 | 1 
                 linux-5.17.15 | 1 
                     php-8.1.9 | 1 
                 pixman-0.40.0 | 1 
          python-orjson-3.7.11 | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/2a63b2733230ff72877a5a72707ba874785a9256 |     
    sh4a     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/ae7a5906a973194cd9f196aa0d0ca4f371d11558 |     
 aarch64_be  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/86e15d915a007be31fb06f6a984f692d86175019 |     
   armeb     |        libdcadec-0.2.0         | NOK | http://autobuild.buildroot.net/results/5bf19329f8f783e9455a1d489a066050d9fa9e09 |     
powerpc64le  |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/9dca12cdc0d14889e977f3ad784fdab8d4191fcd | ORPH
    arm      |           php-8.1.9            | NOK | http://autobuild.buildroot.net/results/070816354ffdb9e5ca27604a91f9b82e087eb6a1 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/e0bd02e6154597137c471ac69c343e9db57e1c39 |     
  sparc64    |      python-orjson-3.7.11      | NOK | http://autobuild.buildroot.net/results/38e5f7d15d7aa35a55cce73eea8383c68b30c22a |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/8ee7eff6d3d362d16165398fd3792162a8266bb0 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/b60766ac804cfc75cbb1da67b23de94852a474b9 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
