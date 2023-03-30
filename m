Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC32C6FD1D
	for <buildroot@archiver.kernel.org>; Thu, 30 Mar 2023 05:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A105060B33;
	Thu, 30 Mar 2023 05:35:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A105060B33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xPs5a-BcWNoI; Thu, 30 Mar 2023 05:35:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2846861373;
	Thu, 30 Mar 2023 05:35:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2846861373
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 74D451BF4D5
 for <buildroot@lists.busybox.net>; Thu, 30 Mar 2023 05:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38F3084179
 for <buildroot@lists.busybox.net>; Thu, 30 Mar 2023 05:35:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38F3084179
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tGEPlyFjbgPZ for <buildroot@lists.busybox.net>;
 Thu, 30 Mar 2023 05:35:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C284A84170
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C284A84170
 for <buildroot@buildroot.org>; Thu, 30 Mar 2023 05:35:49 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2DDF9C0009
 for <buildroot@buildroot.org>; Thu, 30 Mar 2023 05:35:46 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 30 Mar 2023 05:35:46 -0000
Message-Id: <20230330053552.38F3084179@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1680154546; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IEP8lvfN3d3eIvWy/+srLhoIQkRtVmZlfYzl0CXrxc4=;
 b=Dr4nBI4PSGYgn8G11oP6smWTAYetW88WdZh8e32QHRRTjcaG1rxA3OWm5Y/v6sFYgkYBke
 SeGEtsjy4UP2H1QNm9trg/LaVHJKP+YXhDfQFlbifnofKl8Pt0NMr+krJvH/At0G2UjGoD
 4NoLJNUK/eqCB36+AABSVCW+kndy32EAVCim+QAKzxTH10QhC69aNwaczqcCM1+CRCHu3K
 HH/Rkvw5GMc8j+3BPuOywiOv/SUM0ZrOdI+w+8NsnivF9ePOdguCn7OzEgdZQnEhhjCKKG
 pqtwMnJabjrjJkpV0hJG7snlv3+R3IIP2+3JqsWLZSH7OCYZMDGOfG1TZwp6SA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Dr4nBI4P
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-03-29
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

Autobuild statistics for 2023-03-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 10  | 14  |  0  | 24  |
    master   | 196 | 135 |  1  | 332 |

Classification of failures by reason for master
-----------------------------------------------

            host-binutils-2.38 | 10
             bluez5_utils-5.66 | 6 
                elfutils-0.186 | 6 
glibc-2.36-81-g4f4d7a13edfd... | 6 
  gobject-introspection-1.72.0 | 5 
                host-go-1.19.7 | 5 
                  linux-6.1.14 | 5 
                       unknown | 4 
               valgrind-3.19.0 | 4 
                busybox-1.36.0 | 3 
                 dc3dd-7.2.641 | 3 
            host-binutils-2.37 | 3 
               host-qemu-7.2.0 | 3 
                  snmppp-3.5.0 | 3 
                  check-0.15.2 | 2 
              host-rust-1.68.0 | 2 
               libglib2-2.72.3 | 2 
          lttng-modules-2.13.7 | 2 
            ocf-linux-20171122 | 2 
                   perl-5.36.0 | 2 
                    qemu-7.2.0 | 2 
rtl8189fs-ed6741b52bc998875... | 2 
                    ruby-3.1.3 | 2 
                apparmor-3.1.2 | 1 
                   aumix-2.9.1 | 1 
             berkeleydb-5.3.28 | 1 
                  boost-1.80.0 | 1 
                    brltty-6.5 | 1 
             containerd-1.6.16 | 1 
                 coreutils-9.2 | 1 
                 dash-0.5.11.5 | 1 
                  delve-1.20.0 | 1 
               domoticz-2022.2 | 1 
        edk2-edk2-stable202208 | 1 
                  ffmpeg-4.4.3 | 1 
               fftw-quad-3.3.8 | 1 
             fontconfig-2.13.1 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubi/ubi.mk:51: /home/tho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                     gmp-6.2.1 | 1 
         gobject-introspection | 1 
           heirloom-mailx-12.5 | 1 
       host-gcc-initial-12.2.0 | 1 
               host-zstd-1.5.4 | 1 
                  jack2-1.9.21 | 1 
                   json-c-0.16 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
               libcap-ng-0.8.3 | 1 
                    libndp-1.8 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
        ltp-testsuite-20220930 | 1 
              mosquitto-2.0.15 | 1 
                    mpir-3.0.0 | 1 
                  ntp-4.2.8p15 | 1 
                     nut-2.8.0 | 1 
                    olsr-0.9.8 | 1 
