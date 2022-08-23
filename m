Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D348C32774
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 05:39:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1F3840339;
	Tue, 23 Aug 2022 05:39:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1F3840339
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1yascjgucl1K; Tue, 23 Aug 2022 05:39:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2FE5540323;
	Tue, 23 Aug 2022 05:39:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FE5540323
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7176E1BF2F8
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 05:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 299A860B2F
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 05:39:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 299A860B2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bBSXakdGIY04 for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 05:39:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4AEE60B2E
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C4AEE60B2E
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 05:39:44 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id ED2B140006
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 05:39:41 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 23 Aug 2022 05:39:41 -0000
Message-Id: <20220823053948.299A860B2F@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1661233182; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EmA/SfsXjCInWHHT78ZjVGW/YOQ8BKLF2Gs+/dm0gNA=;
 b=lFNhFN6yJ69aEyNTF3152+GtM9/P4ovxVleHWloD3j/KnG9ReedV9+uxOZPgTaUpctnERQ
 mxq/AkX9bfbLOZtci7QsP9/D3hKGjwJr/Cze18TDAMMy3k63qKLwRIfWrTvBmXhodZih6R
 A7t1HpHk0GhgQyMY8axlOc9JvidWrGrs15uWl1NctCHS+m8Y0C9wfCNVckR8lrg3cEnH9M
 Jqdv0DjQ42gd0QqAckae3qiRQ3TvCZosp2qhkYNeOVjw5UKiOMj+irNkP7hDP4VUc8dk3d
 xQud8hajsuVrTJ9AxJBXqPY/vR8QIoNN0fwd7U5aKPcU+jXgKVq+rnWmhnnDqA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lFNhFN6y
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-08-22
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

Autobuild statistics for 2022-08-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 11  |  3  |  0  | 14  |
  2022.05.x  | 36  | 19  |  0  | 55  |
    master   | 286 | 338 |  2  | 626 |

Classification of failures by reason for master
-----------------------------------------------

                   thttpd-2.29 | 34
                 linux-5.17.15 | 22
                    wipe-2.3.1 | 21
                 uclibc-1.0.42 | 15
glibc-2.35-134-gb6aade18a7e... | 14
                host-go-1.18.5 | 10
                speexdsp-1.2.1 | 10
                       unknown | 10
                gerbera-1.10.0 | 9 
              host-rust-1.62.0 | 8 
dahdi-linux-5c840cf43838e06... | 7 
                 dash-0.5.11.5 | 7 
                   perl-5.34.1 | 7 
                elfutils-0.186 | 6 
               libglib2-2.72.3 | 6 
  gobject-introspection-1.70.0 | 4 
          host-elf2flt-2021.08 | 4 
                 pixman-0.40.0 | 4 
          python-orjson-3.7.11 | 4 
                    sdl-1.2.15 | 4 
             libgpg-error-1.45 | 3 
             libopenssl-1.1.1q | 3 
                mongodb-4.2.18 | 3 
                     pv-1.6.20 | 3 
                   speex-1.2.1 | 3 
                 wavemon-0.9.4 | 3 
                     aufs-util | 2 
                bitcoin-0.21.2 | 2 
                    brltty-6.4 | 2 
           crucible-2022.05.25 | 2 
                  ffmpeg-4.4.2 | 2 
                     frr-8.2.2 | 2 
         host-gcc-final-12.1.0 | 2 
host-gdb-arc-2020.09-releas... | 2 
     host-moby-buildkit-0.10.0 | 2 
host-pahole-73383b3a39afe86... | 2 
               libdeflate-1.12 | 2 
              libgcrypt-1.10.1 | 2 
   libtorrent-rasterbar-1.2.15 | 2 
       linux-5.10.109-cip5-rt4 | 2 
                   linux-tools | 2 
                 openssh-9.0p1 | 2 
toolchain-external-codescap... | 2 
                wtfutil-0.41.0 | 2 
                xenomai-3.0.10 | 2 
                  zabbix-5.4.9 | 2 
                    zeek-4.1.1 | 2 
                 zlib-ng-2.0.6 | 2 
/home/buildroot/autobuild/i... | 1 
                  acpid-2.0.33 | 1 
               apcupsd-3.14.14 | 1 
                    bat-0.19.0 | 1 
               belle-sip-4.4.8 | 1 
  binutils-arc-2020.09-release | 1 
                  boost-1.79.0 | 1 
                  cmocka-1.1.5 | 1 
              containerd-1.6.6 | 1 
              dieharder-3.31.1 | 1 
               ding-libs-0.6.2 | 1 
           docker-cli-20.10.17 | 1 
              dropbear-2022.82 | 1 
                    dust-0.8.1 | 1 
        edk2-edk2-stable202102 | 1 
                        ffmpeg | 1 
                     file-5.41 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
                     gmp-6.2.1 | 1 
         gobject-introspection | 1 
         host-gcc-final-11.3.0 | 1 
host-spirv-llvm-translator-... | 1 
            host-systemd-250.4 | 1 
                  hostapd-2.10 | 1 
              hyperfine-1.14.0 | 1 
            igh-ethercat-1.5.2 | 1 
                       iw-5.16 | 1 
                  jack2-1.9.20 | 1 
                jailhouse-0.12 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
                    libev-4.33 | 1 
           libfreeimage-3.18.0 | 1 
                  libftdi1-1.5 | 1 
          libmicrohttpd-0.9.75 | 1 
                 libp11-0.4.12 | 1 
               libvorbis-1.3.7 | 1 
           linux-5.10.115-cip7 | 1 
            linux-fusion-9.0.3 | 1 
          lttng-modules-2.13.1 | 1 
            lttng-tools-2.13.2 | 1 
