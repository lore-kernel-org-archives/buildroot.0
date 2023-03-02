Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36CA4C678D4
	for <buildroot@archiver.kernel.org>; Thu,  2 Mar 2023 07:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78F5260FEF;
	Thu,  2 Mar 2023 07:48:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78F5260FEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2FtLs2ucR29n; Thu,  2 Mar 2023 07:48:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAB826102E;
	Thu,  2 Mar 2023 07:48:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAB826102E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DEA561BF577
 for <buildroot@lists.busybox.net>; Thu,  2 Mar 2023 07:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9644940AB9
 for <buildroot@lists.busybox.net>; Thu,  2 Mar 2023 07:48:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9644940AB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Horz3fvI-mUR for <buildroot@lists.busybox.net>;
 Thu,  2 Mar 2023 07:48:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB1BA4013C
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB1BA4013C
 for <buildroot@buildroot.org>; Thu,  2 Mar 2023 07:48:38 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4FDBE6000F
 for <buildroot@buildroot.org>; Thu,  2 Mar 2023 07:48:35 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 02 Mar 2023 07:48:35 -0000
Message-Id: <20230302074841.9644940AB9@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1677743315; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rlhiUzgRgrG9MZmgmSyMmzF5WsUjHFuauimQKjlg6P8=;
 b=RTlra3suVCHL+66XxDihFRh0/eCRwu1pmzOpECiQTtCGeocHoSWKS9NH4Y1gL++UJtNgfW
 FMiYtAy9NUgbLj6hN9FShtGBNWwxY+RvnsnCY4sJEGuso5DGdI9r5SJCNnJKJ8XLz5rklT
 32N1mk9witUo3i0k1404kBmN/2ycfKYkMQlHez+yywM6pVXl/qXAxjHN/2Dr26Dndfw/o2
 Prtosi4MkBEi8KkUFofjGb8TBojav2/wr26u0Lfo3tCXm5NgsNdF9ESUZ0oYHhVSyEFk9c
 +PEefgL0cbPFq2DZvbzFYbjX+tSxxPzWC9nmuWzz7nyItRS1Shvvg4EkTOJ6zA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RTlra3su
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-03-01
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

Autobuild statistics for 2023-03-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.11.x  | 14  |  9  |  0  | 23  |
    master   | 174 | 121 |  1  | 296 |
     next    | 17  | 25  |  0  | 42  |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.72.0 | 5 
                host-go-1.19.6 | 5 
              host-rust-1.67.0 | 5 
                  linux-6.1.14 | 5 
            host-binutils-2.38 | 4 
              host-pahole-1.24 | 4 
            host-binutils-2.39 | 3 
                       unknown | 3 
                    brltty-6.5 | 2 
                busybox-1.36.0 | 2 
             containerd-1.6.16 | 2 
                elfutils-0.186 | 2 
             fontconfig-2.13.1 | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
                     gmp-6.2.1 | 2 
                 haproxy-2.6.9 | 2 
host-gdb-arc-2020.09-releas... | 2 
              libgcrypt-1.10.1 | 2 
                    olsr-0.9.8 | 2 
                   perl-5.36.0 | 2 
                 uclibc-1.0.42 | 2 
ulog-0389d243352255f6182326... | 2 
uqmi-0a19b5b77140465c29e2af... | 2 
android-tools-4.2.2+git2013... | 1 
                    attr-2.5.1 | 1 
             batman-adv-2022.3 | 1 
  binutils-arc-2020.09-release | 1 
                  boost-1.80.0 | 1 
                  botan-2.19.3 | 1 
                 coreutils-9.1 | 1 
                  delve-1.20.0 | 1 
              erlang-22.3.4.22 | 1 
                 fdk-aac-2.0.2 | 1 
                     file-5.43 | 1 
fs/axfs/axfs.mk:32: /home/a... | 1 
fs/cloop/cloop.mk:33: /home... | 1 
fs/cpio/cpio.mk:128: /tmp/i... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /tm... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                  gensio-2.5.5 | 1 
                gerbera-1.10.0 | 1 
         gobject-introspection | 1 
