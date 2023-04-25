Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41D1C77B61
	for <buildroot@archiver.kernel.org>; Tue, 25 Apr 2023 05:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09888409C0;
	Tue, 25 Apr 2023 05:35:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09888409C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4EH-4TdyQkIH; Tue, 25 Apr 2023 05:35:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D1FA409CB;
	Tue, 25 Apr 2023 05:35:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D1FA409CB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D274A1BF2C3
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 05:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2EAB4018E
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 05:35:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2EAB4018E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hX1JTCHJvZNM for <buildroot@lists.busybox.net>;
 Tue, 25 Apr 2023 05:35:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69D3E400CB
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 69D3E400CB
 for <buildroot@buildroot.org>; Tue, 25 Apr 2023 05:35:17 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4AA6BC000B
 for <buildroot@buildroot.org>; Tue, 25 Apr 2023 05:35:14 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 25 Apr 2023 05:35:14 -0000
Message-Id: <20230425053519.A2EAB4018E@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1682400914; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VN1E/1vEvOb5b9crkZIn4u+80HMlyrio98vX1h+j6Dg=;
 b=oyu2XB5V3BRRaqcDVKPUsXNTxHUoPsr114DEyyUlUs8N8qXu2ta7H4u0ectF6tjQE4jWYB
 pZAN3lJfHbAaQxvprp2mBYbp14ZQQ4Jn4mUD6ehwkppAgE8ud2ZJ85VFtqVcia4qDZRc4y
 vdNdtOpfOL+AiTfWTyWfeR+gq5lMa0Trqy6r+UE/7vQcHmk4+qAgQ2vYy9JgLRMGnEd0Gw
 uAaA6LrJYGrWQ9QIYYSomZ1evsZ4qlMsMDXTQOZWlYwuioyVs6M+V/PcGM1E6ns6VWot7g
 LH1ZtTlQean0d/cpmd1zOI+GI+F5fEHrviSWgNBgjRyx1WlEmVrtlwIfz0vw7w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oyu2XB5V
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-04-24
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

Autobuild statistics for 2023-04-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  4  |  5  |  0  |  9  |
    master   | 68  | 52  |  0  | 120 |

Classification of failures by reason for master
-----------------------------------------------

glibc-2.37-2-g9f8513dc64119... | 4 
         host-gcc-final-10.4.0 | 4 
               host-qemu-7.2.0 | 3 
               libglib2-2.76.1 | 3 
                  linux-6.1.14 | 3 
        edk2-edk2-stable202208 | 2 
         host-gcc-final-11.3.0 | 2 
              host-rust-1.68.2 | 2 
              libgcrypt-1.10.1 | 2 
                  ntp-4.2.8p15 | 2 
         argp-standalone-1.4.1 | 1 
                    brltty-6.5 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                gnu-efi-3.0.15 | 1 
  gobject-introspection-1.72.0 | 1 
            host-binutils-2.37 | 1 
host-gcc-final-arc-2020.09-... | 1 
host-gdb-arc-2020.09-releas... | 1 
host-sunxi-tools-1.4.2-168-... | 1 
               ipmitool-1_8_19 | 1 
               libdeflate-1.15 | 1 
                   libnss-3.89 | 1 
          linux-5.10.162-cip24 | 1 
            linux-fusion-9.0.3 | 1 
        ltp-testsuite-20230127 | 1 
              mosquitto-2.0.15 | 1 
                    mpv-0.35.1 | 1 
                  nginx-1.24.0 | 1 
                     php-8.2.3 | 1 
                  readline-8.2 | 1 
rtl8189fs-ed6741b52bc998875... | 1 
                 uclibc-1.0.43 | 1 
               xfsprogs-5.14.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |     argp-standalone-1.4.1      | NOK | http://autobuild.buildroot.net/results/2ce9fc122bb2761962c7f195b8feff2f2bb44752 | ORPH
