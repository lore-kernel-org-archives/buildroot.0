Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259E1C636CD
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 06:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85987401F1;
	Tue,  7 Feb 2023 06:47:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85987401F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GxKcGzsXjiP0; Tue,  7 Feb 2023 06:47:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82630403E9;
	Tue,  7 Feb 2023 06:47:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82630403E9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 036931BF36B
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 06:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0DFC403E9
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 06:47:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0DFC403E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DU10iYH5NYE1 for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 06:47:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1800401F1
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F1800401F1
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 06:47:17 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 365D124000A
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 06:47:14 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 07 Feb 2023 06:47:14 -0000
Message-Id: <20230207064720.D0DFC403E9@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1675752435; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=m7xceAZoCOLNA7AKx7udUbiikfzlXYW8rjOQMX92jas=;
 b=ckelKnZt9Lzq23eihHNvt3Kp9jSfRhXtlX0w5nEKduc4lIKnZiO+l9cB6pHTMRlMKCYmU+
 xcsXZ8fRk+oU1B3qdMb0TIyDRWzGW+B9TSp1ursEwZqcf3PAdp/vA1LydCWY8wYsSOSyQd
 GxL6jCl8GsXgOOoFB+asj8BP9Ct8H4xHvT3f2pBiyUqOy8xZduWqZO0ndcYgVNqFG+o35y
 DWCWV001+yFOffdUJqJhFyzpB564ccLRxRRt1iBpssYjAhIo6J6U2dvM5GHZEdMjZrxq0b
 4Vpjxa2vHH5ucuWmM3n3JNLahRGTuITwM6jruVIItPRjxOyXGiHA9jvINDITZA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ckelKnZt
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-02-06
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

Autobuild statistics for 2023-02-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  2  |  0  |  0  |  2  |
  2022.11.x  | 10  | 16  |  0  | 26  |
    master   | 158 | 202 |  0  | 360 |

Classification of failures by reason for master
-----------------------------------------------

                   bash-5.2.15 | 15
                     xz-5.2.10 | 12
                       unknown | 10
              host-pahole-1.24 | 9 
  gobject-introspection-1.72.0 | 7 
           python-bcrypt-4.0.1 | 7 
                gerbera-1.10.0 | 5 
             libopenssl-1.1.1q | 5 
            python-bunch-1.0.1 | 5 
            host-binutils-2.38 | 4 
                host-go-1.19.5 | 4 
                  jack2-1.9.21 | 4 
              libgcrypt-1.10.1 | 4 
               libglib2-2.72.3 | 4 
                   perl-5.36.0 | 4 
                  xxhash-0.8.1 | 4 
ulog-0389d243352255f6182326... | 3 
                 wolfssl-5.5.3 | 3 
                 dmalloc-5.6.5 | 2 
                elfutils-0.186 | 2 
             fontconfig-2.13.1 | 2 
glibc-2.36-81-g4f4d7a13edfd... | 2 
            host-binutils-2.37 | 2 
         host-libarchive-3.6.2 | 2 
  host-libxml-parser-perl-2.46 | 2 
         host-sentry-cli-2.8.0 | 2 
             libgpg-error-1.46 | 2 
                   linux-6.1.9 | 2 
             lirc-tools-0.10.2 | 2 
                    mutt-2.2.9 | 2 
                  netsurf-3.10 | 2 
                    norm-1.5.8 | 2 
            ocf-linux-20171122 | 2 
                 openssh-9.1p1 | 2 
ripgrep-af6b6c543b224d348a8... | 2 
                  zabbix-5.4.9 | 2 
                  acpid-2.0.34 | 1 
                    bat-0.19.0 | 1 
             berkeleydb-5.3.28 | 1 
                  cairo-1.16.0 | 1 
               collectd-5.12.0 | 1 
             dahdi-linux-3.2.0 | 1 
                     efivar-38 | 1 
                     exim-4.96 | 1 
                  ffmpeg-4.4.3 | 1 
                   flann-1.9.2 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/romfs/romfs.mk:32: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                     gmp-6.2.1 | 1 
