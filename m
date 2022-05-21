Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B614EC433EF
	for <buildroot@archiver.kernel.org>; Sat, 21 May 2022 04:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25C0A426F3;
	Sat, 21 May 2022 04:41:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wk0ObUA9aLKD; Sat, 21 May 2022 04:41:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92AD9426D6;
	Sat, 21 May 2022 04:41:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3FE311BF2A9
 for <buildroot@lists.busybox.net>; Sat, 21 May 2022 04:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3238760FE4
 for <buildroot@lists.busybox.net>; Sat, 21 May 2022 04:41:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uuA7oH-QwmSL for <buildroot@lists.busybox.net>;
 Sat, 21 May 2022 04:41:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 15A7760D73
 for <buildroot@buildroot.org>; Sat, 21 May 2022 04:41:25 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B0F5260006
 for <buildroot@buildroot.org>; Sat, 21 May 2022 04:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1653108082; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WsbG/h/2nFTXXvx8vqdrscjMVHHMuQ1SWwmxhNqeV9E=;
 b=BT6nreA+8wK/UaKLPaibv6Pg9YhcJUkXB3ScmK+WsIcPaoKZ9TfqqlvC8AXM4IA10ln60B
 zReV/2ByMxMU+Uo0FUNxOjq9VOq8Ki5n+5i8sMRG+HsmEsOAAQVBoxlUIw+NskjehYu3Cw
 kCpVRu1EVpebZA3Sz79s/UbH6YUGizfvYqHVAdfI08xj2XaEYvrnvEEDEXTwseHP4nkP7q
 RhiyruZEeEkamUtbVKf7MNPwMm3FVXjQZOJb3/M3QCtyiZq77YYMd13h3XySZ2aJiyJdVV
 p9dog67/465mtnVfcq3+z7V434SFhiJBLAEHWJKgThtkhuPQWEWfjfATSyUDJw==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 21 May 2022 04:41:22 -0000
Message-Id: <20220521044129.3238760FE4@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-05-20
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

Autobuild statistics for 2022-05-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 20  |  6  |  0  | 26  |
    master   | 173 | 219 |  0  | 392 |

Classification of failures by reason for master
-----------------------------------------------

         host-gcc-final-10.3.0 | 24
           optee-client-3.17.0 | 21
                 uclibc-1.0.40 | 10
               protobuf-3.20.1 | 8 
                  linux-5.17.7 | 6 
                 zlib-ng-2.0.6 | 5 
             libopenssl-1.1.1o | 4 
            qpid-proton-0.35.0 | 4 
              alsa-lib-1.2.6.1 | 3 
                bitcoin-0.21.2 | 3 
                  boost-1.79.0 | 3 
dahdi-linux-5c840cf43838e06... | 3 
                 dash-0.5.11.5 | 3 
                    dhcp-4.4.3 | 3 
glibc-2.35-96-g2c4fc8e5ca74... | 3 
          host-gcc-final-9.4.0 | 3 
            igh-ethercat-1.5.2 | 3 
           libwebsockets-4.3.1 | 3 
               pipewire-0.3.51 | 3 
              swupdate-2022.05 | 3 
    toolchain-external-bootlin | 3 
                   uacme-1.7.1 | 3 
                    4th-3.64.0 | 2 
                  bitwise-0.43 | 2 
                 coreutils-9.1 | 2 
                  exempi-2.6.1 | 2 
                     frr-8.2.2 | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
  gobject-introspection-1.70.0 | 2 
                host-go-1.18.2 | 2 
host-pahole-73383b3a39afe86... | 2 
                  libcec-6.0.2 | 2 
              libgcrypt-1.10.1 | 2 
                   libnss-3.78 | 2 
                 libp11-0.4.11 | 2 
                libressl-3.5.2 | 2 
                    php-8.0.19 | 2 
               poppler-21.12.0 | 2 
           python-orjson-3.6.7 | 2 
                 wavemon-0.9.4 | 2 
                       xenomai | 2 
                     aufs-util | 1 
  binutils-arc-2020.09-release | 1 
            bridge-utils-1.7.1 | 1 
                    brltty-6.4 | 1 
                busybox-1.35.0 | 1 
              containerd-1.6.2 | 1 
