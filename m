Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B43C7EE22
	for <buildroot@archiver.kernel.org>; Tue,  9 May 2023 05:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AA26614A8;
	Tue,  9 May 2023 05:38:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AA26614A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gez4rTlSOpjz; Tue,  9 May 2023 05:38:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18BFF611D9;
	Tue,  9 May 2023 05:38:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18BFF611D9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ABC3C1BF306
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 05:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A9EC83CA8
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 05:38:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A9EC83CA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QcxqYcCnMv6v for <buildroot@lists.busybox.net>;
 Tue,  9 May 2023 05:38:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C67F83C99
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C67F83C99
 for <buildroot@buildroot.org>; Tue,  9 May 2023 05:38:46 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 13F3DFF808
 for <buildroot@buildroot.org>; Tue,  9 May 2023 05:38:43 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 09 May 2023 05:38:43 -0000
Message-Id: <20230509053849.7A9EC83CA8@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1683610724; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8+2XLevMaS1NYOA54uSdCpbzVW49XzMpuoSP0bWHupk=;
 b=S4JTlIkLN4JoSgH9AGwSLHzVvRpdBYnWA2RIGboLbbqut88NDCGWQab7SEpyycw3nke7uA
 OV//revjBBm06v1fY5uqdgR20dCLOM9EjdzpPIvbXUXYeahlzy5WGoXEsmxeWysDL7MW5Z
 0n+1f3jeIE7wZNdpaROhSZRdbDHysrp4eijK0HK4eZNl8BhPJhjtSVtUIkWnZasrWX8pQs
 roAie6biGLziXK8rCBNzGtyeLnTh9GVBntV2ie8KokJOQ/b7SSgEB9SwRO7emtLLOs3IGd
 3x4ZWwNwpXwvWE8FKX6Lq52N3rQSP0TQR67uzWP3eWaPoGg20RmB/BliYy/YJA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=S4JTlIkL
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-05-08
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

Autobuild statistics for 2023-05-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  6  |  0  |  0  |  6  |
  2023.02.x  |  9  |  7  |  0  | 16  |
    master   | 29  | 37  |  0  | 66  |

Classification of failures by reason for master
-----------------------------------------------

                 agentpp-4.6.0 | 4 
               host-qemu-7.2.0 | 3 
                 coreutils-9.3 | 2 
google-breakpad-c85eb4a59b6... | 2 
                   linux-6.3.1 | 2 
                       unknown | 2 
                    brltty-6.5 | 1 
                busybox-1.36.0 | 1 
                  cairo-1.16.0 | 1 
edid-decode-2d44e1b01c7ed7d... | 1 
glibc-2.37-2-g9f8513dc64119... | 1 
         host-gcc-final-10.4.0 | 1 
                host-go-1.19.9 | 1 
                  libbpf-1.1.0 | 1 
               libglib2-2.76.1 | 1 
               libvorbis-1.3.7 | 1 
          linux-5.10.162-cip24 | 1 
                mongodb-4.2.18 | 1 
                 opensc-0.22.0 | 1 
           python-pyicu-2.10.2 | 1 
                python3-3.11.2 | 1 
                  reaver-1.6.6 | 1 
                    sdl-1.2.15 | 1 
                 uclibc-1.0.43 | 1 
                     vdr-2.6.3 | 1 
                    zeek-4.1.1 | 1 
                     znc-1.8.2 | 1 
               zxing-cpp-1.4.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/f63200f1aaba327a9af3d6a9fb660741187f863f |     
   x86_64    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/7c77abcaa956cf152e35406e6262dbbb4eeb622b |     
   nios2     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/2b2d7b145124deb1a270c92c11706bc3f86d64f1 |     
    arc      |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/0bb2a2112fce43b5065c44ea304908e2550e2d3d |     
   mipsel    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/c274b476501d4cb7ca671cd793212910d50f2a3c |     
    arm      |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/1557a388788bcc2da0d3ac83ea5de39ae0cf3ceb | ORPH
   x86_64    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/ca2492e0eea13f1ba70a03a208f0914bf1b8b249 |     
    arm      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/a5bac0aaadea43fcedf3a51b070e605e3906c237 | ORPH
    or1k     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/c2d7460abbe045821be23750f0ac303032fc1f73 | ORPH
    arm      | edid-decode-2d44e1b01c7ed7d... | NOK | http://autobuild.buildroot.net/results/fff2cadaee1fa8c028ac558e852f7e52b1c8317b | ORPH
    arc      | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/7bb1105e1bb7d37f2e82e606cc35f9f3a4de93c0 |     
    arm      | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/ebebac4e0ac61e9cd6a9cdf693442099b589cfee |     
    mips     | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/1fe95ca12984080fbc16f6eecb318a3b22b670e4 |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/cebdbc8998e732aac57da7206e06133473670059 |     
   mips64    |         host-go-1.19.9         | NOK | http://autobuild.buildroot.net/results/2fb5189bf7d58994941862a415c3ed3454555a72 |     
   sh4aeb    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/44aa94a56cd67230bbff357672d443036b81ccfe |     
  sparc64    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/efea562636000adbd489555d787f4621bcfd7533 |     
  sparc64    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/54f9607259153727761779cc5106c8488ce224ce |     
  mips64el   |          libbpf-1.1.0          | NOK | http://autobuild.buildroot.net/results/aa09651e3fa3e16607c3a57dfdb9d05e90ca746e |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/43247294248741ae84f699a2185763bb8a1c87a5 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/36a4e56841632814a793da8e4a00e75a02efc239 |     
 microblaze  |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/6688265175fa51c55b4d7588423cd91c0788c402 | ORPH
 powerpc64   |          linux-6.3.1           | NOK | http://autobuild.buildroot.net/results/fff65ecfc3499550793dc1d301e69766f60d91fc | ORPH
  riscv32    |          linux-6.3.1           | NOK | http://autobuild.buildroot.net/results/ad26be7f6c17b64475cd8d9e14437e543264a130 | ORPH
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/c84c0bbe536d39698cbe3d6bc3601a0bdd2651d4 |     
    arm      |         opensc-0.22.0          | NOK | http://autobuild.buildroot.net/results/056780345dffa135446cf0c60b0a237432a87319 |     
    arc      |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/a872b7d91c77add5dae3d18bf843e540b0e7da7e |     
   x86_64    |         python3-3.11.2         | NOK | http://autobuild.buildroot.net/results/35dec48b6557dae2e8ed60fc803c5c4df625da52 |     
    arc      |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/aee6fe924b3a42adfa0b4201aeccc437d999c8f0 |     
    sh4a     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/ddeed05591c04f7bcd73f0726252164151a8d800 | ORPH
  powerpc    |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/32f3cf3743c9b658500332521711cdfd50a96593 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/f4473d6521f37642d3c828e3ad58b4fff1a69bd4 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/a997098210766b322738b1050141535f08b9f381 |     
   x86_64    |           vdr-2.6.3            | NOK | http://autobuild.buildroot.net/results/6c00925ffaa7bd0347b39d04fcd918eb77ba86f6 |     
 aarch64_be  |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/11abf7a39721ba51635e2ea8ca3a372d4f067e7b |     
   s390x     |           znc-1.8.2            | NOK | http://autobuild.buildroot.net/results/c53a8381eaab04c0fdc8e724730ba1493c6dc6a4 |     
   x86_64    |        zxing-cpp-1.4.0         | NOK | http://autobuild.buildroot.net/results/77e00a63362957fbaa935bae3524f82cbbe4c88a |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                    brltty-6.5 | 1 
                busybox-1.36.0 | 1 
                elfutils-0.186 | 1 
            host-binutils-2.38 | 1 
                host-go-1.19.9 | 1 
               host-qemu-7.2.0 | 1 
               zxing-cpp-1.4.0 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/7af7446bf1abf794781dcaaba892b0b2e8f1163b |     
    arm      |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/25718b1c3c759d3ee24cb7a5bbe85b115ac76138 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/0a4af28e558bdbfcebde6263f997ce0658210ea9 | ORPH
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/8c41182a7789144bacc68cf4e3dbdf5c14164f1a |     
    i686     |         host-go-1.19.9         | NOK | http://autobuild.buildroot.net/results/b7564c7a2f51bede928c1aa8be575f8acd2a92aa |     
   mipsel    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/c8c64cc9556aac3c209be3ad1d8624a9d596fac7 |     
  aarch64    |        zxing-cpp-1.4.0         | NOK | http://autobuild.buildroot.net/results/d98fa8a9b7e8b67a136fc159e5e3b53ccfd16b64 |     


