Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3488C30658
	for <buildroot@archiver.kernel.org>; Fri,  5 Jul 2024 04:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EAE4847CB;
	Fri,  5 Jul 2024 04:58:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r9ZpUQ8OIVvn; Fri,  5 Jul 2024 04:58:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2035F847CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2035F847CC;
	Fri,  5 Jul 2024 04:58:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2AF531BF291
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 04:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18B39847CC
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 04:58:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W_owpYMYgxem for <buildroot@lists.busybox.net>;
 Fri,  5 Jul 2024 04:57:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 26846847CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26846847CB
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 26846847CB
 for <buildroot@buildroot.org>; Fri,  5 Jul 2024 04:57:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3DF38C0004
 for <buildroot@buildroot.org>; Fri,  5 Jul 2024 04:57:54 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 05 Jul 2024 04:57:54 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1720155474; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fTY73coxzk5KJbiyWCC8vtxYhPRAJXf4TvyIs1NzAsA=;
 b=WUkcOqLTtmfFxc1oQLPSM+yWiof2e+XV4euF6DnhF9sC6gE1ojlhJzrG04Yl0dInO/etEE
 WaLLgo7IwLLEtQ4GI7ywoZG+b2ZWG3qFvsm/1u/VWBpcdSXpE9CNdBhMZ0ImHZjqGrtH6+
 3mm6mJ70DFsAAC0ANldGi3Ka1ZWmF6U36YVE00s8BD5kRn8DXr24xuwIpnJZLqm+YARSUI
 mdar1JFJyjGx5vKjB9M3bozQYmrdEamS0z0yz4DibU948Cl5studS5uvnggVDlojQZflj0
 JSHFtQeMbF+PUIwLZdQ1sXxCYBWpd5Ap2cvgp71RX0uuT6pQIf8P/cAOZB/uFg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WUkcOqLT
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-07-04
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
Message-ID: <20240705045754.6lXm5E_zB1hKq5IM3ULs2Ut5yHo9u5KLtaS8UO58RzA@z>

Hello,

Autobuild statistics for 2024-07-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  3  |  6  |  0  |  9  |
  2024.05.x  |  8  | 12  |  0  | 20  |
    master   | 51  | 390 |  0  | 441 |

Classification of failures by reason for master
-----------------------------------------------

                    zstd-1.5.6 | 38
            host-cdrkit-1.1.11 | 36
host-prelink-cross-a853a5d7... | 29
                libressl-3.8.4 | 19
                    yajl-2.1.0 | 16
               cracklib-2.9.11 | 12
                 haserl-0.9.36 | 9 
host-android-tools-4.2.2+gi... | 7 
                  jack2-1.9.22 | 7 
                 libcurl-8.8.0 | 7 
libsvgtiny-ea9d99fc8b231c22... | 7 
                dovecot-2.3.21 | 6 
              fluent-bit-3.0.4 | 6 
                 libssh-0.10.6 | 6 
                     mtd-2.2.0 | 6 
aer-inject-9bd5e2c7886fca72... | 5 
                 dc3dd-7.2.641 | 5 
                elfutils-0.189 | 5 
       freeradius-server-3.2.3 | 5 
             rabbitmq-c-0.13.0 | 5 
check-11970a7e112dfe243a2e6... | 4 
                flannel-0.25.2 | 4 
glibc-2.39-74-g198632a05f6c... | 4 
                host-odb-2.4.0 | 4 
ibm-sw-tpm2-5452af422edeff7... | 4 
                    mpir-3.0.0 | 4 
                python3-3.12.4 | 4 
           sane-backends-1.1.1 | 4 
                       unknown | 4 
                  zabbix-6.2.7 | 4 
                 coreutils-9.3 | 3 
                fail2ban-1.0.2 | 3 
                   host-go-src | 3 
              host-rust-1.79.0 | 3 
                  libffi-3.4.6 | 3 
               libglib2-2.76.1 | 3 
           mediastreamer-4.4.8 | 3 
     bandwidthd-2.0.1-auto-r11 | 2 
brcm-patchram-plus-95b7b691... | 2 
                 cdrkit-1.1.11 | 2 
             containerd-1.7.18 | 2 
                   evemu-2.7.0 | 2 
                  ffmpeg-6.1.1 | 2 
                   foot-1.16.2 | 2 
            gdk-pixbuf-2.42.10 | 2 
                gnu-efi-3.0.18 | 2 
         host-libxcrypt-4.4.36 | 2 
                   httping-2.5 | 2 
                       kmod-31 | 2 
              libarchive-3.7.4 | 2 
                 libp11-0.4.12 | 2 
                libxml2-2.12.6 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                  monit-5.33.0 | 2 
                  nginx-1.24.0 | 2 
                    norm-1.5.8 | 2 
                paxtest-0.9.15 | 2 
              udpcast-20230924 | 2 
                unbound-1.19.1 | 2 
                      xz-5.6.2 | 2 
                    ympd-1.3.0 | 2 
android-tools-4.2.2+git2013... | 1 
                apr-util-1.6.3 | 1 
                    attr-2.5.2 | 1 
aubio-152d6819b360c2e7b379e... | 1 
                 augeas-1.12.0 | 1 
                 avro-c-1.11.3 | 1 
                  bcusdk-0.0.5 | 1 
                    brltty-6.6 | 1 
                 c-icap-0.5.10 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
             dahdi-tools-3.3.0 | 1 
                   duma-2.5.21 | 1 
               ebtables-2.0.11 | 1 
                    fcft-3.1.6 | 1 
                     file-5.45 | 1 
               freeipmi-1.6.14 | 1 
               gocryptfs-2.3.2 | 1 
google-breakpad-f49c2f1a202... | 1 
            host-qt6base-6.4.3 | 1 
