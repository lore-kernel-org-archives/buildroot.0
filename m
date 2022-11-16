Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1D1C433FE
	for <buildroot@archiver.kernel.org>; Wed, 16 Nov 2022 07:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C8194171B;
	Wed, 16 Nov 2022 07:41:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C8194171B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hz-rKG2_3mb2; Wed, 16 Nov 2022 07:41:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1E8A4175B;
	Wed, 16 Nov 2022 07:41:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1E8A4175B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CAA081BF2AA
 for <buildroot@lists.busybox.net>; Wed, 16 Nov 2022 07:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A42FB40156
 for <buildroot@lists.busybox.net>; Wed, 16 Nov 2022 07:41:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A42FB40156
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sLcCJNVevsaz for <buildroot@lists.busybox.net>;
 Wed, 16 Nov 2022 07:41:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F59A4011C
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4F59A4011C
 for <buildroot@buildroot.org>; Wed, 16 Nov 2022 07:41:02 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 51A97240006
 for <buildroot@buildroot.org>; Wed, 16 Nov 2022 07:40:55 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 16 Nov 2022 07:40:55 -0000
Message-Id: <20221116074105.A42FB40156@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1668584459; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KR+gzp48FJ0czB/Khs54auxhl26wGjRsSERXJ1KQCvg=;
 b=KO6MLENH93K4JyW5DLyj/SxBQieKBYVys9T3tukcZ5ht5ywHULfzeVekGOuL1M4lC1rhms
 01WGfaapuDEolDBLIFKAVKOik/jBZED49p8qSqS8S3ATTSzRjgXv7paVie6FgUmjaFVUiJ
 /NzJshjQrpqlBa/DYrJuqvUs6QL/VnHgLCTXItjdIco+qdTVWeZbbvwGVvRCzZqlRySsyU
 vaQLAMgqw2dQaw2pFSRySEMy3t8cDidg9+2fhw2WLhqS0WU9EqFCgaC5JO7s+HfFiFfbZA
 EYj9hGx835nutLfvqiSpwY5LqPtiQSWgXOD+poukWzWz+G/JTkzLmPPLHHjtqQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KO6MLENH
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-11-15
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

Autobuild statistics for 2022-11-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  5  |  3  |  0  |  8  |
  2022.08.x  | 17  | 20  |  0  | 37  |
    master   | 174 | 199 |  0  | 373 |
     next    | 47  | 87  |  0  | 134 |

Classification of failures by reason for master
-----------------------------------------------

                   libnss-3.84 | 15
glibc-2.36-66-ga1dc0be03c9d... | 13
                      xz-5.2.7 | 11
                host-go-1.19.3 | 8 
              host-rust-1.64.0 | 7 
               libglib2-2.72.3 | 7 
                       unknown | 7 
                 dash-0.5.11.5 | 6 
              host-pahole-1.24 | 6 
                   linux-6.0.1 | 5 
                elfutils-0.186 | 4 
  gobject-introspection-1.72.0 | 4 
            host-binutils-2.38 | 4 
                tealdeer-1.6.1 | 4 
            host-binutils-2.37 | 3 
               libcap-ng-0.8.3 | 3 
             lirc-tools-0.10.2 | 3 
                 mesa3d-22.2.2 | 3 
              open62541-v1.3.3 | 3 
                   perl-5.34.1 | 3 
                  zabbix-5.4.9 | 3 
azure-iot-sdk-c-LTS_07_2022... | 2 
                  boost-1.80.0 | 2 
                 dmalloc-5.6.5 | 2 
               fftw-quad-3.3.8 | 2 
                     frr-8.3.1 | 2 
                gerbera-1.10.0 | 2 
         host-gcc-final-11.3.0 | 2 
             libgpg-error-1.45 | 2 
                 sudo-1.9.11p2 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
android-tools-4.2.2+git2013... | 1 
                    bat-0.19.0 | 1 
                 coremark-1.01 | 1 
                      crun-1.5 | 1 
                 dc3dd-7.2.641 | 1 
               ding-libs-0.6.2 | 1 
docker-proxy-f6ccccb1c082a4... | 1 
        edk2-edk2-stable202102 | 1 
                 fdk-aac-2.0.2 | 1 
                  ffmpeg-4.4.3 | 1 
                    flac-1.4.2 | 1 
             fontconfig-2.13.1 | 1 
       freeradius-server-3.2.0 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ext2/ext2.mk:65: /home/a... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
 glslsandbox-player-2021.08.24 | 1 
gummiboot-2bcd919c681c952eb... | 1 
            host-binutils-2.39 | 1 
         host-gcc-final-12.2.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
                  kexec-2.0.25 | 1 
                       kmod-30 | 1 
