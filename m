Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7487C61DA4
	for <buildroot@archiver.kernel.org>; Sat, 18 Feb 2023 06:46:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F41E7417B9;
	Sat, 18 Feb 2023 06:46:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F41E7417B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PMHVaw0rcj0K; Sat, 18 Feb 2023 06:46:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AC9E417A7;
	Sat, 18 Feb 2023 06:46:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AC9E417A7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B817D1BF3D9
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 06:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 861BC60BA4
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 06:46:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 861BC60BA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id upaV1WyZObeL for <buildroot@lists.busybox.net>;
 Sat, 18 Feb 2023 06:45:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F141760B8D
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F141760B8D
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 06:45:56 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 33B9B20004
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 06:45:54 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 18 Feb 2023 06:45:54 -0000
Message-Id: <20230218064600.861BC60BA4@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1676702754; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2R+dGoUnF/9nhdzy8soksWo+xPhr7HgZHBJcBPesa9U=;
 b=j2oj+QsYRZMPdLks4ORabYyeadZbj3e66Uicw6DKCUsv1Z2PSZwVvqNLz2DchysQdkCymx
 NpCbyP8mT2946OW7NKaJsTlSkhpwbkoWnuHR1L6akthY738+hPR8JW0jFeu00Aea6xhBSb
 qPuto/YBzQdhBug716ZPtYQ1GUBo8d1N3gELo88copERcD47GW6gEC3H9TvfJhg5zXYl4V
 nLicsDmh2j3RuKkKvFIkQVDBG7Ima7Fk2rmwSouSNQwFiUvbcOhz+Bcf/oRhEld1oG7Xth
 EBWfy/b+ZCI9jxp0PQM8nmTtULZdCK6H8q8bVLcXXHR+Q0fktemjPcvMS0wXwg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=j2oj+QsY
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-02-17
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

Autobuild statistics for 2023-02-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.11.x  | 20  | 15  |  0  | 35  |
    master   | 153 | 170 |  2  | 325 |

Classification of failures by reason for master
-----------------------------------------------

                  gnupg2-2.4.0 | 13
                elfutils-0.186 | 8 
                  linux-6.1.11 | 8 
                       unknown | 7 
  gobject-introspection-1.72.0 | 6 
                host-go-1.19.6 | 5 
                  zabbix-6.2.7 | 5 
glibc-2.36-81-g4f4d7a13edfd... | 4 
            host-binutils-2.38 | 4 
                  netsurf-3.10 | 4 
         host-gcc-final-11.3.0 | 3 
         host-libarchive-3.6.2 | 3 
             libgpg-error-1.46 | 3 
         mxs-bootlets-10.12.01 | 3 
                    olsr-0.9.8 | 3 
           python-numpy-1.23.5 | 3 
                 systemd-252.4 | 3 
                busybox-1.36.0 | 2 
       freeradius-client-1.1.7 | 2 
              host-pahole-1.24 | 2 
              host-rust-1.67.0 | 2 
                   httping-2.5 | 2 
               libglib2-2.72.3 | 2 
        ltp-testsuite-20220930 | 2 
            ocf-linux-20171122 | 2 
   openvmtools-11.3.5-18557794 | 2 
                   perl-5.36.0 | 2 
                    qemu-7.2.0 | 2 
uqmi-0a19b5b77140465c29e2af... | 2 
                  acpid-2.0.34 | 1 
              asterisk-16.29.1 | 1 
        at91dataflashboot-1.05 | 1 
                   audit-3.0.7 | 1 
bayer2rgb-neon-15feb1115b48... | 1 
                  boost-1.80.0 | 1 
                 coremark-1.01 | 1 
                    crun-1.7.2 | 1 
                 dc3dd-7.2.641 | 1 
             docker-cli-23.0.0 | 1 
              dropbear-2022.83 | 1 
                 dtbocfg-0.0.9 | 1 
              erlang-22.3.4.22 | 1 
                     exim-4.96 | 1 
                 fdk-aac-2.0.2 | 1 
                        ffmpeg | 1 
                  ffmpeg-4.4.3 | 1 
              fluent-bit-2.0.9 | 1 
                     frr-8.4.2 | 1 
