Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30158C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 06:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEB4180EB2;
	Wed, 10 Jan 2024 06:43:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEB4180EB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rOWUrgVGh05F; Wed, 10 Jan 2024 06:43:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7FD380EB6;
	Wed, 10 Jan 2024 06:43:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7FD380EB6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A8F5A1BF2BF
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 06:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4101380EB6
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 06:43:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4101380EB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hP3pNdmQgVWg for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 06:43:41 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A46080EB2
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 06:43:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A46080EB2
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7000A40009
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 06:43:38 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 06:43:38 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20240110064343.4101380EB6@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1704869018; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GXEiWKtTsYxXG9MNAFSZBWTDch6S+jxYFCTVvOIgFGo=;
 b=AuLHg2tubIzy9efwD6IpLOJfoH1XD/4YHI+jgwzkBWTvst0TDwgNpyQGTH8NJbrxehMZm6
 MeNLrHfG8wvSY2hgvyLF5BTqYQBdVbhmTbLJclb5JFhv7jn6NcPzXAS3T0rPnz6utHAPQk
 brSh0ZQ2icDTcMvc7k981R6CudzwiZbrIiq1EsO+1X20nHstLuwn1ICKKNvRhNDpaMbSfy
 UKFiHDEHVBzwbb2V5oQdb47J3zAeYskg7XawyExk57Hozt0U6NuGosB1NXNso0t6JoJLkN
 u4U9gv80EZ0vI1Wgof20PSPQT3xlf+BqrjuPNsLS6JqbRXx8K6Rc/WjVTOKxKg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AuLHg2tu
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-01-09
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

Autobuild statistics for 2024-01-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  4  |  2  |  0  |  6  |
  2023.11.x  |  1  |  2  |  0  |  3  |
    master   | 49  | 67  |  0  | 116 |

Classification of failures by reason for master
-----------------------------------------------

                   exim-4.97.1 | 11
  gobject-introspection-1.76.1 | 5 
                  stunnel-5.71 | 5 
ibm-sw-tpm2-5452af422edeff7... | 4 
glibc-2.38-27-g750a45a78390... | 3 
              libarchive-3.7.2 | 3 
                libressl-3.8.2 | 3 
cegui-00b4e1fe174da53b7ed72... | 2 
                elfutils-0.189 | 2 
                host-go-1.21.5 | 2 
              libopenssl-3.2.0 | 2 
                libselinux-3.5 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                  linux-6.6.10 | 2 
                    ngrep-1.47 | 2 
                 openssh-9.6p1 | 2 
             util-linux-2.39.2 | 2 
                    brltty-6.6 | 1 
                   duma-2.5.21 | 1 
              host-rust-1.74.1 | 1 
               ipmitool-1_8_19 | 1 
               libglib2-2.76.1 | 1 
                 libnss-3.96.1 | 1 
                    pppd-2.5.0 | 1 
          python-grpcio-1.60.0 | 1 
            quickjs-2023-12-09 | 1 
              sdl2_mixer-2.6.3 | 1 
                 sudo-1.9.15p5 | 1 