libdill-32d0e8b733416208e04... | 1 
              libgcrypt-1.10.1 | 1 
                libglvnd-1.4.0 | 1 
                libkcapi-1.4.0 | 1 
        liblog4c-localtime-1.0 | 1 
               libmdbx-0.11.12 | 1 
                libvirt-7.10.0 | 1 
          linux-5.10.145-cip17 | 1 
                   linux-tools | 1 
                linuxptp-3.1.1 | 1 
        ltp-testsuite-20220930 | 1 
          lttng-modules-2.13.1 | 1 
                  matio-1.5.23 | 1 
            micropython-1.19.1 | 1 
                  netsurf-3.10 | 1 
                  ntp-4.2.8p15 | 1 
            ocf-linux-20171122 | 1 
                    php-8.1.12 | 1 
                    pixz-1.0.7 | 1 
    python-cryptography-38.0.1 | 1 
                python3-3.10.8 | 1 
              traceroute-2.1.0 | 1 
           uboot-tools-2021.07 | 1 
             uccp420wlan-6.9.1 | 1 
               valgrind-3.19.0 | 1 
                 wavemon-0.9.4 | 1 
               xapp_xdm-1.1.13 | 1 
                xenomai-3.0.10 | 1 
               xfsprogs-5.14.2 | 1 
                  xvisor-0.3.1 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/df88593b6aba3c1bfb6b41285a114def33c23ca4 |     
  mips64el   | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/246618240b4d3510d40f1f8392a04608354eb928 |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/ee6e059834c1e4e0b4f5851d8874f63d9b673f5c |     
    arm      | azure-iot-sdk-c-LTS_07_2022... | NOK | http://autobuild.buildroot.net/results/d415da247a071ae0f7b7556f9e19c197fa363c72 |     
    arm      | azure-iot-sdk-c-LTS_07_2022... | NOK | http://autobuild.buildroot.net/results/5625977055632e68a1e8f51cd30c2407a4085e1e |     
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/c42b8c6ebd3110c9ee3485cc68301a4ec84c6f14 |     
    arc      |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/2f6797bf370450c7e3ebaa4716ebd4051edfc959 |     
    arc      |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/948520c1111c3e175bc994308f01147ee686b306 |     
    or1k     |         coremark-1.01          | NOK | http://autobuild.buildroot.net/results/ced6a3e17d6d259077a72c21ffd1e4662df9beab |     
   mips64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/a4aebd6354f02fb56cdda8fe568491cd0e2f9a62 |     
powerpc64le  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/be96e008472ce4539b5f79797d8ec05f7b954711 | ORPH
    arc      |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/541b6374da0ba69440de242a8744a834a7b997e2 | ORPH
  aarch64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/408c442f1c540e5601abdb458752828aaba41ab8 | ORPH
  mips64el   |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/2cabefcacf4b6ded3b55110c829f59b982b20edd | ORPH
   sh4eb     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/615ad0b2e850aca73ec7fe6ae3da0d53267ba28c | ORPH
  aarch64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/e18e4682c8e755c1681e07b84595c6f18a438b4e | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/6c7fd527a9ae481bd541ad474508f034c9541ba0 | ORPH
    arc      |        ding-libs-0.6.2         | NOK | http://autobuild.buildroot.net/results/93145f29917c51f702395339508b1418e937963c |     
  powerpc    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/4741e8885cde1d6a891a64d61b33d1d15d2eefca | ORPH
    i586     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/e1a5cf33adb6e3d0df8e7b1e05b109da29cdbdf0 | ORPH
    arm      | docker-proxy-f6ccccb1c082a4... | NOK | http://autobuild.buildroot.net/results/76d399c2ec44379690614cecdf97c59d6a9e13cd |     
    i586     |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/1ad56ca9dc943b0200c4a3c023fc5a04551af3f1 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/8539452305a58d84874ad326df77ddc951754fb6 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/f5696e1d0f805ce6ef3cadf420af6cdec94ae0fa | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/e89ecffa788cf3d178d4a3d620a68cd89fd68b92 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/0479a851f613c968fe4c2dfec7fd77c67e247f22 | ORPH
   x86_64    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/b9790e8eedf90c33523ce8c5e5f962eb336c45fe |     
    arm      |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/3c628cf9c40aae4abe7cfef3c665d7716007ce72 |     
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/17b5d4e80ccf8ddf152c6c2ed18855bcae49abc7 | ORPH
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/42a4a3c48724c3c4fd880dcb858cb11cded8519c | ORPH
   sh4aeb    |           flac-1.4.2           | NOK | http://autobuild.buildroot.net/results/11504f4b0a3976047b4b82b25d773d66cb712a82 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/b7550a7964393bbfd58d8a22c2d6e745c05b1cbb | ORPH
   s390x     |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/fdbdae7dd2682418a2837f3c5e18c24ee8c8a5d5 |     
   xtensa    |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/80f48395a34fbc1573b3943d5e3c2f119bc0c5e0 |     
   xtensa    |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/895358aee66862cccbe30997bb6d4c8f372196e4 |     
 aarch64_be  | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/c3c5396fed401e2a951d6e5e64e778dc30d4653b |     
    sh4      | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/55c34c0a6ea62326cb09a5c04ad8ae41b1308453 |     
 powerpc64   | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/ebfbd8eeaaeaff805adc99b4657265048fac1710 |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/24d90be77e1b7f9d78638b2eaf56d796d38bd9a7 |     
  mips64el   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/8099348a19a2f452b02abc52aefb74a780f7bd9c |     
   sparc     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/f8ec1ae098f862f9680cd6e024a18ac2c321860d |     
   sparc     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/f8472b448c9d726e2873a1ce0c8d4219e44fc5b3 |     
  mips64el   |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/c9ea7d217f31915701ecf308868d854ae6085f4b |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/53a3a2b9db2e0a2d355e70ddb00f2585e16338f7 |     
   nios2     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/25fcd862f4a992cc27026a5373a0c109a2310802 |     
    mips     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/6734ad4b3812b67806fc35116f4b08b234773743 |     
