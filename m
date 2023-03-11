Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 577DDC61DA4
	for <buildroot@archiver.kernel.org>; Sat, 11 Mar 2023 07:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9786482376;
	Sat, 11 Mar 2023 07:40:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9786482376
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7L1FG1IDduLM; Sat, 11 Mar 2023 07:40:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37B4F82377;
	Sat, 11 Mar 2023 07:40:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37B4F82377
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B09D1BF408
 for <buildroot@lists.busybox.net>; Sat, 11 Mar 2023 07:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6D8A82377
 for <buildroot@lists.busybox.net>; Sat, 11 Mar 2023 07:40:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6D8A82377
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xkHIkpbcJRm5 for <buildroot@lists.busybox.net>;
 Sat, 11 Mar 2023 07:40:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D84F82376
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D84F82376
 for <buildroot@buildroot.org>; Sat, 11 Mar 2023 07:40:47 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 61CF8C000A
 for <buildroot@buildroot.org>; Sat, 11 Mar 2023 07:40:45 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 11 Mar 2023 07:40:45 -0000
Message-Id: <20230311074051.D6D8A82377@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1678520445; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LlvG1KPtizlyQMdRpB+gILNOcMPrP2qnR6Y62Zm22gM=;
 b=T4kpJpnVlGuC+eDQfrKRmPLuugooML9W+Lq9AOVsq2je/6rp2dRydjCGw/tFJ44c3SGgyr
 AJ4eGIE0kQhwh9uaHzmwq5iXJOj7N0hSE69eysVNX25geaSfGYT3YB0qb9qiC1d2mTBebJ
 Qm1TI2mOWdLWribv91dVFNh4Ff7ZraSgUHcKQx8N57jhtd/CEOSYEpWEEygMhUDscGX9Kg
 +7afi2CMs42wcBmvFbaIC45W6Q5K54QFholfZ9EHLg9CKSGBTjzC2RhetTsbtFKkXJfEfv
 fCQiLv04URtJydbDXazLRMEC7K/j1vICIM3Rk3C61vTM1kaIfG3TUPXPfQ4d2g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=T4kpJpnV
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-03-10
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

Autobuild statistics for 2023-03-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.11.x  | 10  |  5  |  0  | 15  |
    master   | 125 | 165 |  1  | 291 |
     next    | 16  | 25  |  0  | 41  |

Classification of failures by reason for master
-----------------------------------------------

host-go-bootstrap-1.4-boots... | 48
           host-libzlib-1.2.13 | 8 
               libglib2-2.72.3 | 8 
uqmi-0a19b5b77140465c29e2af... | 8 
                elfutils-0.186 | 7 
                       unknown | 7 
                  linux-6.1.14 | 5 
            host-binutils-2.38 | 4 
              host-rust-1.67.0 | 3 
        ltp-testsuite-20220930 | 3 
       network-manager-1.40.10 | 3 
                busybox-1.36.0 | 2 
  gobject-introspection-1.72.0 | 2 
                     lxc-5.0.2 | 2 
                 openssh-9.1p1 | 2 
                   perl-5.36.0 | 2 
                    sdl-1.2.15 | 2 
                     ace-7.0.6 | 1 
                apparmor-3.1.2 | 1 
             berkeleydb-5.3.28 | 1 
                bpftool-v7.1.0 | 1 
                    brltty-6.5 | 1 
          cryptodev-linux-1.12 | 1 
                dbus-cxx-2.3.1 | 1 
                 dc3dd-7.2.641 | 1 
                 dhcp-4.4.3-P1 | 1 
        edk2-edk2-stable202208 | 1 
                  ffmpeg-4.4.3 | 1 
                   flann-1.9.2 | 1 
             fontconfig-2.13.1 | 1 
                     frr-8.4.2 | 1 
fs/cpio/cpio.mk:128: /home/... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubi/ubi.mk:51: /home/tho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
glibc-2.36-81-g4f4d7a13edfd... | 1 
                     gmp-6.2.1 | 1 
         gobject-introspection | 1 
         host-gcc-final-10.4.0 | 1 
                host-go-1.19.6 | 1 
                  host-kmod-30 | 1 
              host-pahole-1.24 | 1 
                  kexec-2.0.25 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
                lesstif-0.95.2 | 1 
               libcap-ng-0.8.3 | 1 
              libgcrypt-1.10.1 | 1 
                 libnss-3.88.1 | 1 
              libtommath-1.2.0 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                   linux-tools | 1 
          lttng-modules-2.13.7 | 1 
             netsniff-ng-0.6.8 | 1 
            ocf-linux-20171122 | 1 
                    olsr-0.9.8 | 1 
              open62541-v1.3.4 | 1 
                   pcre2-10.42 | 1 
                     php-8.2.3 | 1 
                  reaver-1.6.6 | 1 
               tcf-agent-1.7.0 | 1 
              traceroute-2.1.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/0106ddef84d99688aecc339b49917213199d2c09 | ORPH
    arc      |         apparmor-3.1.2         | NOK | http://autobuild.buildroot.net/results/88629e4fc95a9b03cbb33275d94903d6f35cf97c |     
   sh4aeb    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/b8e847e06c280071d82b6ed7b7917300929e8690 | ORPH
    arc      |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.net/results/669f84539edfcf2e2372c61d54ab7188761a53a2 |     
