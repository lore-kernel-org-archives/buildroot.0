Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D1E5C433EF
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 05:44:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE558415D3;
	Thu,  9 Jun 2022 05:44:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 26fGCdCUWxyv; Thu,  9 Jun 2022 05:44:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39B0B415DB;
	Thu,  9 Jun 2022 05:43:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EEBFA1BF589
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 05:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E130D40BD9
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 05:43:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WH-EhDXlzK2c for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 05:43:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 10EA2400BB
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 05:43:53 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 589952000D
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 05:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654753432; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OVPniD47sfxODmUsLhbN5Rrn4IUIGXcZ9rawGGDSBXg=;
 b=Ci8PrBifXCKgEWYtQATnsrmwxCpCzOQBhyq4j2WtL7iwFcdZAi3J7CU2RxS1yh0mAILHYR
 9ncpSxWCtNUvjSNfhNy1Gl25zDvi8XzHr//psX6kj1NeAls7H2v0E5nOq81VCQWOIKVNDX
 Wg6Pe+D4NvAwFSd7IbBlRkmP4z8TRzTHRtJst8HXPOORPh2ix3LjtuOTF1yB/5k1iugEUI
 zECgOlq7km3acvzjj3+rdGL5T7a6FX5HCwasHZYiWrWGLjg5vLgeyOeYiZpJVmYbnFCnaV
 Aiolr+janzs6zl7RxbZbY+d1PcxqJ46PWc4zf24VYKmyOn7c5ymiM5nl91bqGg==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 09 Jun 2022 05:43:52 -0000
Message-Id: <20220609054356.E130D40BD9@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-06-08
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

Autobuild statistics for 2022-06-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 10  |  4  |  0  | 14  |
  2022.05.x  | 23  | 20  |  0  | 43  |
    master   | 185 | 238 |  0  | 423 |

Classification of failures by reason for master
-----------------------------------------------

                 linux-5.17.13 | 14
                 uclibc-1.0.41 | 13
             libopenssl-1.1.1o | 11
glibc-2.35-96-g2c4fc8e5ca74... | 10
                 host-rauc-1.7 | 9 
               protobuf-3.20.1 | 8 
host-pahole-73383b3a39afe86... | 7 
           libfreeimage-3.18.0 | 7 
                 zlib-ng-2.0.6 | 7 
                host-go-1.18.3 | 6 
                busybox-1.35.0 | 5 
              host-rust-1.60.0 | 5 
                     refpolicy | 5 
                 dash-0.5.11.5 | 4 
              swupdate-2022.05 | 4 
                       xenomai | 4 
              alsa-lib-1.2.6.1 | 3 
                  ffmpeg-4.4.2 | 3 
               gocryptfs-2.2.1 | 3 
              jpeg-turbo-2.1.3 | 3 
                libressl-3.5.3 | 3 
       linux-5.10.109-cip5-rt4 | 3 
                      rauc-1.7 | 3 
                    zstd-1.5.2 | 3 
             berkeleydb-5.3.28 | 2 
                  boost-1.79.0 | 2 
                 coreutils-9.1 | 2 
dahdi-linux-5c840cf43838e06... | 2 
           docker-cli-20.10.14 | 2 
  gobject-introspection-1.70.0 | 2 
         host-gcc-final-10.3.0 | 2 
         host-gcc-final-11.3.0 | 2 
            igh-ethercat-1.5.2 | 2 
              libgcrypt-1.10.1 | 2 
               libvorbis-1.3.7 | 2 
                  netsurf-3.10 | 2 
                nodejs-16.15.0 | 2 
            ocf-linux-20120127 | 2 
                 pixman-0.40.0 | 2 
    toolchain-external-bootlin | 2 
                       unknown | 2 
/home/buildroot/autobuild/i... | 1 
                    4th-3.64.0 | 1 
               acpica-20200717 | 1 
                  acpid-2.0.33 | 1 
              asterisk-16.25.2 | 1 
                    attr-2.5.1 | 1 
                     aufs-util | 1 
                    bird-2.0.8 | 1 
                    brltty-6.4 | 1 
                  cairo-1.16.0 | 1 
                  cmocka-1.1.5 | 1 
                 coremark-1.01 | 1 
                 dc3dd-7.2.641 | 1 
                    dhcp-4.4.3 | 1 
              e2fsprogs-1.46.5 | 1 
                  exempi-2.6.1 | 1 
                     file-5.41 | 1 
                   flann-1.9.1 | 1 
                     frr-8.2.2 | 1 
                  gauche-0.9.9 | 1 
                gnu-efi-3.0.10 | 1 
              host-delve-1.8.0 | 1 
          host-elf2flt-2021.08 | 1 
