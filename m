Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA00C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 08:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD9CB60818;
	Mon, 29 Jul 2024 08:08:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O-FhgJjzr2oE; Mon, 29 Jul 2024 08:08:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5502B607FB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5502B607FB;
	Mon, 29 Jul 2024 08:08:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A023A1BF30C
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 04:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83546403F6
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 04:55:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BxtLm0VDfvtV for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 04:55:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 618E840314
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 618E840314
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 618E840314
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 04:55:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8163F24000E
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 04:55:31 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Mon, 29 Jul 2024 04:55:31 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Approved-At: Mon, 29 Jul 2024 08:08:29 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1722228931; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Yfg1F33k6zVKL8pNGotC7VDlqSwaFNOIPE2hm7Q4HZQ=;
 b=efGeX1y/RslwJZvOnDEY7DEHccGom5DGxVKDORMT/pSd8IJoxU+pUAG9IO4RlcV8j1jL7n
 mCDw4oM1zFxVsrZyIRQnyq9qVFgr5/RyoZ2kLjgG/L1CYwdbJq/Vk7b6/X5zY2bQhb1ANM
 YL3yIEnRxnfRdKD9T4RQR2Ab/ygDR5FyHGy3ThJmdrmrvCvHM336Kt/8smUK2SuzaXlVGj
 QqJQ1EWhAFWcNmye0dwfcqNV43BCCbRiwACFQnpHd6MfTlm7ZnTwm/qIu1jlQ8QEdySJvO
 MrhfyIuMVHW96aBWrv+WavwGeoVd3p+x5Jqno9dVfNfI7CshjNMwqOCgndjvow==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=efGeX1y/
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-07-28
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
Message-ID: <20240729045531.xfk7_Ty-MQm4wltR2LnLRZiIiQoO_mRNP9jJk1sSMuo@z>

Hello,

Autobuild statistics for 2024-07-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  7  |  6  |  0  | 13  |
  2024.05.x  |  5  | 13  |  0  | 18  |
    master   | 98  | 275 |  6  | 379 |

Classification of failures by reason for master
-----------------------------------------------

               procps-ng-4.0.4 | 15
                     avahi-0.8 | 11
  gobject-introspection-1.76.1 | 11
                host-odb-2.4.0 | 11
                  ffmpeg-6.1.1 | 9 
host-heimdal-f4faaeaba371ff... | 9 
      python-autocommand-2.2.2 | 9 
                gerbera-1.12.1 | 7 
         gobject-introspection | 6 
                  ntp-4.2.8p18 | 6 
glibc-2.39-74-g198632a05f6c... | 5 
host-vboot-utils-bbdd62f9b0... | 5 
                  linux-6.10.1 | 5 
                    norm-1.5.8 | 5 
                       unknown | 5 
                  bcusdk-0.0.5 | 4 
                 dc3dd-7.2.641 | 4 
                espflash-3.1.0 | 4 
         host-libxcrypt-4.4.36 | 4 
 host-softether-4.30-9700-beta | 4 
                 pixman-0.42.2 | 4 
aer-inject-9bd5e2c7886fca72... | 3 
android-tools-4.2.2+git2013... | 3 
                 coreutils-9.3 | 3 
              fluent-bit-3.1.3 | 3 
             gnuradio-3.10.7.0 | 3 
     host-moby-buildkit-0.11.6 | 3 
               ipmitool-1_8_19 | 3 
                  libffi-3.4.6 | 3 
               libglib2-2.76.1 | 3 
           mediastreamer-4.4.8 | 3 
                s6-dns-2.3.7.2 | 3 
             strongswan-5.9.13 | 3 
                   trinity-1.9 | 3 
                 apache-2.4.62 | 2 
              cache-calibrator | 2 
                  cairo-1.18.0 | 2 
                    fcft-3.1.6 | 2 
                 gnuplot-6.0.1 | 2 
             gtkiostream-1.8.0 | 2 
            host-binutils-2.42 | 2 
            host-skopeo-1.13.3 | 2 
                libxml2-2.12.6 | 2 
               lighttpd-1.4.76 | 2 
          linux-5.10.162-cip24 | 2 
                   linux-tools | 2 
               mariadb-10.11.6 | 2 
                mongodb-4.2.18 | 2 
               pulseaudio-17.0 | 2 
           python-daemon-3.0.1 | 2 
             sofia-sip-1.13.17 | 2 
                 systemd-256.4 | 2 
                 uclibc-1.0.49 | 2 
                    bcc-0.29.1 | 1 
             berkeleydb-5.3.28 | 1 
                  bitcoin-26.2 | 1 
                  boost-1.83.0 | 1 
                   botan-3.3.0 | 1 
                 c-icap-0.5.10 | 1 
                  cc-tool-0.27 | 1 
check-11970a7e112dfe243a2e6... | 1 
                  cmocka-1.1.5 | 1 
cwiid-fadf11e89b579bcc0336a... | 1 
                     daq-2.0.7 | 1 
                dovecot-2.3.21 | 1 
                    dust-0.9.0 | 1 
                 erlang-26.0.2 | 1 
                  eudev-3.2.14 | 1 
                   eza-0.18.22 | 1 
                      fbv-1.0b | 1 
                    flac-1.4.3 | 1 
                    gcr-3.40.0 | 1 
          gitlab-runner-15.5.0 | 1 
                gnu-efi-3.0.18 | 1 
google-breakpad-f49c2f1a202... | 1 
             host-delve-1.22.1 | 1 
         host-gcc-final-13.3.0 | 1 
         host-gcc-final-14.1.0 | 1 
              host-runc-1.1.12 | 1 
              keepalived-2.2.8 | 1 
                latencytop-0.5 | 1 
libdbi-drivers-0bfae6c43134... | 1 
                  libdex-0.6.1 | 1 
              libopenssl-3.3.1 | 1 
                libressl-3.8.4 | 1 
                  libsepol-3.6 | 1 
                  libva-2.22.0 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                  lvm2-2.03.23 | 1 
            makedumpfile-1.7.5 | 1 
                memtest86-6.20 | 1 
                 mokutil-0.7.2 | 1 
                    ncmpc-0.49 | 1 
                netdata-1.33.1 | 1 
                  nginx-1.24.0 | 1 
                 openssh-9.8p1 | 1 
             parsec-tool-0.7.0 | 1 
               pcsc-lite-2.1.0 | 1 
                pinentry-1.3.1 | 1 
    python-cryptography-39.0.2 | 1 
          python-grpcio-1.60.0 | 1 
           python-zlmdb-22.6.1 | 1 
                python3-3.12.4 | 1 
                rocksdb-6.20.3 | 1 
           sane-backends-1.1.1 | 1 
                 shadow-4.15.1 | 1 
                     shim-15.8 | 1 
                tealdeer-1.6.1 | 1 
               tipidee-0.0.5.0 | 1 
ulog-0389d243352255f6182326... | 1 
             util-linux-2.39.3 | 1 
                 wolfssl-5.7.2 | 1 
                      xz-5.6.2 | 1 
               zxing-cpp-2.2.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/2b831ecca47fb5818af93c1a45a05f9e77eef2f5 | ORPH
  aarch64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/93d5b0e5d8360b938beae988a97fc85fb6e4ab36 | ORPH
    m68k     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/31e56b4142c609a94c98e9bc39d0bc46c9997713 | ORPH
   sparc     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/288862b4ef5a91832484fc0183074098d7fa67a6 |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/0ef6099395c4b91c7654a8044d9c54b207eb8b76 |     
   sparc     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/f973aaa1b845feae9daeaaad93f8b81e0980bcaa |     
   mips64    |         apache-2.4.62          | NOK | http://autobuild.buildroot.net/results/12aba541e7fdf8defa3570bcaca76a688f99ac1c |     
   x86_64    |         apache-2.4.62          | NOK | http://autobuild.buildroot.net/results/fb8a4233a9f9d454352292d8c10d90895e72132c |     
    sh4a     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/9196b6ae548ba0289c7a1afac797f40cb255029e | ORPH
  mips64el   |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/ef8087209193f8cd82197c8f0ccf793ecc06f119 | ORPH
   nios2     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/22e58244558939dbf623c0a7ac9d74e61a3499e3 | ORPH
   mipsel    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/fbc0349ef711970b7d14deaa0388ffe0f190ad94 | ORPH
   armeb     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/1d043f136ade00db6b106cd6532398d2ba561c29 | ORPH
   s390x     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/4aff05b31a1e888aea284b5c4dfb91839c907892 | ORPH
   mipsel    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/f9c59bea1c8c5b99427fe8f323c8ecb6529be5c5 | ORPH
powerpc64le  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/a254b16d127dbb39695561e28fdc7a4b7e7c136c | ORPH
   nios2     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/68a3291215f37cb745e49429210c47f3d40e733c | ORPH
  sparc64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/eba5092036d02584e8931aafdf35da05383b3b83 | ORPH
powerpc64le  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/cc1f4d75f9a4ee105a7f7647cf67af4c070df3bc | ORPH
  aarch64    |           bcc-0.29.1           | NOK | http://autobuild.buildroot.net/results/282808fb63d0f0225181137714d1ce99f6183ad4 |     
  sparc64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/e438dd7c4471d72c2bd800a494292ca6a884ef77 |     
  aarch64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/1bbf8054055e2645fc051dbdcaac6d5ca6ab0336 |     
   mipsel    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/0e1e815ef2b87c11b35b1bc67202f704c7d1b866 |     
    or1k     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/79670aa8ac543cead519e08baec1d2115aff076e |     
   armeb     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/1db31160ffa7be4d0ec42d16124aa132ae7b626c | ORPH
    m68k     |          bitcoin-26.2          | NOK | http://autobuild.buildroot.net/results/155426802af9124288f04e885d3cf18fff679644 |     
  mips64el   |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/5ce516f43b1191f7c5c049f1a9bc2a799c5e5510 |     
  riscv64    |          botan-3.3.0           | NOK | http://autobuild.buildroot.net/results/61774c3a1340a945a2cc566920b3c52aef806eb4 | ORPH
   nios2     |         c-icap-0.5.10          | NOK | http://autobuild.buildroot.net/results/50eb3a96b4d7648dc037fa84eed8eff26df59a21 | ORPH
   armeb     |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/6faf617c6210951b722e3dded2e5eaa317dba7cb |     
    sh4      |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/b8346073fe8ba3acc7001bfa352556cfa0dec67c |     
   mips64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/55a2315fcf4a0b7aa0ded270cd2794277ac00982 |     
 aarch64_be  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/471f511b247a6f86987f80c2cec2bf91150e7af3 |     
  riscv64    |          cc-tool-0.27          | NOK | http://autobuild.buildroot.net/results/44689bb4235c04fea37075b6d573512126267a8a |     
powerpc64le  | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/ac8b08237b7129a45cb98adbff617a56d1519eec | ORPH
powerpc64le  |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/961759968e0b0d2de0c27539712d4f24678a2c3a |     
    m68k     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/418a74d7dbe86b2a5ae4ea6414f78f9475a50d39 | ORPH
   sh4aeb    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/2b6efedabe16fe61246593dcfa85c90fef9092b5 | ORPH
    arc      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/e1145a68cef439e0177da45b626b35a72c72bac4 | ORPH
 powerpc64   | cwiid-fadf11e89b579bcc0336a... | NOK | http://autobuild.buildroot.net/results/181888eb2febc166f7e993608a91c3b96c2e13c8 |     
  sparc64    |           daq-2.0.7            | NOK | http://autobuild.buildroot.net/results/12909598f7cfecb105ff7476799fd4678862efc4 |     
   sparc     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/d53dba33ad84820cf859f27e43d0acfc9f2defe3 | ORPH
   sparc     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/85dd585004f7f1b36677571983539d6ffd7ff352 | ORPH
   xtensa    |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/ad26f6bd13b4ec4c31d991d7a894367830925537 | ORPH
microblazeel |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/f2a5b31d1fa445eb987f7930d249c0c6dbc09e25 | ORPH
  mips64el   |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/9fc4947f9cb5ae1abec2f3c7a3f92e34194b2cb4 |     
    arm      |           dust-0.9.0           | NOK | http://autobuild.buildroot.net/results/ace8e4dd3ececa559f7f95273a45fedebbca07fc | ORPH
    i686     |         erlang-26.0.2          | NOK | http://autobuild.buildroot.net/results/6bd4cec0e63155c3765761d6c164a67dceb62715 |     
    arm      |         espflash-3.1.0         | NOK | http://autobuild.buildroot.net/results/622894557f62c2c9fe470b34fda8f1670593aa07 |     
   x86_64    |         espflash-3.1.0         | NOK | http://autobuild.buildroot.net/results/7179480c1d43408c2cdccff7f74af49baeb77e74 |     
  aarch64    |         espflash-3.1.0         | NOK | http://autobuild.buildroot.net/results/c61b6ed4b6fb4d18d503ac37add200f5e6ae3706 |     
  sparc64    |         espflash-3.1.0         | NOK | http://autobuild.buildroot.net/results/a8d3ee8171a6e9193df623e915dc90c339382105 |     
 microblaze  |          eudev-3.2.14          | NOK | http://autobuild.buildroot.net/results/6a37c7a73ce64a277b647ef0bbc720aea3b96df9 |     
    i686     |          eza-0.18.22           | NOK | http://autobuild.buildroot.net/results/5fedb090ccfa11b9186551990c4efd56c891c279 |     
 aarch64_be  |            fbv-1.0b            | NOK | http://autobuild.buildroot.net/results/6f6b1252789a2a96e25a864385ebba3f06c5d531 | ORPH
  aarch64    |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/76c8e03854dcd912f120edcb700401333c8541ce |     
    arm      |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/2c3c562a89fd2e74b2754260d02063192fcbe422 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/0dca258616d37238258c4e11f748faaef7a23e03 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/d14c788aac15cc6279a2f0fc364f73e3bb91c986 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/6669572aca088d16b4e82b13cecc279979f7fe02 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/7fa7c4c6f44fbe88ff969b17ec3d9996eddf1c9c |     
   mips64    |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/bf100800a31d33e08431abbbfffd5a697d63f4c9 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/4c532cef7fcab887fc72485013fda2e58cd0e15b |     
 powerpc64   |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/f6e86e8d47e0a8847b635d0a1df8739dc6bbbf92 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/2b966177d4b8f5b2941db8b2ed01f0a187d178d4 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/fea4d39a8546b0bcd456021dc1b5ff2dcd4fc776 |     
   sh4aeb    |           flac-1.4.3           | NOK | http://autobuild.buildroot.net/results/e719ae726fb9824d382b94c94aa5907e1bb6c82f |     
    sh4      |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.net/results/5d26f8dc06aea24c65327a96440d2db93651f038 |     
   armeb     |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.net/results/bf2a72c51a6d6dddcbae8511ac74d2d114958be7 |     
 microblaze  |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.net/results/a5798408df963ae132022416fea42842793073fa |     
    m68k     |           gcr-3.40.0           | NOK | http://autobuild.buildroot.net/results/8e547f7875eeede523178a5f9a72b8f02cb8faa2 | ORPH
   mipsel    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/a93a20f7bc1a561cba8f84e098bbc9579e2d8f2d |     
  sparc64    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/d4bafa63304c879aa25b6d1830e5d53b797dc94f |     
  sparc64    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/daf94a458dd607b61e71c27434483c1e3a7d2316 |     
   arceb     |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/bb98dde8d681c915910c50f1e74dfdc4eb4cbd78 |     
    or1k     |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/30d7fec6c26edd856e86431a1f82e3d21388ebc0 |     
   nios2     |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/9db0693a73b1c8629cf839011ef8f7eeae030d66 |     
    m68k     |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/575b164e0fe69775469d6de1fe403d3ce8134318 |     
    arm      |      gitlab-runner-15.5.0      | NOK | http://autobuild.buildroot.net/results/50a87ecfb03e28efd7b26409fd64830101bf8e1e |     
    arc      | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/bdedb5749a5e2f9448dcf0aaa5ebe7868234e395 |     
   arceb     | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/74b75f6f1aac6b0aafa744cd8aa8f14790a4f87f |     
   arceb     | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/a097c402f0bf9d66c8e91491e55a9b977655e5fa |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/bebd0d6fc9b839ba05a1185708013f608a46046c |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/91853de70a587ad9fc09e230f672c0f89bac3429 |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/3e87e7d908371cc89f66e63e73e8824d6a3d2483 |     
  powerpc    |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/dee2d8ccfdab43f658d516e1c045c9e152d9b391 |     
    mips     |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/4d35d20c9de8e8a9038906045956f6ae59a39765 |     
microblazeel |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/6635d4df1e7fb4aba502ba0ac135bf0c8381120d |     
 aarch64_be  |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/f45cfa1b4148c1afd8c86d907f4c33120c67989e |     
 aarch64_be  |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/bc97a3c0cf5e0c8d35dafc9295207ca8e90a3d07 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/17b5c2a4d16727f4bad42a2a7f0861a1e010a1d9 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/211fabb62dc172bc3ff73ec567ba930cefaa86bf |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/4d37418c663233be88a54bb1b9547290261d43a7 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/45544155a803b683e4d0b74936293c87013619e7 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/a72bf041c528e6f9ee8afa18cde6e37b30733142 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/bb337d2e66ebd34546fe28c60037f2fe19d60fbb |     
    i686     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/34a712a531459bbecb31277d5f32f5107f468240 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/9428e0624e55e2de0423e96c05857356685cac16 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/d87a7b6ef937e5b6ee1322c2b2c2bf0014d7aed5 | ORPH
    i686     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/e7e0e312c48a466e601f59db20b6fd87b0041f5d | ORPH
   mipsel    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/61e83e00598208394e1eb71b4e8abcb2b8182bfb | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/071277d97d091c789e580681ee322caef990c875 | ORPH
    i686     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/5086aa3be6fc1285905d9f715a496e81784fe97f | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/09df71eb4e5f8feb990b96c294d3a03788074672 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/d66bab18e6a2642645cf503f4e0b045b79fb98c2 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/c2cd4860d185304a49c0f6bcddb562a537353e90 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/e32c48d1b53fed47fe589e16821009de3c14c6a6 | ORPH
   mipsel    | google-breakpad-f49c2f1a202... | NOK | http://autobuild.buildroot.net/results/28e7658108a6388079a4a6b112ebb26ad37df210 |     
 aarch64_be  |       gtkiostream-1.8.0        | NOK | http://autobuild.buildroot.net/results/a6b439a9af2110d9f9c966d83d90e71f6b49bb70 |     
    or1k     |       gtkiostream-1.8.0        | NOK | http://autobuild.buildroot.net/results/232fbfddbdf7043bd248fe3f0b0860963e445c23 |     
    sh4      |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/724a9abf19c6aa5e21b09a661b2f3c80d13607a1 |     
  sparc64    |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/549ecef5ffeadc6d951da699648d69029d57a298 |     
   mips64    |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/c9aa89c9791bb1ed0bf13db3aa039c2a331e2300 |     
    arm      |     host-gcc-final-13.3.0      | NOK | http://autobuild.buildroot.net/results/1922f543079c6b9e58edfc6cd23ac6c4cc74229d |     
powerpc64le  |     host-gcc-final-14.1.0      | NOK | http://autobuild.buildroot.net/results/064eabfd900a4b5aea103261cbc60abdbb907e34 |     
    mips     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/3be27f85a3a46ca94ed9a6c3fb4cb28ca2618ef5 | ORPH
powerpc64le  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/08782120a2432dfba84ec152a61341b4097cbcdb | ORPH
    arm      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/423f735f6ed0d376ddcafac7209e6270e63576c6 | ORPH
 aarch64_be  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/4c1c13b08a858633bb58c752cbea427589441d59 | ORPH
    sh4      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/c16588c6d4b596efc3b32808f67e40e2653eb539 | ORPH
 aarch64_be  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/fd9bb9b668db84975c27cbbca96bfd9eee7221d5 | ORPH
    i686     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/1f88f0dd66f18cc83b10aa00ee9e3237ca6e8c65 | ORPH
 microblaze  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/7e8ba7b5a757b945c9c79711b88080d79b8c3129 | ORPH
  sparc64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/eee3225d26f2a4c3157d40a4d66b824a0d408497 | ORPH
    m68k     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/b098891fc316843a69b01ce9c518e994f7ec43bb |     
 powerpc64   |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/fceeb01be14f7b4405941f5e276ddfece8067de1 |     
   mips64    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/1c847f4e733153c7a565c916b75acaac31a361af |     
    or1k     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/6162f3fae025ae588fee51dc93ea77e3b210be63 |     
  riscv64    |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/147e1118e3b8fcd6cacbdac686362a7213a01349 |     
   mips64    |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/ffd8f9f3f6cad99d9565f60a606c81e0b38ce7d5 |     
  riscv64    |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/6ba4cd9246522ebb7f786385034c8b6661f300e9 |     
  riscv32    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/36f0c0690618ab31137a148585e33e348b086ce1 | ORPH
  aarch64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/11463f8bceac8cc3e2d53bfbacb4cb5e05091fca | ORPH
    mips     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/d0a47a0ece130cfb4b78d3a56dea63277e8ab92d | ORPH
  sparc64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/d8e4d8b8d62b51eecab1662dbd62e6bb9a33692f | ORPH
   s390x     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/ad5e4d6445f3837778a5bb523990e912de995181 | ORPH
   mipsel    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/685914664f55c0f9ee47fd7c75963abe9a65c47e | ORPH
 microblaze  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/d761f99e9890175b0141430142b49852a1814b61 | ORPH
    sh4a     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/af5b3091bcae43c6e3fd95c129fb53424e4e856e | ORPH
   mipsel    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/16205c91b167eb40edd1c4a9ad76c59e600c0828 | ORPH
    m68k     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/0c8f5bc29e9d96f4cd88b73f3a25ef00a1dd1580 | ORPH
    arc      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/0c63e0c3e79867d44c0caca8f9ab6bf41a24b1cb | ORPH
  riscv64    |        host-runc-1.1.12        | NOK | http://autobuild.buildroot.net/results/fbfa9d6a489da7b4bb48f9c9ebf7fd206b62efeb |     
   mips64    |       host-skopeo-1.13.3       | NOK | http://autobuild.buildroot.net/results/9dacb15da7dcf4fb97cd2eaf17c5cb3c88290390 |     
  mips64el   |       host-skopeo-1.13.3       | NOK | http://autobuild.buildroot.net/results/e4dbb5c7eb1c952718c2efa9bcd2211681ac950a |     
   sh4eb     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/910c0fed38056782a2e8814bfb428a0f091eb4ab | ORPH
   armeb     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/bd39052ec7d3779a3c24763fdbe1a7028fba0c82 | ORPH
  powerpc    | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/a5559c4e0e87412643deb14a583a9a36357b6994 | ORPH
microblazeel | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/cdecb021c6a994c807ffa03168f88661b5bcc947 | ORPH
   xtensa    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/a8392a7313899625aec49074b9c655dbd2add561 |     
   s390x     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/dbad49e3fc58b936793a0e13ac6f4e0376efa67f |     
   armeb     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/562fe786ee717d2daf122a877899305f59c9ac3b |     
   s390x     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/c9de21f4db73f5bc3d320688da224da0c1d862eb |     
    m68k     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/1ea27e3c93f136b16f990cbe99bdd90d42b2a974 |     
   mipsel    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/f4dfc78320e4dc7f448e78f64f053880b9ba65c5 |     
 powerpc64   |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/b17d9b00c710c635aeb2f9321857bd3e70a0d91d |     
    arc      |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/96e207fdd5f1461082546aea13067c74da7cd00a |     
    arc      |        keepalived-2.2.8        | NOK | http://autobuild.buildroot.net/results/6fd2fbaa6ce5bf6be37e4662f95c0d38639c6e07 |     
   s390x     |         latencytop-0.5         | NOK | http://autobuild.buildroot.net/results/e2fc5c44a45d1978886064b7e645bb6ca08a40db | ORPH
 powerpc64   | libdbi-drivers-0bfae6c43134... | NOK | http://autobuild.buildroot.net/results/fb9860be2e7e669bb3468a84bbf45c93055f4739 |     
    i686     |          libdex-0.6.1          | NOK | http://autobuild.buildroot.net/results/f67c07d58d05b84f2f5c1e81d9ff92b62992152a |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/ea45bf635324222a66a4c077bd973da5594d267e |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/742e559e0b7d4ad34a4009403d27ec8d00176539 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/e9412cc6fc8311770d83c33632da414803b34929 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/1443e08ad1a057ad77ed40f1127b2aa6b892c10d |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/a2f30508140e6f1aca37e00a181864de283981c6 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/e06556c6c1892a3d63175b2c5f7ae523623417bf |     
microblazeel |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/c954ccd45e095b8f5c8691c79ff35004506f0ef7 | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/0e4d49ab00e1de103b37353f53f7bd845a1982fb | ORPH
  riscv64    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/c35b1354e2970411fb44da342e1e09e53214e75c |     
    or1k     |          libva-2.22.0          | NOK | http://autobuild.buildroot.net/results/e538d296a54d5466f3e49e9b4ee3132f4e2e1651 |     
  mips64el   |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/e8679047ab841ac5355cc129a51b0fbdf89d886b |     
  mips64el   |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/9e6a609c5f5026fd076edcb38427406c50895fc6 |     
   sparc     |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/501c1bc14b3dbd493f46137b23e96c5ba5fd70e6 | ORPH
   sparc     |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/bad2009f36b253cd88d13556132c321471bf0be8 | ORPH
  powerpc    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/be4c2eb6a100d1bbeef8db0e95bc9ccf845d784c | ORPH
    arm      |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/756c18cb4765c511a3a54c79caff6897e61ff97b | ORPH
    mips     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/74c8f337f598b55fd95efccab7b544e996eafb76 | ORPH
