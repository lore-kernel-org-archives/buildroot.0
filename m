Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CFF1C7EE29
	for <buildroot@archiver.kernel.org>; Tue, 13 Jun 2023 04:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D010B409A1;
	Tue, 13 Jun 2023 04:49:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D010B409A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R2p4WoB74hSJ; Tue, 13 Jun 2023 04:49:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CB58409EA;
	Tue, 13 Jun 2023 04:49:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CB58409EA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F2B341BF33D
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 04:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE83D409EA
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 04:49:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE83D409EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xUlJqQhEDFtR for <buildroot@lists.busybox.net>;
 Tue, 13 Jun 2023 04:49:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44D6F409A1
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 44D6F409A1
 for <buildroot@buildroot.org>; Tue, 13 Jun 2023 04:49:46 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8DC38C0007
 for <buildroot@buildroot.org>; Tue, 13 Jun 2023 04:49:43 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 13 Jun 2023 04:49:43 -0000
Message-Id: <20230613044948.BE83D409EA@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1686631783; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YQTo5+Oc2cFkyMjuWu106xnm8hIBccgZw8epDha+bQo=;
 b=SpNpY3cUYEqHFT8hoJKFJ6QBfs02f/jBiljDIobXoUn3dkTxCX7Fo1c1Fg739D4S/B5+dB
 TxIiQIHLTVtOh5VLeLx1xHpRrRuZA3IBgmgSDTaZkuHFCNTugjEQBeZivGegWRhauuAvJB
 0wlfxPEWnxqDrbJc15bX718kCqrhHLK/xsSyV2AQDnXpmJhyCLkzOLclnIhjXO8Mm6iMil
 Hg85arzV3ebOX6j4HGS4Cmst/htT81vkzl01vFBVFLVrke1DYEUseEfnL141MgcvOeGjU3
 NM5mGyZLJhQRc+hbunYJQalzwUN3KdUU9/BKPs/6676Jf0hY4idlv+blTDuolA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SpNpY3cU
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-06-12
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

Autobuild statistics for 2023-06-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  2  |  4  |  0  |  6  |
    master   | 60  | 51  |  1  | 112 |

Classification of failures by reason for master
-----------------------------------------------

                   linux-6.3.6 | 5 
                elfutils-0.186 | 4 
   host-bootgen-xilinx_v2023.1 | 4 
              host-rust-1.68.2 | 3 
                       unknown | 3 
                 agentpp-4.6.0 | 2 
  gobject-introspection-1.74.0 | 2 
host-heimdal-f4faaeaba371ff... | 2 
               syslog-ng-4.1.1 | 2 
android-tools-4.2.2+git2013... | 1 
                  assimp-5.2.5 | 1 
        edk2-edk2-stable202208 | 1 
              erlang-22.3.4.22 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/erofs/erofs.mk:46: /home... | 1 
fs/romfs/romfs.mk:32: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
         gobject-introspection | 1 
                 haproxy-2.6.9 | 1 
            host-binutils-2.37 | 1 
            host-binutils-2.38 | 1 
igh-ethercat-2e2cef61318953... | 1 
                  kexec-2.0.26 | 1 
              libgcrypt-1.10.1 | 1 
               libglib2-2.76.1 | 1 
                    libndp-1.8 | 1 
                    mpv-0.35.1 | 1 
               nfs-utils-2.6.3 | 1 
           python-bcrypt-4.0.1 | 1 
                    rtty-8.1.0 | 1 
                   speex-1.2.1 | 1 
                    strace-6.3 | 1 
                   trinity-1.9 | 1 
ulog-0389d243352255f6182326... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/e7f13ab1ce12d7bab4d8999b2a90a9152e3ff394 |     
microblazeel |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/86e65ca07c2e28ee65c1f9ea04bb08d19e11dc6d |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/9d5e228dc7de4562bcf5d5d15801c3fd011a5d16 |     
    mips     |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/d6caf3c2c0fd670e70950d3e89629df39f8ce596 | ORPH
   x86_64    |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/3f12bf4e399644fc843ad0d8774c31b124b33363 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/2a8f7add808771fc1aa746d4b3da721488d0fcc6 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/c6a65730410ad7ff4a817499011972c9b9e93a12 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/f2d3ae4bae81468b71b64d2cfcf2e0f4a12e0f86 | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/f011f39d0d023c1059a501b8f0f56570c36c76f5 | ORPH
  powerpc    |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/ba6c434405d09e4f053eddf4b2c190a4f255b95a |     
 aarch64_be  | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/a4905cd1d81a624d1dd6e203d049948252bfd634 |     
   s390x     | fs/erofs/erofs.mk:46: /home... | NOK | http://autobuild.buildroot.net/results/1e3df90174e93bb7017de39a1e3ea81c7113f1ca |     
  mips64el   | fs/romfs/romfs.mk:32: /home... | NOK | http://autobuild.buildroot.net/results/c488ea454f05c9f0345bf71902444567c028fff1 |     
   mips64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/101093f421b6dd44a8646f939dbfe8e93811d7db |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/146de52e8a316b8c4499fac98d55f7b045875219 |     
   nios2     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/59dbd8903a04caf90b8018cee10402ae293b6a4e | ORPH
    i586     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/0a54f3a6b9bb7bc8731bf65d1deef90a8068e1e4 | ORPH
  aarch64    |         haproxy-2.6.9          | NOK | http://autobuild.buildroot.net/results/07ccb8c45c709a4b6ed32aafa33cd04e74174b11 |     
   s390x     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/529d86aec3fb5e801539d4a8b8fdf4fb6c7fefe0 |     
    arc      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/16a67938862c5a0f1a58f4e71fdb5ecf198ce98c |     
 aarch64_be  |  host-bootgen-xilinx_v2023.1   | NOK | http://autobuild.buildroot.net/results/3b42420a83e619d72cb032915ca4d86b9aced940 |     
