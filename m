Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC4BC7EE22
	for <buildroot@archiver.kernel.org>; Sun, 14 May 2023 05:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E594E83C18;
	Sun, 14 May 2023 05:35:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E594E83C18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VZCF2oXix3Va; Sun, 14 May 2023 05:35:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97DF7821E3;
	Sun, 14 May 2023 05:35:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97DF7821E3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 07AEC1BF41F
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 05:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DFFD840B98
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 05:35:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFFD840B98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DtnsYBWTRkJb for <buildroot@lists.busybox.net>;
 Sun, 14 May 2023 05:35:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A13AE40B94
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A13AE40B94
 for <buildroot@buildroot.org>; Sun, 14 May 2023 05:35:17 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C1B571BF206
 for <buildroot@buildroot.org>; Sun, 14 May 2023 05:35:14 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 14 May 2023 05:35:14 -0000
Message-Id: <20230514053519.DFFD840B98@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1684042514; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IY6abWaIBpGRyuvSzM48QUh+GM5Mp8QAg8UOaQj0S1o=;
 b=DYLlnpkzNN8ACiNmuYntvrEwf2uH8xPwXsWdZk5Snf2DjwB0F7SoPmZTgBU3AMyu90LYAQ
 WXNa9oDY0vtcz/Ucz/95RxmJKih8iHCsunVY3hkpc0HEKa/uFI9nFyetUoGfd8QNbuDNww
 /ZbjKg8YNxAYk09/zhugqEuF7ZU3qSsWSkiydoCp+yvtR4BBkkWoyQGcOc2/ToB6Fjp6pE
 6dDpZDgFGeIOtttQi7GrfOVtJe5qAI0f2RAXXlzc4l7FhaKMKZ/SzPpa1IeOX1CKFos2ej
 TbwrSw5Iqi9pxwwABlTug7rGkbfDAhk6x5lWTiGqPsiKA1l59VNhw2owJkj4tA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DYLlnpkz
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-05-13
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

Autobuild statistics for 2023-05-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  4  |  1  |  1  |  6  |
  2023.02.x  |  6  |  9  |  0  | 15  |
    master   | 79  | 69  |  0  | 148 |

Classification of failures by reason for master
-----------------------------------------------

          host-nfs-utils-2.6.3 | 5 
              host-rust-1.68.2 | 5 
                 coreutils-9.3 | 3 
  gobject-introspection-1.74.0 | 3 
                 agentpp-4.6.0 | 2 
                alsa-lib-1.2.8 | 2 
             dahdi-linux-3.2.0 | 2 
            host-binutils-2.38 | 2 
host-heimdal-f4faaeaba371ff... | 2 
               host-qemu-7.2.0 | 2 
               libglib2-2.76.1 | 2 
                 wolfssl-5.5.3 | 2 
                     audit-3.1 | 1 
                 dhcp-4.4.3-P1 | 1 
                elfutils-0.186 | 1 
            flatbuffers-23.3.3 | 1 
       freeradius-client-1.1.7 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                glorytun-0.3.4 | 1 
                     gmp-6.2.1 | 1 
               gocryptfs-2.3.2 | 1 
                   grpc-1.51.1 | 1 
host-gdb-arc-2020.09-releas... | 1 
                host-go-1.19.9 | 1 
               host-runc-1.1.7 | 1 
