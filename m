Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31607C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 06:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BEA14015E;
	Sat, 10 Dec 2022 06:57:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BEA14015E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id giIxrsSYBSKa; Sat, 10 Dec 2022 06:57:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0808240176;
	Sat, 10 Dec 2022 06:57:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0808240176
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 207111BF5A5
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 06:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4DB24185F
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 06:57:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4DB24185F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cWhigie4L0zh for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 06:57:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61CF741499
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 61CF741499
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 06:57:33 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5292F10000C
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 06:57:30 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 06:57:30 -0000
Message-Id: <20221210065736.E4DB24185F@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1670655450; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GWcFLuN1BMCIwwiY+51TpAiwabmSHK4gBcZ7bjPf2Cg=;
 b=iVAmaaag/F1tL2xdjJ2Iu/oljOw2SjJ7RQh7NAJfOmvewC6XbtkCOU8looCWDqq2U4qFTi
 LGV4EOx484+YRBXdqV9HlJqsbvtWXEAL8mRW2G4OizVngKLFNjc7t+gnhdzDMxNYKk9Otu
 je9JwjaWHGNsEA7IreVyymDgp1qVjrX+r1TM/EFFd3RaIl6fD9WLONhg0Z3MaGyoiPIGhZ
 qhNT5HrPmYYRpN13cMi1ARz97BrsLKPpfIpYvmO5SfUNhWgcSqJ0uxC9pZe6eXo2wN3nLA
 2IF2ljYAIT2vpJ2R9ub4+/pGIt/VdieXTI4VxrY3xhtId4hOIGvU6RCp2X/54A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iVAmaaag
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-12-09
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

Autobuild statistics for 2022-12-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 18  |  5  |  0  | 23  |
  2022.08.x  | 24  | 13  |  0  | 37  |
    master   | 229 | 277 |  0  | 506 |

Classification of failures by reason for master
-----------------------------------------------

                   aubio-0.4.9 | 26
                  sscep-0.10.0 | 15
                  jack2-1.9.21 | 13
                      xz-5.2.7 | 11
                   linux-6.0.9 | 10
            host-binutils-2.38 | 9 
              host-pahole-1.24 | 8 
              host-rust-1.65.0 | 8 
                       unknown | 7 
                host-go-1.19.3 | 6 
                    norm-1.5.8 | 6 
                gerbera-1.10.0 | 5 
    host-python-greenlet-2.0.0 | 5 
               libglib2-2.72.3 | 5 
                    bat-0.19.0 | 4 
glibc-2.36-66-ga1dc0be03c9d... | 4 
  gobject-introspection-1.72.0 | 4 
            host-binutils-2.39 | 4 
                libdnet-1.16.1 | 4 
             libgpg-error-1.45 | 4 
             lirc-tools-0.10.2 | 4 
            python-bunch-1.0.1 | 4 
                elfutils-0.186 | 3 
            quickjs-2021-03-27 | 3 
                    dust-0.8.1 | 2 
                     efivar-38 | 2 
                 fdk-aac-2.0.2 | 2 
                  ffmpeg-4.4.3 | 2 
             fontconfig-2.13.1 | 2 
       freeradius-client-1.1.7 | 2 
gummiboot-2bcd919c681c952eb... | 2 
            host-binutils-2.37 | 2 
    host-python-maturin-0.14.1 | 2 
                libglvnd-1.4.0 | 2 
                   perl-5.34.1 | 2 
                    php-8.1.12 | 2 
pistache-3ec9d7c4f8b828fdd3... | 2 
           python-bcrypt-4.0.1 | 2 
           python-numpy-1.23.4 | 2 
                    sdl-1.2.15 | 2 
                tealdeer-1.6.1 | 2 
                 wolfssl-5.5.3 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
                alsa-lib-1.2.8 | 1 
                  boost-1.80.0 | 1 
                busybox-1.35.0 | 1 
                 coreutils-9.1 | 1 
                cryptopp-8.6.0 | 1 
              cryptsetup-2.6.0 | 1 
             dahdi-linux-3.2.0 | 1 
                 dhcp-4.4.3-P1 | 1 
              dieharder-3.31.1 | 1 
                 dmalloc-5.6.5 | 1 
           docker-cli-20.10.19 | 1 
         docker-compose-2.11.2 | 1 
                  exempi-2.6.1 | 1 
               fftw-quad-3.3.8 | 1 
                     frr-8.3.1 | 1 
fs/cramfs/cramfs.mk:46: /tm... | 1 
fs/romfs/romfs.mk:32: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                      gdb-11.2 | 1 
                      gdb-12.1 | 1 
                     gmp-6.2.1 | 1 
