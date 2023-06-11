Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED09C7EE23
	for <buildroot@archiver.kernel.org>; Sun, 11 Jun 2023 04:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50CD160A81;
	Sun, 11 Jun 2023 04:39:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50CD160A81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W9UlkU-lbDtJ; Sun, 11 Jun 2023 04:39:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2721760E64;
	Sun, 11 Jun 2023 04:39:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2721760E64
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 065621BF2F0
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 04:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF6B240503
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 04:39:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF6B240503
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ykxyXPGXhqSF for <buildroot@lists.busybox.net>;
 Sun, 11 Jun 2023 04:39:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF61740126
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BF61740126
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 04:39:28 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 80D3A60005
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 04:39:25 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 11 Jun 2023 04:39:25 -0000
Message-Id: <20230611043930.CF6B240503@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1686458365; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=k1PwaWbarF2PFkiB1/hRV9Jf1pbjF/CM78iHK7ZE7h8=;
 b=kDVpmRvAJROuZw3G5OPeTIBTqjScZvSeUVUMq26fO+lgfWmyzfg1W26pCqugMfixRxwHve
 fcHtLjXcO6Wr6pMv1GkGm6VWrjI6kf6UxrA/B0De0qpiLmr7uSKBCgeck6aPNV46ztmFGv
 bWt+PbIB7d1Vs8bCJoJPRdVCdngu/Y4sIbJ58SDgf4DLO/0YFu++PyWY9tD8hWOA5eK0aO
 tN/J7acaVXD0OXzu4bxTGs6t1etTk7CoXD5N3dJhuHMXH+2q6PxvW1LpaeWyIhrcW/W6p7
 Bi56mR71vg0fGGG7oBZtE4GdxM4QMDZI3TVzWE9Lw/LpVRYYacEKP4yROW02dA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kDVpmRvA
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-06-10
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

Autobuild statistics for 2023-06-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  5  |  3  |  0  |  8  |
    master   | 79  | 66  |  0  | 145 |

Classification of failures by reason for master
-----------------------------------------------

   host-bootgen-xilinx_v2023.1 | 9 
            host-binutils-2.38 | 8 
                    strace-6.3 | 7 
               host-go-1.19.10 | 5 
              host-rust-1.68.2 | 4 
                   linux-6.3.6 | 3 
                 coreutils-9.3 | 2 
                       unknown | 2 
                     audit-3.1 | 1 
                    brltty-6.5 | 1 
          cryptodev-linux-1.12 | 1 
                elfutils-0.186 | 1 
             fontconfig-2.14.2 | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
glibc-2.37-2-g9f8513dc64119... | 1 
  gobject-introspection-1.74.0 | 1 
             gstreamer1-1.22.2 | 1 
       host-gcc-initial-10.4.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
host-heimdal-f4faaeaba371ff... | 1 
                   json-c-0.16 | 1 
               libglib2-2.76.1 | 1 
                 libnss-3.89.1 | 1 
        ltp-testsuite-20230127 | 1 
               nfs-utils-2.6.3 | 1 
                 opensc-0.22.0 | 1 
                 openssh-9.3p1 | 1 
               owl-linux-1.0.7 | 1 
           python-pyicu-2.10.2 | 1 
            quickjs-2021-03-27 | 1 
rtl8189fs-c223a25b1000d6443... | 1 
rtl8192eu-865656c3a1d1aee8c... | 1 
               syslog-ng-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           audit-3.1            | NOK | http://autobuild.buildroot.net/results/fbda64cdc3a73c5af19ec043c0dd61f2b5b8da4f |     
   nios2     |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/d036b56407ec1ffe0094b3bcc589f59b8b7e5602 |     
   sh4aeb    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/52238ec97e6fb82a94e9cb06223d1b4c36df7957 | ORPH
   mips64    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/1a57f48332ac6c60b45265566fb6f78dada1fe62 | ORPH
  sparc64    |      cryptodev-linux-1.12      | NOK | http://autobuild.buildroot.net/results/1ff4eb6907e2313bb81466f93b63f914370c4877 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/d288d2258a44e3e21b7f83ef42914df36e74b54e | ORPH
  riscv64    |       fontconfig-2.14.2        | NOK | http://autobuild.buildroot.net/results/6f3938d7f09d5c2884d07721292958598c399c91 | ORPH
   x86_64    | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/a70537722e836b47d9d437df9369e80282c2da68 |     
   mipsel    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/32b7d78a96f1b0f4aa5075c05c7586681c822b97 |     
