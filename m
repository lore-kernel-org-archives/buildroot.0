Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E3BCCA47B
	for <buildroot@archiver.kernel.org>; Fri,  8 Jul 2022 05:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0C138465B;
	Fri,  8 Jul 2022 05:37:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0C138465B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s1XG_yGZC_8m; Fri,  8 Jul 2022 05:37:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3605184576;
	Fri,  8 Jul 2022 05:37:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3605184576
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 796AB1BF44C
 for <buildroot@lists.busybox.net>; Fri,  8 Jul 2022 05:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58745402E0
 for <buildroot@lists.busybox.net>; Fri,  8 Jul 2022 05:37:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58745402E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7FW01xpucCGX for <buildroot@lists.busybox.net>;
 Fri,  8 Jul 2022 05:37:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95E67402D0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 95E67402D0
 for <buildroot@buildroot.org>; Fri,  8 Jul 2022 05:37:47 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 71FCD4000E
 for <buildroot@buildroot.org>; Fri,  8 Jul 2022 05:37:44 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 08 Jul 2022 05:37:44 -0000
Message-Id: <20220708053751.58745402E0@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1657258664; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=R9o21V0HTs/0F4TWrJGy7xPnDlzmMl5tMYR0yx/tVXc=;
 b=aDuqqa4cGvlXG+JDt7JRWeOsSiZr6wKA+ICDdKIWN/0kwXU/KsLGv6ZvCjty2fpBSwE0Yw
 6xmrfgJva9FQCqF32WG02G/cfaswujVJcP1jaO3Xok66rqp2InBs1W0CvnavWooG/bCfQU
 K32NXxZIFVYRJO5bOfaSeHiqq12k/pkVNLb92IiJ6j/R2CP7ZngWmb3Dvm+5/50akGMcTg
 MCgo5sNNh1piJhsagIl56QIBmawjudpxIVfz8rGS/uxasOE62KMH636nzFkJi1b6gdYMgZ
 yV8tGZtqXfX2JkV1NbYlhXgVnRArAr/OdiquRX2CRTXV3VSxN3UPn+Qfm4Cnug==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aDuqqa4c
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-07-07
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

Autobuild statistics for 2022-07-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 19  |  6  |  1  | 26  |
  2022.05.x  | 32  | 24  |  0  | 56  |
    master   | 162 | 419 |  0  | 581 |

Classification of failures by reason for master
-----------------------------------------------

                libcurl-7.84.0 | 178
              alsa-utils-1.2.7 | 36
                       unknown | 27
             libopenssl-1.1.1p | 16
                 uclibc-1.0.41 | 15
                 zlib-ng-2.0.6 | 8 
glibc-2.35-96-g2c4fc8e5ca74... | 7 
                 linux-5.17.13 | 7 
                busybox-1.35.0 | 6 
                 dash-0.5.11.5 | 5 
  gobject-introspection-1.70.0 | 4 
         host-gcc-final-11.3.0 | 4 
                speexdsp-1.2.1 | 4 
          host-gcc-final-9.4.0 | 3 
              host-rust-1.60.0 | 3 
host-spirv-llvm-translator-... | 3 
                iptables-1.8.8 | 3 
               protobuf-3.20.1 | 3 
                    4th-3.64.0 | 2 
                  acpid-2.0.33 | 2 
                bitcoin-0.21.2 | 2 
dahdi-linux-5c840cf43838e06... | 2 
                     frr-8.2.2 | 2 
                host-go-1.18.3 | 2 
host-pahole-73383b3a39afe86... | 2 
            igh-ethercat-1.5.2 | 2 
              jpeg-turbo-2.1.3 | 2 
           libfreeimage-3.18.0 | 2 
              libgcrypt-1.10.1 | 2 
                libressl-3.5.3 | 2 
       linux-5.10.109-cip5-rt4 | 2 
            ocf-linux-20120127 | 2 
                   perl-5.34.1 | 2 
                 pixman-0.40.0 | 2 
                   speex-1.2.1 | 2 
              swupdate-2022.05 | 2 
                       xenomai | 2 
                  zabbix-5.4.9 | 2 
               apcupsd-3.14.14 | 1 
                apparmor-3.0.4 | 1 
                     apr-1.7.0 | 1 
                     aufs-util | 1 
             berkeleydb-5.3.28 | 1 
                  bitwise-0.43 | 1 
                  botan-2.19.1 | 1 
                    brltty-6.4 | 1 
                  brotli-1.0.9 | 1 
          cryptodev-linux-1.12 | 1 
              e2fsprogs-1.46.5 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /nv... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
                     gmp-6.2.1 | 1 
                       gsl-2.6 | 1 
             host-clang-11.1.0 | 1 
             host-cmake-3.22.3 | 1 
            host-coreutils-9.1 | 1 
         host-gcc-final-10.3.0 | 1 
       host-gcc-initial-10.3.0 | 1 
                ipmiutil-3.1.8 | 1 
                  jack2-1.9.20 | 1 
      libabseil-cpp-20211102.0 | 1 
               libglib2-2.70.4 | 1 
                libglvnd-1.3.2 | 1 
             libgpg-error-1.42 | 1 
                libgpiod-1.6.3 | 1 
           libsamplerate-0.1.9 | 1 
              liquid-dsp-1.4.0 | 1 
               lpc32xxcdl-2.11 | 1 
        lttng-babeltrace-1.5.7 | 1 
            lttng-tools-2.13.2 | 1 
               mariadb-10.3.35 | 1 
                    mpv-0.33.1 | 1 
                    musl-1.2.3 | 1 
              open62541-v1.2.4 | 1 
                    pppd-2.4.9 | 1 
qt5base-f31e001a9399e4e6208... | 1 
                     refpolicy | 1 
