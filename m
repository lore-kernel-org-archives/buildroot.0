Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 797F7C43219
	for <buildroot@archiver.kernel.org>; Tue, 18 Oct 2022 05:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB6F760FB9;
	Tue, 18 Oct 2022 05:43:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB6F760FB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xTIXYPdbEthk; Tue, 18 Oct 2022 05:43:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B3F860FCD;
	Tue, 18 Oct 2022 05:43:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B3F860FCD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 390A51BF396
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 05:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5A2F82F37
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 05:43:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5A2F82F37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lUAfpiqHTjK8 for <buildroot@lists.busybox.net>;
 Tue, 18 Oct 2022 05:43:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B64882E5F
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B64882E5F
 for <buildroot@buildroot.org>; Tue, 18 Oct 2022 05:43:05 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7640D100003
 for <buildroot@buildroot.org>; Tue, 18 Oct 2022 05:43:02 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 18 Oct 2022 05:43:02 -0000
Message-Id: <20221018054308.D5A2F82F37@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1666071782; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ad1KNZFhJHnumTSzCoY9i8d4tD8udfC1K2kj8W1PPp0=;
 b=XzadU4UXmasdFrVJq0BFAhtTO4cSrBLuPPaaFeBfHoyFoG+QeduXD8JP5F5j1TA+Fy6A7w
 4vGHmXXRh78uIvpGtymkNJLBXt/PQDFZ1M4Z1YsrjPDUlYVj6cgEPMjs29xWw34onElxjX
 RUqCVUxOJpBRLB3CP8LiM2Ogj3QVNIA+ToFq9Ic3F522C9QrNdtV9MBjDPIjGciwhDuYk0
 y7IEPgtyUkw7AA1UKEUdRHPxciR0A4+P9PjYGBOEcE/gDWZA1Pgb/yDkJ1jsZt6Bsbub3V
 nAyvoZQNSu8lKKQ7odulkOvifHl8iQ6XK+qrLC2BCITMfZfr+A7po2adhO8XTA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XzadU4UX
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-10-17
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

Autobuild statistics for 2022-10-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 13  |  1  |  0  | 14  |
  2022.08.x  | 11  | 11  |  0  | 22  |
    master   | 101 | 491 |  7  | 599 |

Classification of failures by reason for master
-----------------------------------------------

glibc-2.36-44-g2628500f5dff... | 29
                   bearssl-0.6 | 27
             berkeleydb-5.3.28 | 26
      ca-certificates-20211016 | 24
       host-gcc-initial-11.3.0 | 20
                      crun-1.5 | 19
                   libnss-3.84 | 17
         coremark-pro-1.1.2743 | 16
        host-f2fs-tools-1.15.0 | 15
                 sysvinit-2.99 | 13
                   slang-2.3.2 | 11
            host-binutils-2.38 | 10
                      xz-5.2.7 | 10
                  autofs-5.1.8 | 8 
         host-gcc-final-11.3.0 | 8 
              libarchive-3.6.1 | 7 
                   linux-6.0.1 | 7 
                     fbset-2.1 | 6 
                        brltty | 5 
            btrfs-progs-5.16.2 | 5 
                     efivar-38 | 5 
       freeradius-server-3.2.0 | 5 
                host-go-1.19.1 | 5 
host-pahole-73383b3a39afe86... | 5 
        host-sentry-cli-1.59.0 | 5 
                   libee-0.4.1 | 5 
casync-4ad9bcb94bc83ff36cfc... | 4 
                 dash-0.5.11.5 | 4 
                    frotz-2.54 | 4 
                    gpm-1.20.7 | 4 
            host-binutils-2.37 | 4 
       host-gcc-initial-12.2.0 | 4 
              host-rust-1.64.0 | 4 
            igd2-for-linux-2.1 | 4 
                 musepack-r475 | 4 
            openssh-legal-info | 4 
                 systemd-250.4 | 4 
                       unknown | 4 
           dmraid-1.0.0.rc16-3 | 3 
                elfutils-0.186 | 3 
                     flite-2.2 | 3 
                gerbera-1.10.0 | 3 
      host-riscv-isa-sim-1.1.0 | 3 
               libglib2-2.72.3 | 3 
             libgpg-error-1.45 | 3 
libsvgtiny-ea9d99fc8b231c22... | 3 
                    musl-1.2.3 | 3 
                python3-3.10.7 | 3 
                 a10disp-0.6.1 | 2 
             batman-adv-2021.4 | 2 
              dieharder-3.31.1 | 2 
                  gensio-2.5.5 | 2 
                     gmp-6.2.1 | 2 
        gmrender-resurrect-0.1 | 2 
         gobject-introspection | 2 
  gobject-introspection-1.72.0 | 2 
            host-gauche-0.9.12 | 2 
         host-gcc-final-12.2.0 | 2 
       host-gcc-initial-10.4.0 | 2 
               host-vde2-2.3.2 | 2 
                libcurl-7.84.0 | 2 
      linux-5.10.145-cip17-rt7 | 2 
                linuxptp-3.1.1 | 2 
               mariadb-10.3.36 | 2 
                   nanocom-1.0 | 2 
            ocf-linux-20171122 | 2 
                openswan-3.0.0 | 2 
    python-cryptography-38.0.1 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
                     ace-7.0.6 | 1 
                  aespipe-2.4f | 1 
                  assimp-5.2.5 | 1 
                    bat-0.19.0 | 1 
                  botan-2.19.2 | 1 
                   bullet-3.21 | 1 
                  cairo-1.16.0 | 1 
                  check-0.15.2 | 1 
          cryptodev-linux-1.12 | 1 
dahdi-linux-5c840cf43838e06... | 1 
edid-decode-188950472c19492... | 1 
                  exempi-2.6.1 | 1 
               fftw-quad-3.3.8 | 1 
fs/cpio/cpio.mk:117: /tmp/i... | 1 
fs/cramfs/cramfs.mk:46: /tm... | 1 
          gitlab-runner-14.5.1 | 1 
google-breakpad-c85eb4a59b6... | 1 
                       gsl-2.6 | 1 
        host-berkeleydb-5.3.28 | 1 
              host-delve-1.8.0 | 1 
         host-gcc-final-10.4.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
            igh-ethercat-1.5.2 | 1 
               ipmitool-1_8_19 | 1 
                  kexec-2.0.25 | 1 
                       kmod-29 | 1 
                 lcdproc-0.5.9 | 1 
              libgcrypt-1.10.1 | 1 
               libmdbx-0.11.12 | 1 
                libselinux-3.3 | 1 
              libuhttpd-3.14.1 | 1 
               lighttpd-1.4.67 | 1 
          linux-5.10.145-cip17 | 1 
            linux-fusion-9.0.3 | 1 
                   linux-tools | 1 
              memcached-1.6.16 | 1 
            micropython-1.19.1 | 1 
                    neard-0.18 | 1 
                  ntpsec-1_2_1 | 1 
              open62541-v1.3.3 | 1 
               openpgm-5-3-128 | 1 
                   opensbi-0.9 | 1 
package/openssh/openssh.mk:... | 1 
               pcsc-lite-1.9.8 | 1 
                   perl-5.34.1 | 1 
               postgresql-14.5 | 1 
           proxychains-ng-4.16 | 1 
                     pv-1.6.20 | 1 
                  reaver-1.6.6 | 1 
rtl8188eu-903b6fcb821465fe9... | 1 
rtl8821au-4235b0ec7d7220a63... | 1 
                    sdl-1.2.15 | 1 
sdl_mixer-d1725fcb7c4e987ae... | 1 
                    sslh-1.22c | 1 
                 sudo-1.9.11p2 | 1 
               trace-cmd-2.9.7 | 1 
              traceroute-2.1.0 | 1 
tstools-08f6be304040e7b8476... | 1 
                 uclibc-1.0.42 | 1 
