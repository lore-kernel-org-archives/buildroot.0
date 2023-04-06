Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D04F1C76196
	for <buildroot@archiver.kernel.org>; Thu,  6 Apr 2023 05:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 049E541BAE;
	Thu,  6 Apr 2023 05:30:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 049E541BAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZBmbj8YXE8QN; Thu,  6 Apr 2023 05:30:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2321641BAF;
	Thu,  6 Apr 2023 05:30:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2321641BAF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1C1871BF859
 for <buildroot@lists.busybox.net>; Thu,  6 Apr 2023 05:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3B4F81DE8
 for <buildroot@lists.busybox.net>; Thu,  6 Apr 2023 05:30:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3B4F81DE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DM1tJOT4zKOU for <buildroot@lists.busybox.net>;
 Thu,  6 Apr 2023 05:30:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8A078145F
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B8A078145F
 for <buildroot@buildroot.org>; Thu,  6 Apr 2023 05:30:36 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D5441FF806
 for <buildroot@buildroot.org>; Thu,  6 Apr 2023 05:30:33 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 06 Apr 2023 05:30:33 -0000
Message-Id: <20230406053038.E3B4F81DE8@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1680759034; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4RJSW7DA6bLRYNY/7r18SZVo+u84peUQmAaFuu+OxW4=;
 b=FM3k3oKsAPAdOS1iE3Qu7wOrP/WNiWMiPsmCMZUz70lim+7Z3Cw+7M2E+m9ipubnotrIUJ
 k6z/dG/OXAThi0cpSUaG5/NVI7ubXcMC8zSKixmFzo4wKctuuQaJnuccuZMECa/XRlr5Rx
 Cf4hkV2W9EDvt63JYCWUjnJjHHCq3kh7Pl6GUceQnv0/CLOfIW4V+4AGJKGmNghnm/ufhS
 UsEjlZh7mijktjYLLGstyoeA4PcFI1eufpPCmiQzVftlXAbUKw+f8UxUREPfnknjahQ+oL
 C2NkbR1JUbndLUoeSXzm3g8eYEU0IVOMDdFSwr+F7a02UzRL7If+p2+DLv6g6g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FM3k3oKs
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-04-05
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

Autobuild statistics for 2023-04-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 21  | 19  |  0  | 40  |
    master   | 140 | 90  |  1  | 231 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 6 
             bluez5_utils-5.66 | 3 
                elfutils-0.186 | 3 
  gobject-introspection-1.72.0 | 3 
            host-binutils-2.38 | 3 
ulog-0389d243352255f6182326... | 3 
                 agentpp-4.6.0 | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
glibc-2.36-81-g4f4d7a13edfd... | 2 
            host-binutils-2.37 | 2 
            host-binutils-2.39 | 2 
host-gdb-arc-2020.09-releas... | 2 
               host-qemu-7.2.0 | 2 
              host-rust-1.68.0 | 2 
          linux-5.10.162-cip24 | 2 
                  linux-6.1.14 | 2 
                   perl-5.36.0 | 2 
                    sdl-1.2.15 | 2 
              skalibs-2.12.0.1 | 2 
                  acpid-2.0.34 | 1 
               ding-libs-0.6.2 | 1 
        edk2-edk2-stable202208 | 1 
             f2fs-tools-1.15.0 | 1 
              fluent-bit-2.0.9 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
fs/romfs/romfs.mk:32: /home... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubi/ubi.mk:51: /home/tho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
   gdb-arc-2020.09-release-gdb | 1 
                     gmp-6.2.1 | 1 
                gnu-efi-3.0.15 | 1 
         gobject-introspection | 1 
         host-gcc-final-12.2.0 | 1 
                host-go-1.19.7 | 1 
     host-moby-buildkit-0.11.2 | 1 
              libgcrypt-1.10.1 | 1 
                libgeos-3.11.1 | 1 
                libglvnd-1.4.0 | 1 
              libuhttpd-3.14.1 | 1 
     linux-5.10.162-cip24-rt10 | 1 
               linux-pam-1.5.2 | 1 
        ltp-testsuite-20220930 | 1 
                    musl-1.2.3 | 1 
          ncurses-6.3-20221224 | 1 
                    ola-0.10.9 | 1 
                    olsr-0.9.8 | 1 