ripgrep-af6b6c543b224d348a8... | 1 
       shadowsocks-libev-3.3.5 | 1 
                     shim-15.4 | 1 
                suricata-6.0.5 | 1 
                tinifier-3.4.0 | 1 
                    zstd-1.5.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |           4th-3.64.0           | NOK | http://autobuild.buildroot.net/results/eb857a05213160e61c72ed3d4c8a7e778edda5ef |     
    arc      |           4th-3.64.0           | NOK | http://autobuild.buildroot.net/results/d77aed117d733bcfdb7a7e49d6fc4ba1b5bc4a44 |     
  mips64el   |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/fac0c515f1743139af0bfeca97474c43b70e5048 | ORPH
  mips64el   |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/deede9ab30ef969e5ecb6714f9758f27a75a44db | ORPH
    arm      |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/a6dfaf896246175a85d6486efd97ce9944acd0a0 |     
    arm      |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/b2a162d51cf22f7a13322f4d30c5ce604c629023 |     
   x86_64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/7f81f0c7fe26d7c34eb03d29353e96359badbb5c |     
    i686     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/36783e252b320a591de89777545e2ac2b90dc57d |     
   mips64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/67c99e409ca5906f56387335120e0da898c9e2c2 |     
   nios2     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/8a8179db28518b94f37112f4fab9e1c9c950cdf4 |     
 aarch64_be  |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/ce53f7646748097beb66222047d97a7115c88725 |     
   mips64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/2e116a866645b7392ae1aba8ca9f14bd24de2485 |     
 aarch64_be  |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/b560d7814c415fa99c26be4d1e5c48b7bd6e1922 |     
    i686     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/f48541a88c3f29b66be53e6f2bc57a6ff1cc62c6 |     
   xtensa    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/2a46a2cba62384f17b86aeeff7a21b9ff443d0be |     
   sparc     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/59c2395660b3d6b8f8b498414b48b4c81b36a718 |     
   s390x     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/4c95490889a58fc139aacaf8b73ef4398ad1e6ce |     
   x86_64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/76d2706967a77997cd1e7450190c61bbb2f76567 |     
    sh4      |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/730fd1620c21992bc42ecf9f0bc46646845908ee |     
   arceb     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/0f235f4b6fdcbffd3b6cdbbf240d61e5a24ac01e |     
    mips     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/7c559f6b201d0ad8727c84610e0396a4c261c2a1 |     
    arm      |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/199071dbdff61f78e1c9fc3b03d2518b76c34b44 |     
   sparc     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/99c3088cd21bfe32da57ca4452477a08d5a9e5c4 |     
microblazeel |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/6cda5b518b036f80bd1456dffbf3e323a48729ec |     
    arm      |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/72ce992c45a591f293d1a137b0da3d37b8347a36 |     
  aarch64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/b0b0c8b6e44f5b91b7cfaea1ca4633ec78baae27 |     
    m68k     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/f239f8a45bce460465a665a09e76b66ff742594c |     
   s390x     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/09a00be839c1309f7f1ae581bf9deaead64c972e |     
   mipsel    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/4f7b00e26b63da8ad833bdf7a062f25aed39382f |     
   x86_64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/d94f0572a62cc2bde74398371e61cda208c9cfcd |     
  mips64el   |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/569e0100b30e50bc471b030dfb56712ea170ab4f |     
   s390x     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/6cfc8652754a77db86b50d06ac3a641fbdf04efb |     
 aarch64_be  |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/3b99f4e9f00f35abd9c1ab713656e5335e15da00 |     
   s390x     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/23316e95252df92c67c0109cd55c04111a946a25 |     
   sparc     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/ac826118ddd133c348aaf8d0ba3adc0b03d19d6f |     
 powerpc64   |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/6340bb3240b60e14ed13a0d703ea82a44e7ce3f7 |     
  riscv32    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/2d69ddd3bcc1ec35464de9ad5e7473dbd988ca5b |     
  riscv32    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/d5329eb97e773bd5c817157b5d8e80fcf0d2637e |     
   mipsel    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/d8c5c57c453be24317c483a9057fa4ee3764d091 |     
   armeb     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/e79d3ea118930cf03834d3b552f2e58ea1f0823a |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/ba2b813d80127b572a97855522d1bbec1e039ca9 |     
    arc      |         apparmor-3.0.4         | NOK | http://autobuild.buildroot.net/results/ca2c9fc1a2f965589fbf0f832ba6d427e811a819 |     
   armeb     |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/c930403d0ad70d4e00c4888b82389b5afb3636ba |     
   sparc     |           aufs-util            | NOK | http://autobuild.buildroot.net/results/0e0f00ee88528f9d429b1980a780dc5cd1647452 |     
   sh4eb     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/79b2b9cfd2d8f62a1edfdd6ceb31af2791e7d78b | ORPH
  aarch64    |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/23056d69407d5e1f2c30c84fdb6f1195efea00c1 |     
 aarch64_be  |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/9882ea5be0388c326edb5d1f559cedfe7d955bd4 |     
    m68k     |          bitwise-0.43          | NOK | http://autobuild.buildroot.net/results/ec14b550d0140e5a8a275b4f918c31bba7383d8f |     
    arm      |          botan-2.19.1          | NOK | http://autobuild.buildroot.net/results/761c17854b3553cd138dd4a7a9d31de93009cb63 | ORPH
microblazeel |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/817f190edd7f16ca69c1b44ce4fe1fd468fcfe73 |     
    arc      |          brotli-1.0.9          | NOK | http://autobuild.buildroot.net/results/752f1489502a15f539b777e858f2a1481ef95ec7 |     
    m68k     |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/016bf0ab08fa8e4781e8baa1b90fa3e327fbe699 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/e8a82281c2c60d6fdf1e97f317aed9ae1b790584 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/2e002948d98d3a9705f6b82a595f45777f335734 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/a668dd0d8d2994e77ae757c1ceacfa32a49f7bc4 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/98a5de06234a955d54b262c5056469c3ce560295 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/f10190aa6ec5209f8b382e303fe0e190fcc7287c | ORPH
  mips64el   |      cryptodev-linux-1.12      | NOK | http://autobuild.buildroot.net/results/56a0058a600b41bf96af2bd1d2fb8f52c2b27509 | ORPH
   x86_64    | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/5faa82146914742fa14833b2e81cd01913e082de |     
    mips     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/84578b8d15f4207509d8524c2fbe5dbaf27e2a82 |     
    sh4a     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/f5304709aae77fe9548c0322467ee82e60205bf6 | ORPH
  mips64el   |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/4519a965860b1faf11cfe3bdc91408cf5f8bdb9f | ORPH
   s390x     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/081657e328385053fcb006a3cacde811ea818109 | ORPH
