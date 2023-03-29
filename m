Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BD0C6FD18
	for <buildroot@archiver.kernel.org>; Wed, 29 Mar 2023 05:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CB3A60AD6;
	Wed, 29 Mar 2023 05:40:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CB3A60AD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XmTz8kW3a8pZ; Wed, 29 Mar 2023 05:40:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CECEC60E1A;
	Wed, 29 Mar 2023 05:40:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CECEC60E1A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D05531BF364
 for <buildroot@lists.busybox.net>; Wed, 29 Mar 2023 05:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2F5D41C55
 for <buildroot@lists.busybox.net>; Wed, 29 Mar 2023 05:40:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2F5D41C55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NvlxWKyVxuf7 for <buildroot@lists.busybox.net>;
 Wed, 29 Mar 2023 05:40:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E78C41868
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3E78C41868
 for <buildroot@buildroot.org>; Wed, 29 Mar 2023 05:40:35 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 577701C0006
 for <buildroot@buildroot.org>; Wed, 29 Mar 2023 05:40:31 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 29 Mar 2023 05:40:31 -0000
Message-Id: <20230329054039.A2F5D41C55@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1680068432; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0mJt+TFvSyH6W2NhEmMYCvSei06NG4WRroRWu5NnBpk=;
 b=F/UrsmatfvBc7wFLahPgKPmv4qRHtWYNHms/2Bi7/VYLrF06xlsgsak5O60JgESS0UAyyM
 P3b5zGRQwaLu1DvCf1tgobeh5hd1lyF11BUbvjnAAVGTcMEjwg9gCMbtWGo4nfHS2DQyDy
 PFkhgxUzTG24jeC3su2Din89VurubvRMKMCznKmYI0112IrWa5s88VfN7eVto60oM9TJbI
 ahkmKGXdCdpPnjhPp05t6Jt3v3V89JsxmVPUDSxicZu82nopFCx/DmNVElKK0eNYlxgT3z
 8rqcgKcoj/viS8C1dVFBtnXOYVsefjbQA9PEWEt3eekilVxSm7mS8g3JyTc7+A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=F/Ursmat
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-03-28
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

Autobuild statistics for 2023-03-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 13  | 14  |  1  | 28  |
    master   | 231 | 176 |  2  | 409 |

Classification of failures by reason for master
-----------------------------------------------

            host-binutils-2.38 | 14
glibc-2.36-81-g4f4d7a13edfd... | 9 
                elfutils-0.186 | 8 
  gobject-introspection-1.72.0 | 8 
                  snmppp-3.5.0 | 7 
                host-go-1.19.7 | 6 
                  linux-6.1.14 | 6 
                       unknown | 5 
             bluez5_utils-5.66 | 4 
                 dc3dd-7.2.641 | 4 
               host-zstd-1.5.4 | 4 
            quickjs-2021-03-27 | 4 
fs/ubifs/ubifs.mk:49: /home... | 3 
               host-runc-1.1.4 | 3 
               libglib2-2.72.3 | 3 
                   perl-5.36.0 | 3 
                busybox-1.36.0 | 2 
                 coreutils-9.2 | 2 
                  faad2-2.10.1 | 2 
                     file-5.43 | 2 
         gobject-introspection | 2 
              host-rust-1.68.0 | 2 
              libgcrypt-1.10.1 | 2 
        liblog4c-localtime-1.0 | 2 
            ocf-linux-20171122 | 2 
                    qemu-7.2.0 | 2 
                    sdl-1.2.15 | 2 
                  boost-1.80.0 | 1 
                    brltty-6.5 | 1 
                  cairo-1.16.0 | 1 
             cni-plugins-1.2.0 | 1 
             containerd-1.6.16 | 1 
                 coremark-1.01 | 1 
                cryptopp-8.6.0 | 1 
        edk2-edk2-stable202208 | 1 
                     efivar-38 | 1 
firmware-utils-86739f2b3ae9... | 1 
             fontconfig-2.13.1 | 1 
fs/cramfs/cramfs.mk:46: /tm... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubi/ubi.mk:51: /tmp/inst... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                 fwts-22.09.00 | 1 
gcnano-binaries-0ac1a89d7a5... | 1 
         host-gcc-final-12.2.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
     host-moby-buildkit-0.11.2 | 1 
       host-python-sip-4.19.25 | 1 
               host-qemu-7.2.0 | 1 
igh-ethercat-2e2cef61318953... | 1 
                jemalloc-5.3.0 | 1 
              libcamera-v0.0.4 | 1 
                libglvnd-1.4.0 | 1 
              libuhttpd-3.14.1 | 1 
          linux-5.10.162-cip24 | 1 
                   linux-tools | 1 
              liquid-dsp-1.4.0 | 1 
        ltp-testsuite-20220930 | 1 
          lttng-modules-2.13.7 | 1 
                     lxc-5.0.2 | 1 
                  matio-1.5.23 | 1 
                mongodb-4.2.18 | 1 
                    mpv-0.35.1 | 1 
                  mupdf-1.21.1 | 1 
                  ntp-4.2.8p15 | 1 
                  ntpsec-1.2.2 | 1 
                    olsr-0.9.8 | 1 
                   p7zip-17.04 | 1 
package/rtl8821cu/rtl8821cu... | 1 
                    parted-3.5 | 1 
                     php-8.2.3 | 1 
                     pv-1.6.20 | 1 
                  reaver-1.6.6 | 1 
           sane-backends-1.1.1 | 1 
                   sdl2-2.26.3 | 1 
              skalibs-2.12.0.1 | 1 
             stress-ng-0.15.04 | 1 
              traceroute-2.1.0 | 1 
                 uclibc-1.0.42 | 1 