google-breakpad-c85eb4a59b6... | 1 
              gr-osmosdr-0.2.4 | 1 
                 hddtemp-0.4.3 | 1 
                 highway-1.0.2 | 1 
               host-runc-1.1.4 | 1 
                       kmod-30 | 1 
                    lcms2-2.14 | 1 
               libglib2-2.72.3 | 1 
                libglvnd-1.4.0 | 1 
             libgpg-error-1.46 | 1 
               libsigsegv-2.14 | 1 
              libudfread-1.1.2 | 1 
               lighttpd-1.4.69 | 1 
               linux-pam-1.5.2 | 1 
                   linux-tools | 1 
        ltp-testsuite-20220930 | 1 
               mariadb-10.3.36 | 1 
                  mender-3.4.0 | 1 
                 mesa3d-22.3.4 | 1 
              mosquitto-2.0.15 | 1 
       network-manager-1.40.10 | 1 
                  ntp-4.2.8p15 | 1 
              openjdk-17.0.2+8 | 1 
           optee-client-3.19.0 | 1 
                     php-8.2.3 | 1 
                    qemu-7.2.0 | 1 
            quickjs-2021-03-27 | 1 
                  reaver-1.6.6 | 1 
rtl8821cu-86cc5ceb7c28b9b99... | 1 
                speechd-0.11.4 | 1 
                 systemd-252.4 | 1 
toolchain-external-codescap... | 1 
toolchain-external-codescap... | 1 
              traceroute-2.1.0 | 1 
               valgrind-3.19.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/44af9f00bf27a57917dac128f7558b40f5821f2d |     
   mips64    |           attr-2.5.1           | NOK | http://autobuild.buildroot.net/results/b32095faacfcc2687eb179f0734b62d26bf47223 |     
   mipsel    |       batman-adv-2022.3        | NOK | http://autobuild.buildroot.net/results/47684f02f15a52d79232359a04f5a912089d80bf |     
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/79b874d9ec21a78aba9d492f3945db0e3e722207 |     
    arc      |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/031cc31e2513cbfdfbcf75108b5d7788f3b673b9 |     
   x86_64    |          botan-2.19.3          | NOK | http://autobuild.buildroot.net/results/65845e9a7bfc4f17e1bd1bd84d6aa399f7e6ad2d | ORPH
 microblaze  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/6a5a53bffd6ef4d8a26132f4ec761ceab0dde107 |     
powerpc64le  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/0cd63d46c4265ba8238b0e732f815368ab1c17d0 |     
    mips     |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/2f30f6e7cf5997ffb2719795c81336de85ca14ca | ORPH
   mipsel    |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/55424311ac07374531c4d33ba17b00f64801861e | ORPH
   x86_64    |       containerd-1.6.16        | NOK | http://autobuild.buildroot.net/results/c624a7aa61d6d0d9464555883816163a9c5de2af |     
   x86_64    |       containerd-1.6.16        | NOK | http://autobuild.buildroot.net/results/6b93e800d56307bb2f9b956b95d3228af5825dfe |     
    sh4a     |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/f8e5ae5d4406393f65c14596b2b3e3dd24c08675 | ORPH
   x86_64    |          delve-1.20.0          | NOK | http://autobuild.buildroot.net/results/8e051f0c28f3873504e0fbc4643d40ed5a60f1df |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/efad5ea0bae36ed8c0018760b8bddcfbbaf98d91 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/997c87b32adb600049d2a0adf067a32fe78f6c66 | ORPH
  sparc64    |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/08463bd0f37a40366c70fe1defef73279d5bf00f |     
   mipsel    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/6acd08234276211525f0c6193bc5733bc5783461 |     
   mipsel    |           file-5.43            | NOK | http://autobuild.buildroot.net/results/ac51155006048ea23c8f1aedbdac0518f52c8336 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/9771e880fcf88af9b5a73d59fa570bba3e86adbc | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/fc3a2b34f98d0f74eaf0bd32c3830a313a6ac667 | ORPH
  mips64el   | fs/axfs/axfs.mk:32: /home/a... | NOK | http://autobuild.buildroot.net/results/b45781861015e266f7ba64801e2cc5a1e46fec31 |     
   nios2     | fs/cloop/cloop.mk:33: /home... | NOK | http://autobuild.buildroot.net/results/625bb65a0bb5752d2da01cd52509ef7a66dbb85c |     
   nios2     | fs/cpio/cpio.mk:128: /tmp/i... | NOK | http://autobuild.buildroot.net/results/f05442129bce8a0a8f73a79201bddbb4d1c6ae1c |     
