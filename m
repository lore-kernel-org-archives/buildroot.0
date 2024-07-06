Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE39C2BD09
	for <buildroot@archiver.kernel.org>; Sat,  6 Jul 2024 04:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39345408E8;
	Sat,  6 Jul 2024 04:51:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pX_Asxo9Uyeu; Sat,  6 Jul 2024 04:51:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D62F04045F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D62F04045F;
	Sat,  6 Jul 2024 04:51:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 178B71BF2C8
 for <buildroot@lists.busybox.net>; Sat,  6 Jul 2024 04:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 084DA8487B
 for <buildroot@lists.busybox.net>; Sat,  6 Jul 2024 04:51:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zfob_jq82Mdn for <buildroot@lists.busybox.net>;
 Sat,  6 Jul 2024 04:50:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4B0508487A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B0508487A
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B0508487A
 for <buildroot@buildroot.org>; Sat,  6 Jul 2024 04:50:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2BE0FE0008
 for <buildroot@buildroot.org>; Sat,  6 Jul 2024 04:50:55 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 06 Jul 2024 04:50:55 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1720241455; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=y4TRnS/r24alhUAHAUcp/y1Xa8jDbmmI2MkCiV7Y3tM=;
 b=Dygw7wpJatoOb0nWZhmttLt7ivGTUE8NXVqa2g8Jdy0hrfoye1knxFIE97WV3FfqFMcZck
 9ownTIoFbzcUrfrLghiDtOl7/5IpKcbdJQizD4VLggQQSkwvNeAJoUdUmV/bH2oXIGXCq+
 AqyVXHFRQLEHlhtSlDs2JiF05bexDjtiwgIHMSoMeWF/+DVa4tqDyKMCIiTJFI1r3T5Y2L
 de+YPHrUsmG3wdwHqAV3KXa9Z6afSsvGc1+qrBgAuIVvD5gZfp8K3Bz3ou0N8ICJY6F0Sw
 Ex7co2ulthHglse7A56tj6YGNn0Ikv9J7KQB3U8xD0kINd0v/8kIoX1+MolJTQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Dygw7wpJ
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-07-05
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
Message-ID: <20240706045055.tZ2BQ4kbOpN8DmewlLDRH9VaBOrs8rgzf3Cpi-ovBo0@z>

Hello,

Autobuild statistics for 2024-07-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  9  |  9  |  0  | 18  |
  2024.05.x  |  1  |  8  |  0  |  9  |
    master   | 72  | 493 |  0  | 565 |

Classification of failures by reason for master
-----------------------------------------------

                    zstd-1.5.6 | 78
            host-cdrkit-1.1.11 | 43
host-prelink-cross-a853a5d7... | 30
                    yajl-2.1.0 | 30
                libressl-3.8.4 | 24
               cracklib-2.9.11 | 12
                dovecot-2.3.21 | 10
              fluent-bit-3.0.4 | 10
host-android-tools-4.2.2+gi... | 10
                   httping-2.5 | 9 
             rabbitmq-c-0.13.0 | 8 
                  ffmpeg-6.1.1 | 7 
glibc-2.39-74-g198632a05f6c... | 7 
libsvgtiny-ea9d99fc8b231c22... | 7 
                  bcusdk-0.0.5 | 6 
                fail2ban-1.0.2 | 6 
                 haserl-0.9.36 | 6 
                   host-go-src | 6 
ibm-sw-tpm2-5452af422edeff7... | 6 
                host-odb-2.4.0 | 5 
           janus-gateway-1.1.2 | 5 
                 libcurl-8.8.0 | 5 
                    mpir-3.0.0 | 5 
                   rauc-1.11.3 | 5 
                       unknown | 5 
aer-inject-9bd5e2c7886fca72... | 4 
                elfutils-0.189 | 4 
       freeradius-server-3.2.3 | 4 
                python3-3.12.4 | 4 
android-tools-4.2.2+git2013... | 3 
                apr-util-1.6.3 | 3 
                    attr-2.5.2 | 3 
                     avahi-0.8 | 3 
                    brltty-6.6 | 3 
                gnu-efi-3.0.18 | 3 
                 gnuplot-6.0.0 | 3 
                  jack2-1.9.22 | 3 
                  libffi-3.4.6 | 3 
                 libssh-0.10.6 | 3 
                   linux-6.9.4 | 3 
           mediastreamer-4.4.8 | 3 
                    norm-1.5.8 | 3 
     bandwidthd-2.0.1-auto-r11 | 2 
                  bitcoin-26.0 | 2 
                 cdrkit-1.1.11 | 2 
check-11970a7e112dfe243a2e6... | 2 
             dahdi-tools-3.3.0 | 2 
                   evemu-2.7.0 | 2 
                flannel-0.25.2 | 2 
            gdk-pixbuf-2.42.10 | 2 
 host-softether-4.30-9700-beta | 2 
host-vboot-utils-bbdd62f9b0... | 2 
igh-ethercat-f5dc109176400f... | 2 
                  libnfc-1.8.0 | 2 
                  libsepol-3.6 | 2 
                  mender-3.4.0 | 2 
               mongrel2-1.13.0 | 2 
                     mtd-2.2.0 | 2 
          ncurses-6.4-20230603 | 2 
                  ntp-4.2.8p18 | 2 
                unbound-1.19.1 | 2 
             util-linux-2.39.3 | 2 
                    ympd-1.3.0 | 2 
                beecrypt-4.2.1 | 1 
  binutils-arc-2023.09-release | 1 
                bpftool-v7.1.0 | 1 
                  cairo-1.17.4 | 1 
             can-utils-2023.03 | 1 
             containerd-1.7.18 | 1 
                   dav1d-1.4.3 | 1 
                 dc3dd-7.2.641 | 1 
                   dhrystone-2 | 1 
                    dust-0.9.0 | 1 
                  eudev-3.2.14 | 1 
                   eza-0.18.17 | 1 
                  fbdump-0.4.2 | 1 
                     file-5.45 | 1 
            gettext-gnu-0.22.4 | 1 
                 glibmm-2.76.0 | 1 
                     gmp-6.3.0 | 1 
host-heimdal-f4faaeaba371ff... | 1 
         host-libxcrypt-4.4.36 | 1 
              host-rust-1.79.0 | 1 
               ipmitool-1_8_19 | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
              libarchive-3.7.4 | 1 
             libargtable2-2.13 | 1 
          libcamera-apps-1.2.1 | 1 
               libglib2-2.76.1 | 1 
                  libnfs-5.0.3 | 1 
                   libnl-3.9.0 | 1 
              libopenssl-3.3.1 | 1 
                 libp11-0.4.12 | 1 
                   libsha1-0.3 | 1 
                libxml2-2.12.6 | 1 
               lighttpd-1.4.76 | 1 
                    mpv-0.35.1 | 1 
                nushell-0.85.0 | 1 
         nvidia-driver-390.151 | 1 
                 openal-1.22.0 | 1 
                 openssh-9.8p1 | 1 
              procps-ng-3.3.17 | 1 
                   redis-7.2.5 | 1 
rtl8822cs-fda6cd263e8956727... | 1 
                    rtty-8.1.0 | 1 
                s6-dns-2.3.7.1 | 1 
           sane-backends-1.1.1 | 1 
                  snort-2.9.20 | 1 
                 tbtools-0.4.0 | 1 
