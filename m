Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A02C3DA7A
	for <buildroot@archiver.kernel.org>; Fri,  6 Jan 2023 06:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 545BE40017;
	Fri,  6 Jan 2023 06:56:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 545BE40017
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gDvKr_jXBJ37; Fri,  6 Jan 2023 06:56:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1A8640291;
	Fri,  6 Jan 2023 06:56:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1A8640291
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7E94E1BF5F8
 for <buildroot@lists.busybox.net>; Fri,  6 Jan 2023 06:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DA4D40291
 for <buildroot@lists.busybox.net>; Fri,  6 Jan 2023 06:56:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DA4D40291
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tb21KCEa18rD for <buildroot@lists.busybox.net>;
 Fri,  6 Jan 2023 06:56:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FCE040017
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1FCE040017
 for <buildroot@buildroot.org>; Fri,  6 Jan 2023 06:56:02 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6CA7FFF803
 for <buildroot@buildroot.org>; Fri,  6 Jan 2023 06:56:00 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 06 Jan 2023 06:56:00 -0000
Message-Id: <20230106065608.5DA4D40291@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1672988160; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LApFMdjOK9B6zptt8wzffDAr1jugGEG3DdVh05Q9XUY=;
 b=nEYVNDXhWtyDxqPC815I9Ro4NcwVxrFApBQi5qppWYOYHML2bMjZjVkGXMVRnvaN7P7+9t
 g5Ae99RHe3Ii9gLkfIz/XCiOeG/wjggNBsvtSdjU7qOlDCnIjvYGXLht1Xa2DJtPtaTxK5
 O7GDnISk9St00HjdfKzFRBEeasj+w+OGiOAR73Wk9u6RZW6BGP5xRsmbA0s156Dh18pEr4
 OKhAr4Ka2z84kTSCJPCVl2OCs2rQUEh/+HLXSfSdBMrAva15/WO6YgzhVAI4mHaE50uuhq
 fOGIP6+NKyTBHKWscqWfXbiVg6q4OiMh8uBGS3opI1L+fUBTBJ5gSrwTi3P9Jg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nEYVNDXh
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-01-05
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

Autobuild statistics for 2023-01-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  3  |  3  |  0  |  6  |
  2022.11.x  | 17  | 19  |  0  | 36  |
    master   | 67  | 227 |  0  | 294 |

Classification of failures by reason for master
-----------------------------------------------

             libgpg-error-1.46 | 93
               host-fwup-1.9.1 | 15
                   bash-5.2.15 | 12
                    fwup-1.9.1 | 10
                       unknown | 7 
                  bustle-0.8.0 | 5 
            host-binutils-2.38 | 5 
                     xz-5.2.10 | 5 
                   linux-6.1.2 | 4 
                    bat-0.19.0 | 3 
                    crun-1.7.2 | 3 
                elfutils-0.186 | 3 
             fontconfig-2.13.1 | 3 
       host-gdk-pixbuf-2.42.10 | 3 
              host-pahole-1.24 | 3 
                    norm-1.5.8 | 3 
                    brltty-6.5 | 2 
  gobject-introspection-1.72.0 | 2 
            python-bunch-1.0.1 | 2 
    python-cryptography-38.0.4 | 2 
               acpica-20220331 | 1 
              asterisk-16.29.1 | 1 
                   bird-2.0.11 | 1 
                  boost-1.80.0 | 1 
                bpftool-v7.0.0 | 1 
                  check-0.15.2 | 1 
                 coreutils-9.1 | 1 
             ctorrent-dnh3.3.2 | 1 
             dahdi-linux-3.2.0 | 1 
        edk2-edk2-stable202208 | 1 
                    emlog-0.70 | 1 
                   ethtool-6.1 | 1 
                     frr-8.3.1 | 1 
                gerbera-1.10.0 | 1 
glibc-2.36-66-ga1dc0be03c9d... | 1 
                   gvfs-1.48.1 | 1 
            host-binutils-2.37 | 1 
         host-gcc-final-10.4.0 | 1 
         host-gcc-final-11.3.0 | 1 
              host-rust-1.66.0 | 1 
         host-sentry-cli-2.8.0 | 1 
               libcap-ng-0.8.3 | 1 
               libglib2-2.72.3 | 1 
                   libnss-3.86 | 1 
          linux-5.10.145-cip17 | 1 
      linux-5.10.145-cip17-rt7 | 1 
               mariadb-10.3.36 | 1 
                    musl-1.2.3 | 1 
                  ntp-4.2.8p15 | 1 
               openblas-0.3.21 | 1 
                 openssh-9.1p1 | 1 
   openvmtools-11.3.5-18557794 | 1 
                    opkg-0.4.5 | 1 
                   perl-5.34.1 | 1 
                    pixz-1.0.7 | 1 
                 proftpd-1.3.8 | 1 
                     pv-1.6.20 | 1 
           python-pyicu-2.10.2 | 1 
            python-rtoml-0.8.0 | 1 