package/rtl8821cu/rtl8821cu... | 1 
            python-rtoml-0.8.0 | 1 
            quickjs-2021-03-27 | 1 
           tesseract-ocr-5.0.1 | 1 
           uboot-tools-2021.07 | 1 
ulog-0389d243352255f6182326... | 1 
           v4l2loopback-0.12.7 | 1 
wireguard-linux-compat-1.0.... | 1 
                 wolfssl-5.5.3 | 1 
x264-baee400fa9ced6f5481a72... | 1 
               xfsprogs-5.14.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |         apparmor-3.1.2         | NOK | http://autobuild.buildroot.net/results/0564e730ba5a0622562dc6fd7942ed2e80f01a5e |     
 powerpc64   |          aumix-2.9.1           | NOK | http://autobuild.buildroot.net/results/eb556ec39ba0c6f8612670cb7f1ba0261e8c398e | ORPH
   sh4aeb    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/0f626bb7b34a723525d4a19cb892f9f852ee2acc | ORPH
    mips     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/1c038fb617b57752d540c32c867bd9533f49e149 |     
    or1k     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/ee266a3bd2133205ae664cc7be90d9022495459a |     
    i586     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/5fe66a3a9fa5eab5bcfdfcddd969e64f87bdb474 |     
    arm      |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/4045a349add4ec95c34a5dfbf84633954b33beeb |     
   mipsel    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/144c4409ae7ea92b2649a319bc69ea9705bcf495 |     
    i586     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/2bfc95c2d0c2a25c46ed6e906e55b9070a70e9fc |     
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/027fed41d0012d9a8d210bb80b5772730ad11ad1 |     
   mipsel    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/446a1cb522b0be46b0d7d8ff462d900b1f47afe6 |     
  mips64el   |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/ffa5d3cae63c04d980128992314f6cf105059bbc | ORPH
  mips64el   |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/931911fa6519d1fadc9a4fe8c58df2d843a82e7f | ORPH
  mips64el   |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/c26622557ad2ac4eb2cd00e7856b54349047d62d | ORPH
   nios2     |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/2167fc918f12ea3b3242dc968284176bfcad6e7a | ORPH
   x86_64    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/f1c39e912b7f3445d0ab747e7a27b456b0eaf30a | ORPH
   x86_64    |       containerd-1.6.16        | NOK | http://autobuild.buildroot.net/results/65842e8334ee13474470d6873aa1b024611c0886 |     
   sh4eb     |         coreutils-9.2          | NOK | http://autobuild.buildroot.net/results/ddd3181875b5020e20d6a237bbb9654491f08814 | ORPH
   xtensa    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/e476a0b21ba2f07fb2b2b5d0374f656847153c6f | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/a2691b7b4f6786054041e40942629ce8df7bd61d | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/87a4c21bc921315db21481d9590deadfcbdb03d1 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/3c6c06a387de226bc2b84f28fc2051b13338eb1b | ORPH
  aarch64    |          delve-1.20.0          | NOK | http://autobuild.buildroot.net/results/8d1a70adeb271f85833d18fe292aa8cc9e4296fb |     
 aarch64_be  |        domoticz-2022.2         | NOK | http://autobuild.buildroot.net/results/2a2b23900e58272d7510af5bf111c3f644ea69fd |     
    i586     |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/225cc6d6b71cc43b3d15e500a1a7ebe61dd39145 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/5d61c30f83b6330b890dd831ed1e64241ed35031 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/0cb0d9bd9d9d8aab2211ca766e9675cf88b58fd9 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/2525c6937776926ede310c2c337a738c0a6a9277 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/7471c0914f7dd3e4e2f3f7e2db2d70414062e0fe | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/25c9168e88048932c9c0686f9ec7c1ac06a2c4a7 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/9e07eddf6295f67e85faabafe0fe806ca325826f | ORPH
    arc      |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/48979dc04407bbee5ea9f1938161ca20bf4abf2a |     
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/7816b52f83c8035fa526d885b6f2961c3604dd2c | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/c169365cd25ff3f8371eaad62571ea60e42fa869 | ORPH
  powerpc    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/cdb563887ba7bea316a7bfe6ea356a4d6a2ee58c |     
 aarch64_be  | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/19884c4c48043ce274c393bb943cea1212dfb81c |     
 aarch64_be  | fs/ubi/ubi.mk:51: /home/tho... | NOK | http://autobuild.buildroot.net/results/650284654df7a0e1d5aa9d91ead95121a908a3dc |     
    or1k     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/deb134da57128cdaf08e3d10eda8e9c81e7d3e8d |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/50be9d50a17969f1a66b242b4a3534828b20909b |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/9773853ad2a4c42db2a732f7699017c5e922824c |     
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/b7c533e09c5d71b05d4d404d81937032fe339c13 |     
    or1k     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/d66ff969cfd972d594805963d8c6b31fdf7548b5 |     
   sh4eb     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/d26ecb614070b125b5e7e6b6e1604f06bf900e98 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/b58e92b389eac2cc30a0b0abb35dc1249d3fcd4b |     
 powerpc64   | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/9cfb9fbfa885ca65486eb91d241a5ae82d7565bc |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/1d4cf7555fceddb3c6eda043d5cfad897806820a |     
    arc      | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/4554f3b8c818322851e6438d1c1c656635ff5b4d |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/04291b1d7f03323e360e08a08ca652ad86e48d87 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/fb2ff2bb55bd809028039c01c83ac1a4245d5615 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/b4cd36953a4cb478c25817662767d3282be0753f | ORPH
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/6909c864dfb9a4949d489473f59fd072057932c1 |     
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/5da8861785283cfa3727a132f0d572769f579f86 | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/6512e3a1425bb67f59d822ac8a01cc57231c24d4 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/b0d5e8cb197ddd70c8a0503f4fe9e68041632d27 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/4a69f8ed65ba70c900a8adcc00a382a8d5c12d3f | ORPH
microblazeel |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/472411404fe926999744d7cb2e5678ac92b96e43 | ORPH
    sh4a     |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/b100e092d246a556423acdc22abc59fc6ddb74d8 |     
   nios2     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/62108af70da1dddb2d48948ec8278b348aa7a4e5 |     
   x86_64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/49f166a1835fb16a1530f8681b7b7776949d6588 |     
  sparc64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/f183f59fe9b99348dfc383f8208df97b8561ec20 |     
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/3c10231c3814ce6deae4235869a282a52659d1ec |     
    mips     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/71e987473de136398d7317ef661799093440fad3 |     