docker-proxy-339b972b464ee3... | 1 
                   eigen-3.4.0 | 1 
                elfutils-0.186 | 1 
                 fdk-aac-2.0.2 | 1 
                     file-5.41 | 1 
                flannel-0.14.0 | 1 
fs/axfs/axfs.mk:32: /nvmeda... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
               gocryptfs-2.2.1 | 1 
google-breakpad-c85eb4a59b6... | 1 
gummiboot-2bcd919c681c952eb... | 1 
              host-delve-1.8.0 | 1 
         host-gcc-final-11.3.0 | 1 
host-google-breakpad-c85eb4... | 1 
                  jack2-1.9.20 | 1 
ktap-23bc7a4a94bd9e4e1b8b7c... | 1 
                 libbsd-0.11.3 | 1 
               libglib2-2.70.4 | 1 
             libgpg-error-1.42 | 1 
          libmicrohttpd-0.9.75 | 1 
   libtorrent-rasterbar-1.2.15 | 1 
               libvorbis-1.3.7 | 1 
                libzlib-1.2.12 | 1 
           linux-5.10.104-cip3 | 1 
       linux-5.10.104-cip3-rt3 | 1 
                   linux-tools | 1 
        lttng-babeltrace-1.5.7 | 1 
                    mpv-0.33.1 | 1 
                    musl-1.2.3 | 1 
                  ndisc6-1.0.5 | 1 
   openvmtools-10.3.5-10430147 | 1 
                   perl-5.34.1 | 1 
                    pppd-2.4.9 | 1 
                proftpd-1.3.6e | 1 
            python-ujson-5.2.0 | 1 
                python3-3.10.4 | 1 
                      rauc-1.6 | 1 
                     refpolicy | 1 
ripgrep-af6b6c543b224d348a8... | 1 
rtl8723bs-11ab92d8ccd71c80f... | 1 
rtl8812au-aircrack-ng-3a640... | 1 
               tcf-agent-1.7.0 | 1 
toolchain-external-bootlin-... | 1 
toolchain-external-bootlin-... | 1 
             transmission-3.00 | 1 
                       unknown | 1 
                xenomai-3.0.10 | 1 
               xfsprogs-5.14.2 | 1 
                  zchunk-1.2.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |           4th-3.64.0           | NOK | http://autobuild.buildroot.net/results/58d959f0d58429620e624c43b53e76634d5e7f6a |     
  riscv64    |           4th-3.64.0           | NOK | http://autobuild.buildroot.net/results/879a83aa350e602c0d987c5ad9ca5b82e071df0f |     
    m68k     |        alsa-lib-1.2.6.1        | NOK | http://autobuild.buildroot.net/results/d9bb88e492b6f0cc6f501363d0be50687cb5f186 |     
    m68k     |        alsa-lib-1.2.6.1        | NOK | http://autobuild.buildroot.net/results/e6fe0161fa492fcc7ce25e11f4cdf54348f99f7f |     
    m68k     |        alsa-lib-1.2.6.1        | NOK | http://autobuild.buildroot.net/results/027048cebdbf730d3d5548a3c4ee5c57e40dd3e0 |     
    arm      |           aufs-util            | NOK | http://autobuild.buildroot.net/results/292a23bff0b6ecab473787ddfe6cda12abe885a3 |     
   arceb     |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/dedf8842636f8dc3ef70e92ae19c320fdf36fb3d |     
    i686     |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/46a92c93641229e6441488c0abeed2bdf8358246 |     