microblazeel | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/5267939b5064379c4835b1d09fa1cf3bc9dc29b3 |     
microblazeel | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/53eba5ac8c49164a6b1d0793ce8a722edfb562d3 |     
    or1k     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/22f4ecec7858cc1af7e64f0f3fc510299e3321e6 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/56f71bdd045a1c25649822571e94c88260a5c8f9 |     
   nios2     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/555daa9c5451567695e21fdfd0296e8b3225983e |     
    or1k     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/45d4b327e38f7faecb8711257117084f0c6fe917 |     
   mipsel    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/c76faca10aba67c596051d6994a2b61575a97393 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/cd0eee86a828cc1ecb7c2128352125b2111bf180 |     
 microblaze  | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/281cd745a8a315a453ceda1c48c30bb2d1bb4de5 |     
powerpc64le  | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/168f8157463d11caa285e983dcb6f493f567ddc4 |     
  aarch64    | glslsandbox-player-2021.08.24  | NOK | http://autobuild.buildroot.net/results/526e06cf9d23cf33fa03daa009c70d1bf7125082 |     
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/e084a6688ca4198b57825b61ed7d4053d050af92 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/bb5530a28430e078593c89af9d98f2ed2567f8ed | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/f96448bd74a0b259b2dd53337945a35602ba9a02 | ORPH
 microblaze  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/d340b01bacdc65e10c7d08550e4ec513a2296f78 | ORPH
    i586     | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/2766e4dd09d8addfc6d2f55db4ff24f25f504164 |     
microblazeel |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/fb442526adcabd2fb47c2603957aec223291aa2f |     
    mips     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/27fbe62fbac4483e77efe947cec5abe72f57f6e6 |     
    arc      |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/d472cdf801a49c9d0f75354ea46686d354f972d4 |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/847afc10e70b9442bac5b257258a61c2369bee5f |     
    or1k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/01471e2cef1c02dba1d2e86a599d5e9c3400f0ea |     
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/d30569d4f66c8d492cbf7cd19ff5fef764cf3bab |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/dd798c8387719b9a7719a1731affbd591080e580 |     
   mipsel    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/1cc7a55dd93334ef831e331c4217b6e2e1278930 |     
microblazeel |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/91590750d9eeb325204bd3328dd9cf3f6515c44d |     
microblazeel |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/6e73c5b3c3c75e9c24a47b540c517670ee240ee3 |     
microblazeel |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/03ef2aaa87cb1d9829b824fa3badc5bb25fc2595 |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/d482c3742c17ed884b1cf1d29ff9a7cccf957e3d | ORPH
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/b85e9f9b1360e50acb53e734d6fe46abee7c2c77 |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/81961a042f82383ea4ae08cb00c7c3048c925bfe |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/59b800ff5bf46c27cdfd5aa6f092aabee4666c51 |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/916f0137efd7a908ece5471cef31d850abd49d16 |     
  aarch64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/a3af6428116a0c167e25b5dbd34e9798c0a84e21 |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/da7d49d54e95fd7dbdafebcf33ec565d3cdc9f36 |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/8ab9406ae9153aecb04c4912e648b7d033b18399 |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/574c2766d1327a8a53831fcf5e91eab1782d9540 |     
   mips64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/098003f7affd5972c23cc89235a698fe8510d1b3 |     
   x86_64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/cc388269f3659b5d8474c2edb3e70af6138a1267 |     
   s390x     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/fca50b3e2ce82ea10d17686fd81cae5f5c7bc42f |     
    arc      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/cc3fdcd8c8210cc52b4eb8559f880d51eaa2c19c |     
 microblaze  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/ac9827c9789fab4ac9e6fcd29e11c8053e22d1b3 |     
   x86_64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/86ee48e965a4a23ee12f0fe8a7139acbcc4a1f9f |     
    i686     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/ab8eed522093110f2e9c101176b4a1369ccb39cc |     
  sparc64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/7e32536adf1dec9f91231b109f3758588e6aa502 |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/a547d383bd76311200907a1a6b54dbfb75e7e52d |     
  powerpc    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/6107722bfae8eba30e869824be08478a44c8dbc1 |     
    mips     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/36c3b434de4f8e36f01ed572029b7560788d75f1 |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/74a14769e47e05c5f85c2cf66d9d7496d0284686 |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/9c43c7d62936866746538915e14c7bea1f4a586e |     
   armeb     |          kexec-2.0.25          | NOK | http://autobuild.buildroot.net/results/4adc01df3ea9a8449a810f3cbae975b3d505d30a | ORPH
   x86_64    |            kmod-30             | NOK | http://autobuild.buildroot.net/results/5448cd2ddddb1559d6b516fa4f7c211b35efd98a |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/14a6025709e5713c53530f864ccb858207cf96c1 |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/0296f8d96c53a2bf613ad15a97b79dd682f956dd |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/7bd8eac9bae5443e2585f52cb9a64ef79786e3e0 |     
   sparc     | libdill-32d0e8b733416208e04... | NOK | http://autobuild.buildroot.net/results/113fefb5c1651e51d6b6bb4aa251608ce516aa00 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/a23d588dc3d15eb20bbd8daf162d5c2fd79d10b3 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/0b605bcb23bb947934a7de2ec6bcfe5362785f92 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/09e6e4a5033435c8836860ade7c4014dad2f13d0 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/0d58de06ffc69b492bc8e0038a03098dbdf207fa |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/56f95570d358e230d85cf2f521944a5aa928a7ce |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/7e083a0fead38fd39e8e21ad8883b922b3cd64fb |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/b8f6b6accec3453b2c78a8e716579c0e126a87bc |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/a1fd3efc82d13c7d22142b558d34f220ceb16434 |     
    sh4      |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/c776b32fa6b273137546a7da82a8be81a59df972 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/d749eacbcab114391164d65bc072cf0172b2af4c | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/884c6c2681b43ac182cfb01881f421806ef14980 | ORPH