host-google-breakpad-c85eb4... | 1 
                jailhouse-0.12 | 1 
       jquery-ui-themes-1.10.4 | 1 
      libabseil-cpp-20211102.0 | 1 
               libcap-ng-0.8.3 | 1 
                    libev-4.33 | 1 
               libglib2-2.70.4 | 1 
             libgpg-error-1.42 | 1 
          libmicrohttpd-0.9.75 | 1 
             libopenh264-2.2.0 | 1 
   libtorrent-rasterbar-1.2.15 | 1 
                   linux-tools | 1 
               lpc32xxcdl-2.11 | 1 
          lttng-modules-2.13.1 | 1 
            luaossl-20200709-0 | 1 
               mariadb-10.3.35 | 1 
                mpg123-1.25.15 | 1 
                 musepack-r475 | 1 
                    musl-1.2.3 | 1 
                  mxs-bootlets | 1 
         mxs-bootlets-10.12.01 | 1 
                    noip-2.1.9 | 1 
               openpgm-5-3-128 | 1 
                opensbi-custom | 1 
                    opus-1.3.1 | 1 
                    pimd-2.3.2 | 1 
                    pppd-2.4.9 | 1 
rtl8189es-39c17661136da48f8... | 1 
rtl8723bs-11ab92d8ccd71c80f... | 1 
       shadowsocks-libev-3.3.5 | 1 
                tinifier-3.4.0 | 1 
toolchain-external-bootlin-... | 1 
                   tor-0.4.7.7 | 1 
                  uhd-3.15.0.0 | 1 
                 wavemon-0.9.4 | 1 
                xenomai-custom | 1 
                  zabbix-5.4.9 | 1 
               zziplib-0.13.72 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/2950490d0f71d764ceb99d60f0d8ebc203c976d6 |     
   mips64    |           4th-3.64.0           | NOK | http://autobuild.buildroot.net/results/e47f6d3ed95ca6e981419794532208ec6f534e5c |     
    m68k     |        acpica-20200717         | NOK | http://autobuild.buildroot.net/results/8356f706a19bd9fca725d492ab29f88b13cb01e5 |     
  mips64el   |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/67de75c743625e0fa7bae897296e7521bf19f00b | ORPH
    m68k     |        alsa-lib-1.2.6.1        | NOK | http://autobuild.buildroot.net/results/c55c20503617090394b56e0fb8e7b46641089264 |     
    m68k     |        alsa-lib-1.2.6.1        | NOK | http://autobuild.buildroot.net/results/8786867e9f17b685088c35997b1f1a1c08e9b01d |     
   mips64    |        alsa-lib-1.2.6.1        | NOK | http://autobuild.buildroot.net/results/0e48c50c1fe57131ff8d1ad9b6d3618d6b39ffa9 |     
    mips     |        asterisk-16.25.2        | NOK | http://autobuild.buildroot.net/results/58c8f0a115da6b19e4425a75df4b415339f4ef2d |     
  mips64el   |           attr-2.5.1           | NOK | http://autobuild.buildroot.net/results/0187309f66b8751bbfd9ec6c65f601aa3526f719 |     
   nios2     |           aufs-util            | NOK | http://autobuild.buildroot.net/results/35b0165b53a651bb676008db21a5fd9135a76c00 |     
    m68k     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/621bb0e068cbbf89cf666f42e2b8055b61317c9f | ORPH
   sh4eb     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/329757db3e17debf50318219b8e7f812e8bd2ed7 | ORPH
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/0897749928703ffeb3cdb062d2098471b66cb1ae |     
    arc      |          boost-1.79.0          | NOK | http://autobuild.buildroot.net/results/33d93229ede7d96cf9c5829f878da34db92d5b06 |     
    arc      |          boost-1.79.0          | NOK | http://autobuild.buildroot.net/results/68704ff4e6b30bbde99f04fb86ee09045c51e4cd |     