ulog-0389d243352255f6182326... | 1 
               xfsprogs-5.14.2 | 1 
    xserver_xorg-server-21.1.4 | 1 
                  xxhash-0.8.1 | 1 
                 zlib-ng-2.0.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/ccde8b572665b7706609de31f59b52bd76fda85f |     
   sh4aeb    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/2aba72407c72d8b3542edc4197ac4dcf7715172c |     
   sh4aeb    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/15076cf6f0398300c4d61a999df5d865a9d4b39c |     
    arm      |         a10disp-0.6.1          | NOK | http://autobuild.buildroot.net/results/1c7a230bbf49619a61e9ce5e48e5b88ccace61da |     
    arm      |         a10disp-0.6.1          | NOK | http://autobuild.buildroot.net/results/1432838e844f3f0138a22ab45c45db2b160cac80 |     
   mipsel    |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/a11147ca0c84658eaf7b7dadd5bf09755b31637e |     
  mips64el   |          aespipe-2.4f          | NOK | http://autobuild.buildroot.net/results/05854c018585f4e862ab4bd242e7ab8cef38fb27 | ORPH
    arm      |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/6346b41000582126cfca9521b58930ae46544f1b | ORPH
  sparc64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/dbd94b000ba0fdcd5ad659124e12c1ee7a26a68b |     
   s390x     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/b72b9b5edba27f4ef6b691d38dc8bb46860bce4d |     
   s390x     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/31989a46d9b7d535000901fa7e420f5246647584 |     
   s390x     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/322421d68a57a6d2e485f090bd14616eb1e8d958 |     
   s390x     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/d94ff1d28ed7d3d6395e3c00dad9a571f722b2f4 |     
   mips64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/49cd6d3183b76c11241150144ee933b5c8aa3448 |     
    arc      |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/397c6a9a7b7919e14a4f4be4c75562533f987473 |     
    mips     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/d8925a2be31c64d2d07f1c32a831f7f13457fc89 |     
  aarch64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/e5c6bf2e05c5371fb3e33cbe9c258538873373fd |     
    arm      |       batman-adv-2021.4        | NOK | http://autobuild.buildroot.net/results/35f2c14365d089611e0e279e55caa01493976ad9 |     
   armeb     |       batman-adv-2021.4        | NOK | http://autobuild.buildroot.net/results/c2446ff26fb4322f95aa0df19aef98dbf60d78bf |     
   sh4eb     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/2ca4372000b8eaf73eee268f0016b460b64e0e76 |     
powerpc64le  |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/d7952b5e3ca7b4d42fa6bd0d1aed7cfe571e21d4 |     
 powerpc64   |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/09d7d7ec6e5104e2c16c60df4268cf282fd77054 |     
   mips64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/6bd8121e109e04a2e7f306c4ccfeff2296251caf |     
   mips64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/73e33d68167e0a356e2859905354f92a051b3e1f |     
  sparc64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/0b5eedd43458e50c4cc5b9a9128c0a448150cce3 |     
  riscv32    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/59e6d74b6c1464a10f14ce1fa095ea90aff6f912 |     
    arc      |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/8880f768a79e5dccc9725ee03e9478340d02bddf |     
   sparc     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/b795e04e4551b4c3078fb239d3122be93b379110 |     
   nios2     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/aa1d507ffd97c588bad145b9c476ca0de5a1efdf |     
 microblaze  |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/9d3f41c29c5a02d103fc9d8b3169f359cf40ad5b |     
   arceb     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/e3f812c0fd943ca98901001958f9351b36c75b28 |     
microblazeel |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/90bb166570be3520f103347ef08998d2aad2973e |     
   sparc     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/b59214833cd729ba3465caebab09323b4c8d0497 |     
  mips64el   |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/976fb63452021267bcb5f4aba45d4659abe079b2 |     
    i686     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/50a4012050344df0533bc706a3d2132bec8d60b9 |     
    arc      |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/04d01772dcdce014b5901740e890532f50911fd1 |     
    arm      |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/c84ef183be5d3b7468f9fc37e74bdebea177ca12 |     
powerpc64le  |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/88550b540e087b6d36c9656696253d4cadd79866 |     
  sparc64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/96b45bd89bbbb10b925db1d292c690c8cc7c57c9 |     
  aarch64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/ad29e53e02cf2c3ff3ca6d2459f214895915e565 |     
    arm      |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/adf3e9419d027c5eb11a30cc6e886c92aa58ea1d |     
   sparc     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/9b7a06eecea0856fd211c30c4b8bea40d315f5cb |     
   mipsel    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/a1ef42018e817d1c96d294bab145b60f491fe0b7 |     
   sparc     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/86e40f65b3c2d4c4b019e8320f0c5117847e256f |     
    arm      |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/d0568e07d19f3ccb31329ab12d260b096e6f776d |     
microblazeel |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/0bde18b907511bf08b5f023f5e37fd3b98e7daed |     
 aarch64_be  |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/6e81a79739cd4dabaf82efa7e09594f0585ca5a8 | ORPH
   arceb     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/784b7b4961057a57e1d1a7f83f8e546cb3d11fca | ORPH
   s390x     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/838398252d70c29dc7976783f81c7d1f6bec1e56 | ORPH
powerpc64le  |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/f7ac9e2de616da98ad6a1ab32ca4adc9c2cc7976 | ORPH
   xtensa    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/2700ca6862d431e8ef5970a09c459569cb2d68a8 | ORPH
  aarch64    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/2548d4d63fee0489916fd25ae4aabdaa243c0a81 | ORPH
  aarch64    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/7cd30625555a2cf7ed9a0eebee51d2cbf78efc8d | ORPH
   xtensa    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/01aace8f3d420392b14f416227558466fa4a0dc0 | ORPH
    mips     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/91a74eaf16e085c9e2a31c1b17db8010f0bc2520 | ORPH
 microblaze  |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/460438a98eaadfb49de4dd0d2e2b4ee1fc536de7 | ORPH
microblazeel |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/da15b83bd23715670e3e2436d8b99f9a4621b066 | ORPH
   sh4eb     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/d1b98fc17fbdf91e81bee445dafa2fc73435384f | ORPH
microblazeel |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/158e62067f51bab374264a3f45069db99a053755 | ORPH
   xtensa    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/7d7015a51d7d49f8941c10c7c1cca371868b0ccd | ORPH
   armeb     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/c57b8b6bea92def75e3684d4f08191376f457f17 | ORPH
   mipsel    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/119a571dead6d51f9d073a37f533a4e099ddab69 | ORPH
   mips64    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/5e34f072da78bc4406be617d56d5d9f5a3f89a9f | ORPH
   mipsel    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/0dd5e0cef4e0b6c6fa4bc11d633c384bdc333be6 | ORPH
   armeb     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/83185e407dec41e75cba9ed05474c45652736209 | ORPH
   armeb     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/a74620095658e27cba8ac5ba82e95e67181a0d4b | ORPH
powerpc64le  |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/6aa53cc38c2a7bcb1389697bd19c22285a44225c | ORPH
   xtensa    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/a4b2117b5060137680e2898d4820b2cace480be6 | ORPH
   sh4eb     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/3d199c1e104408ed82749def2acfa6ae136a28e4 | ORPH
powerpc64le  |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/c3586f81409b3ffbc270937273930c4cf65f1d6a | ORPH
 aarch64_be  |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/729121352d2207d769dc47eef8570703cd397a46 | ORPH
   mipsel    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/8e1105ef45ad848b20c5bddd78b6168ecd46f62e | ORPH
    i686     |          botan-2.19.2          | NOK | http://autobuild.buildroot.net/results/8f46b301d0403fc4d1e5e2707254f37229492b9c | ORPH
 powerpc64   |             brltty             | TIM | http://autobuild.buildroot.net/results/ccde49c55331dad1b4d7b3bc61997385662b1417 |     
  mips64el   |             brltty             | TIM | http://autobuild.buildroot.net/results/2d9e2bfa9eb727c77d3234873867eb13deffee62 |     
   s390x     |             brltty             | TIM | http://autobuild.buildroot.net/results/327c191aeaa39452daf602c4ff07c923d5c58e5e |     
 microblaze  |             brltty             | TIM | http://autobuild.buildroot.net/results/76c712692f79cf78ccc8a984674c5bce0b43bea4 |     
