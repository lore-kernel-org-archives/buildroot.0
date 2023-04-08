Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA4EC77B61
	for <buildroot@archiver.kernel.org>; Sat,  8 Apr 2023 05:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 544EB60F40;
	Sat,  8 Apr 2023 05:33:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 544EB60F40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wNUTjQGU-FBU; Sat,  8 Apr 2023 05:33:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33FB260F5E;
	Sat,  8 Apr 2023 05:33:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33FB260F5E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4025F1BF846
 for <buildroot@lists.busybox.net>; Sat,  8 Apr 2023 05:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 183944013D
 for <buildroot@lists.busybox.net>; Sat,  8 Apr 2023 05:33:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 183944013D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CJXQHgio4N4m for <buildroot@lists.busybox.net>;
 Sat,  8 Apr 2023 05:32:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4F90400A4
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A4F90400A4
 for <buildroot@buildroot.org>; Sat,  8 Apr 2023 05:32:56 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E569320008
 for <buildroot@buildroot.org>; Sat,  8 Apr 2023 05:32:53 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 08 Apr 2023 05:32:53 -0000
Message-Id: <20230408053300.183944013D@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1680931974; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=57PFvLTvti28AuNBitjNToPootl/9b1OHRNZZv6mCZ8=;
 b=RYx17DqyF6fn99/FZHv5rxrUBZOgaZ/BkfDYVSZpUnFTPLd/mFPTM1eHoefTkEYFJ7pPRm
 SlCbEnCFaqOBoVuKeGddGRAI/ioI+ZfifIy5ECYdv53lMfQgrEdGUU1OKyg20iT0PH7XbH
 jM6oN7MgkaG9UdcWeS9K+K1RCDJR2tSzXmEfn8bHZOKzR+A7lj4YfPrac+3aooQfMnnh0q
 goMsU33vdNekrXiv73yFHaRqBJL50tIepSZidv0P9mAr5VtUbZHKQEfkEMB+D02Am0YIY3
 40TVvNtdYZsAhbLzAcxDK2a4vKOb/Vqe8jUjZIWmUpzVqR0pxSvxTqaIdoZR5A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RYx17Dqy
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-04-07
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

Autobuild statistics for 2023-04-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 10  | 15  |  0  | 25  |
    master   | 124 | 98  |  2  | 224 |

Classification of failures by reason for master
-----------------------------------------------

               host-qemu-7.2.0 | 8 
                host-go-1.19.8 | 7 
                       unknown | 7 
             bluez5_utils-5.66 | 5 
                 agentpp-4.6.0 | 4 
            host-binutils-2.38 | 4 
         host-gcc-final-10.4.0 | 4 
                  linux-6.1.14 | 4 
glibc-2.36-81-g4f4d7a13edfd... | 3 
  gobject-introspection-1.72.0 | 3 
              host-rust-1.68.0 | 3 
fs/ubifs/ubifs.mk:49: /home... | 2 
         gobject-introspection | 2 
              libgcrypt-1.10.1 | 2 
              liquid-dsp-1.4.0 | 2 
                    olsr-0.9.8 | 2 
             batman-adv-2022.3 | 1 
                   bird-2.0.11 | 1 
                busybox-1.36.0 | 1 
                  check-0.15.2 | 1 
              dropbear-2022.83 | 1 
                  ffmpeg-4.4.3 | 1 
       freeradius-client-1.1.7 | 1 
fs/cloop/cloop.mk:33: /home... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubi/ubi.mk:51: /home/tho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                 fwts-22.09.00 | 1 
                    grub2-2.06 | 1 
            host-binutils-2.37 | 1 
         host-gcc-final-11.3.0 | 1 
         host-gcc-final-12.2.0 | 1 
               libglib2-2.72.3 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                   linux-tools | 1 
            live555-2021.05.03 | 1 
        ltp-testsuite-20220930 | 1 
          lttng-modules-2.13.7 | 1 
                  ntp-4.2.8p15 | 1 
            ocf-linux-20171122 | 1 
               openblas-0.3.21 | 1 
                   perl-5.36.0 | 1 
           uboot-tools-2021.07 | 1 
                 uclibc-1.0.43 | 1 
