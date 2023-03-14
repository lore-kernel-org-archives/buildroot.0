Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0770C6FD1C
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 06:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14D04606AA;
	Tue, 14 Mar 2023 06:38:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14D04606AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9aIad8k73KbJ; Tue, 14 Mar 2023 06:38:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A0B4606BF;
	Tue, 14 Mar 2023 06:38:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A0B4606BF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 461C51BF2FC
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 06:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E2A1400D7
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 06:38:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E2A1400D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aajD-lEkZIKA for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 06:38:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 074744031E
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 074744031E
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 06:38:06 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2AAC3FF805
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 06:38:04 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 14 Mar 2023 06:38:04 -0000
Message-Id: <20230314063810.1E2A1400D7@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1678775884; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pWHN7bUq4hs6IdyMfOjtOajmU83QmYo31g3sPx4k98I=;
 b=ENdZOqFoEukie7pW0P+u/4JjYD+1g+v/ijaOLNkPW8dAALyK/yXNv7nzEaTlueU6VTvs2Z
 2KoETTfkPAk0iWLxLU7VjE7riwK6VenzI05JKWWu4WLvIYCRZHjcdkO2Vsu0BSkZbrTJe0
 RXoXBYWN2k1VOhmdzE3nxD3DM8LkEaAnIUCld8Y+KEm4V5+/bGX5OFpV1X9XOsePp+0D3s
 b12ZJhMrQYsByIYfiyztsjj/eYxy8gE9taU+9MAOqzN199/abrbpb1D/FZjCcFSHgluJEp
 KlxjBOa4QM8ig4cIZ9mOYRqA++mrHIzXSJcmYyTTmPyCq4kWc3WXOnOd2zjwRw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ENdZOqFo
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-03-13
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

Autobuild statistics for 2023-03-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.11.x  | 12  |  8  |  0  | 20  |
    master   | 207 | 219 |  1  | 427 |

Classification of failures by reason for master
-----------------------------------------------

             bluez5_utils-5.66 | 34
  gobject-introspection-1.72.0 | 13
                       unknown | 13
package/lzop/lzop.mk:29: lz... | 10
                  linux-6.1.14 | 9 
package/harfbuzz/harfbuzz.m... | 8 
package/lzop/lzop.mk:30: ho... | 8 
glibc-2.36-81-g4f4d7a13edfd... | 6 
            host-binutils-2.38 | 6 
                host-go-1.19.7 | 6 
                busybox-1.36.0 | 5 
               libglib2-2.72.3 | 5 
             containerd-1.6.16 | 4 
                elfutils-0.186 | 4 
              host-rust-1.67.1 | 4 
            quickjs-2021-03-27 | 4 
             fontconfig-2.13.1 | 3 
                  boost-1.80.0 | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
              host-rust-1.67.0 | 2 
          linux-5.10.162-cip24 | 2 
     linux-5.10.162-cip24-rt10 | 2 
               mariadb-10.3.36 | 2 
                    musl-1.2.3 | 2 
                 openssh-9.1p1 | 2 
                 uclibc-1.0.42 | 2 
ulog-0389d243352255f6182326... | 2 
                 wolfssl-5.5.3 | 2 
                  acpid-2.0.34 | 1 
               apcupsd-3.14.14 | 1 
                  assimp-5.2.5 | 1 
        edk2-edk2-stable202208 | 1 
                  ffmpeg-4.4.3 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                   gvfs-1.48.1 | 1 
            host-binutils-2.39 | 1 
             host-delve-1.20.0 | 1 
         host-gcc-final-10.4.0 | 1 
                host-go-1.19.6 | 1 
     host-moby-buildkit-0.11.2 | 1 
                   json-c-0.16 | 1 
                  kexec-2.0.26 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
                    lcms2-2.14 | 1 
      libabseil-cpp-20220623.1 | 1 
               libcap-ng-0.8.3 | 1 
                 libnss-3.88.1 | 1 
               libvorbis-1.3.7 | 1 
               lighttpd-1.4.69 | 1 
                          mawk | 1 
                 mesa3d-23.0.0 | 1 
                    mpir-3.0.0 | 1 
                netdata-1.33.1 | 1 
                  ntp-4.2.8p15 | 1 
            ocf-linux-20171122 | 1 
                    ola-0.10.9 | 1 
                    olsr-0.9.8 | 1 
               openblas-0.3.21 | 1 