powerpc64le  |             brltty             | TIM | http://autobuild.buildroot.net/results/df55617b51c206030d2b259353ac02e57c7b2a31 |     
   mipsel    |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/de1dbb02b5e2dbd6e5a2fbe959f3868be264dd30 | ORPH
   mipsel    |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/68a9bc79ee6cab9830003bb1c9bd03a4f5148c77 | ORPH
 microblaze  |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/56470e894fe8bd43c4aacbabef31929f61653b64 | ORPH
    i686     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/27e4b79a21c13c07139ae79ebe3212d74e5ba499 | ORPH
microblazeel |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/dc1e6019ae96e20a9e2df46b90fd1122a622be32 | ORPH
    arm      |          bullet-3.21           | NOK | http://autobuild.buildroot.net/results/654cf31016d9bdd6cf40c882494fd56f2a1a9c8a |     
   s390x     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/764983ca58cf57acf551c09f16773f6a7deb988a |     
    m68k     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/646add5c8c5c3f423567f094403e3b2c21b59b28 |     
 aarch64_be  |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/b1568e10ce5dc994065e7b7c2ca0bf2f39134982 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/765dafc414910ffca88d52b794d0b7ee72126c13 |     
   mipsel    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/2627cddf6323010d5a67d533583e9ab4bb2817c0 |     
  aarch64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/913bf43bb055101abee7b4b3e6a41233427bbdcd |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/3c28c916109d0d7e75ffd26da2396c9c9aef13d1 |     
   xtensa    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/5f5ef166df1094dafa8116403f9219e2c4516719 |     
  mips64el   |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/89b5217070ac8fad3a8b6b650106c4f4e186359f |     
   s390x     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/9dfa3a69a175fe11763827287aadb81d0c243fc9 |     
powerpc64le  |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/ff971a0420357035b2f1d7c295c79393a6939dad |     
  riscv32    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/3284017d23814bbe2ff2b6fcf4e498213ec49395 |     
   sparc     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/43959de9bc152da4871e80db4000271e3336a3d0 |     
powerpc64le  |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/186536583c6e9d80cdf29e70a779188482e6331c |     
   mipsel    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/eb07de9f285816b91cd1d81fede736579dc87240 |     
   mipsel    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/fc524dc2dce2eddf29fba1325025fae320013ddf |     
  sparc64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/6ace158836455f9d83f0369ee83713b1f179d3b1 |     
   mips64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/3654ce570db6fad2b3ef37ba768e824137abff76 |     
  riscv32    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/c7651be55ea276fbaf6d950f478ca6d5fb881724 |     
 microblaze  |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/12ceddf332b88af50cfacb648f63dc5d008931cb |     
  powerpc    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/b215ce31bf281d3cc38dc5e6266c8b97f5a8c8f3 |     
   mips64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/a60925489dd4f6586740282d671da6a2f0991b5c |     
    mips     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/30ca9037014f83a39120639897d014ce471a6842 |     
powerpc64le  |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/db747fc2af7999fd724d0a4bdb0135d766d15451 |     
    or1k     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/adbe409bb7be953be0dc1d7f92ddc6476f4dac87 |     
microblazeel | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/20da34e901aa48be326e048f862e25f2dc04fdfc |     
microblazeel | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/eb216af55e4c123f77e13ab41174d2f5b7a90668 |     
   nios2     | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/02c643bcded168e46363681279250853b4960105 |     
  sparc64    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/7d10b124a6348b88eb37679be2d55f4a90577cd4 |     
    sh4a     |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/caee1ee0625c9aa691edb97c03e50123eb4611e7 | ORPH
   xtensa    |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/5dcf26c4f5b5af20667b632c06fba5ae8ac30ff1 |     
 aarch64_be  |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/572b727121e3d3bba7905d7babaee6e72997ec5c |     
    sh4      |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/e00b09c80ebd05c75908dfe2126612fedbea0227 |     
  aarch64    |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/0ef82a3e69821751df51cf56e0dae3819244b7ef |     
    mips     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/4ab521ac4cb2c9316826e999e977841e4b6f0c45 |     
   s390x     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/8205454645cd291cfa10a69fa624638a5d0cf040 |     
  aarch64    |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/a5aa7e5df05a5ad57955cfdca25903944eef6d52 |     
  sparc64    |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/2bae52d42b8fd6b57ac7772e4068591068c8acc0 |     
   sh4aeb    |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/f8c58b3d68e2ba161a9485201fe723b73d776fe4 |     
    sh4a     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/647eec840e2e9afdb6ac3e2907a0b5c081cabbbb |     
 microblaze  |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/38c816bd9944de1a39e3e1723219e4c87b5cf617 |     
    arm      |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/1756b7bfcabfdfa5ba54e165f7d956ac414d9f77 |     
    arc      |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/44741c0ea5a98c8e00aa9e0141b1145c21887575 |     
   armeb     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/f4b093bf99dfd732f2400b0cbf9bf1ea38ec82fb |     
   armeb     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/7b46923272bbccf21c530041c78c6d8469271bf3 |     
    arc      |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/f669b69cc9ec9262e611b40d78423df4d512627d |     
    or1k     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/bc4f4688c5c39288443c5048f9ebb893477ecb30 |     
   armeb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/9d1794ec2aefc0f3129aaad016e0813ee8c3e9e1 |     
   sparc     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/79fd95e17abde9522c9693351023708235796a51 |     
 microblaze  |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/5248df36f96c177e52586757b1a2af22f5d0c716 |     
  riscv32    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/c295f18720129e04878f63f1f1e7c77f82075c11 |     
    or1k     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/680fcf46a4b1d41050d28c5caf0097d988d21435 |     
   xtensa    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/26ed2a35d789e9024e52b600e4f37bc02424f8d1 |     
   mipsel    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/08ed63c69a1e9090b7ec5413254b2c281da6d02e |     
    m68k     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/c0570c10c25c015ebceacbf81ffc72a6894a9aa4 |     
    m68k     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/b1be0d6082ef3561cf7eeffb045504f3299edad1 |     
  aarch64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/1a024920a63fa182dbde0ee6a0cabdc8c3c68c49 |     
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/d6a090998a52b9e0c9607d1cd037fa28bb471348 |     
   s390x     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/40673369babb97d9254b59ef0c90c198bfad57ab |     
   arceb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/ccaaae720829342bdaab00e4c6fdb81aa9c8eede |     
    m68k     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/b75e9a00e37339bab4e78b7fbbc77e0d34e6ff6c |     
   armeb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/084063429080229f466b78c77cb42c1c6c924b06 |     
 aarch64_be  |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/8f98716d9c61dc91cf0fd61eb7c9a3f734aa812b |     
    mips     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/cd39689beb38203c1fd76aba847ae76fe3ccac57 |     
   sparc     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/d3ecdd1b92a7042a9b275d02e9d337b92eab2764 |     
   mips64    |      cryptodev-linux-1.12      | NOK | http://autobuild.buildroot.net/results/dec4d7e1748ee62f2c11df2f3f5cf404ed315502 | ORPH
 powerpc64   | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/5a586b13a086f03e0c43f738ea1d0240ff544457 |     
    or1k     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/9b1c5b96c1da8c7a2f91913f1db406c1222bc108 | ORPH
    sh4a     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/8e4336a800e700f090049042f39dfd46ff417b6d | ORPH