make: *** wait: No child pr... | 1 
                    musl-1.2.3 | 1 
         mxs-bootlets-10.12.01 | 1 
                  netsurf-3.10 | 1 
                nodejs-16.16.0 | 1 
                  ntp-4.2.8p15 | 1 
            ocf-linux-20120127 | 1 
              open62541-v1.3.2 | 1 
               openpgm-5-3-128 | 1 
                   opensbi-0.9 | 1 
               poppler-21.12.0 | 1 
                proftpd-1.3.6e | 1 
                 protobuf-21.4 | 1 
         python-greenlet-1.1.2 | 1 
            python-ujson-5.2.0 | 1 
            quickjs-2021-03-27 | 1 
rtl8723ds-76146e85847beb242... | 1 
rtl8812au-aircrack-ng-4ab07... | 1 
rtl8821au-4235b0ec7d7220a63... | 1 
sconeserver-8d1935919a20133... | 1 
                tealdeer-1.5.0 | 1 
ti-sgx-km-cf7f48cb30abfd5df... | 1 
ulog-0389d243352255f6182326... | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
                    volk-2.5.1 | 1 
               xfsprogs-5.14.2 | 1 
           xtables-addons-3.17 | 1 
                    zstd-1.5.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/18b0c501162049281859fd9fd8bafbe7b2293a8d |     
   mips64    |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/b04bd94d18f99a2d0373174928d4af70d83e5106 | ORPH
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/2dd31b799b48c3694c1307d487b70b345c8cd2f7 |     
 microblaze  |           aufs-util            | NOK | http://autobuild.buildroot.net/results/15a4ec8dd6e98d3df7a9d024b6014f7a3f19c3cf |     
   x86_64    |           aufs-util            | NOK | http://autobuild.buildroot.net/results/d1e56883277c636ecf718d5cd1dc7447802d9b75 |     
   mipsel    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/f85606b18884566f6ca62ffe969b8f33e767921d |     
   xtensa    |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/58f6690f4a551c1f2a4adc4c656ec028c534c7e8 |     
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/fc07c4e947a6ca8d2b38b5ceef40f5a73351fae6 |     
   x86_64    |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/a5ba50353ba356ede5f0c28912b6ca960cb50fa3 |     
    mips     |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/9e97b2426c27c6b3a494afbdffb582f8c0bba881 |     
    arc      |          boost-1.79.0          | NOK | http://autobuild.buildroot.net/results/3e83ceff07b38ac69d0305215a6149394cbcecf3 |     
   mipsel    |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/c084f78ce6e1ab2af9f78692ca6e5c767dd1288f |     
    mips     |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/88ab3c391c279b562ecf77a8062c1f55c2d865a0 |     
   armeb     |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/a9e29819106caf035be8f3c0b0fd1b00ef2c3da9 |     
   s390x     |        containerd-1.6.6        | NOK | http://autobuild.buildroot.net/results/3006e9f889089026c1aed6173af62e805b475766 |     
   x86_64    |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/254884491d2a5f9538aaec5b6218666dd4774b5a |     
powerpc64le  |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/e920e0d4c54b4a2fd2b4a96cefc66368467f862c |     
 aarch64_be  | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/c6b842e4cae87767c16444de65644a4a737f3697 |     
  riscv32    | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/b16390e029187b352a46990a8287926835bfb2f8 |     
  sparc64    | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/4699db0253d4e9e77c92719e7643b7dc39ecb59f |     
  sparc64    | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/6a7fadf64953751953b9ad45564f1791e8609ab3 |     
   mipsel    | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/0fc09a943305d312f84520c3a439547e9c02e4c0 |     
 powerpc64   | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/be3315f6488ba39f42d9dc69019b04aec187553c |     
  sparc64    | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/ce75a4edf8a077c600b24fa1b92ae13766cc61b8 |     
   sh4aeb    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/1bd541da240557c59fa6635f567e82f0a4c00dfe | ORPH
  sparc64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/2baf7352111a02d3af7275742ab3e419926b5af6 | ORPH
    sh4      |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/de43fb373c165c9343f1e01e3e2c06e75a661edf | ORPH
   s390x     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/64e8aa0ad55685a23546ada816c51da90af93746 | ORPH
    sh4a     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/52453f4d4c14d971e3ff918d46233a076906adf5 | ORPH
powerpc64le  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/2169da8d5dc1fed6155760740ec85cd35294c93c | ORPH
    i686     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/c5bca7f9973d9de3243896a474378e65e091060c | ORPH
microblazeel |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/75ed3259d6103f4ac6f90cf0720c11d82f3e3347 |     
    arc      |        ding-libs-0.6.2         | NOK | http://autobuild.buildroot.net/results/a0509661cc032005a581ebe168735a4ac2692978 |     
   s390x     |      docker-cli-20.10.17       | NOK | http://autobuild.buildroot.net/results/8b7e4a74438099b0def4c13ab66c4324c0718930 |     
  riscv64    |        dropbear-2022.82        | NOK | http://autobuild.buildroot.net/results/62731e22170b8e4ef00081ca5149a60def25f4be |     
   armeb     |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/a39a391058831a846c80e2a00e9886fcc7150927 |     
    i686     |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/fb8c9b867eb630fe21790b5aa3f6acdafc95cb67 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/38e6cdf9688d1e6467f21768813057b809e0066f | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/a91dbc005c2e4edbe905080e0d4205d5a7283c4b | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/c13cd01d30918ed37182befb7f9d7a6225d7b9b3 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/899ee5e4ea06fb0ec82f4746498f33655ba7db97 | ORPH
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/41d1c38432e838581672927e51896edf65d3aa11 | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/2a2d3dc0a50a838a86bd5c3ae62516142aa20938 | ORPH
    i686     |             ffmpeg             | TIM | http://autobuild.buildroot.net/results/3942c22e94e88ff9dd03611607580dd4ba753c14 |     