microblazeel |          linux-6.10.1          | NOK | http://autobuild.buildroot.net/results/3c497ac04634d0a19b8104c1e0a6e17c711a15cf | ORPH
   s390x     |          linux-6.10.1          | NOK | http://autobuild.buildroot.net/results/6f413319b777fb045568fb2e77e82f1c67a0d22f | ORPH
   mips64    |          linux-6.10.1          | NOK | http://autobuild.buildroot.net/results/c561f1c432905d38ad3f6b9821c5320b442af4e1 | ORPH
    sh4a     |          linux-6.10.1          | NOK | http://autobuild.buildroot.net/results/4183d2e4c5b43454c7a73a41fa4d8293816f3561 | ORPH
   nios2     |          linux-6.10.1          | NOK | http://autobuild.buildroot.net/results/f5cd157f55e340600c3db30b43da1bcf9ee69a75 | ORPH
    or1k     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/7ee39548da546be9fb4d07e05be398a15e0c1b46 | ORPH
    or1k     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/8a30615f4ab2df6fb448d8e38ec9289c916e4ca3 | ORPH
 microblaze  |          lvm2-2.03.23          | NOK | http://autobuild.buildroot.net/results/c290295089b3c04780a2b1b8ec0ae10de60cebbd | ORPH
   s390x     |       makedumpfile-1.7.5       | NOK | http://autobuild.buildroot.net/results/0841ec472d2ca68e7085e24f14c98119ce494661 |     
   xtensa    |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/893c1535b561b10771b558eefaa8c8efa67b1f3c | ORPH
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/1c909e6f615478f3869538c88b18859b97e3d48b | ORPH
  aarch64    |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/ef390933cf59fb850925e8f210ff9eda1658014b | ORPH
   s390x     |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/fcfac6e9db20e4f535257b145fe78a0606709854 | ORPH
  aarch64    |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/0300543d8615b482e0be384fcec9bcb23e1225c5 | ORPH
    i686     |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/5c0853c654939e8c7d475009e5b749e6fe86d1d3 |     
    arm      |         mokutil-0.7.2          | NOK | http://autobuild.buildroot.net/results/5101cbd263ed731eb32f873697acfc14afae8e95 |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/1285807b94e08b986cb90213d3158a2ce08a5313 |     
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/985f3f8fa7911f7b28c36ea6a70d64e666eb90a9 |     
   mipsel    |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/b79704a73a5df6ade622fb3bd2fce7de6ff0e68b |     
    or1k     |         netdata-1.33.1         | NOK | http://autobuild.buildroot.net/results/13d3869aab443f3931243ba4c7a54a4baf3975ae |     
   sparc     |          nginx-1.24.0          | NOK | http://autobuild.buildroot.net/results/e88c9514bde5f8ba03cf72c866f93de1a67b604c |     
  aarch64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/752b669d470fb42604644181b0db533ec2e30fe4 | ORPH
  sparc64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/ae95a7ff25a0fc023c8dfd2cba40e111695efc36 | ORPH
    i686     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/a66ce77c487560a1402b573ac9bd60737ec507ac | ORPH
 microblaze  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/82dadbb7419903da226eb0fd24c6dd34a0874986 | ORPH
    arc      |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/5de0244d88978a611f198927eaf083eb1ec8b265 | ORPH
   arceb     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/40f294346f84075a0f634dfc30c4e8a828a9b737 |     
 microblaze  |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/748944529450d69fbfe72122abc659d14d3887b9 |     
   xtensa    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/5683fc4d8e653f17171cc8d9fde938c0ca8b7a1a |     
    arc      |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/ab958c77bbdd98833b2172ad04671d6e8c02196f |     
   sh4eb     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/d7e0828afd2f80b6dab130ac5e3bad80a638c8f9 |     
   arceb     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/8216480b89212873b0474de306a21204f4ec476b |     
   mips64    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/99c2ca31bdb432a3edb048e5e933d34f328259e6 | ORPH
powerpc64le  |       parsec-tool-0.7.0        | NOK | http://autobuild.buildroot.net/results/b1ca7b931b1ba9a69928e5e0b689450b087755c7 |     
 microblaze  |        pcsc-lite-2.1.0         | NOK | http://autobuild.buildroot.net/results/c028cbed40110de1069f05a661bc98ad2a868cdb | ORPH
   nios2     |         pinentry-1.3.1         | NOK | http://autobuild.buildroot.net/results/9bc33daa9f6695d526b9ef46ebbdfe8d5edbfe30 | ORPH
  mips64el   |         pixman-0.42.2          | NOK | http://autobuild.buildroot.net/results/e4c7fecf8dc5b33cfcb5224f04c3f24a298ab796 | ORPH
 powerpc64   |         pixman-0.42.2          | NOK | http://autobuild.buildroot.net/results/f0c17ddfb910102e2cf34fc1ee7e9fe8793fb99b | ORPH
   xtensa    |         pixman-0.42.2          | NOK | http://autobuild.buildroot.net/results/ad0ecf5993a3c4b810a265f50b38a529ce279b9a | ORPH
  sparc64    |         pixman-0.42.2          | NOK | http://autobuild.buildroot.net/results/eca44af3a5f92c2c953e84e89b0b76fb9d929432 | ORPH
   arceb     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/32b595c900c42306969fcbda1fd5f87fd25dcefc | ORPH
powerpc64le  |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/41404d3f8782bcd15f8f9607fe3a104151c41623 | ORPH
 aarch64_be  |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/b6d3506025df2d75b3bd51943008263dd8202ca1 | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/3990448319b8e46574fcc4929468d7227eb16a4f | ORPH
   s390x     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/8601eae8a6842eb0fc3ee92f4ef075dbf202b69e | ORPH
 aarch64_be  |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/4ab72a9eac412fc76163b5daaaf9c6b13828d820 | ORPH
   xtensa    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/865a52388e51efc2bfc18b63c6f46e97e287d85d | ORPH
powerpc64le  |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/8ba78f6a2217b2d68da6b6fb340ef304d019ca2f | ORPH
  aarch64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/da4024497ddca15437a5f68b8b312c2612d8e330 | ORPH
   arceb     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/9675cb7f00fbe55162403895060d9b9e48fc0744 | ORPH
 aarch64_be  |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/1034e36dff8b6167f436e135579518b95f7ff180 | ORPH
    i686     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/bb68a26fa800733103549af993c4b81a68d9500f | ORPH
    arc      |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/fa69617091f71abd8793d48f375908b6badd2455 | ORPH
   x86_64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/def52e6a7ac9e80fbc63f1088ce1e4eba75c029f | ORPH
    mips     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/3988b40404432fe5cdaa63ff19053a93c143a80b | ORPH
    i686     |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.net/results/a3fe6405c1452e83b61ae20c80e0cda4c2be6708 | ORPH
    m68k     |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.net/results/7e34d2d9516813d60dd3079cea4fb9573b0417dd | ORPH
microblazeel |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/956e16f5d49a64b51d12772bb8c57cd825e2781e |     
powerpc64le  |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/e1ea922a8c42acb3ccded4628cdd7d6a44ceb614 |     
   nios2     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/eb5d1ecefdee6a3445aac4f2fd004dfe8dc7fad9 |     
  aarch64    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/9fe870b62a397f6d0a57fe9799822d714d698fb7 |     
   x86_64    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/19e9adb1000ef153aa860869fa24d3fb17d71d60 |     
  aarch64    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/d0a5158b1267c07d240c474a18a9ec422973fb6b |     
  sparc64    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/6309e99dce7cdae6a8213495069e95c7c580f905 |     
 aarch64_be  |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/33ff29e40f725616536b34ec976664e1330df7f9 |     
  mips64el   |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/5226c2d4c0be8fe1a38fdf8acf5593cc61c249a5 |     
   mipsel    |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/a97c70e43c7669803553d98e50be1ba0d1d2a8f7 |     
   mips64    |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/91ee416259d69eaf7257c5d040a33a9b8007139f |     
microblazeel |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/a4a27ff190bf2a05c97df70e15d83a23d8e2de60 |     
    i686     |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/b8beafb1d38027797421dc9a2f741d93bdedb70e |     
    sh4      |      python-zlmdb-22.6.1       | NOK | http://autobuild.buildroot.net/results/66b57589a40e123fa8ef24c49fec3a09efb649f1 |     
  mips64el   |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/6f78530b575d57ee86bad1d070fe200f4feba0de |     
   x86_64    |         rocksdb-6.20.3         | NOK | http://autobuild.buildroot.net/results/4bce2b028b6dcb8399496fa6fa51d60fd0b23f7a |     
   sparc     |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/a9680ac5f8f442ea9cbf218e16201dc7ee7c32b0 |     
   sparc     |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/209d9472235f038940089decff3e740c66916cd3 |     
   sparc     |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/3096faaaa354febc2de830e5238d520201a900be |     
    sh4a     |      sane-backends-1.1.1       | NOK | http://autobuild.buildroot.net/results/1dc04f95cf141b539c431b6642782eb300b90609 |     
   mipsel    |         shadow-4.15.1          | NOK | http://autobuild.buildroot.net/results/f65cedb7dee8ccbad7f9bf223481ef4ac8bda51f |     
  aarch64    |           shim-15.8            | NOK | http://autobuild.buildroot.net/results/fc419b03aa0fc81195b63d428b3746564b948f61 |     
   xtensa    |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/f0ad08563287a85d85a664d47eea427919d50253 |     
  mips64el   |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/fc56e821d0215b9b0a26bdb7dd1713770d52566e |     
   sparc     |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/9c95c0d53e76e74d5405fd46df54f9099190b879 |     
    m68k     |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/167e063eb623a02785b9f4c1b656d2fdf41f67bf |     
    mips     |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/e3f6454fdf47c3d01452a50452364b36985c787b |     
  sparc64    |         systemd-256.4          | NOK | http://autobuild.buildroot.net/results/8c463c17acf59643378d2a1be13d0e6dd89f8e43 |     
   nios2     |         systemd-256.4          | NOK | http://autobuild.buildroot.net/results/090ed08c66de9eabcbc65320972c80f05a3a2e51 |     
   armeb     |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/70d375a153a9a7924584136626e5b5cb96061bf8 |     
   xtensa    |        tipidee-0.0.5.0         | NOK | http://autobuild.buildroot.net/results/a0245f62c245242eb907564d7439ac61158eabed |     
    i686     |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/bd02135a0197d1d147f3e1654eeec2a85fda5be6 | ORPH
  aarch64    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/b46f62d3f6cb4bd470ec8742050604a39bbda2bb | ORPH
  powerpc    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/6d964915ecb1182e37110a1cbd71377cca2ba241 | ORPH
    arc      |         uclibc-1.0.49          | NOK | http://autobuild.buildroot.net/results/5b4a43bc86eaef599a2c95d998117b291d961e8e |     
    arc      |         uclibc-1.0.49          | NOK | http://autobuild.buildroot.net/results/b5ec1d22721aa4b308e643afd9cdc1b212b76fff |     
  aarch64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/3ab0c92acaa1193d1d539114cc6ac8c2abac31aa |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/b8d4944f22336d516d6da25cf9c54c8debbdd878 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/3c8b7c16569ef374ef1ce37c450d81b2119b6236 |     
   sh4eb     |            unknown             | NOK | http://autobuild.buildroot.net/results/f33735aba084cbf8ce8a53c53b156c1bda6677bf |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/6c5b8ced4969c1b892edf99f48c1587e7cf01d75 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/fe7b83d814992811fe89a74bf962e4a97a6c5b4c |     
   arceb     |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/8f1835283d2f03bf2bc4420f48b46b283078813a | ORPH
  mips64el   |         wolfssl-5.7.2          | NOK | http://autobuild.buildroot.net/results/99a5d7204f2a13f7845bc1102de24147dd06d350 |     
   sparc     |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/7e5ccaf8f64ad82c20e9f1f928e026b8838b6129 | ORPH
    m68k     |        zxing-cpp-2.2.1         | NOK | http://autobuild.buildroot.net/results/8a4a09e5c196ad30a91e45fa4fcb6cbe29b9bcc6 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                 host-tar-1.34 | 3 
               host-go-1.21.11 | 1 
host-heimdal-f4faaeaba371ff... | 1 
                       unknown | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        host-go-1.21.11         | NOK | http://autobuild.buildroot.net/results/f5957458cbb8a9e2521f674f6f1efd902c291c26 |     
  riscv64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/b75193c3a6a797edd863b779f5aaa5ce770ab394 | ORPH
  riscv32    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/a1049c9360fb5a57e79a2e98738356f72cd4c47a | ORPH
powerpc64le  |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/492c82c033c2f787cf0f2689d4d760c1d0005673 | ORPH
 aarch64_be  |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/4dab507287e2bfa12b067e871553a86b8d29e3ef | ORPH
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/7eddfeba8b459f1338f2b63bb7b81b591c89c984 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                       unknown | 4 
           ghostscript-10.03.1 | 2 
               alsa-lib-1.2.11 | 1 
                gnu-efi-3.0.18 | 1 
             gnuradio-3.10.7.0 | 1 
host-heimdal-f4faaeaba371ff... | 1 
           host-python3-3.11.8 | 1 
                mongodb-4.2.18 | 1 
toolchain-external-bootlin-... | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        alsa-lib-1.2.11         | NOK | http://autobuild.buildroot.net/results/350510e1bfc1b654ef03b02e8c86914912d7cd8c |     
   sparc     |      ghostscript-10.03.1       | NOK | http://autobuild.buildroot.net/results/5c0425aedf8bce214df21675df5735f902331582 |     
    arm      |      ghostscript-10.03.1       | NOK | http://autobuild.buildroot.net/results/3866e9957991f4566147bfda54fd2ded3e6c8604 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/75818f0e211ea513b9f8099670c50871428ca9dd |     
  mips64el   |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/6e344a188216abd1ef4047c5bf980709ca77ef25 |     
microblazeel | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/8ffc4dc6216fd00466b844a03e1d8354549ec911 | ORPH
    arm      |      host-python3-3.11.8       | NOK | http://autobuild.buildroot.net/results/b6df6119af13d866b6e2f086fa2927fa2b8ae677 |     
   x86_64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/4318a26bf41dcbc4ba87d5459091898916207d82 |     