microblazeel |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/d94b04dae7e087c11b30fef8e5f77d42dc2f3ac5 | ORPH
 microblaze  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/61c8a6afce5d7662cf512072fb897d540e176fbf | ORPH
 powerpc64   |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/4381fa03d0812bbc12c5b00d411016cc069540a8 |     
  riscv32    |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/be8273de61f05b0d03737345a3d4f818417c01d5 |     
   mipsel    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/970fe77f299a6f1ab43601cb9f814a76df586407 | ORPH
  mips64el   |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/089748114d0fff3f2ccf04451a89d1af33c4a883 | ORPH
   arceb     |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/5564b40d0fef4cb10a7c9283796233322e8e160c | ORPH
  riscv64    | edid-decode-188950472c19492... | NOK | http://autobuild.buildroot.net/results/1691e2b6f2c813acd30d2f7bd0390ba57e1ec388 | ORPH
   x86_64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/00f675184b2ff44f98e5c9c43a077e6802f04cd4 |     
    i686     |           efivar-38            | NOK | http://autobuild.buildroot.net/results/aeead2e53a7908124e6e65ccaa03c4b7bad99cc1 |     
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/560053295dcb29177ac904e14d6511f7cd67e02e |     
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/117c95e7fb4919902ba3c97bd1cfd6428d10f879 |     
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/03dc08172077d66feb57231a77d69e10f5153620 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/c23f14e967752a598caadc269b8acbd99d97df3b | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/e78a7a8dbd55d1701152349cf15a753b58556049 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/2ff3047d4f0d5418d85a344b1cea186a200e9f6a | ORPH
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/3cad876bc64afd7cd3d497dfdc0499e05ad6f76b |     
   nios2     |           fbset-2.1            | NOK | http://autobuild.buildroot.net/results/caf8cc20cc3d702ce12e45a85dd9b92d811fd146 | ORPH
    or1k     |           fbset-2.1            | NOK | http://autobuild.buildroot.net/results/7ffbfc40c55a32f699ba1574cfb987a73022220d | ORPH
  riscv32    |           fbset-2.1            | NOK | http://autobuild.buildroot.net/results/5c18b2b3c876879bbdfb737c107482b85dfd7543 | ORPH
    arm      |           fbset-2.1            | NOK | http://autobuild.buildroot.net/results/8abeca7a81aa536e4797f369e1efe5ebaf7aeb03 | ORPH
   arceb     |           fbset-2.1            | NOK | http://autobuild.buildroot.net/results/45d03a7f2065212cd939a52074f139230d803002 | ORPH
   sparc     |           fbset-2.1            | NOK | http://autobuild.buildroot.net/results/54f0ea2264264eb98b8bfd7e8549c938feb928e6 | ORPH
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/aae47543c3683fa4d491f61e1756b0ed8f6cdfef | ORPH
 aarch64_be  |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/6c8b17887e1f067a69ef06ec413be5ab2b581211 |     
   mips64    |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/4db00cfd5fd29d57a755ce8ec064124df55fb0e1 |     
   nios2     |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/e4e47a55293e26812d0cd582d11ca5abb7767dbc |     
  aarch64    |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/eafc7b5556d9c24957cadbfc2b7554f2f924798e |     
 powerpc64   |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/b2c5f723047d8d7d4ed8cade3c57860b0a270c91 |     
  mips64el   |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/18bbe5b17004db7109c66944866060a70fb515b9 |     
powerpc64le  |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/1af82902387d96cbbffa55d5be78b237a197944f |     
 aarch64_be  |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/acb42b2e673e7c590b5d97cd9c5dc31ac897097e |     
   s390x     |           frotz-2.54           | NOK | http://autobuild.buildroot.net/results/b1c140c9d61f707fc36c2cbbe8e741c58753e836 |     
   xtensa    |           frotz-2.54           | NOK | http://autobuild.buildroot.net/results/9c17eab18085fcf30fa2ec3e9afff059af46c865 |     
  riscv32    |           frotz-2.54           | NOK | http://autobuild.buildroot.net/results/76896ac2e4f0e1001705836d0bf00debe5894e14 |     
   mipsel    |           frotz-2.54           | NOK | http://autobuild.buildroot.net/results/ba20a37bb001045d1df647ef7e0904f4aafc7752 |     
  powerpc    | fs/cpio/cpio.mk:117: /tmp/i... | NOK | http://autobuild.buildroot.net/results/19b34a119d05ea851470d7440205c3cc0936b9aa |     
    arc      | fs/cramfs/cramfs.mk:46: /tm... | NOK | http://autobuild.buildroot.net/results/034b43b07b0f28648d785fc21554b786a2424b55 |     
microblazeel |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/1a61540725a26b62c81a79e03f75237b334b92a1 |     
   arceb     |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/4625d56a9e20b1cd7f11b7bb6b0c6a239669effa |     
    arm      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/0f8c05661f3f27351a1ea28eebdee7242e7a44e6 |     
powerpc64le  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/721a0d8f534c63d4211e53afe261a7984ed9f511 |     
  mips64el   |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/292b926b2ac46507fd1f4b9158c6f7939dd4e712 |     
    i686     |      gitlab-runner-14.5.1      | NOK | http://autobuild.buildroot.net/results/99996e8e685a965002076296ef727c107d09fbca |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3f0743377f0bc52d88af6c62ecef622bfff44e48 |     
   arceb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9d75fec6fb7c83be84275c785c03b1cf59a5c981 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/96716ce0d2ca5b1543bd1539ec2e726e837389a1 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a1680631301fcc0a94a3f1e29c40982c140e7865 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/98c0a0ad5c0e850eba958cf0752b8474894a8ab9 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b8a047e5de255dce193d9ba6f41caf016480c524 |     
   sh4aeb    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/080b4ce2bcfb0434dc5ebdf0cbd77f58b855f573 |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5deaa7ba3ee50034e4e574d4be35dd3546f53df4 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a8de14be47f388934c1712b343a1631b69899ba2 |     
   arceb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5c1b6303b3a92291e16a446f992428cd149d2de2 |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2b642d6ec95de3e9499c5305873c844715bee2f8 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/23f623f5fafbba5fb3d5129d9e3cd8c409f9547a |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ca7fd069a67097e456257e91ec08bb9c1e8b049a |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2ab8ec24e1ac36b4511906ff9295a429ef115e5e |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6e84a51bf559ece8ed9f26e2114be6149eefe4ee |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b7aa8c9a8596afcbee8a4a0f63137410b85ef0e5 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ac4e5aee75ccd1ed63912aa9bc4071edca5cb5f9 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/444d9b174fc9041fdeda460bd075c7a268c48444 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/70efa1adb476228715577a3f7ac95b661c1f8fa1 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/34c9ef1ad7cff93881dcf3a796f05f27ec7806ff |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9113039dcc63ad938f0f5a8ddedc996606f47229 |     
    sh4a     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d0522c67f9dcd9f6b11ce1ef9562a10ba251a196 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/809a80a459799b42ad3a9d6dcbdb6e7b381fe387 |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1f03b3be4ee989446e91376487b6b1408ac7c7f5 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b637f9bb6785eeb9be24f8326ff4e88a7766b3be |     
    arc      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b5e08309300dd2d18a061e768f540c27a6cb7687 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a5a9b7dba2671de705f678d6251675f1b2ca49c2 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/bc723732fc974a71da0afab281d186410e8ca137 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ec7fa06ec2052baf392bd06e389ab75a54a65656 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/9c1715e186676d5e29b771c6b7b7cb91a7b89eba | ORPH
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/8397b7229c7dad785f92a4f7d07666cde873fefd | ORPH
    arm      |     gmrender-resurrect-0.1     | NOK | http://autobuild.buildroot.net/results/2c4c967a5bf06203a5a872381133a9edaf33c495 |     
