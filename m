Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AFD7C0015E
	for <buildroot@archiver.kernel.org>; Tue, 15 Aug 2023 05:41:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D549440126;
	Tue, 15 Aug 2023 05:41:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D549440126
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9IRcPmYzJgQT; Tue, 15 Aug 2023 05:41:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B78154012E;
	Tue, 15 Aug 2023 05:41:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B78154012E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B85291BF31F
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 05:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62D6781E2A
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 05:41:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62D6781E2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CYBN5WdJRw8v for <buildroot@lists.busybox.net>;
 Tue, 15 Aug 2023 05:41:08 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B424B819D5
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 05:41:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B424B819D5
Received: by mail.gandi.net (Postfix) with ESMTPSA id 15CD160002
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 05:41:03 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 15 Aug 2023 05:41:03 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20230815054109.62D6781E2A@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1692078064; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3TE2Bkhdyr3u7p8eiI287alh81mQN7mmTM0pm646+3M=;
 b=ESm/Oh7V/IjaobJ3Sy0ISmFEsXU7AmvbuF/tUMzD07hHho5KiPU5CIsTILyqBYKM7BBpIn
 IjMdqGIMeix1BTClhRsuRKvqD6l1kerHsd1L5hYgIrWKH0tNVDaBu/n/wqyo7xpIIfPEZS
 4J7ozMH2TEorEH5NFmz7DZp2V4CW85Ch4tu0AJcxV/Xb/huG1nKu5t8gJCIloztRpvzg2x
 rdNU4qYdybHIkk1yyj79jZ4Qc9WqTcgVVMfXP5NTxKHlrxn2OYmpbBIcK1dMsEV4eQc9N9
 8qe0dKZ6KdrDK2Lp1Z1nXHcC2NoMAKDsXLLzTYuSfeq2lzs7oAvl83UCdAxIlA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ESm/Oh7V
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-08-14
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

Autobuild statistics for 2023-08-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  4  |  2  |  0  |  6  |
  2023.05.x  |  2  |  2  |  0  |  4  |
    master   | 57  | 61  |  0  | 118 |

Classification of failures by reason for master
-----------------------------------------------

              libxcrypt-4.4.33 | 7 
                   linux-6.4.9 | 6 
glibc-2.37-2-g9f8513dc64119... | 3 
                     pound-4.8 | 3 
                       unknown | 3 
                   guile-3.0.9 | 2 
                host-go-1.20.7 | 2 
         host-sentry-cli-2.8.0 | 2 
ibm-sw-tpm2-5452af422edeff7... | 2 
              open62541-v1.3.6 | 2 
                rdma-core-47.0 | 2 
                 uclibc-1.0.44 | 2 
             util-linux-2.39.1 | 2 
             batman-adv-2022.3 | 1 
  binutils-arc-2020.09-release | 1 
          cryptodev-linux-1.13 | 1 
              e2fsprogs-1.47.0 | 1 
esp-hosted-11e90f185a5a9922... | 1 
             f2fs-tools-1.16.0 | 1 
                     frr-8.4.2 | 1 
fs/romfs/romfs.mk:32: /home... | 1 
            gdk-pixbuf-2.42.10 | 1 
  gobject-introspection-1.76.1 | 1 
               host-qemu-8.0.3 | 1 
                jailhouse-0.12 | 1 
               libvorbis-1.3.7 | 1 
          linux-5.10.162-cip24 | 1 
                    olsr-0.9.8 | 1 
                    putty-0.78 | 1 
            quickjs-2021-03-27 | 1 