powerpc64le  |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/1edca9c83a9d9605ed9f0dd9c1060f3394ab25a5 |     
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/389fdfda3035ba4f5d67d9a5a84d395572ec93df | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/ee67a14857057e49ef1e635e7e48bf41e94cfd5d | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/3979441e74472a67523d228d107ccc4cb42c837c | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/24df9fe430d15839bfa037b279118c51344fa23a | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/23246f0e5066976d27c72646b2b7f177fbb548fb | ORPH
    arm      |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/907ef56d1b85892fb8147832309d0fed54d09cc4 |     
   armeb     |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/285c8f5b8644bbabd8cdf26d14acc42b00fcb3cf |     
    arm      |         coremark-1.01          | NOK | http://autobuild.buildroot.net/results/ff11278ad3d4092c96de7b92074212efc15e6ac8 |     
    sh4a     |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/0cf6c541a72141969a8c83505e5b30e18921e7dc | ORPH
    sh4      |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/59ff39470cf974759839b66d3fc185410a5e5d63 | ORPH
   armeb     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/e0de96833eb7e66e28b637682fb23f38e6cb5e12 |     
   x86_64    | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/b4cf05de69c154f938c08c2e8457f8241b53832b |     
  aarch64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/fa49d3b0506094df70ce543844b2d71586dc19ff | ORPH
   s390x     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/c982a56feee0c162d4148ebb21d78dd71091a885 | ORPH
  aarch64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/04c77f43795d293c4ea6302b193536705e6f7624 | ORPH
   sh4aeb    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/4b044472b48a2e7360434a5fc62338ebd0070653 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/a0015f38cf8c680cc8abeeafb1c84c0f286f119d | ORPH
    sh4a     |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/538f9dd53d52a70d8bdc15983ce1335712847e7c | ORPH
   x86_64    |      docker-cli-20.10.14       | NOK | http://autobuild.buildroot.net/results/98170a74415bf090b2375462ea3ee9c97022b1a1 |     
   x86_64    |      docker-cli-20.10.14       | NOK | http://autobuild.buildroot.net/results/5ab1f09ae24dc94e353858fbb54d3a4fc660c4fe |     
    or1k     |        e2fsprogs-1.46.5        | NOK | http://autobuild.buildroot.net/results/2126d2e2959790a99a7bef748c33ef5c4a18b2b2 | ORPH
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/29646856df27eec22b97af2e254c8c755c52cff0 |     
powerpc64le  |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/d6f0fe71e48ee0fac3f4e16b0c0f2ff10a54c83b |     
powerpc64le  |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/8bbd237812c2bef12d22fbc098386e9e30cade3e |     
   armeb     |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/27d2b3f2767fed6e4b6b07f7db4576c12cb2a32f |     
    i586     |           file-5.41            | NOK | http://autobuild.buildroot.net/results/f35ee6cf38322f7c4b8d2f9bcf9cb9dc78d96d00 | ORPH
   mipsel    |          flann-1.9.1           | NOK | http://autobuild.buildroot.net/results/20d0036b73667a434a339944176ec3d3df7712cd |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/b2babc395f774972c86561293a661cd1cc56a8d9 |     
   armeb     |          gauche-0.9.9          | NOK | http://autobuild.buildroot.net/results/7c97ab4a1219c116494a6c1804849386c1e447ff |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/ff1609aa6a4ea5093030a4067450ffa086cf1470 |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/d35c5ecdd811b77d64b978a22f05443265369dbc |     
  powerpc    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/d6fc7b234c59bba65021c1586d730c3fc9587362 |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/0ad07dc7307738f3e4968a5e63fbb79f2c10a78b |     
    or1k     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/dbec237fa12016fd23497efc01045e67697d5839 |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/aedbc38d0fbc36bd735fed2aebcd7c307e848ab2 |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/c178d97ab638d55a237e3f2518a4856d1284df12 |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/1b799d9da2f66a9912b7f517c8bd7cb7d0a6b822 |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/e9f564e8e3bd6505e7421791816a6d213cf17f63 |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/fd4ae77dba8b16b11a1c7c9fdde93f529f099cce |     
  mips64el   |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/365570b05c74c3c6204efd26ac2eae8fe7075a78 |     