powerpc64le  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/83dc07fb9621be01331a2d6cfea07328b1edbf78 | ORPH
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/970906775425b21cc1bfde697e6635eed35c9af9 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/a1b3b1093b60e45161297ab0eb2c2fe537dfada7 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/6796f077c0c07b450e5f1d7e2b4c16b4bb22078a |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/d075193f7ec8056185e32a24a0aca3a2dc5d8d2e |     


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org        |   version    |   upstream   | orph?
-------------------------------+----------+----------------------------------------------+--------------+--------------+-------
                           ace |  DISTRO  | https://release-monitoring.org/project/242395 | 7.1.1        | 8.0.0        | ORPH
                        acpica |  DISTRO  | https://release-monitoring.org/project/00018 | 20240321     | 20240322     |     
                       acsccid |  DISTRO  | https://release-monitoring.org/project/15661 | 1.1.10       | 1.1.11       |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/13117 | 3.37.2       | 46.2         |     
                       aespipe |  DISTRO  | https://release-monitoring.org/project/21320 | 2.4g         | 2.4h         | ORPH
                        alfred |  DISTRO  | https://release-monitoring.org/project/241870 | 2022.1       | 2024.2       | ORPH
                 android-tools |  GUESS   | https://release-monitoring.org/project/13989 | 4.2.2+git... | 14.0.0_r54   |     
                     angularjs |  DISTRO  | https://release-monitoring.org/project/21321 | 1.8.2        | 1.8.3        |     
                      apitrace |  DISTRO  | https://release-monitoring.org/project/06170 | 10.0         | 12.0         |     
                      apparmor |  DISTRO  | https://release-monitoring.org/project/94819 | 3.1.7        | 4.0.2        |     
                           apr |  DISTRO  | https://release-monitoring.org/project/00095 | 1.7.2        | 1.7.4        |     
                     armadillo |  DISTRO  | https://release-monitoring.org/project/07006 | 9.900.2      | 14.0.1       |     
                        assimp |  DISTRO  | https://release-monitoring.org/project/06988 | 5.3.1        | 5.4.2        | ORPH
                      asterisk |  DISTRO  | https://release-monitoring.org/project/09838 | 20.8.1       | 21.4.1       |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/07841 | 2.50.0       | 2.53.0       |     
                         atkmm |  DISTRO  | https://release-monitoring.org/project/07962 | 2.36.2       | 2.36.3       |     
                          atop |  DISTRO  | https://release-monitoring.org/project/00135 | 2.9.0        | 2.11.0       |     
                         audit |  DISTRO  | https://release-monitoring.org/project/15225 | 3.1.2        | 4.0.1        |     
                      automake |  DISTRO  | https://release-monitoring.org/project/00144 | 1.16.5       | 1.17         | ORPH
                       avocado |  DISTRO  | https://release-monitoring.org/project/13385 | 98.0         | 106.0        | ORPH
                       avrdude |  DISTRO  | https://release-monitoring.org/project/10751 | 7.2          | 7.3          |     
               azure-iot-sdk-c |  DISTRO  | https://release-monitoring.org/project/21322 | LTS_08_2023  | 3033-01-05   |     
                        babeld |  DISTRO  | https://release-monitoring.org/project/00154 | 1.9.2        | 1.13.1       | ORPH
                   babeltrace2 |  DISTRO  | https://release-monitoring.org/project/07137 | 2.0.4        | 2.0.6        |     
                 balena-engine |  DISTRO  | https://release-monitoring.org/project/141616 | 20.10.26     | 20.10.44     |     
               bash-completion |  DISTRO  | https://release-monitoring.org/project/05667 | 2.11         | 2.14.0       | ORPH
                        batctl |  DISTRO  | https://release-monitoring.org/project/14740 | 2023.1       | 2024.2       |     
                    batman-adv |  DISTRO  | https://release-monitoring.org/project/19529 | 2023.1       | 2024.2       |     
                           bcc |  DISTRO  | https://release-monitoring.org/project/12803 | 0.29.1       | 0.30.0       |     
                       bcm2835 |  DISTRO  | https://release-monitoring.org/project/21323 | 1.73         | 1.75         | ORPH
                     bctoolbox |  DISTRO  | https://release-monitoring.org/project/14746 | 4.4.8        | 5.3.74       | ORPH
                         bdwgc |  DISTRO  | https://release-monitoring.org/project/17108 | 8.2.4        | 8.2.6        |     
                     belle-sip |  DISTRO  | https://release-monitoring.org/project/14378 | 4.4.8        | 5.3.74       |     
                          belr |  DISTRO  | https://release-monitoring.org/project/80042 | 4.4.8        | 5.3.74       |     
                        bento4 |  DISTRO  | https://release-monitoring.org/project/317047 | 1.6.0-641... | 1.6.0-641... |     
                    berkeleydb |  GUESS   | https://release-monitoring.org/project/138386 | 5.3.28       | 18.1.10      | ORPH
                          bind |  DISTRO  | https://release-monitoring.org/project/14923 | 9.16.48      | 9.20.0       | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/07981 | 2.41         | 2.42         |     
                          bird |  DISTRO  | https://release-monitoring.org/project/00192 | 2.0.12       | 2.15.1       |     
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/13618 | 26.2         | 27.1         |     
                        blake3 |  DISTRO  | https://release-monitoring.org/project/369414 | 1.5.1        | 1.5.3        |     
                    bluez-alsa |  DISTRO  | https://release-monitoring.org/project/21324 | 4.1.1        | 4.2.0        | ORPH
                  bluez5_utils |  DISTRO  | https://release-monitoring.org/project/10029 | 5.75         | 5.77         |     
          bluez5_utils-headers |  DISTRO  | https://release-monitoring.org/project/10029 | 5.75         | 5.77         |     
                         boinc |  DISTRO  | https://release-monitoring.org/project/00211 | 7.20.2       | 8.0.4        |     
                        bonnie |  DISTRO  | https://release-monitoring.org/project/00212 | 1.03e        | 2.00a        | ORPH
                         boost |  DISTRO  | https://release-monitoring.org/project/06845 | 1.83.0       | 1.85.0       |     
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/21578 | 4.3.1        | 5.3.3        |     
                         botan |  DISTRO  | https://release-monitoring.org/project/00214 | 3.3.0        | 3.5.0        | ORPH
                       bpftool |  DISTRO  | https://release-monitoring.org/project/328454 | v7.1.0       | 7.4.0        |     
                      bpftrace |  DISTRO  | https://release-monitoring.org/project/141354 | 0.19.1       | 0.21.2       |     
                        c-ares |  DISTRO  | https://release-monitoring.org/project/05840 | 1.32.2       | 1.32.3       | ORPH
                        c-icap |  DISTRO  | https://release-monitoring.org/project/21325 | 0.5.10       | 0.6.3        | ORPH
                c-icap-modules |  DISTRO  | https://release-monitoring.org/project/21326 | 0.5.5        | 0.5.7        | ORPH
               ca-certificates |  DISTRO  | https://release-monitoring.org/project/09026 | 20230311     | 20240203     |     
                       cairomm |  DISTRO  | https://release-monitoring.org/project/07959 | 1.16.2       | 1.18.0       |     
                   cairomm1_14 |  DISTRO  | https://release-monitoring.org/project/369459 | 1.14.4       | 1.14.5       |     
                    cannelloni |  DISTRO  | https://release-monitoring.org/project/21403 | 1.0.0        | 1.1.0        |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/10888 | 0.0.25       | 0.303.1      | ORPH
                     capnproto |  DISTRO  | https://release-monitoring.org/project/11515 | 0.10.4       | 1.0.2        |     
                        ccache |  DISTRO  | https://release-monitoring.org/project/00257 | 4.10.1       | 4.10.2       | ORPH
                          ccid |  DISTRO  | https://release-monitoring.org/project/02612 | 1.5.2        | 1.6.1        | ORPH
                       chartjs |  DISTRO  | https://release-monitoring.org/project/85785 | 3.9.1        | 4.4.3        | ORPH
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/00276 | 3.6          | 20200710     |     
                       chicken |  DISTRO  | https://release-monitoring.org/project/00280 | 5.3.0        | 5.4.0        |     
                        chrony |  DISTRO  | https://release-monitoring.org/project/08810 | 4.4          | 4.5          | ORPH
                    cifs-utils |  DISTRO  | https://release-monitoring.org/project/00287 | 6.15         | 7.0          |     
                        circus |  DISTRO  | https://release-monitoring.org/project/21726 | 0.16.1       | 0.18.0       |     
                        clamav |  DISTRO  | https://release-monitoring.org/project/00291 | 1.0.6        | 1.3.1        |     
                         clang |  DISTRO  | https://release-monitoring.org/project/11811 | 15.0.3       | 18.1.8       |     
                         cli11 |  DISTRO  | https://release-monitoring.org/project/20578 | 2.3.2        | 2.4.2        |     
                        clinfo |  DISTRO  | https://release-monitoring.org/project/10503 | 3.0.21.02.21 | 3.0.23.01.25 |     
                         cloop |  DISTRO  | https://release-monitoring.org/project/21332 | 3.14.1.3     | 3.14.1.3+... |     
                   cloudflared |  DISTRO  | https://release-monitoring.org/project/186920 | 2024.6.1     | 2024.7.1     |     
                         cmake |  DISTRO  | https://release-monitoring.org/project/00306 | 3.30.0       | 3.30.1       |     
                        cmocka |  DISTRO  | https://release-monitoring.org/project/11779 | 1.1.5        | 1.1.7        |     
                   cni-plugins |  DISTRO  | https://release-monitoring.org/project/96794 | 1.3.0        | 1.5.1        |     
                      collectl |  DISTRO  | https://release-monitoring.org/project/00330 | 4.3.2        | 4.3.8        |     
                 comix-cursors |  DISTRO  | https://release-monitoring.org/project/21882 | 0.9.1        | 0.10.0       | ORPH
                   compiler-rt |  DISTRO  | https://release-monitoring.org/project/17705 | 15.0.3       | 18.1.8       |     
                      composer |  DISTRO  | https://release-monitoring.org/project/09710 | 2.5.8        | 2.7.7        |     
                        conmon |  DISTRO  | https://release-monitoring.org/project/96793 | 2.1.8        | 2.1.12       |     
               conntrack-tools |  DISTRO  | https://release-monitoring.org/project/00338 | 1.4.7        | 1.4.8        | ORPH
                     coreutils |  DISTRO  | https://release-monitoring.org/project/00343 | 9.3          | 9.5          | ORPH
                      cracklib |  DISTRO  | https://release-monitoring.org/project/00362 | 2.9.11       | 2.10.1       |     
                       crudini |  DISTRO  | https://release-monitoring.org/project/21669 | 0.9.3        | 0.9.5        |     
               cryptodev-linux |  DISTRO  | https://release-monitoring.org/project/21409 | 1.13         | 1.14         | ORPH
                       cukinia |  DISTRO  | https://release-monitoring.org/project/138119 | 0.6.0        | 0.7.0        | ORPH
                          cups |  DISTRO  | https://release-monitoring.org/project/00380 | 2.4.7        | 2.4.10       |     
                  cups-filters |  DISTRO  | https://release-monitoring.org/project/05541 | 1.28.17      | 2.0.0        |     
                      cutelyst |  DISTRO  | https://release-monitoring.org/project/21335 | 2.11.0       | 4.3.0        |     
                        dacapo |  DISTRO  | https://release-monitoring.org/project/20546 | 9.12-MR1-... | 2006-10-MR2  |     
                          dado |  DISTRO  | https://release-monitoring.org/project/58442 | 1.8.3-1      | 2.2.0-1      |     
                   dahdi-linux |  DISTRO  | https://release-monitoring.org/project/21412 | 3.3.0        | 3.4.0        |     
                   dahdi-tools |  DISTRO  | https://release-monitoring.org/project/10252 | 3.3.0        | 3.4.0        |     
                          daq3 |  DISTRO  | https://release-monitoring.org/project/212345 | 3.0.9        | 3.0.15       |     
                     darkhttpd |  DISTRO  | https://release-monitoring.org/project/00391 | 1.15         | 1.16         |     
                    datatables |  DISTRO  | https://release-monitoring.org/project/141588 | 1.10.20      | 1.13.4       | ORPH
            datatables-buttons |  DISTRO  | https://release-monitoring.org/project/141589 | 1.6.1        | 2.3.6        | ORPH
       datatables-fixedcolumns |  DISTRO  | https://release-monitoring.org/project/141590 | 3.3.0        | 4.2.2        | ORPH
         datatables-responsive |  DISTRO  | https://release-monitoring.org/project/141591 | 2.2.3        | 2.4.1        | ORPH
                   dbus-broker |  DISTRO  | https://release-monitoring.org/project/271475 | 33           | 36           |     
                      dbus-cxx |  DISTRO  | https://release-monitoring.org/project/242464 | 2.4.0        | 2.5.1        |     
                   dbus-python |  DISTRO  | https://release-monitoring.org/project/00402 | 1.2.18       | 1.3.2        | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/15086 | 7.2.641      | 7.3.1        | ORPH
                   debianutils |  DISTRO  | https://release-monitoring.org/project/21341 | 4.11         | 5.20         | ORPH
                         delve |  DISTRO  | https://release-monitoring.org/project/40149 | 1.22.1       | 1.23.0       |     
            desktop-file-utils |  DISTRO  | https://release-monitoring.org/project/00421 | 0.26         | 0.27         | ORPH
                        dialog |  DISTRO  | https://release-monitoring.org/project/00431 | 1.3-20220117 | 1.3-20240619 | ORPH
                         dillo |  DISTRO  | https://release-monitoring.org/project/00438 | 3.0.5        | 3.1.1        | ORPH
                    docker-cli |  DISTRO  | https://release-monitoring.org/project/21076 | 27.0.3       | 27.1.1       |     
             docker-cli-buildx |  DISTRO  | https://release-monitoring.org/project/369144 | 0.16.1       | 0.16.2       | ORPH
                docker-compose |  DISTRO  | https://release-monitoring.org/project/06185 | 2.27.1       | 2.29.1       |     
                 docker-engine |  DISTRO  | https://release-monitoring.org/project/00447 | 27.0.3       | 27.1.1       |     
                      domoticz |  DISTRO  | https://release-monitoring.org/project/21342 | 2024.4       | 2024.7       |     
             double-conversion |  DISTRO  | https://release-monitoring.org/project/07454 | 3.2.1        | 3.3.0        |     
                        dracut |  DISTRO  | https://release-monitoring.org/project/10627 | 059          | 103          |     
                    drbd-utils |  DISTRO  | https://release-monitoring.org/project/00462 | 9.21.4       | 9.28.0       |     
                            dt |  DISTRO  | https://release-monitoring.org/project/21844 | 18.32        | 21.27        | ORPH
                      dt-utils |  DISTRO  | https://release-monitoring.org/project/21419 | 2023.08.0    | 2023.11.0    |     
                          dust |  DISTRO  | https://release-monitoring.org/project/141344 | 0.9.0        | 1.1.1        | ORPH
                     e2fsprogs |  DISTRO  | https://release-monitoring.org/project/00646 | 1.47.0       | 1.47.1       | ORPH
                      earlyoom |  DISTRO  | https://release-monitoring.org/project/17392 | 1.7          | 1.8.2        |     
                      easy-rsa |  DISTRO  | https://release-monitoring.org/project/17770 | 3.1.7        | 3.2.0        |     
                          edk2 |  DISTRO  | https://release-monitoring.org/project/125953 | edk2-stab... | 202405       |     
                           efl |  DISTRO  | https://release-monitoring.org/project/06128 | 1.26.3       | 1.27.0       |     
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/00667 | 23.04        | 24.07        |     
                       elf2flt |  DISTRO  | https://release-monitoring.org/project/115314 | 2024.02      | 2024.05      | ORPH
                      elfutils |  DISTRO  | https://release-monitoring.org/project/05679 | 0.189        | 0.191        | ORPH
                           ell |  DISTRO  | https://release-monitoring.org/project/17781 | 0.65         | 0.67         | ORPH
                       enchant |  DISTRO  | https://release-monitoring.org/project/06601 | 2.3.3        | 2.8.1        |     
                          enet |  DISTRO  | https://release-monitoring.org/project/00696 | 1.3.17       | 1.3.18       |     
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/00698 | 0.25.4       | 0.26.0       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/00707 | 26.0.2       | 27.0.1       |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/17060 | 1.0.22       | 1.0.23       |     
                   erlang-jose |  DISTRO  | https://release-monitoring.org/project/16913 | 1.11.5       | 1.11.10      |     
                erlang-p1-acme |  DISTRO  | https://release-monitoring.org/project/45375 | 1.0.22       | 1.0.23       |     
           erlang-p1-cache-tab |  DISTRO  | https://release-monitoring.org/project/08757 | 1.0.30       | 1.0.31       |     
              erlang-p1-mqtree |  DISTRO  | https://release-monitoring.org/project/20220 | 1.0.15       | 1.0.17       |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/09302 | 0.6.11       | 0.8.0        |     
                erlang-p1-pkix |  DISTRO  | https://release-monitoring.org/project/20539 | 1.0.9        | 1.0.10       |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/10576 | 1.0.49       | 1.0.54       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/09222 | 1.0.29       | 1.0.30       |     
                erlang-p1-stun |  DISTRO  | https://release-monitoring.org/project/09151 | 1.2.7        | 1.2.14       |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/10455 | 1.1.16       | 1.1.21       |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/08643 | 1.0.25       | 1.0.26       |     
                 erlang-p1-xml |  DISTRO  | https://release-monitoring.org/project/10464 | 1.1.49       | 1.1.52       |     
                erlang-p1-xmpp |  DISTRO  | https://release-monitoring.org/project/12752 | 1.6.2        | 1.8.3        |     
                erlang-p1-yaml |  DISTRO  | https://release-monitoring.org/project/10243 | 1.0.36       | 1.0.37       |     
               erlang-p1-yconf |  DISTRO  | https://release-monitoring.org/project/45378 | 1.0.15       | 1.0.16       |     
                erlang-p1-zlib |  DISTRO  | https://release-monitoring.org/project/09283 | 1.0.12       | 1.0.13       |     
                       ethtool |  DISTRO  | https://release-monitoring.org/project/00763 | 6.7          | 6.9          |     
                        exempi |  DISTRO  | https://release-monitoring.org/project/00767 | 2.6.3        | 2.6.5        |     
                    exfatprogs |  DISTRO  | https://release-monitoring.org/project/94441 | 1.2.2        | 1.2.4        |     
                         exiv2 |  DISTRO  | https://release-monitoring.org/project/00769 | 0.27.6       | 0.28.3       |     
                           eza |  DISTRO  | https://release-monitoring.org/project/369474 | 0.18.22      | 0.18.23      |     
                      fakeroot |  DISTRO  | https://release-monitoring.org/project/12048 | 1.34         | 1.35.1       | ORPH
                          fcft |  DISTRO  | https://release-monitoring.org/project/143240 | 3.1.6        | 3.1.8        |     
                           feh |  DISTRO  | https://release-monitoring.org/project/00790 | 3.7.1        | 3.10.3       |     
                        ffmpeg |  DISTRO  | https://release-monitoring.org/project/05405 | 6.1.1        | 7.0.1        |     
                     findutils |  DISTRO  | https://release-monitoring.org/project/00812 | 4.9.0        | 4.10.0       | ORPH
                           fio |  DISTRO  | https://release-monitoring.org/project/00806 | 3.34         | 3.37         |     
                     firewalld |  DISTRO  | https://release-monitoring.org/project/09989 | 2.0.2        | 2.2.1        | ORPH
                      flashrom |  DISTRO  | https://release-monitoring.org/project/10202 | 1.4.0-rc2    | 1.4.0        |     
                   flatbuffers |  DISTRO  | https://release-monitoring.org/project/16642 | 23.5.26      | 24.3.25      |     
                          flot |  DISTRO  | https://release-monitoring.org/project/07184 | 0.8.3        | 4.2.6        | ORPH
                          fltk |  DISTRO  | https://release-monitoring.org/project/00823 | 1.3.7        | 1.3.9        | ORPH
                    fluent-bit |  DISTRO  | https://release-monitoring.org/project/267335 | 3.1.3        | 3.1.4        |     
                           fmc |  GUESS   | https://release-monitoring.org/project/145761 | LSDK-21.08   | 0.2.0        | ORPH
                           fmt |  DISTRO  | https://release-monitoring.org/project/11526 | 11.0.1       | 11.0.2       |     
                       fmtools |  DISTRO  | https://release-monitoring.org/project/21435 | 2.0.7        | 2.0.8        | ORPH
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/00826 | 4.7.0        | 6.6.0        | ORPH
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/00827 | 2.14.2       | 2.15.0       | ORPH
                          foot |  DISTRO  | https://release-monitoring.org/project/141611 | 1.16.2       | 1.17.2       |     
                         fping |  DISTRO  | https://release-monitoring.org/project/00834 | 5.1          | 5.2          |     
             freeradius-server |  DISTRO  | https://release-monitoring.org/project/00853 | 3.2.3        | 3.2.5        |     
                       freerdp |  DISTRO  | https://release-monitoring.org/project/10442 | 2.11.6       | 3.6.3        |     
                           frr |  DISTRO  | https://release-monitoring.org/project/18555 | 8.5.4        | 10.0.1       |     
                    fscryptctl |  DISTRO  | https://release-monitoring.org/project/270981 | 1.0.0        | 1.2.0        |     
                fuse-overlayfs |  DISTRO  | https://release-monitoring.org/project/101220 | 1.13         | 1.14         |     
                          fwup |  DISTRO  | https://release-monitoring.org/project/21438 | 1.9.1        | 1.10.2       |     
                           gcr |  DISTRO  | https://release-monitoring.org/project/11801 | 3.40.0       | 4.3.0        | ORPH
                          gdal |  DISTRO  | https://release-monitoring.org/project/00881 | 3.8.2        | 3.9.1        |     
                    gdk-pixbuf |  DISTRO  | https://release-monitoring.org/project/09533 | 2.42.10      | 2.42.12      | ORPH
                      genimage |  DISTRO  | https://release-monitoring.org/project/21351 | 17           | 18           |     
                        gensio |  DISTRO  | https://release-monitoring.org/project/67634 | 2.5.5        | 2.8.5        |     
                       gerbera |  DISTRO  | https://release-monitoring.org/project/18420 | 1.12.1       | 2.2.0        |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/00898 | 0.22.4       | 0.22.5       | ORPH
                 gitlab-runner |  DISTRO  | https://release-monitoring.org/project/11337 | 15.5.0       | 17.2.1       |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/21353 | 2.76.0       | 2.80.0       | ORPH
                        glibmm |  DISTRO  | https://release-monitoring.org/project/07960 | 2.76.0       | 2.80.0       |     
                    glibmm2_66 |  DISTRO  | https://release-monitoring.org/project/369440 | 2.66.6       | 2.66.7       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/01181 | 1.0.0        | 1.0.1        | ORPH
                          glog |  DISTRO  | https://release-monitoring.org/project/08732 | 0.7.0        | 0.7.1        |     
                      gnuradio |  DISTRO  | https://release-monitoring.org/project/01217 | 3.10.7.0     | 3.10.11.0    |     
                        gnutls |  DISTRO  | https://release-monitoring.org/project/01221 | 3.8.3        | 3.8.6        | ORPH
         gobject-introspection |  DISTRO  | https://release-monitoring.org/project/01223 | 1.76.1       | 1.80.1       | ORPH
                     gocryptfs |  DISTRO  | https://release-monitoring.org/project/21085 | 2.3.2        | 2.4.0        |     
                          gqrx |  DISTRO  | https://release-monitoring.org/project/09771 | 2.15.9       | 2.17.5       |     
                    gr-osmosdr |  DISTRO  | https://release-monitoring.org/project/21447 | 0.2.4        | 0.2.6        |     
                       granite |  DISTRO  | https://release-monitoring.org/project/05410 | 6.2.0        | 7.5.0        | ORPH
                      grantlee |  DISTRO  | https://release-monitoring.org/project/21448 | 5.2.0        | 5.3.1        |     
                graphicsmagick |  DISTRO  | https://release-monitoring.org/project/01248 | 1.3.40       | 1.3.43       |     
                          grpc |  DISTRO  | https://release-monitoring.org/project/19117 | 1.51.1       | 1.65.2       |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/13139 | 45.0         | 46.1         |     
                           gsl |  DISTRO  | https://release-monitoring.org/project/01267 | 2.7.1        | 2.8          | ORPH
                       gst-omx |  DISTRO  | https://release-monitoring.org/project/21845 | 1.22.9       | 1.22.12      | ORPH
                 gst1-devtools |  DISTRO  | https://release-monitoring.org/project/21856 | 1.22.9       | 1.24.5       | ORPH
                      gst1-imx |  DISTRO  | https://release-monitoring.org/project/21846 | 0.13.1       | 2.2.0        |     
                    gst1-libav |  DISTRO  | https://release-monitoring.org/project/21848 | 1.22.9       | 1.24.5       | ORPH
              gst1-plugins-bad |  DISTRO  | https://release-monitoring.org/project/21849 | 1.22.9       | 1.24.5       | ORPH
             gst1-plugins-base |  DISTRO  | https://release-monitoring.org/project/21850 | 1.22.9       | 1.24.5       | ORPH
             gst1-plugins-good |  DISTRO  | https://release-monitoring.org/project/21852 | 1.22.9       | 1.24.5       | ORPH
             gst1-plugins-ugly |  DISTRO  | https://release-monitoring.org/project/15187 | 1.22.9       | 1.24.5       | ORPH
                   gst1-python |  DISTRO  | https://release-monitoring.org/project/03881 | 1.22.9       | 1.24.5       | ORPH
              gst1-rtsp-server |  DISTRO  | https://release-monitoring.org/project/21853 | 1.22.9       | 1.24.5       | ORPH
                    gst1-vaapi |  DISTRO  | https://release-monitoring.org/project/21855 | 1.22.9       | 1.24.5       | ORPH
                    gstreamer1 |  DISTRO  | https://release-monitoring.org/project/01263 | 1.22.9       | 1.24.5       | ORPH
   gstreamer1-editing-services |  DISTRO  | https://release-monitoring.org/project/230920 | 1.22.9       | 1.24.5       | ORPH
                         gtest |  DISTRO  | https://release-monitoring.org/project/18290 | 1.14.0       | 1.15.0       |     
                        gtkmm3 |  DISTRO  | https://release-monitoring.org/project/311572 | 3.24.8       | 3.24.9       |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/07724 | 3.24.7       | 5.12.1       |     
                         guile |  DISTRO  | https://release-monitoring.org/project/01277 | 3.0.9        | 3.0.10       |     
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/01285 | 5.2.14       | 5.3.4        | ORPH
                          gvfs |  DISTRO  | https://release-monitoring.org/project/05496 | 1.48.1       | 1.55.1       | ORPH
                        hackrf |  DISTRO  | https://release-monitoring.org/project/06136 | 2023.01.1    | 2024.02.1    | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/01298 | 2.6.15       | 3.0.0        |     
                      hiawatha |  DISTRO  | https://release-monitoring.org/project/13375 | 11.2         | 11.5         |     
            hicolor-icon-theme |  DISTRO  | https://release-monitoring.org/project/01316 | 0.17         | 0.18         |     
                         hplip |  DISTRO  | https://release-monitoring.org/project/01327 | 3.17.10      | 3.24.4       | ORPH
                         hwloc |  DISTRO  | https://release-monitoring.org/project/13501 | 2.9.3        | 2.11.1       |     
                          i2pd |  DISTRO  | https://release-monitoring.org/project/21355 | 2.50.2       | 2.53.0       |     
                   ibm-sw-tpm2 |  DISTRO  | https://release-monitoring.org/project/18952 | rev183-20... | 1682         |     
                           icu |  DISTRO  | https://release-monitoring.org/project/16134 | 73-2         | 75-1         | ORPH
                     ifenslave |  DISTRO  | https://release-monitoring.org/project/21670 | 2.9          | 2.14         | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/21673 | 0.8.41       | 0.8.43       | ORPH
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/01372 | 7.1.1-31     | 7.1.1-35     | ORPH
                        imlib2 |  DISTRO  | https://release-monitoring.org/project/21676 | 1.7.3        | 1.12.3       |     
                 inotify-tools |  DISTRO  | https://release-monitoring.org/project/08864 | 3.20.2.2     | 4.23.9.0     | ORPH
                        iperf3 |  DISTRO  | https://release-monitoring.org/project/01389 | 3.16         | 3.17.1       | ORPH
                         ipset |  DISTRO  | https://release-monitoring.org/project/01393 | 7.16         | 7.22         |     
                    irqbalance |  DISTRO  | https://release-monitoring.org/project/01402 | 1.9.3        | 1.9.4        |     
                         irssi |  DISTRO  | https://release-monitoring.org/project/01404 | 1.4.4        | 1.4.5        |     
                            iw |  DISTRO  | https://release-monitoring.org/project/01410 | 5.19         | 6.9          | ORPH
                           iwd |  DISTRO  | https://release-monitoring.org/project/18380 | 2.17         | 2.19         | ORPH
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/15715 | 1.1.2        | 1.2.3        |     
                        jasper |  DISTRO  | https://release-monitoring.org/project/01421 | 2.0.33       | 4.2.4        |     
                      jbig2dec |  DISTRO  | https://release-monitoring.org/project/01431 | 0.19         | 0.20         |     
                        jimtcl |  DISTRO  | https://release-monitoring.org/project/01459 | 0.81         | 0.82         |     
         jitterentropy-library |  DISTRO  | https://release-monitoring.org/project/29701 | 3.4.1        | 3.5.0        | ORPH
                            jo |  DISTRO  | https://release-monitoring.org/project/18855 | 1.6          | 1.9          |     
                          jose |  DISTRO  | https://release-monitoring.org/project/11761 | 11           | 14           |     
                    jpeg-turbo |  DISTRO  | https://release-monitoring.org/project/01648 | 2.1.5        | 3.0.3        |     
         jquery-datetimepicker |  DISTRO  | https://release-monitoring.org/project/13910 | 2.4.5        | 2.5.20       |     
               jquery-keyboard |  DISTRO  | https://release-monitoring.org/project/21681 | 1.18.12      | 1.30.4       | ORPH
                 jquery-mobile |  DISTRO  | https://release-monitoring.org/project/59395 | 1.4.3        | 1.4.5        | ORPH
                     jquery-ui |  DISTRO  | https://release-monitoring.org/project/21815 | 1.13.1       | 1.13.3       |     
              jquery-ui-themes |  DISTRO  | https://release-monitoring.org/project/21816 | 1.10.4       | 1.13.3       |     
             jquery-validation |  DISTRO  | https://release-monitoring.org/project/21817 | 1.19.5       | 1.21.0       | ORPH
                     json-glib |  DISTRO  | https://release-monitoring.org/project/13144 | 1.8.0        | 1.9.2        | ORPH
                           kbd |  DISTRO  | https://release-monitoring.org/project/01492 | 2.5.1        | 2.6.4        | ORPH
                    keepalived |  DISTRO  | https://release-monitoring.org/project/01504 | 2.2.8        | 2.3.1        |     
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 6.4.0        |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 6.4.0        |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 6.4.0        |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 6.4.0        |     
                          kmod |  DISTRO  | https://release-monitoring.org/project/01517 | 31           | 32           |     
                          kodi |  DISTRO  | https://release-monitoring.org/project/05511 | 21.0-Omega   | 21.0         |     
        kodi-jsonschemabuilder |  DISTRO  | https://release-monitoring.org/project/05511 | 21.0-Omega   | 21.0         |     
               kodi-pvr-vuplus |  DISTRO  | https://release-monitoring.org/project/21773 | 21.1.2-Omega | 21.2.0       |     
            kodi-texturepacker |  DISTRO  | https://release-monitoring.org/project/05511 | 21.0-Omega   | 21.0         |     
                  kompexsqlite |  DISTRO  | https://release-monitoring.org/project/21462 | 1.12.15      | 1.13.15      | ORPH
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/12418 | 2.2.0        | 2.3.1        |     
                        lapack |  DISTRO  | https://release-monitoring.org/project/01534 | 3.10.1       | 3.12.0       |     
                          less |  DISTRO  | https://release-monitoring.org/project/01550 | 643          | 661          | ORPH
                 libabseil-cpp |  DISTRO  | https://release-monitoring.org/project/115295 | 20230802.1   | 20240116.2   |     
                         libao |  DISTRO  | https://release-monitoring.org/project/07629 | 1.2.0        | 1.2.2        | ORPH
                   libapparmor |  DISTRO  | https://release-monitoring.org/project/94819 | 3.1.7        | 4.0.2        |     
                        libass |  DISTRO  | https://release-monitoring.org/project/01560 | 0.17.1       | 0.17.3       |     
                     libassuan |  DISTRO  | https://release-monitoring.org/project/01559 | 2.5.7        | 3.0.1        | ORPH
                       libavif |  DISTRO  | https://release-monitoring.org/project/178015 | 1.0.4        | 1.1.0        |     
                        libbpf |  DISTRO  | https://release-monitoring.org/project/141355 | 1.1.0        | 1.4.5        |     
                        libbsd |  DISTRO  | https://release-monitoring.org/project/01567 | 0.11.7       | 0.12.2       |     
                     libcamera |  DISTRO  | https://release-monitoring.org/project/301902 | v0.3.0       | 0.3.1        |     
                     libcgroup |  DISTRO  | https://release-monitoring.org/project/01575 | 2.0.3        | 3.1.0        |     
                 libcpprestsdk |  DISTRO  | https://release-monitoring.org/project/15531 | 2.10.18      | 2.10.19      | ORPH
                      libdecor |  DISTRO  | https://release-monitoring.org/project/312806 | 0.1.1        | 0.2.2        |     
                        libdex |  DISTRO  | https://release-monitoring.org/project/328356 | 0.6.1        | 0.7.0        |     
                       libdnet |  DISTRO  | https://release-monitoring.org/project/06308 | 1.16.4       | 1.18.0       | ORPH
                       libedit |  DISTRO  | https://release-monitoring.org/project/01599 | 20230828-3.1 | 20240517-3.1 |     
                      libevdev |  DISTRO  | https://release-monitoring.org/project/20540 | 1.13.1       | 1.13.2       |     
                   libfastjson |  DISTRO  | https://release-monitoring.org/project/12043 | 0.99.9.1     | 1.2304.0     |     
                   libfreeglut |  DISTRO  | https://release-monitoring.org/project/00846 | 3.4.0        | 3.6.0        |     
                      libglade |  DISTRO  | https://release-monitoring.org/project/01174 | 2.6.4        | 3.40.0       | ORPH
                       libglfw |  DISTRO  | https://release-monitoring.org/project/01180 | 3.3.8        | 3.4          |     
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/10024 | 2.76.1       | 2.80.4       |     
                      libglvnd |  DISTRO  | https://release-monitoring.org/project/12098 | 1.4.0        | 1.7.0        | ORPH
                  libgpg-error |  DISTRO  | https://release-monitoring.org/project/01628 | 1.49         | 1.50         | ORPH
                    libgphoto2 |  DISTRO  | https://release-monitoring.org/project/12558 | 2.5.27       | 2.5.31       | ORPH
                      libgpiod |  GUESS   | https://release-monitoring.org/project/20640 | 1.6.4        | 2.1.2        | ORPH
                     libgpiod2 |  DISTRO  | https://release-monitoring.org/project/20640 | 2.1          | 2.1.2        |     
                      libgsasl |  DISTRO  | https://release-monitoring.org/project/01563 | 1.10.0       | 2.2.1        | ORPH
                       libgtk4 |  DISTRO  | https://release-monitoring.org/project/13942 | 4.12.4       | 4.14.4       |     
                      libgudev |  DISTRO  | https://release-monitoring.org/project/07735 | 237          | 238          |     
                       libheif |  DISTRO  | https://release-monitoring.org/project/64439 | 1.17.6       | 1.18.1       |     
                     libiberty |  DISTRO  | https://release-monitoring.org/project/07981 | 2.41         | 2.42         |     
                       libical |  DISTRO  | https://release-monitoring.org/project/01637 | 1.0.1        | 3.0.18       |     
                      libiconv |  DISTRO  | https://release-monitoring.org/project/10656 | 1.15         | 1.17         | ORPH
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/21479 | 0.10.3       | 2.3.0        |     
                      libinput |  DISTRO  | https://release-monitoring.org/project/05781 | 1.26.0       | 1.26.1       |     
                        libjwt |  DISTRO  | https://release-monitoring.org/project/242868 | 1.17.0       | 1.17.2       |     
                         libks |  DISTRO  | https://release-monitoring.org/project/241898 | 2.0.5        | 2.0.6        | ORPH
                       libksba |  DISTRO  | https://release-monitoring.org/project/01649 | 1.6.6        | 1.6.7        | ORPH
                     liblinear |  DISTRO  | https://release-monitoring.org/project/21363 | 2.45         | 2.47         |     
                         liblo |  DISTRO  | https://release-monitoring.org/project/21483 | 0.31         | 0.32         | ORPH
                       libmdbx |  DISTRO  | https://release-monitoring.org/project/141559 | 0.12.10      | 0.12.11      |     
                  libminiupnpc |  DISTRO  | https://release-monitoring.org/project/01986 | 2.2.7        | 2.2.8        |     
                     libmspack |  DISTRO  | https://release-monitoring.org/project/16827 | 0.10.1alpha  | 1.11         |     
                        libndp |  DISTRO  | https://release-monitoring.org/project/14944 | 1.8          | 1.9          |     
                   libnetconf2 |  DISTRO  | https://release-monitoring.org/project/31639 | 2.1.28       | 3.3.3        |     
                      libnftnl |  DISTRO  | https://release-monitoring.org/project/01681 | 1.2.6        | 1.2.7        |     
                       libnice |  DISTRO  | https://release-monitoring.org/project/01683 | 0.1.21       | 0.1.22       |     
                         libnl |  DISTRO  | https://release-monitoring.org/project/01684 | 3.9.0        | 3.10.0       | ORPH
                     libnpupnp |  DISTRO  | https://release-monitoring.org/project/75209 | 4.2.2        | 6.1.3        |     
                   libopenh264 |  DISTRO  | https://release-monitoring.org/project/21365 | 2.4.0        | 2.4.1        |     
                    libopenmpt |  DISTRO  | https://release-monitoring.org/project/141468 | 0.7.8        | 0.7.9        |     
                     libostree |  DISTRO  | https://release-monitoring.org/project/10899 | 2023.8       | 2024.7       |     
                       libpeas |  DISTRO  | https://release-monitoring.org/project/06871 | 1.32.0       | 2.0.3        | ORPH
                      libpjsip |  DISTRO  | https://release-monitoring.org/project/15701 | 2.14         | 2.14.1       |     
                      libplist |  DISTRO  | https://release-monitoring.org/project/11675 | 2.4.0        | 2.6.0        | ORPH
                       libpqxx |  DISTRO  | https://release-monitoring.org/project/21367 | 7.7.5        | 7.9.1        |     
                        libpri |  DISTRO  | https://release-monitoring.org/project/11042 | 1.6.0        | 1.6.1        |     
                      libressl |  DISTRO  | https://release-monitoring.org/project/12102 | 3.8.4        | 3.9.2        | ORPH
                       librsvg |  DISTRO  | https://release-monitoring.org/project/05420 | 2.50.9       | 2.58.92      |     
                       librtas |  DISTRO  | https://release-monitoring.org/project/10717 | 2.0.5        | 2.0.6        | ORPH
                     libsecret |  DISTRO  | https://release-monitoring.org/project/13150 | 0.20.5       | 0.21.4       | ORPH
                    libselinux |  DISTRO  | https://release-monitoring.org/project/01717 | 3.6          | 3.7          |     
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/01718 | 3.6          | 20200710     |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/01719 | 3.6          | 20200710     |     
                       libsigc |  DISTRO  | https://release-monitoring.org/project/07961 | 3.4.0        | 3.6.0        |     
                      libsigc2 |  DISTRO  | https://release-monitoring.org/project/311642 | 2.12.0       | 2.12.1       |     
                     libsodium |  DISTRO  | https://release-monitoring.org/project/01728 | 1.0.18       | 1.0.20       |     
                       libsolv |  DISTRO  | https://release-monitoring.org/project/07908 | 0.7.25       | 0.7.30       |     
                 libsoundtouch |  DISTRO  | https://release-monitoring.org/project/115722 | 2.3.1        | 2.3.3        |     
                      libsoup3 |  DISTRO  | https://release-monitoring.org/project/11483 | 3.5.1        | 3.5.2        |     
               libspatialindex |  DISTRO  | https://release-monitoring.org/project/04864 | 1.9.3        | 2.0.0        |     
                       libspdm |  DISTRO  | https://release-monitoring.org/project/369161 | 3.2.0        | 3.4.0        |     
                      libtirpc |  DISTRO  | https://release-monitoring.org/project/01740 | 1.3.4        | 1.3.5        |     
                       libtool |  DISTRO  | https://release-monitoring.org/project/01741 | 2.4.6        | 2.5.1        | ORPH
          libtorrent-rasterbar |  DISTRO  | https://release-monitoring.org/project/04166 | 1.2.19       | 2.0.10       |     
                        libucl |  DISTRO  | https://release-monitoring.org/project/21371 | 0.8.2        | 0.9.2        |     
                   libunibreak |  DISTRO  | https://release-monitoring.org/project/326564 | 5.1          | 6.1          |     
                      libupnpp |  DISTRO  | https://release-monitoring.org/project/15849 | 0.21.0       | 0.26.6       | ORPH
                        libv4l |  DISTRO  | https://release-monitoring.org/project/09998 | 1.24.1       | 1.28.1       |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/05097 | 8.10.6       | 8.15.2       |     
                       libvirt |  DISTRO  | https://release-monitoring.org/project/13830 | 7.10.0       | 10.5.0       |     
                        libvpl |  DISTRO  | https://release-monitoring.org/project/242664 | 2.11.0       | 2023.4.0     |     
                        libvpx |  DISTRO  | https://release-monitoring.org/project/11083 | 1.13.1       | 1.14.1       |     
                        libxcb |  DISTRO  | https://release-monitoring.org/project/01767 | 1.15         | 1.17.0       | ORPH
                  libxkbcommon |  DISTRO  | https://release-monitoring.org/project/01780 | 1.4.0        | 1.7.0        |     
                       libxml2 |  DISTRO  | https://release-monitoring.org/project/01783 | 2.12.6       | 2.13.3       |     
                     libxmlrpc |  DISTRO  | https://release-monitoring.org/project/09024 | r3176        | 1.59.03      |     
                       libyang |  DISTRO  | https://release-monitoring.org/project/18554 | 2.1.148      | 3.1.0        |     
                    libzenoh-c |  DISTRO  | https://release-monitoring.org/project/372354 | 0.11.0       | 1.0.0.4      |     
                 libzenoh-pico |  DISTRO  | https://release-monitoring.org/project/369957 | 0.11.0       | 1.0.0.5      |     
                          lilv |  DISTRO  | https://release-monitoring.org/project/01818 | 0.24.12      | 0.24.24      |     
                      linphone |  DISTRO  | https://release-monitoring.org/project/01823 | 4.4.8        | 5.2.6        | ORPH
                      linuxptp |  DISTRO  | https://release-monitoring.org/project/21114 | 4.2          | 4.3          |     
                       live555 |  DISTRO  | https://release-monitoring.org/project/12414 | 2021.05.03   | 2024.06.26   | ORPH
                           lld |  DISTRO  | https://release-monitoring.org/project/01830 | 15.0.3       | 18.1.8       |     
                         lldpd |  DISTRO  | https://release-monitoring.org/project/14019 | 1.0.17       | 1.0.18       | ORPH
                          llvm |  DISTRO  | https://release-monitoring.org/project/01830 | 15.0.3       | 18.1.8       |     
                          lmdb |  DISTRO  | https://release-monitoring.org/project/06974 | 0.9.31       | 0.9.33       |     
                lockfile-progs |  DISTRO  | https://release-monitoring.org/project/10135 | 0.1.19       | 0.1.19+nmu1  | ORPH
                     log4cplus |  DISTRO  | https://release-monitoring.org/project/01835 | 2.1.0        | 2.1.1        | ORPH
                       log4cxx |  DISTRO  | https://release-monitoring.org/project/15330 | 1.1.0        | 1.2.0        |     
                     logrotate |  DISTRO  | https://release-monitoring.org/project/10567 | 3.21.0       | 3.22.0       | ORPH
                          lpty |  DISTRO  | https://release-monitoring.org/project/11671 | 1.0.1-1      | 1.2.2        |     
                      lsqlite3 |  DISTRO  | https://release-monitoring.org/project/11649 | 0.9.5-1      | 0.9.6        |     
              lttng-babeltrace |  DISTRO  | https://release-monitoring.org/project/00155 | 1.5.7        | 1.5.11       |     
                  lttng-libust |  DISTRO  | https://release-monitoring.org/project/07135 | 2.13.1       | 2.13.8       |     
                 lttng-modules |  DISTRO  | https://release-monitoring.org/project/07141 | 2.13.10      | 2.13.14      |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/07136 | 2.13.8       | 2.13.13      |     
                           lua |  DISTRO  | https://release-monitoring.org/project/01847 | 5.1.5        | 5.4.7        |     
                     lua-iconv |  DISTRO  | https://release-monitoring.org/project/11668 | 7-1          | 7.1.0        |     
                lua-resty-http |  DISTRO  | https://release-monitoring.org/project/13887 | 0.15-0       | 0.17.2       |     
                           luv |  DISTRO  | https://release-monitoring.org/project/21510 | 1.43.0-0     | 1.48.0-2     | ORPH
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/05354 | 2.03.23      | 2.03.25      | ORPH
                           lxc |  DISTRO  | https://release-monitoring.org/project/01860 | 5.0.3        | 6.0.1        |     
                          lynx |  DISTRO  | https://release-monitoring.org/project/01863 | 2.8.9rel.1   | 2.9.2        |     
                           lz4 |  DISTRO  | https://release-monitoring.org/project/01865 | 1.9.4        | 1.10.0       | ORPH
                          lzip |  DISTRO  | https://release-monitoring.org/project/01866 | 1.23         | 1.24.1       | ORPH
                    lzma-alone |  DISTRO  | https://release-monitoring.org/project/242840 | 9.22         | 2407         | ORPH
                       mariadb |  DISTRO  | https://release-monitoring.org/project/01887 | 10.11.6      | 11.5.1       | ORPH
                         matio |  DISTRO  | https://release-monitoring.org/project/01893 | 1.5.26       | 1.5.27       |     
                          mawk |  DISTRO  | https://release-monitoring.org/project/01953 | 1.3.4-202... | 1.3.4-202... |     
                       mbedtls |  DISTRO  | https://release-monitoring.org/project/13824 | 2.28.8       | 3.6.0        |     
                       mbuffer |  DISTRO  | https://release-monitoring.org/project/15518 | 20220418     | 20240707     |     
                        mcelog |  DISTRO  | https://release-monitoring.org/project/08093 | 194          | 200          |     
                 mediastreamer |  DISTRO  | https://release-monitoring.org/project/21746 | 4.4.8        | 5.3.74       | ORPH
                     memcached |  DISTRO  | https://release-monitoring.org/project/01965 | 1.6.22       | 1.6.29       | ORPH
                     memtest86 |  DISTRO  | https://release-monitoring.org/project/01966 | 6.20         | 7.00         |     
                        mesa3d |  DISTRO  | https://release-monitoring.org/project/01970 | 24.0.9       | 24.1.4       |     
                mesa3d-headers |  DISTRO  | https://release-monitoring.org/project/01970 | 24.0.9       | 24.1.4       |     
                         meson |  DISTRO  | https://release-monitoring.org/project/06472 | 1.3.1        | 1.5.1        |     
                      metacity |  DISTRO  | https://release-monitoring.org/project/15392 | 2.25.1       | 3.52.0       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/21519 | 0.02         | 2.8.0        |     