rtl8821cu-86cc5ceb7c28b9b99... | 1 
sconeserver-8d1935919a20133... | 1 
                 uclibc-1.0.42 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |        acpica-20220331         | NOK | http://autobuild.buildroot.net/results/ee9acd79dbb073bb3438c9cfe267a10d32418b31 |     
   s390x     |        asterisk-16.29.1        | NOK | http://autobuild.buildroot.net/results/e31b2b7bf98527c6a913e98d76d793d6e000ef78 |     
   mips64    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/fa313bc1c3eca079364a2cc9a270df31d9102723 | ORPH
    or1k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/f81bab9fe6d2a302cb1cbb913e257c3bb5aff486 | ORPH
    sh4      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/d171862a4d438549281d74acc35947be1af624df | ORPH
    or1k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/4a38447f921c0c7b2cf7dd0c056b72ea8b43cc29 | ORPH
    arc      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/d817f3635b3e2893fface9c5dcd9c9a15c341894 | ORPH
   arceb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/9d57ff8a7bc695507c90f7e6f5a163445c5dd5e3 | ORPH
   xtensa    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/abecb22a23879fa46fc7c27d5aa9895077f89831 | ORPH
  mips64el   |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/4073d271173a7c398eb6eac35d0be5538d678fc1 | ORPH
  aarch64    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/4e6536028da7436eea9978f6e3a559b8a25ffb65 | ORPH
   xtensa    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/8698782c7ba389f8fe38edcfa2f8ed9973e5d081 | ORPH
    i586     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/c63b772332b39d4956f846ed2b63b7bd0e12856f | ORPH
    or1k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/9e5b0173590bd8701e0426f7d578d724e15efe00 | ORPH