microblazeel |     gmrender-resurrect-0.1     | NOK | http://autobuild.buildroot.net/results/f1468e2f3fb183b8ba72cc0cd7b5b87877c98a15 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/5bbb9b03ceb450d5d19202d4a0087213894ff8e2 |     
   armeb     |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/d77850839d22477c1f36c70a91f271345743cc97 |     
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/bc19f818197c25de6a127fbd948fd5c4bcc8031d | ORPH
   mipsel    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/c1ca46c66d24f021ceb601a04f2bb151339356fb | ORPH
    mips     | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/dcfaa5ac532a96a02f5471f02ad8e44b2a67f2a8 |     
   armeb     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/08dc3658254b1f367b0d84ef48d8eac461ca93d8 |     
  mips64el   |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/319c7d97c5f6b86d8bd4cd03087a429c1f40576d |     
    sh4      |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/347e509cd70438113dd636d9294a9263c7e5a1f2 |     
  mips64el   |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/6dba98ea2c24827992bce41427cb6f327acb90c9 |     
  powerpc    |            gsl-2.6             | NOK | http://autobuild.buildroot.net/results/5dbfc34299c8c87af56d390ba2c130cb378f5ee2 | ORPH
powerpc64le  |     host-berkeleydb-5.3.28     | NOK | http://autobuild.buildroot.net/results/bfac7a59c50d74f9f69ab11392bd2b1fddf03cef | ORPH
 powerpc64   |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/89458004a87d1ea543c9329d4e524bc684cfb0ca |     
  mips64el   |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/6adfa63b0b1a3f04741ab0e024b961bc73b89566 |     
 microblaze  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/e862073cb7af1023a3e01fea4a23b6bfba61b6b8 |     
 aarch64_be  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/9a4c7232a9c3e98dff62d1a0a21b98302f76d559 |     
   nios2     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/7f7c37cd8babfa8e8dbed5ae82c79f52fae2f4f1 |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/747d885fe8652ef59f0f051e8a6fdc907f7e7a1d |     
  aarch64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/90ee1cf2b90c2e94ac2e5f0f412c12da20dfccf7 |     
powerpc64le  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/bc299d29a628c0ea97a095af3115e1a3e5c32206 |     
   arceb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/0b5cdde4c913fc904b88175dd80d9e14201d2599 |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/cf66d4924ffc2402e5bdbbcd39ce0f6582d2d4f7 |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ebe966b557ac3a73076666e5bfad396065700140 |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/691febc93c5e906fbdb106142c9fdb851554e2e0 |     
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e6902c1a17f88c7b9f00caa6a0f6466bc00d646a |     
   nios2     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/2ca48d0eb17e6aa7be090a4f9afe69066c5f073a |     
  mips64el   |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/9a15100cdb71e99d46975ef4c0aba0e285b96d5c |     
  riscv32    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/ae67954a79fe2e247b7633d86ec37d5b172ae010 |     
  aarch64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/8f3f545dab08571b0c42986ddef8732222603fd4 |     
    mips     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/2c011e3a951d26fd3e188f3b55daac4c6105750d |     
    i686     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/cbbb7d06a47030d536cc8c3a0346f0b75925d0b9 |     
microblazeel |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/72d1ae56b67a32accfb9b70ad62b6703fb52ff65 |     
   xtensa    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/4bc6cbfab7ac8f5c757386554a0a4e0edd28397e |     
  riscv64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/a43224b9e9f0c80cbe48ccef8ae9c620f6844a65 |     
   sh4aeb    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/cee8284496acd2a9d1809a7e82ca946795e6ad7c |     
    arm      |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/f22fd4d967bb4c52adf94564da3809495d7ac5c5 |     
   sparc     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/f117dcf5d83c7f120aa97affbbdcebda577b7492 |     
   mipsel    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/f2aca8ac27aaf55f69cfd0ea7ca74453645148ac |     
   armeb     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/b990fd917da900e98d77debf16f9cc6de779f313 |     
 powerpc64   |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/b34f6a12cac944da7cd2e59a4c2d5179c77f7392 |     
   x86_64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/6bee7e8318aef6147456062731a7221d173d5bd4 |     
powerpc64le  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/06fb6322af092438022be829bd06cb2684d7f1fb |     
   mips64    |       host-gauche-0.9.12       | NOK | http://autobuild.buildroot.net/results/25f601a2eb6486ce824a5a4d7d739a4fe328d03b |     
  powerpc    |       host-gauche-0.9.12       | NOK | http://autobuild.buildroot.net/results/ac1b850f3aff9e6e247901f0719052d37ba7ba98 |     
   s390x     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/611c0038673fe8ed274c007e7cca955431bc3594 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/eaba79a273834b7d7833d64b829ed47b55eb5b8a |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/ede2a763def116ec39a55e280bbc3191fed14567 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/e9c49426cbdfd9d048490374ab44919d8a6d671e |     
    i686     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/254b98e459d5043a859982b171d378182c139f59 |     
    i686     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/3f32d8a65c8e001c0af61dd31ab984c4b1fc8f25 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/6ceeec25350bdd7386f47519a7449ff3612698e8 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/701cc3a3613c2c1785862903747dd49cc0c3b0d3 |     
    mips     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/52480cff54459df6b20d9329012047b9d4ea3480 |     
 microblaze  |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/2a2534fc99bfc641ef53df5a27d0e39590ecd732 |     
   x86_64    |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/4f4ebd14d8c297fbdbff3fb8485172711bcde56d |     
   x86_64    |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/31f11b497ad0d329db9ce51074afdc3a9320e93c |     
    i686     |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/9daa82e084433fe71a10d8bb528e681bcb08b4fe |     
    i586     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/931a567a44a12eda2a49ab0e3bad899bf46dbc3d |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/520087dfeaf68bc178ec01f59f96298733c23e67 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/6cfc84d81e46765970f29116d81ea1500000079d |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/1fed9ab739e67007c663b795b48c3a8b13a14ae8 |     
    i586     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/a20b5b57d64ff944ae80a57ba68c9c0414fbbdf6 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/50dbcb381975b6ed80e96ae552a0039e5fc36632 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/c2917c027ed2ba16fd77278757981452cfafad5e |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/03cb39500d5f94f7bd22ebb86c9ff748ca54653a |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/c072d9951f60761239ab0e91f9fffa9c74c04a47 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/90b0d41707409cb261b280e66460895b625485c5 |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/ee92f15208d040e0e3a6d595646eba2f886cb4d1 |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/3fdc604b906ef4b30d2a3eb7193c031e47eb529c |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/f61011e273b5bbf84d57867b9f6be2958b583814 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/faeb0bfe9a59007a5b691817ad6038d3d8e59057 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/b55a2bc7cfbb50cb33c2d0f4ee83882ac67e9365 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/0fabc060e2902e1661f354e24364b90deaa33025 |     
    i486     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/24fe9aa5521646649dc2c4a08a7b744c4a3e9ef9 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/1c0862cad1f0dfa85267128283e44d85cb05aab1 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/50202e5e1ca2c09be1257682d6e3656371885480 |     
powerpc64le  |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/c1c7a9f153c4e0edc41acf4e8947544fd2f64a1a |     
    i586     |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/a482398dbdfda6ac62e651d1953ca19e86b062c2 |     
   x86_64    |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/53797681f1a77d640c7b1eab68566a1b5100bd27 |     
   x86_64    |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/0a13b252c667b6008e50a978e9cbd526ca6988b1 |     
   x86_64    |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/e96445404d27d7b2288d16121252e0e836b6eb54 |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/95f45e1da4cb57945b79d14817ff6b159f2026c6 | ORPH
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/be1f025a22d253f6afcdc6c74d9b531a0ee1d048 |     
powerpc64le  |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/feaa4fc4b3b5086a5c36ade49a9a7636acc6010b |     
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/a6f2a3c68a4d78abe6b9fb3a92f63a6bdcf21258 |     
powerpc64le  |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/15739067ba9cc8fa7fe6374ea5521e37468059d8 |     
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/a3fc00d2b82e4c0d598afb4010726d024f475113 |     
    arm      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/f14a82ffe106b2822957a8ddb8db76802a3a7959 |     
   mipsel    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/ff369eef7cd30d9865e19cc62fa66279fd9e40e1 |     
   nios2     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/c382e745dca8c96d846f1cc6fcbafbf005c8254d |     
    or1k     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/5dce7d57c113ef4926e8577180875e5f1dbb901e |     
