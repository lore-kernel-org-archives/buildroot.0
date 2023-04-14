Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 126A1C77B6E
	for <buildroot@archiver.kernel.org>; Fri, 14 Apr 2023 05:32:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BCD5427C6;
	Fri, 14 Apr 2023 05:32:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BCD5427C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fxlc2iDKMNvr; Fri, 14 Apr 2023 05:32:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BFBA427C7;
	Fri, 14 Apr 2023 05:32:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BFBA427C7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 57AFB1C3E8B
 for <buildroot@lists.busybox.net>; Fri, 14 Apr 2023 05:32:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3596660F5E
 for <buildroot@lists.busybox.net>; Fri, 14 Apr 2023 05:32:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3596660F5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E4s8T4RsgkLA for <buildroot@lists.busybox.net>;
 Fri, 14 Apr 2023 05:32:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0703660F4E
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0703660F4E
 for <buildroot@buildroot.org>; Fri, 14 Apr 2023 05:32:37 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4041D60008
 for <buildroot@buildroot.org>; Fri, 14 Apr 2023 05:32:35 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 14 Apr 2023 05:32:35 -0000
Message-Id: <20230414053240.3596660F5E@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1681450355; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Dyg+qidpeV/ZoqDdKjwtDMwc4ViNAK1B38c1dEKXDBg=;
 b=iYW+aFSnxwYdsDA5TIXiC3SzWCKcyZeQkauBQi9Jgd/wYGX8iSiwpEp5Vp2kpkzXPBgGGX
 nQXaTg956ePT2knaLyw7gbbY5ZOiW4qLjTm0hwg5ZhWhASkg401i6s+WIbTvYOFpupLVjz
 fQCIes9DnFRkU8of+wa5PTsbdzzuSD/0DoXb8ezVyGntcS1Ds0nz1KO0m1TPgoXJ4xDLx4
 ZhpGrEFg+yi5Ny5zsakM4FQSNKS4SOZ7/KMNZeZQZaZmqxuEvES2epcR39fR4OJU44ZFX5
 NudvNFm4JpMlYRDxvL1AaYArFQqnh+XB5oZANFHhA/VcnS/vA0tmsZe9chSqig==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iYW+aFSn
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-04-13
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

Autobuild statistics for 2023-04-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 15  | 13  |  0  | 28  |
    master   | 62  | 87  |  0  | 149 |

Classification of failures by reason for master
-----------------------------------------------

              host-pahole-1.24 | 10
                       unknown | 7 
  gobject-introspection-1.72.0 | 4 
                host-go-1.19.8 | 4 
                elfutils-0.186 | 3 
fs/ubifs/ubifs.mk:49: /home... | 3 
         host-gcc-final-12.2.0 | 3 
               host-qemu-7.2.0 | 3 
             dahdi-linux-3.2.0 | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
glibc-2.37-2-g9f8513dc64119... | 2 
            host-binutils-2.37 | 2 
            host-binutils-2.38 | 2 
         host-gcc-final-11.3.0 | 2 
              host-rust-1.68.2 | 2 
                  kexec-2.0.26 | 2 
                  linux-6.1.14 | 2 
 Makefile:724: target-finalize | 2 
          refpolicy-2.20220106 | 2 
                 uclibc-1.0.43 | 2 
                 agentpp-4.6.0 | 1 
                apparmor-3.1.2 | 1 
                busybox-1.36.0 | 1 
                  ffmpeg-4.4.3 | 1 
fs/btrfs/btrfs.mk:55: /home... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/squashfs/squashfs.mk:56:... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
         host-gcc-final-10.4.0 | 1 
     host-moby-buildkit-0.11.2 | 1 
         libcpprestsdk-2.10.18 | 1 
              libgcrypt-1.10.1 | 1 
               libglib2-2.72.3 | 1 
                libkrb5-1.20.1 | 1 
     linux-5.10.162-cip24-rt10 | 1 
          modem-manager-1.20.4 | 1 
                  ntp-4.2.8p15 | 1 
            ocf-linux-20171122 | 1 
                   pcre2-10.42 | 1 
                    qemu-7.2.0 | 1 
                    sdl-1.2.15 | 1 
ulog-0389d243352255f6182326... | 1 
               valgrind-3.19.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/d7b72e9753882b4323619d7cb66b87273a03744f |     
   arceb     |         apparmor-3.1.2         | NOK | http://autobuild.buildroot.net/results/bd7dc215fbd52fa3dac87da7c800d625e2546b32 |     
  mips64el   |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/5fe60ec001121ea308a6eb0ea647db813176935f | ORPH
    i586     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/0055d11d913afc49a473afb5aa7fd8991d6f40b7 |     
   nios2     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/13412ecb9b46e92c2aaf9e6cf32fe3f78956c1ed |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/6c8f104325e210830d5c9a0994543b93044b214d | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/123304b9b1be596698d86edf74d372bfb2da6ea9 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/2d820c3c64574fc0f2960d93526865f01606a34a | ORPH
   armeb     |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/22c786069495d4ef65f845052fa469e1d0e92aae |     