host-vboot-utils-bbdd62f9b0... | 1 
                    htop-3.3.0 | 1 
               ipmitool-1_8_19 | 1 
           janus-gateway-1.1.2 | 1 
          libcamera-apps-1.2.1 | 1 
                 libcli-1.10.7 | 1 
                libgdiplus-6.1 | 1 
                   libnl-3.9.0 | 1 
              libopenssl-3.3.1 | 1 
                  libsepol-3.6 | 1 
                  libva-2.22.0 | 1 
               lighttpd-1.4.76 | 1 
          linux-5.10.162-cip24 | 1 
                   linux-6.9.4 | 1 
                 logsurfer-1.8 | 1 
                   luvi-2.14.0 | 1 
               mariadb-10.11.6 | 1 
                   oatpp-1.3.0 | 1 
                 openssh-9.8p1 | 1 
                   rauc-1.11.3 | 1 
                   redis-7.2.5 | 1 
                s6-dns-2.3.7.1 | 1 
             strongswan-5.9.13 | 1 
               valgrind-3.22.0 | 1 
                    vtun-3.0.4 | 1 
                 zlib-ng-2.1.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/f589c6a6a1d97c70052c5799901cb286ab909ca0 | ORPH
  mips64el   | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/75962917246be8c54fdcb646f8b5158d5dd1226e | ORPH
   sparc     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/edf3b4080bba2a5dc9b049de47d81aad86ef03b8 | ORPH
   mips64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/5fd04cffac594b2597a0b72e275d6dce4d39b86b | ORPH
    m68k     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/119ca5204a3040f863f92551f221f0d41ad6093f | ORPH
   nios2     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/32db63151aeb8e2957a328bd2eb1abdc62c256a5 |     
   nios2     |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/30429312938364cd9affe3cbc21439c1df81ba43 |     
   s390x     |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/bb024e02afec1dec47fd88a6fc973a1a527c3a0d |     
    m68k     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.net/results/93d12ec3cb81c599bba3e31f1deb895c2557607d |     
 microblaze  |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/c419b8ed22db4c8e753c1034e71c5959b41a8f40 | ORPH
  mips64el   |         avro-c-1.11.3          | NOK | http://autobuild.buildroot.net/results/02e3dc80371cb1f69855d82706c33d700d4c4855 |     
    arm      |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/2cf363e18feb22b002245a77532c46bde1ae471a |     
  sparc64    |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/def002954b366a0e7438d45aa4a26bc0abd6af50 |     
    mips     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/e74cb92a334b161758634dd048d42051c7610361 |     
   mips64    | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/2e0baa97cdce1e9191ea24c9511a2690d6e8dd30 |     
   nios2     | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/c9a87df0d67c5c8905adf846dd457f239c537d50 |     
  powerpc    |           brltty-6.6           | NOK | http://autobuild.buildroot.net/results/3d1c4c8a7a19bfa7e8ecf5f4350f1d6a8ddfb85d |     
 microblaze  |         c-icap-0.5.10          | NOK | http://autobuild.buildroot.net/results/7fb12234b58326707153cf95001b6b06cadafd83 | ORPH
   mipsel    |         cdrkit-1.1.11          | NOK | http://autobuild.buildroot.net/results/edfdae30c242565646864084647c475013dac828 |     
    arm      |         cdrkit-1.1.11          | NOK | http://autobuild.buildroot.net/results/385323579792716b59f3313c93595b860876fb3c |     
   nios2     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/072132389084bb02d306cd9a04de0d97e0c41e3d |     
   xtensa    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/47ff6ee7491f99ac11ab06bacecf1843ec51e0ca | ORPH
   xtensa    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/bf093ade621ecaf89b8c3ccd717ad1bc53e13ad5 | ORPH
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/487fe79d0140c5062a3824ae988e4ef3ed622af4 | ORPH
  mips64el   | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/9d247db213fc270d6678fda036325422f09607d7 | ORPH
  riscv64    |       containerd-1.7.18        | NOK | http://autobuild.buildroot.net/results/deebf5ec1290f2e7ed094c569609c2c7142af020 |     
  riscv64    |       containerd-1.7.18        | NOK | http://autobuild.buildroot.net/results/7bba061ba76329bec935bbeba542a625b666045d |     
    arm      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/9993ed78c8d6fb6410073310bff6610905b4981c | ORPH
  sparc64    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/2055e3dd85df8730b1cddaa948aed10cce37424e | ORPH
    arc      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/c8f1c3202124cac81bc07291b2f1226fe4bf9725 | ORPH
 powerpc64   |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/0f219ebe49f8734eef1f62c2dfb9fc04b4e6a18b |     
    i686     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/2415e324921143a710b66c33477331c291d9e769 |     
    arc      |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/1fed196d3a9a6e13871fc21bda7cedf841031e0f |     
 aarch64_be  |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/d2f050869761e3ad8ab646dbd778b5af34d72929 |     
powerpc64le  |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/6b1ae866bfa44e41b6f616d38e7a2776cbc2092b |     
   mipsel    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/38a7759a8c828079c04ab0def50cab9937d43613 |     
    i686     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/5b3d1fe9ff2844edb6e61242c557d877fd0d1fd0 |     
    mips     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/bfb2505d60063c0f11184596b81087e83f7e77a7 |     
 microblaze  |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/6e170a4c3b39d44a86ad29ab4abc9461f074878b |     
   nios2     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/312473ceb98a53f81c08989c5312eba1b84470a7 |     