microblazeel |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/e5138a4fd27522e72983dfec39ede5f451720321 | ORPH
   s390x     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/3ec7d77fd7b480b3c222805ade58eab3b496b8d8 | ORPH
  aarch64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/69ca3a99ccaae0a8e39fe6ddeccbdecf017e9818 |     
  aarch64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/17f206b0319fe1d87eb9d066d3d947a7affd5000 |     
    i686     |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/ed68be47815b18c765f6b752d01d022e1edf1b53 |     
    arm      |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/5681c8e547ccae8afde2926b63778e130550b392 |     
   armeb     |      host-elf2flt-2021.08      | NOK | http://autobuild.buildroot.net/results/9bca0cbfb6a66c455e74ad194526bca942665978 | ORPH
  powerpc    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/192205ecc6a8583938b0ee917afc655774d84cb3 |     
    i586     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/3d8cb5cb38f2a42ec160bc0105b0ebe957901b36 |     
  powerpc    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/9e07cc621e4a1aba07ca7c4d24858ad740ee06c1 |     
   x86_64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/96040c18bad747e377c741e778724360f6a5e73e |     
  mips64el   |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/067569ef3c593429964b5a29f5041818ea1c517e |     
  aarch64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/d4dd82f7793a1045a1e91f77c73e21085b0d935a |     
  mips64el   |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/4329ebbc962b395b754ae08b843008f1e3f1024d |     
   mips64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/d534e450abb4d58dd1703762f94e9dafd4386a57 |     
   mips64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/2863c998387fac731f42c1c8e5a4532a2ec61d6f |     
   mips64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/6d7a3367ff73a96cdd1362e6d970f78debce87f7 |     
    arm      | host-google-breakpad-c85eb4... | NOK | http://autobuild.buildroot.net/results/6443a130edadfa03c1204c03ac67d88bab0f881e |     
  mips64el   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/628822bcb016914691cdc03a058b3f3230e9b494 |     
 aarch64_be  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/41bb6d603b58c0de16389f8a8ce7c2367fd3086a |     
 powerpc64   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/a7063f2319e641611ce8d69f931f9986a2fec400 |     
    i486     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/463f3f475ae839ef6c571e577cbf45b7052957b8 |     
   sparc     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/d722118dd5084a80265cac23dfdc54712f2ab88c |     
  riscv32    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/0dd61f2067b586745aaa0dfc7c7ecf44c1155fd7 |     
    or1k     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/ace05aa500b3a8925f8e103e445ab3409d78f416 |     
    or1k     |         host-rauc-1.7          | NOK | http://autobuild.buildroot.net/results/25c969bb6ddacfd8005b8a2eecf783a379cb0e95 |     
    arm      |         host-rauc-1.7          | NOK | http://autobuild.buildroot.net/results/ce9b664a17f4ca013b481fbe667e58b265f9e380 |     
  powerpc    |         host-rauc-1.7          | NOK | http://autobuild.buildroot.net/results/0effb720d29fb47ff6ccc9f1d05d1358215e6eb0 |     
   arceb     |         host-rauc-1.7          | NOK | http://autobuild.buildroot.net/results/b88ed1cc186808eb3c304eb84d6b5b0583c9d28f |     
   xtensa    |         host-rauc-1.7          | NOK | http://autobuild.buildroot.net/results/d499f46e6db9ca16d36606e62dd2c6ac87e39a84 |     
    m68k     |         host-rauc-1.7          | NOK | http://autobuild.buildroot.net/results/599969a83839283b30bc3214f6befef64a3b90fb |     
   sparc     |         host-rauc-1.7          | NOK | http://autobuild.buildroot.net/results/cd63bb52053a23e9d410ec41beb311c14ab27c14 |     
  mips64el   |         host-rauc-1.7          | NOK | http://autobuild.buildroot.net/results/813776daa670ea3ff3284ee786ef16dd30a569ab |     
  aarch64    |         host-rauc-1.7          | NOK | http://autobuild.buildroot.net/results/f1e9211dab4b3031a52d4969a6054a7a81a443d9 |     
    i686     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/c09c099d02392b02a998b68cc4e8efa96b586a65 |     
   s390x     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/369f0b98df0f4c613e4f24b3c2c53df37b0fd5b2 |     
   s390x     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/6350abe48228b14cc02f096e7adabf2c13bf10c1 |     
  sparc64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/4c76afecfb0e3cea3cd729c2e8f0fcccdd56f1c5 |     
   s390x     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/8eda7c479bf73929d8ded43603d704fe1ee706f1 |     
    mips     |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/03c4208dbac00affeddad618fd6d6969f10713c6 |     
