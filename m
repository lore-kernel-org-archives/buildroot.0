Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECEA5C25B75
	for <buildroot@archiver.kernel.org>; Wed, 15 May 2024 04:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09C6D81EED;
	Wed, 15 May 2024 04:02:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mhBmfcOBSl8a; Wed, 15 May 2024 04:02:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5717A81F03
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5717A81F03;
	Wed, 15 May 2024 04:02:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8C9231BF865
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 04:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79C426067C
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 04:02:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tNyiqF8PzBv7 for <buildroot@lists.busybox.net>;
 Wed, 15 May 2024 04:02:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 89D1460682
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89D1460682
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 89D1460682
 for <buildroot@buildroot.org>; Wed, 15 May 2024 04:02:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A70B924000A
 for <buildroot@buildroot.org>; Wed, 15 May 2024 04:02:00 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 15 May 2024 04:02:00 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1715745720; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KD0eu+kPOlBLFGM8+cJ5ckRt9DQZAw+DjRMrWn7UYdk=;
 b=H0n8P5ptPMi/XFGTn+HBsBi2kBuVP/rbAl0/rEvfevm+4Ybo1R9cU7I3munYCOIoly2C1A
 JYwfmat0E/yCO2jHIQyt7E0t/i3NydEHp0kZwYd7picbRjjgdaSF/D6SqF6cqfWy+WMEXx
 0keSEt73V1N+EG4xIsBBY0Z+21GRzB0dJv+VLUUNytPgIoLeMiP6WuhixJim5pb5n0xAEf
 kHqprOp+ERROoGiK8HpAg8PRVnO35RN5kCujenNX1WvjE6PHHnfMYkmZE7qO4u8GV79be8
 fmmvwr+ifhD5ccXajlN6DpoE5GJVZUN+hDuy+sUk1hX2uo+oarWn0O6LqSpzNw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=H0n8P5pt
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-05-14
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
Message-ID: <20240515040200.sfwhvG1B9J6YEhnyLM-DEx117SkxYB8yaKU6-mx35Mk@z>

Hello,

Autobuild statistics for 2024-05-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  | 14  | 11  |  0  | 25  |
    master   | 54  | 95  |  1  | 150 |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.76.1 | 5 
                fail2ban-1.0.2 | 4 
        host-sentry-cli-2.20.3 | 4 
                   linux-6.8.9 | 4 
                    bat-0.24.0 | 3 
                    dust-0.9.0 | 3 
                  ffmpeg-6.1.1 | 3 
                  libsepol-3.6 | 3 
                       unknown | 3 
check-11970a7e112dfe243a2e6... | 2 
             containerd-1.7.14 | 2 
                     frr-8.5.4 | 2 
             host-cmake-3.28.3 | 2 
       host-gcc-initial-13.2.0 | 2 
ibm-sw-tpm2-5452af422edeff7... | 2 
              libopenssl-3.3.0 | 2 
                libressl-3.8.4 | 2 
                mongodb-4.2.18 | 2 
                    proj-9.3.0 | 2 
                 shadow-4.14.5 | 2 
             sofia-sip-1.13.17 | 2 
                 uclibc-1.0.48 | 2 
                    zeek-4.1.1 | 2 
aer-inject-9bd5e2c7886fca72... | 1 
android-tools-4.2.2+git2013... | 1 
     bandwidthd-2.0.1-auto-r11 | 1 
                    brltty-6.6 | 1 
                busybox-1.36.1 | 1 
                  clang-15.0.3 | 1 
                     crun-1.12 | 1 
                    eza-0.18.8 | 1 
                   foot-1.16.2 | 1 
               freetype-2.13.2 | 1 
                 gnuplot-6.0.0 | 1 
         gobject-introspection | 1 
google-breakpad-f49c2f1a202... | 1 
        host-babeltrace2-2.0.4 | 1 
            host-binutils-2.42 | 1 
             host-clang-15.0.3 | 1 
host-heimdal-f4faaeaba371ff... | 1 
         host-libxcrypt-4.4.36 | 1 
              host-perl-5.38.2 | 1 
                  jack2-1.9.22 | 1 
              libarchive-3.7.3 | 1 
               libglib2-2.76.1 | 1 
              libunistring-1.2 | 1 
               lighttpd-1.4.76 | 1 
          linux-5.10.162-cip24 | 1 
           mediastreamer-4.4.8 | 1 
                 openssh-9.7p1 | 1 
pistache-3ec9d7c4f8b828fdd3... | 1 
pppd-e1266c76d1ad39f98f1167... | 1 
                  procs-0.14.5 | 1 
          python-grpcio-1.60.0 | 1 
         python-remi-2022.7.27 | 1 