microblazeel |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/1779ce43f8da2c5a43a5506631e9d2fc0f8317dc |     
  riscv64    |     liblog4c-localtime-1.0     | NOK | http://autobuild.buildroot.net/results/9a6fa9ad3e0e48fcb399e8412d6936caa687716e |     
  mips64el   |        libmdbx-0.11.12         | NOK | http://autobuild.buildroot.net/results/ea3de31dd0f5927a88fb8ea7a9d6cb1c7a8400fe |     
   mipsel    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/d559ddfa85ff60f58b1fb0b9594b2aa40375b2f9 |     
   arceb     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/c2a9dca701def450336f2aa3e638258f6bef7c98 |     
powerpc64le  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/8228499456e19efb1a1ee386780479ba0ce816f9 |     
  powerpc    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/dd3ce1920b06bd15d7433ca2b946d325721aae79 |     
   armeb     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/f0592ab9bedb699094d2643d473b8ba855394266 |     
powerpc64le  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/98b1b9b201cf7d6c014fe53237e4e4f62a1b8998 |     
    or1k     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/f7509204152b3277819977adf619ef24730e06a7 |     
  mips64el   |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/c581bc4b42c9f53d751897e02aa394fa7fab4d8b |     
 microblaze  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/67b0a6dce2c45f98c808b0e804cad464df11ff2e |     
powerpc64le  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/6fc285dfd4f156feecad96bb12a9ada011eb3354 |     
    arm      |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/a7abcadee0c203b128234ef776e22a35478313ef |     
 powerpc64   |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/4a43e8faba173525c93b44a267a85d7186c0e5a9 |     
    m68k     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/85af5eb9af35795b8569ffd75e11b58f3fe991a5 |     
  powerpc    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/31a64ba047d47d8a9b008eab8e311a3bfd1a701e |     
    mips     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/fe02a3e397ff183117309e0db28e0283bdbbf325 |     
  aarch64    |         libvirt-7.10.0         | NOK | http://autobuild.buildroot.net/results/8d4c5412d1571b19bc9ad3e03869bd65fd06e097 |     
   mipsel    |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/1fed76ed64d23d3e81ff67982c7fdd7173731caf | ORPH
   s390x     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/6c2dd3308e38a6886e48eb3310743fa84db07c23 | ORPH
   s390x     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/cb24f71883a47b25baed382910bfe0a9f0d39ba6 | ORPH
    sh4a     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/b5d554e374617ddfd10a480f06c75c5789c0e39d | ORPH
   mips64    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/f2473d9569bb6abf3d815008c07939f04f8c0c21 | ORPH
    mips     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/8522f419b41113367e6f0379d0cf307cf8831a98 | ORPH
    i586     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/34b4631726ef2b0f96acfa31199bac64da634bd3 | ORPH
 microblaze  |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/81bbc42eacf9b95b56d81fea0d9e25f1f49cabf1 |     