uclibc-ng-test-6790eafe897b... | 1 
ulog-0389d243352255f6182326... | 1 
                 wolfssl-5.5.3 | 1 
x264-baee400fa9ced6f5481a72... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/c5989a36ab9f257289ebe0aa8c98e6eacf24ec99 |     
  sparc64    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/3e181edc4a9639924f106c938fcabd698e1cb231 |     
    or1k     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/c988aac906899515dc9575acd4325eb8705040f8 |     
  sparc64    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/67107210bdeec5de7c976f261dc820cf72af826a |     
    mips     |       batman-adv-2022.3        | NOK | http://autobuild.buildroot.net/results/01e77e140eb57a20143750d8c892e3b8838902c0 |     
   mips64    |          bird-2.0.11           | NOK | http://autobuild.buildroot.net/results/a629fcc9f75d4f3749309521ceeb10e06f6beeb9 |     
powerpc64le  |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/41c71f42f40027acc489027e2c33e1fd8f87accd |     
   mips64    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/108ac005c8d3501ecc2cccd958a2ddee34c0cd39 |     
   x86_64    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/9e76baed0929c655a169a9cc62f1e24bb5010b91 |     
    i586     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/ee097f1c8c6833313d5e2502f53ecb4e9027cac3 |     
  aarch64    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/3dd34a51a8b07b9db6cd2708a19d4c598a76c541 |     
  aarch64    |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/8f6bc7860eb05b2702b4350e7a3a0d924dacf1bb | ORPH
  sparc64    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/f47884533301df1d5b15171c28409a59c6874fe5 | ORPH
  riscv64    |        dropbear-2022.83        | NOK | http://autobuild.buildroot.net/results/578cab40b8e213be3fc4cf843c0e09e3e997ac20 |     
   mips64    |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/7d38fac70415a2dc4ce89e9c79162a6f92ed54a6 |     
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/79c4e9a5e5c78830c25810194db673a8d0c7e924 |     
  sparc64    | fs/cloop/cloop.mk:33: /home... | NOK | http://autobuild.buildroot.net/results/7b839d075ec3b4c8b19a298ab3fd2e934bb47818 |     
  sparc64    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/3c3fdf1109aea46bb7e4c2a199ca2cc78c4bf708 |     
 powerpc64   | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/91e5f6a8d3a48f3f337b8ef579507cafc207a4cc |     
  aarch64    | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/a659c82f660328aaa5cfb92ea68e4d6e6695e4df |     
  riscv32    | fs/ubi/ubi.mk:51: /home/tho... | NOK | http://autobuild.buildroot.net/results/f6967ca7991ab0f5ddb42532da942d764a6474ba |     
   nios2     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/7ce40edc8fb069a5eaabf79a028131a6ab40bffa |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/886f8413965bd59ff5886e863541833738cfac94 |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/9511d9127915448e3426d3e782f9101945e9e69a |     
   sparc     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/1eb9677663c3b19847e94ee6d8b062c5855c3146 |     
microblazeel | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/ee8da647d3b75e1976f14205c4509e0ab6e5bfc8 |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/ee4f0c6a9635b71062ccae5e319ff81d38e2698d |     
   x86_64    |         fwts-22.09.00          | NOK | http://autobuild.buildroot.net/results/30d76cd69f2df18acc4812398ed7180e4c2acd4a |     
    arc      | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/af95eab52f2c4c3a2eed6154ef595dc3632de95e |     
    arc      | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/e4ea4c50dc97594c7e23eb5daf83ca2465ae0e78 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/8e835a1635b9293cc2c42792ab4b9122065189b7 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/a6949e6bda06fd74da8133b79cb6983d63ded4bf |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/cf2aac0baa6823a38990661a83b2d29280604577 |     
   mipsel    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/2c2cb13a571a52a943be2c63dc99b23ddad60145 | ORPH
   mipsel    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/c67e845d204e96a8556370075f052adbd70f39d0 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/30f31b7a751ac6f55653f6a4c889b8fb36acf999 | ORPH
    arm      |           grub2-2.06           | NOK | http://autobuild.buildroot.net/results/86487c370bb55e9af0f860496e01c2af8d148552 |     
 powerpc64   |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/0a84bbcbd28765ad0edd2e0a71b56230e8e78220 |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/c191cdc07c9d9891a75d3fde068d7aa423ea2da5 |     
    i686     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f0e45c8e779419d63d842f1e8022e75a45984fc2 |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/edaa459c7418ddf8070f3537cfbed4986f1fe48d |     
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/7fe2526dd1a459fadcf4b162924bc5e76246aa34 |     
microblazeel |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/d411e3a45dcfd89b964f7ca108d07303117ff5fc |     
   mips64    |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/013641469bfb2808b9c7aed0e96a855567c72778 |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/65ca5d85625ed67b5e4ed5eccb0e29a9d15bfe26 |     
    or1k     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/57aaf82a3a442e8dd6722d88e4fc45d58d4b059b |     
    m68k     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/01c7e0d2077299752c6a5c6b079cae7e93e829a6 |     
