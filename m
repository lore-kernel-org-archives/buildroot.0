Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E4CDC38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 06:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F3B860A84;
	Sun, 30 Oct 2022 06:34:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F3B860A84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DAfUYCBA3nfu; Sun, 30 Oct 2022 06:34:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3256060A74;
	Sun, 30 Oct 2022 06:34:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3256060A74
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9398F1BF599
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 06:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63FC881241
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 06:34:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63FC881241
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JmDd9eIMsEcc for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 06:34:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCAEA80E7E
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CCAEA80E7E
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 06:34:05 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C283C60009
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 06:34:02 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 06:34:02 -0000
Message-Id: <20221030063409.63FC881241@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1667111642; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=If3lNMHNnffJ3WErv67K7qBeM2mzliNZipZleokuEoQ=;
 b=ht+xrvFhO8wFhGFeNuxKHaArmq/EMHxnikthDRmUEJzXtC2XQr7h2hGM4shfrtI+zhSTRG
 GliPhNFEVQfIr8lVKuN7fOhJD77vyHu7Wy+h0/yZF8Gdj05WThaLMVpBgQefCgQKgXAUwu
 vL4h+OXRbj1loAvOYDk1hgZMWfXRpPEn4R5XmLS9nAMgKZcp2PCdkdi9sOIStSEHbA8J5O
 implnAcojG1SeXzUixV/nocCdGZ2LUjinMV0Rjto2E5oaeycMhCyypAqAO8fma7JaGIeT7
 2RJg/LPORKp279dNuDKVm12GGOV/FSib+mr8znOlVtWCCSHZG8CuhOvTXS/ktw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ht+xrvFh
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-10-29
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

Autobuild statistics for 2022-10-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  1  |  0  |  0  |  1  |
  2022.08.x  | 10  | 14  |  0  | 24  |
    master   | 151 | 290 | 10  | 451 |

Classification of failures by reason for master
-----------------------------------------------

        host-f2fs-tools-1.15.0 | 25
          imagemagick-7.1.0-51 | 21
                libcurl-7.86.0 | 21
        host-sentry-cli-1.59.0 | 20
                   libnss-3.84 | 12
                        brltty | 10
glibc-2.36-66-ga1dc0be03c9d... | 10
            host-binutils-2.38 | 10
                host-go-1.19.2 | 9 
                      crun-1.5 | 8 
  gobject-introspection-1.72.0 | 7 
                   linux-6.0.1 | 6 
                elfutils-0.186 | 5 
            host-binutils-2.39 | 5 
                      xz-5.2.7 | 5 
dahdi-linux-5c840cf43838e06... | 4 
                 dash-0.5.11.5 | 4 
            igd2-for-linux-2.1 | 4 
          linux-5.10.145-cip17 | 4 
                   perl-5.34.1 | 4 
             f2fs-tools-1.15.0 | 3 
              host-rust-1.64.0 | 3 
                    lxc-4.0.12 | 3 
                       unknown | 3 
                  acpid-2.0.34 | 2 
android-tools-4.2.2+git2013... | 2 
                  boost-1.80.0 | 2 
        edk2-edk2-stable202102 | 2 
                  gensio-2.5.5 | 2 
gummiboot-2bcd919c681c952eb... | 2 
host-gdb-arc-2020.09-releas... | 2 
              host-pahole-1.24 | 2 
host-pahole-73383b3a39afe86... | 2 
                   json-c-0.16 | 2 
               libdeflate-1.12 | 2 
               libglib2-2.72.3 | 2 
                libshout-2.4.6 | 2 
      linux-5.10.145-cip17-rt7 | 2 
                linuxptp-3.1.1 | 2 
                 uclibc-1.0.42 | 2 
                 wolfssl-5.5.1 | 2 
                 zlib-ng-2.0.6 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
aer-inject-9bd5e2c7886fca72... | 1 
              alsa-lib-1.2.7.2 | 1 
             batman-adv-2021.4 | 1 
bayer2rgb-neon-15feb1115b48... | 1 
                 coremark-1.01 | 1 
                 coreutils-9.1 | 1 
                     file-5.43 | 1 
             fontconfig-2.13.1 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                    gdal-3.5.1 | 1 
                gerbera-1.10.0 | 1 
google-breakpad-c85eb4a59b6... | 1 
            host-binutils-2.37 | 1 
              host-delve-1.8.0 | 1 
               host-runc-1.1.4 | 1 
host-spirv-llvm-translator-... | 1 
                 host-wine-7.0 | 1 
                ipmiutil-3.1.8 | 1 
             libapparmor-3.0.4 | 1 
              libgcrypt-1.10.1 | 1 
             libgpg-error-1.45 | 1 
                   libnl-3.6.0 | 1 
                libpcap-1.10.1 | 1 
                libxml2-2.10.3 | 1 
               linux-pam-1.5.2 | 1 
        ltp-testsuite-20220930 | 1 
          lttng-modules-2.13.1 | 1 
                     lz4-1.9.4 | 1 
                    musl-1.2.3 | 1 
                  ntpsec-1_2_1 | 1 
              open62541-v1.3.3 | 1 
               openpgm-5-3-128 | 1 
                 openssh-9.1p1 | 1 