powerpc64le  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/ad7ec5a4ec612868958d22e889f4a9d037bcf87c |     
    arc      |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/f3cd2d4da199475f2d7922ffece36b1021509bfd |     
microblazeel |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/c95c27a8d6868f6eff61d2b31afa0e5261303de6 |     
  riscv32    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/4ae8eba3d06cd8ba7705bddd3c44facbfe58f273 |     
  sparc64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/78ab32fcd16bc41d5d029404f9a5713567513d7d |     
   mipsel    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/b681bf164f440e5ddc9c59a152eff0aabbc70365 |     
   s390x     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/9b11784506dfb6337d09f7fab5726ecf8a8d28c1 |     
powerpc64le  |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/f51380cfba08462a7b50542e08c7f78b9f47805c |     
  mips64el   |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/b57d2e98cbd5ea112cd58d0cd7cd3b1b9054e5af |     
   x86_64    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/6a713c772580952ea1a96cd3b449a9675892d699 |     
powerpc64le  |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/466af2806bbc3394ccd2ad566e1142dc367520c7 |     
   sparc     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/e7ee3d3db08dd315fe16bf6759e03b1d97f27193 |     
  mips64el   |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/9c00b055f388d0eabc7231994103e0d7f10f132e |     
   xtensa    |        host-vde2-2.3.2         | NOK | http://autobuild.buildroot.net/results/23e0698570bcf23d8dad1780eea766c7d854c55a |     
  sparc64    |        host-vde2-2.3.2         | NOK | http://autobuild.buildroot.net/results/cdda25021ff5d3660d5742d6c3ece5883b66835c |     
  mips64el   |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/c416a6f700d72a023c13e0aefb9a7765acb4f063 |     
powerpc64le  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/83491dc6df40aa77332c52e457c5aabfac4d7104 |     
    mips     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/2393b07bd5c5f03451c4d064e0faa3f007e1762b |     
   x86_64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/b2ec380a0fe4fc0d1d8f6fe5bfd9b689b5340815 |     
  riscv64    |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/c842aa11250870eab55543faf3cf166d7dd66186 |     
   sparc     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/da0ba97e91a426637a429c07110c1a78b47f550a |     
    arm      |          kexec-2.0.25          | NOK | http://autobuild.buildroot.net/results/7311d7959209078b719375ae05da98311d05ff42 | ORPH
   xtensa    |            kmod-29             | NOK | http://autobuild.buildroot.net/results/ee0586b02d0669fedd65df5e8faea5b9261dbf26 |     
  sparc64    |         lcdproc-0.5.9          | NOK | http://autobuild.buildroot.net/results/588fb82780e918724ba8fe561965ac9539058ee3 |     
   mips64    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/5223e7326b6a967c8dbc4d266372e437f2c58c69 |     
  riscv32    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/9f1bd06d80ddebcd5445905bfe648057bb639573 |     
  sparc64    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/89f0f7e29686f301c5f48d84ebfc2fd1bf12d501 |     
  sparc64    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/be2db5a6fc2cc674b7942d5ea410fc01fff36172 |     
   nios2     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/5a18b5a12cba34a7b92c0c48e5c388925a2324db |     
  sparc64    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/a3262669f0c1b9d2233f3453153460229363809e |     
  mips64el   |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/772d90a11b593c157073469361cfe2342b9186b7 |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/9c22decedccb1e5afc2941a9f2ad60b00b3881da |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/6e03ec16cb42b85a9bb0cbde36242cf39d68de02 |     
  powerpc    |          libee-0.4.1           | NOK | http://autobuild.buildroot.net/results/17b1a72840f6faee07f6cf60aa0dce0891c0d0b4 |     
   arceb     |          libee-0.4.1           | NOK | http://autobuild.buildroot.net/results/d8ac678d2705f81e8afa574dfdcfa36f0d643402 |     
microblazeel |          libee-0.4.1           | NOK | http://autobuild.buildroot.net/results/ed64629e4a84540a3bbb499de588a335a58d2ccf |     
  riscv32    |          libee-0.4.1           | NOK | http://autobuild.buildroot.net/results/18fa55ed3ab5c0105a7a5f3423b493498af67a45 |     
  aarch64    |          libee-0.4.1           | NOK | http://autobuild.buildroot.net/results/324ce32bbadccd79ebbb91f018960ec3b0395c1b |     
    arm      |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/960938d34d7c652998d59c3abd68462be05b850f | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/9469b32858e5dd0621ab9562887115a423d3d2c0 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/07ea9e984e0cb6c41f29d11e5d12126b362cce93 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/4ca44ce6e8399ae49a5f591c282d5aa4ba911bb1 |     
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/b303d596a87bc981a7d238bc319cdd799e1243f9 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/456696ed86adaec34aa3020d0dbf22c9c6d8aa74 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/6be838ae5482cd70dd0a2f6991a2dd9c58985c42 | ORPH
    or1k     |        libmdbx-0.11.12         | NOK | http://autobuild.buildroot.net/results/5b7fa9f5c1e2db0c1de9669d4c675201776d8d53 |     
   arceb     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/8110ef20f2800b52bf38725e8163763c6e33b322 |     
   nios2     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/87f76a410407b3d390e00bf56cf278c645099464 |     
   xtensa    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/515ad0923b61ac1d31fe94d8b1df57cfd81d514e |     
    i686     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/f881de15fdb3791da15d49acbd83626a0937e606 |     
   nios2     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/4335d0d8454035a8f74645ba8d6c2329ab2e5480 |     
    arm      |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/c5b029195de2422d1b1ab54613f7ee57ee49debc |     
   s390x     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/3288e2795e1ef06bf3294ab14e3cf8ca2a019240 |     
   s390x     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/5263940f97f91cc0ba043c6e0eec4dc66a72309f |     
  aarch64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/c2c3f09e89c95ea47a1d975723247dcb58b5b3cc |     
    mips     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/52f04375b6e0f6a5e5743ff6b688942f343bb503 |     
  sparc64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/450d7a0278394dbf61454d15fb622265ee7c0177 |     
    mips     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/53133870543b7727c4e5814773e42b49d53d5edf |     
   sparc     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/db9a85f8f902aac41c27303506e0529e59d1a391 |     
 microblaze  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/35bde8bc36ebfdc45ddb218f654178ddad8330d1 |     
   mips64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/245ef91350180f3a89125c4c8dd19d8fc535379b |     
   mipsel    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/46547379ada30a74694d2b100b790714ac9d5361 |     
  sparc64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/3b1305c39910e7d55c02a9f249a5eed0d5a0848d |     
    or1k     |         libselinux-3.3         | NOK | http://autobuild.buildroot.net/results/1ee6d81286ab91c97d39e9ddbd0c5af7180b6527 |     
   sparc     | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/82422df9f99e0604474e35dada2f8937066f5f5d | ORPH
  riscv32    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/fb4add9ab9a8d508e8a66e29a1b424e97becaaf2 | ORPH
    sh4      | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/3f6b4e2d796c3181e3fd795f77bb0829bbcc9202 | ORPH
 powerpc64   |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/e448ca55eba195cfd54f1bebdb92bebc6078d525 |     
   arceb     |        lighttpd-1.4.67         | NOK | http://autobuild.buildroot.net/results/777ab55a58c92005e43177d5f76b39a3c0c75cd6 |     
  aarch64    |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/c57005cf8d1ce7fcaea927e8365da3993231089b | ORPH