rtl8188eu-306f3e62cf7cddf8c... | 1 
               syslog-ng-4.7.1 | 1 
                ustreamer-5.51 | 1 
                    volk-3.0.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/d8e310a8dcfcfec772569524d3b497cece72041f | ORPH
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/84725c06965a567844e569048ab7edaa18544f20 |     
   nios2     |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/73e96e7b91b61bf844e48483f00664467c25d094 |     
    arm      |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/c0d1dbfbba40a1ac45490f1206813551473f2925 |     
  aarch64    |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/a8b8af030b8e805af61fd54a593d53e063b1d5c9 |     
powerpc64le  |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/b95093c618eafeb3726513a3ef6199488406093d |     
microblazeel |           brltty-6.6           | NOK | http://autobuild.buildroot.net/results/6244f79e95663ed73b6b27e742cda8df04bf79be |     
  sparc64    |         busybox-1.36.1         | NOK | http://autobuild.buildroot.net/results/f550fd18fabca5f7380ca58ba0d958eb0929f1d9 | ORPH
   sparc     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/44c63e9d6dac525915afdaf06b46c53f6d23c411 | ORPH
    arm      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/e69d3b2d27dd2eae309e0b7ee84a9fa0844ba351 | ORPH
    arm      |          clang-15.0.3          | NOK | http://autobuild.buildroot.net/results/f3f24315569104a20bfa623123535368c3e9612d |     
  riscv64    |       containerd-1.7.14        | NOK | http://autobuild.buildroot.net/results/545596fda62b07a8e631482c08e7ff52f4c18f68 |     
  riscv64    |       containerd-1.7.14        | NOK | http://autobuild.buildroot.net/results/dd7bf68f083919bf2a2ce406a565b1b3cc3661d2 |     
    arc      |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/57c0e17ef553671c2d18cd09fa713b84363ee6f2 |     
   x86_64    |           dust-0.9.0           | NOK | http://autobuild.buildroot.net/results/276bb6df59fe03ec8a615138d3d3a394ca25bd83 | ORPH
   x86_64    |           dust-0.9.0           | NOK | http://autobuild.buildroot.net/results/1ff5ccf5ee6029669af1413c95827f670ae212b3 | ORPH
  aarch64    |           dust-0.9.0           | NOK | http://autobuild.buildroot.net/results/af80c50816f99302132dc462d4522dfd5651abcd | ORPH
  powerpc    |           eza-0.18.8           | NOK | http://autobuild.buildroot.net/results/345131affd11212013e44cc1148707241f01bd7e |     
    i686     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/c4514660730a747c41674ac9ff33fc47ffa90c38 |     
powerpc64le  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/967f1ec7b8df68d75bd13fbddace23058bafc21b |     
  sparc64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/c0c0d01042dec1f1e03ad559daa79abcecaf5a9b |     
 microblaze  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/bec408fbd9079990b3a61091801258685cd10acf |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/70f2bebe3668f5502e14213f9643ef9208fe8b72 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/bdc391abb4d82af0169989e90251df3af685e3ec |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/d89675316f0a285c35ddcfec0c1bd6a9e5a55d9f |     
    or1k     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/11f0c5aca2ed80936b4f7d4d02bf4c163bc54896 |     
 powerpc64   |        freetype-2.13.2         | NOK | http://autobuild.buildroot.net/results/05325577496480ba1df26e9ce32c14206c7c5a1f |     
    arc      |           frr-8.5.4            | NOK | http://autobuild.buildroot.net/results/082a03cfe45468caea1e3b8b101f0496759c6c39 |     
   xtensa    |           frr-8.5.4            | NOK | http://autobuild.buildroot.net/results/190cf9865381021dcdd4d5d7743b000bcb8e450b |     
    arm      |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/5e45dd8f9071694110c8481f222b9b07b6a97ef3 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/dad14e5982bbf314a2a002324848d812195a915c |     
    mips     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/32a46af0747d90d7c155557386b886e8baef8714 | ORPH
    sh4a     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/3bf4a45f7d7a468806130bf56ca4f2ce7294c505 | ORPH
  powerpc    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/ab0f2408b87772094fc894cf06699176a12ad3aa | ORPH
    mips     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/98950b448343f90971c877f4c4c61e5a81306680 | ORPH
  powerpc    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/9997c6a23199a8a459c54cd16f380f7276bbecf5 | ORPH
   mipsel    | google-breakpad-f49c2f1a202... | NOK | http://autobuild.buildroot.net/results/6c5a22fb173714a45bf7f6e83f125a0ca36fb12a |     
    m68k     |     host-babeltrace2-2.0.4     | NOK | http://autobuild.buildroot.net/results/07e37804d82407f9da6b8c21588ea19464621c43 |     
   sh4eb     |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/7ebcabf81fe366f0f903b6f31e18a02f9ff947cd |     
    arm      |       host-clang-15.0.3        | NOK | http://autobuild.buildroot.net/results/5f6fb1f26e8c41caa076538d20e5b4a017842ace |     
   s390x     |       host-cmake-3.28.3        | NOK | http://autobuild.buildroot.net/results/4942fff06169b5bb54e70a6161b1dd841e6aef7c |     
   s390x     |       host-cmake-3.28.3        | NOK | http://autobuild.buildroot.net/results/abd3e4172cf81fd6241f99290e6fff3f03ff1135 |     
    sh4      |    host-gcc-initial-13.2.0     | NOK | http://autobuild.buildroot.net/results/35fda8c98376fb0ad4371e2bf9d5179e436655d6 |     
    i686     |    host-gcc-initial-13.2.0     | NOK | http://autobuild.buildroot.net/results/32ffaab89a065fd04cf058eba9c11322458e3e82 |     
    m68k     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/71623199789ad3bdf4dc54ae487b4ab2f4b7a9dd | ORPH