powerpc64le  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/fb3937372df56e93cc1594d1c3c659f6e55401c6 | ORPH
 microblaze  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/e113c408bc1308c09adc0a62bdbfec8055436b7a | ORPH
    or1k     |        e2fsprogs-1.46.5        | NOK | http://autobuild.buildroot.net/results/ca3034c3321e759962fab8a4adfb73e4f658d0b9 | ORPH
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/bd57c46466985b6cb3ce4bf1e919e68d5f911ff1 |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/56c4ba740d253a4d8616d9bd375914b90eff9e6f |     
   xtensa    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/a49ecf337558aa2edeed623cf424a5a3d71ba9b4 |     
   mipsel    | fs/cramfs/cramfs.mk:46: /nv... | NOK | http://autobuild.buildroot.net/results/d6db08f06652fe8f5737a2eb41e5b03f5aef610a |     
  sparc64    | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/7d23b601dac440aa08aa43522d2465cb5d19177e |     
  aarch64    | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/ce5a6ac41641647cb8bddc6d1787ec27226e04f4 |     
   sh4aeb    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/8ef596280d7c57b249d135e1d33af07d5fb56f17 |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/db00a8d4ca5ff7c7515f08b9da53bd59b074b51c |     
microblazeel | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/3e59ee6d662cc5ba412e19d75b78b44e3fe5cff8 |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/7c8f1a31f8cf9361c3f43cb092729ef7e732889d |     
    or1k     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/ec95a4b9df5a9c8fbda2c0a4253c24dd6e4ea454 |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/1a7ae9e8f781d34beb3d1583a91e8baf3af1e582 |     
   sh4aeb    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/736621681fca86f0539551492ff41fe6f8a21161 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/c4ac51527ae4ab1031c98930326d0e7a9ba43b47 | ORPH
  sparc64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/a555d5e6d61f3d8a7e380f627bb5aabfe8aa1929 | ORPH
   s390x     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/f7692c4b2cd94a08a8401c280563c09a95241f8a | ORPH
   x86_64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/a24990c4a5f17048ff893425f2a5ba4d861078f2 | ORPH
   s390x     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/fb7511c0b05b3aca9242851eab49913d57fb4eb2 | ORPH
  powerpc    |            gsl-2.6             | NOK | http://autobuild.buildroot.net/results/9a9eb7d91c794767e0cb5da144f6661441767d81 | ORPH
    i686     |       host-clang-11.1.0        | NOK | http://autobuild.buildroot.net/results/2ba04470b35cad64db25936c12b8c8cef20d262b |     
  mips64el   |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/1100ef78ca66e6d5663263e70d1487e3747a4e5c |     
  sparc64    |       host-coreutils-9.1       | NOK | http://autobuild.buildroot.net/results/b2f53f992ac713c2c278b14b1742c34c6c9272cd | ORPH
    i686     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/3e9f8311187995f4c5426b83618846c9ed50556b |     
    i686     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/8274362078ca59669921f785c1e420a3c1129e4e |     
  powerpc    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/d00a7dd526ff1b3fcc4ef8db06434ddb9d17df45 |     
   x86_64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/1457dd9a6906e10ace51944d5591105f7553645e |     
  powerpc    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/a4c245e890dd35d0a5bc9cdb74b67b06654bf6a7 |     
   x86_64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/678a745f9ab60985283deeac43db4a473d2b6212 |     
   x86_64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/5eabba942e7f4c472308e478638303fdc0afda1b |     
   x86_64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/dccdaa5ba128ba154acc98ceade732db84fcc283 |     
   mips64    |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/e6c3bcd4b71dde9badf410cef22ec7722d13166f |     
   mips64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/ebaa01e8ee9b01c2b59ebaac0c8d1232c53142cb |     
    i586     |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/64d324e754324c532bbaee5248fd133e2e5e2f05 |     
    arm      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/fc65dbe5fca8cbfb7b5ce42065ab02dcebd5898c |     
   xtensa    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/35eff807a4671e69a8f92430d0eb6ce5e9d3a2b0 |     
  sparc64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/bb37739b4799f17826be5b69160143d610083a78 |     
    i686     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/8eaaa4a7d178052f7ead5afe6685f3e8277b99e7 |     
    arm      |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/26ab7f6bafb4e90a910fb8b4d561bcae6987abf8 |     
    i586     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/19427263ac4e00ed91780be7974207c17c329075 | ORPH
  aarch64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/a6aa90e699657400fd9a35bf5b3291461e6e15b6 | ORPH
   armeb     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/d8ef978f1d92a19212e0cf48b57e424e7598755a | ORPH
 aarch64_be  |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/8801e223e98c66b7896e1569b0d31331b9924bc7 |     
    arc      |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/38ed9e1be3e30bd293d8d7cd391928ebd3587271 |     
    i686     |         ipmiutil-3.1.8         | NOK | http://autobuild.buildroot.net/results/09fac5560fa9e07ead0a668b3445d27349732c85 |     
    arm      |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/0cf6e7aa29f5bd81e870e7a8def1530e7a53edf3 | ORPH
    arm      |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/d97b5e6628d348548b0bf43901d836b1279f6fd2 | ORPH
    arm      |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/b10d8e6b77f66ba21c0f63648d75ae41e527b7c6 | ORPH
    m68k     |          jack2-1.9.20          | NOK | http://autobuild.buildroot.net/results/ca14c0d7699dd28c5995b6d8126d053edc3d3ed7 |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/e5be3724234f1a9cd529cf0b2f73b2dd277f9b0b |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/7ecbb7d20de2d1154a060a92bf21911fcaa9a86c |     
   mips64    |    libabseil-cpp-20211102.0    | NOK | http://autobuild.buildroot.net/results/f3c8c880dadcf6f73de0e39f2751dca40a7c110f |     
    mips     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/8a3e6c976169ee2ada2eb27dbb5c2ff2e5ae0663 |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/8f7e3b29498bcbb85d458954eaf870b36ca3a87c |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/962253361c3de137c85eb4011145413634fb2653 |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/ba6972c98e4deb564813d3f7abf00b8107bce937 |     
   sparc     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/e343c4773645ff765c448a513069ae1bea5e9ead |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/d997ea57f3672a0d8290c4ce9a906ca6a8bccd90 |     
   armeb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/3e0250168fc7ed205a8e441287338c9b4243275c |     
   mipsel    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/511d4aec3bf88b87e26c092ab948ee4f3ac13f0a |     
