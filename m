Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEE2C433FE
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 07:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C508B60BF8;
	Mon, 17 Oct 2022 07:26:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C508B60BF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mD2_jYq8guPF; Mon, 17 Oct 2022 07:26:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECDCF60F1C;
	Mon, 17 Oct 2022 07:26:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECDCF60F1C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B12D1BF2C4
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 05:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E48DD40482
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 05:37:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E48DD40482
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RfUqTJhWoGzc for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 05:37:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86190400E5
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 86190400E5
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 05:37:10 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 86FAF1C000E
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 05:37:07 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Mon, 17 Oct 2022 05:37:07 -0000
Message-Id: <20221017053714.E48DD40482@smtp2.osuosl.org>
X-Mailman-Approved-At: Mon, 17 Oct 2022 07:26:52 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1665985027; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dq20jEweAoIA9PtCqqoVFAnCWf7QZDMrjn4CxCI6+Dw=;
 b=kyHz4Q1FnLU5Mp8GxjhcsfY1oQAns/+01eTfrneW6EHApRrnVHI9m5uGjBoxokBSsLDKVx
 ivhqZeXooRUToLVzTgoNaESW3RUURiehDXaETg7AfLZozPy0uDXzp3qaSLSJ/Da9+7B1pO
 aBmAK1nnvX72qjveDrhumFAlFbMocW8BvHmBFGT95Bx43T/vmt0YApub5AuH9w1RNjTUM9
 W7eGYNkeffiWnlYa3KY88mPOzNhNMqPUZvNCze3BuqQOvMFhOh26B9qcQbOUx7xbvG/LKW
 NH3c8U8sbSNPuLRIJ4Zr2Mhabh8zsIbbs1aVYrhXzF8Y85sbjmxB9RI8gdIWXA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kyHz4Q1F
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-10-16
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

Autobuild statistics for 2022-10-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  5  |  3  |  0  |  8  |
  2022.08.x  | 10  | 13  |  0  | 23  |
    master   | 109 | 577 | 12  | 698 |

Classification of failures by reason for master
-----------------------------------------------

             berkeleydb-5.3.28 | 35
                   bearssl-0.6 | 32
      ca-certificates-20211016 | 32
glibc-2.36-44-g2628500f5dff... | 25
                    gpm-1.20.7 | 23
                   libnss-3.84 | 21
                   slang-2.3.2 | 20
         coremark-pro-1.1.2743 | 19
       host-gcc-initial-11.3.0 | 19
         host-gcc-final-11.3.0 | 17
        host-f2fs-tools-1.15.0 | 14
                      crun-1.5 | 13
            host-binutils-2.38 | 13
                        brltty | 11
                   linux-6.0.1 | 11
                 sysvinit-2.99 | 11
                  autofs-5.1.8 | 9 
              dieharder-3.31.1 | 9 
                 systemd-250.4 | 9 
                      xz-5.2.7 | 8 
            btrfs-progs-5.16.2 | 7 
       host-gcc-initial-10.4.0 | 7 
      host-riscv-isa-sim-1.1.0 | 7 
package/openssh/openssh.mk:... | 7 
        gmrender-resurrect-0.1 | 6 
            igd2-for-linux-2.1 | 6 
              libarchive-3.6.1 | 6 
            ocf-linux-20171122 | 6 
                     fbset-2.1 | 5 
             libgpg-error-1.45 | 5 
                 dash-0.5.11.5 | 4 
                     efivar-38 | 4 
                gerbera-1.10.0 | 4 
       host-gcc-initial-12.2.0 | 4 
                libdnet-1.16.1 | 4 
               libglib2-2.72.3 | 4 
                 musepack-r475 | 4 
          cryptodev-linux-1.12 | 3 
           dmraid-1.0.0.rc16-3 | 3 
       freeradius-server-3.2.0 | 3 
                    frotz-2.54 | 3 
  gobject-introspection-1.72.0 | 3 
              host-delve-1.8.0 | 3 
            host-gauche-0.9.12 | 3 
                host-go-1.19.1 | 3 
                   libee-0.4.1 | 3 
libsvgtiny-ea9d99fc8b231c22... | 3 
          linux-5.10.145-cip17 | 3 
          refpolicy-2.20220106 | 3 
                    sslh-1.22c | 3 
                       unknown | 3 
  binutils-arc-2020.09-release | 2 
                   duma-2.5.15 | 2 
        host-berkeleydb-5.3.28 | 2 
            host-binutils-2.37 | 2 
            host-binutils-2.39 | 2 
         host-gcc-final-12.2.0 | 2 
     host-moby-buildkit-0.10.0 | 2 
         host-protobuf-c-1.4.1 | 2 
              host-rust-1.64.0 | 2 
               host-vde2-2.3.2 | 2 
                jhead-3.06.0.1 | 2 
               linux-pam-1.5.2 | 2 
          lttng-modules-2.13.1 | 2 
                   mimic-1.1.0 | 2 
                    musl-1.2.3 | 2 
                   nanocom-1.0 | 2 
                  netsurf-3.10 | 2 
              open62541-v1.3.3 | 2 
                 openssh-9.1p1 | 2 
            openssh-legal-info | 2 
                   perl-5.34.1 | 2 
     portaudio-190700_20210406 | 2 
                     pv-1.6.20 | 2 
                    sdl-1.2.15 | 2 
                    zeek-4.1.1 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
              alsa-lib-1.2.7.2 | 1 
am33x-cm3-11107db2f1e9e58ee... | 1 
             batman-adv-2021.4 | 1 
                  boost-1.80.0 | 1 
                  botan-2.19.2 | 1 
casync-4ad9bcb94bc83ff36cfc... | 1 
                  check-0.15.2 | 1 
dahdi-linux-5c840cf43838e06... | 1 
dawgdic-16ac537ba9883ff01b6... | 1 
                 dmalloc-5.6.5 | 1 
                elfutils-0.186 | 1 
                  exempi-2.6.1 | 1 
                     file-5.41 | 1 
                     flite-2.2 | 1 
             fontconfig-2.13.1 | 1 
               freeipmi-1.6.10 | 1 
fs/cpio/cpio.mk:117: /tmp/i... | 1 
fs/squashfs/squashfs.mk:56:... | 1 
                  gensio-2.5.5 | 1 
         gobject-introspection | 1 
google-breakpad-c85eb4a59b6... | 1 
         host-gcc-final-10.4.0 | 1 
                 host-gdb-11.2 | 1 
host-gdb-arc-2020.09-releas... | 1 
host-pahole-73383b3a39afe86... | 1 
host-spirv-llvm-translator-... | 1 
                   json-c-0.16 | 1 
      libabseil-cpp-20220623.1 | 1 
               libcap-ng-0.8.3 | 1 
               libdcadec-0.2.0 | 1 
              libgcrypt-1.10.1 | 1 
                libgeos-3.11.0 | 1 
                   libnl-3.6.0 | 1 
              libostree-2022.6 | 1 
                libxml2-2.10.2 | 1 
      linux-5.10.145-cip17-rt7 | 1 
                moarvm-2022.06 | 1 
                     mtd-2.1.3 | 1 
         mxs-bootlets-10.12.01 | 1 
                proftpd-1.3.6e | 1 
         python-greenlet-1.1.2 | 1 
            python-ujson-5.2.0 | 1 
                python3-3.10.7 | 1 
            quickjs-2021-03-27 | 1 
rtl8188eu-903b6fcb821465fe9... | 1 
rtl8723ds-76146e85847beb242... | 1 
                  spice-0.15.0 | 1 
             stress-ng-0.13.05 | 1 
                tealdeer-1.5.0 | 1 
tstools-08f6be304040e7b8476... | 1 
ulog-0389d243352255f6182326... | 1 
                  umtprd-1.6.2 | 1 
    xserver_xorg-server-21.1.4 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/5a52cbc34caf1cd92943a57218ec5bae5a543339 |     
   sparc     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/5d3497192a7a41a7cc66b7abc7fa38e6fbffe408 |     
  aarch64    |        alsa-lib-1.2.7.2        | NOK | http://autobuild.buildroot.net/results/4f1029fd46d2a6348317329679e1b7ece58ca5fe |     
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/bbaf19c0de5d97aa4885985b2ab885c7713ab693 | ORPH
   mips64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/190abe408e3e8d8484b241be821a1ac3dcc580c3 |     
  sparc64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/31faa9e66d8708a18a88ee9071272938eb961a46 |     
  mips64el   |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/37d7e57494f323693b33e546cb9298c713ae5252 |     
 aarch64_be  |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/85cbc365394674c8c5b7dad98238a251707f2d45 |     
microblazeel |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/7595002a3232201b68b751c0177290484ca6be28 |     
 aarch64_be  |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/865b42ecba3dd617189db5e3825aa843de6c815e |     
   mipsel    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/c363392721ab4f51f201962b1bd0beb9a49d26dd |     
    arm      |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/53dadb83229ac08197b8777e11b05fe0bbb68f4e |     
  sparc64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/a8a7f53aeb2e7b7b8a2f1d44b3876a416351322d |     
   sparc     |       batman-adv-2021.4        | NOK | http://autobuild.buildroot.net/results/d9f7cdc15d5035259ee8e2b2c2f705e9b7fc4aea |     
   s390x     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/a344b1cbd15e9e2a29c7bba7fb30a4da7e163009 |     
    arc      |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/f98b7373227b19f298c79ffc0faf8c35d1462d9b |     
  aarch64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/8441906b91f0090f27743b9132a311f2d6212e08 |     
microblazeel |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/f85adeeba7558449239e89b47360a1e797fa8694 |     
  riscv64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/a7b6b75dfa84f306ef86be41135b11c209ce683a |     
    mips     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/cd483c5a1569ea03c8c014ecbbaa55c9b1f045b7 |     
 aarch64_be  |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/392eb25bbb6131b687088ca39826ad10845add87 |     
   armeb     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/a62bbbad1e149a98b17345296df2e5dd7db1eef7 |     
   x86_64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/d0e6269043b6c0c10e8e3e428ca427ccd149fd05 |     
   mipsel    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/3341556eaaa8b35971409a8a109f87fcae202220 |     
 aarch64_be  |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/550b50b820678731bccdcc7440df6b000740dce6 |     
 microblaze  |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/a77800cfb486ef59b7164205dcfc11429969212c |     
   xtensa    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/206da97c9460408257d268acc04e285910aaa2c2 |     
   arceb     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/8a88dbead5622aadd1230a4d25129f16b08c4567 |     
   sparc     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/c62eb9cc26e98c56a985e297c541003792fdc99a |     
   sparc     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/ffcc891015349e66c09ed46a01733835484ff693 |     
  riscv32    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/6242112c75c76e85b207ae72fdede5717f07903d |     
  aarch64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/ce957809e083f84241f4f06e3781031cb90f29a8 |     
    or1k     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/6bb298d5137f3b27ef4eec7766ab9989b1032965 |     
   sparc     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/6e15584544a56fbef4aba831eb77acd4c7034e23 |     
powerpc64le  |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/2ea5debf640de75e9f9618c541271463f19825f4 |     
    m68k     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/07fa1f80b7a0f5177e4ae372afdd8308da90612a |     
  riscv64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/466ebeef6f728b8683e97074b0f876feac6abfd5 |     
    arc      |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/60dd6aa468d529f103161590ac87fe4b681c3138 |     
   mips64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/8ac030ebbe944e6714c789c03e2cede3503c713f |     
   nios2     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/b5d6c0ca5aa4ac4fd31efd7666fed21614bb645a |     
   sparc     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/150fc609cf25b357aaf224bfc6d56eb0eac4f659 |     
    mips     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/dd6a492ccd9e34c4b56ac9942fae563202bf4c88 |     
    arc      |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/5882d2810d3f0b510e1f24529b11679d369e0f9c |     
   nios2     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/586d8dda030b8c56ae4de3addca07524bc14bc99 |     
   sh4eb     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/1bc07c2a7e7cabbb5f4e8c5adc3cfb8ce30b0273 |     
powerpc64le  |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/2bd8abf64d8ba675a7563d3f85cc8bbda38a4438 |     
powerpc64le  |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/4de27634ec1e47584fac581f1bd7c7c04562a8b9 | ORPH
 powerpc64   |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/d52f7e0489541554ea2bc21eb275a8eb2b7ba4f1 | ORPH
    sh4a     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/c02ef451d836cc6f8853b9d11964f07907ce5566 | ORPH
   mips64    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/b335d1b8d6c92d51044b459dead01630395abc50 | ORPH
  mips64el   |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/535909d4fe7645ff6c845a9d40218835c68656a7 | ORPH
    arm      |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/cc111ad3a6cf604a00523a8724dd9cfb443eee32 | ORPH
 microblaze  |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/aa3ef68f35de57393f9da7ee4a1a551b96959614 | ORPH
powerpc64le  |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/f3657f7c6fdbfcaec5110265d33a710046b40b9a | ORPH
  mips64el   |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/6951c4d92dd6475a127bc339a55bc36d209ea177 | ORPH
   xtensa    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/252021bd795fae17ff412e73300d106ea568ffd1 | ORPH
 aarch64_be  |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/2b0339a3bd02e8f9ff6bf68631ca72ec7b4a23c0 | ORPH
   sparc     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/ba70a48fc2adae040296d4ae2cc39926f02b103b | ORPH
    or1k     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/c9fa04b02d5b62fc70cadf85a25001880c9494b9 | ORPH
   mipsel    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/7f75f83f68cfce39d0df68d9bfb6090113482959 | ORPH
   s390x     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/81ca3362b5b69b34f9e44c545d7c1f9d8e933626 | ORPH
  sparc64    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/e5376ae72061ab805279c9180bae70684e3e8dfb | ORPH
  sparc64    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/4c5479b14cb55f7790904727ac281089f1f697d4 | ORPH
    i686     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/4a7fadb67f5f491c60d32c4b7167c7758b8952f9 | ORPH
   x86_64    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/36fe9e94c3c2353a95afe106f903fdce929f0185 | ORPH
  mips64el   |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/72f3793655ff542807b3e0e5f0f6ee5a06f95fdb | ORPH
   sh4eb     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/5248798f1eb2fb1d9a95df5f276d36336beba01b | ORPH
  aarch64    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/1c24aa1bcdac1c6c1f30c0941dcfe80c8be845e4 | ORPH
 aarch64_be  |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/cd02c8b8b0c9e31a0dbccbb11cf50f01e9cee319 | ORPH
   s390x     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/cf192f03a8ff3fb0a65320aa59f426f99a06f577 | ORPH
  aarch64    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/1815484aef016109cd7203d09c6e14d10bf7a0c7 | ORPH
   mipsel    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/f6578a04a926efa05965313398243710ab83fc92 | ORPH
   mips64    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/0ae4d371eb4c9156905593a7a9c6f7aa55a9eeae | ORPH
   nios2     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/a4cdfc8cd9a0961f591871fec860e722041185da | ORPH
  sparc64    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/7b0f84e2a90e3acd4c4224a324cee56ff22627a8 | ORPH
  sparc64    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/b076316ab93a8fe685265b56ae228347ea417bd1 | ORPH
   arceb     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/7ee066dce50cb77b47870cc9f2b575aeeb7068bc | ORPH
    sh4a     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/88ad7f9b8fa333c0150a6d11fe66d11e9517b36a | ORPH
 powerpc64   |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/63be92bc0472d0a2ff2fd94c73f4707687c3b971 | ORPH
   arceb     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/27555ee67e61b1d7839926908faf4a4f3948e72f | ORPH
   sh4eb     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/fd86e270db65f9dd501d7e1b2a39d53d15e6f093 | ORPH
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/2b4dc4143a478f106397e279b86372825dd1f488 |     
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/1df94f7b1030150dec442bc91a98d0654582f7fe |     
    arc      |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/44d56870a4e310621ee2a5597b0432ba4a805b09 |     
   sh4aeb    |          botan-2.19.2          | NOK | http://autobuild.buildroot.net/results/e9c7e1b03290873c630f665a6398c6ee790786b7 | ORPH
 microblaze  |             brltty             | TIM | http://autobuild.buildroot.net/results/f1b7344ad5809336c6af2e015ee1ac21fb70b940 |     
 microblaze  |             brltty             | TIM | http://autobuild.buildroot.net/results/8d4cc2c82b36fd9c0916ae6fa4d6842cc6939ceb |     
    or1k     |             brltty             | TIM | http://autobuild.buildroot.net/results/55666f77b10537d2099523c146e756c01e9f7f95 |     
    mips     |             brltty             | TIM | http://autobuild.buildroot.net/results/250d530c76294d8dbb912de910a2f5a7a9d3e84b |     
  aarch64    |             brltty             | TIM | http://autobuild.buildroot.net/results/a4cb6ce519db0c60c1a69c9800b2de42f5cb3801 |     
 aarch64_be  |             brltty             | TIM | http://autobuild.buildroot.net/results/171043e4a70fcc42058a5ed5d68962ceb23dc004 |     
  powerpc    |             brltty             | TIM | http://autobuild.buildroot.net/results/8ea088c2d59af9b712f692263552c97e3575bc01 |     
   nios2     |             brltty             | TIM | http://autobuild.buildroot.net/results/96a9a0bc04171f8adfd7f0a6d694ac2d19b5de85 |     
   mipsel    |             brltty             | TIM | http://autobuild.buildroot.net/results/babf2a4c2f23a843f59615d3079851d2faba23ac |     
  mips64el   |             brltty             | TIM | http://autobuild.buildroot.net/results/4ed527dbfb4d18052e651c7a08834b1860bd4267 |     
  aarch64    |             brltty             | TIM | http://autobuild.buildroot.net/results/477c0339e004a3a78267a35b54a7c261e02574e2 |     
 aarch64_be  |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/70e6ceb54adf80cce4d70047638417db707c6dc8 | ORPH
 aarch64_be  |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/6c7132023aab50c61ef3c808e180a5476c5b42f1 | ORPH
   nios2     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/73972826b16eab0da5a667301d716eff9a31af06 | ORPH
   s390x     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/0f08c678e660affb71a57b135bb773093c789acf | ORPH
   mipsel    |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/932d61e3d486a49b55c7dcd2936146253db2e6c7 | ORPH
   armeb     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/5465f6e5051d3a1180f35eca2459b38f40ee2fc1 | ORPH
    arm      |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/34aa5b04bae683c6a08a6f6b87490ee0d0ef4f9a | ORPH
  powerpc    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/c903018c748109a299af8e40db4cafd7b4824319 |     
    arc      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/31c71a9f3f07520659a9ef04ee79b04c1584faba |     
powerpc64le  |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/d654d5d22de2f66ce3fdfb44e2a15d2c42f0d08c |     
   s390x     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/b21ce0902e8c7549dd144455e6b239c365175901 |     
   armeb     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/0464207ecdc189cda4f8cc8f3bdc135a2b729a60 |     
   sh4eb     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/4bfa3c221cb691b463d75343b7767dd1815a51ff |     
   xtensa    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/3aba216a21fa69851774d02ed8d333e949f39502 |     
   s390x     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/c3929f49f3616e49d3e6e784657302c2dcf14107 |     
    arc      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/a3ef9097da9da50a2a5cc1add2986242cfb4fe4f |     
 aarch64_be  |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/11be16bd2c829534917e8b68f78a274a978a6780 |     
   mips64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/cbfa75709ab1266b048a03ca5cb5cfafb804a1c8 |     
  aarch64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/7793af50cf2865905b817059a225e59d56ffd6d8 |     
microblazeel |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/af682ad20a044ab010d274971da686171c58bf38 |     
 aarch64_be  |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/ceda33923ac69e15c0a832aac121789bf24fef8b |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/61ecf82cf4129650d32b97e5b549c7433c966466 |     
    sh4a     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/d14816191561e40e97c3983ad3450fc46faa722f |     
 powerpc64   |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/7bbbc6a9698423aaa616bb75ffbb2951f3b6450e |     
  powerpc    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/6d845a24aa8e489675af9d25557f738d80e22720 |     
    m68k     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/181efe03de57f502647672084ed389a7d2a34f56 |     
  riscv64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/eebd29ecdc78af3a185dc1781dafac3280fa31e9 |     
 aarch64_be  |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/e442ba9c9961a16177a0ae4b81d69ed26c15a87f |     
  aarch64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/0610527ebad2d6cc688e8fcaba03d7900d32c9f4 |     
   arceb     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/46e6094644b12e3cf24cfe4709b35bac116e6d01 |     
   mips64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/2fcf84ba162c9e88254a29c8eea3ba090723546c |     
    or1k     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/22acde26d6cd44cf1888fdeb5902c9eec314dd11 |     
   s390x     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/21635bde0576abda263c84cd8aa635ab7f7823fb |     
    mips     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/5c8bde63aa4110109611397b8824b4b4cbbd669a |     
   mipsel    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/d17b776b47b195a1d6c0364ac6d714d00ab46f49 |     
    mips     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/81905f969931317a7667b474b38ce19696bb753d |     
   sparc     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/ecd11bb80b21b3c8bd860ce127ddc671869d10d7 |     
   xtensa    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/b356c1bd90fb07c799c727ae667c2b19df560fb4 |     
  aarch64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/9e4261d779684db137ea96b5d806eee4498ee800 |     
 aarch64_be  | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/62bb1da627189b5a72b0dea92cbc7b8f695abfa2 |     
   mipsel    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/00042bec42276e687688386063bdb20762d522e7 | ORPH
 powerpc64   |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/df43bd014ca6893a7eb169e9b4d2e502ec5e1d00 |     
powerpc64le  |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/b0f61e016c8cf02aa40340a29058597144d4666f |     
  mips64el   |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/3e53eaa43bf91ff7d72062b571122860dc04e622 |     
    or1k     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/9b796a28caf30829305664da5aadb3e8384ae4c9 |     
  riscv64    |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/e4a83bc116adf90c82072f4d853263bbc0bb8488 |     
    m68k     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/ef6312f90575873475189e718355bf40b9d1735c |     
    or1k     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/fb6aaa0cbc9d429273c932dc380b75930aba0668 |     
   armeb     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/ca5a2eefb7100a1cebabac749ad26392e61e3d21 |     
    arm      |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/a0dd0070940f5475f24c691e298b5b77b4429337 |     
   mips64    |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/e01e869ddbcfd8e16612e06085ffb81320435d92 |     
 powerpc64   |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/2ccb37373c29012660825a2a652b076eeeaf279c |     
 microblaze  |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/a3a9f7c4c75148e7ca262352d2f6bba4887d5dfb |     
  sparc64    |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/498899ce0cec996fb28dcc6f85961c3e4026691e |     
    m68k     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/166ce4fd830cdff9d80c6020b5075aeaf01bf463 |     
   nios2     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/261ca3400284a9f7d72cb0811508e996ff80ba86 |     
   mips64    |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/549f9e10b062adbc2dfb42aa08ccd64bcc3decca |     
  aarch64    |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/bb105728edb41e45b3a046c1f23f0a9e6a692401 |     
    m68k     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/2f65baf8a05655c85b4f1791e30f786e2b34f4b3 |     
  mips64el   |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/6ff34ec32984884494827f3a23aa4a2152428c43 |     
   xtensa    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/07eee5783dffa09a1b74ca99f06cb28fecf2edf0 |     
   armeb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/634cd2c73d1947068d8b816bd487b9531b24fa5b |     
   s390x     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/057be8fe620761c452515c268a2542a17324a7f0 |     
   arceb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/8444bb6307ca3729f0e8e967de8f74506aa34f21 |     
   armeb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/9edfd0509c6a83b4d7706deb52a1bd1adc91a8b4 |     
   mips64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/05bf7ff82030fe5fc5b49d03348ea85030eb3026 |     
 microblaze  |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/5c7d506b1bb0e4cd291e9fe4b544985a90a89625 |     
   arceb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/f6247464c13964d1013310b69008ee7e363e548f |     
    m68k     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/0f7d0bacfd62007ffe542492f4872b2c6859003a |     
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/6206f632566ba43f38568fa82ebac1ad8edf4946 |     
  mips64el   |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/bd0b03c5e1a3895bca1da03171128d86d66f0084 |     
   mipsel    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/0ff4bb003f48526c1abddc1be56add18cdc969af |     
 microblaze  |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/533dd000b4aca920e6d814f591d7ae41d15fbf36 |     
   mipsel    |      cryptodev-linux-1.12      | NOK | http://autobuild.buildroot.net/results/1376166f93459d280d0c9298e4ef82a62b5045eb | ORPH
  mips64el   |      cryptodev-linux-1.12      | NOK | http://autobuild.buildroot.net/results/3caf837b8dcb2b0a34381eb0b789b980cb902e90 | ORPH
   mips64    |      cryptodev-linux-1.12      | NOK | http://autobuild.buildroot.net/results/be36ffb6a449103e3386d811d6b4909ec1f1b592 | ORPH
  sparc64    | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/2fd9e5a30fdb6f9518d0c6ae20ad5c17b8dea360 |     
    mips     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/89109a89c25a7b857c8e52344938e015e12d852e | ORPH
    arc      |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/5b328e0d95a95847d7425f6ffdf2366795e76e89 | ORPH
    sh4a     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/d5e414d4b7b19e0cd2e6c8f7f9de624fb13df934 | ORPH
    sh4a     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/e7cba0eda02dd1bf756a6de35c8d68068d03c933 | ORPH
  riscv64    | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/0a140421fe9d0e2a8e45a48a212d0b30839a4058 |     
   sparc     |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/adaa1549034c2a0f2eba3279ca8999dd9e982210 |     
 powerpc64   |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/41880549f60d549294a4865af8bfe73e80d6ef3e |     
   armeb     |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/0bc6697f9427f1a7c17b39c8f7e04a6d5e6fed36 |     
    m68k     |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/ab1d3ee87c979bbeaff48f0ae7d92ed8f3d504b3 |     
   sparc     |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/517f7bfec5df0fc6746844529c2dd095d805052a |     
   sparc     |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/c12c192c8807d9bc580d47033184f2434c5d9fe6 |     
    or1k     |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/71622d71e98dea61de87c42f3f551da54acaa18c |     
   sh4eb     |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/ac5f6e63d6c91dc0b0850ebdd6c05ed32eb5ae01 |     
  powerpc    |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/63e2b5b49f5b7261064844e2f4e690b4a56560d7 |     
  powerpc    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/e69cce746ac3147380676c051100941b0d8c3d8e | ORPH
    or1k     |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/291f23347b990c975755d984fdcbb1d3f8fe9a51 | ORPH
   sparc     |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/4e3ce1ea440d4916db50c37e54ba9ac816af7c32 | ORPH
   mipsel    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/81e002a615d1e1abc5b4201b5a4e7c4fa4c052a9 | ORPH
powerpc64le  |          duma-2.5.15           | NOK | http://autobuild.buildroot.net/results/32ec270839979e2e49dc3ea5270711a17dad94c9 | ORPH
    arc      |          duma-2.5.15           | NOK | http://autobuild.buildroot.net/results/0638b7f99bc3b36766e2d6d8d054b8098bbb369b | ORPH
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/a1818b88ea2587573f9f5f8f2ebcf1ba41e413e9 |     
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/099297cc13d62758b619b1481b1693ad89749442 |     
  aarch64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/9d0c35ee6686d0a74fa7d40542abdcd4b9366afc |     
   x86_64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/2e15d3f412deaf0491c521cf3e31b5ebce1b2d5d |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/a131d999a478a265e775f998956053510da5ef69 | ORPH
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/f226ae8bd8c6b6fe433faf472f04d3ca37474dd4 |     
   nios2     |           fbset-2.1            | NOK | http://autobuild.buildroot.net/results/ece79d65cbfbb92e1b8ac06612197455ef342207 | ORPH
   s390x     |           fbset-2.1            | NOK | http://autobuild.buildroot.net/results/33cbe08278a3c08e43583bad5381b12e93b4dc63 | ORPH
   sh4aeb    |           fbset-2.1            | NOK | http://autobuild.buildroot.net/results/551ca765a698db848ab75cf3ce30003f17d31f6f | ORPH
  riscv32    |           fbset-2.1            | NOK | http://autobuild.buildroot.net/results/5a20cf8199b71a4e642307751e06a4c6beccfdf4 | ORPH
  riscv32    |           fbset-2.1            | NOK | http://autobuild.buildroot.net/results/90ff418d2d1df8808fe5695e38ea59206e73ac8b | ORPH
   armeb     |           file-5.41            | NOK | http://autobuild.buildroot.net/results/8cdce6634f956366b5e386a0f9cc1086d87216e2 | ORPH
  mips64el   |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/302e5afc852d2ef1f712a7c96dac7acb38c2014c |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/9ce697be04647cdcffe2cbd4687d597fd6800ef3 | ORPH
