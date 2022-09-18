Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B517C6FA86
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 05:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93B1E60B5E;
	Sun, 18 Sep 2022 05:42:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93B1E60B5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k8-jgm5g5mZs; Sun, 18 Sep 2022 05:42:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE1BF60B22;
	Sun, 18 Sep 2022 05:42:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE1BF60B22
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9464A1BF4E4
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 05:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E9BA8444F
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 05:42:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E9BA8444F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oCXipmsYtB3F for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 05:42:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B49DA8444E
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B49DA8444E
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 05:42:19 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 075F1200002
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 05:42:16 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 05:42:16 -0000
Message-Id: <20220918054222.4E9BA8444F@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1663479737; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nykuMKXC9ncnvWlqZaLUBaav4V+sLhu6O9V/Av5hvgg=;
 b=A+Twy8kFQ5yNAsUVm103uD+H4xy4dvdAVjMdNyuxKsSO+wJy7RTBV4TA9Dt3dC1nvffeSU
 mJ5bZ883WklQ8lfGs0b+3IJhSQP4Mee2uZ8eHvQqouQ+5TMJS41D9o4hsNKw9PKnY0Aiep
 +iuVuybH2TQ+niw01KpmxySJEnMO5ocLbgKq6X1WkDQIYE+qz2ewfSHLtKVhFf47lXRb7A
 wq6L6qm/6E5vgnMgbQM5G03PDTDGO/9ByERSXkuAvU7JBf/KtImdsjpdG5kHa+6f9wfkmy
 I8+fnd1RYQwQzeG3BdZTGnEcB/2MCxaDtgtdzWw4gh3JkF0ODS9Bw03x/4OarA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=A+Twy8kF
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-09-17
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

Autobuild statistics for 2022-09-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 15  |  7  |  1  | 23  |
  2022.05.x  | 30  | 24  |  0  | 54  |
    master   | 218 | 156 |  1  | 375 |

Classification of failures by reason for master
-----------------------------------------------

                  gensio-2.5.2 | 8 
glibc-2.35-134-gb6aade18a7e... | 7 
            host-binutils-2.38 | 6 
host-pahole-73383b3a39afe86... | 5 
              host-rust-1.62.0 | 5 
                 linux-5.17.15 | 5 
                       unknown | 5 
                gerbera-1.10.0 | 4 
dahdi-linux-5c840cf43838e06... | 3 
                 dash-0.5.11.5 | 3 
                     frr-8.2.2 | 3 
  gobject-introspection-1.72.0 | 3 
               libcap-ng-0.8.3 | 3 
             libgpg-error-1.45 | 3 
                 pixman-0.40.0 | 3 
                tealdeer-1.5.0 | 3 
/home/buildroot/autobuild/i... | 2 
                elfutils-0.186 | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
            host-binutils-2.39 | 2 
                host-go-1.19.1 | 2 
               libglib2-2.72.3 | 2 
       linux-5.10.109-cip5-rt4 | 2 
                 openssh-9.0p1 | 2 
toolchain-external-arm-aarc... | 2 
toolchain-external-arm-aarc... | 2 
                 wolfssl-5.5.0 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
  binutils-arc-2020.09-release | 1 
                bpftool-v6.8.0 | 1 
                busybox-1.35.0 | 1 
          cryptodev-linux-1.12 | 1 
                 dc3dd-7.2.641 | 1 
               ding-libs-0.6.2 | 1 
                 dmalloc-5.6.5 | 1 
        edk2-edk2-stable202102 | 1 
                  ffmpeg-4.4.2 | 1 
               fftw-quad-3.3.8 | 1 
       freeradius-client-1.1.7 | 1 
fs/cpio/cpio.mk:108: /home/... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                    gdal-3.5.1 | 1 
                gnu-efi-3.0.14 | 1 
         gobject-introspection | 1 
                      grep-3.7 | 1 
            host-binutils-2.37 | 1 