powerpc64le  | fs/btrfs/btrfs.mk:55: /home... | NOK | http://autobuild.buildroot.net/results/2d269fc0d22ae6d8b127f8967fecaa0b509b163c |     
  sparc64    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/13a5cfef98832c0d962f480dbd95fe8dbdd7c44c |     
powerpc64le  | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/195533ba7e741e57e0f3b82ae37a5e1b4abfe977 |     
 powerpc64   | fs/squashfs/squashfs.mk:56:... | NOK | http://autobuild.buildroot.net/results/46b33f5cb3ee0e38ee71efd3a58a15ad47e6c542 |     
   mips64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/4a4f889e59123d5bca03998faf31722d69047e26 |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/944459617a323b757d57865d5d86dc1835dfebba |     
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/59677b6ddd67d99cfdf5d1e1afdc6ecc1bf17169 |     
  powerpc    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/92c4853390dbae28944c114db7ab2489a8f33b86 |     
 microblaze  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/bb490efe7ca3c4189e19990189287e60be9a49de |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/a4572855c94e92e66da10096e2a15d96e38cccc9 |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/6a7100643048c8e57709114c41e1ab84883893e3 |     
    arm      | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/8ea3c2909d00525df91401af4adfea5a7e8ae0f2 |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/2dbef7dcfe6a95e4af06d7fbe3f140941ecc9bb1 |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/feba559f6c63f77e2e9af0135541fd3bbea9dcd0 |     
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/a4a5f3111dd913f132542ffa4943784bcd9b116e | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/98d7954a096132b997db9777dfaa5c540d4112a0 | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/06a83042dacf2e04782d1857cbf17aa4b19f8bbd | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/4472235a04471e6363bc173805dcd89c0632b353 | ORPH
   armeb     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/3333eff22186368f0c96759907097d04468bd8a3 |     
 powerpc64   |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/d72338d681ccc2b37cc59d4ddf940f24f0b5cda5 |     
  riscv64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a958cf22cddc0ab863b4546fcc79c404532d8a85 |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/76a8bc6588cdecf4feba3a16f1377e4989042984 |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/c3722f6c949fc00eaa6fa13f62608314d07bc304 |     
 aarch64_be  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/c823e94da345d8dcdd44a33f09b92f6fb2885155 |     
    or1k     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/b16b0c480b40bb9f75e211fa01ad61adf6f59880 |     
   xtensa    |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/e4b74f7823727254e42f1cb8adc4f5e47777ec1e |     
   armeb     |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/6c8fa54440c986fe50ccfdbf353c4a2267b14dff |     
    m68k     |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/1f48a7bab8ecb419e8c11049d5fc89bcc1001b1c |     
   s390x     |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/0aeca9740d0ff13f1d989d3ddefd8abe9c326e4f |     
   mips64    |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/dac47c869de2a9d516c2e37e6fb871e75ff0ea0f |     
  mips64el   |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/203f91179213b5d1048bafe56c6b0a09b8a1824e |     
  mips64el   |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/9ad188de4adbcddf68b1abc0f1a6f571b9456796 |     
   mips64    |   host-moby-buildkit-0.11.2    | NOK | http://autobuild.buildroot.net/results/4fd2d30ff0891dacff4f7ef094edebd375db6386 |     
powerpc64le  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/e67bd25219de5d631632a4a204c3b88c0873bd77 |     
   s390x     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/0ddc4348ca89bfe7624e35bebe37674f9a66bd0a |     
   sparc     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/7f80112c2d5238964e6fe3e52039854648fd6cb6 |     
 powerpc64   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/c7b590198d09d73b945885933505d4561b996c38 |     
powerpc64le  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/8b311dc5a636f490c332be9fdeeda47bbd91f750 |     
   x86_64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/c046873b1ece3eb9e203351fded741ad58937377 |     
 powerpc64   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/488d967ddf78bc122826e8b120110be5203720da |     
   nios2     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/23e19b5dac9247aea44148c4bd05326e2ab151c6 |     
   sparc     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/e21d2a8511be0b2dd505ff52ed96928978736da5 |     