powerpc64le  |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/cd071117f4435ad8cc0fdc52008c9df31392e345 |     
powerpc64le  |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/536961e9ce2d113c18a1849b19e2c6ccb6d82717 |     
    arm      |           file-5.41            | NOK | http://autobuild.buildroot.net/results/57367f4866999eca37ca812cdd18e2af2ea165b7 | ORPH
   arceb     |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/d5cb34513945b9218127bd4542494e4ac1f6b5ad |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/31ba097332ab4a31bf446c4de68b8f6240c03c68 |     
    mips     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/7ef8550122abe03d2884499f772f9b64af809c84 |     
   armeb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/11b24bf430febe5cdaafcaa3bb7882769d40c998 |     
    m68k     | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/7f46b57edd056b17c2e5f5d6cb0e3e56d464c399 |     
  mips64el   | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/5d1092ecf4b114af2fd1cefa0b0d6b15ef54f7c6 |     
   arceb     | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/20f9f214f3b05b4d969c4be8876f9bdd41db6245 |     
 microblaze  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/e72da9aafe6cf89bdebf8313074af567d76c28fe |     
    arm      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/559690ca0a3addcaf7b4f51e1a98b2e1df582aed |     
    sh4      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/06ace04de1792cef5c540f070265bb527c454e82 |     
   xtensa    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/11c3d7c56ed9ba618aff06eba75883dbdf63b62b |     
  powerpc    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/e98a1e14c92b5f82cc8a1cd43e7bd37d9ef2a0f3 |     
  sparc64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/2dd17ff03210d7873578f4763733b1a001f9d1ec |     
    i686     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/ec4bdbb2af0cd332cafc7aba34de2c6a4bf80bdf |     
   x86_64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/72ce8156918b42e3263dc38f824898960ca68035 |     
  riscv64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/503ff295ba53ad6386986599d7709732fd1a5346 |     
  riscv32    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/322fde7d3b84069d5e21a352cc56fc2c40231ae3 |     
    or1k     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/a4e93d745318104f2df7fb767705d85c8544005c |     
 microblaze  | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/98579b13945d5934bccc55fe7a1c239df0207012 |     
    mips     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/5590a22168378da5da547832ac400f043c486e2b |     
   mipsel    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/ca79b47c3c3acb956b10c31eae5ad800bfcc411f |     
 microblaze  | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/3d9d8db2ca284c462f35b1ac54580f64ef5363cd |     
    or1k     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/c8df1c7865a10ce8cc47423c49eb3d33b52f5941 |     
 microblaze  | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/42fc1b544854f5fb4f489c518659abfc6bbd950f |     
   sh4aeb    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/7609038e7639ab64a75c0621449d4adfd22c699e |     
  riscv64    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/dc677498d96b9408de4057d7377afca444be8671 |     
   nios2     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/a2dc9b211f4b16e47a6659478668e025138fbbdf |     
  riscv32    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/d3af62f16785b07f2756868c7ffbd06876899977 |     
   nios2     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/e3d980156e934d26b2b36f49334f0fedcd2c40d5 |     
    or1k     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/50b7d2014b5bb6addf9c64d51154f71fa9dec758 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/86cdd06a7f5366f4b0de9f31cde4cc170d94760b | ORPH
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/b3e1b9299e984346b7ca22bbf03c537e88451aaa |     
  sparc64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/e4d94c76138436caf35adcddb51449ca02e8b4ef | ORPH
  sparc64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/315d3e10ed804b58a20ce17f3a21168f4ac46976 | ORPH
   s390x     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/ec70ddf67bff0a8303980e133716b58f8c203dca | ORPH
  sparc64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/18a8af5cab97d158cdd17a452169b66dade88bcb | ORPH
    m68k     |      host-elf2flt-2021.08      | NOK | http://autobuild.buildroot.net/results/2b03b56ff229141ec737f1606713a4a72bd374ea | ORPH
    m68k     |      host-elf2flt-2021.08      | NOK | http://autobuild.buildroot.net/results/37694b35002271557446b3be542d2ea09715859e | ORPH
    m68k     |      host-elf2flt-2021.08      | NOK | http://autobuild.buildroot.net/results/d03727583419e7a74cc9a8720ad146ecef6a5ad3 | ORPH
  riscv64    |      host-elf2flt-2021.08      | NOK | http://autobuild.buildroot.net/results/4c0ca4a371f700d148ec3b861cebc3ad1aa7ed11 | ORPH
microblazeel |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/122787edca2e827a09e502d6016652c1dc380291 |     
  mips64el   |     host-gcc-final-12.1.0      | NOK | http://autobuild.buildroot.net/results/efc3b90447c0451328deeace2e6e6db3eca7f50c |     
   mips64    |     host-gcc-final-12.1.0      | NOK | http://autobuild.buildroot.net/results/96918655569d3fb5b520cdae01c50921fb348378 |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/9a3fc949f42449e79645f80c2ab0295183e563ea | ORPH
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/6f21b9ec68c86bbb271d65aced29f7b1150bbfa8 | ORPH
  mips64el   |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/c1443cc165643c17cae8ef2ce9a1e67ae5eb3f0c |     
    i586     |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/6cca17c1dbdb42883d299e183dfae4e8324c3b8e |     
powerpc64le  |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/284cfa7878ffd34e5494af8b00c6263491fb73f7 |     
  mips64el   |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/aa4b4bcd4eacc87a14de49d817bf716a626a89cf |     
  mips64el   |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/794b5535126a0c5f4db0ba98b786c140ce965ec2 |     
   mips64    |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/fcf0bb80dd6c9ddf61b696dc497036513ca58cff |     
  mips64el   |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/11434d62a9cd70b268278f7f48ecdf664824b13d |     
   mips64    |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/a12f3d5115b919aba2508cd4bda5060f1a27a5c2 |     
