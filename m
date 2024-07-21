Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79F0C3DA5D
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 04:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 296574031E;
	Sun, 21 Jul 2024 04:47:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P7SRfFzyytY8; Sun, 21 Jul 2024 04:47:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E8A4402FE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E8A4402FE;
	Sun, 21 Jul 2024 04:47:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8F0441BF2E3
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 04:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C58D40144
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 04:47:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4MDsT5gG1usZ for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 04:47:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 493B840289
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 493B840289
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 493B840289
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 04:47:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 035486000A
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 04:47:12 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 21 Jul 2024 04:47:12 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1721537233; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JgLtc0QlCMrYoA7HFczE7HnBY+W+ykWPdBJ3i8XaBgI=;
 b=PKge9/8ZmOXW6yNRZ+8JhVQ5O3KRG274M6o8aHid9qLjBwu/ldLISVFCA1Zbhvav12KEGX
 xFgrziRA1qZ73E9zeczvhVVDfITBd/KQ06TgWYqQB8tWbUkMYB3vKd9NN7Ik1HVHTyxfM6
 bzzUJoJl3mOv+16sQsZ28oRiFVCnxQGkmGtrbZLCAeU3Ar/f9/IADLLoJWyD2mF2bM4c82
 /hGkLcP9YMpUATiVvQx5MxtJvQ9tELNk1jPltj4dXtIeJIkxNIU7Kwb60nCO4pWQ+W4r6T
 crEUtEavDdgSod43YqZeAtuWLecM0l5bSysRb6CtOue6zlIAivGfoWBXYXxWsA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PKge9/8Z
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-07-20
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
Message-ID: <20240721044712.JYcJr5nBTkX5NQW511htkaqsYU2WgG4fwB_1YrIMLjY@z>

Hello,

Autobuild statistics for 2024-07-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  5  |  5  |  0  | 10  |
  2024.05.x  |  3  |  4  |  0  |  7  |
    master   | 96  | 227 |  2  | 325 |

Classification of failures by reason for master
-----------------------------------------------

                    mpir-3.0.0 | 12
                elfutils-0.189 | 10
host-vboot-utils-bbdd62f9b0... | 8 
aer-inject-9bd5e2c7886fca72... | 7 
                  bcusdk-0.0.5 | 6 
                   httping-2.5 | 6 
                     avahi-0.8 | 5 
edid-decode-6f117a8f8c0e76e... | 5 
                flashrom-1.3.0 | 5 
glibc-2.39-74-g198632a05f6c... | 5 
  gobject-introspection-1.76.1 | 5 
                  ntp-4.2.8p18 | 5 
                gnu-efi-3.0.18 | 4 
                host-odb-2.4.0 | 4 
                  libffi-3.4.6 | 4 
                   linux-6.9.8 | 4 
                       unknown | 4 
                  ffmpeg-6.1.1 | 3 
                   foot-1.16.2 | 3 
                 gnuplot-6.0.1 | 3 
             gnuradio-3.10.7.0 | 3 
             host-delve-1.22.1 | 3 
         host-libxcrypt-4.4.36 | 3 
              host-rust-1.79.0 | 3 
ibm-sw-tpm2-5452af422edeff7... | 3 
                    norm-1.5.8 | 3 
                      xz-5.6.2 | 3 
android-tools-4.2.2+git2013... | 2 
                 apache-2.4.61 | 2 
                    bat-0.24.0 | 2 
                  cairo-1.18.0 | 2 
                   cpuload-0.3 | 2 
                 dc3dd-7.2.641 | 2 
                     frr-8.5.4 | 2 
         gobject-introspection | 2 
            gtkiostream-v1.8.0 | 2 
 host-binutils-bare-metal-2.42 | 2 
host-go-bootstrap-stage3-1.... | 2 
                 libp11-0.4.12 | 2 
               mariadb-10.11.6 | 2 
                 pixman-0.42.2 | 2 
    python-cryptography-39.0.2 | 2 
         python-remi-2022.7.27 | 2 
                unbound-1.19.1 | 2 
                  zabbix-6.2.7 | 2 
           at-spi2-core-2.50.0 | 1 
aubio-152d6819b360c2e7b379e... | 1 
                 augeas-1.12.0 | 1 
                  autossh-1.4g | 1 
     bandwidthd-2.0.1-auto-r11 | 1 
                  bitcoin-26.2 | 1 
                 chicken-5.3.0 | 1 
                     crun-1.15 | 1 
                directfb-1.7.7 | 1 
                    dust-0.9.0 | 1 
