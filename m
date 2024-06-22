Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EEADC27C53
	for <buildroot@archiver.kernel.org>; Sat, 22 Jun 2024 04:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BACBA84304;
	Sat, 22 Jun 2024 04:51:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8I99xXdZy3Pq; Sat, 22 Jun 2024 04:51:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A1B0842A6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A1B0842A6;
	Sat, 22 Jun 2024 04:51:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F06EE1BF298
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 04:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2B40403A2
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 04:51:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aSl-tqyoGP7K for <buildroot@lists.busybox.net>;
 Sat, 22 Jun 2024 04:51:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B63DF40105
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B63DF40105
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B63DF40105
 for <buildroot@buildroot.org>; Sat, 22 Jun 2024 04:51:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 685382000B
 for <buildroot@buildroot.org>; Sat, 22 Jun 2024 04:51:02 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 22 Jun 2024 04:51:02 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1719031862; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tWSOfiS3TKnJCebMlPYKxiSXoxwqVsXqRVG93qlkyvc=;
 b=hzrjPhlJNx4tX+B48uD34jg2tbP/ewl+zOhNCsXbrB+VhXUCazGxSItpvR+Nr9DgizXedd
 H1Rd27BsgmG6Px6kj/8TWjzRGU8KTmhpBehQqwr+KTPTrTz6H3Csw4cMc8ww4qjYL5hSbc
 A7pfXPh5eYm0RlTaMqslbjLTYj0En9WYFYc3k0i04XqnJc56Ee4r7oMY7qBMNZm9BSyTTm
 7h+KQ5+bwtrdbKDaWLBqfuVBUyPzXATeKtRWAc6v80wXYC9tLxg0tF+E4EVF0vDBHmBZhA
 wCAIXPG83XNJA8fyNRdJO07Et1zxTPOv50Uy/P3NQ8oiuVvZXRcZeU2h1UFAnw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hzrjPhlJ
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-06-21
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
Message-ID: <20240622045102.0XF9Ryg0NT99ipPq7vDOZv-txmsI80Ai4z-lt5QBpVw@z>

Hello,

Autobuild statistics for 2024-06-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  | 12  |  5  |  0  | 17  |
  2024.05.x  |  7  | 12  |  0  | 19  |
    master   | 173 | 542 |  1  | 716 |

Classification of failures by reason for master
-----------------------------------------------

                    zstd-1.5.6 | 74
host-prelink-cross-a853a5d7... | 59
            host-cdrkit-1.1.11 | 53
                libressl-3.8.4 | 23
                    mpir-3.0.0 | 18
                   host-go-src | 16
      host-riscv-isa-sim-1.1.0 | 15
glibc-2.39-74-g198632a05f6c... | 14
host-android-tools-4.2.2+gi... | 14
host-vboot-utils-bbdd62f9b0... | 13
                elfutils-0.189 | 12
aer-inject-9bd5e2c7886fca72... | 11
                host-odb-2.4.0 | 11
ibm-sw-tpm2-5452af422edeff7... | 11
                  ffmpeg-6.1.1 | 10
                fail2ban-1.0.2 | 9 
                  libffi-3.4.6 | 7 
                   linux-6.9.4 | 7 
                  bcusdk-0.0.5 | 6 
                       unknown | 6 
             util-linux-2.39.3 | 6 
android-tools-4.2.2+git2013... | 5 
host-heimdal-f4faaeaba371ff... | 5 
              libarchive-3.7.4 | 5 
               libglib2-2.76.1 | 5 
                 uclibc-1.0.48 | 5 
check-11970a7e112dfe243a2e6... | 4 
 host-softether-4.30-9700-beta | 4 
               ipmitool-1_8_19 | 4 
              libopenssl-3.3.1 | 4 
                    attr-2.5.2 | 3 
aubio-152d6819b360c2e7b379e... | 3 
               freeipmi-1.6.14 | 3 
                gnu-efi-3.0.18 | 3 
          libcamera-apps-1.2.1 | 3 
               mariadb-10.11.6 | 3 
                s6-dns-2.3.7.1 | 3 
                    zeek-4.1.1 | 3 
                 apache-2.4.59 | 2 
                  assimp-5.3.1 | 2 
                    brltty-6.6 | 2 
                   bzip2-1.0.8 | 2 
                    fcft-3.1.6 | 2 
                    frotz-2.54 | 2 
  gobject-introspection-1.76.1 | 2 
          linux-5.10.162-cip24 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                 pixman-0.42.2 | 2 
           python-numpy-1.25.0 | 2 
                acpitool-0.5.1 | 1 
                apr-util-1.6.3 | 1 
                 augeas-1.12.0 | 1 
                  bind-9.16.48 | 1 
  binutils-arc-2023.09-release | 1 
                   bird-2.0.12 | 1 
                  bitcoin-26.0 | 1 
                   botan-3.3.0 | 1 
brcm-patchram-plus-95b7b691... | 1 
                  cairo-1.17.4 | 1 
                 coreutils-9.3 | 1 
                   cpuload-0.3 | 1 
               cracklib-2.9.11 | 1 
           crucible-2023.11.02 | 1 
cwiid-fadf11e89b579bcc0336a... | 1 
                 dc3dd-7.2.641 | 1 
                 dtbocfg-0.1.0 | 1 
dvb-apps-3d43b280298c39a67d... | 1 
                 erlang-26.0.2 | 1 
                   exim-4.97.1 | 1 
              fftw-quad-3.3.10 | 1 
                     file-5.45 | 1 
                   foot-1.16.2 | 1 
                  gamin-0.1.10 | 1 
            gdk-pixbuf-2.42.10 | 1 
                 gnuplot-6.0.0 | 1 
                 hddtemp-0.4.3 | 1 
                 highway-1.1.0 | 1 
         host-gcc-final-14.1.0 | 1 
         host-libxcrypt-4.4.36 | 1 
              host-rust-1.74.1 | 1 
                iproute2-6.9.0 | 1 
                  kexec-2.0.28 | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
                  ledmon-1.0.0 | 1 
      libabseil-cpp-20230802.1 | 1 
                libcuefile-475 | 1 
libdill-32d0e8b733416208e04... | 1 
                libdrm-2.4.120 | 1 
               lighttpd-1.4.76 | 1 
                   linux-tools | 1 
                 logsurfer-1.8 | 1 
        ltp-testsuite-20240129 | 1 
mali-driver-d40c57d81c9cf4b... | 1 
                memtest86-6.20 | 1 
                mongodb-4.2.18 | 1 
                  ntp-4.2.8p18 | 1 
                openntpd-6.8p1 | 1 
                openobex-1.7.2 | 1 
                 openssh-9.7p1 | 1 
                openswan-3.0.0 | 1 
pppd-e1266c76d1ad39f98f1167... | 1 
                rocksdb-6.20.3 | 1 
rtl8188eu-306f3e62cf7cddf8c... | 1 
rtl8189es-eb51e021b0e1b6f94... | 1 
                    rtty-8.1.0 | 1 
                 tbb-2021.11.0 | 1 
tftpd-b2b34cecc8cbc18ff6f1f... | 1 
                tinifier-3.4.0 | 1 
uemacs-1cdcf9df881440497501... | 1 
             zynaddsubfx-3.0.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         acpitool-0.5.1         | NOK | http://autobuild.buildroot.net/results/5235d7035f00a15eaa11d33d766349d534c4d644 |     
    sh4      | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/79eded0b74d0fe51c51b51dc32ecbca2f3314f39 | ORPH