package/network-manager/net... | 1 
                   perl-5.36.0 | 1 
           python-bcrypt-4.0.1 | 1 
    python-cryptography-39.0.1 | 1 
           python-pyicu-2.10.2 | 1 
                 qt6base-6.4.2 | 1 
                  reaver-1.6.6 | 1 
rtl8812au-aircrack-ng-d9801... | 1 
              skalibs-2.12.0.1 | 1 
                tinifier-3.4.0 | 1 
              traceroute-2.1.0 | 1 
                   trinity-1.9 | 1 
               valgrind-3.19.0 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/ee5a57ef0b9cb6d094f1189b008b0f8fc2ca4dfb | ORPH
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/b783914a19f2a004caedcb2227d63cdb20d485eb |     
    mips     |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/00d7de04461f4f7ee84f1db266084af3b158379f | ORPH
 microblaze  |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/3819847846fdac2b607f75a4e5a6ecd8946d34a1 |     
   mipsel    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/95e37597ccce58d678fed6a9a1c0f23959145499 |     
   x86_64    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/73709fd83dbd770cf92bae45f20a899e48d6f034 |     
   nios2     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/266a7b4b6dcd84b8e2894972ae646660d4db1a6b |     
   x86_64    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/b63f2ed30947a878d06e77b69bee0d64a18d79db |     
microblazeel |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/ea3517ea88b05f37f37b5feaaf94356bdb1e3854 |     
  aarch64    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/76feaca891e59d6f89583a9bbd2d1ddcd2724332 |     
 powerpc64   |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/5a4b2f867f59df905cd8118db8502e8fd93bd058 |     
 aarch64_be  |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/8f18b4c62d1ab27a2b86b5e130c5cd0f5c3e2706 |     
    or1k     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/3530ea5c9645e00c3a678c8c4c2c490d88d3e438 |     
    or1k     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/c60eaaacb30880346a73941d8263b906786ee106 |     
 powerpc64   |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/451480a00bbe2fb2a0a0d4e6b80b6893ee432cb4 |     
microblazeel |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/ec41fe2e180b71029021783b1ad0cb5d0c91c0cd |     
    mips     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/8b42bd5725bf455cbdb7c63ab32936b7acb0b601 |     
    or1k     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/0809b004c932936b652449c7c02cc5e80266e9ec |     
   nios2     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/d08f33808f010ce93aa8415c7e59e761278309b5 |     
    m68k     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/75ab1e13035c95fdeb495019dc2ddfbb5251b756 |     
    or1k     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/93034f89757e3d38b2b744355163da12e0caca21 |     
   armeb     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/aa1f94add706365272a7876149d0d62c75e66cc0 |     
powerpc64le  |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/c11a18e47b1bffd60e4502e80c20a1c6c4792d74 |     
    i686     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/2d6a98d7417906c59cad77ab7707fa12c7762458 |     
   s390x     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/2977616113ce16b58da74cfa76fbd41fd0d2f4a3 |     
   nios2     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/916a9a0698385d5c44595aa23f11c58a854fcf7d |     
 powerpc64   |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/4df17ac43aaf0b31512c60c06a892d49ba7e13cd |     
   mipsel    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/74b1037263741e9cad32ef3140fe9ab627f03162 |     
    arm      |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/563879d0df6f864cc3d6e05f7b564a7f22cd7d37 |     
   mips64    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/691a2af4e0a57db94d955332a73b187fda66f3be |     
 powerpc64   |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/ad440da458be9a6aed85b478a6b92e161c79aa0c |     
  sparc64    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/3797e8f891cc3551b4d2f56c36d6533a7ec79f6d |     
 powerpc64   |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/61a03b5d6c39e6e6e2c63982eed8428ec6da7515 |     
   sh4aeb    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/e5db64f5b94fbd5daf7c1dfb123652e62fc4e925 |     
    or1k     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/3f0e41572835d074d93d7a8fa1e28d0ca60cd2ad |     