host-gdb-arc-2020.09-releas... | 1 
host-spirv-llvm-translator-... | 1 
            igh-ethercat-1.5.2 | 1 
               ipmitool-1.8.18 | 1 
                       iw-5.16 | 1 
                  kexec-2.0.25 | 1 
                libcurl-7.84.0 | 1 
              libgcrypt-1.10.1 | 1 
                libglvnd-1.4.0 | 1 
                   libiio-0.24 | 1 
                   libnss-3.82 | 1 
             libopenssl-1.1.1q | 1 
            makedumpfile-1.7.0 | 1 
              memcached-1.6.16 | 1 
mmc-utils-d40ec535b9d4e4c97... | 1 
              mosquitto-2.0.15 | 1 
                    musl-1.2.3 | 1 
                  ntp-4.2.8p15 | 1 
                  ntpsec-1_2_1 | 1 
            ocf-linux-20120127 | 1 
                 openal-1.22.0 | 1 
                 openvpn-2.5.7 | 1 
           proxychains-ng-4.16 | 1 
                    putty-0.76 | 1 
                python3-3.10.7 | 1 
qt-webkit-kiosk-a7720e50f2b... | 1 
            quickjs-2021-03-27 | 1 
rtl8723ds-76146e85847beb242... | 1 
rtl8812au-aircrack-ng-e7a4a... | 1 
                    sdl-1.2.15 | 1 
                 sudo-1.9.11p2 | 1 
                   uacme-1.7.2 | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
           v4l2loopback-0.12.7 | 1 
                    vnstat-2.8 | 1 
                    volk-2.5.1 | 1 
                 wavemon-0.9.4 | 1 
wireguard-linux-compat-1.0.... | 1 
                xenomai-3.0.10 | 1 
                    zeek-4.1.1 | 1 
                    zstd-1.5.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/a9cfe27447ee7f6208869078859248465c19c08f |     
   x86_64    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/18b2eed8c6a81c9cfa8ea4b9fa0aacf96f6884b0 |     
   xtensa    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/8677653d8bf9b2233e2da17252cd43725fb9c292 |     
 aarch64_be  | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/b23ba0bff663d4b35a5444da295a8cbe3c52e242 |     
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/d544dfa101ece5a4ee5e0ff4545a64468f810145 |     
   s390x     |         bpftool-v6.8.0         | NOK | http://autobuild.buildroot.net/results/380de0305dd7294bb191a5521cc46393496ae5af |     
  mips64el   |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/c412253597144b3cf901857a3381d54e11bded46 | ORPH
    mips     |      cryptodev-linux-1.12      | NOK | http://autobuild.buildroot.net/results/80eff8f9d00000ac17d7f7cf500ce192593ae68e | ORPH
    sh4      | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/bc0962354a8405584d259976ed0e1989d782a84a |     
   sparc     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/551e02bced92fc42d5e40545b0e78bc0e7092f89 |     
   x86_64    | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/ca01ad5eaee65caf3a1d24ad5b0f7e6c52772e90 |     
    sh4a     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/d7c339a3afd8c93903e9d5cfc278f025b5742fa7 | ORPH
  aarch64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/d65ac923dd337af9e1b122c742dedc7512d191c3 | ORPH
    sh4a     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/71a40fc276c890bc76dcc6d9df68e8d2f28c42a4 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/396fd318ef9bb29761565765087c993dff103d37 | ORPH
   arceb     |        ding-libs-0.6.2         | NOK | http://autobuild.buildroot.net/results/7fa997346773aab0b1a120c3abd9ba7cb264fe83 |     
  powerpc    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/2f658cfa3eed9da736bbfda62e711a735f90edb9 | ORPH
    i586     |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/b48ed4c6ba10a748a6f8dd9b241640d7beae6cd0 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/9d8c7a9335b22871d9e62cf026cad13dbf01912e | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/ab6ddd26a3e12f9d5f945d44666c455e763ecfab | ORPH
  sparc64    |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/e7c926fd62b66a717141ce59d75a7d5253aee2ce |     
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/c8dbb0577832abe6a0776abd8b3eb266ffa97455 | ORPH
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/cb132393ee4227242b66541cdcd0dd00bed7be72 |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/3e6c8fb2d41a151237a3e2d00b8431cd84236362 |     
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/61ee4d82c773ddf28266f55f4310fc25bbad84af |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/d74ebd2f9fd74c54abd2d099ee6beb8c5d2abbb5 |     
  aarch64    | fs/cpio/cpio.mk:108: /home/... | NOK | http://autobuild.buildroot.net/results/43a3b66f1956334357e96664dfed9c89049f72bf |     
 aarch64_be  | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/193693046c00d3d25c373434b9a59c2dbbe86599 |     
  mips64el   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/4ae6b5a02656d6a767c8968f8591277966e8c966 |     
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/4d8493b3192612d8e3361214e056f2831536af96 |     
    arc      | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/e6865eb4cf237abd9ffbcfb6fcc57f1a64bff199 |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/209f727d565f7b02de43fe01b24c61c334a13ae6 |     
   arceb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/2600b74836f6c9a2d4aa82dcb2d5c4cd7517d749 |     
   nios2     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/ae0887cf393825808010b4b0eda28d9fae8072d5 |     
  aarch64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/cb331b2d816f6646e4f7a9cd8842e2e253b980c3 |     
    or1k     |           gdal-3.5.1           | NOK | http://autobuild.buildroot.net/results/13d02801ae1ace8f0dde969b8848482a7af57a65 |     
  riscv64    |          gensio-2.5.2          | NOK | http://autobuild.buildroot.net/results/f2ea2211f150c613887d89f35c5bcab007132b4f |     
 microblaze  |          gensio-2.5.2          | NOK | http://autobuild.buildroot.net/results/77c1132ea83b55b1c4a21c9cacb43e51d589e7c5 |     
    or1k     |          gensio-2.5.2          | NOK | http://autobuild.buildroot.net/results/e4c2ff7271683f3761c0a28c40870b17875fa2fe |     
   mipsel    |          gensio-2.5.2          | NOK | http://autobuild.buildroot.net/results/cafe5db172895417d75319dd297c0160fec0d323 |     