microblazeel | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/11b416521639883d55c539b07e579e8c615c6ecb | ORPH
    arm      | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/de9901419c363d06d190a75f93049113bcc37add | ORPH
   mips64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/4040cbdd0a5f7df07fa4ea0d7fe2772da038eb37 | ORPH
   s390x     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/e2ee88db92f69b1e168233d8ab72ddd6cced893d | ORPH
    m68k     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/bd67efdac8f9999918f0d95eea747a115860857f | ORPH
   armeb     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/5e80cc5a976d81204edf415ddd08b1d50624ad19 | ORPH
   mipsel    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/7ed57781dbb09156c022e4d4a269305e0789abe1 | ORPH
   sh4eb     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/7c8bfa69c25ed50f5f839e64283eeeb37c66ab7b | ORPH
 powerpc64   | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/e21ca37cbefbd4aac7e2dc7df541d130bacdc61c | ORPH
   x86_64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/9e98b821f443106a48691aecd07475bf5569d382 | ORPH
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/1dcc65ab5dfae8542268ffb37d9b6196078fc9d4 |     
    mips     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/710b7d17c2099ec7691fd8ae80c0414d2f8aed86 |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/be69595652eccc8f596976468b8568f668f32e29 |     
   arceb     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/0c0f5059c32fe4d9c71cf071ef59bbe8c6805c47 |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/87b7069dc58cc9b129151315678f8b8b0a9f79ec |     
powerpc64le  |         apache-2.4.59          | NOK | http://autobuild.buildroot.net/results/7b77db52e8282df8b88a1ba8918739fe30ba6070 |     
   s390x     |         apache-2.4.59          | NOK | http://autobuild.buildroot.net/results/ad885750eb6dc73c52b74c70d07cf40936b7de1c |     
powerpc64le  |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/c627cfcf0d02a6259d8cb82fd2c6cdc7bffcf68b |     
    m68k     |          assimp-5.3.1          | NOK | http://autobuild.buildroot.net/results/a0fd61d1c12f07a696d8116c0c585d6407eb7522 | ORPH
    or1k     |          assimp-5.3.1          | NOK | http://autobuild.buildroot.net/results/54ad174c8549f7957b8e1ee2e2c53b54eb0ec3b9 | ORPH
   armeb     |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/b8de238562f41808eae8c2db976a0f3a2a5f1375 |     
    m68k     |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/cd9566c96b43c2c7421cc66e0aa4f7975a467317 |     
  powerpc    |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/b1866126514add836c9e7651556d248532823338 |     
   mips64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.net/results/4b0472cf4e1ce889e52b043aea7c0ac14567fb4a |     
    mips     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.net/results/2548fb75d88a82ab60cdace5977bd57dfcb9abf5 |     
 aarch64_be  | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.net/results/f2bd824fdb768a0c2ef4d3ab8d546bc7d4e48fc3 |     
    sh4a     |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/a861a02f8c832d155604e320249b2db1f894067d | ORPH
   nios2     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/f634ba43391943df37e9f5293e27643a7d88dba6 |     
 aarch64_be  |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/7e8b682222f8da52af373b743da60a6eeb1c79dc |     
    or1k     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/36f5abb7e7d26512c8416a8a1e6ba5959b1223a1 |     
    m68k     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/d78a9cdbd121d8888c2eaa52d67aed5851a57b44 |     
 microblaze  |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/8ef78d6e615b7bec618536a73f58d84964c7e4a6 |     
 microblaze  |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/596b03cd98e4be953cb1c0366f8eed9f04cbf5ce |     
  powerpc    |          bind-9.16.48          | NOK | http://autobuild.buildroot.net/results/1215667ea904d5a71c00b350cc47c532b43ea575 | ORPH
    arc      |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.net/results/1ce87baf4d10bc1b0a72e56b10aa417e8e69408a |     
   x86_64    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/feab8637928d212887c0a43ed23dc40f6f22d8f3 |     
    m68k     |          bitcoin-26.0          | NOK | http://autobuild.buildroot.net/results/9654db9eb65b722ffe54ea97d55ff8d70ce1a6a6 |     
 powerpc64   |          botan-3.3.0           | NOK | http://autobuild.buildroot.net/results/684be9485c501adeec1e762d3fdd85369e4f83f3 | ORPH
 powerpc64   | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/21f73c2e45c5ef393451233284a25b7eb46cda30 |     