microchip-hss-payload-gener... |  DISTRO  | https://release-monitoring.org/project/368767 | 2023.09      | 2024.06      |     
                   micropython |  DISTRO  | https://release-monitoring.org/project/10539 | 1.22.0       | 1.23.0       |     
                        midori |  DISTRO  | https://release-monitoring.org/project/01974 | 9.0          | 11.3.3       | ORPH
                         mimic |  DISTRO  | https://release-monitoring.org/project/21521 | 1.1.0        | 1.3.0.1      |     
                      minetest |  DISTRO  | https://release-monitoring.org/project/01978 | 5.6.1        | 5.8.0        |     
                 minetest-game |  DISTRO  | https://release-monitoring.org/project/21522 | 5.6.1        | 5.8.0        |     
                       minizip |  DISTRO  | https://release-monitoring.org/project/301509 | 4.0.3        | 4.0.7        |     
                        moarvm |  DISTRO  | https://release-monitoring.org/project/21100 | 2024.06      | 2024.07      |     
mobile-broadband-provider-info |  DISTRO  | https://release-monitoring.org/project/10267 | 20221107     | 20240407     | ORPH
                 moby-buildkit |  DISTRO  | https://release-monitoring.org/project/20836 | 0.11.6       | 0.15.1       |     
                  modsecurity2 |  DISTRO  | https://release-monitoring.org/project/68638 | 2.9.7        | 3.0.12       |     
                       mongodb |  DISTRO  | https://release-monitoring.org/project/02008 | 4.2.18       | 7.3.3        |     
                         monit |  DISTRO  | https://release-monitoring.org/project/05483 | 5.33.0       | 5.34.0       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/06360 | 6.12.0.182   | 6.12.0.206   |     
                     mpdecimal |  DISTRO  | https://release-monitoring.org/project/11578 | 2.5.1        | 4.0.0        |     
                          mpfr |  DISTRO  | https://release-monitoring.org/project/02019 | 4.1.1        | 4.2.1        | ORPH
                        mpg123 |  DISTRO  | https://release-monitoring.org/project/12413 | 1.32.3       | 1.32.6       |     
                           mpv |  DISTRO  | https://release-monitoring.org/project/05348 | 0.35.1       | 0.38.0       |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/12278 | 3.3.0        | 6.1.1        |     
                         msmtp |  DISTRO  | https://release-monitoring.org/project/02024 | 1.8.25       | 1.8.26       |     
                         mtdev |  DISTRO  | https://release-monitoring.org/project/08868 | 1.1.6        | 1.1.7        |     
                        mtools |  DISTRO  | https://release-monitoring.org/project/02028 | 4.0.43       | 4.0.44       | ORPH
               multipath-tools |  DISTRO  | https://release-monitoring.org/project/00424 | 0.9.8        | 0.9.9        |     
                         mupdf |  DISTRO  | https://release-monitoring.org/project/02034 | 1.23.9       | 1.24.8       |     
                          mxml |  DISTRO  | https://release-monitoring.org/project/13545 | 3.3.1        | 4.0.3        |     
                       nanomsg |  DISTRO  | https://release-monitoring.org/project/14540 | 1.2          | 1.2.1        |     
                           nbd |  DISTRO  | https://release-monitoring.org/project/02052 | 3.25         | 3.26.1       |     
                          ncdu |  DISTRO  | https://release-monitoring.org/project/06045 | 1.20         | 2.5          |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/02057 | 6.4-20230603 | 6.5-20240720 | ORPH
                        ndisc6 |  DISTRO  | https://release-monitoring.org/project/21531 | 1.0.7        | 1.0.8        | ORPH
                      neofetch |  DISTRO  | https://release-monitoring.org/project/16261 | 7.1.0        | 7.3.11       | ORPH
                       nerdctl |  DISTRO  | https://release-monitoring.org/project/242901 | 1.7.3        | 1.7.6        |     
                      netatalk |  DISTRO  | https://release-monitoring.org/project/02063 | 3.1.18       | 3.2.4        | ORPH
                netcat-openbsd |  DISTRO  | https://release-monitoring.org/project/21534 | 1.218        | 1.226        | ORPH
                       netdata |  DISTRO  | https://release-monitoring.org/project/11046 | 1.33.1       | 1.46.3       |     
                       netifrc |  DISTRO  | https://release-monitoring.org/project/21917 | 0.7.3        | 0.7.8        |     
                     netopeer2 |  DISTRO  | https://release-monitoring.org/project/114978 | 2.1.49       | 2.2.28       |     
                       netsnmp |  DISTRO  | https://release-monitoring.org/project/02062 | 5.9.3        | 5.9.4        | ORPH
                       netsurf |  DISTRO  | https://release-monitoring.org/project/05386 | 3.10         | 3.11         |     
                        nettle |  DISTRO  | https://release-monitoring.org/project/02073 | 3.9.1        | 3.10         | ORPH
               network-manager |  DISTRO  | https://release-monitoring.org/project/21197 | 1.46.0       | 1.48.6       | ORPH
       network-manager-openvpn |  DISTRO  | https://release-monitoring.org/project/69977 | 1.11.0       | 1.12.0       |     
                          newt |  DISTRO  | https://release-monitoring.org/project/15129 | 0.52.23      | 0.52.24      | ORPH
                      nftables |  DISTRO  | https://release-monitoring.org/project/02082 | 1.0.8        | 1.1.0        |     
               nftables-python |  DISTRO  | https://release-monitoring.org/project/02082 | 1.0.8        | 1.1.0        |     
                       nghttp2 |  DISTRO  | https://release-monitoring.org/project/08651 | 1.58.0       | 1.62.1       |     
                         nginx |  DISTRO  | https://release-monitoring.org/project/05413 | 1.24.0       | 1.27.0       |     
                        ngircd |  DISTRO  | https://release-monitoring.org/project/02083 | 26.1         | 27           | ORPH
                         ninja |  DISTRO  | https://release-monitoring.org/project/02089 | 1.11.1.g9... | 1.12.1       |     
                          nmon |  DISTRO  | https://release-monitoring.org/project/02097 | 16p          | 16q          | ORPH
                    nodejs-bin |  DISTRO  | https://release-monitoring.org/project/08251 | 20.15.1      | 22.5.1       |     
                    nodejs-src |  DISTRO  | https://release-monitoring.org/project/08251 | 20.15.1      | 22.5.1       |     
                          noip |  DISTRO  | https://release-monitoring.org/project/21539 | 2.1.9        | 3.0.0        | ORPH
                          norm |  DISTRO  | https://release-monitoring.org/project/21540 | 1.5.8        | 1.5.9        | ORPH
                       numactl |  DISTRO  | https://release-monitoring.org/project/02507 | 2.0.16       | 2.0.18       |     
                       nushell |  DISTRO  | https://release-monitoring.org/project/31106 | 0.85.0       | 0.96.0       | ORPH
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/02511 | 6.1.2        | 8.2.2        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/21843 | 390.151      | 390.157      |     
               nvidia-modprobe |  DISTRO  | https://release-monitoring.org/project/141657 | 450.57       | 560.28.03    | ORPH
           nvidia-persistenced |  DISTRO  | https://release-monitoring.org/project/369496 | 515.48.07    | 560.28.03    |     
                          nvme |  DISTRO  | https://release-monitoring.org/project/09074 | 1.12         | 2.9.1        | ORPH
                         ofono |  DISTRO  | https://release-monitoring.org/project/16859 | 2.2          | 2.9          |     
                          ogre |  DISTRO  | https://release-monitoring.org/project/33334 | v1.12.12     | 14.2.6       |     
                       omniorb |  DISTRO  | https://release-monitoring.org/project/21545 | 4.3.1        | 4.3.2        | ORPH
                    open-iscsi |  DISTRO  | https://release-monitoring.org/project/10861 | 2.1.9        | 2.1.10       |     
                     open-lldp |  DISTRO  | https://release-monitoring.org/project/115714 | 1.1          | 1.1.1        |     
                     open62541 |  DISTRO  | https://release-monitoring.org/project/16896 | v1.3.11      | 1.4.3        | ORPH
                        openal |  DISTRO  | https://release-monitoring.org/project/08172 | 1.22.0       | 1.23.1       | ORPH
                  opencl-clhpp |  DISTRO  | https://release-monitoring.org/project/271141 | 2023.12.14   | 2024.05.08   |     
                  opencore-amr |  DISTRO  | https://release-monitoring.org/project/21548 | 0.1.5        | 0.1.6        | ORPH
                       opencv3 |  DISTRO  | https://release-monitoring.org/project/06615 | 3.4.19       | 4.10.0       |     
                openfpgaloader |  DISTRO  | https://release-monitoring.org/project/241709 | 0.11.0       | 0.12.1       |     
                      openipmi |  DISTRO  | https://release-monitoring.org/project/02549 | 2.0.34       | 2.0.35       | ORPH
                       openjdk |  GUESS   | https://release-monitoring.org/project/176098 | 17.0.9+9     | 24+8         |     
                    openlayers |  DISTRO  | https://release-monitoring.org/project/06847 | 9.2.4        | 10.0.0       |     
                       openmpi |  DISTRO  | https://release-monitoring.org/project/02554 | 4.1.5        | 5.0.5        |     
                        openrc |  DISTRO  | https://release-monitoring.org/project/11687 | 0.52.1       | 0.54.2       |     
                        opensc |  DISTRO  | https://release-monitoring.org/project/02559 | 0.24.0       | 0.25.1       | ORPH
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/10998 | 11.3.5-18... | 12.4.5       |     
                          opkg |  DISTRO  | https://release-monitoring.org/project/59397 | 0.6.2        | 0.7.0        | ORPH
                    opkg-utils |  DISTRO  | https://release-monitoring.org/project/59396 | 0.6.2        | 0.7.0        | ORPH
                          opus |  DISTRO  | https://release-monitoring.org/project/11081 | 1.4          | 1.5.2        |     
                           orc |  DISTRO  | https://release-monitoring.org/project/02573 | 0.4.34       | 0.4.39       | ORPH
                          ortp |  DISTRO  | https://release-monitoring.org/project/21691 | 4.4.8        | 5.3.74       | ORPH
                       p11-kit |  DISTRO  | https://release-monitoring.org/project/02582 | 0.25.3       | 0.25.5       | ORPH
                 paho-mqtt-cpp |  DISTRO  | https://release-monitoring.org/project/21376 | 1.3.2        | 1.4.1        |     
                       pangomm |  DISTRO  | https://release-monitoring.org/project/07958 | 2.50.1       | 2.54.0       |     
                   pangomm2_46 |  DISTRO  | https://release-monitoring.org/project/369412 | 2.46.3       | 2.46.4       |     
                    parprouted |  DISTRO  | https://release-monitoring.org/project/10309 | 0.7          | 0.65         | ORPH
                      patchelf |  DISTRO  | https://release-monitoring.org/project/02598 | 0.13         | 0.18.0       | ORPH
                         pcre2 |  DISTRO  | https://release-monitoring.org/project/05832 | 10.43        | 10.44        | ORPH
                     pcsc-lite |  DISTRO  | https://release-monitoring.org/project/02611 | 2.1.0        | 2.2.3        | ORPH
                          pdbg |  DISTRO  | https://release-monitoring.org/project/21378 | 3.5          | 3.6          |     
                          perl |  DISTRO  | https://release-monitoring.org/project/13599 | 5.38.2       | 5.41.2       |     
                perl-crypt-cbc |  DISTRO  | https://release-monitoring.org/project/11930 | 2.33         | 3.04         |     
        perl-crypt-openssl-aes |  DISTRO  | https://release-monitoring.org/project/02743 | 0.02         | 0.21         |     
     perl-crypt-openssl-random |  DISTRO  | https://release-monitoring.org/project/02747 | 0.15         | 0.17         |     
                perl-data-uuid |  DISTRO  | https://release-monitoring.org/project/11837 | 1.226        | 1.227        |     
               perl-date-manip |  DISTRO  | https://release-monitoring.org/project/02785 | 6.94         | 6.95         |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/02807 | 4.046        | 5.007        |     
               perl-devel-size |  DISTRO  | https://release-monitoring.org/project/02835 | 0.83         | 0.84         |     
          perl-extutils-config |  DISTRO  | https://release-monitoring.org/project/11847 | 0.008        | 0.009        |     
         perl-extutils-helpers |  DISTRO  | https://release-monitoring.org/project/11848 | 0.026        | 0.027        |     
    perl-extutils-installpaths |  DISTRO  | https://release-monitoring.org/project/11849 | 0.012        | 0.013        |     
                       perl-gd |  DISTRO  | https://release-monitoring.org/project/12660 | 2.77         | 2.83         |     
                  perl-gdgraph |  DISTRO  | https://release-monitoring.org/project/09187 | 1.54         | 1.56         |     
              perl-html-parser |  DISTRO  | https://release-monitoring.org/project/02967 | 3.81         | 3.82         |     
              perl-html-tagset |  DISTRO  | https://release-monitoring.org/project/02971 | 3.20         | 3.24         |     
             perl-http-cookies |  DISTRO  | https://release-monitoring.org/project/02974 | 6.10         | 6.11         |     
             perl-http-message |  DISTRO  | https://release-monitoring.org/project/02977 | 6.45         | 6.46         |     
           perl-image-exiftool |  DISTRO  | https://release-monitoring.org/project/06175 | 12.50        | 12.92        |     
            perl-io-socket-ssl |  DISTRO  | https://release-monitoring.org/project/06569 | 2.080        | 2.088        |     
              perl-libwww-perl |  DISTRO  | https://release-monitoring.org/project/03024 | 6.67         | 6.77         |     
       perl-lwp-protocol-https |  DISTRO  | https://release-monitoring.org/project/03050 | 6.12         | 6.14         |     
                perl-mail-dkim |  DISTRO  | https://release-monitoring.org/project/11868 | 1.20230630   | 1.20240619   |     
               perl-mime-tools |  DISTRO  | https://release-monitoring.org/project/11809 | 5.509        | 5.515        |     
        perl-module-build-tiny |  DISTRO  | https://release-monitoring.org/project/11870 | 0.047        | 0.048        |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/05966 | 9.35         | 9.37         |     
               perl-mozilla-ca |  DISTRO  | https://release-monitoring.org/project/03136 | 20231213     | 20240313     |     
                  perl-net-dns |  DISTRO  | https://release-monitoring.org/project/03147 | 1.42         | 1.45         |     
                 perl-net-ssh2 |  DISTRO  | https://release-monitoring.org/project/03163 | 0.72         | 0.73         |     
                perl-path-tiny |  DISTRO  | https://release-monitoring.org/project/11962 | 0.144        | 0.146        |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/14338 | 0.52         | 0.61         |     
                      perl-uri |  DISTRO  | https://release-monitoring.org/project/03485 | 5.21         | 5.28         |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/03527 | 2.0134       | 2.0210       |     
                      php-amqp |  DISTRO  | https://release-monitoring.org/project/15603 | 2.0.0        | 2.1.2        |     
                      php-apcu |  DISTRO  | https://release-monitoring.org/project/11010 | 5.1.22       | 5.1.23       |     
                       php-pam |  DISTRO  | https://release-monitoring.org/project/241707 | 2.2.4        | 2.2.5        |     
                      php-ssh2 |  DISTRO  | https://release-monitoring.org/project/21742 | 1.4          | 1.4.1        | ORPH
                    php-xdebug |  DISTRO  | https://release-monitoring.org/project/13302 | 3.3.1        | 3.3.2        |     
                        physfs |  DISTRO  | https://release-monitoring.org/project/03631 | 3.0.2        | 3.2.0        |     
                      pipewire |  DISTRO  | https://release-monitoring.org/project/57357 | 0.3.81       | 1.2.1        |     
                        pixman |  DISTRO  | https://release-monitoring.org/project/03648 | 0.42.2       | 0.43.4       | ORPH
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/12753 | 1.6.3        | 2.2.0        | ORPH
                      pngquant |  DISTRO  | https://release-monitoring.org/project/03674 | 2.18.0       | 3.0.3        |     
                          poco |  DISTRO  | https://release-monitoring.org/project/05418 | 1.13.2       | 1.13.3       |     
                          poke |  DISTRO  | https://release-monitoring.org/project/179926 | 3.0          | 4.2          | ORPH
                        polkit |  DISTRO  | https://release-monitoring.org/project/03682 | 123          | 124          |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/03686 | 22.12.0      | 24.07.0      |     
                    postgresql |  DISTRO  | https://release-monitoring.org/project/05601 | 16.3         | 17           |     
                         pound |  DISTRO  | https://release-monitoring.org/project/05436 | 4.8          | 4.12         | ORPH
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/10715 | 1.3.11       | 1.3.12       | ORPH
                          proj |  DISTRO  | https://release-monitoring.org/project/21570 | 9.3.0        | 9.4.1        |     
                       prosody |  DISTRO  | https://release-monitoring.org/project/03709 | 0.11.14      | 0.12.4       |     
                      protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 21.12        | 27.2         |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/06499 | 4.16         | 4.17         | ORPH
          pru-software-support |  DISTRO  | https://release-monitoring.org/project/21825 | 6.0.1        | 6.4.0        |     
                        psmisc |  DISTRO  | https://release-monitoring.org/project/03721 | 23.5         | 23.7         | ORPH
                          ptpd |  GUESS   | https://release-monitoring.org/project/03726 | 1.1.0        | 2.3.1        | ORPH
                            pv |  DISTRO  | https://release-monitoring.org/project/03736 | 1.8.5        | 1.8.12       | ORPH
                python-aiocoap |  DISTRO  | https://release-monitoring.org/project/21243 | 0.4.7        | 0.4.10       |     
             python-aioconsole |  DISTRO  | https://release-monitoring.org/project/21244 | 0.7.0        | 0.7.1        |     
                 python-aiodns |  DISTRO  | https://release-monitoring.org/project/21245 | 3.1.1        | 3.2.0        |     
                python-aiohttp |  DISTRO  | https://release-monitoring.org/project/06713 | 3.9.3        | 3.10.0b1     |     
         python-aiohttp-jinja2 |  DISTRO  | https://release-monitoring.org/project/21247 | 1.5.1        | 1.6          |     
            python-aiohttp-sse |  DISTRO  | https://release-monitoring.org/project/21251 | 2.1.0        | 2.2.0        |     
                python-aiojobs |  DISTRO  | https://release-monitoring.org/project/21252 | 1.2.1        | 1.3.0        |     
              python-aiorwlock |  DISTRO  | https://release-monitoring.org/project/21254 | 1.3.0        | 1.4.0        |     
                python-alembic |  DISTRO  | https://release-monitoring.org/project/03766 | 1.13.1       | 1.13.2       |     
              python-alsaaudio |  DISTRO  | https://release-monitoring.org/project/10072 | 0.10.0       | 0.11.0       |     
                python-apispec |  DISTRO  | https://release-monitoring.org/project/37849 | 6.3.1        | 6.6.1        |     
                   python-argh |  DISTRO  | https://release-monitoring.org/project/09299 | 0.31.0       | 0.31.3       |     
                python-asgiref |  DISTRO  | https://release-monitoring.org/project/18462 | 3.7.2        | 3.8.1        |     
               python-asyncssh |  DISTRO  | https://release-monitoring.org/project/17555 | 2.14.2       | 2.15.0       |     
                  python-babel |  DISTRO  | https://release-monitoring.org/project/11984 | 2.14.0       | 2.15.0       |     
                 python-bcrypt |  DISTRO  | https://release-monitoring.org/project/09047 | 4.1.3        | 4.2.0        |     
                python-beniget |  DISTRO  | https://release-monitoring.org/project/91782 | 0.4.1        | 0.4.2.post1  |     
                 python-bidict |  DISTRO  | https://release-monitoring.org/project/114352 | 0.22.1       | 0.23.1       |     
              python-bitstring |  DISTRO  | https://release-monitoring.org/project/14665 | 4.1.4        | 4.2.3        |     
                  python-bleak |  DISTRO  | https://release-monitoring.org/project/26271 | 0.21.1       | 0.22.2       |     
                python-blinker |  DISTRO  | https://release-monitoring.org/project/20042 | 1.7.0        | 1.8.2        |     
               python-bluezero |  DISTRO  | https://release-monitoring.org/project/21929 | 0.8.0        | 0.9.0        |     
                  python-boto3 |  DISTRO  | https://release-monitoring.org/project/29737 | 1.34.14      | 1.34.149     |     
               python-botocore |  DISTRO  | https://release-monitoring.org/project/08748 | 1.34.14      | 1.34.149     |     
             python-cachetools |  DISTRO  | https://release-monitoring.org/project/07022 | 5.3.2        | 5.4.0        |     
                    python-can |  DISTRO  | https://release-monitoring.org/project/17873 | 4.3.1        | 4.4.2        |     
                python-canopen |  DISTRO  | https://release-monitoring.org/project/23230 | 2.2.0        | 2.3.0        |     
                  python-cbor2 |  DISTRO  | https://release-monitoring.org/project/64102 | 5.5.1        | 5.6.4        |     
               python-cchardet |  DISTRO  | https://release-monitoring.org/project/14813 | 2.1.7        | 2.2.0a2      |     
                python-certifi |  DISTRO  | https://release-monitoring.org/project/07995 | 2024.6.2     | 2024.7.4     |     
               python-channels |  DISTRO  | https://release-monitoring.org/project/21937 | 4.0.0        | 4.1.0        |     
         python-channels-redis |  DISTRO  | https://release-monitoring.org/project/21936 | 4.1.0        | 4.2.0        |     
                python-cheroot |  DISTRO  | https://release-monitoring.org/project/20163 | 10.0.0       | 11.0.0b3     |     
               python-cherrypy |  DISTRO  | https://release-monitoring.org/project/03799 | 18.9.0       | 18.10.0      |     
               python-colorlog |  DISTRO  | https://release-monitoring.org/project/12509 | 6.8.0        | 6.8.2        |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/19734 | 1.1.30       | 1.5          |     
              python-contourpy |  DISTRO  | https://release-monitoring.org/project/244705 | 1.1.0        | 1.2.1        |     
                python-crontab |  DISTRO  | https://release-monitoring.org/project/31282 | 3.0.0        | 3.2.0        |     
           python-cryptography |  DISTRO  | https://release-monitoring.org/project/05532 | 39.0.2       | 43.0.0       |     
               python-cssutils |  DISTRO  | https://release-monitoring.org/project/13259 | 2.9.0        | 2.11.1       |     
                 python-cython |  DISTRO  | https://release-monitoring.org/project/12679 | 0.29.37      | 3.0.10       |     
                 python-daemon |  DISTRO  | https://release-monitoring.org/project/03816 | 3.0.1        | 3.0.2        |     
                 python-daphne |  DISTRO  | https://release-monitoring.org/project/21939 | 4.0.0        | 4.1.2        |     
               python-dateutil |  DISTRO  | https://release-monitoring.org/project/05621 | 2.9.0        | 2.9.0.post0  |     
              python-dbus-fast |  DISTRO  | https://release-monitoring.org/project/287975 | 2.12.0       | 2.22.1       |     
                 python-django |  DISTRO  | https://release-monitoring.org/project/03828 | 5.0.3        | 5.0.7        |     
              python-dnspython |  DISTRO  | https://release-monitoring.org/project/13190 | 2.4.2        | 2.6.1        |     
               python-docutils |  DISTRO  | https://release-monitoring.org/project/03849 | 0.20.1       | 0.21.2       |     
               python-dtschema |  DISTRO  | https://release-monitoring.org/project/100908 | 2023.11      | 2024.5       |     
                  python-ecdsa |  DISTRO  | https://release-monitoring.org/project/08370 | 0.18.0       | 0.19.0       |     
        python-email-validator |  DISTRO  | https://release-monitoring.org/project/98134 | 2.1.1        | 2.2.0        |     
               python-engineio |  DISTRO  | https://release-monitoring.org/project/15064 | 4.8.2        | 4.9.1        |     
                  python-evdev |  DISTRO  | https://release-monitoring.org/project/62869 | 1.6.1        | 1.7.1        |     
                python-fastapi |  DISTRO  | https://release-monitoring.org/project/47977 | 0.111.0      | 0.111.1      |     
                 python-fastui |  DISTRO  | https://release-monitoring.org/project/372329 | 0.5.2        | 0.6.0        |     
               python-filelock |  DISTRO  | https://release-monitoring.org/project/11739 | 3.13.1       | 3.15.4       |     
                   python-fire |  DISTRO  | https://release-monitoring.org/project/21700 | 0.5.0        | 0.6.0        |     
                  python-flask |  DISTRO  | https://release-monitoring.org/project/03867 | 3.0.0        | 3.0.3        |     
             python-flask-cors |  DISTRO  | https://release-monitoring.org/project/19867 | 4.0.0        | 4.0.1        |     
          python-flask-jsonrpc |  DISTRO  | https://release-monitoring.org/project/21698 | 2.2.2        | 3.0.1        |     
          python-flask-smorest |  DISTRO  | https://release-monitoring.org/project/25028 | 0.42.3       | 0.44.0       |     
            python-flatbuffers |  DISTRO  | https://release-monitoring.org/project/85010 | 2.0.7        | 24.3.25      |     
              python-fonttools |  DISTRO  | https://release-monitoring.org/project/07388 | 4.47.0       | 4.53.1       |     
                 python-future |  DISTRO  | https://release-monitoring.org/project/26845 | 0.18.3       | 1.0.0        |     
                   python-gast |  DISTRO  | https://release-monitoring.org/project/65692 | 0.5.4        | 0.6.0        |     
                    python-git |  DISTRO  | https://release-monitoring.org/project/06459 | 3.1.40       | 3.1.43       |     
                python-glslang |  DISTRO  | https://release-monitoring.org/project/205796 | 11.13.0      | 14.3.0       |     
                python-gobject |  DISTRO  | https://release-monitoring.org/project/13158 | 3.42.2       | 3.48.2       |     
        python-google-api-core |  DISTRO  | https://release-monitoring.org/project/25386 | 2.15.0       | 2.19.1       |     
            python-google-auth |  DISTRO  | https://release-monitoring.org/project/38039 | 2.26.1       | 2.32.0       |     