microblazeel |          gensio-2.5.2          | NOK | http://autobuild.buildroot.net/results/915389c83b817061af686c1c64fc5be3c06ff0c9 |     
  mips64el   |          gensio-2.5.2          | NOK | http://autobuild.buildroot.net/results/c187ac53bec9a0efd24929853b466b9c27fc108d |     
   x86_64    |          gensio-2.5.2          | NOK | http://autobuild.buildroot.net/results/ddac0a6d3da630eceb8eb3dae82404ed7a84261a |     
   x86_64    |          gensio-2.5.2          | NOK | http://autobuild.buildroot.net/results/9ad66ef06e2566e8d5153bc3ef936f0945198814 |     
    arc      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/2e6aecce264de4baf0e1491766d3664fe4b0d4db |     
   mipsel    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/13f40da0388c0f1bc751ca3b0eb8b11bb170732a |     
 aarch64_be  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/5456c9ec0509b94fd8880674f03ae1d391794be5 |     
  riscv32    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/3e5be728992847e215f5ab45a0137aa1e8c3dd15 |     
  powerpc    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/824b4b3a55623edc22ed2bc1b89c11b5e0e4c220 |     
    arc      | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/dad5c7973a5bce52dece6fee786bc152b6b13065 |     
    or1k     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/11dedee37d320295086021a6f040ed5931e17ade |     
  riscv32    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/b47d9c8c79d66bc498eb6cd3e9e2a03665a10d99 |     
   sh4eb     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/67aa47c6dfebfcb158babb5f36a249fcc4db6da2 |     
  powerpc    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/8fe5f3cafc305940ef6648a6317cb50d0ba4b520 |     
  powerpc    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/721463a253580cf6b925ea775732aa643861512b |     
  mips64el   |         gnu-efi-3.0.14         | NOK | http://autobuild.buildroot.net/results/5ea52cfa027240f735dea5372aeca4589284d2f6 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/afc2b827874f8fc6a9b59c66fb896b77380e398a |     
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/4abf62b3fe9e19767d0c3e7eb714bb5269f002db | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/7c79911b6da01ba8693f34082581314d2e568a05 | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/c83dce837484c9921bb6c9482c37c9bad7f695f6 | ORPH
   arceb     |            grep-3.7            | NOK | http://autobuild.buildroot.net/results/7caa39cb09e93d21b9d6ab8c4b6d44abb5a07c11 |     
    or1k     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/f37a261c25d0e15af65ec34171a6331dfd811e05 |     
  riscv64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/784072c012d9134cd53f5fbf9f33a4234bb11d4a |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/221b215117aeccda9353ab256f2bf70920527d14 |     
    m68k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ca298796b534396687bd416823a5405e1961b288 |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f4d66aa2631c9f5ec9cf8262267e157ebde7a54e |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f4cd3081ad3184d32ca7c00a627578f875bf3de7 |     
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ae4bfd972f878901ad2893c161309f4369961d3d |     
 microblaze  |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/b7e24acf6ce78a6d341fac0e4102daa79652209d |     
   s390x     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/c4cc41b3dc4f8a0b8e51707706e39014b48ca98e |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/b31cb7187251a3dfbbeda2e4b67a8da39d1c0a70 | ORPH
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/99c495138d8730690ce05ad0ab83de66a13f4462 |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/79bc511b2818cec4cb4fc32f1127ac057a88d809 |     
microblazeel | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/16a9f7aa83e1ec412049bc49eb81603b82ea6b68 |     
powerpc64le  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/ee6aedee2621515b55f6985610aa6d4fdfb4c735 |     
 aarch64_be  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/a2495207cf2e6db49c79969f18bd55c07910b64f |     
 powerpc64   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/8c6b9f4b07c5cefbf94ffad4a1a6fe53d8e271fd |     
   arceb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/a084819751349e011d66cf9a12f6b083a2c7be3b |     
    mips     |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/4bf0daabb54e4e0f6c800b69db284c7b5420a2ed |     
 powerpc64   |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/1120aba05df8ed51e933a7ab1ca57f66cb3b7f3a |     
   mipsel    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/b9c0fd7810bda888178f44589f5a02f6a24d2b4f |     
 powerpc64   |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/3e219b4fee4c0cb21318e1e18f58f1d90823a7d5 |     
  sparc64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/cd96e2a86bcb9a562174a474531d8a2b9932d48d |     
   armeb     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/120b229209ce77d2d516d39fc3a99c513dc85e6f | ORPH
   sparc     |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/efac9fc9e5d318d2bc9d3e51d1dfa82a44f36b64 |     
    or1k     |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/06eb1dd1b26fcc078563f1e1bda16e35a500baa3 |     
    m68k     |            iw-5.16             | NOK | http://autobuild.buildroot.net/results/7e605b2b641dd2d5a4c356377752e82c280d3e10 |     
   armeb     |          kexec-2.0.25          | NOK | http://autobuild.buildroot.net/results/e61beffa0d834d0bca3445987784152270e6e785 | ORPH
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/25dc6ab1aec99135b3e1a5a903d8ed979250c877 |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/b967b2ad56264c6ad385a97748fe992b6588a295 |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/fa8c5e7a18ea273d7db06ea17a710fcc69c17a9d |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/107fc6fc46911c270b031fa23444558b2aba1726 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/7b5749089cb412d662e27a04ca7558a590ea1501 | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/12aec7064be66d1bc665213a4c0083bc37c4dc58 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/60aa1418fb2ef2e662bd56e0740d74417893eccf |     
    mips     |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/00762d6d2ce07f0f21c14b2e079e2e752804804d | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/d646d179f8c4ba0671e148afbbfbfceffcf56e1f | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/8c3f81279e4fc7798d40461d528a0f04eed23b51 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/3e351d50e45fdf33bdd04d43766f55911845bf02 | ORPH
  sparc64    |          libiio-0.24           | NOK | http://autobuild.buildroot.net/results/78af7a19727215af087a7dcb93dc709ea4740164 |     
    mips     |          libnss-3.82           | NOK | http://autobuild.buildroot.net/results/9282969095838e9dff9f49c605e5274d2050b047 |     
   sparc     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/40f4c597306797072848d77f4495a5f5deab7847 |     