powerpc64le  |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/c82886318073f40082efb6c2c668e09ed6498c25 | ORPH
 aarch64_be  |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/f98020ccd1fe86a297954a1def21b329537e0f91 | ORPH
 microblaze  |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/6e58f0e7d384a378aa07455625a50cf0547ae5c5 | ORPH
   s390x     |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/de16296adf0acf5157bc1d08b682348d7cc63c75 |     
    i686     |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/c2509095533866ff9e2c58d1b8a8f153beabfe36 |     
   nios2     |          matio-1.5.23          | NOK | http://autobuild.buildroot.net/results/d12892c6c9fe330230a690a47455dc585b3a9ee6 |     
   x86_64    |         mesa3d-22.2.2          | NOK | http://autobuild.buildroot.net/results/a55d6980faad8b5063f8f4f8b89467061d44a2ae |     
   xtensa    |         mesa3d-22.2.2          | NOK | http://autobuild.buildroot.net/results/ffb5003d6bea3fabbbaa457d5f7bff56c1ef6909 |     
   x86_64    |         mesa3d-22.2.2          | NOK | http://autobuild.buildroot.net/results/eb13d254f0ec92e0cdbb77585cc42a244d8e37c2 |     
  aarch64    |       micropython-1.19.1       | NOK | http://autobuild.buildroot.net/results/6974547aa443ba59282cfbea7e853e91f74bc772 |     
    or1k     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/d3ce621ceea9c7d1c720ff4895053d0a54514fed |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/66b25acd54ef6da751125b856a5e8f9c01d64e5d | ORPH
microblazeel |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/8160ac1d894ec8841380ade49803d8f1d5cc4355 | ORPH
   sparc     |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/039df2164bcb2b3aeb280ba22c80b4be51cc3a3d | ORPH
  sparc64    |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/688ce4c2792e991f8e234568f3af03d0cd97c455 | ORPH
    mips     |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/4573fd56f6327430f6e03713ac5773676ec0c619 | ORPH
   mipsel    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/6ba101c8d03101011af0d2a1b54fd0c054e80768 |     
   arceb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/7ca79e487b81b8005ad78c949d5894b1662b5908 |     
 aarch64_be  |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/6c2eb3a8c82606d48214434671d76ef04b1ad47c |     
    sh4      |           php-8.1.12           | NOK | http://autobuild.buildroot.net/results/758c511d6d300470f7f8b1fca78052815477e8c3 |     
   sparc     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/38cd0e32e371b697233bdeffc58af25298a4998b |     
  powerpc    |   python-cryptography-38.0.1   | NOK | http://autobuild.buildroot.net/results/7d42bc016e221dcf1086310cdf383e5fd26e2217 |     
   x86_64    |         python3-3.10.8         | NOK | http://autobuild.buildroot.net/results/907aa4e157dd9d16a2032e0dfab6fd211afe0ed7 |     
   armeb     |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/3d5c015ebe2643ebb7b73073077e3fcb4cf5f557 | ORPH
    arc      |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/8d4f2f52ed21c20c062462bc5a3afa15cf68984c | ORPH
powerpc64le  |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/90c3523fae07907889dde3750d6b853b6c8ae7c4 |     
  sparc64    |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/3eee532af97cf7bebaf61e8e5c3781bc7d3f4bbf |     
  sparc64    |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/654fc139f5102b3f084c08c46118894f0ed92347 |     
   s390x     |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/2c9bb11af25db363a3c3e894c0e147e1b067f2bd |     
  aarch64    |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/8dc32a59929f9cf66c52f2b7a9a3b9f3be738bcf |     
   sparc     |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/56cb0efc584617577bd58c4a767d7dd5226ef4da |     
    or1k     |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/14f38a22c46d33de900fe8faa7779afeb1e6ea34 | ORPH
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/1b329a94fca03b57f12e2229e11b646f99894e26 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/cefee94ada14c96097070bf7fc74cd18026459d4 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/f4ff81dc5eb9b14a64352509b9e385ee0c9979af |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/c55fc5ce08c7477c16b38bcd9f93588c6179007c |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/c8b4e5594e1ccaca27b3ad0082ecdfe9963e5f6c |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/1631c48fa81d9ad4f0db69bc694a15bb05486cad |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/b78bf052de60d2464ced7275c2116ba4f928a40e |     
  mips64el   |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/f23a84c888784c2e503919d973eb9f1b0c205915 | ORPH
    mips     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/b92d6c689dda2e864cce60889656c119707a0a03 | ORPH
  mips64el   |        xapp_xdm-1.1.13         | NOK | http://autobuild.buildroot.net/results/b2580a2dae9becbf78144b98e55a8f1fd4a0b33e |     
  powerpc    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/f6e412ecd517fc8cec9a26b0abb4758aa4accf86 |     
   mips64    |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/d1186926d3862bb836cd9656ac30ce574dec5af5 | ORPH
   x86_64    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/fdd2c1ae01a2b85eb51ab741f084d930718bcb6b |     
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/ee43230cc1a290947ddb81aea7ce3cffc6c43f4d | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/4a440919e30d413436740cb2133c64c4e78ffb91 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/6913347336b3fb690da4f8d5f330ca3bd3ef924a | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/b84d7ad7a6a84bc815f28dcd2723c5fa1e8dc1f6 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/732afb1b95f3b98120237bf347fbd0d442365bf5 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/a9470d7a0d82293ff68365bbf9d89636a82b4a67 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/599bb55195b8cba7fe9f368f66178215e1b45f2c | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/2be08d9f9335c4f31709198ab8444ff913aa0db2 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/137fc648bbb96c10b57ab9f4571aa6557cca2c6c | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/2e0128609d1096276fb775992fd1497d7f16bb85 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/8292c0488b3b459d6c5babc089748f35d920c092 | ORPH
   armeb     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/0f70cbd5ba8ae948363dd2ca784d04e8a0cc0bb3 |     
   x86_64    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/2cda077497e21d3bfa67964c93625bfaecf99b54 |     
 aarch64_be  |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/7f001d821390bb5e6d5c5f69a666cc3c8522be94 |     
   xtensa    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/dec922473b164d78d4336eff80cf4736bb06dfe5 |     