powerpc64le  |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/0c5b94eb81cdd0b811647b266a6fe883ade5b32b |     
  mips64el   |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/f56d6cb7e17c98bd6d9a54e308f06f4ba18111d1 |     
    i686     |       dahdi-tools-3.3.0        | NOK | http://autobuild.buildroot.net/results/42826cbdd70845d892bf5623f71c98bb1cf680f2 |     
  mips64el   |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/7b794ba6b7509597aaebbbdbb6bc6ea28289589c | ORPH
   sparc     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/8e9ded42f76f09f89098bfa8c1f039705b140f15 | ORPH
   xtensa    |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/b2db71a9926eb4b5b9bda6f187af5539dcf4d5cb | ORPH
   armeb     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/aa0d43eaed50dcb7deff95a08ebca99ac2301b44 | ORPH
   sparc     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/78442f42dd0c4dededf476b46177c6c348e27209 | ORPH
    m68k     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/8814341af956ace08e264502e8e6b097958457f9 |     
   xtensa    |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/7de71c1d69270d41f5c4c9cd612f940fa5125e64 |     
 powerpc64   |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/465f4aeeaaa14178dd49e9b656a52effb09b6b8c |     
    arm      |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/387e25e4d56894b3b34f33046f369a1fa4eedaa2 |     
    or1k     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/f5ef2456a85157857ff89b72b1de2196a5f44bea |     
    m68k     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/b35094e6d36a818005345874451cc19a1f8a4639 |     
    m68k     |          duma-2.5.21           | NOK | http://autobuild.buildroot.net/results/b79f8986ff3981a4e1907b83b839e4215aaf437a | ORPH
  mips64el   |        ebtables-2.0.11         | NOK | http://autobuild.buildroot.net/results/be20febfb9e21bee5c22138e6a34016079b7eab8 |     
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/09e6bdc70599b6df9fa748cba311e19ba61db4a0 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/74fe260b429868ef397fcaf4c32092caf5f6662d | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/1adad1e753faff94da9c3398ebe7ec038379ce82 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/ff71c7ca64aa37b6a8b06d14332374b1ce974e99 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/feefdfe1bf8a1fc76871876bdcfe2e0a585df580 | ORPH
  aarch64    |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/ffc261634913cf771d539d03f540c1f5af16ca1f |     
   nios2     |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/79417eb1a3f218b71437eacb42a175c9a764e51c |     
  aarch64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/e413d98181b78083e5dd2a8443c3422496ae928a |     
  powerpc    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/be6d5773051bbfe301a65829a452a56855a68fbe |     
  mips64el   |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/bbd9c007feb8cbe045340ddf8b55da27be0af317 |     
    arm      |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/53a789764ef6083ca6926a168b6b34912b4f4bbb |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/ebdfe1499abf24a6376b3a25cfb344b7735a3511 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/b3e012ee25e1ec5c80fd56fd9fcdb3417ae1ab07 |     
  powerpc    |           file-5.45            | NOK | http://autobuild.buildroot.net/results/045076c3b24b784550492fa3f6664ad8f7689aba | ORPH
   x86_64    |         flannel-0.25.2         | NOK | http://autobuild.buildroot.net/results/d51a43f1a333ae2e672b5349ef40a1e14cc8d8e1 |     
  aarch64    |         flannel-0.25.2         | NOK | http://autobuild.buildroot.net/results/7186824a48f9f9fe9af54251049eca4e0214f945 |     
    arm      |         flannel-0.25.2         | NOK | http://autobuild.buildroot.net/results/4de4df113ae2b43d7a3a7e1788af7ca47d845723 |     
   x86_64    |         flannel-0.25.2         | NOK | http://autobuild.buildroot.net/results/a7f98ebb5cfa10fe0dca22d4c2cd3bfb13d0dacb |     
   s390x     |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/269706d87ceec0710eb612a673eeffb70b30fdac |     
    m68k     |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/d7e43677c69941f00cf11f2a6be34be546101d8f |     
   sh4eb     |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/5fd68cc9b07ef40278da74320bb840db8e3c4afc |     
  mips64el   |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/c9bf77943315b06167b4fe6d8ab37d1dd16f09fd |     
    or1k     |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/007a870f41c4b803d565bbc0b648392c241e06e6 |     
    arm      |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/787de3412d80627081a725643767d4e7cc5c74e6 |     
 microblaze  |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/c550fcc2295e2d902bfb6e3e5bcbc44fa3562fcf |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/63062c7d16fbdb2a09f4a305ff0912f0f4373340 |     
   mipsel    |        freeipmi-1.6.14         | NOK | http://autobuild.buildroot.net/results/c757058a321ee70a8685458659e05428315b8108 |     
  sparc64    |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/dfffe82b52c7ecfd40ed3cc85c6872f9c8df1efb |     
    mips     |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/ac9455a18a0bd947869a6c5811086c2a2c9cbbdc |     
    arm      |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/1ac1b74feb2979d3405784072a43ad03d862689b |     
  riscv32    |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/641ddda04b580f042dc60ce21218db5b28b9d509 |     
    or1k     |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/ca8f9d165fb0105b86f324a9b3b8183429ca906e |     
  aarch64    |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/9f3a401a3792740f6f7c5b3210b3aafa7c0e2fc6 | ORPH
    m68k     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/619ec034756ed990f019f62b4114c8513fb39b14 | ORPH
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/4a38bd85b9191593e889f92832421b4bff0f6be0 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/dad494c9ad65b36f65138459ef93c5236bcc3a2e |     
   arceb     | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/7a784e20cec48703ef16ccd8a48bfe1614d8e5ec |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/09179eb07afd89b8b8b0ccc4ac7fcddb9329ca21 |     
  aarch64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/b0084f2c1a3926e1b8a948af21c890573de8ead5 |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/2c184909febf4a79b498afb72e196305ec6010bd |     
   x86_64    |        gocryptfs-2.3.2         | NOK | http://autobuild.buildroot.net/results/a19abfc68aa7adc8f80543560c16f4b5b9a552c4 |     
   mipsel    | google-breakpad-f49c2f1a202... | NOK | http://autobuild.buildroot.net/results/b601d54ac0da2b30b343af7d5e00a6ccb6668001 |     
   xtensa    |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/7a917f8647e7e146253c69f1d1c20c5147183108 | ORPH
    arm      |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/1191642d3d73d5dcef6489f7859698c530f17898 | ORPH
   sparc     |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/ee22196e2c403445dde822ea9ea161ff65d3ec22 | ORPH
   sparc     |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/f0e5d344fc1ec095023b600de75cacb2b7359210 | ORPH
    arc      |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/9eb83f053bd7376f25272abb78b10c38b8888054 | ORPH
 powerpc64   |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/e92bbe36978d9aab16e2cd433905c1ba385a4fb0 | ORPH
    arc      |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/3b80f22ec5f16f209c59881cab7f807fe4900b60 | ORPH
   xtensa    |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/a926800c56fca28161d7ced3cb2532b7cdd7c6fa | ORPH