powerpc64le  |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/4609b5bd9f35e0cee4339922b0d4fcb06dc25eff |     
   armeb     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/8b885abe0ae094b3102dd0a949b71c69c4b6075e |     
    arc      |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/ddeea1126ad7da85d546c8cb9f0f5c2029f57124 |     
    arc      |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/08c31a0cb8624963948a104ee496ef9050f08723 |     
   mipsel    |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/55f5acfb201c41a0401d154196982052a742c9e4 | ORPH
    arm      |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/1fa5fc0fa6a24df1018953eb983eb1ff7d444a37 | ORPH
    mips     |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/823613318d7891132e5d8b2f6a5c4a409b33a876 | ORPH
  mips64el   |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/b25f0f950b5f139e9a8951e2a65d028c24a7a50a | ORPH
  mips64el   |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/5e0c84907daf04e26aef0b00d789e8ac214fa3cf | ORPH
powerpc64le  |       containerd-1.6.16        | NOK | http://autobuild.buildroot.net/results/d9161b366322cf9d07f209b6d187389d44d220df |     
  aarch64    |       containerd-1.6.16        | NOK | http://autobuild.buildroot.net/results/552fbfe340e541e8654a95eb3d46a2371cbb01e3 |     
   x86_64    |       containerd-1.6.16        | NOK | http://autobuild.buildroot.net/results/0daf5318945591d0e89b9ef1931d37497ce9d272 |     
    i686     |       containerd-1.6.16        | NOK | http://autobuild.buildroot.net/results/fb9e90f376ddaa024e255b19a652fe07de2a72ce |     
   x86_64    |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/2b3ea348f500414877fbd5fa25e7ced5e9bedd37 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/c032438514281b92e52fa27399688cea54c48d11 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/9b5134f4225612fcf56ee3ccd7a056dea0adb028 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/1ba9443a3748754f8fa1f25e2df91382ea1bec03 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/a05ab6d8c6317fafd760cd88ed16a2653854104a | ORPH
   armeb     |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/372c586fe326d6c12d47cafa25b2aeebf969ff6f |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/7a7f60dac7c0073238bd823d28e34ad6ae00a3ff | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/31a7341b3cf53e6983692931ce1fbf62214aa073 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/2ae8e6854bd267f5e610e75c2435f58cd6d7fbe2 | ORPH
   x86_64    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/4129246ee262316e44706c85b34bd94694ec31e3 |     
  powerpc    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/435257edbaa32f186ab9d6ea84037698dd4ec497 |     
   armeb     | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/8811cedcb048c4addb1df9dbae1b2d7712791079 |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/f7f908a5d0a119cff0bb798ca4704d2b03f9a316 |     
   arceb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/7db9c3b4c1b03d2996c8883c821ef71bb3dd8f40 |     
    mips     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/16bc043d81b9b835fd00c1c4595f82a21bd6a564 |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/89cb13334b34b5538d47827a290d319bdeb5eaea |     
    or1k     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/1d99a2ae013308c9e1e42453e7beaaedd4ccfdf1 |     
    arm      | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/84cd6e59e8cf9f4975fcef0d1ccf839b1d9ed3d3 |     
  mips64el   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/da50a4488f9af89a5d2f9e3e558bc39a4941df7a |     
   sh4aeb    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/8cf4cce7dbc4d146d2545c77ed6cacc993351742 |     
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/c536adc4c7687a0d1d21bb3d6e308462d7d13941 |     
    arm      | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/98c8aeb9ff1059acf284c7394427cf08482e3628 |     
   sparc     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/826df8e89629cad785efc45726b31db6974dea50 |     
   sparc     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/6925163f7b0b97ac46b3ca96edb2c129726972fc |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/3f3197f613e92e754db8ffafc2acafabd20df256 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/0d5328ea0c4070ca698437d67712ba5ca26f5e40 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/ab0ef9bbcae9667a6007850714514c325d1660d8 |     
   arceb     | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/e8f5ab0abc33152bff155dac0985dd1e2dc6413f |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/b6c5eeab4c49c5ae1138bb4f86ec9663ac547995 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/62053fae18a01e6a4ab5fd51ac86dd2d0c441142 |     
  powerpc    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/179e3cd8c045717c40b840dcf4d46dc11b762147 | ORPH
 microblaze  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/b1b1ac79d472c9ea77b44b448e8cad585eaee778 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/a3f9fca3ac0da061260286b48877f9d54db03d26 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/9157c053a47043e063a9742716f0419b3cc921f8 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/2351e3ad3baf2a83629102e2d25b4a5fd0ccb0e6 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/c64f9f63d678d8bb76f2461f61a337510b508bec | ORPH
 microblaze  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/12f412a4f036f5480b19ec498b318ef784f0b42f | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/6141bfdc70d10942bcf6252d787caa4e861a133e | ORPH
   mipsel    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/ade4a859ca560d8769191fbea0d3683b8d90fc4a | ORPH
