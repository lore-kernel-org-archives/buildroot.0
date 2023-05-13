Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E900CC77B7C
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 05:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5ACA584C89;
	Sat, 13 May 2023 05:32:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5ACA584C89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PriZIVnouaDo; Sat, 13 May 2023 05:32:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C205C84C83;
	Sat, 13 May 2023 05:32:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C205C84C83
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 565461BF616
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 05:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE51784C83
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 05:32:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE51784C83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8MFtFO-HifUt for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 05:32:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77D7284C82
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 77D7284C82
 for <buildroot@buildroot.org>; Sat, 13 May 2023 05:32:20 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 59FFA60004
 for <buildroot@buildroot.org>; Sat, 13 May 2023 05:32:17 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 13 May 2023 05:32:17 -0000
Message-Id: <20230513053222.EE51784C83@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1683955937; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LrgLvNOTGRIK+aIFzjBWmQ/zU1SDUSJG8IxCenxNMPc=;
 b=i0HOXiL+emXdx92lkjWmPwB/Wkb/SUI4HFVgtL222D2SJ00WATJLH2tyB6EAVWIDpz3W4N
 hcUyRYu+4FynMxFWmA666YXiwM03a4GNIapqGiaICdFld8xWZMvidSPJQ/JayZdeRo3FGO
 IwMYrgaNW0zUgKKox2Rdy+IY06lbLQiu1XsMvXtpb24l8Xkcq8Q6h4wq58C6OORnDmOuLn
 BLOCdgWYmSE+EOelsW2+4dkPIWXEfB4gpLx8z2PoRr6IM/QU4RZnf8ckAaHBlu5fxYXZ8l
 gLbTWGcsxGL9YE6GUBofEfuPR+iziV5vJ9UfWl9Kn+tpkdaG6n/16dPnA2ifdg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=i0HOXiL+
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-05-12
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

Autobuild statistics for 2023-05-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  3  |  2  |  0  |  5  |
  2023.02.x  |  4  | 10  |  0  | 14  |
    master   | 88  | 73  |  0  | 161 |

Classification of failures by reason for master
-----------------------------------------------

                 agentpp-4.6.0 | 6 
                elfutils-0.186 | 5 
host-heimdal-f4faaeaba371ff... | 5 
                     audit-3.1 | 3 
               host-qemu-7.2.0 | 3 
                       unknown | 3 
                 coreutils-9.3 | 2 
         host-gcc-final-11.3.0 | 2 
                   linux-6.3.2 | 2 
sconeserver-8d1935919a20133... | 2 
                 uclibc-1.0.43 | 2 
aer-inject-9bd5e2c7886fca72... | 1 
        at91dataflashboot-1.05 | 1 
             containerd-1.6.20 | 1 
          cryptodev-linux-1.12 | 1 
             dahdi-linux-3.2.0 | 1 
        edk2-edk2-stable202208 | 1 
              fluent-bit-2.0.9 | 1 
             fontconfig-2.14.2 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
              fstrcmp-0.7.D001 | 1 
glibc-2.37-2-g9f8513dc64119... | 1 
  gobject-introspection-1.72.0 | 1 
            host-binutils-2.37 | 1 
            host-binutils-2.38 | 1 
         host-gcc-final-12.2.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
                host-go-1.19.9 | 1 
              host-rust-1.68.2 | 1 
              libgcrypt-1.10.1 | 1 
               libglib2-2.76.1 | 1 
                  libjxl-0.8.1 | 1 
          linux-5.10.162-cip24 | 1 
                 mesa3d-23.0.3 | 1 
                    olsr-0.9.8 | 1 
           optee-client-3.21.0 | 1 
                     php-8.2.5 | 1 
                     pv-1.6.20 | 1 
           python-pyicu-2.10.2 | 1 
                python3-3.11.3 | 1 
                  readline-8.2 | 1 
                  reaver-1.6.6 | 1 
                   shadow-4.13 | 1 
               syslog-ng-4.1.1 | 1 
                     vdr-2.6.3 | 1 
wireguard-linux-compat-1.0.... | 1 
                wtfutil-0.41.0 | 1 
                       zip-3.0 | 1 
               zxing-cpp-1.4.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/1d63a087d8b83f2149b00a17fb57f0c50b148a16 | ORPH
  aarch64    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/77d8a723e396d9df01c05b94fc28898107e58379 |     