microblazeel |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/e576333d2918b3bb44e161f055dbf2859b35ccce | ORPH
    sh4      | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/24059f1ea84ec59b308dd9e81b320f1172fe576c |     
   nios2     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/3540885dec317d6b0e8c9af55c514cb45b6e04f2 |     
  mips64el   | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/8c2ae7130ae869acb0a717a5af803f06b4da0146 |     
 aarch64_be  | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/9ed7e397ba99c3a8a8ae0cac3746aca1eee11afa |     
  powerpc    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/99b1871a25733216123cf0e5f82d01ef51dc33b6 |     
   armeb     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/90fd77373fa3ec7fd29e1c3fa8de2b1804a6b6c1 |     
    arc      | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/1e4cb8e5993365f8d0013d7539a2489f56daa44e |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/0e9875164f88d81da3b17ad58cef699b782063c8 |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/9ce0f278e7462c00ec5f542ba4896798710b64a3 |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/dad675dbeceae47e6fad45398e2566e134febe15 |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/12c1aa5c0c8efdaa5b17d98ed7d96afdcb0cbdd6 |     
    arc      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/8eafe9c63c4a030efea0908c799fc0d32544e155 |     
   sh4eb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/57a4b69574342cc65131746e59abbd51f3e03bcf |     
    arc      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/5ced273d3ad4bb3b73b7e18fd8ef81490e7f9c88 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/62d6fab3a4e646bc5206927522aeb69b4cba963a |     
    arc      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e39c0abcb972fdc6b58b4dcf37deef18e1c89df2 |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/913e59176c8cfa4895773a9479909e75bfda380a |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/7da8de37904a479a08af7549917dd83efdebab1b |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/52d5f2b3fe7fb7056fc2cff4b6bf2da71e6ff9dd |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a01931fa4baa0fd6846fafd7daa4988c44953419 |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/648edc30a11a5bcaf2c4724b006c0b75e0af0865 |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f215db4c4e256e3f12a5cf7cc45fdc79cb9922a3 |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/4c069ae93663393a983ee883baab7d75a9e0c3c2 |     
    arm      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/bec3a4520b8324266173c42099f58ee5f3e998db |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/241cf5ab25551fac590776e0255ae27806b816d9 |     
    m68k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/1fa2cf385cfa97ed37c4b7acfa99b6c59796bded |     
    arc      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f1d2f9bcbca979b09b438f8a28f53bf5ac53ba0c |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3e95582f8fb843f78a04104ddcdc4d96648e6e34 |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/c1455c00c7da7fe602b675ab705485faf26ed8a5 |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/aa5a28c028c0ee3d4d955fd83ed7c249db7bb410 |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/594d817140999a8a0ee8d50b795524184718ba9c |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/330ece844b0790c04fff9e587dcdc9a8d26a0067 |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/dbced68db93ccd6a421218d7bd11066561693bd9 |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/cc08eaeb821eb8754e78f0b31ce748e157278a60 |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/74903cdb58db20f63787bad170b52c3b581d5bfd |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/71ccecc60dfa95af5423f3c92449b0a7b54a3433 |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a40340104347ae97b2f36990054d82682a154663 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/31cb94b3c01cff7e1acef1faffd6f98d9d9aa05f |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f51c7ac06031c1edd135672dabdde528850cf5c3 |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/9aaa5604044727424df63456fdd60b2f7b9eeff2 |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/43f77e2ea4736fd1eb2436bedff7072bf5e5f1b5 |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/d76075dd42db81d4fe2786ebf8f8f1bf253228e8 |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/8216de8d131a557311a5cef103c91b022448d479 |     
   mips64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/b5dbd95af8fd6a2aee3f7efbd8630cde6a6e4e83 |     
  mips64el   |          host-go-src           | NOK | http://autobuild.buildroot.net/results/1804b14bff341f9bd37de56d8930ae4fec8c6dc1 |     
   mips64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/48dca3f541e1c18fd51811382d2d63613d7049fe |     
   mipsel    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/d5ad41af8fee1b48fe156d663751b030fb73549a |     
powerpc64le  |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/6a6021d142ca63fb4982e1920334a217651a98c4 |     
 microblaze  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/853bca3fba6c1f4365a52508ea81de8d8a1b454e | ORPH
    arc      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/19532b265233f5b6d7f9a62034f5aca258b514d5 | ORPH
   mips64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/9a838ba18e7cab6543cfa9a90949651163677c2e | ORPH
   x86_64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/cb701ef2c83133abc989087bb95cc5d4fbbc6859 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e98e978f233bf8e57b1c7594bdc301690661fbb9 | ORPH
   mips64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a7b81446f36e5b809870384aed444c10ed7d36ce | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0b9d7d48fd12255fe32ed9ff989dbeb92c69ecf8 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0dd38b3aa838eb54fa6ae82965046048079dbd00 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0211cdbd5c34f021a76d77fff4f434f4b81b8b9e | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4817f36d8db232c631fdfef538a2fb3d33518775 | ORPH
    arc      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/fc7fa6cb576c176a581832696818b14fbffb5358 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/95faeab89504a463f91f06e64c9071e263c2c822 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/37ef27e7783a474f21eec0f57aa4300165075110 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4cf0657ad72a31f504d97378b0de1c941ad32729 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d3fd0c39df0be4537087f9c22d232237f8f3c630 | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b6995bf70ca7c50f7ddabe147daf3577fff73d3d | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4bc6f9993c0ce3e86a0c4d65ac7b1abf5c28ec87 | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/61e621fdee2ae7a508149985d2ac0aa238dec838 | ORPH
  mips64el   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/29cefed6c3e121b0462f738145e9420e527352d0 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a90aed9fbb5b54b8b79f4e24ea5d1f7a27aa1d0b | ORPH
    arm      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/79cf40127d8cf267ee5479712ee0cc5f7f9fd48c | ORPH
   armeb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/63ac0225780edf45c09684866ed82dfdd8e40415 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/5efbfe41e4454b89ccd53c3852305b385ba53f53 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/66a6575361cf70cdb3e25e670d9d9bfc59287201 | ORPH
    m68k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/15e521e04fe775a915b40913002cf7b3957bab17 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/cbe1e1626375569101118758c60fe45f7410c987 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a5091aa3430dae4a7538413b3fb72a3531e27c24 | ORPH
    i586     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9a5d600ec444313b87fb65dacff122cdc5ec0616 | ORPH
   armeb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/92c75010eb40b686a5be6e74c1be4e989814ef1d | ORPH
   sparc     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f4e2b0a4c72d0764949b5d9133dccc5c8fabeddf | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ad1f45bf9c77e0b2d4e70b49b544b27475c992f4 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/975b8c51e8b8534a1abb0c7f7ba46ebc6f6c6be6 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/378d9e44a478fce2026f7ae39421d52748ca0205 | ORPH
   x86_64    |       host-qt6base-6.4.3       | NOK | http://autobuild.buildroot.net/results/ec4521feeff42d4460d14bb2288c4371967cd9ec |     
   armeb     |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/826aef82f5fbd2fe6e253eb35e924c3c16e1e4e6 |     
   x86_64    |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/5077864438dfdf42a489d126b8d6da8841659510 |     
  sparc64    |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/340d734b8b9bae07d3caf9b74eaa008da3d94004 |     
   sparc     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/1f3fbb597df1ebe31bbd43d8de271b587a056330 |     
 aarch64_be  |           htop-3.3.0           | NOK | http://autobuild.buildroot.net/results/529fd2c1a64be5701a39cab4f5ee8e26dc0ca8d0 | ORPH
    i686     |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/bbfd796dfc30ce4ca70f84a2f76309caaa355acf |     
   x86_64    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/128589ed8d61b580bfeb7d49b31930b7f8a09e85 |     
    arm      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/af727f8e789757456d82233b83d07ae6f9ce1927 |     
    sh4a     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/c69b12a8a7b021f12f85cbd6ff027e1108ccbd4d |     
 powerpc64   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/2da99671cbc9a016eff5eda339be2761c322ce3e |     
   xtensa    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/8453996ecaaf4a46302dd4d640a2ad5540721eda |     
   arceb     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/5f1a99c333a8e4c5345503bfc8a024d44ce6f21f |     
    i686     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/7e2d6940ef98c90a2ef9c9f904394f7db2664019 |     