microblazeel |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/7688f3294d532e229b10b57a58b677df42f2ba92 | ORPH
 powerpc64   |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/6ec89e31610973c06dc09820169538e9467e95ae | ORPH
  mips64el   |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/c6b70ac2c89035f22ad01cd91d648bb985c500ae | ORPH
   mips64    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/711cf5b942170dc9117a15560dbc7282bd62922e | ORPH
   mips64    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/9be8d7f3d5545ad1fa94852671bbbe8927279592 | ORPH
    m68k     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/cf9923e3cdee2cda84e6924a630f862fa89d7a8c | ORPH
  mips64el   |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/b04abfd8b768375a6e0f9446a8a76320fcba6794 | ORPH
  mips64el   |       makedumpfile-1.7.0       | NOK | http://autobuild.buildroot.net/results/94ef6d893c2163ad68dcb514ae5547040d1c46e0 |     
    arc      |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/9ff6dc61031d6b6e7b48212bbe2b5343f94d7150 | ORPH
  aarch64    | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/18c4fce5416e5d1ccd95900ccef87d4c045a361e |     
    or1k     |        mosquitto-2.0.15        | NOK | http://autobuild.buildroot.net/results/776c8db76bc2a2b4071a718cf1a06125565106cb |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/dbafa3474602fbd2b62d8173deceb6c0714d6e9c |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/cb9a015c6c424c52a13c443196331e4a724400ba | ORPH
    i586     |          ntpsec-1_2_1          | NOK | http://autobuild.buildroot.net/results/c4699dfcda75489a0093bfcfe69f24e5a29cf8e4 |     
   sparc     |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/786a085b737a132e18bbbd4cf2b88689a559a4c4 | ORPH
    arm      |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/5a653c30333d6621cd69c808f2e72930bb9d33e8 |     
    m68k     |         openssh-9.0p1          | NOK | http://autobuild.buildroot.net/results/22486c69eaea9e5843797f42c453ba16dc6a8806 | ORPH
  sparc64    |         openssh-9.0p1          | NOK | http://autobuild.buildroot.net/results/070651743e646e9329f76f0951a1aaaa9c3c1a4b | ORPH
