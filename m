Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A72C52D7D
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 05:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF56840B33;
	Wed, 14 Aug 2024 05:06:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wlgKxKYtDdYK; Wed, 14 Aug 2024 05:06:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A9DB40451
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A9DB40451;
	Wed, 14 Aug 2024 05:06:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 332BD1BF855
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 05:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 20B54606A5
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 05:06:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KxHsgNTe33ub for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 05:06:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3A7C06070A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A7C06070A
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A7C06070A
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 05:06:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5AD02FF80C
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 05:06:19 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 14 Aug 2024 05:06:19 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1723611979; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=soRd5RAUeB+1q7AmlTPJj7V3JhHUgOwEkhZwJ4UrEZE=;
 b=e+gJfxVk4I96GbH9FSyLlF7ak1IDRCYp0JPamA4yGOrwQwRNxXhMEebW02/3y5SJ7PkK4m
 gGYaCtvvoi6xeMh5alMMar5db/y7/f+V6Bn7tEmtKHHXqXAoAB6q1pdbljq2aQafG+Oa4Z
 7u99gGOcDRqOCxbpaK3jwECLxqbY8vNi39lQiEasPvVWbl/bJwMa+1jN41bfv+7HUNohNT
 kALl1/9k+02maOJu56/EHBeWOMnkeWmyV/K7VL2oJI8jHc4OSt11amoEuDsTmpNYltIl4j
 1jn+oQDzO0B/Jh8RpxFe3Qa6MCW5RMyXpLEiLZtupenkjeCWqDPs7w7Dmm2V+w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=e+gJfxVk
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-08-13
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
Message-ID: <20240814050619.vw3CLuxEoPSyn9RetRn3mbNppNeBvbywcUIXW5d7MdQ@z>

Hello,

Autobuild statistics for 2024-08-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  5  |  6  |  0  | 11  |
  2024.05.x  |  5  |  5  |  0  | 10  |
    master   | 61  | 73  |  0  | 134 |
     next    |  3  |  4  |  0  |  7  |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.76.1 | 7 
                   atop-2.10.0 | 4 
host-vboot-utils-bbdd62f9b0... | 3 
                 openssh-9.8p1 | 3 
               procps-ng-4.0.4 | 3 
                 coreutils-9.3 | 2 
                gnu-efi-3.0.18 | 2 
host-go-bootstrap-stage1-1.... | 2 
                  linux-6.10.3 | 2 
         linux-headers-5.4.281 | 2 
             parsec-tool-0.7.0 | 2 
           python-daemon-3.0.1 | 2 
                s6-dns-2.3.7.2 | 2 
                 apache-2.4.62 | 1 
                     avahi-0.8 | 1 
                  cairo-1.18.0 | 1 
                 dc3dd-7.2.641 | 1 
                  fbterm-1.7.0 | 1 
                  ffmpeg-6.1.2 | 1 
                   foot-1.16.2 | 1 
               freeipmi-1.6.14 | 1 
                     frr-8.5.4 | 1 
fs/axfs/axfs.mk:32: /home/a... | 1 
                 gnuplot-6.0.1 | 1 
               graphene-1.10.8 | 1 
            host-binutils-2.42 | 1 
 host-binutils-bare-metal-2.42 | 1 
       host-gcc-initial-13.3.0 | 1 
host-go-bootstrap-stage3-1.... | 1 
host-heimdal-f4faaeaba371ff... | 1 
              host-rust-1.79.0 | 1 
               ipmitool-1_8_19 | 1 
                latencytop-0.5 | 1 
                  libffi-3.4.6 | 1 
                  libsepol-3.6 | 1 
   libtorrent-rasterbar-1.2.19 | 1 