microblazeel |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/22ac2c1e9ab442013880b23d1e48d9e2c67cd9bc |     
 aarch64_be  |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/b3add0f9aec7ae00cbc3ca3c1ed58e5d87525e30 |     
    m68k     |          bitwise-0.43          | NOK | http://autobuild.buildroot.net/results/9e3b9a148bc84004fde4dfe9b389ca2b359a92e2 |     
  riscv64    |          bitwise-0.43          | NOK | http://autobuild.buildroot.net/results/348afc2a0fde85c098a12b58e8e2dcc3780bbb6b |     
    or1k     |          boost-1.79.0          | NOK | http://autobuild.buildroot.net/results/e754b7991699a2a8b0c1ebb080c89e4bd12202c9 |     
    arc      |          boost-1.79.0          | NOK | http://autobuild.buildroot.net/results/658261036f7e4d46a5c35da8750e2664c535572b |     
    or1k     |          boost-1.79.0          | NOK | http://autobuild.buildroot.net/results/105dedd3221cbcb4a9be5c9eac39affd269b177b |     
    m68k     |       bridge-utils-1.7.1       | NOK | http://autobuild.buildroot.net/results/2e24b08b9b81e2c1b3f58e08836903d3e39b128e |     
   mipsel    |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/5a911d5a6c6ef2510ec830ce1a155dbba4fa7f6f |     
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/0f53e0349de1a92a2355c3b96a89f3a4e2073a74 | ORPH
powerpc64le  |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/b950a45e00900660dad5077dd481dfb1ac6ae479 |     
    sh4a     |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/34c4c8b74b1c217d82e4a169fd3b67b32c7486dc | ORPH
    sh4a     |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/4d5e73417df53814f47ed8771fb2a5a654ab1fe2 | ORPH
 microblaze  | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/6b5d197ff50c0d8e6c6b735b58be004c8959ab2e |     
    i686     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/7d526589c4e1a62a24173126108485a6e99c1452 |     
 microblaze  | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/9e4404d1af61e51b0d6d27bc510af65c51485669 |     
    arc      |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/cfe1e1a3b3b8422e3bcf3e571685bf0dc1526c3a | ORPH
   mips64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/cd7503728d3d2f82889636b077f8075318d1e339 | ORPH
 powerpc64   |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/e4e83b8c8155df5d9fe41238be4d0a3c8d173bf8 | ORPH
    or1k     |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/95b71ddd4a67c1cc49dd0e99db962052bf939c15 | ORPH
    arc      |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/0e8d27a7cd6e1f1da83f2dcfe5daf07f457691a7 | ORPH
    arc      |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/70fafd75d6f5722540cefce1e63a40bf89551e36 | ORPH
powerpc64le  | docker-proxy-339b972b464ee3... | NOK | http://autobuild.buildroot.net/results/903e9732395f7a5f158535433c202f53422ee555 |     
  mips64el   |          eigen-3.4.0           | NOK | http://autobuild.buildroot.net/results/de8f779ac4c81a3d70bf266ffbefc279fef14bc5 |     
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/9628d74d30bf2bdc2ead644b4c4bd40413fdaff2 | ORPH
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/173e4f7056efb1083db269916e4de4eec4a9e144 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/b1193d27921cecf4d81bbace078c4adc67910b32 |     
   sh4eb     |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/7fd1995ec067f2265ceda27e42faffbef8c54afd |     
    arm      |           file-5.41            | NOK | http://autobuild.buildroot.net/results/5c0816807b19b1f76d5d19a86e2a5988c34fe695 | ORPH