python-googleapis-common-pr... |  DISTRO  | https://release-monitoring.org/project/63943 | 1.62.0       | 1.63.2       |     
               python-gpiozero |  DISTRO  | https://release-monitoring.org/project/19948 | 2.0          | 2.0.1        |     
          python-grpc-requests |  DISTRO  | https://release-monitoring.org/project/132701 | 0.1.13       | 0.1.19       |     
                 python-grpcio |  DISTRO  | https://release-monitoring.org/project/18429 | 1.60.0       | 1.65.1       |     
      python-grpcio-reflection |  DISTRO  | https://release-monitoring.org/project/30542 | 1.60.0       | 1.65.1       |     
               python-gunicorn |  DISTRO  | https://release-monitoring.org/project/03882 | 21.2.0       | 22.0.0       |     
                python-hiredis |  DISTRO  | https://release-monitoring.org/project/12002 | 2.3.2        | 3.0.0        |     
               python-humanize |  DISTRO  | https://release-monitoring.org/project/19799 | 4.4.0        | 4.10.0       |     
                 python-hwdata |  DISTRO  | https://release-monitoring.org/project/11771 | 2.4.1        | 2.4.1-1      |     
            python-incremental |  DISTRO  | https://release-monitoring.org/project/15162 | 22.10.0      | 24.7.1       |     
                python-inflect |  DISTRO  | https://release-monitoring.org/project/03889 | 7.0.0        | 7.3.1        |     
               python-influxdb |  DISTRO  | https://release-monitoring.org/project/12696 | 5.3.1        | 5.3.2        |     
                python-ipython |  DISTRO  | https://release-monitoring.org/project/01399 | 8.20.0       | 8.26.0       |     
                  python-iwlib |  DISTRO  | https://release-monitoring.org/project/51611 | 1.5          | 1.7.0        |     
         python-jaraco-classes |  DISTRO  | https://release-monitoring.org/project/20150 | 3.3.0        | 3.4.0        |     
     python-jaraco-collections |  DISTRO  | https://release-monitoring.org/project/58530 | 5.0.0        | 5.0.1        |     
         python-jaraco-context |  DISTRO  | https://release-monitoring.org/project/62309 | 4.3.0        | 5.3.0        |     
       python-jaraco-functools |  DISTRO  | https://release-monitoring.org/project/20165 | 4.0.0        | 4.0.2        |     
            python-jaraco-text |  DISTRO  | https://release-monitoring.org/project/23436 | 3.12.0       | 4.0.0        |     
                     python-jc |  DISTRO  | https://release-monitoring.org/project/28963 | 1.25.2       | 1.25.3       |     
             python-jsonschema |  DISTRO  | https://release-monitoring.org/project/03898 | 4.20.0       | 4.23.0       |     
                python-keyring |  DISTRO  | https://release-monitoring.org/project/03901 | 24.2.0       | 25.2.1       |     
                   python-lark |  DISTRO  | https://release-monitoring.org/project/140595 | 1.1.8        | 1.1.9        |     
                   python-lmdb |  DISTRO  | https://release-monitoring.org/project/15512 | 1.4.1        | 1.5.1        |     
               python-m2crypto |  DISTRO  | https://release-monitoring.org/project/06599 | 0.40.1       | 0.41.0       |     
         python-magic-wormhole |  DISTRO  | https://release-monitoring.org/project/17278 | 0.13.0       | 0.14.0       |     
                   python-mako |  DISTRO  | https://release-monitoring.org/project/03915 | 1.3.0        | 1.3.5        |     
               python-markdown |  DISTRO  | https://release-monitoring.org/project/03916 | 3.5.1        | 3.6          |     
              python-markdown2 |  DISTRO  | https://release-monitoring.org/project/03917 | 2.4.12       | 2.5.0        |     
            python-marshmallow |  DISTRO  | https://release-monitoring.org/project/08079 | 3.20.1       | 3.21.3       |     
 python-marshmallow-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/50566 | 0.30.0       | 1.0.0        |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/03919 | 3.8.2        | 3.9.1        |     
      python-matplotlib-inline |  GUESS   | https://release-monitoring.org/project/198324 | 0.1.6        | 0.1.7        |     
           python-meson-python |  DISTRO  | https://release-monitoring.org/project/248985 | 0.15.0       | 0.16.0       |     
              python-ml-dtypes |  DISTRO  | https://release-monitoring.org/project/330555 | 0.3.2        | 0.4.0b1      |     
         python-more-itertools |  DISTRO  | https://release-monitoring.org/project/12201 | 10.2.0       | 10.3.0       |     
                python-msgpack |  DISTRO  | https://release-monitoring.org/project/21831 | 1.0.7        | 1.0.8        |     
                python-netaddr |  DISTRO  | https://release-monitoring.org/project/05586 | 0.10.1       | 1.3.0        |     
               python-networkx |  DISTRO  | https://release-monitoring.org/project/07791 | 3.2.1        | 3.3          |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/02509 | 1.25.0       | 2.0.1        |     
          python-opcua-asyncio |  DISTRO  | https://release-monitoring.org/project/131612 | 1.0.5        | 1.05a1       |     
                 python-orjson |  DISTRO  | https://release-monitoring.org/project/31737 | 3.9.10       | 3.10.6       |     
              python-packaging |  DISTRO  | https://release-monitoring.org/project/11718 | 24.0         | 24.1         |     
                  python-parso |  DISTRO  | https://release-monitoring.org/project/16689 | 0.8.3        | 0.8.4        |     
                 python-pillow |  DISTRO  | https://release-monitoring.org/project/07974 | 10.3.0       | 10.4.0       |     
                    python-pip |  DISTRO  | https://release-monitoring.org/project/06529 | 23.3.2       | 24.1.2       |     
                 python-pluggy |  DISTRO  | https://release-monitoring.org/project/07500 | 1.4.0        | 1.5.0        |     
         python-prompt-toolkit |  DISTRO  | https://release-monitoring.org/project/08742 | 3.0.43       | 3.0.47       |     
               python-protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 21.12        | 27.2         |     
                 python-psutil |  DISTRO  | https://release-monitoring.org/project/03978 | 5.9.7        | 6.0.0        |     
                   python-pudb |  DISTRO  | https://release-monitoring.org/project/03980 | 2024.1       | 2024.1.2     |     
              python-pure-eval |  DISTRO  | https://release-monitoring.org/project/57556 | 0.2.2        | 0.2.3        |     
         python-pyasn1-modules |  DISTRO  | https://release-monitoring.org/project/11987 | 0.3.0        | 0.4.0        |     
                python-pycairo |  DISTRO  | https://release-monitoring.org/project/13166 | 1.25.1       | 1.26.1       |     
                python-pycrate |  DISTRO  | https://release-monitoring.org/project/185106 | 0.7.2        | 0.7.7        |     
          python-pycryptodomex |  DISTRO  | https://release-monitoring.org/project/36851 | 3.19.1       | 3.20.0       |     
                 python-pycups |  DISTRO  | https://release-monitoring.org/project/07975 | 2.0.1        | 2.0.4        |     
                  python-pydal |  DISTRO  | https://release-monitoring.org/project/21582 | 20231114.3   | 20240713.1   |     
                  python-pydyf |  DISTRO  | https://release-monitoring.org/project/179112 | 0.8.0        | 0.11.0       |     
             python-pyelftools |  DISTRO  | https://release-monitoring.org/project/16219 | 0.30         | 0.31         |     
              python-pyftpdlib |  DISTRO  | https://release-monitoring.org/project/17026 | 1.5.9        | 1.5.10       |     
               python-pygments |  DISTRO  | https://release-monitoring.org/project/03986 | 2.17.2       | 2.18.0       |     
                  python-pyicu |  DISTRO  | https://release-monitoring.org/project/12004 | 2.12         | 2.13.1       |     
              python-pylibftdi |  DISTRO  | https://release-monitoring.org/project/21583 | 0.21.0       | 0.22.0       |     
                python-pymupdf |  DISTRO  | https://release-monitoring.org/project/17320 | 1.23.22      | 1.24.9       |     
                python-pymysql |  DISTRO  | https://release-monitoring.org/project/07284 | 1.1.0        | 1.1.1        |     
              python-pyopenssl |  DISTRO  | https://release-monitoring.org/project/05535 | 23.3.0       | 24.2.1       |     
               python-pyparted |  DISTRO  | https://release-monitoring.org/project/15558 | 3.12.0       | 3.13.0       |     
                 python-pyphen |  DISTRO  | https://release-monitoring.org/project/19681 | 0.14.0       | 0.15.0       |     
        python-pyproject-hooks |  DISTRO  | https://release-monitoring.org/project/320474 | 1.0.0        | 1.1.0        |     
     python-pyproject-metadata |  DISTRO  | https://release-monitoring.org/project/255630 | 0.7.1        | 0.8.0        |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/20104 | 5.15.6       | 5.15.11      |     
               python-pyroute2 |  DISTRO  | https://release-monitoring.org/project/20081 | 0.7.10       | 0.7.12       |     
                  python-pysmb |  DISTRO  | https://release-monitoring.org/project/21589 | 1.2.9        | 1.2.9.1      |     
                  python-pysmi |  DISTRO  | https://release-monitoring.org/project/13209 | 0.3.4        | 1.4.4        |     
                 python-pysnmp |  DISTRO  | https://release-monitoring.org/project/12027 | 4.4.12       | 6.2.4        |     
               python-pyspnego |  DISTRO  | https://release-monitoring.org/project/107092 | 0.10.2       | 0.11.1       |     
          python-pytablereader |  DISTRO  | https://release-monitoring.org/project/21592 | 0.31.3       | 0.31.4       |     
                 python-pytest |  DISTRO  | https://release-monitoring.org/project/03765 | 8.1.1        | 8.3.2        |     
         python-pytest-asyncio |  DISTRO  | https://release-monitoring.org/project/07273 | 0.23.6       | 0.23.8       |     
                python-pythran |  DISTRO  | https://release-monitoring.org/project/21140 | 0.15.0       | 0.16.1       |     
                 python-pyudev |  DISTRO  | https://release-monitoring.org/project/08485 | 0.24.1       | 0.24.3       |     
                  python-pyzmq |  DISTRO  | https://release-monitoring.org/project/04104 | 25.1.2       | 26.0.3       |     
                  python-redis |  DISTRO  | https://release-monitoring.org/project/03992 | 5.0.1        | 5.0.7        |     
               python-reedsolo |  DISTRO  | https://release-monitoring.org/project/81160 | 1.7.0        | 2.0.13       |     
            python-referencing |  DISTRO  | https://release-monitoring.org/project/304263 | 0.32.1       | 0.35.1       |     
                  python-regex |  DISTRO  | https://release-monitoring.org/project/05548 | 2023.12.25   | 2024.7.24    |     
      python-requests-oauthlib |  DISTRO  | https://release-monitoring.org/project/11803 | 1.3.1        | 2.0.0        |     
                python-rpds-py |  DISTRO  | https://release-monitoring.org/project/368622 | 0.18.1       | 0.19.1       |     
                  python-rtoml |  DISTRO  | https://release-monitoring.org/project/62048 | 0.10.0       | 0.11.0       |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/19641 | 2.1.76       | 2.2          |     
            python-ruamel-yaml |  DISTRO  | https://release-monitoring.org/project/66067 | 0.18.5       | 0.18.6       |     
             python-s3transfer |  DISTRO  | https://release-monitoring.org/project/10428 | 0.10.0       | 0.10.2       |     
               python-schedule |  DISTRO  | https://release-monitoring.org/project/21600 | 1.2.1        | 1.2.2        |     
                  python-scipy |  DISTRO  | https://release-monitoring.org/project/04768 | 1.11.4       | 1.14.0       |     
                  python-segno |  DISTRO  | https://release-monitoring.org/project/59641 | 1.6.0        | 1.6.1        |     
               python-selenium |  DISTRO  | https://release-monitoring.org/project/05645 | 4.16.0       | 4.23.1       |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/21603 | 2.7.1        | 2.11.0       |     
       python-service-identity |  DISTRO  | https://release-monitoring.org/project/07917 | 23.1.0       | 24.1.0       |     
             python-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 71.0.3       | 71.1.0       |     
         python-setuptools-scm |  DISTRO  | https://release-monitoring.org/project/07874 | 8.0.4        | 8.1.0        |     
                     python-sh |  DISTRO  | https://release-monitoring.org/project/10429 | 2.0.6        | 2.0.7        |     
          python-simplelogging |  DISTRO  | https://release-monitoring.org/project/21134 | 0.11.0       | 0.12.0       |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/13626 | 4.19.25      | 6.8.6        |     
            python-smbprotocol |  DISTRO  | https://release-monitoring.org/project/47981 | 1.12.0       | 1.13.0       |     
                 python-smmap2 |  DISTRO  | https://release-monitoring.org/project/12729 | 5.0.0        | 6.0.0        |     
                 python-snappy |  DISTRO  | https://release-monitoring.org/project/07203 | 0.6.1        | 0.7.2        |     
               python-socketio |  DISTRO  | https://release-monitoring.org/project/21611 | 5.11.0       | 5.11.3       |     
                 python-sockjs |  DISTRO  | https://release-monitoring.org/project/56562 | 0.11.0       | 0.13.0       |     
               python-sqlparse |  DISTRO  | https://release-monitoring.org/project/04038 | 0.4.4        | 0.5.1        |     
              python-starlette |  DISTRO  | https://release-monitoring.org/project/36570 | 0.37.2       | 0.38.1       |     
                  python-sympy |  DISTRO  | https://release-monitoring.org/project/04923 | 1.12         | 1.13.1       |     
               python-tcolorpy |  DISTRO  | https://release-monitoring.org/project/97274 | 0.1.4        | 0.1.6        |     
                python-tempora |  DISTRO  | https://release-monitoring.org/project/21225 | 5.5.0        | 5.7.0        |     
              python-texttable |  DISTRO  | https://release-monitoring.org/project/11635 | 1.6.7        | 1.7.0        |     
                 python-thrift |  DISTRO  | https://release-monitoring.org/project/21614 | 0.16.0       | 0.20.0       |     
               python-tinycss2 |  DISTRO  | https://release-monitoring.org/project/16655 | 1.2.1        | 1.3.0        |     
                python-tinyrpc |  DISTRO  | https://release-monitoring.org/project/12824 | 1.1.4        | 1.1.7        |     
                python-tomlkit |  DISTRO  | https://release-monitoring.org/project/19609 | 0.12.4       | 0.13.0       |     
                python-tornado |  DISTRO  | https://release-monitoring.org/project/07498 | 6.2          | 6.4.1        |     
           python-tortoise-orm |  DISTRO  | https://release-monitoring.org/project/33168 | 0.20.0       | 0.21.5       |     
             python-tpm2-pytss |  DISTRO  | https://release-monitoring.org/project/60656 | 2.2.1        | 2.3.0        |     
                   python-tqdm |  DISTRO  | https://release-monitoring.org/project/11524 | 4.64.1       | 4.66.4       |     
              python-traitlets |  DISTRO  | https://release-monitoring.org/project/12211 | 5.8.0        | 5.14.3       |     
                   python-treq |  DISTRO  | https://release-monitoring.org/project/19614 | 22.2.0       | 23.11.0      |     
                   python-trio |  DISTRO  | https://release-monitoring.org/project/17451 | 0.22.0       | 0.26.0       |     
         python-trio-websocket |  DISTRO  | https://release-monitoring.org/project/136283 | 0.9.2        | 0.11.1       |     
      python-trove-classifiers |  DISTRO  | https://release-monitoring.org/project/88298 | 2024.3.3     | 2024.7.2     |     
                python-twisted |  DISTRO  | https://release-monitoring.org/project/04071 | 22.10.0      | 24.3.0       |     
               python-txtorcon |  DISTRO  | https://release-monitoring.org/project/19661 | 22.0.0       | 23.11.0      |     
              python-typeguard |  DISTRO  | https://release-monitoring.org/project/38819 | 2.13.3       | 4.3.0        |     
                 python-typepy |  DISTRO  | https://release-monitoring.org/project/21617 | 1.3.0        | 1.3.2        |     
  python-types-python-dateutil |  DISTRO  | https://release-monitoring.org/project/147859 | 2.8.19.14    | 2.9.0.202... |     
         python-typing-inspect |  DISTRO  | https://release-monitoring.org/project/209826 | 0.8.0        | 0.9.0        |     
              python-u-msgpack |  DISTRO  | https://release-monitoring.org/project/19764 | 2.7.2        | 2.8.0        |     
                  python-ujson |  DISTRO  | https://release-monitoring.org/project/04076 | 5.7.0        | 5.10.0       |     
                python-urllib3 |  DISTRO  | https://release-monitoring.org/project/04078 | 2.0.7        | 2.2.2        |     
                  python-urwid |  DISTRO  | https://release-monitoring.org/project/04079 | 2.6.10       | 2.6.15       |     
         python-urwid-readline |  DISTRO  | https://release-monitoring.org/project/84198 | 0.13         | 0.14         |     
             python-validators |  DISTRO  | https://release-monitoring.org/project/19818 | 0.22.0       | 0.33.0       |     
               python-watchdog |  DISTRO  | https://release-monitoring.org/project/05341 | 2.2.1        | 4.0.1        |     
                python-wcwidth |  DISTRO  | https://release-monitoring.org/project/08743 | 0.2.5        | 0.2.13       |     
             python-weasyprint |  DISTRO  | https://release-monitoring.org/project/11057 | 59.0         | 62.3         |     
                 python-web2py |  DISTRO  | https://release-monitoring.org/project/20617 | 2.26.1       | 2.27.1       |     
                python-webargs |  DISTRO  | https://release-monitoring.org/project/24711 | 8.2.0        | 8.4.0        |     
       python-websocket-client |  DISTRO  | https://release-monitoring.org/project/07288 | 1.4.2        | 1.8.0        |     
               python-werkzeug |  DISTRO  | https://release-monitoring.org/project/04092 | 2.3.8        | 3.0.3        |     
                  python-wheel |  DISTRO  | https://release-monitoring.org/project/11428 | 0.40.0       | 0.43.0       |     
                  python-wrapt |  DISTRO  | https://release-monitoring.org/project/06108 | 1.14.1       | 1.16.0       |     
                python-wtforms |  DISTRO  | https://release-monitoring.org/project/11805 | 3.0.1        | 3.1.2        |     
                   python-xlib |  DISTRO  | https://release-monitoring.org/project/12180 | 0.32         | 0.33         |     
             python-xlsxwriter |  DISTRO  | https://release-monitoring.org/project/12031 | 3.0.6        | 3.2.0        |     
                   python-yarl |  DISTRO  | https://release-monitoring.org/project/12895 | 1.9.2        | 1.9.4        |     
                   python-yatl |  DISTRO  | https://release-monitoring.org/project/50636 | 20220907.1   | 20230507.3   |     
            python-zc-lockfile |  DISTRO  | https://release-monitoring.org/project/04100 | 2.0          | 3.0.post1    |     
               python-zeroconf |  DISTRO  | https://release-monitoring.org/project/12681 | 0.39.4       | 0.132.2      |     
                  python-zlmdb |  DISTRO  | https://release-monitoring.org/project/66674 | 22.6.1       | 23.1.1       |     
         python-zope-interface |  DISTRO  | https://release-monitoring.org/project/04112 | 5.5.2        | 6.4.post2    |     
                 python-zopfli |  DISTRO  | https://release-monitoring.org/project/50016 | 0.2.2        | 0.2.3        |     
          qcom-db410c-firmware |  DISTRO  | https://release-monitoring.org/project/235382 | 1034.2.1     | 1036.1       |     
                          qemu |  DISTRO  | https://release-monitoring.org/project/13607 | 9.0.0        | 9.0.2        |     
                         qlibc |  DISTRO  | https://release-monitoring.org/project/21737 | 2.4.7        | 2.5.0        | ORPH
                          qpdf |  DISTRO  | https://release-monitoring.org/project/05542 | 10.5.0       | 11.9.1       |     
                   qpid-proton |  DISTRO  | https://release-monitoring.org/project/15198 | 0.35.0       | 0.39.0       |     
                       qt5coap |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.7.2        |     
                        qt5knx |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.7.2        |     
                       qt5mqtt |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.7.2        |     
                      qt5opcua |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.7.2        |     
                  qt5webengine |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.14      | 6.7.2        |     
                     quotatool |  DISTRO  | https://release-monitoring.org/project/04146 | 1.6.4        | 1.6.5        | ORPH
                           qwt |  DISTRO  | https://release-monitoring.org/project/04147 | 6.1.6        | 6.3.0        | ORPH
                         ragel |  DISTRO  | https://release-monitoring.org/project/12105 | 6.10         | 7.0.4        | ORPH
                           re2 |  DISTRO  | https://release-monitoring.org/project/10500 | 2024-04-01   | 2024-07-02   |     
                     refpolicy |  DISTRO  | https://release-monitoring.org/project/21663 | 2.20231002   | 2.20240226   |     
                        reproc |  DISTRO  | https://release-monitoring.org/project/151400 | 14.2.4       | 14.2.5       |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/16520 | 3.6          | 20200710     | ORPH
              riemann-c-client |  DISTRO  | https://release-monitoring.org/project/21389 | 1.10.5       | 2.0.1        | ORPH
                       rocksdb |  DISTRO  | https://release-monitoring.org/project/15560 | 6.20.3       | 9.4.0        |     
                      rp-pppoe |  DISTRO  | https://release-monitoring.org/project/04209 | 3.15         | 4.0          | ORPH
                       rpcbind |  DISTRO  | https://release-monitoring.org/project/04212 | 1.2.6        | 1.2.7        |     
                       rsyslog |  DISTRO  | https://release-monitoring.org/project/04218 | 8.2402.0     | 8.2406.0     |     
                          rtty |  DISTRO  | https://release-monitoring.org/project/87994 | 8.1.0        | 8.1.2        |     
                          runc |  DISTRO  | https://release-monitoring.org/project/07462 | 1.1.12       | 1.1.13       |     
                          rust |  DISTRO  | https://release-monitoring.org/project/07635 | 1.79.0       | 1.80.0       |     
                      rust-bin |  DISTRO  | https://release-monitoring.org/project/07635 | 1.79.0       | 1.80.0       |     
                  rust-bindgen |  DISTRO  | https://release-monitoring.org/project/17910 | 0.65.1       | 0.69.4       | ORPH
                         rygel |  DISTRO  | https://release-monitoring.org/project/04751 | 0.42.5       | 0.43.0       |     
                    s390-tools |  DISTRO  | https://release-monitoring.org/project/10714 | 2.32.0       | 2.33.1       |     
                      safeclib |  DISTRO  | https://release-monitoring.org/project/21385 | 3.7.1        | 08032024     |     
                 sane-backends |  DISTRO  | https://release-monitoring.org/project/04760 | 1.1.1        | 1.3.1        |     
                         scons |  DISTRO  | https://release-monitoring.org/project/04770 | 4.7.0        | 4.8.0        |     
                          sdl2 |  DISTRO  | https://release-monitoring.org/project/04779 | 2.30.4       | 2.30.5       |     
                    sdl2_mixer |  DISTRO  | https://release-monitoring.org/project/04782 | 2.6.3        | 2.8.0        | ORPH
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/04778 | 2.0.23       | 2.0.27       | ORPH
                     sdl_sound |  DISTRO  | https://release-monitoring.org/project/10262 | 1.0.3        | 2.0.2        | ORPH
                        sdparm |  DISTRO  | https://release-monitoring.org/project/04787 | 1.10         | 1.12         |     
                       sedutil |  DISTRO  | https://release-monitoring.org/project/15203 | 1.20.0       | 1.49.3       |     
                selinux-python |  DISTRO  | https://release-monitoring.org/project/01717 | 3.6          | 3.7          |     
                semodule-utils |  DISTRO  | https://release-monitoring.org/project/01717 | 3.6          | 3.7          | ORPH
                    sentry-cli |  DISTRO  | https://release-monitoring.org/project/135642 | 2.20.3       | 2.33.0       |     
                 sentry-native |  DISTRO  | https://release-monitoring.org/project/135639 | 0.4.1        | 0.7.7        |     
                       ser2net |  DISTRO  | https://release-monitoring.org/project/21655 | 4.3.8        | 4.6.2        |     
                          serd |  DISTRO  | https://release-monitoring.org/project/230531 | 0.30.14      | 0.32.2       |     
                       setools |  DISTRO  | https://release-monitoring.org/project/08951 | 4.4.4        | 4.5.1        | ORPH
                        shadow |  DISTRO  | https://release-monitoring.org/project/04802 | 4.15.1       | 4.16.0       |     
                shairport-sync |  DISTRO  | https://release-monitoring.org/project/21384 | 3.3.9        | 4.3.4        | ORPH
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/05524 | 1.12         | 2.4          | ORPH
              signal-estimator |  DISTRO  | https://release-monitoring.org/project/284559 | v0.0.4       | 0.0.9        | ORPH
                   simple-mail |  DISTRO  | https://release-monitoring.org/project/53352 | 2.3.0        | 3.0.0        |     
                      sispmctl |  DISTRO  | https://release-monitoring.org/project/21653 | 4.11         | 4.12         |     
                        skopeo |  DISTRO  | https://release-monitoring.org/project/09216 | 1.13.3       | 1.15.2       |     
                         slirp |  DISTRO  | https://release-monitoring.org/project/96796 | 4.7.0        | 4.8.0        |     
                   slirp4netns |  DISTRO  | https://release-monitoring.org/project/96795 | 1.2.3        | 1.3.1        |     
                 smartmontools |  DISTRO  | https://release-monitoring.org/project/04835 | 7.3          | 7.4          | ORPH
                        sngrep |  DISTRO  | https://release-monitoring.org/project/17075 | 1.7.0        | 1.8.2        | ORPH
                  snmpclitools |  DISTRO  | https://release-monitoring.org/project/31640 | 0.6.4        | 0.7.1        |     
                        snmppp |  DISTRO  | https://release-monitoring.org/project/21318 | 3.5.1        | 3.5.2        |     
                        snort3 |  DISTRO  | https://release-monitoring.org/project/13263 | 3.1.40.0     | 3.3.1.0      |     
                     softether |  DISTRO  | https://release-monitoring.org/project/21383 | 4.30-9700... | 4.42-9798... | ORPH
                          sord |  DISTRO  | https://release-monitoring.org/project/230536 | 0.16.12      | 0.16.16      |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/10152 | 0.7          | 0.8          |     
                       spandsp |  DISTRO  | https://release-monitoring.org/project/12600 | 3.0.0-6ec... | 3.0.0        |     
                    spawn-fcgi |  DISTRO  | https://release-monitoring.org/project/05388 | 1.6.4        | 1.6.5        | ORPH
                    sphinxbase |  DISTRO  | https://release-monitoring.org/project/20548 | 5prealpha    | 0.8          |     
                         spice |  DISTRO  | https://release-monitoring.org/project/04871 | 0.15.0       | 0.15.2       |     
                   spirv-tools |  DISTRO  | https://release-monitoring.org/project/334920 | 1.3.261.1    | 1.3.290.0    | ORPH
                     sqlcipher |  DISTRO  | https://release-monitoring.org/project/11213 | 4.5.5        | 4.6.0        |     
                        sqlite |  DISTRO  | https://release-monitoring.org/project/04877 | 3.45.1       | 3.46.0       |     
                        sratom |  DISTRO  | https://release-monitoring.org/project/14903 | 0.6.14       | 0.6.16       |     
                          sslh |  DISTRO  | https://release-monitoring.org/project/06184 | 2.0.1        | 2.1.2        | ORPH
              starfive-spltool |  DISTRO  | https://release-monitoring.org/project/372234 | JH7110_VF... | JH7110-RT... |     
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/08127 | 1.20.7.1     | 1.22.10      | ORPH
                        strace |  DISTRO  | https://release-monitoring.org/project/04897 | 6.8          | 6.10         |     
                     stress-ng |  DISTRO  | https://release-monitoring.org/project/12538 | 0.17.07      | 0.18.01      |     
                    strongswan |  DISTRO  | https://release-monitoring.org/project/04899 | 5.9.13       | 5.9.14       |     
                       stunnel |  DISTRO  | https://release-monitoring.org/project/04901 | 5.71         | 5.72         |     
                      suricata |  DISTRO  | https://release-monitoring.org/project/10925 | 6.0.19       | 7.0.6        |     
                          sway |  DISTRO  | https://release-monitoring.org/project/11497 | 1.8.1        | 1.9          |     
                        swaybg |  DISTRO  | https://release-monitoring.org/project/20562 | 1.2.0        | 1.2.1        |     
                          swig |  DISTRO  | https://release-monitoring.org/project/04919 | 4.1.1        | 4.2.1        |     
                         swtpm |  GUESS   | https://release-monitoring.org/project/116461 | 0.8.2        | 0.9.0        |     
                       synergy |  DISTRO  | https://release-monitoring.org/project/05718 | 2.0.12-beta  | 2.3.2        |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/16898 | 0.29.3       | 0.38.1       |     
                     syslog-ng |  DISTRO  | https://release-monitoring.org/project/04930 | 4.7.1        | 4.8.0        |     
                       sysrepo |  DISTRO  | https://release-monitoring.org/project/34820 | 2.2.150      | 2.10.1       |     
                       sysstat |  DISTRO  | https://release-monitoring.org/project/04931 | 12.7.5       | 12.7.6       | ORPH
             systemd-bootchart |  DISTRO  | https://release-monitoring.org/project/11774 | 233          | 235          |     
                        taglib |  DISTRO  | https://release-monitoring.org/project/01982 | 1.13.1       | 2.0.1        |     
                           tbb |  DISTRO  | https://release-monitoring.org/project/08217 | 2021.12.0    | 2021.13.0    |     
                         tclap |  DISTRO  | https://release-monitoring.org/project/04942 | 1.2.4        | 1.2.5        | ORPH
                     tcpreplay |  DISTRO  | https://release-monitoring.org/project/13716 | 4.4.4        | 4.5.1        | ORPH
                   terminology |  DISTRO  | https://release-monitoring.org/project/04951 | 1.12.1       | 1.13.0       |     
                 tesseract-ocr |  DISTRO  | https://release-monitoring.org/project/04954 | 5.3.4        | 5.4.1        |     
                      thermald |  DISTRO  | https://release-monitoring.org/project/14500 | 2.5.6        | 2.5.7        |     
                        thrift |  DISTRO  | https://release-monitoring.org/project/05581 | 0.14.1       | 0.20.0       | ORPH
                   timescaledb |  DISTRO  | https://release-monitoring.org/project/17545 | 2.15.0       | 2.15.3       |     
                      tinifier |  DISTRO  | https://release-monitoring.org/project/241900 | 3.4.0        | 4.1.0        |     
                       tinyxml |  DISTRO  | https://release-monitoring.org/project/10162 | 2.6.2_2      | 2.6.2        | ORPH
                           tio |  DISTRO  | https://release-monitoring.org/project/20587 | 3.5          | 3.6          |     
                   tl-expected |  DISTRO  | https://release-monitoring.org/project/112689 | v1.0.0       | 1.1.0        |     
                          tmux |  DISTRO  | https://release-monitoring.org/project/04980 | 3.3a         | 3.4          |     
                     tpm-tools |  DISTRO  | https://release-monitoring.org/project/21640 | 1.3.9.1      | 1.3.9.2      |     
                    tpm2-abrmd |  DISTRO  | https://release-monitoring.org/project/16819 | 2.3.3        | 3.0.0        | ORPH
                     tpm2-totp |  DISTRO  | https://release-monitoring.org/project/18790 | 0.2.1        | 0.3.0        |     
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/12683 | 3.2.2        | 4.1.3        | ORPH
                     trace-cmd |  DISTRO  | https://release-monitoring.org/project/07873 | 3.2          | 3.3          |     
                    traceroute |  DISTRO  | https://release-monitoring.org/project/14877 | 2.1.3        | 2.1.5        |     
                   uboot-tools |  DISTRO  | https://release-monitoring.org/project/05022 | 2021.07      | 2024.07      | ORPH
                       uftrace |  DISTRO  | https://release-monitoring.org/project/195039 | 0.14         | 0.16         |     
                           uhd |  DISTRO  | https://release-monitoring.org/project/12572 | 4.3.0.0      | 4.7.0.0      |     
                        umtprd |  DISTRO  | https://release-monitoring.org/project/46129 | 1.6.2        | 1.6.8        |     
                       unionfs |  DISTRO  | https://release-monitoring.org/project/17617 | 2.1          | 3.5          | ORPH
                      upmpdcli |  DISTRO  | https://release-monitoring.org/project/15848 | 1.5.12       | 1.8.12       | ORPH
                        upower |  DISTRO  | https://release-monitoring.org/project/05056 | 0.99.19      | 1.90.4       |     
                           upx |  DISTRO  | https://release-monitoring.org/project/13737 | 4.2.1        | 4.2.4        |     
                      usbguard |  DISTRO  | https://release-monitoring.org/project/11151 | 1.1.2        | 1.1.3        |     
                      usbredir |  DISTRO  | https://release-monitoring.org/project/16012 | 0.13.0       | 0.14.0       |     
                     ustreamer |  DISTRO  | https://release-monitoring.org/project/314869 | 6.11         | 6.12         |     
                    util-linux |  DISTRO  | https://release-monitoring.org/project/08179 | 2.39.3       | 2.40.2       | ORPH
               util-linux-libs |  DISTRO  | https://release-monitoring.org/project/08179 | 2.39.3       | 2.40.2       | ORPH
                  v4l2loopback |  DISTRO  | https://release-monitoring.org/project/10956 | 0.12.7       | 0.13.2       |     
                      valgrind |  DISTRO  | https://release-monitoring.org/project/13639 | 3.22.0       | 3.23.0       | ORPH
                           vdr |  DISTRO  | https://release-monitoring.org/project/05069 | 2.6.5        | 2.6.9        | ORPH
         vdr-plugin-vnsiserver |  DISTRO  | https://release-monitoring.org/project/05080 | 1.8.0        | 1.8.3        | ORPH
                           vim |  DISTRO  | https://release-monitoring.org/project/05092 | 9.1.0145     | 9.1.0618     | ORPH
                   vis-network |  DISTRO  | https://release-monitoring.org/project/270536 | 9.1.0        | 9.1.9        |     
                        vnstat |  DISTRO  | https://release-monitoring.org/project/07283 | 2.11         | 2.12         |     
                          volk |  DISTRO  | https://release-monitoring.org/project/147733 | 3.0.0        | 3.1.2        |     
                          vpnc |  DISTRO  | https://release-monitoring.org/project/15955 | 0.5.3r550... | 0.5.3        | ORPH
                           vte |  DISTRO  | https://release-monitoring.org/project/10895 | 0.66.2       | 0.76.3       | ORPH
                         vuejs |  DISTRO  | https://release-monitoring.org/project/89353 | 3.4.31       | 3.4.34       |     
                vulkan-headers |  DISTRO  | https://release-monitoring.org/project/88835 | 1.3.262      | 1.3.291      | ORPH
                 vulkan-loader |  DISTRO  | https://release-monitoring.org/project/230557 | 1.3.262      | 1.3.290      | ORPH
                  vulkan-tools |  DISTRO  | https://release-monitoring.org/project/242111 | 1.3.262      | 1.3.290      | ORPH
                           waf |  DISTRO  | https://release-monitoring.org/project/05116 | 2.1.1        | 2.1.2        |     
                        waffle |  DISTRO  | https://release-monitoring.org/project/21633 | 1.7.0        | 1.8.0        |     
                       wavemon |  DISTRO  | https://release-monitoring.org/project/05120 | 0.9.5        | 0.9.6        | ORPH
                     webkitgtk |  DISTRO  | https://release-monitoring.org/project/05355 | 2.44.2       | 2.45.5       |     
                          webp |  DISTRO  | https://release-monitoring.org/project/01761 | 1.3.2        | 1.4.0        |     
                          wget |  DISTRO  | https://release-monitoring.org/project/05124 | 1.21.4       | 1.24.5       |     
                         whois |  DISTRO  | https://release-monitoring.org/project/05128 | 5.5.14       | 5.5.23       |     
                          wine |  DISTRO  | https://release-monitoring.org/project/05134 | 8.0.2        | 9.13         |     
                   wireplumber |  DISTRO  | https://release-monitoring.org/project/235056 | 0.4.8        | 0.5.5        | ORPH
                     wireshark |  DISTRO  | https://release-monitoring.org/project/05137 | 4.0.12       | 4.3.0        | ORPH
                       wlroots |  DISTRO  | https://release-monitoring.org/project/18357 | 0.16.2       | 0.18.0       |     
                       wolftpm |  DISTRO  | https://release-monitoring.org/project/256219 | 3.1.0        | 3.2.0        |     
                wpa_supplicant |  DISTRO  | https://release-monitoring.org/project/05146 | 2.10         | 2.11         |     
                       wtfutil |  DISTRO  | https://release-monitoring.org/project/243189 | 0.41.0       | 0.43.0       |     
                          x265 |  DISTRO  | https://release-monitoring.org/project/07275 | 3.5          | 3.6          |     
                        xapian |  DISTRO  | https://release-monitoring.org/project/15919 | 1.4.24       | 1.4.26       |     
                   xapp_bitmap |  DISTRO  | https://release-monitoring.org/project/00191 | 1.1.0        | 1.1.1        | ORPH
                  xapp_editres |  DISTRO  | https://release-monitoring.org/project/17160 | 1.0.8        | 1.0.9        | ORPH
               xapp_fonttosfnt |  DISTRO  | https://release-monitoring.org/project/21723 | 1.2.2        | 1.2.3        | ORPH
                  xapp_iceauth |  DISTRO  | https://release-monitoring.org/project/15048 | 1.0.9        | 1.0.10       | ORPH
                  xapp_listres |  DISTRO  | https://release-monitoring.org/project/17161 | 1.0.5        | 1.0.6        | ORPH
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/15047 | 1.1.1        | 20240102     | ORPH
              xapp_mkfontscale |  DISTRO  | https://release-monitoring.org/project/15043 | 1.2.2        | 1.2.3        | ORPH
                    xapp_xauth |  DISTRO  | https://release-monitoring.org/project/05253 | 1.1.2        | 1.1.3        | ORPH
                    xapp_xbiff |  DISTRO  | https://release-monitoring.org/project/15034 | 1.0.4        | 1.0.5        | ORPH
                 xapp_xconsole |  DISTRO  | https://release-monitoring.org/project/15030 | 1.0.8        | 1.1.0        |     
                 xapp_xditview |  DISTRO  | https://release-monitoring.org/project/21262 | 1.0.6        | 1.0.7        | ORPH
                      xapp_xdm |  DISTRO  | https://release-monitoring.org/project/05255 | 1.1.14       | 1.1.16       | ORPH
                    xapp_xedit |  DISTRO  | https://release-monitoring.org/project/05180 | 1.2.3        | 1.2.4        | ORPH
                      xapp_xev |  DISTRO  | https://release-monitoring.org/project/15026 | 1.2.5        | 1.2.6        | ORPH
                    xapp_xeyes |  DISTRO  | https://release-monitoring.org/project/15025 | 1.2.0        | 1.3.0        | ORPH
                 xapp_xfontsel |  DISTRO  | https://release-monitoring.org/project/15023 | 1.1.0        | 1.1.1        | ORPH
                      xapp_xfs |  DISTRO  | https://release-monitoring.org/project/05256 | 1.2.1        | 1.2.2        | ORPH
                  xapp_xkbcomp |  DISTRO  | https://release-monitoring.org/project/15018 | 1.4.6        | 1.4.7        | ORPH
                 xapp_xkbutils |  DISTRO  | https://release-monitoring.org/project/15016 | 1.0.5        | 1.0.6        | ORPH
                    xapp_xload |  DISTRO  | https://release-monitoring.org/project/14992 | 1.1.4        | 1.2.0        | ORPH
                 xapp_xlsfonts |  DISTRO  | https://release-monitoring.org/project/14964 | 1.0.7        | 1.0.8        | ORPH
                     xapp_xman |  DISTRO  | https://release-monitoring.org/project/14962 | 1.1.5        | 1.2.0        | ORPH
                 xapp_xmessage |  DISTRO  | https://release-monitoring.org/project/14961 | 1.0.6        | 1.0.7        | ORPH
                      xapp_xmh |  DISTRO  | https://release-monitoring.org/project/21718 | 1.0.4        | 1.0.5        | ORPH
                    xapp_xmore |  DISTRO  | https://release-monitoring.org/project/18845 | 1.0.3        | 1.0.4        | ORPH
                      xapp_xpr |  DISTRO  | https://release-monitoring.org/project/14959 | 1.1.0        | 1.2.0        | ORPH
                    xapp_xprop |  DISTRO  | https://release-monitoring.org/project/14958 | 1.2.6        | 1.2.7        | ORPH
                 xapp_xrefresh |  DISTRO  | https://release-monitoring.org/project/14955 | 1.0.7        | 1.1.0        | ORPH
                      xapp_xsm |  DISTRO  | https://release-monitoring.org/project/05259 | 1.0.5        | 1.0.6        | ORPH
                     xcb-proto |  DISTRO  | https://release-monitoring.org/project/13646 | 1.15.2       | 1.17.0       | ORPH
   xdriver_xf86-input-libinput |  DISTRO  | https://release-monitoring.org/project/05782 | 1.3.0        | 1.4.0        | ORPH
         xdriver_xf86-video-nv |  DISTRO  | https://release-monitoring.org/project/21711 | 2.1.22       | 2.1.23       | ORPH
     xdriver_xf86-video-savage |  DISTRO  | https://release-monitoring.org/project/05235 | 2.4.0        | 2.4.1        | ORPH
