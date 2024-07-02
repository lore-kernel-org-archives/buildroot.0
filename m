Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A76C3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 05:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CEAE81EF6;
	Tue,  2 Jul 2024 05:21:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Isu6JQK8kiCC; Tue,  2 Jul 2024 05:21:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF49E81EFE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF49E81EFE;
	Tue,  2 Jul 2024 05:21:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 230CF1BF31C
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 05:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A85081EFE
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 05:21:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 52SR1-7CyhM3 for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 05:21:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5F1A881ED9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F1A881ED9
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F1A881ED9
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 05:21:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1F7A51C0005
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 05:21:39 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 02 Jul 2024 05:21:39 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1719897699; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KNAlfwOn5SejGw9VAn2fBrNRAF/XZluQcjI+vQ2aVOA=;
 b=d8CVoGK4R1fzS021NRfKABjDQTL2OtQv2GsSEX66/J1fdhC8XfQSWPYXxROWfb7PG4/DuA
 yejWv0NzoX4WDCMgy6fUdHdu5/t9PtcrjeVRe75xk2mjw1hmD/4VvSKmTmZc2Dk35lx3i7
 MARD+XUxQlKOLq5TblWnSi8kWH6EZJoHoRuEE77uG/Tp+sEdkfTfYVITKYCMeZU6LPwz9j
 KyPc9NkyifG3dUIjoTyFTrWBOSeIjyHDS084SMDDVjGC+nwDD8uNB1CuyXS3yOdU7t+rp2
 SaEzWx4AQKDM8Ud9axGPmKbIPhc9x1+UFX1IM6P1LKu4wFLPpKs5L9Y3p5ZZAw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=d8CVoGK4
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-07-01
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
Message-ID: <20240702052139.xFDPngizyassROeEn3SHV3HxU76DTZddHtiefO06A64@z>

Hello,

Autobuild statistics for 2024-07-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  | 14  |  6  |  0  | 20  |
  2024.05.x  |  8  |  8  |  0  | 16  |
    master   | 77  | 855 |  1  | 933 |

Classification of failures by reason for master
-----------------------------------------------

                    zstd-1.5.6 | 78
host-prelink-cross-a853a5d7... | 65
                    gpm-1.20.7 | 64
            host-cdrkit-1.1.11 | 62
                    yajl-2.1.0 | 35
                libressl-3.8.4 | 31
                 empty-0.6.23c | 24
                libssh2-1.11.0 | 24
                 libfcgi-2.4.2 | 22
host-android-tools-4.2.2+gi... | 18
                dovecot-2.3.21 | 17
                libmad-0.15.1b | 16
               cracklib-2.9.11 | 14
                elfutils-0.189 | 12
                 haserl-0.9.36 | 11
                 libcurl-8.8.0 | 11
                  libsvg-0.1.4 | 11
               libtheora-1.1.1 | 11
check-11970a7e112dfe243a2e6... | 9 
                    ficl-4.1.0 | 9 
              fluent-bit-3.0.4 | 9 
                   host-go-src | 9 
                   evemu-2.7.0 | 8 
       freeradius-server-3.2.3 | 8 
ibm-sw-tpm2-5452af422edeff7... | 8 
aer-inject-9bd5e2c7886fca72... | 7 
                apr-util-1.6.3 | 7 
                     flite-2.2 | 7 
                  bcusdk-0.0.5 | 6 
                 dc3dd-7.2.641 | 6 
                  libffi-3.4.6 | 6 
             rabbitmq-c-0.13.0 | 6 
sdl_mixer-d1725fcb7c4e987ae... | 6 
                fail2ban-1.0.2 | 5 
                  ffmpeg-6.1.1 | 5 
glibc-2.39-74-g198632a05f6c... | 5 
                   httping-2.5 | 5 
              libarchive-3.7.4 | 5 
                 libssh-0.10.6 | 5 
libsvgtiny-ea9d99fc8b231c22... | 5 
                   linux-6.9.4 | 5 
                   memstat-1.0 | 5 
                   redis-7.2.5 | 5 
                       unknown | 5 
android-tools-4.2.2+git2013... | 4 
                gnu-efi-3.0.18 | 4 
             host-clang-15.0.3 | 4 
               libglib2-2.76.1 | 4 
                  libnfs-5.0.3 | 4 
                     mtd-2.2.0 | 4 
                    norm-1.5.8 | 4 
                python3-3.12.4 | 4 
brcm-patchram-plus-95b7b691... | 3 
                 coreutils-9.3 | 3 
                   foot-1.16.2 | 3 
                freerdp-2.11.6 | 3 
host-vboot-utils-bbdd62f9b0... | 3 
           janus-gateway-1.1.2 | 3 
                 libhid-0.2.16 | 3 
                 libp11-0.4.12 | 3 
                  libsepol-3.6 | 3 
                libxml2-2.12.6 | 3 
          linux-5.10.162-cip24 | 3 
                  ntp-4.2.8p18 | 3 
                      xz-5.6.2 | 3 
                    attr-2.5.2 | 2 
             berkeleydb-5.3.28 | 2 
                  boost-1.83.0 | 2 
              cache-calibrator | 2 
                  cairo-1.17.4 | 2 
             containerd-1.7.18 | 2 
                     file-5.45 | 2 
             libblockdev-3.1.1 | 2 
             libfreefare-0.4.0 | 2 
                libsoup-2.74.3 | 2 
               mariadb-10.11.6 | 2 
                  mender-3.4.0 | 2 
                  monit-5.33.0 | 2 
                    mpir-3.0.0 | 2 
                openswan-3.0.0 | 2 
                  rt-tests-2.7 | 2 
           sane-backends-1.1.1 | 2 
                    zeek-4.1.1 | 2 
                  assimp-5.3.1 | 1 
               asterisk-20.7.0 | 1 
aubio-152d6819b360c2e7b379e... | 1 
                     avahi-0.8 | 1 
                 avro-c-1.11.3 | 1 
                    bat-0.24.0 | 1 
                  bind-9.16.48 | 1 
                 c-icap-0.5.10 | 1 
                 cdrkit-1.1.11 | 1 
                   cpuload-0.3 | 1 
          cryptodev-linux-1.13 | 1 
                   cvs-1.12.13 | 1 
cwiid-fadf11e89b579bcc0336a... | 1 
             dahdi-tools-3.3.0 | 1 
                 dhcp-4.4.3-P1 | 1 
                   dhrystone-2 | 1 
                   duma-2.5.21 | 1 
                  eudev-3.2.14 | 1 
                   eza-0.18.17 | 1 
                     frr-8.5.4 | 1 
         gobject-introspection | 1 
  gobject-introspection-1.76.1 | 1 
         host-gcc-final-14.1.0 | 1 
              host-grpc-1.51.1 | 1 
           host-librsvg-2.50.9 | 1 
                host-odb-2.4.0 | 1 
host-riscv-isa-sim-00dfa28c... | 1 
                  jack2-1.9.22 | 1 
          libcamera-apps-1.2.1 | 1 
libdbi-drivers-0bfae6c43134... | 1 
                libdrm-2.4.121 | 1 
             libgpg-error-1.49 | 1 
              libopenssl-3.3.1 | 1 
                  libva-2.22.0 | 1 
               lighttpd-1.4.76 | 1 
ltrace-82c66409c7a93ca6ad2e... | 1 
make: *** wait: No child pr... | 1 
               mongrel2-1.13.0 | 1 
                    mpv-0.35.1 | 1 
               openblas-0.3.27 | 1 
                 openssh-9.7p1 | 1 
                paxtest-0.9.15 | 1 
               pcsc-lite-2.1.0 | 1 
                      poke-3.0 | 1 
pppd-e1266c76d1ad39f98f1167... | 1 
               quotatool-1.6.2 | 1 
                   rauc-1.11.3 | 1 
                s6-dns-2.3.7.1 | 1 
sconeserver-8d1935919a20133... | 1 
             strongswan-5.9.13 | 1 
tftpd-b2b34cecc8cbc18ff6f1f... | 1 
                    tiff-4.6.0 | 1 
                unbound-1.19.1 | 1 
             util-linux-2.39.3 | 1 
                    vtun-3.0.4 | 1 
                    ympd-1.3.0 | 1 
                  zabbix-6.2.7 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/df91a9c6767d4c4ff01229c7eb4a5d00a3bdf6a7 | ORPH
   s390x     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/c52747dfabd61b2c8df60882f942b792eec0e0cd | ORPH
  sparc64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/1c3383aaf4def2f93bf159ed14fb004d8e4b5883 | ORPH
 microblaze  | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/450e385179da1644675794d3b8c7886aaad03f34 | ORPH
microblazeel | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/9c4880cf07bdff6f4baa8bb4d54bb1c76c7a8058 | ORPH
 microblaze  | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/84c421b64d4961f77d89907df917e072b347bb87 | ORPH
    i686     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/ac6279dc4cf055e2d10e5fd0b9a8a13618a395f3 | ORPH
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/b1fe089ecd883c579871b6fc940b91315e4f4f86 |     
   mipsel    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/f587f1d381fc5411aafaddd6b1ce30c549f5c41d |     
   mips64    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/ba83dc49b4c75e20a817708f6e01d15a9585d8ae |     
   armeb     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/0e14ea8baa225972f65585500e891b29f13ea5ef |     
   nios2     |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/0cca7bfb69c5dae4c77dff3a7d1c0e33aa18a479 |     
   sh4aeb    |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/13d4b9df7cd893624c8eb3f3e6a9d835eb430037 |     
   arceb     |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/0e47da7ffb5ffff68d7bb5ea1c8bb428a3593c49 |     
    m68k     |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/5f255a56375088ad8594e0b41e3b77b24a69f435 |     
    arc      |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/665095bff5673d586c5402c3774f455b1075b803 |     
    mips     |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/38946eefe72d6d372edbc87fd225f8295699ea01 |     
    i586     |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/f7c9a88ec31d3a8dc996857f976c782a0e62d76f |     
   nios2     |          assimp-5.3.1          | NOK | http://autobuild.buildroot.net/results/491b8de1fc65b3baeeb4db1c9d6b27fa554c0e6b | ORPH
   sparc     |        asterisk-20.7.0         | NOK | http://autobuild.buildroot.net/results/4eb190458b36ff30a228a308341d14b838d03b44 |     
  mips64el   |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/db98472f9e03d26ed57d3160c54d80a01d0585f3 |     
    arm      |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/237f66b0fdb7e44f15a11889c5ac28cb2af50a03 |     
  powerpc    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.net/results/0cbd4fc1b80c00735c6904cd1a38b4a87dd8c375 |     
    mips     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/17d3730ad6b71720e1d41bcd91aff0c7c51a4175 | ORPH
   mips64    |         avro-c-1.11.3          | NOK | http://autobuild.buildroot.net/results/7bc921cc541bf7c5d8eb759a631837881287f7f3 |     
    i686     |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/30eb0fd5ddf9c4038777b30272ffda3c2b38d79d |     
   x86_64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/e5cd2ea896400605713daa82b2e433874421e23f |     
    m68k     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/4290ac4a9212d4179613ae88ac47902d6fa04784 |     
    mips     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/a45dc658a96343c96a310736b5ae6a89a833078f |     
    i686     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/e92ceda4fe049300d32e8a3355f88866f40f7644 |     
    or1k     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/30a519ca2cc503456165b8b4fb91a9ef20dce552 |     