microblazeel |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/1b599462d37fb4d6d42cf7b83d827077efadc6b9 | ORPH
microblazeel |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/a72b7d31456f9193d28b1c2852899ea86248604b | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/fda5d3d0297ea561b82a05139fdb0f781b18832f | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/51859306527a4293b71b4ad1fa6c83c27fbae075 | ORPH
  sparc64    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/43d264d076ac7dcc74b13542dabc2d852241f71c | ORPH
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/27563518bcaaf4f37baa33272fb3e01bb17bd251 |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/39cc90f49e8ebbfbf00970fff4a9af497113aa18 |     
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/54a00b2c2dfc6d7c6a66236f1f9ab3c3c1eb4ad1 |     
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/9ad33d2f19d3087f1ee99a96992f495ba56e6b60 |     
    mips     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/553e1e83655e93f0c3616b66920746112574c2ab |     
  aarch64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/45555435efd0641d414bb0ec560567a0b3146a2b |     
    or1k     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/d959dc161c65dc4716923cf69a3b9a274599052b |     
  riscv64    |       host-delve-1.20.0        | NOK | http://autobuild.buildroot.net/results/4ca539e59b3622904cfe1fd04c458b2626794c77 |     
microblazeel |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/6da6968660f5b8f9af6568aaa75319e56eded533 |     
    i586     |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/8506aedbe7aa3b13acfedc76e679c80816a293e5 |     
    i686     |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/7a7e07125bf9b0aabf21ee7e730b5bfaa4543f47 |     
    i686     |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/c4144bee4bf09339bec760cf3584b8028635a6a2 |     
powerpc64le  |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/6d3dd6d315517dfa14343bb9ec9a7587af5c1f4b |     
    i686     |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/bbe5009f77deb5fc011a2a9162ff407e088d0007 |     
   mips64    |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/fe4e3b8c1fc6158a44c64bcbe805b9a7adb7d37b |     
  mips64el   |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/0f10c91b18cecb032b605cec459b80c485bc298d |     
  riscv64    |   host-moby-buildkit-0.11.2    | NOK | http://autobuild.buildroot.net/results/8ea2c3a937ab464c6f5ea137f00d7a760d3f0732 |     
   x86_64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/49b80ca58965abdc7b853b15569d3ccdc399ebbf |     
   x86_64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/62b7868434eefa47661c3f6f460829f702c81e37 |     
   x86_64    |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/6a1f8eda8ee7709c53e529b761288df79da820c8 |     
  aarch64    |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/c83c1aa077abdde07eaad15fba99d509eb5bf840 |     
    mips     |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/37d86697eae84bc3516f7be1955283b87eafb4ac |     
powerpc64le  |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/131a143ad344e6e33809827b1a0fde768420f9f1 |     
    or1k     |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/3dbf001205465c2e7e76909540ee19db789b88b2 |     
   armeb     |          kexec-2.0.26          | NOK | http://autobuild.buildroot.net/results/459d671de9e88f4b0d09a74ffeffd3f8a7971561 |     
   x86_64    | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/6b48d20e3bb193fc83a8e9c6817e34347a0a6e31 | ORPH
  powerpc    |           lcms2-2.14           | NOK | http://autobuild.buildroot.net/results/46dff99e049e904565e4dcd6d606097d758e9432 |     
