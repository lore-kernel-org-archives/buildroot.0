Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 760F5C77B73
	for <buildroot@archiver.kernel.org>; Wed, 31 May 2023 05:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C11A5410AB;
	Wed, 31 May 2023 05:35:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C11A5410AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lstf0maG3mQg; Wed, 31 May 2023 05:35:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21F8941F2B;
	Wed, 31 May 2023 05:35:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21F8941F2B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5DA411BF30D
 for <buildroot@lists.busybox.net>; Wed, 31 May 2023 05:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D7FB40320
 for <buildroot@lists.busybox.net>; Wed, 31 May 2023 05:35:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D7FB40320
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S7cb8YJCc8Ci for <buildroot@lists.busybox.net>;
 Wed, 31 May 2023 05:35:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FA1F401B7
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2FA1F401B7
 for <buildroot@buildroot.org>; Wed, 31 May 2023 05:34:59 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2A2AD1C0009
 for <buildroot@buildroot.org>; Wed, 31 May 2023 05:34:57 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 31 May 2023 05:34:57 -0000
Message-Id: <20230531053502.3D7FB40320@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1685511297; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nJcs51dN5occwjcMc0MnuWRj46KAbVb//vRNMaxmrTA=;
 b=a8h3wehy1sK6sNT9JSZ96h+HjtAcdKN674+YOwLDxM0B/RudFgClOXNi42WoxA9HRH5xB2
 A29Z/9rKeWuhs+Pg+C2Yc2hG2lR2U9MqxL3EYG0AaXZExHC47+Kn3GQLVGVq0sfVvI/7m3
 8lLia9OVN166defe5WQOOWPoRrdH8uc0Rajb//M6oGzoSJDHOY5GybDCQzFL8ivIQiQ3aj
 j85qmHrd4omE/7U3C8sbLrXJFCVC31+1wu54c8EbbDK6ZIozguT+kthIMzKRYBHNIj2eEw
 ZnkDPVQjW2RIILdTfWo5Ptnbl/xPR3XeIUZAGxZaRHspvyn1+JjICPUsAgUWHA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=a8h3wehy
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-05-30
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

Autobuild statistics for 2023-05-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  3  |  2  |  0  |  5  |
  2023.02.x  |  7  |  3  |  0  | 10  |
    master   | 83  | 66  |  1  | 150 |

Classification of failures by reason for master
-----------------------------------------------

package/sdl2_net/sdl2_net.m... | 6 
                 agentpp-4.6.0 | 4 
glibc-2.37-2-g9f8513dc64119... | 4 
  gobject-introspection-1.74.0 | 4 
            host-binutils-2.38 | 4 
           at-spi2-core-2.48.2 | 3 
host-heimdal-f4faaeaba371ff... | 3 
       freeradius-client-1.1.7 | 2 
                     gmp-6.2.1 | 2 
                haveged-1.9.18 | 2 
              host-rust-1.68.2 | 2 
                apparmor-3.1.2 | 1 
                   bird-2.0.11 | 1 
                  cairo-1.16.0 | 1 
                 coreutils-9.3 | 1 
             dahdi-linux-3.2.0 | 1 
                 dash-0.5.11.5 | 1 
                   flann-1.9.2 | 1 
             fontconfig-2.14.2 | 1 
fs/erofs/erofs.mk:46: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                glorytun-0.3.4 | 1 
         gobject-introspection | 1 
       gst1-plugins-bad-1.22.2 | 1 
                 haproxy-2.6.9 | 1 
           heirloom-mailx-12.5 | 1 
            host-binutils-2.37 | 1 
               libcap-ng-0.8.3 | 1 
                libdrm-2.4.115 | 1 
               libglib2-2.76.1 | 1 
                  libjxl-0.8.1 | 1 
                 libnss-3.89.1 | 1 
                   linux-6.3.4 | 1 
               nfs-utils-2.6.3 | 1 
           python-pyicu-2.10.2 | 1 
              tinymembench-0.4 | 1 
                       unknown | 1 
               xfsprogs-5.14.2 | 1 
               zxing-cpp-1.4.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/d9db324765c12da93400dd1976510983f89a60d8 |     
   x86_64    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/7ac83ba80b6facc859236193ac2c49b8c7e884c2 |     