microblazeel |         openvpn-2.5.7          | NOK | http://autobuild.buildroot.net/results/de9b2a47aa9816df39de031c2d276efa2e63bb9f | ORPH
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/448ade5defe2cb725cd5b0763ca76f5fd3dc3ade |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/66bad791127963dbdf14982ea0357bf38ae9613c |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/6431e040880c56f48737d4d537c27cb488b4bf40 |     
    mips     |      proxychains-ng-4.16       | NOK | http://autobuild.buildroot.net/results/e373cab56b99ad18fc3411194ce8fd9f98fdfb02 | ORPH
  aarch64    |           putty-0.76           | NOK | http://autobuild.buildroot.net/results/66d368ee0ec1ff429a28e1834f42639eae06f030 |     
   x86_64    |         python3-3.10.7         | NOK | http://autobuild.buildroot.net/results/e090938e691f472a85f606a285d18c78199888e1 |     
    arm      | qt-webkit-kiosk-a7720e50f2b... | NOK | http://autobuild.buildroot.net/results/5427188fa206f3332289979456e99ede7ccbc5f0 |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/be65d7623c44e73ffd7b9ab396904deedc56239b |     
   mips64    | rtl8723ds-76146e85847beb242... | NOK | http://autobuild.buildroot.net/results/e4c3a96c3c1c5aadb01a8783445e8a6b58e4c983 |     