Classification of failures by reason for next
---------------------------------------------

                   aubio-0.4.9 | 8 
                   libnss-3.84 | 8 
          imagemagick-7.1.0-51 | 6 
                 dash-0.5.11.5 | 5 
glibc-2.36-66-ga1dc0be03c9d... | 5 
                   linux-6.0.1 | 4 
            host-binutils-2.38 | 3 
                    lxc-4.0.12 | 3 
            python-bunch-1.0.1 | 3 
  gobject-introspection-1.72.0 | 2 
                host-go-1.19.3 | 2 
              host-pahole-1.24 | 2 
                  jack2-1.9.21 | 2 
               libglib2-2.72.3 | 2 
                    norm-1.5.8 | 2 
              traceroute-2.1.0 | 2 
                       unknown | 2 
                   bdwgc-8.2.2 | 1 
                    dust-0.8.1 | 1 
                     efivar-38 | 1 
                     frr-8.3.1 | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                  gensio-2.5.5 | 1 
                gerbera-1.10.0 | 1 
         host-gcc-final-10.4.0 | 1 
       host-gcc-initial-10.4.0 | 1 
                host-zic-2022f | 1 
              hyperfine-1.14.0 | 1 
                  lcms2-2.13.1 | 1 
                libdnet-1.16.1 | 1 
                libglvnd-1.4.0 | 1 
                libkcapi-1.4.0 | 1 
               libsigrok-0.5.2 | 1 
      linux-5.10.145-cip17-rt7 | 1 
          lua-cqueues-20200726 | 1 
                proftpd-1.3.6e | 1 
           python-numpy-1.23.4 | 1 
           python-pyicu-2.10.2 | 1 
         s6-linux-init-1.0.6.3 | 1 
                 wolfssl-5.5.2 | 1 
                      xz-5.2.7 | 1 
                 zlib-ng-2.0.6 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/6a9b04073d10eaf00b93aeab58fd49b3e77652ae |     
    or1k     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/c6c201a43cd5b9afdefc49710f3f932c9950ff4d |     
  sparc64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/cff05d51ed367acd7b6979860d14cabff51da2b4 |     
  aarch64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/0fb38bfa6a169c0fa2a652c38ed95dcaca8b2e24 |     
    arc      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/b700a5b8e33efc305682f79c1da63e817e246071 |     
   s390x     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/c0d9d34963425b61fae6d802e73def28b6c3fbf8 |     
   mips64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/135c78ffc78b5496dc0b9c936d6fe12845b4ef11 |     
    arm      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/37a4fd54cd0a0384399cb6d06e218cb4b08fa01d |     
  riscv64    |          bdwgc-8.2.2           | NOK | http://autobuild.buildroot.net/results/71f89e831a85664ef3338dac27b78b36e728b04f |     
    m68k     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/223424e7fff43ae44a6046e9835557e8154e4364 | ORPH
   sparc     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/81f6e0e4fd6a087b0e3b6c42833e1f6022c5f86e | ORPH
 aarch64_be  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/136e2082db9e8838f515c15674098ce35f21db93 | ORPH
 microblaze  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/8f5f5910cedc679b17604b51914161bf4e3172f4 | ORPH
powerpc64le  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/5911cb45739d17bb3bdda847009766746062cff6 | ORPH
   mips64    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/eb30db2fcab1b9a9f707c6c9edeb83ebfecf9532 | ORPH
   x86_64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/4065abce958455e274e324dcc183e309b2ae82f3 |     
    arc      |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/905474705a8be77f06057cb9ef16e875adf5acd5 |     
  aarch64    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/8b2c5fd279d7200ba5eab8fe522a89120d9a26aa |     
    i686     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/f3847989bd66d1c29e74b5cd1354fdd8b000978b |     
  riscv32    |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/3a71570b56f733b4efa253bfd511dfad588ebdbd |     
    mips     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/ff1eed91c3f64149d0cdcdc537425fe2676fb3df |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/fa28df7433843d2a2945e84990bfdab5fc551a1f |     
    or1k     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/b3f2fad3c63c7d166ba4c148a7878756ce04da9c |     
