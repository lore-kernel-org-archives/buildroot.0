Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3489C7618E
	for <buildroot@archiver.kernel.org>; Sat, 22 Apr 2023 05:32:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B5BA4285B;
	Sat, 22 Apr 2023 05:32:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B5BA4285B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hjV8BVQ9MQel; Sat, 22 Apr 2023 05:32:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D78D94285C;
	Sat, 22 Apr 2023 05:32:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D78D94285C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A5F3D1C2999
 for <buildroot@lists.busybox.net>; Sat, 22 Apr 2023 05:32:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7BE744026F
 for <buildroot@lists.busybox.net>; Sat, 22 Apr 2023 05:32:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BE744026F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PlNxpehquZUl for <buildroot@lists.busybox.net>;
 Sat, 22 Apr 2023 05:32:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5744A400CC
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5744A400CC
 for <buildroot@buildroot.org>; Sat, 22 Apr 2023 05:32:33 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 69CAEFF805
 for <buildroot@buildroot.org>; Sat, 22 Apr 2023 05:32:31 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 22 Apr 2023 05:32:31 -0000
Message-Id: <20230422053237.7BE744026F@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1682141551; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Bae5eoCw9L1WLt22qpq7Gr5x2PLSAEpQasdvwiW6pyA=;
 b=Vqt5KMQa6txBZm8ctL2n8T5N4yehwqZpEb4CDIZNNLZgHlkjFZ08O1Sx/QaRQZCJRBaZfV
 i6Zx6N5m+FLC1ic7oa4FrhWWuS+lV1O8Qw8HUGL7ssZsLbo6wQQ8uv3sFyg5cyNxFB7UKS
 Hl7jdrlWhvQSVN4zB0T6bofx9V6t8dUOFPnZH2fENgPj3I4G3ZCFjln4c0Rk61w6oR930A
 QTnjUT2tjKpjcyBHOqemo9mqKLfLEXVqHKVWqd1mr7rYf1MMQlk2lBDNN911DLgXZ4bvWR
 VO8oW74xtT8ShlSADDMDJcn1I15xh/vVienqp3H7JUdIAHi4qkI2kiPS/JplJA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Vqt5KMQa
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-04-21
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

Autobuild statistics for 2023-04-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  6  |  6  |  0  | 12  |
    master   | 146 | 89  |  2  | 237 |

Classification of failures by reason for master
-----------------------------------------------

                elfutils-0.186 | 9 
  gobject-introspection-1.72.0 | 6 
            host-binutils-2.38 | 6 
               host-qemu-7.2.0 | 4 
         host-gcc-final-10.4.0 | 3 
                 agentpp-4.6.0 | 2 
glibc-2.37-2-g9f8513dc64119... | 2 
            host-binutils-2.37 | 2 
         host-gcc-final-11.3.0 | 2 
                host-go-1.19.8 | 2 
        liblog4c-localtime-1.0 | 2 
          linux-5.10.162-cip24 | 2 
                  linux-6.1.14 | 2 
                 uclibc-1.0.43 | 2 
                    4th-3.64.1 | 1 
                busybox-1.36.0 | 1 
             cni-plugins-1.2.0 | 1 
             dahdi-linux-3.2.0 | 1 
                 dc3dd-7.2.641 | 1 
                        ffmpeg | 1 
             fontconfig-2.13.1 | 1 
                     frr-8.4.2 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                 glibmm-2.68.2 | 1 
                     gmp-6.2.1 | 1 
         gobject-introspection | 1 
                    grub2-2.06 | 1 
           heirloom-mailx-12.5 | 1 
         host-gcc-final-12.2.0 | 1 
              host-rust-1.68.2 | 1 