dvb-apps-3d43b280298c39a67d... | 1 
                espflash-3.1.0 | 1 
                     file-5.45 | 1 
                   flann-1.9.2 | 1 
                  gamin-0.1.10 | 1 
              gcc-final-13.3.0 | 1 
                    gdal-3.8.2 | 1 
            gdk-pixbuf-2.42.10 | 1 
               graphene-1.10.8 | 1 
                 highway-1.2.0 | 1 
            host-binutils-2.42 | 1 
         host-gcc-final-14.1.0 | 1 
           host-gengetopt-2.23 | 1 
                   host-go-src | 1 
host-heimdal-f4faaeaba371ff... | 1 
              host-runc-1.1.12 | 1 
 host-softether-4.30-9700-beta | 1 
                    htop-3.3.0 | 1 
              hyperfine-1.18.0 | 1 
                       kmod-31 | 1 
      libabseil-cpp-20230802.1 | 1 
               libcap-ng-0.8.5 | 1 
                 libcli-1.10.7 | 1 
                 libcoap-4.3.4 | 1 
libdbi-drivers-0bfae6c43134... | 1 
                  libdex-0.6.1 | 1 
                libesmtp-1.1.0 | 1 
                 libpng-1.6.43 | 1 
                libressl-3.8.4 | 1 
                  libsepol-3.6 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
                 libvpx-1.13.1 | 1 
                libxml2-2.12.6 | 1 
          linux-5.10.162-cip24 | 1 
               lynx-2.8.9rel.1 | 1 
                memtest86-6.20 | 1 
                mongodb-4.2.18 | 1 
                    mpv-0.35.1 | 1 
              netopeer2-2.1.49 | 1 
                 openssh-9.8p1 | 1 
                openswan-3.0.0 | 1 
               pulseaudio-17.0 | 1 
python-unittest-xml-reporti... | 1 
            quickjs-2024-01-13 | 1 
             rabbitmq-c-0.13.0 | 1 
                rocksdb-6.20.3 | 1 
rtmpdump-c5f04a58fc2aeea629... | 1 
                s6-dns-2.3.7.2 | 1 
tftpd-e52af4207a6e09a1ba21f... | 1 
                tpm2-tss-3.2.2 | 1 
                    volk-3.0.0 | 1 
            vorbis-tools-1.4.2 | 1 
                wlroots-0.16.2 | 1 
                       zsh-5.9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/dc6edd03664c92e1e7ffa19e22863b32c11e23d8 | ORPH
 microblaze  | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/90642642702dd50162e6e2c471a231132d1d76bc | ORPH
   arceb     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/4055de562ff4d4dba1be476870c2c154e89fe01e | ORPH
   armeb     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/9a59abae852c71e80f476c90f3ca9a748337cb13 | ORPH
   x86_64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/a876eed02783ed0e56db7da820e43fe89d59eba2 | ORPH
   nios2     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/b2eccddd8634020aea2b76b74aaa6bd84fa62a97 | ORPH
   mips64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/e1acc6fbef02ff7f92d427abf50870efe6e3412e | ORPH
   xtensa    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/279a1de0595d0edd92bb5eaa500755aecfe2e2a1 |     
 microblaze  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/4cdb5fb83501549699d6cd2f359f8e9aa62022a1 |     
  sparc64    |         apache-2.4.61          | NOK | http://autobuild.buildroot.net/results/0611d948325a6504d8f791da6b994efede3f6502 |     
   x86_64    |         apache-2.4.61          | NOK | http://autobuild.buildroot.net/results/9cd9c26183befef00c90d97cdb0ee98b347d5c2a |     
    arm      |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.net/results/0caa2c907aed4898409a1486ac6975e3d40b1921 |     
   sh4aeb    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.net/results/b621ad86350d92672a15927e843e83e046b7a255 |     
 aarch64_be  |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/65014642966721115ae4050c23b083a7f39e1300 | ORPH
    sh4      |          autossh-1.4g          | NOK | http://autobuild.buildroot.net/results/5d80a8096d0f5529cbd86903a74f3bab3d230f4a | ORPH
   x86_64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/aaf53062c44519309f204ecc397126e336325bc2 | ORPH