uclibc-ng-test-6790eafe897b... | 1 
ulog-0389d243352255f6182326... | 1 
               valgrind-3.19.0 | 1 
                    volk-2.5.2 | 1 
               zxing-cpp-1.4.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/e1b2d58f40961229984f95e2f925698331da405e |     
   mipsel    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/2b70db7531758aa68a57b26076653d4e539d1e70 |     
   mips64    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/eee65936e8c7633d911ce3f4c539d363242aff97 |     
   mipsel    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/29cac892bee9505c591a4dde68a44601b79488de |     
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/eef37b81f0c27bb4132d168ff214b8acf7092676 |     
microblazeel |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/ca184c45940bb223f33162d6dcd5159b211a0136 |     
    mips     |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/d3abc47c96f72662df73546a7d0c2bc6e06f7161 | ORPH
    arm      |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/c4759db76995ff0c3687e89512172bf4b0ca324a | ORPH
   xtensa    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/1b578f31012749d6d5063596816135868b926e74 |     
   x86_64    |       cni-plugins-1.2.0        | NOK | http://autobuild.buildroot.net/results/a8446706c1aa1c30295061db4b15f8c18c4f34e4 |     
   x86_64    |       containerd-1.6.16        | NOK | http://autobuild.buildroot.net/results/bda731e3164db0c869902d23cab70c392221e78a |     
   armeb     |         coremark-1.01          | NOK | http://autobuild.buildroot.net/results/20e7592863f42e2caf9993dadb2083908d2b9b9a |     
   sh4aeb    |         coreutils-9.2          | NOK | http://autobuild.buildroot.net/results/ebb2888e29aa114c17bde711e28c7a8d45822b86 | ORPH
   sh4eb     |         coreutils-9.2          | NOK | http://autobuild.buildroot.net/results/5370adab2e45e87432df81798a9db7dbb1cd95df | ORPH
   sh4aeb    |         cryptopp-8.6.0         | NOK | http://autobuild.buildroot.net/results/c4a5b8c99153bbc7c521faa22481514145b5a9e3 |     
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/6b481680b21a66920de0a11d51d471adfddbf7bf | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/9a44cc8cf8af158ae1606dc2deaf94b089f515f8 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/ec49315bc47b07bb86198795fbb8fc433186e21f | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/dbc093c8185b920bc45ca5274deebed4c8e01ea3 | ORPH
  aarch64    |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/e5a1947057ffcc196821eecbd5d2dc4ac06d4038 |     
   mipsel    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/94356a1f86a11b97310537b52e99768350b0b5d9 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/c2146a27324563b165691475a1d796fd934234e8 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/9c3cce6821ac45ce15af77ece5d965109b6dba3a | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/40846269861c04892699a676cc5fad82b354a689 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/77d9b677e096f6ca4b45d79245437f8e336aa581 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/90f9fd25777f5967a82f1b7179b87be6c86603f1 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/17fd5fe22cf5712069a515d25acf1fbbe729c980 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/ddeeb8a1ba4e4b4e788768fa3afc6fba0c215396 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/4cdef08c1848730437edf93aa34b5f50f949f6ed | ORPH
    sh4      |          faad2-2.10.1          | NOK | http://autobuild.buildroot.net/results/2619ce18e613ba075b782679cc861ade15119414 |     
    sh4a     |          faad2-2.10.1          | NOK | http://autobuild.buildroot.net/results/9b5cbdb5d9c472bfe31d7f2a58ce6801b6f2c2ed |     
   mipsel    |           file-5.43            | NOK | http://autobuild.buildroot.net/results/a019b16d82da151dbefae5591688e55f678ede3c | ORPH
   mipsel    |           file-5.43            | NOK | http://autobuild.buildroot.net/results/5f0b45dfe9aa1f9c5eb4d0d037b2d0497a47d8f0 | ORPH
    or1k     | firmware-utils-86739f2b3ae9... | NOK | http://autobuild.buildroot.net/results/0b8e04c959c7f07c2aa194df78b71640f0a76b25 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/28a565d6d416cf8b7e1df64e8870fa45696aba72 | ORPH
  mips64el   | fs/cramfs/cramfs.mk:46: /tm... | NOK | http://autobuild.buildroot.net/results/4d3c45db306265799a981e954776e6ed4f0a22af |     
    mips     | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/1b0fcaea00e1baa23bdf086917694baebd826f9a |     
   armeb     | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/87c504df62a2f70a6f3e22e6b4f9dd248bc50f90 |     
   mips64    | fs/ubi/ubi.mk:51: /tmp/inst... | NOK | http://autobuild.buildroot.net/results/1f3848214ba7bc4e8de8457fe02554be73d3cacf |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/94d782d6672ab5eae8815318908608b43b69c1ee |     
   armeb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/53019262ec1f91fca17bde003329b40be0d96d30 |     
   nios2     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/40a8078e8d719ca8dd731299a89dcc258b3775e3 |     
   x86_64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/d7ebc472a322a204d4f3630b39a7e8d194428ec2 |     
    m68k     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/70a6fb24a3b6325fbc366af745134a7b9f71e1e7 |     
  aarch64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/d2aac527261519b8f9aa14fa14a685e1723f7bc6 |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/2e445198d86140badd0e7da06255fee3310fd00a |     
  sparc64    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/d6cecddc7cf97b5238c1909549ef6f4272226343 |     
   s390x     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/e23921f2911d6f87a0476ae016dab979cb2eb854 |     
   mipsel    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/5efa00355a0c756634c261ec6054941b616a4fb9 |     
   s390x     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/915e18d264420461fb5a2cf6a586dc3ce8d28f1e |     
   x86_64    |         fwts-22.09.00          | NOK | http://autobuild.buildroot.net/results/9a8ad276c7ee8b86fbd271fffd3af96656b592d8 |     
    arm      | gcnano-binaries-0ac1a89d7a5... | NOK | http://autobuild.buildroot.net/results/3fc753d51a88ce425223aa2221234233ce490815 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/5380e21194ee7b5d0f0205832283765375595445 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/0d2025f98db2c85a1933f98e3e9a710e5f814ec5 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/9d9c43c1c0967d87ccd20b6021d04d775b8a4d5b |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/75fe0474c4bb5b8470d368ffbf5bbb9ec449f7f8 |     
  riscv32    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/60c7741ad9b582ceacea65b5b53cc125bdad9bf9 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/86ea1a010f3cefe11a0ad54ae55f37d7e8c10311 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/4dd196942528d94720eeb1ef88a1a27229fe1612 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/6d35b4fd9284c14e38f3b8329fa9709ed4b9d437 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/299a14cdc5ebd94815a98739160bef45a5ba89ee |     
   armeb     |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/737de32659394631b460cb819af600a5a1198087 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/b572b2a3f996dac4855d2422a64678f585b9a54d |     
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/f0aa1328f523973351f9203de381f8f5d8227708 | ORPH
 microblaze  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/cc71993f5ef5c3e065ef7b6ec5de85cb32ccb0fc | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/a733d5e7581c81626c14ff1364dd00528d395cb3 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/54636e943848d6827d3ff4189e7dca8c0a2953b9 | ORPH
   armeb     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/fc5a73d6e15b4d54beb21de955e4846ea6630498 | ORPH
 powerpc64   |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/283296967c517089baadea2881a703621b9d89d8 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/b37ba038aa83b57a6e2777da4ee82cf51b0853b6 | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/df0a3a64c6fb31c2b27f6d7b757f0eb7fd2f5a2e | ORPH
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/6118679c3aa178121d7353f0e237dafb0c0d148c |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/d05e796380888266fe6f31b26be9212d8dc243e8 |     
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/008edd64cf57ca38423425f22304dfc6d2a9aa64 |     
    mips     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f632715167aec032f0a341e08799fbfea8c18888 |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/01919b950b416bc88b5f32ba63b20f2ca5069481 |     
   sh4eb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/9e69b144dc98fa9ce0f682a4ac34c382620c1cea |     
  riscv64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/6c33655c0ee2d0f42e0f16ef3a2322dd64dcd1b3 |     
    i586     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/92894b661e2cccccd6d6778bec066dd22d87d6f8 |     
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e7ccab33359dc05ed3bb65991e25046f57452e68 |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/c59ee2bbf899e9f1a0dae296e3001df37e4d3416 |     
  aarch64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/3573410ee29a11b0c3e0f1c3afe5a723a01ad910 |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/fe733c73f60e6ddcb106c47819f851e7de46a610 |     
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/297927cce75776cdcbf2726b6e74d0245eec76ea |     
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/8bac726999de50e8d17d967f23f969b5fcf6765e |     
 microblaze  |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/c4a2b5329f9281b201b3135675735b581336cd87 |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/40502a61017a3006452ff8725daa399d15fa3d27 | ORPH
  aarch64    |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/ec245cae5a2b748c5c3dd9cbe857773649175195 |     
   mipsel    |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/24e89e35f9088964a1009e328629de56bf4510a6 |     
   mips64    |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/910595a2fcee3350c4b229d58cf9b610d8b8629b |     
    i686     |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/29502db0b144f6754bb2043e2d3d0d9bcf388342 |     
