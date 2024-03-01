Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC56C5475B
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 06:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C979A40165;
	Fri,  1 Mar 2024 06:45:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zm8BLFjPIvdv; Fri,  1 Mar 2024 06:45:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A017409A6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A017409A6;
	Fri,  1 Mar 2024 06:45:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9D6301BF35E
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 06:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 979D340917
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 06:45:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ncQWwThEtxZw for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 06:45:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BF281408CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF281408CC
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BF281408CC
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 06:45:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 734262000B
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 06:45:20 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 01 Mar 2024 06:45:20 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1709275520; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QQXiKDmsYl8UY2cHe2KvTaqoF9uNv0QFULMu33Too7Y=;
 b=AEJW+T+3d4Cw13r7fohq02DE2UdoaNLkUOWG6zxjz3/bcXNfvG0Oj0vH0AViZ+ZE9LeJEI
 jHdbFEy5cqiFf1uJAP5aT9RiLBJWzL4cdw0oghH6Th6YeRrOwph8nhYoqTKN7Pn+PUzvsC
 gfR6yzZtAC7NhiSE0yylhsk74ThmhQXFEmxEmO9yWC1q0Rdn8fh02OJuLxC55EIlp7HMtA
 1qH2KDUDQFcXtSGWIQxVxxK6vleS54do7H/naZGy8jF/04S93wSUQO4sAc4o6VY5pRX1Rb
 OkbcbzmoK7YWnWvJti0bmB1axTo1oQlgf0PyTFtbr41pP50YCcVbPV2PrPkXdw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AEJW+T+3
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-02-29
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
Message-ID: <20240301064520.HXn18zEiEvgtiecA8yoXQ0s3-MolLz496ZTRXlDGI70@z>

Hello,

Autobuild statistics for 2024-02-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  3  |  2  |  0  |  5  |
  2023.11.x  |  1  |  4  |  0  |  5  |
    master   | 55  | 63  |  2  | 120 |

Classification of failures by reason for master
-----------------------------------------------

    host-gcc-bare-metal-13.2.0 | 11
               libpthsem-2.0.8 | 9 
              host-rust-1.74.1 | 4 
                libressl-3.8.2 | 4 
glibc-2.38-44-gd37c2b20a478... | 3 
                  linux-6.6.18 | 3 
                elfutils-0.189 | 2 
            gdk-pixbuf-2.42.10 | 2 
         gobject-introspection | 2 
  gobject-introspection-1.76.1 | 2 
host-python-setuptools-scm-... | 2 
              libopenssl-3.2.1 | 2 
ltrace-82c66409c7a93ca6ad2e... | 2 
                       unknown | 2 
             bluez5_utils-5.72 | 1 
                    dust-0.9.0 | 1 
                  ffmpeg-4.4.4 | 1 
                     file-5.45 | 1 
                gnu-efi-3.0.17 | 1 
        host-sentry-cli-2.20.3 | 1 
igh-ethercat-f5dc109176400f... | 1 
              libarchive-3.7.2 | 1 
               libglib2-2.76.1 | 1 
                  libnfc-1.8.0 | 1 
               openblas-0.3.26 | 1 
                 shadow-4.14.3 | 1 
                     shim-15.8 | 1 
             sofia-sip-1.13.17 | 1 
             strongswan-5.9.13 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4aeb    |       bluez5_utils-5.72        | NOK | http://autobuild.buildroot.net/results/1fc87cfa223495f6fd290baf7453464dfcb6b149 |     
  powerpc    |           dust-0.9.0           | NOK | http://autobuild.buildroot.net/results/4bc163110f2fabc9908f83fd9f2d487e7de18e33 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/5fbbb202baf59a8a84ec81f14c2abd8867ada0d1 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/0c4cc9e86d2f45c2cb05adaab7039253d511d1c9 | ORPH
    arc      |          ffmpeg-4.4.4          | NOK | http://autobuild.buildroot.net/results/245b2fe2418534f47f92e7935b384c4b77b2d679 |     
  powerpc    |           file-5.45            | NOK | http://autobuild.buildroot.net/results/0c16a61a55de5911dded356e05b9bcd1d774a17c | ORPH
 microblaze  |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/4d82c7fe93a7a42dfa24e4b51b31f06bf467235d | ORPH
    i686     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/cfcb25fb1dafe206992b4f3b343afad6d267a251 | ORPH
