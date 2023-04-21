Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2367C77B7E
	for <buildroot@archiver.kernel.org>; Fri, 21 Apr 2023 05:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1455581F6C;
	Fri, 21 Apr 2023 05:37:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1455581F6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Of6Xz6Pec8-P; Fri, 21 Apr 2023 05:37:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9466C840F6;
	Fri, 21 Apr 2023 05:37:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9466C840F6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DBDC11BF2BD
 for <buildroot@lists.busybox.net>; Fri, 21 Apr 2023 05:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACCFC840F6
 for <buildroot@lists.busybox.net>; Fri, 21 Apr 2023 05:37:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACCFC840F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RcN7xUB36CCD for <buildroot@lists.busybox.net>;
 Fri, 21 Apr 2023 05:37:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50C3781F6C
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 50C3781F6C
 for <buildroot@buildroot.org>; Fri, 21 Apr 2023 05:37:36 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5FE74E000A
 for <buildroot@buildroot.org>; Fri, 21 Apr 2023 05:37:33 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 21 Apr 2023 05:37:33 -0000
Message-Id: <20230421053738.ACCFC840F6@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1682055453; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nHPsZs/vpuCa2c0FJGHngEERFtjPdqMnq8ArWkRcb/g=;
 b=RF8tRP7a8ng5c+gss/GFKO5845rLwc/eB31mvz5DWG29JcQzOGgmRwqc8v57Z6xrmsh1pG
 MZLQQEg2B+WEd8Cq8L+TAhh+LpJ6k5DRKwVB5U2HDNsGhdM0/T1T2d/6JZ2dNIOK/Q8crF
 AeN+oaxoQUY7K4JLkMAmVsfrzL7RIHKHAjtK9OW8NTCUx7k8aESG7iiP4i35+xLtKIB8Sd
 3zExS968ITR8fy09Vy+agxpxv3oZ3+rhPdHVXiHFmyZWpruwyWh1MiO/B0ywlPurhGlA4C
 M4URylGNaldnUWj9JBA1avDo1cTDWNdoa9oqms9CQOl1koPTQXSuDDZluh+YCw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RF8tRP7a
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-04-20
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

Autobuild statistics for 2023-04-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  9  |  8  |  0  | 17  |
    master   | 158 | 135 |  3  | 296 |

Classification of failures by reason for master
-----------------------------------------------

                host-go-1.19.8 | 9 
                elfutils-0.186 | 7 
                  linux-6.1.14 | 7 
                 agentpp-4.6.0 | 5 
         host-gcc-final-11.3.0 | 5 
               libglib2-2.72.3 | 5 
glibc-2.37-2-g9f8513dc64119... | 4 
  gobject-introspection-1.72.0 | 4 
            host-binutils-2.38 | 4 
         host-gcc-final-10.4.0 | 4 
               host-qemu-7.2.0 | 4 
                busybox-1.36.0 | 3 
         gobject-introspection | 3 
                alsa-lib-1.2.8 | 2 
         argp-standalone-1.4.1 | 2 
             containerd-1.6.20 | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
            host-binutils-2.37 | 2 
            host-binutils-2.39 | 2 
              host-rust-1.68.2 | 2 
              libgcrypt-1.10.1 | 2 
          lttng-modules-2.13.7 | 2 
              tinymembench-0.4 | 2 
                 uclibc-1.0.43 | 2 
                       unknown | 2 
                xenomai-3.0.10 | 2 
                  acpid-2.0.34 | 1 
                acpitool-0.5.1 | 1 
                    attr-2.5.1 | 1 
                bpftool-v7.1.0 | 1 
                    brltty-6.5 | 1 
                  cairo-1.16.0 | 1 
                 coreutils-9.2 | 1 
                    crun-1.7.2 | 1 
                   duma-2.5.15 | 1 
        edk2-edk2-stable202208 | 1 
                     efivar-38 | 1 
             fontconfig-2.13.1 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                 haproxy-2.6.9 | 1 