xdriver_xf86-video-siliconm... |  DISTRO  | https://release-monitoring.org/project/05236 | 1.7.9        | 1.7.10       | ORPH
                           xen |  DISTRO  | https://release-monitoring.org/project/05181 | 4.14.6       | 4.18.2       |     
                        xerces |  DISTRO  | https://release-monitoring.org/project/05182 | 3.2.4        | 3.2.5        | ORPH
               xfont_encodings |  DISTRO  | https://release-monitoring.org/project/15051 | 1.0.7        | 1.1.0        | ORPH
 xfont_font-adobe-utopia-75dpi |  DISTRO  | https://release-monitoring.org/project/17200 | 1.0.4        | 1.0.5        | ORPH
               xfont_font-util |  DISTRO  | https://release-monitoring.org/project/15055 | 1.4.0        | 1.4.1        | ORPH
                      xfsprogs |  DISTRO  | https://release-monitoring.org/project/05188 | 6.4.0        | 6.9.0        | ORPH
                        xinetd |  DISTRO  | https://release-monitoring.org/project/06382 | 2.3.15       | 2.3.15.4     |     
              xkeyboard-config |  DISTRO  | https://release-monitoring.org/project/05191 | 2.38         | 2.42         | ORPH
                   xlib_libX11 |  DISTRO  | https://release-monitoring.org/project/01764 | 1.8.7        | 1.8.10       | ORPH
                   xlib_libXaw |  DISTRO  | https://release-monitoring.org/project/01766 | 1.0.15       | 1.0.16       | ORPH
               xlib_libXcursor |  DISTRO  | https://release-monitoring.org/project/01770 | 1.2.1        | 1.2.2        | ORPH
                 xlib_libXdmcp |  DISTRO  | https://release-monitoring.org/project/01772 | 1.1.4        | 1.1.5        | ORPH
                  xlib_libXext |  DISTRO  | https://release-monitoring.org/project/01774 | 1.3.5        | 1.3.6        | ORPH
                   xlib_libXmu |  DISTRO  | https://release-monitoring.org/project/01785 | 1.1.4        | 1.2.1        | ORPH
                xlib_libXrandr |  DISTRO  | https://release-monitoring.org/project/01788 | 1.5.3        | 1.5.4        | ORPH
                  xlib_libXvMC |  DISTRO  | https://release-monitoring.org/project/01796 | 1.0.13       | 1.0.14       | ORPH
               xlib_libfontenc |  DISTRO  | https://release-monitoring.org/project/01613 | 1.1.7        | 1.1.8        | ORPH
               xlib_libxkbfile |  DISTRO  | https://release-monitoring.org/project/01781 | 1.1.2        | 1.1.3        | ORPH
                     xorgproto |  DISTRO  | https://release-monitoring.org/project/17190 | 2023.2       | 2024.1       | ORPH
                       xorriso |  DISTRO  | https://release-monitoring.org/project/13270 | 1.5.4.pl02   | 1.5.6.pl02   |     
                  xscreensaver |  DISTRO  | https://release-monitoring.org/project/05269 | 6.03         | 6.09         |     
           xserver_xorg-server |  DISTRO  | https://release-monitoring.org/project/05250 | 21.1.11      | 21.1.13      | ORPH
                xtables-addons |  DISTRO  | https://release-monitoring.org/project/07736 | 3.24         | 3.26         | ORPH
                         xterm |  DISTRO  | https://release-monitoring.org/project/05272 | 389          | 393          | ORPH
              xutil_makedepend |  DISTRO  | https://release-monitoring.org/project/13528 | 1.0.8        | 1.0.9        | ORPH
             xutil_util-macros |  DISTRO  | https://release-monitoring.org/project/15037 | 1.20.0       | 1.20.1       | ORPH
                      xwayland |  DISTRO  | https://release-monitoring.org/project/180949 | 23.2.4       | 24.1.1       |     
                           yad |  DISTRO  | https://release-monitoring.org/project/05280 | 0.40.0       | 14.1         |     
                        zabbix |  DISTRO  | https://release-monitoring.org/project/05492 | 6.2.7        | 7.0.1        |     
                        zchunk |  DISTRO  | https://release-monitoring.org/project/178035 | 1.3.2        | 1.5.1        |     
                          zeek |  DISTRO  | https://release-monitoring.org/project/267106 | 4.1.1        | 6.2.1        |     
                       zlib-ng |  DISTRO  | https://release-monitoring.org/project/115592 | 2.1.6        | 2.2.1        | ORPH
                          zlog |  DISTRO  | https://release-monitoring.org/project/21624 | 1.2.17       | 1.2.18       |     
                       zziplib |  DISTRO  | https://release-monitoring.org/project/13802 | 0.13.74      | 0.13.77      |     

