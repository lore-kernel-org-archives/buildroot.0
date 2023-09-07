Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5739DEE14D4
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 05:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7E2360B73;
	Thu,  7 Sep 2023 05:32:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7E2360B73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YKnPRHDr8Zrb; Thu,  7 Sep 2023 05:32:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAF4960E31;
	Thu,  7 Sep 2023 05:32:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAF4960E31
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 624361BF33E
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 05:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B71760E31
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 05:32:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B71760E31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lcTWPo0b5qPx for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 05:32:16 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7886D60B73
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 05:32:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7886D60B73
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9A9FFE000E
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 05:32:12 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 07 Sep 2023 05:32:12 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20230907053217.2B71760E31@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1694064732; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FUGmLCbr3jJ0d0YkekkxGmSE/xgHGFLo5jutV++nIb4=;
 b=lFtu7/Oqq5mQNLnR/hknXpHCv3ZIaSUXLoDVy5hxmMccaTFC/o7/ExI5jB5a7hZWbaL5NO
 tnhGfzpP0i86Q8RG14Mot8jL0VMZTMq+XYKplFu8QkVrAIbbtSLukzJ8fw0uzl3aEwbgp6
 flxtoK4pfWg/i668OE7rMggip7x5Nn9k2Mgp2icQGyDObDELwHH+ztIit5V+aCqMKkAtiY
 Tg98oxFfWYWiHKewmKoEngfXI4sTOb9PnG4t2bjskysS8SLjafYULjuj6OxV7FCw5LfKoo
 XNqqfs0ZbYGpOdSf/T8S/rgBtXNdaDJi6FLINQ7ldRxpdKwj0FGHuPPxi/0UNw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lFtu7/Oq
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-09-06
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

Autobuild statistics for 2023-09-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  8  |  3  |  0  | 11  |
  2023.05.x  |  6  |  8  |  0  | 14  |
    master   | 78  | 51  |  3  | 132 |

Classification of failures by reason for master
-----------------------------------------------

             util-linux-2.39.1 | 5 
                  conmon-2.1.7 | 3 
                elfutils-0.189 | 3 
              host-rust-1.71.1 | 3 
                  linux-6.4.14 | 3 
                       unknown | 3 
                    zeek-4.1.1 | 3 
         gobject-introspection | 2 
              strongswan-5.9.8 | 2 
        util-linux-libs-2.39.1 | 2 
                bpftool-v7.1.0 | 1 
check-11970a7e112dfe243a2e6... | 1 
                  clamav-1.0.3 | 1 
                 coreutils-9.3 | 1 
              e2fsprogs-1.47.0 | 1 
        edk2-edk2-stable202305 | 1 
                 erlang-26.0.2 | 1 
                        ffmpeg | 1 
           ghostscript-10.01.2 | 1 
       host-gcc-initial-12.3.0 | 1 
           janus-gateway-1.1.2 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
                libglvnd-1.4.0 | 1 
            libmemcached-1.1.4 | 1 
                   libnss-3.92 | 1 
                    olsr-0.9.8 | 1 