powerpc64le  |        freeipmi-1.6.10         | NOK | http://autobuild.buildroot.net/results/dea62647204f639b32a21570579875fd38f325de |     
  riscv32    |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/62ae9b8e9af1674cf44f7506c964508978831399 |     
 aarch64_be  |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/c4dc6c8ee78b2855494949322d9a1f6652f41854 |     
 microblaze  |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/1edfa340d105c1f60c74f388a75a8624cfe6effa |     
   mips64    |           frotz-2.54           | NOK | http://autobuild.buildroot.net/results/a004b6fff75f0bfe9a8b5edc275c75aa8ee91004 |     
   xtensa    |           frotz-2.54           | NOK | http://autobuild.buildroot.net/results/4edbd30f0dc87da491a6f5df22034481d33ba71b |     
   sparc     |           frotz-2.54           | NOK | http://autobuild.buildroot.net/results/cc22c958b97aa3cdc0853afd97ce78fca8e9047a |     
powerpc64le  | fs/cpio/cpio.mk:117: /tmp/i... | NOK | http://autobuild.buildroot.net/results/04a4a0b762ce013cd81c4a58aa4522b3d7c9ac17 |     
  aarch64    | fs/squashfs/squashfs.mk:56:... | NOK | http://autobuild.buildroot.net/results/5ff5bdf5733e2e65febecf7698299367b672dbd6 |     
    mips     |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/46f2d2d66e73e02c522ae51fbf832edda636ad9a |     
  aarch64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/426b8fe9f8487bc1e467939d6de22af304ae5ae9 |     
microblazeel |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/dea58aed92a88d40849ba10a000e8cad818d09c1 |     
  riscv64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/8088df80958b9e9bed960aa1d242f91f24848e3f |     
   x86_64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/330cefbf740ddbc839a882e7ae806307d1e7a093 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/63b05ba4f573c0ba9cdbdddd1657adb8de98e1b9 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2ace71289a94ee53aef39107c746c01ea9467889 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ad0b16b463bcec649abb69faca2a0b36b0b95fc6 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/fd4816bd8422653fdb3bf55542bfd5a1713fec63 |     
   arceb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ee96854cbf7960d83b660343c3298a84dae5c0c4 |     
   x86_64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/97b40943842d50253b6d799a7f4b5931b03b5b25 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/728e8627c2eb6b0ddd95e54532fa153545fafa35 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d09c5cf84ac861e3bfab91194cc28992f3fab97f |     
    sh4a     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/dea4b0d5f0af254d375028cf38cda0f8734376ad |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d427910d65e6ee0c74112840a958555da55884cb |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/aaa376ad555413184bf373641d1769eeb97dff14 |     
    arc      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f21f236e9c81448709753fe7252b3e2cea1b2472 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/db9ce3d59577ec9692f8192a0ca52d81fb70b15a |     
    arc      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/249006c33434a40a50875b21f3157c615119cdfb |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/803dead9199202b16a443379ef3f2d7c802a22ed |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d2fa90cf0eadf5c3ecaa7a850f6cc7b9190e0ce2 |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3c60ec9632ddeee3316854685d6ac05dc295df53 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2ac4a31dfda493c745a9bc3db9d09767724858ca |     
   arceb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/177df4950770473f3401e130a9fa992e06c05f38 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b7b0c801fc323572ffd9f9abf187f1dc93776e8f |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9d429cbaff65b90225f985db7e73d296776efdf0 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ba0bb5c7b5d8eb537f2f6fce0bf19bde7906077c |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7d153a59bc0e54e2e091ebbdaffdbe9d01e17b9f |     
    sh4a     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/07ae38d9ba027f4bb40fef993cf63b29799bc704 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5d9e8b95d59a217df639072376ee18bfad6579ef |     
    m68k     |     gmrender-resurrect-0.1     | NOK | http://autobuild.buildroot.net/results/0a9414447d7e58a63168fdc73379f056c84932f4 |     
  sparc64    |     gmrender-resurrect-0.1     | NOK | http://autobuild.buildroot.net/results/73f17229b7765e0b8b7b9d4b99d5c8a4f472eeed |     
  aarch64    |     gmrender-resurrect-0.1     | NOK | http://autobuild.buildroot.net/results/d70ce151a6968d577f98d77b4b8f943bdbf299be |     
   mipsel    |     gmrender-resurrect-0.1     | NOK | http://autobuild.buildroot.net/results/3f068c241a4606a4c5176a4db0fe0abc0840425f |     
   xtensa    |     gmrender-resurrect-0.1     | NOK | http://autobuild.buildroot.net/results/4c24ebb0bc70cac2819da350b8b3e622f18afd04 |     
powerpc64le  |     gmrender-resurrect-0.1     | NOK | http://autobuild.buildroot.net/results/054e58944a43d4307e5094b77d848d5c0054d302 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/040cba4b97331ddff8f430cf4fc5aad17e8e96b2 |     
 powerpc64   |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/87a8c1f08eade887ff89ac4fd931eac6494e09d4 | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/94c6f79d50795b5f8fa116e982327d766a042190 | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/1145e5c4151e12e1230129c5aad3a2a372a18b62 | ORPH
   x86_64    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/6731463b23097d63889142c915ccd5eb87e322e8 |     
    arm      |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/2c231d37df37b7c45b443ee5a88d8d609f774560 |     
powerpc64le  |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/0ef9d224dfdbb8b6efbed29619b01eb60fc834ed |     
 powerpc64   |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/5d1132f93bd8b397b2cf2e1baec51a792fee0b86 |     
  sparc64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/18835a1d813552039ca9379f6d65fdbcc17072af |     
 microblaze  |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/0ae91e82194d01b8dd577baa7b18b855ad91e487 |     
  sparc64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/0bee985f9257065ef54b9aac6c1e2555eae5228e |     
  sparc64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/061bb4d1b97085947f64735ca9e85e8494bcd682 |     
    mips     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/26638bd29540a905f35d6dc0124d7ec7500a8065 |     
 microblaze  |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/2ab78b4da019dda39696ccf792cc4a7c50c5ecaa |     
    sh4      |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/d6e995d6fe07dda452671f12fd21dac089900e29 |     
  mips64el   |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/a2256bd694de7cc585595c7477761a7d8ac51db0 |     
    arm      |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/029a2e62b7fa177a4abff1f7e662d7305d65b0e1 |     
    m68k     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/2ae848b7eea1e50b528981aa5f7226ae4aaecd16 |     
   mipsel    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/db22b1e21f9577afbf2fe660d1a60f3dff83ef53 |     
  sparc64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/065f753371b4374e0c28d62378d95b5c89c3542a |     
microblazeel |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/2ef175fb9e6511a7f3c2199fd55536875d6ae687 |     
  riscv64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/40e84957189a3bfc508c28e4a17b7e45c4c30aa0 |     
 microblaze  |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/822dbaac138799cf6476c88fe3b90cc1e5fc342a |     
   nios2     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/4a7e98a687c5c90a39fa625e441dc8911555b601 |     
   mips64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/288dac574f72efde40700ce5c21896c05ef90fb9 |     
   s390x     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/4cf2f9603219429f72e372c9e38818b6e1aaef46 |     
  mips64el   |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/efe6f32dd3f76ef32e01455e68d68bba2d0e02f4 |     
   mips64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/8da169a967703b516eaf5ec69a8c5f34ffb81669 |     
    m68k     |     host-berkeleydb-5.3.28     | NOK | http://autobuild.buildroot.net/results/8066e1e5858b0b48013e67d4fae414837659cff2 | ORPH
    mips     |     host-berkeleydb-5.3.28     | NOK | http://autobuild.buildroot.net/results/d3ba80bd7a604a50148f35748bd6ab4a6f8c50ae | ORPH
   x86_64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/a26271ad14eec5d473477a8e601a0884e2adb47e |     
   mips64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/f22517ed81964376060c3998537a7a1a8b872427 |     
   xtensa    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/32af7ff0a7c640ac027317ec17571c922dc95b02 |     
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/23271735473e6bfe15054c7b777da96341e7b967 |     
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f2010aa592a6a798d4d54a4df8a6bbb9c04a5412 |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/059c7415b385a7efc495183b1595b3ff5897c4d4 |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/79d8fc2c2a2ccbcd36294bfa1559328d02a612d2 |     
    or1k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/cb2f591169ce83a686880edfc38573021e69fe0d |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/616b343c6f1444a14e03839e223c38763fed15e3 |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/5dfbad5135545da511233506be36d5dbf89fed9b |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/023a2d658a955b23669c4400d1cc4e6812a2acef |     
    i686     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e83592f802ebe0da262635c4ba8c82fc86f0c84e |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/97893329dad001553fcd0f8d5c4857edad681514 |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ce247478fb57897820f57a36396939811d2c834d |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/1a49f2bb728136fb40383171d8bed79319ac06a4 |     
   sparc     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/429f96573606a1b1baec4ec8f2b6732c90e46415 |     
  powerpc    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/37e5cbcdecccefe35dae36c3901cc0b8a8e84baf |     
  riscv64    |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/019d46271678c6027f950165657fe556dfdc1032 |     
  riscv64    |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/0c5c88a5fe2a3ad35fbae3e0fbd79a4022a999ac |     
  riscv64    |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/f407bcb88e7e99abff60de4816db48336071b48d |     
   arceb     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/82d73864652f86d157b32da959a06215194223da |     
    arm      |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/3fb36969e277a4c999725db8100972eb54616d81 |     
   arceb     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/0734e1bea7e3e4864b2b3cb1bbd2bb7529499fcd |     
  aarch64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/04d1b5642b6f8128acd07eb9f38c939235f7531a |     
 powerpc64   |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/d55691d475db8d8e7272e5fb40d9e928829e46fa |     
   arceb     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/bc0599e659ffe38aeb151e0aa2bdc642f4879531 |     
    arc      |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/d0a461b362fbac19a21293efb89836d4b4414302 |     
powerpc64le  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/708cb50f9968a6bc365263b58bdfd0f5fa1b2290 |     
 aarch64_be  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/ef319c1353d951fff15c8bb81c2775476158ab9c |     
   s390x     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/eb14227f9d32da638be653e36f0d6eacfff32354 |     
    or1k     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/0653c12561ca3b54f2778c164e5baf6e83212cad |     
  riscv64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/11c647b62200349a6200a46809f5ef14359be869 |     
    arc      |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/ae171f97b88e1998e6ac0fd776024e73a733ae7b |     
  powerpc    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/95207cd6f6c44e4e7663b2887dc610db31412da3 |     
powerpc64le  |       host-gauche-0.9.12       | NOK | http://autobuild.buildroot.net/results/893f4a9229fcf4ab9b0238a15a67b23487db5bc7 |     
powerpc64le  |       host-gauche-0.9.12       | NOK | http://autobuild.buildroot.net/results/7e941e7938cb8577867f07eac6106bb35db99cf7 |     
  powerpc    |       host-gauche-0.9.12       | NOK | http://autobuild.buildroot.net/results/5c266344a524222e561f79cb8fc25e9a1734afc8 |     
   armeb     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/a61dc7d217cbd382bf381f818755e5c9fc8d6709 |     
 aarch64_be  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/dcee1304f497f8ebc346cb1deb415ca0666e68ae |     
   x86_64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/2a5b0c8581a05d4ff6044feddef2414766ad7ba7 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/34731d961899a17ba75873d982943466974a2367 |     
   x86_64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/028c34b0f780867ccc569800ed550e9cbcf800b4 |     
    arm      |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/a0d1f917785f383508bd5c7007c8450c54ae3803 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/1adb3303ac36fd8f7b5d07f766dd286744237307 |     
    i686     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/7f846f77b6ad70f7921e4ca4f4b69a9c09d37d67 |     
 microblaze  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/e7b2eef6a9dac294a26f147ea9a32f0150480148 |     
    i686     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/4b0a9eb126d10bb80f7473de96ac66394db4c4ea |     
   x86_64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/6d62d8b978e53aa38e303928058694e9187a1b95 |     
    i686     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/52ae4ee1180b4060a823f15a61eab0c664d9a142 |     
    i686     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/077791bc4c92148c0407808574997b1e88da2fff |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/590c993f24d4dc1c59e88e33d781e864d9e3c9df |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/99b3625d0b67004f13742c68e8753fdd8155b973 |     
   x86_64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/08c84f0fd867157c4398e45b4863d995f9f489e8 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/82b2f6dbcf997d64c6cc650b38534b22292fdc4d |     
    i686     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/76a2cf0b6d4a999a930d245f88d5daf52c7725b9 |     
   x86_64    |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/85df4ee78aea9f14b03aeca54598f581e480bb76 |     
    i586     |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/6bca5dbdad5735ea2e704fcbda3289cd5d8d3802 |     
    i686     |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/bc7486df309175230ed43f321ed40bd1d6912155 |     
   x86_64    |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/a50b39978236b8588c31c75840ddf4a0c9667c4f |     
   x86_64    |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/8c0fb570519df8a8af115d0797a688629417b160 |     
    i586     |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/45f652838c1de8b1cad7217a5783b03197b857ef |     
    i686     |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/8108187ff009f615820830e35cdb356dbe93bbe4 |     
    i686     |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/c6a8faec7b59ecfeeacff801d0c4691d1bf97eed |     
   x86_64    |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/a4a24306e93f9c8d6654e38d202b66f72a4d8e09 |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/3646102b8094669c9305b2338bbfdf436f028033 |     
    i586     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/6fdb549741222afa4f4b087f087253a56a2e2c96 |     
    i586     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/0907fe371efa7572b66a29d2b8293a0b6d869994 |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/6b40c68f63e2688a3730301201ab208df1687f84 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/4fb65a4b44f23bca3eea6c1b73818786493c4fd9 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/ac3888d5e9f205541ee87f42b55189c420d3c031 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/4fcbed6379204d3c87e423787b4358b0f9c26d8a |     
    i486     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/430134dd47351f6894328484f94f5e4e3e55a886 |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/06d485a6bc88d88feef3baebed769fb12c606365 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/e868f4161f49f0b50fb76495518067f6ad99cefa |     
    i486     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/303f18d126f4bf7138ba087cba2e2100c0a1f061 |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/c028a39a42d6971157bcae5ca906d9a9dd8b1066 |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/419d2b7139fde8dc23b97cc35587c7b1a908ea22 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/4a4553de37421a74eb09d13cc8018b739e2b0522 |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/e980f26e1b4393292d29ffc9f99d3f73e8e06ad4 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/0b427c953f40a0469463eb61a1ce16f82393638a |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/d5f78c4883114474498cd9bc405798d1f0a37a38 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/e2542e702cce1edc8e9f44902ac2d8c9b769b386 |     
    i586     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/05ed7648480add94c831c315b7c04de46cff8468 |     
    i686     |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/5724b27d7287b0ab45bf761827d28b9fb09d0507 |     
   x86_64    |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/3b4b47c6e7b14117045a219ffb55ff760f1d3158 |     
   x86_64    |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/7dbdbfea8c6fecd384f6649372fb238d31b8f965 |     
   x86_64    |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/faa840690060f3ac79b424497e4db9fd37e3a75d |     
 powerpc64   |         host-gdb-11.2          | NOK | http://autobuild.buildroot.net/results/0565e2e83765fe3f46e33d27a1a901252c5e8f0b | ORPH
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/88f7c23c5158c6a86c680be19179f1d5eb4411e0 | ORPH
powerpc64le  |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/36f2cf3408937a4e99bad839dfc0d735773787f5 |     
  mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/19f51b9e0a2cd2621231b9bf036a7396e8e51de1 |     
powerpc64le  |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/6bee4746b469506cf535c76599beb31309a88062 |     
   x86_64    |   host-moby-buildkit-0.10.0    | NOK | http://autobuild.buildroot.net/results/fa6e8c237c64b05cb5be5dff190afa2998a58d74 |     
    arm      |   host-moby-buildkit-0.10.0    | NOK | http://autobuild.buildroot.net/results/0884a5fb3d82f827213de77bf456b2ff5cf14497 |     
  aarch64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/c743ca4421f377018782b6163dc2304d7eabde76 |     
 aarch64_be  |     host-protobuf-c-1.4.1      | NOK | http://autobuild.buildroot.net/results/07cd0a5e8f2e83c5942d6cc3a1d0fa360f00810a |     
   mips64    |     host-protobuf-c-1.4.1      | NOK | http://autobuild.buildroot.net/results/3e489377da8be9d8068bf05d0469264f780d45bf |     
    or1k     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/9ef8e840b02a608f8433e08e723aef7bb0080228 |     
   arceb     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/8dfbcd6b80240b00fc5d44d01a19bddd89afd778 |     
    m68k     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/35d625b4c966dc9ed3946dada1f379b8175494f5 |     
   mips64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/31043a781b85068d6d2f3c729c6504e5cf35ad32 |     
   sparc     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/6580d2523420b6e5b25a716a0c268ffdf976b66c |     
powerpc64le  |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/4a2a780bc0b38b272b1e3ae1cf08e0cceeae9dc4 |     
  mips64el   |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/22215a2beb0f99bb1b4d759299c4c98e6dd86ba3 |     
powerpc64le  |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/8eda7f975b303326eaf0c9fb3e27f6237da57caa |     
    mips     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/8c2bca10e06aa84d268ce71333ab6ad1c1442fea |     
  riscv32    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/e86ef41b4cb381d0d296716e94fed0884f5976b5 | ORPH
microblazeel |        host-vde2-2.3.2         | NOK | http://autobuild.buildroot.net/results/89377908f0cfc83462daabd944e79ebce5a68bd1 |     
   s390x     |        host-vde2-2.3.2         | NOK | http://autobuild.buildroot.net/results/45bebe20265f5fb6f84c3c8bfedb2e13617a77a2 |     
    i686     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/97468cd4e682f8ccded7e026b8823fe57232e3d3 |     
   mips64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/e55bb7db9a1d13fecfa28a9c789dfaf26c44011a |     
    mips     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/7608a05d969f0775e05466264e8b7f60548240d2 |     
   sh4aeb    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/b63f811bb9c071ccbac1b9143694b732742ac94a |     
    sh4a     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/ae8134fc8179d078850464c77293ebaf00bd1c2c |     
   mipsel    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/d940df1c4b4ee469752a7e6a8088ef980547bb8c |     
    or1k     |         jhead-3.06.0.1         | NOK | http://autobuild.buildroot.net/results/2f7ab080a4bb514f89193b81f390ad1c73d391bf | ORPH
  sparc64    |         jhead-3.06.0.1         | NOK | http://autobuild.buildroot.net/results/3178de2f73c58b5e5c33eca0727702b7dad7e69a | ORPH
  riscv64    |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/4adf3c105dbeb0644326d15225e3d94c217f0bf4 |     
   mips64    |    libabseil-cpp-20220623.1    | NOK | http://autobuild.buildroot.net/results/f4f65dbd210ca05bb4f5380e3f3c61359821e6c8 |     
  riscv64    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/8cc34926c6266d94234c60149ca0c0678223245f |     
 microblaze  |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/0a14e7920b9c377d8dea48893186a71d3f57b9f4 |     
   s390x     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/385d320965431aaf11ce564e517435c5696d57c9 |     
 aarch64_be  |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/d10b280cdd27a453294e5382afeafc1542fa2838 |     
 microblaze  |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/1050f9bd33ed688c8b88f8e30aebce9e9c89ed99 |     
    or1k     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/13a958ffe26c4de0f3c913a3d425e0409cea0575 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/4495b8d430c085a238b2d026ba705c02b589e564 |     
    arm      |        libdcadec-0.2.0         | NOK | http://autobuild.buildroot.net/results/6e7b3d1eaba53d86102be03f0e387e1a3b2b581e |     
   mips64    |         libdnet-1.16.1         | NOK | http://autobuild.buildroot.net/results/d5df5440ee47e9cf1a252493aa05ca0514bcef53 | ORPH
   sparc     |         libdnet-1.16.1         | NOK | http://autobuild.buildroot.net/results/aea45077c408a776fa56614535b597457862fabd | ORPH
 aarch64_be  |         libdnet-1.16.1         | NOK | http://autobuild.buildroot.net/results/343eeaa56842598c133fac5d239b2ec3a5a2a820 | ORPH
    m68k     |         libdnet-1.16.1         | NOK | http://autobuild.buildroot.net/results/e0d4bf9598f99f2be49716a5ca6bc8140507dbe8 | ORPH
 microblaze  |          libee-0.4.1           | NOK | http://autobuild.buildroot.net/results/2559a2408b1d7667ba4a1f7e5c7b59b67c0621d9 |     
  sparc64    |          libee-0.4.1           | NOK | http://autobuild.buildroot.net/results/2f93976bac947d2aadf742ff98dead5fbcbb7250 |     
   armeb     |          libee-0.4.1           | NOK | http://autobuild.buildroot.net/results/793e0c9c45935b238f022cacf319e7568b934a59 |     
    arm      |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/0e479f90648f8527c65565fce83fd015d7c5d642 | ORPH
    or1k     |         libgeos-3.11.0         | NOK | http://autobuild.buildroot.net/results/4effc1ece7fad93f877da57fc5465b4e4aae8d2a |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/1792f96288c90804446195805558bf712d1e4a30 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/c802f43f1ad119a40fea941962a08bf2ab01cd69 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/daed23ea431589544f80212b546b8a97fd95ec34 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/b7ec3bd46706348d9b5cf6711d880a77246ce5df |     
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/6956aac37ea6e541a4ae10e3ceb2311cfe7e6e56 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/21de4a1e3807d10a7acfa0d78a8a20f2c8fad726 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/d05817086837a831f4c145221c6932dac40ace4d | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/f2bf51938dcaa4d666053a4ec1e03ee6ef58d63e | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/3efb63819fe2a06d6ee6ca2516f7520f0ff486e9 | ORPH
powerpc64le  |          libnl-3.6.0           | NOK | http://autobuild.buildroot.net/results/d11924517ebf5e1321c25b087744392f4f08221a | ORPH
 microblaze  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/c760eef1f27c79f14256f16c1df561585db7f81b |     
    arm      |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/b8e1f86197363231cd6152c88bacf97b10caa105 |     
  mips64el   |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/1a6faa5b68e25b7e567581e06a25c1d1f7a2e064 |     
  aarch64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/c8208cf000d530f0c112c2dd9ac2331aa47d96a0 |     
  sparc64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/6425a34d7448a181a33672895496af4129c1905c |     
   mips64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/94252cc588c0450408a7dde38dee7a835673bc84 |     
   s390x     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/a615fe8dbabf631d0246401c85e9ea748a62944c |     
powerpc64le  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/1d937ca56b04dc4a94c5dc0912f8132cd12b8616 |     
 powerpc64   |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/93564ac1a44a556fed87e2e49e6da3b9d1e892ac |     
  aarch64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/207dda914235ff80528b89589bbf1dc2387a024d |     
   x86_64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/836a74b128cefb66158b99c23e9ff2bb0215531b |     
   nios2     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/8e8821555dbcb043f20a087d32a501df69d32e1e |     
powerpc64le  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/adcc15f6f63985485f575460b56d2bbae6012a8e |     
    or1k     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/dfb95cc5ea231650ff8a9b6feace9c4a213d0e16 |     
powerpc64le  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/1068abc701bdabfe1ed1a2a995401cb5f7e9c80b |     
powerpc64le  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/7f8f0a45983416e5f2be04996df1d15af448cc98 |     
 aarch64_be  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/0fab09b8bd174a431fda0119e1f69134ce6ac287 |     
   arceb     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/744f0efbbd719aebc28dec352f1458f7fd69d538 |     
 aarch64_be  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/a7d1a8124512439254fabe9c7cfeaebf74bb92af |     
  mips64el   |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/5fc27b7396682853dff568ef13c33eebf76b7c2b |     
  mips64el   |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/3edd92edfa5abc0d6e094fd97df67d9d472c131d |     
   s390x     |        libostree-2022.6        | NOK | http://autobuild.buildroot.net/results/5d95e1f7b61deef2d2b11a2005256b93aa1ced3f |     
 powerpc64   | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/16b12ac139f04afd95b9e291f5d183da668cbfbe | ORPH
    or1k     | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/14ed49d25575f6b18ef55fba585d3094910a76f5 | ORPH
   arceb     | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/33b3da8a2eb9d44a98f94a164a1c532c972ffddb | ORPH
   armeb     |         libxml2-2.10.2         | NOK | http://autobuild.buildroot.net/results/7f8afa1e12a1fbe53d945ae3ab3774281a491c5a |     
  powerpc    |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/284db159cdec75d5f36f1d5b3c9675a7a0525f06 | ORPH
  mips64el   |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/478e807a667367b8d39f1aade09d963117593f8d | ORPH
   xtensa    |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/85282c977b3034df8bf3a6f2cc98f93765772640 | ORPH
microblazeel |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/b90a180c2c8704dd9c69d47e09916061ebace6dd | ORPH
    mips     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/a69e94bef4cd044835d1cb9a5a4e8cf99e6916ae | ORPH
    arc      |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/3f6678a942a32a033c2b257536b4e7bb3063ef1e | ORPH
   sh4aeb    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/bcbcd82623d496a3790c0b7f5c53f8ea93a64b94 | ORPH
   mipsel    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/d53586179b98aa4b867f53259fe6791eac4bb8d4 | ORPH
   sparc     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/534792f273a8092d8028ebe3c27be03c0218aa4d | ORPH
  powerpc    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/175bd208fca11463ab725a2f93dc648d7c41fd0c | ORPH
   nios2     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/f8441f070e49091c07d342f536d6837a42eb7510 | ORPH
   xtensa    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/54a7f6ef2f2c074ca5b2481ec1ce0d8aedc1ac60 | ORPH
 powerpc64   |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/20d26a5cbd3c602bb003aad32c941ec477fb703a | ORPH
    m68k     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/d6876cce1cbe16d2822a64b02d7b6bf7fa940620 | ORPH
   s390x     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/88680de17ae5607562503e894eb8b381185b255e | ORPH
   sparc     |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/83bb72afb0eb07484ac7189cf644fa82cb144e67 | ORPH
    m68k     |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/94be962ffe5ee0f282f12d06d1ecadc217724813 | ORPH
   xtensa    |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/d52367f55d19c3b50844ab07f19b2024d4d21a8e |     
   arceb     |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/4351a58bb1b6ca428aff56b10ef7cc663fc51852 |     
    or1k     |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/5eab737e19d2a238de82d61e770407b061fd10ab |     
  mips64el   |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/f88f3818f7eb345f870744e1f7f54da165c1298e |     
  mips64el   |         moarvm-2022.06         | NOK | http://autobuild.buildroot.net/results/fadf7afdf7928ae7da702b1d1eb60dd358637a02 |     
    sh4a     |           mtd-2.1.3            | NOK | http://autobuild.buildroot.net/results/a186488ecd046cab3ba587ff4a12ce8ff983c809 |     
   xtensa    |         musepack-r475          | NOK | http://autobuild.buildroot.net/results/a33bc0a3f360714c820446480fd74cf861b7554e | ORPH
    sh4      |         musepack-r475          | NOK | http://autobuild.buildroot.net/results/dd873dae8ad6e04ea522643d6af8aaa404838d58 | ORPH
    or1k     |         musepack-r475          | NOK | http://autobuild.buildroot.net/results/660554c5466c74efb5efcc4de17e5af31c9def9d | ORPH
   arceb     |         musepack-r475          | NOK | http://autobuild.buildroot.net/results/f36e5ccc3309ba45e8b326ae54f7bbfe41ac1adb | ORPH
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/a83b1a14a32b8afa4191de954da36db3b6f489e7 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/823d1a683b7509226ab1a6a2457696a23ea8438d |     
    arm      |     mxs-bootlets-10.12.01      | NOK | http://autobuild.buildroot.net/results/0c91ac6a30b5114553820988b5d852769d7138b7 | ORPH
 powerpc64   |          nanocom-1.0           | NOK | http://autobuild.buildroot.net/results/ee67bba638858cf090aac0b295cb89e236b8645b |     
   s390x     |          nanocom-1.0           | NOK | http://autobuild.buildroot.net/results/965e4f9e99f525669d8684c5aa75c013f0814200 |     
   sparc     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/4bc065c9f83c5305232c99ced142ca906fe021fc |     
    arm      |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/709ab9d18cbbe7af81aac18c6e2dc01b430c25ed |     
  sparc64    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/4b91941c505ae9296f80e010ea9597b5be5bc4aa | ORPH
  sparc64    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/c52034d854b7fa4bf611ec975bb71128745612a9 | ORPH
  mips64el   |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/e67d91dcd40af15642d83da853e916f450cef68b | ORPH
  riscv64    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/a33e37386d227777f69f3fb9d99fa988cf608798 | ORPH
    or1k     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/ba8f3082e074a91703802568f992e863e9743967 | ORPH
   mipsel    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/14c42121577bd188831e8fe8d3d86ae25ce8e8d4 | ORPH
    arm      |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/59902e15207a5051d6ce8a3b865f4ab4b3fc696c | ORPH
   sparc     |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/179fcf524cb1a679b278d01e4bae8dc1368dc831 | ORPH
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/25dc120adbab159ea9d421b79ae78d5669d99bf4 | ORPH
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/2d2990c93cabe9e36bb09f26dfad74aa2c659b2f | ORPH
    or1k     |       openssh-legal-info       | NOK | http://autobuild.buildroot.net/results/3359e67d345ac608b8e344b730eb96924b058ebb | ORPH
   armeb     |       openssh-legal-info       | NOK | http://autobuild.buildroot.net/results/0cf3ffbecedc452f8d6dad51d85093926ab91d69 | ORPH
 aarch64_be  | package/openssh/openssh.mk:... | NOK | http://autobuild.buildroot.net/results/806b3b4368ae51d5a8e193a36102c2d4fcdc8e2f |     
  aarch64    | package/openssh/openssh.mk:... | NOK | http://autobuild.buildroot.net/results/60bdecd0f3759c2e4cc391347c6423f13e2af89f |     
   sparc     | package/openssh/openssh.mk:... | NOK | http://autobuild.buildroot.net/results/b2ce3088e1aa2a2fc7b760e3042f60b31afd69a9 |     
   arceb     | package/openssh/openssh.mk:... | NOK | http://autobuild.buildroot.net/results/b07996dc095e012de819d6768b91468f2d03b68a |     
  riscv64    | package/openssh/openssh.mk:... | NOK | http://autobuild.buildroot.net/results/af92f15f61f03b5c934eac6bd97d03dbffa60532 |     
    arm      | package/openssh/openssh.mk:... | NOK | http://autobuild.buildroot.net/results/3265b665e22883c95d1071c568f8bc0600328e2d |     