powerpc64le  |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/a9b1afcaeb476326a88b3cd63a5ba3f593334126 |     
   mips64    |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/695c82b18ec15d3de70844454f55e4496ce18164 |     
  riscv64    |   host-moby-buildkit-0.10.0    | NOK | http://autobuild.buildroot.net/results/ccee2e526dfcf811576f857359623a51a697ed80 |     
    arm      |   host-moby-buildkit-0.10.0    | NOK | http://autobuild.buildroot.net/results/ff99d3b81552d2202cca4b340c62590a430a8387 |     
  riscv64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/f5805cd114c8d10627f585d5e2a44a25ee175a34 |     
    m68k     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/f693e096049adb3d6483a18054328c8c428f2770 |     
  aarch64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/4b2322b4fd8885999dd9963d080c7f4628863a47 |     
   armeb     |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/8907d76f3203f7924027164f41eaa4470c7319a7 |     
   mipsel    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/3c576e945437ff6c39f37458a078ccec8a92c5ec |     
   x86_64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/e6d941ad198054ff59103c0b66562512d2c3f0c1 |     
  aarch64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/7d955ec181de80239ef066bd0b4d025af7d5afe2 |     
 powerpc64   |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/ec2e8bc0a1af8fbf50610b2f7c13c2f1f2a98703 |     
    mips     |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/e0486f2a4d5e27e5154061da89c60b91cd741fbc |     
    mips     |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/a21810b962857bc667f1a5885ccbc60d8fb765a2 |     
  riscv64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/3d9ad323477c03044273ce384affa29ce069803e | ORPH
    i586     |       host-systemd-250.4       | NOK | http://autobuild.buildroot.net/results/414cf2c886c7ceef5849c81ebb906d98081aa87b |     
   x86_64    |          hostapd-2.10          | NOK | http://autobuild.buildroot.net/results/236f49528660244ac47008116c980b8e936bbc64 |     
    mips     |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/d85d7ac05aa9f2d63ab7a4a4a94eff5b87665c5f |     
    i686     |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/552ceb141ca41f549abd8206b29937f0357c7cc1 |     
    m68k     |            iw-5.16             | NOK | http://autobuild.buildroot.net/results/6c6755f94ebef4243d7efc9d335a3deceea8fed3 |     
    m68k     |          jack2-1.9.20          | NOK | http://autobuild.buildroot.net/results/6db99362a5f3b94eeffec649add4a44fd7fe74cd |     
  aarch64    |         jailhouse-0.12         | NOK | http://autobuild.buildroot.net/results/84a90401d4db1f9ed92c2824204964d510fdff5f |     
   x86_64    | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/713a9cd80f913b8b43165321aa91b37d69ea336b |     
 microblaze  |        libdeflate-1.12         | NOK | http://autobuild.buildroot.net/results/35593b3d17e92d8b6b449e0bdff37f9c5ac4dff6 |     
  aarch64    |        libdeflate-1.12         | NOK | http://autobuild.buildroot.net/results/3f3e35a04c3a98499b12038bcc7b90735c8f87d9 |     
   armeb     |           libev-4.33           | NOK | http://autobuild.buildroot.net/results/6f853583a99d444b58529a53c30d97dd01c2cf97 | ORPH
    mips     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/dca6791bdb3fc1054da513bd6056cef65b25f307 |     
   arceb     |          libftdi1-1.5          | NOK | http://autobuild.buildroot.net/results/1b38715b13b8293e2b9996822f71408f308269c8 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/f829123bf76253bad7224fa66dd0aa0509fcb92a | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/dd4c714b3cd8f9e674a809376b2309b7da452bd6 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/9d2c15c7b365c035f45e5e5212c95954c68b4d33 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/3c05462e9a2ce5e81f48b1abf7e45820b2ab53cc |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/9b84c062d444717b3cfe9d7cb3d8935d2ffe58d0 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/884946340082a16ff4ad2085ff99d2c8459c63b6 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/f8d538a576c225d2b8064125d67343c79bb3c789 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/e8b81a2753411163f17117dc0e42f9a0a9775bee |     
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/b9076e7210a2caacc5b03c7a01b5f55e19929a2a | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/7272fc93a3735ce04f9efbc5d937c3e045721eeb | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/072e119046e705a9ec69e139594b3af44b70a511 | ORPH
   xtensa    |      libmicrohttpd-0.9.75      | NOK | http://autobuild.buildroot.net/results/64be6f75880131da76fec91d73f3166d65797ab6 |     
    m68k     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/d24d28a8c21b5193e0a55325f5224795fde83ec9 |     
   sparc     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/74c5b4ea7fd50fcebe6215a5405864b4e91aeb0f |     
   arceb     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/cc1e96f2cf3d266ee5158bed280995262cab94ca |     
    arc      |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/c0305d91867e372e0327300f60ca7ae9482882d4 | ORPH
  mips64el   |  libtorrent-rasterbar-1.2.15   | NOK | http://autobuild.buildroot.net/results/09989dceec1846add450dc8b62a4981cf4207d95 |     
    m68k     |  libtorrent-rasterbar-1.2.15   | NOK | http://autobuild.buildroot.net/results/cb267c9d7d13ef0974ff462f00edbc962cdba56e |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/085586ecfcc9ac769589b24d585623542e80a765 |     