Gitlab CI results for 2023-05-08
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
      TestClangCompilerRT | https://gitlab.com/buildroot.org/buildroot/-/jobs/4241787678  | ORPH 
           TestCrudiniPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4241787687  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4241788391  | ORPH 
...owerpce300c3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4241788402  | ORPH 
...ToolchainBuildrootMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4241788164  | ORPH 
...olchainBuildrootuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4241788165  | ORPH 
...xternalToolchainCCache | https://gitlab.com/buildroot.org/buildroot/-/jobs/4241788166  | ORPH 
...ernalToolchainCtngMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4241788168  | ORPH 
...ToolchainSourceryArmv4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4241788170  | ORPH 
...ToolchainSourceryArmv5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4241788171  | ORPH 
...ToolchainSourceryArmv7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4241788172  | ORPH 
     TestFileCapabilities | https://gitlab.com/buildroot.org/buildroot/-/jobs/4241787261  | ORPH 
     TestGlibcAllTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/4241787349  | ORPH 
...DefaultLimitedTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/4241787354  | ORPH 
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4241787768  | ORPH 
...IfupdownDbusbrokerDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/4241787553  | ORPH 
      TestIso9660Grub2EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/4241787435  | ORPH 
 TestIso9660Grub2External | https://gitlab.com/buildroot.org/buildroot/-/jobs/4241787436  | ORPH 
...0Grub2ExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/4241787474  | ORPH 
   TestIso9660Grub2Hybrid | https://gitlab.com/buildroot.org/buildroot/-/jobs/4241787498  | ORPH 
 TestIso9660Grub2Internal | https://gitlab.com/buildroot.org/buildroot/-/jobs/4241787501  | ORPH 
...so9660SyslinuxExternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/4241787504  | ORPH 
...slinuxExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/4241787507  | ORPH 
...so9660SyslinuxInternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/4241787511  | ORPH 
                TestKexec | https://gitlab.com/buildroot.org/buildroot/-/jobs/4241787771  | ORPH 
               TestLibJXL | https://gitlab.com/buildroot.org/buildroot/-/jobs/4241787773  | ORPH 
 TestPerlLWPProtocolhttps | https://gitlab.com/buildroot.org/buildroot/-/jobs/4241787957  | ORPH 
       TestPerllibwwwperl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4241787955  | ORPH 
         TestPythonPy3Can | https://gitlab.com/buildroot.org/buildroot/-/jobs/4241787999  | ORPH 
      TestPythonPy3Django | https://gitlab.com/buildroot.org/buildroot/-/jobs/4241788014  | ORPH 
                   TestS6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4241788133  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4241788156  | ORPH 
              TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4241788158  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4241788160  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