pistache-3ec9d7c4f8b828fdd3... | 1 
              procps-ng-3.3.17 | 1 
            python-ujson-5.2.0 | 1 
                    qemu-7.1.0 | 1 
            quickjs-2021-03-27 | 1 
         rabbitmq-server-3.8.2 | 1 
rtl8189fs-94a61cbf46ce87b7c... | 1 
rtl8723ds-76146e85847beb242... | 1 
                 sudo-1.9.11p2 | 1 
                 systemd-250.4 | 1 
toolchain-external-codescap... | 1 
              traceroute-2.1.0 | 1 
uclibc-ng-test-6790eafe897b... | 1 
               valgrind-3.19.0 | 1 
                    volk-2.5.2 | 1 
                xenomai-3.0.10 | 1 
                  xvisor-0.3.1 | 1 
                    zstd-1.5.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/1f1dc989059e3b5e2e410a2e7001a9a935a6d273 |     
   arceb     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/a4b74017022d6a6e9f7bf9125c6e7abbd106de9c |     
  mips64el   |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/a9356ecfdda2c1f638d6faf9a5d9ca87ef18641b | ORPH
   mips64    |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/e7a904e9aab86aadc96058af80ea34c09fa7aeaf | ORPH
   mips64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/a5615594028f4b89e47f16fd4a39704d441f1eb7 | ORPH
    or1k     |        alsa-lib-1.2.7.2        | NOK | http://autobuild.buildroot.net/results/827522c4d736f1706c45e7d93c3987408caac32b |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/38dc70c42fe02fc1d6f244d5d121e72d924c6ec4 |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/02dcdc8fc1b3f07988c86e6eeccae187d8658553 |     
    arc      |       batman-adv-2021.4        | NOK | http://autobuild.buildroot.net/results/c9eac6ef2dcfbfe3cbfa39e3d4063570152ae845 |     
  aarch64    | bayer2rgb-neon-15feb1115b48... | NOK | http://autobuild.buildroot.net/results/4a1609ee314ecb85fc83ccb26d6db629ef737865 |     
    arc      |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/008f0577c09e5c3a558489284baa9be1adac551b |     
    arc      |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/191883d0a46391f6a3fef37d17b532da02f6ef30 |     
   x86_64    |             brltty             | TIM | http://autobuild.buildroot.net/results/110ad139707cb79ec020d8b62d4efd3988bb09aa |     
   armeb     |             brltty             | TIM | http://autobuild.buildroot.net/results/af59a5212777f1db040ff10d66cd5d33578a8cfd |     
    arm      |             brltty             | TIM | http://autobuild.buildroot.net/results/a4932bf500ab050d67c9a592ef29690e71da0df6 |     
   sh4aeb    |             brltty             | TIM | http://autobuild.buildroot.net/results/5030f35f72215a40a2da0199b82a2148d64e489d |     
 microblaze  |             brltty             | TIM | http://autobuild.buildroot.net/results/6d1f9e4c1e93222b0c5df4c907a172b4bfeef20c |     
    mips     |             brltty             | TIM | http://autobuild.buildroot.net/results/7c0ca65e68e003ae9d9423905f7ba7c98088400c |     
   armeb     |             brltty             | TIM | http://autobuild.buildroot.net/results/b3f2b3187e5762dbae9e4a03064ed83083f289b4 |     
 powerpc64   |             brltty             | TIM | http://autobuild.buildroot.net/results/50be1bc0a55a7e790bf85311e43ed666d57b3b70 |     
   mipsel    |             brltty             | TIM | http://autobuild.buildroot.net/results/02f214408e2a78ecbf74e6b350ddc35dce0e23fb |     
 microblaze  |             brltty             | TIM | http://autobuild.buildroot.net/results/2f99d23699048a55220ae8f521819a9212c80096 |     
 microblaze  |         coremark-1.01          | NOK | http://autobuild.buildroot.net/results/525a782000738e9dd2a61302b69f68d631887178 |     
   sh4aeb    |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/1b7db739b51f2b01fb03deb3565267de86e2a3cb | ORPH
   sparc     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/0af63e880d99c1d9c59e305e10545f6dc63f9810 |     
   mipsel    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/7f5d3e474d71af4c9de5ef1220a654a6713d5f04 |     
microblazeel |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/2a420c84bc1fd692830c33950b98920b8a62ed79 |     
   x86_64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/39b4fca8f9b272a32a5d08cd48ccae6fc56e6ff5 |     
 microblaze  |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/e9f415e39853805d62793fec62d14bf9053ed5ab |     
    or1k     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/58ef2ba69051f9c8477c9b5e16ea6ecbbe0ebffc |     
    or1k     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/3857258b304bb31c3a504e1e28474f51552f9a96 |     
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/c20cb207a625c0fbdc5bda811839323fbfb62bf7 |     
   arceb     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/f3f226fb661a6b1998381f5fb7cb306771c2ecc0 |     
 aarch64_be  | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/3f23559f01a7783d82ad4e0b2d6792171e6f2b79 |     
  aarch64    | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/9d03b2567880651ee441b95ad891101d7b959cef |     
    or1k     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/c2aeca66514d969f8d0418b366ab7aa5679ac890 |     
    sh4a     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/a83c9fb6c7314f80124d217f35be43610200e7b6 | ORPH
    mips     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/bd2ac5bc418e056735fdf9cc5d15c6acdb4d89d3 | ORPH
   sh4aeb    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/8f53b1cbd9febab173d8c486dc6b0748681c1a5b | ORPH
 powerpc64   |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/bce8a7f27508a2fcc31edcfa8e73c39ce1f4e4ee | ORPH
   x86_64    |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/b219ff70fcefa2a4ba7a99c858a7dad1a82aea2b |     
   x86_64    |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/c5d8e8bbe1a759cafe3126e86266daf7c5ef527a |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/5cfe6d54610970b9b6132b639d534aa65af4cf91 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/5ce5d6fc6824ce323f646100df44e129ff8ed255 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/c95d66d80b5ad4a5b1a7060ca6afea5ffc65deba | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/b72129bc46394b060a21e6cc130417c021f7dde5 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/0fe1deb8e713e70bb49b5ab6e45a7cd59b42863e | ORPH