powerpc64le  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/4629b4f641fa440a541c4abd1828921520c4495a | ORPH
  sparc64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/79ee6e40a4910e63e6e28ba97d2d124d2fead953 | ORPH
 aarch64_be  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/ed0145899c97ee8f9530d57b1d58d80e0f64630a | ORPH
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/c1269b27700029504c6b90e5863fc72746194894 | ORPH
   s390x     |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/f280ed712bbbf295c61156d440f791cd2a81cdc9 |     
    arm      |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/fb85390e7625536c5b24bda890693d347c694d48 |     
   x86_64    |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/2096552bd10b38dcb6d810e18c57554b30f0b19b |     
    or1k     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/460f3209df37a0739e0061cd12e16f90560bf0dd |     
   xtensa    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/539b3fefb54d797c3bfcc095b33256d308940cd6 |     
    arm      |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/c669ee1161589d85be3d5768d2005b7d99adf079 |     
    arc      |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/febb89ff92f74346cc3913290c353f945594eb7b |     
 microblaze  |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/ebdaf73e7cc9c30cc7608743013aff304df5f902 |     
  sparc64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/e17c55bd2c44344d1f2517c5cb9be0a309b380b3 |     
  powerpc    |          bitcoin-26.2          | NOK | http://autobuild.buildroot.net/results/8439e3ced6f246e8a3990a5882c4d70e33df573b |     
  riscv64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/c7be534ab790bee5ecbef7008767352a697b991c |     
  mips64el   |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/48ae8a5b164b95b676334ae7409040088dcf9b21 |     
   xtensa    |         chicken-5.3.0          | NOK | http://autobuild.buildroot.net/results/a25b6aec801a56ea1148fdfab9b66f9a94ebfda8 |     
   x86_64    |          cpuload-0.3           | NOK | http://autobuild.buildroot.net/results/3bca2659011d123d7b7a0ca19c4e868643d45766 |     
  sparc64    |          cpuload-0.3           | NOK | http://autobuild.buildroot.net/results/20e3fc55e0c756b5892a9d97b204eae6428d8400 |     
   sparc     |           crun-1.15            | NOK | http://autobuild.buildroot.net/results/a76dec60065399fc7772bc31f9dc19b3f8143ec5 |     
microblazeel |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/a377ee23c602178f7f4bdb9d9a05db9aa136d515 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/25063899e7821ab01d1f2c0fc056463474c656c0 | ORPH
    arm      |         directfb-1.7.7         | NOK | http://autobuild.buildroot.net/results/f28dd0f0f11df53b880c7b001d98ce95fce0eb6f | ORPH
   armeb     |           dust-0.9.0           | NOK | http://autobuild.buildroot.net/results/e06c39e7176c9fafb3abd8d37294b808c7e9336c | ORPH
   sparc     | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/193d033edc1295f2e55638774e8ed7a90df2cc11 |     
   x86_64    | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/c569b0484dcd33f6ea88a9b6f11df5b54401db96 | ORPH
    i686     | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/5c0d384d1accc66edcfce5e20efcdce9e459ff30 | ORPH
    sh4      | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/72d0b7a1e531de9d89987381fa13fe77514f2d50 | ORPH
  riscv32    | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/ec1b2f0f158c48a367216be907866fbeff5c54db | ORPH
   nios2     | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/bb86e696b80394cf4fd7686bb40836151f258d4f | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/7d17152135e2e5cde1e4505c8083b5a21c6f6a57 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/89811c42b43bb18664bf0bbfd2e70f3ff5c1721a | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/b095d18858e27b9402efb6655b3d226916a9da25 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/3a99bd9f56377a64aba1e7784354f045dbe9f92f | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/01a1ed85ec5b639414b029724b71b7b48d6562eb | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/ddf80951debf76a918228acc92756cb270135c2f | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/3d3b8455b84380826098600f16194b73414439bf | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/8f2b81e70e40b2e34ed08dfa663de181d9aa51de | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/c1bb8b8337a59b8defa6acc4eac49723d7c3c360 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/11936d5b20dc0b9ede4a7dee5a5cb4cd0336c32b | ORPH
  sparc64    |         espflash-3.1.0         | NOK | http://autobuild.buildroot.net/results/24fe0e65976b218aac6fb5fdcac4eb8b307fc267 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/b4a1d91b4b4d00c0bb98f5b22dd83c858203e248 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/561bd3c38d02031eaf9798b06280c5b4da7bd0ec |     
   arceb     |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/cd09d4994caeff49b635192d00544c25b2b1fd60 |     
   mips64    |           file-5.45            | NOK | http://autobuild.buildroot.net/results/1e4aeef4ad6de214ecc61cdfabc92c2ca1d031f5 | ORPH
   mipsel    |          flann-1.9.2           | NOK | http://autobuild.buildroot.net/results/f9d125c2c81b991cc04501688026e5712277fb47 |     
  riscv32    |         flashrom-1.3.0         | NOK | http://autobuild.buildroot.net/results/c689bf039d7686a9b42c6fcb84f87b555a9bcfb6 |     
   mipsel    |         flashrom-1.3.0         | NOK | http://autobuild.buildroot.net/results/eecabbdd0d21344991379a57e605845e73ef679e |     
  riscv64    |         flashrom-1.3.0         | NOK | http://autobuild.buildroot.net/results/b8af34413ab32c8cb04a9ed4fc5e18a9be3e86c4 |     
    i686     |         flashrom-1.3.0         | NOK | http://autobuild.buildroot.net/results/188b8e3f25685aefbeee6accb3ffdaca4cc17d98 |     
   arceb     |         flashrom-1.3.0         | NOK | http://autobuild.buildroot.net/results/c3c2ee636458482de1c8da739f783dd6e2f06e0b |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/3012e1690e01f67bde11d4a363e8254314c92b13 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/a095b60fc729457c391f33d215e67e09b67c396b |     