powerpc64le  |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/1ed1f057a6499fc6a14a2c5fdea9ff94c764c87e |     
  powerpc    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/b24b7ac68cd5919c8a06ea63f726ae6e7ba36c7b |     
   armeb     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/42be660328a523a28cff2a4c7a36843082a2ed33 |     
   sparc     |          bird-2.0.11           | NOK | http://autobuild.buildroot.net/results/7f69c725c3f337ba7deb85e973b3bff14237a7dd |     
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/d36087054fb27bbeab85f68ae571ec8a19016562 |     
   s390x     |         bpftool-v7.0.0         | NOK | http://autobuild.buildroot.net/results/a65ba4ab217d14539312543efdefbcc144ae9608 |     
    mips     |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/eebc5edd1bb9cb06fe75eb43d269c52c0e6040c1 |     
    mips     |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/48fa1b40c460b20637d5b4c3de2a9b559dcc3027 |     
    arm      |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/f3dcb617488e4172e639e3bd51a93bc9822ea186 | ORPH
  sparc64    |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/c68d72d3aac14e8eccdf3068a3aa383aa19449df | ORPH
   s390x     |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/0217bc6e3fb006a7a58e3c914a57b701da063e31 | ORPH
  aarch64    |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/e0a53e964e75effe9e0d4b20f8bf996eac461363 | ORPH
  riscv64    |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/b40336cd38147354476a698eca88d65984423176 | ORPH
 aarch64_be  |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/fa4fd3c6ec169161f1af8e270ff46d3f8ce26518 | ORPH
    sh4      |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/041c2cc7ef18f16007a0bfb9a44335ced0f890e9 | ORPH
    mips     |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/91d7856ba9b4de5a866fcc2ab08318a408e64aa6 |     
   xtensa    |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/a636b3aa013758ff3553db5df7a6388bcebfbe44 |     
  powerpc    |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/1e15cd32b0980a256de376d4250d4851dfeb5f4d |     
  riscv64    |       ctorrent-dnh3.3.2        | NOK | http://autobuild.buildroot.net/results/762f16ddad3b52f85d99c15bb6b42d406bf08d7b |     
 aarch64_be  |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/dfa8c3fad8dabecee9a78fcd9db39e1f3e2d0bdb |     
   x86_64    |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/045fdbd4a7e5ce09d2976e8d466ce7ecfb6515e0 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/d6b81dd44df027cb0f65945098ef78580bafe0b5 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/19bc26810a5be3a45b6af57ad98b947faeae8c95 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/f3041001e589b440390f980fbe6415b1cff3d106 | ORPH
   mips64    |           emlog-0.70           | NOK | http://autobuild.buildroot.net/results/15eb65a249eb3a87943bf13f25e1657544bd2687 |     
    sh4      |          ethtool-6.1           | NOK | http://autobuild.buildroot.net/results/dbc8926bf4d625f2f92f156c9efd9809379bb5f4 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/9102205ec36a4dc83959fab4a01e24f307ecdd32 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/3d6b1a725fbf7f4d704acb42c4bd6b9aacf96e16 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/d42520a8cf64a2475a256eb7a36c9dc06eae9b0c | ORPH
    arc      |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/c2f654af1140aa0aa01b90bb79aea5017458d198 |     
  sparc64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/67424f540d96964d307fd65ff9c27c1bb0565b1d |     
   mips64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/017b133663360215ca7679a44de079b8b0163883 |     
  aarch64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/df2795a6226b20c96df5e6c6979e2fbb93b09830 |     
  mips64el   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/40fa08cc7fb5cf40b1fe1242b25abc40cc8ed186 |     
 microblaze  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/dd1ab84e59eca819bfc6f35725a2ed5ae30f15a3 |     
 microblaze  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/1a8cea30514028d54a3d5cc9974237eb730e8cfe |     
   sh4aeb    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/22aa2ccad50358c26bbf3c92e44f9177259687a2 |     
  sparc64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/0034ba5e471ac922c7a23b7d1fdcaaae1db39526 |     
   x86_64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/4133c694f5fd745638ba742318e9dbccde54a1a2 |     
   armeb     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/fac870d2d6b796723df305055ddbf62e744a0c7b |     
    arm      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/2ecad718d34bcb94a701d5e935b57674e9c3da3c |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/81f2646bc06075de4ffe50140b04a2ab0cede1b5 |     
 powerpc64   |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/b625054c4270d056c343f62585b32de719fe2909 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/cca3a5826496fbee0b457cb5170cf21b100baecf | ORPH
    mips     |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/1bda772e6e11fd9b12066e37a8a2a64f4c4fb45d | ORPH
  aarch64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/4d6e0402758e97f5beb0a15a74205ce8261a2638 |     
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/76f2e134ffe7c9497f1def9736aee250dc4123df |     
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/7bfe9b5e149857e3c7aac1ba15a01526bcb44b2a |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/3621863629e406810746a921d40b5365d4bba90c |     
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/8b1c480b08d0c74a32766da974da91a8fedfd48c |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/5fa3a99a106366c3e1a18ecfd42ce96f42ebfb52 |     
    or1k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/b351e89e1206bb8dfd7e69f09d061bef1c7e8c4c |     
  riscv32    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/627a9733abdd0436e6060ef1755e358aee343c28 |     
 microblaze  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/24fdb730376826e3a5644471aff34796db948b53 |     
    mips     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/c9be802b8e1f026013d65cc976c0ea0ee4cf515b |     
    arm      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/a840f36e66e6800f182e2dcdf1c07333326c0ead |     
   mips64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/af8328038d10b1772e52cd603182e509745f98bd |     
    or1k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/91d4a86d86f1ebbda0a99644772df457a89332fc |     
   mips64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/32cd65f0d45d40709ed44cf421b8c21f6bcfbb49 |     
  riscv32    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/843b67a3137270c8eb8635f4748c55b5c7b848fe |     
  riscv64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/0d732a5aacd0d5ee9dd951a6e15978f353698e92 |     
    or1k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/ee36834c155742a7bf7b72d8d76aa8316c869d34 |     
   arceb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/253ab2002ef55c0aebde0cc906328da5f408b24c |     
  mips64el   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/b3ddb3c40091f617d516ded0fcd1919185d5e61d |     
   x86_64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/77bca1ad3f18c4674ca95979acf5db10f28037c1 |     
    or1k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/6f2a3a88999dfc22d60013f939123b0fbcf6835a |     
 microblaze  |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/88bf46fc99b6528ee045d89d1531a200466c4086 |     
 microblaze  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/c05dec83c65a4bbaa084efe0032ea7241c3205da |     
 powerpc64   |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/2e9a79011923d4a504626ad8d0cd4ef61578af44 | ORPH
   xtensa    |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/4b8fe2cde627514525aecaeffc8fd53648102211 | ORPH
   armeb     |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/9f9469efbb22784e709df7135857eb1f95305809 | ORPH
    m68k     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/248707e3f3e29c6ac2c7f716a484bd8766127dbc |     
   s390x     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/2177a44c2d8b4a0c7f8d63a575836995af6f3ee5 |     
   s390x     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/ad1c80a5e3aaec0767b48d9784e8db8afe0265a8 |     
  aarch64    |        host-rust-1.66.0        | NOK | http://autobuild.buildroot.net/results/ecfd420c301b2ec91dcd167f0ea6f2c2cc1f704f |     
  sparc64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/caa0724f29e7ff5862ce1bf357f7129fa8f5feff |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/88b9958c3cb3c6227fa722a1a190920948d60bdf |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/b42074c2a725f78e6b4e867e6b82b5282b581ad6 |     
   s390x     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/4401d219e161a7630a9243fada10bd699a2a012a | ORPH
    or1k     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/c2826b82ec3fc67e3d158b86c0629224633f1ba3 | ORPH
    i686     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/01d68c3636ad5a8c7d53d2b4b414684e164040a0 | ORPH
   mipsel    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/0e535e30cff7e0941e80d669c22b1ab2c70b69ad | ORPH
   sparc     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/2b782e401c46b9aecdd933606b9ca72cebf386ed | ORPH
   x86_64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/bdfc6ba48779f813ef2c8460d99f62738aa56a82 | ORPH