rockchip-rkbin-b4558da0860c... | 1 
             stress-ng-0.15.07 | 1 
                 wolfssl-5.6.3 | 1 
                xenomai-3.0.10 | 1 
                  zeromq-4.3.4 | 1 
                 zlib-ng-2.1.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |       batman-adv-2022.3        | NOK | http://autobuild.buildroot.net/results/7bd91971d635c1b2fdcd425ded79a48fc2439c3c |     
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/a85fc93a5029c4b4fe210f632bbefd08c1112e1e |     
    or1k     |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/ceff4a8c178956c9840ae6bec2ba22c6ed6ef6d5 | ORPH
   sh4eb     |        e2fsprogs-1.47.0        | NOK | http://autobuild.buildroot.net/results/829ff4025aefdc16cdb4b19db38d17b333175f3b | ORPH
    arc      | esp-hosted-11e90f185a5a9922... | NOK | http://autobuild.buildroot.net/results/23b869eee1472cbcb03ac36875dd13963339d30b |     
   sh4aeb    |       f2fs-tools-1.16.0        | NOK | http://autobuild.buildroot.net/results/c3aa56376d897bff16081d88099571fc015a2f4b |     
   xtensa    |           frr-8.4.2            | NOK | http://autobuild.buildroot.net/results/890d371cd7d144d05bc64612c54f6a647ee8a3bf |     
   arceb     | fs/romfs/romfs.mk:32: /home... | NOK | http://autobuild.buildroot.net/results/3597080eaaf29950ed541c8e7c77b1bf0324c392 |     
    arm      |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/0f5f78359f65f902cdaa9b015856b93d126e6487 | ORPH
    arc      | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/7f8f1a1a4e5dbb87641cd8b0bfd43cd6dc6f3108 |     
    arc      | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/e4e70424b021cf9096ed01d71a25bbfaa8cdabda |     
 powerpc64   | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/bb9ca4518807d5c6f52c2de9e60b609416c8b663 |     
   s390x     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/d004b925528e5447eaa25e51a5274bda70cd1002 | ORPH
  sparc64    |          guile-3.0.9           | NOK | http://autobuild.buildroot.net/results/22f6366d5698a84d03b786793e63db5ee250b76c |     
    mips     |          guile-3.0.9           | NOK | http://autobuild.buildroot.net/results/03c611b32cb6ff90fc23fa346042623277f1cc7f |     
    or1k     |         host-go-1.20.7         | NOK | http://autobuild.buildroot.net/results/7d2b6bd2034acf1b8d9c0e7dc69b21c385a848dd |     
microblazeel |         host-go-1.20.7         | NOK | http://autobuild.buildroot.net/results/681c46431cb30e8bbbbcf92692afbfccba43fd16 |     
 powerpc64   |        host-qemu-8.0.3         | NOK | http://autobuild.buildroot.net/results/2fb4194282902f10d0df0716dd09c5b9801b8464 |     
    or1k     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/9a9c3910fdc220d00065729987db4cc2d8f6c107 |     
  powerpc    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/e87e8efded9e17dfd173931c1f71c00138759d26 |     
   armeb     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/b9502abee5c244a69bfffc066ae0cac668911934 |     
microblazeel | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/eed9821b41ee5af77f766b7accae07dc1890a18f |     
  aarch64    |         jailhouse-0.12         | NOK | http://autobuild.buildroot.net/results/7094ce177c44c0fa126f4d622db2521fa8c85d48 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/79b0343bf80e215078889285f32da18085c0e081 |     
microblazeel |        libxcrypt-4.4.33        | NOK | http://autobuild.buildroot.net/results/73d80260b8277f6e3b89537f3360bdce2784bf46 |     
    i686     |        libxcrypt-4.4.33        | NOK | http://autobuild.buildroot.net/results/26344163469c11ddb2a559387b25f0b942092566 |     
    arc      |        libxcrypt-4.4.33        | NOK | http://autobuild.buildroot.net/results/358af5a2bddde6316432c4d4179ca0f7eac9ae15 |     
   armeb     |        libxcrypt-4.4.33        | NOK | http://autobuild.buildroot.net/results/ca61ea96ab3f6871a67291842c0e08944d1cb930 |     
    mips     |        libxcrypt-4.4.33        | NOK | http://autobuild.buildroot.net/results/2e4700d4d5208006a1fff34acce2705172db9a66 |     
powerpc64le  |        libxcrypt-4.4.33        | NOK | http://autobuild.buildroot.net/results/8e6dcc1c1b179ce3065f6de19cda426dbf2452f2 |     
 powerpc64   |        libxcrypt-4.4.33        | NOK | http://autobuild.buildroot.net/results/5ca563adb39a9646a8f3c279c496d741b542c141 |     
    or1k     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/cb4c12e2f4ff881c08658e599008f726637ab4f8 | ORPH
  powerpc    |          linux-6.4.9           | NOK | http://autobuild.buildroot.net/results/35f2c28274e7fc2cece7c8a16564ee3f84080942 | ORPH
    i686     |          linux-6.4.9           | NOK | http://autobuild.buildroot.net/results/1d1d1140f6ca8d91695a1dcbd28c43fd8ff516a2 | ORPH
    arm      |          linux-6.4.9           | NOK | http://autobuild.buildroot.net/results/dacbea3a5c76de7c9b2b7ec1e3ff6e81c7738b54 | ORPH
   mipsel    |          linux-6.4.9           | NOK | http://autobuild.buildroot.net/results/4fb4e1095b336450ff703d172532f9d5de3b896a | ORPH
    or1k     |          linux-6.4.9           | NOK | http://autobuild.buildroot.net/results/55117c5aaa17dc34f343c68947cfffbbb855aee8 | ORPH
    mips     |          linux-6.4.9           | NOK | http://autobuild.buildroot.net/results/2c2dfbc91a6542ba1a4c1619fa72831756579b90 | ORPH
  aarch64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/4a016bf33f6ffd6be454a8869d7aaa94881752e7 | ORPH
 aarch64_be  |        open62541-v1.3.6        | NOK | http://autobuild.buildroot.net/results/a088bafe0e17bb0ca8ff5b6967ffa0cb93151adb | ORPH