powerpc64le  | package/openssh/openssh.mk:... | NOK | http://autobuild.buildroot.net/results/8694cce57cf2f8dcced580ffe52111573e9a71c4 |     
  sparc64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/5e5da157df8531e37827536e832fd98de26fa6a4 |     
   nios2     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/58990fbb7cfe25a56abbe6fabf43c062b31decf7 |     
  sparc64    |   portaudio-190700_20210406    | NOK | http://autobuild.buildroot.net/results/71d032e02970cfbed7eee1d8c4aac4b2ce77460f | ORPH
    i686     |   portaudio-190700_20210406    | NOK | http://autobuild.buildroot.net/results/f4f79953d10ed127820003fdf4e0b064ead906ab | ORPH
   sh4eb     |         proftpd-1.3.6e         | NOK | http://autobuild.buildroot.net/results/1be5f018082b1442876e053fdbbedd53833fcb64 |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/825f99fc51d1d8dc18af735e75d8a4606a2fca38 | ORPH
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/1a54538df3b2b36defa878f42d801873ea8d9cf8 | ORPH
 powerpc64   |     python-greenlet-1.1.2      | NOK | http://autobuild.buildroot.net/results/b4287b4590a62d7dcbd23f48414ffd51c5fa1bcf |     
   nios2     |       python-ujson-5.2.0       | NOK | http://autobuild.buildroot.net/results/b5bc0644e132040cc9c374f6ec4a1f20d2fcfc2e |     
   x86_64    |         python3-3.10.7         | NOK | http://autobuild.buildroot.net/results/b02651bcc1ffd01e1dc118775eff70547245abcc |     
    or1k     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/39cf727e1f6b93d2e0a3e46b37a30fb95778ad78 |     
   mipsel    |      refpolicy-2.20220106      | NOK | http://autobuild.buildroot.net/results/75c3eee4da408e202b99b479009c2f33bd5ff8dc |     
    or1k     |      refpolicy-2.20220106      | NOK | http://autobuild.buildroot.net/results/141ca9a77d5acd92b8cbe0ca84a811dde73e7335 |     
  mips64el   |      refpolicy-2.20220106      | NOK | http://autobuild.buildroot.net/results/13f15f229b1bca684c84755d7e0501c68dd2c0b6 |     
   sparc     | rtl8188eu-903b6fcb821465fe9... | NOK | http://autobuild.buildroot.net/results/550640296a92826f6f04d2344adde75c3025ea35 |     
   mipsel    | rtl8723ds-76146e85847beb242... | NOK | http://autobuild.buildroot.net/results/c617ae1c5f2f0754e77a4d2575138b3102df4268 |     
  riscv64    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/2e09eaaff9c9fbf26e9f7d77b04c978fb6691e58 | ORPH
  mips64el   |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/aa7cd8f1de98b0b203a98ee0db922d28bc2c9e39 | ORPH
 powerpc64   |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/f070e85ab15343a56306ca294b9f591d113c3f3e | ORPH
   x86_64    |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/df70eeb89ba25dc975d928035c151ceb90ee8248 | ORPH
   xtensa    |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/ebf4c4bdb3c1bfabf8d3e9ceaa34f2b666d5a028 | ORPH
   xtensa    |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/10cd40618e4e41ea45a2e9abba56e2a1b0145ade | ORPH
 aarch64_be  |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/eef4af5f346261d9089c4b8047b76fe69222adc7 | ORPH
    arm      |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/abf42d5afe25fb2ec967d0ff2c4b0d5a2f8f6bc9 | ORPH
   mipsel    |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/2d9c6836699f2ea40f069cb2d316ebf3bb252ac4 | ORPH
   mipsel    |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/70ace42f0f74d0d582b057954332b5764d53db3f | ORPH
    mips     |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/ab0582e5c2c1fab9bbe506145fed689167f1d710 | ORPH
  mips64el   |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/7f88f4b70cd1bedb217eeff41aadc4205c55f6d4 | ORPH
   mipsel    |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/711d56560225d86fa253722ad40efa50da307d1b | ORPH
    m68k     |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/465fd5a87e01a7db391fc42e58606a8a7e9fed17 | ORPH
 powerpc64   |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/a019ed89d80cf6965b01bb6ab90fd1474d2aca87 | ORPH
powerpc64le  |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/087d973909653860f1e3f64bbe0fadceb19cb171 | ORPH
 powerpc64   |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/4fed79016e15cc80fdfc7b25c10355b987ac8ec3 | ORPH
    arc      |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/f9cb464d4cd1a9aa1af906c3cbb1cba7b8909063 | ORPH
    mips     |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/331c311b35f4bc3a9a974e6c0fc1287c71b6923e | ORPH
  sparc64    |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/7f0abfcc4370f84cc507f341646a8db1996299de | ORPH
powerpc64le  |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/3cab2b2e0c694a43b960c7e6b05f046e5af25db0 | ORPH
    sh4      |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/86258830ae0ebacd40cce88b480da382d496e93b | ORPH
   x86_64    |          spice-0.15.0          | NOK | http://autobuild.buildroot.net/results/273eadf9e49af55e0932a8293ca65762fb43114f |     
   armeb     |           sslh-1.22c           | NOK | http://autobuild.buildroot.net/results/bd2d6413904a8be1085a165f092cbaabf6c0f0b8 |     
  sparc64    |           sslh-1.22c           | NOK | http://autobuild.buildroot.net/results/0bb069685d1d1f3604c07023f35c64b8adbc0e85 |     
  mips64el   |           sslh-1.22c           | NOK | http://autobuild.buildroot.net/results/e745a2f2dfd8d06df5a0dcc4c6c69534f67c4989 |     
   s390x     |       stress-ng-0.13.05        | NOK | http://autobuild.buildroot.net/results/042b9933baec07475124e2e103d83ad69b245fd2 |     
 aarch64_be  |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/1434682911f27fca4ba77bf8a91630d392a7ab27 |     
 aarch64_be  |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/9a22059ebd2a89a103ef2c960353f80dbe5ad3f6 |     
  aarch64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/49c945a24b90f1b04a24b2b0d342ebef36f48041 |     
  aarch64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/840fc22d0a3073cfa23c7d1596bb80fdd8f6e747 |     
   nios2     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/6b885410e7f663bd92e5cc6116edf8f352e2ad2c |     
  aarch64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/507c617c54b3aaa28ed4fb3135eae647dd52f2d6 |     
  sparc64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/54b78b6baf8f1692f5b3e45b2445c1098e8af9a2 |     
 aarch64_be  |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/835cc6facebee721cff05c8e570b992924bd56e7 |     
   nios2     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/4fafacc9312ac4546f3536af46f12fdc559f7729 |     
  mips64el   |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/425a8df3a8d83dc24f9f0906cabda68864eb1aeb | ORPH
   s390x     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/cde5936275788113d3b12817f192b2b5e6aeba98 | ORPH
   mipsel    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/c9c30183eb762966e4c1a1d03a7c2bc799bfc083 | ORPH
  mips64el   |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/a6bcb4308f18dc8272aa9087843cdfb5c1131016 | ORPH
  aarch64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/84541dbdbe7dd0f082ff31f62f5f9172d0b01b16 | ORPH
   s390x     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/2554c34e8e3e94636e2285a3a2f784101c38fc5e | ORPH
    arm      |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/00ce3ebd308f48da4372b7f664a28de7d06489c7 | ORPH
 aarch64_be  |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/98be4625075fa205ed6c28c9bdac4d39fb4da70a | ORPH
   s390x     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/50d277575b7047ac09d60305460a4ae47fddeeae | ORPH
   nios2     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/fd9c7f52ea23bf362831d8bcddd846c28c398c2c | ORPH
    mips     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/3acf0bdf979ccbcdd5bb17e905fa76969801789b | ORPH
  sparc64    |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/e0941302b7b6d2bfc19c55097e8db5e033a7d808 |     
powerpc64le  | tstools-08f6be304040e7b8476... | NOK | http://autobuild.buildroot.net/results/87cfb25dacc68532dc1d542d33b654462a45c0c4 |     
   mipsel    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/7d13ee95a8ea0b8130769b8d5d74444360beff6b |     
    sh4a     |          umtprd-1.6.2          | NOK | http://autobuild.buildroot.net/results/b65e2f76840b1ef7b1398b0e1e1e728ea657adf7 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/90505d075baafc3b57fb6a6a7bd26ff98f6d1969 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/b2559aeecc8add076dbfa6bb321c9d6437dcc410 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/45f7b431a038c065850495cd5012d209eba8f1eb |     
   mips64    |   xserver_xorg-server-21.1.4   | NOK | http://autobuild.buildroot.net/results/6c60ce857d54e326ee2ffcf67ee176fc102b2d00 |     
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/4575498d4108cd2256ed798ddc7527d2c10d445f | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/33823e6f9cd3c1466302f16a5b45fc3683b05560 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/7a1836c5a13d3e5e317593c52de4bad974f16f79 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/6f1a2f25cb8223c0faec228a160663fd5083896e | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/14c3ed64bfbb1e96d0298ca2ae9f2e3d07c3c596 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/399a237d06e01c9332bd7e06612aa07aba7f534a | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/44ce7c0b0bf9b8dad435cf206b7dbe405dd9c968 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/5995456a1f4e0a303f4a10fa85de078ae479912d | ORPH
  mips64el   |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/a2c066a4dc2c8b54ab0e17aac39bf1f2c957fc40 |     
 powerpc64   |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/fbf194c242a648949c9043aed998d1387cd23c4e |     
  aarch64    |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/df46cd40b3e30808ffc0bc4464c1d13c5fb079cb |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                       frr-8.1 | 1 
            igd2-for-linux-2.1 | 1 
               poppler-21.12.0 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/6f4f89587266afc8d90fd2c1b58a9f6017e00ad0 |     
   x86_64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/1bf1724ee2537928bc24d3e4ef2f7e5d528bfeb3 |     
   xtensa    |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/c55dc9daa4ed9137e544a3f2373e2441f5c643b8 |     


Classification of failures by reason for 2022.08.x
--------------------------------------------------

                gerbera-1.10.0 | 3 
              host-rust-1.62.0 | 3 
               ding-libs-0.6.2 | 1 
                 dmalloc-5.6.5 | 1 
                host-go-1.18.6 | 1 
                  ntpsec-1_2_1 | 1 
            openssh-legal-info | 1 
                       unknown | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        ding-libs-0.6.2         | NOK | http://autobuild.buildroot.net/results/98b4167a46c405b2988b20f37646d8d45c45850d |     
  powerpc    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/0b3be2087b4e6a77407ca662b6cca013800a41e6 | ORPH
  aarch64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/ae54578edd76c3ee9b1d623b0edc5eac4e0824d1 |     
    arm      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/dd62547108b292e8fad7712d95edd99b6ca8b487 |     
  riscv64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/018d74a5eaf825e2030b1bc7c331a5e3f75052a9 |     
  mips64el   |         host-go-1.18.6         | NOK | http://autobuild.buildroot.net/results/f0f412509d7d09d770f6dfcaa26107f0bf4a6ed1 |     
  sparc64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/aededc7ca86c01d8edc7ef5162c4b0c5820e515b |     
  sparc64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/a5657f692ed9b7308750b243f438a2ce5d24295e |     
  sparc64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/b0015fc36797537af87d0eb01b6c5f47cc53a727 |     