igh-ethercat-2e2cef61318953... | 1 
                  libbpf-1.1.0 | 1 
               libglib2-2.72.3 | 1 
                  libjxl-0.8.1 | 1 
               libsigrok-0.5.2 | 1 
                libxml2-2.10.3 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                   luvi-2.13.0 | 1 
                     lxc-5.0.2 | 1 
                    musl-1.2.3 | 1 
             netsniff-ng-0.6.8 | 1 
        network-manager-1.42.0 | 1 
                  ntp-4.2.8p15 | 1 
            ocf-linux-20171122 | 1 
                    pixz-1.0.7 | 1 
           python-pyicu-2.10.2 | 1 
                    qemu-7.2.0 | 1 
            quickjs-2021-03-27 | 1 
                    sdl-1.2.15 | 1 
                   shadow-4.13 | 1 
                speechd-0.11.4 | 1 
              webkitgtk-2.38.5 | 1 
                 wolfssl-5.5.3 | 1 
                  xvisor-0.3.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |           4th-3.64.1           | NOK | http://autobuild.buildroot.net/results/633ae8ac6dbfc0eabc4c6a99a61e96e45817638f |     
   x86_64    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/8b179a44af4e0e70569339ebd241e3214bb6f8f7 |     
powerpc64le  |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/95ac036569078618eb016db29b69f0642ff063ef |     
    mips     |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/dc8fa6891ec0f3e1b444c98102b1fedf9a33e7c3 | ORPH
   x86_64    |       cni-plugins-1.2.0        | NOK | http://autobuild.buildroot.net/results/03065a95cd4fdd00bc73330076e1bb743a54ab94 |     
   mips64    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/ae9f175019fb69d2e936abcb987438ea3ddc4a70 |     
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/4cb80e0f453d94a370ed431f773564584c8310f1 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/994558288a505ad5055a0ea3b66805de1e6e7d84 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/c2e658d5be6726627f0edf0ed722a4cd37604f10 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/17cf63663244dd2ea14a625dedf0ed192258a5aa | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/ea9ff41b57e836acce108d4a7240fdb7fe2e05de | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/d7a6af5a0b1f67eebbd0965bf227692e74837ac9 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/51a674744fbe69918ba5479712e8374ab4faef7d | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/8d054fd43055c0373e95ea43c5ea2123bc417836 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/157eda7d5db5c8ad50c504e738091f0084ac7195 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/0f4992d20da74830b9631805e96f6a0cf6d63f59 | ORPH
  riscv64    |             ffmpeg             | TIM | http://autobuild.buildroot.net/results/1da6401341c3429dc0138d45f43d34f663a6e815 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/9f4480d126d635f2778ef54dd7bf0d81d86dfb6e | ORPH
   xtensa    |           frr-8.4.2            | NOK | http://autobuild.buildroot.net/results/edb164cb24b04992785518d5f9f36172841e9fbb |     
  aarch64    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/f1314d1fe1e0d14fee94bcff2f01c6126a792dee |     
    arc      | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/0844e0a0e214747fc45e24cf4d6cd3efa5d261c9 |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/d4b0f50abbe8dd25c47fa0de6b52888d8b8a2342 |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/a642f8c957cdfa440428cc3e2de1ced4b6ce7e3d |     
  riscv32    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/132bc2b7b4452c1fd0906c3351035d337a2a2780 |     
   mips64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/51e53aeae045d3d75e58514227d5ed4653383e0e |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/dfdf063b5306a8aa1d7b493c5a8c5eb0162efa48 |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/1c6c4bcc4855f2f7a7ee195795c071193957e1f9 |     
    or1k     |         glibmm-2.68.2          | NOK | http://autobuild.buildroot.net/results/5683072c9888c0d2a2828dee5e87e3dcef1959c5 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/760f7263108cc034d26a5aff935569d64f0412e3 | ORPH
   armeb     |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/a6fd2d26049cab3cad4fd13a03cc23f3e4628ada |     
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/f9d2ea84f440aa4adee981a1f96118490a3e4f36 | ORPH
microblazeel |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/666fd2ea062a62e5102cc953ae88b7a1ae1cdaba | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/177f7dcc7a3e50161c3e0820560c95bcb71b0c29 | ORPH
    i686     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/18560f77a8767e61f8d01b52a3bf07d47353ea76 | ORPH
  powerpc    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/054dd3ac0993f050503390e85103af5ade1e506a | ORPH
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/deb4f35e6dbe2d7e3388d8a7cdd6fa4359e2b1fe | ORPH
    arm      |           grub2-2.06           | NOK | http://autobuild.buildroot.net/results/6aa57b5a885d1fa97334b69c1356462918c4e108 |     
   sh4aeb    |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/23618d935b0911e360d643a54f5b28516ea94175 |     
   arceb     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/2a16711423c74b796108f47b62d428ac41ef7726 |     
    or1k     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/34ab1ece8611201e7dee0698f7f6ccda34eef01d |     
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/374845b94799ac7f68dea06d862aceed330cecf4 |     
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/b0074476b1f6c26b7119455c2772cb400c2b6619 |     
   xtensa    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/4ef3176d6d933c0e27e3f8b06405b7d7a467012a |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/7542aacd42fe2fe011199649bcf70bc757a2ae40 |     
  riscv64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/5edb1188d4a3e2900e8719b95a85532b604d4194 |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/acc4ea4ae573c5206ecae660cb7faf5e100f67e0 |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/012459dde1309ca1308627265f8e317ffd24657b |     
    arm      |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/9d9917b39e39a638b457789316a470d03bfa91d6 |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/ccb631603257cc12c1959e786d1117562604a0bd |     
   sh4eb     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/d7e1d27d4ed17bf6843385f37de806b2fd983113 |     
   mipsel    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/1273a3043b23fc0af82c9c0c2ce1fb724f143c24 |     
 microblaze  |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/1441419d04f388ab2c3d0ed8e11ec52420cbbff0 |     
    i686     |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/3af74de8e8d0f3988adf609a576152023c7f7b5e |     
   mips64    |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/31619f83ae43589ef814e9a0caa8d989bd03ad14 |     
   s390x     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/6cc0e7be087861a347a1b17f1e1512827e875e60 |     
    mips     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/20239337819089529fbf78ea82431efb19ae4f42 |     
 microblaze  |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/0eb6b4597e5462f6ee8cae3bbdc756abbf45e027 |     
 powerpc64   |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/a3301c55d979d5f266c7af27ef01a08c2a94443c |     
  aarch64    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/f2998982f6445a96a7868a90c098f970dc5c7294 |     
   mips64    | igh-ethercat-2e2cef61318953... | NOK | http://autobuild.buildroot.net/results/7b400cf6d5943dd1aebb0312f8b87e9c5142260c |     
   s390x     |          libbpf-1.1.0          | NOK | http://autobuild.buildroot.net/results/77eb7251c1fc3b8747fa6867b7301fff06fda819 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/f11abdea8d4c2163a9173b39e3bf072b19d0ac75 |     
  sparc64    |          libjxl-0.8.1          | NOK | http://autobuild.buildroot.net/results/fa12f7052f61d34ebbc1bc1b97eac62b042253d0 |     
  riscv64    |     liblog4c-localtime-1.0     | NOK | http://autobuild.buildroot.net/results/dab2ee0b2b48c4b6aec9f8d8b16a86ef717168e3 |     
  riscv64    |     liblog4c-localtime-1.0     | NOK | http://autobuild.buildroot.net/results/fd5ddf795cd8a0aa2482e0592742011528eef69e |     
    arc      |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/68f3ce02c0b95d3e9648585fbc47b6d275e1f602 | ORPH
   mips64    |         libxml2-2.10.3         | NOK | http://autobuild.buildroot.net/results/e63dad589b989eb81a04517890dd46464dfb0a88 |     
  powerpc    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/923db40106e65415f10afd0587a0986b1789b22e | ORPH
   mipsel    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/1a699da874903def22ac72c89d94620dac930725 | ORPH
  powerpc    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/f2be5347fad0ef26f3b3952ca732aec3b5b6b896 | ORPH
  sparc64    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/c55fa067bd3cda559e85236eaba5a170e90e4990 | ORPH
   x86_64    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/90b3b1839db195ea82e888855842a54a58b19a71 | ORPH
 aarch64_be  |          luvi-2.13.0           | NOK | http://autobuild.buildroot.net/results/777127e86b8ffac494c228650d1fbba787c52985 | ORPH
    arm      |           lxc-5.0.2            | NOK | http://autobuild.buildroot.net/results/25c3161f3a2a543301aa1859c06b14f0e0409c63 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/8c7f32e3e22d0527b632ef72c4c9b531bdafb4bd |     
  aarch64    |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/5a73ffab3b3f27a5b2bef96508b9a7d25f2648a4 |     
   nios2     |     network-manager-1.42.0     | NOK | http://autobuild.buildroot.net/results/584eb9969abe5efe27c0ae0f938932f84d1b0475 | ORPH
    sh4a     |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/1a8cf0f9b88e6348aed7a66775c4fe7551e79f6f | ORPH