microblazeel |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/b5120082eded78be53702450382305ef7ff1ad4c |     
    arc      |           frr-8.5.4            | NOK | http://autobuild.buildroot.net/results/03ba9ae7323148e25805d7b76723aec37ffea3d1 |     
    arc      |           frr-8.5.4            | NOK | http://autobuild.buildroot.net/results/6206e1bd85fad2b422a71a02caa08d500c5230ae |     
   sh4eb     |          gamin-0.1.10          | NOK | http://autobuild.buildroot.net/results/59b9104c2e69e4db630c78a95984257ed8690b05 | ORPH
  powerpc    |        gcc-final-13.3.0        | NOK | http://autobuild.buildroot.net/results/63d7b41238c79b319176516412ceb2a124e0c984 |     
microblazeel |           gdal-3.8.2           | NOK | http://autobuild.buildroot.net/results/2c2cac7ff9fc88f43c8e41371e11d84ec777c2c4 |     
  mips64el   |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/d1d2e833ca2822b05a91415308a56e9b1ca01812 | ORPH
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/7fdf2f5735f043b294d81400449cea1f78a56f2d |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/3b6e2854d0c9e031b1d3c3ce60549c59cd9fb0d9 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/c2f746c5c927b7cc8246ce317022f131a6c3b738 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/d48e56f16fbdc5571d0888fc0f55ee3e6f336be2 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/04e307a9c2161c5aae9d69df03b7e6a43fe2a5a8 |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/209bc79b6f2adece6f99bceafb774cdc197fe69a |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/69070ff81a3e35e5fa15599d75fb1a27c35b28c1 |     
   x86_64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/0f1bdfb1b4ce5e0281b5a05d186ebb813b733a9d |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/738300d0a0e4e82f987b51b0bfbd384c2c09829d |     
   mipsel    |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/dddc6b8f67cbac6cd932b821beb11833c8444316 |     
   mips64    |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/43e3123a57c5227e50d60aa57f819d45382c3041 |     
   nios2     |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/d3b6657f6c7e754313cf1ce1b7efcb4e87cf4b12 |     
    or1k     |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/9d36a53e224d7971539fc3c877bfc44e88bdb707 |     
   xtensa    |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/000f4a4a24cd8269a6808aa50a62ac18c281842d |     
   mipsel    |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/1731597e9b8af8cadafd22a292bbca0af24b1e4b |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/d7b255885c08a60e76cd6e2e7838c02a7614382f |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/8abb9cc57ec995e6361b81ee33ae577324dc2ca6 |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/19533bd47e0a98420b2eb1bd1721aa442eb5b95a | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/3acf27732f2b8faf6b48944f069b40f406c033cc | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/1f6f9769ec2f0cdae78a16f6c6b9f218656a0089 | ORPH
    mips     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/215c45bc7bfbf57a41dceee02cae0ba838e22b22 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/6c7b8fb33730b57d3a4cf1302f62c3ebb6e63d09 | ORPH
   xtensa    |        graphene-1.10.8         | NOK | http://autobuild.buildroot.net/results/328b47631faf8d9091aa9c44006ce809c87c8a35 |     
  aarch64    |       gtkiostream-v1.8.0       | NOK | http://autobuild.buildroot.net/results/4085f8c3b1209e7f3a7ec2cbd9c1ee17ca532a3e |     
    arm      |       gtkiostream-v1.8.0       | NOK | http://autobuild.buildroot.net/results/6be71c9fbdccbdf4f5e540bafa748dda833aeedb |     
    arm      |         highway-1.2.0          | NOK | http://autobuild.buildroot.net/results/804322892def2f20935702609a41b6a0071692ab |     
   xtensa    |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/d210ca89fddbed01196619f4fcc763d8c74c2f08 |     
   s390x     | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/0ea9b1761e665852443f5f45858202a77998a1e2 |     
 microblaze  | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/6bbf4c39939b2480b61eba82da8a3edb90e7c3ac |     
   mips64    |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/022de514cf11a7c568f1bd6739414d9eebeb20ba |     
    i686     |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/907ec77f443e89371dff06bb33485fa5b8602636 |     
  riscv64    |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/c3329b90e672675e56bef2704f13f50239dcd172 |     