microblazeel |          ntpsec-1_2_1          | NOK | http://autobuild.buildroot.net/results/3a57d5ea32901832bb1ccaf78a72e4daed0a1ef1 | ORPH
    arc      |       openssh-legal-info       | NOK | http://autobuild.buildroot.net/results/4443ae93a17a38917d458e1d2ca56213ee4515d3 | ORPH
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/dbcf96949f641b97d3965d3b2963fecdee14d43b |     
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/af2ad48c96aa5ecd9fe8d97c18466a288a203a8c | ORPH


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org        |   version    |   upstream   | orph?
-------------------------------+----------+----------------------------------------------+--------------+--------------+-------
                           ace |  DISTRO  | https://release-monitoring.org/project/242395 | 7.0.6        | 7.0.9        |     
                         acpid |  DISTRO  | https://release-monitoring.org/project/00019 | 2.0.33       | 2.0.34       | ORPH
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/13117 | 3.37.2       | 43           |     
                       agentpp |  DISTRO  | https://release-monitoring.org/project/21316 | 4.5.4        | 4.6.0        |     
                        alfred |  DISTRO  | https://release-monitoring.org/project/241870 | 2022.1       | 2022.2       |     
                  alsa-plugins |  DISTRO  | https://release-monitoring.org/project/00041 | 1.2.6        | 1.2.7.1      |     
                 android-tools |  GUESS   | https://release-monitoring.org/project/13989 | 4.2.2+git... | 13.0.0_r11   |     
                     angularjs |  DISTRO  | https://release-monitoring.org/project/21321 | 1.8.2        | 1.8.3        |     
                      apitrace |  DISTRO  | https://release-monitoring.org/project/06170 | 10.0         | 11.1         |     
                      apparmor |  DISTRO  | https://release-monitoring.org/project/94819 | 3.0.4        | 3.1.1        |     
                     armadillo |  DISTRO  | https://release-monitoring.org/project/07006 | 9.900.2      | 11.4.1       |     
                      arp-scan |  DISTRO  | https://release-monitoring.org/project/00110 | 1.9.7        | 1.9.8        |     
                      asterisk |  DISTRO  | https://release-monitoring.org/project/09838 | 16.25.2      | 19.6.0       |     
                   at-spi2-atk |  DISTRO  | https://release-monitoring.org/project/07840 | 2.34.2       | 2.38.0       |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/07841 | 2.36.0       | 2.46.0       |     
                         atftp |  DISTRO  | https://release-monitoring.org/project/15219 | 0.7.5        | 0.8.0        | ORPH
                         atkmm |  DISTRO  | https://release-monitoring.org/project/07962 | 2.36.1       | 2.36.2       |     
                         audit |  DISTRO  | https://release-monitoring.org/project/15225 | 3.0.7        | 3.0.9        |     
              autoconf-archive |  DISTRO  | https://release-monitoring.org/project/00142 | 2021.02.19   | 2022.09.03   |     
                       avrdude |  DISTRO  | https://release-monitoring.org/project/10751 | 6.4          | 7.0          |     
                        avro-c |  DISTRO  | https://release-monitoring.org/project/59411 | 1.11.0       | 1.11.1       |     
               azure-iot-sdk-c |  DISTRO  | https://release-monitoring.org/project/21322 | LTS_07_20... | 3033-01-05   |     
                        babeld |  DISTRO  | https://release-monitoring.org/project/00154 | 1.9.2        | 1.12.1       | ORPH
                 balena-engine |  DISTRO  | https://release-monitoring.org/project/141616 | 20.10.12     | 20.10.18     | ORPH
                          bash |  DISTRO  | https://release-monitoring.org/project/00166 | 5.1.16       | 5.2          | ORPH
                           bat |  DISTRO  | https://release-monitoring.org/project/241901 | 0.19.0       | 0.22.1       |     
                        batctl |  DISTRO  | https://release-monitoring.org/project/14740 | 2021.0       | 2022.2       |     
                    batman-adv |  DISTRO  | https://release-monitoring.org/project/19529 | 2021.4       | 2022.2       |     
                     bats-core |  DISTRO  | https://release-monitoring.org/project/10587 | 1.4.1        | 1.8.0        |     
                     bctoolbox |  DISTRO  | https://release-monitoring.org/project/14746 | 4.4.8        | 5.1.64       | ORPH
                         bdwgc |  DISTRO  | https://release-monitoring.org/project/17108 | 8.0.6        | 8.2.2        |     
                     belle-sip |  DISTRO  | https://release-monitoring.org/project/14378 | 4.4.8        | 5.1.64       |     
                          belr |  DISTRO  | https://release-monitoring.org/project/80042 | 4.4.8        | 5.1.64       |     
                    berkeleydb |  GUESS   | https://release-monitoring.org/project/138386 | 5.3.28       | 18.1.5       | ORPH
                          bind |  DISTRO  | https://release-monitoring.org/project/14923 | 9.16.33      | 9.18.7       | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/07981 | 2.38         | 2.39         |     
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/13618 | 0.21.2       | 23.0         |     
                        bonnie |  DISTRO  | https://release-monitoring.org/project/00212 | 1.03e        | 2.00a        | ORPH
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/21578 | 4.3.1        | 5.2.2        |     
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/00227 | 5.16.2       | 6.0          | ORPH
                        bullet |  DISTRO  | https://release-monitoring.org/project/07669 | 3.21         | 3.24         |     
                        c-icap |  DISTRO  | https://release-monitoring.org/project/21325 | 0.5.7        | 0.5.9        | ORPH
                c-icap-modules |  DISTRO  | https://release-monitoring.org/project/21326 | 0.5.4        | 0.5.5        | ORPH
                         cairo |  DISTRO  | https://release-monitoring.org/project/00247 | 1.16.0       | 1.17.6       |     
                       cairomm |  DISTRO  | https://release-monitoring.org/project/07959 | 1.16.1       | 1.16.2       |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/10888 | 0.0.25       | 0.303.1      | ORPH
                     capnproto |  DISTRO  | https://release-monitoring.org/project/11515 | 0.9.1        | 0.10.2       |     
                        ccache |  DISTRO  | https://release-monitoring.org/project/00257 | 3.7.12       | 4.6.3        | ORPH
                       chartjs |  DISTRO  | https://release-monitoring.org/project/85785 | 3.9.1        | 4.0.0        |     
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/00276 | 3.3          | 20200710     |     
                    cifs-utils |  DISTRO  | https://release-monitoring.org/project/00287 | 6.15         | 7.0          |     
                        circus |  DISTRO  | https://release-monitoring.org/project/21726 | 0.16.1       | 0.17.1       |     
                        clamav |  DISTRO  | https://release-monitoring.org/project/00291 | 0.103.7      | 0.105.1      |     
                         clang |  DISTRO  | https://release-monitoring.org/project/11811 | 11.1.0       | 15.0.2       |     
                         cmake |  DISTRO  | https://release-monitoring.org/project/00306 | 3.22.3       | 3.24.2       |     
                           cog |  DISTRO  | https://release-monitoring.org/project/21333 | 0.14.1       | 0.16.0       |     
                      collectl |  DISTRO  | https://release-monitoring.org/project/00330 | 4.3.2        | 4.3.4        |     
                   compiler-rt |  GUESS   | https://release-monitoring.org/project/17705 | 11.1.0       | 900          |     
               conntrack-tools |  DISTRO  | https://release-monitoring.org/project/00338 | 1.4.6        | 1.4.7        | ORPH
                          crun |  DISTRO  | https://release-monitoring.org/project/96792 | 1.5          | 1.6          |     
                      cryptopp |  DISTRO  | https://release-monitoring.org/project/14487 | 8.6.0        | 8.7.0        |     
                cups-pk-helper |  DISTRO  | https://release-monitoring.org/project/17717 | 0.2.6        | 0.2.7        | ORPH
                      cutelyst |  DISTRO  | https://release-monitoring.org/project/21335 | 2.11.0       | 3.6.0        |     
                        dacapo |  DISTRO  | https://release-monitoring.org/project/20546 | 9.12-MR1-... | 9.12-vbump   |     
                          dado |  DISTRO  | https://release-monitoring.org/project/58442 | 1.8.3-1      | 2.1.0-1      |     
                   dahdi-tools |  DISTRO  | https://release-monitoring.org/project/10252 | 3.1.0        | 3.2.0        |     
                    datatables |  DISTRO  | https://release-monitoring.org/project/141588 | 1.10.20      | 1.12.1       |     
            datatables-buttons |  DISTRO  | https://release-monitoring.org/project/141589 | 1.6.1        | 2.2.3        |     
       datatables-fixedcolumns |  DISTRO  | https://release-monitoring.org/project/141590 | 3.3.0        | 4.1.0        |     
         datatables-responsive |  DISTRO  | https://release-monitoring.org/project/141591 | 2.2.3        | 2.3.0        |     
                          dbus |  DISTRO  | https://release-monitoring.org/project/05356 | 1.12.24      | 1.15.2       | ORPH
                   dbus-python |  DISTRO  | https://release-monitoring.org/project/00402 | 1.2.18       | 1.3.2        | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/15086 | 7.2.641      | 7.2.646      | ORPH
                   debianutils |  DISTRO  | https://release-monitoring.org/project/21341 | 4.11         | 5.7          | ORPH
                         delve |  DISTRO  | https://release-monitoring.org/project/40149 | 1.8.0        | 1.9.1        |     
                        dialog |  DISTRO  | https://release-monitoring.org/project/00431 | 1.3-20220117 | 1.3-20220728 | ORPH
                    docker-cli |  DISTRO  | https://release-monitoring.org/project/21076 | 20.10.18     | 20.10.19     |     
                docker-compose |  DISTRO  | https://release-monitoring.org/project/06185 | 2.10.0       | 2.11.2       |     
                 docker-engine |  DISTRO  | https://release-monitoring.org/project/00447 | 20.10.18     | 20.10.19     |     
                    drbd-utils |  DISTRO  | https://release-monitoring.org/project/00462 | 9.21.4       | 9.22.0       |     
                            dt |  DISTRO  | https://release-monitoring.org/project/21844 | 18.32        | 21.27        | ORPH
                          dust |  DISTRO  | https://release-monitoring.org/project/141344 | 0.8.1        | 0.8.3        | ORPH
                      easy-rsa |  DISTRO  | https://release-monitoring.org/project/17770 | 3.1.0        | 3.1.1        |     
                          edk2 |  DISTRO  | https://release-monitoring.org/project/125953 | edk2-stab... | 202208       |     
                           efl |  DISTRO  | https://release-monitoring.org/project/06128 | 1.26.1       | 1.26.3       |     
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/00667 | 21.12        | 22.05        |     
                      elfutils |  DISTRO  | https://release-monitoring.org/project/05679 | 0.186        | 0.187        | ORPH
                        elixir |  DISTRO  | https://release-monitoring.org/project/00673 | 1.9.4        | 1.14.1       |     
                         empty |  DISTRO  | https://release-monitoring.org/project/20564 | 0.6.21b      | 0.6.22b      | ORPH
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/00698 | 0.25.1       | 0.25.4       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/00707 | 22.3.4.22    | 25.1.1       |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/17060 | 1.0.21       | 1.0.22       |     
               erlang-goldrush |  DISTRO  | https://release-monitoring.org/project/09692 | 0.1.9        | 0.2.0        |     
                   erlang-jose |  DISTRO  | https://release-monitoring.org/project/16913 | 1.11.1       | 1.11.2       |     
                  erlang-lager |  DISTRO  | https://release-monitoring.org/project/00727 | 3.9.1        | 3.9.2        |     
                erlang-p1-acme |  DISTRO  | https://release-monitoring.org/project/45375 | 1.0.16       | 1.0.20       |     
           erlang-p1-cache-tab |  DISTRO  | https://release-monitoring.org/project/08757 | 1.0.29       | 1.0.30       |     
              erlang-p1-mqtree |  DISTRO  | https://release-monitoring.org/project/20220 | 1.0.14       | 1.0.15       |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/09302 | 0.6.10       | 0.8.0        |     
                erlang-p1-pkix |  DISTRO  | https://release-monitoring.org/project/20539 | 1.0.8        | 1.0.9        |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/10576 | 1.0.47       | 1.0.48       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/09222 | 1.0.27       | 1.0.29       |     
                erlang-p1-stun |  DISTRO  | https://release-monitoring.org/project/09151 | 1.0.47       | 1.2.6        |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/10455 | 1.1.13       | 1.1.16       |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/08643 | 1.0.23       | 1.0.25       |     
                erlang-p1-xmpp |  DISTRO  | https://release-monitoring.org/project/12752 | 1.5.6        | 1.6.0        |     
                erlang-p1-yaml |  DISTRO  | https://release-monitoring.org/project/10243 | 1.0.32       | 1.0.34       |     
               erlang-p1-yconf |  DISTRO  | https://release-monitoring.org/project/45378 | 1.0.12       | 1.0.14       |     
                erlang-p1-zlib |  DISTRO  | https://release-monitoring.org/project/09283 | 1.0.10       | 1.0.12       |     
                       ethtool |  DISTRO  | https://release-monitoring.org/project/00763 | 5.19         | 6.0          |     
                      execline |  DISTRO  | https://release-monitoring.org/project/05482 | 2.8.0.1      | 2.9.0.1      |     
                        exempi |  DISTRO  | https://release-monitoring.org/project/00767 | 2.6.1        | 2.6.2        |     
                      fakeroot |  DISTRO  | https://release-monitoring.org/project/12048 | 1.26         | 1.29         | ORPH
                           feh |  DISTRO  | https://release-monitoring.org/project/00790 | 3.7.1        | 3.9.1        |     
                     fetchmail |  DISTRO  | https://release-monitoring.org/project/00801 | 6.4.29       | 6.4.34       |     
                        ffmpeg |  DISTRO  | https://release-monitoring.org/project/05405 | 4.4.2        | 5.1.2        |     
                   fftw-double |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.10       | ORPH
              fftw-long-double |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.10       | ORPH
                     fftw-quad |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.10       | ORPH
                   fftw-single |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.10       | ORPH
                          file |  DISTRO  | https://release-monitoring.org/project/00807 | 5.41         | 5.43         | ORPH
                           fio |  DISTRO  | https://release-monitoring.org/project/00806 | 3.28         | 3.32         |     
                          flac |  DISTRO  | https://release-monitoring.org/project/00817 | 1.4.0        | 1.4.1        |     
                       flannel |  DISTRO  | https://release-monitoring.org/project/07421 | 0.14.0       | 0.19.2       |     
                  flare-engine |  DISTRO  | https://release-monitoring.org/project/21433 | 1.12         | 1.13.04      |     
                    flare-game |  DISTRO  | https://release-monitoring.org/project/21434 | 1.12         | 1.13.04      |     
                   flatbuffers |  DISTRO  | https://release-monitoring.org/project/16642 | 2.0.8        | 22.9.29      |     
                          flot |  DISTRO  | https://release-monitoring.org/project/07184 | 0.8.3        | 4.2.3        | ORPH
                          fltk |  DISTRO  | https://release-monitoring.org/project/00823 | 1.3.7        | 1.3.8        | ORPH
                           fmc |  GUESS   | https://release-monitoring.org/project/145761 | fsl-sdk-v2.0 | 0.2.0        |     
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/00826 | 4.7.0        | 6.2.0        | ORPH
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/00827 | 2.13.1       | 2.14.0       | ORPH
             freeradius-server |  DISTRO  | https://release-monitoring.org/project/00853 | 3.2.0        | 3.2.1        |     
                    freeswitch |  DISTRO  | https://release-monitoring.org/project/21436 | 1.10.7       | 1.10.8       |     
                fuse-overlayfs |  DISTRO  | https://release-monitoring.org/project/101220 | 1.5.0        | 1.9          |     
                          gawk |  DISTRO  | https://release-monitoring.org/project/00868 | 5.1.1        | 5.2.0        | ORPH
                           gcr |  DISTRO  | https://release-monitoring.org/project/11801 | 3.40.0       | 4.0.0        | ORPH
                          gdal |  DISTRO  | https://release-monitoring.org/project/00881 | 3.5.1        | 3.5.2        |     
                       gerbera |  DISTRO  | https://release-monitoring.org/project/18420 | 1.10.0       | 1.11.0       |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/00898 | 0.20.1       | 0.21.1       | ORPH
                   ghostscript |  DISTRO  | https://release-monitoring.org/project/01157 | 9.56.1       | 10.0.0       |     
                           git |  DISTRO  | https://release-monitoring.org/project/05350 | 2.31.4       | 2.38.0       |     
                 gitlab-runner |  DISTRO  | https://release-monitoring.org/project/11337 | 14.5.1       | 15.4.0       |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/21353 | 2.70.1       | 2.74.0       | ORPH
                        glibmm |  DISTRO  | https://release-monitoring.org/project/07960 | 2.68.2       | 2.74.0       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/01181 | 0.9.9.5      | 0.9.9.8      | ORPH
                      gnuradio |  DISTRO  | https://release-monitoring.org/project/01217 | 3.8.2.0      | 3.10.4.0     |     
                            go |  DISTRO  | https://release-monitoring.org/project/01227 | 1.19.1       | 1.19.2       |     
         gobject-introspection |  DISTRO  | https://release-monitoring.org/project/01223 | 1.72.0       | 1.74.0       | ORPH
                     gocryptfs |  DISTRO  | https://release-monitoring.org/project/21085 | 2.2.1        | 2.3          |     
                          gqrx |  DISTRO  | https://release-monitoring.org/project/09771 | 2.14.4       | 2.15.9       |     
                       granite |  DISTRO  | https://release-monitoring.org/project/05410 | 6.0.0        | 7.1.0        | ORPH
                      grantlee |  DISTRO  | https://release-monitoring.org/project/21448 | 5.2.0        | 5.3.0        |     
                          grpc |  DISTRO  | https://release-monitoring.org/project/19117 | 1.49.1       | 1.50.0       |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/13139 | 3.36.1       | 43.0         | ORPH
                           gsl |  DISTRO  | https://release-monitoring.org/project/01267 | 2.6          | 2.7.1        | ORPH
                         gssdp |  DISTRO  | https://release-monitoring.org/project/01262 | 1.4.0.1      | 1.6.0        |     
                       gst-omx |  DISTRO  | https://release-monitoring.org/project/21845 | 1.20.4       | 1.21.1       | ORPH
                 gst1-devtools |  DISTRO  | https://release-monitoring.org/project/21856 | 1.20.4       | 1.21.1       | ORPH
                      gst1-imx |  DISTRO  | https://release-monitoring.org/project/21846 | 0.13.1       | 2.1.0        |     
                    gst1-libav |  DISTRO  | https://release-monitoring.org/project/21848 | 1.20.4       | 1.21.1       | ORPH
              gst1-plugins-bad |  DISTRO  | https://release-monitoring.org/project/21849 | 1.20.4       | 1.21.1       | ORPH
             gst1-plugins-base |  DISTRO  | https://release-monitoring.org/project/21850 | 1.20.4       | 1.21.1       | ORPH
             gst1-plugins-good |  DISTRO  | https://release-monitoring.org/project/21852 | 1.20.4       | 1.21.1       | ORPH
             gst1-plugins-ugly |  DISTRO  | https://release-monitoring.org/project/15187 | 1.20.4       | 1.21.1       | ORPH
                   gst1-python |  DISTRO  | https://release-monitoring.org/project/03881 | 1.20.4       | 1.21.1       | ORPH
              gst1-rtsp-server |  DISTRO  | https://release-monitoring.org/project/21853 | 1.20.4       | 1.21.1       | ORPH
                    gst1-vaapi |  DISTRO  | https://release-monitoring.org/project/21855 | 1.20.4       | 1.21.1       | ORPH
                          gstd |  DISTRO  | https://release-monitoring.org/project/235022 | 0.14.0       | 0.15.0       | ORPH
                    gstreamer1 |  DISTRO  | https://release-monitoring.org/project/01263 | 1.20.4       | 1.21.1       | ORPH
   gstreamer1-editing-services |  DISTRO  | https://release-monitoring.org/project/230920 | 1.20.4       | 1.21.1       | ORPH
                         gtest |  DISTRO  | https://release-monitoring.org/project/18290 | 1.12.0       | 1.12.1       |     
                        gtkmm3 |  DISTRO  | https://release-monitoring.org/project/07963 | 3.22.0       | 4.8.0        |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/07724 | 3.24.7       | 5.6.1        |     
                         gupnp |  DISTRO  | https://release-monitoring.org/project/01281 | 1.4.3        | 1.6.0        |     
                      gupnp-av |  DISTRO  | https://release-monitoring.org/project/01282 | 0.14.0       | 0.14.1       |     
                   gupnp-tools |  DISTRO  | https://release-monitoring.org/project/01284 | 0.10.3       | 0.12.0       |     
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/01285 | 5.2.14       | 5.3.4        | ORPH
                          gvfs |  DISTRO  | https://release-monitoring.org/project/05496 | 1.48.1       | 1.50.2       | ORPH
                        hackrf |  DISTRO  | https://release-monitoring.org/project/06136 | 2021.03.1    | 2022.09.1    | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/01298 | 2.6.5        | 2.6.6        |     
                      harfbuzz |  DISTRO  | https://release-monitoring.org/project/01299 | 5.1.0        | 5.3.0        |     
                       haveged |  DISTRO  | https://release-monitoring.org/project/11695 | 1.9.15       | 1.9.18       |     
                        hidapi |  DISTRO  | https://release-monitoring.org/project/05594 | 0.11.0       | 0.12.0       | ORPH
                         hplip |  DISTRO  | https://release-monitoring.org/project/01327 | 3.17.10      | 3.22.6       | ORPH
                        hwdata |  DISTRO  | https://release-monitoring.org/project/05387 | 0.358        | 0.363        | ORPH
                     hyperfine |  DISTRO  | https://release-monitoring.org/project/18526 | 1.14.0       | 1.15.0       | ORPH
                   ibm-sw-tpm2 |  DISTRO  | https://release-monitoring.org/project/18952 | 1661         | 1682         |     
                           icu |  DISTRO  | https://release-monitoring.org/project/16134 | 70-1         | 71-1         | ORPH
                     ifenslave |  DISTRO  | https://release-monitoring.org/project/21670 | 2.9          | 2.13         | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/21673 | 0.8.16       | 0.8.39       | ORPH
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/01372 | 7.1.0-45     | 7.1.0-50     | ORPH
                        imlib2 |  DISTRO  | https://release-monitoring.org/project/21676 | 1.7.3        | 1.9.1        |     
                          inih |  DISTRO  | https://release-monitoring.org/project/11600 | 55           | 56           |     
                 inotify-tools |  DISTRO  | https://release-monitoring.org/project/08864 | 3.20.2.2     | 3.22.6.0     | ORPH
                  intel-gmmlib |  DISTRO  | https://release-monitoring.org/project/20342 | 22.2.0       | 22.2.1       |     
             intel-mediadriver |  DISTRO  | https://release-monitoring.org/project/20341 | 22.5.3       | 22.5.4       |     
                intel-mediasdk |  DISTRO  | https://release-monitoring.org/project/21814 | 22.5.3       | 22.5.4       |     
               intel-microcode |  DISTRO  | https://release-monitoring.org/project/20614 | 20210608     | 20220809     | ORPH
                         iperf |  DISTRO  | https://release-monitoring.org/project/01388 | 2.1.6        | 2.1.8        |     
                        iperf3 |  DISTRO  | https://release-monitoring.org/project/01389 | 3.10.1       | 3.12         |     
                      iproute2 |  DISTRO  | https://release-monitoring.org/project/01392 | 5.19.0       | 6.0.0        |     
                    irqbalance |  DISTRO  | https://release-monitoring.org/project/01402 | 1.9.0        | 1.9.1        |     
                      irrlicht |  DISTRO  | https://release-monitoring.org/project/01403 | 1.8.4        | 1.8.5        |     
                         irssi |  DISTRO  | https://release-monitoring.org/project/01404 | 1.2.3        | 1.4.2        |     
                            iw |  DISTRO  | https://release-monitoring.org/project/01410 | 5.16         | 5.19         |     
                         jack2 |  DISTRO  | https://release-monitoring.org/project/21358 | 1.9.20       | 1.9.21       |     
                         janet |  DISTRO  | https://release-monitoring.org/project/155612 | 1.23.0       | 1.25.0       |     
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/15715 | 1.0.3        | 1.1.0        |     
                        jasper |  DISTRO  | https://release-monitoring.org/project/01421 | 2.0.33       | 3.0.6        |     
         jitterentropy-library |  DISTRO  | https://release-monitoring.org/project/29701 | 3.3.1        | 3.4.1        |     
         jquery-datetimepicker |  DISTRO  | https://release-monitoring.org/project/13910 | 2.4.5        | 2.5.20       |     
               jquery-keyboard |  DISTRO  | https://release-monitoring.org/project/21681 | 1.18.12      | 1.30.4       | ORPH
                 jquery-mobile |  DISTRO  | https://release-monitoring.org/project/59395 | 1.4.3        | 1.4.5        | ORPH
                     jquery-ui |  DISTRO  | https://release-monitoring.org/project/21815 | 1.13.1       | 1.13.2       |     
              jquery-ui-themes |  DISTRO  | https://release-monitoring.org/project/21816 | 1.10.4       | 1.13.2       |     
           json-for-modern-cpp |  DISTRO  | https://release-monitoring.org/project/11152 | 3.10.5       | 3.11.2       | ORPH
                         jszip |  DISTRO  | https://release-monitoring.org/project/141558 | 3.10.0       | 3.10.1       |     
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 5.99.0       |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 5.99.0       |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 5.99.0       |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 5.99.0       |     
                        kismet |  DISTRO  | https://release-monitoring.org/project/06966 | 2022-02-R1   | 2022-08-R1   | ORPH
                          kmod |  DISTRO  | https://release-monitoring.org/project/01517 | 29           | 30           |     
     kodi-audiodecoder-modplug |  DISTRO  | https://release-monitoring.org/project/21818 | 19.0.2-Ma... | 20.2.0-Nexus |     
    kodi-audiodecoder-nosefart |  DISTRO  | https://release-monitoring.org/project/21819 | 19.0.2-Ma... | 20.2.0-Nexus |     
     kodi-audiodecoder-sidplay |  DISTRO  | https://release-monitoring.org/project/21820 | 19.0.1-Ma... | 20.2.0-Nexus |     
     kodi-audiodecoder-snesapu |  DISTRO  | https://release-monitoring.org/project/21802 | 19.0.2-Ma... | 20.2.0-Nexus |     
     kodi-audiodecoder-stsound |  DISTRO  | https://release-monitoring.org/project/21801 | 19.0.1-Ma... | 20.2.0-Nexus |     
    kodi-audiodecoder-timidity |  DISTRO  | https://release-monitoring.org/project/21800 | 19.0.2-Ma... | 20.2.0-Nexus |     
   kodi-audiodecoder-vgmstream |  DISTRO  | https://release-monitoring.org/project/21799 | 19.0.0-Ma... | 20.2.0-Nexus |     
        kodi-audioencoder-flac |  DISTRO  | https://release-monitoring.org/project/17755 | 19.0.1-Ma... | 20.2.0-Nexus |     
        kodi-audioencoder-lame |  DISTRO  | https://release-monitoring.org/project/21798 | 19.1.2-Ma... | 20.3.0-Nexus |     
      kodi-audioencoder-vorbis |  DISTRO  | https://release-monitoring.org/project/21797 | 19.0.1-Ma... | 20.2.0-Nexus |     
         kodi-audioencoder-wav |  DISTRO  | https://release-monitoring.org/project/21796 | 19.0.1-Ma... | 20.2.0-Nexus |     
     kodi-inputstream-adaptive |  DISTRO  | https://release-monitoring.org/project/21795 | 19.0.7-Ma... | 20.3.1-Nexus |     
 kodi-inputstream-ffmpegdirect |  DISTRO  | https://release-monitoring.org/project/177174 | 19.0.3-Ma... | 20.5.0-Nexus |     
         kodi-inputstream-rtmp |  DISTRO  | https://release-monitoring.org/project/21794 | 19.0.1-Ma... | 20.3.0-Nexus |     
      kodi-peripheral-joystick |  DISTRO  | https://release-monitoring.org/project/21793 | 19.0.3-Ma... | 20.1.2-Nexus |     
       kodi-peripheral-xarcade |  DISTRO  | https://release-monitoring.org/project/21791 | 19.0.4-Ma... | 20.1.2-Nexus |     
              kodi-pvr-argustv |  DISTRO  | https://release-monitoring.org/project/21788 | 19.2.1-Ma... | 20.5.0-Nexus |     
              kodi-pvr-dvblink |  DISTRO  | https://release-monitoring.org/project/21787 | 19.0.1-Ma... | 20.3.0-Nexus |     
            kodi-pvr-dvbviewer |  DISTRO  | https://release-monitoring.org/project/21786 | 19.1.0-Ma... | 20.4.0-Nexus |     
               kodi-pvr-filmon |  DISTRO  | https://release-monitoring.org/project/21785 | 19.0.1-Ma... | 20.3.0-Nexus |     
            kodi-pvr-hdhomerun |  DISTRO  | https://release-monitoring.org/project/21784 | 19.1.0-Ma... | 20.4.0-Nexus |     
                  kodi-pvr-hts |  DISTRO  | https://release-monitoring.org/project/21783 | 19.0.6-Ma... | 20.6.0-Nexus |     
           kodi-pvr-iptvsimple |  DISTRO  | https://release-monitoring.org/project/21782 | 19.2.2-Ma... | 20.6.0-Nexus |     
 kodi-pvr-mediaportal-tvserver |  DISTRO  | https://release-monitoring.org/project/21781 | 19.0.2-Ma... | 20.3.0-Nexus |     
               kodi-pvr-mythtv |  DISTRO  | https://release-monitoring.org/project/21780 | 19.0.11-M... | 20.3.0-Nexus |     
              kodi-pvr-nextpvr |  DISTRO  | https://release-monitoring.org/project/21779 | 19.0.4-Ma... | 20.3.0-Nexus |     
                 kodi-pvr-njoy |  DISTRO  | https://release-monitoring.org/project/21778 | 19.0.1-Ma... | 20.3.0-Nexus |     
              kodi-pvr-octonet |  DISTRO  | https://release-monitoring.org/project/100437 | 19.0.0-Ma... | 20.3.0-Nexus |     
                 kodi-pvr-pctv |  DISTRO  | https://release-monitoring.org/project/21777 | 19.0.1-Ma... | 20.4.0-Nexus |     
              kodi-pvr-plutotv |  DISTRO  | https://release-monitoring.org/project/241527 | 19.0.3-Ma... | 20.3.0-Nexus |     
              kodi-pvr-stalker |  DISTRO  | https://release-monitoring.org/project/21776 | 19.0.4-Ma... | 20.3.1-Nexus |     
                 kodi-pvr-vbox |  DISTRO  | https://release-monitoring.org/project/21775 | 19.0.0-Ma... | 20.3.0-Nexus |     
             kodi-pvr-vdr-vnsi |  DISTRO  | https://release-monitoring.org/project/21774 | 19.0.5-Ma... | 20.4.0-Nexus |     
               kodi-pvr-vuplus |  DISTRO  | https://release-monitoring.org/project/21773 | 19.0.0-Ma... | 20.4.0-Nexus |     
                kodi-pvr-waipu |  DISTRO  | https://release-monitoring.org/project/241529 | 19.3.1-Ma... | 20.6.0-Nexus |     
                  kodi-pvr-wmc |  DISTRO  | https://release-monitoring.org/project/21772 | 19.0.2-Ma... | 20.3.0-Nexus |     
               kodi-pvr-zattoo |  DISTRO  | https://release-monitoring.org/project/100438 | 19.7.15-M... | 20.3.0-Nexus |     
    kodi-screensaver-asteroids |  DISTRO  | https://release-monitoring.org/project/21771 | 19.0.1-Ma... | 20.1.0-Nexus |     
    kodi-screensaver-asterwave |  DISTRO  | https://release-monitoring.org/project/21770 | 19.0.1-Ma... | 20.1.0-Nexus |     
   kodi-screensaver-biogenesis |  DISTRO  | https://release-monitoring.org/project/21768 | 19.0.1-Ma... | 20.1.0-Nexus |     
      kodi-screensaver-cpblobs |  DISTRO  | https://release-monitoring.org/project/21767 | 19.0.1-Ma... | 20.1.0-Nexus |     
    kodi-screensaver-greynetic |  DISTRO  | https://release-monitoring.org/project/21765 | 19.0.1-Ma... | 20.1.0-Nexus |     
 kodi-screensaver-matrixtrails |  DISTRO  | https://release-monitoring.org/project/21764 | 19.0.1-Ma... | 20.1.0-Nexus |     
     kodi-screensaver-pingpong |  DISTRO  | https://release-monitoring.org/project/21763 | 19.0.1-Ma... | 20.1.0-Nexus |     
         kodi-screensaver-pyro |  DISTRO  | https://release-monitoring.org/project/21761 | 19.0.1-Ma... | 20.1.0-Nexus |     
         kodi-screensaver-rsxs |  DISTRO  | https://release-monitoring.org/project/21760 | 19.0.2-Ma... | 20.1.0-Nexus |     
        kodi-screensaver-stars |  DISTRO  | https://release-monitoring.org/project/21759 | 19.0.0-Ma... | 20.1.0-Nexus |     
           kodi-vfs-libarchive |  DISTRO  | https://release-monitoring.org/project/177173 | 19.2.0-Ma... | 20.2.0-Nexus |     
                  kodi-vfs-rar |  DISTRO  | https://release-monitoring.org/project/21900 | 19.0.1-Ma... | 20.1.0-Nexus |     
                 kodi-vfs-sftp |  DISTRO  | https://release-monitoring.org/project/21899 | 19.0.1-Ma... | 20.1.0-Nexus |     
    kodi-visualisation-fishbmc |  DISTRO  | https://release-monitoring.org/project/21758 | 19.0.1-Ma... | 20.1.0-Nexus |     
       kodi-visualisation-goom |  DISTRO  | https://release-monitoring.org/project/21757 | 19.0.2-Ma... | 20.1.1-Nexus |     
     kodi-visualisation-matrix |  DISTRO  | https://release-monitoring.org/project/177172 | 19.0.1-Ma... | 20.2.0-Nexus |     
  kodi-visualisation-shadertoy |  DISTRO  | https://release-monitoring.org/project/21756 | 19.1.2-Ma... | 20.3.0-Nexus |     
   kodi-visualisation-spectrum |  DISTRO  | https://release-monitoring.org/project/21755 | 19.0.2-Ma... | 20.2.0-Nexus |     
  kodi-visualisation-starburst |  DISTRO  | https://release-monitoring.org/project/85703 | 19.0.1-Ma... | 20.2.0-Nexus |     
   kodi-visualisation-waveform |  DISTRO  | https://release-monitoring.org/project/21753 | 19.0.3-Ma... | 20.2.1-Nexus |     
                   ksmbd-tools |  DISTRO  | https://release-monitoring.org/project/241856 | 3.4.5        | 3.4.6        |     
                       lensfun |  DISTRO  | https://release-monitoring.org/project/01548 | 0.3.2        | 0.3.95       |     
                         libao |  DISTRO  | https://release-monitoring.org/project/07629 | 1.2.0        | 1.2.2        | ORPH
                   libapparmor |  DISTRO  | https://release-monitoring.org/project/94819 | 3.0.4        | 3.1.1        |     
                   libblockdev |  DISTRO  | https://release-monitoring.org/project/09397 | 2.26         | 2.28-1       | ORPH
                     libbluray |  DISTRO  | https://release-monitoring.org/project/01565 | 1.3.1        | 1.3.3        |     
                        libbsd |  DISTRO  | https://release-monitoring.org/project/01567 | 0.11.3       | 0.11.7       |     
                        libcap |  DISTRO  | https://release-monitoring.org/project/01569 | 2.65         | 2.66         |     
                     libcgroup |  DISTRO  | https://release-monitoring.org/project/01575 | 0.42.2       | 3.0.0        |     
                     libcodec2 |  DISTRO  | https://release-monitoring.org/project/14605 | 1.0.1        | 1.03         |     
                       libcurl |  DISTRO  | https://release-monitoring.org/project/00381 | 7.84.0       | 7.85.0       |     
                    libdeflate |  DISTRO  | https://release-monitoring.org/project/242778 | 1.12         | 1.14         |     
                       libdmtx |  DISTRO  | https://release-monitoring.org/project/12833 | 0.7.5        | 0.7.7        |     
                        libdrm |  DISTRO  | https://release-monitoring.org/project/01596 | 2.4.112      | 2.4.113      |     
                       libebml |  DISTRO  | https://release-monitoring.org/project/07879 | 1.4.2        | 1.4.4        |     
                       libedit |  DISTRO  | https://release-monitoring.org/project/01599 | 20210910-3.1 | 20221009-3.1 |     
                      libevdev |  DISTRO  | https://release-monitoring.org/project/20540 | 1.12.1       | 1.13.0       |     
                   libfreeglut |  DISTRO  | https://release-monitoring.org/project/00846 | 3.2.2        | 3.4.0        |     
                       libfuse |  GUESS   | https://release-monitoring.org/project/00861 | 2.9.9        | 3.12.0       | ORPH
                      libfuse3 |  DISTRO  | https://release-monitoring.org/project/00861 | 3.11.0       | 3.12.0       |     
                    libgdiplus |  DISTRO  | https://release-monitoring.org/project/06440 | 6.0.5        | 6.1          |     
                        libgee |  DISTRO  | https://release-monitoring.org/project/01625 | 0.20.5       | 0.20.6       |     
                      libglade |  DISTRO  | https://release-monitoring.org/project/01174 | 2.6.4        | 3.40.0       | ORPH
                       libglfw |  DISTRO  | https://release-monitoring.org/project/01180 | 3.3.6        | 3.3.8        |     
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/10024 | 2.72.3       | 2.74.0       |     
                      libglvnd |  DISTRO  | https://release-monitoring.org/project/12098 | 1.4.0        | 1.5.0        | ORPH
                  libgpg-error |  DISTRO  | https://release-monitoring.org/project/01628 | 1.45         | 1.46         | ORPH
                      libgpgme |  DISTRO  | https://release-monitoring.org/project/01239 | 1.17.1       | 1.18.0       | ORPH
                    libgphoto2 |  DISTRO  | https://release-monitoring.org/project/12558 | 2.5.27       | 2.5.30       | ORPH
                      libgsasl |  DISTRO  | https://release-monitoring.org/project/01563 | 1.10.0       | 2.2.0        | ORPH
                        libgsm |  DISTRO  | https://release-monitoring.org/project/12587 | 1.0.19       | 1.0.22       |     
                       libgtk2 |  DISTRO  | https://release-monitoring.org/project/13942 | 2.24.33      | 4.8.1        |     
                        libhtp |  DISTRO  | https://release-monitoring.org/project/01632 | 0.5.40       | 0.5.41       |     
                     libiberty |  DISTRO  | https://release-monitoring.org/project/07981 | 2.32         | 2.39         |     
                       libical |  DISTRO  | https://release-monitoring.org/project/01637 | 1.0.1        | 3.0.15       |     
                      libiconv |  DISTRO  | https://release-monitoring.org/project/10656 | 1.15         | 1.17         | ORPH
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/21479 | 0.10.3       | 2.2.1        |     
                      libinput |  DISTRO  | https://release-monitoring.org/project/05781 | 1.20.1       | 1.21.0       |     
                      libkcapi |  DISTRO  | https://release-monitoring.org/project/16828 | 1.1.5        | 1.4.0        | ORPH
                       libksba |  DISTRO  | https://release-monitoring.org/project/01649 | 1.6.0        | 1.6.2        | ORPH
                     liblinear |  DISTRO  | https://release-monitoring.org/project/21363 | 2.44         | 2.45         |     
                   libmatroska |  DISTRO  | https://release-monitoring.org/project/01657 | 1.6.3        | 1.7.1        |     
                       libmdbx |  DISTRO  | https://release-monitoring.org/project/141559 | 0.11.12      | 0.12.1       |     
                      libmhash |  DISTRO  | https://release-monitoring.org/project/21488 | 0.9.9.9      | 1.4          | ORPH
                     libmodbus |  DISTRO  | https://release-monitoring.org/project/09728 | 3.1.7        | 3.1.8        |     
                libmodsecurity |  DISTRO  | https://release-monitoring.org/project/68638 | 3.0.7        | 3.0.8        |     
                     libmspack |  DISTRO  | https://release-monitoring.org/project/16827 | 0.10.1alpha  | 1.9.1        |     
                   libnetconf2 |  DISTRO  | https://release-monitoring.org/project/31639 | 2.1.11       | 2.1.18       |     
                        libnfs |  DISTRO  | https://release-monitoring.org/project/07325 | 4.0.0        | 5.0.2        | ORPH
                         libnl |  DISTRO  | https://release-monitoring.org/project/01684 | 3.6.0        | 3.7.0        | ORPH
                     libnpupnp |  DISTRO  | https://release-monitoring.org/project/75209 | 4.2.2        | 5.0.0        |     
                        libolm |  DISTRO  | https://release-monitoring.org/project/29706 | 3.2.9        | 3.2.13       |     
                   libopenh264 |  DISTRO  | https://release-monitoring.org/project/21365 | 2.2.0        | 2.3.1        |     
                    libopenssl |  DISTRO  | https://release-monitoring.org/project/20333 | 1.1.1q       | 1.1.1r       |     
                      libosip2 |  DISTRO  | https://release-monitoring.org/project/15135 | 5.3.0        | 5.3.1        |     
                   libpagekite |  DISTRO  | https://release-monitoring.org/project/21366 | 0.91.190530  | 0.91.201110  |     
            libpam-radius-auth |  DISTRO  | https://release-monitoring.org/project/57834 | 1.4.0        | 2.0.0        | ORPH
                       libpeas |  DISTRO  | https://release-monitoring.org/project/06871 | 1.32.0       | 1.34.0       | ORPH
                       libpfm4 |  DISTRO  | https://release-monitoring.org/project/21491 | 4.11.0       | 4.12.0       |     
                        libpng |  DISTRO  | https://release-monitoring.org/project/01705 | 1.6.37       | 1.6.38       |     
                       libpqxx |  DISTRO  | https://release-monitoring.org/project/21367 | 6.4.5        | 7.7.4        |     
                      libressl |  DISTRO  | https://release-monitoring.org/project/12102 | 3.5.3        | 3.6.0        | ORPH
                       librsvg |  DISTRO  | https://release-monitoring.org/project/05420 | 2.50.7       | 2.54.5       |     
                    libselinux |  DISTRO  | https://release-monitoring.org/project/01717 | 3.3          | 3.4          |     
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/01718 | 3.3          | 20200710     |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/01719 | 3.3          | 20200710     |     
                      libshout |  DISTRO  | https://release-monitoring.org/project/11084 | 2.4.5        | 2.4.6        | ORPH
                       libsoup |  DISTRO  | https://release-monitoring.org/project/11483 | 2.74.2       | 3.2.1        |     
                        libssh |  DISTRO  | https://release-monitoring.org/project/01729 | 0.9.6        | 0.10.4       | ORPH
                  libtextstyle |  DISTRO  | https://release-monitoring.org/project/00898 | 0.20.1       | 0.21.1       | ORPH
                       libtool |  DISTRO  | https://release-monitoring.org/project/01741 | 2.4.6        | 2.4.7        | ORPH
          libtorrent-rasterbar |  DISTRO  | https://release-monitoring.org/project/04166 | 1.2.15       | 2.0.7        |     
                  libunistring |  DISTRO  | https://release-monitoring.org/project/01747 | 1.0          | 1.1          |     
                       libupnp |  DISTRO  | https://release-monitoring.org/project/21315 | 1.14.13      | 1.14.14      |     
                      libupnpp |  DISTRO  | https://release-monitoring.org/project/15849 | 0.21.0       | 0.22.2       | ORPH
                         libuv |  DISTRO  | https://release-monitoring.org/project/10784 | 1.43.0       | 1.44.2       |     
                         libva |  DISTRO  | https://release-monitoring.org/project/01752 | 2.15.0       | 2.16.0       |     
                   libva-utils |  DISTRO  | https://release-monitoring.org/project/16334 | 2.15.0       | 2.16.0       |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/05097 | 8.10.6       | 8.13.2       |     
                       libvirt |  DISTRO  | https://release-monitoring.org/project/224041 | 7.10.0       | 8.8.0        |     
                        libwpe |  DISTRO  | https://release-monitoring.org/project/17789 | 1.12.3       | 1.14.0       |     
                  libxkbcommon |  DISTRO  | https://release-monitoring.org/project/01780 | 1.4.0        | 1.4.1        |     
                      libxmlpp |  DISTRO  | https://release-monitoring.org/project/11129 | 5.0.1        | 5.0.2        | ORPH
                     libxmlrpc |  DISTRO  | https://release-monitoring.org/project/09024 | r3119        | 1.54.06      |     
                       libyang |  DISTRO  | https://release-monitoring.org/project/18554 | 2.0.194      | 2.0.231      |     
                       libzlib |  DISTRO  | https://release-monitoring.org/project/05303 | 1.2.12       | 1.2.13       | ORPH
                          lilv |  DISTRO  | https://release-monitoring.org/project/01818 | 0.24.12      | 0.24.20      |     
                         links |  DISTRO  | https://release-monitoring.org/project/01822 | 2.26         | 2.28         | ORPH
                      linphone |  DISTRO  | https://release-monitoring.org/project/01823 | 4.4.8        | 5.1.63       | ORPH
                linux-firmware |  DISTRO  | https://release-monitoring.org/project/141464 | 20220310     | 20221012     |     
                    lirc-tools |  DISTRO  | https://release-monitoring.org/project/10762 | 0.10.1       | 0.10.2       | ORPH
                       live555 |  DISTRO  | https://release-monitoring.org/project/12414 | 2021.05.03   | 2022.10.01   | ORPH
                           lld |  DISTRO  | https://release-monitoring.org/project/01830 | 11.1.0       | 15.0.2       |     
                         lldpd |  DISTRO  | https://release-monitoring.org/project/14019 | 1.0.9        | 1.0.15       | ORPH
                          llvm |  DISTRO  | https://release-monitoring.org/project/01830 | 11.1.0       | 15.0.2       |     
                       log4cxx |  DISTRO  | https://release-monitoring.org/project/15330 | 0.12.1       | 0.13.0       |     
                          lpty |  DISTRO  | https://release-monitoring.org/project/11671 | 1.0.1-1      | 1.2.2        |     
                         ltris |  DISTRO  | https://release-monitoring.org/project/21503 | 1.2          | 1.2.6        |     
              lttng-babeltrace |  DISTRO  | https://release-monitoring.org/project/00155 | 1.5.7        | 1.5.8        |     
                  lttng-libust |  DISTRO  | https://release-monitoring.org/project/07135 | 2.13.1       | 2.13.5       |     
                 lttng-modules |  DISTRO  | https://release-monitoring.org/project/07141 | 2.13.1       | 2.13.7       |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/07136 | 2.13.2       | 2.13.8       |     
                           lua |  DISTRO  | https://release-monitoring.org/project/01847 | 5.1.5        | 5.4.4        |     
                lua-resty-http |  DISTRO  | https://release-monitoring.org/project/13887 | 0.15-0       | 0.16.1       |     
                           luv |  DISTRO  | https://release-monitoring.org/project/21510 | 1.43.0-0     | 1.44.2-1     | ORPH
                          luvi |  DISTRO  | https://release-monitoring.org/project/21512 | 2.13.0       | 2.14.0       | ORPH
                           lv2 |  DISTRO  | https://release-monitoring.org/project/230934 | 1.18.2       | 1.18.10      |     
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/05354 | 2.03.14      | 2.03.16      | ORPH
                           lxc |  DISTRO  | https://release-monitoring.org/project/01860 | 4.0.12       | 5.0.1        |     
                          lynx |  DISTRO  | https://release-monitoring.org/project/01863 | 2.8.9rel.1   | 2.9.0        |     
                           lz4 |  DISTRO  | https://release-monitoring.org/project/01865 | 1.9.3        | 1.9.4        | ORPH
                    lzma-alone |  DISTRO  | https://release-monitoring.org/project/242840 | 9.22         | 2201         | ORPH
                          lzop |  DISTRO  | https://release-monitoring.org/project/07486 | 1.03         | 1.04         |     
                          make |  DISTRO  | https://release-monitoring.org/project/01877 | 4.2.1        | 4.3          | ORPH
                  makedumpfile |  DISTRO  | https://release-monitoring.org/project/131396 | 1.7.0        | 1.7.1        |     
                       mariadb |  DISTRO  | https://release-monitoring.org/project/01887 | 10.3.36      | 10.10.1      | ORPH
                         matio |  DISTRO  | https://release-monitoring.org/project/01893 | 1.5.22       | 1.5.23       |     
                       mbedtls |  DISTRO  | https://release-monitoring.org/project/13824 | 2.28.1       | 3.2.1        |     
                       mbuffer |  DISTRO  | https://release-monitoring.org/project/15518 | 20211018     | 20220418     |     
                        mcelog |  DISTRO  | https://release-monitoring.org/project/08093 | 187          | 189          |     
                         mdevd |  DISTRO  | https://release-monitoring.org/project/16553 | 0.1.4.0      | 0.1.6.0      |     
                 mediastreamer |  DISTRO  | https://release-monitoring.org/project/21746 | 4.4.8        | 5.1.64       | ORPH
                     memcached |  DISTRO  | https://release-monitoring.org/project/01965 | 1.6.16       | 1.6.17       | ORPH
                        mesa3d |  DISTRO  | https://release-monitoring.org/project/01970 | 22.1.6       | 22.2.1       |     
                  mesa3d-demos |  DISTRO  | https://release-monitoring.org/project/16781 | 8.4.0        | 8.5.0        |     
                mesa3d-headers |  DISTRO  | https://release-monitoring.org/project/01970 | 22.1.6       | 22.2.1       |     
                      metacity |  DISTRO  | https://release-monitoring.org/project/15392 | 2.25.1       | 3.46.0       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/21519 | 0.02         | 2.8.0        |     
                         mimic |  DISTRO  | https://release-monitoring.org/project/21521 | 1.1.0        | 1.3.0.1      |     
                      minetest |  DISTRO  | https://release-monitoring.org/project/01978 | 5.5.1        | 5.6.1        |     
                 minetest-game |  DISTRO  | https://release-monitoring.org/project/21522 | 5.5.1        | 5.6.1        |     
                       minizip |  DISTRO  | https://release-monitoring.org/project/17546 | 3.0.6        | 10.2         |     
                  minizip-zlib |  DISTRO  | https://release-monitoring.org/project/05303 | 1.2.12       | 1.2.13       |     
                        moarvm |  DISTRO  | https://release-monitoring.org/project/21100 | 2022.06      | 2022.07      |     