powerpc64le  | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/fb27a7d2a235d088ad689f5b55adba5e1a09c5be |     
   nios2     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/8fb69e3e6d110fc5b18dea448e14352eb8cbcf3d | ORPH
  aarch64    |       gstreamer1-1.22.2        | NOK | http://autobuild.buildroot.net/results/85a6b60a6c8c41ef78db5d1b73a3789d17d29774 | ORPH
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/030bc1b83349b583d1a428e5372daf5e33ac9136 |     
    or1k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/c359bb1fd51a89ca3f08d0d020eaf32709d43626 |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/3789dcccecea60a9c6e513840731ee28d3838c85 |     
  aarch64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/85aeab736d9cf286dede6dca568f4c800ca07a53 |     
  riscv32    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/45d1ff32b7fc73bea594dfb266d27d4ac4b56821 |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/c4893622a7630b5233ec197c3649a411bdf688d4 |     
    or1k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/5be06b0ba6e99a3bb4491144e2e1a825524791f6 |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/af2cce4223b5509fa949d5e7bd503b15e8d12637 |     
   nios2     |  host-bootgen-xilinx_v2023.1   | NOK | http://autobuild.buildroot.net/results/e22ac2a2818db44b923a1f1e87ad0c6d46e356f5 |     
   x86_64    |  host-bootgen-xilinx_v2023.1   | NOK | http://autobuild.buildroot.net/results/e151af2d88b971b5e86e285deec9acbebdccf57e |     
    arm      |  host-bootgen-xilinx_v2023.1   | NOK | http://autobuild.buildroot.net/results/7091e21a8828a183e0fae75f4269ccd25593cb35 |     
  sparc64    |  host-bootgen-xilinx_v2023.1   | NOK | http://autobuild.buildroot.net/results/a8f7cdad83ec323903af82ddc48ab4c11bd16024 |     
  powerpc    |  host-bootgen-xilinx_v2023.1   | NOK | http://autobuild.buildroot.net/results/8f343b69b300d81f4c09e23750c752a5f879577a |     
    sh4a     |  host-bootgen-xilinx_v2023.1   | NOK | http://autobuild.buildroot.net/results/e8a0b4e1495f527c5c38a86b391abe0118a8837a |     
 aarch64_be  |  host-bootgen-xilinx_v2023.1   | NOK | http://autobuild.buildroot.net/results/c5deb2826cd74bbdcfa1ab33a5790f3241eaf677 |     
   armeb     |  host-bootgen-xilinx_v2023.1   | NOK | http://autobuild.buildroot.net/results/2761350a9d10251ad0ecc25d34f81906bb5d1dbf |     
  riscv32    |  host-bootgen-xilinx_v2023.1   | NOK | http://autobuild.buildroot.net/results/33557b696d3ab9af80a0ccaa366248a8c1a781d8 |     
    arm      |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/e6c045dadaf784e82785951dfbb73b1f43e72b65 |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/030ee3d93e46f7aaaa740312d661d1ef361d791e | ORPH
   s390x     |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/a20f06514b44a3d8f4ce532c86dc38eba15b93eb |     
    i686     |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/b6c761e93fe2933fc2049d53e81f8fd8326ca6ac |     
    i586     |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/f7b397e6d9eb605ea1e7d3f92a6dbb0158772b42 |     
    m68k     |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/e576c210c638ff525a8aa1ad61ab20ae8ae3d675 |     
    mips     |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/b80f70d07ee28eba0fdd25bb3f456a5069a082f0 |     
    sh4      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/dcb665effc31b4a795190636195155869050449b | ORPH
   x86_64    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/16ee72af2262372ba60ccc4b8589e9a8b3da7749 |     
  aarch64    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/8df595a93a6f3be800a1a9d683e9e96740eabe4b |     
   mips64    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/0bbfe99d28b4d9b886a0703e9418b901a6e660e4 |     
 powerpc64   |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/e6661621e6b3d16af3399a0f7c8c67c6f58f780f |     
  riscv64    |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/7300dbe854d1a57aab5057956fa496737bd20c90 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/0d8e08ce1c7456c33f4745709c58fc858857447b |     
   x86_64    |         libnss-3.89.1          | NOK | http://autobuild.buildroot.net/results/7a16682f76e426aeb20e850e6949dbd86f2b5053 |     
  mips64el   |          linux-6.3.6           | NOK | http://autobuild.buildroot.net/results/3504fd130d034956a28bf2f535451d190b8112b4 | ORPH
  mips64el   |          linux-6.3.6           | NOK | http://autobuild.buildroot.net/results/f0a371210d3847057e620ec7f5931cb5d937bc62 | ORPH
  mips64el   |          linux-6.3.6           | NOK | http://autobuild.buildroot.net/results/1482801b7b9865806939ba05337ec3983db48116 | ORPH
 powerpc64   |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/94a039852294a03be04c52b7abe8a6416109ece6 |     
  powerpc    |        nfs-utils-2.6.3         | NOK | http://autobuild.buildroot.net/results/f17a554c86f0b24327b49fdc75612cc133f129ed |     