microblazeel |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/e40d64265c54415d2d336aa8826797269b83b7d2 |     
   mips64    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/0f5112816daca87f0c70b38c7c0491c34861835f |     
   arceb     |         apparmor-3.1.2         | NOK | http://autobuild.buildroot.net/results/b617936bb42dab28244954cbf30ea4ccb3c59241 |     
    i686     |      at-spi2-core-2.48.2       | NOK | http://autobuild.buildroot.net/results/88ed6095761c04fd5a137c1e916722020dc2211f |     
 aarch64_be  |      at-spi2-core-2.48.2       | NOK | http://autobuild.buildroot.net/results/fd9007c742f5dd34b519688ce2459ef4467a34d3 |     
  powerpc    |      at-spi2-core-2.48.2       | NOK | http://autobuild.buildroot.net/results/8c87c7e7b90f8c3a887958a16a53f0cd0b0918b4 |     
    m68k     |          bird-2.0.11           | NOK | http://autobuild.buildroot.net/results/5d64bac8a26ebaf6a62e949ca90af851dfa92ea2 |     
   xtensa    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/9c4e17366366a56b50b45c7a6a361efcdd6ec902 |     
    mips     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/bc63beb4e3d9e393db3a04b8f2403343faeb1f17 | ORPH
 powerpc64   |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/d90e7950b35b3eafbd864a9fe901aaca87666a34 |     
   xtensa    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/8f72730684e861e8ab68568813b77f721ad57d82 | ORPH
   mips64    |          flann-1.9.2           | NOK | http://autobuild.buildroot.net/results/1bbd915a95dd350a37e1aa7aa4e8bb9735535a23 |     
  riscv64    |       fontconfig-2.14.2        | NOK | http://autobuild.buildroot.net/results/b4eddb9b430ce11dbe3964958e619771a7745ef8 | ORPH
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/63082098781408797fd0d65b4da4336d2ade211e |     
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/d2f193b7aaafe65c4888c1da4ecd4fed0fdef10f |     
   mipsel    | fs/erofs/erofs.mk:46: /home... | NOK | http://autobuild.buildroot.net/results/70d65c4a6aa5aaf8293ac73e7e229a5ad07a2d5e |     
    sh4      | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/4f9b124744165c2d4f083dfd4739c5b380b42377 |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/2a4dacada73420960d5eee5f21092a9e62c24c04 |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/43802f845e82439a74646b3fb15f4cd467c87653 |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/a00a97463084bb56ca0e065d2f37df2baf45be25 |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/e44b5b06f728904d746acc69510ad3ca2dfc9d8b |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/7a21a2ee38de9df709a196b3e1cd02922bde907a |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/ee0f29727ac3cfb96fe618f479c647260b779c34 |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/e2e86e4dc7c6243ea1700cb8488474bb2edab91e |     
 aarch64_be  |         glorytun-0.3.4         | NOK | http://autobuild.buildroot.net/results/b8bfd7f4b362ac9e630ac7ae508002907352ca52 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/3ab9692045550f65584b7e92b2c0bcd9cec3fb7a | ORPH
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/ec5aae2b417412c1e2ced09b06087de358d76da6 | ORPH
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/c54b40eda08e34ffc3a113be16e8d72052a2879d |     
   nios2     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/aa8ad450873891c072a5c42bbe257c338a0e77ab | ORPH
   nios2     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/ca5fc17f3aa5f4d07557f3a47beccf117f23b5ae | ORPH
   nios2     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/6e296d4e71f14e9609e3ddc8549cf7a26e704007 | ORPH
  sparc64    |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/d7732c9784aba796fe6230fbd33c13ae3b48f55a | ORPH
  mips64el   |    gst1-plugins-bad-1.22.2     | NOK | http://autobuild.buildroot.net/results/e33de4c9212e1e48c6ccef930e7430d82eb2c4b7 | ORPH
   sh4eb     |         haproxy-2.6.9          | NOK | http://autobuild.buildroot.net/results/3bde979d849b037079e78d7cd904745da7d193a7 |     
   sparc     |         haveged-1.9.18         | NOK | http://autobuild.buildroot.net/results/6e0695f2517956f38a08ce501144edc4492c91a8 |     
    arc      |         haveged-1.9.18         | NOK | http://autobuild.buildroot.net/results/89524df54ad2235e63119fdba11fed3b38e48276 |     
   sh4eb     |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/d58bf5f5749ab4d93b334f750b7870e66504f28c |     