powerpc64le  |     host-gcc-final-14.1.0      | NOK | http://autobuild.buildroot.net/results/ed6bb9f99a773bbd31183ee147cff481d9f53926 |     
  aarch64    |      host-gengetopt-2.23       | NOK | http://autobuild.buildroot.net/results/4cfa513e024ea2cb2058fde4ffdd727bd379dae7 |     
  mips64el   | host-go-bootstrap-stage3-1.... | NOK | http://autobuild.buildroot.net/results/41bd4369befa1c3f425c396321251f5f631085be |     
    arm      | host-go-bootstrap-stage3-1.... | NOK | http://autobuild.buildroot.net/results/23a4b2356c44f79e74d3bf53dc00ead0f3d804d9 |     
    i686     |          host-go-src           | NOK | http://autobuild.buildroot.net/results/c6a28111d836c4b3e7a317b8400128b0812d2c9f |     
    arc      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/0259205e3f5dc2cfc5d62968d3b06db1ee919035 | ORPH
 microblaze  |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/46d731676e6ba53ccc628149d556124782e8704a |     
    arm      |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/5c80cf22498a2babe4fe8e0ae13b42430383cff9 |     
   sh4eb     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/70054660d0349fae68d916e13fda80cd227e4988 |     
 powerpc64   |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/c040d1a530c0462b2f7f78dbdfd03e00dbe1cb2c | ORPH
 microblaze  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/1b432467501c24a06569f8eeb3a430f34aa65ff5 | ORPH
   s390x     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/8b7b34c4e723446ae9a7d2eb55f5b434a81df571 | ORPH
   sparc     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/335d8a32df3f76d045c3580affcacb7529c0e881 | ORPH
  mips64el   |        host-runc-1.1.12        | NOK | http://autobuild.buildroot.net/results/6998a9577fd4fb5acd2415489763a4fcecf12f99 |     
   armeb     |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/115a23988d3ac994da8c895a68508c4f4ad0580a |     
   x86_64    |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/d249d78da10f1c6f42ade47d9a05348165a5e47a |     
    i686     |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/78a26eae32c7d4f95db1b5df47f0f7843a9d1cd2 |     
    m68k     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/613f432344f04e9ae388d184461b92d16e9e548f | ORPH
  riscv64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/aa9dcad3922e299169c61cd4eef6518d483bf2c8 |     
    arc      | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/50f636dc90d6a8a63c7852ce7c0f36c0bdb69483 |     
    arm      | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/06d00724f396a84f97ba236ad410c54ecbb74bb0 |     
   mips64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/badb610dc0b6c154e6c511d1c99c61f4faca68c7 |     
   armeb     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/fc651e31558b91b742082485abf60b275c23ecfc |     
  mips64el   | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/90b63091d8bfe53239513c32789d6070d3f0ca9b |     
   mipsel    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/658d8bd60d018501a4ae0bce2f469a351ab1452c |     
  powerpc    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/a850a1d41ca6c3ee72e426d9f7e1f7951c416d8b |     
   nios2     |           htop-3.3.0           | NOK | http://autobuild.buildroot.net/results/a402f9e864f802bcd3fd7cc5fd62e1b3b17f7856 | ORPH
 powerpc64   |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/50f928dfbfffa755d0b68eae59a467ae1f6e0721 |     
   mipsel    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/7d4108c535dff5a0f7eabf8c4b7e69f6b0c2c5a3 |     