powerpc64le  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/408bf3cc06ab55b6e570ccdf79446783790bd139 |     
    or1k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/f2a61da2cf06be7280eb5e9076e4164b68f4e3a0 |     
  riscv32    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/51780244688f69721626b6f66f8dec0faadbea6b |     
   xtensa    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/037197150d09cbbc403b3e07a890a33a999e4473 |     
   nios2     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/dbab460bdb50712b0bd86f627193f1b2577f38f3 |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/a4a78f7f56e2117e5bc04017f5467601b0b90592 |     
   s390x     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/8b4e791bb02db5be24fe267fb33b8227ab014d0f |     
  powerpc    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/18b2b1ebd2374934eca6da785a7435e784f523f9 |     
  riscv32    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/afb7b4ce83a2b60d010a6d63deb22768b2315670 |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/8b9f2ad941b91246da3340b4706a4b1e70c9a182 |     
    or1k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/71bd8814ce217cef9f8ce9379a2fcb7666acbb62 |     
   s390x     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/38fc6ebc7e866eef5ab60293b49332f073083c3a |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/8b2dac4578bb632c216900a4fd38675fa145af83 |     
   mipsel    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/6b178a0db70fb26342dfdce04d3381f8d6098d02 |     
   xtensa    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/5a24286d5bb3aa107a3fe613aaf59fd9c7fca7e1 |     
    or1k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/69ca49329091432ede010bce0f75e01324f37029 |     
    mips     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/20d98d9c1e420ebefb1ddc1067a981063e8292be |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/2c055f8597f46395b66a7ff7db1ca7c19195ab71 |     
   arceb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/1fe23420ce30521cf3943f19a22c7746717b15d7 |     
   mipsel    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/f3d39c4dd2b30330e3949e0c7d36e8b0f6e795ac |     
    sh4      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/a8c1b27ab163966ea9cd10a229f08dee9f96bf0d |     
  powerpc    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/b58ddf6d67bd1a8658ef370bea9be1a27cd0929d |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/fc33bb93741ff470667b94cbb952ced90c2d3b2b |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/c9937b18b3e2d4844f47f7940ebe2058cd79f6e5 |     
  powerpc    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/87bcadc8f8e1f670176e3ee5022d19e434947fbc |     
    sh4      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/2fd7129f4095eff9e3f7a6c46110446a2fbb87e8 |     
    sh4a     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/aafc657018a76dc448474825939ed39b04046c84 |     
  powerpc    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/93e90ad15ca39125f19b9494436c73780ec88e0d |     
  powerpc    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/c881c779b1c8c7aa1c55543c8743f47889d5edcb |     
    mips     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/2ba6bcdbc6e09e4c2d72081a16f8f00d56623858 |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/f6551bb6b3bc4cfb4d6d877df5c9941398f59fd9 |     
    sh4a     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/2bf458a4ff9e5cd8af3d29a8fd937e068eb91948 |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/61ded78fc5764fb3aa82dad18abe9af6cc4585a7 |     
   armeb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/3f899df775c34b739399182ef89da016f478124c |     
   nios2     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/f2c5520ccf874db92135c7075925da6a9f4a8fc9 |     
   arceb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/2be58aaa4cd519fa63b6d6cd0a77042e30edcd77 |     
   nios2     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/f85d56c8f78578cff0eb358f5b980ff67b8ff0b0 |     
   mips64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/69c3bf5f9ac25a748c3c1203958151adb013fda0 |     
    or1k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/da389f86a5779a56f53e86f9565ecee98391134c |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/810c8e4c76be95401842312c120a646ab64ddcf3 |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/6a7c01e8688a98602d15bf1a94549646081f50ad |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/416af9b3c91853993c921ea620e0e7906dfd6617 |     
   arceb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/ed4b4244bc4f6a62d5c7be4511983deca9167fbb |     
   s390x     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/10512a82f3db5dc15ca8c2af559d0044e57ebf20 |     
   armeb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/143cbe68dba3ba6ffacffc5d76faac94c135d67e |     
   mipsel    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/d21e0e0111552d2fd6f01cd677cdd6bb3f6d5b69 |     
   arceb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/971550949fc90e89cafc061c58eddd2216d3621e |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/1dfd0e3b6037b45a8dfe2683cde7d522830a5a05 |     
   s390x     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/82dbc63df72da32cb518c0696a07c4be34276b15 |     
    mips     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/614f01ea12bac26fd67fa4a7435676424eed2984 |     
    m68k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/b6397f0c2d8c7b9bca714db1fb7610c66185eb13 |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/604da808383865926b36f5c2f0b869412e086236 |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/76340fa0b8ace0b3d13bf9ead81a1fedd21a14a3 |     
    mips     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/38367b1aa699596156bf12e61c11bfc826cf2400 |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/0c38bed8e3d80fc166c5cc0d470eddee09ee032a |     
  powerpc    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/009438e3b6f61f11b2f5ff802da305656c1e741e |     
    m68k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/1d6bf1338e87b5d43020dc6951713150ae24eda8 |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/22214b82bda25a57e92e7dd161e6304bc3f4807b |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/6791b9ba184635699aec2e992329378acb7966bf |     
   mipsel    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/7d33165070e0ecab35641c4e7db4aa6a70c35add |     
    or1k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/8828741413261ae48ff3d51e7d8cb87d20dc93cb |     
   mipsel    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/e053235927212b0aed37cb9dbf4e8dfa0970a51b |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/1c1e861669b3370fa41a6878f57b3c6f7fa14952 |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/a8dd14e8d40b77890aebac8344aa3a033cd83385 |     
  powerpc    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/6815ae350d0777bc7dda72a20761e945242cc77f |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/6daa89ad17a5d50f7d81c0e48e0da2be9aa5f9d3 |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/7a3dcee4cf2b06b2537882368b9e6dc2162e35cb |     
   s390x     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/8cb92553b1808e22757edd6f606598a8d4fc53ec |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/dfe5bc1fdf695a773897385bcc4cbf8c53f32967 |     
   mipsel    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/96d3a9f7790f3de8370593641cfa5b3a05cd6450 |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/b510d15ae3411092fbbd64d67525c4484f36ea6e |     
    or1k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/755d9218a6fde0c71f722fac90fcd61a2866ceda |     
   sparc     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/ead02f5f4cd64e86188820d8c742964e572f1804 |     
   nios2     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/ec51ea8926a304e199aeaa81dc5492eb763253b0 |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/e650c88fe29d61ff093eb028d92d8c588d70b535 |     
    sh4      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/d6e8d2a1e6fc79af85d6226b3769701d401d0130 |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/bdbdc8cbe6fcc7b5878f77c6419e5ba59b926168 |     
    sh4      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/5140ee983ccd2b5882cd14fc3d45c122ee483803 |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/601ff462ace38c164f005cb395c0b371fd6fb527 |     
   nios2     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/5563c9923d65a118a68203ee13dd0611329354d1 |     
   nios2     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/1a9aa7fc0f00fe4c04d4ac0cb4f0ac2de56749fc |     
    or1k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/722c623c7abc58d8af2d8bbc1d4b0e172227810e |     
    mips     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/0dfc3b00ccbe3026a717df3b194fbf31aed018ad |     
   s390x     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/1a7b3686f3435a8f43fee4a70f721f62ae118450 |     
   s390x     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/294151994d3725c4f14cb35ca4a68230a7de1375 |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/693a7f11e7ec4bbc670e1bb914dd7b01facb9a43 |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/4cd17ba730d0c144a61c10ae29ef60e0261e447e |     