microblazeel |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/18bc5835640174b3d5b23ebeacef90260bfa01a0 |     
  mips64el   |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/c73cb0929b5ba1f3b24622a9ddf432b62bccdb3c |     
   x86_64    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/18b0223a828c0d236b3ec1dedd1c9bc2d884a1c0 |     
    or1k     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/c725e8b0fab80ca03d935ebacd02fb54678aacaa |     
  aarch64    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/e3e3761e6025080258a7f727382c7d701062199f |     
    arm      |     at91dataflashboot-1.05     | NOK | http://autobuild.buildroot.net/results/5786ff9800c16d820552b69b2e3706387563ff75 | ORPH
  powerpc    |           audit-3.1            | NOK | http://autobuild.buildroot.net/results/507227c98b6c169d348553582b686cf159e040bb |     
   x86_64    |           audit-3.1            | NOK | http://autobuild.buildroot.net/results/3c8a253a173786acce381726080ba8e2cfe691e7 |     
    arm      |           audit-3.1            | NOK | http://autobuild.buildroot.net/results/48c2c8f4103bae86588a45f816402cf81c312850 |     
  aarch64    |       containerd-1.6.20        | NOK | http://autobuild.buildroot.net/results/1c3cd656401b959a16474a8ed866edd7a88ec648 |     
   mipsel    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/317e358dbe1485cfc7a2cbcf875efe4e99327e17 | ORPH
   xtensa    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/0e3e8ce800af6a9059c347efd642da39ef06da7c | ORPH
   x86_64    |      cryptodev-linux-1.12      | NOK | http://autobuild.buildroot.net/results/3325de17e91d465f74564e6921b67b70bde2b961 | ORPH
 aarch64_be  |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/641a71e8af197c03a8c9000b70bffdf5867973b3 |     
    i686     |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/5a65c75b1d263fc66b284b7c58972ee7b44a0f61 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/d93bd0a7856c69cf3b7290896fdd95c8ac11e3de | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/1504c36e9ce075719b58c06789825aa7c2d876c8 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/c384859fda8bb163ee6888dfd35c7cc1d0bb7e05 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/04291b45e6a939ebc73ade4d8b91ac68b753ffc7 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/0b166aba0207d64ed408b97dfe920a1824c27e00 | ORPH
    arc      |        fluent-bit-2.0.9        | NOK | http://autobuild.buildroot.net/results/c1007a50a1e0add691f986771d3269cbc0ed2fe2 |     
  riscv64    |       fontconfig-2.14.2        | NOK | http://autobuild.buildroot.net/results/e02fac319a0f7c32dd9cb5ce3eaa35880d3082e4 | ORPH
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/6021523a90a5ae9a9a06016ca52c4fe15b9adddd |     
 microblaze  |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/0d7c1d33a25a064b8b4139da420a1167bda928e1 |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/ce8bf918948044e2a03e6fe7e2b906bde35ac465 |     
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/bd2ffad5974d422c170e7865c6e74f0878fda54e | ORPH
 microblaze  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/fa1f02c60a1dddc0ce178d492085f09417988432 |     
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/81e1f5915368eef6d58f30e4cb613a8b36259b44 |     
    i586     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/68d2e4347f4bd5b57ecc8b45db1cfd0bb74ea559 |     
   xtensa    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/7a5ef430d3f1df2389325fa10f3d5e21658ba238 |     
  powerpc    |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/911f326d4a869f404a84f620709dfcc81b5b1877 |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/294ea1ce50dbaca25d3f0319ae3c8bec21faba7d | ORPH
   s390x     |         host-go-1.19.9         | NOK | http://autobuild.buildroot.net/results/056ed2ac0e9c56140ad375b197bd40c72ea2e72b |     
   x86_64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/b87b9f4ab91b1730242b4b25d2f4898ba37f7fe6 | ORPH
 powerpc64   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/7f4085962a99767cd558d8a701988a655aad77a1 | ORPH
  aarch64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/bc7e1c374e2aaa5e92a65f005099914f38c79af1 | ORPH
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/0ed0db5848c70888cae4219d18b468df71de99e4 | ORPH
   x86_64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/1a7c79be08ce8673b120be146a9557cd6c81becb | ORPH
 powerpc64   |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/c93be82b6612926b6d10306996c600d55c80e98d |     