powerpc64le  |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/cab10c07ecaad69b939182c0659b1b9b8b517856 | ORPH
  riscv64    |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/7a96737e37c0e9d5c38bf98a395606563b35730c | ORPH
  sparc64    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/be3749f6f8a66e10672765b4dcb757bc9f0a2e2d | ORPH
   xtensa    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/e41c0fc65e1bdcf6edfeeef49dd790cbc862b49a | ORPH
   sh4aeb    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/7c3356ae2a6546d87fd3bc95ac77632b4bee2c07 | ORPH
    mips     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/62e517581cc723d087a8ac98481b95304256f51c | ORPH
   arceb     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/f7cd4a117435f3cd3fbf0d011678171cfcc54f43 | ORPH
 aarch64_be  |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/18297ae062ed5084327def6dcfed4856d5fa6c4b | ORPH
   arceb     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/d630c31c33b4e58c0ab4d1e19728f069c697dd68 | ORPH
   s390x     |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/1d678e28059511c7b69a0922f22ed887f2a1a3a1 | ORPH
   mips64    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/5d9fcff561f0c87b9c3052f3386092d7e670c06e | ORPH
    sh4a     |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/743711bfddd3dacc0838fa0a8a89bc46d1a3911a |     
powerpc64le  |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/3d0b104088dc3cad55d345afc849c255678dad56 |     
   sparc     |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/8671796a15e44a1090ad56d4b4254cea732ec8ec | ORPH
   sparc     |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/90a9bcba061b095a99eaa920c250e1973daf8b21 | ORPH
   s390x     |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/154c0c760e9ae6e6144beef01ac50403ea65501a | ORPH
 aarch64_be  |       micropython-1.19.1       | NOK | http://autobuild.buildroot.net/results/d0611850c01940a1c225800feb27b539273fcc15 |     
    or1k     |         musepack-r475          | NOK | http://autobuild.buildroot.net/results/a0164709cf385c6a761d00dac5733515274ec8ce | ORPH
  aarch64    |         musepack-r475          | NOK | http://autobuild.buildroot.net/results/2837a96b6ca32bde4c17fcfa557bd4f65fd9a91e | ORPH
    arc      |         musepack-r475          | NOK | http://autobuild.buildroot.net/results/138e5c18f69fd860a91d9a9dd7e85d0af0d9b86f | ORPH
   mips64    |         musepack-r475          | NOK | http://autobuild.buildroot.net/results/8a9bfa03d25dc1c79a05eb2dacc37368401883ae | ORPH
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/f1e0c9138fd0d82172910e897b2f09c2da0d7a10 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/1c27d53e8bc344b34068cfdc3bd8186d22410616 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/988e9bb4bbdb01011f120f13dd453c1475d57c19 |     
   nios2     |          nanocom-1.0           | NOK | http://autobuild.buildroot.net/results/4159d13ba1bf0af3f401ba62dfc87cb33988eff7 |     
 microblaze  |          nanocom-1.0           | NOK | http://autobuild.buildroot.net/results/7023f3966e6121e96674b0dbdb2608ea78652293 |     
powerpc64le  |           neard-0.18           | NOK | http://autobuild.buildroot.net/results/ce19e02de84c5212d9d2d012ac939c8053c01508 |     
   xtensa    |          ntpsec-1_2_1          | NOK | http://autobuild.buildroot.net/results/d4872de407e3cee040831a665bfebfb91c002c74 | ORPH
   armeb     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/a5f04ad0b1b477d0bfaef4dfa14729e4b1b5cd7c | ORPH
  sparc64    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/7ec7e3f7db32f340e144c9189351cb4bb7bb42d5 | ORPH
 powerpc64   |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/f864eaed3dfce7b930b26d26da713f4f1ddcda94 | ORPH
powerpc64le  |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/4cf2eb3124509c8e07ee971659b4d1c320feb07e |     
  riscv64    |          opensbi-0.9           | NOK | http://autobuild.buildroot.net/results/3cdee9dc4285a68d1af4030d4c0edfc2679874f6 |     
    arc      |       openssh-legal-info       | NOK | http://autobuild.buildroot.net/results/2a9d62d2f3ee00bb1a60658fe805eb075ed73d11 | ORPH
   nios2     |       openssh-legal-info       | NOK | http://autobuild.buildroot.net/results/1a18781edf3922b5cda03734f081396d7d725100 | ORPH
  aarch64    |       openssh-legal-info       | NOK | http://autobuild.buildroot.net/results/fe8c05833908372507d6a048293ed633261532f6 | ORPH
   nios2     |       openssh-legal-info       | NOK | http://autobuild.buildroot.net/results/697cdcea128c3716c9ae81be6c97937ebd80a5da | ORPH
   armeb     |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/f3d86c0ca8493e1e7bf6153e95bbf75c5beabc30 | ORPH
  powerpc    |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/a6db918be120274cf321835f22776cc06a991673 | ORPH
  riscv32    | package/openssh/openssh.mk:... | NOK | http://autobuild.buildroot.net/results/51afe46e4aa14b8a60b27a2c43ec4ac12cbd7265 |     
    or1k     |        pcsc-lite-1.9.8         | NOK | http://autobuild.buildroot.net/results/d42ca52cb55bbba1b88d0eefe568e51c00287424 | ORPH
 aarch64_be  |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/1f572b125ca771588d14bf14dd5c1a1c6ee10010 |     
   arceb     |        postgresql-14.5         | NOK | http://autobuild.buildroot.net/results/a0a5d81aab60857011fc05a8e9abbed1edeaa934 | ORPH
   mipsel    |      proxychains-ng-4.16       | NOK | http://autobuild.buildroot.net/results/d7c50976c5b4514fa8a19c57509804767dd7610c | ORPH
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/cc85ecb8432af1e67a041d06da710fdb77793007 | ORPH
   armeb     |   python-cryptography-38.0.1   | NOK | http://autobuild.buildroot.net/results/dec977009cdcd57f90e60d2a95509b0fae89160b |     
   mipsel    |   python-cryptography-38.0.1   | NOK | http://autobuild.buildroot.net/results/325e206d83a4952ccc7148d1574e4d4103791b34 |     
   arceb     |         python3-3.10.7         | NOK | http://autobuild.buildroot.net/results/80206151b94a0dcc94138cee6f5bc0c9ef4ac578 |     
  powerpc    |         python3-3.10.7         | NOK | http://autobuild.buildroot.net/results/fd28805e4a72f750be50e9f8ef97f4d4532c3c50 |     
    arc      |         python3-3.10.7         | NOK | http://autobuild.buildroot.net/results/0b7d52f98fd0ce9e8114f50b020c28905b4bd14b |     
    arc      |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/0567c061175054554df1da7b3d23340df0758dde |     
 powerpc64   | rtl8188eu-903b6fcb821465fe9... | NOK | http://autobuild.buildroot.net/results/a26c4a1b71a7709f61b6e56a2265de80a9bdda67 |     
  riscv32    | rtl8821au-4235b0ec7d7220a63... | NOK | http://autobuild.buildroot.net/results/8424fb8a4db2afb98d057e0a8c26856168a84c8a |     
   sh4aeb    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/d5dfec2ff1f9992545a402655600fcf4b758804f | ORPH
 microblaze  | sdl_mixer-d1725fcb7c4e987ae... | NOK | http://autobuild.buildroot.net/results/8ee67d743ad838229f856a46623742fba5e37a41 | ORPH
microblazeel |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/acb4a376a95de5560b1dbd630810f254f5277f10 | ORPH
 microblaze  |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/2e6e6e98fee6a00b3a95fa2278e74de4930d3cfd | ORPH
  aarch64    |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/a9c26d9f11a8ccb00a12acb2ca5c41a8b6e7b0c9 | ORPH