powerpc64le  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/90e350ebb3528ac597a966a9c949e2dc4be4928a |     
  powerpc    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/7b904dabedbfddf6305996d4ca8f7a0863abb407 |     
  powerpc    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/eeedffc53a962c6807a10147b885f4653dfc2ffd |     
    mips     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/dcbdb604cfdc10a020f103fac3619490b1cd54c4 |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/8789f3ef5cc77e5df24d25f80bb62363ca0d2fbe |     
   armeb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/c3f74970eca8cbd13df470bb1667862a50f848bb |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/56cffbabfed092d16e132662e2d4bd67ee86e73f |     
   sparc     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/cae859490537dcbb8d1360f8c15adab15fad0b83 |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/051a4de76e07554cc7fbf10f4ccf829e8a8a7d40 |     
   nios2     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/127c302aa90ca429c4ba1afaecc3774d5da27369 |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/9e656f05b610f852b200c584dc7ef01631dcac58 |     
   nios2     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/9251a1880244c8d9b1b028c1fcfcd4bbf28de871 |     
   xtensa    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/8ffef2c9524aa31da6040ef8c2a508c970c8259d |     
   armeb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/b368891bdfeecc51e5fd6b53beee89f9c5949ab4 |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/c2adca23d5edf403e00c6fe8210d8748d0983aa3 |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/d0963f23925c674697a00850947bbf8905db1aba |     
   sparc     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/939eef4b77e674795f3de745c0981d05338daed2 |     
   xtensa    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/8a130815af824787143d6c2b59dfd818f3baea22 |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/05a21207fc96e3ebdcfa88d0eb416eac10591147 |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/5d695b435f0f997a78ec796362207cbcd52de8fd |     
   sparc     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/cea70c052bf779d97f16cf1dc7c4d8c04a2c54c1 |     
  powerpc    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/0a6b72f9d58e201904009044e08adf4da271f493 |     
  powerpc    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/27116c9d2c9cc0da920097ab784e098e8182f3fe |     
   xtensa    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/792b009296e4a1b0412e263e12be2bb034fc4dd4 |     
  powerpc    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/399b1456dbb59aa158fab543c25fee170957f8cf |     
   xtensa    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/c92b4a1845111223de946a78daabf514609b022e |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/32a91f7cbff8589b9c1e9b58f84dbe644c695755 |     
    m68k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/943307a7c0f9553e95e66a904276ab1464d658fe |     
 microblaze  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/2f4fda7e736b143a423257e9925627e0076cfe67 |     
   sparc     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/d4a35ee55c6f884500775285d3ce2c1f8db3e535 |     
   mipsel    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/98d0b93c212f2bbd5e08c68b04a3f7b1c9d781e8 |     
 microblaze  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/927a4197398f5a8e77cea3484977b005b6661aa9 |     
    mips     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/18fb37dcb8017dc3c37285f08ded3c433b2eaab5 |     
   sparc     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/5bd02e69a485cec08bbcb4dc248fc9aea10d5eee |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/41df5f5ee71ead7730348edb7d83dc3898ebec85 |     
  powerpc    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/2459c5addef42265ee795bc3889d7fc829245c60 |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/831a014a1bb8a81b64336bc97a1efd83ba486a25 |     
   xtensa    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/14e892e9f21ff27c391ba93053681aeb6e2aecf9 |     
   s390x     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/abe30488e0ba1b143219b7f751f655dd65c290e7 |     
   xtensa    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/5e301c0dce3d23b167a21615d27a79af7afb3c7b |     
   sparc     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/2368c03d0c3adde4793934be5e37caca6f50df8b |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/9a13d1784cf84320187272325c3631883ea18f34 |     
   mips64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/e865f201ce6aacadd4eaa8236ece134139ac0e8a |     
   mipsel    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/c6d895d6c07fd213a5213f74abce7b76e69088f9 |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/314444407778cdbf359eee2565cdf33ca0bd3c07 |     
    sh4      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/7e404e1630a70de2724613ac43e624582860eae7 |     
   xtensa    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/488dae54514ea22ba1d2df0f38823396dfab98d3 |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/674a1581219b5338b7d31e7881ece0712e130143 |     
   nios2     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/601dfa3a30a1f16cfc9fc6339d65888987e0ffd8 |     
  powerpc    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/286e7fe73527c0fe30a2d9b07288d1cd01ee3b34 |     
   sh4aeb    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/e5595172fd84b8a94c30c78878e5f07001a21234 |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/0fc04bece67272f0b7f032f81810d19a0de740a4 |     
   mips64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/4114abe43297692f024af8176c88367cab456249 |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/1254850159a632dcd77fae05451410ff66578db2 |     
 microblaze  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/599aeb8d4b6cd70ea320db9e9ead8864617bfef7 |     
   xtensa    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/9138ffd5d61941a20ea19127f2a2d987d087727c |     
   mips64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/ba5507fd633ec7a817794d7e1d3b6d5f2345986b |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/9e192b6de42960453499fd32a0100405dfb75450 |     
   mips64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/d817f3eb06ee54b19ce23463488d45e6f1813a26 |     
   mipsel    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/e93d8b5f92bde4a53e321eb754b37687388f5e20 |     
   mips64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/20b4bbb757734dc7d38093ab08c50c4b6c38bd42 |     
   mips64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/b1f1e11567166ac5033b2213e692213accc60929 |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/c5d737ef71958627059461d91e837bf2c924593d |     