Packages having CVEs
====================

CVEs for the 'master' branch
----------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                         avahi | CVE-2023-38472   | https://security-tracker.debian.org/tracker/CVE-2023-38472  
                         avahi | CVE-2023-38469   | https://security-tracker.debian.org/tracker/CVE-2023-38469  
                         avahi | CVE-2023-38470   | https://security-tracker.debian.org/tracker/CVE-2023-38470  
                         avahi | CVE-2023-38473   | https://security-tracker.debian.org/tracker/CVE-2023-38473  
                         avahi | CVE-2023-38471   | https://security-tracker.debian.org/tracker/CVE-2023-38471  
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2022-3807    | https://security-tracker.debian.org/tracker/CVE-2022-3807   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                       busybox | CVE-2023-42363   | https://security-tracker.debian.org/tracker/CVE-2023-42363  
                       busybox | CVE-2023-42366   | https://security-tracker.debian.org/tracker/CVE-2023-42366  
                       busybox | CVE-2023-42364   | https://security-tracker.debian.org/tracker/CVE-2023-42364  
                       busybox | CVE-2023-42365   | https://security-tracker.debian.org/tracker/CVE-2023-42365  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                       chicken | CVE-2022-45145   | https://security-tracker.debian.org/tracker/CVE-2022-45145  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                     coreutils | CVE-2024-0684    | https://security-tracker.debian.org/tracker/CVE-2024-0684   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          cpio | CVE-2023-7216    | https://security-tracker.debian.org/tracker/CVE-2023-7216   
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dash | CVE-2024-21485   | https://security-tracker.debian.org/tracker/CVE-2024-21485  
                           dht | CVE-2020-36562   | https://security-tracker.debian.org/tracker/CVE-2020-36562  
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                        dracut | CVE-2010-4176    | https://security-tracker.debian.org/tracker/CVE-2010-4176   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                        erlang | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
             freeradius-server | CVE-2002-0318    | https://security-tracker.debian.org/tracker/CVE-2002-0318   
             freeradius-server | CVE-2011-4966    | https://security-tracker.debian.org/tracker/CVE-2011-4966   
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                   ghostscript | CVE-2023-38560   | https://security-tracker.debian.org/tracker/CVE-2023-38560  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                         gnupg | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                        gnupg2 | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                          grpc | CVE-2023-1428    | https://security-tracker.debian.org/tracker/CVE-2023-1428   
                          grpc | CVE-2023-33953   | https://security-tracker.debian.org/tracker/CVE-2023-33953  
                          grpc | CVE-2023-44487   | https://security-tracker.debian.org/tracker/CVE-2023-44487  
                          grpc | CVE-2023-4785    | https://security-tracker.debian.org/tracker/CVE-2023-4785   
                          grpc | CVE-2023-32732   | https://security-tracker.debian.org/tracker/CVE-2023-32732  
                         grub2 | CVE-2023-4001    | https://security-tracker.debian.org/tracker/CVE-2023-4001   
                         grub2 | CVE-2024-1048    | https://security-tracker.debian.org/tracker/CVE-2024-1048   
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2023-0056    | https://security-tracker.debian.org/tracker/CVE-2023-0056   
                       haproxy | CVE-2023-45539   | https://security-tracker.debian.org/tracker/CVE-2023-45539  
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-5118    | https://security-tracker.debian.org/tracker/CVE-2016-5118   
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2023-5341    | https://security-tracker.debian.org/tracker/CVE-2023-5341   
                        jasper | CVE-2023-51257   | https://security-tracker.debian.org/tracker/CVE-2023-51257  
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                       kvmtool | CVE-2021-45464   | https://security-tracker.debian.org/tracker/CVE-2021-45464  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2020-21426   | https://security-tracker.debian.org/tracker/CVE-2020-21426  
                  libfreeimage | CVE-2020-21428   | https://security-tracker.debian.org/tracker/CVE-2020-21428  
                  libfreeimage | CVE-2020-21427   | https://security-tracker.debian.org/tracker/CVE-2020-21427  
                  libfreeimage | CVE-2021-33367   | https://security-tracker.debian.org/tracker/CVE-2021-33367  
                  libfreeimage | CVE-2023-47993   | https://security-tracker.debian.org/tracker/CVE-2023-47993  
                  libfreeimage | CVE-2023-47992   | https://security-tracker.debian.org/tracker/CVE-2023-47992  
                  libfreeimage | CVE-2023-47997   | https://security-tracker.debian.org/tracker/CVE-2023-47997  
                  libfreeimage | CVE-2023-47994   | https://security-tracker.debian.org/tracker/CVE-2023-47994  
                  libfreeimage | CVE-2023-47995   | https://security-tracker.debian.org/tracker/CVE-2023-47995  
                  libfreeimage | CVE-2023-47996   | https://security-tracker.debian.org/tracker/CVE-2023-47996  
                       libgtk2 | CVE-2014-1949    | https://security-tracker.debian.org/tracker/CVE-2014-1949   
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libmpeg2 | CVE-2022-37416   | https://security-tracker.debian.org/tracker/CVE-2022-37416  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                    libsndfile | CVE-2022-33065   | https://security-tracker.debian.org/tracker/CVE-2022-33065  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2023-3750    | https://security-tracker.debian.org/tracker/CVE-2023-3750   
                       libyaml | CVE-2024-35328   | https://security-tracker.debian.org/tracker/CVE-2024-35328  
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzip | CVE-2023-39741   | https://security-tracker.debian.org/tracker/CVE-2023-39741  
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                       mbedtls | CVE-2021-36647   | https://security-tracker.debian.org/tracker/CVE-2021-36647  
                       mbedtls | CVE-2021-43666   | https://security-tracker.debian.org/tracker/CVE-2021-43666  
                       mbedtls | CVE-2023-52353   | https://security-tracker.debian.org/tracker/CVE-2023-52353  
                   micropython | CVE-2023-7152    | https://security-tracker.debian.org/tracker/CVE-2023-7152   
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33718   | https://security-tracker.debian.org/tracker/CVE-2023-33718  
                         mp4v2 | CVE-2023-33717   | https://security-tracker.debian.org/tracker/CVE-2023-33717  
                         mupdf | CVE-2024-24259   | https://security-tracker.debian.org/tracker/CVE-2024-24259  
                         mupdf | CVE-2024-24258   | https://security-tracker.debian.org/tracker/CVE-2024-24258  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                       netdata | CVE-2023-22497   | https://security-tracker.debian.org/tracker/CVE-2023-22497  
                       netdata | CVE-2023-22496   | https://security-tracker.debian.org/tracker/CVE-2023-22496  
                         nginx | CVE-2023-44487   | https://security-tracker.debian.org/tracker/CVE-2023-44487  
                         ninja | CVE-2021-4336    | https://security-tracker.debian.org/tracker/CVE-2021-4336   
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2021-31693   | https://security-tracker.debian.org/tracker/CVE-2021-31693  
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                           php | CVE-2022-4900    | https://security-tracker.debian.org/tracker/CVE-2022-4900   
                       pkgconf | CVE-2023-24056   | https://security-tracker.debian.org/tracker/CVE-2023-24056  
                       poppler | CVE-2024-6239    | https://security-tracker.debian.org/tracker/CVE-2024-6239   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                       proftpd | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
           python-cryptography | CVE-2023-49083   | https://security-tracker.debian.org/tracker/CVE-2023-49083  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
               python-m2crypto | CVE-2023-50781   | https://security-tracker.debian.org/tracker/CVE-2023-50781  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                python-uvicorn | CVE-2020-7694    | https://security-tracker.debian.org/tracker/CVE-2020-7694   
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-2680    | https://security-tracker.debian.org/tracker/CVE-2023-2680   
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                          qemu | CVE-2024-6505    | https://security-tracker.debian.org/tracker/CVE-2024-6505   
                          qemu | CVE-2024-3567    | https://security-tracker.debian.org/tracker/CVE-2024-3567   
                       qt5base | CVE-2011-3193    | https://security-tracker.debian.org/tracker/CVE-2011-3193   
                       qt5base | CVE-2012-6093    | https://security-tracker.debian.org/tracker/CVE-2012-6093   
                       qt5base | CVE-2014-0190    | https://security-tracker.debian.org/tracker/CVE-2014-0190   
                       qt5base | CVE-2015-1290    | https://security-tracker.debian.org/tracker/CVE-2015-1290   
                       qt5base | CVE-2017-10905   | https://security-tracker.debian.org/tracker/CVE-2017-10905  
                       qt5base | CVE-2017-10904   | https://security-tracker.debian.org/tracker/CVE-2017-10904  
                       qt5base | CVE-2018-19869   | https://security-tracker.debian.org/tracker/CVE-2018-19869  
                       qt5base | CVE-2018-19870   | https://security-tracker.debian.org/tracker/CVE-2018-19870  
                       qt5base | CVE-2018-19873   | https://security-tracker.debian.org/tracker/CVE-2018-19873  
                       qt5base | CVE-2018-19871   | https://security-tracker.debian.org/tracker/CVE-2018-19871  
                       qt5base | CVE-2018-21035   | https://security-tracker.debian.org/tracker/CVE-2018-21035  
                       qt5base | CVE-2020-0570    | https://security-tracker.debian.org/tracker/CVE-2020-0570   
                       qt5base | CVE-2020-17507   | https://security-tracker.debian.org/tracker/CVE-2020-17507  
                       qt5base | CVE-2023-51714   | https://security-tracker.debian.org/tracker/CVE-2023-51714  
                       qt5base | CVE-2023-38197   | https://security-tracker.debian.org/tracker/CVE-2023-38197  
                       qt5base | CVE-2023-34410   | https://security-tracker.debian.org/tracker/CVE-2023-34410  
                       qt5base | CVE-2023-37369   | https://security-tracker.debian.org/tracker/CVE-2023-37369  
                       qt5base | CVE-2023-43114   | https://security-tracker.debian.org/tracker/CVE-2023-43114  
                       qt5base | CVE-2023-32573   | https://security-tracker.debian.org/tracker/CVE-2023-32573  
                       qt5base | CVE-2023-32763   | https://security-tracker.debian.org/tracker/CVE-2023-32763  
                       qt5base | CVE-2023-32762   | https://security-tracker.debian.org/tracker/CVE-2023-32762  
                       qt5base | CVE-2024-39936   | https://security-tracker.debian.org/tracker/CVE-2024-39936  
                       qt6base | CVE-2024-39936   | https://security-tracker.debian.org/tracker/CVE-2024-39936  
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-14628   | https://security-tracker.debian.org/tracker/CVE-2018-14628  
                        samba4 | CVE-2021-3670    | https://security-tracker.debian.org/tracker/CVE-2021-3670   
                        samba4 | CVE-2022-32743   | https://security-tracker.debian.org/tracker/CVE-2022-32743  
                        samba4 | CVE-2022-1615    | https://security-tracker.debian.org/tracker/CVE-2022-1615   
                        samba4 | CVE-2022-38023   | https://security-tracker.debian.org/tracker/CVE-2022-38023  
                        samba4 | CVE-2022-37967   | https://security-tracker.debian.org/tracker/CVE-2022-37967  
                        samba4 | CVE-2022-37966   | https://security-tracker.debian.org/tracker/CVE-2022-37966  
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                        shadow | CVE-2013-4235    | https://security-tracker.debian.org/tracker/CVE-2013-4235   
                          shim | CVE-2023-40548   | https://security-tracker.debian.org/tracker/CVE-2023-40548  
                        skopeo | CVE-2019-10214   | https://security-tracker.debian.org/tracker/CVE-2019-10214  
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                      suricata | CVE-2024-38536   | https://security-tracker.debian.org/tracker/CVE-2024-38536  
                      suricata | CVE-2024-38534   | https://security-tracker.debian.org/tracker/CVE-2024-38534  
                      suricata | CVE-2024-38535   | https://security-tracker.debian.org/tracker/CVE-2024-38535  
                      suricata | CVE-2024-37151   | https://security-tracker.debian.org/tracker/CVE-2024-37151  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                     tcpreplay | CVE-2023-4256    | https://security-tracker.debian.org/tracker/CVE-2023-4256   
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2023-6277    | https://security-tracker.debian.org/tracker/CVE-2023-6277   
                          tiff | CVE-2023-6228    | https://security-tracker.debian.org/tracker/CVE-2023-6228   
                          tiff | CVE-2023-52356   | https://security-tracker.debian.org/tracker/CVE-2023-52356  
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                      tpm2-tss | CVE-2023-22745   | https://security-tracker.debian.org/tracker/CVE-2023-22745  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                  vorbis-tools | CVE-2023-43361   | https://security-tracker.debian.org/tracker/CVE-2023-43361  
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2022-40982   | https://security-tracker.debian.org/tracker/CVE-2022-40982  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42311   | https://security-tracker.debian.org/tracker/CVE-2022-42311  
                           xen | CVE-2022-42321   | https://security-tracker.debian.org/tracker/CVE-2022-42321  
                           xen | CVE-2022-42313   | https://security-tracker.debian.org/tracker/CVE-2022-42313  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42315   | https://security-tracker.debian.org/tracker/CVE-2022-42315  
                           xen | CVE-2022-42316   | https://security-tracker.debian.org/tracker/CVE-2022-42316  
                           xen | CVE-2022-42314   | https://security-tracker.debian.org/tracker/CVE-2022-42314  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42318   | https://security-tracker.debian.org/tracker/CVE-2022-42318  
                           xen | CVE-2022-42317   | https://security-tracker.debian.org/tracker/CVE-2022-42317  
                           xen | CVE-2022-42312   | https://security-tracker.debian.org/tracker/CVE-2022-42312  
                           xen | CVE-2022-42320   | https://security-tracker.debian.org/tracker/CVE-2022-42320  
                           xen | CVE-2022-42309   | https://security-tracker.debian.org/tracker/CVE-2022-42309  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42322   | https://security-tracker.debian.org/tracker/CVE-2022-42322  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42323   | https://security-tracker.debian.org/tracker/CVE-2022-42323  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-4949    | https://security-tracker.debian.org/tracker/CVE-2022-4949   
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-23824   | https://security-tracker.debian.org/tracker/CVE-2022-23824  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2023-20588   | https://security-tracker.debian.org/tracker/CVE-2023-20588  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34324   | https://security-tracker.debian.org/tracker/CVE-2023-34324  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                           xen | CVE-2023-4949    | https://security-tracker.debian.org/tracker/CVE-2023-4949   
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                        xerces | CVE-2018-1311    | https://security-tracker.debian.org/tracker/CVE-2018-1311   
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33454   | https://security-tracker.debian.org/tracker/CVE-2021-33454  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