powerpc64le  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/37f3476054411230fa50b04355fb33f5c71af73b |     
   mipsel    |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/b23a3b4e7b6b6289d51e2f9d601c629c52aeb570 | ORPH
   mipsel    |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/a639215227ccf613b57f393a5fb3871464372ebf | ORPH
  mips64el   |      cryptodev-linux-1.12      | NOK | http://autobuild.buildroot.net/results/816afa1ee4b4398747967cbcb97b20d9f25bb652 | ORPH
    or1k     |         dbus-cxx-2.3.1         | NOK | http://autobuild.buildroot.net/results/9d990aad436f4b482d49862ce51c0663daf1e03f |     
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/64d6da1dcb180f842f0df129205e26d5c9adb238 | ORPH
   sh4eb     |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.net/results/4518ee822f0fbdb06387ed71a5576ecefba84b3d | ORPH
  aarch64    |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/34e7968835c4cec268c5e51f0990100c48872f6e |     
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/c9547d0d977af00faeba8322066a2888bd245f0d | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/7e5fa66f69cca794a0e953adc2a1ce1cd1ebc071 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/f23b0e7b6db84e6b74bb80740131ec15c0513c90 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/04f948662f8531caedbf2bcad2367da4a2f65794 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/4a3d7351da585683cb41ce47532022a8789effff | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/6949ed8bb010bde1677d95161519fb48ee1d4a3d | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/a7886577693bc4650904ff575d044e18f3cea503 | ORPH
    arm      |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/7a53b576a8fe65317a8166eb058384b18408f1d2 |     
    mips     |          flann-1.9.2           | NOK | http://autobuild.buildroot.net/results/e1728f4b8a1faf4ea0fff4f18a104aa8f8335849 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/e39344406dd3979c3f79adb9d6a276ad8bf234aa | ORPH
   xtensa    |           frr-8.4.2            | NOK | http://autobuild.buildroot.net/results/f2c661fb4b2cbfe66a068ef1b336048282290248 |     
  aarch64    | fs/cpio/cpio.mk:128: /home/... | NOK | http://autobuild.buildroot.net/results/6c1feb8f2f0441c917131bf780b7ab3e44f35465 |     
 microblaze  | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/5c6bb05eb7e59b9d8e40539bf342f25e4c189dd9 |     
   arceb     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/f7c8d463a8c929d2ed4fafcb13c3076e9b9abc84 |     
  aarch64    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/2c0c3957929ce849d09e668aea12b734006e5914 |     
   x86_64    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/537aebc903706f5b4c75d321599519dce31d9274 |     
  mips64el   | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/ca38123621ffce898061330eb13761a3e7baa726 |     
  powerpc    | fs/ubi/ubi.mk:51: /home/tho... | NOK | http://autobuild.buildroot.net/results/506c26ccf720ccccddc58ba8a93e9a25c3f96fdf |     
   sparc     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/dd3b5531daeb9160c3e284f4747d5bcd7f9dee8e |     
  aarch64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/184a36798d9f6927f81c3ec9dce0c34e3e32b01a |     
microblazeel | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/eb6398c9b15b4d1a4abf8083a4d101239bdcabe1 |     
   arceb     | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/ff63a5cbb5354a80563b14828a96a2d3e5c63be7 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/37bd012d2de4ca6c4a6972f6f8f61beac64c9b93 | ORPH
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/f8b321c4644ad3e976df2a85ee3d12aba2babe7c |     
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/10b414dd629606336204d6c1e5bd7bbc77164e92 | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/dea78d5c1a1155e772e4f9af997b0cc9c76c8bfd | ORPH
   arceb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/b64bc3574f27cccbace968d2a2694d12fe853554 |     
  riscv64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/10298d262c2b5bae434aed2f80d1e55da94265ca |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f64c8959ec15abe2e4f3f318aa70ea5414689be7 |     
  riscv64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/d26cacf9a04e8835f87906fd44b443f012cddc8a |     
microblazeel |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/29dde1c27b6cf2f8bfdd6eff5243f36399ec9a7b |     
  riscv64    |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/125cae7434b708022f902289303425e09d8f6544 |     
  aarch64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/8ee66f0d61ed5c374565f176c116a872e3b78244 | ORPH
microblazeel | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/694991ab6a7394494897e585798c53edb269c780 | ORPH
  mips64el   | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/11d8d9c98fc053fb5c7a3c3753e35ab1f4a6a8f7 | ORPH
 powerpc64   | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/0952e8bf6cbfcd69b4d0a6526fede8e62431dc27 | ORPH
  sparc64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/6a4b2942c39423aa093217d9f233cf3f2f86d51f | ORPH
  aarch64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/dd16b3f4e59c353cd8c2a65a25f1626218c7df76 | ORPH
   x86_64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/d940edf78fe83aca844a8471c17d1fbd0644f651 | ORPH
   nios2     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/50943061ee4a802cda38111a6c74f7c123b3ae28 | ORPH
    i686     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/3c1bb7e774e98870786b0a8e8e4cdb0ea58a0567 | ORPH
   x86_64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/3b2e0ad8dc70828e938406b0cbca7bd0864c600a | ORPH
   s390x     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/fd317a1706a46a74acf83f54552577e05facb470 | ORPH
  mips64el   | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/c73c40a86b1bb728d20021b637afb7f6de6319cf | ORPH
   mips64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/0559f35e1b611c3ba0978fb7075d7354d46ffc2c | ORPH
  mips64el   | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/6122a757e8eb2bea709c7cb6fe39f8b4fbda556d | ORPH
   sparc     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/56184d1b83d16590da70d0607b9bf4aeba881bef | ORPH
   mips64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/9a9003a538238862153b8c9db6b9937e8f8f5480 | ORPH
    arm      | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/dc506d56925b64570a12cbd9b37ae0e604178e5c | ORPH
   s390x     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/72f95527813caed7a2374fb3009e568c34674d32 | ORPH
   arceb     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/3623200a84cd028f0bb616e911c31bfd9bdadfbb | ORPH
  aarch64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/a2fb5de6a3276d0a590c5912073df67c602cc3ab | ORPH
    or1k     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/c09f155f2f6c9b96c36040a4b5c2cb15aa913ccf | ORPH
powerpc64le  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/20eff5d3bce8f74002432db0be77c2f5353c8554 | ORPH
   sparc     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/5f532107d606843aafc083dcad54f47fed652768 | ORPH
   x86_64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/b34ea840551fadee376412fd30a92cccd4b2e295 | ORPH
 aarch64_be  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/2c89d2aefdd1449a433729ee0de4acb4c5f86f77 | ORPH
   x86_64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/b9a147177318085fe67cf0b5ae2334156909395b | ORPH
 aarch64_be  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/80299d6bc66ba8225053edceeb9b15ff39272d8e | ORPH
  aarch64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/f68addf50b2305bc5d474dcd1ab98145c671ef96 | ORPH
   s390x     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/957826ad72caf7547dbbacd79261222a71a1a8fd | ORPH
   s390x     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/a0b7edf635ce0676264c06579dbd424b26987aec | ORPH
    arm      | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/b4cc3ed14594522b084290a662ffd41ddcc4721b | ORPH
   arceb     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/94dbe4a3de9d5667b9f8fe75b976cbd99c5d21f5 | ORPH
  riscv64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/62e94ab78c9d0980fb09bc53605f3795fd208232 | ORPH
    or1k     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/8217b5dbea5a1c42101c8900c38b3e334fe0b03a | ORPH
   arceb     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/064dfbff617c0a71abae1a5ef268d7b453d034b9 | ORPH
 aarch64_be  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/a90528ff8b07cdcab758ea388b70639f2fae7cd8 | ORPH
  riscv32    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/2b31818760da42d3dd97a8ba8b87080a30b6bdc7 | ORPH
   s390x     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/f2fa4bd5536ac51d8d27de2264c18b3c7618ef24 | ORPH
   x86_64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/890fd894ae9da654e53ad736991c674eb66e1240 | ORPH
    arc      | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/06cacdeae366618a59ac1447a70671d91621e619 | ORPH
    i686     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/0434b2e5e9f2d00c6d6760686d0bf287092d8a4d | ORPH
 microblaze  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/d0c8c63d17c340954fbdbe3c709020e9fdfb9401 | ORPH
   x86_64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/62d0ec9eb3b0ba51d673e73a2118df5060862f0b | ORPH