powerpc64le  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/bcda4bda2feb16a40976c0ae0fe9254678b4febc |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/88460c655b2d05f4b40f2c9e849aa91bc34d0031 |     
    sh4a     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/0af09ff2c54569d356bbb6db09cdfe726ab4089b |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/f9ecdbb8750aa39954016afb17474e3268e73fa7 |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/c5fa26fff367ccc91add764e64ae2373ed6be5f9 |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/3e605a3d44ff479086ec8c6bbcb8bf4062ff258c |     
   nios2     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/ad86b8acec426f2f9ba3f0710c16e8c4bbaff1d1 |     
   mips64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/bdfad36a141aea015bd13b2db71bbfadf720646c |     
    or1k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/8de908d0e7bef219c5aa8764be5e86756b9275af |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/b864a6dd56211539e83e9865f0056759fc664d5d |     
    m68k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/6f0e147e643091c9275c6aeffaae8d597c4afe82 |     
   s390x     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/4805e5b9375a417c9ea755e6261adfb49ec90787 |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/1f96dc7ffba03f78ab3d51fc33507a7c3469753f |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/df4b8b902adf775130f62ca5dacea1a34d05b92d |     
 microblaze  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/d51508ed8c353f724c3f50ab949f2a3e27ddf76f |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/d30c2589c4f38ef0f44109b3bcb4430ac465323b |     
  riscv32    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/ef586f190e95dea6f53df54faabc1cd1317e72dd |     
   mips64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/2e5339785571fbc7b71d8d72484d2e5b5debad76 |     
  riscv32    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/e5a6b5e1e17ac206c09389afaac9cd880f8412b6 |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/bcc5e77a59bf18c0472e606bc6f395818495c532 |     
powerpc64le  |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/c2a4b774523c57670737b49d5512ccc38836f565 |     
  mips64el   |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/0f1f49459cba08d6a5b5ba6d4c4d49bf5cb00012 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/8f3df63176e484966ade5e39030b4b5d0ec773b3 | ORPH
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/99804b7fc5b7ed6c0d0716a89a8cf61089ed41fc | ORPH
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/f477560a65ec799e869f40738ab0b284c8dee5a6 |     
    i686     |         libglvnd-1.3.2         | NOK | http://autobuild.buildroot.net/results/2293f75867c09207290e130fbb251795f64077ba | ORPH
  aarch64    |       libgpg-error-1.42        | NOK | http://autobuild.buildroot.net/results/40e18146736c3a3744f8da3be70575a7c6941152 | ORPH
   arceb     |         libgpiod-1.6.3         | NOK | http://autobuild.buildroot.net/results/7eba4bdbb858b235b0437a6dcb005de3c0b77709 |     
   sparc     |       libopenssl-1.1.1p        | NOK | http://autobuild.buildroot.net/results/a42c72c75ed962b6677f726af84ccc740646f42f |     
    arm      |       libopenssl-1.1.1p        | NOK | http://autobuild.buildroot.net/results/89183fe4a8d14e1fa64bb340113f2e4424938c2c |     
   arceb     |       libopenssl-1.1.1p        | NOK | http://autobuild.buildroot.net/results/44005766887528c2a763535dd1badfdc8ae51dd6 |     
   arceb     |       libopenssl-1.1.1p        | NOK | http://autobuild.buildroot.net/results/79e38b207642ad1829817dba80c345d313e425f2 |     
  aarch64    |       libopenssl-1.1.1p        | NOK | http://autobuild.buildroot.net/results/6aef6d116e54879b574459a8f2192c031d2a6ceb |     
    arc      |       libopenssl-1.1.1p        | NOK | http://autobuild.buildroot.net/results/66bea858ac3d20854a884b09737b1c22fce0d34d |     
   sparc     |       libopenssl-1.1.1p        | NOK | http://autobuild.buildroot.net/results/679215dc882c5c23efe75906a4fed0e9a3ff190d |     
   xtensa    |       libopenssl-1.1.1p        | NOK | http://autobuild.buildroot.net/results/3fab1b2618052019a29967f6e28d5f1a98993495 |     
    arc      |       libopenssl-1.1.1p        | NOK | http://autobuild.buildroot.net/results/e817b5edf3f792a9ac849207cb208db662e5f1c1 |     
    arc      |       libopenssl-1.1.1p        | NOK | http://autobuild.buildroot.net/results/8340ddaadf8b8dbea1fa5d894294fe16ded4a439 |     
   sparc     |       libopenssl-1.1.1p        | NOK | http://autobuild.buildroot.net/results/5ffe824abd5064d1e3ebbf8ec22488cdaf1081b5 |     
  powerpc    |       libopenssl-1.1.1p        | NOK | http://autobuild.buildroot.net/results/6aff38cf974298c753c1cd43e3e447e879413c2a |     
   arceb     |       libopenssl-1.1.1p        | NOK | http://autobuild.buildroot.net/results/5e2eb1d19593dc538e6990caa67fe5f9f2e263a2 |     
   arceb     |       libopenssl-1.1.1p        | NOK | http://autobuild.buildroot.net/results/b3c787dd1246cbdaf0956036eb7fa510b35cd7bf |     
   sparc     |       libopenssl-1.1.1p        | NOK | http://autobuild.buildroot.net/results/b43a2bb1f915c0547ddf62b0ea53cfde3b4aca2e |     
    or1k     |       libopenssl-1.1.1p        | NOK | http://autobuild.buildroot.net/results/2d98e7f9d9ebbf91d6734f990c0c45ec6de2be3b |     
   mips64    |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/67b18e5e6bc4802058adc79bb09396d6785526df | ORPH
   arceb     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/65c76ae5239b86421a9544c6ccb3e238df9cad4c | ORPH
   sparc     |      libsamplerate-0.1.9       | NOK | http://autobuild.buildroot.net/results/d5f5586b00dd4b4a62dd18e84a07c2c27fb82a97 | ORPH
   mipsel    |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/0d7bade9854878aa453ae06d53f5531664acfa19 | ORPH
  powerpc    |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/ef6b04e36eebb076d74789ad7f270326a7803991 | ORPH
 powerpc64   |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/a26a831c3e95d9073cdfd20759154110a35068d0 | ORPH
    arm      |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/4bb47ddc712d5298df5260e69c84f5559729b030 | ORPH
    arc      |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/a97cb56a7dee793489a2751b507cc30b7d3e8a08 | ORPH
   nios2     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/ed0e896e8d8ea6dfa1ae0188509c260d49623022 | ORPH
   arceb     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/e2eaa0d009c0df1c337064b52d14fb1967a2c159 | ORPH
   xtensa    |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/64ae168958ba50ae316272fd24388ccbe88911cf | ORPH
  mips64el   |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/0becf8affbfc32e20530c1cc64518a96cb017164 | ORPH
   sh4aeb    |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/b3cc9cc317d2e879da50c50cd7b237db267cb0f1 |     
   armeb     |        lpc32xxcdl-2.11         | NOK | http://autobuild.buildroot.net/results/b9388597c5cebf96b9e17218f88b0cfcaa805eb1 | ORPH
    m68k     |     lttng-babeltrace-1.5.7     | NOK | http://autobuild.buildroot.net/results/76730c7a147efe83762bb43ad91539089a4062f1 |     
    i686     |       lttng-tools-2.13.2       | NOK | http://autobuild.buildroot.net/results/c205ec4a1859569b6d1324349e7c8fbe29fc12aa |     
   x86_64    |        mariadb-10.3.35         | NOK | http://autobuild.buildroot.net/results/55b7d50eeaa0d96a903139a75323170f858f27b1 | ORPH
    i586     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/74b4d44ae3a08846da9a090a921cc1b3c57875b5 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/f60c75fd34d14a5c9dfae2178b0cf30ec3024594 |     