powerpc64le  |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/a1a89366f7c3da60ecc89eb99ef2f95226fa7456 | ORPH
  mips64el   |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/af3bc529f3599b674437e54bf27243fc6a70ffc1 | ORPH
   mipsel    |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/a23f04be625b39990e6e5dcd98605b68dc27e09a | ORPH
   s390x     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/c49b6188befee0368cf331b3346114509937a0f4 | ORPH
   mips64    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/2757897efaa4c565acf4b230c031d17bfdced4e0 | ORPH
   sh4aeb    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/9ce9fc439423e183e943cf9fc857e4bb777fdcf9 | ORPH
    mips     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/051e80ed72e3ac1976ce4dc630f23cab8c7d06a4 | ORPH
   mipsel    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/33635ed1339abfbd36c4ad6c6d9f751ff942ce92 | ORPH
    m68k     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/9086eafa49c3c499d74d0686d43c04b3658eecc8 | ORPH
  sparc64    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/234968518540709a80e7c5add4b4ef7d811200cf | ORPH
    m68k     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/99da4e8e4b9e0e08463c21ec4f7b588097d8a01d | ORPH
    i686     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/04ab44540edc0f0aeeb845cb9ce378ac20782835 | ORPH
   armeb     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/dffc562f044dc0429c6e91dfdeb96081519cd450 | ORPH
    mips     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/dcac0662192126fbed84e3a5e381f6f757bbb91d | ORPH
   mips64    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/7f870f1a7424a462fcd550c3788915ea826d9355 | ORPH
 microblaze  |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/c59abd9875eda0232d4943549ad1c561fdec0fd8 | ORPH
  mips64el   |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/33c38d61a4e7918f33d80d2f71724b294f18e4ff | ORPH
  riscv32    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/8d3c06ea6cdf091b6b281b40491f6965215ce93a | ORPH
powerpc64le  |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/b68d5fe1695754965cb983a0049182dcaa95142e | ORPH
   mips64    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/5fca9a497e64ee314de8dcba75c6ed2d3bf6a460 | ORPH
   mips64    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/578204fabfeed72d56c4f106e8e76c1980947c6a | ORPH
   s390x     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/2d87065b59fff1bf789ad2572ac8e6f8ab391fa2 | ORPH
 powerpc64   |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/3a926e2dccc9d1fc903ce5725c6d8657932a94d6 | ORPH
    arm      |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/42257129adaa3a0ffbb359300834066d79b42805 | ORPH
    m68k     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/513d8ccb731e9a225e2c9aaf5514a3bb86fc6db8 | ORPH
 microblaze  |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/f7034446d455297ab774f8879be842b485c14cb7 | ORPH
 microblaze  |          linux-tools           | NOK | http://autobuild.buildroot.net/results/04504ba0019719b226a097e4b42b0f375a2c7f80 | ORPH
 microblaze  |          linux-tools           | NOK | http://autobuild.buildroot.net/results/261ebff332fb7146582786e4f4aeebadc5a9d84c | ORPH
 microblaze  |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/6617fee78bbdbd8fbb920cc906d89023a4eb09bf |     
   mips64    |       lttng-tools-2.13.2       | NOK | http://autobuild.buildroot.net/results/2bc640c0ee34c943b3d7bd347a1a03854a9ec9ab |     
   x86_64    | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/a1bd6abfd774ed426bd8aa34a9aafce9dc4c6c20 |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/6c5b7647a6769d8c21220c389873631bdb719ebe |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/b42c8ba17d785988625dae02e87f603cba21ea8c |     
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/eae44a5cedc5ed5ace525a0469f6591f75fcbc76 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/fa218866c87fc59ff6c89def452ad5a82031fea9 |     
    arm      |     mxs-bootlets-10.12.01      | NOK | http://autobuild.buildroot.net/results/2317d67bebe25043bc8f8018a573a5092e1276b7 | ORPH
   s390x     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/d60cca93cfd1e5a8eaf005ac9980b0ca9f139a8d |     
    i686     |         nodejs-16.16.0         | NOK | http://autobuild.buildroot.net/results/ec8a1dad1a717475b571f25e5065b885470a1009 |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/355a46f45caeba4a1f9ad13d6213892f7af96d79 | ORPH
   xtensa    |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/34ab5ae5372af8b4e579ccf82a0a0059c418d291 | ORPH
  riscv32    |        open62541-v1.3.2        | NOK | http://autobuild.buildroot.net/results/92a988cf8d44f06bbafecee39092a76f565742aa | ORPH
   s390x     |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/0ee433d5302ffa7e5474419abf44bbb5719de52e |     
  riscv32    |          opensbi-0.9           | NOK | http://autobuild.buildroot.net/results/ac7a8f8e2783d1672e88f3f62928ad5834331559 |     
    m68k     |         openssh-9.0p1          | NOK | http://autobuild.buildroot.net/results/ccef9f48ec144b6e3c4c2400c26459b330748270 | ORPH
    m68k     |         openssh-9.0p1          | NOK | http://autobuild.buildroot.net/results/7ae167eb654f483e39ca01eb2a9091cc74735f93 | ORPH
   sparc     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/9fb59c58ed06c8fc73398158f6126ac574f5084a |     
    arc      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/83f98eeb76c86bfa49af0c5f56357a2fed3d9241 |     
   sparc     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/111e44a4dc5620f73d155340ca1ba4a05e60c9d5 |     
   arceb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/ea31a33a2cd6beacf7a93f950141127994e96b71 |     
    arc      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/c5e67e4755a25e826b6fc1200c6ed1cc90845784 |     
   mips64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/abcf324c6d08024bdeefe888a3ee706cd1650d7e |     
   mipsel    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/cd102c59730764e66f181e5dc603d4b413dc38ed |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/7baafe441f8c5f498984e2c56c0a45e8c73221df |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/ea519d9c9787a880d894165253ba1d82f114c034 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/b7a2ff37da87ef01f5a5677ff5acd5e2e69c9de3 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/596fbaf9dead3f353ebfbdf55bc668be93ca12c4 |     
   xtensa    |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/a80486ae6ca058e71694252595b9181eb107595f |     
   sparc     |         proftpd-1.3.6e         | NOK | http://autobuild.buildroot.net/results/a05d9aebc4dcc9c9ecb9de27149678dd3de77df5 |     
    m68k     |         protobuf-21.4          | NOK | http://autobuild.buildroot.net/results/e766cfbfe9b5f9a42529ea2baaa6111fc3feb48d |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/5a7542f7981e662293dece7b1ccd4bc67e80095d | ORPH
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/1a5459414fc68edbe1e1bf2287957fe1ba941cd8 | ORPH
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/76fbb41904e0380c83f2a131e72c8ed2ceab566f | ORPH
    mips     |     python-greenlet-1.1.2      | NOK | http://autobuild.buildroot.net/results/33ae3f685b030b238a1782268275b0e60381bb53 |     
   mipsel    |      python-orjson-3.7.11      | NOK | http://autobuild.buildroot.net/results/9cc5eec0d1022086b0718443e8808cc8343fbfed |     
    mips     |      python-orjson-3.7.11      | NOK | http://autobuild.buildroot.net/results/6cc0f8662e0afe6620c716e5ed8e3516696e08db |     
  sparc64    |      python-orjson-3.7.11      | NOK | http://autobuild.buildroot.net/results/ef06926d1bed66f906fd5464e9621ffdae42ea7c |     
    mips     |      python-orjson-3.7.11      | NOK | http://autobuild.buildroot.net/results/149d9c6690e16bdea5b6a5b3621d2b6c231fd7b5 |     