google-breakpad-c85eb4a59b6... | 1 
gummiboot-2bcd919c681c952eb... | 1 
           heirloom-mailx-12.5 | 1 
            host-binutils-2.39 | 1 
             host-delve-1.20.0 | 1 
         host-gcc-final-10.4.0 | 1 
       host-gcc-initial-10.4.0 | 1 
       host-gcc-initial-12.2.0 | 1 
        host-libopenssl-1.1.1q | 1 
    host-python-maturin-0.14.9 | 1 
              host-rust-1.66.1 | 1 
              hyperfine-1.14.0 | 1 
                       kmod-30 | 1 
              leptonica-1.82.0 | 1 
          libcamera-apps-1.1.1 | 1 
               libcap-ng-0.8.3 | 1 
                libdrm-2.4.114 | 1 
                libglvnd-1.4.0 | 1 
                libxml2-2.10.3 | 1 
               lightning-2.2.0 | 1 
          lttng-modules-2.13.7 | 1 
               mariadb-10.3.36 | 1 
              memcached-1.6.17 | 1 
         mxs-bootlets-10.12.01 | 1 
             netsniff-ng-0.6.8 | 1 
                     nmap-7.92 | 1 
           optee-client-3.19.0 | 1 
                   pcre2-10.42 | 1 
                   poco-1.12.2 | 1 
           proxychains-ng-4.16 | 1 
    python-cryptography-39.0.0 | 1 
           python-numpy-1.23.5 | 1 
            python-rtoml-0.8.0 | 1 
rtl8812au-aircrack-ng-e7a4a... | 1 
     s6-portable-utils-2.2.5.0 | 1 
                    sdl-1.2.15 | 1 
            ssdp-responder-1.9 | 1 
             uccp420wlan-6.9.1 | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
               valgrind-3.19.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/b74bbbbeb49ad30b6e95c0ab756ad325988366b6 | ORPH
    sh4      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/55dda2420fc19b1c341730ea0cfdb45c2b9b58c9 | ORPH
   mipsel    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/4d7277cb359a569a99a25784d8769a2bed06c75d | ORPH
    arc      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/57d1ca6d1e8603e901dc7046046c38e4be3ade7b | ORPH
   mips64    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/23e41be303910c917051eceacd6a3941d24772e6 | ORPH
   xtensa    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/d7f7d084f8ec2f22ce488c4f0f58619258732e53 | ORPH
  mips64el   |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/5a1a7706511681114af754c5849adf24bb577d66 | ORPH
    i686     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/91e44276ebbf74a016e4add6e3c10ee6b90b36a8 | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/dceb497b7641a272123296f2c62626e0dbd3dcbf | ORPH
   xtensa    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/5765a6eb9d6687649cbd40b4d66fb74f9f8b06ca | ORPH
   mipsel    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/a1f7eced04717a34a12e40f4694ea4c926a4f0d2 | ORPH
   xtensa    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/1c0450396fc493e781ec4cc985ce3ed5c123faac | ORPH
   sh4eb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/4c78fd0efaeb7f3c500bca6af4f0f0342246257f | ORPH
    arm      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/bd70b232ab83b6f920b1de589b0516854d23c076 | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/37593a293c4f83fea95880e182d21bf24511528d | ORPH
    or1k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/7acc584407d3a503e8d39031565a78eb605273d4 | ORPH
   mipsel    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/e13b49a5939757c797d1f1ba1a94989ec285063a |     
    sh4      |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/25dec4e4087903dea9123c72e13679488c9c2480 | ORPH
   xtensa    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/8c8e1588a049559fd0cb3d8111a171b72ae17158 |     
    or1k     |        collectd-5.12.0         | NOK | http://autobuild.buildroot.net/results/681dab40f502d66643f4fb93614547823accd961 |     
   s390x     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/24c6f398f175437a7efa98eb4c6b97d16d12c57e |     
    i686     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/103d33e62c4ba7f03a62aa1190a920bb689a5e52 | ORPH
  powerpc    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/fce96f2a17bae1026eb6dc3df0d81aebd26848be | ORPH
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/a00179e157ff2dbdec28c7a58e3ba5a68a7d6890 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/9933b690c4c79d28175b8ee0658de30a9d374245 | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/aeb2692f361e4eabe1c6b71edf73689365600f08 | ORPH
   armeb     |           exim-4.96            | NOK | http://autobuild.buildroot.net/results/a068fadd96de2a4cb0c917d6717ec63b715393bd |     
  aarch64    |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/da7deef89d97ff7372d93cce1bde39340f952768 |     
  mips64el   |          flann-1.9.2           | NOK | http://autobuild.buildroot.net/results/79d2ceb0683d3b8c60fd6ccc67fbc51ca0de4e8a |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/5807a23709117a9c8f1ebd5e707eba68e1ae97c1 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/cfbdb6bd54c8a713f5392474391e5ff969419fd6 | ORPH
 aarch64_be  | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/6c2d5e137dc95f42012d86ad38ff275634f02485 |     
    arm      | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/85fb59aa2016082d681105f17ac2ca3edcbbc967 |     
  sparc64    | fs/romfs/romfs.mk:32: /tmp/... | NOK | http://autobuild.buildroot.net/results/54f5b8b25d0144fa9e85e422df276d229e7b5367 |     
   x86_64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/543b91d6a5c928d02d5edcf02d0f655f5b406e7a |     
    arm      | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/586d8a5539e10674ef58cf2405c3b82108a4f54f |     
  aarch64    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/261a65bb920208367b2b8af260a70e9b720da583 |     
  mips64el   |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/2835c27354ee19a20f3947547986d30cf8863b5d |     
  aarch64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/d4010bb3b895bc049f4685cc2455848b075467ec |     
 aarch64_be  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/c832064a8a486236a4676e55a48a9ff64207856b |     