tftpd-b2b34cecc8cbc18ff6f1f... | 1 
              udpcast-20230924 | 1 
                    vtun-3.0.4 | 1 
                      xz-5.6.2 | 1 
               zxing-cpp-2.1.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/2cb0d3f4c80fd0f5975355eae4c3bcbc27794c78 | ORPH
  riscv64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/bc385db67244a99deda8fbf76333e500cf022faa | ORPH
 aarch64_be  | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/32b0df125777616fe971a2c5758111443c7fb572 | ORPH
   armeb     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/dbf43447d071196390d5ccc6c5d14fe6d9921b35 | ORPH
   mipsel    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/90e38909d5240fe34ce41761ca6a0946e8c642e8 |     
   s390x     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/e33bcb5e36a89b2329dcd65a511c75461910840f |     
   armeb     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/418961fd9b3ccc5a45202e3c9c02a3dfb375f299 |     
  sparc64    |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/019c6d140c27e5b2dc7e62ae2f74a36a1c0d04c2 |     
    arm      |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/45abeff989432589e11fe2819dd13a268e415b18 |     
    sh4a     |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/1d12d2b6e81d0a8bc3be3b4fd2987c60b300dcf5 |     
    arm      |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/6f204e9aa433197dc3e00cbd9b13287b1d8d3f9b |     
 microblaze  |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/7ebf9e4d377b966e1416e007e5bfd2c3c29c85e7 |     
    m68k     |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/64d5d062965ec91272e588135429dc83ab7b9fb2 |     
   s390x     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/fe1f0a8492eeef686e542c259d0a2dd88aa9ccc3 | ORPH
microblazeel |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/47d73ce4662a90e0f97b022c3f9855df8a7c4a83 | ORPH
   armeb     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/fb02cb68d9ef1d35fbf95ecde8a6b5cd6261e3b9 | ORPH
    i686     |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/09e67958746725ed7678d3c9492c7812b13eff03 |     
    or1k     |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/a597ca3cbce68e3e4a4c0c8f2f876eaf12d54fcb |     
    i686     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/c63d1de62f1d918a5c816943cbab0714775e0a2d |     
   armeb     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/369948dd44caafc77b5a7fd8a4af3fb524f33710 |     
microblazeel |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/a9338ac68b51208a3519a36d1648fd57b98eaf8a |     
  sparc64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/111b03dc51d6fc793829bb1025b69fc5f7418a73 |     
   sh4aeb    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/22c62fc5ec41298d965fb5f049c771c1b89a2b69 |     
   x86_64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/751aa7b3db77b018c2bc263c09406a20c9de82f6 |     
    arm      |         beecrypt-4.2.1         | NOK | http://autobuild.buildroot.net/results/a57437a5de003ab7a9048c1c4cc04a1b6f5d3809 | ORPH
   arceb     |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.net/results/31b98756bda5d2f161de3dcf576d906f3da0b356 |     
    m68k     |          bitcoin-26.0          | NOK | http://autobuild.buildroot.net/results/1a32c2519ac24e924cfd39c5e025e76cd48f2214 |     
    m68k     |          bitcoin-26.0          | NOK | http://autobuild.buildroot.net/results/93e1f44963c116d829831ca3125430bc753f6e47 |     
   x86_64    |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.net/results/221937f9c7b94a6f88acb9148636786ac77bde02 |     
microblazeel |           brltty-6.6           | NOK | http://autobuild.buildroot.net/results/c197a94459372e2c0d430e6a38b3038d04c43972 |     
  powerpc    |           brltty-6.6           | NOK | http://autobuild.buildroot.net/results/06dd18edde3f255fd7c0a0c33e7684561a0aec0d |     
   mipsel    |           brltty-6.6           | NOK | http://autobuild.buildroot.net/results/1a5661011ff81eb146e53f0ec9f24a616597181f |     
    arm      |          cairo-1.17.4          | NOK | http://autobuild.buildroot.net/results/de3ef200ad0b658edfc4f3212f1a8632bed80bb9 |     
   mips64    |       can-utils-2023.03        | NOK | http://autobuild.buildroot.net/results/7675403bf8c946b53a45606799cfea9e542812e8 |     
powerpc64le  |         cdrkit-1.1.11          | NOK | http://autobuild.buildroot.net/results/788ab3a1c65051ecb0e8c35f86576482fbfe493b |     
  sparc64    |         cdrkit-1.1.11          | NOK | http://autobuild.buildroot.net/results/fcdfbaabe5ee36cd687a21d5d89d10c28ad1f755 |     
  mips64el   | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/da7fac40bfb7feb2804290230d5174ebfc727c08 | ORPH
    arc      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/ae4b2dc6e6531bbc7daa45392322855c3b0be59c | ORPH
   x86_64    |       containerd-1.7.18        | NOK | http://autobuild.buildroot.net/results/ca05c3e757679d9a3a544057c2025a71a4751326 |     
  sparc64    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/5fc1c3820b00780af395d89db51c565bb46fb7fd |     
   mips64    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/99d9e36533433d709a1dbc4a7d2c4077e9306b78 |     
    arm      |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/6bc206bd1e1b35de6048fa5927a9b518c5087675 |     
   armeb     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/ce14c4549240fe9fe09533d09188a1aff4af1068 |     
    or1k     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/91269c3c1a25a26f9f9cbfe024a7207605925b53 |     
    or1k     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/458446f87d485849c47bb5599b2c2ad29ceea7d9 |     
powerpc64le  |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/aac0344f2c6064139d10be640a396a646afe1c22 |     
  aarch64    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/95ada6ea4650b6249504cef3359a04abb7f01f44 |     
   x86_64    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/8bf2337d9d4ddd1f447f3ad210c7976116748b27 |     
    sh4a     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/fecd9d5c46a0212555f12d1b3378eb00507c9527 |     
   x86_64    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/f939818f62492e9a275006ee77b352c2d378f6a0 |     
 microblaze  |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/662cfe30a811c67927a02c01f29741b1d59a6c16 |     
   xtensa    |       dahdi-tools-3.3.0        | NOK | http://autobuild.buildroot.net/results/f3f025461fe10fb01249624d5051d61d1f704598 |     
 microblaze  |       dahdi-tools-3.3.0        | NOK | http://autobuild.buildroot.net/results/7645fb3c6031dd497ca34afe03f283782847a14f |     
   arceb     |          dav1d-1.4.3           | NOK | http://autobuild.buildroot.net/results/b105add8ef7b014e9298dd1b1c4a3208118fb1f4 |     
   nios2     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/1daa4294198c317ed6e2a1133b322214a32980c1 | ORPH
   armeb     |          dhrystone-2           | NOK | http://autobuild.buildroot.net/results/32fc7723319c0255f6b7e535ddd7058c0500beb8 | ORPH
  powerpc    |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/adfd6dfd6939dbd72d4b5f6cda9193655fcae558 |     
   x86_64    |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/793d4dc4a6234c433f26882c4cbd59397139e3e1 |     
   sparc     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/5d3fb3e89aa6fed4c9e12a572c2552e4f9bbe7fc |     
    arc      |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/e1734ff7b038fdb3148944dca470d4a85a2409c0 |     
    sh4a     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/d15f18f6977514f8ca7149aeabfa6eb29a7589a6 |     
 powerpc64   |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/29e0acf44561d4358b58f63ccfb03f34555c399c |     
 aarch64_be  |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/bbe63a34fbf3749f9c026e76769a0bfb37139f36 |     
  powerpc    |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/ca18184403c9b7b786bd5daae470322d47919da8 |     
   arceb     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/f0056e6b7ade9fc8607d72518ead845777f051a0 |     
  mips64el   |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/52176986307b866b4947822abeefec7cc23de084 |     
   armeb     |           dust-0.9.0           | NOK | http://autobuild.buildroot.net/results/bbe357c4398768f974235ade218cc9ae3fb70a77 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/237a751879e5b238aa1118a6fcda0d283a0ace07 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/e55211c3fdf3a0aad6f50f584dca3863313b5d32 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/de2408709489f1cac68fd5e367f24dec4bba3cc3 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/9a1f77cddbe482c83fd4dd454ba6361c3508f3f3 | ORPH
 microblaze  |          eudev-3.2.14          | NOK | http://autobuild.buildroot.net/results/86e2785cfdc3d1b389bd800e165957c8f0cd8887 |     
   s390x     |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/fc51fda36365112495e25bdb3b0169d334d165e2 |     
   x86_64    |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/a8685adbea25efe315efc941db557b9e4fd900a4 |     
   x86_64    |          eza-0.18.17           | NOK | http://autobuild.buildroot.net/results/e5b7fbdaff529e98334bca667fc7c9454dc4580d |     