powerpc64le  |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/f7588119d60b95056bd22c5326e4f77e339dd4b4 |     
    sh4a     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/4b4318b82a8daa3727711ac29137d50c64deb588 | ORPH
  riscv32    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/4ab212ebf95704e8298f725957341cbe7b30f7fe | ORPH
  aarch64    |          bind-9.16.48          | NOK | http://autobuild.buildroot.net/results/abf926ca0f4213cc2bcef07a895520e8207782a8 | ORPH
   arceb     |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/f1dcbd02c75591f54b57120022ec5845b0be804b |     
   arceb     |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/7b11fce2d757f330903586824a1f22565b4924b8 |     
   mips64    | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/1b030ea78aa4b3d52d7a2a02f8070ec31b4e7572 |     
  riscv64    | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/d18bbba9d0661bbf2c8950ca52dcb7d9ca7019ee |     
  riscv64    | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/6866ded27a881e7141d2f32e659a3b7df28202ae |     
    mips     |         c-icap-0.5.10          | NOK | http://autobuild.buildroot.net/results/02a16e3b23f2218be4f4eddcb16c0a3c8d638927 | ORPH
  riscv64    |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/f2f0ebe07eefc6ab19a70ba62598f5df506edacc |     
   sparc     |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/671660c5b1bec40433eec7d239aeedeee786415d |     
   mipsel    |          cairo-1.17.4          | NOK | http://autobuild.buildroot.net/results/e860d706ea5de75b8d2f66376c654e6a4ddb1169 |     
   xtensa    |          cairo-1.17.4          | NOK | http://autobuild.buildroot.net/results/7a49642d45a6c40dc6cb22c87607c18c04a18117 |     
    mips     |         cdrkit-1.1.11          | NOK | http://autobuild.buildroot.net/results/fe40f600f2d36bdea4b2e26a2743fb366c0f5d52 |     
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/fa415cdf4c698406a48827ac52691b32dfc5ceab | ORPH
   sparc     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/8142da18dae1ad9362961de57741df75361ce63b | ORPH
  riscv32    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/4ca104661f18372772429c49681bae628a07973c | ORPH
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/1e9c688ac0f48e32e44fe13f1ed9d616dec05e5d | ORPH
    or1k     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/30c17d4733106ac15b519d932b31dbcf5cd7ec0d | ORPH
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/dfba2a99c223628f5b1e6ccea054a546d49f2c10 | ORPH
    arc      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/4ab1dc221f53067257950edcef10dac02b89baff | ORPH
    arc      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/cf4456690291462e3e4b0fca984020016b81f49d | ORPH
  riscv32    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/078f804632246c8b07b07e610a59606ad6101deb | ORPH
    i686     |       containerd-1.7.18        | NOK | http://autobuild.buildroot.net/results/034017f0dd5bc0a4597695e19e0d06aa2c630920 |     
  riscv64    |       containerd-1.7.18        | NOK | http://autobuild.buildroot.net/results/97091d7e950f2f11fd63a0d3f4a47d989c690621 |     
    arc      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/80f90dfefc7b06fc89969da3d19ed73473e4388f | ORPH
 powerpc64   |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/4fec3ea034d80ecd0956fb5b163b3100103cc281 | ORPH
    sh4      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/9b365fe263682ada861cf3cee86f855fb861ea3d | ORPH
    arc      |          cpuload-0.3           | NOK | http://autobuild.buildroot.net/results/0429667811db9f5f564e03f1cd4b466c1fe6c163 |     
   x86_64    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/01989eaf351ae0f290fcc3afcfa257c8cf890a1d |     
    or1k     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/0642b6659f578acc118620b01341d86c22c428d8 |     
   sparc     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/9f249cdcc3e5fd690ab6dc5af70e7633691d2613 |     
   mips64    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/817d7af69f0d3a20912b0bc6398972b78fe6491a |     
    i686     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/175aacb22bc3369a7f0da938542f30de5c571b0a |     
   s390x     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/cff74871a57457777400f6bdb67f1d7ce5e4483c |     
  aarch64    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/4b2875fc0c6df6a06de6344cb2890d9f3f0f6118 |     
powerpc64le  |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/e2d60b43f4e7f403f65114077e35a5230b84cc92 |     
   s390x     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/3d60467cc1b88d1f0f7f14d2cc4e56827772121f |     
 aarch64_be  |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/52daeda86624967106f4432812cc2c1a1a339eab |     
 powerpc64   |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/f6246222026d9e42e3385b476f543f7fdaaaed61 |     
   mips64    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/b4065158a93846fefcf65c10e2990e3a490b970c |     
  riscv32    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/96934d88511e656ef570a81d5c54bc9e5751403d |     
  mips64el   |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/997acb08f3306ce4f581f74e151c3629658839d5 |     
   mipsel    |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/b37ed4c56461bb7dc956335b82771fc7b1aa7dd4 | ORPH
    sh4      |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/0cc0bbbc82dbb9a787404de2eb77195d08885baf | ORPH
  riscv32    | cwiid-fadf11e89b579bcc0336a... | NOK | http://autobuild.buildroot.net/results/1a7f3672a872e5118a3707d67b4456fcb80201e7 |     
microblazeel |       dahdi-tools-3.3.0        | NOK | http://autobuild.buildroot.net/results/18857bb4685868b7f2b84d551200e5e2084a1ec5 |     
   sparc     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/34012f17a7fb2827bf5851e90f0b350c793d9ac7 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/e425bdcd98c38a2c7bd9758d8d47a65f5b417e24 | ORPH
   mipsel    |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/e26b37742bac1ac9cfb4bd55938e41eb7e140531 | ORPH
   sparc     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/e3b9668a3f7ce5fd94737b2bec43d3bd647c392f | ORPH
   sparc     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/dd37f9dffa1d9ef12746d487464726add5916d5e | ORPH
    mips     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/28bf3fb9b70582d72917a9559f862536d09aa7c5 | ORPH
   xtensa    |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.net/results/405d34dff8b842831c04b4807ea45f676ac34699 | ORPH
    sh4      |          dhrystone-2           | NOK | http://autobuild.buildroot.net/results/199147e7516b7bee57538a70c9b0e9fb63b38ba6 | ORPH
  aarch64    |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/274d28e03d2119c8e30c242e35dfc246b33ce20f |     
   sh4eb     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/fdcb898090fbeb3d1bf75f977b371b763606c7fe |     
   armeb     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/70aee98fc36e49ac94fbab8d6f7192d1dac50e5c |     
  aarch64    |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/011c22f6a91ee65887808476a886fc964f8e8d8a |     
   arceb     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/3d0f773f05c190e76cafba511367ab607eee86f6 |     
    mips     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/10458cf5f40cc7fbee985fc4183dbe9f30cfcb51 |     
 aarch64_be  |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/13cdb7695dce3c426e12c6ee6bd16bd75e9a3b85 |     
    or1k     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/3e60dc152e5f05dbf8dbd29e8ae8498a1a2afb5a |     
 aarch64_be  |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/812f69b08e7cc48566e57d369e71fe99bed5b796 |     
 microblaze  |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/36ff658716c6162c9bfbe098eef25c99bd3f5199 |     
   x86_64    |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/33125861607ec42edc34a511f8f5e720f42caf29 |     
  mips64el   |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/9451e386a472663bd04d9985f9166e4c40f2c5f1 |     
   s390x     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/1317866796d1b4539c4260bc118ca49980e43e5c |     
    sh4      |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/32536693df6c1c59a56ebb96e06377c17ee33246 |     
 aarch64_be  |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/6d1577539b2dbd1a02a7395928d38cfa020a6ec3 |     
   nios2     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/3cbde201b5eff4bbc88dd936e60b97138a61fa9e |     
  powerpc    |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/4f26a1e578365390348e5ea5fef92a78d6d2a35e |     
 aarch64_be  |          duma-2.5.21           | NOK | http://autobuild.buildroot.net/results/b303a88afddf25ce2458372c6ff5a3e557e86226 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/2767a58bbab9acecd5f0c3d0d902c6176bb1f91b | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/cc3253d4b0660174c3e872b23af602f79ff352e7 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/fe0626d379e3a5d893dc0164bbb6ce3fe9e17415 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/9b65b97d9fc13db9555ad17e88fb917717ff4480 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/563f80e40024ea86c148c7d22da3a76b2bc98321 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/4fa3142521c64ec17186d11e684c195d2ce6af75 | ORPH
   arceb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/d3ad20161be571dab78514a2467d8ed5b33ae081 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/bec4c21e3966441cf72c6bbf7432e98cfd5d0e85 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/30c95159a4a36c16a93b7b968240184f83c97a5d | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/ce16a540a27fba6e098b0ed0d3487b0fa4864ebd | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/d1da3b5e104613986d3e89fa8525e117f63fd723 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/4324dc4983f3a27ec46d079789af7da6f9bd8d5c | ORPH
   armeb     |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/414477ecbe4dffaf9f94c2e6b6bea2c37bdcbc8b | ORPH
   x86_64    |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/bb074e5f1bd88620819da2a6c34cf75646929438 | ORPH
  mips64el   |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/c07c927297433c74ecf9f5be285db32af1a56ccc | ORPH
  riscv32    |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/8800c35d6f36bc70685727a8e4a9aa122a1ffc95 | ORPH
   s390x     |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/63cf3e524dbaefa9539882d8bfafd0a67b8d85fd | ORPH
    or1k     |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/437dca5aa46313aef0e7cfa6058a17e862588122 | ORPH
powerpc64le  |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/2618748f44d7619fa606755c0223be026415aafa | ORPH
  mips64el   |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/20e0e3b1f4d5c92d411d8bbca0d13e7e8231555a | ORPH
   mipsel    |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/be15cc8ba978fac3577dc6fb25853a2f89209c8c | ORPH
   mipsel    |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/d612a36b4c7d1f497ced7d6843c5dace3d76cab6 | ORPH
 powerpc64   |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/6ff6527b647e7b0039f57a6318f1557e6425d8b5 | ORPH
   sh4eb     |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/464fb4cc54eb7a8b0f89c6f92872fa91d85e65cf | ORPH
   xtensa    |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/841525e769fe05e8329ed7017d54ab264d2a6469 | ORPH
   s390x     |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/663063e20c0efbc19e97f2e203c61f755860b015 | ORPH
microblazeel |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/3ade18e46938ca25b536d90fa81e1635312153d7 | ORPH
  mips64el   |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/df5ea2d667d3baf11e9aec6cd1de9dac5512622d | ORPH
 powerpc64   |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/66bc6b6d6706cec6f4bab5f0191e7c15a627e400 | ORPH
   arceb     |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/e7b555c7c86fa608b5cea59c9159e5ff1bd854fe | ORPH
 powerpc64   |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/1e0793526fd60a5901dad119048c9d72cd2bcc19 | ORPH
   sh4eb     |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/ad12d8d59aa9d9c1c16820cde0c998d3f477a5cc | ORPH
  sparc64    |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/0af9aa73fb72965de446ee4f9abc84dc37d6f14b | ORPH
    or1k     |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/2bf4c78adfb79963613fda01c28cff7d378dbc37 | ORPH
   mips64    |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/94bb623c423aa1705dcde544c79655b036a13176 | ORPH
 aarch64_be  |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/6c4b42bc9ccf5e7c1d7ca812a6340eacb8772874 | ORPH
microblazeel |          eudev-3.2.14          | NOK | http://autobuild.buildroot.net/results/6f585a00f6c841ee5477aef46cc54fa5c2da25b4 |     
   nios2     |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/e193cd433753ecaaa4acb3baad09fcbeb7f2f045 |     
    or1k     |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/ae42853423329d6a74073cea45448344d54adb5d |     
microblazeel |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/8aa57691969b8d18d5bd30bec78867fd82b9b494 |     
  sparc64    |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/112899356b8a6715b7f1a0230d5cec25f1ece0c7 |     
    arc      |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/cc5701459f3c3404acc4b55e53d0879e806dbf7b |     
    arm      |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/0166a550606694c670ca5e2af2e3edc07247201d |     
   nios2     |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/f54a4b1fa94c523000b73c7ea1832cb5f07373ac |     
