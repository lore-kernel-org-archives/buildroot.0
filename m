Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A14DC77B7A
	for <buildroot@archiver.kernel.org>; Fri, 19 May 2023 05:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E2F4342C1E;
	Fri, 19 May 2023 05:29:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2F4342C1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wCgjPAxrkdXN; Fri, 19 May 2023 05:29:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9894542BF9;
	Fri, 19 May 2023 05:29:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9894542BF9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 473B21BF855
 for <buildroot@lists.busybox.net>; Fri, 19 May 2023 05:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B72761484
 for <buildroot@lists.busybox.net>; Fri, 19 May 2023 05:29:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B72761484
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U1RFr7XB8XXo for <buildroot@lists.busybox.net>;
 Fri, 19 May 2023 05:29:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3E9A6145F
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F3E9A6145F
 for <buildroot@buildroot.org>; Fri, 19 May 2023 05:29:21 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 15FD160003
 for <buildroot@buildroot.org>; Fri, 19 May 2023 05:29:19 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 19 May 2023 05:29:19 -0000
Message-Id: <20230519052924.1B72761484@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1684474159; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9rbguZLZZs4L1mC8HdzmW6fpPCH5QLJ/aPbKObb9B4E=;
 b=MH/nsLNMRA0zzwjRUakolzfh+bxER3UUfUgwUtmfyuZhpOEDuOo5vu5zwbcxOFfHvuDZOd
 FPmIN5JRSe9t1jPlzLN1ZTZTM4UJTQ4530+PWud4ZjWU1V2RnEoLY7QgbVipCyhmczTwl9
 n5pyPum3+vKszDJwKQGzbKomiJu7IT85u0JmTXAs+jzhkjlTx9nomFNlz7gkCC/uG7dmRv
 H9ioKTxft2WPhn4dte0JOO8sGsJP8gdHOlARQtlGJ7wxII02cKa47yayJDWCw/GODcGdQc
 ab3OvPXV+nN3k8YSIWMWg2CshH16ZxqiXiIrVqYkUtWR0aSITmGHSCkdGtLcpw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MH/nsLNM
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-05-18
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

Autobuild statistics for 2023-05-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  4  |  1  |  0  |  5  |
  2023.02.x  | 12  |  4  |  0  | 16  |
    master   | 75  | 67  |  0  | 142 |

Classification of failures by reason for master
-----------------------------------------------

package/sdl2_net/sdl2_net.m... | 5 
                host-go-1.19.9 | 4 
                   linux-6.3.2 | 3 
           sdl2_net-legal-info | 3 
                     audit-3.1 | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
glibc-2.37-2-g9f8513dc64119... | 2 
  gobject-introspection-1.74.0 | 2 
                haveged-1.9.18 | 2 
            host-binutils-2.38 | 2 
host-heimdal-f4faaeaba371ff... | 2 
              host-rust-1.68.2 | 2 
                 mesa3d-23.1.0 | 2 
                   perl-5.36.1 | 2 
                   trinity-1.9 | 2 
                 agentpp-4.6.0 | 1 
                 coreutils-9.3 | 1 
             dahdi-linux-3.2.0 | 1 
                elfutils-0.186 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
            host-binutils-2.37 | 1 
            host-binutils-2.39 | 1 
host-gdb-arc-2020.09-releas... | 1 
               host-runc-1.1.7 | 1 
                jemalloc-5.3.0 | 1 
                   json-c-0.16 | 1 
                  kexec-2.0.26 | 1 
      libabseil-cpp-20220623.1 | 1 
               libcap-ng-0.8.3 | 1 
              libgcrypt-1.10.1 | 1 
               libglib2-2.76.1 | 1 
                libglvnd-1.4.0 | 1 
               libsigsegv-2.14 | 1 
              libuhttpd-3.14.1 | 1 
               madplay-0.15.2b | 1 
           python-pyicu-2.10.2 | 1 
                    qemu-8.0.0 | 1 