powerpc64le  |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/0c872fd8a5fc7b08c6524a60e2d5954066c4582d |     
  sparc64    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/b814e766fbd59a7ae1bb991920d1bd597c74ae49 |     
powerpc64le  |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/e87a1b6d0387af14ef128a5268e9de38119b6186 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/bd60f394854c8bf1110931e1e5e1579f3f431c4d | ORPH
 microblaze  |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/b19ad332988d5d3488a4fe8b3c9cb83a823456d0 |     
  riscv32    |          libjxl-0.8.1          | NOK | http://autobuild.buildroot.net/results/da1fb6383a2d0a6f574280e75cda15d9de376157 |     
  powerpc    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/b059937cfa47fc8d9299631338130bdd323bf0bd | ORPH
powerpc64le  |          linux-6.3.2           | NOK | http://autobuild.buildroot.net/results/d9594f807d39cc417af626f8a44a9a85767d77af | ORPH
   mipsel    |          linux-6.3.2           | NOK | http://autobuild.buildroot.net/results/ff8a86fdf523465ed14327d2be0b7de81bd8eab3 | ORPH
    arm      |         mesa3d-23.0.3          | NOK | http://autobuild.buildroot.net/results/4566a80f2ca65656b77c298834a4060e86a465c3 |     
   s390x     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/554f4807afbbdcfa3703f74fd38a85d52968c408 | ORPH
    m68k     |      optee-client-3.21.0       | NOK | http://autobuild.buildroot.net/results/4ad24fa8099cf251a018168f620497da17940ad6 |     
    arm      |           php-8.2.5            | NOK | http://autobuild.buildroot.net/results/414e3aa31ac00a3d8fca220736a9f9422ffe7c0f |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/59622451bf4687c391bf0c32f4baeebed1a07466 | ORPH
   nios2     |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/e42b3549935365fdd45f43f3d8bba4735815e73d |     
   x86_64    |         python3-3.11.3         | NOK | http://autobuild.buildroot.net/results/a9884e1dc07610f1309f0e342bc4bf847c30ed10 |     
  powerpc    |          readline-8.2          | NOK | http://autobuild.buildroot.net/results/d322b571671eebaacb44c2dbb0e8561cbc6049fb | ORPH
   arceb     |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/35170fbc1b43aac8b6a3ca90e12dc0c9e6fcc6ee |     
   mipsel    | sconeserver-8d1935919a20133... | NOK | http://autobuild.buildroot.net/results/ca11c09c913ef10430426e74c2919a96ef6b1e7f |     
microblazeel | sconeserver-8d1935919a20133... | NOK | http://autobuild.buildroot.net/results/fa485208d47fcb68fe29ae6f77d2387ee51c1207 |     
 powerpc64   |          shadow-4.13           | NOK | http://autobuild.buildroot.net/results/cc93cc81fc1bad4801e045f49025dfa7364b1e61 |     
   mipsel    |        syslog-ng-4.1.1         | NOK | http://autobuild.buildroot.net/results/7fd2b0276d4be29607371a4ff0e5871a3de39f3d |     
  powerpc    |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/c246d46c878b8a08491b41b8d11398cb5332334d |     
  riscv64    |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/77c4f4b905e6d688e2e29ff365a1824ff9a68d8a |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/1ac3b6b3a09d00196ba3c8b0c6dfaeebf7049466 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/f6e50d11349a4bdcd23dbb29973c80d53781786e |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/70d20a5ce9dc60226185cf381e7ca89b2c720311 |     
    m68k     |           vdr-2.6.3            | NOK | http://autobuild.buildroot.net/results/cdd2ca497b4f1c0c27a167e8c1e1f9ab4a5cb3b9 |     
 aarch64_be  | wireguard-linux-compat-1.0.... | NOK | http://autobuild.buildroot.net/results/2fb4ebd086c01003eae63cb4246fa9e00d44b772 |     
   s390x     |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/ef5004a3d42d9f14f9316f79d9ba9d4dd367f72f |     
    arm      |            zip-3.0             | NOK | http://autobuild.buildroot.net/results/3165c1a3e5d4438462cbd92847bcc13aa07f67d1 |     
 aarch64_be  |        zxing-cpp-1.4.0         | NOK | http://autobuild.buildroot.net/results/69202fcaf6624393df0ad409cd91dfd55e8f2f06 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

               host-go-1.18.10 | 1 
            igd2-for-linux-2.1 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        host-go-1.18.10         | NOK | http://autobuild.buildroot.net/results/6100880b95774cf21ee91f526bfc3aeb4d91887e |     
    mips     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/a32d0f966851c79f247a42f3cd3018850c414bf5 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

               host-qemu-7.2.0 | 2 
                       unknown | 2 
                 agentpp-4.6.0 | 1 