powerpc64le  |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/8e241adaad30e9af4d95eb73101b9b05ad6063b4 |     
 powerpc64   |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/ca8b6646322a4cb911fad5fb9cb38046743609bf |     
   mipsel    |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/080e24125087c8244ab1b3d9b3fa5fbae3f46df0 |     
    mips     |           file-5.43            | NOK | http://autobuild.buildroot.net/results/74dfc4380a931e36e975c5a28659eaed9f3cb6cd | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/f2061c87831df51b92248ee15d7690599b25ef53 | ORPH
  powerpc    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/0fdf9c83f813a94332a897e22812334fd3630b7a |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/37b3921e30e3354e03bb240f92b4c5f02461b82c |     
    i686     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/3b9b7834fae468feef574b59b89f4cb3cc76b807 |     
    i586     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/3fb5d86aefabb3c1ce1550792d88f4d3a74bfffa |     
microblazeel | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/c80077fff46f75e70c54f4a1edcc8c562fa288a8 |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/52cffd4a17b514872d1847f5e48a158f761c2d2e |     
    or1k     |           gdal-3.5.1           | NOK | http://autobuild.buildroot.net/results/69829e3b80b1b7c56416491e0dbc949917d6eda9 |     
   armeb     |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/226d48412048f38a9df74a3629cdbf4f15fef1d8 |     
  sparc64    |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/58a90d08a7218df0c9d4df858a8418224c0aee0b |     
  aarch64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/f807eeb2f5c96f961fcb69dec7a814ca41b5461c |     
   nios2     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/42b02e2a61236e631669747ba93bcf862f420fca |     
    mips     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/d491eafc5fc623e54130eef1ccbfcd7290a0585b |     
  riscv32    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/16513ec6a9b74a26aff2b72ed02a5173e61ff4ac |     
    sh4a     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/9717af4ee44fd558ecc8b052c8503e5de5abbff7 |     
   nios2     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/25ff9bddc0f67071d31555099502d34ea93d0029 |     
 microblaze  | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/810efbb0ab431857d2ace8311f00191fa176ec08 |     
   nios2     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/f7c99deb2fa41644b3479eb34e7eca6c6fcd718f |     
   sh4aeb    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/892b180ca2bbeabff3ae95b55a35bd0fbaa7d375 |     
 microblaze  | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/c60690c535ea283eba5ef01de7060166b9a085fa |     
   sh4eb     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/c7fdfe1238bcd1efe3ac4accea63f08796af6495 |     
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/4c9ccb75b84d45818d04ad3aa9e4dbe1a2729d53 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/ee77429754a9eb646274f0309ccc7f83cb01ef6b | ORPH
 powerpc64   |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/d118cca989b0c3303038e6d61a6b8f185674f785 | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/404bf5f8701af33f7bae6b1686f2800e16186fc0 | ORPH
microblazeel |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/2933770e4869f7f552ae34979cb72c4cd8bd9e46 | ORPH
 powerpc64   |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/0bed5cb9bf343403c660e3daab33c1fbd43a8412 | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/0ccdc546b1694f3688cf2cef4d3e28b57ea8dec3 | ORPH
    arm      | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/f40534aafdecf5f9ab22008939a27bc1ad45b45e |     
    i586     | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/36714e14fd33a2915a0dcb3fd1cb35daaff6d803 |     
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/0ed921f9be8ce211cb0e498a1c57a4bc9d39a0f0 |     
   nios2     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/cee006cb0ee0485d1e5ca1164edd2ed5b582f4aa |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/6f96133c969ab5954b1998573465bd396855f6b8 |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/5abaccf29b8b4016cf3342f2ed4bf4d3830acd64 |     
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/5ae8a6fb46bbdbf58c0142338a07d581a463a9c3 |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/930b554d140ac7c03f0dd1a441a302ad215ba63c |     
    m68k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/8b6be1d63309b990f4acd67e82c3c589b762cec6 |     
microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ff32ebcf80463421d2d78eadd4e46de3069d6553 |     
   sh4aeb    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/4165bebe832f8c984454025d0d83e621c319ec3b |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/14b2a62ecdee4d611aee4c653778e52bbcd407cf |     
    sh4a     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ecdd653cb1e1a4cdec5dd93403480b700f154453 |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/630d412d718789162f5351df3e673051a9d1ab81 |     
   s390x     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/261e50c50c21aa59c4fda51f49ff70f563382257 |     
  powerpc    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/6ccef34e715602b51fe013fab6d4875e52436b3d |     