powerpc64le  |         flannel-0.14.0         | NOK | http://autobuild.buildroot.net/results/0613491eda12e36f656c943cf7039a1e9111befa |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/e7f9a7b1afadbb72c2b0f7ee8a27d04c6800f5f6 |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/f4ecca70e27ba467a6666e09dfaa02a3989f4ef9 |     
   armeb     | fs/axfs/axfs.mk:32: /nvmeda... | NOK | http://autobuild.buildroot.net/results/c61489ba3c4390e350fe9c5d442ac3bd3d9d23b2 |     
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/3bffb9d5f0e96969be32003ad2882b36501a72de |     
 microblaze  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/e9c50da8b1e5ff383432f15668b4d533e64fc725 |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/737287f04015e8bd826f07a3eb0e3ca98b5e30e9 |     
 microblaze  | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/3a71a266f967be7aca79f01f6c077ea7c7946b9f |     
  sparc64    | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/ead0a9bdc73c54587919d429a9f31568fc874d3f |     
    sh4a     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/ea6c66860e647d5bb717ec4bcd9cba43733d0108 |     
   sh4eb     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/7959f763bb7fbf0eb46c5a42fb7055fd964fccc9 |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/d10e35118d1ef07c9b9151149a8a3d87384c9836 |     
  sparc64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/d984a4b64de47be589304492f881ad66627c8dce | ORPH
   mipsel    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/ced095e07755b809470b73718eef7c115ae477fa | ORPH
  riscv64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/815f0eb991b791254478065463d510a4aa42c18e |     
    arm      | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/59ed0930fb3e8ce1040d54820d0ff8965b5fe5c8 |     
    i686     | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/0defe736517a98025a266756d6dc6fd9c57959e4 |     
    arm      |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/3d6ad613a772898e78f086e56447590cbcb17b04 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e8e10a46cfddb3ed0593fbc5111662350e185794 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/41335abac02b05c6cb077bad8fa667a0719fa03c |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a261ea202a1d95dd2d086b811beb6e6adad82cbf |     
   x86_64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/f6b48748ec05df676da9f0963b963064d87ed600 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/4818dffc498b0a1f6cf56a03095a9875bb55a761 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/adfe163944cad41edeb38d508584d8277add334a |     
    i686     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/14c30798c0aa2d5cbd22591280d6e41f034231d5 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b3ee0d8382720dbfc606e5c83d2c327436a58feb |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b7c19b29211932af9c953b8534ee86a298f40242 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/727b3f0524643c0fccd39717d071078294dc5d2e |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/28bb0b13e729f2c02435f27adeef50cd588bb226 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/af7d9c11cce200134f0b1cd5dc6fe5a807981c44 |     
    i686     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/217b38ea16fd47486aa85f94bfa35e61500ac0c0 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/0f9096f95f8c4937de7b5b7d5b508cf10757c692 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/91655a3672cf0edb76b61f44d9638982143e52de |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/8aebe9374b9247f580305dc106f899182925748c |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/0c73fc5c05bf3b29961a819a89b93bfc493470d8 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/5af45c8c9d5bdf4a81cac8b41e80041b430ae332 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a2ecdb7cb5b38df621420c6d695f3f9da51838a4 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/81e9ee65f2580291f77e8bd25b8413b8b4b7afcd |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/c530c7d5b2c78591ce416d0d0cc2864922e2c61b |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d14c0c6b87fe7629ad374169fd92ec0f939dc487 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/1be531f39551edd4e6d3f6bb2fae3d61fe2fb7cf |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d41ce149bda36564529cb369a5a420b33d0c1322 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/9604725992e50c9b7da972b125af91bbc4df1d2f |     
   x86_64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/f613cb615f7105a019dfb6c1e49fd87c406cfbd6 |     