microblazeel |           brltty-6.6           | NOK | http://autobuild.buildroot.net/results/2a5453bf31c0c6e26f9d8526eeeebc0e4d46bde3 |     
   mipsel    |           brltty-6.6           | NOK | http://autobuild.buildroot.net/results/cc57ee420600882e12ca27c36c24eb3ad9262d06 |     
  riscv32    |          bzip2-1.0.8           | NOK | http://autobuild.buildroot.net/results/61102ff514b101e0b6da34ebe21a9a1d97fc5c89 | ORPH
  riscv32    |          bzip2-1.0.8           | NOK | http://autobuild.buildroot.net/results/5b7e9d30df4e75278c5c8f394791e4620280e169 | ORPH
   xtensa    |          cairo-1.17.4          | NOK | http://autobuild.buildroot.net/results/115daf7c1ccd249acfe3e9fab65ce711a60ae652 |     
    arc      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/7b55e167caaa61cd8629c7c96f8ce2f36d622d2b | ORPH
   arceb     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/9e982b0c3e35d53a114fc5c87ff342981ca1744f | ORPH
    arc      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/beaa7fe0a0cf8fb0e407de105956d67db95388b4 | ORPH
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/35a8025c416c4d96935bd3661a6f6aec2970a38a | ORPH
    mips     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/a07cf405b418d5782672bc6d77ee7fc79ff18e04 | ORPH
 powerpc64   |          cpuload-0.3           | NOK | http://autobuild.buildroot.net/results/03eedfc175657d4adadf438c035531ca46d93edc |     
    i686     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/3c01e00611cd27d9face3759f7646410a7c1fa8d |     
  riscv64    |      crucible-2023.11.02       | NOK | http://autobuild.buildroot.net/results/713c17d3075c0de5de50c3c78e076db268bd7384 |     
   nios2     | cwiid-fadf11e89b579bcc0336a... | NOK | http://autobuild.buildroot.net/results/8d4dc931f516dbd815ad4cfb7e9155d9881700f8 |     
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/128869bbeb6d6da344d0ef78639657608873941f | ORPH
   mips64    |         dtbocfg-0.1.0          | NOK | http://autobuild.buildroot.net/results/09a19afb9ec2ae7c1efc6748971226dc8fe2b35b |     
   x86_64    | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/f630b10eeb9f1c39f73d002b3f000afc0989debc |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/9342f8f777ce79686db05d6535aac10d152470ed | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/ffdbd43265d8100c671d4328ed8d5d584799edb1 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/ac651f526cd28c973280ac06d6808f3ab5ba42b0 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/6afc643db5137f0499a990d2d7e58386f4cb78fc | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/0f374cdba97524ec821d12134b04636837701066 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/198151511a7ec33eadaa5a29a07d08f1b342773a | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/008595abeb9dc02bf224a67f9e1470bdd59b73c8 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/c66063bea7a537c84150b3dbfc8767cb1d7daf0d | ORPH
   arceb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/d8a4c92c7e3a50cbfd46402dfe27113d789a08b7 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/2e0c6dbe4a6c1a47331d5f15d6eeb3afbd0cee6b | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/5271688e61f65480f00c31f76c64fcf995218c52 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/ce2f414bad20dffdf2829f1dcfe5e4b2046000ea | ORPH
    i586     |         erlang-26.0.2          | NOK | http://autobuild.buildroot.net/results/59eddc170d433740a3e4560c28a569dec72fe3f0 |     
    arm      |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/93e86d5bdaf91564ddd19f996b3c179a11750635 |     
  powerpc    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/c98be053aa8fcef6282e327fb75cbcea2d4d941d |     
  sparc64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/d50ad87437540f4c365cab2451e34317a454a158 |     
   mips64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/dfb106d9e7fad8e12e32b84f0886a4a875be4103 |     
 aarch64_be  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/ad65e0fca4f8a0185a8804035b820d573ebe546b |     
    or1k     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/07fa7edd0a7abc436b2f05b1e0820c6bac081375 |     
  powerpc    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/21eb7bbbd2a017f7af771f18d3beb0590c784185 |     
  mips64el   |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/5aaedc6b5e408657aef6a179babef59b775945ee |     
 aarch64_be  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/c581c2cbca53b7355502963cdae71eca85e454de |     
 aarch64_be  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/2d8d66ddc8458d840bb115bba14a1d32514dc1ed |     
    mips     |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/d69b297437fa6ed3dd374a8efce837b0568cd99f |     
 aarch64_be  |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/ef87affd2143bdb7ab9ebbf43cde445686221ff7 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/04e788bb247ca5edec8307d633b0f88159bfc3fa |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/3cbc063ee56d287b426cfc42cb6ed4952f8b9efa |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/8535458ff8b8ed2aaa5a0a1e81016b40197929b2 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/3d409f52aca0728eb4f38423a482c3d05a378eeb |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/f672682559f54fdd686a12519f2c8b44527d2c20 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/2c7534bdad9fb211a4cb91e95827d5be694292a4 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/8ff144e741eb1fc85d2e88c6445011635aa55771 |     
 aarch64_be  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/3175755f7c3baaeb22595dfc64bdd5670c05f577 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/2be48f081f70317e1c8ac7b0ef21499f7cc90655 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/658fb07d4ddd3c4826e94022b6cd0a58decc12e5 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | http://autobuild.buildroot.net/results/88363159c3e2840af62e51cb5962f9640ab0ca59 | ORPH
  powerpc    |           file-5.45            | NOK | http://autobuild.buildroot.net/results/a1ffee67731f52dcb5766d498eb4a9c2d82eca79 | ORPH
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/7d29354cd9678f075b21416863b9ecd0fa03ca1c |     
 powerpc64   |        freeipmi-1.6.14         | NOK | http://autobuild.buildroot.net/results/2e252466bbae6383929240e7a7291bdb8c0b2420 |     
   sh4aeb    |        freeipmi-1.6.14         | NOK | http://autobuild.buildroot.net/results/df7f49e8ff32b8da646362f1d695c0d692222d2d |     
 powerpc64   |        freeipmi-1.6.14         | NOK | http://autobuild.buildroot.net/results/f4cf324250b996120ab3b265b23c77bbb333df7f |     
   s390x     |           frotz-2.54           | NOK | http://autobuild.buildroot.net/results/04154fe3e1e9568182b7d5ba098a35b7c5478d04 |     
  powerpc    |           frotz-2.54           | NOK | http://autobuild.buildroot.net/results/6104cd47169ecf37321a84650b1ff0fac7736810 |     
 powerpc64   |          gamin-0.1.10          | NOK | http://autobuild.buildroot.net/results/7d1586c02df9f9078551283fc110dd42ca6ff8c1 | ORPH
    or1k     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/047bf6016c61f4c277209c1b37073477d913815b | ORPH
   arceb     | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/41c5ef84bd714e837814b01b832a9aaef830d8ff |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/bb624f30846554180d388298d040c3bebd4a1887 |     
   arceb     | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/38d7123d0c62162592e7c0b752c4de34659c0cae |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/94d661f6d0a84dd1fe585866d853b3fe8e0419bb |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/06287c3df0aaafc3fb92430b1b714caa6d92d281 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/5623bd2b01804bce95c750bd87e3a1b5fe0abffc |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/5f05e1279198e45b1de519a8e332e43c1763bd9e |     
  riscv64    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/3fdfce3a2753d7618bcc4e898e550d98a9f276aa |     
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/6c6e15e73f5c40d23f09b558a87993e95cd2c63f |     
   arceb     | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/9cdf6c3fa8948ea244b2e266fb65f2f73ea62ec7 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/17f97a105d06aaabcad7130ec7d74911bb741b94 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/5c45e22c9bbbe8b9e4febe1d14f0e77d9efa9a1f |     
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/0bc5d49b6d45b55945ccf9c82b58c66449ff0b93 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/b6ad65861c824eb0325b788d4d5eaa1e2cac5862 |     
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/acf0c8927a69dc3d0362cb2015de981adb93b4a8 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/a4d461558018c038334ac4a198bef12afe2e070d |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/a10726640e4a409ced63dabedcf9703a9c051a45 |     
   nios2     |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/a629f87976432e2cd3c4be4087d9fa51dcb7422d |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/b0ec348ec3abe611cbdbb51e834d3230ed19da9e | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/fc3e5628d311c2858ba3b96d98e457633ea7af1f | ORPH
 aarch64_be  |         hddtemp-0.4.3          | NOK | http://autobuild.buildroot.net/results/b316c2104cec8854516e864feb1182d1bbdcbb39 |     
  riscv64    |         highway-1.1.0          | NOK | http://autobuild.buildroot.net/results/f4ab6dcdecb6ca637589b12fbb7e1cd546c439b1 |     
   mipsel    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/425b86c1aeefd66fe4f29d58ce7b1cd59a7c38bf |     
powerpc64le  | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/ba71944fe249369526cf9ecc55f18ab533699482 |     
 aarch64_be  | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/212602b0ba3e8838b32f56506842b0481afa0f50 |     
 aarch64_be  | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/20dd33063a5fe7fa5554d7d7ec74eb633a569ba5 |     
   mipsel    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/e68b222ba623189a8ac35b2e8bebf16a302907da |     
   arceb     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/9c7e385547d2a988af06ce5ff9cce90e380d5f8d |     
   mipsel    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/546f03864ad1fb0b518d33b5ea9e9b64c2dfe1ce |     
   mipsel    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/c108c6def5264d61542c5249b8400fe4bc321db5 |     
    arm      | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/c2ec5e235cd84815ae07e3878032e00a633dffb0 |     
  sparc64    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/5f034c1301f1bf9a3794d9ec30560b49a1fa962c |     
    m68k     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/71a5cf22ef8a876d88ad35905d42b4cf19dc054a |     
   s390x     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/045daf0b8b9ca705efde45f77872b65f38d37779 |     
   armeb     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/566da43690e834ea865c7186133de5609de228d4 |     
 powerpc64   | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/12541faab75431bb01be76d20facd03a6780904c |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/98ca0f52d74cf632d12f5afbbccfc7578402be69 |     
   sh4eb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/5b0132a4d8d3f44811c21d4b666c1e1b4ce85e53 |     
    m68k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/51e5a37479fe9da889a60fc1fabb92777a43f703 |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/589045deca42c181de9472a28dd5e86d641914bc |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b2794b72946f43284a6cecd4eaa6a32061421f03 |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f8fc8c839ecdd91f3adce4fd787cd0f7b563dfd7 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/0c5ca857e7f89e0ad8e934a9203fbb3d7a92a927 |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/c1a5ee5c9bbfd1fe5b9acfcf22a24acf4c0a54ee |     
  aarch64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/0a4f7aa51b12bcd809bdb74904fe209d9e2a727e |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/51cd26bcf8e818ce5f89ce84d0926e7f114b1b88 |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b228fca684950e99224a0dd8da1349dff4a8c9be |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3c65cfa8de3248f21a7d697b236815884258abfb |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/cb64172614f4abe96b563ea0501a6668338c3c0f |     
   sparc     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e409403688bc7b847a9b306ca5117c8ea63368d4 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f3bb985f4480b9c47754e07123b7a4b98a0d98cc |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/cc2d2e817ec8c6c529800acd0f8afa6bae1df68f |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/206c901a848e293246bfc4c97269f96ef9b55611 |     
    m68k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b0895e7e911350820b76164ba249b3580dff4226 |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/30122cc319c00b0ca7ae06a0346a0213aa63e4e3 |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/53c264124bb44de3c0fc4c33c584069fcdd28708 |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b563e11f50ea5a05ddd1777969317103d7931630 |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/91a162348aa60670e7683082c4d146202935e0f8 |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/6d1e357056c3dc3de8409efcb72331fe70e0af4f |     
   sh4aeb    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e57cc09a2459cd2c3d34eb50ab772e514cf452f6 |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/850df1a39c23dd61b196c1dca5717c5e5019fe3d |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/0c24f05061c0ef1d0800253f72e5779446daae62 |     
    arc      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ec6a7d9004bdaa46a16b251e64d0e1ed00217c4a |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/587fd34929026a0371bbc478e9fb0598d5a2a93c |     
  aarch64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/6980dab3360fb0540f24eb0fc247b04548d8d421 |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/d28ea53bdb2f272c0eebef622b0ed854f6af1532 |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/47501e55510821f86eca7129e0cccad353cc3029 |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e81827890b9310c5ba71593c57d509ce85fd0193 |     
   sparc     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/fd17bb26c6fff0345f2fabcee5a2b618e5ff36f7 |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b8534a61b4b61fd5bcbede21173c3826c830d079 |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/25e954c40a0159807799d2bb58cd8fe926a252f2 |     
   xtensa    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/7c2578ec88aae369a0e790b65aa58b0f85a9b046 |     
    arc      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/80beb1eab4fee514e8cade8a084eb9b94dac7ac8 |     
  aarch64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/fc8747524587c8d6c8929d959981a489975110b6 |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f597de793c13d34b4155d935727f4b5d3afe0bf1 |     
    i686     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/2949825a8d61aef616c3eb42b6a366ef21e4bbbb |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/51b3df5106048cc23fd7bb39675cd83376d5a0df |     
   sparc     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/6d812286bfd828d5831bb60ea1bfe0a417b4f08f |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f7e015f5fe92ebdb7e969da5210815b16177b16a |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a1c700ad6f4c609b2e17cac9d703b8e940e52b71 |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/15c847dc84db44efc2eff528439d3585e489985b |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/6dfdd4c5698460318afbf7ccdf6f5abc092b1942 |     
  aarch64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/78a356204a5217ec94c584d196e039b5ea4c8ddc |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/1f10eff2f6a13634a89868369810f12f2d6dca1a |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a648af1e3e5183061e5950ce3d81e5ff62fd6767 |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/8795db1d3941c060a7fb4d463bb5bfacb4452a45 |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/deebf1849bafe963d5ed77928dd78956feab43ea |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/0790621ace717d52ed3ec2569b7446941163b65f |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ef28dc02449fc0806d0df9c24a58fd689e750fa1 |     