microblazeel |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/3fa6010add4b03f825bc2956d567a27d474efa9a |     
  mips64el   |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/33bbe6a034a0685c646ac503abe7d90fde06d559 |     
  aarch64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/854a62b2a766d35f636f1001ffd1cb8199a46e61 |     
   x86_64    |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/05c6bd338859837c8155acb0065064ff1036aee2 |     
   mips64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/6e3d66c9b3ae02eee50d56fe57fe5a5eab6fcd29 |     
microblazeel |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/bcdbb6b30748c7b10c3e202b3cefc45166eeb139 |     
 powerpc64   |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/881a9a1195cd751bc2117ecfd85ba4c4a63dd2d1 |     
   x86_64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/bbe30d9795dade202281221e4e2daef0f8f3073c |     
 powerpc64   |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/8b983339daf4165784e762858366cf0391449e2d |     
   x86_64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/4a008ffc39539a42fbb446f7300e4e72f0b68184 |     
   s390x     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/b6b2311d0ebb3c408f97311c18629176d3373b26 |     
    arc      |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/332b5f502cb20bda2e97709222499e2ef1573b54 |     
  sparc64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/a3f5d651bfa7773c28a733d302a288d7e0ac0418 |     
   armeb     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/9c1d2b7a37a762d2fdb3fccd468b52303daa32c0 |     
   s390x     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/4477cc2abd8e17a16fc7eb6da6c1d9aaec87c0e8 |     
    or1k     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/863e6a0f89e32ed5a5e2510475a2325349f4af8e |     