microblazeel |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/1a9512f796874367a02eb5838657ba84927273db |     
   x86_64    |         jailhouse-0.12         | NOK | http://autobuild.buildroot.net/results/c140d76e45fe9bc7c28bacc7d10f6e0dbdc8b989 |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/d774ede3b4a4774d454fb7e13ea471013a75b93f |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/4b5921e91011645e4055ea71546e9dbdfa1ae919 |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/295312aac1e2d7ffe72952b67cf1a6721c1eb95f |     
  powerpc    |    jquery-ui-themes-1.10.4     | NOK | http://autobuild.buildroot.net/results/eb145628d71c569543774c329e1e07dc7c297b5b |     
    mips     |    libabseil-cpp-20211102.0    | NOK | http://autobuild.buildroot.net/results/f107a2715067b363ed7069b53e567bb7ed5f4922 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/f3a411f795a4c4041b0d22563904fc419bfa594a |     
   armeb     |           libev-4.33           | NOK | http://autobuild.buildroot.net/results/81665e1fc92bae08c950d15a55e0f5bdcafa1106 | ORPH
   s390x     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/6be46c7ac4e23ccc1565f9279d37c3df78b7c08d |     
   x86_64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/6ac3ffb4a531cc38d90edebf4eed94e1fc944eb9 |     
    m68k     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/0c1068e0d73034b1615fdc61e1c03bd038fde871 |     
   xtensa    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/52ec998067d4b8b51ea3b8ad3abd8799b210dff0 |     
  riscv64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/9021c8f7380d6959877a07029d614f498d2942ef |     
    i686     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/1cefd5155ff75b9619449f97940954a370a4e454 |     
   xtensa    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/458a0d5197614ae2ca38c417ede21a63b91ba2ed |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/34370f62b8c7f321a34792194baff1b338bb8161 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/7b88a3e370ed25cf63b40c01ad14a3f1637d8f8a | ORPH
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/3aa6c049f9a0143460922482af3235cbd59c7ced |     
  aarch64    |       libgpg-error-1.42        | NOK | http://autobuild.buildroot.net/results/fd06cc3309fb021ba241490e64f4f857031cebf1 | ORPH
   xtensa    |      libmicrohttpd-0.9.75      | NOK | http://autobuild.buildroot.net/results/bd3cf25648af63d52e7dbfdf19f15852514e7fa6 |     
  mips64el   |       libopenh264-2.2.0        | NOK | http://autobuild.buildroot.net/results/7a123f90c7ba3c49e463bf6bd5a082a9532d4aeb |     
 microblaze  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/4e5a952f8ed07eb8793be54a727497466ca97e89 |     
   xtensa    |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/0e8f110f21e6bd63fd296831597af739e4a2a850 |     
   sparc     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/641b5fcc9b39cbe2d2bf4539f6c1a165c7455182 |     
   sparc     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/412b97eefbf492f737bec68f05626c5056e6c555 |     
   arceb     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/4a34bfbedb7c60cb3ffa5d30ffc82888b64b8c37 |     
   arceb     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/66100472751d5e0e4f5948cd7ef7f3a9dc698538 |     
microblazeel |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/5cfe0b9949802cbb949ea0abf7b2a4085bb71b91 |     
    sh4      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/a7b4a27ea7ac5448327167a4b8ed014afda2025c |     
   arceb     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/04219f2d5b833624ce64c9ebae58c4d9e8288556 |     
   arceb     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/ad5e10fe8ce53d5f96c7744235d8227e6cce89ac |     
   sparc     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/39f1f88d8b2b7a7b1e96b7c28a2d5b5e44447af8 |     
   arceb     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/0ac3d7f0e5a7c3d493993ebbc6b9f741a973492d | ORPH
   arceb     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/c39511e0a56c79c91e93415d50d55cc01c5c3ba3 | ORPH
 microblaze  |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/00a14f5e008836e95d5d42cd2fb1139da60febc6 | ORPH
   sh4aeb    |  libtorrent-rasterbar-1.2.15   | NOK | http://autobuild.buildroot.net/results/260958302d93b1dcc08411b2ace710433e73c636 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/b800d9168a1b9ff49e550a7a157920a0af1d9a30 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/a417205ce015bda7bfc5f808912bfb7a55f05e60 |     
    mips     |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/ceef4875109805447daff6e7e421b795acfb8863 | ORPH
  mips64el   |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/6528369836fbdbbb550d4a7bc190ad87f8296510 | ORPH
 powerpc64   |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/3dd0552c829d6da36c7e8d0eaec05cb3d84d2047 | ORPH
  mips64el   |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/651e9a2bfa4cfe4553c9d9be4370260a445dc216 | ORPH
    m68k     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/c6a1f34c666a4976253072643839fd207ffad53f | ORPH
   mipsel    |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/b2cb3c1d1511fd0c3738736a1d86ae4911e84b5a | ORPH
  powerpc    |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/6cc8fd63525957237d04056fe632f7cf29f8f95a | ORPH
    m68k     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/87866ad6cc8b04ddb3f4c1f8f9323815cb938270 | ORPH
    sh4a     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/02c52c2ff2e0ca0aa9d56975d1735a13bfce0f23 | ORPH
 powerpc64   |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/c33917611f840ac972fdee859f4c86e93392eb4d | ORPH
   mipsel    |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/f9151c25f6222a2e5ee81f20ce738d89a089a8a8 | ORPH
    m68k     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/5d6449db533c10281b927037f5e48401427f6183 | ORPH
  mips64el   |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/ee93c6ca3bcbb139265c3de2b477615138829c52 | ORPH
 powerpc64   |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/7a02ce1befe24d4fe25ecadc34fb30f180738278 | ORPH
   arceb     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/56cd43ff871b383cd052ce28cd4743428a86c3f6 | ORPH
   mipsel    |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/1dded3a8fd2b8b6f43e135990fbf247d2f4cdd66 | ORPH
   s390x     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/7c6afac932fd6de92a41b02853497736ce23dd0e | ORPH
   mips64    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/c3fc450671b5f52c2acf234c74b4b070d4d2b454 | ORPH
   armeb     |        lpc32xxcdl-2.11         | NOK | http://autobuild.buildroot.net/results/0157f6b1b0b4693cc7f5867888f5c830c8bd546e | ORPH