powerpc64le  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/729e06ca224115ccfc37138f27e217ad1e146bec | ORPH
   mips64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/20f0396c9273ba795f75a87d22efad2e29041261 | ORPH
   s390x     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/23778e5c7fc1c9cb8bbc359ec8c04f117b54a8ba | ORPH
   nios2     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/d983b3d97ccb0d600c9d50ce1ad2cbe0490fed82 | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/b21eb0e8060df98997d5d808ac2fd09389061c9c | ORPH
    or1k     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/68ae8b2868885e19f1aeb2c9c30df2f1679e769a | ORPH
    arm      |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/7e372c56791a797d8fd8c0794307fe0a543cee4d | ORPH
   mipsel    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/b46508593334f266a63a162a93808075af65d5f1 | ORPH
   nios2     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/cb999ba8ee02a0878500eb1a1f2ce9637eb3fe7a | ORPH
   mipsel    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/7109ca3059b258d398592b8001cae81b6f771cf0 | ORPH
   nios2     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/ff433e96407c2f04d77c47808381d2d09b80a114 | ORPH
   s390x     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/390a91158e05807c6dbef95f83fc1a5a6e04f760 | ORPH
    arm      |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/d5a92be1b903afc0d743237ed29d220f76fb70de | ORPH
  mips64el   |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/2591eb0ec950eaacf72ae2140afef7e5a016436b | ORPH
    mips     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/da32e9809620dd54a7eade4bd9e2037b8a87465e | ORPH
  sparc64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/c4adadd632e71311aa01271eea1d7ded27915e0c | ORPH
   x86_64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/67528e763715f0f4903a76eb824223c81d5744a0 | ORPH
   s390x     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/13bdd3b20a750eb96512b45b2c5d3d2fde18d8c4 | ORPH
    i686     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/553b305e620d2ed09d9f8b8bc5e3916b490c6e71 | ORPH
  aarch64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/e8a464f3e0b8cc5f945371cebac539eb6e35f557 | ORPH
   s390x     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/4b51fc319282cc34f15883c6bcbe551d39c34e84 | ORPH
   s390x     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/95105ca89ea8fd9e91b9f8fc78d48d7b67c6ec64 | ORPH
   sparc     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/4c9f489675266cc90608f769c77e21094ae6c96d | ORPH
    arm      |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/c56abcbe1fb1f5a0af68d5a3ecc2cfb923f70b03 | ORPH
    mips     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/7915baa1ed47430704b5f18014d7d309dadb05fa | ORPH
   sh4eb     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/d902c52f34794343afe2ca928a4f98d63a4be9f5 | ORPH
    arm      |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/7f0b516329b6fb93a973069d14ec5ef550e1c649 | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/705f7200092173f2de02336ee9645d596da18ff6 | ORPH
  sparc64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/4a90b4f86c551a2388f576474cea63d807560aa7 | ORPH
   sh4eb     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/50b661347f89b236bf37b62f5efe0d5f8f881261 | ORPH
    i686     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/0a36130217fabd2e3eb4ad48fc1166a88973066e | ORPH
    i686     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/0edb2aacbb392d8748ec9f45ad8319f0604b0b4a | ORPH
  mips64el   |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/e6c0af08756312ae9dad049cdf3dbf2a6119e389 | ORPH
  sparc64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/630a0da24acf8bb5482b522bb1330a4a683b194a | ORPH
   s390x     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/c9c2cc0709ec694080777460aca6357438f47dcf | ORPH
powerpc64le  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/c47ef9f19cad69a6c9bbfe9bfb2ac25690d5aae9 | ORPH
    m68k     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/da7bf154acb060de8a536299f6e31d4df7f26421 | ORPH
   nios2     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/f2d5d1101a564ad8d9b1c0fb8600022a7c17fd3f | ORPH
 powerpc64   |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/51fb61620d381d1f8e124292dd3c2a38f6c828f7 | ORPH
   mips64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/ba9811db6cc03a73445189c5b9d6a2ab798ad6d0 | ORPH
   sparc     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/6ac6814eabedd5668f1f58ca3db2ffafaefae8d1 | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/e1733c86ec5c1b5266b231978c4e546892d99898 | ORPH
   s390x     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/d9cc56514a0e495ea3b2d88d08992696906f6646 | ORPH
  mips64el   |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/e45d12bc8b8e194aadf8872bf693df440d29b9e9 | ORPH
   mips64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/f3b90faad52a7d69b7dfd83caa10128384378074 | ORPH
   sparc     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/216e07286b08a87a318bdecda5c548a1b78f7982 | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/c11c9601c5a375d1f50edc374b6d6064db1f70c1 | ORPH
    arm      |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/3a7f433fe78096ed4e1af223c60e965714bad146 | ORPH
    or1k     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/35f198f42a77a9d0c2223b5a8918d0a628c7345b | ORPH
  powerpc    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/0ba351778ad4f297a66a30baf71d1b71e990fd9d | ORPH
  sparc64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/3515e34e84f8060241b50411893ec17987e47421 | ORPH
   sparc     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/da27d45ce614294387c92988a349b0be9caee2fe | ORPH
   s390x     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/504c1c59a4c4883be9b401601d26e66eb308ad92 | ORPH
  powerpc    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/5264a6c7b803080462580f567b89dfbe623b6762 | ORPH
    arm      |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/22e0b0eb1724c356e54c9067b9506cc0e3c3e6fc | ORPH
  aarch64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/28d56dd3b3efb3ada73f7eb4b809f60259c0219d | ORPH
  aarch64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/3881a30eae10449438096dd9a9c49e36cd8c26b7 | ORPH
   s390x     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/8aa701a17954564c289a90cbcb37a576ba15e2e0 | ORPH
   x86_64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/4f9ece0d8227611e683bf62131bc30d231f35601 | ORPH
  riscv32    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/b6f1261312c824d76b9ec0f4953856c05c32cc13 | ORPH
  riscv32    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/1fd180a060dfa832aa607a686bb8af0aa1a44b1a | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/6c1e44f5657f4b6d8e79a69cbbb44d284d4ecfe9 | ORPH
   s390x     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/4f30b43d2588dac7115ee4a2b979223e25b3c7ef | ORPH
    m68k     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/749ecb43f025eb2d90a3cf23b2d5bd9c7f1d1e37 | ORPH
    arm      |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/e72a2f6676980976eca5b51b56d2223d7f457217 | ORPH