powerpc64le  |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/40f0635f8e690eddc93700c2b61ad52f71ac6acd |     
   nios2     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/19bc3bff239d92d30194b1b3d9590fc20de95b58 |     
  mips64el   |         host-go-1.18.2         | NOK | http://autobuild.buildroot.net/results/4734376a38d28559eca64d675ab27380013f63e5 |     
  aarch64    |         host-go-1.18.2         | NOK | http://autobuild.buildroot.net/results/f5afa3b2797bbfea24e41ef6ceb43e441aa1c03c |     
    mips     | host-google-breakpad-c85eb4... | NOK | http://autobuild.buildroot.net/results/74c81198682f014cf423ce2ccf1d04b62e980e1a |     
  powerpc    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/dfbe41f524559b5042fb39431202090da0354006 |     
  powerpc    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/db5201fd98d3d73d218deb9b92da084ea90d5bc4 |     
   xtensa    |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/06c365dc952daaa0fc7196a6c7208f7f58678b1a |     
   sparc     |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/c016d174c694521053e4b197027a808eb86930b3 |     
    arc      |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/b12183b5f2e55ffc09083fbf1c9267cb02835e3b |     
    m68k     |          jack2-1.9.20          | NOK | http://autobuild.buildroot.net/results/c185400b0639b8881aa1f1ebe7ba41a285ca3325 |     
    arm      | ktap-23bc7a4a94bd9e4e1b8b7c... | NOK | http://autobuild.buildroot.net/results/d74c1ab30642264277861704432724ed06aab1e2 |     
   sh4aeb    |         libbsd-0.11.3          | NOK | http://autobuild.buildroot.net/results/49aea918ee0ac4a43f43f30c54433d489c3d00e0 |     
    arm      |          libcec-6.0.2          | NOK | http://autobuild.buildroot.net/results/80cb56d63c53891a6f074e728eb6d7300c98d644 |     
   x86_64    |          libcec-6.0.2          | NOK | http://autobuild.buildroot.net/results/e34bd78cc81e6da12a85c1e4ee76931818d91073 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/0bec495471a35c8e36e1df43e36ddb011001be2d | ORPH
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/ea02f427d6a8afc560f439894ea7db3f6eb5c6a2 | ORPH
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/2f4bde096f7ea7a90af7af797b22a90bb0dcc559 |     
  aarch64    |       libgpg-error-1.42        | NOK | http://autobuild.buildroot.net/results/693c1e50e51b2d4a129e297bd65cf87cf6d971ca | ORPH
   xtensa    |      libmicrohttpd-0.9.75      | NOK | http://autobuild.buildroot.net/results/8590c97162b76ed29765bf7a362d96bb45feb777 |     
 powerpc64   |          libnss-3.78           | NOK | http://autobuild.buildroot.net/results/9d20cd2afcbc5b5ff844c4b2b78bbb5c2dd94615 |     
 powerpc64   |          libnss-3.78           | NOK | http://autobuild.buildroot.net/results/4dd182c6b7100a6ce4590f02703691324c408b03 |     
    or1k     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/3a22ff576a4576da3a5e52d4f8aed2c24f48a551 |     
   arceb     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/baeb742d362b2a4cf9b9441c26b372aca6c87171 |     
   arceb     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/d459b8fc7a39d58584a1d88c459229ff6ce9e446 |     
    or1k     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/f779c86c0cc941aa7998b0ddf87733bdea095ae3 |     
    arc      |         libp11-0.4.11          | NOK | http://autobuild.buildroot.net/results/e075fd7a9b38df26ac0fe27af37d066323534546 | ORPH
  riscv32    |         libp11-0.4.11          | NOK | http://autobuild.buildroot.net/results/8bfe4f710630663f05e0264f255802a06f73ef3b | ORPH
   mipsel    |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/d0c5d142c3d48e8b9d1a8569d2c7130db2d7e0ff | ORPH
   arceb     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/c5bc226f79b27887902e60a3f84c1ded21661e16 | ORPH
   sparc     |  libtorrent-rasterbar-1.2.15   | NOK | http://autobuild.buildroot.net/results/16d37dc5cfac2da037fd2f3f26196152687572b5 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/df58bf581ec8d85f9b63a815eb61e4a614384481 |     
    arm      |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/28d3c90897c250291dd4c923cb9b13e52fad2243 |     
    arm      |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/bf6b7f12476f92da99d52de55495118407e5ce85 |     
   arceb     |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/4738941035194bbc7dd5c777751eb469a09cafe9 |     
    m68k     |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/ec533fa2457c3185d6733bab10a98695e69347d0 | ORPH
 powerpc64   |      linux-5.10.104-cip3       | NOK | http://autobuild.buildroot.net/results/5a70bbade74bd15d2743edacf92540151efc8401 | ORPH
   mipsel    |    linux-5.10.104-cip3-rt3     | NOK | http://autobuild.buildroot.net/results/fa02275dba99847e42d3f45aee2f42e6ee1a56f3 | ORPH
    mips     |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/ddb07988bba31153b65d1a05cfeb0a509a7c233f | ORPH
    sh4a     |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/cc5f49e3708a984fa35e333bb1bd8bf53164d382 | ORPH
  mips64el   |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/623a0e3e2cc72e0b8dade895af343f16d8dc9d97 | ORPH
    m68k     |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/9429f0a09098927b64dbdf28d3160ba7f37f2b4f | ORPH
    i686     |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/ffc543e685307b14ca58946286839ebab7b59610 | ORPH
    mips     |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/27ec2f87474b8d575fe03c6f7d037a8632e394b4 | ORPH
    mips     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/10582b38ff1482b5436ca3f640c6936d844ec6bf | ORPH
   xtensa    |     lttng-babeltrace-1.5.7     | NOK | http://autobuild.buildroot.net/results/e60aad25efd81e809df34bb65beaf605f78ff727 |     
    i686     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/c05dfafb7372d38147d64a43d465abe7499cfe47 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/5ce477773c82b6677cd0d6f593711373aae5ba3d |     
    arm      |          ndisc6-1.0.5          | NOK | http://autobuild.buildroot.net/results/8fd92e49d3c31340964c3e13635c701125e7647b | ORPH
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/f5de2492c832dc2a5cec75a7174fcf89bb3a9335 |     
  sparc64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/41d850c50fc5fec92d98f85361ddf86be5104f1b |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/9e4122bb67c4096d932425fd2461917cfb2b6d24 |     
    arc      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/060aa94631be1e4fbcf475686963f6d1c6647e5a |     