on2-8170-modules-73b08061d3... | 1 
                oprofile-1.4.0 | 1 
                     pound-4.8 | 1 
                     pv-1.6.20 | 1 
                    qemu-8.0.3 | 1 
            quickjs-2021-03-27 | 1 
             s390-tools-2.27.0 | 1 
                sysrepo-2.2.36 | 1 
               zxing-cpp-2.1.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.net/results/89ebde4506db8bdfec7791007ed9d795e2dbad65 |     
    m68k     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/b0a068b1d3c9ee18ebe2e25c7b8e5cadd6757285 | ORPH
    arm      |          clamav-1.0.3          | NOK | http://autobuild.buildroot.net/results/1451ba03afee45fcf3583fa95ec33c731ff8dcfc |     
   arceb     |          conmon-2.1.7          | NOK | http://autobuild.buildroot.net/results/bab4b94ef8582230a762f3fa4a86c6cb742c389b |     
  aarch64    |          conmon-2.1.7          | NOK | http://autobuild.buildroot.net/results/80dd95f49d729872c5cc9c1aa14a94dd664aed01 |     
  riscv64    |          conmon-2.1.7          | NOK | http://autobuild.buildroot.net/results/dab4baaf6a441094c85bdcf52bd2a2e78dcad612 |     
   sparc     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/21ca5e8bd97cd1b6fa247fc9dd519be020ec5bbf | ORPH
  mips64el   |        e2fsprogs-1.47.0        | NOK | http://autobuild.buildroot.net/results/7ce9aee2c24db550ab429aa155be88fd91fd8c7e | ORPH
    i686     |     edk2-edk2-stable202305     | NOK | http://autobuild.buildroot.net/results/42e1c472b55f39fa6214469e10a47164c5ddefcd |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/00f23d0371f12e630995adc4346bff9e4807a16e | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/e8c60ea1963498b47e69b616cf17331655169d41 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/6ded1eb22b2fd83335a42f85d5e987995d38d975 | ORPH
  riscv64    |         erlang-26.0.2          | NOK | http://autobuild.buildroot.net/results/3b109a5978d0c8d532fd4ccab3d6517caec18b95 |     
    i686     |             ffmpeg             | TIM | http://autobuild.buildroot.net/results/28c7b9ba7a9d7f4a26f0a57b8a934d98aeb0fc90 |     
    i686     |      ghostscript-10.01.2       | NOK | http://autobuild.buildroot.net/results/537ecbfa808e99bf65326047273594f7a1dd3367 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/758642f7cdba5c79f6a9187480fd12351f73772b |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/ecb47100a4e8be28b27e36450871bcd3dd6b39c9 |     
    arm      |    host-gcc-initial-12.3.0     | NOK | http://autobuild.buildroot.net/results/f69357384beea6fae12ada90a1ab951a722e7d70 |     
powerpc64le  |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/c0d46478dcdf4dcb4679d15ec1c90955e76ec046 |     
   mipsel    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/27758b91e2d266b792677ae7df353a26fe91d653 |     
powerpc64le  |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/fd98fde1869a6704c6820c6f9e07115faadf3779 |     
  mips64el   |      janus-gateway-1.1.2       | NOK | http://autobuild.buildroot.net/results/7ab4e6b7574abcc38d0898d6e31674b876f8e6e0 |     
   x86_64    | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/4ba35733e0cc9b4030fc06d6e732a0006954ec0b | ORPH
   arceb     |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/5ad07db8bf535f5a08a9a62704fc2b818289fd08 | ORPH
   mipsel    |       libmemcached-1.1.4       | NOK | http://autobuild.buildroot.net/results/679100f065dffc476559fb04b016602205f63e48 | ORPH
microblazeel |          libnss-3.92           | NOK | http://autobuild.buildroot.net/results/e2e8db79f0cfccd6a01662f1a2d941f48d01213b |     
  riscv32    |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/42ce170c05b45b22ed08de6989c57af8dd9685fb | ORPH
   x86_64    |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/67a9216db1f764ece71a7d0dd4c48f5bbf0310fb | ORPH