powerpc64le  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/bc1566a0fa42f68f1f15f74a61d4081e269e1689 | ORPH
   nios2     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/dcd3750ffae62323504ae761facf965cd0bff5ae | ORPH
   mips64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/b93a8754fa9c01352dfc499d0da0a6b579f26308 | ORPH
    i686     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/10ebdab419f3555782b65774a90f6810b852c839 | ORPH
  riscv32    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/ddd42abe2b25fe9fbcb35e4730aa87be22f52b8c | ORPH
    arm      |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/408df6d1e63fcf640df7c044b79955a77acd9c84 | ORPH
 powerpc64   |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/cb27f7d26a4b3526cee185f17257229b2dd31093 | ORPH
  sparc64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/7dc9d48af7c2aa435becaaa763ce7500d84ef6f2 | ORPH
  riscv32    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/a65c07c31d83ad03d4b5995cd1eb1553fc859e95 | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/113297f0b49910b6049781da6e66a80e874770b2 | ORPH
   x86_64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/90416fd19e50949e1f2be4ada57e382819f392b4 | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/3ecff27af37ae979c32777d869514d5f2dab61d7 | ORPH
  sparc64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/fc30fc6334d125f8e099d1923ad9d47b02e0a00d | ORPH
  mips64el   |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/cba4af0944a7c40d60e705fbcdc4e966fd35bd05 | ORPH
powerpc64le  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/496c6376a87d14497e8f3119a63f684ff7e850a7 | ORPH
    sh4a     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/97cfbc230bb9f35f9de337abec797c11ea0440ac | ORPH
  aarch64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/a504b2daab294c9de4598787c7c651690708f361 | ORPH
powerpc64le  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/ceae1cf8bbcbac3354197566fe5c41029883e39a | ORPH
    arm      |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/d21f2598a551b93f710bde513324e701b8451178 | ORPH
   armeb     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/5f7dd659052c4a8c7bdb5001c0e806e9456f150c | ORPH
   x86_64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/d4d85ebd01e33003cba123df20eaeb4dda063d43 | ORPH
    i686     |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/fc2ef10caf83ec791dabadcab071558ed6fd5078 | ORPH