powerpc64le  | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/c130f5e25b2874525922316481570aa56cbf7300 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/ebe493704b2078c4192e5627b92db615d5679296 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/6848153fd7d3bd9c8b559434924d49da081d4bb4 |     
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/27dab2d000e6b2ba5525a2ca5551e0318d7f2de4 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/89498c86b6c8865f74c5b24e29d63333f204d7a8 | ORPH
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/60e1825161637726970e51e0f1e093c54a14c194 |     
   xtensa    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/2b2afc103ea16ccfd33cfdb31e8b39d2454edddc |     
    mips     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ee817d1070388687731f2ec859ba633b8a80711f |     
 microblaze  |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/453d85b225ddeb4f11d102a8bd0015ea9c52efc5 |     
  powerpc    |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/b65469f1377665fec98a673aa580fea28fbf691c |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/7ccb334be17f45954034e03bcb4d48e548140e9f |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/7273ec1de678e08c72a85f7fd5a7e085e151bbe2 |     
   sh4eb     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/3caf54519c97d3a2fb79f90cb42dcd380ad33087 |     
  mips64el   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/c3ed5b3a06cabebfe693ec8704abe3c35e2f9dcb |     
    i586     |         host-zic-2022f         | NOK | http://autobuild.buildroot.net/results/6bb81419f77ba3b91fc9d8e217030c5bebf2107f |     
    mips     |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/529dec3855e0effa312c16f93663b69e47a8c37d | ORPH
   sparc     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/2cf8dd5a82493d0a2040f6bf7bcfa2784d456fae | ORPH
   nios2     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/d7715514305fd5ec0bf25226ecde1ed781fb1687 | ORPH
  sparc64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/8fddc81134a7f99c59a759970bc8cf5f6388a88c | ORPH
    m68k     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/f6ff55a5646d0e20c3ebe564ad09bdd73616b70a | ORPH
  sparc64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/15dfd4b404971fa3bec5f7a91b7afa08362f71f5 | ORPH
   arceb     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/412f76aa98c7960361c14bd4e425fe50f2cb2aaf | ORPH
  mips64el   |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/39dff28569b93db4e322ae346a3dbe7734641e3e |     
 aarch64_be  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/624f3fa68f06de87c6a7619076d5e100c9f7af13 |     
   xtensa    |          lcms2-2.13.1          | NOK | http://autobuild.buildroot.net/results/6d37b82faed05d68bdc0021a486bc2e09207efec |     
   nios2     |         libdnet-1.16.1         | NOK | http://autobuild.buildroot.net/results/b7877fe75dc0a4275d2fb5bf933b4c044e12dc99 | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/c07f5f70455d4d2d7614891800ff2d18f68156cf |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/71a5de022fe224813e145564c64805e1ba751582 |     
   sh4eb     |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/5bb6fa0b47818301d5507398c2d15abca3784f42 | ORPH
microblazeel |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/42f4b905b625ae4d1cd3e16348023f8f4ed01db3 |     
    arm      |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/01d1089b44711629778ebe433bef93c69b35b389 |     
 powerpc64   |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/419a95572b337c59fdb2309ee98fc71c2c49a4c5 |     
microblazeel |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/a8f9391ccb8bb9a1e7e78a60837a9723eb87cc4d |     
    mips     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/ee48d31339cf1d21f0e06155d2b32f115e3320f9 |     
   arceb     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/472d604226ba72148600b686c55375fb7d7037ca |     
   x86_64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/9f68624a2f7700dc6ba8319283b6d12e5515646f |     
  aarch64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/89aed13297b78d591385f86e24e4d4342b71f708 |     
 microblaze  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/d407fc3ec52b01fc765dd68bc2d66f70b2d42a28 |     
   mipsel    |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/ca3e3dc080e82fe0ea027c39db34ace8d69f5360 |     
  powerpc    |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/45f6beb0bf17e99d673eaa64b99806258d794807 | ORPH
  sparc64    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/6a040d2a97eabaa944020cde17d1b3da9b5e4060 | ORPH
    mips     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/bccdca76249e376c3c11f44359e0fed178033b2e | ORPH
   s390x     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/acfe7873fbde2676e7ba7f5ec7b6d5040e6c0387 | ORPH
   x86_64    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/91f78c7184484cf29f0562e530c2ade7219064dd | ORPH