microblazeel | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/539a246bec7c69778e45392f76c6390d2b02b7ba | ORPH
  aarch64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/77d527089c11de6c928a56e08731e3a9230d8378 | ORPH
   s390x     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/ec14fe226f06088e16b0e44bbda02a8497787e05 | ORPH
 aarch64_be  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/57848e4102c0e8a9dfec4687a9f679a340c3f8de | ORPH
 powerpc64   | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/13a9d44f1bf0a21303a523583961a645b8ebd3c8 | ORPH
powerpc64le  |          host-kmod-30          | NOK | http://autobuild.buildroot.net/results/c820f862d0fe9c6ea09370c1bf1077e9e2ae38b3 |     
    i686     |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/836a9a588376872b1c4c2c301045b38dd02b7686 | ORPH
  powerpc    |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/c7c28870612ff981b4bd80389b75c5a330013a3b | ORPH
    sh4a     |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/64b9e40ff99d111bae4592ba40a4facec743c590 | ORPH
    arm      |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/7e23c70317d3d0ed2777c5008cbce9f8030f08c9 | ORPH
 aarch64_be  |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/223a2040fa01fe507d7e5d1ab906b6bcb6ace78c | ORPH
   mips64    |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/1fe5f4dc209c0c6a212b05629579251ae12b159b | ORPH
    m68k     |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/00de14b1b8a2c6c47ef891cbe4a89e3fe0057f90 | ORPH
   mipsel    |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/e66eb66b266c499ee62211d97ddba9a3e9e7d7d8 | ORPH
  powerpc    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/f90da7c36491c08f36c4fcf837504f7f83af5880 |     
   x86_64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/c9c40954e9154e11642119ac2bd9dd1e13aa44a2 |     
   armeb     |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/aa4817e920fb2af2ba285eb62238dc729d6bbdb0 |     
   x86_64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/a508442f8d078a3d6f957038031b52f9c5870ac0 |     
    sh4a     |          kexec-2.0.25          | NOK | http://autobuild.buildroot.net/results/eec59654b5acf1b958999de01d2cefd082e583e2 |     
    i686     | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/335e8f20e5da61cc73bf09180552dc00722e459e | ORPH
   sh4eb     |         lesstif-0.95.2         | NOK | http://autobuild.buildroot.net/results/1bcd9b5d6355a2ade39d28ae7855de780dbc4bb7 | ORPH
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/9b71ce9e46027fd0cefdaa9e9329bcea63b1af82 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/79502d3f64de9052333c11d3c2e4c045f3d12189 | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/9b2f1561616119ba70fe37665b3c314368f46165 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/f233c80ebd98df7c70a937fe2ea669a1a6729fe8 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/80d1c00d45fbe614bcac7ee644c2c23bfc6b1469 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/3fd5c15f01092c2af70ab0359a4a39f1aefecd0c |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/a5e0e0ea403ccf5251d63f15ac28136766147b95 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/b0bcf379866170d8a2dc3de430cd6f9333bf8ce8 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/6bdf6d7dba2d329a3a93ed65e97ead9b2ca44016 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/236cb47b235f5ae3f34f74f89378ca9d67f3aad6 |     
    i686     |         libnss-3.88.1          | NOK | http://autobuild.buildroot.net/results/f79d8d10dd564777a08cef0996e7b6dd9dd2453d |     
   arceb     |        libtommath-1.2.0        | NOK | http://autobuild.buildroot.net/results/a66eb3453b57e4b8bc04ef7c3f6e5a82d4d8e68e |     
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/503834f514b9c1b0cef6e6a4c47594147b962899 | ORPH
   sh4aeb    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/8da54cfd47f0417095a4608bba538241fb42c012 | ORPH
  powerpc    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/33f3a8d3fb375e0ccfc42bf5944ee295fb8956c5 | ORPH
   nios2     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/768e2afc49871ff379ee3659de13c44659789f4c | ORPH
 powerpc64   |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/a99f84b0011afceb30c34166f453142400466d91 | ORPH
   mipsel    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/73e8bd334de95f872b6eb3817efebc16d52d8660 | ORPH
 microblaze  |          linux-tools           | NOK | http://autobuild.buildroot.net/results/103f7df18f70fb5e8248f441c640dd819cf8f245 | ORPH
powerpc64le  |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/52136f9b548ab0e6405396abf3c03e4abf05e0b0 |     
   armeb     |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/804822d21ebecea2997781586baa55b8fbcaadda |     
  sparc64    |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/d49b8a2f99b95075fb230f906834f82f75c62a11 |     
    arc      |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/c5e068f51b007dd24f3a2a91ed81ce2cf78c6018 |     
 aarch64_be  |           lxc-5.0.2            | NOK | http://autobuild.buildroot.net/results/421ab1b83d84c0d5a026904f58550b7225d47136 |     
 aarch64_be  |           lxc-5.0.2            | NOK | http://autobuild.buildroot.net/results/23b3280ca241804bb75711dc057c4851bf2710f5 |     
   armeb     |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/35dbb0f34f787fe773c187e0d71598793210774d |     