uclibc-ng-test-0f303c63fab7... | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |           brltty-6.6           | NOK | http://autobuild.buildroot.net/results/fa99c7fbf854c92eb3fb692b94bbd776e6c37412 |     
    i686     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/1004e873efb0ea01b1b4b2199d4dd20eda593d80 |     
    i686     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/52ea767f2d401c31a04526bb2638a8330c57fda9 |     
  aarch64    |          duma-2.5.21           | NOK | http://autobuild.buildroot.net/results/f82c6dc8de9551b7f7ed1becaf869a669767711a | ORPH
   nios2     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/e16dc6ab6c93eefc2d38b4049583d4f5a4fa9e5e | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/68fb816101799725422bb7137d8103c85097b152 | ORPH
   mips64    |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/b8675c0e3489a1b8bcbddbe38caa61f2311814b7 |     
    i686     |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/4f29475479510419b98e91c4eb0315af438302e8 |     
 powerpc64   |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/e1a5143d7cb82e3b55ae71eb903a9b5268912b51 |     
  aarch64    |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/1ad1b4250b2f04cdde4a34c10e86c0fb37411f58 |     
   sh4eb     |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/93a995a10545349582430f2761df139077ece86f |     
   armeb     |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/acc8586064f09108f6b4572812ee1b8773cb4977 |     
   s390x     |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/24ce313089315e47930aeb7906a2ac5d3e1ea925 |     
   mips64    |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/4c92e2e4dd3c59e69cefe8ab851e9b330c895b1c |     
   s390x     |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/ef6916a1d3784ace50b0836b6bbc7a5753f15592 |     
   mips64    |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/844c22d604ffda1d5e5e4ea0d44f2aa79b6ce11f |     
 microblaze  |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/3178f1eebca5cd9e5faad7c1dd7a85eb41046214 |     
 powerpc64   | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/a094a024fa802aef3f5a181a5e511f2dd63f82e7 |     
  powerpc    | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/a0dcf3cd7102c5c956744ca54143ef56a5d1dba1 |     
 powerpc64   | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/075ac4fb3b7af5f8a0cd435bbad94f77dacadc1e |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/458133b2bd79d9bee5095c2484a1aa3e81177822 | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/5dbb81434747eb545e07d0730a35af8827c56073 | ORPH
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/bd6eca772df5445b8fa9b07395fe6eb518dede78 | ORPH
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/f73160917ddaea7183e3e39927a5ed3e6887b36a | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/ed4000fb50ec433dfe50b1b6cabdb1a7e62f88cd | ORPH
    arm      |         host-go-1.21.5         | NOK | http://autobuild.buildroot.net/results/5e89662e913cc80ad766fe6c4f3473814bf8130b |     
   mipsel    |         host-go-1.21.5         | NOK | http://autobuild.buildroot.net/results/aa2b466d030f1676ac2ff718e6c95a75d11cec8d |     
  aarch64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/19ec5abf50a945751b1b90de5170418119cf9baf |     
    arm      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/55659441749680bab1ce36bb90494b57350c5dc9 |     
  sparc64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/3aa9ac1d167c11dc1077e309e2b845692f14e667 |     
  aarch64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/7f3dfcde08869c23986c61649ec0ace7f927e684 |     
  powerpc    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/e799c86eab7f1488b22e0689f82068dc59a20a57 |     
 aarch64_be  |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/fc1f4cab7e46a3a53c8958f7bbbb09b270a954f2 |     
    or1k     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/2f826e05b5c0dceee439f314bab2d7789393dfa3 |     
   nios2     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/343a8b26f89977feb3ccd2ccb45cb0937b31d9fa |     
    or1k     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/19f4e0156407a2e0c97bd0eac42105d0b2068ed2 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/4460e6950d02e817813dbde541b2754f66bc0a3e |     
   x86_64    |         libnss-3.96.1          | NOK | http://autobuild.buildroot.net/results/4ff23c3abf9f0f91aa63b43bf7c47d48e17e65ef |     
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/751423087c43a46903938854990c7e298afbc4ab | ORPH
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/fa9d90866a38b47cb7151238de3633933547de0c | ORPH
  powerpc    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/bb1f774fe3b0db5a6192078181a9df388573267c | ORPH
  mips64el   |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/87fe13e1134a737d0331e9b9a224b59ef68c0495 | ORPH
   arceb     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/3aeed1d87d19741840a747acee51d070d07d581d | ORPH
    i586     |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/af579508218ac4432e9dd918b00e98f4e5642bc8 |     
    i686     |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/c7a5effccf603be6f302cc47f0bf1f135e12e51d |     
  powerpc    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/db84db14bb141f1cd526cba922a0864c21fd67b0 | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/633b3a8ded5ec2c0bef82431c1cb3b03fc00d3b0 | ORPH
    sh4a     |          linux-6.6.10          | NOK | http://autobuild.buildroot.net/results/595e821dbe8176d4feb2e9dc1cb696a271a8691c | ORPH
   armeb     |          linux-6.6.10          | NOK | http://autobuild.buildroot.net/results/0a80afde5abab0c1651ede0b36b91dccd9481f55 | ORPH
  aarch64    |           ngrep-1.47           | NOK | http://autobuild.buildroot.net/results/320fc64a3f016910685dce1e49cd0d6b0e7f385e |     
  mips64el   |           ngrep-1.47           | NOK | http://autobuild.buildroot.net/results/05c916162b9c1027cf53f1699a1f5653151098ed |     
powerpc64le  |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/f31dd1ff9a1b533daacd94a1a081c71ef1c45fc7 | ORPH
  powerpc    |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/6d3eb6bf032aefb04bfd8b26c2322fe05ef58a52 | ORPH
  sparc64    |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/2878ecc594267fc7080bde6a4d5f250645ad0579 |     
    i686     |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/c8e4c560b6da3c36fdc1034ca6a9bde3986d457f |     
    arm      |       quickjs-2023-12-09       | NOK | http://autobuild.buildroot.net/results/9947edf86b311684e9e0065d638edee22c0a47df |     
    arm      |        sdl2_mixer-2.6.3        | NOK | http://autobuild.buildroot.net/results/039b71d2341a3742360ec6ce29f15fbd287b74d3 | ORPH
   x86_64    |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/3fca78e655d9f79958a841f31a665cc0b84e1db8 |     
  mips64el   |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/696eb05079fbb6424f31078382890e4c613b65dd |     
   mips64    |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/db4969ce71ef0a88dea74f4d883223c9565f7075 |     
  sparc64    |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/5dc5c57807bd59c91d237011e3f39f81e45ab937 |     
    or1k     |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/89f9267d2ed5343bfbb68f8622be9c794f12010d |     
    arm      |         sudo-1.9.15p5          | NOK | http://autobuild.buildroot.net/results/7eaaca9592661e0ac15e8efa55084dba28e0d634 | ORPH
   mips64    | uclibc-ng-test-0f303c63fab7... | NOK | http://autobuild.buildroot.net/results/8c6585b1b71edc25bc88d6bb1f243fca66520c35 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/21b7294a1de16f4756d572b0e53e957619bbc0e6 |     
  aarch64    |       util-linux-2.39.2        | NOK | http://autobuild.buildroot.net/results/8ec7492fed4cdc6193261934103442a566e0c868 | ORPH
    arc      |       util-linux-2.39.2        | NOK | http://autobuild.buildroot.net/results/a588e7390196a4af2ce6e618fccf9b4a3fc191d2 | ORPH


Classification of failures by reason for 2023.02.x
--------------------------------------------------

              host-rust-1.67.1 | 1 
               madplay-0.15.2b | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/32e73c881402054bcf27d2991b0a0bb895de86ee |     
   armeb     |        madplay-0.15.2b         | NOK | http://autobuild.buildroot.net/results/d97df7fb2a3648d46fcbd60f5b020f3813d437c4 | ORPH


Classification of failures by reason for 2023.11.x
--------------------------------------------------

              host-rust-1.71.1 | 1 
                    pppd-2.5.0 | 1 


Detail of failures for 2023.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/e1c41709819dc6aedeaa3907ad063192d842d149 |     
   sparc     |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/52473020f0f190322092d9e0691832cdd5a8c558 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