sconeserver-8d1935919a20133... | 1 
                    sdl-1.2.15 | 1 
             stress-ng-0.15.07 | 1 
                     vdr-2.6.3 | 1 
                 wavemon-0.9.4 | 1 
                xenomai-3.0.10 | 1 
               xwayland-22.1.8 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/839727183cceb8412487c6319a97d7d435c1a9cd |     
   armeb     |           audit-3.1            | NOK | http://autobuild.buildroot.net/results/0819afb50ac55a85326f3043978cf72fcc16049e |     
    arm      |           audit-3.1            | NOK | http://autobuild.buildroot.net/results/052be737d98d4643aa7629f0ad140714b429b946 |     
   nios2     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/8c600b90209b0cd697ec46be4caf4acd9a9897ab | ORPH
    arc      |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/9b93df6bf002d991d2fb47633e20ae81540c6573 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/ee88f684286a0804f1ce4a1a23b3e9f988464459 | ORPH
    arm      | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/6771dea236357e96133da71a0a7dfd8ed18035e7 |     
   mips64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/669c2db04f1daa497670a22cc591a37e83077d5a |     
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/c2f29f4aa2aa3389b40c1d98714478ec5fad38fb |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/069c063e1e09479bb0d7d69ed1e2a46ed38c4a4f |     
    arc      | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/ad432bd1e01ecf2e15bf04a585599be3c9fefe9f |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/8d3c6e9ce1eb964b5f9b201db52b39207a1be134 |     
    or1k     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/995a598bfd0d0eaed9c2eab39bae83550e8dc346 | ORPH
   nios2     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/349c5ecebba5a9ac0ba7975c2dc5eb3b092ceba9 | ORPH
   xtensa    |         haveged-1.9.18         | NOK | http://autobuild.buildroot.net/results/ab52d39914b99a58077f47d7359c9112c3f11297 |     
   xtensa    |         haveged-1.9.18         | NOK | http://autobuild.buildroot.net/results/8e0c32973d6bdb8f74d04256d1303373656b83dd |     
   arceb     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/40d59870c0f173261607a8c5cb60d91ecbfe4b61 |     
    i686     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/dbace45f155d4a6ff44584750865c6deddb7c3ed |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ff2ba6aa694fd21019765ce79e61869e44e34b91 |     
 aarch64_be  |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/fb701d085bd0d00fd2b2671f5a9b6eb244025620 |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/d55433b165593dfc2abd267314fe81edea1f7715 | ORPH
   mips64    |         host-go-1.19.9         | NOK | http://autobuild.buildroot.net/results/96e84090f77b28c2a288f0c421c6de1f5185e7b6 |     
   mips64    |         host-go-1.19.9         | NOK | http://autobuild.buildroot.net/results/e1cd30a5720b01661468aa8c73d3094e1f20186c |     
    i686     |         host-go-1.19.9         | NOK | http://autobuild.buildroot.net/results/04461ec1484742cdb589d7f56dce900705393373 |     
   mips64    |         host-go-1.19.9         | NOK | http://autobuild.buildroot.net/results/18a3f44c1985222923baf01f4682224e8485234f |     
    arc      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/6fcc8d06acb8a533a3118b4fd9e5b16f62c95eb8 | ORPH
  riscv64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/215656fbcb67ca0b6488ba9385706a26cbf3b2cf | ORPH
   sparc     |        host-runc-1.1.7         | NOK | http://autobuild.buildroot.net/results/d921513b340c5a214ab17f5611b5f762461de745 |     
   armeb     |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/50fb2087d73bd29884a38e211ae101d85cf2c85d |     
    mips     |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/797c1a5b15c584d9829251cf811927121be83a22 |     
    sh4a     |         jemalloc-5.3.0         | NOK | http://autobuild.buildroot.net/results/396e612e5272e583c8819ab6530f858b5cbfcabb |     
  riscv64    |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/e9d891d7c937ca0ab61e9b56a2087bb1a5b1debd |     
    m68k     |          kexec-2.0.26          | NOK | http://autobuild.buildroot.net/results/82fcb6a9908906b7c162c5119ccc8a68a4827b58 |     