microblazeel |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/0b21d0e847910f34bdfe92ed0455e20d269bcc69 |     
 aarch64_be  |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/e11bfdffbcfa2b0f3b896effa8536f479ad41c81 |     
   sh4eb     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/9e4ad7dcd2c0e5964d9d4386d4bc553dfbef0bea |     
 microblaze  |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/3fd526466e4a42efb3a2b4b6ab4876d4fee0c0c6 |     
  mips64el   |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/7cadfd919554f7f3925ab2ff6189b25b6adda26c |     
  aarch64    |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/73560190a32996fd100a515275f610d5291c96c2 |     
   xtensa    |      janus-gateway-1.1.2       | NOK | http://autobuild.buildroot.net/results/e02fcd604ee2c60c34e2adea9ded7619709c251e |     
   mips64    |            kmod-31             | NOK | http://autobuild.buildroot.net/results/2aa4962849dfb114a22e30be6881392e874f3966 |     
   mips64    |            kmod-31             | NOK | http://autobuild.buildroot.net/results/1bb24f75105e7213956aec7a1073ddce452a931f |     
    arm      |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/24fef34aaf61c1aa5fe032768a7c22dfe389ec55 |     
 microblaze  |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/54119dd63bfb3800a9e71f4b026763e3364a3548 |     
powerpc64le  |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/9400e4ab71cacbabcace64f3d044c63b3f362783 |     
   xtensa    |         libcli-1.10.7          | NOK | http://autobuild.buildroot.net/results/ca4110e947c493f8b91e8f5afcef61535898b64c |     
   sparc     |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/b1aaaea5f026278d669d8d98900474e9417b29f1 |     
  sparc64    |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/1b49abc8b59c8310a75d4359221d50f3bfba091b |     
   arceb     |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/5bc480ddbf7ec8d9e345affdb2534108eb5a9c9b |     
    i686     |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/a1e7dce0ca97ef93e2e55a0f85ebdffa76820b7b |     
   mipsel    |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/c2eeb5178c24da0ef9c0e54410930baf5cde9723 |     
    or1k     |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/0930df729d3d60e5d839ce583ce2845475205004 |     
   sparc     |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/67ba0ef21f7846b3721161c83358bd7979c3f937 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/b4800399cc6765246e4bed2d080388f50b7980b9 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/8d17de204e9720d82e3106b81441441156736ad8 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/4686cbe74b4f411f9b8516cbb595e9fa30fd9cc2 |     
microblazeel |         libgdiplus-6.1         | NOK | http://autobuild.buildroot.net/results/c8b3611d78a2aedb7a62213e01f41cc197385403 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/607d3087df53a9780e4fe47800390f9d3d8f69e2 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/26ff96e903156bf7f1be3627c564b9ae11c8638b |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/cc34e97c02a3119685981a1f4c60e07109c5150c |     
powerpc64le  |          libnl-3.9.0           | NOK | http://autobuild.buildroot.net/results/5aa74124ae34dd3e3c6757f4bab026a587a204d3 | ORPH
 microblaze  |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/1bde941b95a0d22c7325309ec55d2645a745ebde | ORPH
   nios2     |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/c7c01042bdd41aaee4116bf31bd1be4043cafd6b | ORPH
   sh4eb     |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/4df317220978d040166f5c1b63911a3e0a2d7932 | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/6623f703bc1de8d503f5fa141bf7411088aef519 | ORPH
   armeb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/4ffaba265fa60daf2f30172eba317658081cf853 | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/3ff6945d85c3733d76b2c8264e63b5b23a2440a7 | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/7c88f4c2c981ca74dd065029ec7a6532a167e788 | ORPH
   xtensa    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/98ddfd1e20f07e258bb8281ec6aa334a317c6748 | ORPH
    sh4      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/28a8f766f1d7c99a4b182fb0687c89c30c20e5a9 | ORPH
   xtensa    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/27ccbbb4ec740274317f9176aa95d4a189aca467 | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/1f7ebde189297ccb2a621311859dcb4b9de05dbd | ORPH
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/7b6c547f63082f6720fcf1f8036e24ac23c631f4 | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/fa355ff73851f5cb2230da89279d1730bfbcef22 | ORPH
   xtensa    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/b510101291108fbc9e3ea9943b93b335f09ae44d | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/5b7b570472b258879b0e249d27e535636e021d0b | ORPH
   sh4eb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/17d4df140fe157158676357eff044e123e1c7e03 | ORPH