microblazeel | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/9eac4e4dbbb6c0093c578946d252a4122f5b3c3d |     
    or1k     | fs/cramfs/cramfs.mk:46: /tm... | NOK | http://autobuild.buildroot.net/results/c6c065efb00f2a4017b572c22aa5c798c0c08028 |     
    or1k     | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/f49dc0d93fac685027b345116d7b8be7429399fe |     
    i686     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/898e6c7377860c622362253364f7e2789ea5fd35 |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/c9673ea71e2495e9a1f7584bacfe523586d5dd12 |     
    arm      | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/27677899218c43d7f14840c1c94e350b1eee3b81 |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/b2f20e2315f0a0ddb6adce650228067575caa08d |     
   mips64    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/e1378a4fbd0232524aa784bfa976492bf6375323 |     
  sparc64    |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/3602c5cc2aff668211fd8e6eeab778b3fe287246 |     
    or1k     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/74f8f42137b10035b606f18b991c6734b2166683 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/3411eea6c2088d76d314423f461297ad659a727f | ORPH
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/30a64334ce83c1294f6e43496468117a8c6b0099 | ORPH
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/a1511f29fded575263453ba7a18947cfd92c82b2 |     
microblazeel |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/26582fafd30cf1c086da803103f2588988762ed7 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/47ccbe05a44366c9db3564573441db80efde902d | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/ec0e3d575651ae8b59c7327c8f53e0048c60f607 | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/28016751781dec1676d92f1d939d29618f93d5f9 | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/84a5672a610e0cbfa9af7371492aea0d0de13ee6 | ORPH
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/8b5483ba5a42e3b160b5f45f5c5603cf4d76bbd1 |     
  aarch64    |        gr-osmosdr-0.2.4        | NOK | http://autobuild.buildroot.net/results/49e9f7bf8bfc7008688c1a3bc3744b7d3be3ce18 |     
 aarch64_be  |         haproxy-2.6.9          | NOK | http://autobuild.buildroot.net/results/a83791b944be37fdbab5536c46b11b86059d02ca |     
    sh4a     |         haproxy-2.6.9          | NOK | http://autobuild.buildroot.net/results/f987deb39b21d1d4234e46c2fd86ce0e7db9e297 |     
   arceb     |         hddtemp-0.4.3          | NOK | http://autobuild.buildroot.net/results/508f55dff69fe3546eb9908bb539605eea649490 |     
 aarch64_be  |         highway-1.0.2          | NOK | http://autobuild.buildroot.net/results/6fef1507dea11758a19d98e3894583d794815b61 |     
  riscv64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/9e704fe7fde0b8b1036634e50ee69163b9bbd15e |     
    i686     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/2d3640ff6eeba96c5cb9b1ee1cde0432f4e60d6f |     
   sh4eb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/aa7723b86b5e65131568b08f4614fa9246ef7ea9 |     
   arceb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/0f600fdf1391f9c926507df22530e0b6e9f387aa |     
   mipsel    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/b32fcd1acf4a4dd67019ab8d3fa9f48f85b06d15 |     
    arm      |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/b8687db1815cfe56dbfc485490a527a4e02ef7d0 |     
    or1k     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/0aff6d70f50607e6b56f26542ffd9687fe4f2943 |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/2dcb8317d87bc550087f10e72ccd395310bb02e0 | ORPH
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/a4f602bee24c2516704c842c314fdce285cdbbb9 | ORPH
   mips64    |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/75321fdf960a4dec4f5937295eafd996417bd9f6 |     
  mips64el   |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/e5caaacb77649e53af2e03f6f716fdf327d460f2 |     
    i586     |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/7c80e68c80b024251d8ae64d485f155804b9c422 |     
  mips64el   |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/129bb0b6e06910a092928302f913a838da0b8223 |     
   mips64    |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/0790ec30e5c31406ff62fa64074c7fa101eba77b |     
  mips64el   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/371a975fde56fb3cf0001db654669429beb6bf45 |     
 microblaze  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/7fd4c1d261359bcf65741a1c62e5cda6c516c3ee |     
   s390x     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/1c2229962c7e50b75e76f0101f2f48d9b35cdeb3 |     
   arceb     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/85a96da3ee30442e4f9592c1608faf9c64e63367 |     
   arceb     |        host-runc-1.1.4         | NOK | http://autobuild.buildroot.net/results/3d74388a14bb7d2db861fea25e9407f3a6bc7a48 |     
  aarch64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/3aa782a31ae04d0d439a0bdc57f011f55f8a3130 |     
  aarch64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/fd7eddd58e22965ef82a23af4468ecf4c902bf28 |     