host-sunxi-tools-1.4.2-168-... | 1 
                   json-c-0.16 | 1 
                libglvnd-1.4.0 | 1 
                  libjxl-0.8.1 | 1 
                   libnss-3.89 | 1 
               libsigsegv-2.14 | 1 
               libvorbis-1.3.7 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
               madplay-0.15.2b | 1 
                mongodb-4.2.18 | 1 
                    ola-0.10.9 | 1 
               openblas-0.3.21 | 1 
                   pcre2-10.42 | 1 
               pcsc-lite-1.9.9 | 1 
                   perl-5.36.0 | 1 
                     php-8.2.3 | 1 
               pipewire-0.3.65 | 1 
    python-cryptography-39.0.1 | 1 
           python-pyicu-2.10.2 | 1 
                rdma-core-45.0 | 1 
                  readline-8.2 | 1 
sconeserver-8d1935919a20133... | 1 
                    sdl-1.2.15 | 1 
ulog-0389d243352255f6182326... | 1 
           v4l2loopback-0.12.7 | 1 
    xserver_xorg-server-21.1.7 | 1 
               zxing-cpp-1.4.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/67cf7cb77b44e3839ce7b54679bd251f157581c7 | ORPH
powerpc64le  |         acpitool-0.5.1         | NOK | http://autobuild.buildroot.net/results/a86199faf1cb8c7c4111c099cfb32f181cfcb953 |     
  sparc64    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/6d49595ceeca8800e95d8d888c715e232a380cf0 |     
 microblaze  |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/e85702bb3227780da3750a13be8fde1ccd46185b |     
 microblaze  |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/76ef3ed75ea42e5fbef1175ffb302fcdbe82075c |     
    i686     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/fa2661960b01936a6ddbd15f0820111a54df9955 |     
    or1k     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/8d9d3199b37c3e7007e48aa79c6bdf00218f139c |     
   mips64    |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/a131655a2f088e37b96abd1ef3d8f468b65b79cd |     
   x86_64    |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/a9cedf7079d0e0790d8ac310e46bdce39e5278f7 |     
   armeb     |     argp-standalone-1.4.1      | NOK | http://autobuild.buildroot.net/results/65cb1b5cef863e5687bc9a42656af125cb0cb62f | ORPH
   xtensa    |     argp-standalone-1.4.1      | NOK | http://autobuild.buildroot.net/results/76f96c66f15408fd6ae03868e81bd54c1b876516 | ORPH
   mips64    |           attr-2.5.1           | NOK | http://autobuild.buildroot.net/results/19b4689a94af630e41423fe4b5b81d44b2340445 |     
    arc      |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.net/results/9d37023fe3cc5b214f91b87d53c1ee6aa1d4a875 |     
   mipsel    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/d2e9c957a0619f83a085e3464effc215ce7f5127 |     
    mips     |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/1a49b7003d22ff20c932ad46297076bb98d28442 | ORPH
   mipsel    |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/b1c609de1d1052ea77a09c17b6c99c3ff03edb72 | ORPH
   sparc     |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/a6c7f1c413250e145fca2b840e2b1c0ec5693afa | ORPH
   xtensa    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/268601c3cce29c9f7af72f6ecb55e0974f65ad5b |     
   s390x     |       containerd-1.6.20        | NOK | http://autobuild.buildroot.net/results/269367554ffe10c29336458264eedd92f44ef049 |     
    i686     |       containerd-1.6.20        | NOK | http://autobuild.buildroot.net/results/753fd16cf1d20f9b2fd6ffe689ba8668854d1356 |     
   sh4eb     |         coreutils-9.2          | NOK | http://autobuild.buildroot.net/results/f1f41b54552c3660536f1347dab10c236cc8660d | ORPH
    arm      |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/050e75fef71f4f58524754984d57a6223c0a6cea |     
    sh4      |          duma-2.5.15           | NOK | http://autobuild.buildroot.net/results/2e23b012b0ff117d32654182b9f27e650e9ed020 | ORPH
   x86_64    |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/0c0f446d4be158890cbde8d8ac390ff4db61cf84 |     
   mipsel    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/c2b91bb8d83e590ebee717e3613ebe57203b1857 |     
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/dfdf3bb19b527a619fdb5503398388abc4eff492 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/39bf9a5298028a2f8cbf3d3753066d30d579ce2d | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/d1b5e2cac806170215bb92bcdb3ae18eaf625391 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/7af958448a8ed049dce3b15dc2646abc75c9668c | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/3aac0cc4c1d70be5f71f9fd64badfbd927433c0c | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/8490db85248c39d7d404ea30d1059205db75faa4 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/55e9a475cb2ad9f997bb82591bd482ec34278f37 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/49222d3d015620424b6da11d7358f08597f2ab18 | ORPH
 powerpc64   | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/7d80c6712887d56bbd5d1889ec271d9b3a0c37fe |     
    mips     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/42c0ec7d7b5c63d91fab35d2cdc5c2e1b90e9102 |     
  powerpc    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/bb6dbf3e0b332c71bddb7eec00c8916679e57f4a |     
   mipsel    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/05aec8db699f34f54d9d33086676bcf2b2e392b0 |     
   armeb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/8b1741ef3b074e9da1a7e734b24b747b2a23c020 |     
    or1k     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/00702ef30c91d6ee1fabe266bbb15ccdce5a357f |     
   nios2     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/decc68c6b9e53cf2e3d229f338d3dfe2b1815415 |     
   xtensa    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/dec93b4521cbdf059cf3a3c03dc778b9d445019f |     
   nios2     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/a90999231f8516b6e61acdada01b5ad488680426 |     
   arceb     | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/0cf5a95d994eb14d065a08cb9e0017b7a310283c |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/3c2fcbb313c3e0c83af4ed963e6cc39a5692102a |     
   arceb     | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/9ebc3c8d57551eec0d97dc6c97d49cc50fd88c1f |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/22e5b57c16a6c70fbdbe849ebcd4d89fc1c7f864 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/1ebc60356caff60187607e20ec86c186cf8995a3 |     
   armeb     |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/5d4d27a541ba57b3cf41886fbf0ebf6e0440e812 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/ce25b64bfecc1fcb8b4424ceadaabcf2d137b558 |     
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/2d2022ff40153c22ea6f3bd2799cf4f6ea9c0b3e | ORPH
  powerpc    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/dc1255fdfb20a7d9a0e7474680890f2865034cb8 | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/6e65e9ea8598f77096932df5b490c83f9b604752 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/632c92ab767bbd60efcfdae7fe4601b836185867 | ORPH
  aarch64    |         haproxy-2.6.9          | NOK | http://autobuild.buildroot.net/results/0277e1114a4ded232b9651e9930a7cab8d00ace9 |     
   mipsel    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/c73a10d26a9ce9182c015d4f382f247c7062281f |     
   mips64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/6b4aafc21a37cd36df1c32ac129dbf8ac29fd93b |     
    i686     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/4a3709557bc934c53bb60367ed6e7692f6c5ba7c |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/5d803eb24cd01a8dbe517298aebe470a468c18b6 |     
   xtensa    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/5e75397fb06b5d218598976c18a13663d99911ec |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/bce475b9eac42cf7c0578f434d0795d84c4bc9cf |     
  mips64el   |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/59ae5eaa616a92ac652e130259670de8bc0468c2 |     
   x86_64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/a00ebdc843f94eab1ac8a26cb8afb9bbbd61687d |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/4a8e8e7eb6c211b9c8002f006c5e099c0037bad2 |     
    m68k     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/e9570701332457b4a8b3dba276c604b79c941dff |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/8a3eebe76f0459316976f135a9df4a6f441ffd2a |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/33eb685b4d4b36220e7b4b12a1ac04a2bdbbb704 |     
 aarch64_be  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/865a9f3712f25a7aa06b804921b5ad7ad510584c |     
    arm      |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/79eac8ff353805f8d44ee18b7cc3b070cf73eb78 |     
    arm      |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/38f1528570ef2d7baef611ce148a05075b525502 |     
    or1k     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/e33cf4f313c8b767a6ada154036689b32c43eaef |     
    mips     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/6f9b95171321c3d4928ff64d798a7f7e31e60249 |     
  aarch64    |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/73d894ec13392b53bb20b4dd599407f14367ceef |     
  mips64el   |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/a648d2820c74d7255d81fcebe11605374f82a572 |     
   mips64    |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/60fc983bbcd4d90ef1d049cb39ec4ba917c51ad2 |     
  mips64el   |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/dac16a136fbb072f77eed4ee23039b7519da1dbe |     
  mips64el   |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/977f6f59c9b74c6da23bef6129489bfb96d0ca39 |     
    i686     |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/5a96fea4cd5f00129a5502f832e9c68e089d6f9e |     
   mips64    |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/513180f226169cedcfe1309fe5028694f9811b35 |     
   mips64    |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/c329bb068e23a5bf1a60d561426f3ed60a67291c |     
   mips64    |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/98388a387b38be32da27f7cb528939dfc4d97b72 |     
    mips     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/2032f630469e9e699bf0dbf36e14e9fdc6ac584b |     
    sh4      |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/442139f583bbcf25ffb37448f45d991f935498ba |     
  powerpc    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/8a70738d73c5b15d4278600453a320b4931573fc |     
   s390x     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/efca791d8d67962cca3e11b1d306ec8ff95ae5c1 |     
   x86_64    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/b606c6c5239ea5024e280fa6b419fb0e68b4d5de |     
  aarch64    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/b6d357118d9fd4ea9a3c213dd12706f7ebad58f8 |     
    arm      | host-sunxi-tools-1.4.2-168-... | NOK | http://autobuild.buildroot.net/results/27b91562895aad1fe80cb90ebf55a3d8f012ca06 |     
  riscv64    |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/d7af4b0ff7ac415f0beac865c996e73b1616772f |     
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/0b25d2c9cc358a3de48fa6489a5b96b899f762bb | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/921831c265b13c8e2d033c959a6f8186d5f94140 | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/a26cf5a31b9d775bb498e38f2d975e9342de01b0 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/43ea81a6e3460346bacbb30ba317fe59704e34a2 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/e966a08686e3710a91fb651959db41aa60ed3ae7 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/d5cd5c30d5299114ea7972e8a9ccc3adddb80234 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/127565e85bc3e626a1530c46e0f6e100d60d2da9 |     
   arceb     |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/0b89840b6f9974afcf6904f26d7a25c11e610f84 | ORPH