microblazeel |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/2b33425b673e45fa1780cf6d883b56eba473da74 | ORPH
 powerpc64   |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/d380a693fa121d3230a379571fad3c2047ea5c0b | ORPH
   s390x     |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/c0abd26b8e709e68e6a761f3582dbf478c6cc6ad | ORPH
 aarch64_be  |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/74dfb81886a36279be7ab5c7abae61475d3830e3 | ORPH
   armeb     |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/f47b0fb4a3e545860ccdb29f8450583fbf3a4e5b | ORPH
   s390x     |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/4dcb2a5ee47c08141175badbae6c1d30c6badc6c | ORPH
   arceb     |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/34eb008322fe58c3be2a0830427e18f962e11b1f | ORPH
   xtensa    |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/9a4dabff2292c532093802b997da40f15062cc97 | ORPH
    arm      |           sslh-1.22c           | NOK | http://autobuild.buildroot.net/results/6949d74ae207d7b60a2b9258ce385451d5396374 |     
  powerpc    |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/bf16a81a113c143029ae24cf1b18a20883af9bd3 | ORPH
   s390x     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/7ddc967bd567666b0114db5ca1646444725da870 |     
   nios2     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/404ca85df92ecfdaf63859a01b99ae84b315cc67 |     
   s390x     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/ea54efdc1c46ba0432c8b23b184f1e675ffecab3 |     
    sh4      |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/8414f09b7f5d67b2666e6fd68169986fd7d644d9 |     
  mips64el   |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/e4743b288a311843d37d2bdd1c4950c356756325 | ORPH
   nios2     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/8e2585502c4c6f033b7e00d682c57ae39022629d | ORPH
  sparc64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/d8a50b06b9f56a01a68e17806d25c4e6e7a2a8a9 | ORPH
   nios2     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/61f80df2f53722cf1632abff7604e3206337c80d | ORPH
    arm      |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/a674b9ffb937ad94410e922873d101d8b3ba4f24 | ORPH
   s390x     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/8019c11782a6eaa0117f012f4f6ebe3d92a9097f | ORPH
  sparc64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/2ab8682247eab887b082cbe6fbe3b4c3647b05fc | ORPH
  sparc64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/5d3f8b257546cc9a54e1ca72b4f5b7e2bd6bad60 | ORPH
    sh4a     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/ea13027f05556c4cc72b3beb24d00c2131cb769f | ORPH
  sparc64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/c4b0fa8eb0e54a7161bd94f66b84055c5e0efb47 | ORPH
    mips     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/a587de9e3f9925e8edab81400d35f9d91af4e028 | ORPH
    sh4a     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/33d502e8567323e42c08c152c4a83d0e84a7c7a8 | ORPH
    i686     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/b7a7023d791396b09d897f5bead84758bf70ae3a | ORPH
   x86_64    |        trace-cmd-2.9.7         | NOK | http://autobuild.buildroot.net/results/2563145366829525e224f0f81d0a1487560737b0 |     
    mips     |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/c7ba9fa3c160ab3473e0b0c91578123fd218ff3f |     
   mipsel    | tstools-08f6be304040e7b8476... | NOK | http://autobuild.buildroot.net/results/64bcb232a04264969b7ac7f08b04f1f74f22c7aa |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/2a3769de75af4b176d3409e456d64500439f2def |     
  sparc64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/5f3f541d6db08d21c9798cd5d6cb9938d5fa048d |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/776a7167a00fed9e75490ee12ecef16d7cc528a4 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/db28a85bc6442ae2fc4631b40dc3c7032253c1fc |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/55e992d23131604504d2b7b2613acdbd6f627727 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/967776321f07ba5f28f71db79f3345e294355692 |     
   mips64    |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/743dd69be7b938a09a13d918765bb0824ba1ac21 | ORPH
   nios2     |   xserver_xorg-server-21.1.4   | NOK | http://autobuild.buildroot.net/results/50248dde36688832735a84f4a3eb11359f4f130a |     
   nios2     |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/5e2e3a601aaacda50552dce05ea939d0c51ece80 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/9a8e867641a6eadccf6d7ae7ed8f64d331708843 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/2abf2bb11aa18582eed9d85ddfc1852e091b9ac6 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/cfecb14cd1e919a8e8271937a17548ae48dcf4e5 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/8c30b20da1f3514ff4d2a34ad53e30386f68b54e | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/0f89be309f023fdbbdffeb1e109d8eb380675ae4 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/5f61c3a2368b602bba45eaee534cd8ee8f0f80bc | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/f05ceacc5c59a2f842a6ba164a115c46222e8b8f | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/fc013e3291c6b85d8c6cf2b74672a2476acc82de | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/7c42b5a046ed0c37a5ee7210a1069e43fbfe87c6 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/8b0384eb57f23cb03bdb616c761c6cd2d4afeb18 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/d2e00bac317089990286e040b953efcaf245f661 | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                  nginx-1.20.1 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/2da3d372a49f074597c8265ef227ca9967af94eb |     


Classification of failures by reason for 2022.08.x
--------------------------------------------------

/home/buildroot/autobuild/i... | 1 
                     frr-8.2.2 | 1 
                gerbera-1.10.0 | 1 
                     gmp-6.2.1 | 1 
              host-rust-1.62.0 | 1 
                ipmiutil-3.1.8 | 1 
package/openssh/openssh.mk:... | 1 
qt5location-db3b6bc6afed647... | 1 
            quickjs-2021-03-27 | 1 
rtl8812au-aircrack-ng-4ab07... | 1 
                tealdeer-1.5.0 | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/64bdda8458f80f30078e7fb9a8ae1ae104f5fb48 |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/f771a0c85e009d568836ec254e4d2441c1d9bd5a |     
 microblaze  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/874a88d9645efef9eaf2efbbf50c489d8e96604c |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/cde9efa9c157fd9deff66c18a8a3385acb9444de | ORPH
    arm      |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/b9a1123618683786d6885a71849e4a72fa9f6bfa |     
   x86_64    |         ipmiutil-3.1.8         | NOK | http://autobuild.buildroot.net/results/95ccad4a8e32489eb2906ff232d19582ee97132a |     
   x86_64    | package/openssh/openssh.mk:... | NOK | http://autobuild.buildroot.net/results/00c87faa3b17f19793c94611f82f59b188a697b5 |     
microblazeel | qt5location-db3b6bc6afed647... | NOK | http://autobuild.buildroot.net/results/591ffbf101f4063dd95f476030ac43fd79a677ff |     
    sh4      |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/c71453ec602a921995876b48958185c612302106 |     
   s390x     | rtl8812au-aircrack-ng-4ab07... | NOK | http://autobuild.buildroot.net/results/0b90061cea7ee22d5822214f081d14304ee5fcc4 |     
   s390x     |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/44396f4433eb3ba07d212f0763cab396a4c7128f |     


Gitlab CI results for 2022-10-17
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
      TestCpioDracutGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3180908499  | ORPH 
...ioDracutGlibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3180908500  | ORPH 
       TestCpioDracutMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3180908501  | ORPH 
...pioDracutMuslMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3180908502  | ORPH 
     TestCpioDracutUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3180908503  | ORPH 
...oDracutUclibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3180908504  | ORPH 
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/3180908604  | ORPH 
...lx60UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3180909384  | ORPH 
...Xtensalx60UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3180909385  | ORPH 
               TestGdbArc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3180908612  | ORPH 
   TestGdbHostGdbTarget9x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3180908620  | ORPH 
   TestGdbHostGdbserver9x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3180908624  | ORPH 
        TestGdbHostOnly9x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3180908626  | ORPH 
       TestInitSystemNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3180908556  | ORPH 
...IfupdownDbusbrokerDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3180908581  | ORPH 
          TestLuajitRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/3180908928  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/3180908867  | ORPH 
         TestS6Networking | https://gitlab.com/buildroot.org/buildroot/-/jobs/3180908938  | ORPH 
TestUbootOpensslPkgConfig | https://gitlab.com/buildroot.org/buildroot/-/jobs/3180908952  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