package/rtl8821cu/rtl8821cu... | 1 
    python-cryptography-39.0.1 | 1 
            quickjs-2021-03-27 | 1 
rtl8189fs-ed6741b52bc998875... | 1 
                 syslinux-6.03 | 1 
                  tbb-2021.5.0 | 1 
                   trinity-1.9 | 1 
                 uclibc-1.0.42 | 1 
               xfsprogs-5.14.2 | 1 
                  zabbix-6.2.7 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/14b31be078e6d424d6332c301453af5e47c7cff3 | ORPH
microblazeel |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/951abe0ade63de0c40ae5286fee17fe733d397aa |     
   x86_64    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/327cc31062919fce51f33de86e7891d359c87621 |     
  aarch64    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/a556d5cc194dd03907dc3497492216792258bf89 |     
  aarch64    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/747ae9c81a2c8f9a1013844baf76e637e6dd4fa2 |     
   mipsel    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/0f69cefb37d05e4b89c229e6a4eb61c89afcc5cc |     
    arc      |        ding-libs-0.6.2         | NOK | http://autobuild.buildroot.net/results/79c5d4d06ccec41e64871f05db48de65d9d8af41 |     
  aarch64    |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/579b180b628089162bcf779a8b8ed81f2ff4c438 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/09534ca7c56ca0ea32964f8b8bfbd369d4bf8067 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/54ea6bde1065aa003350a28064c5734ce445d807 | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/c5daefdda503967b4598e1e661e31771ef201dfe | ORPH
    or1k     |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/5d991ece320ecd3691cd1a2118bba1b4d17e2640 |     
   x86_64    |        fluent-bit-2.0.9        | NOK | http://autobuild.buildroot.net/results/1e6c812b1ed21927d8ffc3e53f9dbfe3f28e6765 |     
    m68k     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/c85656a5b04532cfb4fa42692c04a8b8ca83e74e |     
    mips     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/9f07fb5ea881abc154510c362bb05807f82c90e2 |     
powerpc64le  | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/22835889400395b16b1b27957bf6a4b26b59bc29 |     
 aarch64_be  | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/7247339acabbc18b890b48b90a8f872cb9167df4 |     
  aarch64    | fs/romfs/romfs.mk:32: /home... | NOK | http://autobuild.buildroot.net/results/0f26fe3a6b947846ef95727d33802b37d6ba931a |     
    arm      | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/499c1be8a70974020969c160ae7a960aba0a6537 |     
   sh4eb     | fs/ubi/ubi.mk:51: /home/tho... | NOK | http://autobuild.buildroot.net/results/8c18d3621bfe46aa69ab3bdf181d17efcdafdfb1 |     
   sh4aeb    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/202a77c56a6cfdf64482c0465d166a59adb5cc98 |     
   mipsel    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/fcde44e1e085f0242815c39826f9c7dd33b071e9 |     
    arm      | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/fabc90222e62ef8f24641dcf7f51a27b26ee3f15 |     
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/8d3fc92638874133fe0189e5b01f58f2a455648a |     
    arc      | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/e07448ad83626fba9162e4d9341f9ca35e187559 |     
   nios2     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/64b976cade612ca308e8c7c8ac24e392a7e613bd |     
   arceb     |  gdb-arc-2020.09-release-gdb   | NOK | http://autobuild.buildroot.net/results/e38973119584851aa9c47aeecadfe0d621f792ef | ORPH
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/4928530fa27a5e73664d8150e2d277499ffc7c11 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/f0aab2343cc703936c27596a5f2baf9b37c74f63 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/914db9dc1295274f6c603e5cc6a96ae9da33b74f | ORPH
  mips64el   |         gnu-efi-3.0.15         | NOK | http://autobuild.buildroot.net/results/7c9efac19b215344b87676c1059f3194d8794262 |     
   armeb     |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/a2932ac5bd323c6fec61037d50234e526e3020fe |     
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/2260cc95600488d3036e41be286c84f8d3f121ab | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/51be6860c8084b90877dbafce9369c6430cec882 | ORPH
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/6a91dcd68666f412e66906f40a2e5732816ba334 | ORPH
   sh4eb     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/97ae98d005c3757efddee0c5ce4e1e8d4615e78d |     