powerpc64le  |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/a35e12cd3111c61a2b601b92a6d2a5143676a221 |     
powerpc64le  |          eza-0.18.17           | NOK | http://autobuild.buildroot.net/results/8a2f66c2ded1cfb11436091cf10b3a630f471c92 |     
   x86_64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/7dd6db94d88080ea68ead5d6d6fc67dded4f76c2 |     
    i686     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/0d6e3469103b37495d32b1fb43c7446c8d35ef5d |     
    i686     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/91c577c3ae640198257ae1c60b59a4b2b77de81e |     
  aarch64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/4525209451767bcb7b915511fd6b8245a9e58bec |     
    arm      |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/9674c934c5f8ca3bb8580ba6a5218675ceddae17 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/cfacb4fc5b1fe5fa8c1353cecfcc40ae5b658f85 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/1767d4a6971fa58c0974c26daacba7397eaab345 |     
    mips     |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/87b37c70322f07b04e319e8e25c8c5f9552ab2d4 |     
   sh4eb     |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/729bfca51567fb180c56e52ebdf1fe13edbf36d0 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/4e4d0011244aa2e078e7af2b8b7c709a69bed221 |     
  sparc64    |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/5522919577b29380e8da1ee12a98b543d01db3cf |     
microblazeel |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/4c757cda273a7e4d0932f6bd9945e74cfb22965f |     
    m68k     |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/3e37bcd3ba01703e3dd46403a578e57457a1f2f1 |     
   mipsel    |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/7026e3b0a99a40b9a94bde0679dec9937cff775d |     
   sh4eb     |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/ddff2c348dcf503dc7f51b4ad24cdce52281fd16 |     
   armeb     |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/2bd6588f6325a9c1cacac774576e308f5ae72737 |     
    sh4      |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/9ca63d230ee1d3d0c05cebbbf31176b7f1d659f7 |     
    mips     |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/163b2613f4ba27aded0f6977fbdbfebf6aae2458 |     
 powerpc64   |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/a8d83a4e6951c405d3e18ca4acfd60224ae58cf1 |     
    i686     |           file-5.45            | NOK | http://autobuild.buildroot.net/results/f026367e94314c982449a01c2305b93edcd850c7 | ORPH
  mips64el   |           file-5.45            | NOK | http://autobuild.buildroot.net/results/763d4b50397eec72c3c8c354cc1e07368022d770 | ORPH
    arc      |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/96c67060a8351f71774b2f72a6552ad5eb15beef |     
    sh4      |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/4dda73d30a63324621405c7cdbc55bfbd6e3dcc0 |     
    sh4a     |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/9cb9ee68c125de57dc456f0a60d20c3c22c6f120 |     
  sparc64    |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/0d3bc69ac778877e256d35e3d781f7f0db7f51fc |     
    mips     |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/bbeba2c804e4729795a2faeca3d41d51e55a40c4 |     
microblazeel |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/dd387b360839faf6f469fa7438684df8460927dd |     
    i686     |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/87dbbe5ec4c92926a5e5fae3f0bb3388f97e1907 |     
    arm      |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/ec935b7e5296e57d14603d601f079d8b834d6c15 |     
   nios2     |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/ee7708ab4a22df11220540174c5ee6ad24dbe0de |     
    arm      |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/3e24f39cbf46258a5f0d97f55d64fa51bb05bbad |     
    sh4a     |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/dfd14b155e7e8812a268ce25f6d874df191aa08b |     
microblazeel |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/5549bad5876dc73eb92159a9ccb8b13e29bbc949 |     
powerpc64le  |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/5977dfd6fcd010438f7178f3ea825ecfd3491134 |     
  riscv64    |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/4fda9f32f25ecf4eb638dcec105b8af5f3ac5d0d |     
   mipsel    |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/4c195188ff4f1bb5834e954379ff41ba3b9b36e1 |     
  mips64el   |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/e8f1b195bf3429b74e6cebf9436fa6e1d1f207f4 |     
microblazeel |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/95fefa18e499cc4cfe189350235126d2b6965b43 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/b3b4be16866363c751c7afb74224852ce0679588 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/3b66c230631fc3cb24738882c0723af456b82647 |     
   nios2     |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/6856020aff82acdfd54b254e0882f7915d1a8348 |     
  aarch64    |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/610cdb6f733e268b64be1a00a7d9471d79d720f5 |     
  aarch64    |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/f24d380cfa82d53f7d1a0aae7842f74c8de6b167 |     
   mipsel    |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/3dd436eb091a4fd1fdd8bf49c492bbfdefec4d3f |     
   s390x     |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/54093cc52712ade86255e17e468c3412bbba47aa |     
    m68k     |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/778c42844160b9c64383a51d7ce13a2f5b2576fd |     
   mips64    |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/a16eacb31efd1e74adec438f75a18ae9375cbd83 |     
 aarch64_be  |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/b73efbc2f50f6df026aac6e23729ebf1d5fe871a |     
    i686     |         freerdp-2.11.6         | NOK | http://autobuild.buildroot.net/results/5283bd2bf65ad14d4954d8e5eadade4b4f378b53 |     
 aarch64_be  |         freerdp-2.11.6         | NOK | http://autobuild.buildroot.net/results/77e20fa4902ff497bee54561943feb04a7654251 |     
   s390x     |         freerdp-2.11.6         | NOK | http://autobuild.buildroot.net/results/38041ec5a087334a5de77578773618e34f05900b |     
    arc      |           frr-8.5.4            | NOK | http://autobuild.buildroot.net/results/eea39ab41efd198f201c4c3cb20dbe3b8241932e |     
   arceb     | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/057f81d9d9bd1c3329579e1d5cbb084c745717e5 |     
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/fef3dcdb34cec3c1c0b030c7aa2dcd4e760e0682 |     
    arc      | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/ed72cbf2210a6a477134e2513f174022c2b35329 |     
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/a807b38cdfcb27c688aac395a9f9869a7101a2e1 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/97b75f4a1925339102f6109f4870155e3e00a551 |     
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/5002f10d4005f99b7b91c37ea786bd4f09ad2f6a |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/c0ba3aa04f179b14d7ea1dc7a1fb238391a28777 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/8babd1e0fd0b45f61f1e1d126224c0e49c8d80fc |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/6801471a6b3643dcdb4d9142b30d47d7dd1316ea |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/90c350684be73bd623669ce6106e3d635bdf3a7f |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/8e247cfb1563f297c3ab1ce4bf72eeaefcdc50fa | ORPH
microblazeel |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/78a7ef995e54caca206e187e54564aad57aaa89c |     
powerpc64le  |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/d29e1aa7a0c196e66b6d0cb04ebda7f4139a3fd6 |     
   mipsel    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/238076b3aeb1900efd58fd41c97dc5ab50505e7c |     
  sparc64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/0f58a011844d1734aa37ec5264799e0f8035f6fc |     
    or1k     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/365b53c10e0dec6f0cd149923e2558ef6be1fca9 |     
  mips64el   |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/07330e5d3af97668da3502378d57211a36c98f29 |     
  aarch64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/d29210ca583e4c4f27c4d6c3063f549b01aa9aa7 |     
  mips64el   |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/52e0a5294b1089127787c1f3cdd621b1fdd97be2 |     
   nios2     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/443810ce05cc11c517f36040aaa042b0603ea6be |     
   mips64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/a248ab36886c2c56479ee8ac445bfcc8ef44f5c1 |     
   sparc     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/1c0b8667a9251b89060039be58979102d00a9fd9 |     
 microblaze  |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/676161af389904dc4d32f5379fdd5751326d4a76 |     
   mipsel    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/f94af3857237574f583d192c09516930876c8cea |     
microblazeel |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/b2f3f67ad5a865a849be35223e5ca99a8c029ad4 |     
   mips64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/1309c8b45082aa878b15b87ca2ae919e471f85a2 |     
   mipsel    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/beffb334dde2ade0dfe4e4f4469c0da796f5d6e0 |     
 powerpc64   |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/e447679cb197e25a457273ca2e261af73f044e8c |     
   x86_64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/4ab56648677ad43eeeaadaa906b80fead583cc87 |     
    or1k     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/1bf337418b58382effe086fd0fb9fa7716d2dae2 |     
 aarch64_be  |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/85b38abfe4103d0023d690949268c30b7c27a4b1 |     
   s390x     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/6f4230a97d3fb56ca91c2637bc2ffe04cab7202f |     
    i686     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/632f2050892225637862f86e4ab88e2f22476a91 |     
microblazeel |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/b79b5100e79264dcc20a7d5384985b9d811ca401 |     
 microblaze  |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/1c793d976b604c5b1060e9f6a4dca51044285a25 |     
   armeb     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/a8f5fe41fdeb6522c75cc9a7b239dd33a54b0567 |     
   arceb     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/9f31bcd3f0af5b6211bf0c275736fc3acfa74d31 |     
    arc      |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/056c0fdbe10cd1df21cbb723d4ce465842f1612f |     
  mips64el   |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/6ce37874fe09c08e5865f54781c18fcadae0bb44 |     
    i686     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/431819fb7bb93758484699b5931b0d67dc7f990a |     
   x86_64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/d0098451000930ae32ac7e5e9795871dde0c5310 |     
   sh4aeb    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/160b600db783407748b08d0766636b07fa7cd5a6 |     
microblazeel |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/cd6934ddd3f7d00fededb1ec08638cafe5bba99d |     
   arceb     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/3e3f7130d4660ca4aab343477859e0b34e32d40e |     
powerpc64le  |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/4168868703c0a3c9d2749bd7f1329e238d3a032a |     
  sparc64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/b537164d9c0ad6ba17a20dcbea55acd40601534f |     
   nios2     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/1f13c315e665321db292927a9da59ff823f1c4e6 |     
  powerpc    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/66a8449d733d5ab767c5fbf20d8593063ca85cf1 |     
    i686     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/148e53cbf8c1e582eebd7e70811d7a8a5494bb7a |     
    or1k     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/11062ecfea88be48adcc69655f07667fb11a45f8 |     
   xtensa    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/75c941198c754a2b60724e73d9a4ad3e5a26e1c8 |     
  sparc64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/fb484b034be9f2b75ec666e70540f0c2cc101562 |     
    sh4      |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/d5e3149c7a26add8ee0f72d02ccacfbc6d45f420 |     
   arceb     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/dfcf85bc6e4fd96f6311d73ecaccceb4f7b6f319 |     
microblazeel |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/5f81d71c6ae8bd860a2f5832e73cd36f7c27b6fe |     
   mipsel    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/51972f9638f3b2ff261e8bde5bf7ca16ba3beffb |     
   armeb     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/a7d8aa21a167ab21059627686a9a91ed28aa8c32 |     
   nios2     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/541af068d45779e3c91463e34f806e1a354f2c43 |     
   nios2     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/bc1e8e242bc582d5304b62bb3fd808e0737b184a |     
   mips64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/6d5184bf7b535d0dd68bfe87331ce5a6a1317473 |     
  sparc64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/0ad510f93ae0971b3613a3beb5e3c2306b620f01 |     
  sparc64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/d8ed24cb1459c80b6770b93a23c0c6cae8b7cf55 |     
powerpc64le  |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/51ec183f582dd8561328e963be03507faad888a3 |     
    sh4a     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/1f82299d8bd23440361b684b03ac104d6fd2fba6 |     
  mips64el   |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/596d7c95e3d34f7212bf4070c297e00901aa78a1 |     
  aarch64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/ae22365cc03f8012f2b9594f9573e0c6e8d4418c |     
    i686     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/8842acaf14f6c229c5ce4685eb45524e7842e363 |     
  aarch64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/376af5f41121f01cc85d6513d7d33c97c5e8e095 |     
   s390x     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/900227c5f6512db59c60882d853aae235795acb9 |     
   mipsel    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/125ffacd3924e5de3052508723bf090a4fb94176 |     
   armeb     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/9e89f26251a04906fa09ab30f74be56c88614d54 |     
    i686     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/311c0273c01fd56a0e09e8379a549bee7a786ee8 |     
   nios2     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/55673ae07f1dfc8659c27ff7cc0f2128c3ba244f |     
  sparc64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/d8f8a436c8e5ea47a47eddd0222fd6f7b7c8387f |     
   sparc     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/ba771907834ccf9c07e7826eac04075eeac51cd7 |     
    arm      |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/b71847205db2cc1343ec4c21fa5dec9b3cf4881d | ORPH
   s390x     |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/89d6b7573b99c611dbb5e991bf5bce60b4e3af51 | ORPH
   x86_64    |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/af053b7d32eea373a972872b43ea1dcbd4c22a50 | ORPH
  riscv32    |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/e78c9aebb4a742933b3c6260db9afd9602118cf1 | ORPH