microblazeel |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/6a430de1bc91d95f7b9f4a425865f2631e5d2034 |     
 powerpc64   |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/b9c2a48ca860721dc624945834edff52517c9fc1 |     
   nios2     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/da3189e7181d7177c19a1e53967e348b8e5217e4 |     
  mips64el   |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/5ca7140be37e51cef6750b660dceb45c1bcb37b8 |     
 aarch64_be  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/bd50ab50f003e3f18b6c9a42a3effbfc319c9b8b |     
    arm      |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/c69343794299b0b5873abcb22d07fc98fedc0a53 |     
    or1k     |          fbdump-0.4.2          | NOK | http://autobuild.buildroot.net/results/249b8aff5f4b9b4581422926d1ed01f749474b53 | ORPH
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/43fdab1c68fa98ee904f4c3c4bbe2b74048d278d |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/a818141e8f56a7fc896ce119205c9761bfaa4f8c |     
   arceb     |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/21c5d51150c5e3ab59a840f57dd94f0e9f2ac1fc |     
  riscv32    |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/8c87a819906130cc64cfc9412c3839e033e231da |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/7baed03d58ab21438cc52571c733461d5e4ff486 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/e8de414f8803d7d3521da677498ca7a7f718bfb8 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/f3f816f3a9302f0f1620435c33ceffe0590ea091 |     
   mips64    |           file-5.45            | NOK | http://autobuild.buildroot.net/results/a01c4b8adbc7e96ca420cf4fd6c4645555155a38 | ORPH
    arm      |         flannel-0.25.2         | NOK | http://autobuild.buildroot.net/results/1d9d3ab4edd5204dc81232072331bfa061729f7c |     
   s390x     |         flannel-0.25.2         | NOK | http://autobuild.buildroot.net/results/4b7641001cac569919fa5f2bf7b4e6a7c0e02185 |     
    m68k     |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/c0860ee8472544dafac3a282f6916c95d27074c3 |     
  mips64el   |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/ba1f3f2c7f0c91a24501e30bfc763aba8f745b8b |     
   nios2     |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/511dca9aa6eb5b7cdf458e83ae4e07756e887c5b |     
  aarch64    |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/0e55bcadb2fa9d11d697d084b1176360eb7a96b8 |     
   x86_64    |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/e938712bfee9d938f9cda52701fd8004269d3d0a |     
powerpc64le  |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/3d55314f772e1bdae58d9ad393541094d2216fd3 |     
   armeb     |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/fac7732833c5959e391ee15ee7ba352d63beab75 |     
microblazeel |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/9a9808bc7c79411003b97e52bc8835ef8f3e2789 |     
   nios2     |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/01f7389d496c79f3b93decb7e7ea12ce83f423bb |     
  mips64el   |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/a1992448e16c98c624f28b8ef8e214329c1600a5 |     
 microblaze  |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/e28e72c2318c57e4bb7fe535496f9fad40c31836 |     
    arm      |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/9c3fc7fa21581c1d71d343b02cac9ee9cd4bec9d |     
   x86_64    |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/dba8b2f093bce6590717386401b8fbf0c569a153 |     
 powerpc64   |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/a57f02de4586f88529e74a33d17dc84c617a3dad |     
powerpc64le  |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/36b3e10a99e46e0481da56ab3955a58509b0975b | ORPH
   armeb     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/77627b8db01743f9f70c32d9ace27df9dac34a5a | ORPH
    arm      |       gettext-gnu-0.22.4       | NOK | http://autobuild.buildroot.net/results/8ecdbf5faedcf8b13116118a898d0ec476db4cc9 | ORPH
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/a66be04d154bfa3de19312bce8f4418e08900675 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/0008b9a673b8a81011670402f0772db3945d52ef |     
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/0dd32ff580cc3c9354cd71a172b559dc8d02d66c |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/1f0809c942196b076dc8d2d317b6c117c774deeb |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/17eb1bf43c95198f40cd562ad880e29dcd4623a2 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/0a23acb158f17ec9df8c8942148a93af64cbe3bb |     
   arceb     | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/8e84c14fba47203f224f7de516e46e231752b162 |     
   x86_64    |         glibmm-2.76.0          | NOK | http://autobuild.buildroot.net/results/9dd961a9a7c0efbbd4069ef725a5fbc7bff327b1 |     
  riscv64    |           gmp-6.3.0            | NOK | http://autobuild.buildroot.net/results/053b257b00ae41bed785d964210abad695480897 | ORPH
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/9648567b21599e8cf64efbe86686e635d6f78020 |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/c00f9231fe23202942e6bb87ab7e2ede108f3129 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/46caae60e2b28934e5ee567ad1a6e5850a749dca |     
microblazeel |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/48bb96316ef32841869e9e83bcb30e0ae81f81d6 |     
   mipsel    |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/8a00b2bc06596363b21ce96e5f512e8799928035 |     
 microblaze  |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/0da1e50b9e052157ca2c56b0a32dc76071880a8a |     
 powerpc64   |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/44d459bab81c8e3dda7f0292114e5ccceba037d1 | ORPH
    sh4      |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/511ed30196fd8f90652c747cfcb8a1b87e990e6e | ORPH
   armeb     |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/5d5a1a6c94b3bc08d8cafbe9d9b264a33bc3e85d | ORPH
   sh4eb     |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/6161e73a1f85af12afa2e1839469b5c47b5ae20c | ORPH
    arc      |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/089272bbcd4b028b1d322ffb13d4056ab2f4786c | ORPH
    i686     |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/0f6a17d9fedb43d595f9dd45751a7509dde580ab | ORPH
  powerpc    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/53ae9118fc902329afc15c248890e31bad77c145 |     
  riscv64    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/9f2035393e60563851558e879d843afdd13a244c |     
  powerpc    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/e2a74e3e46147faa322f9f9473ef77195594e4d4 |     
    arc      | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/ed6818dcf7ee283a359286b3607d26aa51e0e26b |     
    or1k     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/d01a5e09588d6f3759f6252ba1091c5ccf8f5726 |     
  powerpc    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/5895fc1f197d8fec72c297d4e79857da573e79e9 |     
    mips     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/8b17f1164647dc1bfa8621bba0da987cf137f57b |     
