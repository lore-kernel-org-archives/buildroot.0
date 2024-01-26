Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88D5C47DDB
	for <buildroot@archiver.kernel.org>; Fri, 26 Jan 2024 07:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20C6B42CB9;
	Fri, 26 Jan 2024 07:06:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20C6B42CB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id igrG67J_Zm7F; Fri, 26 Jan 2024 07:06:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF28742CBD;
	Fri, 26 Jan 2024 07:06:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF28742CBD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 977711BF2B4
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 07:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CFD184F04
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 07:06:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CFD184F04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w_vOLTvujTT3 for <buildroot@lists.busybox.net>;
 Fri, 26 Jan 2024 07:06:53 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B48884EFF
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 07:06:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B48884EFF
Received: by mail.gandi.net (Postfix) with ESMTPSA id 822984000F
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 07:06:49 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 26 Jan 2024 07:06:49 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20240126070654.7CFD184F04@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1706252809; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=r5FbWIDGmiNgkuDnV7sSQK8qllofnlxGlSQzyNyJMew=;
 b=ideowkFnTJI4hP8YJVZtk0Ux4U6Zq078raOY/PZ283cXnbu6hPEMZ5HyR/UwBJSUZVsPSL
 ZhWBatyqlJ0H7BJC+1KAlYzWDu9vxiWuKkIZkTP9prWFMf2JBzPBWw08jVGin6Jf+y1hd3
 2nm5MhzXFnb1OY1khOEXkj4Grg6RvljF7HypZHPMVSAeoz+L4/cky3ZPLLPWMFzXZ2rU1C
 5Qiw558IPekRZyBnRVyQzbl03RRPF4hgucR0z6bmLtr9/NxPdwad84gR30tuNkcKqwqPqO
 Hrl2r1/tktEt5Q/kHBOZqQuY+PwkW7usGSs4ljq9oxypP5Ik5c8XAIOnHOFyNw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ideowkFn
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-01-25
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

Autobuild statistics for 2024-01-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  4  |  3  |  0  |  7  |
  2023.11.x  |  1  |  7  |  0  |  8  |
    master   | 42  | 58  |  0  | 100 |

Classification of failures by reason for master
-----------------------------------------------

                libressl-3.8.2 | 4 
  gobject-introspection-1.76.1 | 3 
              host-rust-1.74.1 | 3 
                  linux-6.6.11 | 3 
                 openssh-9.6p1 | 3 
                elfutils-0.189 | 2 
        host-sentry-cli-2.20.3 | 2 
              host-uuu-1.5.141 | 2 
               ipmitool-1_8_19 | 2 
                memtest86-6.20 | 2 
                    proj-9.3.0 | 2 
           python-numpy-1.25.0 | 2 
                  stunnel-5.71 | 2 
                 sudo-1.9.15p5 | 2 
                    attr-2.5.2 | 1 
                   botan-3.2.0 | 1 
check-11970a7e112dfe243a2e6... | 1 
                 coreutils-9.3 | 1 
             dahdi-linux-3.3.0 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                    dust-0.9.0 | 1 
        edk2-edk2-stable202308 | 1 
              fluent-bit-2.1.7 | 1 
              libarchive-3.7.2 | 1 
               libglib2-2.76.1 | 1 
                libglvnd-1.4.0 | 1 
                  liburing-2.5 | 1 
                   linux-tools | 1 
        ltp-testsuite-20230929 | 1 
               lynx-2.8.9rel.1 | 1 
    python-cryptography-39.0.2 | 1 
   python-pydantic-core-2.14.5 | 1 
                    qemu-8.1.1 | 1 
                 samba4-4.19.3 | 1 
               tcf-agent-1.8.0 | 1 