microblazeel |  host-bootgen-xilinx_v2023.1   | NOK | http://autobuild.buildroot.net/results/2936d9b054269b7055e66ab5a7f7c1f7f4926d48 |     
microblazeel |  host-bootgen-xilinx_v2023.1   | NOK | http://autobuild.buildroot.net/results/e65989a6611dd18d7afba649fbd822050e092a14 |     
    or1k     |  host-bootgen-xilinx_v2023.1   | NOK | http://autobuild.buildroot.net/results/0670ce606e635feaf1695261c0dcd59fed2f26a6 |     
   mips64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/16406c8d9fe55bba7ab3e3f98162753cea07e8cc | ORPH
    arm      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/e86d4e9c5db24701996b136f66898e63ea9a7661 | ORPH
  powerpc    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/d67c0e3f48c2caaec2bea3d505151984ff6d2828 |     
   mipsel    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/40f387d388e8f030599876994c91768364bf49af |     
 powerpc64   |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/8e085d3e7a01adf75f6875503d29ee556325247f |     
   s390x     | igh-ethercat-2e2cef61318953... | NOK | http://autobuild.buildroot.net/results/6609a319ea2ffc3596665b9c9c118f409a55e99c |     
    arm      |          kexec-2.0.26          | NOK | http://autobuild.buildroot.net/results/acb9036953876dfa45901aab03907479b8da0416 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/93330f9e1867b1ddc1de19b57d70d223b6f23994 | ORPH
    arm      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/fe4c472130af181d3721785a29ab28d968a8fce0 |     
  riscv64    |           libndp-1.8           | NOK | http://autobuild.buildroot.net/results/089aae247bf8643ba18255724b2c03e1064c1a2d |     
  mips64el   |          linux-6.3.6           | NOK | http://autobuild.buildroot.net/results/d0795f4136dd82c52830039659b479ca881805ac | ORPH
   mipsel    |          linux-6.3.6           | NOK | http://autobuild.buildroot.net/results/00af4be4b188a2b11d5218a0167a1a7d9dfa19a4 | ORPH
    m68k     |          linux-6.3.6           | NOK | http://autobuild.buildroot.net/results/ab77a4ae46a0db618d51cdbde5efbea846648ca9 | ORPH
   nios2     |          linux-6.3.6           | NOK | http://autobuild.buildroot.net/results/488472806670e029a2c372fa0291b3a5bb63fa50 | ORPH
  mips64el   |          linux-6.3.6           | NOK | http://autobuild.buildroot.net/results/45900e42d7ef6221781f6f13e9685a319ca8cbe4 | ORPH
   mips64    |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/b331eba24706a08b8509b06ac385232f713f61a1 |     
   mips64    |        nfs-utils-2.6.3         | NOK | http://autobuild.buildroot.net/results/eeca4dea2c9011cd07beb940126de9c598e1d1d6 |     
   armeb     |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/2c5f9fa36bee1f3c0a0373c8a7a776a332117994 |     
   mipsel    |           rtty-8.1.0           | NOK | http://autobuild.buildroot.net/results/738934abe98eb3e08eb85c27d11223b2d739e294 |     
    arm      |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/c557ca72832c942f201b4a21f913f74534857cc6 | ORPH
 powerpc64   |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/21445d66df9d5848a6f6d426feaf8c556f9876fb |     
    sh4a     |        syslog-ng-4.1.1         | NOK | http://autobuild.buildroot.net/results/1db73fbac39ec67cef10bca0de1ecff9aad4a426 |     
   nios2     |        syslog-ng-4.1.1         | NOK | http://autobuild.buildroot.net/results/ccaf714eb406985e51af4127e777d14bfebce13a |     
   mipsel    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/e6474664d827c06d14fca4c44f45b14fb928bbca | ORPH
 aarch64_be  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/6606c6fc856c1acfc8490fe358983a2b51b6eb1b |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/b3ba3533286c8a0cacdc8553f61a868a05797ea8 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/8e2622654634bae3653c85e3b8230159b6311c3b |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/d42e5d945378e212cb2b42d17d80a61bc452b390 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

               host-qemu-7.2.0 | 2 
fs/cramfs/cramfs.mk:46: /ho... | 1 
                python3-3.11.3 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/e37ad2edd685a58e1a9fbb74d80075e0cd447225 |     
    i686     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/732580c77f44405c29cb522005490cef00c34d7f |     
 microblaze  |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/e73bc7433e3527659104640d2cda6fe82070f878 |     
   x86_64    |         python3-3.11.3         | NOK | http://autobuild.buildroot.net/results/ba84ec90cb1dace8870c62d079e99d1722ccf0d3 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