microblazeel |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/6702ec7fadad25a53caad5d37de4e2d465561895 | ORPH
   arceb     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/c74f6fb8dbc5775f08e28a9ce27dcdaa8d11fc18 |     
   nios2     |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/0c72ee5fd95584ef2ebb97a08d6179671a6e3bb5 |     
   mipsel    |           qemu-7.2.0           | NOK | http://autobuild.buildroot.net/results/db603a6ffab88073fb00d356d69c59802c47c865 |     
  mips64el   |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/7db64cfbe5c59de8f7449b0e455a1134ceb6a25c |     
    sh4a     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/9a1a7c04e4f8923208d9c6473101046b4afd1e83 | ORPH
microblazeel |          shadow-4.13           | NOK | http://autobuild.buildroot.net/results/fff1c5977be144a70524cabed131768541f86ae6 |     
  riscv64    |         speechd-0.11.4         | NOK | http://autobuild.buildroot.net/results/b842321b2644ec1e32c1b99e91532b898a7a0a95 |     
  powerpc    |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/e0cc8c78d7146a223dfd2894b70a60f73c6c01c9 |     
 microblaze  |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/a84986d6817568eef4cf49254f50e980cdb0fac2 |     
   mipsel    |        webkitgtk-2.38.5        | NOK | http://autobuild.buildroot.net/results/23127b8517c2d51546d4376262a04753bd484dbe |     
   mips64    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/a1e4297ccc04a3f98d740552475b8b4c83bfb572 |     
  aarch64    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/c24398d2e24359f9aee5e03d7dd3ae03d348c0bb |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

               host-qemu-7.2.0 | 2 