CVEs for the '2024.02.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                         avahi | CVE-2023-38472   | https://security-tracker.debian.org/tracker/CVE-2023-38472  
                         avahi | CVE-2023-38469   | https://security-tracker.debian.org/tracker/CVE-2023-38469  
                         avahi | CVE-2023-38470   | https://security-tracker.debian.org/tracker/CVE-2023-38470  
                         avahi | CVE-2023-38473   | https://security-tracker.debian.org/tracker/CVE-2023-38473  
                         avahi | CVE-2023-38471   | https://security-tracker.debian.org/tracker/CVE-2023-38471  
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2022-3807    | https://security-tracker.debian.org/tracker/CVE-2022-3807   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2023-1972    | https://security-tracker.debian.org/tracker/CVE-2023-1972   
                      binutils | CVE-2023-25588   | https://security-tracker.debian.org/tracker/CVE-2023-25588  
                      binutils | CVE-2023-25586   | https://security-tracker.debian.org/tracker/CVE-2023-25586  
                      binutils | CVE-2023-25585   | https://security-tracker.debian.org/tracker/CVE-2023-25585  
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2023-50428   | https://security-tracker.debian.org/tracker/CVE-2023-50428  
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                       busybox | CVE-2023-42363   | https://security-tracker.debian.org/tracker/CVE-2023-42363  
                       busybox | CVE-2023-42366   | https://security-tracker.debian.org/tracker/CVE-2023-42366  
                       busybox | CVE-2023-42364   | https://security-tracker.debian.org/tracker/CVE-2023-42364  
                       busybox | CVE-2023-42365   | https://security-tracker.debian.org/tracker/CVE-2023-42365  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                     coreutils | CVE-2024-0684    | https://security-tracker.debian.org/tracker/CVE-2024-0684   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          cpio | CVE-2023-7216    | https://security-tracker.debian.org/tracker/CVE-2023-7216   
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dash | CVE-2024-21485   | https://security-tracker.debian.org/tracker/CVE-2024-21485  
                           dht | CVE-2020-36562   | https://security-tracker.debian.org/tracker/CVE-2020-36562  
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                        dracut | CVE-2010-4176    | https://security-tracker.debian.org/tracker/CVE-2010-4176   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                        erlang | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
                        ffmpeg | CVE-2022-3109    | https://security-tracker.debian.org/tracker/CVE-2022-3109   
                        ffmpeg | CVE-2022-48434   | https://security-tracker.debian.org/tracker/CVE-2022-48434  
                        ffmpeg | CVE-2022-3341    | https://security-tracker.debian.org/tracker/CVE-2022-3341   
                        ffmpeg | CVE-2023-47470   | https://security-tracker.debian.org/tracker/CVE-2023-47470  
                        ffmpeg | CVE-2023-46407   | https://security-tracker.debian.org/tracker/CVE-2023-46407  
                        ffmpeg | CVE-2024-22860   | https://security-tracker.debian.org/tracker/CVE-2024-22860  
                        ffmpeg | CVE-2024-22862   | https://security-tracker.debian.org/tracker/CVE-2024-22862  
                        ffmpeg | CVE-2024-22861   | https://security-tracker.debian.org/tracker/CVE-2024-22861  
             freeradius-server | CVE-2002-0318    | https://security-tracker.debian.org/tracker/CVE-2002-0318   
             freeradius-server | CVE-2011-4966    | https://security-tracker.debian.org/tracker/CVE-2011-4966   
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                   ghostscript | CVE-2023-38560   | https://security-tracker.debian.org/tracker/CVE-2023-38560  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                         gnupg | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                        gnupg2 | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                          grpc | CVE-2023-1428    | https://security-tracker.debian.org/tracker/CVE-2023-1428   
                          grpc | CVE-2023-33953   | https://security-tracker.debian.org/tracker/CVE-2023-33953  
                          grpc | CVE-2023-44487   | https://security-tracker.debian.org/tracker/CVE-2023-44487  
                          grpc | CVE-2023-4785    | https://security-tracker.debian.org/tracker/CVE-2023-4785   
                          grpc | CVE-2023-32732   | https://security-tracker.debian.org/tracker/CVE-2023-32732  
                         grub2 | CVE-2023-4001    | https://security-tracker.debian.org/tracker/CVE-2023-4001   
                         grub2 | CVE-2024-1048    | https://security-tracker.debian.org/tracker/CVE-2024-1048   
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2023-0056    | https://security-tracker.debian.org/tracker/CVE-2023-0056   
                       haproxy | CVE-2023-45539   | https://security-tracker.debian.org/tracker/CVE-2023-45539  
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-5118    | https://security-tracker.debian.org/tracker/CVE-2016-5118   
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2023-5341    | https://security-tracker.debian.org/tracker/CVE-2023-5341   
                        jasper | CVE-2023-51257   | https://security-tracker.debian.org/tracker/CVE-2023-51257  
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                       kvmtool | CVE-2021-45464   | https://security-tracker.debian.org/tracker/CVE-2021-45464  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2020-21426   | https://security-tracker.debian.org/tracker/CVE-2020-21426  
                  libfreeimage | CVE-2020-21428   | https://security-tracker.debian.org/tracker/CVE-2020-21428  
                  libfreeimage | CVE-2020-21427   | https://security-tracker.debian.org/tracker/CVE-2020-21427  
                  libfreeimage | CVE-2021-33367   | https://security-tracker.debian.org/tracker/CVE-2021-33367  
                  libfreeimage | CVE-2023-47993   | https://security-tracker.debian.org/tracker/CVE-2023-47993  
                  libfreeimage | CVE-2023-47992   | https://security-tracker.debian.org/tracker/CVE-2023-47992  
                  libfreeimage | CVE-2023-47997   | https://security-tracker.debian.org/tracker/CVE-2023-47997  
                  libfreeimage | CVE-2023-47994   | https://security-tracker.debian.org/tracker/CVE-2023-47994  
                  libfreeimage | CVE-2023-47995   | https://security-tracker.debian.org/tracker/CVE-2023-47995  
                  libfreeimage | CVE-2023-47996   | https://security-tracker.debian.org/tracker/CVE-2023-47996  
                       libgtk2 | CVE-2014-1949    | https://security-tracker.debian.org/tracker/CVE-2014-1949   
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libmpeg2 | CVE-2022-37416   | https://security-tracker.debian.org/tracker/CVE-2022-37416  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                    libsndfile | CVE-2022-33065   | https://security-tracker.debian.org/tracker/CVE-2022-33065  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2023-3750    | https://security-tracker.debian.org/tracker/CVE-2023-3750   
                       libyaml | CVE-2024-35328   | https://security-tracker.debian.org/tracker/CVE-2024-35328  
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzip | CVE-2023-39741   | https://security-tracker.debian.org/tracker/CVE-2023-39741  
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                       mbedtls | CVE-2021-36647   | https://security-tracker.debian.org/tracker/CVE-2021-36647  
                       mbedtls | CVE-2021-43666   | https://security-tracker.debian.org/tracker/CVE-2021-43666  
                       mbedtls | CVE-2023-52353   | https://security-tracker.debian.org/tracker/CVE-2023-52353  
                         mdadm | CVE-2023-28736   | https://security-tracker.debian.org/tracker/CVE-2023-28736  
                         mdadm | CVE-2023-28938   | https://security-tracker.debian.org/tracker/CVE-2023-28938  
                   micropython | CVE-2023-7152    | https://security-tracker.debian.org/tracker/CVE-2023-7152   
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33718   | https://security-tracker.debian.org/tracker/CVE-2023-33718  
                         mp4v2 | CVE-2023-33717   | https://security-tracker.debian.org/tracker/CVE-2023-33717  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          nasm | CVE-2022-46456   | https://security-tracker.debian.org/tracker/CVE-2022-46456  
                       netdata | CVE-2023-22497   | https://security-tracker.debian.org/tracker/CVE-2023-22497  
                       netdata | CVE-2023-22496   | https://security-tracker.debian.org/tracker/CVE-2023-22496  
                         nginx | CVE-2023-44487   | https://security-tracker.debian.org/tracker/CVE-2023-44487  
                         ninja | CVE-2021-4336    | https://security-tracker.debian.org/tracker/CVE-2021-4336   
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2021-31693   | https://security-tracker.debian.org/tracker/CVE-2021-31693  
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                           php | CVE-2022-4900    | https://security-tracker.debian.org/tracker/CVE-2022-4900   
                       pkgconf | CVE-2023-24056   | https://security-tracker.debian.org/tracker/CVE-2023-24056  
                       poppler | CVE-2024-6239    | https://security-tracker.debian.org/tracker/CVE-2024-6239   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                       proftpd | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
           python-cryptography | CVE-2023-49083   | https://security-tracker.debian.org/tracker/CVE-2023-49083  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
               python-m2crypto | CVE-2023-50781   | https://security-tracker.debian.org/tracker/CVE-2023-50781  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                python-uvicorn | CVE-2020-7694    | https://security-tracker.debian.org/tracker/CVE-2020-7694   
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-6683    | https://security-tracker.debian.org/tracker/CVE-2023-6683   
                          qemu | CVE-2023-6693    | https://security-tracker.debian.org/tracker/CVE-2023-6693   
                          qemu | CVE-2023-2680    | https://security-tracker.debian.org/tracker/CVE-2023-2680   
                          qemu | CVE-2023-5088    | https://security-tracker.debian.org/tracker/CVE-2023-5088   
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                          qemu | CVE-2023-3019    | https://security-tracker.debian.org/tracker/CVE-2023-3019   
                          qemu | CVE-2024-6505    | https://security-tracker.debian.org/tracker/CVE-2024-6505   
                          qemu | CVE-2024-3567    | https://security-tracker.debian.org/tracker/CVE-2024-3567   
                       qt6base | CVE-2023-51714   | https://security-tracker.debian.org/tracker/CVE-2023-51714  
                       qt6base | CVE-2023-38197   | https://security-tracker.debian.org/tracker/CVE-2023-38197  
                       qt6base | CVE-2023-34410   | https://security-tracker.debian.org/tracker/CVE-2023-34410  
                       qt6base | CVE-2023-37369   | https://security-tracker.debian.org/tracker/CVE-2023-37369  
                       qt6base | CVE-2023-33285   | https://security-tracker.debian.org/tracker/CVE-2023-33285  
                       qt6base | CVE-2023-32573   | https://security-tracker.debian.org/tracker/CVE-2023-32573  
                       qt6base | CVE-2023-32763   | https://security-tracker.debian.org/tracker/CVE-2023-32763  
                       qt6base | CVE-2023-32762   | https://security-tracker.debian.org/tracker/CVE-2023-32762  
                       qt6base | CVE-2024-39936   | https://security-tracker.debian.org/tracker/CVE-2024-39936  
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-14628   | https://security-tracker.debian.org/tracker/CVE-2018-14628  
                        samba4 | CVE-2021-3670    | https://security-tracker.debian.org/tracker/CVE-2021-3670   
                        samba4 | CVE-2022-32743   | https://security-tracker.debian.org/tracker/CVE-2022-32743  
                        samba4 | CVE-2022-1615    | https://security-tracker.debian.org/tracker/CVE-2022-1615   
                        samba4 | CVE-2022-38023   | https://security-tracker.debian.org/tracker/CVE-2022-38023  
                        samba4 | CVE-2022-37967   | https://security-tracker.debian.org/tracker/CVE-2022-37967  
                        samba4 | CVE-2022-37966   | https://security-tracker.debian.org/tracker/CVE-2022-37966  
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                        shadow | CVE-2013-4235    | https://security-tracker.debian.org/tracker/CVE-2013-4235   
                          shim | CVE-2023-40548   | https://security-tracker.debian.org/tracker/CVE-2023-40548  
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                      suricata | CVE-2024-38536   | https://security-tracker.debian.org/tracker/CVE-2024-38536  
                      suricata | CVE-2024-38534   | https://security-tracker.debian.org/tracker/CVE-2024-38534  
                      suricata | CVE-2024-38535   | https://security-tracker.debian.org/tracker/CVE-2024-38535  
                      suricata | CVE-2024-37151   | https://security-tracker.debian.org/tracker/CVE-2024-37151  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                     tcpreplay | CVE-2023-4256    | https://security-tracker.debian.org/tracker/CVE-2023-4256   
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2023-6277    | https://security-tracker.debian.org/tracker/CVE-2023-6277   
                          tiff | CVE-2023-6228    | https://security-tracker.debian.org/tracker/CVE-2023-6228   
                          tiff | CVE-2023-52356   | https://security-tracker.debian.org/tracker/CVE-2023-52356  
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                      tpm2-tss | CVE-2023-22745   | https://security-tracker.debian.org/tracker/CVE-2023-22745  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                  vorbis-tools | CVE-2023-43361   | https://security-tracker.debian.org/tracker/CVE-2023-43361  
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2022-40982   | https://security-tracker.debian.org/tracker/CVE-2022-40982  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42311   | https://security-tracker.debian.org/tracker/CVE-2022-42311  
                           xen | CVE-2022-42321   | https://security-tracker.debian.org/tracker/CVE-2022-42321  
                           xen | CVE-2022-42313   | https://security-tracker.debian.org/tracker/CVE-2022-42313  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42315   | https://security-tracker.debian.org/tracker/CVE-2022-42315  
                           xen | CVE-2022-42316   | https://security-tracker.debian.org/tracker/CVE-2022-42316  
                           xen | CVE-2022-42314   | https://security-tracker.debian.org/tracker/CVE-2022-42314  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42318   | https://security-tracker.debian.org/tracker/CVE-2022-42318  
                           xen | CVE-2022-42317   | https://security-tracker.debian.org/tracker/CVE-2022-42317  
                           xen | CVE-2022-42312   | https://security-tracker.debian.org/tracker/CVE-2022-42312  
                           xen | CVE-2022-42320   | https://security-tracker.debian.org/tracker/CVE-2022-42320  
                           xen | CVE-2022-42309   | https://security-tracker.debian.org/tracker/CVE-2022-42309  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42322   | https://security-tracker.debian.org/tracker/CVE-2022-42322  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42323   | https://security-tracker.debian.org/tracker/CVE-2022-42323  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-4949    | https://security-tracker.debian.org/tracker/CVE-2022-4949   
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-23824   | https://security-tracker.debian.org/tracker/CVE-2022-23824  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2023-20588   | https://security-tracker.debian.org/tracker/CVE-2023-20588  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34324   | https://security-tracker.debian.org/tracker/CVE-2023-34324  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                           xen | CVE-2023-4949    | https://security-tracker.debian.org/tracker/CVE-2023-4949   
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                        xerces | CVE-2018-1311    | https://security-tracker.debian.org/tracker/CVE-2018-1311   
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33454   | https://security-tracker.debian.org/tracker/CVE-2021-33454  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

CVEs for the '2024.05.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                         avahi | CVE-2023-38472   | https://security-tracker.debian.org/tracker/CVE-2023-38472  
                         avahi | CVE-2023-38469   | https://security-tracker.debian.org/tracker/CVE-2023-38469  
                         avahi | CVE-2023-38470   | https://security-tracker.debian.org/tracker/CVE-2023-38470  
                         avahi | CVE-2023-38473   | https://security-tracker.debian.org/tracker/CVE-2023-38473  
                         avahi | CVE-2023-38471   | https://security-tracker.debian.org/tracker/CVE-2023-38471  
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2022-3807    | https://security-tracker.debian.org/tracker/CVE-2022-3807   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2023-50428   | https://security-tracker.debian.org/tracker/CVE-2023-50428  
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                       busybox | CVE-2023-42363   | https://security-tracker.debian.org/tracker/CVE-2023-42363  
                       busybox | CVE-2023-42366   | https://security-tracker.debian.org/tracker/CVE-2023-42366  
                       busybox | CVE-2023-42364   | https://security-tracker.debian.org/tracker/CVE-2023-42364  
                       busybox | CVE-2023-42365   | https://security-tracker.debian.org/tracker/CVE-2023-42365  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                     coreutils | CVE-2024-0684    | https://security-tracker.debian.org/tracker/CVE-2024-0684   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          cpio | CVE-2023-7216    | https://security-tracker.debian.org/tracker/CVE-2023-7216   
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dash | CVE-2024-21485   | https://security-tracker.debian.org/tracker/CVE-2024-21485  
                           dht | CVE-2020-36562   | https://security-tracker.debian.org/tracker/CVE-2020-36562  
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                        dracut | CVE-2010-4176    | https://security-tracker.debian.org/tracker/CVE-2010-4176   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                        erlang | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
             freeradius-server | CVE-2002-0318    | https://security-tracker.debian.org/tracker/CVE-2002-0318   
             freeradius-server | CVE-2011-4966    | https://security-tracker.debian.org/tracker/CVE-2011-4966   
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                   ghostscript | CVE-2023-38560   | https://security-tracker.debian.org/tracker/CVE-2023-38560  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                         gnupg | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                        gnupg2 | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                          grpc | CVE-2023-1428    | https://security-tracker.debian.org/tracker/CVE-2023-1428   
                          grpc | CVE-2023-33953   | https://security-tracker.debian.org/tracker/CVE-2023-33953  
                          grpc | CVE-2023-44487   | https://security-tracker.debian.org/tracker/CVE-2023-44487  
                          grpc | CVE-2023-4785    | https://security-tracker.debian.org/tracker/CVE-2023-4785   
                          grpc | CVE-2023-32732   | https://security-tracker.debian.org/tracker/CVE-2023-32732  
                         grub2 | CVE-2023-4001    | https://security-tracker.debian.org/tracker/CVE-2023-4001   
                         grub2 | CVE-2024-1048    | https://security-tracker.debian.org/tracker/CVE-2024-1048   
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2023-0056    | https://security-tracker.debian.org/tracker/CVE-2023-0056   
                       haproxy | CVE-2023-45539   | https://security-tracker.debian.org/tracker/CVE-2023-45539  
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-5118    | https://security-tracker.debian.org/tracker/CVE-2016-5118   
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2023-5341    | https://security-tracker.debian.org/tracker/CVE-2023-5341   
                        jasper | CVE-2023-51257   | https://security-tracker.debian.org/tracker/CVE-2023-51257  
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                       kvmtool | CVE-2021-45464   | https://security-tracker.debian.org/tracker/CVE-2021-45464  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2020-21426   | https://security-tracker.debian.org/tracker/CVE-2020-21426  
                  libfreeimage | CVE-2020-21428   | https://security-tracker.debian.org/tracker/CVE-2020-21428  
                  libfreeimage | CVE-2020-21427   | https://security-tracker.debian.org/tracker/CVE-2020-21427  
                  libfreeimage | CVE-2021-33367   | https://security-tracker.debian.org/tracker/CVE-2021-33367  
                  libfreeimage | CVE-2023-47993   | https://security-tracker.debian.org/tracker/CVE-2023-47993  
                  libfreeimage | CVE-2023-47992   | https://security-tracker.debian.org/tracker/CVE-2023-47992  
                  libfreeimage | CVE-2023-47997   | https://security-tracker.debian.org/tracker/CVE-2023-47997  
                  libfreeimage | CVE-2023-47994   | https://security-tracker.debian.org/tracker/CVE-2023-47994  
                  libfreeimage | CVE-2023-47995   | https://security-tracker.debian.org/tracker/CVE-2023-47995  
                  libfreeimage | CVE-2023-47996   | https://security-tracker.debian.org/tracker/CVE-2023-47996  
                       libgtk2 | CVE-2014-1949    | https://security-tracker.debian.org/tracker/CVE-2014-1949   
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libmpeg2 | CVE-2022-37416   | https://security-tracker.debian.org/tracker/CVE-2022-37416  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                    libsndfile | CVE-2022-33065   | https://security-tracker.debian.org/tracker/CVE-2022-33065  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2023-3750    | https://security-tracker.debian.org/tracker/CVE-2023-3750   
                       libyaml | CVE-2024-35328   | https://security-tracker.debian.org/tracker/CVE-2024-35328  
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzip | CVE-2023-39741   | https://security-tracker.debian.org/tracker/CVE-2023-39741  
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                       mbedtls | CVE-2021-36647   | https://security-tracker.debian.org/tracker/CVE-2021-36647  
                       mbedtls | CVE-2021-43666   | https://security-tracker.debian.org/tracker/CVE-2021-43666  
                       mbedtls | CVE-2023-52353   | https://security-tracker.debian.org/tracker/CVE-2023-52353  
                   micropython | CVE-2023-7152    | https://security-tracker.debian.org/tracker/CVE-2023-7152   
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33718   | https://security-tracker.debian.org/tracker/CVE-2023-33718  
                         mp4v2 | CVE-2023-33717   | https://security-tracker.debian.org/tracker/CVE-2023-33717  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          nasm | CVE-2023-31722   | https://security-tracker.debian.org/tracker/CVE-2023-31722  
                       netdata | CVE-2023-22497   | https://security-tracker.debian.org/tracker/CVE-2023-22497  
                       netdata | CVE-2023-22496   | https://security-tracker.debian.org/tracker/CVE-2023-22496  
                         nginx | CVE-2023-44487   | https://security-tracker.debian.org/tracker/CVE-2023-44487  
                         ninja | CVE-2021-4336    | https://security-tracker.debian.org/tracker/CVE-2021-4336   
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2021-31693   | https://security-tracker.debian.org/tracker/CVE-2021-31693  
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                           php | CVE-2022-4900    | https://security-tracker.debian.org/tracker/CVE-2022-4900   
                       pkgconf | CVE-2023-24056   | https://security-tracker.debian.org/tracker/CVE-2023-24056  
                       poppler | CVE-2024-6239    | https://security-tracker.debian.org/tracker/CVE-2024-6239   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                       proftpd | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
           python-cryptography | CVE-2023-49083   | https://security-tracker.debian.org/tracker/CVE-2023-49083  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
               python-m2crypto | CVE-2023-50781   | https://security-tracker.debian.org/tracker/CVE-2023-50781  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                python-uvicorn | CVE-2020-7694    | https://security-tracker.debian.org/tracker/CVE-2020-7694   
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-2680    | https://security-tracker.debian.org/tracker/CVE-2023-2680   
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                          qemu | CVE-2024-6505    | https://security-tracker.debian.org/tracker/CVE-2024-6505   
                          qemu | CVE-2024-3567    | https://security-tracker.debian.org/tracker/CVE-2024-3567   
                       qt6base | CVE-2023-51714   | https://security-tracker.debian.org/tracker/CVE-2023-51714  
                       qt6base | CVE-2023-38197   | https://security-tracker.debian.org/tracker/CVE-2023-38197  
                       qt6base | CVE-2023-34410   | https://security-tracker.debian.org/tracker/CVE-2023-34410  
                       qt6base | CVE-2023-37369   | https://security-tracker.debian.org/tracker/CVE-2023-37369  
                       qt6base | CVE-2023-33285   | https://security-tracker.debian.org/tracker/CVE-2023-33285  
                       qt6base | CVE-2023-32573   | https://security-tracker.debian.org/tracker/CVE-2023-32573  
                       qt6base | CVE-2023-32763   | https://security-tracker.debian.org/tracker/CVE-2023-32763  
                       qt6base | CVE-2023-32762   | https://security-tracker.debian.org/tracker/CVE-2023-32762  
                       qt6base | CVE-2024-39936   | https://security-tracker.debian.org/tracker/CVE-2024-39936  
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-14628   | https://security-tracker.debian.org/tracker/CVE-2018-14628  
                        samba4 | CVE-2021-3670    | https://security-tracker.debian.org/tracker/CVE-2021-3670   
                        samba4 | CVE-2022-32743   | https://security-tracker.debian.org/tracker/CVE-2022-32743  
                        samba4 | CVE-2022-1615    | https://security-tracker.debian.org/tracker/CVE-2022-1615   
                        samba4 | CVE-2022-38023   | https://security-tracker.debian.org/tracker/CVE-2022-38023  
                        samba4 | CVE-2022-37967   | https://security-tracker.debian.org/tracker/CVE-2022-37967  
                        samba4 | CVE-2022-37966   | https://security-tracker.debian.org/tracker/CVE-2022-37966  
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                        shadow | CVE-2013-4235    | https://security-tracker.debian.org/tracker/CVE-2013-4235   
                          shim | CVE-2023-40548   | https://security-tracker.debian.org/tracker/CVE-2023-40548  
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                      suricata | CVE-2024-38536   | https://security-tracker.debian.org/tracker/CVE-2024-38536  
                      suricata | CVE-2024-38534   | https://security-tracker.debian.org/tracker/CVE-2024-38534  
                      suricata | CVE-2024-38535   | https://security-tracker.debian.org/tracker/CVE-2024-38535  
                      suricata | CVE-2024-37151   | https://security-tracker.debian.org/tracker/CVE-2024-37151  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                     tcpreplay | CVE-2023-4256    | https://security-tracker.debian.org/tracker/CVE-2023-4256   
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2023-6277    | https://security-tracker.debian.org/tracker/CVE-2023-6277   
                          tiff | CVE-2023-6228    | https://security-tracker.debian.org/tracker/CVE-2023-6228   
                          tiff | CVE-2023-52356   | https://security-tracker.debian.org/tracker/CVE-2023-52356  
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                      tpm2-tss | CVE-2023-22745   | https://security-tracker.debian.org/tracker/CVE-2023-22745  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                  vorbis-tools | CVE-2023-43361   | https://security-tracker.debian.org/tracker/CVE-2023-43361  
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2022-40982   | https://security-tracker.debian.org/tracker/CVE-2022-40982  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42311   | https://security-tracker.debian.org/tracker/CVE-2022-42311  
                           xen | CVE-2022-42321   | https://security-tracker.debian.org/tracker/CVE-2022-42321  
                           xen | CVE-2022-42313   | https://security-tracker.debian.org/tracker/CVE-2022-42313  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42315   | https://security-tracker.debian.org/tracker/CVE-2022-42315  
                           xen | CVE-2022-42316   | https://security-tracker.debian.org/tracker/CVE-2022-42316  
                           xen | CVE-2022-42314   | https://security-tracker.debian.org/tracker/CVE-2022-42314  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42318   | https://security-tracker.debian.org/tracker/CVE-2022-42318  
                           xen | CVE-2022-42317   | https://security-tracker.debian.org/tracker/CVE-2022-42317  
                           xen | CVE-2022-42312   | https://security-tracker.debian.org/tracker/CVE-2022-42312  
                           xen | CVE-2022-42320   | https://security-tracker.debian.org/tracker/CVE-2022-42320  
                           xen | CVE-2022-42309   | https://security-tracker.debian.org/tracker/CVE-2022-42309  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42322   | https://security-tracker.debian.org/tracker/CVE-2022-42322  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42323   | https://security-tracker.debian.org/tracker/CVE-2022-42323  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-4949    | https://security-tracker.debian.org/tracker/CVE-2022-4949   
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-23824   | https://security-tracker.debian.org/tracker/CVE-2022-23824  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2023-20588   | https://security-tracker.debian.org/tracker/CVE-2023-20588  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34324   | https://security-tracker.debian.org/tracker/CVE-2023-34324  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                           xen | CVE-2023-4949    | https://security-tracker.debian.org/tracker/CVE-2023-4949   
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                        xerces | CVE-2018-1311    | https://security-tracker.debian.org/tracker/CVE-2018-1311   
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33454   | https://security-tracker.debian.org/tracker/CVE-2021-33454  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