microblazeel |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/fd99d491523b607fe3393c64ab51e4284acbd193 |     
    i686     |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/d978d27845d1fecd58d9d1d004b442f43e362c90 |     
   mips64    |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/a64dd08a4081a1dde5577ab144550dcdadee8d7c |     
powerpc64le  |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/edfb9f010f8088358ef61ecdacbea98ef8dbcd34 |     
  mips64el   |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/059f4a44b51cf0c625cd15314e3c4f67166d765e |     
  mips64el   |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/f281f106e020f1c421fc97f00d2eef2132075f38 |     
    i686     |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/5315fabbd060b6baf6245f7af4e3cb6370e5c95c |     
   mips64    |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/e25f195e171cfcb99f56c1a3647bf584aa35e1d6 |     
   nios2     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/a7f86ed13c4de90cee0b9e245d711fde0a427049 |     
    or1k     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/014a5bc2bb3e281561656be5a4da93dc32037e8e |     
microblazeel |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/9194c8d058dbbe53839c8a1393e1dd9e4d80f7dc |     
   s390x     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/a0b2058f31f8abd52a449831e8733273989a80b9 |     
   nios2     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/3e540b0e6d9947865851f73b03a5966f39c0e27c |     
   sh4eb     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/da09a13ad0f02bb3b553182feab203a0189c3dbc |     
   s390x     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/e917fecd45168bb7acf2257d2d01b5596942624b |     
    mips     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/54eb80b21f3d32140066711086f12c8e99291fb4 |     
   armeb     |        host-rust-1.68.0        | NOK | http://autobuild.buildroot.net/results/3a1f93dfc1eff5674f9e193d23dd2c51f29a39fa |     
   mipsel    |        host-rust-1.68.0        | NOK | http://autobuild.buildroot.net/results/4df550a158ebaec6424f255fc4bd94013815c9d1 |     
   x86_64    |        host-rust-1.68.0        | NOK | http://autobuild.buildroot.net/results/9cfda86c18a181f1fa676e64c46f1d51a5644b6d |     
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/48b93e9197c3e0c9466ff2727d12cd0834f2ddb4 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/e1a253b217aa2935a6d582094b78eb2fe3e96122 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/a7541bc9bd50234abcc8c8e999e10998102fded0 |     
    mips     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/7aaa0f1fe7a5e3d210a2051047c1c9d9dab19141 | ORPH
   nios2     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/15393f277277ec14805f5c44ed9483ab62b11136 | ORPH
    sh4a     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/fd38c55eb4ead0d8487f98b8d60345fe8d366157 | ORPH
   mips64    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/82b4d911c9dcc83e81a1f9801ae6a8985544664c | ORPH
  mips64el   |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/e229e2351d048b65fc79555f8f26b62f71d25e42 | ORPH
    m68k     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/e344956a9ea19a1b407b67b250fec1d5623a3d25 | ORPH
   x86_64    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/fab08035b97ec4f9c2b41b48fdebab4d11cc5715 | ORPH
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/dcd8940c80ed1108f302a6183242e8c98395226c |     
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/93191172cc1ab7884172da9e571fea5fa4fbdd17 |     
    arc      |       live555-2021.05.03       | NOK | http://autobuild.buildroot.net/results/c29b609aa1e33b74e9be7ba197f436a923b4554d | ORPH
  mips64el   |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/d510ced96c4f967458f09138e58e8286c7d942d2 |     
 powerpc64   |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/ce54d6a2bbb030460078af268029b4c4e9c00566 |     
   sh4eb     |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/ba95acb7de1ca890e9db91c0e3cd15faf374114d | ORPH
   sh4eb     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/46f330789634da922dbdb820e1dfab392278561d | ORPH
    or1k     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/2b44eb9c25a856c5a083501b4af2eec5d435ef8c | ORPH
  sparc64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/1a086f960a4883dcf30e718151b301510f5dd4e8 | ORPH
   mips64    |        openblas-0.3.21         | NOK | http://autobuild.buildroot.net/results/e9f3b2b379158e517e128d784aac778b2e87891f | ORPH
    mips     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/7c01f6b8741ec0908b5831a8583746beace191fd |     
   sh4aeb    |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/1f18c3a55ec7792b89cfe3a60db0180157eb1c80 | ORPH
   xtensa    |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/e07c9dd96ec6edc376b9db72e3997a210f0c8767 |     
   mips64    | uclibc-ng-test-6790eafe897b... | NOK | http://autobuild.buildroot.net/results/69423b3ef58786d76204d158dad331a61bdd638e |     
    i686     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/2476c779b7f0f89292a3fd651c54e8774b2ac08b |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/73c464fd9eb7c337ce6389cbc705307670d1c431 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/67ae3aa7b85bd2845878ab75da9806cdb10742c9 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/8d37a75cee6d76b87f119310c133ed6bbe91f40d |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/c77f60b25050c89ab2c0febee1288a34aaffff4f |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/5c49006e449dca513b177c60f71c7f40c7024d24 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/fcdcbbe6abb3d82d3979861d66f8179ecd65a430 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/74b3a95cf574933f26f10a97c28f99dc86c572ef |     
    arm      |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/1fc39a6689ff32ad85cd49d7f23fd245c6c9c7ef |     
    i686     | x264-baee400fa9ced6f5481a72... | NOK | http://autobuild.buildroot.net/results/e1a68c8f289d74f20137615aa8ea8b45ba3ffbb4 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

  gobject-introspection-1.72.0 | 2 
                   perl-5.36.0 | 2 
           crucible-2022.05.25 | 1 
                elfutils-0.186 | 1 
            host-binutils-2.39 | 1 
                host-go-1.19.7 | 1 
              host-rust-1.67.0 | 1 
        ltp-testsuite-20220930 | 1 
          lttng-modules-2.13.7 | 1 
                    olsr-0.9.8 | 1 
           openjdk-11.0.14.1+1 | 1 
               pcsc-lite-1.9.9 | 1 
               tcf-agent-1.7.0 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/95fb98fd3eaac293dd37510058b23b4e52c008f1 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/7ba86e3a2cbfdf62dc59ec20159b6c93a50b44f2 | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/466c0248bbdef27faefb493e3b24d91f1e9aae1a | ORPH
 microblaze  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/0aba19d0d76e69fcf0e79c6006c37e30cb698900 | ORPH
   mips64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/996895f6e5a7df4a843c9d2973d4a92dd018382a |     
   mips64    |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/de6de06e63464c51e25185158cf777ac159e42c8 |     
    arm      |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/aa8b5512309839a17e050d92b20469a190ccd396 |     
   s390x     |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/e4a30074d5e357aae783ee806fee216594b90e59 |     
   x86_64    |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/d2e5d5d50bc6e7da2f7ff1945f12b13985fcb1db |     
    or1k     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/470c1252519c8343e5c879e1d947479939690588 | ORPH
   sh4aeb    |      openjdk-11.0.14.1+1       | NOK | http://autobuild.buildroot.net/results/02ae5358bce65a9fe8766b82fb0c93b92d76f161 |     
    or1k     |        pcsc-lite-1.9.9         | NOK | http://autobuild.buildroot.net/results/f0d96c3f1305e350da7f4c63e3090ed409001b5c | ORPH
   xtensa    |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/c9618015cd752f4953fe485bea9320e7dc63ce68 |     
   sparc     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/ec5fc0a2cda2cf35a9e1734134b908ba105abe97 |     