powerpc64le  | rtl8812au-aircrack-ng-e7a4a... | NOK | http://autobuild.buildroot.net/results/8a84ad123a93326fdcda25145a0a0200b078ec6c |     
    sh4      |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/aef8b505785edcc8bc26a9a934c9b23bf10dabb9 | ORPH
    arm      |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/3f604364a556d9008ae1d65bc7709cf93875973a | ORPH
  sparc64    |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/d778a8b5407f192ba4f7bf2621fc66ccfe0231b4 |     
   mipsel    |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/b20511b502e8b1d6c39417994bfea785a38955b5 |     
   s390x     |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/ecd4f66a2684cd5da861f61ff571932224421219 |     
  aarch64    | toolchain-external-arm-aarc... | NOK | http://autobuild.buildroot.net/results/263281df0c94a6d3579e5393551c2ab7f7478459 | ORPH
  aarch64    | toolchain-external-arm-aarc... | NOK | http://autobuild.buildroot.net/results/37a13e005102d1fae5d139c559da44076c8daf5e | ORPH
 aarch64_be  | toolchain-external-arm-aarc... | NOK | http://autobuild.buildroot.net/results/eba8d3d84a86a8ace70846b85811a4963e551de4 | ORPH
 aarch64_be  | toolchain-external-arm-aarc... | NOK | http://autobuild.buildroot.net/results/8e673ddec4c12ef3d908c924afa260fb9060f12d | ORPH
   s390x     |          uacme-1.7.2           | NOK | http://autobuild.buildroot.net/results/3499423a2c4d67f2f11a31809ab9f3234ad13936 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/decb49624e36d43555957d094283bd8aa382f0a6 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/b56dc25e6d0a8006e7b1af97108c287fe3445191 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/55aa2c78c58ac05ced2b6ffc0082b74a8ecd5c60 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/a7610be5c3c9c56c06f5389d45a34d9ad929c1a9 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/552652a3da42c56b806c4a358bb613dfbeec6d88 |     
   mipsel    | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/e761c79465ac5e8c2dc1e28848177c608ef5a397 |     
powerpc64le  |      v4l2loopback-0.12.7       | NOK | http://autobuild.buildroot.net/results/53520d18a87875b2aeca096fc377f37391cfc885 |     
   mipsel    |           vnstat-2.8           | NOK | http://autobuild.buildroot.net/results/bc26d0e4c06d5612eadf0cf326b3ccc4a32833f7 |     
  mips64el   |           volk-2.5.1           | NOK | http://autobuild.buildroot.net/results/54d7de6538388365be3f6473decfee3ffb91231c |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/58a0770de4460184cddb558d4b04763a7f7387b6 |     
   xtensa    | wireguard-linux-compat-1.0.... | NOK | http://autobuild.buildroot.net/results/a877b6024b53ed14d46d2efba4ed714c697868d3 |     
   mips64    |         wolfssl-5.5.0          | NOK | http://autobuild.buildroot.net/results/8e378c91b785da4e7e96c179ed068ecdeada771d |     
  riscv32    |         wolfssl-5.5.0          | NOK | http://autobuild.buildroot.net/results/6f7fcec9ecfc4ba5addbc1ba413a9d39663d0ac2 |     
  sparc64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/8c03930f5f8f83c29c9cfe684337ad041fb89e60 |     
    i686     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/dfc9383f7db95d530365229a01564f6cdb3edb55 |     
 microblaze  |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/2b1b09e3379d1771bf8b12ff9db082359460a441 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                nodejs-14.20.0 | 2 
google-breakpad-7515ab13768... | 1 
               host-go-1.17.13 | 1 
                       libuwsc | 1 
                   mp4v2-5.0.1 | 1 
                   perl-5.34.1 | 1 
qt-webkit-kiosk-a7720e50f2b... | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/c5f90e4f8ff3f7b6315cef60abc433669af0d4b6 |     
  mips64el   |        host-go-1.17.13         | NOK | http://autobuild.buildroot.net/results/896d4a2076905d27cff2fda45b987eb97e56175e |     
    arm      |            libuwsc             | TIM | http://autobuild.buildroot.net/results/797f97783c9d65245fc68d1bd5aefc5d3cf5bccc |     
    mips     |          mp4v2-5.0.1           | NOK | http://autobuild.buildroot.net/results/5fe2b176e00b68dc16ee338ecbf81318e71a83f6 | ORPH
   mipsel    |         nodejs-14.20.0         | NOK | http://autobuild.buildroot.net/results/d627e754d6aa35cf9ec6f4f930447f9c345c440c |     
    arm      |         nodejs-14.20.0         | NOK | http://autobuild.buildroot.net/results/da64c45fdb757133f090368620d0757731670979 |     