powerpc64le  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/19a136708dc7d27eae1a3e77496e957fb51e19de |     
   xtensa    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/49c58a9e59f199a7b8ce2acbf39325b9f801f8d0 |     
    mips     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/c4299f0aa4b333812d2a5d449de7f646109fe497 |     
    i686     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/5ae83dc81551aa42df06d21563a0cddba992a54a |     
   x86_64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/75ef709d287f58f4b2fda805950120ccf45b9e05 |     
    sh4      |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/8a5adaf6649c1c1f3cd8dac4ad90a63c96bee751 |     
   mipsel    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/b2d4265b83c7d49d9d1002bf4068a7f99a7a4dbc |     
   mips64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/85f1caf23c4f33ce4db5760eef17903dc07a0f03 |     
    mips     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/d9ca80ef3a841d2c9e02939fce1723d5a85c78b5 |     
   mips64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/c55bfd64282e008008950ec8e035a5650dba2faa |     
   armeb     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/810275033ef6a257a6eaec7717edbba949ed14c9 |     
  sparc64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/d51899ff8dd1145f51b6afafeee163fc4dcc6133 |     
    i686     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/0c164cb5f06fdc0f284ce6014d79dde343c8da15 |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/7a3d0fdc64185bc0cbb633766aba10d9955f430b | ORPH
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/ffbfd6a3d256a9b32ad86b0a659daa215b0c7f36 | ORPH
  mips64el   |         host-go-1.19.2         | NOK | http://autobuild.buildroot.net/results/1d46801b72cf911caa7b64f297757fe7711e1f59 |     
  mips64el   |         host-go-1.19.2         | NOK | http://autobuild.buildroot.net/results/e127a89367f95e812c210d1aca8b148d6e322aa0 |     
    i686     |         host-go-1.19.2         | NOK | http://autobuild.buildroot.net/results/3c49787e8c36fb42a280c9bf1a4b2132c8b5d4a4 |     
  mips64el   |         host-go-1.19.2         | NOK | http://autobuild.buildroot.net/results/5570acab8cd73a711c1c32bc74e129ed35c3d8c9 |     
  mips64el   |         host-go-1.19.2         | NOK | http://autobuild.buildroot.net/results/04cc8008c76b85d9a925e9a4b4309837728eecc7 |     
  mips64el   |         host-go-1.19.2         | NOK | http://autobuild.buildroot.net/results/a12f8dfdfb6138fc9c37bfc1e7af5d10e10dc18f |     
    i686     |         host-go-1.19.2         | NOK | http://autobuild.buildroot.net/results/1bbfe982e6469ca9408ee9c48cbfef472e78bf7f |     
  aarch64    |         host-go-1.19.2         | NOK | http://autobuild.buildroot.net/results/acc932b042ceb8eb2514f3c96f423a89b52742b5 |     
    i686     |         host-go-1.19.2         | NOK | http://autobuild.buildroot.net/results/00ab6c6e8ecb63f82c81eae50d716c562f422508 |     
    m68k     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/30a28df85af6288559d413d5d8fd4514c0f8fa40 |     
    or1k     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/ae61bdb808d81d3144baa908c771e65d60d0b995 |     
  riscv32    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/ab8b75eee5e0a5389d006580581d7d4b65501b92 |     
   sh4aeb    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/e1fde334b14b15ec11bd93e2ada07c742be3c9d9 |     
  riscv64    |        host-runc-1.1.4         | NOK | http://autobuild.buildroot.net/results/add0a55aeb836d617099f0721e413cea1e310266 |     
  aarch64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/f19ffff903fd833bb05de3fafda5ffc5374a794a |     
   s390x     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/d0d0ebfe45e260152519770323823aa3604c1b46 |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/f53c5b96ddd9ed9264a784c9f2e128b9f058e2a9 |     
   nios2     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/6c769b7a00e4e41e4bd989c85b34bc98f3e964e3 |     
   x86_64    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/21cd591ea6421c5003f83da997a72bb9b9fb4df4 |     
    arc      |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/672be05f17a7a16dabaa7b48835939b8be035680 |     
  riscv32    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/eff6eff2736e15e2a9eb438b34bf0d3105c7bd20 |     
   x86_64    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/16c193ef47533844224d02face08a15fc96d9e57 |     
  powerpc    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/188ebbf00b591d2f288ecaedbcfc45904f84a5f2 |     
  riscv32    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/63309b8152ce8546225f371227d857805e3c3612 |     
    mips     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/6504529a3d2761633799afdc866b232170b8459d |     
 microblaze  |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/25702894cd07bf1149775e650991d5b90fdeb23d |     
  powerpc    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/f47514dbfa710c623b4006ceb6b417df2709252b |     
  riscv32    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/d27bf227d50ea8180c0a04f49e276ab26dd50477 |     
 powerpc64   |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/92f5536369f74fbc949017db3a540f12b8d3f028 |     
    m68k     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/8fb340f5606695dfc4c684bda2090e17899e98ee |     
   mipsel    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/9b91652916e41b2d7cd36b1534f5e0aeeb4d551b |     
  mips64el   |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/daad80010654253c5c4edbfe520c8e01b0e808a0 |     
    or1k     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/a56c3f6c52f169c9b6a8ffd8c78b85ea2154af1d |     
 powerpc64   |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/20f13fcead0a12c261e9344fcf79cd3f58f73eec |     
  aarch64    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/6eb322a7b8553f38105b938dacc9f86c75d321a9 |     
    arm      |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/4e17e703f51a0e2c40f4fae4002d1c93254dfc54 |     
 microblaze  |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/da9ff9ba70f14f4c66af2729f378fee57871c1ce |     
  riscv32    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/37987b2a6723cb82973a91219460b7e0aaea9f08 | ORPH
    i686     |         host-wine-7.0          | NOK | http://autobuild.buildroot.net/results/00a4df4f371441181b780966ae74b57f24b6c242 |     
    sh4      |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/c48483ca25818696eedb59fc4418c55fd3a8dd12 |     
   x86_64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/e73080a26532ceb7640f2b04bbf2b3257c57dde5 |     
   mipsel    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/cb1833e6d8d5d669ec0f75b717150e36640c15e8 |     
   sparc     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/186b743da18963c06a42835b89dca85e69fe6bd9 |     
   sparc     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/1989b1731ad1c81ffa719fc1825a7d310ad6b29d | ORPH
  sparc64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/835779a59c212bfc6df55ecd2c4edd87519d7b40 | ORPH
   arceb     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/1bbc4c0c74db4eeb06e605267bdb974b8a231d2c | ORPH
 microblaze  |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/9651fc548c0d57d7624adf06ba0c677c468fbf48 | ORPH
 microblaze  |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/1e9682e165a35b7c32585e3988c4986d63522b52 | ORPH
 microblaze  |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/e0ff7b25d82b8e915ef03cf85cfdc53a2c9618e6 | ORPH
   mipsel    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/edc5e3b04ce6ba40eabcc2a7e391b0d05ac05485 | ORPH
   s390x     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/63afe69f5e953ba1f28719a59074487a589a631a | ORPH
 powerpc64   |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/357bc050db19f28b5fd13272a3acd2becf78603d | ORPH
  aarch64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/ff8290e31355df13617a6b8730e44d6aaa687ab1 | ORPH
  sparc64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/a754a29ea156105276d3d5426c5b8e6dec77a8ad | ORPH
microblazeel |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/0a0572ef699a2d49539f3837c168e1281091571a | ORPH
  sparc64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/ea23167f2b1b6c64309f23ef1511f4bf2177bd18 | ORPH
   nios2     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/5f3f5cb05896612bebef67cbb5e8e71041e5bb6a | ORPH
   sparc     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/249b11bae9b966c5c0f226db31cb6a7d0c60a82d | ORPH
   s390x     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/dae0763d5b66f51872fbafd5b6b5f9239c5b74c2 | ORPH
   mipsel    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/c6d128f3b6a854d5e902e25b19fc947983994f2b | ORPH
   s390x     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/2a3a32ff0bf541789d010e722d440da5b137ba99 | ORPH
    arc      |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/556fd1203788f53d981e3740f3259886616f77f2 | ORPH
   sh4aeb    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/ccc9390e8852c3fecfcb5724b89d6e87e9e9912a | ORPH