powerpc64le  |          libnss-3.86           | NOK | http://autobuild.buildroot.net/results/8f7b33d5b0f023adb9696b1b613cf522e43d4ea9 |     
  powerpc    |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/472625b2a1a4785bb2fd670e61b517e7ec94305c | ORPH
 microblaze  |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/ed512151c1431e22b7a0c818b2539f43c0660bc9 | ORPH
  mips64el   |          linux-6.1.2           | NOK | http://autobuild.buildroot.net/results/2d3029dd262d62851081a3cb16612cb390037fbb | ORPH
    i686     |          linux-6.1.2           | NOK | http://autobuild.buildroot.net/results/38b88d30317153cb98b707708ef7a626706538d4 | ORPH
    mips     |          linux-6.1.2           | NOK | http://autobuild.buildroot.net/results/6d59bea6c5d61f50913ca4b6b2f61b7fe564e07a | ORPH
  mips64el   |          linux-6.1.2           | NOK | http://autobuild.buildroot.net/results/5233301217e287a48fa920797c98ae21a3b805ca | ORPH
   arceb     |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/79f74da7dd13706719e4c4245b2e77bc26fe44dc | ORPH
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/5ad23d61c576e2f58988c2a7983213728bf59bc9 |     
    or1k     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/8ed5365054853582816472df798d3036fa9e5a90 | ORPH
   mipsel    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/369042ca7072ef15ae387d6490da6f3b67ebf3a5 | ORPH
   armeb     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/6509d398015cf79fbcb72d7d35165f49d5ac39c8 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/3750814239cb040d44a207eb3315b8939189baa9 | ORPH
  mips64el   |        openblas-0.3.21         | NOK | http://autobuild.buildroot.net/results/7769e06c70d8698b6149984cbcb337055806983a | ORPH
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/36c4279c2bc8273a7b4ea1962203555d4064c5f0 | ORPH
  aarch64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/372643f9c9c97817c462e994e3562e0bc4c892cd |     
    arc      |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/7d27020345900027f04ccbfa630bfdd95baaa911 | ORPH
 microblaze  |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/4fdc341c741ffea7ec7c1a668539d3b20ed79b72 |     
   nios2     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/9a38973d9cbd1905bdd3630815153067cf22a40a |     
   sparc     |         proftpd-1.3.8          | NOK | http://autobuild.buildroot.net/results/a6e18cd3a917db374d8d1c8a0c18c551a27aa107 |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/7aa3a19e95ce24b011b97e8eb6c2256df1ef485c | ORPH
    m68k     |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/f76468870e031ae8c8c474255d407a8163dd5c6e |     
 microblaze  |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/967e5aa6361083140f1f89735179669bd01373ad |     
    i686     |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/99cce4064f4c722d1b4d4a9c1a609bf7c0670cf3 |     
  powerpc    |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/8e6424ceddc4f2e81dc0718f06a35e7a5bf40bc4 |     
    arm      |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/20cdb5f41d16b38dba40a2b81b9763a4a6e21e8f |     
powerpc64le  |       python-rtoml-0.8.0       | NOK | http://autobuild.buildroot.net/results/71dc70c3cc0a2c31df0abac06c7107a5bede1f9c |     
   s390x     | rtl8821cu-86cc5ceb7c28b9b99... | NOK | http://autobuild.buildroot.net/results/0c82109c3677a38ea4240fc57df21f6102852dc8 |     
    arc      | sconeserver-8d1935919a20133... | NOK | http://autobuild.buildroot.net/results/3a59c076f7b479639154e1db5dde3664c78c9e3d |     
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/b1ff8ff262049d307cf6a81893ba2027036f5542 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/dbb24b3caa0e7cd811bb8b1b260a268908df4abf |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/223ba3a1808268c16ce65524f02d7d7ca4913026 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/6d993a18a54180557222951f7e6c6fe001d114e8 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/149bfd5d58e344a4e282f60e6c1146c52c78ae20 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/4b54bfa24fdb17f1534e59977d30dc4e7b1e36a9 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/950c6e747d559e708cfd86ebd72751c6b0f7867f |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/2099526f9bef3f3bf423333f6432c9afcd2fdb70 |     
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/830145723955f9ebad3b7cf78281b28ec1059141 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/239641ad7c997615bf9c5238ff15eedc704b92f1 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/e92fb56be19cd0f58be41d0f43360ec8bcba48c3 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/5daa08dc2e0d029ae9482db241f92e4d702f31e2 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/a6c8cb01b1d4c1b27cf1489e61c581930bfb6232 | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                       frr-8.1 | 1 
               gocryptfs-2.2.1 | 1 
                  zabbix-5.4.9 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/919d7d28b7589875e63e537136cd3470f42d60cf |     
  riscv64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/0ec11f8b27fd25ce6408c5da171ad8ab1de447dd |     
   nios2     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/499cca4b00d458070f17d073524f34dd1c0f406d |     


Classification of failures by reason for 2022.11.x
--------------------------------------------------

                  linux-6.0.16 | 2 
                       unknown | 2 
/home/buildroot/autobuild/i... | 1 
               apcupsd-3.14.14 | 1 
                      crun-1.5 | 1 
glibc-2.36-66-ga1dc0be03c9d... | 1 
                   grpc-1.50.0 | 1 
            host-binutils-2.37 | 1 
            host-binutils-2.38 | 1 
              host-rust-1.64.0 | 1 
           janus-gateway-1.0.3 | 1 
                       kmod-30 | 1 
           python-numpy-1.23.4 | 1 
        s6-linux-utils-2.6.0.0 | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
                      xz-5.2.7 | 1 
                    zstd-1.5.2 | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/8b9aa59c5cb7aced9277a87be17d3ae7da5c0a9d |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/2f3e18251905c461458aefe8cb6e00a9e02535a0 |     
  riscv64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/2bcb4d99358d54e1ad6f42ef4f8697dfa154ab75 |     
 powerpc64   | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/1b1674b47527a2e5826bfa6afb6174ce40fa1c4b |     
  mips64el   |          grpc-1.50.0           | NOK | http://autobuild.buildroot.net/results/3f30d0fa35e3061557616e3fff6e74db19cf5c22 |     
 microblaze  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/04c00ee3a4784cc6ed50adb9ef2e8395887ee553 |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/c2f79a066c3bbc562240c9735fd0984f725533db |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/44a513a6d8b976f0451d1c842f2d5f0b4b783101 |     
  sparc64    |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/99e00b7a65ba3e71fc3bceb4c6ffaae898ce703f |     
   x86_64    |            kmod-30             | NOK | http://autobuild.buildroot.net/results/e1870367a988fbe46122395350a85802707e032c |     
   armeb     |          linux-6.0.16          | NOK | http://autobuild.buildroot.net/results/15679631c1690cf56f8e78fee59d163bac003018 | ORPH