powerpc64le  |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/40b55caeca5291e6a36005fe57a9aa4cd6ea0be5 | ORPH
  aarch64    |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/08ebb6c3dd5e21ad6c4d552a777d8b9885c95bad | ORPH
   arceb     |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/2453f7c5a4072565d623acae71715328ef4da3c5 | ORPH
   xtensa    |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/3ce1e319386a39569f65b0f5c20587998a80e997 | ORPH
    arc      |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/db58336d28c0f91d65fa38329820a7982cf32ab7 | ORPH
 powerpc64   |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/3de8b884f88d6d5c167a280e51b32e8711996d89 | ORPH
 microblaze  |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/ed08a847261fd116dc29397c817b9786a9645bce | ORPH
powerpc64le  | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/0eaa0992526fb8157624b2af975ae83e2999d8b1 |     
  sparc64    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/275c9b822decc5fc8a35ed398575c185a078dc47 |     
   s390x     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/f06cb21f76621a963def4e4fe04ea4a16828abd6 |     
  sparc64    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/f0fafddaea39eed4ffd8753d3ebad1f9a0c159ad |     
    mips     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/9cb100d7f35796a333dfa4889e93898e96300306 |     
microblazeel | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/45c9caffe528685287359417b2b682f3f741a934 |     
   arceb     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/634dbaaedb525b5add10a4e64982e24e50b95a6b |     
  riscv32    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/ecee6206e067a09b83d67f1711e4628b1d342074 |     
    sh4      | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/cc390e3f7082e152a5cc1d453a5d09ac526a653a |     
   s390x     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/7c7cd0f9ce23cf0ebee208a438c9bd02140804b7 |     
  riscv64    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/072941c6e28dd32c33f34c32fcfd42122066883a |     
  powerpc    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/63a8ffdb8d5c325283aec7ae96c8b4627b7963b8 |     
   nios2     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/741e38822b6b0fb087f09479e1d9abe4ad9d1a0a |     
    m68k     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/1c9208f2849117dcc817746da801972c90848b04 |     
    or1k     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/81eaab46c1acc6ecbc83c99718e5438797de8e36 |     
   s390x     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/86c1763cee12c70ffac73c209ddfe078c5f98462 |     
microblazeel | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/c9678af46d3fa7538e2e26d0129de2e333a3cdf5 |     
  sparc64    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/8a283cf224485a0c2953ab1b2e1c3a2286b8360b |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/df23d9c7247bd9add82149b73fd94c67c540c289 |     
   sparc     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e9a6cdb903e460524f3ba856d18c2678f9094920 |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/755bd874cab684b75543640181193be5a4a20b62 |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/61a412572d0bec83687474216c4061a6b2498dd0 |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/76885839dffa540e5bcfb4bb60ed5297c803961a |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/20dc75c86219950baaea944bff88b6bb1f9a1f10 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/c87c539d2f9779a2010984379e75479798e67bc6 |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/c27f6f80b2679cc95007cf4c367286e5385ced42 |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/8be4c4908584bd06a6722b23e90f1d4b6178f03c |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/dcb42e040f7085d8cf23741d2f354c73a5e8cba6 |     
   sh4aeb    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/8ca883591c27aea86a7a9b7006786b475d2f8aa5 |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/75fb7febafb01cc13e03046e1f2bcbf8e1787ddb |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/809772167b93182ee4167df6a839db9d0bd6b35d |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/bcbc545dbae0092eeb1f1194a6f7b74e8d1abc47 |     
   xtensa    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/389e889f2615694f9bd884aa02d202dddd6e08a0 |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/49dcb3ca95f581b9d589577284ad95f20af93dcc |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/1b7bf0c4740022e9dd265fa69397dca785b87261 |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/c4d2396d084bb517f45f67924e0442aaa5b59c4d |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/33b2e8bd771eb69b476a9d5465ceee1c7287cbab |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/2fadc6802888913b36c80a85003fc53cd1e93af7 |     
  aarch64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/5188f1737c6a2df042748531c1f1b5d524a9980b |     
   sh4aeb    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/560c4f17a1556943685c1bd4b73ee40c167fcde2 |     
    arc      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ffd4bc4c606b329dbbfdd18b48b3485b0fe2176c |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/fe8738728e38648b5be52d23bd5afa053dcadc4e |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/947762d86a314269330342d965465376ab344071 |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/0ec3f41425b728a7391ca449606b6e8f18a34da4 |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f855d00f9e7b5fe533c7da006a143d63cd9adfce |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3e687a09ad2fdaaae1c1be0abc2366276cd5cbbe |     
    sh4a     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/d65a5245d1b74cd5cfca581efefb916fd255b4cc |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ac7c926273f003c14ea11efe6cb3e55ec7988208 |     
  riscv32    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f4e03275acdf6bc32fd1f50ade9a893e167ae574 |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/8db56fb2d22cba5f513c30f94aed4638ae89e50f |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/52efb30647fd0d0164cc8e7fad3d8de29d894479 |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/295c8571b7434a26c37c3389f852c35432d13171 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/9fe0d1a345a2b2c2a2a32290f5b58286e1679d6d |     
  riscv64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/0f42ec8a89a7ab17db15a56ee16fdc1a312b53bb |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ea6883425486aeea04c091d93ec37b735a33fa37 |     
   sparc     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ebb1bd9c6a780d2afa4c2053210b294703287ade |     
    m68k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/613ef2e4d7d27d6f290aa99acc6ad4b9b73a530a |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/4776ca973d1bd9368b5d589e6fbeef3c82571ca1 |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/152964785bb349931592fb9ba35ab70d8cc21525 |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ff6baa5a8a74300df44206a7efc6815e230dde5f |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/cefd2e920b9002e50696a344f7ffe9696aa83aa6 |     
  aarch64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/20e0884f70528aed7922ef6620fe3d46e194303d |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b6fef0d2541c991b261847204af3d7080d3cdc4e |     
    sh4a     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/c554dac7bdbf633ba57165ed8c56cd33d95f4a37 |     
    arc      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/c82ca050edabe8d012af23b50ce1d0c60d6c66ec |     
    arm      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/47967d62a93614b223a7e2b393b2e946b51e9192 |     
   sparc     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f2cbb009be44e3e6aa419819e57bbd5d8b82e8a9 |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/6c7af46ed48026384b2322322b23b816e4d3d631 |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/367b3db7129b380585fd180dc03d9d8493589f0d |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/2a4c5cec142fa0eced8d5593a3d29a7e4a273b19 |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/d8bd8e196941acd0ef2d357b5cdb3ed3f582dfdf |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/29c31f47317342ea9033aa94c0223b1ddb40ec15 |     
    arm      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/de1d896c3426fb70e2a986c8d6917690de0e8476 |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/4dbbc8395c4cd1d037e2249426a7b605b2ebf073 |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/081404bce00d8b6000990cb360bdad2006268924 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/748e4c5e3257080c9aed92e709fa8af5eac5e58a |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/d8c065561cd4535149179ba402585735d30e31ef |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b3a35f738be399b0885e3566337c2c2ace04b28b |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ea125218f767b8767e97925ab856f088539f0bdf |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/cd471d624fdda3655ea38a06c319f8c595765a3c |     
  aarch64    |       host-clang-15.0.3        | NOK | http://autobuild.buildroot.net/results/7aaf4904f8f26e81e5bd653a0dfd8031554309de |     
  riscv64    |       host-clang-15.0.3        | NOK | http://autobuild.buildroot.net/results/3a61dd671c55b621f3fc3664fba19688afa47d61 |     
  aarch64    |       host-clang-15.0.3        | NOK | http://autobuild.buildroot.net/results/2fae87c35b55ec437cf392acf5a353df86353064 |     
   armeb     |       host-clang-15.0.3        | NOK | http://autobuild.buildroot.net/results/a45fd20a70a01fe58096299fcb6c0fd214c1a984 |     
powerpc64le  |     host-gcc-final-14.1.0      | NOK | http://autobuild.buildroot.net/results/427f2c57464a3880e82d57e4e619304df7edebba |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/82477bb36b8ce121b27a0582bcf6130601a86f8b |     
   mips64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/6d9bc31e949cea9d232b82290cc3c14bc0427356 |     
   mips64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/915b0bbe1ffddff2c00048edf5e16d8c4fcef937 |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/8bf47f1151fd793b3be521251188b28b2330efb5 |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/b9ad63bbd530ece802b5871cd0a49cbd6b80f718 |     
  mips64el   |          host-go-src           | NOK | http://autobuild.buildroot.net/results/494860ca9367825a5bba419cd4f2a783a56c3956 |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/78f87aa314d720e247f8399195347e2cbfb39e6e |     
    arm      |          host-go-src           | NOK | http://autobuild.buildroot.net/results/b9d361541f3007ca38b6eb4fc63edcfcf29be71b |     
   mips64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/01e778bec84b68dae41d78e376232c56d868fa4a |     
  mips64el   |        host-grpc-1.51.1        | NOK | http://autobuild.buildroot.net/results/507ef937159c81f4d1c2ab105993b13f4da57859 |     
   s390x     |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.net/results/a97ef49b2329337aa46b6ba10f4591ce9f5bedae |     
   mips64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/2afef322b101d5e13c3bdacc1a2bb0a469ee3b80 | ORPH
  riscv32    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/1291427f1861a5dac367de0cdcc776037917586c | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/dfd4ca9a909efd8302980dcac2c205c5b00177f3 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/fb320a073052de7e91e3459f83ed9853136fb226 | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ee57d4a5643af24eb3dfda744efd8e2720b71baa | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d81f212831330ce2740d19ea625aac3a3357ce27 | ORPH
   arceb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b1ef1817c8788a24e3a983b3754d292c48ec43ac | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ab364c005195b1e1afcddbd44f6442c614a65852 | ORPH
  riscv64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f81e5c2b5d3bc3e46c1f2de9508cdab7fd127f5d | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/bfb99468ee1d91776a5efb97c47fa3207627715d | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/552e851ac2500799714cbd7ac3e809f97cd7d963 | ORPH
    sh4      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9e2d68608ccc8a5b912bba2174cc684c615cecf4 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ae8dbbe556752e2df929e52ea583d61cffb00b67 | ORPH
   mips64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f26cccc04e2895d89b97c348d7bed9245f342afe | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/33b2f2e5dbd2361ad41df016862376ad308ff804 | ORPH
   arceb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/8f6e25d21bcce27c4371e5494b08c6f25f6c7326 | ORPH
   armeb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/2fb6b674d54557069c89b05ddd6c6c8c8ed39aa3 | ORPH
   sparc     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/14e432c08a682644bce4a9e4a88f1b154de8200d | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b6354a1ae6662dd8ccd969f093c221e2ed7e97f6 | ORPH
   arceb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0bc5fccac21b5e5db1e03c1a88a1ba155864f408 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3a0b6c6b242b605adb67e9bffe781c01c01b1093 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/49bdff35761efdf1abf59a1296d952209b216899 | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/6260ff009ae183828fada1b942784c4eca731066 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/57e8d97ac94ce5c59405006130d0a7c33f876c70 | ORPH
    arc      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b5423c3b09ccaa33406fc6e79f3ad3f38c428c31 | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3157dee9330d89518ba648ab8320eac2caa0e94e | ORPH
    sh4a     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/80c031e034746db612747cdadcc7a9c3233b8eca | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/bbba91fdb0ce02705a84b3fbb723b2c65e0bd15b | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/79394edbbeabd666ecf5372641a137670f5cc60a | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/98c1077d068e05b3d6d63adc293c85ada47967e4 | ORPH
    sh4a     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/2cc239741b399ffe08b90c494ed5fd0939a5fda9 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4cebc53a272c658dbd34c502cb92ba51c71c66a6 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b6c35021577fe9b648555662a8a78e0e4d3b4f99 | ORPH
  riscv32    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e8de9b479daab3729fcff962832428b651f14741 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/7c2dd4df23050e4fc6c212ecb4c6b20b0ce1bfbf | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c23c566ce52c0c46c28ba144df26582e13a25028 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/47b7450108d450493da9519b0769d88a187feb59 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/66ac0f52fa242a20a3a5e700847a71e43e8ecd33 | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d8a40bf1d7fcccdb16ff3fce040a56ecdae41a04 | ORPH
    m68k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/29c186c986b87b454eae00a0718eaa1623d56382 | ORPH
   arceb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/08851374f14d663aa8951d4ec86a84d704b97575 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b76a1c6c2fd1bc6470260aac20d0b744d5120f0a | ORPH
   sh4aeb    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/87d05bd3fe952e12d33c6693b94621678b0a84b2 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f27bcbc17c9cce79aeb31e7151ef3770c6676c78 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3cc83283c2c736da9b95570693ae762a0031d700 | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/755e456c68a4a5e6e11a151d2cb93b8703607667 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/8050dba831fae5e41eb9e369ab1a5ba352104e72 | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/fdcce48b46cf80184abb3472c4ea0ca3695c064f | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/983abb1a9fa57f7a1f225bbeff8cda7075b28519 | ORPH
   sh4eb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/2ea0b30d5de5b3d6e67e6e893ead3cb4ef3c300b | ORPH
   sparc     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/46821ca1cfbed28ead28be4a2f5733d7314e00d2 | ORPH
  powerpc    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ad7a52729dc68026e512e9ac6ecee5fffe21c9d4 | ORPH
 aarch64_be  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/6631606f6e7d3fbc705cd2568c0018d3a1fdaeb2 | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9e359725df90a0231bf53cc298183727db8fbecb | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/11a0d994fb5250535e44248f4bc2b339584a249b | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/deb260aa081026df38e22185d9f3d58d329d8593 | ORPH
    m68k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9b5a9170cf7d15ebae67e66f62f65227c1333d8a | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/89fcc56581e49c347b6d9d58ad93a05386965215 | ORPH
    arm      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/dd5aeb9414a9227bf2ac17f0a75777c413f6d40f | ORPH
 aarch64_be  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/65105c462a72621e5c0fb97f7968f1b18da500f7 | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/5eeae2ddca53aef48c82a0fadcacd1f6354b8b49 | ORPH
    m68k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/7184d2929799f5afd91874fd7cb46c5da6fbd94e | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/90c85ed1ebf5e5951eaf4f3afcd8106581953a2b | ORPH
    arm      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/db56dc1995f7eef21c75c1e2976a386ddfc9d644 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/472acc6e6fbf4731e33c82ce37aa758afc5240e0 | ORPH
 aarch64_be  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b3d639cb8026f2767e06778acafa13bb2b223e72 | ORPH
    arm      | host-riscv-isa-sim-00dfa28c... | NOK | http://autobuild.buildroot.net/results/fa675e317bd45fbc68568e430b0a76e1632ad382 |     