fs/btrfs/btrfs.mk:55: /tmp/... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
fs/romfs/romfs.mk:32: /home... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                gerbera-1.10.0 | 1 
                gnu-efi-3.0.15 | 1 
         gobject-introspection | 1 
                 gocryptfs-2.3 | 1 
                 highway-1.0.2 | 1 
         host-gcc-final-10.4.0 | 1 
           host-python3-3.11.1 | 1 
                   json-c-0.16 | 1 
                  kexec-2.0.25 | 1 
          libcamera-apps-1.1.1 | 1 
               libdeflate-1.15 | 1 
              libgcrypt-1.10.1 | 1 
               lightning-2.2.0 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
         multipath-tools-0.9.4 | 1 
                    musl-1.2.3 | 1 
          ncurses-6.3-20221224 | 1 
                  ntp-4.2.8p15 | 1 
               openblas-0.3.21 | 1 
                   p7zip-17.04 | 1 
                     php-8.2.2 | 1 
                 qt6base-6.4.2 | 1 
                rdma-core-44.0 | 1 
                 rtl_433-22.11 | 1 
                speechd-0.11.4 | 1 
              strongswan-5.9.8 | 1 
              traceroute-2.1.0 | 1 
                 uclibc-1.0.42 | 1 
                     vdr-2.6.3 | 1 
                 wolfssl-5.5.3 | 1 
                xenomai-3.0.10 | 1 
                  xerces-3.2.4 | 1 
    xfont_font-misc-misc-1.1.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/9d4bf10de3807a5323eec4c60a11bc43d3267084 | ORPH