powerpc64le  |    network-manager-1.40.10     | NOK | http://autobuild.buildroot.net/results/639c16b7df785c3240f43efc75daf1b78d7adcb5 | ORPH
 aarch64_be  |    network-manager-1.40.10     | NOK | http://autobuild.buildroot.net/results/1d1ea0dca393bd023090477602ca12ebbe3cae91 | ORPH
  sparc64    |    network-manager-1.40.10     | NOK | http://autobuild.buildroot.net/results/ce807d21e1fea9c298e4eaa1ca6db48cc8bc6334 | ORPH
  sparc64    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/d87d66d90e7c4fd4f1472320f34af21b98a0c48e | ORPH
   armeb     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/84c622e3fd5661a901fef4451ccef41671e74538 | ORPH
   nios2     |        open62541-v1.3.4        | NOK | http://autobuild.buildroot.net/results/b06b81220366da69e650c9577c2c4b8abf64d81f | ORPH
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/6529393b96fc89551960402b315ddb4c2a097c15 | ORPH
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/f393ba78cf3263818e11f623b9c04c3b38dbe2d8 | ORPH
   sparc     |          pcre2-10.42           | NOK | http://autobuild.buildroot.net/results/cf6f380ec8fc5377b3c0302532df06ec628146af | ORPH
 microblaze  |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/2cbabcee69217ab87389a33e9fbc8a714c947276 |     
 microblaze  |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/57f81f83cd9d2306d4e5a9bcb6b24fcf16857502 |     
    arm      |           php-8.2.3            | NOK | http://autobuild.buildroot.net/results/ba7df1b767a7d65f660f9bbe9199119f04e4eead |     
    arc      |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/164dd0c2fa76c866fba5ef9ef2d670c62c9dc3f0 |     
    sh4      |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/83eb058c23656d28d42af6e111e6e052755b0fd5 | ORPH
   sh4aeb    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/72a710a34a283e08c75c5f94b3c973cd633a1608 | ORPH
microblazeel |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/b1fe113a212d97f093349bd432abff0905e33f6c |     
  mips64el   |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/f8d18e828db5032b00ef2f68bf48e737074a5fbf |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/a26811aa805643443d0df46865ec7e246c5f9e27 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/4630ee2b066a5679e6a8cedd987dab8cb1e979e6 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/c3daaf97f0a9967119fe4fc7746c5cf60645be71 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/ba9c7f32ac8b50f5e19facae4fcc706f7281f1bf |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/7d5b6c0cb9c5abb13ae493e4f37203a33c2adb62 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/c9525620451d82cdd5e240aed9adfecf8cc59c4a |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/72f0bd743f180e8da70b9208c50f1685e1cde361 |     
    or1k     | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/1b2db233fcaf6741376caca67833ffb8f912ce41 | ORPH
   nios2     | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/0e47ce704f6c9c9dd6c2343f12178e841243e019 | ORPH
  sparc64    | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/df380f921b74527b77290a658de0c57680083afa | ORPH
powerpc64le  | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/06e5106c3b7af11eac445b95cd87b8c2f4a4df91 | ORPH
    arm      | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/fbb4b7079859fd25f52c2570d92e20dded58a13d | ORPH
  sparc64    | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/f7ea1868a7fb9370832ca26478c7db95cf5fe050 | ORPH
 powerpc64   | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/393f2ed653073a5a7b3ca9e968c81e62d32f0d5f | ORPH
   xtensa    | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/0b46817f437d346af380407cd7189594f1875a09 | ORPH


Classification of failures by reason for next
---------------------------------------------

glibc-2.36-81-g4f4d7a13edfd... | 2 
            host-binutils-2.39 | 2 
                       unknown | 2 
                  cmocka-1.1.5 | 1 
              fluent-bit-2.0.9 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
  gobject-introspection-1.72.0 | 1 
            host-binutils-2.38 | 1 
         host-gcc-final-10.4.0 | 1 
                host-go-1.19.6 | 1 
              host-rust-1.67.1 | 1 
               libdeflate-1.15 | 1 
                libglvnd-1.4.0 | 1 
                 libnss-3.88.1 | 1 
                    mutt-2.2.9 | 1 
                    olsr-0.9.8 | 1 
                     php-8.2.3 | 1 
           python-numpy-1.23.5 | 1 
            quickjs-2021-03-27 | 1 
                speechd-0.11.4 | 1 
                 systemd-252.4 | 1 
           wpa_supplicant-2.10 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/7389c74792e1262fb79735ddab018faf300cab4e |     
    mips     |        fluent-bit-2.0.9        | NOK | http://autobuild.buildroot.net/results/ac42e6e819836dfff865ad7f6b876ffefdb94aca |     
   xtensa    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/a6a4258874bb584f757fbc818d48d0d8884b636d |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/7b80ae180aedcf1e38ce402be220703cded3ffb4 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/4e8cb6e8727accd374345f342230899963993b25 |     
 microblaze  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/ed74ea4cc39d7aff2b7a23543b1a1e2f74a82e6b | ORPH
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/db4a14f88fde8f518293b86fc9683ae9b9bb24e7 |     
   sparc     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/20e5c34fffd2ffa1a97924b84b3f03322c45077e |     
    or1k     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/433ef1ef57028c9651e7b0b11192855f40524312 |     
  riscv32    |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/a8b8e703b2b66d43949924d611b0a4c8348de35e |     
   mips64    |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/75e668faa5c979d53e06f9b271223442ab2ef1af |     
   s390x     |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/ba913bbe96a6b6517843446d46adf4dfd4e2d38c |     
    arm      |        libdeflate-1.15         | NOK | http://autobuild.buildroot.net/results/767fa07d2896b3367190c6eac50850476d985454 |     
    mips     |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/793efda4e68d4164aab84b2ae509cd13dcf4d880 | ORPH
    or1k     |         libnss-3.88.1          | NOK | http://autobuild.buildroot.net/results/fad2d7790a6db4024acffd0909fd3ced38fe7a80 |     
   nios2     |           mutt-2.2.9           | NOK | http://autobuild.buildroot.net/results/d29bd188e3de7518a2e1a291b202dcef6550f233 |     
microblazeel |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/6affff761097218b9ad921a74c4b6c447dfd4abc | ORPH
 microblaze  |           php-8.2.3            | NOK | http://autobuild.buildroot.net/results/112ec5cb0de6f55a29caf7ec563367afd28eb8a0 |     
    i686     |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/1850484e1d810ef09711b652ff7084a15f9bc4be |     
 microblaze  |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/2cee5d9a813af06fc88d362d2154468af594242f |     
   mips64    |         speechd-0.11.4         | NOK | http://autobuild.buildroot.net/results/a00082eae10e06259c0cd88f28857a6b94d5e8d1 |     
   x86_64    |         systemd-252.4          | NOK | http://autobuild.buildroot.net/results/1c7eab11aee3fc365660efea7daef1ff331f7598 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/4444d4c43b81e02eff323dd05c3700f18fff4154 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/e6ff1df66d5967e8c7788aae83cb0ce5fd3d185b |     
    arc      |      wpa_supplicant-2.10       | NOK | http://autobuild.buildroot.net/results/533200121640b60144ce92a2a337a36df23bcffd |     