powerpc64le  |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/fdfbda572320fc53b866024e3b1e9c06ab9ca38e |     
powerpc64le  |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/95d8a736cd32bffe1101ff38a655853a1fa1ae69 |     
 powerpc64   |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/8fcf783320b0da7304069919c5ce0d091a786abb |     
   xtensa    |            kmod-30             | NOK | http://autobuild.buildroot.net/results/83a4a7ecc77f39639d3e5bc8554bd01a62a3ede0 |     
   xtensa    |           lcms2-2.14           | NOK | http://autobuild.buildroot.net/results/cc2feff52fb5e2b52b2e35cfb20f5204d676eeed |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/72021b4b692fdfdadce76f0400013ca82d5fa7be | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/84395b0f4d167e9f380bfb3927eda173cb3d0d38 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/b8ddc51a6a795ad5a2bb704519d33b411f8ce4f8 |     
    m68k     |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/99dd68edd0b9551e869d021691e39883b4dbed2c | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/5bf668e0eff71dd4f906687281fc6233b0718ac9 | ORPH
  powerpc    |        libsigsegv-2.14         | NOK | http://autobuild.buildroot.net/results/3e69bf83fa9cf64e1f5bf0024ac346cbd7f2ec8c |     
    arm      |        libudfread-1.1.2        | NOK | http://autobuild.buildroot.net/results/d7a89133b6339369a62a905998d464bb9d73ac60 |     
   arceb     |        lighttpd-1.4.69         | NOK | http://autobuild.buildroot.net/results/74626e34649d5c65d056ce9dd78ce1423ed91d34 | ORPH
   mips64    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/0f61be5ce6915b99c4c35bdc8c57c8f65bf4a5a3 | ORPH
    arm      |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/092c3187a11335f7ee7671270871990b7329cab8 | ORPH
 microblaze  |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/757b5ec636d27bbc42f5ba12bb69c6f0c6a86b8b | ORPH
    i686     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/82f9772353b02375f9c8511029da860a03c002b1 | ORPH
   arceb     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/ae9b209843c897cf7bbdf134d54b345965cb309e | ORPH
    arc      |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/f444bce4a907de11b468e05e08bd5d80884fbc3f | ORPH
    i686     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/db12d51f3c8153ef338ec4445e8e449eb6b8bcd7 | ORPH
 powerpc64   |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/2c8476dc53636232d11eda26d90af7ccdcea4fbe |     
   sparc     |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/c20369ccf2acc3e19967771f8b4b65ed1404ef56 | ORPH
    i686     |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/7eee24fa4585ed1457495369864d005b87028df6 |     
   x86_64    |         mesa3d-22.3.4          | NOK | http://autobuild.buildroot.net/results/c250662e159e0b92860ab4776a330be6786fa3cc |     
    or1k     |        mosquitto-2.0.15        | NOK | http://autobuild.buildroot.net/results/3c3912aaa0eebe3af6b929da4f2a534c65d70f4e |     
   mips64    |    network-manager-1.40.10     | NOK | http://autobuild.buildroot.net/results/ec4daea511e1143b13248fdcf7f5130404ca163a | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/4f450e486e8cf70fcafbef6b4b6c2eec277b4e45 | ORPH
   mipsel    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/80619e063d10e43b0647c0da6715315459221c08 | ORPH
   s390x     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/cd11fff8ae445d3cfc8ed1809c069acb83838758 | ORPH
    sh4      |        openjdk-17.0.2+8        | NOK | http://autobuild.buildroot.net/results/b3d9e809dcdac26a60ca69b1fffd9cb9e8b8fc57 |     
    m68k     |      optee-client-3.19.0       | NOK | http://autobuild.buildroot.net/results/e7b5c6f16083435a2e76bce00de718cf9d8c6a5b |     
   arceb     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/f6bd17c86f7cc8b49b695f5a2a4dd84bc47346a2 |     
   mips64    |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/6103725b5afcdb3f094036f987cff1b994ebb264 |     