powerpc64le  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/27677579b22c6b39ff15988a8b2bffb1a1e90b8f |     
    i686     |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/04c1ceee00a33204ee32f22a9b2943a2e895b144 |     
   x86_64    |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/a0809d176846d24dbbf05d9e624dc9d6de7f3371 |     
   s390x     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/a383058626fc767801307ba7b16b6a38e4f316df |     
    mips     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/2d7b3cca509b52198ec5012ecb72b207b9ea3cd9 |     
   x86_64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/0be899d3d4dfa7a7a88103e4b9fa157ccb758e99 |     
 powerpc64   | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/e7ba09b0bef64d33e7e05af792644278cce89883 |     
 powerpc64   | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/0e397d28be21b3255b84f89365f0e712a6ad9982 |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/438fe4f93a401e18e0dad95de68620e31596bb7a |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/6c70e202aa2f2ba77f365bceaf598b3521c5f10d |     
  mips64el   |         gnu-efi-3.0.15         | NOK | http://autobuild.buildroot.net/results/b9c3cf25e987fc08b6c75202b1b06d6b44c0315b |     
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/89db47bef3e5dcaaf5afd34335ae50de2c9db494 | ORPH
 aarch64_be  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/5bc4739f0eeb4ac2ca66ac18dd1ba3050769ab15 |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/974afecd807506919504921939cd60c40ce7891b |     
 microblaze  |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/ccbbf3ed21586d0a309d57fc7bfa8c5c274ea398 |     
    i686     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/97a61dab868726ae9fe5dc7d54d7893f9f71f5ed |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/028cc96db9164c9220c0c97b617dce94e7dd90d8 |     
   mips64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/cfa1164b162fa37b09fa6c0571fa5010e759c779 |     
   xtensa    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/649d5e769a2f80907f06f248bc1ee584a3ccd0ef |     
   arceb     | host-gcc-final-arc-2020.09-... | NOK | http://autobuild.buildroot.net/results/fcdc99afd30cc9c34d0f0501f1a71731ff58db0b |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/33fab471a3436fdd5d3bbbc60fcc272d4d21c5a9 | ORPH
   s390x     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/25c55094360f912baf44d4a8de8875eb4ae8b18b |     
   armeb     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/52894912eecdfb49f44f423608447527b1ef3296 |     
   s390x     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/ef114d2a3003a8665190899290125bfe3b3cd1c4 |     
   x86_64    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/c9ca6fa1920eecf38224e897780d7414837d091d |     
  sparc64    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/abea1cc55d1a769ed23429771a68a8bc7780755b |     
    arm      | host-sunxi-tools-1.4.2-168-... | NOK | http://autobuild.buildroot.net/results/f3ff29e299990b474c27e95072d98d4544e8b856 |     
    or1k     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/a628fbab515b1432cd47c336800df51b9d0d035e |     
   armeb     |        libdeflate-1.15         | NOK | http://autobuild.buildroot.net/results/be727e0000f154794e7a3677b3d666b96668b44c |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/988d35eb0a6740582a2b831d908fdfb66e1634b2 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/31c6076f7c3915b8da14f34c6bc50388956554a0 | ORPH
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/6de322f710d6669042bb974e4de21c7c02c8b549 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/2e2174b7a81abf23ffd64df382b74f3544ef3d84 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/1a1063b4da563d884f939e1147f4ab0e90f65a1f |     
microblazeel |          libnss-3.89           | NOK | http://autobuild.buildroot.net/results/b126244da41449bb4d21f262294a0a030a058f65 |     
microblazeel |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/b92456865206abdb4b75519525accd9eb376008c | ORPH
  mips64el   |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/557f92a0c5b066734380645f2dfcb7d1e786db61 | ORPH
    sh4a     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/7bbe08acc5de971e9f8292ab72922f70c341777a | ORPH
   sh4aeb    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/33f0bb48ce99da18b38c9c1bdbb7542961dfca73 | ORPH
 powerpc64   |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/0a9a16aba8903b6ad2fdd0573de768d1c0a39834 | ORPH
   x86_64    |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/89d0dd6efd07f96a9f42c5d908a8f660fc7a21e4 |     
    or1k     |        mosquitto-2.0.15        | NOK | http://autobuild.buildroot.net/results/f66308e77fa3e1a5349f4f972e6b0dd919b86b5a |     
    or1k     |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/e137da2ddf7346cd8607e7b462e395c34a66807a |     
 microblaze  |          nginx-1.24.0          | NOK | http://autobuild.buildroot.net/results/9d064537b68bede7f2b7251adde05bb509c12f0f |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/0a4bf5890b01eaee07c3ba71df761acb1a5941e0 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/594eea16529c3e699d799c0a7af5559f52c83496 | ORPH
   sh4aeb    |           php-8.2.3            | NOK | http://autobuild.buildroot.net/results/cc147e0a7d389b2e36b13ee67f7922a9976d9d95 |     
   armeb     |          readline-8.2          | NOK | http://autobuild.buildroot.net/results/1676780251273532876d19e320196aa50fd2b3c3 | ORPH
    i686     | rtl8189fs-ed6741b52bc998875... | NOK | http://autobuild.buildroot.net/results/1843ceb07bd6635b546f6ff18b59ef007d7f5939 |     
  powerpc    |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/cbc12da3a997b4e62a5fdcec5326514aa885ffa7 |     
   nios2     |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/c4fed289ee8941ed17cda6ead732f8dba6cee307 | ORPH


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                elfutils-0.186 | 1 
glibc-2.36-81-g4f4d7a13edfd... | 1 
                host-go-1.19.8 | 1 
                       iw-5.19 | 1 
                       unknown | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/0d862719599f7f23175e9d4d70fbade3bc5d043f | ORPH
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/0cdd31254b61f6b4f83725c85fca065827206e70 |     
powerpc64le  |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/b104e99595c71ae4eabbf6649b14bd6899dfafc6 |     
    m68k     |            iw-5.19             | NOK | http://autobuild.buildroot.net/results/cab979f0b9d00cde43e7dfd74a9facdc9dd6728e | ORPH
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/c1e3a9700a027317514abc768ee3ce386d28b969 |     