microblazeel |         opensc-0.22.0          | NOK | http://autobuild.buildroot.net/results/142ecef4693d4797886ef5a012bcca6e8fc4c100 |     
  sparc64    |         openssh-9.3p1          | NOK | http://autobuild.buildroot.net/results/0cdc639f2b9982182fae07e14d2c80f4447a7b8a | ORPH
   armeb     |        owl-linux-1.0.7         | NOK | http://autobuild.buildroot.net/results/b6b4fb4e6b42ad4c2486de3201a8691ae7552246 |     
 aarch64_be  |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/72214b6a02903759e8d12ecc547823933d9527d7 |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/ed5763d6c5dfaf93ea5b13954e11c989ff16a88b |     
 aarch64_be  | rtl8189fs-c223a25b1000d6443... | NOK | http://autobuild.buildroot.net/results/c68d40ff7ba61dc421cfc5ec66b27fcadc2520a2 |     
 microblaze  | rtl8192eu-865656c3a1d1aee8c... | NOK | http://autobuild.buildroot.net/results/12962f0f6cb5b20547b00fcfc3882a0c6e50dd32 |     
 microblaze  |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/afad950dfd8ade850ac64116f4e484c4d4e80ee3 |     
 aarch64_be  |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/7972b20a0d1f75bb38772975d5bb5a13b78c0add |     
  sparc64    |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/a15880dfdc9f704bc2db4204bcf91c183a5cfaaa |     
   x86_64    |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/1d7e592ec2a24c4adedc0b857d42ee9b88266999 |     
    mips     |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/8675aeca53653d9d792182be61a28ea550dc530d |     
    arc      |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/ba5f3fbd3a1dd8bcb63096229a7e1dbd6a2da407 |     
  aarch64    |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/7ddf7f41074fa5a641c0c5cb4b32bbcb8ca875c4 |     
  aarch64    |        syslog-ng-4.1.1         | NOK | http://autobuild.buildroot.net/results/5928eb4487dfd3dfab3492497a5a9210604c850d |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/2a35c0095e1d68efc3e6ef9ea6ee75146e3b6733 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/684b2b1e35d4d01f0a5514c4291518db73627a4b |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                  check-0.15.2 | 1 
               libglib2-2.72.3 | 1 
                    olsr-0.9.8 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/67a3053b9a4f44b09e28363cf01d194e5c305aca | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/b26e35d66304b80e4732bc781c33ac3018750c16 |     
  mips64el   |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/f84714f7c43c25b5cee496f3a6a110acb635f471 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