microblazeel |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/c31abb4231c2fefc83254ea13c46db51e4304794 |     
    arc      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/8f33c3526577abfaab52be9e26258cd2b5a10b37 |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/bfb99af66e03e10ca43f48dc14e5a7c104f3ed16 |     
   xtensa    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/96510acf81ff85dd46eddc598ff3b01a52496c9b |     
  aarch64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/cbe0a8fb31996b231ccb7110ca4d92c7555bd2ab |     
    i586     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/0421425f7d1d1aad3bf672946950701bc1d396ac |     
  riscv32    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/f3348ae02c4c01acc593662ba631e35860c6d373 |     
 powerpc64   |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/561a838abc3900d5bc89121d791743249dc91444 |     
  riscv64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/99edc3725e9138e22864777367047a1190f3012c |     
   mipsel    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/766d056847f9958e3a34e1e2fcc5f2702777e0d9 |     
   mipsel    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/f4aa59b2fe4951852bc8e27793beeeb0a0e5bb3d |     
 powerpc64   |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/91245fea11405d0f8d25a60a21379c405444a613 |     
  aarch64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/18f9b676573426386b39ea6019096a342fe16de2 |     
  powerpc    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/8377622ad8e0c5a9ebd47b43f657a380fcfaf385 |     
   arceb     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/565054527847bb6f7fc1f1a4730b62cdb0b19cea |     
   x86_64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/62ea8605108be20e336f4d2cf4892c6c6e3ac886 |     
   sparc     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/21e7c7fa9aa76f0857ebc3790166062014e741db |     
   sparc     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/18c093f7b187e44b9ba434fa3fb5b0c1cba2a626 |     
   arceb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/85abe1b72eff17f2555de1f5b0e14a3bd1e89c75 |     
 aarch64_be  |           php-8.0.19           | NOK | http://autobuild.buildroot.net/results/c63df45e0949474f953feea6a9b7854acb1fa0c7 |     
    arm      |           php-8.0.19           | NOK | http://autobuild.buildroot.net/results/92c965478a422f2bc0755cb5644f5cb66035c273 |     
   xtensa    |        pipewire-0.3.51         | NOK | http://autobuild.buildroot.net/results/61a2df127119eea7c913e9ebb7bcabe533132898 |     
 microblaze  |        pipewire-0.3.51         | NOK | http://autobuild.buildroot.net/results/854732d2a7056b441314d370c24a8b4802351869 |     
   xtensa    |        pipewire-0.3.51         | NOK | http://autobuild.buildroot.net/results/d0b0d0757e20a072126e808b1c4fe1f6819f139b |     
   xtensa    |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/d73c45eb00bff6e959d66cfd323ca247a44e3a88 |     
   xtensa    |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/a50f9208a41c660095bc2620a74af6cf503d3671 |     
    m68k     |           pppd-2.4.9           | NOK | http://autobuild.buildroot.net/results/195ec08af2344b2c021166c28112633852a1fea7 | ORPH
   arceb     |         proftpd-1.3.6e         | NOK | http://autobuild.buildroot.net/results/a894afd9451cde7cc5d1a2b8e533a9ff153645b4 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/f0f9e29a4f2e81bd362550a964f12182a3770aee |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/21bc1f13bf236cad209af80d9360869fa54ac45f |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/4e63e4bb062b5a0d332ae33463bdb8d2f43ef50a |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/5794c74eacd87334762c339045ee57e33a3d0e8c |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/4a943031ee15d26ecc1630acda1eac4145c09747 |     
 microblaze  |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/398e4ead70948e4e2392049eb93d1d95ea72f716 |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/d8c3d58aa0e58e9184508daf2ebad428d3e6c3ae |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/c4a50ccad03e34190238b36fcd5b1c329ed3bde4 |     