powerpc64le  |        asterisk-16.29.1        | NOK | http://autobuild.buildroot.net/results/5c693aeb90f95ccb533b49166d577a399c3690d2 |     
    arm      |     at91dataflashboot-1.05     | NOK | http://autobuild.buildroot.net/results/1b614a4d41981b30d9f94f825f4f0bb30fb00b86 | ORPH
    arm      |          audit-3.0.7           | NOK | http://autobuild.buildroot.net/results/d332170f58f690df76d5cb8444f5ec2ec144f230 |     
  aarch64    | bayer2rgb-neon-15feb1115b48... | NOK | http://autobuild.buildroot.net/results/07e18d37e72acdaffcc36fc100f3d5275d2fb95a |     
    arc      |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/82425aff829ec7510ba2d7cf8216c8a865bf1d10 |     
   mipsel    |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/3c7376c24572431d90de0ac7296e303eb47f05e8 | ORPH
    mips     |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/1061ff5b2a5b4a688d16be790a508a91600caae2 | ORPH
   sh4eb     |         coremark-1.01          | NOK | http://autobuild.buildroot.net/results/f19fe9f2dfef11193e9113453452e58b835b9afd |     
   x86_64    |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/4472510f03772900b4cce1210c3cb3f127bdf170 |     
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/60b54c59ce5a046f88b246abee6c6b46dfa5ec41 | ORPH
   x86_64    |       docker-cli-23.0.0        | NOK | http://autobuild.buildroot.net/results/a456e83eafb08f7bead53948fb6e1ee9baa9b00b |     
  riscv64    |        dropbear-2022.83        | NOK | http://autobuild.buildroot.net/results/dd611960536f3d687a09df4a5026f0b297780a2b |     
   mips64    |         dtbocfg-0.0.9          | NOK | http://autobuild.buildroot.net/results/100ec330477ec3d5c5e9c513b3027fe8b05510ea |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/fae5fcff55318441ab0ecc38d0b950917a8070ea | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/8af49fa8c9e52e17b92208d0504eafbf95628807 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/50b4479971eb1fedb62719e23e0deb4bfe25b871 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/15dbaa7dd7d8c182cea81fbc8ffe7b8e6dbed62a | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/341b81bafeaf82a45bd2f5cc29a02e7c6182b78c | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/cd4123b6cf875fb799cc6430df916960940ec606 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/4db21cbb4b074ce650a86ecf1716b8c27f0b3608 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/b4e329ba6168f7955040933b22a085b13e61dacc | ORPH
   x86_64    |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/90f7365d8477d35fca452b7b3f38babba086375e |     
   armeb     |           exim-4.96            | NOK | http://autobuild.buildroot.net/results/5878e316b505a986e0c8484df242b932f7340051 |     
   mips64    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/1e7a20ef7a513ba23ea3d8a856e9d5712265b0e3 |     
    i686     |             ffmpeg             | TIM | http://autobuild.buildroot.net/results/339ed3f76628df80b471228494f341b363de7c71 |     
   armeb     |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/5f3305ac8ec3a42873c6ba8b2e41044f58a768d9 |     
  mips64el   |        fluent-bit-2.0.9        | NOK | http://autobuild.buildroot.net/results/f1a078db85941f1702fa7f60b25f83b2d29bd2f1 |     
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/3c67f2538493a584797721d842e8f4e4f00dac58 |     
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/55916661afeac4dd55604c2b79526d5d5535fdc7 |     
   xtensa    |           frr-8.4.2            | NOK | http://autobuild.buildroot.net/results/a1705af7c1ce496fcb8379a6ce0dac045f37bdad |     
    i686     | fs/btrfs/btrfs.mk:55: /tmp/... | NOK | http://autobuild.buildroot.net/results/46ba9dfa0a8db8007d411a4eb166ab0786343c82 |     
 microblaze  | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/c42a4ce76b4c10cef1ae8da639e24d8dbe491ebf |     
    sh4      | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/68bd8da60bb54efe5d968be06c83ec24a51e0125 |     
  sparc64    | fs/romfs/romfs.mk:32: /home... | NOK | http://autobuild.buildroot.net/results/6f313299170fbf0a327a8f1c66101e64780fd757 |     
  sparc64    | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/b330794dd1ed5e5a7a18ea84feeba74ddced00ab |     
   mips64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/efff5708efefbadaad9b0ccbdfb9457a67d8fc02 |     
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/5c7b57ea0ce2cf844c815d25a938c8cc459d149b |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/13502204cdacf3a6de4724f33c2b40c84fc6a622 |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/dbf25786616ce1c5e24a619cad37a23654165d66 |     
   s390x     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/c308155617b27c462f2e3d59f5270279ca1caf66 |     
   mipsel    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/28baddd912e6b68bf0ec77d0db5d2d8aac771d85 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/05e67999633be3d32714e2b538edac8539eb60f1 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/3e569e640e5daefb71c0975b69683ea4765a483f |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/50be6cf54bda9324cba68d6e7aaeb7578f27b04a |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/f6186da98a4b1015515f18d9c1c0f983430f1890 |     
  mips64el   |         gnu-efi-3.0.15         | NOK | http://autobuild.buildroot.net/results/fbf037d44cf66bff44a6784d1d419a399cb44dec |     
  aarch64    |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/5bf00af86da6e41d1a48abc7304bf339908a0150 |     
   x86_64    |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/a4e5e3a086895a6a43c7c52cd06d200062190068 |     
 powerpc64   |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/678b45f929de0ac7b284444cf2d49d2beb0bf180 |     
  sparc64    |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/fca58256430d6f3397811cf0fcabbd0e47c06163 |     
   armeb     |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/037cff719282e79917ff86576fe201b3682428d1 |     
 powerpc64   |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/19ca2f216b75d07b1aecf124a842cbc71942382e |     
    mips     |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/a07d70e03628ba1c724d4f7cf9d8b0c96939f8f8 |     
   mips64    |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/ec43fa2eca9450f36ec4d84f431d222563a121b1 |     
   mips64    |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/1a57bceade7d3209de32caf0f4793cabd9087dec |     
   x86_64    |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/88a3caa3248768133212e4e560450e7466d11e76 |     
   x86_64    |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/32aa9ab8cfab21f40dfcd18c6351cbb52e881241 |     
   mips64    |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/6fc897182479a45ce633f260711b1cc51b337597 |     
 powerpc64   |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/e2077da2a1e8dbd58b2c65d3fa39e0a09c378a58 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/b16d6ac24f803d61f000adeb55b5fa4da9305e15 |     
 powerpc64   |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/aeba99a319e3612658371e1e47e8bde35622afff | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/5a24bd790dcc0e1ec9f6ae4d9c2753d1fc51d247 | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/f0609a70930f9601c0c724ce903b7730eb715fa7 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/8f4fb319ef756c5e4c63728d3b5c2062489b0650 | ORPH
   armeb     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/cf2fc1ea9242bdfc945fff76a5a180e8767e31f0 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/9236bc11e47905896aab248a8217ecb6098a5f47 | ORPH
   s390x     |         gocryptfs-2.3          | NOK | http://autobuild.buildroot.net/results/8416beaf6dfaab1fcd0d8b1444dcdb2508b21693 |     
   xtensa    |         highway-1.0.2          | NOK | http://autobuild.buildroot.net/results/f316a7cdf22ce57e386093ab8d4e696d4e708cc7 |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/387a9c49b06b1ed78f246ab804b0b3e94ba621fe |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/195606dad6add19fa9ad9272bb1b92b5f6456c38 |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/955c80bca06f2630292b2fde80ebf58b9f397d49 |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/32e95db4cbea1c4f7a1757f1c77ec1b9262b267b |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/b87b9cd13186bc5ebfef4140298d9d67ff9a9dad |     
 microblaze  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/f674b6cdadf788fb07980e6cb69d40d07a01795d |     
 microblaze  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/0954ea533f050bf87cb29f1f25aa5ac161e521fd |     
   arceb     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/13535aba17c4845635319a77d1c2709e2e2454fe |     
   mips64    |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/9c0cf006333b13fc7c5a6f275567f1818d276cae |     
  mips64el   |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/f8e3b4686e8b811dbce64fae0c6b74f1e0476634 |     
   mips64    |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/e4ac2c7828f56b812ec48ebd6f891bc089367c86 |     
    i586     |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/37de9ac12d1c4d5a17bb1440bd9423756e8cae43 |     
   mips64    |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/e5c3534367d2810dfb062c6779c64a7fa3131b50 |     
   s390x     |     host-libarchive-3.6.2      | NOK | http://autobuild.buildroot.net/results/eb93c87cb00be4173973d0961ae24c59bce93687 |     
   x86_64    |     host-libarchive-3.6.2      | NOK | http://autobuild.buildroot.net/results/b3fd21ab0cbdd1e0d571c24d600d6d1e0d1011a4 |     
   x86_64    |     host-libarchive-3.6.2      | NOK | http://autobuild.buildroot.net/results/35fe668bd3a9f8bbd1f83951a92a5f1b860b71b3 |     
 aarch64_be  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/540cb18b51f225fd7a7d892e16429a92d6c1d58b |     
    m68k     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/30e646d5579353a7ee8dc72b9110b7e3ea27e02f |     
  sparc64    |      host-python3-3.11.1       | NOK | http://autobuild.buildroot.net/results/c899e7574a2dae61469b1fa87cf82e47187634cd |     
   x86_64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/eebd45377cb6a9a35cc30c3a5200d20f421c1e1d |     
   s390x     |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/d13f30143077a0c4277d28feae406ddc3ed9f423 |     
   arceb     |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/e4da8093844459c5d1c74d173505f611367ca9aa |     
    arc      |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/e2c7bcce38efa0ec62f9a1be32b969fb09d709b4 |     
    or1k     |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/86b7d1bafb27b7b6d2606100bf22659285b99db1 |     
   armeb     |          kexec-2.0.25          | NOK | http://autobuild.buildroot.net/results/c60fac85048b8b563d80bb0e62c8328564853033 | ORPH
    i686     |      libcamera-apps-1.1.1      | NOK | http://autobuild.buildroot.net/results/4683479f3f560f95d57d849ded3ed7482854231f |     
   armeb     |        libdeflate-1.15         | NOK | http://autobuild.buildroot.net/results/c3514908f5c82ea0d7b036196e7611ffd9e13500 |     
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/8dadb27cae8507f77418069e42f51c6471b356a1 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/ea5d6cf1c2c02bec62f50d5c445c97bbcbfddd9f |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/8d675e604e8233a21f34b188961b2a4a1caccc79 |     
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/716c02fb9f6daeec51bfce65fd187f01ab94eff5 | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/521f8c699371ac77660bd1ec70c1491336921722 | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/7da0d654d9f8c88ba8643be9f7433a423b9b5450 | ORPH
   x86_64    |        lightning-2.2.0         | NOK | http://autobuild.buildroot.net/results/6d1a8bc49860f44eb75c9f70c790ea4678f4a111 |     
    mips     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/e94a592bff020ec75e7d4956032ca426bb8a2ac4 | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/ee1fd464b836e18f50e3992f434d9bf8079cd80c | ORPH
   mips64    |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/0825f187d55fb2cb62a5b948ce88449cea72ca62 | ORPH
   mips64    |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/b1425c00309d4d4120644686cff6da9b48bd06b3 | ORPH
 aarch64_be  |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/c358c92c2567d2e8ff2252a9247e3493b428d634 | ORPH
  powerpc    |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/d7c7b86904e422005ad3ae3ac102ff02a8846d8a | ORPH
   mips64    |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/9e44382b0276e7912791b419523b5152f27a9aa6 | ORPH
    arc      |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/6d307ca4a9e2e660353675799589df9eca509e16 | ORPH
  aarch64    |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/3b130b9396876a5c151d9ed57bdc1d4478d8cd69 | ORPH
    mips     |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/6fc8885f86becdc95fd01d984536e2f97ba4b9ed | ORPH