powerpc64le  |     host-gcc-final-14.1.0      | NOK | http://autobuild.buildroot.net/results/4c1d06d481134c88cbce1d18b12f61279e828bae |     
  mips64el   |          host-go-src           | NOK | http://autobuild.buildroot.net/results/bdbde0121d5f179c8ebf5560bdbc238000602d44 |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/b85a9a32783926c45d1bf6093642e632db654a1f |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/735ec7ff12aaf78afa5a6e3ace2269c81693fc43 |     
   mips64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/6ab18f2a0df15325f7ea1bbc8855e7223c1e7422 |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/ed01e2ed013be2adc7467104ddddae1d6ccfadc2 |     
   s390x     |          host-go-src           | NOK | http://autobuild.buildroot.net/results/9ab2986a427c4316cdcc28deb9753f79b7c45e79 |     
   mips64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/6a2d4545f2b65313b382be9a495e44666f720a6a |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/b462b2eebc476faf4ac8bde6869c878f2348c79f |     
    i686     |          host-go-src           | NOK | http://autobuild.buildroot.net/results/3ec3dfc6bb3aedd8a313d0e87b686f0d3a3e1b24 |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/3ae83744081d8b85aaa2ccbba9a4a877b181efec |     
   s390x     |          host-go-src           | NOK | http://autobuild.buildroot.net/results/f0838471d017538986416862061444789ca5b317 |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/e61f0e04dc6a657fcc97b3701e152280d0b55b1b |     
  mips64el   |          host-go-src           | NOK | http://autobuild.buildroot.net/results/58e8f7543e35154ae41ffcbab9ebcb266fb27c01 |     
   mips64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/a93742075e6058ce4dab966f48baa165e361fb25 |     
powerpc64le  |          host-go-src           | NOK | http://autobuild.buildroot.net/results/15d794ad59f4826f008cf19f379f93b136665216 |     
    arm      |          host-go-src           | NOK | http://autobuild.buildroot.net/results/bef7a1c1e574d8c505e0353b8b04822e1c7b514c |     
  riscv32    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/d5a8278c23a66f2de7ccb5c1ba579072893cad07 | ORPH
 microblaze  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/5171e37cce9e8ae292d5ea2187f18a9e7d37bc89 | ORPH
   arceb     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/f1b48013d33e7f12bd8c19aaa4f34591a9d9b7aa | ORPH
    or1k     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/dc676cb89ffc19c37e5ebb0e219fa0a1b61943ce | ORPH
    or1k     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/fbb3408945883a86f934d336efdb61d3c75b6e82 | ORPH
    i686     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/8a835ff6b271e289ab93a59088d5507db1d59e6e |     
  powerpc    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/9f086bb56f93711d0b0f5398e7985e81dbd7b0c7 | ORPH
   mips64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/5dcc3e4ff485ff26987b11e4d72e2b68f3b2bdd2 | ORPH
powerpc64le  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/165569f376b9d2ee18d1c9db4415b6709a328cef | ORPH
   arceb     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/de988cedbb5ef1786d10a846e41ae8f02fe05283 | ORPH
  aarch64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/5b8b4d5a3ea24fecba9861d7abd63cb20f87ea92 | ORPH
   x86_64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/66ac3d40b439cb8e50a199e6557046cd4590019d | ORPH
  riscv64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/d13910fed99bac17ab240503d892591eca29ab8d | ORPH
   xtensa    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/5089f56e13696571412b781137da8fb3ee806d58 | ORPH
    sh4a     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/aaa107ece8138cdbac312e377bb1c3d718d8e4e3 | ORPH
   mipsel    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/c3a12ff4e18fa8851075383970253a0bf41ba31f | ORPH
 powerpc64   |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/c82908463d63f4fd38511f0463598542525890b4 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/5b4d440d197d12a3b6bd266a9be47ab8d698d247 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/fc6f456f71e15949f56ba6dbafbf255e8e37c039 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/1ece0a2b55280e7eceed5b0383798f7d91e3709f | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9e8dcbfa9edd464bd194133c79c6de88f93b3d6e | ORPH
    m68k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f3bd45a03c2fe49ed6b8ecf442fe0aaa19cad60a | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/64c674cb1ed81c3ca0d1879b027f3a61cb158351 | ORPH
   sparc     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/72fe75ee296634651bbf8741983e4dfc03357006 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ea8dda6628a12e6a958730ccc46d907e04507b07 | ORPH
   xtensa    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f93bca04a48697755335e92a7822fa0c3d507de7 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/1ab67b2ef9a90acd49234b3fc441eaceacef6898 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/17079d644e8f1e325d3481d3bee9c912a39537d2 | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a1384d320ff0970a4c74a0bfcc0fd6b931ddf3a0 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c21ab00956035df8aa197b38f9876883ac01244c | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3a43aae794573c92f550ffd9b8d497e08a3afc30 | ORPH
   arceb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d73072c9c52f208033dda1a99230fdd8f855ea48 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/fdc432f2af45fdc7ce0d0d401370b2ef44a1eb34 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/7ccea9cc890d87264d1d74977c37c1bf7642b804 | ORPH
   sh4eb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/8646d5e7426a2f3c21f61588c406f83c533475d0 | ORPH
    arm      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b67c7dfa04ad7650436f18a127ce13356af89b9e | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/8b4189ca7915af582314f1d98f286fbada0f229b | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4343911e2c4fd5892fc5612c2a05e2634338c6cd | ORPH
   sh4aeb    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e2ef6f3e0fa213e4f068ac889fa265d6ac80cc96 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f42182b0de36333bcdd0b4fb86f5e94b84d2bd72 | ORPH
    arc      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3cd2afefa95484e2dbdd6edab820b9b4dfce806a | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c78caa0509d0a4dc72a63126b93477b66ef9ebb3 | ORPH
   arceb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/7394bccbd6578b8b91b5f5946b1a357245220be6 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c11a248c6adc8cf8c1936784c2140e8f8345f571 | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/6a194920185adfd5992eaa4632082c39d71cc64d | ORPH
    sh4      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0940ff964d8ed292daa94b535f5c3daa3e393e98 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a36c7c5d5f06360fda2035aed39516f879da9b4d | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/99cd1fa6e9390c402cf560d84cfe87b320b57b67 | ORPH
   arceb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b6f1a86bf192fd58c9e6b6b79798c98ce85c29af | ORPH
  riscv64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/1a5bce9bd31f0772b70011d7e09dfb23be82f108 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b337411be611b28b19768c02fdc1fce7d687dae6 | ORPH
   armeb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/7bdb3d05c68077993e2a590f29d30b2867ce9894 | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4db1d81be5050554366579f0a65cc19cc16c6096 | ORPH
    arm      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/84bff71f64590a17a219290c5a7c91881c5c4430 | ORPH
 aarch64_be  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/49d9448efbd9317d553cbdd7913463b8d1fdb665 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/806bad20d3521f2069074a5f0e09515673b2c47e | ORPH
 aarch64_be  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3d7a5e39aa4d4cbda24c83940a5d843aabc43109 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/bcbb43ef94751d19d2cfc3c17797b61cd2be9399 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/fb10f7db1f407167995c72a618673c28f0104554 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3e90f07c7656541c1fde235d38f1834d411b0278 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/1021b23abaa7809bac090b398dcd9aa2f61ad8b0 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/2a5f34f39ad0c5987c835d6b45151d28e58d9c59 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/74ffb11415954407ea7ee74ee3092bef47c98f9c | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/53a1876855859df1e467efde74aa020f7e5d157f | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/887b34d520b69c4ae54a5417f766906bc3c3b10a | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d3dda3b2f4ad2c63a1c7390465214befbd45e6fb | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/85576adb1c47520307fd3131e2324054645f86d5 | ORPH
   sparc     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/89ad3a0077f067a8c63fd0d84b6207cc0d566123 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/48ba8ee7cfb55f2d1a31e66b0582476d1c8ef920 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4859a65ed8ecbe28f659d4b7ccae31288e184842 | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/01b606019b3a932753a498aa8d15cc567882b2b7 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/dd2bc8ec01e484824a3df8c43527936958fa6ed5 | ORPH
   mips64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/267277dafee843895e15b26ce66a6ebcfee5050b | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a90da530025f334d5f016df8492c6aa0306cede0 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/83529edb70a1a593050de1ba1c4c13040ca902ba | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/5f1353760f10ed2b577b722736ceb6ce5e762f95 | ORPH
 aarch64_be  |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/088320090d704a871d1b603275c31cff7d0459b7 |     
   armeb     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/5cd1c71b39d108b5478a177c726c31d0dd44c41b |     
  mips64el   |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/4245a53032fe2367b612aebe43cc097b7bb7cdb2 |     
   nios2     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/2f5e868e4cfb238ed9586038f468a40e52b1d32c |     
 powerpc64   |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/97916670f31c39cbef2ef89eaf065c831e7091a4 |     
   mips64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/de7f84bd5a6f0746a5d893b8218e44caca0bae02 |     
  mips64el   |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/9db6f1edcee6ab4dcafca37d9a4cc0f1eb7131cc |     
 powerpc64   |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/a3279c0c1aa573a6c3fea60fa4cf3f491a0b4999 |     
   s390x     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/8628906e1b38285ca3ef1b631c4137235afdaef1 |     