microblazeel |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/7c1c1dafb2233ecebedfa410b82e5dd90df4fed9 |     
 microblaze  |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/7c5204bcf9e2921c5dcb934e6a9364b9b3d9f960 |     
   s390x     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/3fee82db2ce20c8256fc12a6019b83cfcd3623ca |     
   armeb     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/ba979bea351c88ce24edcbcfbb0fa440914523ce |     
   x86_64    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/12e46f7f367e85ca127b83bc0fbf72d0553f835f |     
   x86_64    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/27e677734b15e06d5493d0cb5225c3d698f00f37 |     
    sh4a     |          kexec-2.0.26          | NOK | http://autobuild.buildroot.net/results/45df632013330fd53699ba3149befde85d1df06f |     
    sh4      |          kexec-2.0.26          | NOK | http://autobuild.buildroot.net/results/90f08956a2121d1bac9946fb6909b31cd7f6e88e |     
    arc      |     libcpprestsdk-2.10.18      | NOK | http://autobuild.buildroot.net/results/5dcf9fbf67787a3fe20b6c4e1fd59fd0761b9d69 | ORPH
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/33f091075a59d754b51a781254dc7caf02b11638 | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/1f6a4cea2a25148221367b0cc239267374fcee14 |     
    arm      |         libkrb5-1.20.1         | NOK | http://autobuild.buildroot.net/results/92343d322dd1aa21257d159f8cd5beb93fddcb18 |     
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/a269b5f19970c59f84dfb7e7899bc36a44fde243 | ORPH
   mips64    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/f36dfbe24b80a851a783869a709375d8068ec601 | ORPH
   mipsel    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/f63cf17aef4998b1a61dca921eee8f15c9d3b74f | ORPH
   x86_64    | Makefile:724: target-finalize  | NOK | http://autobuild.buildroot.net/results/443488742e25e5f1644503689810b11027e1ce08 |     
 powerpc64   | Makefile:724: target-finalize  | NOK | http://autobuild.buildroot.net/results/521e93e5016e507051e356ee8188426d4cdddf7c |     
   mipsel    |      modem-manager-1.20.4      | NOK | http://autobuild.buildroot.net/results/3d4edde77ab8bcb738f23e57555ba8a51569e5b4 |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/99646fed0b0c2404fd8afd23a9ab43dcf415b9e5 | ORPH
   nios2     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/c2bd7d7f2c41a63cc341181a137ab09ae1e5e315 | ORPH
    mips     |          pcre2-10.42           | NOK | http://autobuild.buildroot.net/results/db9d0c937d715eb04262b87de5cf2cc2f53d2344 | ORPH
   mipsel    |           qemu-7.2.0           | NOK | http://autobuild.buildroot.net/results/996e5f496182aba7fde59798d620d14ed9df4dd6 |     
   s390x     |      refpolicy-2.20220106      | NOK | http://autobuild.buildroot.net/results/70513ac66906798bdc9cdf745a9c308c4f1b62bd |     
    mips     |      refpolicy-2.20220106      | NOK | http://autobuild.buildroot.net/results/3c71913a62cfbcf9ac2397b1604a98e016a7aeab |     
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/507a5e32103fb154a7c39d73a143afb444e17ba5 | ORPH
    m68k     |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/4eb2cab80b3313a6d6154f99483d0c890beb546d |     
    m68k     |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/fef53e986bdb07ab1e26cf4c882793bc13a735cb |     
   s390x     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/cc2f9403a243da841972ff3a9408632856f47e3f |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/fe9ef52e62884f2d0d4efa154f4842d7f1d427c1 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/dd2d0df657864d5861631c857662a97f187c589e |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/d95223e4b18c61bbb26fb1473d93b71d5fb3533e |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/300a6ae4b79dc7dd35247cf45e6ce632610bf560 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/09890a4981e76593c3c365bf6cf422a2aa5c1654 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/d46423fafd09119535619c799ede6b27685f90df |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/06715f846dce42a92c9efa54a49412cadd26c1b4 |     
  mips64el   |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/0976557234125fadc12470d8f56511bb47b74fb8 | ORPH


Classification of failures by reason for 2023.02.x
--------------------------------------------------

fs/ubifs/ubifs.mk:49: /home... | 2 
                 fdk-aac-2.0.2 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
         host-gcc-final-10.4.0 | 1 
                host-go-1.19.8 | 1 
               host-qemu-7.2.0 | 1 
               libcap-ng-0.8.3 | 1 
              libgcrypt-1.10.1 | 1 
          linux-5.10.162-cip24 | 1 
        ltp-testsuite-20220930 | 1 
            quickjs-2021-03-27 | 1 
                       unknown | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/ecfff5b4071819fc329f8195fd346df9d3fc2519 |     
 microblaze  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/b41af4897b6d46280aa58f5027bf70428672cf4c |     
   xtensa    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/ebf8766ca55d1cfb666df99fe1dd83a65e7d6f9f |     
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/e7ead0445cce80acd59327a3587901c255d3b49c |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/69967bf669e5aa10b7f28bd93174f74e779b52c0 |     
   mips64    |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/6fb8dda140c936df96b0adc69c2039650b76ead9 |     
   x86_64    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/4b3d4f74629c06ca7d9f41fcc393ebeb6c4d37cb |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/ace1129836b98da529489952b804f1e27995cabd |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/09fe2c4de2529ae9bade98e8af1a7f2be1f06b3f | ORPH
   mipsel    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/2f83c1e241a94f8f5e68e183e545f9ab415f11a8 | ORPH
  sparc64    |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/02c522e9bed009187fc66f6e231718dcc6907e35 |     
   sh4aeb    |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/5dc19f758c33c0f85218c5bef6ec68d54598d7a3 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/994b67ea6bf1755301f59dd46f9ab56953e88c14 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