microblazeel |       python-ujson-5.2.0       | NOK | http://autobuild.buildroot.net/results/e4947ad7fbe3f8291c75fe8d8fb2f12835602f60 |     
 microblaze  |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/f54889a7e4d120384ff761059c9e38aee6fd08da |     
 microblaze  | rtl8723ds-76146e85847beb242... | NOK | http://autobuild.buildroot.net/results/adbbfbbc60727a0f38171716967f74bf78e3a03f |     
   s390x     | rtl8812au-aircrack-ng-4ab07... | NOK | http://autobuild.buildroot.net/results/cfc35dfc52fd45a6b1f5baaaa2e86f0adb715975 |     
    mips     | rtl8821au-4235b0ec7d7220a63... | NOK | http://autobuild.buildroot.net/results/d222477cece0e58ee1a573f033362af3d6f7ca13 |     
    i686     | sconeserver-8d1935919a20133... | NOK | http://autobuild.buildroot.net/results/70a16f952385ea562ad2e9350306223fd16101f9 |     
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/74c6aadafe834352c39f2584cd7f2bfe3e085022 | ORPH
    sh4      |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/92127efc98a88bea0ebdf0138177dfe99c57bb66 | ORPH
    sh4      |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/92a08db4495600b1aa56de051b01b6506787125e | ORPH
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/1fbf870b8a9695fb8d17579a3af436924e5b8962 | ORPH
 microblaze  |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/442a33da2cea97d5cd6c4b4b199213238167d5ff | ORPH
    or1k     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/2ee50d45a3af797d67dd047bc3743452e869659a | ORPH
microblazeel |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/e7d458bc79386402d4d5872f23da4823e2400b3c | ORPH
    or1k     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/f8b64485e0aa459cbbfa43399e28ecff514a4461 | ORPH
    arm      |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/482f84f539c49e13445e238ffc42b08333757d7a | ORPH
    sh4a     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/95314d2ebd9d97e8d9a62063f241205354f939cb | ORPH
 aarch64_be  |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/ccb3fd8cd44239c684497a1d0be3f05f1d4de41d | ORPH
   sparc     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/4f3a189582f92d32af13fd835c4a26f5a5dd06b7 | ORPH
   x86_64    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/345be4741e06f861959ed539f24ba8db9d02e04c | ORPH
    i686     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/9766b50b63093f55b18fe1a1816da4c61b88cf78 | ORPH
   sh4eb     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/6fd4d2ed64bd2a513c301d76318f071a5d68d8b7 | ORPH
 powerpc64   |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/4266a58768b553a5f49e101518a4c1a0b9cc1cf7 | ORPH
  powerpc    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/8e242804700feabe379a049cdb08b36fb9e35bd2 | ORPH
 powerpc64   |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/4c17b6a1e019e6e3e05885aebdeb25b95df6ce4a |     
    i686     |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/0d34ec73899cbca8919cb8f47f51f1aee41806a4 | ORPH
   x86_64    |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/29abb37cbd1c81029a0918ee037da9e681932d90 | ORPH
    arc      |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/ab190c6f6ccb56bd85f68ab6993813be6b540a68 | ORPH
    arc      |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/30a81ccfafaa63a29f2ae9f5d4e103803e9ce79d | ORPH
   arceb     |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/ccc523dc1fcee63b1654dbc07c26d1f3183eec27 | ORPH
   mips64    |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/229e0022aa5b9c78f7a0eb5c95d788cc0e73d682 | ORPH
microblazeel |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/c6ed29c5227c286819d69b0fb7a5506693c93a7d | ORPH
  sparc64    |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/f51d374607b7802e8d1d47393d88a02ef0503b5c | ORPH
   nios2     |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/a42c883d1b9920b99b9a909637876083d9e24ea2 | ORPH
    mips     |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/2036d52d81d9178f817dee1b358f048b087e53fa | ORPH
    arc      |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/a5bd86da0a96e0f6be4079cfa27560b9a86e817c | ORPH
 microblaze  |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/3ce4dbb20e4d8cd3291918a357b2fc9fde04df6f | ORPH
    mips     |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/e5f0a4aeb2523c4fd115ab6667dae2938a3514ca | ORPH
    sh4      |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/0a51374a9c5426a58d4aaf887470b651fac3a0b8 | ORPH
  riscv32    |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/1905fb745b21aca4ff922460cadafd089e3a6f70 | ORPH