microblazeel |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/c7f6d6aca7a2c69207a0f9cbe1163ac5a2d5566e |     
  aarch64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/18b2b025e2d24ee393f843ee5ab5085a1c532f1b |     
 powerpc64   | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/4f89977cc44d8cf8ec9e53d47cbe9df1af0a1f18 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/05d50dac0f8ba2fec33fd910d02a5ebe345037b3 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/eb036a2d1ad6c2b15b7b1ae8462d01a77792a067 | ORPH
 powerpc64   |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/fad110fc8175e61ffb8e0864c1ce9cd3ff9cc18a | ORPH
   mipsel    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/87c24b45e74e8436dcb383c684802d7dfeb57be9 | ORPH
    i686     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/65337aa9be06ee5f6e66d09c57d6839dc6e3603e | ORPH
 powerpc64   |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/dd2402f9e89436727203f9292d9885773bc5b877 | ORPH
microblazeel |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/8ac47a9ad3d7c1e5a1b414d4c814a1b4b3cf17cd | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/8bb67fdb4c6b78ad22e73818aec76fc6329f855d | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/a4869c93557923f8d553fc4db01e61659cd721a3 | ORPH
   x86_64    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/eb573954ba2a541602b6ace2e2311e94bfcf7af3 |     
    i686     | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/128c43d5da1fba639f8c251528d8c5a640538b9f |     
   sh4aeb    |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/b51c164de0c53f212e23565a246817862498593b |     
 microblaze  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/c617ffd996845189faae25cf2f1626febd07d009 |     
  sparc64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/113aad35efa553a8e15dc146c83bb9f5cd036c73 |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/1ba457cba994d896eb92c60d29eabb734519e68d |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/69b2e3a743e0a9f0b6148c214a9d06c99e7bf87c |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/5344a4d30ce46c729483cf08d62d99eebc4beafa |     
    i686     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/077f122c55f0abecb1d93544a0264d587dcd5609 |     
   mips64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/cff1bf08af9c9cfa5c7331197af4c5447a9a0d70 |     
  riscv64    |       host-delve-1.20.0        | NOK | http://autobuild.buildroot.net/results/a4c78f97b84b81039d397340cb6f36a4fd941145 |     
 microblaze  |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/d37ebb30f5796b763fc85f5c95d0ec69e0e13223 |     
    arm      |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/ee25f7aff8e6d09ef891f8c9e0566acd16e81dfc |     
  riscv64    |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/b0dd81a653663f494247474aa2190984363b3b42 |     
    i686     |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/99fd66268a07208cc57db1015372de4351268d88 |     
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/a37b8db79bbd440e5223add4077b53481275a44f |     
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/4ffafc5d1be2524647517feabaeb9a025261f90e |     
  mips64el   |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/71fa90a3058eda7077bc3878419618b79d69cc09 |     
    arc      |     host-libarchive-3.6.2      | NOK | http://autobuild.buildroot.net/results/0c09618b568ccfd550771066d9ce13b87feec4a7 |     
   s390x     |     host-libarchive-3.6.2      | NOK | http://autobuild.buildroot.net/results/cf928e2fc1021953c46b5b79ba9c32e14c934cbe |     
    i686     |     host-libopenssl-1.1.1q     | NOK | http://autobuild.buildroot.net/results/7c2df31c6eb34b68e460e092d8c262bdc6c8f25a |     