Classification of failures by reason for 2022.11.x
--------------------------------------------------

  gobject-introspection-1.72.0 | 1 
              host-pahole-1.24 | 1 
              host-rust-1.64.0 | 1 
ulog-0389d243352255f6182326... | 1 
                       unknown | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/cb03fb1a8ab151be1d7d5029821e635a14ff2cae | ORPH
    arc      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/b0bab5db226fd4af0c37f229c4e42c60847360a7 |     
  aarch64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/83416f7b907fd3539e7a2068bed3213740c3f3d2 |     
    mips     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/a69e6e6db4626ede9810ae99172eb0d9444c000e |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/4d00ecda2481d283b87ae7cabcfab58943e00a42 |     


Gitlab CI results for 2023-03-10
================================

Detail of defconfig failures for 2023.02-rc3
--------------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                qemu_m68k_mcf5208 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440143  |      
                       qemu_s390x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440196  |      
                     qemu_sh4_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440197  |      
                   qemu_sh4eb_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440199  |      
               qemu_sparc64_sun4u | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440201  |      
                  qemu_sparc_ss10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440203  |      
                         qemu_x86 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440216  |      
                      qemu_x86_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440205  |      
                 qemu_xtensa_lx60 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440218  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440220  |      


Detail of runtime-test failures for 2023.02-rc3
-----------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
        DetectBadArchTest | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440235  | ORPH 
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440222  | ORPH 
          TestATFVexpress | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440223  | ORPH 
 TestAarch64Pages64kGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440615  | ORPH 
  TestAarch64Pages64kMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440617  | ORPH 
TestAarch64Pages64kuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440619  | ORPH 
                 TestAtop | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440349  | ORPH 
              TestAvocado | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440351  | ORPH 
         TestCheckPackage | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440975  |      
      TestClangCompilerRT | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440356  | ORPH 
      TestCpioDracutGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440261  | ORPH 
...ioDracutGlibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440263  | ORPH 
       TestCpioDracutMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440265  | ORPH 
...pioDracutMuslMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440266  | ORPH 
     TestCpioDracutUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440267  | ORPH 
...oDracutUclibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440268  | ORPH 
             TestCpioFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440269  | ORPH 
           TestCrudiniPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440357  | ORPH 
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440358  | ORPH 
             TestDropbear | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440360  | ORPH 
              TestDtbocfg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440362  | ORPH 
                 TestEdk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440225  | ORPH 
             TestExecline | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440364  | ORPH 
                 TestExt2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440270  | ORPH 
               TestExt2r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440271  | ORPH 
                 TestExt3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440272  | ORPH 
                 TestExt4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440273  | ORPH 