microblazeel | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/e732b603e55acf536783430c0e11b36bc4893cac |     
 aarch64_be  | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/46085db2b96f0991655b12ea76ea857f3b1adcb7 |     
   mipsel    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/ea171fa94831df8aa26fc5736e0274d5d9b8d667 |     
powerpc64le  |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/e31c4483e954ff00e816001d964c9711fd6b10cd |     
 aarch64_be  |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/dc74ca23d69b5975841532ceef982d583bc47b18 |     
powerpc64le  |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/dafdc658cbe5b15f635422d7d7d9aa64d26dc7c6 |     
    arm      |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/59d8c7b22b9176f20c6ad3a2f0b8b33161e6e556 |     
powerpc64le  |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/9988528434141f30e19b7ae9f95b44ee5157375d |     
   arceb     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/7544306e93dc70b19a9154594216aa17ad9cc1b3 |     
    arm      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/4631e466eb151577c5278bbcd5f459c806ebb709 |     
    or1k     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/079bef99fb2c8c1830de38f0cfbdef528dd1b489 |     
    arc      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/d076221786812256a2e69a605eb6f6caa7561fd2 |     
   s390x     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/6c404c122249e20d638d95b3e5d3525794ec03fd |     
   x86_64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/580d230692577f31b69070be7d5885f3365690ec |     
  mips64el   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/6173c14581973d5cd9093b0264f18bca69475507 |     
    arm      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/3166f38415ea8308e020dded9cbceae2e40f48de |     
    arc      |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/e9c5db9d3cea95f620cfebb18e52c02ce25ad952 |     
   sparc     |      janus-gateway-1.1.2       | NOK | http://autobuild.buildroot.net/results/74089acd23223ebb2df546e80e718208e282c189 |     
    i686     |      janus-gateway-1.1.2       | NOK | http://autobuild.buildroot.net/results/161e53e431647d3c7b6a67f3e0825f9284af3216 |     
    sh4      |      janus-gateway-1.1.2       | NOK | http://autobuild.buildroot.net/results/280b98d400e8739b8fe767df0bcf64adbb268b98 |     
    i686     |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/dd89a8e558a4c2b138cd3fd78e7cd622b6f83d91 |     
   s390x     |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/589666df137cc12f0a1a3eb44134075abc157763 |     
    m68k     |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/cda5b6336841e5328d85c763043d962ffdbcc48a |     
    i686     |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/5119fc73d8d55936691f432c1cbd724457720840 |     
  sparc64    |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/ef207a4f5208f7b714d34e56f3c89219290fff2e |     
  sparc64    |       libblockdev-3.1.1        | NOK | http://autobuild.buildroot.net/results/4569fc656e1342e27c10ddd56d1ad7b08f315009 |     
 aarch64_be  |       libblockdev-3.1.1        | NOK | http://autobuild.buildroot.net/results/df54118cc7057ba8dd566515281b77c49a596a04 |     
  mips64el   |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/e53680355b471e9e7bf952880965483093d73283 |     
 aarch64_be  |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/8950a4c1b065f76c71a9459252ff42f3bce80e42 |     
    mips     |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/c6f71c827bb7e9c54d1935c1c6988bdb2da8b498 |     
   x86_64    |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/e53d95ff644ea89f2c9cf3f0feb18e1133937b11 |     
   x86_64    |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/0b30057c6c373ce23c8c42556b9f2b772736f46d |     
   mipsel    |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/2d0432557cbff3e6553081ca2874de3a456425a7 |     
  sparc64    |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/9769e1f80a4e9a051757b8620a8d5137d68fe818 |     
    sh4a     |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/4b950540f03e216d887bcf1a988e42d7eab90aa5 |     
powerpc64le  |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/a01b9c521e51e91c6aeeb06e6b9ffe3dac3a2227 |     
  sparc64    |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/33817c4c5b9c3f0bca27c7b418bbed9106d60fff |     
microblazeel |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/cc516e49f0ca9cefcc72be9309e153bbaf828bc1 |     
  sparc64    |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/bddf9aec1f48e94c49fa3bd5ae762d316670c23e |     
   sh4eb     | libdbi-drivers-0bfae6c43134... | NOK | http://autobuild.buildroot.net/results/fe73e21304ac2a62afa2fec0f3e614cea7ce824b |     
   sparc     |         libdrm-2.4.121         | NOK | http://autobuild.buildroot.net/results/d39f56bfa42c472ebeb4e491b3bd0ab49187523c |     
   sh4aeb    |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/dc3168b97d323550f30a8913ef8e02bea84804b8 | ORPH
  sparc64    |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/e9337ba89fc54d4199ff6f06e588f5ec867bf12d | ORPH
  sparc64    |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/ff16e65e0d79993e62063abeeb19656e8e315063 | ORPH
    arm      |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/4fac12933214f24a96b9a93d0376e191f4a3e43a | ORPH
    mips     |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/c71b44902130333b3d957665024cc0e3deda719b | ORPH
   nios2     |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/aef96ca816e2f7ec91b6b74ab1afd94ca681e050 | ORPH
 aarch64_be  |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/81e5b874776ed3a484088a9dcf32e69266105c49 | ORPH
   s390x     |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/c0a9f0c68968fdb72e41cc0ae689f4a7b9331f95 | ORPH
   s390x     |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/1f62a1436311116ed461d716638ff258d1c7c2c3 | ORPH
    sh4a     |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/077bd3ba20196b961db223267168196834bbed85 | ORPH
   sparc     |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/ef249bb748d991d1f0e48e02da86d0d5fc7ff970 | ORPH
   mips64    |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/139c7ed4d4654cd89e30b77a31b96ce30173b8df | ORPH
    or1k     |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/c701ca56123709f8133e3400f7bddc0f164f4ee8 | ORPH
  mips64el   |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/76ac9e2e19c92f5821c5794e7868d4b50c31bdea | ORPH
 powerpc64   |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/8aa3b8caf763c2a4fe0fa695bb3d27e768bd3be7 | ORPH
 powerpc64   |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/fbc33d9fc231cf3980ed924578ae233d9b21dc7d | ORPH
powerpc64le  |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/06234254076bdf2f8e8f6de951258ba9603cf1cf | ORPH
 microblaze  |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/c46f6d2faf5b01a778d33b57bbb1b6b85e0cfd0b | ORPH
  powerpc    |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/cfe18dd531070de96c70cb91d93c43819cb6d84d | ORPH
   mipsel    |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/b04141a7ba3c164f2687ebb303a7107fd35d5a0a | ORPH
   mipsel    |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/20da488477fd98b31feffa38957ee1dac80f264c | ORPH
 aarch64_be  |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/0157e5094c4c2844ba9d84654be155041da3f246 | ORPH
    or1k     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/c59f7b0edd33dddc82302979a76bee322c9bdc40 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/aa7dca891802459654bf9c1a3637009fecaf4119 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/3bd05b90e117f76650ba6bf931ac4629c37075be |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/6f33f03ddfb456bdbca1afd1f6e0f098b6335032 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/f1d8994f56a55d106864b83812eb21a6f296235f |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/107c8c962f3f4f9dfd8eb0380cee770c561b9b07 |     
   mips64    |       libfreefare-0.4.0        | NOK | http://autobuild.buildroot.net/results/2c5333a71e8305d893cc65e9ed94be96c76dd657 |     
    i586     |       libfreefare-0.4.0        | NOK | http://autobuild.buildroot.net/results/8431b6dcbc2f022fd7f98ed9ad9496a87d9db2a0 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/e9fa098d80e9edc06d0288a1385ac9c3aa66a100 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/273ce6c034d91b83211c0648e71b64f3c454df20 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/c687dbb14ea795d3f61a5d23d0424cd6922839a6 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/e4450956708f73d46f3748368fdef80cb9252693 |     
  riscv64    |       libgpg-error-1.49        | NOK | http://autobuild.buildroot.net/results/66b668c3d06fdb472c7dffd70f503e900a022fcb | ORPH
   sparc     |         libhid-0.2.16          | NOK | http://autobuild.buildroot.net/results/9442b3a62bedbb05a9482a5a594dad5977eff375 | ORPH
    or1k     |         libhid-0.2.16          | NOK | http://autobuild.buildroot.net/results/117dcfa987b884e49c1a41f2dc7267a64cb53b25 | ORPH
   s390x     |         libhid-0.2.16          | NOK | http://autobuild.buildroot.net/results/1330cc123b88aa1ca2fda7fc0103fd015dbeae9d | ORPH
 aarch64_be  |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/b45d734f74d4858af0ba074b43ab9eb131a7db21 | ORPH
    arm      |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/4363f1bf80b782033ef232f26dfe9336a52746ea | ORPH
   nios2     |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/914c634baa747365e407d490c5201a6f24d94c0d | ORPH
   sh4eb     |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/7e2b6d7e686b59e0f1bbab0ce3997dd56c88b4e7 | ORPH
   mipsel    |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/0679eb84fe8f19eb7a8211def915b93276a149f9 | ORPH
 aarch64_be  |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/ec3b16553e32723cc1045b4ff56606eae3186684 | ORPH