powerpc64le  |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/f6fe458e2c585584a1fb5876801807449129663e | ORPH
    arc      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/68897b38b31e62be6a9bbb50af07a1ed0fbe4a7d | ORPH
    arm      | on2-8170-modules-73b08061d3... | NOK | http://autobuild.buildroot.net/results/326580e0df0fd341a1a1c6aab9fe67e1f409d30e | ORPH
   s390x     |         oprofile-1.4.0         | NOK | http://autobuild.buildroot.net/results/40aedf34cde8b44cbecf7569ceb200490329a77a |     
    arm      |           pound-4.8            | NOK | http://autobuild.buildroot.net/results/128940f3efcd37d36b8ddec88169c7bd47dcaac2 | ORPH
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/70323702c92ea0d9ccb22b2530667b880104f595 | ORPH
   mipsel    |           qemu-8.0.3           | NOK | http://autobuild.buildroot.net/results/90a56f330a2cdee252b998cec819604782f91952 |     
  powerpc    |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/e49dcfb4458efee516107b7db745fadfc1b3a80d |     
   s390x     |       s390-tools-2.27.0        | NOK | http://autobuild.buildroot.net/results/f45072589c3926862a2690f1862935efdc613b65 |     
  sparc64    |        strongswan-5.9.8        | NOK | http://autobuild.buildroot.net/results/a20af9fdc5537b68edc2e0e4c7aac351da89a30a |     
 aarch64_be  |        strongswan-5.9.8        | NOK | http://autobuild.buildroot.net/results/bfa2276e09f1dfe5a8315683e4c92402f25d6eda |     
  riscv32    |         sysrepo-2.2.36         | NOK | http://autobuild.buildroot.net/results/ec54b9e69279089437fd0bb3fc1fd793f7eef011 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/15f81d1ddad0f66701b9145bd2a7a42ff38e0ef7 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/66d738737bc72b8666bc613a715022728944adb7 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/16f30c56fbd4c7d3d5545d1520ffa382716ddabd |     
    arm      |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/ab9494bf77ab0fdc471eb0e4419358dd2f504a67 | ORPH
    i586     |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/14514d20ba2bace5f6807d7902aaa30eb0300a69 | ORPH
   x86_64    |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/fdfc14983db000042135443f86965cef043fe3ca | ORPH
    arm      |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/521a064d065ba15b0d42d7b24c991c67743f21f9 | ORPH
powerpc64le  |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/0f696541a168ce1f48a65a2dd62ee8b49ba1115e | ORPH
    arm      |     util-linux-libs-2.39.1     | NOK | http://autobuild.buildroot.net/results/045dccaa5326394abd1cde3c7090d46a1b1fa972 | ORPH
   sparc     |     util-linux-libs-2.39.1     | NOK | http://autobuild.buildroot.net/results/a7daa9b3dfd0d87fae823cb5dba2b00d5de73a39 | ORPH
  aarch64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/aaa66e8b3b556f292564d13a3fcbe158aa15fd2d |     
  riscv64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/6a1857871d76cf79b6a0956cdbee159adb5e7471 |     
microblazeel |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/40cee41d1517d84d8c1ad205a6c2ed73a45bd9fe |     
  riscv64    |        zxing-cpp-2.1.0         | NOK | http://autobuild.buildroot.net/results/3c3165c868380f3698d25203f4520abcf96d3b00 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                  linux-6.1.42 | 2 
                       unknown | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4aeb    |          linux-6.1.42          | NOK | http://autobuild.buildroot.net/results/f54348da465ded03608ddc73c3cd3a5bcc144ec7 | ORPH
 aarch64_be  |          linux-6.1.42          | NOK | http://autobuild.buildroot.net/results/4e845fe9660f23f1463054edd81febe0e426cf42 | ORPH
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/6e4e104ae505038dfc49273ce762fb404228da5a |     


Classification of failures by reason for 2023.05.x
--------------------------------------------------

                 dc3dd-7.2.641 | 1 
             f2fs-tools-1.15.0 | 1 
                   flann-1.9.2 | 1 
google-breakpad-c85eb4a59b6... | 1 
             host-delve-1.20.2 | 1 
               libglib2-2.76.1 | 1 
                  linux-6.3.13 | 1 
pistache-3ec9d7c4f8b828fdd3... | 1 


Detail of failures for 2023.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/2866635a53d3aeec2ada4d7895070ff82bf6a04e | ORPH
    or1k     |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/827be2694b2b02911cdee4307bd9e04f44ffc667 |     
  mips64el   |          flann-1.9.2           | NOK | http://autobuild.buildroot.net/results/e086e8d5512fb701a278a3c0bd1fbf8986b0c7c6 |     
    mips     | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/cc24f4b34344410799b1b7e2ac4cba095bf4f718 |     
  riscv64    |       host-delve-1.20.2        | NOK | http://autobuild.buildroot.net/results/f5942c723d28835c441d1e749762f9255bee5d81 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/0eb31d28573b5d5dffb6c6cea3654ad2945ee239 |     
   sh4aeb    |          linux-6.3.13          | NOK | http://autobuild.buildroot.net/results/26f6ddb375eaba16a5c713877043e4d50f1d9f81 | ORPH
    m68k     | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/f0b1f663e97fadafb2b89e1b387178e83388d6d9 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