microblazeel |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/03884badae8913d755fb9eecdfc0e05718ffef46 |     
   s390x     |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/a34c0e0f3798e844c94ee40931d7a81a3c35451d |     
    i586     |     multipath-tools-0.9.4      | NOK | http://autobuild.buildroot.net/results/2229bb1771200082cfae9a307acf71475946ffcb |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/6ad59299e7d8bb4b71e75c39fcaa6ef90f16ad62 |     
    arm      |     mxs-bootlets-10.12.01      | NOK | http://autobuild.buildroot.net/results/b4b26f6b02fd1991f46eba5db240e5050b96d333 | ORPH
    arm      |     mxs-bootlets-10.12.01      | NOK | http://autobuild.buildroot.net/results/5094d267e015fb549b905d97d5dd713489d040e4 | ORPH
    arm      |     mxs-bootlets-10.12.01      | NOK | http://autobuild.buildroot.net/results/22ec0cf206fd188e973a8a5b70e37478bd399b43 | ORPH
   mips64    |      ncurses-6.3-20221224      | NOK | http://autobuild.buildroot.net/results/4c4e5783772eddf6013a99cc55512d37a01ea39f | ORPH
  sparc64    |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/82650c75fd79491859473ac1fb65f558873fcdf3 |     
    arc      |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/e33f2c928e59e806bd460f5c91031a521109ca3d |     
    arc      |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/4628c578c3d56046be8b5e9a0b455746b14e13db |     
    m68k     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/c8e2ddc3cc441094fab9a57ee32d20fe79586f7a |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/a3e755bcebff49c9d69c83524712c790dc1bf0c4 | ORPH
 microblaze  |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/60cf8b64d457dbe6d2ef9ac68f689ab0233ac131 | ORPH