microblazeel |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/33a9fcfbb2f162e8043aa2f0aa466a6ccd69a267 | ORPH
   sparc     |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/774e019fef4e818f9d0c96b6bcbbd99fe0f1e9ee | ORPH
   armeb     |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/e6dc5d5d6dbb688407d6a35cfe52d9d1f5223e72 | ORPH
   x86_64    |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/e8bf42731bee00a44cd13996af42b80cc462a71c | ORPH
  powerpc    |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/0127e01e6c9eab39c55374f43066f125f5499804 | ORPH
   nios2     |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/4f0a1db32ce8b6b3a614af84051eafe149823352 | ORPH
  aarch64    |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/31acc9a79a0a4652ca2c5aa2688f1caf002f039f | ORPH
    or1k     |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/f369eb221bb8234f1b059d5e86a1fa6bb042e43f | ORPH
  riscv64    |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/b9f3d855fbdb062968a495909f96a98b67ee66df | ORPH
  mips64el   |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/48ec22ad032f10825fadc06b00ec5841014dadde | ORPH
    arm      |          libnfs-5.0.3          | NOK | http://autobuild.buildroot.net/results/04ce2cc2828aae25f6caf7c799793de77429f2ed | ORPH
    or1k     |          libnfs-5.0.3          | NOK | http://autobuild.buildroot.net/results/e327ea12e1978e4a45a7435a37ac7f15d8992f40 | ORPH
   s390x     |          libnfs-5.0.3          | NOK | http://autobuild.buildroot.net/results/0d94e25be6aeef8b99fe83d09794c280a5b782eb | ORPH
    arc      |          libnfs-5.0.3          | NOK | http://autobuild.buildroot.net/results/f3f57802aee326f07851c1bf31c646ea58f34a28 | ORPH
   arceb     |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/abc4706cabf9f0b92b2a268882efd5a5b4e317a2 | ORPH
microblazeel |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/13647a36bbae79c11a5561adf1989bfb816f2642 | ORPH
    or1k     |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/997cd6eca3fdf08e19de1ace51bf65f5536b6330 | ORPH
   x86_64    |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/c713329080fd8172ba5d3452d271f147e7958168 | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/8b36de6526e935daf1164c4205f14a54404c7684 | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/1eeabef8cf713a532402fa1059af313b03587761 | ORPH
   xtensa    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/6579b6413231d60cba03b203393ab165ce78fc02 | ORPH
powerpc64le  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/0c863a106a2dfa2def502ba362f6450264b64d41 | ORPH
    m68k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/c9e406999499d2cd01061d4f8f897f548dc6a8b1 | ORPH
    sh4      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/fe66fe7b05e4f79b37e76087f788b1efb8dcbd41 | ORPH
  powerpc    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/f7526672d105f48f7a65df0f81ab474b8ad96336 | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/4ff7924c89014b99038eaa46eb340d43f79a261b | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/2aa98ba5ab29f53503dd262334a7daa7ff5a8df9 | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/e0f119e85a6887f248a64c8b523ab9e626852c43 | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/165782586056c89371abb08ffd49de5b94eac318 | ORPH
powerpc64le  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/8e6e93a931597a8865bc2edd340d6205c349c565 | ORPH
    m68k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/59c8cb55be8b87f02ffb5322c62df3dca6bf3d1e | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/95097bfcbf7cc8b1fc09e985b405ddae53ae25d9 | ORPH
   sh4eb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/9b272be7b96530ec89d07af43e58a3ec59aa097d | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/a388bb92e669a15ab2305cd5d2c52d92da3778fe | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/841528eb8bf84548e140ab1b938adf83b3cec34e | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/c08831fc73939e7c5bced97d75026ad9ab5ff6cc | ORPH
 powerpc64   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/d4d73cc4fbfc54543f50d7c28740c04a0e620338 | ORPH
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/a8539cf1869790cb28846f9a64728dd46e92e0f7 | ORPH
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/27dbc6e88caf178a73cafda051c42baee689abed | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/834ec1a4935732c98dd281ac833ca25b89c62d6f | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/d0133f09cc96c33610060a102890b1254facb659 | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/891b87553e92ce6f4b1a37ef15f78aaddd3a5501 | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/a2f8529c91b54a6d2d25589f0de017062bedad39 | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/2c243e1aa8ad928079900adbac287db0aea2e6ff | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/f2b779cb4e4537785745ead454297e0c035ec343 | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/c230bb6f0015edd279ce7a51be3e8ccecde0e3e6 | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/3ef0af020892e854db5bc8a48cbeba3346494d54 | ORPH
    arm      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/973bbb2f34cae9b419d8fd218f51fa4900a55830 | ORPH
   sh4eb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/83aa7e962dc086cb883f76dd1b5aa27c3ec6fa55 | ORPH
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/08ef3c391d93f44a7351c78fde4f5af1236e538c |     
powerpc64le  |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/6993329b6d28154606c72fef752eb1e28f186a1e |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/53d4a0babaf2c25007a30843a285ce973b0d899b |     
  sparc64    |         libsoup-2.74.3         | NOK | http://autobuild.buildroot.net/results/c66f3111c9137a9a89d0c35f402d70d1e8a1b23e |     
    or1k     |         libsoup-2.74.3         | NOK | http://autobuild.buildroot.net/results/883dbe497e220dc8d04310da579e9538cfad6bf5 |     
    m68k     |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/aaf7e164976238b876bbbb47c261669842963a86 | ORPH
   arceb     |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/7b6fd84cf3bed6d6c8287284eab1a4c3d2917e0f | ORPH
    i686     |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/609faf711071bfac41105de65644e45870856ecc | ORPH
  sparc64    |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/49694e9d69db68d9d7f44aa2b13f79ad31c3e951 | ORPH
  aarch64    |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/64db2dd47d2a39d351c2735b7f2b36f8019c3ef2 | ORPH
    or1k     |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/778e6bcce4b820aab56c1d0feed525cbee2bf97b | ORPH
  powerpc    |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/a301892e8656f24571b8d6398e9cb26723555da0 | ORPH
   s390x     |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/c77ade531b356eca542641ad11e2fe9b6e7b721e | ORPH
  sparc64    |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/35228bffe8844619487a0f0d99b123bf140b8d76 | ORPH
powerpc64le  |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/548af4f6ef3fafdad5f5f0004f7c0d93bf282a30 | ORPH
    sh4      |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/1cef5a58346b358887ad4890581de8742a3474ec | ORPH
   armeb     |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/3bff4e41660e72d723cef0a7ad9abbd24099d8b8 | ORPH
    arm      |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/b04840f60a85261f7b0624556643fd66ae087b96 | ORPH
    arm      |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/e9a75ec8acd2eadfad176d883c283fa326da5982 | ORPH
   armeb     |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/568a6c0d80be6a00eecbe54fa300b97f01630357 | ORPH
  aarch64    |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/0b4a84e9ceabd45646ffdfb8ba8ac473a757cb2c | ORPH
    arm      |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/de68415ef19ef34523dfb1b7b62501f13013a572 | ORPH
    or1k     |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/e11952f6c5aa09a95ac991feffb527f35bfa2c83 | ORPH
    arm      |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/7ddd4aa98a7c0cda92dc0e58c26aab6022cf1ad5 | ORPH
    arc      |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/8a3d65f58123577e7fd57471260bba4486264683 | ORPH
   mips64    |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/405493c403163324835389182f90e992f9cba233 | ORPH
   s390x     |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/c3640c162c453ad3cf22bbaa2fb6320a0f2ffe09 | ORPH
   sparc     |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/81db1aa66d0413efc3b6243fc700937f89a4d71c | ORPH
 aarch64_be  |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/b2ca3d6de428304913080d0105af5e1cc2f0b168 | ORPH
 powerpc64   |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/f6191e2b726afa786433221ce021b0936b359819 | ORPH
powerpc64le  |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/327b2c4e2289783d4f65f456600095f1c428f942 | ORPH
    m68k     |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/2d17e1dec25959e173ddb501486883559d3fcf01 | ORPH
   nios2     |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/98d31b1d73733670c8a98009639b80967a7b7ce8 | ORPH
   s390x     |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/8743b6702745ce57a009a5ab65b07a94720762a9 | ORPH
   sparc     |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/76135ca19510f8d7b84a6d574659d8406116ccaf |     
    arc      |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/a713363f015aa265ae4a90c5f5c6b1a66fd66ec7 |     
    mips     |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/95aaae32a466626a8b4f55ecc49a2577a69a5c89 |     
    arc      |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/6302428e376376770e9e2390d51f3a87a7dd92ac |     
  powerpc    |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/11b05652493928dfbf1444b859d0adaed07154ff |     
    or1k     |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/a7207139ba9e36e8d7744266e40d2ace6283ef6f |     
powerpc64le  |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/53611bcde86d705545d2910a45666ee59e183d1f |     
    mips     |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/7c742d6648284ef76e5406620be459fbb2277332 |     
    arm      |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/da3b82ae8bd124d0b58c72175d476d887de29d3c |     
   arceb     |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/7616399a07734685dd8f858404a8a578b9f8884f |     
  riscv32    |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/dfcbf18e6d16de3406d9a6ebe1356a32e13484ad |     
   nios2     | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/668b1ebd785e1468d5960e766cd80e6fdd6ab8ea | ORPH
  riscv64    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/9201a0f2530f350d54c40af60d1ca1da48212c1f | ORPH
  riscv32    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/b3e031e6548ea0f5af7d0786b4a868e8e1fdc32c | ORPH
    mips     | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/f1e0052e2b28ac096458d165d3f7295a13be225f | ORPH
 powerpc64   | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/21b78e3ea451721748ec7fd0da1feefa3289b7c1 | ORPH
  aarch64    |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/f952a175c5f01ba6a9ce475a4dbce146a207e4a6 | ORPH
   xtensa    |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/e97e0ae4d2149febbcdf01b9870c825616925837 | ORPH
 powerpc64   |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/2f3e2ce23de1b1e7b2f6098dbb14e8fe5e9da3b5 | ORPH
   x86_64    |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/1591995f59ce7511763430fb86fb6f127ad25eb0 | ORPH
  riscv64    |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/fb0dbb9dcdcfc8e7037e6db7c41b25c5cf4b99a4 | ORPH
   sh4aeb    |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/af9040e493eb32f4d56db0c293aa37cece7739f0 | ORPH
    arm      |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/c87c1f00f0ea3e739cee411036a59e4b42939cae | ORPH