powerpc64le  | glibc-2.38-44-gd37c2b20a478... | NOK | http://autobuild.buildroot.net/results/29227cf558fc9295f9e284ed54e99e6617ba9172 |     
  powerpc    | glibc-2.38-44-gd37c2b20a478... | NOK | http://autobuild.buildroot.net/results/8224e8601b83f8778b3acbaec3408544f3d44876 |     
 powerpc64   | glibc-2.38-44-gd37c2b20a478... | NOK | http://autobuild.buildroot.net/results/fa47d5a9b2445b711a8afa639f6d6a5b37077275 |     
   armeb     |         gnu-efi-3.0.17         | NOK | http://autobuild.buildroot.net/results/cc7c7c654dd0de82b5be037f47ea78c7c87427c8 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/d3aac25a19a7a09421911f31bc4456a94f741b11 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/a955c93e48d67028ae28cb5d397c395ae3f13051 |     
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/b290e46c9b2cdb5e0fa59b4b30b6eb19486ab3e4 | ORPH
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/d19663d8f84bcd25b09182b1d5bf93f61441dde9 | ORPH
   x86_64    |   host-gcc-bare-metal-13.2.0   | NOK | http://autobuild.buildroot.net/results/28698af8e0a1ca8caf00d7fe1bf214fe3a038caf |     
   arceb     |   host-gcc-bare-metal-13.2.0   | NOK | http://autobuild.buildroot.net/results/05a68fcda51ead990abb779f0753578605bd11b5 |     
    m68k     |   host-gcc-bare-metal-13.2.0   | NOK | http://autobuild.buildroot.net/results/442196c6d02f7e058e306f3877afe6f55c1b2aab |     
   sh4aeb    |   host-gcc-bare-metal-13.2.0   | NOK | http://autobuild.buildroot.net/results/0e03139ab974c73e73fbbfd389d12bcec501dbc6 |     
  aarch64    |   host-gcc-bare-metal-13.2.0   | NOK | http://autobuild.buildroot.net/results/1d06b5b59d828cc106bcacd9cc9902d6b1a7b522 |     
    or1k     |   host-gcc-bare-metal-13.2.0   | NOK | http://autobuild.buildroot.net/results/121920e0d42a0327cd7cdd7ce08db4ba51574df9 |     
  aarch64    |   host-gcc-bare-metal-13.2.0   | NOK | http://autobuild.buildroot.net/results/04863c373c44bffcf3a325a3123249b9017d9548 |     
   x86_64    |   host-gcc-bare-metal-13.2.0   | NOK | http://autobuild.buildroot.net/results/9f96a0dd30b98bea5bff39c7b1cae321cbe5572f |     
   x86_64    |   host-gcc-bare-metal-13.2.0   | NOK | http://autobuild.buildroot.net/results/8aaff6be60234d78289764854ea16407c059d403 |     
microblazeel |   host-gcc-bare-metal-13.2.0   | NOK | http://autobuild.buildroot.net/results/d59754a612fe630f8a4a358943b887f42c34e4c0 |     
   mips64    |   host-gcc-bare-metal-13.2.0   | NOK | http://autobuild.buildroot.net/results/8e39335b6d128b0064af3f7e922892b724282754 |     
  aarch64    | host-python-setuptools-scm-... | NOK | http://autobuild.buildroot.net/results/decc65fd45e953128c17faa42eea0d08b571295d |     
  sparc64    | host-python-setuptools-scm-... | NOK | http://autobuild.buildroot.net/results/dcd6f99947ac2383fdb1c0c1345b49ea22a80c69 |     
  sparc64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/780abbabec4511685d2dd3a576d9a0cfe30c5624 |     
powerpc64le  |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/121ff9cba75687fc3a4100f0e1cd3e4f4a81c4ec |     
  aarch64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/058c1b15defe6d35fefa5bb930949561574f9e80 |     
  sparc64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/09d4e461cbbeff83a5b0f9539cc6d6bc04cd4a21 |     
    mips     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/911386bc75c44e902941197cd2d5d49113e6f0bf |     
    i686     | igh-ethercat-f5dc109176400f... | NOK | http://autobuild.buildroot.net/results/d5b6df48dcad536a371146af7bf7dfd5bcf3a539 |     
   x86_64    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/a69136353f58a292f58119ce69c6c857d32baa6a |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/eaec17a77e2dc204011c1101ddfbde3fda17cd9d |     
    or1k     |          libnfc-1.8.0          | NOK | http://autobuild.buildroot.net/results/24c72fbe28dee499396a8afb790b68bfacb62b59 |     
   s390x     |        libopenssl-3.2.1        | NOK | http://autobuild.buildroot.net/results/b830473b8114552c20bf6122dd7f7a35e7d42abd | ORPH
   s390x     |        libopenssl-3.2.1        | NOK | http://autobuild.buildroot.net/results/2abc9221387b7f0a80774e9ae8556a762dce4a73 | ORPH
  sparc64    |        libpthsem-2.0.8         | NOK | http://autobuild.buildroot.net/results/c2d281ffe8a546efd03aa03a5d5b3551f009b11a |     
   xtensa    |        libpthsem-2.0.8         | NOK | http://autobuild.buildroot.net/results/9c58f5b10384c79042bcccded27e0835099e3e7d |     
  powerpc    |        libpthsem-2.0.8         | NOK | http://autobuild.buildroot.net/results/5a1e51777fbb1a925da43404a8fd607e35c35b92 |     