microblazeel |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/9d6e59b7df2707da567a283374488828f948f96b | ORPH
   sh4eb     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/1b80258acaffc21ebd6778325d6a069e2f0a29d7 | ORPH
    or1k     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/1982846c8fd22ebcd955e85ce86cce156a8e6127 | ORPH
  aarch64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/38aa855cdd88c0100d0b9b6028b3bfd3e0d054fb | ORPH
   mips64    |        openblas-0.3.21         | NOK | http://autobuild.buildroot.net/results/785d373edd0db83dbc2b49d99e73ef91e3d90c77 | ORPH
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/08366bb87af75eec33b611f34ba95bbf58317088 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/d7151646b99e885b0aa18297adaef127f7e939e7 |     
  sparc64    |          p7zip-17.04           | NOK | http://autobuild.buildroot.net/results/b837a27d7899e99336db2a6623c04597b8707289 |     
  powerpc    |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/beb3d9b9ea79f2442e8d36f45ba3533b03084b65 |     
   sparc     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/fd627f09816bb71ccf4c8cb1c57eaab827171190 |     
microblazeel |           php-8.2.2            | NOK | http://autobuild.buildroot.net/results/0f5bbe455ef8ac1a3f406930f97a31e728ed2331 |     
  aarch64    |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/199144c6d75a8b8ee0a34fc3d452cd3f353a6cb5 |     
    i686     |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/07942f871e078ed2bd1ab60578cf2303e172801a |     
   mipsel    |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/6ab2ead00c27e8f608b31f914fc6d098b2590d95 |     