powerpc64le  |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/11c6f797b548bd8c1e98c09c80817680244b9a63 |     
    mips     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/e3ab15fe9908f1d27ea12782938d4b84ac89ce53 |     
  sparc64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/1b991f932712d883dfa10337f73c9c9c7000c980 |     
   nios2     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/d66390662f24d393d12e4ac17ce8c31769f1fc2f |     
  mips64el   |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/36d294d4018b02d0cf10ca488149aa62806829f6 |     
   s390x     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/87668cfd386409ddaadef315e2eaa9ffa67b48e7 |     
   armeb     |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/6f18fb1f8476a195fcc482a79e687dd6d5c75060 |     
   mips64    | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/56149dbc3ff3987e27951be13812e53a53cb0203 | ORPH
microblazeel | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/fb5e4b00e1d2b320080c2b5a5fee11ed2dd24737 | ORPH
    i686     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/b04e0643594beb446630a14dfbd93a298ab109fc | ORPH
    sh4a     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/a0ebc2cde4f66f4e359cec60b6f8b5ba2e95dcc4 | ORPH
    i686     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/f2537532fb74180d7d9d0b97e7f7883bdf2ff35c |     
  mips64el   | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/80d0c5589765cff448ad04da9949d0f48799a406 |     
    or1k     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/2c9aa84bdb746c65d3364b25e5af887e9f463aa6 |     
   s390x     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/ae1ea2a2bd040301a25c27faef05cc707fa49dda |     
   arceb     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/3e5c82551869eab5ad9b97004ac942bfbdd96981 |     
    or1k     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/21635a241aa42b05ff9049a07bf83e7301fbba86 |     
    arc      | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/75a4d17650746bd5e153e68085b4e0a2ee6806fb |     
   x86_64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/dd721663728c3b678561cff08421bc83715ffd59 |     
   sh4eb     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/7a630c3aa1b119b3d7cf7953fbe261f71125a553 |     
   sparc     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/02ff1338dacc2e05fa13d11b85c303edfe12ac1c |     
    mips     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/25524ce6ca612fa71a2a80a9a0a38e775294d2c1 |     
    arm      | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/a0dd62751f6c6990e81a081fb553ba1f4e74f311 |     
powerpc64le  | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/e4f952692b2b020030565c44d245eb462bd1a0d3 |     
   sh4eb     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/533ee2f7159aa56fdf26639431b80906fefb9c47 |     
   mips64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/75abd3efc9af54ace9fce7e37dbc28b4180e6019 |     
  sparc64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/1857fa9b1a0ea7bb1615ef029ceb0bf862f76717 |     
  riscv64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/7fad730cc9bc88476b477e073756bef265bc6f71 |     
 aarch64_be  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/e2a22e6c72c539bbf8d82fcff936937b17e3b8b0 |     
powerpc64le  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/124cc850186c4b7bb14141d4b18cfff8c4d3f2f3 |     
 aarch64_be  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/820d13e54de47e02cf2d708e55df8c5f37acfed5 |     
   x86_64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/30b3576ccfabe4624c65523bf9b57d615d32e1e2 |     
    arc      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/1296432ed71021efcb564090182ba061eb69a4f1 |     
    sh4a     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/dba578b9dedc082406bec2032502512e1bdf5aba |     
    m68k     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/c7c69f257cf5ca52284f442d6e5e9c521c628183 |     
    sh4a     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/1eb3d7f3b3764144b21d44fbd33f65c860a41564 |     
   sparc     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/210ace833f1a1181e807719e520d89b3536e25a6 |     
    mips     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/66cb9c04f87c4a2410375ad1a8f93ee0d816fc98 |     
   arceb     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/409b2ee454b7e03257a6c808f637ef644187fa51 |     
    sh4      |         iproute2-6.9.0         | NOK | http://autobuild.buildroot.net/results/e1ad179c1a1f569181d30cc9e0f3da0549377658 |     
   s390x     |          kexec-2.0.28          | NOK | http://autobuild.buildroot.net/results/d23be594a4316b618f8f8d88a42c5eca9b463745 |     
    mips     | kvmtool-4d2c017f41533b0e51e... | NOK | http://autobuild.buildroot.net/results/84b3725865de9a2b224fef8337906162ed209152 | ORPH
 microblaze  |          ledmon-1.0.0          | NOK | http://autobuild.buildroot.net/results/f539d07a90f522991b36dcf0a86d58e87eafb6aa |     
   mips64    |    libabseil-cpp-20230802.1    | NOK | http://autobuild.buildroot.net/results/2beeadf03dede670bfcda2b75367bb28fdb32973 |     
