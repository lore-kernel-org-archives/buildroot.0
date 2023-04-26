Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40682C7618E
	for <buildroot@archiver.kernel.org>; Wed, 26 Apr 2023 05:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C4CA61367;
	Wed, 26 Apr 2023 05:47:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C4CA61367
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zRLZfPta03Jh; Wed, 26 Apr 2023 05:47:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9139361108;
	Wed, 26 Apr 2023 05:47:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9139361108
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8CC3D1BF83E
 for <buildroot@lists.busybox.net>; Wed, 26 Apr 2023 05:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 34A1161108
 for <buildroot@lists.busybox.net>; Wed, 26 Apr 2023 05:47:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34A1161108
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4_SkGN9VWcK0 for <buildroot@lists.busybox.net>;
 Wed, 26 Apr 2023 05:46:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D699160D77
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D699160D77
 for <buildroot@buildroot.org>; Wed, 26 Apr 2023 05:46:56 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E25142000C
 for <buildroot@buildroot.org>; Wed, 26 Apr 2023 05:46:53 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 26 Apr 2023 05:46:53 -0000
Message-Id: <20230426054701.34A1161108@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1682488014; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=eqIPseFDp8k0VpjF792VdZgSFxRn5iYw4gA+ASYkI5A=;
 b=UlASyxXnQ1x1q70C2pXyOeBVpp+O9WdW1D/MPj2IAfH9IkE1nMK8l6NGoWaDi5eLWMv2aD
 KaLTUBxxq3jR4YEn9wsbwzw26pxzzeWtESI7eyNtKoomaRC0RBpgQGH4DWg2ebIMXlqJu1
 KpgWI0IgFi2emkptucZjEgVOgh+DzjOO01X5Hfex+TYn9eealHa0MTT06ZgWUbl4RDQONX
 jiMsoe8H19BUtQnkzKyyfXbcLyEs85SxnPXngNfz0HYDm8SPbOA0IRgnX1uFNQVcNVxRYu
 mZcIjISyZLkIlgvzZf4LCg2gb5Dthv9IatU4HgjjzVQkSeN8xxuI49S71RGkxQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UlASyxXn
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-04-25
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

Autobuild statistics for 2023-04-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  3  |  4  |  0  |  7  |
    master   | 68  | 46  |  0  | 114 |

Classification of failures by reason for master
-----------------------------------------------

            host-binutils-2.38 | 4 
            host-binutils-2.37 | 3 
         host-gcc-final-12.2.0 | 3 
                host-go-1.19.8 | 3 
              host-rust-1.68.2 | 3 
          linux-5.10.162-cip24 | 3 
                  linux-6.1.14 | 3 
         host-gcc-final-11.3.0 | 2 
               host-qemu-7.2.0 | 2 
                       unknown | 2 
                  boost-1.80.0 | 1 
             containerd-1.6.20 | 1 
                elfutils-0.186 | 1 
             fontconfig-2.13.1 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
            gdk-pixbuf-2.42.10 | 1 
                     gmp-6.2.1 | 1 
                 haproxy-2.6.9 | 1 
             host-delve-1.20.0 | 1 
         host-gcc-final-10.4.0 | 1 
              libgcrypt-1.10.1 | 1 
               libglib2-2.76.1 | 1 
        ltp-testsuite-20230127 | 1 
                     pv-1.6.20 | 1 