powerpc64le  |    libabseil-cpp-20220623.1    | NOK | http://autobuild.buildroot.net/results/90693e0ce4392ed96fee4dfdc2360b904b75c5b5 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/15c4c7b02159cf1698600abe2ee1f06d6e21025e |     
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/8d1526a2ac8b6cb7a466c4ab94ed6dd4b97fa207 | ORPH
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/203feb7ed0ac18aec39b45436d241e61147b6300 |     
 microblaze  |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/5de575d8a7d96c3d7b99a3419c850bad2ee35f58 | ORPH
  powerpc    |        libsigsegv-2.14         | NOK | http://autobuild.buildroot.net/results/2ffc85d78e06c601ef1db328674387304bc3da84 |     
   mips64    |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/371abe0f88044a2bbadb98a42f78f7d3074d5f0f |     
   xtensa    |          linux-6.3.2           | NOK | http://autobuild.buildroot.net/results/b0f2f7b2eb5f1cb535de3e5eafd16488ab1d09d7 | ORPH
    arm      |          linux-6.3.2           | NOK | http://autobuild.buildroot.net/results/a9b1960e922b397aa36f8e69d7e829854ff8292f | ORPH
   mipsel    |          linux-6.3.2           | NOK | http://autobuild.buildroot.net/results/902355c77c30baccb65dca259d11461366c4b19c | ORPH
   armeb     |        madplay-0.15.2b         | NOK | http://autobuild.buildroot.net/results/97fc75a2984b1a564f86a0a7f302027d3223b22f | ORPH
    arm      |         mesa3d-23.1.0          | NOK | http://autobuild.buildroot.net/results/01109560288f933019eea726a91c4109fbcca794 |     
   x86_64    |         mesa3d-23.1.0          | NOK | http://autobuild.buildroot.net/results/9c1407ca5be221dbb3ee03d2a95ada65bb7eb36b |     
  sparc64    | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/3976e95d74de9fa27bc08323f0b7cae5c6ccdf0b |     
   s390x     | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/0c9cdc9a2f254cc042908d90489407a186c72713 |     
   s390x     | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/69503f59b1e0d5f6ba832fb45535be8dd9a88bce |     
 aarch64_be  | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/c144300f5ac25623a3b2ed06ba765c27856d9035 |     
powerpc64le  | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/a06bee5701d500824126cd3a7809cf73e694def4 |     
   arceb     |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/199a725829aea0a0601fc4f5b408b19b105703fd |     
  aarch64    |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/6ef953663c8baa9e3f6a44208178451761a5ad86 |     
microblazeel |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/0fd6868773a4f8619e151689488328d7358869b9 |     
powerpc64le  |           qemu-8.0.0           | NOK | http://autobuild.buildroot.net/results/12a8e51b34d46cd954c3eebbcb0a4454922a4cd7 |     
  mips64el   | sconeserver-8d1935919a20133... | NOK | http://autobuild.buildroot.net/results/7fb30816db7c1fc15a75cd6193ef1dc4e986d858 |     
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/9ad4630897b6b359a2408e52b12b85a3eb3d7fd8 | ORPH
    arm      |      sdl2_net-legal-info       | NOK | http://autobuild.buildroot.net/results/94d57763af14f52cf2a3b6b4b62085055a996876 | ORPH
   xtensa    |      sdl2_net-legal-info       | NOK | http://autobuild.buildroot.net/results/51ff0f9da1e49cd200b9120d917fbbcb0eb47d4b | ORPH
   x86_64    |      sdl2_net-legal-info       | NOK | http://autobuild.buildroot.net/results/d992b2aec0f0e7e32714d22236ecfceddf51f185 | ORPH
    sh4      |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/7e8eb9f4941efe55d2ae893825bd2517fac287b4 |     
   armeb     |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/353cee80a415c839e3bb87206f7b5474b9cb74f4 | ORPH
  powerpc    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/8e69e5aa25ee166df6548f0d06b184d0b0a5683a | ORPH
  powerpc    |           vdr-2.6.3            | NOK | http://autobuild.buildroot.net/results/91972ff8b04a7baf95f05d2bcbf9fce2b1c4580b |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/8b7cd4ec55fdda13cf358f9b3cb73e88a09da0b0 | ORPH
   nios2     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/8f51fe3cf5ab804f296ac2d40901a15e8780868c |     
   mipsel    |        xwayland-22.1.8         | NOK | http://autobuild.buildroot.net/results/8e4bbfae276dbe4155b723a12d634146d2993ffe |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

              micropython-1.17 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |        micropython-1.17        | NOK | http://autobuild.buildroot.net/results/787f85556364d022fd803f9a93588937a9817a51 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

               apcupsd-3.14.14 | 1 
                busybox-1.36.0 | 1 
            compiler-rt-11.1.0 | 1 
                  linux-6.1.27 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/92855df4cbb155dfc60213171913a6832c31f628 |     
    arm      |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/e43c008dc0d3deba2a90b274257e4d5840585e98 | ORPH
  riscv32    |       compiler-rt-11.1.0       | NOK | http://autobuild.buildroot.net/results/b8961031ccc91fc3643d92788b735b233bc36c23 | ORPH
   x86_64    |          linux-6.1.27          | NOK | http://autobuild.buildroot.net/results/c5c34290ecc123a722b844e144335d7573ebfeb7 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