uclibc-ng-test-0f303c63fab7... | 1 
                       unknown | 1 
             util-linux-2.39.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/372206b9985ba3c2e49a7c27c2ee823e965278c6 |     
   sparc     |          botan-3.2.0           | NOK | http://autobuild.buildroot.net/results/ae007c509479518dae79d87a54e6ac56d754b0cf | ORPH
 aarch64_be  | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/536e8a5b7f6b5a02bb69f299f66932f4339ffa57 | ORPH
   arceb     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/7fbd9b4f35b5b98603d7ae1669c31c7b4f988953 | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | http://autobuild.buildroot.net/results/1626cb235e8a272b5c4cf695b2838f1dec2ebb9b |     
    or1k     |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/f98f0a32be9de3cb2b5d5ddfb638ad5bc7844351 | ORPH
  powerpc    |           dust-0.9.0           | NOK | http://autobuild.buildroot.net/results/f75ebd0821b7395ebbf16774260ee24cb1510d6c | ORPH
   x86_64    |     edk2-edk2-stable202308     | NOK | http://autobuild.buildroot.net/results/66fb631bd5aeb85d3295a852c2686acb394f0708 |     
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/f6ddca0d0b9a4b5df4a876a1407848a341e8ca64 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/2323e6ac224068edbac05d4527af6babbc6598c0 | ORPH
   nios2     |        fluent-bit-2.1.7        | NOK | http://autobuild.buildroot.net/results/3c58ff2cf167beea727c30da8baf6b03a1ce8183 |     
   mipsel    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/7befa6b40359dbc18b3dbd6aab1a7aa2cf4bbc17 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/4641263ac0f746ae1a096085346836d8a2da1e93 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/a9bcece3487e56320030fda6d6d86c63122759cd | ORPH
  aarch64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/22dcd723ab3f68708e356b92f0d8ead64bf8f7f2 |     
  sparc64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/88a5bbf3e4db9ecae1d60c036da2ff8a2a794c10 |     
  powerpc    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/d8f5cc437f9009d69bb3658e4084c816b87d3442 |     
  mips64el   |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/9cafcfe8dce97aabbb478e4558f86e0edd45fef7 |     
 aarch64_be  |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/8a791bd574166f45e342f57a0be64ecb7e7d7acd |     
   mips64    |        host-uuu-1.5.141        | NOK | http://autobuild.buildroot.net/results/94b9818d020bade51737a395a0dfde5d1ea92f81 |     
   armeb     |        host-uuu-1.5.141        | NOK | http://autobuild.buildroot.net/results/558d7649ebaf7bfef917855de261b8a4b6861577 |     
   s390x     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/ecccd651498e6418c0ad78110bdf4bf48b17c125 |     
    mips     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/ba4e63dceaf011d1b13555a4f38eb2d4ce8bdd67 |     
 powerpc64   |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/9c7885f539bf8e49b5159627f8c38c6729424fc7 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/903c05bc0e8e00d12b538088a661843eb0f17316 |     
    or1k     |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/57c559bbc8045bc462610d2d3497581521ec3127 | ORPH
 microblaze  |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/9d24ef8b7c710178f5facea0d7911925072b603d | ORPH
   mipsel    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/b873e4a6f700f4816782f5c449ee286339a9d9a0 | ORPH
   mips64    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/18f765c12c590132d07a6f1229835508496ddb5f | ORPH
   mipsel    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/59c60d7625bf1951cd97040fa89307b98e7adca5 | ORPH
  aarch64    |          liburing-2.5          | NOK | http://autobuild.buildroot.net/results/317c6fcf801ca1320fa1fac45b1a4980404ef6fd |     
 microblaze  |          linux-6.6.11          | NOK | http://autobuild.buildroot.net/results/19236d115eac8355e5954bb6e0b9d33d4abcb101 | ORPH
   mips64    |          linux-6.6.11          | NOK | http://autobuild.buildroot.net/results/2905c7cdf92891e19df355a3398460d60c7ed06d | ORPH
   nios2     |          linux-6.6.11          | NOK | http://autobuild.buildroot.net/results/5d1470f785a0f36a8d0d0b0b2d8e71a21c5545a4 | ORPH
  aarch64    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/aa650d26c3dc11976841af76632b00401953221a | ORPH
   x86_64    |     ltp-testsuite-20230929     | NOK | http://autobuild.buildroot.net/results/76b60815ee4b1bf5bfdc2e8787675f54163ec4b6 |     
 microblaze  |        lynx-2.8.9rel.1         | NOK | http://autobuild.buildroot.net/results/ede095dc9d9cec7dca5e857088284fa92671cab1 |     
    i686     |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/a223d79dcf4f62b0d402f73ed6876515e760e0a4 |     
   x86_64    |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/4987b7215fbbaeb1cab24713021dbb3f0ae42af9 |     