mali-driver-d40c57d81c9cf4b... | 1 
                memtest86-6.20 | 1 
                    mpv-0.35.1 | 1 
                 nethogs-0.8.7 | 1 
                    norm-1.5.8 | 1 
                nushell-0.85.0 | 1 
               pciutils-3.13.0 | 1 
          perl-net-ssleay-1.94 | 1 
                    php-8.3.10 | 1 
                 pixman-0.42.2 | 1 
                   swipl-9.2.6 | 1 
             util-linux-2.39.3 | 1 
           v4l2loopback-0.12.7 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |         apache-2.4.62          | NOK | http://autobuild.buildroot.net/results/7f64462a439486bac96ff9cd3050c55f4a004646 |     
  powerpc    |          atop-2.10.0           | NOK | http://autobuild.buildroot.net/results/ba8ee2a77f6a9de0dfa7f21c54cf9ff80cc42ae9 |     
   s390x     |          atop-2.10.0           | NOK | http://autobuild.buildroot.net/results/5d3ae29608fd1fb84bc708a36547077e90accdac |     
    or1k     |          atop-2.10.0           | NOK | http://autobuild.buildroot.net/results/cb3bc4abf226192dd3dbf4e81c63b5c8ecfdcff9 |     
  aarch64    |          atop-2.10.0           | NOK | http://autobuild.buildroot.net/results/7837f554be2c9c22de8ac659b140006bea8b0348 |     
   xtensa    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/ad37fc4cefffd8effb0788f7a54d0cf0839d5536 | ORPH
    sh4      |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/bf564d61edb5730d61b44e39566b73526f6fb575 |     
    sh4      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/772e73570de10698324f9b296dbfffc9ace34008 | ORPH
  powerpc    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/f67dab8ba5f797f8a10c211bfaf030e3b6d98cb6 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/6a0c5dc057eb348afcd5e3859cb37059d6bd91c1 | ORPH
    arm      |          fbterm-1.7.0          | NOK | http://autobuild.buildroot.net/results/5c198538ea4cbbaba881f30341a9584e0e5cbeb0 | ORPH
   arceb     |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/0a81ae15413c6e7f4de577478dfe57d3ad1619b4 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/56af2484570886f0e50dda9e39975847734052c0 |     
    mips     |        freeipmi-1.6.14         | NOK | http://autobuild.buildroot.net/results/1df5e4f1066cf6482175cd8b1bcd4545470ab874 |     
    arc      |           frr-8.5.4            | NOK | http://autobuild.buildroot.net/results/ed41b641c7d4472d77887a1e46db132927227ca0 |     
  mips64el   | fs/axfs/axfs.mk:32: /home/a... | NOK | http://autobuild.buildroot.net/results/c637ec7b267c86655377c377f2f47262fcf7619b |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/50fe3dcf51502be3250a21db294105ba70c318bd |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/1334a742a081736ba03535dcdbc530c32f4455fc |     
microblazeel |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/e9f655d1fd0d8b820a81f469441f5ce2b12b6536 |     
  aarch64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/144ea179b8d2d5471e8793b966d3530ccf488d2a | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/6f1a2419edb144570a27e9814960f8ea50b6c9ec | ORPH
   mipsel    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/a14c57faf75e2076725fe24146c84b76adb6c3e3 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/6a2dea37e86ed0bc7a0123d0fc11f0e5dd607b11 | ORPH
    sh4      |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/67befbb482bc26ed6f7b16c87850c9043f016884 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/35facf2c67861d953560c13017812e3ec93f1184 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/6bd771b403d6e1f2367372b36d421c61505a8af7 | ORPH
  aarch64    |        graphene-1.10.8         | NOK | http://autobuild.buildroot.net/results/30a08a6b6f83eb5a4d669669b66554f15c300f6e |     
   armeb     |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/40ac6901235306024c2fb4da78c4a63964f0263e |     
    or1k     | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/122c1db61bd58591eb801cc6e2d7aeae5a758418 |     
    arm      |    host-gcc-initial-13.3.0     | NOK | http://autobuild.buildroot.net/results/bd35d743ad1e099542d3b986630e12d1282a8e28 |     
 microblaze  | host-go-bootstrap-stage1-1.... | NOK | http://autobuild.buildroot.net/results/c80a95178c6881a83dfca04c37115491edd64756 |     
   nios2     | host-go-bootstrap-stage1-1.... | NOK | http://autobuild.buildroot.net/results/d8290b21d3ff2e69b1b72ba41ec6032f4b40adfd |     
    arm      | host-go-bootstrap-stage3-1.... | NOK | http://autobuild.buildroot.net/results/09584d501f0de04a5d876bf92e45ced9e2a3e4e4 |     
 powerpc64   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/f9e9bf734bf27dca91be6766d46ad8afba1ff0d9 | ORPH
  sparc64    |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/cf3bdc8d312e1f698bc55ceaf29f50e0ea5c7f31 |     