...rch64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440629  | ORPH 
...tlinAarch64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440630  | ORPH 
...arch64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440631  | ORPH 
...otlinAarch64MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440632  | ORPH 
...ch64UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440633  | ORPH 
...linAarch64UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440634  | ORPH 
...h64beGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440635  | ORPH 
...inAarch64beGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440636  | ORPH 
...64beUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440637  | ORPH 
...nAarch64beUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440638  | ORPH 
...750dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440639  | ORPH 
...nArcle750dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440640  | ORPH 
...ehs38GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440641  | ORPH 
...inArclehs38GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440642  | ORPH 
...hs38UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440643  | ORPH 
...nArclehs38UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440644  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440645  | ORPH 
...mebv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440647  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440649  | ORPH 
...rmebv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440651  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440654  | ORPH 
...ebv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440655  | ORPH 
...5eabiGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440656  | ORPH 
...inArmv5eabiGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440657  | ORPH 
...v5eabiMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440658  | ORPH 
...linArmv5eabiMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440659  | ORPH 
...eabiUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440660  | ORPH 
...nArmv5eabiUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440661  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440662  | ORPH 
...Armv6eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440663  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440664  | ORPH 
...nArmv6eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440665  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440666  | ORPH 
...rmv6eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440667  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440668  | ORPH 
...Armv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440669  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440670  | ORPH 
...nArmv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440671  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440672  | ORPH 
...rmv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440673  | ORPH 
...mv7mUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440674  | ORPH 
...tlinArmv7mUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440675  | ORPH 
...8xxxUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440676  | ORPH 
...nM68k68xxxUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440677  | ORPH 
...fireUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440678  | ORPH 
...8kcoldfireUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440680  | ORPH 
...azebeGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440682  | ORPH 
...icroblazebeGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440684  | ORPH 
...lazebeMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440685  | ORPH 
...MicroblazebeMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440687  | ORPH 
...zebeUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440688  | ORPH 
...croblazebeUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440689  | ORPH 
...azeelGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440691  | ORPH 
...icroblazeelGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440693  | ORPH 
...lazeelMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440695  | ORPH 
...MicroblazeelMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440697  | ORPH 
...zeelUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440699  | ORPH 
...croblazeelUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440702  | ORPH 
...ips32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440704  | ORPH 
...otlinMips32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440706  | ORPH 
...Mips32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440708  | ORPH 
...ootlinMips32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440711  | ORPH 
...ps32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440712  | ORPH 
...tlinMips32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440714  | ORPH 
...s32elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440716  | ORPH 
...linMips32elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440718  | ORPH 
...ps32elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440721  | ORPH 
...tlinMips32elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440723  | ORPH 
...32elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440724  | ORPH 
...inMips32elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440727  | ORPH 
...2r5elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440729  | ORPH 
...nMips32r5elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440731  | ORPH 
...32r5elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440735  | ORPH 
...inMips32r5elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440737  | ORPH 
...r5elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440741  | ORPH 
...Mips32r5elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440743  | ORPH 
...2r6elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440745  | ORPH 
...nMips32r6elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440747  | ORPH 
...32r6elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440749  | ORPH 
...inMips32r6elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440751  | ORPH 
...r6elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440752  | ORPH 
...Mips32r6elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440754  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440756  | ORPH 
...Mips64eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440758  | ORPH 
...4eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440760  | ORPH 
...nMips64eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440761  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440763  | ORPH 
...ips64eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440764  | ORPH 
...64n32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440766  | ORPH 
...inMips64n32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440767  | ORPH 
...s64n32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440769  | ORPH 
...linMips64n32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440772  | ORPH 
...4n32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440774  | ORPH 
...nMips64n32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440776  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440779  | ORPH 
...ps64r6eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440782  | ORPH 
...6eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440784  | ORPH 
...ips64r6eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440787  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440789  | ORPH 
...s64r6eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440791  | ORPH 
...Nios2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440794  | ORPH 
...ootlinNios2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440796  | ORPH 
...nriscGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440798  | ORPH 
...linOpenriscGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440801  | ORPH 
...enriscMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440805  | ORPH 
...tlinOpenriscMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440807  | ORPH 
...riscUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440810  | ORPH 
...inOpenriscUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440811  | ORPH 
...440fpGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440813  | ORPH 
...owerpc440fpGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440814  | ORPH 
...c440fpMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440816  | ORPH 
...Powerpc440fpMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440817  | ORPH 
...40fpUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440818  | ORPH 
...werpc440fpUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440821  | ORPH 
...e5500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440822  | ORPH 
...erpc64e5500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440825  | ORPH 
...e6500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440826  | ORPH 
...erpc64e6500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440829  | ORPH 
...4e6500MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440831  | ORPH 
...werpc64e6500MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440833  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440835  | ORPH 
...c64lepower8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440836  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440838  | ORPH 
...pc64lepower8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440840  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440844  | ORPH 
...rpc64power8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440845  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440849  | ORPH 
...erpc64power8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440850  | ORPH 
...300c3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440853  | ORPH 
...werpce300c3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440855  | ORPH 
...e300c3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440859  | ORPH 
...owerpce300c3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440862  | ORPH 
...00c3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440865  | ORPH 
...erpce300c3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440869  | ORPH 
...500mcGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440870  | ORPH 
...werpce500mcGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440873  | ORPH 
...e500mcMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440876  | ORPH 
...owerpce500mcMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440878  | ORPH 
...00mcUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440880  | ORPH 
...erpce500mcUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440882  | ORPH 
...lp32dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440883  | ORPH 
...lp64dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440884  | ORPH 
...iscv64lp64dGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440885  | ORPH 
...4lp64dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440887  | ORPH 
...Riscv64lp64dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440888  | ORPH 
...p64dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440890  | ORPH 
...scv64lp64dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440891  | ORPH 
...0xz13GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440893  | ORPH 
...linS390xz13GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440894  | ORPH 
...Shsh4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440895  | ORPH 
...ootlinShsh4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440897  | ORPH 
...nShsh4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440898  | ORPH 
...BootlinShsh4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440899  | ORPH 
...hsh4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440901  | ORPH 
...otlinShsh4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440902  | ORPH 
...h4aebGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440904  | ORPH 
...linShsh4aebGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440905  | ORPH 
...sh4aebMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440907  | ORPH 
...tlinShsh4aebMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440908  | ORPH 
...arc64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440910  | ORPH 
...tlinSparc64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440911  | ORPH 
...rcv8UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440914  | ORPH 
...linSparcv8UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440916  | ORPH 
...X8664GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440918  | ORPH 
...ootlinX8664GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440919  | ORPH 
...nX8664MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440921  | ORPH 
...BootlinX8664MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440922  | ORPH 
...8664UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440924  | ORPH 
...otlinX8664UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440925  | ORPH 
...orei7GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440927  | ORPH 
...X8664corei7GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440928  | ORPH 
...corei7MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440931  | ORPH 
...nX8664corei7MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440933  | ORPH 
...rei7UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440934  | ORPH 
...8664corei7UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440936  | ORPH 
...664v2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440938  | ORPH 
...tlinX8664v2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440940  | ORPH 
...8664v2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440941  | ORPH 
...otlinX8664v2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440942  | ORPH 
...64v2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440943  | ORPH 
...linX8664v2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440944  | ORPH 
...664v3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440945  | ORPH 
...tlinX8664v3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440946  | ORPH 
...8664v3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440947  | ORPH 
...otlinX8664v3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440948  | ORPH 
...64v3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440949  | ORPH 
...linX8664v3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440950  | ORPH 
...664v4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440951  | ORPH 
...tlinX8664v4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440952  | ORPH 
...8664v4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440953  | ORPH 
...otlinX8664v4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440954  | ORPH 
...64v4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440955  | ORPH 
...linX8664v4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440956  | ORPH 
...core2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440957  | ORPH 
...linX86core2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440958  | ORPH 
...6core2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440959  | ORPH 
...tlinX86core2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440960  | ORPH 
...ore2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440963  | ORPH 
...inX86core2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440964  | ORPH 
...6i686GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440965  | ORPH 
...tlinX86i686GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440966  | ORPH 
...86i686MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440967  | ORPH 
...otlinX86i686MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440968  | ORPH 
...i686UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440969  | ORPH 
...linX86i686UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440970  | ORPH 
...lx60UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440973  | ORPH 
...Xtensalx60UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440974  | ORPH 
...ToolchainBuildrootMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440620  | ORPH 
...olchainBuildrootuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440621  | ORPH 
...xternalToolchainCCache | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440622  | ORPH 
...ernalToolchainCtngMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440623  | ORPH 
...rnalToolchainLinaroArm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440624  | ORPH 
...ToolchainSourceryArmv4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440625  | ORPH 
...ToolchainSourceryArmv5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440626  | ORPH 
...ToolchainSourceryArmv7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440627  | ORPH 
                 TestF2FS | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440274  | ORPH 
     TestFileCapabilities | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440237  | ORPH 
       TestFortifyConserv | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440238  | ORPH 
          TestFortifyNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440239  | ORPH 
               TestGdbArc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440366  | ORPH 
        TestGdbFullTarget | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440368  | ORPH 
...GdbHostOnlyAllFeatures | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440369  | ORPH 
   TestGdbHostOnlyDefault | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440371  | ORPH 
        TestGdbserverOnly | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440375  | ORPH 
        TestGetDevelopers | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440976  | ORPH 
              TestGitHash | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440254  | ORPH 
               TestGitHub | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440256  | ORPH 
               TestGitLab | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440258  | ORPH 
              TestGitRefs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440255  | ORPH 
     TestGlibcAllTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440251  | ORPH 
...DefaultLimitedTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440252  | ORPH 
              TestGlxinfo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440377  | ORPH 
               TestGnupg2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440379  | ORPH 
       TestGrubAArch64EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440227  | ORPH 
         TestGrubX8664EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440228  | ORPH 
         TestGrubi386BIOS | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440229  | ORPH 
          TestGrubi386EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440230  | ORPH 
           TestGst1Python | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440382  | ORPH 
                TestHWLoc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440385  | ORPH 
              TestHighway | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440383  | ORPH 
        TestHostBmapTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440353  | ORPH 
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440387  | ORPH 
  TestInitSystemBusyboxRo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440304  | ORPH 
...InitSystemBusyboxRoNet | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440306  | ORPH 
  TestInitSystemBusyboxRw | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440308  | ORPH 
...InitSystemBusyboxRwNet | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440310  | ORPH 
       TestInitSystemNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440313  | ORPH 
...InitSystemOpenrcRoFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440315  | ORPH 
...InitSystemOpenrcRwFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440317  | ORPH 
...nitSystemSystemdRoFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440320  | ORPH 
...ystemSystemdRoIfupdown | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440322  | ORPH 
...mdRoIfupdownDbusbroker | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440325  | ORPH 
...IfupdownDbusbrokerDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440328  | ORPH 
...ystemSystemdRoNetworkd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440332  | ORPH 
...nitSystemSystemdRwFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440334  | ORPH 
...ystemSystemdRwIfupdown | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440338  | ORPH 
...mdRwIfupdownDbusbroker | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440339  | ORPH 
...IfupdownDbusbrokerDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440342  | ORPH 
...ystemSystemdRwNetworkd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440343  | ORPH 
      TestIso9660Grub2EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440275  | ORPH 
 TestIso9660Grub2External | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440276  | ORPH 
...0Grub2ExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440279  | ORPH 
   TestIso9660Grub2Hybrid | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440280  | ORPH 
 TestIso9660Grub2Internal | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440283  | ORPH 
...so9660SyslinuxExternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440284  | ORPH 
...slinuxExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440286  | ORPH 
...so9660SyslinuxInternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440288  | ORPH 
                TestJffs2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440289  | ORPH 
               TestLibJXL | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440390  | ORPH 
            TestLibshdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440394  | ORPH 
                  TestLua | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440411  | ORPH 
              TestLuaHttp | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440437  | ORPH 
           TestLuaInotify | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440440  | ORPH 
              TestLuaLPeg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440398  | ORPH 
          TestLuaLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440406  | ORPH 
         TestLuaLuaArgon2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440415  | ORPH 
         TestLuaLuaAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440419  | ORPH 
           TestLuaLuaCffi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440423  | ORPH 
        TestLuaLuaCqueues | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440426  | ORPH 
          TestLuaLuaExpat | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440455  | ORPH 
     TestLuaLuaFileSystem | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440457  | ORPH 
             TestLuaLuaGD | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440434  | ORPH 
           TestLuaLuaLdap | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440460  | ORPH 
          TestLuaLuaLyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440445  | ORPH 
          TestLuaLuaPosix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440464  | ORPH 
           TestLuaLuaSDL2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440447  | ORPH 
            TestLuaLuaSec | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440466  | ORPH 
         TestLuaLuaSocket | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440468  | ORPH 
           TestLuaLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440429  | ORPH 
           TestLuaLuaossl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440462  | ORPH 
         TestLuaLuasyslog | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440470  | ORPH 
           TestLuaLuazlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440453  | ORPH 
             TestLuaLunix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440442  | ORPH 
             TestLuaLzlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440478  | ORPH 
             TestLuaRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440592  | ORPH 
              TestLuaUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440449  | ORPH 
               TestLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440413  | ORPH 
           TestLuajitHttp | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440439  | ORPH 
        TestLuajitInotify | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440441  | ORPH 
           TestLuajitLPeg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440403  | ORPH 
       TestLuajitLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440408  | ORPH 
      TestLuajitLuaArgon2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440417  | ORPH 
      TestLuajitLuaAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440422  | ORPH 
     TestLuajitLuaCqueues | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440428  | ORPH 
       TestLuajitLuaExpat | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440456  | ORPH 
  TestLuajitLuaFileSystem | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440459  | ORPH 
          TestLuajitLuaGD | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440436  | ORPH 
        TestLuajitLuaLdap | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440461  | ORPH 
       TestLuajitLuaLyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440446  | ORPH 
       TestLuajitLuaPosix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440465  | ORPH 
        TestLuajitLuaSDL2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440448  | ORPH 
         TestLuajitLuaSec | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440467  | ORPH 
      TestLuajitLuaSocket | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440469  | ORPH 
        TestLuajitLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440432  | ORPH 
        TestLuajitLuaossl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440463  | ORPH 
      TestLuajitLuasyslog | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440472  | ORPH 
        TestLuajitLuazlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440454  | ORPH 
          TestLuajitLunix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440444  | ORPH 
          TestLuajitRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440593  | ORPH 
       TestLuajitTurbolua | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440606  | ORPH 
           TestLuajitUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440452  | ORPH 
                 TestLuvi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440474  | ORPH 
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440476  | ORPH 
               TestMender | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440479  | ORPH 
             TestMsrTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440480  | ORPH 
                 TestNcdu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440481  | ORPH 
              TestNetdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440482  | ORPH 
           TestNoTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440253  | ORPH 
          TestNodeJSBasic | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440483  | ORPH 
         TestNodeJSModule | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440484  | ORPH 
                  TestOci | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440291  | ORPH 
               TestOctave | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440485  | ORPH 
                  TestOla | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440486  | ORPH 
              TestOpenJdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440487  | ORPH 
         TestOpenSshGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440488  | ORPH 
        TestOpenSshuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440489  | ORPH 
                 TestOpkg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440491  | ORPH 
             TestPerftest | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440492  | ORPH 
                 TestPerl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440493  | ORPH 
        TestPerlClassLoad | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440494  | ORPH 
         TestPerlDBDmysql | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440495  | ORPH 
     TestPerlEncodeDetect | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440496  | ORPH 
          TestPerlGDGraph | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440497  | ORPH 
       TestPerlHTMLParser | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440498  | ORPH 