microblazeel |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/815eb29546614a630062c76258877cefcb116a31 | ORPH
 aarch64_be  |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/f8d7f76c4bf5503cb3c64046c7d61bb3e30bc09f | ORPH
   mips64    |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/9a9e3dee898806b427cabb1679347dced8f25c20 | ORPH
  powerpc    |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/05577944dc5a1fa3b49ad5def42c4902d33b7ac8 | ORPH
   xtensa    |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/8c0cd92d41f39120f97dc9518b0bd7bebec5516c | ORPH
  sparc64    |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/ac318b80c57fc0aa8780646beb64938ad1ecdf42 | ORPH
    arm      |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/f4d9b5092fe4016bde7edbaae1f6e60bbaef7ef4 | ORPH
 microblaze  |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/884bf31c8e90e8304c32e2bb5d3d8a4788e8369d | ORPH
    arm      |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/a14c77f2cc6c3343e34015686c1a41fcdbf8f6b8 | ORPH
 microblaze  |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/d1fdd509ef5f44272de04c69d63f2ebf5d3ad043 | ORPH
   sparc     |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/95ce4384c5fcf7fa4d74cfcd2bbfe04f56e43a40 | ORPH
    arc      |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/5ffc7f018515117219168acd73ba07ba4e82b27e | ORPH
   x86_64    |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/7ae0a1aa601cfcc6d9ffd2205d507b69dfbef643 | ORPH
 powerpc64   |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/0dba8f42e39f1a5eed27e91ca044b086740e27db | ORPH
   mipsel    |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/fb980f3b0ac82be0569fb2fcdc5a028d6d904a89 | ORPH
   xtensa    |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/1ab98275534f30d1d182461050a8eb6991b33a5d | ORPH
powerpc64le  |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/e987faa962d5ab736102239e8c1479e5a95b204c | ORPH
  mips64el   |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/0cf5975b8213ed926f0f15998c7c3b59958dfecb | ORPH
  powerpc    |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/2d2e0d3a502d94a66fb52e3732e99ce24c255bfa | ORPH
    arm      | ti-sgx-km-cf7f48cb30abfd5df... | NOK | http://autobuild.buildroot.net/results/3f04148113a2da912dbeddf0e9b73abcdc4f4f20 |     
    mips     | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/dec5e062f0f692160ac1b2e3ee8c7d175ac13838 | ORPH
  mips64el   | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/96ec975caa5448e775ccfa23d4f2c576dc8b3895 | ORPH
   xtensa    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/2aebe9989853ab921b2b49135528e84929abeb5e |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/cb47a90aacd6857e52aaa43b5568f4f4385e6c16 |     
   xtensa    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/f7c9e5257dafd1c283428b75a0106906f093cb7c |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/363ea588280466694b6043e484d6dcf2668f665a |     
   arceb     |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/27ebea485102b86752e975539c23abe5e903b9a3 |     
   xtensa    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/46b5ee0a6505ef638fb56603b240e6d975ab9947 |     
   xtensa    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/39fb8a8e1b5d1c3b640f5b97e36930fb013a33a6 |     
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/08fcf8419293d877ecfea0511104f660c1e70d79 |     
   xtensa    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/45963ed38bdeaf36a6cb9926e2c58d7765422cfd |     
   xtensa    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/9cdc7804c852f53c54e1008b69ee4e95b206d4ad |     
   xtensa    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/b9de75daed2d3ed00550c5d8a52abb5e1c79b8ea |     
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/9f52a61408e5aee9070345ad141325f4fc53c2bd |     
   xtensa    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/965d4ee27ccc61d6d4e76138baff591ddc27e153 |     
   arceb     |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/b62c198c47522f9257d739888e0bae686d9b38b1 |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/55667f3d4f7b090cc6e9c84327fe36946f309e29 |     
   x86_64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/30ee587552d99383cfdc1451d0598322dccffe91 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/5e2fb3407be9ac4282833dd5865fac26e02e0acd |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/07e1241ea428403fe74681459c1eda2b7b616fd2 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/2769b425575235cf51c5159c437ed04d42d2eddc |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/16e1fa713fdc4b27d0c2b1a98f76be8621b5fdcb |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/2ecf95c154cf036f1e12c93afbbe259779019301 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/8996d98cdfa7114fe6a8ec007ebdafa9c3ade972 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/8a448020db190515487a852b2274e1b717621518 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/ebbe44debba384c42b37908a13704c48958555d1 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/15bd176a652d3fe9b2db15d0d5e6f79855a0841d |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/d1eb58c0963a19c58c81bdb6ed0d697d21e54ad1 |     
  sparc64    | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/285b86193c0bebe87ca51b6aa518de1619cdf235 |     
  powerpc    |           volk-2.5.1           | NOK | http://autobuild.buildroot.net/results/e264a88d4d9169a9d237411ebb8d27448f6dbd5e |     
   mipsel    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/28ad90ce448bf1a52601f9ff3969ddde9cf0a50a |     
   mipsel    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/d645122e724f28e3a0a8e8d95e35c6291980a07e |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/e3f15c6ac4db03448983f9cd7da84b95c92dd9d6 |     
microblazeel |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/cd6ea68cb9546800aa4b091f184487f787a4b1b0 | ORPH
powerpc64le  |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/232c68732a110561482f89a7083a90d874e61e23 | ORPH
 aarch64_be  |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/e1d769bd19f443edc8b669b13b2a00efb63ec308 | ORPH
 microblaze  |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/24d1c06089967fe61e8ef23940fe2e15eab99630 | ORPH
    m68k     |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/6ad8716005f5da3c17a62e6e6582015e7f428f93 | ORPH
    m68k     |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/e308b4e7705146fcc6b0dc5a1fe5c1328c0b9670 | ORPH
    arm      |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/e48b1414b0ac610dae7e9d452d3d55f31cc7308e | ORPH
   arceb     |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/50b1f85592f2f0ce9c4deb21945718fd86d1ef63 | ORPH
  riscv32    |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/8cd890c3da57d8c894e8fb58186fc67f6aa2ef8c | ORPH
    i686     |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/f8f0c2228361f2fe66f29fc80e49c31f8e969807 | ORPH
    m68k     |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/da429a0950478a6145cb6cfce8d7c6a923ccb26c | ORPH