powerpc64le  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/2f7a08a40de323666218f759287f906b21e261cc |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/dbedf272d547bf940c9f5f88c5beb6070261e868 |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/253221f97ddaa6cebb256417f48dd481cdd12697 |     
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/662be673532f5b1ef2212293a98c16f33fe57fa9 |     
  riscv32    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/d9369598dedb9408bb412bfb15fecaaeb2c19b77 |     
    mips     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/26f34e66a80ee0052bddfff87ca656beb84677f6 |     
  riscv32    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/778dd061c62d0b4e856c3c9ee2fcc6dde1599be8 |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/47017654f3a44796756630f2894e66b1bceefdf7 |     
  aarch64    |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/33d17e0166a87bd4844ab27062a1969ef2a794ed |     
   mips64    |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/c45051a51d80c13d7bd88846dcb93e82b8dffde1 |     
   mips64    |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/bb03ec07db6a812c12aae9f537d756bea7d4994f |     
    i686     |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/654c6b1496cbb515c03f6de59fb9f5f9910ad7cd |     
    i586     |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/11b254657f0bb73dce9c4737aafa42f9f46b6951 |     
  mips64el   |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/84566213f46d14ea5764024ca159f95a82d1d5bd |     
 microblaze  |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/a4f1b335027527da65d39d05945722f6821339b2 |     