powerpc64le  |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/c2c17c8457d492de50a8886f907a608cb46a658c |     
   mips64    |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/85584fc50ced408cc1c2d0f9ee22426ce906abad |     
  aarch64    |   host-moby-buildkit-0.11.2    | NOK | http://autobuild.buildroot.net/results/880c549b1e99c775ac9c260618582071e609779b |     
  aarch64    |    host-python-sip-4.19.25     | NOK | http://autobuild.buildroot.net/results/37eef9f1dd4c0e4d8ed8f15e36dbe2a16a9d893c |     
   mipsel    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/26eec3018e72c3103b95d8c26bc28599713e8bd5 |     
    arc      |        host-runc-1.1.4         | NOK | http://autobuild.buildroot.net/results/38e096169bcba594fe32822284a1cc0c21be5515 |     
   x86_64    |        host-runc-1.1.4         | NOK | http://autobuild.buildroot.net/results/00310d3eb38e1e7c161a6b4730fbb6ca0fb74eb0 |     
  riscv64    |        host-runc-1.1.4         | NOK | http://autobuild.buildroot.net/results/4c096b6cdc0c7acad177cf62f2f9f6eb5aab3968 |     
   x86_64    |        host-rust-1.68.0        | NOK | http://autobuild.buildroot.net/results/ceed178b3a20b1579bc90c553826542bbc9c284e |     
  aarch64    |        host-rust-1.68.0        | NOK | http://autobuild.buildroot.net/results/52f19773f8d198638d095ab3b79f1ad3f5bd0474 |     
 powerpc64   |        host-zstd-1.5.4         | NOK | http://autobuild.buildroot.net/results/1b682340e9fdece6792e25f11953b83b81b131a6 |     
  mips64el   |        host-zstd-1.5.4         | NOK | http://autobuild.buildroot.net/results/85b2b7065832ac1ea7b1d9c82374330907526141 |     
   s390x     |        host-zstd-1.5.4         | NOK | http://autobuild.buildroot.net/results/5c6ace7d323cf2fe43ad1881724ce9d4cf2a584b |     
   nios2     |        host-zstd-1.5.4         | NOK | http://autobuild.buildroot.net/results/9b778d2c4ad3d5c19792ddb0d4361b4503d50937 |     
   x86_64    | igh-ethercat-2e2cef61318953... | NOK | http://autobuild.buildroot.net/results/441e790ba3417daeacba1f875677f94ce3630dc9 |     
   sh4aeb    |         jemalloc-5.3.0         | NOK | http://autobuild.buildroot.net/results/eec8173bf18f9b386580ca5a333535db0e29c52b |     
    or1k     |        libcamera-v0.0.4        | NOK | http://autobuild.buildroot.net/results/cb5b8b9f683586eeb7c0632fe5353ffb3aa758d7 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/e0e62fbcc7d7aa9b1bc3e0e828478a07ddd9e665 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/6486c06d39f5105d055d2bfcc7723d59f9ca2f29 | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/87b6ce6f96acc3d3d5ccbcea8fb0f443422ee5b4 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/e6175cf294ce7458d1972d1db5e9db948b5cfc99 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/3dd37bdf624ebe1ccc35bf9bf47998d0338a8fc3 |     
  mips64el   |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/1179b0b0df1dee6425f574a81a3eaa0a6adc5750 | ORPH
  riscv64    |     liblog4c-localtime-1.0     | NOK | http://autobuild.buildroot.net/results/2ef5f2f485bed8e2f6b59b11d9b6805a93d1e41a |     
  riscv64    |     liblog4c-localtime-1.0     | NOK | http://autobuild.buildroot.net/results/3fdb30212cccffe77b9211bd0333fe972391cc55 |     
  mips64el   |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/5511f65682ea9d07b041905c4c698fad1dac09f8 |     
    sh4a     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/9ec9b630d61155a33ea05788b115fced4d96eafa | ORPH
   arceb     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/f59a768aedfb59e37bb95af098e6ad0bcd31b746 | ORPH
 powerpc64   |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/f123a141e9189512b8568b8df2ca72fd2fa23362 | ORPH
   mipsel    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/74c4043853ba7d2f999ca49e15739c39a0836edc | ORPH
 aarch64_be  |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/371101a204606c1243b29041db8d4f8e3ab65f3f | ORPH
  mips64el   |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/83c0c3485d5467513241cc7701c2eb960b961af5 | ORPH
   nios2     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/0b9a4e32604484aea19baceee9a87ce19e42b69e | ORPH
 powerpc64   |          linux-tools           | NOK | http://autobuild.buildroot.net/results/9e9ee2d863676de024a2152327b165e541561fa3 | ORPH
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/5da009f62bbf055f6bc2a09afb7d6d603e0084be |     
   x86_64    |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/83a7f02941a1a05add6f827c42efcbf6b84963e1 |     
   sparc     |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/84932bd03fc09da452abe9dc596d311c656daaee |     
 aarch64_be  |           lxc-5.0.2            | NOK | http://autobuild.buildroot.net/results/334cdf105bc32166cc3da59a22e0b272d2bfdfcc |     
   nios2     |          matio-1.5.23          | NOK | http://autobuild.buildroot.net/results/ea930f967f490951e70336d6f29fb8065d352799 |     
   x86_64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/0f052c77dfaeaddaec329f438d5632f8acd4662d |     
   mipsel    |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/5d267664760c9af01ebaeb67f3bc74ed51c61a25 |     
   s390x     |          mupdf-1.21.1          | NOK | http://autobuild.buildroot.net/results/3e0933b8d7adf1a16cee0662a2592e476ae16b81 |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/ac848c5881f3befac1fc9143f4ceb7cb539a4abc | ORPH
   xtensa    |          ntpsec-1.2.2          | NOK | http://autobuild.buildroot.net/results/413de905a3a73c7e6c90e20a4e902907ec2cbde7 | ORPH
  sparc64    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/4779a67b8e450d879f32341114304ca884066214 | ORPH
    i686     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/5488a0fb0e8844d6925d06fa4a68ce15719f8d0b | ORPH
   s390x     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/de567ec633ff2a8dcdf38d44b0cb03c9294a6ab6 | ORPH
    or1k     |          p7zip-17.04           | NOK | http://autobuild.buildroot.net/results/a80cb9ac3d982e5b686967c9b154537ef8bdf02b |     
 powerpc64   | package/rtl8821cu/rtl8821cu... | NOK | http://autobuild.buildroot.net/results/fc3cb6483fce3555c96a830627cd588f507380d0 |     
   arceb     |           parted-3.5           | NOK | http://autobuild.buildroot.net/results/0a293f2cc746603fa707bae54f707c6ee23a458c |     
  mips64el   |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/e0c5d28151a1aa223f909d4b30bd3cb1669bfd7b |     
    or1k     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/e896e283517ad9d46628343eabbddd289670051f |     
   arceb     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/31c57f5b792c423e692802a5b3bf81d577a96878 |     
    arm      |           php-8.2.3            | NOK | http://autobuild.buildroot.net/results/dc067f209cc850bd7ec5563bf1cab920165ea4f2 |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/a8a532f0ac23f5ad1084bd6370dbeaea3801c21f | ORPH
   mipsel    |           qemu-7.2.0           | NOK | http://autobuild.buildroot.net/results/f702007eaa445c6e38e651b8c4d49cb4eefd4f83 |     
    mips     |           qemu-7.2.0           | NOK | http://autobuild.buildroot.net/results/8c3a3c4843b7d1b2e6a26a30a90a80fe59478b54 |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/5d1cab9eadb43345bac44f0341141443ff44e3f6 |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/b93bc0fe098c9ec2ef4d69748e929bad10aeb471 |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/368d211c71d797203d806b648f2ce3861bdb16ca |     
 microblaze  |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/33eca8b12abf14f1ba8ced19fc6d9e76e94ac669 |     
   arceb     |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/31cbc5335ae8731b642b2f8fd96c37f8f56dfd2f |     
    arm      |      sane-backends-1.1.1       | NOK | http://autobuild.buildroot.net/results/153f5470e9dc48b6cd2ffe2408344568335802bf |     
   sh4aeb    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/94df1edeb535e2e4e21aafeae0756946072d5a73 | ORPH
    sh4a     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/dda7ff2e614f1a7636406b652b58596bac6660a7 | ORPH
    arm      |          sdl2-2.26.3           | NOK | http://autobuild.buildroot.net/results/7ec1387c346a672471bb8b410d3833214cb9d771 |     
    or1k     |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/a4f3cfa355799309f6babe7fcf516ccc5fe6feaa |     
  aarch64    |          snmppp-3.5.0          | NOK | http://autobuild.buildroot.net/results/b74a57f81e473316e14b566e962cbe32d97317dd |     