microblazeel |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/c8f40823b586cea3ed5d1b671f7a0ccd71874f9f |     
  aarch64    | qt-webkit-kiosk-a7720e50f2b... | NOK | http://autobuild.buildroot.net/results/f310c0f5765c6a72a2d22763d0172eeee995f53d |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

glibc-2.35-134-gb6aade18a7e... | 2 
           linux-5.10.115-cip7 | 2 
                 linux-5.17.15 | 2 
                wtfutil-0.41.0 | 2 
                elfutils-0.186 | 1 
                     file-5.41 | 1 
                     frr-8.2.2 | 1 
                gnu-efi-3.0.10 | 1 
  gobject-introspection-1.70.0 | 1 
host-gcc-final-arc-2020.09-... | 1 
                host-go-1.18.5 | 1 
host-pahole-73383b3a39afe86... | 1 
              host-rust-1.60.0 | 1 
                  kexec-2.0.23 | 1 
               libsigrok-0.5.2 | 1 
               libvorbis-1.3.7 | 1 
               protobuf-3.20.1 | 1 
                 uclibc-1.0.41 | 1 
ulog-0389d243352255f6182326... | 1 
                       unknown | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/e8efb1e6ede8b7a84debd407c1e49f111757f4b7 | ORPH
    arm      |           file-5.41            | NOK | http://autobuild.buildroot.net/results/b91eaeeb4281dfb4c3d1d92b37c7a5ecab6a8573 | ORPH
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/f8eb099158a7b843a244be85a82add695d6afbb6 |     
microblazeel | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/afcec4421382a5a663c29d4ab909f5467fb32828 |     
    sh4a     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/bd7752a49e4a438d5d6b74fea1bde4dc2456ec56 |     
  mips64el   |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/dc8f165692cc586ab437f06994871f904e95b3f3 |     
 microblaze  |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/90d04b2b13f58cbb73b05e0953ecf9792221e4cc | ORPH
   arceb     | host-gcc-final-arc-2020.09-... | NOK | http://autobuild.buildroot.net/results/1bf4ec90dde3be0d3806ee19f651067047dc4f39 |     
  mips64el   |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/14240f19f7455955e0bbd044886d704e1fce199c |     
  aarch64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/4a16d12f87d194e3e0b374b8e06d015d4843f69e |     
  sparc64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/86a3e667f5db4a4aad9b1b3addc9dbde5852593a |     
    arm      |          kexec-2.0.23          | NOK | http://autobuild.buildroot.net/results/6abd66bc07ef6d2f6e83f06bc8d65175a61ff239 | ORPH
   arceb     |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/b4c37d317d5420f90b6662492d7a80e2e4215178 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/e0bc2221fef4d432e9a7fa41a9ed159d3b77d2f4 |     
   armeb     |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/abdc6b1349ec10733912e00405b8d7e19380d33f | ORPH
   sh4aeb    |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/bcb6581c8db6fc24d1688f55e25804cd6042b9e7 | ORPH
  mips64el   |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/ee0e799c757dc3f3ad058305b6ec56ea392e938c | ORPH
    mips     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/5f798fad4fff61657aa9be4bd924c69c3674db2c | ORPH
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/4c8cf3af9f2f14cf13b50a27385ea47de5a2736f |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/047ff331b42930a6fafbe874a5ec749093eedf59 |     
   mipsel    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/7538259780e971a643bacf75cbfb4eae415602f6 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/cb3fd57c4dc8e14575f752c16028c550bbd075f3 |     
  mips64el   |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/80502198617ac29ad022a61c82d2f756a7c7f311 |     
  aarch64    |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/ffeca16800dced2c548a1befcf78bf40a59a24a4 |     


Gitlab CI results for 2022-09-17
================================


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