sconeserver-8d1935919a20133... | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/ec534a0339524f162fefbdb4f8419e750f7cfcd8 |     
  aarch64    |       containerd-1.6.20        | NOK | http://autobuild.buildroot.net/results/d058aa919b528ffad38a06a13d90a6a7230583eb |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/8859f4f222c45b50f23e0c20c0303775ddc10032 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/526e40d43852c1064c4ef80579a904f8819dc22d | ORPH
  riscv64    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/c756e43496db793f9872478d2a56b0f685aa9050 |     
   mips64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/0d6ba78b7d202b14081f2f5e6475c324dfcf9245 |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/aeb56136ba87a681bead7694d1d751fc579d3237 |     
   sparc     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/df1c68f5b1f0826b895617d7134149846804bbe9 | ORPH
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/d70b2c9f69e30537d4becd60bf4fc0487af3628c | ORPH
 aarch64_be  |         haproxy-2.6.9          | NOK | http://autobuild.buildroot.net/results/f1ab553aeead6bdf3b2bb527d36fcc413750228b |     
  sparc64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/a0f49eab2e717d9f7174bcfb5b1b0a342a122032 |     
   armeb     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/21a2aaffc17faf25635c02c9d8a34ebbd22387ae |     
   s390x     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/3657b6698ad085042a1246f7856807f3ed4b359c |     
    sh4a     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/cddc87428e89c0a10558230f16074986773923c1 |     
    i686     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/bf241b0430da597a1403a12d445b94ce961d8554 |     
   sh4eb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/4cad5208cf22b5b9bfd3832342be9df6688c98ed |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/b767f0f1ba1803edec937fa0297c1ab2168d85b0 |     
  riscv64    |       host-delve-1.20.0        | NOK | http://autobuild.buildroot.net/results/c49aa43e917c48740ab4be84b84cba7b68f8ac76 |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/7193d0475d89d066d9f784dc8679b0c8ec4b7b62 |     
   xtensa    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/ab9252dab89090ee60027b73ff7fdf6f019f38d2 |     
  mips64el   |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/6e21dd3fdacb33258df2429219794bcdc663ffaa |     
   armeb     |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/92942656fd6adc616f4adc2984d7981928993138 |     
    m68k     |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/b2caae2f3c38142ac1ddb6baf1e879353cce5489 |     
   xtensa    |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/be2fdd69a41d5c1785a7ea7567030778bba4340b |     
   mips64    |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/b66e523f65c265420585d9af0479c00b57c1d0d5 |     
  mips64el   |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/fd1b8ddf1070360fa69352dc6f845e0f2655a220 |     
  mips64el   |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/e9de62b57688d82147879d11ed553b83d99b6aaf |     
   nios2     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/a596be4db26f75cd92cc3f16f78eb97fa264e8aa |     
  sparc64    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/c5410a2cb224672e5a2767f77900570a4e8954d1 |     
   x86_64    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/2c96673da284720e312b2c85a4b6875589c45ec3 |     
   s390x     |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/0da4d3aff6fa1facd51fcc9836fed57cdec3b0be |     
   armeb     |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/0c4cf68ef3e2a4d9db9cad2c601a360354fbc15f |     
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/28fdcb50cb91379508f0d610dda5a1539bacddbf | ORPH
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/73720c6a2d6ab60f93cc6a3c440e8883f920c4b0 |     
    arm      |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/ba49f9a7d9e068357376cf7054c14fdb906807af | ORPH
    or1k     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/db7ee75786a05d4f82c15db043d2a77a7ca0313f | ORPH
   mips64    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/b3139020a2a2d41e132a0ab7a5248e87492ee471 | ORPH
   sh4aeb    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/04dd47d459685653be669dd63de2ab4ccaae3554 | ORPH
  mips64el   |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/5fb8474f78049ab9f90482e2359f125b490b814e | ORPH
   s390x     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/b226a635295be823baec99412d593cbbb2b5697a | ORPH
   s390x     |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/95976b014b1efd8a732bde621680d02350e2f5b0 |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/7cbe4ad3638b1a34d1a096145871166a308a5e58 | ORPH
   s390x     | sconeserver-8d1935919a20133... | NOK | http://autobuild.buildroot.net/results/6da60f6748b35aef943c02bd3540c78c69fa71eb |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/7fa52c2f3f5fdad22cadac0a909f4e4c28059798 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/e2708ed60b38427e66b62f90fb6c5e7659bce842 |     
 powerpc64   |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/88fe2721675d3ab040a98f00085f338f56b57ac2 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                 agentpp-4.6.0 | 1 
              host-rust-1.67.1 | 1 
               libglib2-2.72.3 | 1 
                       unknown | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/77887e780087312bb90f5ab3ab18c4b1ded710b6 |     
   x86_64    |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/66beeefd292406a1090dd75520b27b935d5f151b |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/0b903bf2ea3391c89ed03987fd696d324e92b3b9 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/b929aebb111b14de4b25cd799247a82891218c9b |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