powerpc64le  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/2b3aa0dac5da8d73d0bf6c521b4c88be6680c0aa |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/8abe5f24b266421132b3070c633966634fcf38d3 |     
  riscv64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a4a548d8e20d5c16ddfdb9f437c0d681d1b70925 |     
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a7d345a520eea421a92b0d880e3a391f4a438fbc |     
 microblaze  |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/335433bc464ed2c2849cfb7a7c4785c1f036172b |     
microblazeel |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/efdbfe9648add347b04fde373e0611743d05a114 |     
   armeb     |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/9da7edd1ad0271d964ee734ea25c311d6ec3a781 |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/11e8574a219a4a428faacb4c3aad963a8d995cb4 | ORPH
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/f803e66ba130c67ff2160c1d367d032cd0a4f2f2 | ORPH
    i686     |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/b5d5e934ed63d981e2380d4715a3eccc710f9b78 |     
   mips64    |   host-moby-buildkit-0.11.2    | NOK | http://autobuild.buildroot.net/results/fb4afdc97bad8c730bb39466d0971080f9e2128a |     
    mips     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/9928930b35b8b7efb9b909e900569e569ca38d78 |     
  sparc64    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/03508d721d7fa0e34b2626cc99bdd5552611fffb |     
   mips64    |        host-rust-1.68.0        | NOK | http://autobuild.buildroot.net/results/8d8ac921313c9a06458dc4c3e550ebe007381a73 |     
  mips64el   |        host-rust-1.68.0        | NOK | http://autobuild.buildroot.net/results/95f2038717fd837cd72e1e56b1bccb40a93c2b18 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/4b52fc53049ef3485c6a4bd0100594c23dea501e | ORPH
    or1k     |         libgeos-3.11.1         | NOK | http://autobuild.buildroot.net/results/441f0d29e5851f193d293dc6299cecc191f1d231 |     
   x86_64    |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/91c27ae9ef1bc15775583da62259d8f1f6465dd5 | ORPH
   mips64    |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/1c520a8ad6c2efd2d8bbe6e704ebf4b68b25d951 |     
 powerpc64   |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/bfde1bf6848b9be2978a5da92a75b7c8ddd08ea6 | ORPH
  powerpc    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/e562815a8c82b9bb70f2ab75b64378bb0f610072 | ORPH
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/9303248f10ccff5431b96e9c70c0796a767f4a69 | ORPH
   mipsel    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/d51881a8026058567e8daeebd33831cdadd44ed8 | ORPH
 aarch64_be  |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/5220a7ac5dc29d931fad27d12b348fa45074e6b2 | ORPH
   arceb     |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/0420fef970bd913826d007abc5c5b4313a86de8a | ORPH
    or1k     |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/032b54a23fc393a84f0650952486499b2b70f6e8 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/566a82f33c7c9766d2faf194e3f9a82053cfb5e8 |     
  mips64el   |      ncurses-6.3-20221224      | NOK | http://autobuild.buildroot.net/results/a6d72d0030fde796f4cc5b9922e513845c2049a4 | ORPH
   sparc     |           ola-0.10.9           | NOK | http://autobuild.buildroot.net/results/90d1a97cd2529ca9f0e5d8797a8012da5c7bfe19 |     
 aarch64_be  |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/d92f029219fc68d630e94a8bd8dfb6ec54f21c93 | ORPH
    arm      | package/rtl8821cu/rtl8821cu... | NOK | http://autobuild.buildroot.net/results/8fdbbc77b55486735c1294d089c1f1b55e50abd5 |     
    or1k     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/65d673cad39b50f1120d18a1cb00ba4927f5869d |     
 microblaze  |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/b7a64abd4a4a7c9f3fa2be254bb03d6b760013eb |     
    mips     |   python-cryptography-39.0.1   | NOK | http://autobuild.buildroot.net/results/aeb5f4373de71b07990518fb4179b2d0119a9af8 |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/0b18581444393bedc936be08992a86437b3bc136 |     
  sparc64    | rtl8189fs-ed6741b52bc998875... | NOK | http://autobuild.buildroot.net/results/c55de81eb17ef65e1f8319c71adc81ff3c325b15 |     