powerpc64le  |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/63fc5e3c0209ddf8014ce1b3e642bd185f4ee8a1 | ORPH
    mips     |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/b5840a4c333232ce386e2b74056d6595cae20490 | ORPH
   mips64    |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/133c4eeb7b2c4e7b2cbb725427a75714ec86e75b | ORPH
  mips64el   |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/e03527e0f6aad9f2051b49bb29fb46e17c71b8b4 |     
  sparc64    |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/cf4866d528639448a9f6b462f47bdf2d8c7c406e |     
  sparc64    |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/6798756727dc889f438979c3b393948fab2b17aa |     
    sh4      |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/532c612262fa1508c8aa87289920aef55ba6f9c4 |     
   x86_64    |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/1f6eb8ec8573d49922ece31d02b45d2d60264847 |     
  powerpc    |  python-pydantic-core-2.14.5   | NOK | http://autobuild.buildroot.net/results/76cb35a076cd375dcab5f828a3fa856ac52ec573 |     
    mips     |           qemu-8.1.1           | NOK | http://autobuild.buildroot.net/results/8d7b6fb7c7f267ba1cebf465447c332de20f598f |     
microblazeel |         samba4-4.19.3          | NOK | http://autobuild.buildroot.net/results/b371c9b5053774f2cca19b1e43f041a46a955219 |     
   x86_64    |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/b22488f080cee599ac25880126518ba9a03d7add |     
   arceb     |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/0ced720b8a4dc66ca6de34811f327741612bbad5 |     
   mipsel    |         sudo-1.9.15p5          | NOK | http://autobuild.buildroot.net/results/73f7b07d8bb9033566f2f6291b9de48272025c9d | ORPH
    arm      |         sudo-1.9.15p5          | NOK | http://autobuild.buildroot.net/results/bff7f6a36a75d68c3035dd61f5b274555f7e4031 | ORPH
powerpc64le  |        tcf-agent-1.8.0         | NOK | http://autobuild.buildroot.net/results/e193cc7f513eca2fb831658232f0cbe2286d5145 |     
   mipsel    | uclibc-ng-test-0f303c63fab7... | NOK | http://autobuild.buildroot.net/results/fef4d8d3b855c236cd988def1b0f6d9f8813b50f |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/7970b85f4b18b82662da73d40221bdcdd456bb38 |     
    arc      |       util-linux-2.39.2        | NOK | http://autobuild.buildroot.net/results/3d37a9279ecfb9f7b245b478e52d41f081b5f4b5 | ORPH


Classification of failures by reason for 2023.02.x
--------------------------------------------------

               gupnp-av-0.14.0 | 2 
                       unknown | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        gupnp-av-0.14.0         | NOK | http://autobuild.buildroot.net/results/befab36faa390c1f1aa18eb3917b88a97293f476 |     
  powerpc    |        gupnp-av-0.14.0         | NOK | http://autobuild.buildroot.net/results/b083caa0ea32f2a3c244eae4cdef0355cb53a632 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/ca22ff7fc181ede98efc38ad751db7f95d07416a |     


Classification of failures by reason for 2023.11.x
--------------------------------------------------

                elfutils-0.189 | 2 
              host-rust-1.71.1 | 2 
        host-sentry-cli-2.20.3 | 1 
                libressl-3.8.2 | 1 
               libunwind-1.6.2 | 1 


Detail of failures for 2023.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/ea8eb3f4d394a11639b12e7109bcea190210b6e0 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/4d70e97d5cce0d038b9299f8bf26940d926bcb71 | ORPH
powerpc64le  |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/ae465e0ba902891e1adc0f5b184f09c4ab50d5a0 |     
   mips64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/b2615e499eb27a734ded4c9645f7b90650f39683 |     
   mipsel    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/b13d56dbc31690e832a743358ec4ce57d85f2724 |     
    sh4      |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/f89e99c15477e27d4ff74b6c0b4f2317f52cccf1 | ORPH
    m68k     |        libunwind-1.6.2         | NOK | http://autobuild.buildroot.net/results/26b5230e658a92b93f737a03f33de426c75291ec | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