microblazeel |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/34f0c42e5255346f2ed73ec83c3936061300555c | ORPH
   mipsel    |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/5bdca7ac71dd7fc745557fdd88d310be746cc1fb | ORPH
   mipsel    |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/74423673c2b4c16e7942adf91a1a11205ef7d732 | ORPH
   xtensa    |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/fea049cdd2c19fbcad11abbe181a8c2b0a94ff52 | ORPH
    or1k     |          libva-2.22.0          | NOK | http://autobuild.buildroot.net/results/541891929995a1fdb52b7d0b5ab95530092ec648 |     
  mips64el   |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/766cd5a409b5c7f50c4b99255039f448f1fe1d47 |     
  mips64el   |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/b5cff8f1aee73caf9f09cd523eb20de45c1af2a0 |     
   mips64    |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/64f070781f3647bf9aa14499b7c36ea9a06e9b80 |     
   sparc     |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/b10f46ef3874aa439c9b846352cc84814b242130 | ORPH
    m68k     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/f2e35050b687103ca1d6bc9a7e3faa98334ad0e1 | ORPH
    m68k     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/438099b63c0746e184c8f24b9f26a97a6bf9caae | ORPH
  mips64el   |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/a7026a2857e7120c334c4f757b883bb86782e0e7 | ORPH
   mipsel    |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/a606ccb81e65209bdff8acd0d5aad03e56245b37 | ORPH
   mips64    |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/46ed2e273bf55a25bec6386f462f206c7cbe175d | ORPH
   mipsel    |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/a92359c909b173f0ebd4aaa0aa71cd5981b876e3 | ORPH
    mips     |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/4fd8bf7e222ab73582f2c7de9bdcb6b55e793b09 | ORPH
  mips64el   |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/3275faac135f2ef407c7ce1a6f4cbc58c7055ad1 | ORPH
    i686     | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.net/results/cb974404dcca183694ce2172f9be2c5ad953dbc7 | ORPH
   xtensa    | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/8ccaf6af9839b30c13fc44e49bb6f4b8886dbe8c |     
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/0a281cb0aa036265658c04dc542b4b40189ba98b | ORPH
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/341ad36e30b3766b88272bcce3dafc34907720c5 | ORPH
   mips64    |          memstat-1.0           | NOK | http://autobuild.buildroot.net/results/a0c33f36ca44c880e61f92ac27d505b6318f0430 | ORPH
   arceb     |          memstat-1.0           | NOK | http://autobuild.buildroot.net/results/fe4710eeaf6b7df5f5c1925d34a437f08d1813e8 | ORPH
   sh4eb     |          memstat-1.0           | NOK | http://autobuild.buildroot.net/results/06ad720baec225f4ea825f014720b773fe023725 | ORPH
    arc      |          memstat-1.0           | NOK | http://autobuild.buildroot.net/results/83ca79bed5c99bdc52b3eb92dff42276306176fa | ORPH
   arceb     |          memstat-1.0           | NOK | http://autobuild.buildroot.net/results/295a555475f9b373d688fa5253a6ddb07c9f9550 | ORPH
    arm      |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/881ab042fdf9758bef60e600eaa593d561524c15 |     
   x86_64    |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/5de5dfcfd35cc37afea69da7b839b5506bce51b1 |     
   sparc     |        mongrel2-1.13.0         | NOK | http://autobuild.buildroot.net/results/5ec5e54f732fe64649228d4b0ce527a040658ee9 |     
   xtensa    |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/3c1b3c1731dbb2f36f3835f62c18bb8bad053ce0 |     
   nios2     |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/47ce86956b40a2b961409c6a1559a431aa89c8cb |     
    mips     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/df38ccfe0fcfbda86212630986f59c37369889ab |     
    mips     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/55c8a4062308d7065daf8740f9d1cf8f4fed2d53 |     
powerpc64le  |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/250979d214f88a873da9f3d3ff0d333dc368d022 |     
    arm      |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/99f2325f1fba23cbc54056cb09b2325c4303b7ea |     
    mips     |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/bd3888aa397aba0846ee94fbbcc179c307d6a46c |     
  riscv64    |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/97d8a5b1b6f860636dbaa022091863e4c680a6e3 |     
  riscv64    |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/530c7e2ee2fe89f3c43101ea93d1492e282b08ec |     
   s390x     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/75f1c15eda7692bfd18b0c8b6d31adfdce731fbc | ORPH
powerpc64le  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/82b030b45629661e654fe7f63cba3e860fad026f | ORPH
 aarch64_be  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/2e234aa96dc5f8e15110dfceee84bf5ad15168f5 | ORPH
  sparc64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/191fc2a990855a39fe14d875fc165ffeeec16ee3 | ORPH
    arc      |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/53829f6eae29f887c3094d9c6839120f69e6e663 |     
    arc      |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/fd4a521f2a97756ba86dd0f6645827de08a5507e |     
   arceb     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/5ad1c425d613e5fd87d9a17813a1d4f7fc158bd7 |     
  mips64el   |        openblas-0.3.27         | NOK | http://autobuild.buildroot.net/results/de17e90c2807e1d7c592f493737cedc904374c04 |     
 powerpc64   |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/60d2096137fa3b1b8e3a965ebe5ec33d6a6a4d86 | ORPH
    mips     |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/35ef1de97ff8281671037a013fff799aa3061fc9 | ORPH
  mips64el   |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/0615643cf3cb4134f65122fa7caea3b8bbe2c2d5 | ORPH
  sparc64    |         paxtest-0.9.15         | NOK | http://autobuild.buildroot.net/results/59efafc8b195c13592ad952d1522a585f4c9c917 | ORPH
   arceb     |        pcsc-lite-2.1.0         | NOK | http://autobuild.buildroot.net/results/c93422f283134e1fa59b0be13fe40fbb616635ac | ORPH
    arm      |            poke-3.0            | NOK | http://autobuild.buildroot.net/results/ace4a0efffb66dcebf873a2baa33b5edfe670093 | ORPH
  sparc64    | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/5a189c4e7cbcd67ad6d168b286fd05d8b3261f2b |     
  sparc64    |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/9ffad182e16c681a3f37d7c0c5611393fb1fc671 |     
   mips64    |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/cd3bf998529f821faf0db945c71337167ec94e67 |     
   mips64    |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/2ad28f568ff5e9a0cc5cc751121b9ab71eebb384 |     
  sparc64    |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/f93b02b55e7525f73efed688db360fc9832668e7 |     
  sparc64    |        quotatool-1.6.2         | NOK | http://autobuild.buildroot.net/results/4866913f1daa3cf7076609f31c0c0e173c43ec5c | ORPH
 powerpc64   |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/387dfd42611119e2a14490e67effb41f8bcb103f |     
   x86_64    |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/1eb7abc12d2b01e5a771d4064ad88b471670c630 |     
   arceb     |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/113da90df42feb367ff55d2aa709cbb249de4a96 |     
    mips     |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/42d3ffa439722487cc8705598f36e83588e5d9b2 |     
   s390x     |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/0f7bf414ba9a8a18f9b74afe961683e20ef91b74 |     
 microblaze  |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/784ccee0fab85a9d5f107db196acd3b7fa7d3417 |     
 aarch64_be  |          rauc-1.11.3           | NOK | http://autobuild.buildroot.net/results/682a4fb0781591650620acfc59dab3dc507db4f7 |     
   mips64    |          redis-7.2.5           | NOK | http://autobuild.buildroot.net/results/5d421a549b7a46982ee811b5438f36abfd41ec7d |     
 microblaze  |          redis-7.2.5           | NOK | http://autobuild.buildroot.net/results/b2a9e7d762fc0f15a7b65230ec7c16665a27166b |     
  aarch64    |          redis-7.2.5           | NOK | http://autobuild.buildroot.net/results/6e80fb0c54b05b6d9b0cf3006407733b4ac4d532 |     
    arm      |          redis-7.2.5           | NOK | http://autobuild.buildroot.net/results/8d765d6417bc812d3da40bc09163fc7396149a2f |     
   armeb     |          redis-7.2.5           | NOK | http://autobuild.buildroot.net/results/2493e94ae505b3b994075f880151340e9791f01d |     
    i686     |          rt-tests-2.7          | NOK | http://autobuild.buildroot.net/results/5c3fa44ec36f89e3a814b8d7804e99b1592962fa |     
  aarch64    |          rt-tests-2.7          | NOK | http://autobuild.buildroot.net/results/3e0a3b8d8c42d8e82ecf47b80bca875de739af5b |     
   armeb     |         s6-dns-2.3.7.1         | NOK | http://autobuild.buildroot.net/results/a8f8d88c1075973de8b9d0f9acd33c5e7f0347f6 |     
   armeb     |      sane-backends-1.1.1       | NOK | http://autobuild.buildroot.net/results/6721d87aa9381f1b621975a075db004654b234bc |     
   s390x     |      sane-backends-1.1.1       | NOK | http://autobuild.buildroot.net/results/aa9a4140dce1ade0fa682b7f7000c1ff310264a1 |     
 microblaze  | sconeserver-8d1935919a20133... | NOK | http://autobuild.buildroot.net/results/f528629afa479e42cd7d9c1b94606044ac347512 |     
 powerpc64   | sdl_mixer-d1725fcb7c4e987ae... | NOK | http://autobuild.buildroot.net/results/fb957ff87920e379e7ae0c34a81354fba2cb7c97 | ORPH
    arm      | sdl_mixer-d1725fcb7c4e987ae... | NOK | http://autobuild.buildroot.net/results/09f7d930772039d6a82b9021dd06e44946b6a19a | ORPH
    m68k     | sdl_mixer-d1725fcb7c4e987ae... | NOK | http://autobuild.buildroot.net/results/1f4addd4a72a16a6421ee6a91df94ce53214852e | ORPH
microblazeel | sdl_mixer-d1725fcb7c4e987ae... | NOK | http://autobuild.buildroot.net/results/1dd9056242fbf284c70d771adf113ea3e8d89c91 | ORPH
    m68k     | sdl_mixer-d1725fcb7c4e987ae... | NOK | http://autobuild.buildroot.net/results/23003186053efcc9426ce36e5da8c4d4afaaccb2 | ORPH
   x86_64    | sdl_mixer-d1725fcb7c4e987ae... | NOK | http://autobuild.buildroot.net/results/7d83cb2d2278311a2634eb363b11b29d165c1beb | ORPH
    or1k     |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/ac8fa18f3203996aa980c812386b36899c1dad02 |     
  mips64el   | tftpd-b2b34cecc8cbc18ff6f1f... | NOK | http://autobuild.buildroot.net/results/e7462659be56d40e5c9a3c40acc2a77238de3991 | ORPH
  mips64el   |           tiff-4.6.0           | NOK | http://autobuild.buildroot.net/results/f30928fb04fdf181232ad51ba07942562a4cd88f | ORPH
   x86_64    |         unbound-1.19.1         | NOK | http://autobuild.buildroot.net/results/1ef7bc024a49be204abadf7f0ae26142e5c6ed3a |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/966c73e1a5a053cf2c57dd7c9f04f39cd83adb40 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/c7c97d4d6f9f6017fc48899130528484c357a950 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/370376b9cdc91b76da1fc0268acdf76ac4b0b159 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/2e0358bbd526d8d779f1fbddc816d2c7b7c38ff3 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/8db15b824e0effdfb1d01aa53bd4e8cf3c5a9538 |     
    i686     |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/7f13cafc8a4bcc5c6870988d01adef5519cc4fb0 | ORPH
 aarch64_be  |           vtun-3.0.4           | NOK | http://autobuild.buildroot.net/results/1fe23a9fda40c86530e5a9c98885b750c3aed84f | ORPH
    arc      |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/e0fdefe2112bbff9d92be395bc8d7f4b035cac50 | ORPH
  powerpc    |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/6aa6c4afd97a5db8ead9f78a59b5986d3a51d6e2 | ORPH
   xtensa    |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/eebb29286c2ecc52b1c5ec9bddecd5d0c42acecf | ORPH
 powerpc64   |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/0b9580dceb63149037c001111621a307a61155bd | ORPH
   s390x     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/81a8c1b2c14b0d9c01017d8811d6c359d51df023 | ORPH
    i686     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/49f579a72f818eded4066c47147835ca12125d76 | ORPH
    or1k     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/5e16035ebd58695908b26d8ae392c38b0e7b2888 | ORPH
   s390x     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/32933a62622ac8a057e38bb39b440c8ae42e15b3 | ORPH
 microblaze  |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/7196e1dcd3d1339b33981d670ea444856ae80fd8 | ORPH
    arm      |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/99ddd9f907bfa60c1fe464361923764b3daf71bd | ORPH
   x86_64    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/5a7521628a376cb98392850800ff3e6a7ac582be | ORPH
    arm      |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/d0f1f41aab5c9e7f17ffdf4ce1e74c296af21a97 | ORPH
 microblaze  |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/d19834af49b6d50718e829cc424ad4041c92f68c | ORPH
   armeb     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/250add469d89a221a6b2959e4ccc5560e84d1d1c | ORPH
 aarch64_be  |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/18f8e6a57a3c63175f05c0f76d90f0922d579efa | ORPH
   mipsel    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/70cff6a1fa33c183358d162bc60168e280545aed | ORPH
   armeb     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/c6c0f5c91978d3be0c3c1b9bfd13f252641cd95a | ORPH
 powerpc64   |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/90011e5bb272d797614e93fb37b37194560f1d74 | ORPH
   nios2     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/001dbad8c325bd4b8fc1ba2d6f6640509cc3d8e9 | ORPH
   xtensa    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/01eb1f9f589c286aa7121dacb5066aa92e1d06f8 | ORPH
 aarch64_be  |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/6678c395780ec993b9379928dfd7b8b804268ad2 | ORPH
 powerpc64   |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/4b89adcf8711d88a51a7e273ea914a32f58cdd3b | ORPH
   mips64    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/47481fc3eca64c78de2a3a6fb362a5b915b880ac | ORPH
   arceb     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/7b96ae7dbbb1ffe91c2403c721a4bb10fd9d67a4 | ORPH
  aarch64    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/136c97becdf2ad6ff36ea44991b33269bb42227c | ORPH
  powerpc    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/9a5c9c2daf0d02c76f069765d6f99ec7ff7ad27b | ORPH
  riscv64    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/a47a77b2318bb283cd1b2d07469e14e98fcd7994 | ORPH
   sparc     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/0d94f08bb1648b6c8238f3eeddbafc7d201f3e74 | ORPH
   sparc     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/3abb82cc22ca28e6397c80ebe813c7edef551dca | ORPH
   mips64    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/44614a9fb4d216f679fb82a78c83c3cc4e549b42 | ORPH
    i686     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/9071af54d7282cd054053c928f2468b7fef03f5d | ORPH
   sparc     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/8ca1613041dbe43aae1115b029a64d81c8f2571c | ORPH
    mips     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/cc65f9dcd556e4ca484edd12651c324747ec23f5 | ORPH
   sh4eb     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/eeee4a04d33ecabbb21e084dc6c3b5d8cd6ad6e2 | ORPH
   s390x     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/8e0bf5cf64520e55885d773c8f83655f346e93f2 | ORPH
 aarch64_be  |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/6242f24029fa7b60a35878f0157ae137ae034ade | ORPH
    mips     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/46e3245e7f594e6c8f9411c5f8ea61a14f95cede | ORPH