powerpc64le  |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/3d4cef3e999c023c95579489d3f2af961083eff9 | ORPH
 aarch64_be  |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/50a9575e109c9e2191d86448207a578918d47e28 | ORPH
    m68k     |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/a537713ddcb85584265185ae8697bf670844cdc8 | ORPH
   s390x     |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/0c44f7c1a688af1aeb1eabedc64ace2dd063371b | ORPH
   sparc     |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/7c5efb05fd83d3ae67f791a820f6f126255dc1d6 | ORPH
 aarch64_be  |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/be3340c55e1c35e712908ead8fbe4c01a7c9035a | ORPH
microblazeel |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/c77617c8a0af05a4eaf003740fccec7b7b7e5d2c | ORPH
   nios2     |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/244c8142ef83ec9d3d1a06d76547b0fe97eed6c1 | ORPH
    arc      |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/c5bf8b3f69f6e6a3dcb1b56f75c1538a92ed4706 | ORPH
 microblaze  |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/31d2f142a6affaeff8ccb629eacd577f2e867740 | ORPH
    arm      |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/4c83d68b82057463bd792c40899cb95b8693c5ae |     
    i686     |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/59f37aae29390249974fd48fa75cd04640ec9126 |     
  sparc64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/79b22b71caf845e13e451bdddfdfcecbef8e42ad |     
    i686     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/226cd875c61db2c84f52dc45abe0bbc463e7c5c1 |     
    i686     |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/10116ee21d297ee55acb2431619f7a3b58e188f4 | ORPH
   sh4eb     |      xtables-addons-3.17       | NOK | http://autobuild.buildroot.net/results/14ee786248b8a88802fb6acd6975921d7507b8f8 | ORPH
  sparc64    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/8eb3b494cc15e7e66e7bc4ed590e4e87dbfed443 |     
   nios2     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/1c3c31e845fda4f2755cb60216dacbcd627517dd |     
    sh4      |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/c01ed5aa1b94c92bd8947746d1998bfdc24fc515 |     
   x86_64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/796f1eedd06139f7fc78810bf61f88278ae6c9f8 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/cc0aa2f895f23bea87460024c1fa80fd6e694dda | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/a03c3b9a8876e94b48bbb986cf3f78853f639527 | ORPH
 microblaze  |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/cc3b429a3d7ab9ec0aa88faed1ac47afd593f0c5 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                       frr-8.1 | 1 
                  ndisc6-1.0.5 | 1 
                    ruby-3.1.2 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/c501bf5b2ceb87f9689a7b0cbe5393143856d33d |     
    arm      |          ndisc6-1.0.5          | NOK | http://autobuild.buildroot.net/results/93c082a3d6d991c6e7c9c6de714c6d48d83c6c5d | ORPH
  riscv64    |           ruby-3.1.2           | NOK | http://autobuild.buildroot.net/results/4de4c9d97deeba1449fd2afec6a1d4f2dd4eabfe |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

host-pahole-73383b3a39afe86... | 3 
               protobuf-3.20.1 | 3 
                elfutils-0.186 | 2 
                host-go-1.18.3 | 2 
dahdi-linux-5c840cf43838e06... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
  gobject-introspection-1.70.0 | 1 
              jpeg-turbo-2.1.3 | 1 
           libfreeimage-3.18.0 | 1 
          lttng-modules-2.13.1 | 1 
                  xvisor-0.3.1 | 1 
               zziplib-0.13.72 | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/294aeaa7e108cb7c2554b7b69ab43980cac42260 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/30e4b1678be627bdb67390e2a63d75955a844cd3 | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/715646ae1f0d5e3bb87733d79f63bfaaec81a39a | ORPH
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/84e9f154194e8f3aa219d958867844c75cae55fa |     
   armeb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/15d49698a7eb7a6589f2ce71b0efec5fc8c8ef4c |     
    mips     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/7e22938c899d71d9a47abee039f81b5fd5585b3f | ORPH
  mips64el   |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/759859f124b87eb04ca81a2c2abe872025ffc6e2 |     
powerpc64le  |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/222a95c1b7278a92e98265e91dcc90294a92394f |     
  aarch64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/256546f1ee1d6ca785fb80267905b68bdfa305a8 |     
  powerpc    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/8572b89e5a5852fe87e32f77835ed2e661a29467 |     
microblazeel | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/34c7b8ec827ddad17002914d2719d3162091cf42 |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/f1cf5cc613b0aaf0c304cd83cfca1dacad6d42c6 |     
powerpc64le  |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/1df272cf3a1fb7a0211c48024ec13e91fb7893a1 |     
   xtensa    |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/e1cbf6b7d6137e7ce894168ff026e5ce66cf134f |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/e94c598549443a5daf6353492d4ffcbb40200d44 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/f15cae380ca4d043f637ed4e1dbd6935972afff6 |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/5ef13532b7ad080a4c776fb804b5b5987a0db1e9 |     
  riscv32    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/9864b6117fb0ac90f02517099d1e8a35d52415be |     
    m68k     |        zziplib-0.13.72         | NOK | http://autobuild.buildroot.net/results/0534a5a2cf5d11645dfb6b7e1dbb35f83999c951 |     


Gitlab CI results for 2022-08-22
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
...ToolchainSourceryArmv7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2913432226  | ORPH 
                 TestTmux | https://gitlab.com/buildroot.org/buildroot/-/jobs/2913432183  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