microblazeel |          snmppp-3.5.0          | NOK | http://autobuild.buildroot.net/results/ac5a4691723107c8202415c4e876a3e527944d6f |     
   x86_64    |          snmppp-3.5.0          | NOK | http://autobuild.buildroot.net/results/54e96d314307912032319f5f7edb1539300136c1 |     
   armeb     |          snmppp-3.5.0          | NOK | http://autobuild.buildroot.net/results/fd25fc2b204e13c960e7e0b368343df7eb781344 |     
   x86_64    |          snmppp-3.5.0          | NOK | http://autobuild.buildroot.net/results/3859358a0c8c915b487fdc35e6b33bfea33dddf5 |     
   x86_64    |          snmppp-3.5.0          | NOK | http://autobuild.buildroot.net/results/2e4d7f9ede0a272fc7cfd8c0d6b3e59d27bf63ca |     
  sparc64    |          snmppp-3.5.0          | NOK | http://autobuild.buildroot.net/results/a61cb39e7c955ba60c948b6bfdb5279268b2526a |     
    arm      |       stress-ng-0.15.04        | NOK | http://autobuild.buildroot.net/results/6e08d3ed54a2c2018e84169a9184a416f84e83fb |     
    arm      |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/1860367dfe973579ece06ac1be99b5dfd7bc31c1 |     
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/4263fdf82cbd36c8993a7c40614866b5f68317ad |     
  mips64el   | uclibc-ng-test-6790eafe897b... | NOK | http://autobuild.buildroot.net/results/cd43873f26715393d354a289b0dd61ac49810047 |     
 powerpc64   | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/477aa2f3a861bc1f862cdf9468cccb93ae40b013 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/aca794ce2f7a4ef5ee124cfa03e0f211f9a97860 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/6a2c81c595c642ad7a2d88af387e6cb4f04357fd |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/e13e4ff46f26069a68f01324b435a7bb4582bd30 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/ab658a2c5b4f49d4a25cd9a92719dcbe4e5a6b04 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/d82f99d867e1d5366f1a23bfd7902b55021decd2 |     
    i686     |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/f1da6c791352aca4352986d4dd7932ed541341d9 | ORPH
  powerpc    |           volk-2.5.2           | NOK | http://autobuild.buildroot.net/results/9e088db2a0ac2e3d098a7152db0eefcc596f9fd4 |     
    or1k     |        zxing-cpp-1.4.0         | NOK | http://autobuild.buildroot.net/results/9f6e4590c28081f88afea7247d275ce4b771ca7e |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                       unknown | 3 
               host-qemu-7.2.0 | 2 
                  ffmpeg-4.4.3 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