microblazeel |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/5f4621b684736a567e1ccc54329011c3e261b927 |     
   s390x     |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/a818d33c427a9bce7264561488b347d8bff61551 |     
   s390x     |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/58ac1ca1742c674d6637e978f5cc6fde8bae3e33 |     
    m68k     |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/da7e53a9c4036f7af2d0ce855b591fa020684356 |     
    m68k     |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/1364350e7d6ab559a27cb0fc35b0456d0f5d0f21 |     
    i686     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/64113515e80ecd84c4c8e123a1ac22ba0da47d45 |     
   nios2     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/7a8fefd8dd1fa32c2608159f16cf1776a405a183 |     
    i686     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/030324c8adb0f784d2c6d8f144a43bcc7da66b5b |     
   armeb     |         libcuefile-475         | NOK | http://autobuild.buildroot.net/results/40a369f6cbfafe14ad85408b7bcf64d6380f0926 | ORPH
  powerpc    | libdill-32d0e8b733416208e04... | NOK | http://autobuild.buildroot.net/results/aafadb4044efba0bcec9c6d9b9948e64d1f79e1d |     
   sparc     |         libdrm-2.4.120         | NOK | http://autobuild.buildroot.net/results/2157533efd11c410c26dacc6784739e60d063f4b |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/89bf997d156e817665f2539cd866d7e1053fa837 |     
    or1k     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/d9ff952dd71a375fa519fd3336ae0602ef09852f |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/7750fcb8c5fc63339678232764d4563366f20bc7 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/c9077c67857eef50e788867bdbb6f51c365348fe |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/46ed655b86c26b14314071ce6a35b010b7169fcc |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/124ac40c20552464dbe31955e16664074c6b4bbf |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/b4939c67674b2a7c3616ec1ac2272ab9673d8992 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/44170449eee4f6efb320582aa3b8706e785727e9 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/a871e3e734eb2d705b61f60ff1132e38bf197307 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/647385218766d75f462f71a16b284de543b833e5 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/14aba6b6849ec01366c5c553bdf07fd8586847a7 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/1b2efa3bb265b49b934ba28ca272b1b8ed62cc57 |     
microblazeel |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/46978519f891cb70106adeb791c55224a954b514 | ORPH
 microblaze  |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/dfa96059f499e48c84b60b9e13b13e629b81647f | ORPH
microblazeel |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/fb8b4800265a10128cb5e069eeef8932b3d4b2cb | ORPH
    arc      |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/90340351086f4999b10fa26645f8c10c9f276529 | ORPH
   xtensa    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/4e4714c41c0158319aa3c94b515b2e9a323c0f11 | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/2c0d15f1ed0805781160a51072dff3e46489e9a8 | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/3613f4f462e27fddbe018ddde96e423ef4fc1b83 | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/a705080a3052c617656ffcd599ee34a977d26a9c | ORPH
   armeb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/3c2f9c2b7ca3a9c5878bac5cbe0d3c692526662d | ORPH
  powerpc    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/445f3d7f0b58de8eaecb94a0207bb8e9090d8074 | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/1b80a8f8d441bd48de3eae92a67cd4447c1f4cb8 | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/cb96c5b043cafa7eac4e4a0beb5729b4bbcc4b0b | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/80e960cd3f2dd14c44dea7429e06949d17d68319 | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/4cb459127948d4f1a2ef9233144549b5913f4259 | ORPH
    m68k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/b7bd816623483a28d01222b47466ce078c5125d3 | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/d95fcbb3515fd29d260f300caa17b572dd526d23 | ORPH
  powerpc    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/5693309205974f45958748840862586736152a80 | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/2174276bbb5e248e9ae6d03d2364b342da005fe4 | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/d048685e967e93dc8d4037c8d032c907423a6e50 | ORPH
powerpc64le  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/80c47bec3a45ba016466f156212d8be843ee2c41 | ORPH
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/9b5d2795961b0f3234414ff047fda618216a079a | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/bee152af49a2481f5a3b36b0396fa42af1488d89 | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/72b1965d39ddbebc0352a8543eedf157a82d5f3c | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/3df47f98230bcb68da9df3bacafa052ddce42e6a | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/e3e798e7d371355f56174350389c82f44fca4c70 | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/d0ddb117d5e1853deeff30521ce85a18589770e1 | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/49845fb2ef9e841f6ef16d1060b4f1b2b26190e6 | ORPH
   sparc     |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/f70222164b10f8cca0e46ced68c01618815bfc28 | ORPH
   mips64    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/a13820f499f9328c153b570052a6461a929a5df6 | ORPH
    i686     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/f25503cd7b0ade6e217bd1ee70199cce0a6d5414 | ORPH
    arc      |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/61b1554efa27ec44ed9a6573ba169e3f5e269ab2 | ORPH
 aarch64_be  |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/81a12358e4d0c4ee5a11a4b772d335ec7e702e6a | ORPH
    m68k     |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/f915c8e3fbc5f5790711091ef0d9000df301e0d8 | ORPH
   nios2     |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/31c93f4cdd8b6e46214f6394b7f96d91f804f234 | ORPH
  mips64el   |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/4abb89e65d876eaa8ef124172462873617089afd | ORPH
   sh4aeb    |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/74798c2c96414f73c13c0b7972fad276dd0c74c4 | ORPH
   mipsel    |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/f3adc13f97cd1d9ceeface5a15ddf0e8d04d633e | ORPH
   nios2     |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/5bf4fa7b59e43f40df4cabbc23020e9b1f362afa | ORPH
    m68k     |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/69dba223b484de35b66d86017e5f377c48a87642 | ORPH
   mipsel    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/e528f86fd71649a2038267fb240b47fc06f9cbbf | ORPH
   armeb     |         logsurfer-1.8          | NOK | http://autobuild.buildroot.net/results/a63b2b3f9ba84bb75eb1f44674d5fe7764d1c43c |     
   mips64    |     ltp-testsuite-20240129     | NOK | http://autobuild.buildroot.net/results/8d052e0dc674c1e5aaba31d6c5c7b79834e6dc7d |     
    arm      | mali-driver-d40c57d81c9cf4b... | NOK | http://autobuild.buildroot.net/results/4c928d40cc85034ed8012769538cf181f1a0d9d9 |     
  riscv32    |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/6b9966a1a45001cfaa2ee3eaae5a53f15f673e7c | ORPH
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/18014683b30d732335eb7d34edd2e791bd86162c | ORPH
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/43662da7fad88810f3f60da55f8ffdf501e95dbe | ORPH
   x86_64    |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/ffeb44b37de2ae05badb79885170c3376e321e66 |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/f6e9018bec0a30ebb78e1c3283901cdc3161668d |     
  powerpc    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/385892da2ddcbd722bb2196b11d6f5b071726a1f |     
   xtensa    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/adbdacf0d7ce1c6e863593f781c691b4e6dc2dec |     
   armeb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/21cf050d6e9f4a8439a8e268bf62c1f574a0d139 |     
   armeb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/5a9a2f67571d6c897528398ed4b584354760de99 |     
 aarch64_be  |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/b848cad490b9ea4a991b43b622867e12312b92d4 |     
   arceb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/0e43d5bfe3081d73f87c86fcc386312def142468 |     
    arc      |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/ad358c940c15e851ee238ecfc857f2e5d844fa19 |     
    i686     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/113cb10ce934c22ee5335167dc196a1da2a8f0fa |     
   mips64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/ab77d4a858865e18b35a40db471014f83de8331f |     
  powerpc    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/e1c3b84d002cec75c7c2116999bc42867237ef95 |     
   sparc     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/6ae73a1e748d8d4c966ecdade2ac55a9360c0768 |     
microblazeel |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/5102225c441bc6abea23def1be212e0c29cd4996 |     
 microblaze  |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/e5825eb0e9583d3fd44b40f09f3ef839a8ac17ec |     
 aarch64_be  |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/adc224f8a08f1c7e7702c47d59a5a8576c6550a5 |     
 powerpc64   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/dc04e73d57e864cbafb6ac6e265840bcc4c477ca |     
    arc      |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/6f41ece89560baffdb2f5ff7d20888a375a21424 |     
   xtensa    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/a43b7f3dc9c78cc6330c3f46467d2faf942dbc51 |     