igh-ethercat-2e2cef61318953... | 1 
          imagemagick-7.1.0-51 | 1 
                  libbpf-1.1.0 | 1 
         libcpprestsdk-2.10.18 | 1 
              libgcrypt-1.10.1 | 1 
                  libnfc-1.8.0 | 1 
                 libp11-0.4.12 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                   linux-6.3.2 | 1 
        ltp-testsuite-20230127 | 1 
            micropython-1.19.1 | 1 
                mongodb-4.2.18 | 1 
                  ntpsec-1.2.2 | 1 
            ocf-linux-20171122 | 1 
               openblas-0.3.23 | 1 
                   perl-5.36.1 | 1 
         python-greenlet-2.0.2 | 1 
            quickjs-2021-03-27 | 1 
                    sdl-1.2.15 | 1 
               syslog-ng-4.1.1 | 1 
                       unknown | 1 
                     vdr-2.6.3 | 1 
                  xvisor-0.3.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/e36e645a4955cda13217b2b1057185626d201ea6 |     
  sparc64    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/cad8739512f2c1587d80562288b6260af1eaa859 |     
    or1k     |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/a7d54935a01631d81480999d5257d4349a41f12b |     
    or1k     |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/de0a93ced0289a5765b4a46d25321a8cdfc2a251 |     
   x86_64    |           audit-3.1            | NOK | http://autobuild.buildroot.net/results/20eea262b19991003f3e3322d6eed244a6c5f9a2 |     
    or1k     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/d61d1e29e7e7ada2bbccb3f57976e9993c1c3ebc | ORPH
   nios2     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/94433c3bc3c033e819087261765f33f3675fef19 | ORPH
    arc      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/fa1134e3823a5e6aae1ad9804f6ee8fa2306ef1b | ORPH
  sparc64    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/f9a91a5340bd0e29fd5c7dd5b393ca0c2bd17555 |     
    arc      |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/f0ce3a8807fc3cfd83603e7e4ca49ceb5e206145 |     
   sh4eb     |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.net/results/d5ad69e7b7a098798cf5fe068b92a782aea027ee | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/41e3be56696a6d9534413e430e21ebb62f3b63f7 | ORPH
    arm      |       flatbuffers-23.3.3       | NOK | http://autobuild.buildroot.net/results/7bf3899f417063f14edecd765d187fdafba7b526 |     
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/183976640642aa1bd945d252cb8d1b2c026c5614 |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/b862128b9cd3f3f6fd2ae07a98c4cb2fd00daac5 |     
   nios2     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/9a6c5c91c9df946b5b0348fdbbefcff77b04b7e9 |     
  aarch64    |         glorytun-0.3.4         | NOK | http://autobuild.buildroot.net/results/efe718e72a20bad10af34e0201dcc2941a3aa6c6 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/d2351bf9d8240501d13f914d7fe7d40e05f61fa4 | ORPH
   s390x     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/8cb8d21dbe3d6c850c5d834b5e1dbbf02028b233 | ORPH
    i586     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/590365a7f2bfb458decab3cc7dcb7732d0e5a163 | ORPH
  sparc64    |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/64203311ab88a4929ecd1648732b2ae6a666b5cf | ORPH
   s390x     |        gocryptfs-2.3.2         | NOK | http://autobuild.buildroot.net/results/b2bbcefef1c54ba4b467cabb938bef91d84165cc |     
    mips     |          grpc-1.51.1           | NOK | http://autobuild.buildroot.net/results/18d6fd058a9638b73292792ce0401be3ce1b34c9 |     
  riscv64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/313604cd69813c7a7bb26c716da5af663853df33 |     
powerpc64le  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/148cf7fa8f8fdb1a8450a2e97346bff962ad07e3 |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/3a3f5bd3efa15b3c668e984d554f42cf8e3d4db6 | ORPH
  mips64el   |         host-go-1.19.9         | NOK | http://autobuild.buildroot.net/results/c55c6904a26a508119638f7445cc6ac8aa690076 |     
  sparc64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/bde240006188641f18f13260e64391ca5815756c | ORPH
    sh4      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/45ab9cb353fd473ce0c7f07f11bddbc23dc02845 | ORPH
   x86_64    |      host-nfs-utils-2.6.3      | NOK | http://autobuild.buildroot.net/results/b088c580cfffbe595b26bb93b332c52548051d7d |     
  mips64el   |      host-nfs-utils-2.6.3      | NOK | http://autobuild.buildroot.net/results/4336aaf58554412c6b59070b886949cbd6bc018f |     
microblazeel |      host-nfs-utils-2.6.3      | NOK | http://autobuild.buildroot.net/results/84b5e53eda15a92c5bd6f5c1de15c92ded0bf903 |     
microblazeel |      host-nfs-utils-2.6.3      | NOK | http://autobuild.buildroot.net/results/0535e851f3d5919958a76d81099d8ac6f88e91c8 |     
    or1k     |      host-nfs-utils-2.6.3      | NOK | http://autobuild.buildroot.net/results/5e1ac97e4023f902dffa066c895aa6f6005d541c |     
    mips     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/572ca40320c94d7b3f6d330bd4a6b9d3149bb45b |     