microblazeel |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/cfcb1f15b9da94a42774faa3a635e9b5ee245f19 |     
 aarch64_be  |       luaossl-20200709-0       | NOK | http://autobuild.buildroot.net/results/d90a6daaa17723e3c161bee06e8316740f53ce13 |     
microblazeel |        mariadb-10.3.35         | NOK | http://autobuild.buildroot.net/results/cec33b9c78a6299180d3c11ca5e7a1880cbe3a06 | ORPH
    arm      |         mpg123-1.25.15         | NOK | http://autobuild.buildroot.net/results/5796e3f1518303314532993f256aff14c57f89a2 | ORPH
   x86_64    |         musepack-r475          | NOK | http://autobuild.buildroot.net/results/934b511c02cb098aee9c4051606b32648cd41cee | ORPH
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/18c33ca6ac86dec3c5fa8c36e56df1ffbead7c84 |     
    arm      |          mxs-bootlets          | NOK | http://autobuild.buildroot.net/results/f14955e2c55a9030f696761a12a7442e1d112684 |     
    arm      |     mxs-bootlets-10.12.01      | NOK | http://autobuild.buildroot.net/results/8ae8d1245865b6700a71e622932a78fd3592dae5 | ORPH
   nios2     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/54d94a4a3be14b37ebb7e35a8758f4d3d4088f98 |     
  sparc64    |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/b2d6fe60e6ff830428960d7041d732bef141ce2d |     
   mipsel    |         nodejs-16.15.0         | NOK | http://autobuild.buildroot.net/results/ca17db3012d6441091baefc3d77d5a5785da8a6e |     
    i586     |         nodejs-16.15.0         | NOK | http://autobuild.buildroot.net/results/7b55be9bc959895bc2648bf4ccc4f3edf25bdfd9 |     
microblazeel |           noip-2.1.9           | NOK | http://autobuild.buildroot.net/results/5ea9b1b976aecc401e0aff21eef3e31c8ed17181 | ORPH
 aarch64_be  |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/81888935a416b534d8674ef48e1fc443a675f495 | ORPH
 aarch64_be  |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/6eb38604e39eabdfd0953889bdeb476ee90c1f20 | ORPH
    mips     |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/178d6f0eaf0a8bde40a7784af4edb6adcb46b069 |     
  riscv32    |         opensbi-custom         | NOK | http://autobuild.buildroot.net/results/a999ae7c69ecccadbe5980791aeb2d877faf30ed |     
    m68k     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/d70a9c31a693cdb5063e03ed8106e692da1b4715 | ORPH
    i686     |           pimd-2.3.2           | NOK | http://autobuild.buildroot.net/results/b11214d5237f297bf77071e6831279e17372b7a6 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/f7e66d4b63f5dfac60b7cd04e35173cde74ab2d7 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/75d05edf3a41c48e2855325a3eaa3bf712cf2172 |     