powerpc64le  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/6f89644f3e6b4196dd24ccfc423dc83effe8676f | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/bdd018117c080e790fd09cbe2e270063324646b6 | ORPH
powerpc64le  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/48f9b9b9396de8f48cd37b7b70743f64d1f64d24 | ORPH
    m68k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/cadd0773f010b04c1a74310007f10337c6de3a02 | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/2ab8ad9867ded60098abf966e3d68a059b2bdaf2 | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/15d5b3f0592df1ce25f71dcf08f0a0ffd759dce2 | ORPH
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/f69b804a1ac0482361e4ffd89231e364c79ba72e |     
    mips     |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/1667ed9682683c2b172546be8dac973e7b2d782e | ORPH
    m68k     |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/937f5bb9c4964dc6208473d7039efb54b9036f38 | ORPH
 microblaze  |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/a49d467bd3d47e2f4ef4c93b37515e907a54f032 | ORPH
    sh4      |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/1bc6808d139693a875dc9212c107a9918e74f31d | ORPH
  mips64el   |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/2966c53baa9ca53c53707e4685357967378600bf | ORPH
 aarch64_be  |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/b02860633b269b145f73d42899d9c1dd98edb364 | ORPH
  powerpc    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/cc15a63644e19c4e80eba66294e6bafd3d1ea620 | ORPH
 powerpc64   | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/d817180f5bc0a4b937dfed528929518cc4a6d0f6 | ORPH
   xtensa    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/d8b172988269e055f47f61397d625e8f9239130d | ORPH
powerpc64le  | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/a296cda62fc4d2d8b7ca2ae5c285bf4a2983798e | ORPH
    m68k     | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/a1994ce34f290c000ff17aa1a1e1df9ec6133fd7 | ORPH
   x86_64    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/709df9b4a0c71e1adb287bbefb4c2ce522b5b7ba | ORPH
  aarch64    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/9cf2f31c0da332cf6b30b843400379c12d15efb9 | ORPH
    mips     |          libva-2.22.0          | NOK | http://autobuild.buildroot.net/results/bdc1892dae63b2917f43538e57c473081f09e175 |     
   mips64    |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/b871c89a9fdbc8602c22e79c0a72117718da540e |     
   mips64    |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/4e36d13bb91e672b87f4abacb118e4be560b63c5 |     
  sparc64    |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/fe00ae00d70746605ac291020a4cd31b25e0c5ca | ORPH
   nios2     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/2c03f82ecaa9d738ab4100d23ea1534cb9f28df5 | ORPH
 aarch64_be  |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/3b2b06fecf5998873d3689dff1ab7459fa70a61a | ORPH
    arm      |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/10b4634659e2d6f8b835d51d70d0191d5d25c921 | ORPH
   nios2     |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/7acbad9928dd044d7b90de2f9cc7a03fd8ca6f15 | ORPH
    arc      |         logsurfer-1.8          | NOK | http://autobuild.buildroot.net/results/98b41ec753f54248aedb2a7809d72bb000292bfa |     
 aarch64_be  |          luvi-2.14.0           | NOK | http://autobuild.buildroot.net/results/492fe72b561f980450ff6af797cd1b5062a4326c | ORPH
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/067b9e0120d0bb0895cbe6a6750a9ef40c99604b | ORPH
    i686     |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/1bb1493a9161baa4ccfb2588625fe9aa05517bc8 | ORPH
  sparc64    |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/512ed2f86a6653cbbb10a448e7105459988d3cce | ORPH
    sh4      |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/1156b190f8e1975a9010aa4a055ccb873bbf3a4e | ORPH
    mips     |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/9a25af764718977365efc1083cb5ca904d79e5cf |     
  mips64el   |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/9871f2773adaff2f2bed275ee4a4b9a571ee55dc |     
   nios2     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/888dd2b54a0fe332d75e762ea8ad5bf40bc18fd5 |     
  sparc64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/e7bce82bf8b2d3f5133bc4716d7de7e29dc8ccac |     
   x86_64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/df26a0ce0109ca6dd5039b7903aae2426669b16e |     
  sparc64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/20381f34b4bf7d5732db5f29282f5e204190eb59 |     
   xtensa    |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/94e8db270a70b7ed3010055772ac2e6f44949fc4 |     
   xtensa    |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/7738a1de9cb639dfd3a2075c1afe894d9f223227 |     
   armeb     |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/4eaa871866269591e82c7e99571203d4793b14fe |     
    arm      |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/58bdb9ee5d8886cfe1f763c6f9ba93e8d13fceac |     
   xtensa    |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/00ec3e65557bcdeba06817421be3856d8d68dc51 |     
   xtensa    |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/6489a085f15a5dedf9863ade3d4140d3e48ea47c |     
   sparc     |          nginx-1.24.0          | NOK | http://autobuild.buildroot.net/results/8559bd80837f65679a2b79a5b957e12e2710633d |     
   sparc     |          nginx-1.24.0          | NOK | http://autobuild.buildroot.net/results/189312d49ed13b4606f06931ca7a034d51995b60 |     
    i686     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/5a3dd0eb84e02ebad41943438d7c7763b03d1491 | ORPH
    or1k     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/ebcfb81c6f45dbc2b148e6e607f7acdf730ddf5a | ORPH
    sh4      |          oatpp-1.3.0           | NOK | http://autobuild.buildroot.net/results/8f9398726cc4d7e519ff6d2668fa839e04dcbcd9 |     