powerpc64le  |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/4ff5b24594871ae3f38b2d47631880e39ed7d885 |     
  sparc64    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/4366982c8248c98701432998f9e5d4d71f9ccccf |     
   x86_64    |        host-rust-1.68.0        | NOK | http://autobuild.buildroot.net/results/c646577043d1c9fd1b5002c47ee93c8b43bbaf14 |     
 powerpc64   |        host-rust-1.68.0        | NOK | http://autobuild.buildroot.net/results/d11ab4861256f901313e93477337818d41ef3c4a |     
   sh4aeb    |        host-zstd-1.5.4         | NOK | http://autobuild.buildroot.net/results/8e8ca3aa34f69d7e519bc001518fdd4e99fddeff |     
    m68k     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/6aad3041bf563f9d251e220a3fdedd83edd5fef5 |     
    or1k     |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/fed9c4c0d92078b5de4cde5d5474998fe947b4ab |     
  aarch64    | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/5ca4f649c06b7bf331ba6aa9d1bc05188e8bee52 | ORPH
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/f7c14ae1e94a21d93509c3ce89228009d52b16e5 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/a5bed1283b0936c5658f91e3e8fa82ce7b110d4f |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/0917df45987ee8d446f8ca1c09ef59e9d8332482 |     
  riscv64    |           libndp-1.8           | NOK | http://autobuild.buildroot.net/results/6007c201e8cb3a0daf76725202e029fb0f066b6e |     
   mips64    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/06c9ce43c9bd7d320f2f7a3f08de52d9827f5f34 | ORPH
powerpc64le  |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/6135913004d8d9785705d06b0bbcb2f1bcfe1fa6 | ORPH
   mipsel    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/b5597d691270c71f331c77c22cf397b2d37d7f39 | ORPH
  powerpc    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/2b3c852bfd405817d7d0a09b32997aaf40a6eb58 | ORPH
   mips64    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/8d35d8a793cf047aa671af1f8ac9db1319cd5385 | ORPH
   mipsel    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/32e973bc5c60ce7a4c365163149f1c380d5dce3a | ORPH
    mips     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/db07e0326471cc7d3e4fd6d5bb6b2ba20de6a92a | ORPH
   s390x     |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/e5704b6a98e90e2d3b1cbf9fa160b1cdb5ea4130 |     
  riscv32    |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/f5f8dd40ae8ae126cf039bfeaedb30263f0213a3 |     
    arc      |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/df4fd1b176c3156e92301a3cb1a3caf156d6e8be |     
    or1k     |        mosquitto-2.0.15        | NOK | http://autobuild.buildroot.net/results/4fd13d293b73dc44e8d11b11d11993b5a32e7fb1 |     
   armeb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/0bde7a388d01dd67363e1cb3c5af0d95197e49db |     
    sh4      |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/dabe5559f734188e62943dd1e44e1610ecbd929b | ORPH
   armeb     |           nut-2.8.0            | NOK | http://autobuild.buildroot.net/results/3feb1200734382581391f678f13ba3bbdd204917 |     
    arc      |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/1aab4f8ee627abdc162bad9896bcdbda56637f6d | ORPH