microblazeel |        libpthsem-2.0.8         | NOK | http://autobuild.buildroot.net/results/f5de6c336fbd0abf87bc30dc522482c897c363f1 |     
   nios2     |        libpthsem-2.0.8         | NOK | http://autobuild.buildroot.net/results/cba17b8d51705b355c18ee662eb8bf23358973c5 |     
   mipsel    |        libpthsem-2.0.8         | NOK | http://autobuild.buildroot.net/results/d7cbccc0c9c6ec8026cbb105281fe9f2604b101c |     
 aarch64_be  |        libpthsem-2.0.8         | NOK | http://autobuild.buildroot.net/results/905da4c1db58690f66ff84647cfaeb56153eb672 |     
  mips64el   |        libpthsem-2.0.8         | NOK | http://autobuild.buildroot.net/results/29b20447958ea7d572249383d6b145f888ebfb41 |     
   armeb     |        libpthsem-2.0.8         | NOK | http://autobuild.buildroot.net/results/4089b50caefe36ad338064e0175ac98822845b1b |     
 microblaze  |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/e35ef68d9819c546ab7061245ee6ca012c69a9db | ORPH
   arceb     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/4fe1d97b1c148305d09af3661a443cd0d7af299a | ORPH
   mips64    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/bb405dad9b625f57f63b32baedd3733281b9af77 | ORPH
    sh4      |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/8b978ad8d4d56447cdf010814c6cbe073a98158b | ORPH
   x86_64    |          linux-6.6.18          | NOK | http://autobuild.buildroot.net/results/0507ffd019a10ef1cebc343f5478959315fe8266 | ORPH
  powerpc    |          linux-6.6.18          | NOK | http://autobuild.buildroot.net/results/ec23df1444194e29f3884d6fd0479b309f0fbceb | ORPH
  aarch64    |          linux-6.6.18          | NOK | http://autobuild.buildroot.net/results/edce244c35f543b20f3921a8675bf320d7410061 | ORPH
  powerpc    | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.net/results/5454b0e41d82c4f5079b8c35cb4908550c37747e | ORPH
   x86_64    | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.net/results/320d3309a2692e1fb456723a492f3edea270f18d | ORPH
   mips64    |        openblas-0.3.26         | NOK | http://autobuild.buildroot.net/results/b8da10aeb16343540ce3672faabdaa4d3bffb020 |     
   arceb     |         shadow-4.14.3          | NOK | http://autobuild.buildroot.net/results/77c455c6916c38aa1af04425d040abb3ec3812ed |     
    arm      |           shim-15.8            | NOK | http://autobuild.buildroot.net/results/580156f89cfd72122fef07aa2fe37b4fdd4c316b |     
  aarch64    |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/cc8f83a72fe3c922ae96a7cf5e31a55c6494444d |     
microblazeel |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/f9a87bc618123922bc2565c39fb9057ba2f91863 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/428a078a5e109d09e4a495c19f2b821c5b1e3e12 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/0e8b270c0da28a527662e5bd01ea3803818079a3 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                  ffmpeg-4.4.4 | 1 
                       unknown | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |          ffmpeg-4.4.4          | NOK | http://autobuild.buildroot.net/results/56278a2296496326469185b5b2e81abdac1a9907 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/f401615c5a332fd4afd368ef3b4a4dcf2d3e804f |     


Classification of failures by reason for 2023.11.x
--------------------------------------------------

                  bind-9.16.44 | 1 
                libselinux-3.5 | 1 
                  libsepol-3.5 | 1 
         lttng-modules-2.13.10 | 1 


Detail of failures for 2023.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |          bind-9.16.44          | NOK | http://autobuild.buildroot.net/results/0e7fd6caa342e150dc6fce2c2c62e80824cd30db | ORPH
  powerpc    |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/46139c3bb6efde27045d5b3bdbdc29fcf35c4d3c |     
    arm      |          libsepol-3.5          | NOK | http://autobuild.buildroot.net/results/feff738bf86e99325a33dd24e4de7c99190b4de4 |     
 microblaze  |     lttng-modules-2.13.10      | NOK | http://autobuild.buildroot.net/results/ef08ba3947f9fc675114ad86d1bea67c1af461f0 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