TestPerlIOSocketMulticast | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440499  | ORPH 
      TestPerlIOSocketSSL | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440500  | ORPH 
 TestPerlLWPProtocolhttps | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440502  | ORPH 
         TestPerlMailDKIM | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440503  | ORPH 
              TestPerlX10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440504  | ORPH 
        TestPerlXMLLibXML | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440505  | ORPH 
       TestPerllibwwwperl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440501  | ORPH 
              TestPhpApcu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440506  | ORPH 
            TestPhpLuaLua | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440507  | ORPH 
         TestPhpLuaLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440508  | ORPH 
               TestPhpPam | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440509  | ORPH 
          TestPhpPeclDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440510  | ORPH 
                 TestPixz | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440511  | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440512  | ORPH 
        TestPolkitSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440513  | ORPH 
          TestPostScripts | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440244  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440514  | ORPH 
        TestProsodyLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440515  | ORPH 
         TestPy3BmapTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440354  | ORPH 
              TestPyNdiff | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440565  | ORPH 
            TestPython3Py | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440516  | ORPH 
         TestPython3PyPyc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440517  | ORPH 
           TestPython3Pyc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440518  | ORPH 
         TestPythonAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440522  | ORPH 
           TestPythonAvro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440525  | ORPH 
       TestPythonPahoMQTT | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440559  | ORPH 
     TestPythonPy3Aexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440519  | ORPH 
        TestPythonPy3Argh | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440520  | ORPH 
       TestPythonPy3Attrs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440521  | ORPH 
    TestPythonPy3Autobahn | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440523  | ORPH 
     TestPythonPy3Automat | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440524  | ORPH 
   TestPythonPy3Bitstring | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440526  | ORPH 
       TestPythonPy3Boto3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440527  | ORPH 
    TestPythonPy3Botocore | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440528  | ORPH 
         TestPythonPy3Can | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440529  | ORPH 
        TestPythonPy3Cbor | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440530  | ORPH 
       TestPythonPy3Click | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440531  | ORPH 
   TestPythonPy3Colorzero | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440532  | ORPH 
  TestPythonPy3Constantly | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440533  | ORPH 
   TestPythonPy3Construct | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440534  | ORPH 
    TestPythonPy3Crossbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440535  | ORPH 
TestPythonPy3Cryptography | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440536  | ORPH 
    TestPythonPy3DBusFast | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440538  | ORPH 
    TestPythonPy3DBusNext | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440539  | ORPH 
  TestPythonPy3Dicttoxml2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440540  | ORPH 
      TestPythonPy3Distro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440541  | ORPH 
      TestPythonPy3Django | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440542  | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440543  | ORPH 
       TestPythonPy3Flask | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440544  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440545  | ORPH 
         TestPythonPy3Git | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440546  | ORPH 
      TestPythonPy3Gitdb2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440547  | ORPH 
       TestPythonPy3GnuPG | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440548  | ORPH 
     TestPythonPy3Gobject | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440549  | ORPH 
    TestPythonPy3Gpiozero | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440550  | ORPH 
        TestPythonPy3Hkdf | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440551  | ORPH 
 TestPythonPy3Incremental | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440552  | ORPH 
    TestPythonPy3Iptables | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440554  | ORPH 
    TestPythonPy3Jmespath | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440556  | ORPH 
    TestPythonPy3Libftdi1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440388  | ORPH 
...PythonPy3MagicWormhole | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440557  | ORPH 
       TestPythonPy3Munch | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440558  | ORPH 
     TestPythonPy3Passlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440560  | ORPH 
     TestPythonPy3Pexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440561  | ORPH 
      TestPythonPy3PyAlsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440562  | ORPH 
      TestPythonPy3Pynacl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440564  | ORPH 
      TestPythonPy3Pytest | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440567  | ORPH 
...PythonPy3PytestAsyncio | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440568  | ORPH 
      TestPythonPy3Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440571  | ORPH 
      TestPythonPy3Qrcode | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440572  | ORPH 
         TestPythonPy3RSA | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440576  | ORPH 
     TestPythonPy3RpiGpio | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440575  | ORPH 
  TestPythonPy3S3transfer | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440578  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440579  | ORPH 
...thonPy3ServiceIdentity | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440580  | ORPH 
      TestPythonPy3Smmap2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440581  | ORPH 
      TestPythonPy3Spake2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440582  | ORPH 
        TestPythonPy3Treq | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440583  | ORPH 
     TestPythonPy3Twisted | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440584  | ORPH 
       TestPythonPy3Txaio | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440585  | ORPH 
    TestPythonPy3Txtorcon | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440586  | ORPH 
      TestPythonPy3Ubjson | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440587  | ORPH 
...y3UnitTestXmlReporting | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440588  | ORPH 
       TestPythonPy3rtoml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440577  | ORPH 
         TestPythonPybind | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440563  | ORPH 
             TestRdmaCore | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440590  | ORPH 
                TestRedis | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440591  | ORPH 
                TestRelro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440240  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440241  | ORPH 
         TestRootPassword | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440245  | ORPH 
        TestRootfsOverlay | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440246  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440594  | ORPH 
              TestRustBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440595  | ORPH 
                   TestS6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440596  | ORPH 
         TestS6Networking | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440597  | ORPH 
      TestS6PortableUtils | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440598  | ORPH 
                 TestS6Rc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440599  | ORPH 
                  TestSCP | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440259  | ORPH 
     TestSELinuxCustomGit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440247  | ORPH 
  TestSELinuxExtraModules | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440248  | ORPH 
...ELinuxExtraModulesDirs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440249  | ORPH 
       TestSELinuxPackage | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440250  | ORPH 
   TestSELinuxSystemdExt4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440345  | ORPH 
...SELinuxSystemdSquashfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440347  | ORPH 
                 TestSFTP | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440260  | ORPH 
             TestSquashfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440293  | ORPH 
 TestSquashfsMaxBlocksize | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440295  | ORPH 
 TestSquashfsMinBlocksize | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440297  | ORPH 
              TestSspNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440242  | ORPH 
            TestSspStrong | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440243  | ORPH 
                 TestSudo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440600  | ORPH 
       TestSysLinuxX86EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440231  | ORPH 
TestSysLinuxX86LegacyBios | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440232  | ORPH 
    TestSysLinuxX86_64EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440233  | ORPH 
...sLinuxX86_64LegacyBios | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440234  | ORPH 
             TestSyslogNg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440602  | ORPH 
                 TestTmux | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440604  | ORPH 
                  TestUbi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440300  | ORPH 
TestUbootOpensslPkgConfig | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440608  | ORPH 
               TestYaffs2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440302  | ORPH 
                   TestZ3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440609  | ORPH 
             TestZerofree | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440610  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440611  | ORPH 
              TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440612  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3906440614  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