microblazeel |           pppd-2.4.9           | NOK | http://autobuild.buildroot.net/results/01fe4f2304876fca12a0ce24005754bfa301d8bf | ORPH
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/8ab39b34cd57eacde89f8e1722a453166cdc1dbf |     
    sh4      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/705f73f7289d3d26314e111924fb06348587822d |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/50643ed21ac7dc43c60a463fd7f65c1ff60e8702 |     
    m68k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/b041581676772ec18d0a4f6f1d3a0d22973cb914 |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/6aa7ea28f036f135fe0f30f25fa9b8fef449b16d |     
    sh4      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/74667ddf52d81ec0e22bb1f62070493d613db099 |     
   arceb     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/12abf3dda2e1213cdda0d590166a52dfe49db649 |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/c36278a13744f7ebbd70703b7d3d7d8f99e7eb14 |     
  powerpc    |            rauc-1.7            | NOK | http://autobuild.buildroot.net/results/6133328d6a4eadd6b2f57bcc8ab3c6be8de53455 |     
   sparc     |            rauc-1.7            | NOK | http://autobuild.buildroot.net/results/b83e6c1ba959aaff8eaea82f9bb6e3bfebab0bb6 |     
   xtensa    |            rauc-1.7            | NOK | http://autobuild.buildroot.net/results/3a0ac5168f247a0e1a3fb97d366c47747a6aa2c6 |     
   s390x     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/002aa45e059dbb176d50f3e6db315e5d7522f9f9 |     
   sparc     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/72be31f789baeaab004ac6a9065055a3e0124057 |     
microblazeel |           refpolicy            | NOK | http://autobuild.buildroot.net/results/c186130996bf9b8c769979e164bdd9d6576256c6 |     
    arc      |           refpolicy            | NOK | http://autobuild.buildroot.net/results/c57507ffeefbf69ea8f96a19bc21aac670d41f25 |     
  mips64el   |           refpolicy            | NOK | http://autobuild.buildroot.net/results/1106b981d6bc89a25d5a9a0e8717c481b8207812 |     
  sparc64    | rtl8189es-39c17661136da48f8... | NOK | http://autobuild.buildroot.net/results/27583d9b0984f2377ef403a62817867748996e86 |     
   xtensa    | rtl8723bs-11ab92d8ccd71c80f... | NOK | http://autobuild.buildroot.net/results/8aa99ae5b36a5ca1a6a6fc2af87df681ae581d38 |     
 aarch64_be  |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/0e5e32b584b62c9f95b1130aff8cca3770c62b3e |     
   sparc     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/103d788c3a5221a5de7bc6cb3752d25686606ef6 |     
 aarch64_be  |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/144802e457bc09402a127985d55ccf076982b4ff |     
  riscv64    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/2f5984a364c4b777acbf1920cbac696c02b96296 |     
    mips     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/c5ef3a2354060a4d3cecdc8623245e03ee5b9c71 |     
powerpc64le  |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.net/results/cd3acc64becfe6edc50009bd75c8af68e58d2057 |     
   mips64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/d13b35ba5a0f68f72e6592bdd9218b625a3c6554 |     
   mips64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/1a2bb19102dd3f058d0e94140529bd8dd3f7dd67 |     
   armeb     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/156b53a5a83bf80812de3260b7d125917cd36766 | ORPH
    arm      |          tor-0.4.7.7           | NOK | http://autobuild.buildroot.net/results/3f60ea29cb7f22c2225c9855a65125986ba05e2e |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/93896a735e0606c26caefb8e4004d20e59e09a59 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/efde8059653677abf075a3c5c27fd74c266edcfb |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/3d5967f1c72aaa620ff4d5878a47ce25ccd4d643 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/04d0d585b05c4cde56125f515e292d0c07753c9f |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/9866ed63146b213850e13b7edb36924fb71a2580 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/537078801c3fa28b31d20872b8ad90340676543b |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/ddc1e7c51b9ab8c19fbcd3f343856c2398477e41 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/ad027f5eece542239e864fa288a12dd55056a108 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/638bf3124b8239918221bbfea451b7aef5a78c72 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/11ef367fc3aac41aa5eb8abfd2b7d5f57573c50b |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/11a496b9866456ff33516915642f1c643421e1f0 |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/6d2dfdb320fbb173cf88804580ab0f42839072e2 |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/87538a10c707e38931148978dce8dd487c60b981 |     
 powerpc64   |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/c428937873b9d5e2c3c89e66fe8869db7568adbc |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/d485ab870e8f0afffb9867d73037fc2800a5df9d |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/689e72e2e4e6c5d9c7d8392b73211c0d4feff65e |     
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/ad5d44964e7d9c118b6ac608cef8807ba62998bc |     
   s390x     |            xenomai             | NOK | http://autobuild.buildroot.net/results/3917c37ce30ad2122c04c016ecee73ed0465ad5f |     
   mips64    |            xenomai             | NOK | http://autobuild.buildroot.net/results/f11c10b268fcd4c805b41b2ed0222313e9c391a3 |     