google-breakpad-c85eb4a59b6... | 1 
              gr-osmosdr-0.2.3 | 1 
             host-cmake-3.22.3 | 1 
         host-gcc-final-11.3.0 | 1 
     host-moby-buildkit-0.10.0 | 1 
         host-sentry-cli-2.8.0 | 1 
          libatomic_ops-7.6.14 | 1 
                  libbpf-1.0.1 | 1 
              libgcrypt-1.10.1 | 1 
                libkcapi-1.4.0 | 1 
               libmdbx-0.11.13 | 1 
          linux-5.10.145-cip17 | 1 
      linux-5.10.145-cip17-rt7 | 1 
              liquid-dsp-1.4.0 | 1 
            live555-2021.05.03 | 1 
        ltp-testsuite-20220930 | 1 
                    make-4.2.1 | 1 
make: *** [package/pkg-gene... | 1 
               mariadb-10.3.36 | 1 
                  matio-1.5.23 | 1 
                  mongoose-7.8 | 1 
                    musl-1.2.3 | 1 
         mxs-bootlets-10.12.01 | 1 
                  ntp-4.2.8p15 | 1 
                 openssh-9.1p1 | 1 
         python-greenlet-2.0.0 | 1 
           python-pyicu-2.10.2 | 1 
      qt5webkit-5.212.0-alpha4 | 1 
                  ramsmp-3.5.0 | 1 
                 sudo-1.9.11p2 | 1 
              traceroute-2.1.0 | 1 
           uboot-tools-2021.07 | 1 
             uccp420wlan-6.9.1 | 1 
ulog-0389d243352255f6182326... | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
               valgrind-3.19.0 | 1 
                    volk-2.5.2 | 1 
                 wolftpm-2.6.0 | 1 
               xapp_xdm-1.1.13 | 1 
                xenomai-3.0.10 | 1 
                  xxhash-0.8.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4a     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/bb7ea858b200565588c1173a13cfdc6945ca57b5 |     
microblazeel | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/3c83c0d50875e8a308f6243930e14fc929beeec1 |     
   mips64    |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/3fb5c0056b62d90c0306f0be9dbb61131b519081 |     
   nios2     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/191d05395f93042260a117f3d4efd5ff4eca0d15 |     
    arc      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/0612058d52ab499953c6620908c2129afb398f68 |     
   x86_64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/73008ac4990088f1ca5b482ed6663c0d35eff911 |     
powerpc64le  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/94bdbfa442fa7e39cd1083992667d6ad4fdebbe4 |     
microblazeel |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/d31ff58fb7a2588fa8f35f749953f67e59ed599c |     
 powerpc64   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/2b7a9999e04b94071d0406a64bfb7ac11abf81c4 |     
  aarch64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/a0073448f155409fb42e27c39ee55056bc345a5a |     
   sh4aeb    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/6698239afc1d60f78d5732a6364468e0ee230286 |     
  aarch64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/ac9622d57ea6330f1cdd8d696bb4d0e620c9b660 |     
    arm      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/396c37ced4eb010b5c84821add7f1aaf8273f4af |     
   armeb     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/9945dd2a23d85611af1c5dcdadeab83eae7cef91 |     
    i686     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/e7d6d31234d119abd20e5ba2197268048ff1dfc0 |     
   armeb     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/b7c5db8b7c817ee687b21407103df98af5b938c8 |     
  mips64el   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/b64d9f2eb53d127009530f64e87ea94e99e2bae7 |     
powerpc64le  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/c75f59eb7ea02e17eaaa0c29ea214040122517d1 |     
   x86_64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/94bf9a690d07d2e77bf4c8b4a1d31121f0646ee6 |     
   sh4aeb    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/c10eb641eedb07aba5d805692983e4043d03c485 |     
 microblaze  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/7e27df838990a662e892660ba5149713d6fcdad6 |     
microblazeel |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/fb6512aaad2ce5f630bb4f37ae010300376e0e94 |     
  aarch64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/1f2b329900f1244f35d8cb772ebd10f79be76c61 |     
  mips64el   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/6d59a0c5c64daab595f76fba35bc5ba1b68b4bad |     
   mipsel    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/28e0b235d8366e6540e3326eabb3a7fcb770098f |     
powerpc64le  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/c07b4c4d6a587e4c2e4f2cfe8fa6995b062f134a |     
    mips     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/de7018ea512ce78d8c152092aed94b9109f5e799 |     
    i686     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/dd4fe18b319c62c32ec5525ddb82e5221cc813aa |     
    arm      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/10fcfba17aa060065ce35faf05910e382c27cb97 |     
  powerpc    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/eaff2458989c91b578449ff62ffa6e2a25f9fd36 |     
    mips     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/2fef32a8b3efd8fee6d5d233363acfcc975fef7b |     
powerpc64le  |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/a6ff714e75f2f07ba1462855cd649f5a3b42d3fc |     
 powerpc64   |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/f5e0c0afb34e0ad6c4437253f0a79acf23c12d54 |     
  mips64el   |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/30da441af175f66994ea3504db08aa193cca72a2 |     
 powerpc64   |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/6812e5837c68d6744b5d6cc521a2f36c456955f2 | ORPH
    sh4a     |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/f654af96b15e3526aab298de473afe402a6b0021 | ORPH
    or1k     |         cryptopp-8.6.0         | NOK | http://autobuild.buildroot.net/results/c4dac28ead0932659b9a6c922ee08e95aeca88b4 |     
    or1k     |        cryptsetup-2.6.0        | NOK | http://autobuild.buildroot.net/results/3c7b137684206c9bba9f9e3f2e2f58d4de8c734e |     
    i686     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/812ba0620af71570be3a839b67af50d070f8e141 |     
   xtensa    |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.net/results/221f0f2e99d5e43eabcff625901a7230d5113d04 | ORPH
microblazeel |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/12d2bcd75bc9b53efe5e634649b42d704473a346 |     
  powerpc    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/aab6580b7edd860099c2e413925d2bf89b679ee6 | ORPH
   x86_64    |      docker-cli-20.10.19       | NOK | http://autobuild.buildroot.net/results/d53d624ad940ed8ead3facff87443727232603a5 |     
    arm      |     docker-compose-2.11.2      | NOK | http://autobuild.buildroot.net/results/27a5dfbf5287ff138422a8975e0c925f311303c2 |     
   x86_64    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/83ff1cfd24ef45bb4b3b14e2ed4ca01849f83eee | ORPH
   s390x     |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/edf2d62e0a1492020c7820267805c29110fd6203 | ORPH
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/c37ed6f5c454acf95ede2a45304d466f5f310aae |     
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/c3749b08e8e5a94f4899e33160e44270e0c4d434 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/9995b36c2ad5157c2ebcd8fd52c4a65022e9f873 | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/ef18bff9cea41c679e3402210829a8a1b749c3cd | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/ca06fde2e2f7e861e5be8b1d30f078817005f655 | ORPH
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/2ce02cb1ffdf5dc5894b8aa63e668ea3347fe247 |     
    mips     |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/28e887889786fd5b26e68e6b1218132428f81abd |     
   armeb     |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/d6c99314fb32c8c4d9b6093bbbf88007fe7d3035 |     
   armeb     |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/510bd816aefee1e88f7469ce3af25b46e922fe62 |     
  aarch64    |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/0e35fd2b63edca9797aefdb444c7e7faa84edecb |     
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/7523fe5682bb1979f55a179e82d077366b4ab1e2 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/1d4dda86ce0131e452ce470784b67c054fdba26c | ORPH
  sparc64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/0307c0db75c9f2a6e61d7c864baa137b7112c0d7 | ORPH
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/979804eeadea9924930183c90bdaeee0905d1803 |     
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/83ebd99308f6cdce2fd6ced68bb7e12c90a1e2ce |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/103c700f261dc04ec496f238b2585f553983b237 |     
   s390x     | fs/cramfs/cramfs.mk:46: /tm... | NOK | http://autobuild.buildroot.net/results/afbd3f2ae2ccb2da7b53bd776e05c13ed5344f76 |     
    mips     | fs/romfs/romfs.mk:32: /home... | NOK | http://autobuild.buildroot.net/results/8868b727810ea019846d98c4dba5e0f13e9e9a96 |     
   x86_64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/87c8d7a31a4a6b6cb999a8d85417412ccf34e609 |     
 microblaze  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/2376708e77f0766da7786d69db3299fbe6989c3f |     
  aarch64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/1c68272759c2782cd65f798a3cdedd2df6c5eda8 |     
microblazeel | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/00da3ff40e41c8f288d661e8739c1298d7323ce9 |     
    i686     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/02ab54aa716cedb5b9825e9605cd1ad94321ba4d |     
  sparc64    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/13c978051cd1562b387018c4d6b40f73171d7c3f |     
   sparc     |            gdb-11.2            | NOK | http://autobuild.buildroot.net/results/b0715abbf10d60013e6cf4c08a07e65597ddfa2c | ORPH
    or1k     |            gdb-12.1            | NOK | http://autobuild.buildroot.net/results/136107ba5e6bcaf327e9cdf6d9e7a352e48a1abe | ORPH
   mipsel    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/d5e647511ac692183f91c0f130190ad82a0ca3f7 |     
microblazeel |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/2d92d547be81be4b443eed28c6ff55b6aba5e5be |     
    arm      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/1c8a1745210c26f484264a0c1b1f6801b732c4c5 |     
    m68k     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/0e6b7a5be21df8ae64074c4d1d39a304a39a3ba4 |     
  sparc64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/e2c17501c107c7feb772822b87f708d3c7a7ddb4 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/cf07d1fadd2f248f39aa70bc50bfa0f6b9e23177 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/3dbb0855f9e77be028e9dd8e381c39773377f91c |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/16275b8a9c9436626b0ef2f04732b791acf7ed24 |     
   arceb     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/8d2a2516179055bda69fc223178026c0eebf7eb6 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/c606201963c4771ef7ee37735de0f9fb7bb68cff | ORPH
microblazeel |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/acb0beac4f3ff235c2c117ac2afa5423088d4b9d | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/f9d260e01eb4ba68f0c4aacf1a053fe70e727553 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/a00e1ad23dc92b08352feb8f4d5b7215fac3f663 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/c51b05ba990b00638b8173875cd1c69cb60d58cc | ORPH
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/eb9e34aa787606757ad9f65c473a827b110254cf |     
  sparc64    |        gr-osmosdr-0.2.3        | NOK | http://autobuild.buildroot.net/results/3c40f8222c6651f4ca17c1637b3dc501876a196e |     
    i686     | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/a51a6b48a52f0c620261786a20a0d935108fa074 |     
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/01017fa3467b68b58219dbafd9b21531936565cb |     
   s390x     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/bd6c4470f3cb7380b86a0d4a495b37cf3560914d |     
   mips64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/9b2e4ccbd561bd4d9c9a4b666e690d1515f3756d |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/10bae5895eeb64583ca6d8cad6ee735f05495d20 |     
  riscv32    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/fd00d0e3707ebce10b2cb4622966aa4d2f4ee839 |     
  riscv64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/3f5c1550a970a3dfe207db25a45e9c91d1c78c2b |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f87aeed0f58fb641e2043076cf58ea6577f45139 |     
  riscv64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/c266aa75a1a9c94bc1a919bd8e2e61e8920cd22c |     
  aarch64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/9c31c74371c98fe7bb71b2bf386026e9adf209e7 |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/57f70629d4e0fa4f8305b9793390548c54d4e50a |     
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a89a83d76070d5600926c7a7cf14049754f87c5f |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/569f9f13ec4e1d466fa23ab00089eef804c16b76 |     
   armeb     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/304a2df1159c3aa060a0acc984ae60928ae7a035 |     
   nios2     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/be40412920b2b20072ed44627d556908cd186b92 |     
microblazeel |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/a05c0355992c076931598ba571026fb220776907 |     
  powerpc    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/c33b67d75739a1c5d359df58ae1a869cf9c25e9f |     
   mips64    |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/4fbeef0b36edaa2f17f53a666cbf3b3dd0ef2a3a |     
    arm      |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/b16ea6fe07f488fc848ba8941bd1f997acea68c6 |     
powerpc64le  |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/2a3518eaae1398737762cc08f07a922ed3245fe3 |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/79f70c37d462e2650bf82bcf54ad8f8709c726e8 |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/3f59e9960cae6b2011d6749846cfeb03e32628a7 |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/ded56ee1b91023847a924bf79e588cf904c2b7a2 |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/cf712c8df3c7cf82236fb962eb6f03028b8a6064 |     
powerpc64le  |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/34178c367574cdb7c16111a89b1a3c74c580b6e9 |     
   mips64    |   host-moby-buildkit-0.10.0    | NOK | http://autobuild.buildroot.net/results/3c7a4be5284dd16f9318c21eb0656bb96846b281 |     
 powerpc64   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/a41758989ac95690eb7c6ca839891a40da7baea1 |     
   mipsel    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/6a85f8a78390b18b52633eb96a6c20be6dfc9278 |     
 microblaze  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/3c1dd743cffbad77799726b3fe391bfe70229b0d |     
    m68k     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/bd6dfd390275512a17a64fd72a2e734749339b7b |     
    or1k     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/04be4b5764644dd2208f054ed9159066cf54270f |     
  sparc64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/eccebf46c407207a54513e3bce3e1164fda0210a |     
  aarch64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/f832c6a1a89604423098e01a6584f4b6033a2508 |     
   sh4aeb    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/39afec1fe232df148db1d8358796424f3465c447 |     
  powerpc    |   host-python-greenlet-2.0.0   | NOK | http://autobuild.buildroot.net/results/0183c2e43eda61952558910b6e0bebbfc94ebd54 |     
 powerpc64   |   host-python-greenlet-2.0.0   | NOK | http://autobuild.buildroot.net/results/5a97fd29f5b2d2b48eaf643a11cda0d377ed3d8c |     
  riscv32    |   host-python-greenlet-2.0.0   | NOK | http://autobuild.buildroot.net/results/24ef2e7a572433a086ba5781a47fc9971085da2d |     
    or1k     |   host-python-greenlet-2.0.0   | NOK | http://autobuild.buildroot.net/results/39491e89afeafb18fcfb966e22b2e8574002a1e3 |     
  mips64el   |   host-python-greenlet-2.0.0   | NOK | http://autobuild.buildroot.net/results/1a73d7748b0e2d5d4ffafc21a08a1b1c44aa9c4e |     
   s390x     |   host-python-maturin-0.14.1   | NOK | http://autobuild.buildroot.net/results/5f72636a76630f7c9538de9d9081a18ffda4bdda |     
  aarch64    |   host-python-maturin-0.14.1   | NOK | http://autobuild.buildroot.net/results/38303a6ce030fd2a399799aa5beb3379a851ab90 |     
   x86_64    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/f5f30fd1065ff4fce1c8c35bd1ecd287a4f90d4d |     
   s390x     |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/9daf8b2208d5f7be860280441b5b676feba8c4d0 |     
   mips64    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/97467cca661f7076dd81563edcf7a7ba98de828e |     
  sparc64    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/7f39795207b7afac577e01f509ab3e05392a17d0 |     
   x86_64    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/2bdd813f51b3b3138646b0657c06d737187e1678 |     
 powerpc64   |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/38e4af14593d9315f1f243d5ef14c6c0f374177a |     
  sparc64    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/176df1ed6025ae1ab493e23863454cbb7437202c |     
   s390x     |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/bd43709208b11f6b8958db1c821929b7da1ece14 |     
   x86_64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/7373355259b215c92f22353202f33cf645431e11 |     
    sh4      |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/eaea7cca0129aebdebb6452242c26c12860d6c4c |     
    sh4      |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/dfcb7685dbf4ec6d0d4fb2b76a6a084ed8e2bde3 |     
  powerpc    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/7afd8755b23554b02bc6b97e55a5621e498d4617 |     
powerpc64le  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/50f4f6cb3b30661a4e6e0997290dea6cefae1f49 |     
  aarch64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/d62315126acb95ca4d8962f36fd4384c70edbd5e |     
 microblaze  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/e83d47f3d8448a6c3f31faae0b43d5c95f5fef43 |     
  aarch64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/34f298f6ed73221f43a94bb761027941b2e05832 |     
   nios2     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/93fc41502ba8ea3d2f872468f3089250919ca2de |     
   x86_64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/d8bc74f83b8f3631560a33e58386b53adda18188 |     
    mips     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/40bf3ee98f6ed7ba6425b9d4cfe92695fe705d7a |     
   mipsel    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/154100b3520432035521740baaae2bba2e6b273d |     
 aarch64_be  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/a451ec325f468a699d3399020d8eda2c5870e7f7 |     
 aarch64_be  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/9188c202ad9fce9b523071d8c39024809d6ef467 |     
  sparc64    |      libatomic_ops-7.6.14      | NOK | http://autobuild.buildroot.net/results/fde02234d54bfd16b12f11846525c2148b3d20be | ORPH
  mips64el   |          libbpf-1.0.1          | NOK | http://autobuild.buildroot.net/results/d6be478b8afee424d74408eca6b123fee457f917 |     
  riscv64    |         libdnet-1.16.1         | NOK | http://autobuild.buildroot.net/results/4326e9a540bb7f067afde2003db4fbd79b085251 | ORPH
   nios2     |         libdnet-1.16.1         | NOK | http://autobuild.buildroot.net/results/bab080ce8dafc197f1f04fd28e9a713a6f08b16f | ORPH
   sh4eb     |         libdnet-1.16.1         | NOK | http://autobuild.buildroot.net/results/bdeb03644d06d82c708803bbf5166aa7504944da | ORPH
 aarch64_be  |         libdnet-1.16.1         | NOK | http://autobuild.buildroot.net/results/a8f4f2056a4a6d08d20a72e9f1e1c48cb99b5130 | ORPH
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/6bc7d8c235cbdb29030794f68fb19b3ee8078314 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/c72dea9bd874074bf8c9fccd408673c4c0fd539f |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/c52c49883d479fdc35ae4369d468063eb72400b2 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/be7d126cd5e033c7e7e96b5d06233509b837c90c |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/781405453d1afd4f4548513622006b2926103e86 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/b14bc04c15312d399933af7c5f4b60a944a391aa |     
    m68k     |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/2b01907361115c24f816f603bedfa78b03a0d8d1 | ORPH
    m68k     |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/4fa20662af44cebf1bfcb6465a4b20848bbade8a | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/3bbfd193c620f03bace62ec301e7c79ec359c601 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/ee710a1a34f89254b9c282eebba47384f2bcc9b6 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/2fd041c95479ecf73fe7ff4ea9f3c8c722e20dbe | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/b840325bb9c4a20993a4f51eefd41e1cead06592 | ORPH
 microblaze  |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/eee5b121710da2647d3c63a2934fb3792e58a72e |     
    sh4a     |        libmdbx-0.11.13         | NOK | http://autobuild.buildroot.net/results/7162d0ff192e4e716fda9f7cb03a3a1cb1d730a5 |     
   mipsel    |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/800fa03b9fab304b23a437456f919824c1e1be7c | ORPH
microblazeel |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/670b11a5a110eaf4abc8c27c2d7e5c8580b089dd | ORPH
    sh4a     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/b196d381658197e6b0669dcb38a89a2f1c919ee4 | ORPH
    mips     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/9c7a2ff39cd136c5411da50187ae27ac0a32b33f | ORPH
    m68k     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/9ecf7fc9aae5677008913d2f4923a71496b86463 | ORPH
   mips64    |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/908e18e8820591b5ea8942985811167e61329f26 | ORPH
   mipsel    |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/900611a5547909787d6912e9e06c4b6ce56abd90 | ORPH
  aarch64    |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/8eae972b1c69e0e10f10631c26fb9c27465ceacd | ORPH
   sh4aeb    |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/b341c032228e7b7377335c1627d7de570c6954d2 | ORPH
   mips64    |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/37268d45c13e31864d1f8f0f589b2caa87ac1285 | ORPH
   x86_64    |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/e8bbb58a4bb6a06230b24638d6c24fb575f4941c | ORPH
    arm      |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/14d776472ba0762e3967d916a1b4c640b91c1832 | ORPH
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/b637256e34b8a7a6f62ccd5645e0f0d9d8ca8254 |     
    i686     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/a1f9b7ac0e4b72f09970572a803c209405a81cc0 | ORPH
microblazeel |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/083ec892e62ccbdee615e48baca1255590c214aa | ORPH
  aarch64    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/6f4843ac664db2012f65f04976c98c7814d82e27 | ORPH
   nios2     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/d92147786a09d32cec131018bfb7d6a589c40e08 | ORPH
powerpc64le  |       live555-2021.05.03       | NOK | http://autobuild.buildroot.net/results/100851877d99aa2a66e33ccd4dac37c54623ce04 | ORPH
  powerpc    |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/b7b50fc0b0316cc70c6f910482ef8666e006ffa6 |     
 microblaze  |           make-4.2.1           | NOK | http://autobuild.buildroot.net/results/03a537081911d31b5ca30f838f8fa343f4ca29f6 | ORPH
    mips     | make: *** [package/pkg-gene... | NOK | http://autobuild.buildroot.net/results/000bf17678589273517f223eadcdb8127faee923 |     
   mipsel    |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/5afbd4f2c0822179ddb0c18b41fe2829e10e3094 | ORPH
   nios2     |          matio-1.5.23          | NOK | http://autobuild.buildroot.net/results/864c23096df11a689de1ad588cfb31f819842586 |     
    arm      |          mongoose-7.8          | NOK | http://autobuild.buildroot.net/results/27f5210e94f05ee34fcfde1f78b3138d34da7927 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/5e97165975957671dd93358fe8798a51aed05727 |     
    arm      |     mxs-bootlets-10.12.01      | NOK | http://autobuild.buildroot.net/results/51b6f58a9f4a32499799c84122a33fce70337c4f | ORPH
    mips     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/987d20b60571e1d56d94b6d8aef619179b8f8605 | ORPH
  mips64el   |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/907d8126bce1a446ed2a859b6dabbbc6fd189250 | ORPH
   nios2     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/ad763529f2778c52e8467c237e6fd29dd0cf4a9b | ORPH
   xtensa    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/1177d0743548c73b5c16f4fa4cc315d160fd93f6 | ORPH
 aarch64_be  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/98ef10ce3c9120fb07d95954d2d6f39962cf502e | ORPH
    arm      |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/70f3ab23b3f963fd3d8f2f2540f91c0fc990eafd | ORPH
   sh4aeb    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/646b5c0202b6a81716937aba415611915ba965db | ORPH
  sparc64    |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/e44583a160e823bf8ca3fb4bfa21f66479ad9b19 | ORPH
   arceb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/5eb459e4fea422be6bbe263e7d313050e1fe05cb |     
    arc      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/97a7244590a0374fd5bf36fab969b2a6591efa98 |     
    arm      |           php-8.1.12           | NOK | http://autobuild.buildroot.net/results/d0d6854ebe6e7f504907a798f48ebb59ec6b4812 |     
    arm      |           php-8.1.12           | NOK | http://autobuild.buildroot.net/results/4d0e6ad88a1d1b0bfc202103ca7a407f391cde3a |     
    or1k     | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/0e3e9b5cc80b5baa17693f7d4b09562b9ed7f8ea | ORPH
    or1k     | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/e7c3c9c94c5853634d596f21afcb20445f8f9425 | ORPH
   mipsel    |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/59a8ca7a8bee731c56892f3eb2858fbe62c1aeb8 |     
powerpc64le  |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/6ed4b3896e1230fb5b5b1ccca9b93109d42640fe |     
   sparc     |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/aa95d08b2808c34fbe3e86c08ec3db44ab8a9764 |     
   armeb     |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/4bc78650d19e5a1e1c259371e1ea011e5451bac5 |     
 powerpc64   |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/c58e7d04a789a99784c8a548de0bca31a2168edc |     
    sh4a     |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/19d3aa4879cfcec191122d33708501b3d8d6e8c1 |     
    arm      |     python-greenlet-2.0.0      | NOK | http://autobuild.buildroot.net/results/575dbe498e1dc9739fb4f8c518594fe4c5349e7f |     
   sh4aeb    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/56aee8998003834f40146a6d13e7128f82356ccd |     
   mipsel    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/307d11428cff3bff499fd0da02fafa1fe4759fa5 |     
    or1k     |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/361b9031c53dd1ece71f03ba1824faa04b1cae63 |     
   mipsel    |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/aab8fc3e22ee8421df9a2f793c6a1f5866c5e5ee |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/ddcb395307f3d59bc2f2908adb97709158459360 |     
    or1k     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/62d759d049b02a8ebd329fb057029846a7198af9 |     
   mips64    |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/b4218018ffee63558c0c466811d82c6114c0fb52 |     
   sh4aeb    |          ramsmp-3.5.0          | NOK | http://autobuild.buildroot.net/results/9ed69daa51a466254b26981c89ad9d19efc571a7 |     
   sh4aeb    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/54bfb61d728c253953df5b6f4610cf7cc71e9c58 | ORPH
   sh4aeb    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/b9aa5798e6dd3fea88aee2364dab040fed76ebcb | ORPH
   sparc     |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/14ad0207ab3b2387c2590486abd5c64806e10ead |     
  mips64el   |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/f3ee0602f8bab1d446a122b210d868f479004c7a |     
   nios2     |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/77745b498a8c38b36ddb10791e117ec0ce6c056e |     
 powerpc64   |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/b6c96aa5000fbcadf0ebee80fda7d4643ae53070 |     
 powerpc64   |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/a343c28f48f154227e445127b6c37085dafb9aff |     
   xtensa    |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/9f9d58c60e226fefa44391ac93d51fc446a75c4e |     
   nios2     |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/fc36cd35e936b04af749d7a8c1ce36e36c163d60 |     
  aarch64    |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/2effc126aeb4298496f2dd0ce58e178dcdf02de8 |     
   arceb     |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/dc0442e6e7ccdae5f1acdb723df39a0ef09f9256 |     
microblazeel |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/76aca3989f8bc8247a7083d562cdf2ed4e88bb7e |     
powerpc64le  |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/5ef5b61ac7246ad64fe4331cffce29dbf95f56ff |     
   s390x     |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/dd943567d598b925f21124e20864da4e698e4265 |     
   arceb     |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/0688279022f14b1d35b6db23ca24092b0bd3a356 |     
   armeb     |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/cbb72f0afdba1f6e7af38afe2c07caae5de93344 |     
 powerpc64   |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/886697bd67dddcb24ad49a091ec0df2c75f93a5f |     
   xtensa    |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/27a710da546bfc4a9b171ef702d9705b6cd46d20 | ORPH
   mipsel    |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/65cd66edc56abfc61461ae79ce4cc138823eb571 |     
powerpc64le  |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/24b75f5cf3cbc40da24f4c65e3fe45482e374072 |     
   sh4eb     |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/21395cbc60151f930d03c6408f53ea5c234ad2bf |     
   mips64    |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/fdaf5ada053530b9d67e6135578de88d2304e286 |     
   x86_64    |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/5d62e8ca90ef8775f3a7539dfbf15e7257a8a2c0 | ORPH
    mips     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/6fd4646596b451d68d56c6aa69426856a6109964 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/151acd2a05195f8e76851fcccafdb17493ddee37 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/0b9c5625b3c4ec4c214bf737e05487134e9025ad |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/6d9e76839d782ed0dedc4173c10f0b47294a7621 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/320d27415f083023136863931f8b9765d3dcd059 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/f313d4d0a5c86462b39be14c048e26f465f966e3 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/dad822d8fa3d3d0d826f27d8feb7ff387b559f98 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/49675ad8b94626a16a58970c51bad97fc486a53e |     
  mips64el   | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/2cb9d80e2a763f9e6662d2cb9f26a61e2c5c8145 | ORPH
   mips64    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/d63b24827cc7e06d0d0904b180240c159d2566a1 | ORPH
  powerpc    |           volk-2.5.2           | NOK | http://autobuild.buildroot.net/results/0ec62ce6b2f7f7b5e025c3b81f7ef7f765d9e97a |     
    arm      |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/c8299fc239cc893450253fc3edf34342d66fc824 |     
   mips64    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/7832b238ebd5ce8de9281cda6e6a85500426442b |     
  sparc64    |         wolftpm-2.6.0          | NOK | http://autobuild.buildroot.net/results/774b5a754b0dd0c03e9fd335be6f4b8dc3cfdba7 |     
    i686     |        xapp_xdm-1.1.13         | NOK | http://autobuild.buildroot.net/results/8dbaba0440b471f818a49649893e81127f549af4 |     
   s390x     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/467b4aa4327269c7501e880934e4bf0a4dd8607b |     
    arm      |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/d28bc960a8a2968c57abbc53cf921491d1d1959f | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/c5e6138dea4909a4ef8cf0c91f30c7e03db7f2ce | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/4b24c47dd2e86b2be649803ef36d25935fc3a7d6 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/09b91b743840758c3a2328bdb7a54f15e975d03f | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/29dac216d987d5bf24813f6ce5cf4d910fc3a20f | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/fe63e400ede1380bb1fa82b48b24004c2bf20c7e | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/224e4f5d92624838586c90909da8ae9ceb475484 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/17cbb746b69c087a605b93b562a741031276dab5 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/56af28b9c29778af1da969addf32e2721c175cee | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/e710cf39234f83bf855848b7d7e88415b0118045 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/5e8e67ed61b0c4a9939a73c786a10268ae7f5620 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/2e46872b1bf4ef5c03f1e2a638374e776f3ee81b | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

            igd2-for-linux-2.1 | 2 
                       unknown | 2 
host-gdb-arc-2020.09-releas... | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/68140134e4a5e4653bd2cb886e086aa355ac3027 | ORPH
 aarch64_be  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/a5da1d087a5a6c42660204b5a9c75a8552e2b711 |     
    arm      |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/a5dfc600b2610e1b03f331c6dd0119fac0b0b324 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/60ec401c3f4013e56b50c2e7c7b93f7ed0f550de |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/81227b3f26d6f8f4534bef4475ba0f39e38d3eeb |     


Classification of failures by reason for 2022.08.x
--------------------------------------------------

                gerbera-1.10.0 | 2 
                host-go-1.18.8 | 2 
            igd2-for-linux-2.1 | 2 
/home/buildroot/autobuild/i... | 1 
            host-omniorb-4.3.0 | 1 
               libdeflate-1.12 | 1 
         mxs-bootlets-10.12.01 | 1 
                   poco-1.11.2 | 1 
                 uclibc-1.0.42 | 1 
                       unknown | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/c7ca2599e979f72f680a27e00fff4ab907c9ddc9 |     
    m68k     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/8df45b955f1c9224e75e982fc2edc5654ff7ae76 |     
    arc      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/2f594d4095e316d451e067a63085c909702f328e |     
    i686     |         host-go-1.18.8         | NOK | http://autobuild.buildroot.net/results/9843622059dbc27a83c531a4cea4181e81f9cc9f |     
  mips64el   |         host-go-1.18.8         | NOK | http://autobuild.buildroot.net/results/3348605abd72166de1ece31a7a84ad199d024ba1 |     
  mips64el   |       host-omniorb-4.3.0       | NOK | http://autobuild.buildroot.net/results/6c8877d8063c2c89edd009456cf471d671bf7021 |     
   mips64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/5b8d961a9ec863091f2521b7fb6d8fe31ab94e18 |     
  aarch64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/d7ee42322f64c3943179079991f6e61636810a7f |     
    arm      |        libdeflate-1.12         | NOK | http://autobuild.buildroot.net/results/2a680e4bd4cf998301b3ee28f0f492342b2e0777 |     
    arm      |     mxs-bootlets-10.12.01      | NOK | http://autobuild.buildroot.net/results/44ab265832a180717dbc9bf8c77728042e887d4f | ORPH
   sparc     |          poco-1.11.2           | NOK | http://autobuild.buildroot.net/results/227e99ac01c9e8e4598faa6fe57844f65b054a60 |     
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/c9ab5ad1489556e7d5dc5a58e27b019668e18349 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/5fba08792b02c30de258b995e81f6d0299f20b3c |     


Gitlab CI results for 2022-12-09
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3442682771  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3442682779  |      
                 imx6-sabresd_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3442682806  |      
                      nitrogen6sx | https://gitlab.com/buildroot.org/buildroot/-/jobs/3442682861  |      
                       nitrogen6x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3442682863  |      
                        nitrogen7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3442682864  |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/3442682865  |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3442682866  |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/3442682867  |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/3442682868  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3442682899  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/3442682915  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/3442682975  | ORPH 
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3442683010  |      
                zynqmp_kria_kv260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3442683043  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3442683045  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