powerpc64le  |          libjxl-0.8.1          | NOK | http://autobuild.buildroot.net/results/61cbdb3c5ed1de8ebcc0670dcdbe5f3165c4c0d2 |     
   x86_64    |          libnss-3.89           | NOK | http://autobuild.buildroot.net/results/14cef881614432421faeeb7f1736e47f4afafc8b |     
  powerpc    |        libsigsegv-2.14         | NOK | http://autobuild.buildroot.net/results/32ff7da7e5bac805ffd301c67d81491caf0a6ef1 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/5438de4f8f4334bf78384b781577b2d627f40486 |     
    sh4a     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/28d51840e03304aba422cf1848bb7f8788e5257a | ORPH
   nios2     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/6f320c3fcbc18e7f8f3631f60cad9b5751574388 | ORPH
    m68k     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/566917a9fb5551b6a0f8abf0c3b14a941e25a166 | ORPH
   mips64    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/59c0c2f429c877c8edc50edede99758c71fa4e84 | ORPH
   x86_64    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/b81d544897a490e67c50248c9c9706e732a27adb | ORPH
   mips64    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/d339e29414bb7b40d90e585cf6dcefeeda5a0214 | ORPH
  aarch64    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/db1a1d4933fd09109ad5d9b6afa662daa3f53c35 | ORPH
   mipsel    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/a3164c7ab6820c78f14967504f60e299670cf045 | ORPH
   mipsel    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/794f7b04d6a39a1b67c891ce85ccb4984c21efb1 | ORPH
   arceb     |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/7dddf957b8b7f2af35e65febde1d6b81e071d25d |     
   x86_64    |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/fb4e7bcd4c0fdfbb4ab480bf076874f4bb182803 |     
   armeb     |        madplay-0.15.2b         | NOK | http://autobuild.buildroot.net/results/61fb366476162bc5a72472f95b204bd0f42258c5 | ORPH
   x86_64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/6ddde4fc806f0761813e18202edd91e106e4ba59 |     
  sparc64    |           ola-0.10.9           | NOK | http://autobuild.buildroot.net/results/42e44e453fc8a8218a29348a09d5843d29433c40 |     
  mips64el   |        openblas-0.3.21         | NOK | http://autobuild.buildroot.net/results/b7324fc46adb2001970963af2f993a741dc5e28f | ORPH
   mipsel    |          pcre2-10.42           | NOK | http://autobuild.buildroot.net/results/d61678c7d1cb88a2edbb960c76e328886583480f | ORPH