powerpc64le  |           qemu-7.2.0           | NOK | http://autobuild.buildroot.net/results/f79db75c970898536e19091abe22f79f0db76d22 |     
    mips     |           qemu-7.2.0           | NOK | http://autobuild.buildroot.net/results/ad0d6c63d227edfc1f35b5a7d626def331e2625c |     
   mipsel    |         qt6base-6.4.2          | NOK | http://autobuild.buildroot.net/results/d56284c098fb8c781a4c238df605683c11e06e15 |     
  powerpc    |         rdma-core-44.0         | NOK | http://autobuild.buildroot.net/results/c52bcb921cedbfba1c30cf3898dbdea72d2090bb |     
   x86_64    |         rtl_433-22.11          | NOK | http://autobuild.buildroot.net/results/7de9c47145afa8210df51df145f78c5e912d6ff4 |     
   s390x     |         speechd-0.11.4         | NOK | http://autobuild.buildroot.net/results/b8592464257474bfb07216484f5ff3e341c24108 |     
   nios2     |        strongswan-5.9.8        | NOK | http://autobuild.buildroot.net/results/a924256ae3c68c71bc1e6c7525728861e6cdfc99 |     
  sparc64    |         systemd-252.4          | NOK | http://autobuild.buildroot.net/results/6dc3b7024ae64e548ef51e7dcf8c608e81d8e508 |     
   s390x     |         systemd-252.4          | NOK | http://autobuild.buildroot.net/results/801f23b20e017c01c433c26090f5ebf635a4a024 |     
    sh4a     |         systemd-252.4          | NOK | http://autobuild.buildroot.net/results/dba31fbde3e7f9dbdd187afd2a98f89f4e350411 |     
   armeb     |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/998cdb5b8a5e24b34e597e5fec293553d17bce52 |     
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/5eee39a646b62de2fecf86a300dbebe06dc8b669 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/d4aaece66b361c972af55e613d540c2640be9d90 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/00909d00e9c1707747a5aad7ccc46946edf8da41 |     
   sh4eb     |            unknown             | NOK | http://autobuild.buildroot.net/results/297cf2bd1141c9e1e60b2e745acd975cf8d9d0d6 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/c1212ce5004aba36e516b7269cff93296feeb391 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/cae5c191a75ebe34c86f07fb1e59126d1a12329c |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/a1fc4542815727aa11d9547bb60a44157ab60087 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/4dbb63d7be93471be9963a8bc52c409e200d9da9 |     
powerpc64le  | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/bc4873abe8b876a428ebfb8f136eb4d364478127 | ORPH
  sparc64    | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/8ede0c711c94102081a61da456e42c6c7a0013e9 | ORPH
   mipsel    |           vdr-2.6.3            | NOK | http://autobuild.buildroot.net/results/4e97de65e8d0e7ab7d987014767dc484db4490d1 |     
   mips64    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/19f0a6a13c0451095c0fc332ecfda9fdaa35139b |     
    m68k     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/769d004317a9ef07bee98289a5f9c58c3a5aea4f |     
   nios2     |          xerces-3.2.4          | NOK | http://autobuild.buildroot.net/results/5391a9b75383b3c7b66d91ed15a9572564cdbe24 | ORPH
microblazeel |   xfont_font-misc-misc-1.1.2   | NOK | http://autobuild.buildroot.net/results/04e8959b663d61bbcc3841d33e86f5ebb42a058e |     
 powerpc64   |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/4e3a6191b2f8065f15c127cf362feb0bd2d78457 |     
   mips64    |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/0ff479c94ef455625aa498f5e12568d05b6fe736 |     
    or1k     |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/b89e8b1ac315824fd361427b8716ffb6957ab2cf |     
   x86_64    |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/af1e8929f8ee440b9942f1030177b2d06f4d2c7b |     
powerpc64le  |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/752dabae9bbb6d5983e6090524515685b1897ee6 |     


Classification of failures by reason for 2022.11.x
--------------------------------------------------

                  xxhash-0.8.1 | 2 
                      xz-5.2.7 | 2 
           crucible-2022.05.25 | 1 
                elfutils-0.186 | 1 
glibc-2.36-66-ga1dc0be03c9d... | 1 
  gobject-introspection-1.72.0 | 1 
                host-go-1.19.5 | 1 
              host-pahole-1.24 | 1 
           janus-gateway-1.0.3 | 1 
        liblog4c-localtime-1.0 | 1 
                  linux-6.0.19 | 1 