microblazeel |  host-libxml-parser-perl-2.46  | NOK | http://autobuild.buildroot.net/results/ee09d52e50a04194c80aa1338f0a6e98c1323cc8 |     
   s390x     |  host-libxml-parser-perl-2.46  | NOK | http://autobuild.buildroot.net/results/38d1112965817a5db7e2c4d1089cf5e074873932 |     
  mips64el   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/16710de50934f698a17e25c8672168b6f40500c2 |     
  sparc64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/20b445379f6bac25f43230db3ba4f7174a952435 |     
    arc      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/f61c19c80c4408ef4b31bab8e2cdacf9b7423706 |     
    or1k     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/4381f9dae08b0d47525bf291c9ed698036db1ef2 |     
   sparc     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/14e253dd717802bb616264f888d17eaed8e375b4 |     
  mips64el   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/d1b116896bc2adc10f32e89ab99242484109549e |     
  sparc64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/a1045a9cf65862fa84418f4ea5e69c9f330ddcec |     
  powerpc    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/3e1f4cb67a54177b169337ea1cf6717f224c850e |     
powerpc64le  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/08b3dd92cba069fcefd4e789ef31cb9ad3258ece |     
    arm      |   host-python-maturin-0.14.9   | NOK | http://autobuild.buildroot.net/results/f810653285451492d42c7bcc490d4ec93fa9f2ca |     
   mipsel    |        host-rust-1.66.1        | NOK | http://autobuild.buildroot.net/results/a6200194c12acb4ada8c8d5d54708ebb4494ea54 |     
  aarch64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/987d34125356d2973e04725a1443121805b24469 |     
    i686     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/5b1fd258ea724448be14771b37986801bc3da3ec |     
  mips64el   |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/e681089d03a7088d000003f0e7e7eb809b08cb68 | ORPH
    m68k     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/6ddecbe0634495d01d213c158c67c99e7d1b9356 |     
   x86_64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/096e0b529ea78c6d1431fcae2ad5522d20421ce9 |     
  riscv32    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/42fc0add46defee30d71fbd8dbabe5abd9f1dbed |     
   mipsel    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/9966289cb8d07a461c14ce0eb5e36607b28aab94 |     
    arm      |            kmod-30             | NOK | http://autobuild.buildroot.net/results/0a8a97b196e3bb49cd17cb45c587b5de520761c3 |     
    sh4      |        leptonica-1.82.0        | NOK | http://autobuild.buildroot.net/results/ca5c7b26c4d84845f733d61e2215aa589f88451c |     
  riscv64    |      libcamera-apps-1.1.1      | NOK | http://autobuild.buildroot.net/results/548f2a3b353ce4693fb60d7fb1e06e02af22991c |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/678942304ace22adbc17b70ed5c97da83ed988b4 |     
    arm      |         libdrm-2.4.114         | NOK | http://autobuild.buildroot.net/results/219ecdf1ead704aef6c0629770b4df895381538e |     
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/42bec9e563e1e09ac04818960f483356c9e8e189 | ORPH
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/b6aed2e1691c3ec7dc36fc514efd20c4367ff7d1 | ORPH
    i486     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/52ef7bdc086ce73a71b559dfffbc1bad5565fa35 | ORPH
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/8e3731ec6162c8977f23d48a117a18d5c29591e5 | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/2eadf8d0482fa02d23e8872afde209d732825007 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/fc5fffbbb2a96ae0a6ba11b7dbeae6190b0b5b5c |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/aeeaba1d5f7b4f4821f12360e63d8ca30b67353f |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/68e6bd6fb816e4efdf8b83a7d93d0791fccd5f64 |     
    m68k     |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/673ebc10d597c3a7cacab0bfcf18d7373c1f5c5e | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/af4e9d3ece173cdef34097ee2360a073fe41d789 | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/625413ba762aae479c3f251e772b58ae3065ded9 | ORPH