microblazeel |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/f7f8b99fa5e91b3068d5bec1192ed87c1d5e6e45 |     


Gitlab CI results for 2023-04-07
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
       acmesystems_aria_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072132  |      
       atmel_sama5d3_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072182  |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072183  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072184  |      
           atmel_sama5d4_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072185  |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072186  |      
       atmel_sama5d4_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072187  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072188  |      
                        avenger96 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072189  |      
                bananapi_m2_ultra | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072190  |      
                 bananapi_m2_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072191  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072192  | ORPH 
                   beagleboardx15 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072193  |      
                       beaglebone | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072195  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072197  |      
                     beagleboneai | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072199  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072200  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072201  |      
               broadcom_northstar | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072203  |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072204  |      
                   chromebook_elm | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072206  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072208  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072210  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072211  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072212  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072214  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072217  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072218  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072220  |      
               freescale_imx28evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072222  |      
        freescale_imx6dlsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072223  |      
          freescale_imx6dlsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072224  |      
         freescale_imx6qsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072225  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072226  |      
          freescale_imx6sxsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072227  |      
             freescale_imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072228  |      
           freescale_imx7dsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072229  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072230  |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072232  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072233  |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072234  |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072235  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072237  |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072238  | ORPH 
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072240  | ORPH 
          freescale_t2080_qds_rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072242  | ORPH 
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072244  |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072246  |      
          globalscale_espressobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072248  |      
                 grinn_chiliboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072251  |      
                  grinn_liteboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072252  |      
                 hifive_unleashed | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072254  |      
                         imx23evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072256  |      
                   imx6-sabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072258  |      
                     imx6-sabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072259  |      
                 imx6-sabresd_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072261  |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072263  |      
                       imx6sx-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072265  |      
                        imx6ulevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072267  |      
                       imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072271  |      
                       imx6ulpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072274  |      
                        imx7d-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072275  |      
                        imx7dpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072277  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072281  |      
                imx8mn_bsh_smm_s2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072283  |      
            imx8mn_bsh_smm_s2_pro | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072284  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072285  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072286  |      
                kontron_bl_imx8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072287  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072288  |      
              kontron_smarc_sal28 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072289  |      
                          lafrite | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072290  |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072291  |      
                    licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072293  |      
               linksprite_pcduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072295  |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072298  |      
                mender_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072300  | ORPH 
          microchip_sam9x60ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072302  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072306  |      
 microchip_sama5d27_wlsom1_ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072309  |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072312  |      
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072313  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072315  |      
          microchip_sama7g5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072318  |      
      microchip_sama7g5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072320  |      
                  minnowboard_max | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072322  |      
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072324  |      
                          mx51evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072325  |      
                         mx53loco | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072329  |      
                         mx6cubox | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072331  |      
                   mx6sx_udoo_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072333  |      
                          mx6udoo | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072335  |      
                      nexbox_a95x | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072337  |      
                            nezha | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072338  |      
                      nitrogen6sx | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072339  |      
                       nitrogen6x | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072340  |      
                        nitrogen7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072341  |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072343  |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072345  |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072346  |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072348  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072350  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072352  |      
                         odroidc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072353  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072355  |      
        olimex_a10_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072356  |      
             olimex_a13_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072357  |      
        olimex_a20_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072359  |      
       olimex_a20_olinuxino_lime2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072358  |      
       olimex_a20_olinuxino_micro | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072360  |      
             olimex_a33_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072361  |      
             olimex_a64_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072363  |      
          olimex_imx233_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072364  |      
    olimex_stmp157_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072366  |      
                         olpc_xo1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072369  |      
                       olpc_xo175 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072368  |      
                    openblocks_a6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072371  |      
                    orangepi_lite | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072377  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072373  |      
                     orangepi_one | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072378  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072380  |      
                      orangepi_pc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072381  |      
                 orangepi_pc_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072383  |      
                      orangepi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072385  |      
                    orangepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072386  |      
               orangepi_zero_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072388  |      
              orangepi_zero_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072387  |      
                       pandaboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072390  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072391  |      
                    pc_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072392  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072393  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072395  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072396  |      
                qemu_aarch64_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072398  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072400  |      
                qemu_aarch64_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072401  |      
                    qemu_arm_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072402  |      
               qemu_arm_versatile | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072404  |      
                qemu_arm_vexpress | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072406  |      
             qemu_arm_vexpress_tz | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072407  |      
                qemu_m68k_mcf5208 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072408  |      
                   qemu_m68k_q800 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072411  |      
            qemu_microblazebe_mmu | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072412  |      
            qemu_microblazeel_mmu | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072414  |      
              qemu_mips32r2_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072418  |      
            qemu_mips32r2el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072422  |      
              qemu_mips32r6_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072426  |      
            qemu_mips32r6el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072430  |      
                qemu_mips64_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072433  |      
              qemu_mips64el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072434  |      
              qemu_mips64r6_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072435  |      
            qemu_mips64r6el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072436  |      
                 qemu_nios2_10m50 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072437  |      
                        qemu_or1k | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072438  |      
                 qemu_ppc64_e5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072442  |      
               qemu_ppc64_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072444  |      
            qemu_ppc64le_powernv8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072447  |      
             qemu_ppc64le_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072449  |      
                  qemu_ppc_bamboo | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072451  |      
                  qemu_ppc_e500mc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072453  |      
                 qemu_ppc_g3beige | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072456  |      
                   qemu_ppc_mac99 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072457  |      
               qemu_ppc_mpc8544ds | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072459  |      
                qemu_riscv32_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072460  |      
          qemu_riscv64_nommu_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072461  |      
                qemu_riscv64_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072462  |      
                       qemu_s390x | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072463  |      
                     qemu_sh4_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072464  |      
                   qemu_sh4eb_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072466  |      
               qemu_sparc64_sun4u | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072467  |      
                  qemu_sparc_ss10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072468  |      
                         qemu_x86 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072471  |      
                      qemu_x86_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072469  |      
                 qemu_xtensa_lx60 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072473  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072475  |      
                      raspberrypi | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072495  | ORPH 
                     raspberrypi0 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072477  | ORPH 
                    raspberrypi0w | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072479  | ORPH 
                     raspberrypi2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072482  | ORPH 
                     raspberrypi3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072487  |      
                  raspberrypi3_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072484  | ORPH 
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072488  | ORPH 
                     raspberrypi4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072494  | ORPH 
                  raspberrypi4_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072491  | ORPH 
                 raspberrypicm4io | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072499  | ORPH 
              raspberrypicm4io_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072497  | ORPH 
                raspberrypizero2w | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072500  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072501  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072503  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072505  |      
                        rockpro64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072509  |      
                      roseapplepi | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072512  |      
                 s6lx9_microboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072515  |      
                       sheevaplug | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072518  |      
                 sipeed_lichee_rv | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072522  |      
            sipeed_lichee_rv_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072525  |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072527  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072531  |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072533  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072535  |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072536  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072538  |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072540  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072543  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072545  |      
              snps_archs38_axs103 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072550  |      
                snps_archs38_haps | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072555  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072557  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072558  |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072562  |      
          solidrun_clearfog_gt_8k | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072565  |      
            solidrun_macchiatobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072568  | ORPH 
                    spike_riscv64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072570  |      
              stm32f429_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072574  |      
               stm32f469_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072576  |      
              stm32f469_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072577  |      
                  stm32mp157a_dk1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072578  |      
                  stm32mp157c_dk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072579  |      
              stm32mp157c_odyssey | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072580  |      
        terasic_de10nano_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072581  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072582  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072583  |      
                           ts5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072584  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072585  |      
                         uevm5432 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072588  |      
                    versal_vck190 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072591  |      
                       visionfive | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072595  |      
                      visionfive2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072593  |      
                        wandboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072596  |      
                            warp7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072597  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072600  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072602  |      
                      zynq_qmtech | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072603  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072605  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072606  |      
                zynqmp_kria_kv260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072608  |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072609  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4071072611  |      



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