powerpc64le  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/1c8d7da86008a7e62720b14fdd1afc13980b9741 |     
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/7ecfe393afb3a66011df88b73c76e35168988895 |     
    sh4a     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/7a45b1ce3d7b1f6cb1e1db07981dff65fca98bde |     
   nios2     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/336b5c265808ab426df7e80b23f58efb1dc14610 |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/56357218e2def883b55d23b4a043d9b4072e8e9e |     
  sparc64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/9821a154f59aca47fc1a87347cea1a8b3f44f282 | ORPH
powerpc64le  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/b741a1cee5085bd8de7ba334b9b20c8528d4275c | ORPH
    arm      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/f79f84d52a8f3be5284007a3fd55a023237ac6ce | ORPH
  sparc64    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/1543282353c40b6932d8a2706375c54ac3a40258 |     
powerpc64le  |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/2e4797831edf51755d17b04263db7e05fc51eb08 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/60c970136656335956353ce8d825b3cf021560fa |     
 aarch64_be  |         libdrm-2.4.115         | NOK | http://autobuild.buildroot.net/results/e3df678ec6667c1515ea7c178775f779ccac401f |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/7d905fb42f9105632f7dec89da631a7ba026e4e2 |     
  riscv32    |          libjxl-0.8.1          | NOK | http://autobuild.buildroot.net/results/e926ae6e5d360866531b20cc2eb3e1b4fd5cc47c |     
    arm      |         libnss-3.89.1          | NOK | http://autobuild.buildroot.net/results/b38a02eead532faf5b220d0a0f98701a45eaac16 |     
    mips     |          linux-6.3.4           | NOK | http://autobuild.buildroot.net/results/db065380e06c5db9711320647278ee420acbbe80 | ORPH
   sparc     |        nfs-utils-2.6.3         | NOK | http://autobuild.buildroot.net/results/50f286df339ebf21c2906f08016a6a99dfb36209 |     
   arceb     | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/d7f289aecf72444117df52c9b2f417df8f7ed4e4 |     
    i686     | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/3da3d3967983f663f6e8c0419e392ac900a9239b |     
 microblaze  | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/927c3908f3d9f14b28eff8e8ca97ffaaff13fa93 |     
 aarch64_be  | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/8bfc4e5df5d5897298fa84f69efbecd10aa7d97c |     
microblazeel | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/10cd07480e151d1506ed46342b63d58ed0a8c17c |     
   sparc     | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/360c9335699e6a1a34a05916fc60af1f9b774508 |     
 aarch64_be  |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/3d9a36d51fcc9a90b5ffee62ea7e0e9bb0fa6b40 |     
   armeb     |        tinymembench-0.4        | NOK | http://autobuild.buildroot.net/results/3ece2b6b7594f6d1ce2b18684abdd546434bffeb |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/3741072637069d8703d5f3b9d48901ec54853c5b |     
  riscv32    |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/124394d316f34af8c101e25b14691de361bf65db | ORPH
    arc      |        zxing-cpp-1.4.0         | NOK | http://autobuild.buildroot.net/results/de420ef7b65d127479294fa13f9259c0cf43c13c |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                 snmppp-3.4.10 | 2 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         snmppp-3.4.10          | NOK | http://autobuild.buildroot.net/results/776d1f9c994713f052c9ef508e2900db74436bc7 |     
    arm      |         snmppp-3.4.10          | NOK | http://autobuild.buildroot.net/results/82f4eeb5b3424b788d41599deab4cff9455da608 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                 agentpp-4.6.0 | 1 
              host-rust-1.67.1 | 1 
                 libnss-3.88.1 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/b93bbc1b830a7c6ecb9c6f4c1c3ee4afe9f5a3ce |     
powerpc64le  |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/e1fe5e1f9e363b1a6f4882be09d1900f9f505abb |     
powerpc64le  |         libnss-3.88.1          | NOK | http://autobuild.buildroot.net/results/0b7c5e8175c46244e3a579aee560b2e61ed93e3c |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