powerpc64le  |        pcsc-lite-1.9.9         | NOK | http://autobuild.buildroot.net/results/e7b8ad3b9122d5e1c361f933f2fd5524d2054ce3 | ORPH
powerpc64le  |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/41a791c163e44937f66cb1ca31e1accb410a6d48 |     
 microblaze  |           php-8.2.3            | NOK | http://autobuild.buildroot.net/results/aff6b445b97dbc84f67604980d6a99628ceac59f |     
    sh4      |        pipewire-0.3.65         | NOK | http://autobuild.buildroot.net/results/a971f8615b921e5ed49920645f41aca87fd70cf3 |     
   mipsel    |   python-cryptography-39.0.1   | NOK | http://autobuild.buildroot.net/results/d06babd2b3bd86e6547b469bc71e2bda31a8ee5f |     
microblazeel |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/7739cdc3c94b790c721afc37503362d1b0b388f2 |     
  powerpc    |         rdma-core-45.0         | NOK | http://autobuild.buildroot.net/results/f14920084855e77a5fc3b6e6545721ed6fe8d307 |     
   x86_64    |          readline-8.2          | NOK | http://autobuild.buildroot.net/results/c83eece42bcdd317646bf0f6ec0fd7f8178f17fa | ORPH
   sparc     | sconeserver-8d1935919a20133... | NOK | http://autobuild.buildroot.net/results/a23534ea0b4c3fde0004f0ed2ad5d642a846eac2 |     
    sh4a     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/fc98b0b38e7312cab3280482d197ca94451d3dcb | ORPH
    arm      |        tinymembench-0.4        | NOK | http://autobuild.buildroot.net/results/754fcfe1283e7dce0937e7bab51cf76901830344 |     
   armeb     |        tinymembench-0.4        | NOK | http://autobuild.buildroot.net/results/ca4605b20061d7fb6aa96e9b985bfdf44fa6c4ac |     
  powerpc    |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/780ae93a476f54c34b392683a33d498762a6b821 |     
 microblaze  |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/571a61a0a29da140e2caf108d2c2374d69b797e3 |     
   sparc     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/0acd437ff397834e0a3a02e1444850c861834de2 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/93994d83d72b4ae75340f72ade4665826d5108c8 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/bf9390932422b075a0be7b87a272481bc16450db |     
   x86_64    |      v4l2loopback-0.12.7       | NOK | http://autobuild.buildroot.net/results/042348ccde28506d37c02bf610f439a867024de9 |     
    i686     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/afd0f7757afd44236a73c55d7f116ebd093dce37 |     
 aarch64_be  |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/3e239535662934aec97f0b6e6e6b6ef9129fe0c8 |     
   x86_64    |   xserver_xorg-server-21.1.7   | NOK | http://autobuild.buildroot.net/results/a2a7940a91e0de5ea35f93766bd59eeae41b6df9 |     
   xtensa    |        zxing-cpp-1.4.0         | NOK | http://autobuild.buildroot.net/results/a5966e7524cf4e3c45b17f1bc574e83634c6e49f |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                 dc3dd-7.2.641 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
                gnu-efi-3.0.15 | 1 
          host-gcc-final-8.4.0 | 1 
               host-qemu-7.2.0 | 1 
              libgcrypt-1.10.1 | 1 
                  linux-6.1.14 | 1 
               madplay-0.15.2b | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/25a69e1dcc22efcc15c9f5ff26aedca03fab53a1 | ORPH
    arc      | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/e21434f2a055927650635f6f63a3745fc082acd7 |     
  mips64el   |         gnu-efi-3.0.15         | NOK | http://autobuild.buildroot.net/results/ecceb0f28708b1e5d22d9a3c6a927306a9374c01 |     
  powerpc    |      host-gcc-final-8.4.0      | NOK | http://autobuild.buildroot.net/results/9bc6425f634b99ad381506a3a4558d72719d1460 |     
   s390x     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/8c3ba51e6fd21994d1dd82bacdda503bd26cdae6 |     
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/94d2e7353d79ad5111fdb92823bafa173bf2993e | ORPH
   xtensa    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/9f4ff8b3f6595ab0be982c7764cc0dfbb7a502b4 | ORPH
    arm      |        madplay-0.15.2b         | NOK | http://autobuild.buildroot.net/results/93867071ccd8d4cfed94f87db87e01674a0d7b2a | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