microblazeel |           php-8.2.3            | NOK | http://autobuild.buildroot.net/results/c83fed08718a5b3ac439485683944ff61899e2fa |     
   x86_64    |           qemu-7.2.0           | NOK | http://autobuild.buildroot.net/results/438b7e264c4c1ebd1a45200459e7e6d102f29d5a |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/9b1d4b6dd4d2e5d6c6ed613b83bfa86375e16d61 |     
    arc      |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/4d0310f856c992c8bf0e71778505c92a8b0182ff |     
 powerpc64   | rtl8821cu-86cc5ceb7c28b9b99... | NOK | http://autobuild.buildroot.net/results/4edcca397aefa88e5360ac1308084be93b072877 |     
   x86_64    |         speechd-0.11.4         | NOK | http://autobuild.buildroot.net/results/b92267e0ffe79dac2cea74fd0e081558799f80c4 |     
   mipsel    |         systemd-252.4          | NOK | http://autobuild.buildroot.net/results/c8c4b7c12c616969c8ab430ca6e8fabc862593cf |     
  mips64el   | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/2918135a6d6319a34370728a1c8b7012d81c1b94 | ORPH
   mips64    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/431b5ebced56a6c0005500f7c1797d8bff0f2eec | ORPH
 microblaze  |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/e20eb36dd9da2c0269006dc7b4dae2d9fae9b9de |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/240ee87bcffbe6d61aa23d19dc5da7a605e35604 |     
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/4f86e906592690e000ed483e6ee6919ce3e377ae |     
powerpc64le  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/e7df1086cec36bd4c0e06eb3452a52e4ed73b3e3 |     
  sparc64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/d04dbaa4391dfad259e684b6194d404063887564 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/0a1c4d1f7367a11adc7fc946a639cba87096ff9d |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/f7d430c43d37f8259d5f553a93f719dc79ff6639 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/7e8c9dd541dca4c03add85c79809548c85a74705 |     
  sparc64    | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/2e22b6900eb45de6b94bda457f7ef3441803d92a | ORPH
  sparc64    | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/d984a693ea7d7ee3f0d6982490dbe27b8099981b | ORPH
   mips64    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/e2e364fb86dff25e6b021cb9303fd3bf68291056 | ORPH


Classification of failures by reason for next
---------------------------------------------

                       unknown | 4 
  gobject-introspection-1.72.0 | 2 
                host-go-1.19.6 | 2 
         host-libarchive-3.6.2 | 2 
                  linux-6.1.11 | 2 
                speechd-0.11.4 | 2 
                    bat-0.19.0 | 1 
                 coreutils-9.1 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
            host-binutils-2.39 | 1 
              host-rust-1.67.1 | 1 
                     lxc-5.0.2 | 1 
           python-numpy-1.23.5 | 1 
                    sdl-1.2.15 | 1 
                 systemd-252.4 | 1 
             uccp420wlan-6.9.1 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/1d8256ee9773e29cb92825bbca78347ae65f104d |     
    sh4      |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/27b07ed8f189da641b63f7067c560b8999dadee8 | ORPH
   xtensa    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/54ebf2822833b80d21068196933ceb336f03738b |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/7593554abec3b0c0d0fd8c157f1890115b8f6692 |     
    mips     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/78347c548bf26e4b89d603c477da65b2e48a8685 | ORPH