powerpc64le  |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/41258fd6b0c90bf8a63f1667d608b8d13939b354 | ORPH
   sh4aeb    |         paxtest-0.9.15         | NOK | http://autobuild.buildroot.net/results/63ace71ec32b68e68c0174984b1bf09751f89a8c | ORPH
    arm      |         paxtest-0.9.15         | NOK | http://autobuild.buildroot.net/results/fe21442ccc76378e223a4707ce9399aed9287b99 | ORPH
   mips64    |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/8399a19b4a54750119833b45a33440900292a752 |     
  mips64el   |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/608944e94016fe7594ac37dbcbee9a77f8d9f6e3 |     
   mips64    |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/73661c2568dc55dc10fd73ffa7b9db995fa324e9 |     
   mips64    |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/629f20fa74e2725254c0baa3d206ff8a306dab45 |     
   x86_64    |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/2f1d794b30d32f28341919728d7efa9614b950f6 |     
    mips     |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/4c6225cf4ad05cd22794ee2e25d2a7715183c299 |     
  sparc64    |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/832fb3a97c3570bd17c86162bfafb3b70164e9cd |     
 microblaze  |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/c88156148ce2a687358f29e7268c0b1a8aeaabce |     
  mips64el   |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/ad6d84d22da8b8d8a103c3911a73219237e97831 |     
  mips64el   |          rauc-1.11.3           | NOK | http://autobuild.buildroot.net/results/3026b39f6af3e5e55f4174d928ad546c7e1eb648 |     
 aarch64_be  |          redis-7.2.5           | NOK | http://autobuild.buildroot.net/results/ffda629f6f042be006e770e66837e3ffd1b8cbac |     
   mipsel    |         s6-dns-2.3.7.1         | NOK | http://autobuild.buildroot.net/results/4d5f77666baa7909e8923fc0a95b4c16cf32c3f8 |     
 microblaze  |      sane-backends-1.1.1       | NOK | http://autobuild.buildroot.net/results/4945720d9a25ee3e61bb9efd6997a93062a9bd8d |     
    arm      |      sane-backends-1.1.1       | NOK | http://autobuild.buildroot.net/results/0a85e91fc6c082d872ef39aae586cdebb4139a2c |     
    arm      |      sane-backends-1.1.1       | NOK | http://autobuild.buildroot.net/results/a5940b4d9e5531fec3e4f768a429f3b7be124c8e |     
 aarch64_be  |      sane-backends-1.1.1       | NOK | http://autobuild.buildroot.net/results/8bfa446d4aade6f828d4e6f366a9b752866c24ac |     
    mips     |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/3d789901479d90449edce3b640e56618a75ef685 |     
   x86_64    |        udpcast-20230924        | NOK | http://autobuild.buildroot.net/results/94fb1f0419129da721dfb5edf52f260a039ab0c4 | ORPH
    mips     |        udpcast-20230924        | NOK | http://autobuild.buildroot.net/results/b32d9d61cf5cd37d297531456c9e057e1c56287e | ORPH
powerpc64le  |         unbound-1.19.1         | NOK | http://autobuild.buildroot.net/results/b49309012dc176f8f625a4aa6507032e60b7a920 |     
   mips64    |         unbound-1.19.1         | NOK | http://autobuild.buildroot.net/results/2c84ee4a84c63bdc2f6e78e35317b696365c9d2f |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/dfbfe3fc9c442424cdeb6a53838c677eb1081f19 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/70dd306e936114f22541940df836766c758f970a |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/1cbb2b50b59ac3e51a9c6a09736b859eec2fc463 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/7287dc73487acbf854eb588646ee466df30a16cf |     
    mips     |        valgrind-3.22.0         | NOK | http://autobuild.buildroot.net/results/9e7cb09bc36b7fff61288776b86dce6a6cf27809 | ORPH
   nios2     |           vtun-3.0.4           | NOK | http://autobuild.buildroot.net/results/921fe02715c2b048db035ebc711240bd614deda0 | ORPH
  aarch64    |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/dc03e1e231c53e48d4317ce18408d568c4600d84 | ORPH
    arc      |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/71f7c142fd544e3e70361b72b2069de627595b72 | ORPH
    or1k     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/92144b318eb4fe0181bf4327b7baef735426011b | ORPH
    arm      |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/442ff781bcc932404a1ea9daa8174b4302021389 | ORPH
    arc      |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/bbfff161f1c149bd938d028134cd73192f32b462 | ORPH
   armeb     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/4dc42848bcd0b560cec074f0551cd3e2147c286a | ORPH
   mips64    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/7e3267b79cf91988f2dc6a815b2b77751faa0462 | ORPH
    arc      |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/8fef94dd56f1f838349177afa4e19c2303473891 | ORPH
   sparc     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/91bee00087a78650cdfc1b726d294ec922b9fcef | ORPH
microblazeel |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/4fb985df5a1a08a4b3d3fdee8c16b6b73138da84 | ORPH
  mips64el   |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/6f16646556cabe09d1bdbdc4b46b3d166842e50e | ORPH
    sh4a     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/8aab51e856857dd9c49987bf0aaf34ed20627066 | ORPH
   s390x     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/138a878c95c516d35849fc564b9eb126a3122206 | ORPH
 aarch64_be  |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/af97b4e60c7eaaaba3583575b7955ae7c944fbc8 | ORPH
  mips64el   |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/764a8ea62cf18709bb46522170b30d75fa7f8434 | ORPH
    i686     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/cf83271f3fc98a22309dd01743804a88e7698bdb | ORPH
 powerpc64   |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/4fb9689706ec106191634a98556972cbc7386282 | ORPH
  mips64el   |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/e50cf577731df0f7eac724f2c79f21bf805bd091 | ORPH
    or1k     |           ympd-1.3.0           | NOK | http://autobuild.buildroot.net/results/5015009f3ef61529898cf7888647ed0990e45acf |     
 powerpc64   |           ympd-1.3.0           | NOK | http://autobuild.buildroot.net/results/84f480d9cba8f5afd5baef493dac67f26cf9195d |     
 microblaze  |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/08e16300296eb06037e73108f585b1dfcb2a15b9 |     
  mips64el   |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/c846b3cf7be1ca63c9d7355ec977fd4e66f6812b |     
powerpc64le  |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/ef0ede444b54d857cafab3a9b3a8b90ef2976296 |     
   x86_64    |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/edf4c972ee6df153b566ae923740851a576d0730 |     