microblazeel |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/065f3def24ef868424446d53d0f5f897303070a5 |     
    arm      |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/d677be7289fe1bdc8fc62081a44b98d9eb9ef6d9 |     
 microblaze  |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/129132a33b9cdb779d50033f316e84ec64f1c02c |     
   mips64    |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/5af699583279ccab96cc8d36af36e76da9683741 |     
    arm      |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/5d10f4f545dccf126e3f5b5efce777a393c5e7bc |     
   x86_64    |         libxml2-2.10.3         | NOK | http://autobuild.buildroot.net/results/b0951dee3e361f7c2fddf7eeee4f8af777927b4b |     
    arm      |        lightning-2.2.0         | NOK | http://autobuild.buildroot.net/results/0aa8287d5532e22dfea6ab5eec4a2aa62d8d0164 |     
  powerpc    |          linux-6.1.9           | NOK | http://autobuild.buildroot.net/results/11775ee613a16a43bc36be0bbed756d9a90bf2f2 | ORPH
  sparc64    |          linux-6.1.9           | NOK | http://autobuild.buildroot.net/results/534eb3040b441ed38f4f82b70bb1e87549ebca8f | ORPH
   s390x     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/5f5a916926b48c86930f11a242e1cbf3db534a07 | ORPH
   s390x     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/d7765d9ad1464219a8b70320a7dc57138e0095da | ORPH
    or1k     |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/aac3bfda6f66138f323aa12cff7255b574b09401 |     
   sparc     |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/4319f76904a16c1f582b2e70a3c474751c8d0b7a | ORPH
   nios2     |        memcached-1.6.17        | NOK | http://autobuild.buildroot.net/results/3d815f9b5aa0e16e236a9ccc7aa499972898d0f3 | ORPH
 aarch64_be  |           mutt-2.2.9           | NOK | http://autobuild.buildroot.net/results/36ee198d52b0d2a8bb312dbe1c380c68fc1747fb |     
   mipsel    |           mutt-2.2.9           | NOK | http://autobuild.buildroot.net/results/5c2c0cc1f05b78711f9e1302e53006877472b0b9 |     
    arm      |     mxs-bootlets-10.12.01      | NOK | http://autobuild.buildroot.net/results/55fcaec0c76803ea6dff8837759fbc9d7ef6546b | ORPH
powerpc64le  |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/46247fa9bb7d2c4c892108ee592799fcfc9973d5 |     
    i586     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/7053ad04604025705c600e4e3b2e942685525067 |     
   sparc     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/fd3de7e92aa720b23b9c63c10cf1697c3fb20eec |     
 microblaze  |           nmap-7.92            | NOK | http://autobuild.buildroot.net/results/277445f4d853fa7722825606b1d39955ae5a2af8 | ORPH
  mips64el   |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/2fc49abf94b0839b404bd8f9e836ef8c8f190f7d | ORPH
    m68k     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/197fa060a37fdccc7d9d0fce118241d1521a9134 | ORPH
 microblaze  |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/b05428a2ad37209fc7d5f7fa454e855377f9c205 | ORPH
    arc      |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/b6fc49fa6b4b4871a81927e0d1c14217975b7153 | ORPH
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/d3f52736036da8479e68eb103a06736fb6c02401 | ORPH
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/58d5d48ce3c0b757bf279c49f07abbc3e9249ae1 | ORPH
    mips     |      optee-client-3.19.0       | NOK | http://autobuild.buildroot.net/results/041a6155e19821f1854a236ed02eeba9508b0ce7 |     
   sparc     |          pcre2-10.42           | NOK | http://autobuild.buildroot.net/results/b39433c8b79a1558012e70bbe945fa964cd60d3a | ORPH
    arc      |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/976c58e57ae7b62a75e2e1a4ca416ee62981583f |     
  powerpc    |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/5d79c8eafa27da6f9a7d859aec4fd3f44be0b082 |     
   x86_64    |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/8a9b18c294f8a9746ba3607fa80819e38e00e108 |     
   arceb     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/9804902e4be6c88b31f6a59f64cd4d7a3252f44d |     
   sparc     |          poco-1.12.2           | NOK | http://autobuild.buildroot.net/results/9c38d7ce68cf3c0b9bb9ef9d127077455e749d73 |     
   mipsel    |      proxychains-ng-4.16       | NOK | http://autobuild.buildroot.net/results/672901916e4995e193e297d03424864a095c52d8 | ORPH