azure-iot-sdk-c-LTS_07_2022... | 1 
                     gmp-6.2.1 | 1 
                host-go-1.19.9 | 1 
sox-7524160b29a476f7e87bc14... | 1 
                speechd-0.11.4 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/dc70711fbec67269ca6d994959f055db78d12f8b |     
    arm      | azure-iot-sdk-c-LTS_07_2022... | NOK | http://autobuild.buildroot.net/results/581729f773e1d0ec163e85ec13b498adf54cc81a |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/b2c555785d4fe7b3499e7ada8a87952f071a1206 | ORPH
    arm      |         host-go-1.19.9         | NOK | http://autobuild.buildroot.net/results/3f30b932e79f47a48fcce3579e906e8ab64917a6 |     
    mips     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/e19db11e48776cfc2448eb400abbe447e1cde4ff |     
   nios2     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/71484bc1c3f29efab1e091dc49fbd39ac87e704a |     
  powerpc    | sox-7524160b29a476f7e87bc14... | NOK | http://autobuild.buildroot.net/results/bc6245af78fee05a57c56bd77bdddd93c789f465 | ORPH
   sparc     |         speechd-0.11.4         | NOK | http://autobuild.buildroot.net/results/ebb2a73c914b783bfe7b15d1201859675331a086 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/949ccaee998f045246a045ed9aa598264ed29adf |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/e6f3dda8cd39823afd66d158d8a0bd82a97a1887 |     


Gitlab CI results for 2023-05-12
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
           atmel_sama5d4_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264906836  |      
                       beaglebone | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264906854  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264906856  |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264906865  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264906877  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264906909  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264906940  |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264906942  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264906944  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264906952  |      
                 grinn_chiliboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264906969  |      
                 hifive_unleashed | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264906977  |      
                 imx6-sabresd_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264906984  |      
                         mx53loco | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907105  |      
                      nitrogen6sx | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907114  |      
                       nitrogen6x | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907117  |      
                        nitrogen7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907118  |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907120  |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907123  |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907124  |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907125  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907173  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907191  |      
                    pc_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907193  |      
                qemu_m68k_mcf5208 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907221  |      
            qemu_microblazebe_mmu | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907225  |      
            qemu_microblazeel_mmu | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907226  |      
                 qemu_nios2_10m50 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907242  |      
                        qemu_or1k | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907243  |      
                 qemu_ppc64_e5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907244  |      
                  qemu_ppc_bamboo | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907248  |      
               qemu_ppc_mpc8544ds | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907252  |      
                       qemu_s390x | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907257  |      
                 qemu_xtensa_lx60 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907277  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907278  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907284  | ORPH 
                 s6lx9_microboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907305  |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907311  |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907315  |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907317  |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907320  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907322  |      
              snps_archs38_axs103 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907323  |      
                snps_archs38_haps | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907324  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907327  |      
              stm32f429_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907337  |      
              stm32f469_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907340  |      
                  stm32mp157a_dk1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907342  |      
                  stm32mp157c_dk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907343  |      
              stm32mp157c_odyssey | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907344  |      
        terasic_de10nano_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907345  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907346  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907347  |      
                           ts5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907349  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907351  |      
                         uevm5432 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907352  |      
                    versal_vck190 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907355  |      
                       visionfive | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907358  |      
                      visionfive2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907357  |      
                        wandboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907362  |      
                            warp7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907367  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907369  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907372  |      
                      zynq_qmtech | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907375  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907377  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907380  |      
                zynqmp_kria_kv260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907383  |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907385  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4264907388  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