powerpc64le  |         zlib-ng-2.1.6          | NOK | http://autobuild.buildroot.net/results/f281b259a770daf114069d2742328f2c92ec6d40 | ORPH
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/9fc1ef05c752c82155e9f82ee8cdec29776c744e |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/d83121100c17cd4266ef4739237b6260571efd18 |     
   nios2     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/67a8988fdc79d5bf7787043ddc162a95b89111b8 |     
 aarch64_be  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/3923067a708479ffcdff160103aac57408a85ff0 |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/366bc04455077778158f952634f6b89af8ac7ce8 |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/849fb06e36f210ca01485a5470af033e1a2085bd |     
   s390x     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/dd6811c376de6d5711b7d07b3d17df36397a4cce |     
 aarch64_be  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/5c25e015159ec337eb923c5bb622be01081f9174 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/1c7aca24948e682a2b9347ac019539e58ff28dc9 |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/c05b00a145aefb6e8ffddfd50b307a7ec7dac2af |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/b8e9829636c512d1f0528f07e6c2e57542764436 |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/f1f4f801fa3ae5748702cab14813755e51fae06a |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/99782ea7b7582604225be1471ece7418fe027e4a |     
   xtensa    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/42e5fe41da67d9a122cdde7e521772512f5e176d |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/ee8e31f61f11f79ad1c233b7e7e6093edd14f172 |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/746c37412f28989e80fb9b052f748b23d4464a21 |     
   mips64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/55a9f0c973270aa343bd03965831a943c0118465 |     
    or1k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/cc9159f67fa2ff7c547f1cbb6dfa1bdc42993d8d |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/799d33f100f126eb98a040785dcce4a9d2bcdefe |     
  powerpc    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/d2c8dce3714283bd01b82c3df5c0525d12c287ed |     
   nios2     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/1dbb377c659e660ae5c1b45a75ac195b81a31b08 |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/833cfa7c10f53198c1259bb06f6a5de882329a71 |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/b958861389571f84eddd9734987057f5d4980e95 |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/c8c7e8d6fa99dacfefbe8a79494e7e8e83abc38c |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/d9012d22a56d0a049a0bd57afaf9106c4307dcf5 |     
    m68k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/735ed120fb03d4d7ec3cef96565f480a802015ec |     
   nios2     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/0056c966f05ec319db83527b6e74e5081da9ceb0 |     
    or1k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/93cdc9c9115534e0bd19170b321715b9a4cbbf17 |     
   s390x     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/ebfbb7e5623af1cb010720ebd13a2c26b5fc1c71 |     
    arc      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/51834773295e745e3f2a09777c940d2749a8f91d |     
    or1k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/92aec0d1d1b46a757ef42d864ea4d4e6119990cb |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/45d524cb9779ac407287d95a808b184872a1aa4c |     
  mips64el   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/3b251f0c6f64e06826c2bb75240e79553db9f752 |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/a6495ce9af4d548cabdb5541883cf64d3d973b57 |     
    i686     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/06dbebfb75ef4ab741bbf6f36c16e593f9ab35be |     
  powerpc    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/a11148d7d700b4bc107f5dd31e49de1730cad30c |     
    i686     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/95afcc1625df1b965d907402b129c6f98785a561 |     
  mips64el   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/9264c9e75286a15038ddc025654d3bc39ae60e7a |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                 coreutils-9.3 | 1 
 host-binutils-bare-metal-2.42 | 1 
                  jack2-1.9.22 | 1 
                libressl-3.8.4 | 1 
           python-numpy-1.25.0 | 1 
ulog-0389d243352255f6182326... | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/63d5ab59bc5479484b68186db8f9c90e402148d4 | ORPH
powerpc64le  | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/e1ca771e7a72f85e37c13c6ded9b5ba6e13eebd2 |     
    m68k     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/bac5e3961f67435c8e8a1eb0ea590000cd335ec9 |     
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/2e6045f52d5bb254ea61f5f080cc1972efaac252 | ORPH
  aarch64    |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/d8986de2fc45432437eee7c5f3bd3edd6ff4f388 |     
   nios2     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/ab5e23440275d7467e79bafda233699a8517aba7 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                fail2ban-1.0.2 | 2 
check-11970a7e112dfe243a2e6... | 1 
             containerd-1.7.14 | 1 
             docker-cli-26.0.2 | 1 
                  ffmpeg-6.1.1 | 1 
  gobject-introspection-1.76.1 | 1 
ibm-sw-tpm2-5452af422edeff7... | 1 
          libcamera-apps-1.2.1 | 1 
                    proj-9.3.0 | 1 
            qbee-agent-2024.09 | 1 
             util-linux-2.39.3 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/0f7005354153bddb46da425bdd9940af4b551c29 | ORPH
  riscv64    |       containerd-1.7.14        | NOK | http://autobuild.buildroot.net/results/61e1e031a627c5feb84e05a633fe7e5813899b78 |     
  riscv64    |       docker-cli-26.0.2        | NOK | http://autobuild.buildroot.net/results/6ef6aa18fe6e63dfb0504e4cfb713697daa9ba3b |     
    arm      |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/002014fe3bd1ae80a07c142301cb76e920d75d15 |     
    or1k     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/e8034e3a8528513da4aa8893ce7d47416862ff89 |     
  riscv32    |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/e6178d1a49da285f630d7fb6a4df0afee3d83300 |     
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/7ec3d8537301c6d4be1a6dd348d3ea8696c3367b | ORPH
  sparc64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/ab073d0a5aae9f1334c9f97c932b8fe306cd7c2a |     
    arm      |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/9293a605f4755a1b404956c18ebdebbe8d8a8af4 |     
powerpc64le  |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/b809cbf9f2a99022162cad6d4c9f7ab6f8f4f5b1 |     
  riscv64    |       qbee-agent-2024.09       | NOK | http://autobuild.buildroot.net/results/44d757b5a058c1ef11003af91d0babaef24dd8b2 |     
  powerpc    |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/3a856d62100a16c488df260dde9373375e705268 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