microblazeel |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/18636a19d2d238ace4cf2b5102e243f35457dd49 | ORPH
  sparc64    |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/1b70573dffe0db2812c4c952cc065f96ac0c3dfa | ORPH
   nios2     |        open62541-v1.2.4        | NOK | http://autobuild.buildroot.net/results/f147bd88838c7f69ce8351e5a2d201d019b9fd67 | ORPH
    arc      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/e5b045681635f64a6dc6b0c4297bf729120630c4 |     
    arc      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/074186b4f4ca693b1a154db33e87c7868ff1c98a |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/fda886768fce25ccd9b52b635ff5b13da7ba2d0c |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/4ae3f1f4e38ebcd33be693a40d1580f4325fd73b |     
  aarch64    |           pppd-2.4.9           | NOK | http://autobuild.buildroot.net/results/e9e26bb5c9070450e06f1ffe05001a800cbcfd0e | ORPH
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/014b3aea441e02f943693bc9d0a77b71b791006a |     
 microblaze  |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/7e00b71448f406c138ae46599ed755dba0a263fa |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/1eb07ca9defee5fdc0cfc8c65797047c47fefbe2 |     
    or1k     | qt5base-f31e001a9399e4e6208... | NOK | http://autobuild.buildroot.net/results/5c00c87bedd9e6d5ac5fcb0f165cf1b83e79aa89 |     
   nios2     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/0c0a812a31265ced8e607ac1617c057ce620007c |     
   mipsel    | ripgrep-af6b6c543b224d348a8... | NOK | http://autobuild.buildroot.net/results/6f2c7683f3681ba10aaed4adbeb8fbd3ce15a397 |     
    or1k     |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/4a1987ac06cb97155a2d1649ac1ca6d0b3c62564 |     
    arm      |           shim-15.4            | NOK | http://autobuild.buildroot.net/results/29ef2b7954b348be778849d8eea27fc21181fa41 |     
    mips     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/6d1f9565edeb15fb9eda3e0b5e4bc3e3c957942a | ORPH
   sparc     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/f68642c783870d67e5a0f15c6ead40053f844f35 | ORPH
  aarch64    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/1cbed74b132853d49338c0c0309c937c69ff6a02 | ORPH
    mips     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/6af5e71e836e80aa8a3427c4236a5091260afada | ORPH
  riscv32    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/b73680bbcd945c771a1c85583b789824618dd1d5 | ORPH
    i586     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/e30b166d7e096b02d45b8b8da29a2d0e60e705a6 | ORPH
   armeb     |         suricata-6.0.5         | NOK | http://autobuild.buildroot.net/results/1c074cf32195dc4fd60d42309bfbb3468e6a9cf3 |     
    i686     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/2ed7ad877b7e3b140653e65bfc69ab3a7b310f36 |     
   sparc     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/a924b6b2796768f539403df3725b0010dcac5325 |     
  aarch64    |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.net/results/1182a50a8588513d41b9a6858602ef1894767230 |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/4488c19b64a036930c58d10feb48dabe194d1b9d |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/d498b95b21f0d214f547ca031c76fd0ea2b97a85 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/a4120cd391e18c5f605ef9736786f8e15a5b3d79 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/3610ee27df516e09b7289751e5ca83458f51925c |     
   armeb     |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/1eb7fa3f7a4d83ae0b6f55ec24add33a6286a101 |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/907511d9e554331bf08f8cbfc6ac6bd083402206 |     
   arceb     |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/044d61cc7c4e5efbb0788f7686dd270c5cf70965 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/cc900652f3d5907375e42d1f9f6522ec06a176d6 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/c966f1e25b8c9caff39885819cd696ebb451726d |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/621b386eccb7cbb96ab0a8915d9c8a4dcd8aeaa5 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/6fc2eff508e0b35fc12e56cca90fc0156a549da5 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/f4129af3f07c37e510417529cd2b922e3205521b |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/174dabe7ab6434989946b4f469aaa24ce65492de |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/d107002852963391d24de231592bb8efc46fa7e6 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/bbf2fff560eeead8bed40b723c817b31c1b1fb5d |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/cddb8f6a3a16f83caf8fd285e939c151502e6150 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/fc4b8a1084ce98c600a5e6a283cba643dd167e2c |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/94ee8e913a08990dd885d5ee6d02a3795e33bb2c |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/98a77ff60578e77a9aea5b4a6a200adad414aed6 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/2d7190c1902a14b521018e2d723cb201771478af |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/933a03c305c96e5b4cd8d8d510cbce26319bdb42 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/1d47713e85aca6eb044500ad63fb4e57521f13fc |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/fe1b4532051a075b4c64395bcc582c1b859a34e6 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/26fd1e8a5340246e14ef1068fa34f6f43985b6d8 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/9d90b4dc8c5e240b65eb94e03204bc594a5bd12d |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/b53321c870750407c6c1bca6da3c0c5b65944e76 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/daaf114d8c8d699334deda06383f8bd7ce983169 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/53ccb7eb5204627f2eaffa9485663b1c296df33c |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/357bca4144abe07a57f6fd0c8672908c06753203 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/688d07846a30b360c26e2b45f7e94464923fdaf4 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/f1126d1b151d4ad524c0a11e99e9f333e1e4ec97 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/6d2d860290b41fdd7cbe7274397f7ef15f718bc0 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/8673758f3ea20928f90f9d5e567f2f5b4eeabb3a |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/0d5222a2d3f7be012c1f1ccebd0c00a9c5c698ba |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/9acbe67c1bbe74b47dc2e2355a500ea766aada91 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/a5bf6d5b52204bc318e009e52ae68c85f3f833b2 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/c84019dd715b0a801fbc176a40c81b1f12a83b69 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/23cc9530a4ffdf45029fbb7a9f26828bda3fef34 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/1ce01c57c734d173cb0727a69eb4de98f3e34d97 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/1d876c5cfddd39cb986fdd00a8685e55a080dc70 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/2a1ffc95489ddb01ecbbe896705430ad2297ec39 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/f8975a433f5b6c0e92de480aec166783aa39a649 |     
   x86_64    |            xenomai             | NOK | http://autobuild.buildroot.net/results/065d800e7ccb0eafe4b434813b81a8c5526aa40b |     
 aarch64_be  |            xenomai             | NOK | http://autobuild.buildroot.net/results/6c841656dd33aa2d49a129e81aaf622178d0d55c |     
    i686     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/704970d721d139b096e906bfa3d751bdb4186a3a |     
    i686     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/438f6b64de8b9980e769ada5d24aa34470406e48 |     
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/9c3b21074385c41e7cd2b0c9e203947c8137080d | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/0118451af3d776f773a891451a8c7de02cb705d7 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/05c5c546ef1e5040b522f678db200f9aee5abdc3 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/a1bb8913a81942dad188a72372bca108ab2135e8 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/c567c2eb2017aeffea8815f23a6fa3e1e798e7b2 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/5126eef434591575e0ae37afbcbb17895c70308e | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/c2ea88763358ccfd4b34cee7cf7d7708e57c7ce0 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/4910cbbd18c8460da678d88b69da86460aa988b5 | ORPH
microblazeel |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/f85f3c29a9a48b5d8cc0d6b173b72a66bef63139 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

           libfreeimage-3.18.0 | 2 
                    bat-0.19.0 | 1 
                       mongodb | 1 
                 uclibc-1.0.41 | 1 
                 wavemon-0.9.4 | 1 
               zziplib-0.13.72 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/77707e269232ef509285509516d242de6590d6ea |     
    i586     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/7ce4a43136a5ee30f33bf46823c3e34e6df181e5 |     
  mips64el   |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/1edd4c5fc77e2173a3d9a40fbee7a410486567b6 |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/25dcb9e8c4489f94b5b9314ab5260c2f1879ee2c |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/004297782e6d44422d90c4bc2ce2d769ceb11633 |     
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/341813bbd5a6125b22c7a172a8f212ed39fa8ed1 |     
    arm      |        zziplib-0.13.72         | NOK | http://autobuild.buildroot.net/results/900e4a0761aea51d553690e920a5322e9e07a353 |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

                 linux-5.17.13 | 2 
                nodejs-16.15.0 | 2 
                 uclibc-1.0.41 | 2 
               apcupsd-3.14.14 | 1 
                     aufs-util | 1 
                 dash-0.5.11.5 | 1 
              host-rust-1.60.0 | 1 
                   json-c-0.15 | 1 
           libfreeimage-3.18.0 | 1 
                libmdbx-0.11.7 | 1 
                libressl-3.5.2 | 1 
                   perl-5.34.1 | 1 
               protobuf-3.20.1 | 1 
           python-orjson-3.6.7 | 1 
                     refpolicy | 1 
                    ruby-3.1.2 | 1 
              skalibs-2.10.0.3 | 1 
              swupdate-2022.05 | 1 
                   uacme-1.7.1 | 1 
                       unknown | 1 
                 zlib-ng-2.0.6 | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/935a6b399fb7796761d3ac6895b3f4263fc2fdda |     