powerpc64le  |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/b27e94e6853989098552bde4ef78e71732d98623 | ORPH
    i686     |         ipmiutil-3.1.8         | NOK | http://autobuild.buildroot.net/results/068b65189c163f69eaa142f705e068cfb9316535 |     
  riscv64    |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/8dc88bdca0dfb5a04f61d30ff2f963d40f2b5112 |     
  riscv64    |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/8d761820e1261dedceda8979ad6ade31d3359d9f |     
  mips64el   |       libapparmor-3.0.4        | NOK | http://autobuild.buildroot.net/results/17cabe6a598b32e1ff5510c211d2921bf86091f1 |     
 powerpc64   |         libcurl-7.86.0         | NOK | http://autobuild.buildroot.net/results/afbdbc3c232deafa7215ab9560530dde38f03f66 |     
  sparc64    |         libcurl-7.86.0         | NOK | http://autobuild.buildroot.net/results/ca8af5f602fd23a91e3a5bcf99573d780f6f05ca |     
   sh4aeb    |         libcurl-7.86.0         | NOK | http://autobuild.buildroot.net/results/2f3635d31fe74ef81562d87623b37285be0885c6 |     
   s390x     |         libcurl-7.86.0         | NOK | http://autobuild.buildroot.net/results/9c1d0fec1ff932de03d562aa1b43921270a6bece |     
   sparc     |         libcurl-7.86.0         | NOK | http://autobuild.buildroot.net/results/46e93c47b70712fc2b0a1f0dd8ad03a4655ea640 |     
   nios2     |         libcurl-7.86.0         | NOK | http://autobuild.buildroot.net/results/243e455e630137c72393d242c7861f5aa7218142 |     
    arc      |         libcurl-7.86.0         | NOK | http://autobuild.buildroot.net/results/9b27298246f74ec278f88df4b06ba23b536d9387 |     
    arm      |         libcurl-7.86.0         | NOK | http://autobuild.buildroot.net/results/e96f2aaa52bfe1d7e92547ae59d8478ef1a7af98 |     
   sparc     |         libcurl-7.86.0         | NOK | http://autobuild.buildroot.net/results/ec9c31d1ef1a68b584dfae362386ea350af5e5b3 |     
 powerpc64   |         libcurl-7.86.0         | NOK | http://autobuild.buildroot.net/results/3cc0ab42153e48824e5ee65c3c7bf09c0ee64432 |     
   s390x     |         libcurl-7.86.0         | NOK | http://autobuild.buildroot.net/results/56cde370c30ed4c3aaa9aae35ab87e7d8967396f |     
   mipsel    |         libcurl-7.86.0         | NOK | http://autobuild.buildroot.net/results/cccc29cfa74a285381f9ab309b15fa8739b93048 |     
   sparc     |         libcurl-7.86.0         | NOK | http://autobuild.buildroot.net/results/a28572304faeea97d44af43fdc9e41283d486ea1 |     
   x86_64    |         libcurl-7.86.0         | NOK | http://autobuild.buildroot.net/results/0f6d5163f69181b57db63ebeed3052d946d34bc2 |     
  sparc64    |         libcurl-7.86.0         | NOK | http://autobuild.buildroot.net/results/77ac4b4ceb72cfc656edaa098bffb5ee0a383d14 |     
    arc      |         libcurl-7.86.0         | NOK | http://autobuild.buildroot.net/results/db18a8139712bea7751eee012c67a17710e3efdc |     
    mips     |         libcurl-7.86.0         | NOK | http://autobuild.buildroot.net/results/226db7ecaf55be8a703c7a585373c9bd0458ff34 |     
   arceb     |         libcurl-7.86.0         | NOK | http://autobuild.buildroot.net/results/d2cd4305a387d642594d6aa32efde25f620d97a0 |     
  powerpc    |         libcurl-7.86.0         | NOK | http://autobuild.buildroot.net/results/e5f97029b080b5b76fa59624ee1a3fed7ce2e621 |     
microblazeel |         libcurl-7.86.0         | NOK | http://autobuild.buildroot.net/results/65559559425dd0d7764725be6baf91758c6cabfd |     
   mips64    |         libcurl-7.86.0         | NOK | http://autobuild.buildroot.net/results/814dd72ac50092d218922166932d8433b920c197 |     
   armeb     |        libdeflate-1.12         | NOK | http://autobuild.buildroot.net/results/c965bb762f949dfc80066d631d28badf46f78381 |     
  aarch64    |        libdeflate-1.12         | NOK | http://autobuild.buildroot.net/results/ecd08ad970da0bdc7428b7f9ae5deebb0d617579 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/eedbcd542e8690b42ef79b9af1505a1c986340df | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/9062017e0bc761e416a4d071d7874745a7ef75da |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/2a797f0a91377a05fe621d0a5bcfd2b7403b4a4b |     
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/ae591548efeab20c85ac182f9bf4b5bca8e16139 | ORPH
  mips64el   |          libnl-3.6.0           | NOK | http://autobuild.buildroot.net/results/a5e63604cd2c6aae4a86e0ea3d1967ce02647b79 | ORPH
   nios2     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/08ab4cbf1f123062cbbc83bb36d335fc2d7be877 |     
 microblaze  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/a70ac5973f8a24d4965c0a73c7fa5dd833585392 |     
    mips     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/b2986f4090993ec1d4ced82093a99761a57777d8 |     
   s390x     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/56bafafd49837bb2210e0f55dd1c51fa5e52df88 |     