powerpc64le  | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/8e163b8be67f105cd9a462ce919aea5fd862ad4c |     
    arc      | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/e55af8335ef38e172e56544901510ae4dbdbff9b |     
    m68k     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/bb7b926c004d3a3938c55697a77df9ce7f712f90 |     
microblazeel |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/4bbc99131b2fd709dcf9c9b0e18cd2838da3e2bb |     
  mips64el   |         latencytop-0.5         | NOK | http://autobuild.buildroot.net/results/fca1a3f5800cd4f17c7c430761551a419a13a0e9 | ORPH
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/fb78f3532550e44285bb8eb980cd7e99be639902 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/49b30fb95d230eceaf2f80756f1b1d78885dd002 |     
   x86_64    |  libtorrent-rasterbar-1.2.19   | NOK | http://autobuild.buildroot.net/results/9c21da03955a4a43a47bfc0467819a6420a407bc |     
    mips     |          linux-6.10.3          | NOK | http://autobuild.buildroot.net/results/84b04a3945f470d345974edd14929368605ba298 | ORPH
powerpc64le  |          linux-6.10.3          | NOK | http://autobuild.buildroot.net/results/3a2224a6bbfc0944d582503ec8cd180caaaffc34 | ORPH
   sh4aeb    |     linux-headers-5.4.281      | NOK | http://autobuild.buildroot.net/results/56c7d97b7a45a851378ade7a37f575c00c114027 | ORPH
   mips64    |     linux-headers-5.4.281      | NOK | http://autobuild.buildroot.net/results/07812fcf7a91b5d2cb85e366bc4a19862e076470 | ORPH
    arm      | mali-driver-d40c57d81c9cf4b... | NOK | http://autobuild.buildroot.net/results/ee6aa16c8c9cb4886ff8c875e9b8d0448a99a113 |     
    i686     |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/6e43e49a25a2a54be63ef7a16ac22ff9b515f30d |     
   x86_64    |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/7f127475f64b5697959f9d8fa29bd9dbad4c58bf |     
    arm      |         nethogs-0.8.7          | NOK | http://autobuild.buildroot.net/results/75167f52d29882c2e9b448f76c2b9da148f2ba36 |     
    sh4      |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/6a4d0c885521aadcbb000c0960744a0e3ba0002d | ORPH
  powerpc    |         nushell-0.85.0         | NOK | http://autobuild.buildroot.net/results/b0b73c7f7ea14e4969158728ec85b257cf23f443 | ORPH
    arm      |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/5edc636f1b4007223e7edd23b5b50f944ad3134c | ORPH
   mips64    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/58eafd5865b1012d867b31cb58812f0308465779 | ORPH
  mips64el   |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/1e0624fa7b813c565e9dcee413e571acd3dc43b2 | ORPH
  sparc64    |       parsec-tool-0.7.0        | NOK | http://autobuild.buildroot.net/results/15f50c5168ff8aa837adfebf47169202adb89554 |     
  sparc64    |       parsec-tool-0.7.0        | NOK | http://autobuild.buildroot.net/results/d79527182d5712ae305ce3ab89dde0dd09d7bfd5 |     
 microblaze  |        pciutils-3.13.0         | NOK | http://autobuild.buildroot.net/results/6759d93bfade76ad159458c3a33b665cc8e37037 |     
  powerpc    |      perl-net-ssleay-1.94      | NOK | http://autobuild.buildroot.net/results/636e30b97b1eaa77912a469957e9ed6e30df2b89 |     
    arm      |           php-8.3.10           | NOK | http://autobuild.buildroot.net/results/6813e703ba0d97ae30f6f3fb2335e0a96d9712f8 |     
  sparc64    |         pixman-0.42.2          | NOK | http://autobuild.buildroot.net/results/dff0b31f6296d22c5df9f78ed9f1969b725c130d | ORPH
    i686     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/a751319a00eec5dcc66906e0d98ac69123db82ae | ORPH
   mips64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/60841ad574f4b9be99051f5d03f8f1b473a0123f | ORPH
   mips64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/7bf9a17a9580fd002d58112f16a6ba098fc3f01a | ORPH
   sparc     |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/9a977d99d9127249dac4481399bdb43a109f3215 |     
  mips64el   |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/0b3e78dd1a1ce7f2b190fa474921b1c0df7e9ded |     
    arm      |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/8f274483f9f6a0a9af61efd55e6f60365b5458fe |     
    arm      |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/a3967ad6548ec34bec74bb41d439a6f5a0f6fc22 |     
  powerpc    |          swipl-9.2.6           | NOK | http://autobuild.buildroot.net/results/e1e18eafce0c30262ab02b4e511bc88793fa5323 |     
  riscv64    |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/48576420d5f345c3ea7a91dd23dfd4660f0c25f8 | ORPH
  sparc64    |      v4l2loopback-0.12.7       | NOK | http://autobuild.buildroot.net/results/d09f9b1970753d3f79fa50427bcb47d5ba7b8874 |     
   s390x     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/5e9f94cd367c76b7367981be764611308324e721 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  fbterm-1.7.0 | 1 
                   foot-1.16.2 | 1 
                gnu-efi-3.0.17 | 1 