microblazeel |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/0bb4169b22d706ef049b9f2b84e735c6bf94ca8d |     
  sparc64    |        host-perl-5.38.2        | NOK | http://autobuild.buildroot.net/results/c8744837fe9aeb0ab5430cdd721c8267adccee45 |     
  aarch64    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/50d7d973a84ef21c0bbcfff5e6dc3f1840370756 |     
   mips64    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/606a6f342699ba838f90aa36c5d78f5bbb3392b3 |     
    arm      |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/7b26a88a6fbed1775d9c1dbefae4938d93331930 |     
 powerpc64   |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/f887adebe611f0021d5ee85acb95cced7c8b71c0 |     
    m68k     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/1402723300998ee82b1ad890edae039a4124e8f2 |     
    i686     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/f612d7eb76a422500315ad9db44a861e21c8a4d4 |     
   xtensa    |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/56dccf0918883b1348e89dd8b892c4f6f5a0b0f5 |     
  aarch64    |        libarchive-3.7.3        | NOK | http://autobuild.buildroot.net/results/59535c80b4b4606ccd97cb81c5843d97b8e6358a |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/7627f12fa32279ad3c93bd95e3710bb2ccf0ed64 |     
  riscv32    |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/1459a9a290d6b673c64957b5779f8ab54d2f4017 | ORPH
 microblaze  |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/551fad2f8233527c3fdd895fdfb23ab972f71117 | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/cd3b72271b0870094c9dbb66a734706405710115 | ORPH
  powerpc    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/bba0104bb685ef4146030575f83aab30e81eb5d7 | ORPH
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/a8d59f266aa1ca3ce9c487dfa285e6593525d4ad |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/7377f40fbcb34061060a79923e1f1d6934d1b879 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/7be215baf7309584a4244db65fd0c858007854fe |     
   s390x     |        libunistring-1.2        | NOK | http://autobuild.buildroot.net/results/8edad730753b150ca7f927f9d4de572358df8779 |     
  sparc64    |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/8a03607d5b9732a91a354b2b30705c1892deefb9 | ORPH
   mips64    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/f9016262a689789c09fcf626c2a425bfed6d98cb | ORPH
 aarch64_be  |          linux-6.8.9           | NOK | http://autobuild.buildroot.net/results/02bf1cba1b212a843ef67639450c4016d514a735 | ORPH
  powerpc    |          linux-6.8.9           | NOK | http://autobuild.buildroot.net/results/05abb6d7f6a1bef436ea830cd8a784c60ec858a9 | ORPH
   sh4aeb    |          linux-6.8.9           | NOK | http://autobuild.buildroot.net/results/52dc932b03b913ef10acf7bb8a6efef650f8bbae | ORPH
    mips     |          linux-6.8.9           | NOK | http://autobuild.buildroot.net/results/155fcfa46a2203cf46543ee703b354b15d3bf640 | ORPH
    sh4      |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/23850a40ff4881f19d6e6147a14538ea52013d09 | ORPH
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/6633c7261dc1b3d38d281a7c39e31fdf8be1330f |     
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/420b8ed7228730dcfeabfeaa70810411c209dd80 |     
    arm      |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/c5fbf4ab7df24fde5fdec285a2dbd2c04ea9c7fd | ORPH
    arm      | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/1f5f18713d078482cd9995cb71da08303a30ded4 | ORPH
   sparc     | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/5085556e465c0cfea87dc7114f45e0d96927398f |     
    arm      |          procs-0.14.5          | NOK | http://autobuild.buildroot.net/results/abac4127dc8a0519235487d3aa75b7f9900769d4 |     
  sparc64    |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/442c6f7bedf2870692e9f60c10b03e28d9aed1f3 |     
 microblaze  |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/a94dfcd4f765e128a715b00d9032d45033aa4713 |     
    i686     |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/056a97b5242052327b44dfc297ea29024f225ca9 |     
 aarch64_be  |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/967658872018b40dd0123d4d09cbd1cb03bf626b |     
   x86_64    | rtl8188eu-306f3e62cf7cddf8c... | NOK | http://autobuild.buildroot.net/results/c91828d666f9ad7e7976362c443b29da57af5d8a |     
    arm      |         shadow-4.14.5          | NOK | http://autobuild.buildroot.net/results/cfdf4ea064df4839424026483d4e3d222df4da46 |     
    arm      |         shadow-4.14.5          | NOK | http://autobuild.buildroot.net/results/5cb62733e7d8e5021321010a71d0034066ba821c |     
    arm      |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/a6d872ea2033636794df6decc055f19889f4fdb7 |     
    i686     |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/3a07c946fafa2b8f4a5a03e9538240ca95b18dca |     
   nios2     |        syslog-ng-4.7.1         | NOK | http://autobuild.buildroot.net/results/cf36fb119224ba50a768dbe363d4c381f76eb476 |     
    i686     |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/9f586db6f6890adb2b0f6426b728d08330581ddc |     
   arceb     |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/d9b924bdea3fd61060fa0e961c12534c1fff80de |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/17c66958cad99e446a17604b77676198e2a8944e |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/d5fd03ce95ad58847da2ab4234bee6824449d67b |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/d8c4c7693c3f7bfb69a5a34346ac1bbb3b7151e9 |     
    i686     |         ustreamer-5.51         | NOK | http://autobuild.buildroot.net/results/db08277684ff03b7b655b9be46962ba31d071dda |     
  powerpc    |           volk-3.0.0           | NOK | http://autobuild.buildroot.net/results/e3282218e8894e3e88c7d1917bec9df81402b067 |     
  aarch64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/d7e5cd34918c6e1e1bb0b0c60519acc891fbb79a |     
    arm      |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/35de0516a2c3389378a21413922f2f75dda5c638 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                   bird-2.0.12 | 2 
                elfutils-0.189 | 1 