powerpc64le  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/ce4e83e26a5cac950231ae06970c9cd3b43d7d4f |     
microblazeel |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/6ffe577378f17ea3e010d293dd4a2e92b972e5cb |     
   s390x     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/f38dac8173197cd4d9399a413f403467536beeed |     
   mips64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/79239df7d6af4bacf51976746c838260f285f8d0 |     
    i686     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/3c938d4bc15ded09bd86c03d6db37fb879463edd |     
  sparc64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/298a31b242e3d45d04fdbeb0311c63e77de9adc1 |     
    or1k     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/f61c80514cf303fd71f0be3915900e6cc981159d |     
    mips     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/c0d8f56969fa14423806c83b2e5a92bee91b4070 |     
   mips64    |         libpcap-1.10.1         | NOK | http://autobuild.buildroot.net/results/c0783fa76546276534a45103372cd137a4418a00 |     
    or1k     |         libshout-2.4.6         | NOK | http://autobuild.buildroot.net/results/85fb2cb7fe4f63fd85ae127fb4934a0fa974922d | ORPH
 aarch64_be  |         libshout-2.4.6         | NOK | http://autobuild.buildroot.net/results/815b68e6ec5227ac031c0fcfccc5777e803e50b7 | ORPH
   x86_64    |         libxml2-2.10.3         | NOK | http://autobuild.buildroot.net/results/1d641f0e880ae4d835c87de997865cfabfabd878 |     
   nios2     |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/1ff441d1d84e4e15490ebdf61c6fbcfe9304459b | ORPH
   sh4aeb    |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/c9db57710f9dc53bc45793b3879cbb21ac1f1696 | ORPH
  powerpc    |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/734e17c9791dba0b3a5eb10fb4ee1c8fb6536b73 | ORPH
   nios2     |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/590bed640b3bea55e1fa2b4679daf8e02516dc5e | ORPH
    mips     |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/e763d65053932d74f8b0b9ac164f2d6adcf5de22 | ORPH
    sh4a     |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/c65070dc2b9edf4f9457d119b10ee9a0a2d4fcfa | ORPH
   mips64    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/ab861babc7efbfe48a9a78e7b20368da147bac83 | ORPH
   nios2     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/6a9e4dd6ad8e3b9dd69eb5f1748f2446935b6d33 | ORPH
   s390x     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/bcaeefe023ab934b7fd83f79d52a9afa26e0a137 | ORPH
    i686     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/e56411a0b0fd36c002b0b8139f294506bda27b7b | ORPH
    arm      |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/3d02d83d597b619c99882f54b7be29d43c5309a2 | ORPH
    arc      |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/f0b08ba4329aa513a57fddb28f56b1dbb2e51731 | ORPH
    i686     |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/bcf0568d16765210b8b09ddd755ff3505456eca7 | ORPH
    mips     |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/f8c5bc3d14c6cd9a7a89866b1a6b048a8da2db34 |     
    sh4      |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/98cc8b67171ca8d7adf8b1d777f7682b8edab09f |     
   x86_64    |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/9569c72bc5b10c1a16f194550d8259bb6b88afc3 |     
    mips     |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/5b6400aa6099da8722e6607277a03a4cc6951dc4 |     
powerpc64le  |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/01841fde1448a03b7e9c97126fcc3d79ac380d8d |     
    mips     |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/077a21a3d2d95b5b44f872154771dcf69293ac35 |     
powerpc64le  |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/c6d4749cf0e9281ef3c3b0aa86b2aed86fb86c75 |     
   mips64    |           lz4-1.9.4            | NOK | http://autobuild.buildroot.net/results/3154f1f65878cb08d8d2f9c20000f5e55257c1ce | ORPH
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/21f91531ce60dfd020ea47150150c9d5320360f6 |     
microblazeel |          ntpsec-1_2_1          | NOK | http://autobuild.buildroot.net/results/b13fc5fc61bef5c4eb5d962a91964267d4901907 | ORPH
  riscv32    |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/a6227df547857ce98ecce38b9e779e682bc415e5 | ORPH
  sparc64    |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/ce403baa9e2825f73ca0d4367f8c5a4e31d44ab7 |     
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/df821eb8993439931e9388ea4f89b385507bfb34 | ORPH
   x86_64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/3ccd67331b0a8b53abe98cef122135f55e7496c1 |     
   xtensa    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/98f44fc501195a6c42c263ef998974fd02862876 |     
   arceb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/cac8de34db9fdb23f485d9591a5409ec6ddd066a |     
   arceb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/375d379b2cb53ddbbea0ccf9de778a5f7c870267 |     
 microblaze  | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/767fb5f777da26e0bc69e93c46b152a4d990fbca | ORPH
 microblaze  |        procps-ng-3.3.17        | NOK | http://autobuild.buildroot.net/results/60e45e0193ecf0eb8e2ee997d17b048f7f70b77f | ORPH
   nios2     |       python-ujson-5.2.0       | NOK | http://autobuild.buildroot.net/results/ce1d9dfe61369c82dc78a5709201f4b8b6fb1cf2 |     
    mips     |           qemu-7.1.0           | NOK | http://autobuild.buildroot.net/results/52636ab1754844d6f05ad83cf895885147e983c7 |     
   sh4aeb    |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/9129443fd0d2978ec94cb4cd926bd0ec8d90e2ef |     
   x86_64    |     rabbitmq-server-3.8.2      | NOK | http://autobuild.buildroot.net/results/2fd3ac98f717969f74db9730be24d5fa582cf2f6 |     
  sparc64    | rtl8189fs-94a61cbf46ce87b7c... | NOK | http://autobuild.buildroot.net/results/033bc943471898a71f0fe2779642b407106a29ce |     