microblazeel |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/a89d2c7368759da255f8c9c6c6fb5a776b15c6f6 | ORPH
  mips64el   |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/1b1e5bbadb54ff0d4f9d51826997709d70dd798a | ORPH
   sparc     | package/rtl8821cu/rtl8821cu... | NOK | http://autobuild.buildroot.net/results/13b70987e1568fbe8fef5a405453a71febf2d639 |     
   mips64    |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/0742ec54bdb122998801ee42dac50ad92607180d |     
    mips     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/6e2e5b9236c74a68e20934a79c13977832f2dca3 |     
   armeb     |       python-rtoml-0.8.0       | NOK | http://autobuild.buildroot.net/results/c9d68b443c6f9ec599a6b30b0a31b9ccef44ff7e |     
 powerpc64   |           qemu-7.2.0           | NOK | http://autobuild.buildroot.net/results/eed0d5441fe5193cebe489f2ed2350d2b5226930 |     
   mipsel    |           qemu-7.2.0           | NOK | http://autobuild.buildroot.net/results/fa7d783c9f1d2c549edbedef7ccb4a371e9d23f5 |     
 microblaze  |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/e1940ddb65cdee478ec8e16b2c5e1b90f419c824 |     
 aarch64_be  | rtl8189fs-ed6741b52bc998875... | NOK | http://autobuild.buildroot.net/results/4624668e4000faa05f474a1c8d5a1747962adee5 |     
   sparc     | rtl8189fs-ed6741b52bc998875... | NOK | http://autobuild.buildroot.net/results/83dd32a56e123b4d959817220684e55b597ea00e |     
   arceb     |           ruby-3.1.3           | NOK | http://autobuild.buildroot.net/results/764ec4eff5c57ad03700d2479f97a6f909ff6174 |     
   arceb     |           ruby-3.1.3           | NOK | http://autobuild.buildroot.net/results/c36004f5f0ee113da932185921dc369c8af3f73a |     
   arceb     |          snmppp-3.5.0          | NOK | http://autobuild.buildroot.net/results/2d82376764a6a62d6d1ea8ddeac0138ea775c976 |     
    arc      |          snmppp-3.5.0          | NOK | http://autobuild.buildroot.net/results/2945cb0b74cd3ab96bd05053b7a3a3dfe0d4f67e |     
    mips     |          snmppp-3.5.0          | NOK | http://autobuild.buildroot.net/results/9be36a94195b5248f472e6088a80f8d0f98190e7 |     
    or1k     |      tesseract-ocr-5.0.1       | NOK | http://autobuild.buildroot.net/results/c26967d784fb5edb327e72cdf1ddf2ebe1889cd5 |     
    or1k     |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/9b4f31c0eaa82a9af62f30e37406b395d6166560 | ORPH
   x86_64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/27953db2e2527ddf0f5d21c048cfd231340329be |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/6e2e120bc67bd3b4c60f952ac5688b9f50b0745b |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/03b9720592b9e0b9d32252ab503a5b4a35fe4b7d |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/fa29b281d27f1b674189255eeb5096bea16f6c15 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/c147cb48f67ff6cf926d494d2e26e9b00bd016c6 |     
   sparc     |      v4l2loopback-0.12.7       | NOK | http://autobuild.buildroot.net/results/dd0a29ddd94ac726027ab68e0e407eafc43cab27 |     
    i686     |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/2da5663c05b9f62c6e65cbea5dbaceede8f27e7e | ORPH
  mips64el   |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/06623d3127730b0c124559f430adb0e463320bf0 | ORPH
  mips64el   |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/d59e23207f68b236d86f22943223d9846c1a8d52 | ORPH
    mips     |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/4eaa2f17523ab80c2175ae136688e64452e9eb65 | ORPH
 aarch64_be  | wireguard-linux-compat-1.0.... | NOK | http://autobuild.buildroot.net/results/663dcaea406276bc95705e6070fff02ed9e0ea44 |     
    mips     |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/6ad55af43a4f1f2c4424ee9a42d90ab68cf70443 |     
    i586     | x264-baee400fa9ced6f5481a72... | NOK | http://autobuild.buildroot.net/results/c790c7979ba32d681278974ce197e85ee9cfed5a |     
    arm      |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/1507cfacc736e89984560a0c6134ab3a5bdd284b | ORPH


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                acpitool-0.5.1 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/romfs/romfs.mk:32: /home... | 1 
fs/ubi/ubi.mk:51: /home/tho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
glibc-2.36-81-g4f4d7a13edfd... | 1 
            host-binutils-2.37 | 1 
             host-delve-1.20.0 | 1 
               host-qemu-7.2.0 | 1 
              host-rust-1.67.0 | 1 
               libvorbis-1.3.7 | 1 
            quickjs-2021-03-27 | 1 
                       unknown | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |         acpitool-0.5.1         | NOK | http://autobuild.buildroot.net/results/2dc03ec5980e6b8fb9a0f299e10e10dc9efde9ea |     
  sparc64    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/c29713d5cba20c090bc5412b469c065f1476298a |     
   s390x     | fs/romfs/romfs.mk:32: /home... | NOK | http://autobuild.buildroot.net/results/6c375f196d73b57505ddf17e31f926fbfcab721b |     
  riscv32    | fs/ubi/ubi.mk:51: /home/tho... | NOK | http://autobuild.buildroot.net/results/d4f1fa1f5b7247b849e621e5371861eb2c7ec9eb |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/3cc6e74e4c2d79c896cb804d8acd16d3c3842f90 |     
   mipsel    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/3102b82d753da1ba3f888325c3f3c964011f93ca |     
    arc      | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/998ffbd06d83f86c73f478aced1bd02d85a5f76f |     
powerpc64le  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/5203b9898fb6edd4f430df6a5b53df49403b95e9 |     
   x86_64    |       host-delve-1.20.0        | NOK | http://autobuild.buildroot.net/results/26a4552bd92afd8f154d61cdb9cce2b619bc8d35 |     
   nios2     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/6f4df0b09cebbbbc5a6ec55311b5a1c831a7be3e |     
   mipsel    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/bbbb2645c063cc0b9223439fb71008a88c8508bc |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/0d3220b6fb07b7afcad7d2cf943525dad3c677a8 |     
    sh4      |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/9c39b2a0f2f18dda05d1bb5a8ed256c2c1c10491 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/79c36b9a0e48ab9a182196f3c937b5f321287ea0 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