microblazeel |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/1d262402e827610193cfb4c0aebdea2315b18158 | ORPH
   mips64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/3d4e0f6772bec84c930d3bc26274bfa20d54580e |     
    i586     |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/5ae130ed45d4bbc5b009f2c2d92d656c1463b2a2 |     
   mips64    |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/9e6033ba0547c9175ac5746475786832428f43d3 |     
   s390x     |     host-libarchive-3.6.2      | NOK | http://autobuild.buildroot.net/results/acad9533a8ecc24b96c8bb0c0c3435d39ebba82d |     
   sparc     |     host-libarchive-3.6.2      | NOK | http://autobuild.buildroot.net/results/cbe9d26a82eac0c6530fa6edde987c259d37ecce |     
   mipsel    |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/786263f28d0422aabd95bc0bc600784c7facb85d |     
  mips64el   |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/562c0a8ff539a266c692f29d7ce78dacd4083605 | ORPH
    mips     |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/5d4ad80c686f53d4289f1ba3048d6e131d0f1644 | ORPH
 aarch64_be  |           lxc-5.0.2            | NOK | http://autobuild.buildroot.net/results/a4e78900b09174ed00d67d472fd53727d9b1f3eb |     
    i686     |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/0c55346be2a7f1ad3d30e58d1c01e8e202e6d228 |     
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/bb3f2c3445c86ae760daf5edd014c94e0d4774bd | ORPH
   mips64    |         speechd-0.11.4         | NOK | http://autobuild.buildroot.net/results/7f46c6d680060ee7049ccaccdcaf7b58a8818e4c |     
microblazeel |         speechd-0.11.4         | NOK | http://autobuild.buildroot.net/results/20c6d8394f345c7f55a65eb66d79130280ab7ce2 |     
   armeb     |         systemd-252.4          | NOK | http://autobuild.buildroot.net/results/e3c5ea117954fc50269c5da80324eef8d7d7df06 |     
  sparc64    |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/d376ef02b84d7466a701466cda18ae5ebe71f820 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/48f56430232552ca30f044ab81212da83f75685a |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/4692dc598b45a8340ffa03ab4e4604767828b3dc |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/3ce3121159a7fa8da07b6d949f4f218996c9acca |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/23d3280ef6c54999053e048ddfb50ca84131a401 |     


Classification of failures by reason for 2022.11.x
--------------------------------------------------

                       unknown | 2 
fs/ubifs/ubifs.mk:49: /home... | 1 
              host-rust-1.64.0 | 1 
      linux-5.10.145-cip17-rt7 | 1 
                  linux-6.0.19 | 1 
            ocf-linux-20171122 | 1 
              skalibs-2.12.0.1 | 1 
uqmi-0a19b5b77140465c29e2af... | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/317c8898b007ba59dc2196d613a6c1abbdb5856b |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/9c4c0ff2ed70712da76198be69a3f1ba4e5f6297 |     
   s390x     |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/2a705e51b62571b91251bdd2b21e7071a4f2ffd9 | ORPH
   mips64    |          linux-6.0.19          | NOK | http://autobuild.buildroot.net/results/2bd1bfed427c82300dd62ba9b89b541f1101c2c0 | ORPH
    arc      |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/b31eeb440b6752663cd85466203e5e063ae8eea4 | ORPH
    or1k     |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/2075f708adf610c9b9ff303b90ab5b25c38f03e1 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/bb275723e3b99364894b254d72cb835fa76237f3 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/4857450cffc21c8a05bd1037e2fdc374f1c54870 |     
    mips     | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/818ab7de792d53de5a361121ab5a295e4d3eba36 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