glibc-2.36-81-g4f4d7a13edfd... | 1 
         gobject-introspection | 1 
             host-delve-1.20.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
                  libzip-1.9.2 | 1 
ulog-0389d243352255f6182326... | 1 
                     vdr-2.6.3 | 1 
                 wolfssl-5.5.3 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/2d22f968928f0adc24a6cb467c8ebd4ac13d13cd |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/7d5295171b9a68051e80b17488aa4a42edc96673 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/0e0d5bda420b5190a763c8448aaf4180965aa269 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/aec4f54d6288cee339ea900ac78cfd0152a28cdd |     
   mips64    |       host-delve-1.20.0        | NOK | http://autobuild.buildroot.net/results/de6735077dcd6f2b5867552143f27ae1abeea9e3 |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/e96f7fe9847b3747f294161cdd7bf17da504c4a4 | ORPH
   armeb     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/ebbd20071e2390852ec4eb48b124314212b706c2 |     
   nios2     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/0095960222846c58726aaaa20cc43046535d00d2 |     
    arc      |          libzip-1.9.2          | NOK | http://autobuild.buildroot.net/results/df502625d206ef3a0f69214d9519db8990c5adeb | ORPH
 powerpc64   | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/294af466eae4360b5e4e913d0d53b326b0fe705d |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/adef7dfb5112026d260df54cbdc329175b457695 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/6682b855b463de7e1dfa3cf8cc08b361fbaa4aed |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/7f7acd8b6d4442aab17c11d106f752174347d620 |     
   mips64    |           vdr-2.6.3            | NOK | http://autobuild.buildroot.net/results/a6a7ef2909d4f957028fdf28ebeed7b4c0ffe0ce |     
   mipsel    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/7ca0862981251afb7f52a0c7e676e30f59f218e4 |     


Gitlab CI results for 2023-03-28
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
 TestAarch64Pages64kGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634959  | ORPH 
  TestAarch64Pages64kMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634960  | ORPH 
TestAarch64Pages64kuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634961  | ORPH 
         TestCheckPackage | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635357  |      
      TestClangCompilerRT | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634514  | ORPH 
           TestCrudiniPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634517  | ORPH 
              TestDtbocfg | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634530  | ORPH 
             TestExecline | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634533  | ORPH 
                 TestExt3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634381  | ORPH 