powerpc64le  |      lua-cqueues-20200726      | NOK | http://autobuild.buildroot.net/results/ee59bef7ae025654897c2727f6778b35b7a060b9 |     
   s390x     |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/651d79517d28e8b6e0576be269f1d45026b8e3fe |     
   nios2     |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/77b7df629bad5bb93c3dcf432153642ec5289591 |     
  aarch64    |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/c04a8fc54f46bf881bb7b1e4c245f9b77c09daee |     
    mips     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/d1812150a659c01a48b6fd11f7edc3153a0e3e4d | ORPH
  aarch64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/0f18145f9191fefb27646fb7b0ae3bf7c80a3c41 | ORPH
 aarch64_be  |         proftpd-1.3.6e         | NOK | http://autobuild.buildroot.net/results/7dd2a2f5c44aad008a6e785c0e4beb8b4fa54acd |     
    mips     |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/ee96035ff6c20fa5a58d82489e381350811930bc |     
 powerpc64   |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/c665990d02f3a03ce7656e2f94f36a868cd25af4 |     
    sh4      |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/ac3a20c8e9b432d150abf103d8cbd5682b3ee82a |     
    sh4      |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/6d9a30ae37fba60f68396758ebb0629b3650bb69 |     
   xtensa    |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/16897b60b4195c5d25653b63159001ea21bfb36c |     
   nios2     |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/a09267aa7ac0f5709e54ccbd05ad68fb73a9e539 |     
    or1k     |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/e4c97b493d5be7b8155847ec94924cdf19971f9e |     
    arm      |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/e59a94c5eb514c061e21c2cda1d7210a025d1fcd |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/60f68f6d0000d07882c00da2830d56d2d51f0ff7 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/25173378fa2e7f9902fe35db615837cfe6c0c42a |     
  riscv32    |         wolfssl-5.5.2          | NOK | http://autobuild.buildroot.net/results/1d6682b10e7f8b0edc8ffb44d79c742c83736122 |     
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/f6278b02cc21aa6d74e0bb863fafcf3131406ce9 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/e01b93c79f8e81ce3845c683a55acd66b46a3242 | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                   grpc-1.43.0 | 1 
            igd2-for-linux-2.1 | 1 
           moby-buildkit-0.8.1 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |          grpc-1.43.0           | NOK | http://autobuild.buildroot.net/results/25e5ec1fd3eda17cde85fa570b9bcf5ccf82e06d |     
  mips64el   |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/9b916183b7f0654820b3db16d74a0e61e82c4b15 |     
    i586     |      moby-buildkit-0.8.1       | NOK | http://autobuild.buildroot.net/results/8520b3dcf58114bfdd110433647409b02c32ade2 |     


Classification of failures by reason for 2022.08.x
--------------------------------------------------

                 wavemon-0.9.4 | 2 
                  boost-1.79.0 | 1 
                    brltty-6.4 | 1 
                   grpc-1.48.0 | 1 
hawktracer-e53b07bc812c4cfe... | 1 
              host-rust-1.62.0 | 1 
host-spirv-llvm-translator-... | 1 
               libglib2-2.72.3 | 1 
            linux-fusion-9.0.3 | 1 
               linux-pam-1.5.2 | 1 
              memcached-1.6.16 | 1 
                nodejs-16.17.1 | 1 
                    opus-1.3.1 | 1 
                   perl-5.34.1 | 1 
                 pixman-0.42.2 | 1 
rtl8821au-4235b0ec7d7220a63... | 1 
                 sudo-1.9.11p2 | 1 
                       unknown | 1 
                  zabbix-5.4.9 | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          boost-1.79.0          | NOK | http://autobuild.buildroot.net/results/48aae258a577c14fa12d58c127e3a3d382c60610 |     
powerpc64le  |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/41b1b2da2c1ee8ba0fcd97904d6eb27855068eef |     
    mips     |          grpc-1.48.0           | NOK | http://autobuild.buildroot.net/results/e082ae56d7a95cdfb93796d1874864707664f7a9 |     
    m68k     | hawktracer-e53b07bc812c4cfe... | NOK | http://autobuild.buildroot.net/results/a8fb1061c1fbdf14df61260d95da971d388c2d83 |     
  sparc64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/44f800bec9889325abedde98dcb8cae7ece699cc |     
  riscv32    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/90b6affb6bcc1b9babc4d90c3b359395e2a151f1 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/6b7685e9781ffdea7f90c8abe2c32ed8747397fa |     
powerpc64le  |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/96712d647574a63f98fcd46e1e34cabe33b6f0a9 | ORPH
    i686     |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/5d650503267eef5285ffe4475c9e1ebe08824976 | ORPH
  sparc64    |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/caf5b344c1f2417f2ac7a83cfce86f1878386c9d | ORPH
  aarch64    |         nodejs-16.17.1         | NOK | http://autobuild.buildroot.net/results/680394d63356e77e95e20db691c95b7706cdbe3c |     
   armeb     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/6cc60e8041af03494750b107ce405cb7fc5a37e9 | ORPH
   arceb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/43ae3b02f09d8a375a45a315f977c85b1634c0fa |     
powerpc64le  |         pixman-0.42.2          | NOK | http://autobuild.buildroot.net/results/9898a6979a79545345b9b6d2da0830042702f105 |     
 microblaze  | rtl8821au-4235b0ec7d7220a63... | NOK | http://autobuild.buildroot.net/results/846a8ab901ac87a39bfc1285136dec45044d71a7 |     
   sparc     |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/686da36bfa3ce0266aa9e4fa035899cce8bc7818 | ORPH
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/666e89a309d48b15bc69d3f9b8766b1117ee656e |     
   xtensa    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/7a5b1bd62d248ca56e02f10819fd89f8fa7921cc | ORPH
   mipsel    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/5ac482d1d2ab28bb0b59292cf464ae4ef1dcd7e1 | ORPH
   nios2     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/a4e071c0b0eb569f07f5841ba8e09a0c6a59e4e4 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