powerpc64le  |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/58247d3d0b809172c38215e1afde093f37b1997a | ORPH
 microblaze  |           ympd-1.3.0           | NOK | http://autobuild.buildroot.net/results/6040df1b5499b497516d897346e7667900ecb4ef |     
   s390x     |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/e722157bbe05ff01432d2074a19374b89d5fbc1f |     
   x86_64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/4044731b0c370d0a34b25fb015bc306b76f5c619 |     
microblazeel |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/694cf90b02683c67428d060274d6702e04393a9a |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/f1350154a7e6e2855a90cc67b5b894a3dc405995 |     
    sh4      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/49d70b27aa14c324a4010a1f388336dcf7691007 |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/6a876f1af4d11198ed268d11dabfe761fd91afb4 |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/e16a5445a44b75a0fe2cbe3d8c50700739a6763f |     
 microblaze  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/c21ebe0cf9d8fb410989fe0b54547851124f03b2 |     
    arc      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/4f7021bb155b7f592b4abe0cbb788afb5a81ad19 |     
    i686     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/41f8df7785a9f444529939ba9b3f2cb0ec297eb9 |     
    or1k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/ae51713035a5f806a8475dff1009519f5c969a70 |     
    or1k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/192202d5fa029be453fa5cf56a7da8960a52d7c6 |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/cf9271937d63e127c06e2797d5ae6ce959f4c155 |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/ec841ed41b47da597dff28417ca50286094fb219 |     
    i686     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/cdc3440bfae4ca724ef3adf333f8dad8b8226f47 |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/6928aedf84a8f6bf4f23225fd7229ff942570cb1 |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/dab2991fd2ca648e3107fe05a90e3fac454c4551 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/95489febda2aac7d853c70c9946ec24b2cbc693b |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/17cae8cb70b71229a41e46de4f50c7a81b139e98 |     
   s390x     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/75e36515ddc3bbc065d06c955fd11baadacdd3af |     
    sh4      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/09904daea9e5daa315c027dd1b704ef8fbde24ab |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/fab54e147bf0a05dc7f48e2575f705c7e79d01be |     
   s390x     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/0cda564231ad34b9ceddbd30235429ce1e312bfc |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/6868468971bf6d8a969c74b932da2f613eea51e7 |     
    or1k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/31430bd1707dd9af8b525b2f4cb147fe30cfd251 |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/61d24d425771973777e0db2f1da3a925d968578c |     
  riscv64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/1bb3ea19fda9fa29440e6aeedebd56352df2b969 |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/e87c9592ebcdf00230733a7169144a8d33d75c6e |     
    i686     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/a14c2ce6899a9b7a11472f01081b02fadc48919a |     
    arc      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/581ae1165d40209610a624563006f6f30025b886 |     
  powerpc    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/0606cc7cd2a7c1478f1a0e70965a9305e0f1ccf5 |     
   armeb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/2e619ade40de4c2aa7fba5c25bee829231d3e179 |     
   xtensa    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/665592e54c07e1cce87694fd367d7d35372123c8 |     
   arceb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/f23f4c647080299636c79e926d4c9213f765801d |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/ae7fafeb7c9ea13b846a379a0ea4ca79d07f722e |     
    m68k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/4cc5e4b1677c70883fc1d73b64124b774f58699b |     
 microblaze  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/a74782f817681a6012f9acde5ea1d5825bb9e952 |     
  powerpc    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/035ada21865df14efad0ad1a100f71679bdb0427 |     
    m68k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/f25187bd6e9dc14866509f94af9065a9e02afa8e |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/c0c833ca82c2c8ae95e4ae1db194e616f659bc3f |     
    or1k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/a55f1abd6cfc89dc56cf3f2d22f0a0280ba44c0a |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/8a0e8739a7b30643806db1d23985ce18f627d497 |     
    or1k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/3309f4efcff671a1529427ca9065bd718c052755 |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/41b1bc981ab44d6e9ca739139284725d36c3bd6b |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/5d111011e511220a002dde3c40dad83f86b09cb8 |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/8183e15df0f7568bbd5497dff4ba4bcf1afcde86 |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/410146ececbdcbbc5ae933bf41b129d9181c8128 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/65ec5a94e9acb4887bb228aef4760f25a006aa17 |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/9264f8ea8e9a7cde6ce5f4f21a6ad895636ea210 |     
   mips64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/fa6b1f79186297c855b80a7c93c6b05947e2c8b7 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/41bf7a1e140f0e5d6cfbbc98475920655c32339b |     
   s390x     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/c8f0c4f90167f0429e7180fd06393d648fff434d |     
    sh4      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/fa302cba2f4b7ea2c8db60d1d8dced3055ad476a |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/da2ddb4846507b5a8412c6bad08b1ed65e37f787 |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/5b9bee67a40a2ca1972041b220d22961df541030 |     
  mips64el   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/cc6f29d15abe3517d836a637e83fb7fc7bbdd6a2 |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/81bbd2cfea9c50ad893a4251bc70e89c3b93789c |     
   nios2     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/39f8a89fccbf7c7d2b4dd3e81cccdfcb80ef7f9a |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/99f5782101346425874c5600333f69ff86c1ca53 |     
   sh4eb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/b59c835a02b1f7645b719c59162616ea32b00bef |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/cf66e92fa3fe1bb269858a3976bad7ca09f6fb5a |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/bb43b9273c305458ac60ab73c4335aa8191aaa0e |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/741b6cc2fe6ccd121515c741ce063a5aeab1a5e5 |     
    arc      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/7d2d7564f2b7fcdfae0b8ffbb0ec7e5ad80b03b3 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/88f5af1adfc4639c72ee8f9c1e0059c1fc4bb0ae |     
   sparc     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/294b78b43f21a6079f1b9142ef118c6f4edb5c1e |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/dbb105fb160177c268b95957b67b377efdc29dde |     
   s390x     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/c0566e1938f97567c0e51ac841ed31d15fc1cc77 |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/dd21eb1b354d3cd9816723042bb84d2f99bb022e |     
    sh4      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/ed23475deabfb4c8018c54cb0e2b1f3e4a9bf67f |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/a6914389e1b2620a49bedd77160f35862885ade4 |     
    i686     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/56cf19ca733d5c4a6f545cea1f962d89bdb4a608 |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/edb07a987ac7c2252321e9c4a13c7397a1f010aa |     
   mips64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/ff9eead9ac29f8efa5d7f0d2d72ec4fb58fa46c8 |     
    sh4a     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/33e4e645bd60070c600aafa33b2b7dd2d11bb8fb |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/725459ca4e9066981c96d51b3ed4928b2e91de64 |     
 microblaze  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/448b42dbbb2f1af0bcd140c0db11e775c9028b41 |     
    sh4      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/79e900b5a63e8cfba8d6f8bfb127904977208405 |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/dd6819d9c01d72ec7eeb51bef87d138b60228135 |     
   mips64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/fd7689451905e24470152f3e55f6850d39d784fc |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/1a592f7837d5b72762350c498031fad89b23e733 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                    bat-0.24.0 | 1 
                 coreutils-9.3 | 1 
                   duma-2.5.21 | 1 
          libcamera-apps-1.2.1 | 1 
                libressl-3.8.4 | 1 
                    proj-9.3.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/f9e6fab1541ed403a042fc84f2ac9dbddeb16ea4 |     
    i686     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/a7c670c276557e03cbdc8aeea7aa8b985acbe091 | ORPH
    or1k     |          duma-2.5.21           | NOK | http://autobuild.buildroot.net/results/4dabf5ad427cfd8cb05d80ac073a5e316112fe9a | ORPH
  sparc64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/4859cc6b1e6ad9a33364668a9696d2a86ec91c81 |     
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/2d9f821cbc888a701bfcc8c5992c960c064e2e71 | ORPH
  sparc64    |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/b6b648fe092b963fde3b3ca18d6f45c58b005d90 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                libressl-3.8.4 | 2 
                    zeek-4.1.1 | 2 
aer-inject-9bd5e2c7886fca72... | 1 
                  libsepol-3.6 | 1 
ltrace-82c66409c7a93ca6ad2e... | 1 
         python-remi-2022.7.27 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/ae4640e6b36ada8ae2b0ee3f6aeab11836317772 | ORPH
powerpc64le  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/a21d9260909d5aba574790e38557b769ce77f9d5 | ORPH
powerpc64le  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/984518b3622f0a9635cab6f77419ce8611c2be99 | ORPH
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/cd88af7147d75932b37f865a381c94ec38492f17 |     
   x86_64    | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.net/results/e89cb6f36d472cbd16b62386ffdcdc65fe80ad29 | ORPH
   xtensa    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/d496f109d26dd017da70f26e0b8057827f027d60 |     
    arm      |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/e06983e9c51353901c24f17656add718392787af |     
    or1k     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/17dda2398d6357e5ebd1950dbd4c2d69eaa92e2d |     


Gitlab CI results for 2024-07-01
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
      TestClangCompilerRT | https://gitlab.com/buildroot.org/buildroot/-/jobs/7229845204  | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/7229846525  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/7229846529  | ORPH 
             TestGnuradio | https://gitlab.com/buildroot.org/buildroot/-/jobs/7229845294  | ORPH 
             TestLuaLgdbm | https://gitlab.com/buildroot.org/buildroot/-/jobs/7229845441  | ORPH 
                 TestLuvi | https://gitlab.com/buildroot.org/buildroot/-/jobs/7229845508  | ORPH 
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/7229845520  | ORPH 
               TestMender | https://gitlab.com/buildroot.org/buildroot/-/jobs/7229845541  | ORPH 
                   TestNu | https://gitlab.com/buildroot.org/buildroot/-/jobs/7229845580  | ORPH 
     TestPythonPy3Fastapi | https://gitlab.com/buildroot.org/buildroot/-/jobs/7229845746  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/7229845868  | ORPH 
         TestPythonPybind | https://gitlab.com/buildroot.org/buildroot/-/jobs/7229845829  | ORPH 
                TestRedis | https://gitlab.com/buildroot.org/buildroot/-/jobs/7229845913  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/7229844792  | ORPH 
         TestS6Networking | https://gitlab.com/buildroot.org/buildroot/-/jobs/7229845933  | ORPH 
      TestS6PortableUtils | https://gitlab.com/buildroot.org/buildroot/-/jobs/7229845939  | ORPH 
               TestWeston | https://gitlab.com/buildroot.org/buildroot/-/jobs/7229845995  | ORPH 
               TestZchunk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7229846008  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/7229846024  | ORPH 
                 TestZstd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7229846033  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