mobile-broadband-provider-info |  DISTRO  | https://release-monitoring.org/project/10267 | 20190618     | 20220725     | ORPH
                 moby-buildkit |  DISTRO  | https://release-monitoring.org/project/20836 | 0.10.0       | 0.10.4       |     
                       mongodb |  DISTRO  | https://release-monitoring.org/project/02008 | 4.2.18       | 6.1.0        |     
                      mongoose |  DISTRO  | https://release-monitoring.org/project/07603 | 7.2          | 7.8          |     
                         monit |  DISTRO  | https://release-monitoring.org/project/05483 | 5.26.0       | 5.32.0       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/06360 | 6.12.0.122   | 6.12.0.188   |     
                           mpd |  DISTRO  | https://release-monitoring.org/project/14864 | 0.23.9       | 0.23.10      |     
                        mpg123 |  DISTRO  | https://release-monitoring.org/project/12413 | 1.25.15      | 1.30.2       | ORPH
                           mpv |  DISTRO  | https://release-monitoring.org/project/05348 | 0.33.1       | 0.34.1       |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/12278 | 3.3.0        | 4.1.2        |     
                         msmtp |  DISTRO  | https://release-monitoring.org/project/02024 | 1.8.14       | 1.8.22       |     
                         mstpd |  DISTRO  | https://release-monitoring.org/project/235098 | 0.1.0        | 0.05         |     
                           mtd |  DISTRO  | https://release-monitoring.org/project/02026 | 2.1.3        | 2.1.5        |     
                        mtools |  DISTRO  | https://release-monitoring.org/project/02028 | 4.0.38       | 4.0.41       |     
                           mtr |  DISTRO  | https://release-monitoring.org/project/02029 | 0.94         | 0.95         | ORPH
               multipath-tools |  DISTRO  | https://release-monitoring.org/project/00424 | 0.9.0        | 0.9.1        |     
                         mupdf |  DISTRO  | https://release-monitoring.org/project/02034 | 1.18.0       | 1.20.3       |     
                          mxml |  DISTRO  | https://release-monitoring.org/project/13545 | 3.3          | 3.3.1        |     
                          ncdu |  DISTRO  | https://release-monitoring.org/project/06045 | 1.17         | 2.1.2        |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/02057 | 6.1          | 6.3-20221008 | ORPH
                        ndisc6 |  DISTRO  | https://release-monitoring.org/project/21531 | 1.0.5        | 1.0.6        | ORPH
                          neon |  DISTRO  | https://release-monitoring.org/project/07604 | 0.32.2       | 0.32.4       | ORPH
                       nerdctl |  DISTRO  | https://release-monitoring.org/project/242901 | 0.17.1       | 0.23.0       |     
                        netcat |  DISTRO  | https://release-monitoring.org/project/21534 | 0.7.1        | 1.218        | ORPH
                       netdata |  DISTRO  | https://release-monitoring.org/project/11046 | 1.33.1       | 1.36.1       |     
                     netopeer2 |  DISTRO  | https://release-monitoring.org/project/114978 | 2.1.23       | 2.1.36       |     
                       netsnmp |  DISTRO  | https://release-monitoring.org/project/02062 | 5.9          | 5.9.3        | ORPH
               network-manager |  DISTRO  | https://release-monitoring.org/project/21197 | 1.36.4       | 1.40.0       | ORPH
       network-manager-openvpn |  DISTRO  | https://release-monitoring.org/project/69977 | 1.8.14       | 1.10.0       |     
                       nghttp2 |  DISTRO  | https://release-monitoring.org/project/08651 | 1.41.0       | 1.50.0       |     
                         nginx |  DISTRO  | https://release-monitoring.org/project/05413 | 1.20.1       | 1.23.1       |     
             nginx-modsecurity |  DISTRO  | https://release-monitoring.org/project/68639 | 1.0.2        | 1.0.3        |     
                         ninja |  DISTRO  | https://release-monitoring.org/project/02089 | 1.10.2.g5... | 1.11.1       |     
                          nmap |  DISTRO  | https://release-monitoring.org/project/02096 | 7.92         | 7.93         | ORPH
                        nodejs |  DISTRO  | https://release-monitoring.org/project/08251 | 16.17.1      | 18.11.0      |     
                          noip |  DISTRO  | https://release-monitoring.org/project/21539 | 2.1.9        | 3.0.0        | ORPH
                       numactl |  DISTRO  | https://release-monitoring.org/project/02507 | 2.0.14       | 2.0.16       |     
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/02511 | 6.1.2        | 8.2.2        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/21843 | 390.151      | 390.154      |     
               nvidia-modprobe |  DISTRO  | https://release-monitoring.org/project/141657 | 450.57       | 520.56.06    | ORPH
                          nvme |  DISTRO  | https://release-monitoring.org/project/09074 | 1.12         | 2.1.2        | ORPH
                         ofono |  DISTRO  | https://release-monitoring.org/project/16859 | 1.34         | 2.0          |     
                          ogre |  DISTRO  | https://release-monitoring.org/project/33334 | v1.12.12     | 13.4.4       |     
                        openal |  DISTRO  | https://release-monitoring.org/project/08172 | 1.22.0       | 1.22.2       |     
                  opencl-clhpp |  DISTRO  | https://release-monitoring.org/project/271141 | 2.0.16       | 2022.09.30   |     
                  opencore-amr |  DISTRO  | https://release-monitoring.org/project/21548 | 0.1.5        | 0.1.6        | ORPH
                       opencv3 |  DISTRO  | https://release-monitoring.org/project/06615 | 3.4.17       | 4.6.0        |     
                openfpgaloader |  DISTRO  | https://release-monitoring.org/project/241709 | 0.6.1        | 0.9.1        |     
                      openipmi |  DISTRO  | https://release-monitoring.org/project/02549 | 2.0.32       | 2.0.33       | ORPH
                       openjdk |  GUESS   | https://release-monitoring.org/project/176098 | 11.0.14.1+1  | 20+19        |     
                       openmpi |  DISTRO  | https://release-monitoring.org/project/02554 | 4.0.0        | 4.1.4        | ORPH
                 openpowerlink |  DISTRO  | https://release-monitoring.org/project/21550 | 2.7.1        | 2.7.2        |     
                        openrc |  DISTRO  | https://release-monitoring.org/project/11687 | 0.43.3       | 0.45.2       |     
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/10998 | 11.3.5-18... | 12.1.0       |     
                          opkg |  DISTRO  | https://release-monitoring.org/project/59397 | 0.4.5        | 0.6.0        | ORPH
                    opkg-utils |  DISTRO  | https://release-monitoring.org/project/59396 | 0.4.5        | 0.5.0        |     
               optee-benchmark |  DISTRO  | https://release-monitoring.org/project/21555 | 3.18.0       | 3.19.0       |     
                  optee-client |  DISTRO  | https://release-monitoring.org/project/21556 | 3.18.0       | 3.19.0       |     
                optee-examples |  DISTRO  | https://release-monitoring.org/project/21557 | 3.18.0       | 3.19.0       |     
                    optee-test |  DISTRO  | https://release-monitoring.org/project/21558 | 3.18.0       | 3.19.0       |     
                  oracle-mysql |  DISTRO  | https://release-monitoring.org/project/00334 | 5.1.73       | 8.0.31       | ORPH
                          ortp |  DISTRO  | https://release-monitoring.org/project/21691 | 4.4.8        | 5.1.64       | ORPH
                     osm2pgsql |  DISTRO  | https://release-monitoring.org/project/02575 | 1.7.0        | 1.7.1        |     
                   paho-mqtt-c |  DISTRO  | https://release-monitoring.org/project/21375 | 1.3.10       | 1.3.11       |     
                         pango |  DISTRO  | https://release-monitoring.org/project/11783 | 1.50.10      | 1.50.11      | ORPH
                       pangomm |  DISTRO  | https://release-monitoring.org/project/07958 | 2.48.2       | 2.50.1       |     
                    parprouted |  DISTRO  | https://release-monitoring.org/project/10309 | 0.7          | 0.65         | ORPH
                        parted |  DISTRO  | https://release-monitoring.org/project/02596 | 3.4          | 3.5          |     
                      patchelf |  DISTRO  | https://release-monitoring.org/project/02598 | 0.13         | 0.15.0       | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/02601 | 1.2.6        | 1.3.5        | ORPH
                     pcm-tools |  DISTRO  | https://release-monitoring.org/project/21377 | 202110       | 202207       | ORPH
                     pcsc-lite |  DISTRO  | https://release-monitoring.org/project/02611 | 1.9.8        | 1.9.9        | ORPH
                          pdbg |  DISTRO  | https://release-monitoring.org/project/21378 | 3.5          | 3.6          |     
                          perl |  DISTRO  | https://release-monitoring.org/project/13599 | 5.34.1       | 5.36.0       |     
                perl-crypt-cbc |  DISTRO  | https://release-monitoring.org/project/11930 | 2.33         | 3.04         |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/02807 | 4.046        | 4.050        |     
            perl-exporter-tiny |  DISTRO  | https://release-monitoring.org/project/11846 | 1.002002     | 1.004004     |     
             perl-file-listing |  DISTRO  | https://release-monitoring.org/project/02892 | 6.14         | 6.15         |     
    perl-file-sharedir-install |  DISTRO  | https://release-monitoring.org/project/11851 | 0.13         | 0.14         |     
              perl-html-parser |  DISTRO  | https://release-monitoring.org/project/02967 | 3.76         | 3.79         |     
              perl-http-daemon |  DISTRO  | https://release-monitoring.org/project/02975 | 6.12         | 6.14         |     
             perl-http-message |  DISTRO  | https://release-monitoring.org/project/02977 | 6.37         | 6.41         |     
             perl-json-maybexs |  DISTRO  | https://release-monitoring.org/project/11953 | 1.004003     | 1.004004     |     
                perl-mail-dkim |  DISTRO  | https://release-monitoring.org/project/11868 | 1.20200824   | 1.20220520   |     
               perl-mime-tools |  DISTRO  | https://release-monitoring.org/project/11809 | 5.509        | 5.510        |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/05966 | 9.26         | 9.28         |     
perl-mojolicious-plugin-aut... |  DISTRO  | https://release-monitoring.org/project/21729 | 1.37         | 1.39         |     
                  perl-net-dns |  DISTRO  | https://release-monitoring.org/project/03147 | 1.34         | 1.35         |     
                 perl-net-ssh2 |  DISTRO  | https://release-monitoring.org/project/03163 | 0.72         | 0.73         |     
               perl-net-ssleay |  DISTRO  | https://release-monitoring.org/project/06575 | 1.85         | 1.92         |     
            perl-package-stash |  DISTRO  | https://release-monitoring.org/project/11885 | 0.39         | 0.40         |     
                    perl-plack |  DISTRO  | https://release-monitoring.org/project/06578 | 1.0048       | 1.0050       |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/14338 | 0.52         | 0.61         |     
                perl-type-tiny |  DISTRO  | https://release-monitoring.org/project/14406 | 1.012004     | 2.000001     |     
                      perl-uri |  DISTRO  | https://release-monitoring.org/project/03485 | 5.12         | 5.16         |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/03527 | 2.0134       | 2.0208       |     
                           php |  DISTRO  | https://release-monitoring.org/project/03627 | 8.1.9        | 8.1.11       |     
                      php-amqp |  DISTRO  | https://release-monitoring.org/project/15603 | 1.10.2       | 1.11.0       |     
                      php-apcu |  DISTRO  | https://release-monitoring.org/project/11010 | 5.1.20       | 5.1.22       |     
                     php-gnupg |  DISTRO  | https://release-monitoring.org/project/21743 | 1.5.0        | 1.5.1        | ORPH
                 php-memcached |  DISTRO  | https://release-monitoring.org/project/17400 | 3.1.5        | 3.2.0        | ORPH
                       php-pam |  DISTRO  | https://release-monitoring.org/project/241707 | 2.2.3        | 2.2.4        |     
                    php-xdebug |  DISTRO  | https://release-monitoring.org/project/13302 | 3.0.4        | 3.1.5        |     
                        pigpio |  DISTRO  | https://release-monitoring.org/project/21577 | 79           | 7301         |     
                      pinentry |  DISTRO  | https://release-monitoring.org/project/03643 | 1.1.1        | 1.2.1        | ORPH
                      pipewire |  DISTRO  | https://release-monitoring.org/project/57357 | 0.3.57       | 0.3.59       |     
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/12753 | 1.6.3        | 1.9.3        | ORPH
               policycoreutils |  DISTRO  | https://release-monitoring.org/project/03680 | 3.2          | 20200710     |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/03686 | 21.12.0      | 22.10.0      |     
                       postgis |  DISTRO  | https://release-monitoring.org/project/03694 | 3.2.2        | 3.3.1        |     
                      powertop |  DISTRO  | https://release-monitoring.org/project/03702 | 2.13         | 2.15         |     
                     procps-ng |  DISTRO  | https://release-monitoring.org/project/03708 | 3.3.17       | 4.0.0        | ORPH
                       proftpd |  DISTRO  | https://release-monitoring.org/project/07609 | 1.3.6e       | 1.3.7e       |     
                          proj |  DISTRO  | https://release-monitoring.org/project/21570 | 8.1.1        | 9.1.0        |     
                       prosody |  DISTRO  | https://release-monitoring.org/project/03709 | 0.11.13      | 0.12.1       |     
                      protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 21.6         | 21.7         |     
          pru-software-support |  DISTRO  | https://release-monitoring.org/project/21825 | 6.0.1        | 6.1.0        |     
                        psmisc |  DISTRO  | https://release-monitoring.org/project/03721 | 23.4         | 23.5         | ORPH
                          ptpd |  GUESS   | https://release-monitoring.org/project/03726 | 1.1.0        | 2.3.1        | ORPH
                         putty |  DISTRO  | https://release-monitoring.org/project/05749 | 0.76         | 0.77         |     
                python-aiocoap |  DISTRO  | https://release-monitoring.org/project/21243 | 0.4.1        | 0.4.4        |     
               python-aiofiles |  DISTRO  | https://release-monitoring.org/project/12743 | 0.8.0        | 22.1.0       |     
        python-aiohttp-remotes |  DISTRO  | https://release-monitoring.org/project/21248 | 1.1.0        | 1.2.0        |     
                python-aiojobs |  DISTRO  | https://release-monitoring.org/project/21252 | 0.3.0        | 1.1.0        |     
          python-aioprocessing |  DISTRO  | https://release-monitoring.org/project/209604 | 2.0.0        | 2.0.1        |     
                python-alembic |  DISTRO  | https://release-monitoring.org/project/03766 | 1.8.0        | 1.8.1        |     
              python-alsaaudio |  DISTRO  | https://release-monitoring.org/project/10072 | 0.8.4        | 0.9.2        |     
                  python-arrow |  DISTRO  | https://release-monitoring.org/project/05314 | 1.2.0        | 1.2.3        |     
                python-asgiref |  DISTRO  | https://release-monitoring.org/project/18462 | 3.3.4        | 3.5.2        |     
                  python-attrs |  DISTRO  | https://release-monitoring.org/project/15099 | 21.4.0       | 22.1.0       |     
                   python-avro |  DISTRO  | https://release-monitoring.org/project/59411 | 1.11.0       | 1.11.1       |     
                  python-babel |  DISTRO  | https://release-monitoring.org/project/11984 | 2.9.1        | 2.10.3       |     
                 python-bcrypt |  DISTRO  | https://release-monitoring.org/project/09047 | 3.2.0        | 4.0.1        |     
         python-beautifulsoup4 |  DISTRO  | https://release-monitoring.org/project/03779 | 4.10.0       | 4.11.1       |     
                  python-bleak |  DISTRO  | https://release-monitoring.org/project/26271 | 0.12.1       | 0.19.0       |     
               python-bluezero |  DISTRO  | https://release-monitoring.org/project/21929 | 0.6.0        | 0.7.1        |     
                  python-boto3 |  DISTRO  | https://release-monitoring.org/project/08778 | 1.24.8       | 1.24.91      |     
               python-botocore |  DISTRO  | https://release-monitoring.org/project/08748 | 1.27.8       | 1.27.91      |     
                 python-bottle |  DISTRO  | https://release-monitoring.org/project/11101 | 0.12.21      | 0.12.23      |     
                python-canopen |  DISTRO  | https://release-monitoring.org/project/23230 | 1.0.0        | 2.0.0b1      |     
                python-certifi |  DISTRO  | https://release-monitoring.org/project/07995 | 2022.9.14    | 2022.9.24    |     
               python-channels |  DISTRO  | https://release-monitoring.org/project/21937 | 2.3.1        | 4.0.0b1      |     
         python-channels-redis |  DISTRO  | https://release-monitoring.org/project/21936 | 2.4.1        | 4.0.0b2      |     
                python-cheroot |  DISTRO  | https://release-monitoring.org/project/20163 | 8.2.1        | 8.6.0        |     
               python-cherrypy |  DISTRO  | https://release-monitoring.org/project/03799 | 12.0.1       | 18.8.0       |     
               python-colorama |  DISTRO  | https://release-monitoring.org/project/03807 | 0.4.4        | 0.4.5        |     
               python-colorlog |  DISTRO  | https://release-monitoring.org/project/12509 | 6.4.1        | 6.7.0        |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/19734 | 1.1.29       | 1.5          |     
               python-crossbar |  DISTRO  | https://release-monitoring.org/project/21696 | 21.3.1       | 22.6.1       |     
           python-cryptography |  DISTRO  | https://release-monitoring.org/project/05532 | 38.0.1       | 38.0.2       |     
               python-cssutils |  DISTRO  | https://release-monitoring.org/project/13259 | 2.5.1        | 2.6.0        |     
                 python-cython |  DISTRO  | https://release-monitoring.org/project/12679 | 0.29.32      | 3.0.0a11     |     
                 python-daemon |  DISTRO  | https://release-monitoring.org/project/03816 | 2.2.3        | 2.3.1        |     
                 python-daphne |  DISTRO  | https://release-monitoring.org/project/21939 | 2.4.1        | 4.0.0b1      |     
           python-dataproperty |  DISTRO  | https://release-monitoring.org/project/21697 | 0.54.2       | 0.55.0       |     
              python-decorator |  DISTRO  | https://release-monitoring.org/project/03819 | 5.1.0        | 5.1.1        |     
                python-dialog3 |  DISTRO  | https://release-monitoring.org/project/03823 | 3.5.1        | 3.5.3        |     
                 python-distro |  DISTRO  | https://release-monitoring.org/project/12202 | 1.7.0        | 1.8.0        |     
                 python-django |  DISTRO  | https://release-monitoring.org/project/03828 | 4.0.6        | 4.1.2        |     
              python-dnspython |  DISTRO  | https://release-monitoring.org/project/13190 | 2.1.0        | 2.2.1        |     
                 python-docker |  DISTRO  | https://release-monitoring.org/project/03847 | 4.1.0        | 6.0.0b2      |     
               python-docutils |  DISTRO  | https://release-monitoring.org/project/03849 | 0.18.1       | 0.19         |     
               python-dominate |  DISTRO  | https://release-monitoring.org/project/19648 | 2.6.0        | 2.7.0        |     
                   python-dpkt |  DISTRO  | https://release-monitoring.org/project/10497 | 1.9.7.2      | 1.9.8        |     
               python-dtschema |  DISTRO  | https://release-monitoring.org/project/100908 | 2022.8       | 2022.9       |     
                  python-ecdsa |  DISTRO  | https://release-monitoring.org/project/08370 | 0.17.0       | 0.18.0       |     
               python-engineio |  DISTRO  | https://release-monitoring.org/project/15064 | 4.2.1        | 4.3.4        |     
            python-entrypoints |  DISTRO  | https://release-monitoring.org/project/12081 | 0.3          | 0.4          |     
                python-esptool |  DISTRO  | https://release-monitoring.org/project/11619 | 4.1          | 4.3          |     
               python-filelock |  DISTRO  | https://release-monitoring.org/project/11739 | 3.3.0        | 3.8.0        |     
                  python-flask |  DISTRO  | https://release-monitoring.org/project/03867 | 2.1.2        | 2.2.2        |     
            python-flask-login |  DISTRO  | https://release-monitoring.org/project/03868 | 0.6.1        | 0.6.2        |     
       python-flask-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/05701 | 2.5.1        | 3.0.2        |     
            python-flatbuffers |  DISTRO  | https://release-monitoring.org/project/85010 | 2.0.7        | 22.9.24      |     
              python-fonttools |  DISTRO  | https://release-monitoring.org/project/07388 | 4.37.3       | 4.37.4       |     
                    python-git |  DISTRO  | https://release-monitoring.org/project/06459 | 3.1.24       | 3.1.29       |     
                 python-gitdb2 |  DISTRO  | https://release-monitoring.org/project/12730 | 4.0.7        | 4.0.9        |     
                python-gobject |  DISTRO  | https://release-monitoring.org/project/13158 | 3.42.1       | 3.42.2       |     
               python-greenlet |  DISTRO  | https://release-monitoring.org/project/06870 | 1.1.2        | 1.1.3.post0  |     
               python-httplib2 |  DISTRO  | https://release-monitoring.org/project/03887 | 0.19.1       | 0.20.4       |     
               python-humanize |  DISTRO  | https://release-monitoring.org/project/19799 | 3.11.0       | 4.0.0        |     
                 python-ifaddr |  DISTRO  | https://release-monitoring.org/project/19908 | 0.1.7        | 0.2.0        |     
            python-incremental |  DISTRO  | https://release-monitoring.org/project/15162 | 21.3.0       | 22.10.0      |     
                python-ipython |  DISTRO  | https://release-monitoring.org/project/01399 | 7.31.1       | 8.5.0        |     
                python-iso8601 |  DISTRO  | https://release-monitoring.org/project/17228 | 0.1.14       | 1.1.0        |     
                  python-iwlib |  DISTRO  | https://release-monitoring.org/project/51611 | 1.5          | 1.7.0        |     
         python-jaraco-classes |  DISTRO  | https://release-monitoring.org/project/20150 | 2.0          | 3.2.3        |     
       python-jaraco-functools |  DISTRO  | https://release-monitoring.org/project/20165 | 2.0          | 3.5.2        |     
               python-jmespath |  DISTRO  | https://release-monitoring.org/project/08749 | 1.0.0        | 1.0.1        |     
             python-jsonschema |  DISTRO  | https://release-monitoring.org/project/03898 | 4.5.1        | 4.16.0       |     
                python-keyring |  DISTRO  | https://release-monitoring.org/project/03901 | 19.2.0       | 23.9.3       |     
             python-kiwisolver |  DISTRO  | https://release-monitoring.org/project/16910 | 1.1.0        | 1.4.4        |     
                   python-lark |  DISTRO  | https://release-monitoring.org/project/140595 | 1.1.2        | 1.1.3        |     
                python-libusb1 |  DISTRO  | https://release-monitoring.org/project/12301 | 2.0.1        | 3.0.0        |     
                   python-mako |  DISTRO  | https://release-monitoring.org/project/03915 | 1.1.5        | 1.2.3        |     
              python-markdown2 |  DISTRO  | https://release-monitoring.org/project/03917 | 2.4.1        | 2.4.5        |     
             python-markupsafe |  DISTRO  | https://release-monitoring.org/project/03918 | 2.0.1        | 2.1.1        |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/03919 | 3.4.3        | 3.6.1        |     
                python-maturin |  DISTRO  | https://release-monitoring.org/project/42653 | 0.13.5       | 0.13.6       |     
           python-mbstrdecoder |  DISTRO  | https://release-monitoring.org/project/21702 | 1.1.0        | 1.1.1        |     
        python-memory-profiler |  DISTRO  | https://release-monitoring.org/project/38508 | 0.58.0       | 0.60.0       |     
                python-mistune |  DISTRO  | https://release-monitoring.org/project/06189 | 0.8.4        | 2.0.4        |     
         python-more-itertools |  DISTRO  | https://release-monitoring.org/project/12201 | 8.10.0       | 8.14.0       |     
                  python-msgfy |  DISTRO  | https://release-monitoring.org/project/29716 | 0.1.0        | 0.2.0        |     
                python-mutagen |  DISTRO  | https://release-monitoring.org/project/03931 | 1.45.1       | 1.46.0       |     
         python-networkmanager |  DISTRO  | https://release-monitoring.org/project/12909 | 2.1          | 2.2          |     
               python-networkx |  DISTRO  | https://release-monitoring.org/project/07791 | 2.6.3        | 3.0b1        |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/02509 | 1.21.2       | 1.23.4       |     
               python-oauthlib |  DISTRO  | https://release-monitoring.org/project/05377 | 3.1.1        | 3.2.1        |     
          python-opcua-asyncio |  DISTRO  | https://release-monitoring.org/project/131612 | 0.8.4        | 0.98.9       |     
                 python-orjson |  DISTRO  | https://release-monitoring.org/project/31737 | 3.7.11       | 3.8.0        |     
               python-paramiko |  DISTRO  | https://release-monitoring.org/project/03954 | 2.10.3       | 2.11.0       |     
                 python-pathpy |  DISTRO  | https://release-monitoring.org/project/21703 | 12.0.1       | 12.5.0       |     
           python-pathvalidate |  DISTRO  | https://release-monitoring.org/project/21704 | 2.5.0        | 2.5.2        |     
                    python-pbr |  DISTRO  | https://release-monitoring.org/project/03960 | 5.6.0        | 5.10.0       |     
                    python-pip |  DISTRO  | https://release-monitoring.org/project/06529 | 21.2.4       | 22.3         |     
                python-portend |  DISTRO  | https://release-monitoring.org/project/20203 | 2.5          | 3.1.0        |     
         python-prompt-toolkit |  DISTRO  | https://release-monitoring.org/project/08742 | 3.0.20       | 3.0.31       |     
               python-protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 21.6         | 21.7         |     
                 python-psutil |  DISTRO  | https://release-monitoring.org/project/03978 | 5.8.0        | 5.9.2        |     
               python-psycopg2 |  DISTRO  | https://release-monitoring.org/project/03979 | 2.9.1        | 2.9.4        |     
                   python-pudb |  DISTRO  | https://release-monitoring.org/project/03980 | 2021.1       | 2022.1.2     |     
                     python-py |  DISTRO  | https://release-monitoring.org/project/03981 | 1.10.0       | 1.11.0       |     
               python-pydantic |  DISTRO  | https://release-monitoring.org/project/29768 | 1.8.2        | 1.10.2       |     
                  python-pydyf |  DISTRO  | https://release-monitoring.org/project/179112 | 0.3.0        | 0.5.0        |     
             python-pyelftools |  DISTRO  | https://release-monitoring.org/project/16219 | 0.27         | 0.29         |     
              python-pyftpdlib |  DISTRO  | https://release-monitoring.org/project/17026 | 1.5.6        | 1.5.7        |     
                 python-pygame |  DISTRO  | https://release-monitoring.org/project/17480 | d61ea8eabd56 | 2.1.2        |     
               python-pygments |  DISTRO  | https://release-monitoring.org/project/03986 | 2.7.4        | 2.13.0       |     
             python-pyhamcrest |  DISTRO  | https://release-monitoring.org/project/11633 | 2.0.2        | 2.0.4        |     
                  python-pyicu |  DISTRO  | https://release-monitoring.org/project/12004 | 1.9.7        | 2.9          |     
                  python-pyjwt |  DISTRO  | https://release-monitoring.org/project/05653 | 2.4.0        | 2.5.0        |     
              python-pylibftdi |  DISTRO  | https://release-monitoring.org/project/21583 | 0.18.1       | 0.20.0       |     
               python-pymodbus |  DISTRO  | https://release-monitoring.org/project/15600 | 2.2.0        | 3.0.0        |     
                python-pymupdf |  DISTRO  | https://release-monitoring.org/project/17320 | 1.18.14      | 1.20.2       |     
              python-pyopenssl |  DISTRO  | https://release-monitoring.org/project/05535 | 22.0.0       | 22.1.0       |     
               python-pyparted |  DISTRO  | https://release-monitoring.org/project/15558 | 3.11.6       | 3.12.0       |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/20104 | 5.15.6       | 5.15.7       |     
               python-pyroute2 |  DISTRO  | https://release-monitoring.org/project/20081 | 0.5.7        | 0.7.3        |     
                  python-pysmb |  DISTRO  | https://release-monitoring.org/project/21589 | 1.2.7        | 1.2.8        |     
          python-pytablereader |  DISTRO  | https://release-monitoring.org/project/21592 | 0.26.1       | 0.31.3       |     
          python-pytablewriter |  DISTRO  | https://release-monitoring.org/project/21593 | 0.46.1       | 0.64.2       |     
                 python-pytest |  DISTRO  | https://release-monitoring.org/project/03765 | 7.1.2        | 7.1.3        |     
                   python-pytz |  DISTRO  | https://release-monitoring.org/project/06537 | 2021.3       | 2022.4       |     
                 python-pyudev |  DISTRO  | https://release-monitoring.org/project/08485 | 0.22.0       | 0.24.0       |     
                  python-pyzmq |  DISTRO  | https://release-monitoring.org/project/04104 | 19.0.2       | 25.0.0b1     |     
                  python-redis |  DISTRO  | https://release-monitoring.org/project/03992 | 3.5.3        | 4.3.4        |     
                python-reentry |  DISTRO  | https://release-monitoring.org/project/21596 | 1.3.2        | 1.3.3        |     
                  python-regex |  DISTRO  | https://release-monitoring.org/project/05548 | 2021.4.4     | 2022.9.13    |     
      python-requests-oauthlib |  DISTRO  | https://release-monitoring.org/project/11803 | 1.3.0        | 1.3.1        |     
      python-requests-toolbelt |  DISTRO  | https://release-monitoring.org/project/05665 | 0.9.1        | 0.10.0       |     
               python-rpi-gpio |  DISTRO  | https://release-monitoring.org/project/12026 | 0.7.0        | 0.7.1        |     
                    python-rsa |  DISTRO  | https://release-monitoring.org/project/08808 | 4.8          | 4.9          |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/19641 | 2.1.74       | 2.2          |     
                  python-scipy |  DISTRO  | https://release-monitoring.org/project/04768 | 1.8.1        | 1.9.2        |     
          python-secretstorage |  DISTRO  | https://release-monitoring.org/project/04020 | 3.1.2        | 3.3.3        |     
       python-semantic-version |  DISTRO  | https://release-monitoring.org/project/06514 | 2.8.5        | 2.10.0       |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/21603 | 1.4.3        | 1.9.10       |     
           python-setproctitle |  DISTRO  | https://release-monitoring.org/project/11699 | 1.2.2        | 1.3.2        |     
             python-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 65.3.0       | 65.5.0       |     