powerpc64le  |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/b2dcae157cdf5f3c4adfcb73bf55d18b315b618a |     
   mips64    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/f9cfb6f55d1f2cb855e6959c2381eeddea3e4936 |     
   x86_64    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/836b2b34042570e0a329d6ac95bbce1f518aea44 |     
    m68k     |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/d471ce7595d41640501d93063f83a301987145f4 |     
   armeb     |        hyperfine-1.18.0        | NOK | http://autobuild.buildroot.net/results/a0ba67a09129f3ef020808ee2d6a4ee21d949d26 | ORPH
   mipsel    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/9abfafe38b98e4194568b877dedbf6742964386e |     
   nios2     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/c7b01a9f16ce30032ae0a37748a2508266bd80c1 |     
    or1k     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/a197924dcd4038b4bafb67e89adf4747812b0466 |     
microblazeel |            kmod-31             | NOK | http://autobuild.buildroot.net/results/9253aca48e3ea19cacedc1c47230794d880ac87a |     
   mips64    |    libabseil-cpp-20230802.1    | NOK | http://autobuild.buildroot.net/results/07ba4a05a1de51adb90aa96c120a45957c4c0ab6 |     
  riscv64    |        libcap-ng-0.8.5         | NOK | http://autobuild.buildroot.net/results/96f56a282216fb9729a5e2c1336bf9c14f55fe16 |     
  riscv64    |         libcli-1.10.7          | NOK | http://autobuild.buildroot.net/results/a170d27689e069cf58f830bdd74f604364ee503b |     
  sparc64    |         libcoap-4.3.4          | NOK | http://autobuild.buildroot.net/results/6bd3e1390cbbc59b9b3d030c2a401e45e9d173da |     
   armeb     | libdbi-drivers-0bfae6c43134... | NOK | http://autobuild.buildroot.net/results/7199404b323ee57125d301626a25993807361634 |     
    mips     |          libdex-0.6.1          | NOK | http://autobuild.buildroot.net/results/e7068ba9432e3618a0b6d889fb0ee1c0555d835e |     
   sh4eb     |         libesmtp-1.1.0         | NOK | http://autobuild.buildroot.net/results/7d1ad8fceb7034961143ba896c26ba944b9ec410 | ORPH
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/d7ace6db06cc1cfd40aedb7c64b624c6d2246911 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/340ff6689c36b4e5b09eb076a0701c981fc1097c |     
    or1k     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/5ee630b73d8259ca48df22e720907f4bd70f3fc8 |     
    or1k     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/f5857e15260d8db985c50160146b2d1e788770f8 |     
  powerpc    |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/573c306d80415690d9d6fb845203a377c62af328 | ORPH
    or1k     |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/b03cc27a60f9e6794b3341517196fbf8dc3ec2d4 | ORPH