...rch64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634972  | ORPH 
...tlinAarch64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634973  | ORPH 
...arch64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634974  | ORPH 
...otlinAarch64MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634975  | ORPH 
...ch64UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634977  | ORPH 
...linAarch64UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634978  | ORPH 
...h64beGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634979  | ORPH 
...inAarch64beGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634980  | ORPH 
...64beUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634981  | ORPH 
...nAarch64beUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634982  | ORPH 
...750dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634983  | ORPH 
...nArcle750dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634984  | ORPH 
...ehs38GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634985  | ORPH 
...inArclehs38GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634988  | ORPH 
...hs38UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634990  | ORPH 
...nArclehs38UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634991  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634992  | ORPH 
...mebv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634993  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634994  | ORPH 
...rmebv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634996  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634997  | ORPH 
...ebv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634999  | ORPH 
...5eabiGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635000  | ORPH 
...inArmv5eabiGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635001  | ORPH 
...v5eabiMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635002  | ORPH 
...linArmv5eabiMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635004  | ORPH 
...eabiUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635005  | ORPH 
...nArmv5eabiUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635006  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635008  | ORPH 
...Armv6eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635009  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635010  | ORPH 
...nArmv6eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635013  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635016  | ORPH 
...rmv6eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635018  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635021  | ORPH 
...Armv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635023  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635027  | ORPH 
...nArmv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635029  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635034  | ORPH 
...rmv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635035  | ORPH 
...mv7mUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635037  | ORPH 
...tlinArmv7mUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635038  | ORPH 
...8xxxUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635040  | ORPH 
...nM68k68xxxUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635042  | ORPH 
...fireUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635044  | ORPH 
...8kcoldfireUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635047  | ORPH 
...azebeGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635049  | ORPH 
...icroblazebeGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635052  | ORPH 
...lazebeMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635054  | ORPH 
...MicroblazebeMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635058  | ORPH 
...zebeUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635061  | ORPH 
...croblazebeUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635062  | ORPH 
...azeelGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635067  | ORPH 
...icroblazeelGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635069  | ORPH 
...lazeelMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635072  | ORPH 
...MicroblazeelMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635074  | ORPH 
...zeelUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635076  | ORPH 
...croblazeelUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635078  | ORPH 
...ips32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635080  | ORPH 
...otlinMips32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635082  | ORPH 
...Mips32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635084  | ORPH 
...ootlinMips32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635087  | ORPH 
...ps32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635089  | ORPH 
...tlinMips32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635091  | ORPH 
...s32elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635093  | ORPH 
...linMips32elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635097  | ORPH 
...ps32elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635099  | ORPH 
...tlinMips32elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635103  | ORPH 
...32elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635105  | ORPH 
...inMips32elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635106  | ORPH 
...2r5elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635108  | ORPH 
...nMips32r5elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635112  | ORPH 
...32r5elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635114  | ORPH 
...inMips32r5elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635118  | ORPH 
...r5elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635121  | ORPH 
...Mips32r5elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635125  | ORPH 
...2r6elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635130  | ORPH 
...nMips32r6elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635132  | ORPH 
...32r6elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635134  | ORPH 
...inMips32r6elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635135  | ORPH 
...r6elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635137  | ORPH 
...Mips32r6elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635138  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635141  | ORPH 
...Mips64eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635144  | ORPH 
...4eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635148  | ORPH 
...nMips64eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635150  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635152  | ORPH 
...ips64eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635153  | ORPH 
...64n32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635155  | ORPH 
...inMips64n32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635157  | ORPH 
...s64n32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635158  | ORPH 
...linMips64n32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635160  | ORPH 
...4n32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635161  | ORPH 
...nMips64n32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635162  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635164  | ORPH 
...ps64r6eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635166  | ORPH 
...6eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635169  | ORPH 
...ips64r6eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635171  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635173  | ORPH 
...s64r6eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635177  | ORPH 
...Nios2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635179  | ORPH 
...ootlinNios2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635180  | ORPH 
...nriscGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635183  | ORPH 
...linOpenriscGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635185  | ORPH 
...enriscMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635186  | ORPH 
...tlinOpenriscMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635187  | ORPH 
...riscUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635188  | ORPH 
...inOpenriscUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635189  | ORPH 
...440fpGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635190  | ORPH 
...owerpc440fpGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635191  | ORPH 
...c440fpMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635192  | ORPH 
...Powerpc440fpMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635193  | ORPH 
...40fpUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635195  | ORPH 
...werpc440fpUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635196  | ORPH 
...e5500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635197  | ORPH 
...erpc64e5500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635199  | ORPH 
...e6500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635200  | ORPH 
...erpc64e6500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635201  | ORPH 
...4e6500MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635202  | ORPH 
...werpc64e6500MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635203  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635205  | ORPH 
...c64lepower8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635207  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635209  | ORPH 
...pc64lepower8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635211  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635213  | ORPH 
...rpc64power8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635214  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635218  | ORPH 
...erpc64power8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635220  | ORPH 
...300c3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635222  | ORPH 
...werpce300c3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635223  | ORPH 
...e300c3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635224  | ORPH 
...owerpce300c3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635225  | ORPH 
...00c3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635227  | ORPH 
...erpce300c3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635228  | ORPH 
...500mcGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635229  | ORPH 
...werpce500mcGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635230  | ORPH 
...e500mcMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635231  | ORPH 
...owerpce500mcMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635232  | ORPH 
...00mcUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635234  | ORPH 
...erpce500mcUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635235  | ORPH 
...lp32dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635236  | ORPH 
...lp64dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635238  | ORPH 
...iscv64lp64dGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635239  | ORPH 
...4lp64dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635240  | ORPH 
...Riscv64lp64dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635241  | ORPH 
...p64dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635242  | ORPH 
...scv64lp64dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635245  | ORPH 
...0xz13GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635247  | ORPH 
...linS390xz13GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635248  | ORPH 
...Shsh4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635249  | ORPH 
...ootlinShsh4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635251  | ORPH 
...nShsh4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635252  | ORPH 
...BootlinShsh4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635254  | ORPH 
...hsh4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635255  | ORPH 
...otlinShsh4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635256  | ORPH 
...h4aebGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635259  | ORPH 
...linShsh4aebGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635260  | ORPH 
...sh4aebMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635261  | ORPH 
...tlinShsh4aebMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635262  | ORPH 
...arc64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635263  | ORPH 
...tlinSparc64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635264  | ORPH 
...rcv8UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635265  | ORPH 
...linSparcv8UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635266  | ORPH 
...X8664GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635267  | ORPH 
...ootlinX8664GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635268  | ORPH 
...nX8664MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635269  | ORPH 
...BootlinX8664MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635270  | ORPH 
...8664UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635272  | ORPH 
...otlinX8664UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635273  | ORPH 
...orei7GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635274  | ORPH 
...X8664corei7GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635275  | ORPH 
...corei7MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635280  | ORPH 
...nX8664corei7MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635285  | ORPH 
...rei7UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635288  | ORPH 
...8664corei7UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635291  | ORPH 
...664v2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635294  | ORPH 
...tlinX8664v2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635297  | ORPH 
...8664v2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635300  | ORPH 
...otlinX8664v2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635301  | ORPH 
...64v2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635302  | ORPH 
...linX8664v2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635303  | ORPH 
...664v3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635304  | ORPH 
...tlinX8664v3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635305  | ORPH 
...8664v3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635306  | ORPH 
...otlinX8664v3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635307  | ORPH 
...64v3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635308  | ORPH 
...linX8664v3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635309  | ORPH 
...664v4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635311  | ORPH 
...tlinX8664v4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635313  | ORPH 
...8664v4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635315  | ORPH 
...otlinX8664v4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635317  | ORPH 
...64v4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635318  | ORPH 
...linX8664v4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635319  | ORPH 
...core2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635320  | ORPH 
...linX86core2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635323  | ORPH 
...6core2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635325  | ORPH 
...tlinX86core2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635328  | ORPH 
...ore2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635330  | ORPH 
...inX86core2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635333  | ORPH 
...6i686GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635337  | ORPH 
...tlinX86i686GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635340  | ORPH 
...86i686MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635343  | ORPH 
...otlinX86i686MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635346  | ORPH 
...i686UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635348  | ORPH 
...linX86i686UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635350  | ORPH 
...lx60UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635352  | ORPH 
...Xtensalx60UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635355  | ORPH 
...ToolchainBuildrootMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634962  | ORPH 
...olchainBuildrootuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634964  | ORPH 
...xternalToolchainCCache | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634965  | ORPH 
...ernalToolchainCtngMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634966  | ORPH 
...rnalToolchainLinaroArm | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634967  | ORPH 
...ToolchainSourceryArmv4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634969  | ORPH 
...ToolchainSourceryArmv5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634970  | ORPH 
...ToolchainSourceryArmv7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634971  | ORPH 
     TestFileCapabilities | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634259  | ORPH 
               TestGdbArc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634535  | ORPH 
        TestGdbFullTarget | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634538  | ORPH 