python-setuptools-scm-git-a... |  DISTRO  | https://release-monitoring.org/project/28329 | 1.1          | 1.4          |     
                     python-sh |  DISTRO  | https://release-monitoring.org/project/10429 | 1.14.2       | 1.14.3       |     
           python-simplesqlite |  DISTRO  | https://release-monitoring.org/project/21608 | 0.45.2       | 1.3.0        |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/13626 | 4.19.25      | 5.0.0        |     
               python-socketio |  DISTRO  | https://release-monitoring.org/project/21611 | 5.4.0        | 5.7.1        |     
              python-soupsieve |  DISTRO  | https://release-monitoring.org/project/27570 | 2.2.1        | 2.3.2.post1  |     
             python-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/04034 | 1.3.10       | 2.0.0b1      |     
           python-sqliteschema |  DISTRO  | https://release-monitoring.org/project/29718 | 1.2.1        | 1.3.0        |     
               python-sqlparse |  DISTRO  | https://release-monitoring.org/project/04038 | 0.3.0        | 0.4.3        |     
                python-systemd |  DISTRO  | https://release-monitoring.org/project/07314 | 234          | 235          |     
                python-tempora |  DISTRO  | https://release-monitoring.org/project/21225 | 1.14.1       | 5.0.2        |     
              python-termcolor |  DISTRO  | https://release-monitoring.org/project/10198 | 1.1.0        | 2.0.1        |     
                 python-thrift |  DISTRO  | https://release-monitoring.org/project/21614 | 0.13.0       | 0.16.0       |     
                python-tornado |  DISTRO  | https://release-monitoring.org/project/07498 | 6.0.4        | 6.2          |     
                   python-tqdm |  DISTRO  | https://release-monitoring.org/project/11524 | 4.40.1       | 4.64.1       |     
              python-traitlets |  DISTRO  | https://release-monitoring.org/project/12211 | 5.1.0        | 5.4.0        |     
                python-twisted |  DISTRO  | https://release-monitoring.org/project/04071 | 22.2.0       | 22.8.0       |     
               python-txtorcon |  DISTRO  | https://release-monitoring.org/project/19661 | 21.1.0       | 22.0.0       |     
      python-typing-extensions |  DISTRO  | https://release-monitoring.org/project/19755 | 4.3.0        | 4.4.0        |     
                  python-ujson |  DISTRO  | https://release-monitoring.org/project/04076 | 5.2.0        | 5.5.0        |     
 python-unittest-xml-reporting |  DISTRO  | https://release-monitoring.org/project/72281 | 3.0.4        | 3.2.0        |     
             python-validators |  DISTRO  | https://release-monitoring.org/project/19818 | 0.15.0       | 0.20.0       |     
               python-watchdog |  DISTRO  | https://release-monitoring.org/project/05341 | 2.1.6        | 2.1.9        |     
                python-wcwidth |  DISTRO  | https://release-monitoring.org/project/08743 | 0.1.9        | 0.2.5        |     
             python-weasyprint |  DISTRO  | https://release-monitoring.org/project/11057 | 56.1         | 57.0b1       |     
                  python-webpy |  DISTRO  | https://release-monitoring.org/project/04090 | 0.40         | 0.62         |     
       python-websocket-client |  DISTRO  | https://release-monitoring.org/project/07288 | 0.58.0       | 1.4.1        |     
             python-websockets |  DISTRO  | https://release-monitoring.org/project/08100 | 10.0         | 10.3         |     
               python-werkzeug |  DISTRO  | https://release-monitoring.org/project/04092 | 2.1.2        | 2.2.2        |     
                  python-wrapt |  DISTRO  | https://release-monitoring.org/project/06108 | 1.12.1       | 1.14.1       |     
                python-wtforms |  DISTRO  | https://release-monitoring.org/project/11805 | 2.3.3        | 3.0.1        |     
                   python-xlib |  DISTRO  | https://release-monitoring.org/project/12180 | 0.27         | 0.31         |     
             python-xlsxwriter |  DISTRO  | https://release-monitoring.org/project/12031 | 3.0.1        | 3.0.3        |     
                   python-yatl |  DISTRO  | https://release-monitoring.org/project/50636 | 20211217.1   | 20220907.1   |     
               python-zeroconf |  DISTRO  | https://release-monitoring.org/project/12681 | 0.29.0       | 0.39.1       |     
                  python-zlmdb |  DISTRO  | https://release-monitoring.org/project/66674 | 22.3.1       | 22.6.1       |     
         python-zope-interface |  DISTRO  | https://release-monitoring.org/project/04112 | 5.4.0        | 5.5.0        |     
                       python3 |  DISTRO  | https://release-monitoring.org/project/13254 | 3.10.7       | 3.10.8       |     
          qcom-db410c-firmware |  DISTRO  | https://release-monitoring.org/project/235382 | 1034.2.1     | 1036.1       |     
                          qpdf |  DISTRO  | https://release-monitoring.org/project/05542 | 10.5.0       | 11.1.1       |     
                   qpid-proton |  DISTRO  | https://release-monitoring.org/project/15198 | 0.35.0       | 0.37.0       |     
                       qt5coap |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.4.0        |     
                        qt5knx |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.4.0        |     
                       qt5mqtt |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.4.0        |     
                      qt5opcua |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.4.0        |     
                  qt5webengine |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.8       | 6.4.0        |     
                        quazip |  DISTRO  | https://release-monitoring.org/project/04141 | 1.2          | 1.3          |     
                         quota |  DISTRO  | https://release-monitoring.org/project/04145 | 4.06         | 4.09         |     
                           qwt |  DISTRO  | https://release-monitoring.org/project/04147 | 6.1.6        | 6.2.0        | ORPH
               rabbitmq-server |  DISTRO  | https://release-monitoring.org/project/05585 | 3.8.2        | 3.11.1       |     
                         ragel |  DISTRO  | https://release-monitoring.org/project/12105 | 6.10         | 7.0.4        | ORPH
                        ranger |  DISTRO  | https://release-monitoring.org/project/07426 | 1.7.2        | 1.9.3        |     
                      readline |  DISTRO  | https://release-monitoring.org/project/04173 | 8.1.2        | 8.2          | ORPH
                     refpolicy |  DISTRO  | https://release-monitoring.org/project/21663 | 2.20220106   | 2.20220520   |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/16520 | 3.3          | 20200710     | ORPH
              riemann-c-client |  DISTRO  | https://release-monitoring.org/project/21389 | 1.10.5       | 2.0.1        | ORPH
                       rocksdb |  DISTRO  | https://release-monitoring.org/project/15560 | 6.20.3       | 7.7.3        |     
                         rsync |  DISTRO  | https://release-monitoring.org/project/04217 | 3.2.5        | 3.2.6        | ORPH
                       rsyslog |  DISTRO  | https://release-monitoring.org/project/04218 | 8.2204.1     | 8.2208.0     |     
                          rtty |  DISTRO  | https://release-monitoring.org/project/87994 | 7.4.0        | 8.1.0        |     
                         rygel |  DISTRO  | https://release-monitoring.org/project/04751 | 0.40.2       | 0.42.0       |     
                            s6 |  DISTRO  | https://release-monitoring.org/project/05485 | 2.10.0.3     | 2.11.1.2     |     
                        s6-dns |  DISTRO  | https://release-monitoring.org/project/16547 | 2.3.5.1      | 2.3.5.4      |     
                 s6-linux-init |  DISTRO  | https://release-monitoring.org/project/16552 | 1.0.6.3      | 1.0.8.0      |     
                s6-linux-utils |  DISTRO  | https://release-monitoring.org/project/16551 | 2.5.1.5      | 2.6.0.0      |     
                 s6-networking |  DISTRO  | https://release-monitoring.org/project/16550 | 2.4.1.1      | 2.5.1.1      |     
             s6-portable-utils |  DISTRO  | https://release-monitoring.org/project/16549 | 2.2.3.2      | 2.2.5.0      |     
                         s6-rc |  DISTRO  | https://release-monitoring.org/project/16548 | 0.5.2.2      | 0.5.3.2      |     
                      safeclib |  DISTRO  | https://release-monitoring.org/project/21385 | 3.7.1        | 01022022     |     
                        samba4 |  DISTRO  | https://release-monitoring.org/project/04758 | 4.15.7       | 4.17.0       |     
                         scons |  DISTRO  | https://release-monitoring.org/project/04770 | 3.1.2        | 4.4.0        |     
                    sdl2_mixer |  DISTRO  | https://release-monitoring.org/project/04782 | 2.0.4        | 2.6.2        | ORPH
                      sdl2_net |  DISTRO  | https://release-monitoring.org/project/04783 | 2.0.1        | 2.2.0        | ORPH
                      sdl2_ttf |  DISTRO  | https://release-monitoring.org/project/04784 | 2.0.18       | 2.20.1       |     
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/04778 | 2.0.23       | 2.0.25       | ORPH
                     sdl_sound |  DISTRO  | https://release-monitoring.org/project/10262 | 1.0.3        | 2.0.1        | ORPH
                        sdparm |  DISTRO  | https://release-monitoring.org/project/04787 | 1.10         | 1.12         |     
                       sedutil |  DISTRO  | https://release-monitoring.org/project/15203 | 1.15.1       | 1.20.0       |     
                selinux-python |  DISTRO  | https://release-monitoring.org/project/01717 | 3.3          | 3.4          |     
                semodule-utils |  DISTRO  | https://release-monitoring.org/project/01717 | 3.3          | 3.4          | ORPH
                    sentry-cli |  DISTRO  | https://release-monitoring.org/project/135642 | 1.59.0       | 2.7.0        |     
                 sentry-native |  DISTRO  | https://release-monitoring.org/project/135639 | 0.4.1        | 0.5.0        |     
                          serd |  DISTRO  | https://release-monitoring.org/project/230531 | 0.30.14      | 0.30.16      |     
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/05524 | 1.12         | 2.2          | ORPH
                          shim |  DISTRO  | https://release-monitoring.org/project/10719 | 15.4         | 15.6         |     
                       skalibs |  DISTRO  | https://release-monitoring.org/project/05486 | 2.10.0.3     | 2.12.0.1     |     
                         slang |  DISTRO  | https://release-monitoring.org/project/04829 | 2.3.2        | 2.3.3        | ORPH
                 smartmontools |  DISTRO  | https://release-monitoring.org/project/04835 | 7.2          | 7.3          | ORPH
                        sngrep |  DISTRO  | https://release-monitoring.org/project/17075 | 1.4.7        | 1.6.0        | ORPH
                        snmppp |  DISTRO  | https://release-monitoring.org/project/21318 | 3.4.10       | 3.5.0        |     
                        snort3 |  DISTRO  | https://release-monitoring.org/project/13263 | 3.1.40.0     | 3.1.43.0     |     
                     sofia-sip |  DISTRO  | https://release-monitoring.org/project/10509 | 1.13.8       | 1.13.9       |     
                     softether |  DISTRO  | https://release-monitoring.org/project/21383 | 4.30-9700... | 4.38-9760... |     
                          sord |  DISTRO  | https://release-monitoring.org/project/230536 | 0.16.12      | 0.16.14      |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/10152 | 0.7          | 0.8          |     
                       spandsp |  DISTRO  | https://release-monitoring.org/project/12600 | 3.0.0-6ec... | 3.0.0        |     
                    sphinxbase |  DISTRO  | https://release-monitoring.org/project/20548 | 5prealpha    | 0.8          |     
                         spice |  DISTRO  | https://release-monitoring.org/project/04871 | 0.15.0       | 0.15.1       |     
                     sqlcipher |  DISTRO  | https://release-monitoring.org/project/11213 | 4.5.1        | 4.5.2        |     
                      squashfs |  DISTRO  | https://release-monitoring.org/project/04879 | 4.5          | 4.5.1        |     
                         squid |  DISTRO  | https://release-monitoring.org/project/04880 | 5.6          | 5.7          | ORPH
                        sratom |  DISTRO  | https://release-monitoring.org/project/14903 | 0.6.8        | 0.6.14       |     
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/08127 | 1.20.7.1     | 1.21.9       | ORPH
                    stellarium |  DISTRO  | https://release-monitoring.org/project/04891 | 0.22.2       | 1.0          |     
                        stress |  DISTRO  | https://release-monitoring.org/project/08048 | 1.0.4        | 1.0.5        |     
                     stress-ng |  DISTRO  | https://release-monitoring.org/project/12538 | 0.13.05      | 0.14.06      |     
                    strongswan |  DISTRO  | https://release-monitoring.org/project/04899 | 5.9.5        | 5.9.8        |     
                       stunnel |  DISTRO  | https://release-monitoring.org/project/04901 | 5.65         | 5.66         |     
                          sudo |  DISTRO  | https://release-monitoring.org/project/04906 | 1.9.11p2     | 1.9.11p3     | ORPH
                    supervisor |  DISTRO  | https://release-monitoring.org/project/16289 | 4.2.2        | 4.2.4        | ORPH
                      suricata |  DISTRO  | https://release-monitoring.org/project/10925 | 6.0.6        | 6.0.8        |     
                       synergy |  DISTRO  | https://release-monitoring.org/project/05718 | 2.0.12-beta  | 2.3.2        |     
                       sysprof |  DISTRO  | https://release-monitoring.org/project/21649 | 1.2.0        | 3.46.0       |     
                       sysrepo |  DISTRO  | https://release-monitoring.org/project/34820 | 2.1.64       | 2.1.84       |     
                       sysstat |  DISTRO  | https://release-monitoring.org/project/04931 | 12.4.2       | 12.6.0       | ORPH
         system-config-printer |  DISTRO  | https://release-monitoring.org/project/08855 | 1.5.15       | 1.5.18       | ORPH
                       systemd |  DISTRO  | https://release-monitoring.org/project/05440 | 250.4        | 251          |     
             systemd-bootchart |  DISTRO  | https://release-monitoring.org/project/11774 | 233          | 234          |     
                      sysvinit |  DISTRO  | https://release-monitoring.org/project/21648 | 2.99         | 3.04         | ORPH
                           tbb |  DISTRO  | https://release-monitoring.org/project/08217 | 2021.5.0     | 2021.6.0     |     
                         tclap |  DISTRO  | https://release-monitoring.org/project/04942 | 1.2.4        | 1.2.5        |     
                        tcllib |  DISTRO  | https://release-monitoring.org/project/04943 | 1.20         | 1.21         |     
                      tealdeer |  DISTRO  | https://release-monitoring.org/project/84521 | 1.5.0        | 1.6.0        |     
                 tesseract-ocr |  DISTRO  | https://release-monitoring.org/project/04954 | 5.0.1        | 5.2.0        |     
                      thermald |  DISTRO  | https://release-monitoring.org/project/14500 | 2.5          | 2.5.1        |     
                        thrift |  DISTRO  | https://release-monitoring.org/project/05581 | 0.14.1       | 0.17.0       | ORPH
                   timescaledb |  DISTRO  | https://release-monitoring.org/project/17545 | 2.8.0        | 2.8.1        |     
                      tinifier |  DISTRO  | https://release-monitoring.org/project/241900 | 3.4.0        | 3.5.0        |     
                       tinyssh |  DISTRO  | https://release-monitoring.org/project/14678 | 20210601     | 20220801     |     
                       tinyxml |  DISTRO  | https://release-monitoring.org/project/10162 | 2.6.2_2      | 2.6.2        | ORPH
                           tio |  DISTRO  | https://release-monitoring.org/project/20587 | 1.47         | 2.1          |     
                          tmux |  DISTRO  | https://release-monitoring.org/project/04980 | 3.1c         | 3.3a         |     
                     tpm-tools |  DISTRO  | https://release-monitoring.org/project/21640 | 1.3.9.1      | 1.3.9.2      |     
                    tpm2-abrmd |  DISTRO  | https://release-monitoring.org/project/16819 | 2.3.3        | 2.4.1        | ORPH
                   tpm2-pkcs11 |  DISTRO  | https://release-monitoring.org/project/18777 | 1.7.0        | 1.8.0        |     
                    tpm2-tools |  DISTRO  | https://release-monitoring.org/project/12841 | 5.2          | 5.3          | ORPH
                     tpm2-totp |  DISTRO  | https://release-monitoring.org/project/18790 | 0.2.1        | 0.3.0        |     
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/12683 | 3.1.0        | 3.2.0        | ORPH
                     trace-cmd |  DISTRO  | https://release-monitoring.org/project/07873 | 2.9.7        | 3.1.4        |     
                          tree |  DISTRO  | https://release-monitoring.org/project/05006 | 2.0.2        | 2.0.4        |     
                          ttyd |  DISTRO  | https://release-monitoring.org/project/13890 | 1.7.0        | 1.7.1        |     
                   uboot-tools |  DISTRO  | https://release-monitoring.org/project/05022 | 2021.07      | 2022.10      |     
                          uftp |  DISTRO  | https://release-monitoring.org/project/21638 | 5.0          | 5.0.1        |     
                       uftrace |  DISTRO  | https://release-monitoring.org/project/195039 | 0.10         | 0.12         |     
                       unionfs |  DISTRO  | https://release-monitoring.org/project/17617 | 2.1          | 3.2          |     
                      upmpdcli |  DISTRO  | https://release-monitoring.org/project/15848 | 1.5.12       | 1.6.0        | ORPH
                        upower |  DISTRO  | https://release-monitoring.org/project/05056 | 0.99.19      | 0.99.20      |     
                      usbguard |  DISTRO  | https://release-monitoring.org/project/11151 | 1.1.1        | 1.1.2        |     
                      usbredir |  DISTRO  | https://release-monitoring.org/project/16012 | 0.12.0       | 0.13.0       |     
                    util-linux |  DISTRO  | https://release-monitoring.org/project/08179 | 2.38         | 2.38.1       | ORPH
               util-linux-libs |  DISTRO  | https://release-monitoring.org/project/08179 | 2.38         | 2.38.1       | ORPH
                           uuu |  DISTRO  | https://release-monitoring.org/project/259328 | 1.4.243      | 1.5.4        |     
                           uvw |  DISTRO  | https://release-monitoring.org/project/33083 | 2.11.0_li... | 2.12.1_li... |     
                          vala |  DISTRO  | https://release-monitoring.org/project/05065 | 0.52.4       | 0.56.3       | ORPH
                      valijson |  DISTRO  | https://release-monitoring.org/project/18452 | 0.6          | 0.7          |     
                           vim |  DISTRO  | https://release-monitoring.org/project/05092 | 9.0.0709     | 9.0.0771     | ORPH
                   vis-network |  DISTRO  | https://release-monitoring.org/project/270536 | 9.1.0        | 9.1.2        |     
                        vnstat |  DISTRO  | https://release-monitoring.org/project/07283 | 2.8          | 2.9          |     
                          vpnc |  DISTRO  | https://release-monitoring.org/project/15955 | 0.5.3r550... | 0.5.3        | ORPH
                           vte |  DISTRO  | https://release-monitoring.org/project/10895 | 0.66.2       | 0.70.0       | ORPH
                         vuejs |  DISTRO  | https://release-monitoring.org/project/89353 | 3.2.33       | 3.2.41       |     
                  vuejs-router |  DISTRO  | https://release-monitoring.org/project/234796 | 4.0.15       | 4.1.5        |     
                vulkan-headers |  DISTRO  | https://release-monitoring.org/project/88835 | 1.2.203      | 1.3.231      | ORPH
             wayland-protocols |  DISTRO  | https://release-monitoring.org/project/13997 | 1.26         | 1.27         | ORPH
                     waylandpp |  DISTRO  | https://release-monitoring.org/project/16969 | 0.2.8        | 1.0.0        |     
       webrtc-audio-processing |  DISTRO  | https://release-monitoring.org/project/15929 | 0.3.1        | 1.0          | ORPH
                        weston |  DISTRO  | https://release-monitoring.org/project/13745 | 10.0.1       | 11.0.0       |     
                          wine |  DISTRO  | https://release-monitoring.org/project/05134 | 7.0          | 7.19         |     
        wireguard-linux-compat |  DISTRO  | https://release-monitoring.org/project/62379 | 1.0.20211208 | 1.0.20220627 |     
                wireless-regdb |  DISTRO  | https://release-monitoring.org/project/15257 | 2022.02.18   | 2022.08.12   |     
                   wireplumber |  DISTRO  | https://release-monitoring.org/project/235056 | 0.4.8        | 0.4.12       | ORPH
                     wireshark |  DISTRO  | https://release-monitoring.org/project/05137 | 3.4.12       | 4.0.0        | ORPH
                       wolftpm |  DISTRO  | https://release-monitoring.org/project/256219 | 2.4.0        | 2.6.0        |     
                wpebackend-fdo |  DISTRO  | https://release-monitoring.org/project/17547 | 1.12.1       | 1.14.0       |     
                     wpewebkit |  DISTRO  | https://release-monitoring.org/project/17557 | 2.36.8       | 2.38.0       |     
                       wtfutil |  DISTRO  | https://release-monitoring.org/project/243189 | 0.41.0       | 0.42.0       |     
                        xapian |  DISTRO  | https://release-monitoring.org/project/15919 | 1.4.19       | 1.4.21       |     
                xapp_fslsfonts |  DISTRO  | https://release-monitoring.org/project/17157 | 1.0.5        | 1.0.6        |     
                  xapp_fstobdf |  DISTRO  | https://release-monitoring.org/project/17156 | 1.0.6        | 1.0.7        |     
                      xapp_ico |  DISTRO  | https://release-monitoring.org/project/21722 | 1.0.5        | 1.0.6        |     
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/15047 | 1.1.1        | 20220111     |     
                   xapp_oclock |  DISTRO  | https://release-monitoring.org/project/15042 | 1.0.4        | 1.0.5        |     
                 xapp_showfont |  DISTRO  | https://release-monitoring.org/project/12316 | 1.0.5        | 1.0.6        |     
                  xapp_smproxy |  DISTRO  | https://release-monitoring.org/project/15039 | 1.0.6        | 1.0.7        |     
                  xapp_viewres |  DISTRO  | https://release-monitoring.org/project/17162 | 1.0.6        | 1.0.7        |     
                 xapp_xditview |  DISTRO  | https://release-monitoring.org/project/21262 | 1.0.5        | 1.0.6        |     
                      xapp_xgc |  DISTRO  | https://release-monitoring.org/project/21720 | 1.0.5        | 1.0.6        |     
                 xapp_xkbprint |  DISTRO  | https://release-monitoring.org/project/17159 | 1.0.5        | 1.0.6        |     
                      xapp_xmh |  DISTRO  | https://release-monitoring.org/project/21718 | 1.0.3        | 1.0.4        |     
   xdriver_xf86-input-keyboard |  DISTRO  | https://release-monitoring.org/project/15902 | 1.9.0        | 2.0.0        |     
   xdriver_xf86-input-libinput |  DISTRO  | https://release-monitoring.org/project/05782 | 1.2.0        | 1.2.1        |     
    xdriver_xf86-input-vmmouse |  DISTRO  | https://release-monitoring.org/project/05244 | 13.1.0       | 13.2.0       |     
                           xen |  DISTRO  | https://release-monitoring.org/project/05181 | 4.14.4       | 4.16.2       |     
                      xfsprogs |  DISTRO  | https://release-monitoring.org/project/05188 | 5.14.2       | 5.19.0       | ORPH
                        xinetd |  DISTRO  | https://release-monitoring.org/project/06382 | 2.3.15       | 2.3.15.4     |     
              xkeyboard-config |  DISTRO  | https://release-monitoring.org/project/05191 | 2.36         | 2.37         |     
                    xlib_libFS |  DISTRO  | https://release-monitoring.org/project/01618 | 1.0.8        | 1.0.9        |     
                   xlib_libXau |  DISTRO  | https://release-monitoring.org/project/01765 | 1.0.9        | 1.0.10       |     
                xlib_libXfont2 |  DISTRO  | https://release-monitoring.org/project/17165 | 2.0.5        | 2.0.6        |     
                   xlib_libXft |  DISTRO  | https://release-monitoring.org/project/01777 | 2.3.4        | 2.3.6        |     
                  xlib_libXtst |  DISTRO  | https://release-monitoring.org/project/01794 | 1.2.3        | 1.2.4        |     
               xlib_libXxf86vm |  DISTRO  | https://release-monitoring.org/project/01799 | 1.1.4        | 1.1.5        |     
               xlib_libfontenc |  DISTRO  | https://release-monitoring.org/project/01613 | 1.1.4        | 1.1.6        |     
                     xorgproto |  DISTRO  | https://release-monitoring.org/project/17190 | 2022.1       | 2022.2       |     
                  xscreensaver |  DISTRO  | https://release-monitoring.org/project/05269 | 6.03         | 6.05.1       |     
                         xterm |  DISTRO  | https://release-monitoring.org/project/05272 | 371          | 374          | ORPH
                           yad |  DISTRO  | https://release-monitoring.org/project/05280 | 0.40.0       | 12.0         |     
                        zabbix |  DISTRO  | https://release-monitoring.org/project/05492 | 5.4.9        | 6.2.3        |     
                        zchunk |  DISTRO  | https://release-monitoring.org/project/178035 | 1.2.2        | 1.2.3        |     
                          zeek |  DISTRO  | https://release-monitoring.org/project/267106 | 4.1.1        | 5.0.2        |     
                          zlog |  DISTRO  | https://release-monitoring.org/project/21624 | 1.2.15       | 1.2.16       |     
                           zsh |  DISTRO  | https://release-monitoring.org/project/05307 | 5.8.1        | 5.9          |     