powerpc64le  |         libpng-1.6.43          | NOK | http://autobuild.buildroot.net/results/73527bdfb47d1562e1106ef6b87b5e01a1488657 |     
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/5cefca08a62cb9c4b702fd22db9cc57b5f25a862 | ORPH
powerpc64le  |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/1aa9c989870c89d2edf869fc3343635302836164 |     
   mipsel    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/669ca4ad60931cced5b9124b8634f1f9a027f3e1 | ORPH
 aarch64_be  |         libvpx-1.13.1          | NOK | http://autobuild.buildroot.net/results/22fddc26df4e16909040665c1dd5858b94e43370 |     
  mips64el   |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/a4c83a78c73a77e66e1d67c5fafa9ea72d8dbc0d |     
   mipsel    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/d59339b6ba8fb5f99efde35044558e6f78a9c6f7 | ORPH
   nios2     |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/9c485ccffd65fdb6149fcae70ccc11c00df445dc | ORPH
    sh4a     |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/0c48fcf8356f80bb74862cb7f7648a2b48e20340 | ORPH
    or1k     |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/a794a63602884c031b9045b01afc5507da77e31e | ORPH
    mips     |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/5d9a2c38420a4cd4ea382d499181e62302196c7b | ORPH
   arceb     |        lynx-2.8.9rel.1         | NOK | http://autobuild.buildroot.net/results/b95fa021348408a188c9cf18cf22fa974bd6221a |     
   s390x     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/3c6c41e84911bfd805463086974cb54358f50b45 | ORPH
   x86_64    |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/147e8caafc1a1dfd160592863587c5a44efbeb2b | ORPH
    i686     |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/f03c16aa60d914821d74c10c5669330203917a15 |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/e84d501cb6deb08f497e17eca013a8739010acf1 |     
   xtensa    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/c249197b374ca2b84f3c86eab6e50682dd0573ff |     
    mips     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/86f63abdb243f33b181ce652d2a23a43c8ba92f8 |     
  powerpc    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/2ed19cf37c935e90609ddbddcb3fea0ac38baa7f |     
  powerpc    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/3453e837a029bbf4f1299ffc6dad73b9fec62535 |     
    mips     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/3ab381f06d5dc030039b6f6f8d19feb55cf3367d |     
   arceb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/1bd819ced14689c8aa1337a7c09812f8e2da656d |     
    i686     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/93de259bfada9cd3a5f3c2625f669ac03606abca |     
    or1k     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/e0abbfbdd54b8cbcaab8709754f6ae2f9e2540ac |     
    arc      |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/a66aecce270b9488aefa8c4aeeede4c14cf28819 |     
 microblaze  |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/1e49a32ab3944a7f202b43b5ebb56f411d8f498b |     
  riscv32    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/f4440697f250912efe8716863a1e2f2c6fc5a15f |     
   mips64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/c6b4da82a4eca010e46760bea721a09b60c56529 |     
   xtensa    |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/b1f2dee503687021ac8def5b2152ef9b07628f13 |     
   s390x     |        netopeer2-2.1.49        | NOK | http://autobuild.buildroot.net/results/35b4a5b2cd5f11a6b922ef8ee64d2e45473413ab |     
 powerpc64   |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/7eccd251f34f09226817fa1f0735e3ff1233298a | ORPH
  aarch64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/dd72560c2bbf2dcbd54a632afb89a77f0bcdb4c1 | ORPH
   x86_64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/3319d3f523d76c1fea9c333ab5ed1c55798d427d | ORPH
    arc      |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/e54d0cf0844b999a0e2441a473efaff579ef231d |     
 microblaze  |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/ea5f734e130034bd4ff0f808f80316a3c9fb9579 |     
   sparc     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/d54c8bc26a7a1b111387f30ee81b6f2a3ba19e2b |     
   xtensa    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/8b5d004447132b7905f39f3109fdaa8c1f6961ac |     
   sparc     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/c7e1f14b2653fddf578334d4e4acd9a9c30c46a8 |     
  mips64el   |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/881cf2c6b270172e6698c8d8ecdec2c81fd56cde | ORPH
    mips     |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/8f109654affea46a18d42bf494d1f3a83084fcdc | ORPH
   arceb     |         pixman-0.42.2          | NOK | http://autobuild.buildroot.net/results/f8134739bd14124f5fc52c836d61524bbe5b76fd | ORPH
  sparc64    |         pixman-0.42.2          | NOK | http://autobuild.buildroot.net/results/943d335672778e05a3b48552d4f3ee98d090b4ea | ORPH
    mips     |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.net/results/cf599a24509db63b9380899f8f978875b26a61e1 | ORPH
 aarch64_be  |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/67deb846723f3849b2dec18dd022b5400ed589b4 |     
   nios2     |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/2c71468b15d6117e100b0c1197f93393ef822522 |     
 aarch64_be  |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/f527d220cb6675aa8199d8f421820be3f1500a61 |     
    i686     |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/925199d47e81af3c26fa388199d043a6b3159b24 |     
  aarch64    | python-unittest-xml-reporti... | NOK | http://autobuild.buildroot.net/results/3678a8a0c161c5a224b3c814f560db53592a5e5b |     
    or1k     |       quickjs-2024-01-13       | NOK | http://autobuild.buildroot.net/results/a15ea7cfa2123e879e19d4da8435b6eedad13b4f |     
 aarch64_be  |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/8a4f3f3f3328e007197dd2c241c8e49319805e6f |     
 aarch64_be  |         rocksdb-6.20.3         | NOK | http://autobuild.buildroot.net/results/f2455a39fc9e973d41806dcd43b0423ae13079ec |     
    or1k     | rtmpdump-c5f04a58fc2aeea629... | NOK | http://autobuild.buildroot.net/results/918f0f7efa810b17f6d2266a890bf0150cbed146 |     
   sparc     |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/71fc5f74ea1c5c4cd97af5525ad55bcea2e4cfd4 |     
   mipsel    | tftpd-e52af4207a6e09a1ba21f... | NOK | http://autobuild.buildroot.net/results/4b5320013d8ab50499a459d64a71e0b71814fb2f | ORPH
 powerpc64   |         tpm2-tss-3.2.2         | NOK | http://autobuild.buildroot.net/results/b8f2278b62e0b0e8d859282c467bb6bdcdb7b07d | ORPH
 powerpc64   |         unbound-1.19.1         | NOK | http://autobuild.buildroot.net/results/7ba23bbffdf197ef851b86f7f77858c2ac30d8ef |     
    i686     |         unbound-1.19.1         | NOK | http://autobuild.buildroot.net/results/b7782f5ba54543df53a835552632f58d4ad6c082 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/9891784b08e5cd35ddb9fd5600cde228e1659f76 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/64eb76c0e2f07babf51627dd77997e7e2771d1d9 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/6f391f0c29c1a94e4fea28013d4f4df91e2362f0 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/c5467705bd19c40b214c76e5b30d64d11fce363d |     
  powerpc    |           volk-3.0.0           | NOK | http://autobuild.buildroot.net/results/57db38df1f2c4ece0c77751ebedbc32c8ab8f4b1 |     
   x86_64    |       vorbis-tools-1.4.2       | NOK | http://autobuild.buildroot.net/results/bb5d56d836e7d0f2a62daa9954878ad6e0b190ed | ORPH
    arm      |         wlroots-0.16.2         | NOK | http://autobuild.buildroot.net/results/cbb7156df25c63c4c3d27a97c653fa571581aa8d |     
   xtensa    |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/428e0276de156a2785049272c0ed496deaa188d2 | ORPH
   mips64    |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/eac52bd5d94055805c75f5c6bf6cc4fe935b44f0 | ORPH
   sparc     |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/8a105d2ae36b1bcd95d942e1c5cde58c1db543b0 | ORPH
  mips64el   |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/75dfe12312b5479669fcdfea623d93880c675e13 |     
   x86_64    |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/7c3fe62c5c1e79700e8e0616de0d755a0b12a0fb |     
    or1k     |            zsh-5.9             | NOK | http://autobuild.buildroot.net/results/fe2f7170465e96cc1de3dae139a25f615331f4b9 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                libressl-3.8.4 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                mongodb-4.2.18 | 1 