microblazeel | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/1cee47ee4be83d7077a5a9be08232022b2e6224c |     
  sparc64    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/a89971696425f0b243aee1e7b894b3abd5f54492 |     
   s390x     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/243beae8fa5a7cb6da3fa1db90ac955988be5172 |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/05bcdb25318abbe97b666cae5b4deaee83743390 |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b440393fc883a399611a4af11dbb27a685fa3e65 |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/7551865f93a2dbb11690e59be8db40c31d7c6b7e |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/0b912895197aea1a598f6e40bd791fb2bf009601 |     
   sparc     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/fb83ccc721a956e9e16eaeb3f66b7236205107a0 |     
    i586     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/cb24d83b5aa3046e14134087a87b9e1938e2de10 |     
    i686     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/cc4727bd88522d0ff662c431f4dfeb6c7f598cf4 |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/74a7a759193c1965427c8ba1df09fa176dad3048 |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/4edb4caa57bf874e1fbb73846df79758bb482e89 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b8b5d43c92b206ae14d5dc3f0779b2fa9e50f891 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/8d444a96fa1dbb64447f825587e081bca5f0f8e8 |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/69b69c5e0c6f3367b40de3e79642d51d5a7c6258 |     
    i686     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a9147146e9dd0ef577868362c128f08b13e0ef50 |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/61a2b7746dee7f6d6ff5def222f97eb8fda24f81 |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/68f1dbbaf18e20c354f2755bbcfa3a3a4f616877 |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/d2930c214cdc72eca10a88895d47778d622e0522 |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/91cd0e29f09482d04c56e402eb94ebe55de0ba9b |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e38995308715368fdd51145d9505a679a27bb465 |     
  riscv64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/5c734363712084801073ae09f24825b64311de1e |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/fe0c0c38d963a2495ce3ef46ad136cb9c21b5dc0 |     
    arc      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/bd81448ed17a91b5e19acabae0e8310f78b28c64 |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/90b9ccce5032aaec5d476450652194b2c5ec3f2e |     
    i686     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/05207f8e5fe93cdf11527328ce9e50b1018fb57f |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/78c9e7b664799b3570aaf2659175818bb10e8820 |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/cd6c1c93a1f868beb87952fda8658b6d16a2a387 |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/c223f5dbc8d1057f20bab04b24b82c4b1978605f |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/61ffee3358ed3aa670d3afac5b8fc30a7e68d5a8 |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/44e33d0fef158412154f71e6c093782b3317886f |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/2c4d65fc2522538f6f90b512cfc76c64bff7e614 |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/809df7cfedb679844a82268da4edf520a939b563 |     
    arc      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/4940e166ed87231658040b0c84ae830bd88e7335 |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3fc94c9235cbbdf554dcc9f155d08d7b9c55fb73 |     
    arm      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/8c0c0c914d61a87d2542b494b8a142f5df96666f |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/9685f599da64dd7a8b4cc874044b065331143452 |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/baaf2957e60dad0791772c05bdd56a1749e0c0f3 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/928997cc95376b6a56aec232703d93a6787c8a37 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/134b27867af59340f6ed9b8a04672359f880d313 |     
    arm      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/c7c50f16e994c0e08b7088f0d04a24e72acd89ba |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/074c8dc1affdb6d1d227c88b5a92b2c009c1182b |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/9bbc3fc333bbcba47d414b341d7a6d4492b9ac41 |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/7ca51422abc516ddfc7c76d196ee43f0d38e1bdb |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/568fa97d30c313c47481caa7b4f59bfe7c803f18 |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/52e841c7c0bbf60db9076c3146735cd2d653c202 |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/2ce270e6f9def3ee863aad64d13c54389faee3b7 |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/47a4e0e7d5d184d36a607e09211b8900a848cafb |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/af4f1b8536d659fd8885458ffb480b5b69fc6bed |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/a76e656e48a557f2e2bae3cb06168c2e923075ce |     
  mips64el   |          host-go-src           | NOK | http://autobuild.buildroot.net/results/839eb52cc045de6da995325a670e496279c6cc89 |     
  mips64el   |          host-go-src           | NOK | http://autobuild.buildroot.net/results/fb3c263d1acc0e103d9c7da99a35eb54d9b37ec6 |     
    i686     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/19074edf0b818a3de44acd9e843d716d54a53595 | ORPH
    m68k     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/455a41d8df8276c27dc3293e91d554125efdf4a0 |     
    arm      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/03f5ce9556bf1c7390847f76784d851b8cda1a53 | ORPH
    i686     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/6a4857abdac73bb62e864283fdbe18a298fd2a46 | ORPH
  mips64el   |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/535d0e9facf4a0e70c3f56f76c39b79667d11a9d | ORPH
   s390x     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/5fd9a2199999414170bf1d414e93ff7497e7cd5f | ORPH
    mips     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/fcf8462e8af41749ff4530c3a0316c3f66ab8d0e | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/434cd8ec31d4d354c4c6006394efe614b04e1d1c | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ca455cd17c1e52add3722d201517ab4aa3f4b1e5 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/96cf99dc6dbb7617c1a8a0d1b05ceaa0009b1f71 | ORPH
    i586     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/7d692a2a26898b3bd838637603938f3eb288573c | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/19b431d3476b8abc63d6484eefafb5eca873892c | ORPH
    arm      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9095f5712d17f75fed966e8064c09539ea76567d | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/02a6338fe9bbb4f560c10f30cb89ccd822360dd9 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/cf14f55d00406c5f1dcf661c8ff24a07bf0b7eee | ORPH
  mips64el   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3f612c0a56577cb3c07e5a61ebeb536881c6b38c | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/62b966f52ab81616da5719da64f0c82df30e4516 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/cefc826bf221ac6a63ca85fb9f73343e3dd7cd0c | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4e336321c4186dd8cc036179f2f546bc256b06f3 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/5b4196a0da0df2685d26fbba073a12e216671244 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/6243a8b797fc7b833c5e49bb7f760c39f53bfd28 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b4e41fd9532bfdb4bfe2b76087f98be0ac02f053 | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c118d90679dfff5dfb8779deeb18cdedf5b7d9bf | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/5a98c5d8b4802e5883e4ab573e384800691ad025 | ORPH
  mips64el   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/51491815b118b45a02d024df874ce0e946118327 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c8e05fc55df901b473f0b59aef8b44ba154fd942 | ORPH
   arceb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/90841c496802255b6a99bffe3ca37e74c5166e36 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/92c7158dceda9f8dcd20f4463a6b246260012b67 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/7cdb3f09a65385980d046b4e962e9cb20463a8da | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/39160e359f399ad26d32234620982702687be2a0 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/34d18ce180a3f73e582fe3e1d28d67d36ec75a4b | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9aa4bfcc9a1c9a7d984e9531e2c047abc8528203 | ORPH
   armeb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/7a3ec307c8dfd3505735de4ba4514418f83bdef0 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9a8f8641a3c5b739fe618677c19b608d506e9e65 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/8e098aea70056762cb26d65f70295fd7f8243350 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f46ccb866a6887941d5a5be60e3eb471ad722364 | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/483f855d5a9818ced83f4f8a6bf033297aeac809 | ORPH
  aarch64    |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/74548183e67fee70361509ad9c6b09526b663eda |     
    arc      | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/2e4d76d45c9d1003fd7a9e5c3e93471454287a0f | ORPH
 microblaze  | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/6e99b038d1c419271b3b141575829e961b8ad95a | ORPH
   arceb     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/3acb0f7ac6945b428981ca88e691b3cbbc2a666b |     
  powerpc    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/896acd1536784dcd2840d267560344115f9b5534 |     
  aarch64    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/83ab08b0d417923faa52b2c999e137e8fb25888b |     
 microblaze  |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/14dbcd87d2610de2760f66546b80a3102a73331a |     
 aarch64_be  |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/85506a5ca9e1ccae4553f428b0f412813ec673a1 |     
  mips64el   |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/03aafb3e81743dc572ce45e5d0893345d7b99806 |     
  sparc64    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/cb67c7e9d49271648214f91bc77895c78e7bf3f8 |     
   s390x     |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/620d8accf392ee82bab3f69204c345ca51720d61 |     
  sparc64    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/35822e53212818d6d515cddb32bbd1d794894df9 |     
  powerpc    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/f4ed2b4e3ee03cb93edc678cc36203334496d163 |     
    m68k     |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/32c23af8c914992a54604c5ae9c4044d630286a2 |     
 microblaze  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/03b6eff14ad6bd1a1cc25dc1d7b3268739f62808 |     