Gitlab CI results for 2023-04-24
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
      TestClangCompilerRT | https://gitlab.com/buildroot.org/buildroot/-/jobs/4163179309  | ORPH 
           TestCrudiniPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4163179314  | ORPH 
...ToolchainBuildrootMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4163179971  | ORPH 
...olchainBuildrootuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4163179972  | ORPH 
...xternalToolchainCCache | https://gitlab.com/buildroot.org/buildroot/-/jobs/4163179973  | ORPH 
...ernalToolchainCtngMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4163179975  | ORPH 
...ToolchainSourceryArmv4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4163179982  | ORPH 
...ToolchainSourceryArmv5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4163179983  | ORPH 
...ToolchainSourceryArmv7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4163179984  | ORPH 
     TestFileCapabilities | https://gitlab.com/buildroot.org/buildroot/-/jobs/4163179037  | ORPH 
     TestGlibcAllTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/4163179077  | ORPH 
...DefaultLimitedTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/4163179081  | ORPH 
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4163179367  | ORPH 
...ystemSystemdRoNetworkd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4163179259  | ORPH 
      TestIso9660Grub2EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/4163179177  | ORPH 
 TestIso9660Grub2External | https://gitlab.com/buildroot.org/buildroot/-/jobs/4163179179  | ORPH 
...0Grub2ExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/4163179182  | ORPH 
   TestIso9660Grub2Hybrid | https://gitlab.com/buildroot.org/buildroot/-/jobs/4163179187  | ORPH 
 TestIso9660Grub2Internal | https://gitlab.com/buildroot.org/buildroot/-/jobs/4163179189  | ORPH 
...so9660SyslinuxExternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/4163179193  | ORPH 
...slinuxExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/4163179196  | ORPH 
...so9660SyslinuxInternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/4163179201  | ORPH 
                TestKexec | https://gitlab.com/buildroot.org/buildroot/-/jobs/4163179370  | ORPH 
               TestLibJXL | https://gitlab.com/buildroot.org/buildroot/-/jobs/4163179374  | ORPH 
               TestMender | https://gitlab.com/buildroot.org/buildroot/-/jobs/4163179463  | ORPH 
 TestPerlLWPProtocolhttps | https://gitlab.com/buildroot.org/buildroot/-/jobs/4163179495  | ORPH 
       TestPerllibwwwperl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4163179494  | ORPH 
              TestPhpApcu | https://gitlab.com/buildroot.org/buildroot/-/jobs/4163179503  | ORPH 
            TestPhpLuaLua | https://gitlab.com/buildroot.org/buildroot/-/jobs/4163179507  | ORPH 
         TestPhpLuaLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/4163179510  | ORPH 
               TestPhpPam | https://gitlab.com/buildroot.org/buildroot/-/jobs/4163179515  | ORPH 
          TestPhpPeclDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/4163179518  | ORPH 
        TestPolkitSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4163179528  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4163179532  | ORPH 
     TestPythonPy3Automat | https://gitlab.com/buildroot.org/buildroot/-/jobs/4163179578  | ORPH 
         TestPythonPy3Can | https://gitlab.com/buildroot.org/buildroot/-/jobs/4163179625  | ORPH 
      TestPythonPy3Django | https://gitlab.com/buildroot.org/buildroot/-/jobs/4163179688  | ORPH 
...PythonPy3MagicWormhole | https://gitlab.com/buildroot.org/buildroot/-/jobs/4163179778  | ORPH 
         TestPythonPy3RSA | https://gitlab.com/buildroot.org/buildroot/-/jobs/4163179846  | ORPH 
      TestPythonPy3Spake2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4163179861  | ORPH 
     TestPythonPy3Twisted | https://gitlab.com/buildroot.org/buildroot/-/jobs/4163179868  | ORPH 
                   TestS6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4163179928  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4163179961  | ORPH 
              TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4163179964  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4163179965  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
