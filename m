Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B5EEC47422
	for <buildroot@archiver.kernel.org>; Sun, 21 Jan 2024 06:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE7E540122;
	Sun, 21 Jan 2024 06:41:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE7E540122
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XuEmsjoPMM5E; Sun, 21 Jan 2024 06:41:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78E6240280;
	Sun, 21 Jan 2024 06:41:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78E6240280
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D5F4E1BF860
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 06:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76B5140280
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 06:41:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76B5140280
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fS_BhJRw43DD for <buildroot@lists.busybox.net>;
 Sun, 21 Jan 2024 06:41:21 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE20540122
 for <buildroot@buildroot.org>; Sun, 21 Jan 2024 06:41:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE20540122
Received: by mail.gandi.net (Postfix) with ESMTPSA id F213540004
 for <buildroot@buildroot.org>; Sun, 21 Jan 2024 06:41:17 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 21 Jan 2024 06:41:17 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20240121064123.76B5140280@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1705819278; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RdgfQ2DSWHM3xKifWWeX4NM/D0PUTcb51xIKmyTHLEw=;
 b=Jz46dgbzWUOsVj4NKVafZOEtFBmEwxgopz2pDr5bVC/W93TnUlWO1AnKWmNYKEFuuaPbVs
 unjzX8UZssMPmkJQ/cLT/yYfgQBNckrM2EQLu4vtwlzO3E3m7pHu/IxP5sTsKs6OVtdqoJ
 LZCZfeSyByDYLxLuZ+Ie9qT2gVVFd7eIjGn1Cb6wdFpZpqXYKNFHFlvSh2brXPgy/UVdiQ
 ueWesOnWOQAyjwz7ZaTLghm2VPzjuKCnXLVOgLH+rMSTfjeHGWilM3RD+BaYtpNzW3iC+5
 dr/mfTH+BUmQiyhfsqATXfziNzH+94rDnweAEJalwa2eQ0CHa4zWeAUycRaZiQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Jz46dgbz
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-01-20
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

Autobuild statistics for 2024-01-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  1  |  2  |  0  |  3  |
  2023.11.x  |  4  |  4  |  0  |  8  |
    master   | 47  | 52  |  0  | 99  |

Classification of failures by reason for master
-----------------------------------------------

                elfutils-0.189 | 5 
                libressl-3.8.2 | 5 
              libarchive-3.7.2 | 4 
  gobject-introspection-1.76.1 | 3 
                    attr-2.5.2 | 2 
cegui-00b4e1fe174da53b7ed72... | 2 
glibc-2.38-27-g750a45a78390... | 2 
              host-rust-1.74.1 | 2 
              libopenssl-3.2.0 | 2 
                  linux-6.6.11 | 2 
 Makefile:727: target-finalize | 2 
                  stunnel-5.71 | 2 
                 sudo-1.9.15p5 | 2 
                  acpid-2.0.34 | 1 
  binutils-arc-2023.09-release | 1 
          chocolate-doom-3.0.1 | 1 
        edk2-edk2-stable202308 | 1 
                   foot-1.16.2 | 1 
       host-gcc-initial-12.3.0 | 1 
               ipmitool-1_8_19 | 1 
               libglib2-2.76.1 | 1 
                  libnfc-1.8.0 | 1 
       libzenoh-pico-0.10.1-rc | 1 
     linux-5.10.162-cip24-rt10 | 1 
                   linux-tools | 1 
                    ngrep-1.47 | 1 
                 openssh-9.6p1 | 1 
           python-numpy-1.25.0 | 1 
             sofia-sip-1.13.17 | 1 
                   zlog-1.2.17 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/ae6dd2dd94fe41a47c93d1ad8dcecae45fc6a6b0 | ORPH
 microblaze  |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/c4819fffec09ba4cc1d0e7846e8b4aa61466f477 |     
microblazeel |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/aff02f36f090152d6b45f30a873f9739e9fc38ea |     
    arc      |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.net/results/3b0659adfc07d963a790584c74e99b64e89d5082 |     
  sparc64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/e1a85b8e988be7cd69ec9cd1f3f15e08e51e5045 |     
   nios2     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/06f6d25eb50fb1055219639846719f8b73016dd2 |     
    sh4      |      chocolate-doom-3.0.1      | NOK | http://autobuild.buildroot.net/results/e6f61d2816593b88ff7babdd723c0faf46400ec6 |     
   x86_64    |     edk2-edk2-stable202308     | NOK | http://autobuild.buildroot.net/results/fa8c5977db43f3e6e284e2447f9acd58d3719c2b |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/1148c805751bf04a76f6819dcb42132095f8024c | ORPH
   sh4eb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/cf1e94456d7a996711a6b358f4c1bb366f0f1317 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/82e0ffcd5ee9817f6db57d35f6c73a4260c35160 | ORPH
   arceb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/29968062547585a3882e401f460d237d845b8eff | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/ddca0fcf9e3eed9b7c41df6ad3429b5f256c616b | ORPH
   armeb     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/d4b90a505a035d9bab400ed65f94571854f74f24 |     