powerpc64le  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/19467fab069b7df5a5809c4ae4bf655da8b8c45d |     
   sparc     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/857c0e5153f8a80fda48fb5d724fad991d1ccb33 |     
  powerpc    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/0117de03d1c0643f829dee5a71820c8688bdd0ec |     
    m68k     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/975e46ceab43c65c38ac56ff2d3904497a8f4071 |     
    arm      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/bb1ba800875203759cb9fba9fc9a5ee702b1c25f |     
    arm      | igh-ethercat-f5dc109176400f... | NOK | http://autobuild.buildroot.net/results/ac9510bd5f74f027058bab205cb36758725dd57d |     
   sparc     | igh-ethercat-f5dc109176400f... | NOK | http://autobuild.buildroot.net/results/0bccb68650914c495b95e37987192044eb15bde0 |     
   x86_64    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/902ab30e35bfde4544cf1f1a67ce477749aba2bf |     
microblazeel |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/3ebc97ccc56d167e54d442784ab230b28ac026e3 |     
 aarch64_be  |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/3145ac007381b36e249358de58441a1e78c54951 |     
   xtensa    |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/d64b0e996f86ceba5f70c0ea62d121dfa13b86da |     
   x86_64    | jailhouse-e57d1eff6d55aeed5... | NOK | http://autobuild.buildroot.net/results/d281c4f129a67d9ac24b8cd4b0bd42b5945b6d1d |     
  sparc64    |      janus-gateway-1.1.2       | NOK | http://autobuild.buildroot.net/results/c20c9b3d2500c9e3eea137b369bda9d1d76306d4 |     
    i686     |      janus-gateway-1.1.2       | NOK | http://autobuild.buildroot.net/results/af580ca8c8e5d6782ef226507ef8eba0863915d5 |     
   s390x     |      janus-gateway-1.1.2       | NOK | http://autobuild.buildroot.net/results/d897f00fba380daad9ee515764f900684c1452ff |     
   armeb     |      janus-gateway-1.1.2       | NOK | http://autobuild.buildroot.net/results/0316711a191c691f8218bd7a7681a1f1cc3692f6 |     
   s390x     |      janus-gateway-1.1.2       | NOK | http://autobuild.buildroot.net/results/ea1726655d23659d75bde7141d50cce774458b56 |     
   nios2     |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/4dd508ea603d97a2b519cc902cfcf83da702aeae |     
   sh4aeb    |       libargtable2-2.13        | NOK | http://autobuild.buildroot.net/results/39fc3ab241bed5cf3641555e8567832ad4e9c7df | ORPH
   nios2     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/383c9a55eeebd1635dfac47ebfe98c4214b32f4c |     
   armeb     |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/5a073f800533bb64c9b5f6859e73ff82cdcf0c56 |     
    m68k     |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/229880c005a3230e55f24e21cc35c0da65b5c81c |     
 aarch64_be  |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/40eaf4f30313681d1b62bc09cc33700d8039e944 |     
  mips64el   |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/f142d3716e2c133b0def33e4aca1de53c2ec02dd |     
powerpc64le  |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/030d884697aa23c5bfb02074aef82e543f90ee0d |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/16637bd5495ecd257da664ee4f68219a1e585791 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/7a0ffab30426598d9f6460437d30180248385367 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/11edaf03590e67f4f330a30500adaaaeae696c49 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/40caa050b5d2bc2d02c01758a60bd2fec8586cad |     
    or1k     |          libnfc-1.8.0          | NOK | http://autobuild.buildroot.net/results/4399b3d1bf9e26e065d02ab424bd929ffa9afc1f |     
    or1k     |          libnfc-1.8.0          | NOK | http://autobuild.buildroot.net/results/9da7be824614c4e9913a79840184d63a4e031701 |     
  mips64el   |          libnfs-5.0.3          | NOK | http://autobuild.buildroot.net/results/44a5c21344639c63ed6ef590990cc3e8ac24d5c5 | ORPH
powerpc64le  |          libnl-3.9.0           | NOK | http://autobuild.buildroot.net/results/f5a65b939d3fdd88d2c25b257f0edb2bfc59cd06 | ORPH
microblazeel |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/4b617f8e7ce146dfdf7534bb8cdfaa566886f31c | ORPH
    arc      |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/b972f3d49a70377f7d58cdbb356011917ad24a20 | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/55ab32a6c2441fd76c4448bd4485c427dc845604 | ORPH
powerpc64le  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/42850dea189aee2b14a65e382b4934debcfa308e | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/60ff7d61d4c5d93a3c282680dddcab595e895945 | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/655e13a5a8401e9e132262fb4fe300c6e59e2d1c | ORPH
powerpc64le  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/8a64ceb3027596b78323f9f4c2c3601ae7e79a37 | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/9842472e6d9dd5deca110d90218c47214ffa7145 | ORPH
    m68k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/6ed1db701ab67a836be875736014f4b43160c68f | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/9188fe1d451fed025c45cbcccd677622eb583e31 | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/0f5b55514bdb2b1653cee070b7d947f53339d78f | ORPH
   sh4aeb    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/63ef2dc0899d1c3c48bdf5b4b49fd2ef80c509b9 | ORPH
    m68k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/ff5af02cf5829fe533724a72d6fda3156dea63dc | ORPH
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/9fb3c9971aafe40c150847ca1ec0749912515b7f | ORPH
    sh4a     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/e8db0d03ea2ca7e41c649ecf2107d91981b3c401 | ORPH
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/4acbae6961a66fb0edb3594fe63c77d31f6e876c | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/e50723bb00108fd480d23ed81ecdd9aab99dc8f9 | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/79e333539565627dcaee0fe3877ea1276fc29335 | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/46d6d622fab09d6420cbb3f9bf6812f2fdd1e48f | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/6c575d4ab0bad84a5c366123d67f2808807fb9bf | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/63b35cf4aa703215cc80a5ed45ef12acc14d7935 | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/04daa7a8a3843f46bae406ac2e495bc5c18ddadf | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/76f557e553225c444d7b57b00c0a6b0b9bfe53b2 | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/370818f32e71a501aac339280c5a36153bb9cc3d | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/cddf0075c9d442c059d9bbf39e976348098e1397 | ORPH
    m68k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/b52d420882164760c55fcbf7768404a5dde2567d | ORPH
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/c040d21cbc5a5eec258b1b3341de04b20f082b34 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/ac051399b894f7e31b353b99b983c1e38d398408 |     
microblazeel |          libsha1-0.3           | NOK | http://autobuild.buildroot.net/results/5efe3c11f36d8205075f25e2c62a9353ead77850 |     
   nios2     |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/edfa8927f8f669542bbe1e84429804aa7e5d4988 | ORPH
   sparc     |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/bb0aa870c0728898d73cccba169b608643d68db6 | ORPH
   s390x     |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/8b881facceb6bea5ac9103100fdbf9938242fb26 | ORPH
  aarch64    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/46e84723c308c9f4a1192f7d8109c7418f3b3a72 | ORPH
   sparc     | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/ddcd6ebc07e9ce54156f1b4a9a246249a7cb1904 | ORPH
   x86_64    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/8693ab69623ec3f4f992765abfcb4be6626c5b2e | ORPH
  sparc64    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/00d49faecf1bd401c0b78a1b547fbda10beca768 | ORPH
powerpc64le  | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/22e51ae762f981c1610a9aaf6dd96ce744779e57 | ORPH
    i686     | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/826511bed18fedbe7d3e63ab1c836178a8eae3bb | ORPH
   arceb     | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/6ec6cdaeef33610fb4d76fc04591a1f4b32eb69b | ORPH
  mips64el   |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/59c08b1a08a074cb1c1704050503fd0b236b57f3 |     
   sparc     |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/6ffcf899eaec0d09133678be0de225096e53d804 | ORPH