powerpc64le  |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/036f2127fa64e77744be477d1827e1c9d7dbe6db |     
powerpc64le  |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/3d574b2309e9c7981db96f0818174532eec2a90a |     
  sparc64    |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/b7bf6fb3151aff80de8de25a21f20261a3e5256c |     
 powerpc64   |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/533be5ad4fab94f521429049e786c81a83a8b572 |     
powerpc64le  |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/65c3f73afbffac3ae16acba68c8df1c5d693cc7b |     
  sparc64    |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/b3a46f9ffc713de4a677000c5f7c0ebcd19a736e |     
   x86_64    |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/b6806b1c39884694061890bc7f8cc79b14d85c32 |     
powerpc64le  |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/9f800ad388fdd0a7ec0b0b653cae52bc5c4dae64 |     
  aarch64    |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/e568f377fdffb251b897d4dc3fa70a024db2427e |     
    or1k     |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/229fa204bcb8027967b16bd29ecff5490b3f3db1 |     
   nios2     |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/a58694b07fae29e1ebcddd35a399b088380b91f1 |     
   sh4aeb    |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/0a396a4a14ba94554c820b26d94cf61dfdbd26f9 |     
 powerpc64   |   python-cryptography-39.0.0   | NOK | http://autobuild.buildroot.net/results/83cc6929c4cb1fded11080ef8562b13cdae1af7a |     
  aarch64    |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/2acefb965595b9d6d723d526fecc6d190486aee6 |     
   mipsel    |       python-rtoml-0.8.0       | NOK | http://autobuild.buildroot.net/results/d89fd438bc2e4470625dd91b8f6ed293a54b70c8 |     
  aarch64    | ripgrep-af6b6c543b224d348a8... | NOK | http://autobuild.buildroot.net/results/fd94875341f303d1866c94f81f12bee389082f42 |     
  sparc64    | ripgrep-af6b6c543b224d348a8... | NOK | http://autobuild.buildroot.net/results/527a425d59bc6dff8e6fdde19b462391adf2730f |     
   x86_64    | rtl8812au-aircrack-ng-e7a4a... | NOK | http://autobuild.buildroot.net/results/97048c28cc552dec8998bb0c01e3cab3385a2c92 |     
 microblaze  |   s6-portable-utils-2.2.5.0    | NOK | http://autobuild.buildroot.net/results/9df28c07baa1aa765d4a6ef653eaff697e8d3e07 |     
    sh4      |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/5c6707457d37cd6c577e8023bfe03d114a7b459c | ORPH
  sparc64    |       ssdp-responder-1.9       | NOK | http://autobuild.buildroot.net/results/7ee4ed26de7e45b52a9f6f36b839e578d2319247 |     
  sparc64    |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/f89989e5c9efd14485b91bcf155f2e3239e0284c | ORPH
    arc      | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/847c87574326c483be5188cefb9c67162ccbf5b6 |     
   sparc     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/59b42564f8667709a51977e94431116a3bfc706d |     
  aarch64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/1d3f689619b16847dba347c28ad3200857da243c |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/c98a2274329195f774e0144cd8dd40b81deb8ba0 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/9acac14d1d43dbbc9501b2e7bf4324fca548843a |     
   sh4aeb    |            unknown             | NOK | http://autobuild.buildroot.net/results/9287ba8b025305e42bcb2692ac5fb59068f8ee18 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/ab391e9b79ea2baeafeef6e5262b9b214a21800c |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/22e7fd4d4098c0c63aac3b92c1461cb62c65ed78 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/57d8f365629e62d39ed8b1764090dce66d1eb9df |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/e02a11a1e713afd11eae5276eb546471803201a7 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/2982e751d5d2d9c93b2f4cddea1c575251531ef3 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/2d728342ca41acb4d743ce17486c4f9af3d32402 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/6f05fbd6f0cb200d32ef5763494139c97a9f7652 |     
   mips64    | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/54648c2bcc26f718718e7e20636bb548acbbf494 | ORPH
   mipsel    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/c7304dd6eb59109f8f41c9b606fcc3b8b8f6fc2c | ORPH
  riscv32    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/f056ebe7749a69994afba39a9d4967e2774c45ea |     
    arm      |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/502a2b217845eb290c1961d4740b032462f8ae53 |     
   armeb     |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/ee6c07791e5d3b4c57ca95f80955230acee9c28f |     
 microblaze  |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/f998d56bb2d53485a42e6057c12269db66e64ba5 | ORPH
 aarch64_be  |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/6e01e37b119a4f3028f30cf272396a990f708e29 | ORPH
    or1k     |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/69782b4ea44d07f609eebc2c06722af6eb14875a | ORPH
   mips64    |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/21f72b10b6f73c61b21893ef70e57c5620517413 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/40c2a03577a636eaee88bc83f2bbd4aa51df30f5 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/cd0e0437687df3e85406f4a50920255fa455de16 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/e5e25a80af3bc3379b2b5617f8d30809c04dbed9 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/24ede07b2b76ec410577fb3283a43047249e4b01 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/a10f968a008db7e418ea69e88340b7e4553c231c | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/cc05989189df98062c9a85b27908b350046bbfee | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/6db78e1e6f11009aec56f1a8a0322fccced63d12 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/9f4bc1004300719f70b86b97050cd125ec2337c1 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/38cacd3dab56c2a592b6d7a549bf3fad50a30f8f | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/d148aaec2a524293804e5b6efd6ad871e8c7ba10 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/b79b12de21b0a210477aa0eb89cbffd436418c0e | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/6a974ddc6a7c7d51d0e129da0e54dcc594fbb471 | ORPH
  aarch64    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/8d7b5dad6cd6fdc47f5f069e18e5d7b61f9eb354 |     
   mips64    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/09060bb361fe1fcb1d6c7bfabc33eeb9fa919815 |     