...GdbHostOnlyAllFeatures | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634540  | ORPH 
   TestGdbHostOnlyDefault | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634544  | ORPH 
        TestGdbserverOnly | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634547  | ORPH 
        TestGetDevelopers | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004635360  | ORPH 
               TestGitLab | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634319  | ORPH 
     TestGlibcAllTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634299  | ORPH 
...DefaultLimitedTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634301  | ORPH 
              TestGlxinfo | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634549  | ORPH 
               TestGnupg2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634551  | ORPH 
           TestGst1Python | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634554  | ORPH 
                TestHWLoc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634557  | ORPH 
              TestHighway | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634555  | ORPH 
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634563  | ORPH 
  TestInitSystemBusyboxRw | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634460  | ORPH 
...ystemSystemdRoNetworkd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634478  | ORPH 
...IfupdownDbusbrokerDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634490  | ORPH 
               TestIperf3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634560  | ORPH 
      TestIso9660Grub2EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634390  | ORPH 
 TestIso9660Grub2External | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634394  | ORPH 
...0Grub2ExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634398  | ORPH 
   TestIso9660Grub2Hybrid | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634405  | ORPH 
 TestIso9660Grub2Internal | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634423  | ORPH 
...so9660SyslinuxExternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634427  | ORPH 
...slinuxExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634431  | ORPH 
...so9660SyslinuxInternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634433  | ORPH 
                TestKexec | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634564  | ORPH 
               TestLibJXL | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634568  | ORPH 
            TestLibshdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634570  | ORPH 
                 TestLsof | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634578  | ORPH 
                  TestLua | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634583  | ORPH 
              TestLuaHttp | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634613  | ORPH 
           TestLuaInotify | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634619  | ORPH 
              TestLuaLPeg | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634573  | ORPH 
          TestLuaLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634580  | ORPH 
         TestLuaLuaArgon2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634586  | ORPH 
         TestLuaLuaAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634591  | ORPH 
           TestLuaLuaCffi | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634595  | ORPH 
        TestLuaLuaCqueues | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634597  | ORPH 
          TestLuaLuaExpat | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634637  | ORPH 
     TestLuaLuaFileSystem | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634639  | ORPH 
             TestLuaLuaGD | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634608  | ORPH 
           TestLuaLuaLdap | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634642  | ORPH 
          TestLuaLuaLyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634629  | ORPH 
          TestLuaLuaPosix | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634646  | ORPH 
           TestLuaLuaSDL2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634631  | ORPH 
            TestLuaLuaSec | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634651  | ORPH 
         TestLuaLuaSocket | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634656  | ORPH 
           TestLuaLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634602  | ORPH 
           TestLuaLuaossl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634644  | ORPH 
         TestLuaLuasyslog | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634660  | ORPH 
           TestLuaLuazlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634635  | ORPH 
             TestLuaLunix | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634625  | ORPH 
             TestLuaLzlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634668  | ORPH 
             TestLuaRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634905  | ORPH 
              TestLuaUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634633  | ORPH 
               TestLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634585  | ORPH 
           TestLuajitHttp | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634616  | ORPH 
        TestLuajitInotify | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634623  | ORPH 
           TestLuajitLPeg | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634575  | ORPH 
       TestLuajitLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634581  | ORPH 
      TestLuajitLuaArgon2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634589  | ORPH 
      TestLuajitLuaAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634593  | ORPH 
     TestLuajitLuaCqueues | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634599  | ORPH 
       TestLuajitLuaExpat | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634638  | ORPH 
  TestLuajitLuaFileSystem | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634641  | ORPH 
          TestLuajitLuaGD | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634611  | ORPH 
        TestLuajitLuaLdap | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634643  | ORPH 
       TestLuajitLuaLyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634630  | ORPH 
       TestLuajitLuaPosix | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634649  | ORPH 
        TestLuajitLuaSDL2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634632  | ORPH 
         TestLuajitLuaSec | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634653  | ORPH 
      TestLuajitLuaSocket | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634658  | ORPH 
        TestLuajitLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634606  | ORPH 
        TestLuajitLuaossl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634645  | ORPH 
      TestLuajitLuasyslog | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634663  | ORPH 
        TestLuajitLuazlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634636  | ORPH 
          TestLuajitLunix | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634627  | ORPH 
          TestLuajitRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634907  | ORPH 
       TestLuajitTurbolua | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634945  | ORPH 
           TestLuajitUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634634  | ORPH 
                 TestLuvi | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634664  | ORPH 
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634666  | ORPH 
               TestMender | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634669  | ORPH 
             TestMsrTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634673  | ORPH 
               TestMtools | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634676  | ORPH 
                 TestNcdu | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634679  | ORPH 
              TestNetdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634683  | ORPH 
          TestNodeJSBasic | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634684  | ORPH 
         TestNodeJSModule | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634687  | ORPH 
               TestOctave | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634688  | ORPH 
                  TestOla | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634690  | ORPH 
              TestOpenJdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634691  | ORPH 
         TestOpenSshGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634693  | ORPH 
        TestOpenSshuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634694  | ORPH 
                 TestOpkg | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634696  | ORPH 
             TestPerftest | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634697  | ORPH 
                 TestPerl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634700  | ORPH 
        TestPerlClassLoad | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634701  | ORPH 
         TestPerlDBDmysql | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634705  | ORPH 
     TestPerlEncodeDetect | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634708  | ORPH 
          TestPerlGDGraph | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634711  | ORPH 
       TestPerlHTMLParser | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634713  | ORPH 