powerpc64le  |    libabseil-cpp-20220623.1    | NOK | http://autobuild.buildroot.net/results/02c03bd169441d6a731caebdc2f79e1c7029ac69 |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/1c44da5085afd67c6699838586a49e38104a79b5 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/a4cf953b58bb59ffff606489059f436635273627 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/b5a33b66d68f315e7b600cff54b666ba10996719 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/b0473bd9ddd30260464ee1a5a49740854da4e255 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/558c755f7e4ea326efd444ba239039753742f90c |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/a4a86ab5f860738885463a2038d2c2cd028edaa8 |     
   x86_64    |         libnss-3.88.1          | NOK | http://autobuild.buildroot.net/results/2dc85f4a4e9e1712c641312d25a1871d7d53ae1e |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/dacb4b3d43d8446dcce09aa3707ca043aca3b4a1 |     
   arceb     |        lighttpd-1.4.69         | NOK | http://autobuild.buildroot.net/results/9f674166b3c16e0297fca21a83388b6f8ed7aa58 | ORPH
   nios2     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/0646f2614fbcb5b5338200b3489b2f6622031f9c | ORPH
   mipsel    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/61a9e3acc7770e2a14f90d678851671c4bb15a2a | ORPH
  powerpc    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/7f7dadc2589c271cd3cd43d83d3879790d8e2306 | ORPH
    arc      |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/caf42b7b46cebb7cc6d591804103362b150af526 | ORPH
    sh4a     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/a11884718c1bcf5b12a66e08d162ebd0d6e7a060 | ORPH
   mips64    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/f97dea86787bb5e9f12ec2939927c794e7d2d3e8 | ORPH
   armeb     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/e4356839194b79424c3ecd93e4ad4e9e3fbd9bb0 | ORPH
  mips64el   |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/663cb0e2012987d252e267a858d8f7653caabfba | ORPH
   mips64    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/f2e26df716c01b88c7dba8af8d3ce440b986b2a3 | ORPH
   nios2     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/65dcd89d7df76cdf44698948190959d7a70c1432 | ORPH
    mips     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/94fa0ba01fe4254217b3fdc5afa6d7658fdebd88 | ORPH
   mips64    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/9312f968abda863d035a23c043bac02a48db773a | ORPH
   nios2     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/ca5a0f89e006897d3be36f19758fdbddbdba50fe | ORPH
   sparc     |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/7c9b7bfef73649f17a574fe81bc85ec7b4ac2770 | ORPH
   sparc     |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/4b726be2c54489ac0d4a88f997d2c807ee214617 | ORPH
    m68k     |              mawk              | TIM | http://autobuild.buildroot.net/results/5bcace9d7c7ebdcb4d2a20ce4199a6f1098803c7 |     
   mips64    |         mesa3d-23.0.0          | NOK | http://autobuild.buildroot.net/results/956546334f10d96db6a78429bdc0f103d1087476 |     
   armeb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/5586578672657e9a662f6549512f5f0ee05d0987 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/6033c5fa9e70eb1557b23d4f703bed129127f49c |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/4e351a98ec56c68c38f12e6880456f9141a6289a |     
    or1k     |         netdata-1.33.1         | NOK | http://autobuild.buildroot.net/results/5a948fc5396cf64b4b09b4d8b7bf03fa18c0a66a |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/aeb6e9d8ea4744024e4623e09550731dcf749e64 | ORPH
  aarch64    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/5ccbbe8197f9701e9b6eb7af6fae5b75f3e7eeaf | ORPH
   sparc     |           ola-0.10.9           | NOK | http://autobuild.buildroot.net/results/1184e2112415672530c220d012f84524c436944e |     
   arceb     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/0b79689af84289f7cece117600bbb8db296fae17 | ORPH
    i686     |        openblas-0.3.21         | NOK | http://autobuild.buildroot.net/results/f49a10c442f06c3282e788d29da03805d2eddb34 | ORPH
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/448d7ba55b1da767ad0c99342c5a77990c2f0937 | ORPH
  sparc64    |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/501fec4dc89d62b3b5d855856b917a6c9584df12 | ORPH
   mipsel    | package/harfbuzz/harfbuzz.m... | NOK | http://autobuild.buildroot.net/results/0b148bc1534e552d13b05a33667b37e43cce46c6 |     
  sparc64    | package/harfbuzz/harfbuzz.m... | NOK | http://autobuild.buildroot.net/results/78f4e8661bda2bf11c86ffd447f919d763ba2722 |     
 aarch64_be  | package/harfbuzz/harfbuzz.m... | NOK | http://autobuild.buildroot.net/results/2cbd9a781b7f21fd1527c5db25fcda98bb239e58 |     
 microblaze  | package/harfbuzz/harfbuzz.m... | NOK | http://autobuild.buildroot.net/results/b9ff4b1c1f76881c8e93480ebd86609143d5df84 |     
  powerpc    | package/harfbuzz/harfbuzz.m... | NOK | http://autobuild.buildroot.net/results/70ab1a0f2703818be2748281d120fc9a153284e1 |     
 aarch64_be  | package/harfbuzz/harfbuzz.m... | NOK | http://autobuild.buildroot.net/results/bcac23f7c755619c6255feace8f9311d6bb6ec3f |     
  aarch64    | package/harfbuzz/harfbuzz.m... | NOK | http://autobuild.buildroot.net/results/a16702bd3f7cf8b8e2d99685ec3b67ba6705da7b |     