host-heimdal-f4faaeaba371ff... | 1 
                     lxc-5.0.3 | 1 
               mariadb-10.11.6 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          fbterm-1.7.0          | NOK | http://autobuild.buildroot.net/results/ad774969ff580d79e060f9d6539c9c31cf6b71d5 | ORPH
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/381974827e42696b3a187ffbb2e968d7a630b630 |     
    arm      |         gnu-efi-3.0.17         | NOK | http://autobuild.buildroot.net/results/6f42085f8cbc140de0f4c7266a4b091b2917dd5c |     
  sparc64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/7a433641ece181d8677921db165b5a4496b10a4e | ORPH
 aarch64_be  |           lxc-5.0.3            | NOK | http://autobuild.buildroot.net/results/908fa059344848815ba5324a4fcaf14e0c458710 |     
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/189918657bfc152aeffd682dad9770dad3b26ec0 | ORPH


Classification of failures by reason for 2024.05.x
--------------------------------------------------

  binutils-arc-2023.09-release | 1 
                  ffmpeg-6.1.1 | 1 
host-heimdal-f4faaeaba371ff... | 1 
           mediastreamer-4.4.8 | 1 
                       unknown | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.net/results/a7f9edc45abb9536e59267084769304b498556d4 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/451eb8765e1d2673f47a75a716d048c55651cf5f |     
 powerpc64   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/906e843da8676a0f9cce20419a764d94278ca2bf | ORPH
powerpc64le  |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/23db970ec82e47c8080ea1b421a639109a557074 | ORPH
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/0feeacca9fda5550a76231e261c274ca4a2c828e |     


Classification of failures by reason for next
---------------------------------------------

           ghostscript-10.03.1 | 1 
                gnu-efi-3.0.18 | 1 
           python-numpy-1.25.0 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      ghostscript-10.03.1       | NOK | http://autobuild.buildroot.net/results/375a93532327c65e5478f1e188492ce8c90b8b83 |     
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/4b502e80c2f6568047676142b6e15f322f06d163 |     
    mips     |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/8987d36b92df985c9ab8965fe0940943c5a61d64 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/59a9b4aa312116c9259d0f6a400425c3787073d9 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