Packages having CVEs
====================

CVEs for the 'master' branch
----------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-4465    | https://security-tracker.debian.org/tracker/CVE-2007-4465   
                        apache | CVE-2007-5000    | https://security-tracker.debian.org/tracker/CVE-2007-5000   
                        apache | CVE-2007-6388    | https://security-tracker.debian.org/tracker/CVE-2007-6388   
                        apache | CVE-2007-6420    | https://security-tracker.debian.org/tracker/CVE-2007-6420   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2008-2939    | https://security-tracker.debian.org/tracker/CVE-2008-2939   
                        apache | CVE-2009-1195    | https://security-tracker.debian.org/tracker/CVE-2009-1195   
                        apache | CVE-2010-0408    | https://security-tracker.debian.org/tracker/CVE-2010-0408   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2010-1452    | https://security-tracker.debian.org/tracker/CVE-2010-1452   
                        apache | CVE-2014-0231    | https://security-tracker.debian.org/tracker/CVE-2014-0231   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                        assimp | CVE-2022-38528   | https://security-tracker.debian.org/tracker/CVE-2022-38528  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2022-27607   | https://security-tracker.debian.org/tracker/CVE-2022-27607  
                        bento4 | CVE-2022-35165   | https://security-tracker.debian.org/tracker/CVE-2022-35165  
                        bento4 | CVE-2022-40438   | https://security-tracker.debian.org/tracker/CVE-2022-40438  
                        bento4 | CVE-2022-40439   | https://security-tracker.debian.org/tracker/CVE-2022-40439  
                        bento4 | CVE-2022-40736   | https://security-tracker.debian.org/tracker/CVE-2022-40736  
                        bento4 | CVE-2022-40737   | https://security-tracker.debian.org/tracker/CVE-2022-40737  
                        bento4 | CVE-2022-40738   | https://security-tracker.debian.org/tracker/CVE-2022-40738  
                        bento4 | CVE-2022-40774   | https://security-tracker.debian.org/tracker/CVE-2022-40774  
                        bento4 | CVE-2022-40775   | https://security-tracker.debian.org/tracker/CVE-2022-40775  
                        bento4 | CVE-2022-41419   | https://security-tracker.debian.org/tracker/CVE-2022-41419  
                        bento4 | CVE-2022-41423   | https://security-tracker.debian.org/tracker/CVE-2022-41423  
                        bento4 | CVE-2022-41424   | https://security-tracker.debian.org/tracker/CVE-2022-41424  
                        bento4 | CVE-2022-41425   | https://security-tracker.debian.org/tracker/CVE-2022-41425  
                        bento4 | CVE-2022-41426   | https://security-tracker.debian.org/tracker/CVE-2022-41426  
                        bento4 | CVE-2022-41427   | https://security-tracker.debian.org/tracker/CVE-2022-41427  
                        bento4 | CVE-2022-41428   | https://security-tracker.debian.org/tracker/CVE-2022-41428  
                        bento4 | CVE-2022-41429   | https://security-tracker.debian.org/tracker/CVE-2022-41429  
                        bento4 | CVE-2022-41430   | https://security-tracker.debian.org/tracker/CVE-2022-41430  
                        bento4 | CVE-2022-41841   | https://security-tracker.debian.org/tracker/CVE-2022-41841  
                        bento4 | CVE-2022-41845   | https://security-tracker.debian.org/tracker/CVE-2022-41845  
                        bento4 | CVE-2022-41846   | https://security-tracker.debian.org/tracker/CVE-2022-41846  
                        bento4 | CVE-2022-41847   | https://security-tracker.debian.org/tracker/CVE-2022-41847  
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2022-38126   | https://security-tracker.debian.org/tracker/CVE-2022-38126  
                      binutils | CVE-2022-38127   | https://security-tracker.debian.org/tracker/CVE-2022-38127  
                      binutils | CVE-2022-38128   | https://security-tracker.debian.org/tracker/CVE-2022-38128  
                      binutils | CVE-2022-38533   | https://security-tracker.debian.org/tracker/CVE-2022-38533  
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                         cairo | CVE-2019-6461    | https://security-tracker.debian.org/tracker/CVE-2019-6461   
                         cairo | CVE-2019-6462    | https://security-tracker.debian.org/tracker/CVE-2019-6462   
                         cairo | CVE-2020-35492   | https://security-tracker.debian.org/tracker/CVE-2020-35492  
                       connman | CVE-2022-32292   | https://security-tracker.debian.org/tracker/CVE-2022-32292  
                       connman | CVE-2022-32293   | https://security-tracker.debian.org/tracker/CVE-2022-32293  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                      cryptopp | CVE-2021-43398   | https://security-tracker.debian.org/tracker/CVE-2021-43398  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dhcp | CVE-2022-2928    | https://security-tracker.debian.org/tracker/CVE-2022-2928   
                          dhcp | CVE-2022-2929    | https://security-tracker.debian.org/tracker/CVE-2022-2929   
                       dnsmasq | CVE-2022-0934    | https://security-tracker.debian.org/tracker/CVE-2022-0934   
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                       dovecot | CVE-2022-30550   | https://security-tracker.debian.org/tracker/CVE-2022-30550  
                        dracut | CVE-2010-4176    | https://security-tracker.debian.org/tracker/CVE-2010-4176   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                        erlang | CVE-2020-35733   | https://security-tracker.debian.org/tracker/CVE-2020-35733  
                        erlang | CVE-2022-37026   | https://security-tracker.debian.org/tracker/CVE-2022-37026  
                         exfat | CVE-2022-29973   | https://security-tracker.debian.org/tracker/CVE-2022-29973  
                         exiv2 | CVE-2007-6353    | https://security-tracker.debian.org/tracker/CVE-2007-6353   
                        ffmpeg | CVE-2021-38291   | https://security-tracker.debian.org/tracker/CVE-2021-38291  
             freeradius-server | CVE-2002-0318    | https://security-tracker.debian.org/tracker/CVE-2002-0318   
             freeradius-server | CVE-2011-4966    | https://security-tracker.debian.org/tracker/CVE-2011-4966   
                        giflib | CVE-2022-28506   | https://security-tracker.debian.org/tracker/CVE-2022-28506  
                           git | CVE-2022-24765   | https://security-tracker.debian.org/tracker/CVE-2022-24765  
                           git | CVE-2022-24975   | https://security-tracker.debian.org/tracker/CVE-2022-24975  
                         glibc | CVE-2010-4756    | https://security-tracker.debian.org/tracker/CVE-2010-4756   
                         glibc | CVE-2019-1010022 | https://security-tracker.debian.org/tracker/CVE-2019-1010022
                         glibc | CVE-2019-1010023 | https://security-tracker.debian.org/tracker/CVE-2019-1010023
                         glibc | CVE-2019-1010024 | https://security-tracker.debian.org/tracker/CVE-2019-1010024
                         glibc | CVE-2019-1010025 | https://security-tracker.debian.org/tracker/CVE-2019-1010025
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                            go | CVE-2020-29509   | https://security-tracker.debian.org/tracker/CVE-2020-29509  
                            go | CVE-2020-29511   | https://security-tracker.debian.org/tracker/CVE-2020-29511  
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                         grub2 | CVE-2021-3981    | https://security-tracker.debian.org/tracker/CVE-2021-3981   
                         grub2 | CVE-2021-46705   | https://security-tracker.debian.org/tracker/CVE-2021-46705  
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                heirloom-mailx | CVE-2004-2771    | https://security-tracker.debian.org/tracker/CVE-2004-2771   
                   imagemagick | CVE-2007-1667    | https://security-tracker.debian.org/tracker/CVE-2007-1667   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2017-5509    | https://security-tracker.debian.org/tracker/CVE-2017-5509   
                   imagemagick | CVE-2017-5510    | https://security-tracker.debian.org/tracker/CVE-2017-5510   
                   imagemagick | CVE-2017-5511    | https://security-tracker.debian.org/tracker/CVE-2017-5511   
                   imagemagick | CVE-2022-3213    | https://security-tracker.debian.org/tracker/CVE-2022-3213   
                        jasper | CVE-2015-8751    | https://security-tracker.debian.org/tracker/CVE-2015-8751   
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                       libkrb5 | CVE-2009-0846    | https://security-tracker.debian.org/tracker/CVE-2009-0846   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libmpeg2 | CVE-2022-37416   | https://security-tracker.debian.org/tracker/CVE-2022-37416  
                      libosip2 | CVE-2022-41550   | https://security-tracker.debian.org/tracker/CVE-2022-41550  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                        libraw | CVE-2020-35530   | https://security-tracker.debian.org/tracker/CVE-2020-35530  
                        libraw | CVE-2020-35531   | https://security-tracker.debian.org/tracker/CVE-2020-35531  
                        libraw | CVE-2020-35532   | https://security-tracker.debian.org/tracker/CVE-2020-35532  
                        libraw | CVE-2020-35533   | https://security-tracker.debian.org/tracker/CVE-2020-35533  
                        libraw | CVE-2020-35534   | https://security-tracker.debian.org/tracker/CVE-2020-35534  
                        libraw | CVE-2020-35535   | https://security-tracker.debian.org/tracker/CVE-2020-35535  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                  libvncserver | CVE-2020-29260   | https://security-tracker.debian.org/tracker/CVE-2020-29260  
                       libxml2 | CVE-2016-3709    | https://security-tracker.debian.org/tracker/CVE-2016-3709   
                     linux-pam | CVE-2022-28321   | https://security-tracker.debian.org/tracker/CVE-2022-28321  
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2020-15888   | https://security-tracker.debian.org/tracker/CVE-2020-15888  
                           lua | CVE-2020-15945   | https://security-tracker.debian.org/tracker/CVE-2020-15945  
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                       mbedtls | CVE-2021-45450   | https://security-tracker.debian.org/tracker/CVE-2021-45450  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                      minetest | CVE-2022-35978   | https://security-tracker.debian.org/tracker/CVE-2022-35978  
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-18381   | https://security-tracker.debian.org/tracker/CVE-2017-18381  
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                         mupdf | CVE-2021-4216    | https://security-tracker.debian.org/tracker/CVE-2021-4216   
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          nasm | CVE-2020-18974   | https://security-tracker.debian.org/tracker/CVE-2020-18974  
                       ncurses | CVE-2021-39537   | https://security-tracker.debian.org/tracker/CVE-2021-39537  
                       ncurses | CVE-2022-29458   | https://security-tracker.debian.org/tracker/CVE-2022-29458  
                         nginx | CVE-2021-3618    | https://security-tracker.debian.org/tracker/CVE-2021-3618   
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2013-0169    | https://security-tracker.debian.org/tracker/CVE-2013-0169   
                       openjdk | CVE-2022-21540   | https://security-tracker.debian.org/tracker/CVE-2022-21540  
                       openjdk | CVE-2022-21541   | https://security-tracker.debian.org/tracker/CVE-2022-21541  
                       openjdk | CVE-2022-34169   | https://security-tracker.debian.org/tracker/CVE-2022-34169  
                      openjpeg | CVE-2015-1239    | https://security-tracker.debian.org/tracker/CVE-2015-1239   
                      openjpeg | CVE-2016-9675    | https://security-tracker.debian.org/tracker/CVE-2016-9675   
                      openldap | CVE-2015-3276    | https://security-tracker.debian.org/tracker/CVE-2015-3276   
                      openldap | CVE-2022-29155   | https://security-tracker.debian.org/tracker/CVE-2022-29155  
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                          opus | CVE-2022-25345   | https://security-tracker.debian.org/tracker/CVE-2022-25345  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                           php | CVE-2022-31628   | https://security-tracker.debian.org/tracker/CVE-2022-31628  
                           php | CVE-2022-31629   | https://security-tracker.debian.org/tracker/CVE-2022-31629  
                        polkit | CVE-2021-4034    | https://security-tracker.debian.org/tracker/CVE-2021-4034   
                       poppler | CVE-2021-30860   | https://security-tracker.debian.org/tracker/CVE-2021-30860  
                       poppler | CVE-2022-38784   | https://security-tracker.debian.org/tracker/CVE-2022-38784  
                    postgresql | CVE-2017-8806    | https://security-tracker.debian.org/tracker/CVE-2017-8806   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                          pppd | CVE-2018-11574   | https://security-tracker.debian.org/tracker/CVE-2018-11574  
                 python-django | CVE-2022-36359   | https://security-tracker.debian.org/tracker/CVE-2022-36359  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
                    python-pip | CVE-2018-20225   | https://security-tracker.debian.org/tracker/CVE-2018-20225  
                python-twisted | CVE-2022-24801   | https://security-tracker.debian.org/tracker/CVE-2022-24801  
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2022-2962    | https://security-tracker.debian.org/tracker/CVE-2022-2962   
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
               rabbitmq-server | CVE-2020-5419    | https://security-tracker.debian.org/tracker/CVE-2020-5419   
               rabbitmq-server | CVE-2021-22116   | https://security-tracker.debian.org/tracker/CVE-2021-22116  
               rabbitmq-server | CVE-2021-22117   | https://security-tracker.debian.org/tracker/CVE-2021-22117  
               rabbitmq-server | CVE-2021-32718   | https://security-tracker.debian.org/tracker/CVE-2021-32718  
               rabbitmq-server | CVE-2021-32719   | https://security-tracker.debian.org/tracker/CVE-2021-32719  
               rabbitmq-server | CVE-2022-31008   | https://security-tracker.debian.org/tracker/CVE-2022-31008  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                           rpm | CVE-2021-3521    | https://security-tracker.debian.org/tracker/CVE-2021-3521   
                           rpm | CVE-2021-35937   | https://security-tracker.debian.org/tracker/CVE-2021-35937  
                           rpm | CVE-2021-35938   | https://security-tracker.debian.org/tracker/CVE-2021-35938  
                           rpm | CVE-2021-35939   | https://security-tracker.debian.org/tracker/CVE-2021-35939  
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2021-3670    | https://security-tracker.debian.org/tracker/CVE-2021-3670   
                        samba4 | CVE-2022-1615    | https://security-tracker.debian.org/tracker/CVE-2022-1615   
                        samba4 | CVE-2022-2031    | https://security-tracker.debian.org/tracker/CVE-2022-2031   
                        samba4 | CVE-2022-32742   | https://security-tracker.debian.org/tracker/CVE-2022-32742  
                        samba4 | CVE-2022-32743   | https://security-tracker.debian.org/tracker/CVE-2022-32743  
                        samba4 | CVE-2022-32744   | https://security-tracker.debian.org/tracker/CVE-2022-32744  
                        samba4 | CVE-2022-32745   | https://security-tracker.debian.org/tracker/CVE-2022-32745  
                        samba4 | CVE-2022-32746   | https://security-tracker.debian.org/tracker/CVE-2022-32746  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2020-14409   | https://security-tracker.debian.org/tracker/CVE-2020-14409  
                           sdl | CVE-2020-14410   | https://security-tracker.debian.org/tracker/CVE-2020-14410  
                           sdl | CVE-2022-34568   | https://security-tracker.debian.org/tracker/CVE-2022-34568  
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2022-2056    | https://security-tracker.debian.org/tracker/CVE-2022-2056   
                          tiff | CVE-2022-2057    | https://security-tracker.debian.org/tracker/CVE-2022-2057   
                          tiff | CVE-2022-2058    | https://security-tracker.debian.org/tracker/CVE-2022-2058   
                          tiff | CVE-2022-2519    | https://security-tracker.debian.org/tracker/CVE-2022-2519   
                          tiff | CVE-2022-2520    | https://security-tracker.debian.org/tracker/CVE-2022-2520   
                          tiff | CVE-2022-2521    | https://security-tracker.debian.org/tracker/CVE-2022-2521   
                          tiff | CVE-2022-2953    | https://security-tracker.debian.org/tracker/CVE-2022-2953   
                          tiff | CVE-2022-34526   | https://security-tracker.debian.org/tracker/CVE-2022-34526  
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                     wireshark | CVE-2022-3190    | https://security-tracker.debian.org/tracker/CVE-2022-3190   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28038   | https://security-tracker.debian.org/tracker/CVE-2021-28038  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                          yasm | CVE-2021-33454   | https://security-tracker.debian.org/tracker/CVE-2021-33454  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