powerpc64le  |          linux-6.0.16          | NOK | http://autobuild.buildroot.net/results/abaa85c4a9b12b714aab4078cc6599411f3c864b | ORPH
    arm      |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/7c23e0d9624742ddc50f5c9b4530cab66ced233c |     
  mips64el   |     s6-linux-utils-2.6.0.0     | NOK | http://autobuild.buildroot.net/results/03929eedb16b1c645cf637869fb6a96e65e2cce9 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/1864b24a33610743db1f3c3cda6db26c7d50fa39 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/54db7a02fb947bb48f7334549cf0d069b9f6c3b7 |     
   s390x     | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/b4bbea3cd28082bf7a991207d8366c7c42398988 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/dde4380c1c0baba9fe73a70d07d6db982b4e3fdc | ORPH
microblazeel |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/565373998698f74533a454fb2ee17bc2637cb689 |     


Gitlab CI results for 2023-01-05
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
               arcturus_ucls1012a | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557773502  |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557773508  |      
                 arm_foundationv8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557773519  |      
                   armadeus_apf27 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557773525  |      
                   armadeus_apf28 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557773530  |      
                   armadeus_apf51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557773544  |      
                aspeed_ast2500evb | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557773547  |      
                aspeed_ast2600evb | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557773555  |      
               asus_tinker_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557773571  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557773634  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557773647  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557773653  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557773657  |      
                     at91sam9x5ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557773664  |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557773693  |      
                 at91sam9x5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557773735  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557773741  |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557773753  |      
       atmel_sama5d2_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557773775  |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557773788  |      
           atmel_sama5d3_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557773803  |      
       atmel_sama5d3_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557773819  |      
       atmel_sama5d3_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557773850  |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557773874  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557773927  |      
           atmel_sama5d4_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557773932  |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557773937  |      
       atmel_sama5d4_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774002  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774015  |      
                        avenger96 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774018  |      
                bananapi_m2_ultra | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774027  |      
                 bananapi_m2_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774033  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774038  | ORPH 
                   beagleboardx15 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774044  |      
                       beaglebone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774051  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774058  |      
                     beagleboneai | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774070  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774076  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774086  |      
               broadcom_northstar | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774095  |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774098  |      
                   chromebook_elm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774104  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774109  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774116  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774124  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774127  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774170  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774178  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774189  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774193  |      
               freescale_imx28evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774200  |      
        freescale_imx6dlsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774211  |      
          freescale_imx6dlsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774243  |      
         freescale_imx6qsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774248  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774264  |      
          freescale_imx6sxsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774286  |      
             freescale_imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774293  |      
           freescale_imx7dsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774304  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557770136  |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774316  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774320  |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774332  |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774340  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774353  |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774366  |      
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774376  |      
          freescale_t2080_qds_rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774378  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774382  |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774390  |      
          globalscale_espressobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557770521  |      
                 grinn_chiliboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774399  |      
                  grinn_liteboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774422  |      
                 hifive_unleashed | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774496  |      
                         imx23evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774518  |      
                   imx6-sabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774533  |      
                     imx6-sabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774535  |      
                 imx6-sabresd_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557770791  |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774541  |      
                       imx6sx-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557770884  |      
                        imx6ulevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774549  |      
                       imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557770894  |      
                       imx6ulpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774559  |      
                        imx7d-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774576  |      
                        imx7dpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774588  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774591  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774592  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774596  |      
                kontron_bl_imx8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774598  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774601  |      
              kontron_smarc_sal28 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557771003  |      
                          lafrite | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774609  |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557771089  |      
                    licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774616  |      
               linksprite_pcduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557771117  |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774619  |      
                mender_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557771137  | ORPH 
          microchip_sam9x60ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774624  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774630  |      
 microchip_sama5d27_wlsom1_ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774635  |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774642  |      
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774651  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774654  |      
          microchip_sama7g5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774680  |      
      microchip_sama7g5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774684  |      
                  minnowboard_max | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774687  |      
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774697  |      
                          mx51evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774701  |      
                         mx53loco | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774703  |      
                         mx6cubox | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774721  |      
                   mx6sx_udoo_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774733  |      
                          mx6udoo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774735  |      
                      nexbox_a95x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774737  |      
                            nezha | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774745  |      
                      nitrogen6sx | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774751  |      
                       nitrogen6x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774752  |      
                        nitrogen7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774848  |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774863  |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774871  |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774881  |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774887  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774901  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774946  |      
                         odroidc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774949  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774953  |      
        olimex_a10_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774959  |      
             olimex_a13_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774966  |      
        olimex_a20_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774970  |      
       olimex_a20_olinuxino_lime2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557771538  |      
       olimex_a20_olinuxino_micro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774971  |      
             olimex_a33_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774973  |      
             olimex_a64_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774975  |      
          olimex_imx233_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774977  |      
    olimex_stmp157_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774986  |      
                         olpc_xo1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774989  |      
                       olpc_xo175 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557771603  |      
                    openblocks_a6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557774992  |      
                    orangepi_lite | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775012  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775006  |      
                     orangepi_one | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775016  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775017  |      
                      orangepi_pc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775023  |      
                 orangepi_pc_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775031  |      
                      orangepi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557771822  |      
                    orangepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775061  |      
               orangepi_zero_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775091  |      
              orangepi_zero_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775078  |      
                       pandaboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775096  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557771863  |      
                    pc_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775124  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557771866  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775139  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775145  |      
                qemu_aarch64_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557771890  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775150  |      
                qemu_aarch64_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557771917  |      
               qemu_arm_versatile | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775161  |      
                qemu_arm_vexpress | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557771934  |      
             qemu_arm_vexpress_tz | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775170  |      
                qemu_m68k_mcf5208 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775184  |      
                   qemu_m68k_q800 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557771987  |      
            qemu_microblazebe_mmu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775188  |      
            qemu_microblazeel_mmu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775210  |      
              qemu_mips32r2_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775215  |      
            qemu_mips32r2el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775226  |      
              qemu_mips32r6_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775232  |      
            qemu_mips32r6el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775236  |      
                qemu_mips64_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775242  |      
              qemu_mips64el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775254  |      
              qemu_mips64r6_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775260  |      
            qemu_mips64r6el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775286  |      
                 qemu_nios2_10m50 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775289  |      
                        qemu_or1k | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557772294  |      
                 qemu_ppc64_e5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775294  |      
               qemu_ppc64_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775313  |      
            qemu_ppc64le_powernv8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557772339  |      
             qemu_ppc64le_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557772350  |      
                  qemu_ppc_bamboo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775353  |      
                  qemu_ppc_e500mc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557772371  |      
                 qemu_ppc_g3beige | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775357  |      
                   qemu_ppc_mac99 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775361  |      
               qemu_ppc_mpc8544ds | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775364  |      
                qemu_riscv32_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775365  |      
          qemu_riscv64_nommu_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775366  |      
                qemu_riscv64_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557772444  |      
                       qemu_s390x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775372  |      
                     qemu_sh4_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775423  |      
                   qemu_sh4eb_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775439  |      
               qemu_sparc64_sun4u | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775459  |      
                  qemu_sparc_ss10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775460  |      
                         qemu_x86 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775468  |      
                      qemu_x86_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775463  |      
                 qemu_xtensa_lx60 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775510  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775541  |      
                      raspberrypi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775588  | ORPH 
                     raspberrypi0 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557772571  | ORPH 
                    raspberrypi0w | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775561  | ORPH 
                     raspberrypi2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557772582  | ORPH 
                     raspberrypi3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557772609  |      
                  raspberrypi3_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775565  | ORPH 
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775570  | ORPH 
                     raspberrypi4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775574  | ORPH 
                  raspberrypi4_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557772631  | ORPH 
                 raspberrypicm4io | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775591  | ORPH 
              raspberrypicm4io_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557772658  | ORPH 
                raspberrypizero2w | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775595  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775596  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775600  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557772757  |      
                        rockpro64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775613  |      
                      roseapplepi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557772800  |      
                 s6lx9_microboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775662  |      
                       sheevaplug | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557772813  |      
                 sipeed_lichee_rv | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557772819  |      
            sipeed_lichee_rv_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775685  |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775748  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775784  |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775801  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775808  |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775818  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775842  |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557772994  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775920  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775939  |      
              snps_archs38_axs103 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775942  |      
                snps_archs38_haps | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775943  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557773073  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775947  |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775949  |      
          solidrun_clearfog_gt_8k | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775951  |      
            solidrun_macchiatobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557775952  | ORPH 
                    spike_riscv64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557773112  |      
              stm32f429_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557776018  |      
               stm32f469_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557776092  |      
              stm32f469_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557773169  |      
                  stm32mp157a_dk1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557776096  |      
                  stm32mp157c_dk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557773178  |      
              stm32mp157c_odyssey | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557776202  |      
        terasic_de10nano_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557773187  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557776205  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557773202  |      
                           ts5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557776210  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557776233  |      
                         uevm5432 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557773218  |      
                    versal_vck190 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557776266  |      
                       visionfive | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557773235  |      
                      visionfive2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557776280  |      
                        wandboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557776308  |      
                            warp7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557776339  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557776362  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557776367  |      
                      zynq_qmtech | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557776370  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557776373  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557776376  |      
                zynqmp_kria_kv260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557776381  |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557776388  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3557776391  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