powerpc64le  |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/9b85b5a29dab730c99064e702e35c082adefd507 |     
   s390x     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/5e0cfd97744be8d0dda282bbaa5ad9833ca5f8f3 |     
    arm      |         openntpd-6.8p1         | NOK | http://autobuild.buildroot.net/results/db2714b6fab9661e54db0ce15ed1f86b95786cb6 | ORPH
   x86_64    |         openobex-1.7.2         | NOK | http://autobuild.buildroot.net/results/7cb5eb218f333b380a64c5523ff440d13236f169 |     
   mipsel    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/7003d4e3fc7f2216690e45a22470d1151126823e | ORPH
  aarch64    |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/4f5804184de1dd2e87d0051966d37c12312fcded | ORPH
    i686     |         pixman-0.42.2          | NOK | http://autobuild.buildroot.net/results/7adaf21f4007b9571144a157a2fa4c28c90fffc4 | ORPH
  powerpc    |         pixman-0.42.2          | NOK | http://autobuild.buildroot.net/results/d5a98ebb517130e9bd7861c13380fec44427d065 | ORPH
   sparc     | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/526565c4f1719fa40f91dfe5f7112aafd0cf7a62 |     
 powerpc64   |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/63dbfd2303effe044970d45f927b7b8d2f0c06c1 |     
   mipsel    |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/89366e9cc69cc5f858c458dd1359e245ddf1ac9b |     
 aarch64_be  |         rocksdb-6.20.3         | NOK | http://autobuild.buildroot.net/results/eae233cb56d634b16deadf8896ca89c300eeb304 |     
  riscv64    | rtl8188eu-306f3e62cf7cddf8c... | NOK | http://autobuild.buildroot.net/results/f2b19524c14655700d546b935a33116b5cb1ed20 |     
   arceb     | rtl8189es-eb51e021b0e1b6f94... | NOK | http://autobuild.buildroot.net/results/f79e380c5e4e1bf72952a269e72737e78f698fe6 |     
    or1k     |           rtty-8.1.0           | NOK | http://autobuild.buildroot.net/results/6e13b7779776db3db4e7f1bc72d4104966a491cb |     
    mips     |         s6-dns-2.3.7.1         | NOK | http://autobuild.buildroot.net/results/325f5ec390b46e1a9d5bc97c343874fbcb91e41b |     
   sparc     |         s6-dns-2.3.7.1         | NOK | http://autobuild.buildroot.net/results/2c6a0913d3d36a27e7bc170c81a065f6ab4cef29 |     
   xtensa    |         s6-dns-2.3.7.1         | NOK | http://autobuild.buildroot.net/results/ceb3aeeebc072f2d380b0b35499155db0ee42bbc |     
   sh4aeb    |         tbb-2021.11.0          | NOK | http://autobuild.buildroot.net/results/c63370e978746ae4c5f25946233377ea19a405a8 |     
  powerpc    | tftpd-b2b34cecc8cbc18ff6f1f... | NOK | http://autobuild.buildroot.net/results/a19df36a28340470f30ea9744e08db44b82eefa8 | ORPH
    arm      |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.net/results/017a514f48a2d8156cc229c667d99d33618a8b5a |     
  riscv32    |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/212e1dacc3f15174ca3a8488fb6ddc2c23cd5f3a |     
    or1k     |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/0dd2ba89adb0e6dab71937bdd685d0dedab3c810 |     
  riscv64    |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/99f4edf7cef05c962809776431481398499a92d7 |     
   xtensa    |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/987eaa88a044b24415b2b9679cd755a039b0c2bb |     
   armeb     |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/2a93d0c5bbfee0c8b7668a589f5958bfe37167c2 |     
   arceb     | uemacs-1cdcf9df881440497501... | NOK | http://autobuild.buildroot.net/results/96958bfce2e63779acab54c5845d918821996479 | ORPH
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/52c90f68afbab1edba2c557dedbb445aa19f8cc8 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/ba1ec9b76d5c65e4de8fca51e55cc4da30a968e3 |     
microblazeel |            unknown             | TIM | http://autobuild.buildroot.net/results/a11832449cc200deab2d3b0024819fd2adb2b9f5 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/f2049b287dfcb65e16084e988288ecce076e72c3 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/99716567350cb89b4fd890215302a7bd7f7f3203 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/bf8ef5ed1e74b0653cd0c5c2e0109f697f5b3477 |     
  riscv64    |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/e7c57af3553fb4a404d879b7536e7c83048b8c95 | ORPH
   arceb     |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/206112c299180c7ac98deef86440fdd0d76e16b2 | ORPH
   arceb     |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/13d9a612b5cd9e2358503d2b183c98f72c2a2d86 | ORPH
  mips64el   |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/a0d80cf1951874d810a1a56cbcc0ddcb60a54d4c | ORPH
    i686     |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/f29d21e87755070c19daffdb7fbb854f2c2e6211 | ORPH
   arceb     |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/b5920d2e8491b558c68c9857c44ab12f3fe40aa9 | ORPH
    or1k     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/d727c0d20890129b670a6597e3e5648208e6dafa |     
   nios2     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/778e0f59292d704d81bdee47df8d3c3f4c6354df |     
   x86_64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/0fd477073dd5d1085d03a1b7e1f3e0608f8b7c36 |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/05703d08e65c31e75e4ada3f16281bf0da98f831 |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/1cbf589be5eb94b036d2fd5f1e97b44901b1fccb |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/38c31b1fdccf02d30664f0085a2f7a0dfdce916e |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/bdc412019f153aaae0b2524e6665c874df77897d |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/d19785f6db89def8e6533eb922f0d3bfc17b9434 |     
   s390x     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/7d91c5b85a49238f3fc83dcbfd2c3174bda55825 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/d4ba266491f6d190d8c8ebdd6676215c30deef91 |     
    m68k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/d6a8aa138ebc7784ff1fa91cdbb704b7605f932e |     
   nios2     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/34cbd8224e45a98a7cf5b713da0d14ae9b631977 |     
    i686     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/12d2ec09c04722721211061f157278f4bee3cc91 |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/55ce0f902061d50ea2e92e1e8e75ceae06514a9d |     
   armeb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/be29f6f8255ff2800845f6b06f2d1cc9f35a58f4 |     
   armeb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/f54744b10ac9395890028d42ec2e23d477c468db |     
 aarch64_be  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/a9f983a5c5cfee6d91a670f9bda9a4faff49e2a0 |     
    arc      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/bd03ff1bac7aefebd91b2de51f588314a345cc9c |     
 powerpc64   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/38fdde23c1015e4f514b6b1ae3047eb945a7e317 |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/b2e5b7cf6dea481e87fa7dc759b849a961a32e54 |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/71ac75286f17b12f76565acbbba0d654eef9bded |     
    or1k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/be8a0a5c5a09094b5b55b468d456421d58f9e257 |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/0be018bb2aed11a735328619f2b40c0add6fb220 |     
    i586     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/2d0295919996dcf6a5878061e9046e79fc6a55a6 |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/07c28a278d38570bfc6a37bbbaf021dedfbbcab4 |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/8a1cb89fecd8053f684c380f19a4ae0b2197a513 |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/53ac800b758bbf265b849a992dda088846844479 |     
   mips64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/e41c54921010c71fc9722145b11455040f9d5d1c |     
  mips64el   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/729fef92756b70b75c79b75dd9d5dfcbb3f0a722 |     
   sparc     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/7acf289eeaf85bb857573bec2a81d47b0aa877c1 |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/196fd04d41bdf74b12e0d98190c641699948e6f2 |     
    i686     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/d04286f8bcd8a398927f126c87c642b201a5c821 |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/034b45b8f3af7f759ad621bd22bc7325e934ea18 |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/c828c97738c8bb30db0a1fe0f91512294161af6b |     
   armeb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/b365732acbac180c05e06180027db91980e5b591 |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/2af57d07297faf13c5f9212158365e4fe4a1a37e |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/9272f8e3f31ab1c61f0faa259464a5e0eb7522e1 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/23ce4088ed1d67386a77364f3e20537f72c5c3d7 |     
   s390x     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/82398f506772c9c6190712bb3e7d45e6c252fb31 |     
 microblaze  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/581316c84c7554aa60584c67196ceef24454f301 |     
   sparc     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/59c203f1f5197f5e13d813f2fabe47453e28dd27 |     
  mips64el   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/7b23c6928c6a629198cb0c11d61897f70bc92ba2 |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/cb1a621275cbeb8b83cef92a92106cfc776ecdbc |     
    i686     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/80899626d5e1116118ae94323fdfa414bbd10fe3 |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/35525a088649d6a02642848ecff98f339fad6428 |     
    or1k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/104e0b1651e0c561cb44692bf7a0350e5a2aedd1 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/2202cafa6bb1f817e98e5477bba23723c205800c |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/974195c31cde0e17444708f8a5b19e8959265c17 |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/ce8662592b9d0574d5dc53090d109a6c5dcc562d |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/53186d7cbc39c4195f5a3292869d6580bd5bc96d |     
   arceb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/8e3b13eaaf6172ba1dd252a8c36b045d8bd51f1b |     
   s390x     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/16ee443ad40cd7377bda882b242c918e883403b4 |     
    sh4a     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/140271079fdf29395f68aa60e8f67271381f1429 |     
 aarch64_be  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/0b73f214f3d67f339dfb6cab94c84d7e17f00fb4 |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/d9431bacd81be1bda81e82df42f1f97cb7dbb373 |     
   mips64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/4816ea8673684623f9f3bfe9f589e2be9f9f3012 |     
 powerpc64   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/2d70d224b325bd14a5e1e1920d5b6de278617250 |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/077b4391d5214192fa2d5ca04753e37baaaeda0a |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/3967aadfc40000d2abd158a35832e4e07f0e7b86 |     
    or1k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/7d941ec5fed911dedb3299025cfbda1ad1152014 |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/018d336c7b684d613ce5687e566e87c5be0fb5ac |     
    i686     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/0e2ebcb2257147fef822b6bc9712588ca2af1e79 |     
    m68k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/ecffe435ec78d73a3805c541631595c0c4a264ae |     
  powerpc    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/c9e1ecfdd12ae9e3617590f8d11c68d7e239e4f9 |     
 microblaze  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/07fa4ac4eb0c18b7260517e038210d00bc8701a9 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/49a5cbf07bbede2ff9752f2b7ad9a2494f74db02 |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/11af73ededece212805be391747c4154da58d679 |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/5cb6603ad0e5ddc4aa8e98f444d8889fb966f8b8 |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/503cb56e29c3090dc1d8b3e3ba60a95930340f93 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/e540549202a062a72d67e6c8be8dbadfc799f38e |     
   s390x     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/f7aa31ca6159ae3481cc63de7d62f13b679324cf |     
   nios2     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/a6b9e389f109661fd3c193d184d4488a644e4bc7 |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/b4418dc5201daeae912d7c1cb23b226384dc130c |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/305e1f9c4f33488198b3b0f42493481e4075a98f |     
 microblaze  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/3dfecb94d2a4550813c6c43bcdbeca4887d4aca8 |     
    sh4      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/81165c3a6e205dd52a2d3104d2d1b3c5f10459a9 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/779fe62d557e81e8d7f112bd5e344109b8a25dd7 |     
   armeb     |       zynaddsubfx-3.0.6        | NOK | http://autobuild.buildroot.net/results/75caddcf8a0364522840628d04333b05642844ff |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  clang-15.0.3 | 1 
                 coreutils-9.3 | 1 