TestPerlIOSocketMulticast | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634717  | ORPH 
      TestPerlIOSocketSSL | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634720  | ORPH 
 TestPerlLWPProtocolhttps | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634724  | ORPH 
         TestPerlMailDKIM | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634728  | ORPH 
              TestPerlX10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634730  | ORPH 
        TestPerlXMLLibXML | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634732  | ORPH 
       TestPerllibwwwperl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634722  | ORPH 
              TestPhpApcu | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634735  | ORPH 
            TestPhpLuaLua | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634741  | ORPH 
         TestPhpLuaLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634744  | ORPH 
               TestPhpPam | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634750  | ORPH 
          TestPhpPeclDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634762  | ORPH 
                 TestPixz | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634764  | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634766  | ORPH 
        TestPolkitSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634767  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634769  | ORPH 
        TestProsodyLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634770  | ORPH 
              TestPyNdiff | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634872  | ORPH 
            TestPython3Py | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634771  | ORPH 
         TestPython3PyPyc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634774  | ORPH 
           TestPython3Pyc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634775  | ORPH 
         TestPythonAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634782  | ORPH 
           TestPythonAvro | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634790  | ORPH 
         TestPythonHwdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634845  | ORPH 
       TestPythonPahoMQTT | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634861  | ORPH 
     TestPythonPy3Aexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634777  | ORPH 
        TestPythonPy3Argh | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634779  | ORPH 
       TestPythonPy3Attrs | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634780  | ORPH 
    TestPythonPy3Autobahn | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634785  | ORPH 
     TestPythonPy3Automat | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634787  | ORPH 
   TestPythonPy3Bitstring | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634793  | ORPH 
       TestPythonPy3Boto3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634798  | ORPH 
    TestPythonPy3Botocore | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634799  | ORPH 
         TestPythonPy3Can | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634801  | ORPH 
        TestPythonPy3Cbor | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634803  | ORPH 
       TestPythonPy3Click | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634806  | ORPH 
   TestPythonPy3Colorzero | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634807  | ORPH 
  TestPythonPy3Constantly | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634810  | ORPH 
   TestPythonPy3Construct | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634812  | ORPH 
    TestPythonPy3Crossbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634814  | ORPH 
TestPythonPy3Cryptography | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634816  | ORPH 
    TestPythonPy3DBusFast | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634819  | ORPH 
    TestPythonPy3DBusNext | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634821  | ORPH 
  TestPythonPy3Dicttoxml2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634823  | ORPH 
      TestPythonPy3Distro | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634824  | ORPH 
      TestPythonPy3Django | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634827  | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634828  | ORPH 
       TestPythonPy3Flask | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634830  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634833  | ORPH 
         TestPythonPy3Git | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634835  | ORPH 
      TestPythonPy3Gitdb2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634838  | ORPH 
       TestPythonPy3GnuPG | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634839  | ORPH 
     TestPythonPy3Gobject | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634840  | ORPH 
    TestPythonPy3Gpiozero | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634842  | ORPH 
        TestPythonPy3Hkdf | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634843  | ORPH 
 TestPythonPy3Incremental | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634848  | ORPH 
    TestPythonPy3Iptables | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634850  | ORPH 
    TestPythonPy3Jmespath | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634853  | ORPH 
    TestPythonPy3Libftdi1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634566  | ORPH 
...PythonPy3MagicWormhole | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634856  | ORPH 
       TestPythonPy3Munch | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634858  | ORPH 
     TestPythonPy3Passlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634863  | ORPH 
     TestPythonPy3Pexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634865  | ORPH 
      TestPythonPy3PyAlsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634867  | ORPH 
      TestPythonPy3Pynacl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634871  | ORPH 
      TestPythonPy3Pytest | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634876  | ORPH 
...PythonPy3PytestAsyncio | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634878  | ORPH 
      TestPythonPy3Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634881  | ORPH 
      TestPythonPy3Qrcode | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634883  | ORPH 
         TestPythonPy3RSA | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634887  | ORPH 
     TestPythonPy3RpiGpio | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634886  | ORPH 
  TestPythonPy3S3transfer | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634890  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634891  | ORPH 
...thonPy3ServiceIdentity | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634893  | ORPH 
      TestPythonPy3Smmap2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634894  | ORPH 
      TestPythonPy3Spake2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634895  | ORPH 
        TestPythonPy3Treq | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634896  | ORPH 
     TestPythonPy3Twisted | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634898  | ORPH 
       TestPythonPy3Txaio | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634899  | ORPH 
    TestPythonPy3Txtorcon | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634900  | ORPH 
      TestPythonPy3Ubjson | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634901  | ORPH 
...y3UnitTestXmlReporting | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634902  | ORPH 
       TestPythonPy3rtoml | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634889  | ORPH 
         TestPythonPybind | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634869  | ORPH 
             TestRdmaCore | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634903  | ORPH 
                TestRedis | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634904  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634910  | ORPH 
              TestRustBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634913  | ORPH 
                   TestS6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634916  | ORPH 
         TestS6Networking | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634918  | ORPH 
      TestS6PortableUtils | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634921  | ORPH 
                 TestS6Rc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634925  | ORPH 
 TestSquashfsMaxBlocksize | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634452  | ORPH 
             TestStressNG | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634930  | ORPH 
                 TestSudo | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634933  | ORPH 
             TestSyslogNg | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634938  | ORPH 
                 TestTmux | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634943  | ORPH 
TestUbootOpensslPkgConfig | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634949  | ORPH 
                   TestZ3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634951  | ORPH 
             TestZerofree | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634953  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634954  | ORPH 
              TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634956  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4004634958  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