host-heimdal-f4faaeaba371ff... | 1 
               ipmitool-1_8_19 | 1 
          libcamera-apps-1.2.1 | 1 
              libopenssl-3.2.1 | 1 
               mariadb-10.11.6 | 1 
          python-grpcio-1.60.0 | 1 
                 shadow-4.14.3 | 1 
                       unknown | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/86cd548229c12ab4519c1d3f212e64e6eab97b90 |     
   mipsel    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/c4a2f201ee306dab6f8b6374f7be10989200496f |     
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/de00407df5d84ea4f0f6daab9a5baf85a3bbff85 | ORPH
   x86_64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/a4c7d1b7149d37948cbf65c29a13d0331c7fc3d3 | ORPH
   armeb     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/df4d58a0623f36ccef1d8739644f224d5d7cf34c |     
microblazeel |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/d5e475f90c0ef086829cbe0561916f42e689ff79 |     
    arm      |        libopenssl-3.2.1        | NOK | http://autobuild.buildroot.net/results/ba1474dda768b10084814b94704aefd6dba6f706 | ORPH
    mips     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/44807e6038dd4d9cd9042fe7f102ac8367e555a0 | ORPH
 aarch64_be  |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/f5b32e918a48f06083aa78b3f819846ef439af1a |     
  mips64el   |         shadow-4.14.3          | NOK | http://autobuild.buildroot.net/results/24ff25dd917bde2b14f6b3a25ed0291e37cc8184 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/2aa593264fe9563b7fe92d0df5d207770e7d3edd |     


Gitlab CI results for 2024-05-14
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/6833307823  | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/6833309173  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/6833309174  | ORPH 
               TestMender | https://gitlab.com/buildroot.org/buildroot/-/jobs/6833308175  | ORPH 
                   TestNu | https://gitlab.com/buildroot.org/buildroot/-/jobs/6833308218  | ORPH 
                  TestOci | https://gitlab.com/buildroot.org/buildroot/-/jobs/6833307649  | ORPH 
    TestPythonPy3MlDtypes | https://gitlab.com/buildroot.org/buildroot/-/jobs/6833308461  | ORPH 
      TestPythonPy3PyAlsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/6833308479  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/6844560339  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/6833308568  | ORPH 
              TestRustBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/6833308569  | ORPH 
        TestRustVendoring | https://gitlab.com/buildroot.org/buildroot/-/jobs/6833308571  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