CVEs for the '2022.02.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-4465    | https://security-tracker.debian.org/tracker/CVE-2007-4465   
                        apache | CVE-2007-5000    | https://security-tracker.debian.org/tracker/CVE-2007-5000   
                        apache | CVE-2007-6388    | https://security-tracker.debian.org/tracker/CVE-2007-6388   
                        apache | CVE-2007-6420    | https://security-tracker.debian.org/tracker/CVE-2007-6420   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2008-2939    | https://security-tracker.debian.org/tracker/CVE-2008-2939   
                        apache | CVE-2009-1195    | https://security-tracker.debian.org/tracker/CVE-2009-1195   
                        apache | CVE-2010-0408    | https://security-tracker.debian.org/tracker/CVE-2010-0408   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2010-1452    | https://security-tracker.debian.org/tracker/CVE-2010-1452   
                        apache | CVE-2014-0231    | https://security-tracker.debian.org/tracker/CVE-2014-0231   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2022-27607   | https://security-tracker.debian.org/tracker/CVE-2022-27607  
                        bento4 | CVE-2022-35165   | https://security-tracker.debian.org/tracker/CVE-2022-35165  
                        bento4 | CVE-2022-40438   | https://security-tracker.debian.org/tracker/CVE-2022-40438  
                        bento4 | CVE-2022-40439   | https://security-tracker.debian.org/tracker/CVE-2022-40439  
                        bento4 | CVE-2022-40736   | https://security-tracker.debian.org/tracker/CVE-2022-40736  
                        bento4 | CVE-2022-40737   | https://security-tracker.debian.org/tracker/CVE-2022-40737  
                        bento4 | CVE-2022-40738   | https://security-tracker.debian.org/tracker/CVE-2022-40738  
                        bento4 | CVE-2022-40774   | https://security-tracker.debian.org/tracker/CVE-2022-40774  
                        bento4 | CVE-2022-40775   | https://security-tracker.debian.org/tracker/CVE-2022-40775  
                        bento4 | CVE-2022-41419   | https://security-tracker.debian.org/tracker/CVE-2022-41419  
                        bento4 | CVE-2022-41423   | https://security-tracker.debian.org/tracker/CVE-2022-41423  
                        bento4 | CVE-2022-41424   | https://security-tracker.debian.org/tracker/CVE-2022-41424  
                        bento4 | CVE-2022-41425   | https://security-tracker.debian.org/tracker/CVE-2022-41425  
                        bento4 | CVE-2022-41426   | https://security-tracker.debian.org/tracker/CVE-2022-41426  
                        bento4 | CVE-2022-41427   | https://security-tracker.debian.org/tracker/CVE-2022-41427  
                        bento4 | CVE-2022-41428   | https://security-tracker.debian.org/tracker/CVE-2022-41428  
                        bento4 | CVE-2022-41429   | https://security-tracker.debian.org/tracker/CVE-2022-41429  
                        bento4 | CVE-2022-41430   | https://security-tracker.debian.org/tracker/CVE-2022-41430  
                        bento4 | CVE-2022-41841   | https://security-tracker.debian.org/tracker/CVE-2022-41841  
                        bento4 | CVE-2022-41845   | https://security-tracker.debian.org/tracker/CVE-2022-41845  
                        bento4 | CVE-2022-41846   | https://security-tracker.debian.org/tracker/CVE-2022-41846  
                        bento4 | CVE-2022-41847   | https://security-tracker.debian.org/tracker/CVE-2022-41847  
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2021-45078   | https://security-tracker.debian.org/tracker/CVE-2021-45078  
                      binutils | CVE-2022-38126   | https://security-tracker.debian.org/tracker/CVE-2022-38126  
                      binutils | CVE-2022-38127   | https://security-tracker.debian.org/tracker/CVE-2022-38127  
                      binutils | CVE-2022-38128   | https://security-tracker.debian.org/tracker/CVE-2022-38128  
                      binutils | CVE-2022-38533   | https://security-tracker.debian.org/tracker/CVE-2022-38533  
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                         cairo | CVE-2019-6461    | https://security-tracker.debian.org/tracker/CVE-2019-6461   
                         cairo | CVE-2019-6462    | https://security-tracker.debian.org/tracker/CVE-2019-6462   
                         cairo | CVE-2020-35492   | https://security-tracker.debian.org/tracker/CVE-2020-35492  
                       connman | CVE-2022-32292   | https://security-tracker.debian.org/tracker/CVE-2022-32292  
                       connman | CVE-2022-32293   | https://security-tracker.debian.org/tracker/CVE-2022-32293  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                      cryptopp | CVE-2021-43398   | https://security-tracker.debian.org/tracker/CVE-2021-43398  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dbus | CVE-2022-42010   | https://security-tracker.debian.org/tracker/CVE-2022-42010  
                          dbus | CVE-2022-42011   | https://security-tracker.debian.org/tracker/CVE-2022-42011  
                          dbus | CVE-2022-42012   | https://security-tracker.debian.org/tracker/CVE-2022-42012  
                          dhcp | CVE-2022-2928    | https://security-tracker.debian.org/tracker/CVE-2022-2928   
                          dhcp | CVE-2022-2929    | https://security-tracker.debian.org/tracker/CVE-2022-2929   
                       dnsmasq | CVE-2022-0934    | https://security-tracker.debian.org/tracker/CVE-2022-0934   
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                       dovecot | CVE-2022-30550   | https://security-tracker.debian.org/tracker/CVE-2022-30550  
                      dropbear | CVE-2021-36369   | https://security-tracker.debian.org/tracker/CVE-2021-36369  
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                        erlang | CVE-2020-35733   | https://security-tracker.debian.org/tracker/CVE-2020-35733  
                        erlang | CVE-2022-37026   | https://security-tracker.debian.org/tracker/CVE-2022-37026  
                         exfat | CVE-2022-29973   | https://security-tracker.debian.org/tracker/CVE-2022-29973  
                          exim | CVE-2022-37451   | https://security-tracker.debian.org/tracker/CVE-2022-37451  
                         exiv2 | CVE-2007-6353    | https://security-tracker.debian.org/tracker/CVE-2007-6353   
                        ffmpeg | CVE-2021-38291   | https://security-tracker.debian.org/tracker/CVE-2021-38291  
                       freerdp | CVE-2022-39282   | https://security-tracker.debian.org/tracker/CVE-2022-39282  
                       freerdp | CVE-2022-39283   | https://security-tracker.debian.org/tracker/CVE-2022-39283  
                        giflib | CVE-2022-28506   | https://security-tracker.debian.org/tracker/CVE-2022-28506  
                           git | CVE-2022-24765   | https://security-tracker.debian.org/tracker/CVE-2022-24765  
                           git | CVE-2022-24975   | https://security-tracker.debian.org/tracker/CVE-2022-24975  
                         glibc | CVE-2010-4756    | https://security-tracker.debian.org/tracker/CVE-2010-4756   
                         glibc | CVE-2019-1010022 | https://security-tracker.debian.org/tracker/CVE-2019-1010022
                         glibc | CVE-2019-1010023 | https://security-tracker.debian.org/tracker/CVE-2019-1010023
                         glibc | CVE-2019-1010024 | https://security-tracker.debian.org/tracker/CVE-2019-1010024
                         glibc | CVE-2019-1010025 | https://security-tracker.debian.org/tracker/CVE-2019-1010025
                         glibc | CVE-2021-3998    | https://security-tracker.debian.org/tracker/CVE-2021-3998   
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                            go | CVE-2020-29509   | https://security-tracker.debian.org/tracker/CVE-2020-29509  
                            go | CVE-2020-29511   | https://security-tracker.debian.org/tracker/CVE-2020-29511  
                            go | CVE-2022-27664   | https://security-tracker.debian.org/tracker/CVE-2022-27664  
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                         grub2 | CVE-2021-3981    | https://security-tracker.debian.org/tracker/CVE-2021-3981   
                         grub2 | CVE-2021-46705   | https://security-tracker.debian.org/tracker/CVE-2021-46705  
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2022-0711    | https://security-tracker.debian.org/tracker/CVE-2022-0711   
                heirloom-mailx | CVE-2004-2771    | https://security-tracker.debian.org/tracker/CVE-2004-2771   
                   imagemagick | CVE-2007-1667    | https://security-tracker.debian.org/tracker/CVE-2007-1667   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2017-5509    | https://security-tracker.debian.org/tracker/CVE-2017-5509   
                   imagemagick | CVE-2017-5510    | https://security-tracker.debian.org/tracker/CVE-2017-5510   
                   imagemagick | CVE-2017-5511    | https://security-tracker.debian.org/tracker/CVE-2017-5511   
                   imagemagick | CVE-2022-3213    | https://security-tracker.debian.org/tracker/CVE-2022-3213   
                        jasper | CVE-2015-8751    | https://security-tracker.debian.org/tracker/CVE-2015-8751   
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                        libbpf | CVE-2021-45940   | https://security-tracker.debian.org/tracker/CVE-2021-45940  
                        libbpf | CVE-2021-45941   | https://security-tracker.debian.org/tracker/CVE-2021-45941  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                    libfribidi | CVE-2022-25308   | https://security-tracker.debian.org/tracker/CVE-2022-25308  
                    libfribidi | CVE-2022-25309   | https://security-tracker.debian.org/tracker/CVE-2022-25309  
                    libfribidi | CVE-2022-25310   | https://security-tracker.debian.org/tracker/CVE-2022-25310  
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                       libkrb5 | CVE-2009-0846    | https://security-tracker.debian.org/tracker/CVE-2009-0846   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libmpeg2 | CVE-2022-37416   | https://security-tracker.debian.org/tracker/CVE-2022-37416  
                      libosip2 | CVE-2022-41550   | https://security-tracker.debian.org/tracker/CVE-2022-41550  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                        libraw | CVE-2020-35530   | https://security-tracker.debian.org/tracker/CVE-2020-35530  
                        libraw | CVE-2020-35531   | https://security-tracker.debian.org/tracker/CVE-2020-35531  
                        libraw | CVE-2020-35532   | https://security-tracker.debian.org/tracker/CVE-2020-35532  
                        libraw | CVE-2020-35533   | https://security-tracker.debian.org/tracker/CVE-2020-35533  
                        libraw | CVE-2020-35534   | https://security-tracker.debian.org/tracker/CVE-2020-35534  
                        libraw | CVE-2020-35535   | https://security-tracker.debian.org/tracker/CVE-2020-35535  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                  libvncserver | CVE-2020-29260   | https://security-tracker.debian.org/tracker/CVE-2020-29260  
                       libxml2 | CVE-2016-3709    | https://security-tracker.debian.org/tracker/CVE-2016-3709   
                       libxslt | CVE-2022-29824   | https://security-tracker.debian.org/tracker/CVE-2022-29824  
                      lighttpd | CVE-2022-41556   | https://security-tracker.debian.org/tracker/CVE-2022-41556  
                     linux-pam | CVE-2022-28321   | https://security-tracker.debian.org/tracker/CVE-2022-28321  
                         lrzip | CVE-2021-33451   | https://security-tracker.debian.org/tracker/CVE-2021-33451  
                         lrzip | CVE-2021-33453   | https://security-tracker.debian.org/tracker/CVE-2021-33453  
                         lrzip | CVE-2022-26291   | https://security-tracker.debian.org/tracker/CVE-2022-26291  
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2020-15888   | https://security-tracker.debian.org/tracker/CVE-2020-15888  
                           lua | CVE-2020-15945   | https://security-tracker.debian.org/tracker/CVE-2020-15945  
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                       mbedtls | CVE-2021-45450   | https://security-tracker.debian.org/tracker/CVE-2021-45450  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                        mender | CVE-2022-29555   | https://security-tracker.debian.org/tracker/CVE-2022-29555  
                      minetest | CVE-2022-35978   | https://security-tracker.debian.org/tracker/CVE-2022-35978  
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-18381   | https://security-tracker.debian.org/tracker/CVE-2017-18381  
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                         mupdf | CVE-2021-4216    | https://security-tracker.debian.org/tracker/CVE-2021-4216   
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          nasm | CVE-2020-18974   | https://security-tracker.debian.org/tracker/CVE-2020-18974  
                       ncurses | CVE-2021-39537   | https://security-tracker.debian.org/tracker/CVE-2021-39537  
                       ncurses | CVE-2022-29458   | https://security-tracker.debian.org/tracker/CVE-2022-29458  
                         nginx | CVE-2021-3618    | https://security-tracker.debian.org/tracker/CVE-2021-3618   
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2013-0169    | https://security-tracker.debian.org/tracker/CVE-2013-0169   
                       openjdk | CVE-2022-21540   | https://security-tracker.debian.org/tracker/CVE-2022-21540  
                       openjdk | CVE-2022-21541   | https://security-tracker.debian.org/tracker/CVE-2022-21541  
                       openjdk | CVE-2022-34169   | https://security-tracker.debian.org/tracker/CVE-2022-34169  
                      openjpeg | CVE-2015-1239    | https://security-tracker.debian.org/tracker/CVE-2015-1239   
                      openjpeg | CVE-2016-9675    | https://security-tracker.debian.org/tracker/CVE-2016-9675   
                      openldap | CVE-2015-3276    | https://security-tracker.debian.org/tracker/CVE-2015-3276   
                      openldap | CVE-2022-29155   | https://security-tracker.debian.org/tracker/CVE-2022-29155  
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                          opus | CVE-2022-25345   | https://security-tracker.debian.org/tracker/CVE-2022-25345  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                           php | CVE-2022-31628   | https://security-tracker.debian.org/tracker/CVE-2022-31628  
                           php | CVE-2022-31629   | https://security-tracker.debian.org/tracker/CVE-2022-31629  
                       poppler | CVE-2021-30860   | https://security-tracker.debian.org/tracker/CVE-2021-30860  
                       poppler | CVE-2022-38784   | https://security-tracker.debian.org/tracker/CVE-2022-38784  
                    postgresql | CVE-2017-8806    | https://security-tracker.debian.org/tracker/CVE-2017-8806   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                          pppd | CVE-2018-11574   | https://security-tracker.debian.org/tracker/CVE-2018-11574  
                python-aiohttp | CVE-2022-33124   | https://security-tracker.debian.org/tracker/CVE-2022-33124  
                 python-django | CVE-2022-36359   | https://security-tracker.debian.org/tracker/CVE-2022-36359  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
                    python-pip | CVE-2018-20225   | https://security-tracker.debian.org/tracker/CVE-2018-20225  
                  python-pyjwt | CVE-2022-29217   | https://security-tracker.debian.org/tracker/CVE-2022-29217  
                python-twisted | CVE-2022-24801   | https://security-tracker.debian.org/tracker/CVE-2022-24801  
                 python-web2py | CVE-2022-33146   | https://security-tracker.debian.org/tracker/CVE-2022-33146  
               python-werkzeug | CVE-2022-29361   | https://security-tracker.debian.org/tracker/CVE-2022-29361  
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2021-3611    | https://security-tracker.debian.org/tracker/CVE-2021-3611   
                          qemu | CVE-2021-3750    | https://security-tracker.debian.org/tracker/CVE-2021-3750   
                          qemu | CVE-2021-3929    | https://security-tracker.debian.org/tracker/CVE-2021-3929   
                          qemu | CVE-2021-3947    | https://security-tracker.debian.org/tracker/CVE-2021-3947   
                          qemu | CVE-2021-4158    | https://security-tracker.debian.org/tracker/CVE-2021-4158   
                          qemu | CVE-2021-4206    | https://security-tracker.debian.org/tracker/CVE-2021-4206   
                          qemu | CVE-2021-4207    | https://security-tracker.debian.org/tracker/CVE-2021-4207   
                          qemu | CVE-2022-0358    | https://security-tracker.debian.org/tracker/CVE-2022-0358   
                          qemu | CVE-2022-1050    | https://security-tracker.debian.org/tracker/CVE-2022-1050   
                          qemu | CVE-2022-26353   | https://security-tracker.debian.org/tracker/CVE-2022-26353  
                          qemu | CVE-2022-26354   | https://security-tracker.debian.org/tracker/CVE-2022-26354  
                          qemu | CVE-2022-2962    | https://security-tracker.debian.org/tracker/CVE-2022-2962   
                          qemu | CVE-2022-35414   | https://security-tracker.debian.org/tracker/CVE-2022-35414  
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
               rabbitmq-server | CVE-2020-5419    | https://security-tracker.debian.org/tracker/CVE-2020-5419   
               rabbitmq-server | CVE-2021-22116   | https://security-tracker.debian.org/tracker/CVE-2021-22116  
               rabbitmq-server | CVE-2021-22117   | https://security-tracker.debian.org/tracker/CVE-2021-22117  
               rabbitmq-server | CVE-2021-32718   | https://security-tracker.debian.org/tracker/CVE-2021-32718  
               rabbitmq-server | CVE-2021-32719   | https://security-tracker.debian.org/tracker/CVE-2021-32719  
               rabbitmq-server | CVE-2022-31008   | https://security-tracker.debian.org/tracker/CVE-2022-31008  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                           rpm | CVE-2021-3521    | https://security-tracker.debian.org/tracker/CVE-2021-3521   
                           rpm | CVE-2021-35937   | https://security-tracker.debian.org/tracker/CVE-2021-35937  
                           rpm | CVE-2021-35938   | https://security-tracker.debian.org/tracker/CVE-2021-35938  
                           rpm | CVE-2021-35939   | https://security-tracker.debian.org/tracker/CVE-2021-35939  
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2021-3670    | https://security-tracker.debian.org/tracker/CVE-2021-3670   
                        samba4 | CVE-2022-1615    | https://security-tracker.debian.org/tracker/CVE-2022-1615   
                        samba4 | CVE-2022-2031    | https://security-tracker.debian.org/tracker/CVE-2022-2031   
                        samba4 | CVE-2022-32742   | https://security-tracker.debian.org/tracker/CVE-2022-32742  
                        samba4 | CVE-2022-32743   | https://security-tracker.debian.org/tracker/CVE-2022-32743  
                        samba4 | CVE-2022-32744   | https://security-tracker.debian.org/tracker/CVE-2022-32744  
                        samba4 | CVE-2022-32745   | https://security-tracker.debian.org/tracker/CVE-2022-32745  
                        samba4 | CVE-2022-32746   | https://security-tracker.debian.org/tracker/CVE-2022-32746  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2020-14409   | https://security-tracker.debian.org/tracker/CVE-2020-14409  
                           sdl | CVE-2020-14410   | https://security-tracker.debian.org/tracker/CVE-2020-14410  
                           sdl | CVE-2022-34568   | https://security-tracker.debian.org/tracker/CVE-2022-34568  
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2022-2056    | https://security-tracker.debian.org/tracker/CVE-2022-2056   
                          tiff | CVE-2022-2057    | https://security-tracker.debian.org/tracker/CVE-2022-2057   
                          tiff | CVE-2022-2058    | https://security-tracker.debian.org/tracker/CVE-2022-2058   
                          tiff | CVE-2022-2519    | https://security-tracker.debian.org/tracker/CVE-2022-2519   
                          tiff | CVE-2022-2520    | https://security-tracker.debian.org/tracker/CVE-2022-2520   
                          tiff | CVE-2022-2521    | https://security-tracker.debian.org/tracker/CVE-2022-2521   
                          tiff | CVE-2022-2953    | https://security-tracker.debian.org/tracker/CVE-2022-2953   
                          tiff | CVE-2022-34526   | https://security-tracker.debian.org/tracker/CVE-2022-34526  
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                       unbound | CVE-2022-30698   | https://security-tracker.debian.org/tracker/CVE-2022-30698  
                       unbound | CVE-2022-30699   | https://security-tracker.debian.org/tracker/CVE-2022-30699  
                       unbound | CVE-2022-3204    | https://security-tracker.debian.org/tracker/CVE-2022-3204   
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                      usbguard | CVE-2019-25058   | https://security-tracker.debian.org/tracker/CVE-2019-25058  
                       wavpack | CVE-2022-2476    | https://security-tracker.debian.org/tracker/CVE-2022-2476   
                       wayland | CVE-2021-3782    | https://security-tracker.debian.org/tracker/CVE-2021-3782   
                     wireshark | CVE-2022-3190    | https://security-tracker.debian.org/tracker/CVE-2022-3190   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28038   | https://security-tracker.debian.org/tracker/CVE-2021-28038  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                  xscreensaver | CVE-2021-34557   | https://security-tracker.debian.org/tracker/CVE-2021-34557  
                          yasm | CVE-2021-33454   | https://security-tracker.debian.org/tracker/CVE-2021-33454  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

CVEs for the '2022.08.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-4465    | https://security-tracker.debian.org/tracker/CVE-2007-4465   
                        apache | CVE-2007-5000    | https://security-tracker.debian.org/tracker/CVE-2007-5000   
                        apache | CVE-2007-6388    | https://security-tracker.debian.org/tracker/CVE-2007-6388   
                        apache | CVE-2007-6420    | https://security-tracker.debian.org/tracker/CVE-2007-6420   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2008-2939    | https://security-tracker.debian.org/tracker/CVE-2008-2939   
                        apache | CVE-2009-1195    | https://security-tracker.debian.org/tracker/CVE-2009-1195   
                        apache | CVE-2010-0408    | https://security-tracker.debian.org/tracker/CVE-2010-0408   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2010-1452    | https://security-tracker.debian.org/tracker/CVE-2010-1452   
                        apache | CVE-2014-0231    | https://security-tracker.debian.org/tracker/CVE-2014-0231   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2022-27607   | https://security-tracker.debian.org/tracker/CVE-2022-27607  
                        bento4 | CVE-2022-35165   | https://security-tracker.debian.org/tracker/CVE-2022-35165  
                        bento4 | CVE-2022-40438   | https://security-tracker.debian.org/tracker/CVE-2022-40438  
                        bento4 | CVE-2022-40439   | https://security-tracker.debian.org/tracker/CVE-2022-40439  
                        bento4 | CVE-2022-40736   | https://security-tracker.debian.org/tracker/CVE-2022-40736  
                        bento4 | CVE-2022-40737   | https://security-tracker.debian.org/tracker/CVE-2022-40737  
                        bento4 | CVE-2022-40738   | https://security-tracker.debian.org/tracker/CVE-2022-40738  
                        bento4 | CVE-2022-40774   | https://security-tracker.debian.org/tracker/CVE-2022-40774  
                        bento4 | CVE-2022-40775   | https://security-tracker.debian.org/tracker/CVE-2022-40775  
                        bento4 | CVE-2022-41419   | https://security-tracker.debian.org/tracker/CVE-2022-41419  
                        bento4 | CVE-2022-41423   | https://security-tracker.debian.org/tracker/CVE-2022-41423  
                        bento4 | CVE-2022-41424   | https://security-tracker.debian.org/tracker/CVE-2022-41424  
                        bento4 | CVE-2022-41425   | https://security-tracker.debian.org/tracker/CVE-2022-41425  
                        bento4 | CVE-2022-41426   | https://security-tracker.debian.org/tracker/CVE-2022-41426  
                        bento4 | CVE-2022-41427   | https://security-tracker.debian.org/tracker/CVE-2022-41427  
                        bento4 | CVE-2022-41428   | https://security-tracker.debian.org/tracker/CVE-2022-41428  
                        bento4 | CVE-2022-41429   | https://security-tracker.debian.org/tracker/CVE-2022-41429  
                        bento4 | CVE-2022-41430   | https://security-tracker.debian.org/tracker/CVE-2022-41430  
                        bento4 | CVE-2022-41841   | https://security-tracker.debian.org/tracker/CVE-2022-41841  
                        bento4 | CVE-2022-41845   | https://security-tracker.debian.org/tracker/CVE-2022-41845  
                        bento4 | CVE-2022-41846   | https://security-tracker.debian.org/tracker/CVE-2022-41846  
                        bento4 | CVE-2022-41847   | https://security-tracker.debian.org/tracker/CVE-2022-41847  
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2021-45078   | https://security-tracker.debian.org/tracker/CVE-2021-45078  
                      binutils | CVE-2022-38126   | https://security-tracker.debian.org/tracker/CVE-2022-38126  
                      binutils | CVE-2022-38127   | https://security-tracker.debian.org/tracker/CVE-2022-38127  
                      binutils | CVE-2022-38128   | https://security-tracker.debian.org/tracker/CVE-2022-38128  
                      binutils | CVE-2022-38533   | https://security-tracker.debian.org/tracker/CVE-2022-38533  
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                         cairo | CVE-2019-6461    | https://security-tracker.debian.org/tracker/CVE-2019-6461   
                         cairo | CVE-2019-6462    | https://security-tracker.debian.org/tracker/CVE-2019-6462   
                         cairo | CVE-2020-35492   | https://security-tracker.debian.org/tracker/CVE-2020-35492  
                       connman | CVE-2022-32292   | https://security-tracker.debian.org/tracker/CVE-2022-32292  
                       connman | CVE-2022-32293   | https://security-tracker.debian.org/tracker/CVE-2022-32293  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                      cryptopp | CVE-2021-43398   | https://security-tracker.debian.org/tracker/CVE-2021-43398  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dbus | CVE-2022-42010   | https://security-tracker.debian.org/tracker/CVE-2022-42010  
                          dbus | CVE-2022-42011   | https://security-tracker.debian.org/tracker/CVE-2022-42011  
                          dbus | CVE-2022-42012   | https://security-tracker.debian.org/tracker/CVE-2022-42012  
                   dbus-broker | CVE-2022-31212   | https://security-tracker.debian.org/tracker/CVE-2022-31212  
                   dbus-broker | CVE-2022-31213   | https://security-tracker.debian.org/tracker/CVE-2022-31213  
                          dhcp | CVE-2022-2928    | https://security-tracker.debian.org/tracker/CVE-2022-2928   
                          dhcp | CVE-2022-2929    | https://security-tracker.debian.org/tracker/CVE-2022-2929   
                       dnsmasq | CVE-2022-0934    | https://security-tracker.debian.org/tracker/CVE-2022-0934   
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                       dovecot | CVE-2022-30550   | https://security-tracker.debian.org/tracker/CVE-2022-30550  
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                        erlang | CVE-2020-35733   | https://security-tracker.debian.org/tracker/CVE-2020-35733  
                        erlang | CVE-2022-37026   | https://security-tracker.debian.org/tracker/CVE-2022-37026  
                         exfat | CVE-2022-29973   | https://security-tracker.debian.org/tracker/CVE-2022-29973  
                         exiv2 | CVE-2007-6353    | https://security-tracker.debian.org/tracker/CVE-2007-6353   
                        ffmpeg | CVE-2021-38291   | https://security-tracker.debian.org/tracker/CVE-2021-38291  
             freeradius-server | CVE-2002-0318    | https://security-tracker.debian.org/tracker/CVE-2002-0318   
             freeradius-server | CVE-2011-4966    | https://security-tracker.debian.org/tracker/CVE-2011-4966   
                       freerdp | CVE-2022-39282   | https://security-tracker.debian.org/tracker/CVE-2022-39282  
                       freerdp | CVE-2022-39283   | https://security-tracker.debian.org/tracker/CVE-2022-39283  
                        giflib | CVE-2022-28506   | https://security-tracker.debian.org/tracker/CVE-2022-28506  
                           git | CVE-2022-24765   | https://security-tracker.debian.org/tracker/CVE-2022-24765  
                           git | CVE-2022-24975   | https://security-tracker.debian.org/tracker/CVE-2022-24975  
                         glibc | CVE-2010-4756    | https://security-tracker.debian.org/tracker/CVE-2010-4756   
                         glibc | CVE-2019-1010022 | https://security-tracker.debian.org/tracker/CVE-2019-1010022
                         glibc | CVE-2019-1010023 | https://security-tracker.debian.org/tracker/CVE-2019-1010023
                         glibc | CVE-2019-1010024 | https://security-tracker.debian.org/tracker/CVE-2019-1010024
                         glibc | CVE-2019-1010025 | https://security-tracker.debian.org/tracker/CVE-2019-1010025
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                            go | CVE-2020-29509   | https://security-tracker.debian.org/tracker/CVE-2020-29509  
                            go | CVE-2020-29511   | https://security-tracker.debian.org/tracker/CVE-2020-29511  
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                         grub2 | CVE-2021-3981    | https://security-tracker.debian.org/tracker/CVE-2021-3981   
                         grub2 | CVE-2021-46705   | https://security-tracker.debian.org/tracker/CVE-2021-46705  
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                heirloom-mailx | CVE-2004-2771    | https://security-tracker.debian.org/tracker/CVE-2004-2771   
                   imagemagick | CVE-2007-1667    | https://security-tracker.debian.org/tracker/CVE-2007-1667   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2017-5509    | https://security-tracker.debian.org/tracker/CVE-2017-5509   
                   imagemagick | CVE-2017-5510    | https://security-tracker.debian.org/tracker/CVE-2017-5510   
                   imagemagick | CVE-2017-5511    | https://security-tracker.debian.org/tracker/CVE-2017-5511   
                   imagemagick | CVE-2022-3213    | https://security-tracker.debian.org/tracker/CVE-2022-3213   
                        jasper | CVE-2015-8751    | https://security-tracker.debian.org/tracker/CVE-2015-8751   
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                       libkrb5 | CVE-2009-0846    | https://security-tracker.debian.org/tracker/CVE-2009-0846   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libmpeg2 | CVE-2022-37416   | https://security-tracker.debian.org/tracker/CVE-2022-37416  
                      libosip2 | CVE-2022-41550   | https://security-tracker.debian.org/tracker/CVE-2022-41550  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                        libraw | CVE-2020-35530   | https://security-tracker.debian.org/tracker/CVE-2020-35530  
                        libraw | CVE-2020-35531   | https://security-tracker.debian.org/tracker/CVE-2020-35531  
                        libraw | CVE-2020-35532   | https://security-tracker.debian.org/tracker/CVE-2020-35532  
                        libraw | CVE-2020-35533   | https://security-tracker.debian.org/tracker/CVE-2020-35533  
                        libraw | CVE-2020-35534   | https://security-tracker.debian.org/tracker/CVE-2020-35534  
                        libraw | CVE-2020-35535   | https://security-tracker.debian.org/tracker/CVE-2020-35535  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                  libvncserver | CVE-2020-29260   | https://security-tracker.debian.org/tracker/CVE-2020-29260  
                       libxml2 | CVE-2016-3709    | https://security-tracker.debian.org/tracker/CVE-2016-3709   
                       libxslt | CVE-2022-29824   | https://security-tracker.debian.org/tracker/CVE-2022-29824  
                      lighttpd | CVE-2022-37797   | https://security-tracker.debian.org/tracker/CVE-2022-37797  
                      lighttpd | CVE-2022-41556   | https://security-tracker.debian.org/tracker/CVE-2022-41556  
                     linux-pam | CVE-2022-28321   | https://security-tracker.debian.org/tracker/CVE-2022-28321  
                         lrzip | CVE-2021-33451   | https://security-tracker.debian.org/tracker/CVE-2021-33451  
                         lrzip | CVE-2021-33453   | https://security-tracker.debian.org/tracker/CVE-2021-33453  
                         lrzip | CVE-2022-26291   | https://security-tracker.debian.org/tracker/CVE-2022-26291  
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2020-15888   | https://security-tracker.debian.org/tracker/CVE-2020-15888  
                           lua | CVE-2020-15945   | https://security-tracker.debian.org/tracker/CVE-2020-15945  
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                       mbedtls | CVE-2021-45450   | https://security-tracker.debian.org/tracker/CVE-2021-45450  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                      minetest | CVE-2022-35978   | https://security-tracker.debian.org/tracker/CVE-2022-35978  
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-18381   | https://security-tracker.debian.org/tracker/CVE-2017-18381  
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                         mupdf | CVE-2021-4216    | https://security-tracker.debian.org/tracker/CVE-2021-4216   
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          nasm | CVE-2020-18974   | https://security-tracker.debian.org/tracker/CVE-2020-18974  
                       ncurses | CVE-2021-39537   | https://security-tracker.debian.org/tracker/CVE-2021-39537  
                       ncurses | CVE-2022-29458   | https://security-tracker.debian.org/tracker/CVE-2022-29458  
                         nginx | CVE-2021-3618    | https://security-tracker.debian.org/tracker/CVE-2021-3618   
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2013-0169    | https://security-tracker.debian.org/tracker/CVE-2013-0169   
                       openjdk | CVE-2022-21540   | https://security-tracker.debian.org/tracker/CVE-2022-21540  
                       openjdk | CVE-2022-21541   | https://security-tracker.debian.org/tracker/CVE-2022-21541  
                       openjdk | CVE-2022-34169   | https://security-tracker.debian.org/tracker/CVE-2022-34169  
                      openjpeg | CVE-2015-1239    | https://security-tracker.debian.org/tracker/CVE-2015-1239   
                      openjpeg | CVE-2016-9675    | https://security-tracker.debian.org/tracker/CVE-2016-9675   
                      openldap | CVE-2015-3276    | https://security-tracker.debian.org/tracker/CVE-2015-3276   
                      openldap | CVE-2022-29155   | https://security-tracker.debian.org/tracker/CVE-2022-29155  
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                          opus | CVE-2022-25345   | https://security-tracker.debian.org/tracker/CVE-2022-25345  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                           php | CVE-2022-31628   | https://security-tracker.debian.org/tracker/CVE-2022-31628  
                           php | CVE-2022-31629   | https://security-tracker.debian.org/tracker/CVE-2022-31629  
                       poppler | CVE-2021-30860   | https://security-tracker.debian.org/tracker/CVE-2021-30860  
                       poppler | CVE-2022-38784   | https://security-tracker.debian.org/tracker/CVE-2022-38784  
                    postgresql | CVE-2017-8806    | https://security-tracker.debian.org/tracker/CVE-2017-8806   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                          pppd | CVE-2018-11574   | https://security-tracker.debian.org/tracker/CVE-2018-11574  
                python-aiohttp | CVE-2022-33124   | https://security-tracker.debian.org/tracker/CVE-2022-33124  
                 python-django | CVE-2022-36359   | https://security-tracker.debian.org/tracker/CVE-2022-36359  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
                    python-pip | CVE-2018-20225   | https://security-tracker.debian.org/tracker/CVE-2018-20225  
                python-twisted | CVE-2022-24801   | https://security-tracker.debian.org/tracker/CVE-2022-24801  
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2022-2962    | https://security-tracker.debian.org/tracker/CVE-2022-2962   
                          qemu | CVE-2022-35414   | https://security-tracker.debian.org/tracker/CVE-2022-35414  
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
               rabbitmq-server | CVE-2020-5419    | https://security-tracker.debian.org/tracker/CVE-2020-5419   
               rabbitmq-server | CVE-2021-22116   | https://security-tracker.debian.org/tracker/CVE-2021-22116  
               rabbitmq-server | CVE-2021-22117   | https://security-tracker.debian.org/tracker/CVE-2021-22117  
               rabbitmq-server | CVE-2021-32718   | https://security-tracker.debian.org/tracker/CVE-2021-32718  
               rabbitmq-server | CVE-2021-32719   | https://security-tracker.debian.org/tracker/CVE-2021-32719  
               rabbitmq-server | CVE-2022-31008   | https://security-tracker.debian.org/tracker/CVE-2022-31008  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                           rpm | CVE-2021-3521    | https://security-tracker.debian.org/tracker/CVE-2021-3521   
                           rpm | CVE-2021-35937   | https://security-tracker.debian.org/tracker/CVE-2021-35937  
                           rpm | CVE-2021-35938   | https://security-tracker.debian.org/tracker/CVE-2021-35938  
                           rpm | CVE-2021-35939   | https://security-tracker.debian.org/tracker/CVE-2021-35939  
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2021-3670    | https://security-tracker.debian.org/tracker/CVE-2021-3670   
                        samba4 | CVE-2022-1615    | https://security-tracker.debian.org/tracker/CVE-2022-1615   
                        samba4 | CVE-2022-2031    | https://security-tracker.debian.org/tracker/CVE-2022-2031   
                        samba4 | CVE-2022-32742   | https://security-tracker.debian.org/tracker/CVE-2022-32742  
                        samba4 | CVE-2022-32743   | https://security-tracker.debian.org/tracker/CVE-2022-32743  
                        samba4 | CVE-2022-32744   | https://security-tracker.debian.org/tracker/CVE-2022-32744  
                        samba4 | CVE-2022-32745   | https://security-tracker.debian.org/tracker/CVE-2022-32745  
                        samba4 | CVE-2022-32746   | https://security-tracker.debian.org/tracker/CVE-2022-32746  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2020-14409   | https://security-tracker.debian.org/tracker/CVE-2020-14409  
                           sdl | CVE-2020-14410   | https://security-tracker.debian.org/tracker/CVE-2020-14410  
                           sdl | CVE-2022-34568   | https://security-tracker.debian.org/tracker/CVE-2022-34568  
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2022-2056    | https://security-tracker.debian.org/tracker/CVE-2022-2056   
                          tiff | CVE-2022-2057    | https://security-tracker.debian.org/tracker/CVE-2022-2057   
                          tiff | CVE-2022-2058    | https://security-tracker.debian.org/tracker/CVE-2022-2058   
                          tiff | CVE-2022-2519    | https://security-tracker.debian.org/tracker/CVE-2022-2519   
                          tiff | CVE-2022-2520    | https://security-tracker.debian.org/tracker/CVE-2022-2520   
                          tiff | CVE-2022-2521    | https://security-tracker.debian.org/tracker/CVE-2022-2521   
                          tiff | CVE-2022-2953    | https://security-tracker.debian.org/tracker/CVE-2022-2953   
                          tiff | CVE-2022-34526   | https://security-tracker.debian.org/tracker/CVE-2022-34526  
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                       wayland | CVE-2021-3782    | https://security-tracker.debian.org/tracker/CVE-2021-3782   
                     wireshark | CVE-2022-3190    | https://security-tracker.debian.org/tracker/CVE-2022-3190   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28038   | https://security-tracker.debian.org/tracker/CVE-2021-28038  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                          yasm | CVE-2021-33454   | https://security-tracker.debian.org/tracker/CVE-2021-33454  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  


-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