powerpc64le  |      python-orjson-3.6.7       | NOK | http://autobuild.buildroot.net/results/733d6f59a3cdc1ead499e28a88ae3ddd88f1b334 |     
  sparc64    |      python-orjson-3.6.7       | NOK | http://autobuild.buildroot.net/results/79552020baa510a44a3df50bf3003fa979cc3f6e |     
    arc      |       python-ujson-5.2.0       | NOK | http://autobuild.buildroot.net/results/7fa05f4ce212b1604780416e6c8208d44fbc64d1 |     
    arm      |         python3-3.10.4         | NOK | http://autobuild.buildroot.net/results/019d1171466bf2eb22c6fbdd54029c52d2da729f |     
microblazeel |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/5f07d6795df68146dc394c59860e8eab07757157 |     
  mips64el   |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/009f20100692b121159a41e7098837c9caae351e |     
   sparc     |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/842001e927897def5e0df65723c75164f1ebf7e6 |     
   nios2     |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/0deeadea6d28baca391d55907fbcd87d0f8809cc |     
   mipsel    |            rauc-1.6            | NOK | http://autobuild.buildroot.net/results/a1f14d48485c9bc9f33f401ee971ddeabb1fc9bb |     
    arm      |           refpolicy            | NOK | http://autobuild.buildroot.net/results/4c6c5df27abcbc75298b1725e7a5d7ae5d89deae |     
   mipsel    | ripgrep-af6b6c543b224d348a8... | NOK | http://autobuild.buildroot.net/results/684f49b1678335aac28b4e6b17a382014704a3da |     
microblazeel | rtl8723bs-11ab92d8ccd71c80f... | NOK | http://autobuild.buildroot.net/results/29c845dcca5e746a6722597132da915b4c3a021a |     
    arc      | rtl8812au-aircrack-ng-3a640... | NOK | http://autobuild.buildroot.net/results/1bd3e445b8393b261eb7552eb2545d133ded5548 |     
 aarch64_be  |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/cc409451bb974587270315fa3590a1892bd17402 |     
   xtensa    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/6f55bc1453b834c69fd49a01ad6760584c7faf8c |     
    sh4      |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/38ca0d1951fe79bae1c78422c8aae71d95795f3e |     
 microblaze  |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/f41d0c69fb35d544714cb8ce63a3a0eb4521f62c |     
   nios2     |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/dc79b16b56e1a3e262eca3fec9dedbd6c6631887 |     
  sparc64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/d5071988a7dbda640324e5cd745297b67a2bde30 |     
  sparc64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/942d7f83399107ab622a56667cab31a5e86e4810 |     
microblazeel | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/fc1c4bebbfde3f45ad8274d650e415e70013a15c | ORPH
    or1k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/24907f537c215e2dd1f1e2fe691e56f3c95ec414 | ORPH
   x86_64    |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/faa925eb9e932bb92e5066736e4023e04345cc3e |     