microblazeel |            xenomai             | NOK | http://autobuild.buildroot.net/results/62448ba29173bb97bdf19761d1bc74fe95c7d2d4 |     
 aarch64_be  |            xenomai             | NOK | http://autobuild.buildroot.net/results/f6ecbf1a6d1b8a17e05f9d2161875f7b20cdbdff |     
    sh4a     |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/098b5fcd976980002e6bec812a870a4e8aa181a3 |     
   sh4aeb    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/53170817f69e02427f0f6a258031cc55f722189b |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/ee1a191bf82f2e6b875bffecc138d0e1c1c81eaa | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/c85826eac81528037fa108cd69f79772f17a05d5 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/93fc88890e5da500c469fb17d25472aa1d504e4f | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/d77b477e2737f65044c26a37d93ad12d70f760e3 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/95929e8dc35db2abb5a4abf903b5857cbdbc94f4 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/a01f728381138f9496e0589943a3595ddb821cea | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/eede9093246b0230f3d22a2e35561c0eb199b70d | ORPH
microblazeel |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/cbd57dcc1803d68c056da6c4871905875d56a50a |     
 microblaze  |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/fc0962715b06d05d5b366defe8d6e4642ba33ebe |     
microblazeel |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/dd944a3bd4ac0c94b2bec8ac209100daaf43903d |     
   xtensa    |        zziplib-0.13.72         | NOK | http://autobuild.buildroot.net/results/f9c7c069b2a538633db9927415d5be11ea968439 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                       frr-8.1 | 1 
google-breakpad-7515ab13768... | 1 
           libfreeimage-3.18.0 | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/c34599d8201756d12a5b948737306514d19d10bc |     
   mipsel    | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/1fde7b2d68ffeba1ffc50b78b4e92bf5da24dd51 |     
  mips64el   |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/e3119ba182a3e64904aa51ee7609b223f71320b0 |     
    arc      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/b298e22a8b860102bfc0aa426c942b200db08b0e |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

host-pahole-73383b3a39afe86... | 2 
                 linux-5.17.13 | 2 
/home/buildroot/autobuild/i... | 1 
dahdi-linux-5c840cf43838e06... | 1 
                  exempi-2.6.1 | 1 
                     file-5.41 | 1 
                     frr-8.2.2 | 1 
                   gstd-0.14.0 | 1 
                host-go-1.18.3 | 1 
host-google-breakpad-c85eb4... | 1 
              jpeg-turbo-2.1.3 | 1 
              libgcrypt-1.10.1 | 1 
             libopenssl-1.1.1o | 1 
           linux-5.10.115-cip7 | 1 
                   perl-5.34.1 | 1 
               protobuf-3.20.1 | 1 
                       unknown | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/f2a6bd3826f5d30b997d2630a77e700b79c66d32 |     
    or1k     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/00d9b5f74eee01de66664c82e6ff03a3055246ad |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/a4a9a2008a4ca78cd3cb3b3cb2dd32ed17626797 |     
    i586     |           file-5.41            | NOK | http://autobuild.buildroot.net/results/a3b5bfd78ad50c65fd385643498cb28436767630 | ORPH
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/04b4cc808d39dc75cfd7e9409c3941b7c057df39 |     
 aarch64_be  |          gstd-0.14.0           | NOK | http://autobuild.buildroot.net/results/43a2a32f3683009564e0ed06aa4ad3fd74341e38 | ORPH
powerpc64le  |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/1b99bf0e1881c78c91cdb138ed6d2a2308c63d80 |     
    mips     | host-google-breakpad-c85eb4... | NOK | http://autobuild.buildroot.net/results/530e9beaa5b18c79c6d2ede8d67f8a09be0b4623 |     
  mips64el   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/37def89c6f976a40c1199c291827569db415696e |     
   sparc     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/3c9978831c4607252630aaa57aed1427d7c7387d |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/5d98904f74005f0440ece67b4a14dc42dbd0cb39 |     
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/cbedbf574b730295cf63a64557b0651e0c3ba317 | ORPH
   arceb     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/6082a20bbc5b407d9cdd88b0757a8d8a45eb0423 |     
   mipsel    |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/8ff3f181066f24e92cacc29a711690ad6394f877 | ORPH
    m68k     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/f1944f7463e1d651c16be5a8af775bd015b6284f | ORPH
 powerpc64   |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/39c3e6c8cbca16a11f35967bf8e4483fc2786c67 | ORPH
    mips     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/39704b7c6133fdf7599459df4dcce924ea1a1eda |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/6f433b845430f71fe2dab6b62f4db28c75c8e94e |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/9e75d9c4c833e5bdd9fa851f3babcba194b80d4a |     
   nios2     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/76ac9ce9c440144d610f6c685f8c6794afd61359 |     



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