ripgrep-af6b6c543b224d348a8... | 1 
                       unknown | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/087fbfc2e46d2affb78da61d469d1d31d7711828 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/1ac203eb1fc1fabb8e1f233f22e281036c7949be | ORPH
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/d4f6e70d16ebad0c2fb62a39cd383c814b23dbd0 |     
   mipsel    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/017d3764db017fc757760180c5f9244be345882f | ORPH
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/bfa74b85cd24e86ce7c33abf0d738087b922aa61 |     
  sparc64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/d904c1d578411ad72c9eadda2f8011ff968b3399 |     
  aarch64    |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/fc3725daf40c9488e7606240eb613aa8b9430373 |     
  riscv64    |     liblog4c-localtime-1.0     | NOK | http://autobuild.buildroot.net/results/5508d99a8d1951adfb1c45e46834eff81586f0de |     
   x86_64    |          linux-6.0.19          | NOK | http://autobuild.buildroot.net/results/9c9e4d5913076f83f4deb32febe83b280aba4504 | ORPH
    mips     | ripgrep-af6b6c543b224d348a8... | NOK | http://autobuild.buildroot.net/results/a29ef9cf1a771e74e41ee75c76796c4f8acd9eb7 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/8d54670a8469d36dfe9550f7710c5887ca600022 |     
 microblaze  |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/7515284a08f79144003689473e8b8409ff556013 | ORPH
    mips     |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/49d2cd50ffe8cab803a538890ff252599f5fbede | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/e9c8352997264b9d815788b5cc49316b72d11376 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/90ea274b47552e8c2837cbd8625545c4eab217b3 | ORPH