powerpc64le  | rtl8723ds-76146e85847beb242... | NOK | http://autobuild.buildroot.net/results/d48b4eb65ef2e1b149f4ba9de48c9c5ac795ba73 |     
   mips64    |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/fb7ae85a850419ec6d264c3cee8cc2add65d9114 | ORPH
  riscv32    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/69ae53c8c9765942514209200ebeecf585c4387a |     
   mips64    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/9c24a220d093950965329300396799ac3bb91351 | ORPH
  powerpc    |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/df0a4036b1d1de5a23dc85f9abf6736649f1a098 |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/f0a44d9127500ee836ba84178e019e256c70a4f9 |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/8d5d33c9ce03ac23f2e0f78c5357bd6f5c5aef75 |     
   mips64    | uclibc-ng-test-6790eafe897b... | NOK | http://autobuild.buildroot.net/results/7f1a47cea7c05d9217a515c04faf2487220ec846 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/8690f39f7ac9c7a09ca64f4596508b19756e8970 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/766f9a109e35d16e190dd4f839ebca80fbab92fa |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/0e34ca3d412d7c0e12a6aa78b4181589cf0a72d9 |     
  mips64el   |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/755abd894d26b72d9c6c95626931d71a4b6afd58 | ORPH
  powerpc    |           volk-2.5.2           | NOK | http://autobuild.buildroot.net/results/f381393593bd3622e123279383006d1d4a4c0a02 |     
   mips64    |         wolfssl-5.5.1          | NOK | http://autobuild.buildroot.net/results/fabc71cc307d1371bcad3a6b4d0e68334bce9e5d |     
   mips64    |         wolfssl-5.5.1          | NOK | http://autobuild.buildroot.net/results/5796bd3d3c1857d47de2cf6efd39d6e27c41c756 |     
microblazeel |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/2303a1621ea91f61541279461a899d8e306de743 |     
  aarch64    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/e79a55b5e7251829008a4af40b67bed8bbc4b661 |     
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/a3b5c7b519d29398116c228dbe99544ac47cdc88 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/bcedca23c7dd6127497e4443e4cc7e59dfdb7473 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/d2d7c7e273e135d01a13b0afcf4f8b715ff162c0 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/d13b6e04220e4c70726e30bbf08f729585d46652 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/6e1b1ed0f4d49c74f98646b7a7fb2d270110df1b | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/ff279644b73e6f1bf6d3d64d41a4dc1ea933e849 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/bea5803810284d7a40bc1be8f197ab3fe21ddc16 | ORPH
 microblaze  |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/1c01579e4e4d368e47ccef805601549e301e0e9d |     


Classification of failures by reason for 2022.08.x
--------------------------------------------------

            openssh-legal-info | 4 
              host-rust-1.62.0 | 2 
           crucible-2022.05.25 | 1 
                    dhcp-4.4.3 | 1 
                host-go-1.18.6 | 1 
            igd2-for-linux-2.1 | 1 
               libglib2-2.72.3 | 1 
pistache-3ec9d7c4f8b828fdd3... | 1 
               tcf-agent-1.7.0 | 1 
                       unknown | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/4b5bd8dd9947edbd59471b85b652db0fce830f17 |     
   xtensa    |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/11a8b2503be3f38e11461cb6c1caf514e2624a6a | ORPH
  mips64el   |         host-go-1.18.6         | NOK | http://autobuild.buildroot.net/results/143b3580a979cc39c9c0b9787b469348ae63c358 |     
   s390x     |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/bc23af27436a7bf7a5eb6b898cf976a11998665b |     
  sparc64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/50c5aa131127849b2c7d748ab17d43bc832efc5b |     
  sparc64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/40d6e0aa3bdd0d268fce05c8ed81bcd55bc79ea7 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/10a3f871cbb94a0a02f7e752f610d9f29953b6d0 |     
   sh4aeb    |       openssh-legal-info       | NOK | http://autobuild.buildroot.net/results/199ad0d27ec15342dfe358b76ac6a6417f8a4d02 | ORPH
 microblaze  |       openssh-legal-info       | NOK | http://autobuild.buildroot.net/results/657199763f44d433c9b247f7f6cb678c488990ff | ORPH
   s390x     |       openssh-legal-info       | NOK | http://autobuild.buildroot.net/results/b15e8473dbf447e16b77f183543b90cc60306d00 | ORPH
    or1k     |       openssh-legal-info       | NOK | http://autobuild.buildroot.net/results/f695c24d6e013a0566af0baf44eb74b1b2d7671b | ORPH
  powerpc    | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/30f204acd57622ceb99c86291a40bb9235166e32 | ORPH
microblazeel |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/c4133c219dde89abf9a89fea6cf71de172c2eee7 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/7d51f6677cc21bd2bd5ecad792e7ff6ab0867682 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