pppd-e1266c76d1ad39f98f1167... | 1 
               tcf-agent-1.8.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/e71040f024e8ceb64a0a3c25f288b731c89e24f9 | ORPH
 powerpc64   |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/05c60a54129508ada5d31c519fa3777a4402a3f6 | ORPH
   x86_64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/cc65fa330a755cec4da564575b701f264f7e7702 |     
  sparc64    | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/3eca1df712607c506add74cd1214e71a012e8d40 |     
microblazeel |        tcf-agent-1.8.0         | NOK | http://autobuild.buildroot.net/results/e5d20637f97335d82fb31539b6ae95ae70842928 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

           crucible-2023.11.02 | 1 
                fail2ban-1.0.2 | 1 
                     frr-8.5.4 | 1 
                libressl-3.8.4 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |      crucible-2023.11.02       | NOK | http://autobuild.buildroot.net/results/748ccb6e93ac9beb2189e5a93b680a3f17db8291 |     
   mipsel    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/46cb60abf615ecf4f53d16bbe3ada88de0b0244a |     
   xtensa    |           frr-8.5.4            | NOK | http://autobuild.buildroot.net/results/82d5ee82d13fc06019021fda4c643fa17c4836c6 |     
  powerpc    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/6c6726cb197c58625f3400ae597ec047d2171753 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