microblazeel | package/harfbuzz/harfbuzz.m... | NOK | http://autobuild.buildroot.net/results/0d93b20995c2bfd2236d820a35e5eae9de76f00e |     
   sparc     | package/lzop/lzop.mk:29: lz... | NOK | http://autobuild.buildroot.net/results/6df7a5efff2375b5f9fcb627654b4e370283f0ac |     
  sparc64    | package/lzop/lzop.mk:29: lz... | NOK | http://autobuild.buildroot.net/results/0cdf516e65c27d6925f7ccb9e12c9e18a5277917 |     
  riscv32    | package/lzop/lzop.mk:29: lz... | NOK | http://autobuild.buildroot.net/results/8da6183339aac15c8d6c6618aa77eb786dc1924c |     
   xtensa    | package/lzop/lzop.mk:29: lz... | NOK | http://autobuild.buildroot.net/results/8e01d1c92337bf0d6689738eff96a94e7705415b |     
   s390x     | package/lzop/lzop.mk:29: lz... | NOK | http://autobuild.buildroot.net/results/5ee67b8cd01cd7c12eb8d8cec68a3b726780de6e |     
   x86_64    | package/lzop/lzop.mk:29: lz... | NOK | http://autobuild.buildroot.net/results/a808fa435aff35e94caf61601cdab7ed1afcab3c |     
 microblaze  | package/lzop/lzop.mk:29: lz... | NOK | http://autobuild.buildroot.net/results/9d9cd82a066c1f9bdb601ab7c8de1164c5cdc315 |     