Classification of failures by reason for 2022.11.x
--------------------------------------------------

                       unknown | 2 
                     frr-8.3.1 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
            host-binutils-2.39 | 1 
       host-gcc-initial-12.2.0 | 1 
              libgcrypt-1.10.1 | 1 
                   libnss-3.84 | 1 
             libopenssl-1.1.1q | 1 
                  linux-6.0.19 | 1 
             lirc-tools-0.10.2 | 1 
                    musl-1.2.3 | 1 
                     pv-1.6.20 | 1 
           python-numpy-1.23.4 | 1 
                  xxhash-0.8.1 | 1 
                      xz-5.2.7 | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/9c9b65fb8c632fbae9e5ce1b34ace456d109497a |     
   nios2     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/6b0d121aaae138ff12408befa1bd0c5a7e9776bc |     
   mipsel    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/93fd9ddf666c4ef310504298c42396457c7a2760 |     
    arm      |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/32690752960ca774bed32eaf3ed18d442a05e589 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/760fc6371456dc3a7f3566ca182144e5bda6c26e | ORPH
    sh4a     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/43fad5f946728c4fe04a35bcc639390f20fc5ed6 |     
   s390x     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/77fc3cedeefa47c0ef29a45dee89c6ba0fad282d |     
    mips     |          linux-6.0.19          | NOK | http://autobuild.buildroot.net/results/822c8c731770d8e02f2ebfaed10b57166e72a0fe | ORPH
    mips     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/56bfa82a80b92ea293ea33bf109ac7e58bb4599d | ORPH
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/e7adb7e9f40befb38878e3dff4226f13101a30e5 |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/998e74b401ae0ad369eb1e951ff083a8d5a3fcb3 | ORPH
   armeb     |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/55ea4b3bedabd0565f458e55710fea1e551eb36f |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/12867e5d4afb9e978908a2085219eb712e95db8d |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/a41fd4768291465566fa6a0be3a356815f7649fc |     
    arm      |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/7b439ce04b31781892688ab13eb642f0e94944dc | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/749e3053478c1b7ff18f536deb368cf920c58736 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