glibc-2.36-81-g4f4d7a13edfd... | 1 
            host-binutils-2.39 | 1 
         host-gcc-final-10.4.0 | 1 
                host-go-1.19.8 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/8c39feae1e7e88acc6c6b49ec0ddbc6c13f0012c |     
  sparc64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/6f38889f01c05c00ed5bbde3b52403efd0ee21bf |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/4f4b633108c54f76e0c566a55040b6960b80584b |     
  aarch64    |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/f60fe1e2ef2259a7211659df33eda6f891995a1f |     
   s390x     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/f94b1455869bafd69d6d3c0bd0d990dd0c24ed7d |     
    or1k     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/63602fd05098d36435ac4c7550e1866efd9bf941 |     


Gitlab CI results for 2023-04-21
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578171  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578241  |      
                       beaglebone | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578255  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578256  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578292  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578314  |      
                 grinn_chiliboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578352  |      
                 imx6-sabresd_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578363  |      
                      nitrogen6sx | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578488  |      
                       nitrogen6x | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578496  |      
                        nitrogen7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578507  |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578510  |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578514  |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578517  |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578518  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578525  |      
        olimex_a10_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578527  |      
             olimex_a13_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578530  |      
        olimex_a20_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578538  |      
       olimex_a20_olinuxino_lime2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578536  |      
       olimex_a20_olinuxino_micro | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578539  |      
             olimex_a33_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578540  |      
             olimex_a64_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578543  |      
          olimex_imx233_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578544  |      
    olimex_stmp157_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578546  |      
                         olpc_xo1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578550  |      
                       olpc_xo175 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578548  |      
                    openblocks_a6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578552  |      
                    orangepi_lite | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578559  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578555  |      
                     orangepi_one | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578561  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578562  |      
                      orangepi_pc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578563  |      
                 orangepi_pc_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578564  |      
                      orangepi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578566  |      
                    orangepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578568  |      
               orangepi_zero_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578570  |      
              orangepi_zero_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578569  |      
                       pandaboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578572  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578573  |      
                    pc_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578576  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578577  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578579  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578583  |      
                qemu_aarch64_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578586  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578587  |      
                qemu_aarch64_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578588  |      
                    qemu_arm_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578595  |      
               qemu_arm_versatile | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578596  |      
                qemu_arm_vexpress | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578599  |      
             qemu_arm_vexpress_tz | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578600  |      
                qemu_m68k_mcf5208 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578603  |      
                   qemu_m68k_q800 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578604  |      
            qemu_microblazebe_mmu | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578608  |      
            qemu_microblazeel_mmu | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578610  |      
              qemu_mips32r2_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578616  |      
            qemu_mips32r2el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578620  |      
              qemu_mips32r6_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578630  |      
            qemu_mips32r6el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578637  |      
                qemu_mips64_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578641  |      
              qemu_mips64el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578646  |      
              qemu_mips64r6_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578653  |      
            qemu_mips64r6el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578656  |      
                 qemu_nios2_10m50 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578662  |      
                        qemu_or1k | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578675  |      
                 qemu_ppc64_e5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578680  |      
               qemu_ppc64_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578684  |      
            qemu_ppc64le_powernv8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578690  |      
             qemu_ppc64le_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578696  |      
                  qemu_ppc_bamboo | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578702  |      
                  qemu_ppc_e500mc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578708  |      
                 qemu_ppc_g3beige | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578712  |      
                   qemu_ppc_mac99 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578716  |      
               qemu_ppc_mpc8544ds | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578722  |      
                qemu_riscv32_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578726  |      
          qemu_riscv64_nommu_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578731  |      
                qemu_riscv64_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578735  |      
                       qemu_s390x | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578736  |      
                     qemu_sh4_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578737  |      
                   qemu_sh4eb_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578739  |      
               qemu_sparc64_sun4u | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578743  |      
                  qemu_sparc_ss10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578745  |      
                         qemu_x86 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578749  |      
                      qemu_x86_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578746  |      
                 qemu_xtensa_lx60 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578751  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578752  |      
                      raspberrypi | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578774  | ORPH 
                     raspberrypi0 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578754  | ORPH 
                    raspberrypi0w | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578758  | ORPH 
                     raspberrypi2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578762  | ORPH 
                     raspberrypi3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578766  |      
                  raspberrypi3_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578764  | ORPH 
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578769  | ORPH 
                     raspberrypi4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578773  | ORPH 
                  raspberrypi4_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578770  | ORPH 
                 raspberrypicm4io | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578779  | ORPH 
              raspberrypicm4io_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578778  | ORPH 
                raspberrypizero2w | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578781  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578783  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578784  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578786  |      
                        rockpro64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578787  |      
                      roseapplepi | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578790  |      
                 s6lx9_microboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578792  |      
                       sheevaplug | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578793  |      
                 sipeed_lichee_rv | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578795  |      
            sipeed_lichee_rv_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578797  |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578798  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578799  |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578801  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578802  |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578803  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578804  |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578806  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578807  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578809  |      
              snps_archs38_axs103 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578813  |      
                snps_archs38_haps | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578814  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578816  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578818  |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578821  |      
          solidrun_clearfog_gt_8k | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578824  |      
            solidrun_macchiatobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578826  | ORPH 
                    spike_riscv64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578829  |      
              stm32f429_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578831  |      
               stm32f469_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578836  |      
              stm32f469_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578839  |      
                  stm32mp157a_dk1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578842  |      
                  stm32mp157c_dk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578844  |      
              stm32mp157c_odyssey | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578852  |      
        terasic_de10nano_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578855  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578857  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578860  |      
                           ts5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578862  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578867  |      
                         uevm5432 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578870  |      
                    versal_vck190 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578873  |      
                       visionfive | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578878  |      
                      visionfive2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578875  |      
                        wandboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578881  |      
                            warp7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578887  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578888  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578891  |      
                      zynq_qmtech | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578893  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578896  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578898  |      
                zynqmp_kria_kv260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578900  |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578902  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4145578905  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