powerpc64le  | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/52dc86a4fb68ddce500258e1b4cb182dc44f760d |     
 powerpc64   | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/d0407539795f35c6ed28d4b52f1896e2a7c0d758 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/2e408db1e166f06f691aeecbacf5d794400cd004 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/95cf8a9d5c2d04f53bdefe1f484c862660c60b86 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/729fe0c2da12b6393faa00d69db7900d49ba576e | ORPH
    arm      |    host-gcc-initial-12.3.0     | NOK | http://autobuild.buildroot.net/results/e2876ea449c5c264d26029faee61b7e2af7ec7e1 |     
 powerpc64   |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/e5188e288363b177d374d08d5afa335078a360e8 |     
powerpc64le  |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/c31f3ea322f1d0b463b8882a46de7e81a1a02c45 |     
 aarch64_be  |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/70aac47cd8f05eef17f75178ecd953010c85bff1 |     
  sparc64    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/4bd992bbf6a9e098fa32b7cd7da44af25fe83f7c |     
    arm      |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/b43090f05429bddb1054829e7e0c77df7cb1abab |     
powerpc64le  |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/ca4db73132809e7e6a06acb3af094937ff083944 |     
  powerpc    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/f7660702793b03bdd14d44558de0adab1280c9bd |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/25a0c668e2a0e46e0a1a0ade8d4f878fa2f22bac |     
    or1k     |          libnfc-1.8.0          | NOK | http://autobuild.buildroot.net/results/cc40e70446fab97cf143ea24f2726dc5734f5832 |     
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/0b31afe92969eecb693667fac26ae10c62d2b2ee | ORPH
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/3d24ef8205f64c8876075c767e29e6e07734323c | ORPH
    arc      |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/df9aa08556f90202f23d04ee8446d81bdafd74d1 | ORPH
   mipsel    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/961c02d5631bf1d4bdbad58397a945ebf9aee073 | ORPH
   arceb     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/a748c9dff47481e633a9a9071645fef5eac2358a | ORPH
   s390x     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/c4592eecded1437f2179d7e1e7b8b0d0754a8d0a | ORPH
    arc      |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/71b26805ef029666a01a63843d1670995f04a6ac | ORPH
    or1k     |    libzenoh-pico-0.10.1-rc     | NOK | http://autobuild.buildroot.net/results/639adad9e5da4a137bc4e49d8e0fc885b4c75879 |     
   x86_64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/7019eda84383091c50356cd886cc563ba7be24b3 | ORPH
   nios2     |          linux-6.6.11          | NOK | http://autobuild.buildroot.net/results/1d7796407e85c37f2642842b458d6a4d93816093 | ORPH
    sh4a     |          linux-6.6.11          | NOK | http://autobuild.buildroot.net/results/9f775def06331bef972a4c506221734a2ed46c72 | ORPH
    or1k     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/aae996388ab5aff05b6124eb55ad0304369f735d | ORPH
 powerpc64   | Makefile:727: target-finalize  | NOK | http://autobuild.buildroot.net/results/4b0bbed4034a2abcf9a96475698ef55190dd5db4 |     
  mips64el   | Makefile:727: target-finalize  | NOK | http://autobuild.buildroot.net/results/fe8788a3a915c69d8ad3cbbc23a319f2d7455bf8 |     
powerpc64le  |           ngrep-1.47           | NOK | http://autobuild.buildroot.net/results/76eed0813e67d3a2e9e120e826f23fe95578a75c |     
powerpc64le  |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/1366536596072fe8bb8b60935b39927bf117e612 | ORPH
   x86_64    |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/a74af621308ab7a4f474d2ee317677828567f710 |     
    arm      |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/d77e1790121fc168d115e9d27b7d0859471a79fb |     
 aarch64_be  |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/8cbe7aa5bc584db4f478e75887fb8403ff4a179a |     
   armeb     |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/d84c72f818c4a39b7b1891a2de107e384041bebf |     
    i586     |         sudo-1.9.15p5          | NOK | http://autobuild.buildroot.net/results/e831aaef93337acbd8f7cd695e52d59d1a33505c | ORPH
   armeb     |         sudo-1.9.15p5          | NOK | http://autobuild.buildroot.net/results/27ddb9d49d5b020b156ac0a75f275030c5b09c6f | ORPH
powerpc64le  |          zlog-1.2.17           | NOK | http://autobuild.buildroot.net/results/21e9212dbb3d77108b45f755890a8e66b23d2407 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                elfutils-0.186 | 1 
                  linux-6.1.72 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/fcba76a3bf7eb6b4dac3241ab80f463f6c4bdcd0 | ORPH
   arceb     |          linux-6.1.72          | NOK | http://autobuild.buildroot.net/results/1251afc349425e317b830c92a2ce987c845edfb7 | ORPH


Classification of failures by reason for 2023.11.x
--------------------------------------------------

glibc-2.38-27-g750a45a78390... | 1 
            micropython-1.22.0 | 1 
                 openssh-9.6p1 | 1 
                       unknown | 1 


Detail of failures for 2023.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/dff52ad778b932deb2786281e37d12b580b21ce0 |     
   nios2     |       micropython-1.22.0       | NOK | http://autobuild.buildroot.net/results/b8ce7f2baf8cc9d456c670d181191c278c93363e |     
   mips64    |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/12763493879164ba3dcab291184cac4a2d35ee6e | ORPH
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/8d518f354475aa5ecbe8ff85ba938a20dc187fb6 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