microblazeel |           aufs-util            | NOK | http://autobuild.buildroot.net/results/ddc9dc02178fc2251cd9f8ef7010ce7dec4cd261 |     
    sh4a     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/cb102e112bf9cbef2475e02b1219e185af5cbc7b | ORPH
  sparc64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/d5f112a9fd26c1b5070758e9a8d2d871f34b0e2f |     
    or1k     |          json-c-0.15           | NOK | http://autobuild.buildroot.net/results/daa09417a0e82de685aec0333f57d012e88df051 |     
   x86_64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/b32dcc1f222aaad4647b30d8a21761e191da7914 |     
microblazeel |         libmdbx-0.11.7         | NOK | http://autobuild.buildroot.net/results/63f4f58dfa879ce014f83364edf5dee5375d506c |     
   x86_64    |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/8a4e7720422dcc180d95791a8e534288e8667648 | ORPH
   s390x     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/726cf48777393108a90dc8ee99f1af337c7a99d4 | ORPH
powerpc64le  |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/59a51f1568c04ad7bf1f70ffb223656f334d07c9 | ORPH
  aarch64    |         nodejs-16.15.0         | NOK | http://autobuild.buildroot.net/results/d92f5ab6c6fc62fc98fee4f913f5bafcaf303b5d |     
   x86_64    |         nodejs-16.15.0         | NOK | http://autobuild.buildroot.net/results/8b9a092602fa86532c9b45c2b7c3341154305fe1 |     
 microblaze  |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/5de73c14ab64e089319d7382581ef5006b5a6a4a |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/940b55391524128e08bcdec092a4837aefd7473c |     
   x86_64    |      python-orjson-3.6.7       | NOK | http://autobuild.buildroot.net/results/d16beeea8ef87a282f7af8904ea8acb348b39d2f |     
   x86_64    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/a0f51adfd63783225de6c63b55204bd12fd63948 |     
  riscv64    |           ruby-3.1.2           | NOK | http://autobuild.buildroot.net/results/f0bae776fedd3823430ebd4740cb9c61d548d899 |     
    or1k     |        skalibs-2.10.0.3        | NOK | http://autobuild.buildroot.net/results/1ec4791f2a968da50ee9bf09fd71eec1447ab1ae |     
    i686     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/bea05d4f732df25c41a4c6cff6f824a33f646a96 |     
 powerpc64   |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/d176b3d076b1e1d405c482facd56c95989f69ba2 |     
    arc      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/b07fec8982ae97194ee95012e2a285d8dd0d8b96 |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/1d4d4baa75fcee43745dd1ba89cf829b998ab6ae |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/9663d6a78920059a421f8801ec9fe0cbffc64ff7 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/04dd52397326d05786b5baa6108ec856587c2b5a | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