microblazeel |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/3f8d1254984222089627ad1973238514b9fe1ad9 |     
    arc      |        host-runc-1.1.7         | NOK | http://autobuild.buildroot.net/results/f3686e39ee9a3661d58f17db6f01ec427d9715f2 |     
   s390x     |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/4f6f3455f4d10d0643b1d33b5d708cf1d82f4239 |     
  aarch64    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/500db917497caa8cf57bb1e1e9b1a437e7c35062 |     
  sparc64    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/fba51e375bff1ed4a17b6a970ae699837d9edcbb |     
   mipsel    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/aacf81b5defa8964496b6fe38d3a492e29ac6e89 |     
   mipsel    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/3ead1a02eb29d25e6676d7452e7f75c40a15f85a |     
   arceb     | igh-ethercat-2e2cef61318953... | NOK | http://autobuild.buildroot.net/results/c5fff167eadb72f94f608465a960a9bfa8f916c5 |     
   sh4eb     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/6cf17322ca95503794e49c861d26b61651516007 | ORPH
  mips64el   |          libbpf-1.1.0          | NOK | http://autobuild.buildroot.net/results/87cf21f0ea7db7509fd273d2601d0305024a7f4b |     
    or1k     |     libcpprestsdk-2.10.18      | NOK | http://autobuild.buildroot.net/results/3f74280dea231e46a7f88be48e7e731dd9506f7d | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/64ff60df62a35373ccaf1a247b8e48fa0fe14d08 | ORPH
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/4c2ed1290fb2cd43b937ee02253588092f45042a |     
   sparc     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/caa2b4b9e6dbcdd8f2a99ff4fdd64c7eb1c6efb8 |     
    or1k     |          libnfc-1.8.0          | NOK | http://autobuild.buildroot.net/results/331b5da323d189ba6ab3e6dfa511182f00cefe29 |     
   sparc     |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/95f659d3e5722c8047b34fe8bcd85d49b882c26e | ORPH
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/ca646982dfefd0cd86f06be0692179fd7fb4aacd | ORPH
    arc      |          linux-6.3.2           | NOK | http://autobuild.buildroot.net/results/4336291866f31991d0e7eff2d241bf8753415308 | ORPH
  sparc64    |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/6c3453305bfc0eacc47fd6987f9fb1c2b3c3beaa |     
  aarch64    |       micropython-1.19.1       | NOK | http://autobuild.buildroot.net/results/42db44c8d445c8c2b2b0a53a5c5fe9884bc697ea |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/3235b39d14981ff7619b9b8075b5c225894d1170 |     
    m68k     |          ntpsec-1.2.2          | NOK | http://autobuild.buildroot.net/results/f97ff21f47ca751e4989ed87a7d7a8528c23eadf | ORPH
  riscv64    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/040a726acb6195e0e4ee327dd9c54dc30f06b621 | ORPH
    i686     |        openblas-0.3.23         | NOK | http://autobuild.buildroot.net/results/d1ff0d96b631b097d7c34ed755ca27d6c9f3a956 |     
    arm      |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/770f244a9984e2b945a6a4cd9f1015d1a78c63f9 |     
    arm      |     python-greenlet-2.0.2      | NOK | http://autobuild.buildroot.net/results/5fe17331116fe7a946c752083ad382a083307795 |     
 microblaze  |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/6d62f93cda593d179efb101800649c49a9ff7120 |     
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/fda9aafc5e3435cf6bbdb9ada33a6a3ddf1f2d55 | ORPH
    i686     |        syslog-ng-4.1.1         | NOK | http://autobuild.buildroot.net/results/57902c265c54f1c3fb4f1518eab01a2f38e07901 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/bbfed42576a5806a7dd9740d06d5a5d0f95a0abe |     
    sh4      |           vdr-2.6.3            | NOK | http://autobuild.buildroot.net/results/31ea80e7a1a22573fb0bc7a410935240d0a1db73 |     
   armeb     |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/e1f39af43502771e1272bdda432eb457247410d8 |     
  mips64el   |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/3f268e73e3fc81c1c0f5fd99cbc901e8bce6de25 |     
  riscv64    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/c6b606ecb902ecfe80ed29f094dab29ea4173342 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                       libuwsc | 1 
                 snmppp-3.4.10 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |            libuwsc             | TIM | http://autobuild.buildroot.net/results/f4f64b4f30fa062ad2a2cf2b3e6ad25c8bf7de8a |     
  powerpc    |         snmppp-3.4.10          | NOK | http://autobuild.buildroot.net/results/f07fd4cb83d9a36f718b62a8f00b46b79c0a8eb5 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                 agentpp-4.6.0 | 2 
                busybox-1.36.0 | 1 
                     efivar-38 | 1 
fs/ubi/ubi.mk:51: /home/bui... | 1 
            quickjs-2021-03-27 | 1 
                  reaver-1.6.6 | 1 
                       unknown | 1 
               zxing-cpp-1.4.0 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/1b5038cc210e089c5c1f4e85b315bb483948f178 |     
    arm      |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/0b481afd6ae587021c38bf85dc83df6a876e1603 |     
    mips     |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/ccb5bb72a6722be85fb3a9d23fd5abbcaf8ea324 | ORPH
    i686     |           efivar-38            | NOK | http://autobuild.buildroot.net/results/5ec5e6d77db1c398f69ebdce45966d30c97b6b76 |     
   sh4eb     | fs/ubi/ubi.mk:51: /home/bui... | NOK | http://autobuild.buildroot.net/results/b82f190d7ad10961a0ab1cf643131fdcfa7b88bd |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/ab2cb3fddf1b082c62d325a1a3bfbcb0708808bd |     
   arceb     |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/e643f193a7201698f450f08f61be0348a5050cc6 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/c2282528b6221bf86e674ed83cb752ca2f9a852e |     
    sh4      |        zxing-cpp-1.4.0         | NOK | http://autobuild.buildroot.net/results/9b8ccad561f11dcdc5390e896bc39bd1cc92e051 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