powerpc64le  |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/d55b9d96a10232d3377ea3b74d330416525e2d39 | ORPH
   nios2     |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/201370c3345320a7fe69e326d6d42d0de98471d6 | ORPH
   arceb     |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/86cb594a8f61adca790c7ebbb9b23b7044c2788f | ORPH
  powerpc    |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/8a6847ec8e1f0afa65d3f60cc633e7f27e7387c2 | ORPH
  powerpc    |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/261403e914717ae5ae66034e7e313ced890e84f3 | ORPH
    arc      |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/e79d8b0fef851c0f19b45d2c6f1c45fec359859e | ORPH
    arm      |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/59cc2fc0d788e03c065d1497087754a3b683b79e |     
   s390x     |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/46b0471baa330ca6d0d0d4d790c0830aeda47ccb |     
    m68k     |        mongrel2-1.13.0         | NOK | http://autobuild.buildroot.net/results/8ea5ad0cc18f7e5a99249c920d51c9e1e176bfc4 |     
    i686     |        mongrel2-1.13.0         | NOK | http://autobuild.buildroot.net/results/f1768233dcec85c92fcc8d732fd774f172323787 |     
   xtensa    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/5518bc3e0d8a9314f8fdb242b3483aba331da66c |     
 powerpc64   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/1c35237a381a20d817a3a3da306a85bc25dbc863 |     
   s390x     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/a27e49a1c647dd744dc800c53bfa3268e070147c |     
    i686     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/9e85c1818a09b233412e4eb9cdab9671496ce596 |     
   armeb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/1662b4f149207141358be6a2acd9350354013fb9 |     
    m68k     |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/474d6b3cb4c3582d7bca2e4f93188b9f7e01aa8e |     
  powerpc    |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/428d729fef2ac11abef1104ef47726a5e012a897 |     
    sh4a     |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/3e4239a389fde64233cf413205c50d38af8357f1 |     
   sparc     |      ncurses-6.4-20230603      | NOK | http://autobuild.buildroot.net/results/70a4c3fae8e51862ea9d9015939ad655bbc2729a | ORPH
   x86_64    |      ncurses-6.4-20230603      | NOK | http://autobuild.buildroot.net/results/32016478922f8d1a19e0d6726b13a7824ba83893 | ORPH
    or1k     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/20865f1357c3d7890f43d929d953fce41bf8da05 | ORPH
  sparc64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/eb8833d5b8a0aee2319efa66143d8efa1fe35077 | ORPH
    arc      |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/0a2506cca7485618416616ddb7d6b9de63b60b8e | ORPH
   xtensa    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/eeafac6c4beb70fd19b210fe5feca63155f4c032 |     
   sparc     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/f5ede4d961731cf39c214195e89375dc5875b441 |     
  aarch64    |         nushell-0.85.0         | NOK | http://autobuild.buildroot.net/results/3e9dfe98d8a05c2e4549d53c2b4e57bb08ca73f9 | ORPH
   x86_64    |     nvidia-driver-390.151      | NOK | http://autobuild.buildroot.net/results/1544cf766365ee1e81750bfdf50acf85781e9b2e |     
  mips64el   |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/ae5a4ea860ffd3032ed533b312237445686af95c | ORPH
    mips     |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/66d352606f18295db7756ca0ecae5ff71c36c21a | ORPH
   armeb     |        procps-ng-3.3.17        | NOK | http://autobuild.buildroot.net/results/680f0f0b33995c02e32f2ece28446aa157f3b808 | ORPH
 aarch64_be  |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/75fb943a74b658555cbf64d11df288ba728de094 |     
    mips     |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/e0af3044c71decd341f053f8ca142a61132f347b |     
   x86_64    |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/f341284f74f844f446a8f4c18a2162247a409fd0 |     
  mips64el   |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/1b86d846189bfef2790b3ced27a2f49a5e8a763c |     
    i586     |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/fe60b77db69456d4b166c0f845213bd72dacffe7 |     
   mipsel    |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/fb3ce202d5df3f04c98b05f7abd6270998c10cb4 |     
    or1k     |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/a450d0df6a417b3bf8a3f2557b8e0bf1bfc687e9 |     
    m68k     |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/00111f6b3ca056c021340ecfef74d064c8bea678 |     
  powerpc    |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/600d4e754f94d8686013a1b38f8edba373cf1c2f |     
   mipsel    |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/b4fc9e52c7559c5fac139d3d2b18ba08fd9c741e |     
   sh4aeb    |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/3126f72d742e353c2908b81471a248a6a00e9f92 |     
   sh4eb     |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/ef9f5e325e30f5879e9a2cf0ca8a19afb9dc7f30 |     
powerpc64le  |          rauc-1.11.3           | NOK | http://autobuild.buildroot.net/results/65a254ff40a84128017b3ba794a49962730a0810 |     
   nios2     |          rauc-1.11.3           | NOK | http://autobuild.buildroot.net/results/6593cde69438dda44c5a9a0a5076c565e318ed0c |     
   s390x     |          rauc-1.11.3           | NOK | http://autobuild.buildroot.net/results/78e115d768250385197c9cd7422f5e3fec0a1c93 |     
  mips64el   |          rauc-1.11.3           | NOK | http://autobuild.buildroot.net/results/13c2e884cc178e01811757f582fa27d88a4119c7 |     
    mips     |          rauc-1.11.3           | NOK | http://autobuild.buildroot.net/results/9e825fd0161cb3b72853e1ce8cd4fdfa3d798943 |     
    mips     |          redis-7.2.5           | NOK | http://autobuild.buildroot.net/results/ff8b5403768bfddc337d22b3409e3c9649d2c2e8 |     
   xtensa    | rtl8822cs-fda6cd263e8956727... | NOK | http://autobuild.buildroot.net/results/76962e88b8f9777c46188fd10b1d0c1b72ce0a5c |     
  powerpc    |           rtty-8.1.0           | NOK | http://autobuild.buildroot.net/results/58e912b2a352a876b0ebe545d13cc5883710e950 |     
 microblaze  |         s6-dns-2.3.7.1         | NOK | http://autobuild.buildroot.net/results/6afd58f2f35f55e685363585fdc8d78a3fb82457 |     
  riscv64    |      sane-backends-1.1.1       | NOK | http://autobuild.buildroot.net/results/cc4daa6c780c62ea578c4653eb05a51003bd3a67 |     
  aarch64    |          snort-2.9.20          | NOK | http://autobuild.buildroot.net/results/b87ae2e66b8e1b4146318583c72ae99c473a3b30 |     
  sparc64    |         tbtools-0.4.0          | NOK | http://autobuild.buildroot.net/results/7b533f0dd7cc0c84c831182a4b2c439e84030ba0 |     
powerpc64le  | tftpd-b2b34cecc8cbc18ff6f1f... | NOK | http://autobuild.buildroot.net/results/391dc58e005f7522b94c17b7839bb1956fc2daa0 | ORPH
    or1k     |        udpcast-20230924        | NOK | http://autobuild.buildroot.net/results/eadfba32691448f541d704120a9503934cba3dca | ORPH
    arm      |         unbound-1.19.1         | NOK | http://autobuild.buildroot.net/results/aac7573d67ea24484c058b7b4bd1c868b20a279c |     