powerpc64le  | package/lzop/lzop.mk:29: lz... | NOK | http://autobuild.buildroot.net/results/03782503846128d168c740de511facab6d1c5021 |     
   x86_64    | package/lzop/lzop.mk:29: lz... | NOK | http://autobuild.buildroot.net/results/4ec831fae54ba3963b7cfe7c6294b747ad0b1f87 |     
   armeb     | package/lzop/lzop.mk:29: lz... | NOK | http://autobuild.buildroot.net/results/09affa23e808e9c891df39d48ff3d4ed844d1b82 |     
  mips64el   | package/lzop/lzop.mk:30: ho... | NOK | http://autobuild.buildroot.net/results/7b9b68c2ca48ffc05f6f3293234db65c0ad16671 |     
   armeb     | package/lzop/lzop.mk:30: ho... | NOK | http://autobuild.buildroot.net/results/590cbc3cb0630d0818f39ab8542c8e099c61266e |     
    sh4a     | package/lzop/lzop.mk:30: ho... | NOK | http://autobuild.buildroot.net/results/c89f80f56d5bb1a77d115155da198f3da6b4d499 |     
  riscv32    | package/lzop/lzop.mk:30: ho... | NOK | http://autobuild.buildroot.net/results/e5c32637fe0562360beabf4b311ef6324d570777 |     
 microblaze  | package/lzop/lzop.mk:30: ho... | NOK | http://autobuild.buildroot.net/results/5312733677222fda595c6579fa1f01983d4b1029 |     
    arc      | package/lzop/lzop.mk:30: ho... | NOK | http://autobuild.buildroot.net/results/c8ab973077067b2aa57e4f3ab51bd41ca1543d6f |     
  riscv64    | package/lzop/lzop.mk:30: ho... | NOK | http://autobuild.buildroot.net/results/17423f780410b512abff3cc52e6f4493632cf557 |     
    m68k     | package/lzop/lzop.mk:30: ho... | NOK | http://autobuild.buildroot.net/results/f538154daf7324838e171d50957b6aeb54d1f7f3 |     
    sh4a     | package/network-manager/net... | NOK | http://autobuild.buildroot.net/results/bbd0db06663b6df82973173bb044b57f013e844b |     
 aarch64_be  |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/8257083a3a71f2b6e5f6b2ee9cbd6d623a76b359 |     
   armeb     |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/9a6068ecf50b5ef7a9b91fddb758d6c2493fc3f3 |     
   armeb     |   python-cryptography-39.0.1   | NOK | http://autobuild.buildroot.net/results/4ed02c40b3cf8c62245c02b96f0ffa5f4f5844e8 |     
 aarch64_be  |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/f4d678837a05fd2b3910c90d2f8f231134c705cb |     
   x86_64    |         qt6base-6.4.2          | NOK | http://autobuild.buildroot.net/results/60c9f70d8fea24e737f2440fdbf01e458cf6c4e2 |     
 microblaze  |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/c937f984cffc31f2a8d46d1d9648c08f122c6f75 |     
   sh4aeb    |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/be43e26a71a935fa089c6c3376cce8f167095418 |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/585a5013854582f4029d8ac641b3d6051c9377d9 |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/f2021c5d0101d39bee949b8a6e97f2a7bcf86310 |     
    arc      |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/b478d2e235ae7ee079e3bc5eb5f10c754bc8975d |     
 powerpc64   | rtl8812au-aircrack-ng-d9801... | NOK | http://autobuild.buildroot.net/results/8c51009fa32947b2c1cda8f9862507df8da126db |     
    or1k     |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/3f13021c67e083d0250c014d3f88f5d97df91279 |     
    i586     |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.net/results/216971ffb0d68047ebadaf1b25b8b6712418ba29 |     
   mipsel    |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/a82363c01e04f6b295bd42142135649e1e21aafd |     
   x86_64    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/57bbf9c37478e4b6cf5a8ab76c74aed159f1ed15 | ORPH
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/114247be9c1f04a3c51fb84c1cb2d3a27b34ac07 |     
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/09a84ad9ff8b6b1d2bcb4ccf1955d48b1dacc18e |     
    i586     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/0162edd6ee29fdb36bcd46b72b2ff8fadd5f05d1 |     
   nios2     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/dd8d826007f65ff77fdff1cd76ea8e92cf41b27f |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/ad0e9fbc7908b1ecd5d0026a5e2d8245f0bac820 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/5e44f8a402a22be32a69af9859fe2305004044b3 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/e2008e27b029b015f357fcb629fed52ca87209c0 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/513ed26245f6bf6fdf8918c1a056f1ea9df92e79 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/583f4384a26b326462df2a0ec963cfe014b0b3df |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/5c53bee148649865f6ff5c86338eacbd45091638 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/45c06261dc48a3db6873cfd3f480cad533a3635b |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/77d9cebc5c002a5009a22aea1a11b3590cd57863 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/f4a822792901fd9ab13544b36cffee2083f75309 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/c16db163f1b9eb5c4d8130fdb4da8cfaa0ec2057 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/b7d1e505a96c8a6944d946e86715e3d1b92db265 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/faa87003a05be20a12c166a78da335e7eedc892f |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/0535727ea3b8e2b75b0c4ea787992a995f4cbaba |     
    mips     |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/c8c875256577e2232ca270d9920c5094f429d031 | ORPH
  mips64el   |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/e034a1951831df07b3a29f99898b00a6e028e7c6 |     
   mipsel    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/aaabf7fc357d00c6a26dc3175eb25afc6425c5a0 |     
powerpc64le  |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/f814256a4cf27a93b36e17cba6228b17554bc29e |     


Classification of failures by reason for 2022.11.x
--------------------------------------------------

              host-rust-1.64.0 | 2 
              host-pahole-1.24 | 1 
               libglib2-2.72.3 | 1 
                  linux-6.0.19 | 1 
                  ntp-4.2.8p15 | 1 
                     tmux-3.1c | 1 
                xenomai-3.0.10 | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/a51f55f7156b82b718e4ceb71ddb55c5fd1dd48e |     
    i686     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/8351d9c3131dbaecc815d52b8d24c637b5baf688 |     
   s390x     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/9a7b36fe94e9f5d9f84bb1bea69546f3f3c74107 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/e68657f48253188ee8ae95a06405bff972f76c69 |     
    arm      |          linux-6.0.19          | NOK | http://autobuild.buildroot.net/results/0865493ef10b18dff1a6528dd3df65ba794b87fc | ORPH
   sh4aeb    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/2c0eec7f76cb3d4801fb13fcf0d06e3f2b2e4781 | ORPH
  sparc64    |           tmux-3.1c            | NOK | http://autobuild.buildroot.net/results/9edbded93612afd80a90aceb65119dcd1f7f9103 |     
   mipsel    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/d6342db72eded5c33b1e731bb653a787d76f3ed0 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