microblazeel |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/3f69906dec036a904264369bf3231dda4c975137 | ORPH
    sh4      |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/f006d23d8c739ca119a9aac9de34c3342bcf0452 | ORPH
    or1k     |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/bd6e2e46efa46798f0eecc772c88f04005f6b37d |     
    or1k     |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/dbe363ab536cac2039032a286888d2c0a4078cbf |     
    i586     |         syslinux-6.03          | NOK | http://autobuild.buildroot.net/results/20d9e3e599d716109788da5f14afcc87cb888c68 | ORPH
    i686     |          tbb-2021.5.0          | NOK | http://autobuild.buildroot.net/results/50eb33c5651d2d7cd6562e82876f498923f4e5a5 |     
   x86_64    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/9b5fa2a72f353da44c7abebdb5fcf454ee80d7df | ORPH
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/1f07e53dd5e269aa08c006b115ff11f4bee6ef04 |     
  aarch64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/d9e4a248ed57135f9dfad3fab2b066ddd36c1bff |     
    mips     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/a615dd52301646ce9ac1445bd60195019c25de50 |     
  sparc64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/d66dc6418bc5cb312bcf6ab6788cc9fa64278fbd |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/21d551b95660734cefe63d4d796a01d5d34e6742 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/8f0155262e72355b10fb918ad2f4a1516f69070e |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/10fa193b4fbb753b7880b412540692f8205aa9af |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/017e8b98f64001ab87bdddcc9f07c7c0e811369b |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/128ba98580ba4119aac4ea29e31d459fcdbb20db |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/1e2b5993edd4babf6240de87b452cc097f43d09c |     
  mips64el   |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/ac744d62dd0245dd0c06d0200c6147f4e266183c | ORPH
   nios2     |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/52d0aebe10c2980c74a08f9c13b51d323365f758 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

  gobject-introspection-1.72.0 | 3 
            host-binutils-2.38 | 3 
               host-qemu-7.2.0 | 2 
  binutils-arc-2020.09-release | 1 
                busybox-1.36.0 | 1 
                elfutils-0.186 | 1 
                host-go-1.19.7 | 1 
              libgcrypt-1.10.1 | 1 
          linux-5.10.162-cip24 | 1 
                nodejs-16.18.1 | 1 
                   perl-5.36.0 | 1 
toolchain-external-codescap... | 1 
               valgrind-3.19.0 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/7a4400a18cffbd8575da296c6c397d2b9c9708c2 |     
   mipsel    |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/45ee6cd435e829f0e4edfcfb249f1c95e7969a0e | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/640863d94be5bcc68b5273b22eab563b3be52bfb | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/85fa9d820d7615deed93dc8330217c130aa28f30 | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/352e14f2ec1a5f6b8de9adfcae3e1c05cf40c902 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/84612b21e6ae585e8adea649e14d535f29e7c7af | ORPH
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/1e4726ab678de6f103495d22a1732d37cc0eaeec |     
    mips     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/2000479ca0934ec5a901ebfdd3ec21b6fe38ad33 |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/18e3cd213c74ebe2aa4e27e392b8089773eb7adc |     
   mips64    |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/c6e467dac9eb2de89347f3c2cae278d514f5ec07 |     
   mipsel    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/b080c7afe3a13829a57fdb222876a75184e5626b |     
  sparc64    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/1160e8174ae11b19b7ccc08706c506235e66a716 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/5d3bf336fd605ae58d3ed1eec8fec60de04f83db | ORPH
    mips     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/14976e19bb2fb21efebde4d5ece672ab1bba0031 | ORPH
    i686     |         nodejs-16.18.1         | NOK | http://autobuild.buildroot.net/results/d74e3538f031651d2eea6fe1ede8950eae14fab9 |     
   nios2     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/851bee80d5a0850a74add85cb5215d2ffe6bdb39 |     
    mips     | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/c609f1d407e78f689dc55138de48d2a4be04eb5c | ORPH
   mipsel    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/ca277047633c3f6a14ef0e5e7b52ab7f29e44294 | ORPH
   x86_64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/18e5307248518d730b7d62dd8da1ddd10957f5d0 |     


Gitlab CI results for 2023-04-05
================================


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