microblazeel |         unbound-1.19.1         | NOK | http://autobuild.buildroot.net/results/849b019b526ae467c4d321723b8899db9a5c7e15 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/69fee9395066b345cd63e859a7f691128bddb0cf |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/baffacd9e90c19f0353e0554fbb2e7031386a19c |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/183207a1016a59e3d724f9ea7beb5ae79a9d1eba |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/bafa643b5720680235b3ab14b658941b7b529fc5 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/984e307c2231807a838c52dfb00886932746151c |     
   arceb     |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/23ed91c01628bf844e7120f019350da6ce08cc8a | ORPH
   arceb     |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/a79f9e8a4ec61e42cf862b9ea5a43fd608e793cb | ORPH
powerpc64le  |           vtun-3.0.4           | NOK | http://autobuild.buildroot.net/results/f051c6f2ee0aa5037eafa7f3644345cae96799da | ORPH
  powerpc    |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/422e5046f849e8d0c922c1e28636e69559850b83 | ORPH
    mips     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/4d695816ced284a8b7ce0d7b15a98ec1b54fa107 | ORPH
 aarch64_be  |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/a0aab7ff09c05dd668bbc9e7dfe0309d0c6303b4 | ORPH
   mips64    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/a85bb67884eaa975679508b04d4a1d3fd408a95e | ORPH
    arc      |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/5e5ab1ff206e1fb955c244a6b547e296f775ac00 | ORPH
  riscv32    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/86f502c127dce76c683f143c8b015238e5aa4816 | ORPH
   mipsel    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/b9df33e64704c1bcaead09df08c8c80282ed0f96 | ORPH
   sparc     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/3846c0021cc44f181cb0b868facfc556984c6eed | ORPH
   x86_64    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/fa31ca1f4687f3b01c7fbb6f75c94324e6b6a1e4 | ORPH
   xtensa    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/cb3c403be4ae6a216b0678239db003f1c799e9b1 | ORPH
microblazeel |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/345cef2897891e40258de78fe0a23e11ef293a12 | ORPH
    mips     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/4f9656b4a17040305b20c9cf8e9cd0c423652473 | ORPH
  sparc64    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/027c4f3e002b386b1b99b78908e9f2f2c46ba19c | ORPH
 microblaze  |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/c97748037df0a031026649e73c394ea3a8c882f3 | ORPH
    mips     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/0c6efdbb9ff243223cce8c777b3830be0edf4a41 | ORPH
  aarch64    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/e157f38c7ff554c77b5304d269451b38fa82028f | ORPH
    i686     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/663083f9c914bc953de293eff54e88dc2e6eae9b | ORPH
    or1k     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/9a737bb07ad48abdf5da8f69d3a6d9c9f92a88f1 | ORPH
  sparc64    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/0de9d634892326d4bbd6a95cbdabc5ee083d0e51 | ORPH
    arc      |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/381bb77fdecdea1f87dbae72c2306e4d794a9f79 | ORPH
powerpc64le  |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/b5cad3d304aebf169f0115dc3978a1b292f767e4 | ORPH
    or1k     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/7cf85cc14ab8c82c9dabe8ce597c3d942b89dfdc | ORPH
   xtensa    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/b59ead2bc5d75c4cbee925ce376bc6a0be4303e6 | ORPH
   x86_64    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/56f9c7d6493fb4ac6b95dc9d160b912f5189ecf7 | ORPH
   mipsel    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/7cf15d78e540def281ea5108ec0ad639247b5561 | ORPH
 aarch64_be  |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/5312a6f463964787239d463475a01dfe4487de55 | ORPH
   s390x     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/4043801baf11ed4ef31d6ebbadf4d018a09c8a30 | ORPH
   mipsel    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/04722dd49a0b2b0e88582ea34abf2da88c76a2c1 | ORPH
 aarch64_be  |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/dbc2834044b15660cbc83f6aa0dd9d3765bcbf98 | ORPH
powerpc64le  |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/3bf3b6c8ee9c9af3844679960fac0d74fb325560 | ORPH
   s390x     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/f15dd8bd3673f3bfe789adc66e8333bb2072c376 | ORPH
   armeb     |           ympd-1.3.0           | NOK | http://autobuild.buildroot.net/results/8c0f16987dfc42454c0349f834e8ceff527be7df |     
  sparc64    |           ympd-1.3.0           | NOK | http://autobuild.buildroot.net/results/3ccddb3f4816c23f007f21ba777432571c5a3a0c |     
 powerpc64   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/2eb8fd40cee32d9be583eceedf7ac4e4fcc82802 |     
  powerpc    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/aec37e8050c9231201d58183c86f5d8d0be329b0 |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/5c96fdc924986f2edf778617741042d4a376e21d |     
   armeb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/e355373e3c411f3a87213918b3bdd41183d4b59a |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/bfe7f68cdcdc278082006fe0f1ea321035f13651 |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/0d0cdf5e43a5a814754487583c20404cd192c7f7 |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/5865f4a5ba8a140dd300f85da829c3ccbd835bcd |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/7ee9048638d203fe13465991664c7285bdd3a546 |     
 powerpc64   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/715eb0ecd9ce99528a6ebd8b6f8c41e07f55da21 |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/d77eb5982666c0b32459c92aeabc3356ed4be5c7 |     
    i686     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/2bc30c12f9a67d987cc306791b526e328ce765f8 |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/f28ef13442368623dbfebdd6e7e8b0eb45c21905 |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/3f5fabf85819c46b219ccb32081daec79af3de33 |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/d0eeb01ef9718cc396c27b6274604a459fb40d2c |     
    or1k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/32fd70013f139c2f80a4ee52ee6a45eabd30f8ef |     
   sh4eb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/0a7f7d9e873703d54cde84bea2ef39272e790818 |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/29e49224856368710e7993e62c2e958ee8ce5f7c |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/0d236ff514b639f71e49aed43da0e7c4737386ef |     
 microblaze  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/ec93eb1fbe2dea2085f8f8639c386379bff154f3 |     
  mips64el   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/5ecd4786caf1de8d39f54f6854f1ca23c1f1ac68 |     
   s390x     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/de596ae0a9e7f4f4530af080ed625c4cfb26abed |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/1fd1015a47f6a563dba3b27aa45f7e20cd9c3e41 |     
 powerpc64   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/80a94ab5caf5d8bb4a0e36bf5f0482af87686615 |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/159aea835b14f8f73a23ca384b4f39faa2e2cfa6 |     
   s390x     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/5d982563f5b677edf2489617c6c6efc4c2e501de |     
 powerpc64   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/77dd2df63e9fd640b2c863431fcf9dfa57a41840 |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/82705ffcb7b821724315e5904af38c52f12b4b0b |     
 powerpc64   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/1ce4cba24cd9f45a267b87e2270df604c5cca388 |     
   armeb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/6efae7fc0749ae4892776901de622c2e6c1ef2f9 |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/de42faeaf5e1bcd6f50a77acd81f160374893d01 |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/51f28a7a36bd8c294d594da81cf9f4bc37e305c0 |     
 powerpc64   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/c9a7510e0a0b728249b9f7ca24a721e584bb814e |     
   mips64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/99fb95afe1de3844cbb5d977043633552df3a183 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/44acae05cd1c25cce0323e3476c9e8f9a7b4a5dd |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/8304bfb79b369a7aaafc9fc8072311d537b84b36 |     
   mips64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/85a2914a22b59ec79b40e5c0bf93f1d81c358af3 |     
    sh4a     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/c63c3096d422918b2715a9858280956174f30682 |     
    i686     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/3b67c3f0c8df5c11badf996e6c84956bddff873f |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/07a152a47735dabf3745435feed6fe1e8e1fba4b |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/a14017cd9ed621100441063e7942988dc2152506 |     
    sh4      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/1472a223363ca02a0e2bf7cb4098904bd90add6a |     
 powerpc64   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/6e021ec6b8feb789200bd9f516dd569bb73811f4 |     
    or1k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/93e52bd4503731ff674c2cb1f7c575ac3b3854e1 |     
   arceb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/39c6822bf466db08ae4b51b7b5ef5d28b33406c6 |     
 aarch64_be  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/da2a1420164d115bca11f27b2d9cf983f1ffbc40 |     
   nios2     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/ceea15728c19a1cfc0f475cbf3ecb36654c87d4c |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/5aa94eac2f8ae8152548f92d0b7e76deaaf9759e |     
   sh4aeb    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/8235ba4a7069a93ee78920cece6d7c3969328186 |     
 aarch64_be  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/d439434f16e4c73795454f419e3bb62ddd1e605a |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/a375cc5ed6fca1e5da04e60f342621968778c743 |     
    i686     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/17b0aa293b1def1061a4484e1b8b907649dd32fd |     
  powerpc    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/818acfa3b533eadc585206d14430e660637fe8c9 |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/e2965c10509ac1a2e79b3fcf9c0f96a4d997e5fe |     
   mips64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/20183fb0f672295ced4d968c53c13f43d3ed6d0c |     
    m68k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/2beda2e0879d79251e9892092bbe486e50055f07 |     
    i686     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/83c544cbc909da4ca5d9393b8883d0973ab251c1 |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/77a81415077332b15fc394e31b5a7f11ce648ffb |     
 powerpc64   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/39ea566ab006d66d71bdaaee5c2e2aef6652d79e |     
   armeb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/3d672600f82be04753eadf59b3dc8ee539fec45c |     
    arc      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/4d8744011b54f70dee871fbc9d3a920f88e7fa74 |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/7f05c54d0c77d76620449d7fc2e8308f5046a7e6 |     
   armeb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/145e0fd209258beef3b157b9175ae4be4e03967f |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/8e9a8f8b4a5b027a72d8d4f0436d21b912aff7ff |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/be6543f56344e02a7f74f99d0bebc807e10b5f8c |     
   mips64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/a825779a73d5371eda4942cf36fccb738554d712 |     
 powerpc64   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/ee8dfc6d34a9d5123ab2213e6a8797ea1abe7895 |     
   arceb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/eb5cad142dfec7822ba9433a587551a235b4317b |     
   s390x     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/46f339e705e87568a480f3c675c1711ed7d7fe2f |     
 powerpc64   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/d95efd45762e16b6a36016345e88b347168805ca |     
    or1k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/85d05c2ee97b252962deb5fb6ea62bb712b69316 |     
 microblaze  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/bd9720e2f762b3781a97e0cd802c2f62386a1f4d |     
    m68k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/7eb9c5d5e6817666f3b220eda8c5639e89067d26 |     
   sparc     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/8bc5f8949175f5e8e75281862265828e7302e015 |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/ba5d05a982664bc920d46f21dce7d54b9494201e |     
  mips64el   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/dc18ded43b8a6666e2bcc7cdb9dbc43a36c2972d |     
   nios2     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/0ec9a391b51364045ee73d35638b26c4da4de7fd |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/e42defd686a8d586461dfc15bbbe48994ae37fd9 |     
  powerpc    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/0573f1534e74a01ec3cd5b55eb3307eec28525cc |     
   sh4aeb    |        zxing-cpp-2.1.0         | NOK | http://autobuild.buildroot.net/results/d97ba4bef9f73c7fabc036763efe25e3da42a084 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