host-heimdal-f4faaeaba371ff... | 1 
                mongodb-4.2.18 | 1 
                    volk-3.0.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |          clang-15.0.3          | NOK | http://autobuild.buildroot.net/results/7502ced265a8a4cf7027088d048dce8e252368dd |     
    m68k     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/65591db011690ec273328561d7c0cba2e56e0ad7 | ORPH
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/abcc4842185f558b9e53e55c7ace70d60c307d0b | ORPH
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/8f93b358d51ccae052d18d561d2d20664688c11e |     
  powerpc    |           volk-3.0.0           | NOK | http://autobuild.buildroot.net/results/3864f409a268f0f71bbe908b946ee8c00bc9d6fa |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                  libsepol-3.6 | 2 
           at-spi2-core-2.50.0 | 1 
                    bat-0.24.0 | 1 
           crucible-2023.11.02 | 1 
                  ffmpeg-6.1.1 | 1 
glibc-2.39-5-ge0910f1d3278f... | 1 
host-heimdal-f4faaeaba371ff... | 1 
ibm-sw-tpm2-5452af422edeff7... | 1 
          libcamera-apps-1.2.1 | 1 
                       unknown | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.net/results/136192ad65b69b3d41e0cc2547358fd271cf954b |     
   x86_64    |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/0ee75edb00432499d085e94dc0252331d371bb6a |     
  riscv64    |      crucible-2023.11.02       | NOK | http://autobuild.buildroot.net/results/38901e71cffa0ec9cd75d1337f482c3050620e0a |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/47b22cbe423a8b06eca839cfbda6a509a3205d20 |     
 powerpc64   | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/c99fee2cf08e1380a658bedb72067d821e46d3b9 |     
    or1k     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/a8e8a997b66595ef830bbbfeab09a11c31619b66 | ORPH
 aarch64_be  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/2697c9170fab030671e15c317c11b5fcd3e5da7e |     
    arm      |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/a486e5c86b6e2359f74d08230d60efed42ea6384 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/b39d89be581721fa07cf1465b3488c5052361690 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/d70c126e1d86865c5d5b497c585ca058ffd67492 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/554b9179c783337e42b3d593863e6b6c3f7d1ab4 |     
  mips64el   |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/1634d771a05b5f91763d62039d632fc7d8dee98a |     


Gitlab CI results for 2024-06-21
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142244957  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142244961  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142244963  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142244964  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245006  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245037  | ORPH 
                   beagleboardx15 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245039  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245049  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245052  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245058  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245060  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245061  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245064  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245066  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245067  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245068  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245069  |      
        freescale_imx6dlsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245071  |      
          freescale_imx6dlsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245073  |      
         freescale_imx6qsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245074  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245075  |      
          freescale_imx6sxsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245077  |      
           freescale_imx7dsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245080  |      
             freescale_imx8dxlevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245081  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245083  |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245084  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245086  |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245087  |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245088  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245089  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245096  |      
                   imx6-sabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245109  |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245113  |      
                       imx6sx-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245115  |      
                        imx6ulevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245117  |      
                       imx6ulpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245120  |      
                        imx7dpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245122  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245129  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245130  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245138  |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245148  |      
                     ls1046a-frwy | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245150  |      
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245177  |      
                   mx6sx_udoo_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245185  |      
                          mx6udoo | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245186  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245199  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245200  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245203  |      
                    orangepi_lite | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245227  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245224  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245231  |      
                       pandaboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245252  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245260  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245263  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245266  |      
                     qemu_sh4_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245322  |      
                   qemu_sh4eb_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245325  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/7142245347  | ORPH 
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/7152650064  |      
                           rock5b | https://gitlab.com/buildroot.org/buildroot/-/jobs/7152650378  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7152650778  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7152651329  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/7152652276  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7152653177  |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/7152653437  | ORPH 
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7152653646  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7152653699  |      
                      ti_am62x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7152654585  |      
                      ti_am64x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7152654628  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7152654675  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7152654712  |      
                           ts5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7152654792  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7152654836  |      
                         uevm5432 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7152654873  |      
                    versal_vck190 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7152654970  |      
                       visionfive | https://gitlab.com/buildroot.org/buildroot/-/jobs/7152655060  |      
                      visionfive2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7152655013  |      
                        wandboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/7152655112  |      
                            warp7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7152655583  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/7152655762  |      
                       zynq_zc702 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7152655848  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7152655892  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/7152655945  |      
                zynqmp_kria_kd240 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7152656002  |      
                zynqmp_kria_kr260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7152656054  |      
                zynqmp_kria_kv260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7152656096  |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7152656151  |      
                    zynqmp_zcu104 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7152656300  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7152656609  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