Gitlab CI results for 2023-02-17
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
       atmel_sama5d3_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758739  |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758741  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758743  |      
           atmel_sama5d4_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758745  |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758747  |      
       atmel_sama5d4_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758748  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758749  |      
                        avenger96 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758750  |      
                bananapi_m2_ultra | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758751  |      
                 bananapi_m2_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758752  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758753  | ORPH 
                   beagleboardx15 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758754  |      
                       beaglebone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758755  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758757  |      
                     beagleboneai | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758758  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758759  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758761  |      
               broadcom_northstar | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758762  |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758763  |      
                   chromebook_elm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758764  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758765  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758766  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758768  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758770  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758771  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758773  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758774  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758775  |      
               freescale_imx28evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758776  |      
        freescale_imx6dlsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758777  |      
          freescale_imx6dlsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758778  |      
         freescale_imx6qsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758779  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758781  |      
          freescale_imx6sxsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758783  |      
             freescale_imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758784  |      
           freescale_imx7dsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758788  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758791  |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758793  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758794  |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758796  |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758797  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758799  |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758801  | ORPH 
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758802  | ORPH 
          freescale_t2080_qds_rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758805  | ORPH 
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758807  |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758810  |      
          globalscale_espressobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758812  |      
                 grinn_chiliboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758814  |      
                  grinn_liteboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758815  |      
                 hifive_unleashed | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758816  |      
                         imx23evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758817  |      
                   imx6-sabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758818  |      
                     imx6-sabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758819  |      
                 imx6-sabresd_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758820  |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758821  |      
                       imx6sx-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758822  |      
                        imx6ulevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758823  |      
                       imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758824  |      
                       imx6ulpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758825  |      
                        imx7d-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758826  |      
                        imx7dpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758827  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758828  |      
                imx8mn_bsh_smm_s2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758829  |      
            imx8mn_bsh_smm_s2_pro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758830  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758831  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758832  |      
                kontron_bl_imx8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758834  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758835  |      
              kontron_smarc_sal28 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758836  |      
                          lafrite | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758837  |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758838  |      
                    licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758839  |      
               linksprite_pcduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758840  |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758841  |      
                mender_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758842  | ORPH 
          microchip_sam9x60ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758843  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758845  |      
 microchip_sama5d27_wlsom1_ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758846  |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758848  |      
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758851  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758853  |      
          microchip_sama7g5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758856  |      
      microchip_sama7g5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758858  |      
                  minnowboard_max | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758860  |      
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758861  |      
                          mx51evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758863  |      
                         mx53loco | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758867  |      
                         mx6cubox | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758873  |      
                   mx6sx_udoo_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758879  |      
                          mx6udoo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758881  |      
                      nexbox_a95x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758884  |      
                            nezha | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758886  |      
                      nitrogen6sx | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758889  |      
                       nitrogen6x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758891  |      
                        nitrogen7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758893  |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758895  |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758900  |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758902  |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758904  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758907  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758912  |      
                         odroidc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758915  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758919  |      
        olimex_a10_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758921  |      
             olimex_a13_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758925  |      
        olimex_a20_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758930  |      
       olimex_a20_olinuxino_lime2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758926  |      
       olimex_a20_olinuxino_micro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758932  |      
             olimex_a33_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758934  |      
             olimex_a64_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758938  |      
          olimex_imx233_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758941  |      
    olimex_stmp157_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758942  |      
                         olpc_xo1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758954  |      
                       olpc_xo175 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758946  |      
                    openblocks_a6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758980  |      
                    orangepi_lite | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758983  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758982  |      
                     orangepi_one | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758984  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758985  |      
                      orangepi_pc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758986  |      
                 orangepi_pc_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758987  |      
                      orangepi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758988  |      
                    orangepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758990  |      
               orangepi_zero_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758993  |      
              orangepi_zero_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758991  |      
                       pandaboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758995  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758996  |      
                    pc_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758997  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758998  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780758999  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759000  |      
                qemu_aarch64_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759001  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759002  |      
                qemu_aarch64_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759003  |      
                    qemu_arm_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759004  |      
               qemu_arm_versatile | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759005  |      
                qemu_arm_vexpress | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759006  |      
             qemu_arm_vexpress_tz | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759008  |      
                qemu_m68k_mcf5208 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759009  |      
                   qemu_m68k_q800 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759010  |      
            qemu_microblazebe_mmu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759012  |      
            qemu_microblazeel_mmu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759013  |      
              qemu_mips32r2_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759015  |      
            qemu_mips32r2el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759016  |      
              qemu_mips32r6_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759018  |      
            qemu_mips32r6el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759020  |      
                qemu_mips64_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759021  |      
              qemu_mips64el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759024  |      
              qemu_mips64r6_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759025  |      
            qemu_mips64r6el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759026  |      
                 qemu_nios2_10m50 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759027  |      
                        qemu_or1k | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759029  |      
                 qemu_ppc64_e5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759030  |      
               qemu_ppc64_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759031  |      
            qemu_ppc64le_powernv8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759032  |      
             qemu_ppc64le_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759033  |      
                  qemu_ppc_bamboo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759034  |      
                  qemu_ppc_e500mc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759036  |      
                 qemu_ppc_g3beige | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759037  |      
                   qemu_ppc_mac99 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759038  |      
               qemu_ppc_mpc8544ds | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759039  |      
                qemu_riscv32_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759041  |      
          qemu_riscv64_nommu_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759042  |      
                qemu_riscv64_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759044  |      
                       qemu_s390x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759045  |      
                     qemu_sh4_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759047  |      
                   qemu_sh4eb_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759048  |      
               qemu_sparc64_sun4u | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759049  |      
                  qemu_sparc_ss10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759051  |      
                         qemu_x86 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759056  |      
                      qemu_x86_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759054  |      
                 qemu_xtensa_lx60 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759058  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759061  |      
                      raspberrypi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759080  | ORPH 
                     raspberrypi0 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759064  | ORPH 
                    raspberrypi0w | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759069  | ORPH 
                     raspberrypi2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759070  | ORPH 
                     raspberrypi3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759073  |      
                  raspberrypi3_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759071  | ORPH 
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759074  | ORPH 
                     raspberrypi4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759077  | ORPH 
                  raspberrypi4_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759075  | ORPH 
                 raspberrypicm4io | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759084  | ORPH 
              raspberrypicm4io_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759082  | ORPH 
                raspberrypizero2w | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759085  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759086  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759087  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759089  |      
                        rockpro64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759090  |      
                      roseapplepi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759093  |      
                 s6lx9_microboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759094  |      
                       sheevaplug | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759095  |      
                 sipeed_lichee_rv | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759096  |      
            sipeed_lichee_rv_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759098  |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759103  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759107  |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759110  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759113  |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759116  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759119  |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759123  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759125  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759129  |      
              snps_archs38_axs103 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759132  |      
                snps_archs38_haps | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759134  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759138  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759140  |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759142  |      
          solidrun_clearfog_gt_8k | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759144  |      
            solidrun_macchiatobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759147  | ORPH 
                    spike_riscv64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759148  |      
              stm32f429_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759149  |      
               stm32f469_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759151  |      
              stm32f469_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759152  |      
                  stm32mp157a_dk1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759154  |      
                  stm32mp157c_dk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759155  |      
              stm32mp157c_odyssey | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759156  |      
        terasic_de10nano_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759159  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759161  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759167  |      
                           ts5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759170  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759172  |      
                         uevm5432 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759174  |      
                    versal_vck190 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759176  |      
                       visionfive | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759181  |      
                      visionfive2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759179  |      
                        wandboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759184  |      
                            warp7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759185  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759187  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759189  |      
                      zynq_qmtech | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759191  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759192  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759195  |      
                zynqmp_kria_kv260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759198  |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759199  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3780759202  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