host-heimdal-f4faaeaba371ff... | 2 
                   botan-3.3.0 | 1 
                     crun-1.12 | 1 
                gnu-efi-3.0.17 | 1 
                libressl-3.8.4 | 1 
               mariadb-10.11.6 | 1 
          python-grpcio-1.60.0 | 1 
                rocksdb-6.20.3 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |          botan-3.3.0           | NOK | http://autobuild.buildroot.net/results/afdf0042886f2ee7718a8e78a12244ea30acaeac | ORPH
    arm      |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/3136c11642beddf17821a2f4fdcdb4b68df5a760 |     
    arm      |         gnu-efi-3.0.17         | NOK | http://autobuild.buildroot.net/results/699559b73c65fc99214f59642c32832700920138 |     
   x86_64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/c80d39830941caf3a7e59491f81d78893e02101b | ORPH
    arm      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/2e95c0885956fdcaf963dd4dbbd31fefb80afad4 | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/74bb2168b63b7b2f7b0bee7b2494748d305f4e20 | ORPH
  mips64el   |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/fd2b05f4a77605e5a443b45f048e01d032e43a0d | ORPH
 aarch64_be  |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/2d65aff842d986811b9ee6d05206ae2f2bff8f11 |     
 aarch64_be  |         rocksdb-6.20.3         | NOK | http://autobuild.buildroot.net/results/5e5d99d8eb6671e1b316128883e5ee85ad0ca1d3 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                bpftool-v7.1.0 | 1 
brcm-patchram-plus-95b7b691... | 1 
                     dtc-1.7.0 | 1 
host-heimdal-f4faaeaba371ff... | 1 
              host-rust-1.74.1 | 1 
ibm-sw-tpm2-5452af422edeff7... | 1 
               libglib2-2.76.1 | 1 
         python-remi-2022.7.27 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.net/results/fbf830636e5589a61af65f3965dde5aec4db9628 |     
  powerpc    | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/1019005ed64110a9188246bc43c883d3d6d9c7bd |     
    arm      |           dtc-1.7.0            | NOK | http://autobuild.buildroot.net/results/4c4084a20dca3ed71bbb0756f66ecf36d745b0d1 |     
    arc      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/89ad34862f68f356853a8cbee8b17e08c326d8ec | ORPH
   x86_64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/4c50423f21b81ad37c4bae8c36e317f5ea555627 |     
    arm      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/2d93cb0c3e7268caef4b56363a92a1f5b579e05d |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/d89e77a5d2a001cab3f815690c8c5e511ac1c442 |     
   mipsel    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/ff723fc2300de9b81006802ba91ecfe8ad5e4690 |     


Gitlab CI results for 2024-07-05
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750543  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750565  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750568  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750569  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750571  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750599  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750613  | ORPH 
                   beagleboardx15 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750614  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750620  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750621  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750626  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750628  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750629  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750630  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750631  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750632  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750633  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750634  |      
        freescale_imx6dlsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750636  |      
          freescale_imx6dlsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750637  |      
         freescale_imx6qsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750638  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750640  |      
          freescale_imx6sxsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750641  |      
           freescale_imx7dsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750643  |      
             freescale_imx8dxlevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750644  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750645  |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750646  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750647  |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750648  |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750649  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750650  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750655  |      
                   imx6-sabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750668  |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750674  |      
                       imx6sx-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750676  |      
                        imx6ulevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750677  |      
                       imx6ulpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750679  |      
                        imx7dpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750682  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750687  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750689  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750696  |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750701  |      
                     ls1046a-frwy | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750702  |      
                mender_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750705  | ORPH 
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750719  |      
                   mx6sx_udoo_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750724  |      
                          mx6udoo | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750725  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750738  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750739  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750741  |      
        olimex_a20_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750749  |      
       olimex_a20_olinuxino_lime2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750747  |      
                    orangepi_lite | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750768  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750767  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750773  |      
                   orangepi_zero3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750785  |      
                       pandaboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750792  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750801  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750806  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750814  |      
                     qemu_sh4_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750882  |      
                   qemu_sh4eb_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750883  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/7262750903  | ORPH 
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/7271148801  |      
                           rock5b | https://gitlab.com/buildroot.org/buildroot/-/jobs/7271148832  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7271148848  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7271148865  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/7271149017  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7271149173  |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/7271149198  | ORPH 
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7271149237  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7271149285  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7271149806  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7271149867  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7271149959  |      
                         uevm5432 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7271150014  |      
                      visionfive2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7271150175  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