microblazeel |        open62541-v1.3.6        | NOK | http://autobuild.buildroot.net/results/62c2f25a24ecee455c8c68701a78831afcbe72c3 | ORPH
    or1k     |           pound-4.8            | NOK | http://autobuild.buildroot.net/results/ac236b5a3ffacab8830b8d13767ddc07d15897cf | ORPH
   x86_64    |           pound-4.8            | NOK | http://autobuild.buildroot.net/results/ce7ca1b976679bad366a4e5983e479ad33e1235f | ORPH
   arceb     |           pound-4.8            | NOK | http://autobuild.buildroot.net/results/b6d4b180971c5cf0f2cb4e10485d221e66598af4 | ORPH
   mipsel    |           putty-0.78           | NOK | http://autobuild.buildroot.net/results/06f0b14bd0414f97b06070198e290fb3253348c5 |     
  aarch64    |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/66323ccf8a9aac89c73a3121b80faae3f41acb4f |     
   x86_64    |         rdma-core-47.0         | NOK | http://autobuild.buildroot.net/results/00ce19a1589c6028ee77c333ed9107e2c8c8d6de |     
   x86_64    |         rdma-core-47.0         | NOK | http://autobuild.buildroot.net/results/9cf84a3c01c8916af5bf9e0ccb64937c23dbdde8 |     
    arm      | rockchip-rkbin-b4558da0860c... | NOK | http://autobuild.buildroot.net/results/90a3f39749f4e48c3a4f5cf78c6087570309300a |     
 microblaze  |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/0d4b3d0046570721ab10dbb2e92ff699dcd26ae8 |     
  riscv64    |         uclibc-1.0.44          | NOK | http://autobuild.buildroot.net/results/690c3db240fb922cfdc151530649f9159547ef72 |     
  powerpc    |         uclibc-1.0.44          | NOK | http://autobuild.buildroot.net/results/a9cc8802c1d778a2576b89a7025e3e265dd7514d |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/8c12afe1a49e98235dc1123bc5d17c91a872351c |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/f3b34abe2a2e20c1380096d42b86a1aca4b46afc |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/d50093b5638d4b1dd826b86b91df91252cb83bd2 |     
  mips64el   |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/a305e0d6ea4a51f400f3116e58989e726e0ca652 | ORPH
  mips64el   |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/6a6bef351adb82169f24908ff66f7d838a5c9d09 | ORPH
  mips64el   |         wolfssl-5.6.3          | NOK | http://autobuild.buildroot.net/results/b7ad9eaef6b5853a5dba791086b222182715d811 |     
   x86_64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/a062a49e65fdbaae3608c40af7ab3eb1753ce8ab |     
   mips64    |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/f9dc04284eac53c3c02c27900e4d8991d1998e3e |     
  powerpc    |         zlib-ng-2.1.3          | NOK | http://autobuild.buildroot.net/results/a9f45486664b2d5b23a2f330a63955a06ae8189d | ORPH


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                   bird-2.0.12 | 1 
             fontconfig-2.13.1 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/a09a286ecbf98b931a29527e534b90e28aac2a27 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/e887eb113bbf36ff0002b492dd4293cc7f569611 | ORPH


Classification of failures by reason for 2023.05.x
--------------------------------------------------

                elfutils-0.186 | 1 
                   luvi-2.13.0 | 1 


Detail of failures for 2023.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/435f899368abcc60f8419dc8d9f81bd3444cbcd7 | ORPH
 aarch64_be  |          luvi-2.13.0           | NOK | http://autobuild.buildroot.net/results/983a7ccd616cce826865232a9914f96e770252f4 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