microblazeel |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/ff5863f9c581a0909d749c3f2d36a72625e70860 |     
microblazeel |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/7f8b71a4141786d377c2230b9bfe27975630b2b1 |     
 microblaze  |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/e1c59cf34a2a28597f47d2877e50530ef229e8b5 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/558fad97bfea2cc3e0d004d7b57781e76e2b9fce |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/ed62adba600473100224abfe992aa329e06833b5 |     
  riscv64    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/c25c63385f6b8cf926fa07686d04a93432f7f04b |     
    arm      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/daeae43e9b1e3b4b430f7d801574d925007cff6c |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/c461b119ed0e74f3fb0dbd5626cdc5fde6d20bba |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/3fca4a088855154615e96e8c1f02ec0edcf50c7c |     
    arc      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/0192aed80dd07086a186fb0719dbe290833b1135 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/0a8e900c3e480e952ff525e781371ec4ca5a0fc6 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/a390d85d3d2c90e04047a1f3d60df5b35dbbc810 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/e5a866236ce22c6621ae5f7f9a403d18bfdebd47 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/2f395b16ea815dc264884a58172613512bf543b2 |     
    arc      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/6369fb5b7b0a3e7b538c0919ab2f3cbf3390a237 |     
  powerpc    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/af7206ec1df9e1648a5d28d3fbf1e2afd5307cde |     
  sparc64    |            xenomai             | NOK | http://autobuild.buildroot.net/results/8454abfbc1c25b64dc60ef3fc3d367b6ae4e2863 |     
   xtensa    |            xenomai             | NOK | http://autobuild.buildroot.net/results/8d60a32d556e54604c01c7a67416649390192ed1 |     
   mipsel    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/7a40d4650e11a69caa74e07c4c8f7a43d0c97886 |     
    mips     |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/dda84c0c6cb10003a62fe4838d461ad37e6abec1 | ORPH
    arm      |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/47d9984cc7bd0e674098b9023b59ff4c6ddaf2ec |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/eb6ac64627e7cfd4195944e4e7b2b1dcc7b37ab0 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/ef8253eb096d668ed68249c2f5d042c285eb7334 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/5dca3bcb53bca6ceccd53cb1fcec2125066329c4 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/754c1bbf4a3e306799681792a25489878d4a035d | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/905f4a32bc4a4b99d365a323cf3111d12a3ea751 | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

tvheadend-1295dd2be863f5beb... | 2 
                    bat-0.19.0 | 1 
           host-python3-3.10.2 | 1 
                 mesa3d-21.3.5 | 1 
                   perl-5.34.0 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/81432dc104b14ad6ada8a82b82c0cb7189db7558 |     
  nds32le    |      host-python3-3.10.2       | NOK | http://autobuild.buildroot.net/results/178050497a6f554ee15e96da423ebffd353f6555 |     
    arm      |         mesa3d-21.3.5          | NOK | http://autobuild.buildroot.net/results/758bf15ebdb194a2d706825f26c5b2fe7da1e1b4 |     
  powerpc    |          perl-5.34.0           | NOK | http://autobuild.buildroot.net/results/a8483f9e6c4682245b35828a83a2d486943e7241 |     
    arm      | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/10018b1cc468e0a5a94cc74c0f4e07f27076c582 |     
   x86_64    | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/2c4ffbcc4a260d695e5b43f70f647ec8ff1ef4b5 |     


Gitlab CI results for 2022-05-20
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                amarula_a64_relic | https://gitlab.com/buildroot.org/buildroot/-/jobs/2477067099  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/2477067135  |      
                      bananapi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2477067155  |      
                 bananapi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2477067156  |      
                 bananapi_m2_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2477067158  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/2477067163  |      
                     csky_gx6605s | https://gitlab.com/buildroot.org/buildroot/-/jobs/2477067176  |      
            friendlyarm_nanopi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2477067222  | ORPH 
       friendlyarm_nanopi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2477067224  | ORPH 
           friendlyarm_nanopi_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/2477067231  |      
     friendlyarm_nanopi_neo_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2477067233  |      
            friendlyarm_nanopi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2477067235  |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/2477067238  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/2477067264  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/2477067266  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/2477067271  |      
                    licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/2477067287  |      
        minnowboard_max-graphical | https://gitlab.com/buildroot.org/buildroot/-/jobs/2477067307  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2477067362  |      
                    orangepi_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2477067367  | ORPH 
                  orangepi_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2477067370  |      
                     orangepi_win | https://gitlab.com/buildroot.org/buildroot/-/jobs/2477067371  |      
         qemu_arm_versatile_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/2477067386  |      
             qemu_arm_vexpress_tz | https://gitlab.com/buildroot.org/buildroot/-/jobs/2477067390  |      
                qemu_m68k_mcf5208 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2477067391  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/2477067459  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/2477067471  |      
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2477067486  |      
        terasic_de10nano_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2477067522  |      



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

