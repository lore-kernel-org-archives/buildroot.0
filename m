Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE80BC3A5A7
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 07:00:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17FBC81A15;
	Thu,  8 Dec 2022 07:00:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17FBC81A15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aX7l00XLQ0O9; Thu,  8 Dec 2022 07:00:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D5E881DF7;
	Thu,  8 Dec 2022 07:00:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D5E881DF7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 299431BF44C
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 07:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E202A60B8E
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 07:00:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E202A60B8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KS9mhxQRC_nz for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 07:00:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F004E60B36
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F004E60B36
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 07:00:37 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C9EE240003
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 07:00:35 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 08 Dec 2022 07:00:35 -0000
Message-Id: <20221208070040.E202A60B8E@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1670482835; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qOc4DmlVNU4ZgK9qtpnUira/AS03SLkgpMUGUkhizOU=;
 b=Y4nUDvKHx9YH89zL9QCahbr1mmWe7HIMT4UnP5/UWR2qjr2QDgCy8UMwsXtmLOUbdu4JPH
 ZLxQthFVJgRKQDh/wzVAYdZuXz2j6jeOQto/oKC87eqR+VX9LRYb+Ui4ZCoQFu7rapG3Oe
 ebPlRVIVvZzcD09BP+a31yniuZ5Ssf6zVrGXrQmdWZthDVfgpas/F2MfFTvKtQXgYppTP5
 Gg+DAWdENeHwVyhrOvYbLoXS5hMZvbsD2bbFlvxBTt8fI0O62nb/gwFycSp2MmwM99yCQi
 WMx/5JvvtKaO9ewmlYArHYBg9HcDB1CqtXuWp06dxQeouxzFJnvKtA0pVMewkQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Y4nUDvKH
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-12-07
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

Autobuild statistics for 2022-12-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  2  |  5  |  0  |  7  |
  2022.08.x  | 15  | 13  |  0  | 28  |
    master   | 232 | 260 |  1  | 493 |

Classification of failures by reason for master
-----------------------------------------------

                   aubio-0.4.9 | 38
                  sscep-0.10.0 | 11
                   linux-6.0.9 | 9 
                    norm-1.5.8 | 9 
              host-pahole-1.24 | 8 
                      xz-5.2.7 | 7 
                elfutils-0.186 | 6 
  gobject-introspection-1.72.0 | 6 
            host-binutils-2.38 | 6 
                host-go-1.19.3 | 6 
    host-python-greenlet-2.0.0 | 6 
            host-binutils-2.39 | 5 
              host-rust-1.65.0 | 5 
                  jack2-1.9.21 | 5 
            python-bunch-1.0.1 | 5 
                     frr-8.3.1 | 4 
                gerbera-1.10.0 | 4 
glibc-2.36-66-ga1dc0be03c9d... | 4 
              libgcrypt-1.10.1 | 4 
                tealdeer-1.6.1 | 4 
                       unknown | 4 
                 wolfssl-5.5.3 | 4 
                libdnet-1.16.1 | 3 
               libglib2-2.72.3 | 3 
             libgpg-error-1.45 | 3 
                libkcapi-1.4.0 | 3 
           python-numpy-1.23.4 | 3 
                     ace-7.0.6 | 2 
                  acpid-2.0.34 | 2 
                  exempi-2.6.1 | 2 
    host-python-maturin-0.14.1 | 2 
      intel-mediadriver-22.6.3 | 2 
                  kexec-2.0.25 | 2 
                   libnss-3.85 | 2 
             lirc-tools-0.10.2 | 2 
                  mender-3.4.0 | 2 
                  netsurf-3.10 | 2 
              open62541-v1.3.3 | 2 
                 openssh-9.1p1 | 2 
                    php-8.1.12 | 2 
         python-greenlet-2.0.0 | 2 
ulog-0389d243352255f6182326... | 2 
           v4l2loopback-0.12.7 | 2 
android-tools-4.2.2+git2013... | 1 
azure-iot-sdk-c-LTS_07_2022... | 1 
                    bat-0.19.0 | 1 
                 dc3dd-7.2.641 | 1 
              dropbear-2022.83 | 1 
        edk2-edk2-stable202208 | 1 
                     efivar-38 | 1 
              erlang-22.3.4.22 | 1 
                     file-5.43 | 1 
       freeradius-client-1.1.7 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/romfs/romfs.mk:32: /home... | 1 
fs/ubi/ubi.mk:51: /tmp/inst... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
          gitlab-runner-15.5.0 | 1 
             gnuradio-3.10.4.0 | 1 
         gobject-introspection | 1 
google-breakpad-c85eb4a59b6... | 1 
     host-moby-buildkit-0.10.0 | 1 
                ipmiutil-3.1.8 | 1 
                       kmod-30 | 1 
               libcap-ng-0.8.3 | 1 
                    libev-4.33 | 1 
               libgtk3-3.24.35 | 1 
                libmad-0.15.1b | 1 
               lighttpd-1.4.67 | 1 
          linux-5.10.145-cip17 | 1 
      linux-5.10.145-cip17-rt7 | 1 
                   linux-tools | 1 
               lpc32xxcdl-2.11 | 1 
        ltp-testsuite-20220930 | 1 
                   luvi-2.13.0 | 1 
                mongodb-4.2.18 | 1 
              mosquitto-2.0.15 | 1 
                    mpir-3.0.0 | 1 
             netsniff-ng-0.6.8 | 1 
                  ntpsec-1_2_1 | 1 
            ocf-linux-20171122 | 1 
   openvmtools-11.3.5-18557794 | 1 
pistache-3ec9d7c4f8b828fdd3... | 1 
                proftpd-1.3.6e | 1 
           proxychains-ng-4.16 | 1 
    python-cryptography-38.0.3 | 1 
           python-pyicu-2.10.2 | 1 
                 qt6base-6.4.0 | 1 
            quickjs-2021-03-27 | 1 
                    sdl-1.2.15 | 1 
toolchain-external-codescap... | 1 
              traceroute-2.1.0 | 1 
                 uclibc-1.0.42 | 1 
               valgrind-3.19.0 | 1 
                wtfutil-0.41.0 | 1 
                       zip-3.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/74f9bc7d25575d319873c282effe85375c88b638 |     
    i686     |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/1e1f6c65294d05f8e77fea6846011ad2dae5511d |     
   mips64    |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/c4cd666a521569a7a047ffe1f3e6a0e5012b2f16 | ORPH
  mips64el   |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/1275587338170fc8fea0f127061041ad22532848 | ORPH
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/1a5e734c49ad8402bb42bfcb3b1cb27c156b2bd7 |     
powerpc64le  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/29af6d0bf18b640f62bdbe85d382b2f462cae2eb |     
   armeb     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/0d573e56831bc358193fac47e780152bacae4ccf |     
 aarch64_be  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/118d39ba36561107e55a89f26871744f917188bb |     
  riscv32    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/011cef84ba5e744ef87cee1efd39e642be581205 |     
   x86_64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/0197c17959f9b281f880b8ba41ce11008fa7bb27 |     
  riscv32    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/8c78a4898a50a07a803f6f9f05743ea6106476e6 |     
   s390x     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/300001f31ce688e25d09b1d78fd2b5cd072db469 |     
microblazeel |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/a2df53cd9ac46541a0c0953b2f2128fa28743086 |     
  aarch64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/39c2b58af365f8225fa0f98996745af250df34e5 |     
   mips64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/6f68e78d6c0311941e0e5b1ab2528b13b54d7131 |     
    mips     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/29ae6bb2da6e4d6bfcbf1db1834a5b98687c13fb |     
   mipsel    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/58d532c441ba8268f9b94787691a6deb19c20d48 |     
 microblaze  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/eb5f49c614f7d43ccbfd831ceac8855558d22c3f |     
  sparc64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/aa2712d910127227b180ae0933568e264fe9f90b |     
powerpc64le  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/02d4cc3cd9a4ace7d45115273165fe8d6b846883 |     
    sh4      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/c076dec210637ff8f453faef3bc9262a96018bcb |     
 aarch64_be  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/077e12759b83a50d1e548aac05a4d71bed5681d6 |     
powerpc64le  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/93382c08ebdf31027ca2a28b7a85f900f6034450 |     
   sparc     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/0f35ba1c7d8289eafd5c3427bc587d9e35790e39 |     
  mips64el   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/698f09afb3b6b165be47e7296549011657209525 |     
    i686     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/b470e69b4d4c20dc9984dc8275615705becff31c |     
    mips     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/b7712072f8400894bef1972e4a5f5bfb1eb94150 |     
    sh4a     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/fdf07e5dc975327549fbf1fc7b4457ed4966c36b |     
 aarch64_be  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/3de3d9769658e4e224960e152c805c15623b35a9 |     
   armeb     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/f15fbf98b61916ec9cf8bb4db61f4ec9151bd81b |     
powerpc64le  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/4fe486388718661277c01ba66a4bcbbb5dbce817 |     
 aarch64_be  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/4f2c342111158b1116526dd614da222ba30eee6b |     
   s390x     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/e182015d76612fde54c73dbaedf8ec5915ec7345 |     
  mips64el   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/d35296ea7fd452650167fcd18b0c8918aa05b4c7 |     
   s390x     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/32c086036696992264eaf85130fca4e156046126 |     
  mips64el   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/61d44ba3b09bb6652679397acc8d5fcaf220526a |     
   nios2     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/df0932b645a14a31b7277f9fb0b502680755c1cb |     
 aarch64_be  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/b03e64276621d79bf67e4fc13b428c5125670a8c |     
    i686     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/b868229fa664ac8b04736110f693ebb009deb8f0 |     
powerpc64le  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/babd6550cdc26c4d7642635bdbc8396b5b92fea0 |     
    i586     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/64e488622b2335549080f070e936fe92e7cba643 |     
  riscv32    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/795faa3ef88cf2bc40c52abfaa379e03301e447b |     
microblazeel |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/aa5122a78ec67984042d57731ec8d6cdda87c6f3 |     
    arm      | azure-iot-sdk-c-LTS_07_2022... | NOK | http://autobuild.buildroot.net/results/baf6a292894a28b6ad2ebc9fa85a4b9474af0f71 |     
   x86_64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/895ea42e50558765760272b3a97a18919f668b11 |     
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/f7c4b26f8ca08d1a709fe29e0cba53410517858c | ORPH
  riscv64    |        dropbear-2022.83        | NOK | http://autobuild.buildroot.net/results/a22cd30bfe6db114a8fb085f9df96b5755fd1653 |     
  aarch64    |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/6387a3890ee89199c3f2c4eefb1bb716d92009cb |     
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/398f3d8e429c111fe26bce0813f4a8e202da9d43 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/453fd2de947a0f3bdf43b5fd95ddf807c11e3480 | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/a19a097f22793d754bad4c1833c0bb232970695c | ORPH
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/9d3ab300bdd379261d330f450ca342f114427e0f | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/46972c78dcab7269d58886972e16fe048cd4411c | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/50db311aa56a31447eb0b29718dd722b60998b91 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/969e9d78adbdf1efcf84b70d569667128895e5e8 | ORPH
   x86_64    |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/52640d150f5d55c59bb9a4ff6affa56d37757cb7 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/b4dc5a5408e229412dfd91cea6f80fde6f4a61cb |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/1e3615f0449ebef8dda3b224d6e5059865b24d20 |     
    arm      |           file-5.43            | NOK | http://autobuild.buildroot.net/results/8b52d67d6efe0556a78d8634b74e573fd7da9bc1 | ORPH
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/bec050e991e7d1f58931c5c785ef7701d989d575 |     
    arc      |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/a6adacab775313ac650f1463745df1e1809b3628 |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/3d6bb4cc611d07304fd8825d8b51ea4fcc1cf744 |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/dcc3f31308bd66a6a28fa002c6a312c4491a2481 |     
   xtensa    |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/06eb67ec14a7a693142b68647ad0bb31b59df808 |     
    mips     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/b98110033487a539684f068b267c1a68ad259641 |     
powerpc64le  | fs/romfs/romfs.mk:32: /home... | NOK | http://autobuild.buildroot.net/results/c32b96c5a92baa6f8e1bb1d7139eb50fe53c2e40 |     
   s390x     | fs/ubi/ubi.mk:51: /tmp/inst... | NOK | http://autobuild.buildroot.net/results/1d57da907a7a0d836a157e7c4c142bb78563b8eb |     
    arc      | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/5ad86113b0deee6f08513b50107b97e4037ed778 |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/7f9fde0836fe170da262cea67adae8d6b838cdb7 |     
   sparc     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/b424ee7cb15c21ab70db100ab5db720b93d39f24 |     
powerpc64le  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/0d318a0f6026e76323978a0e3598c4017aae8ea2 |     
  riscv32    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/88322433a0126caaa3c3dde86053291c355a6071 |     
    i686     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/26f3ca6e5943c54aff5a8fb3b670b100a608c7b1 |     
   s390x     |      gitlab-runner-15.5.0      | NOK | http://autobuild.buildroot.net/results/79330844bf483d831a9d15093989d11a1f10be38 |     
powerpc64le  | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/d01a8ca9c7b0075037c973b59c3f019d8ed9827c |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/739336f789ab04c385db562f4e74d22dee74449c |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/00dcd71079834c7e714e50eadb146b76d73aef89 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/9fcbe218fd32559e6707c1c8de2ce827c17b9290 |     
    arm      |       gnuradio-3.10.4.0        | NOK | http://autobuild.buildroot.net/results/09a16b74b5f314dcb04801c5fff9602f40dcdb31 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/db356474dfbb62a62c32f1e3d95e857e80da5808 |     
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/2a93ac846073fa0d88766310de8ccc283cc115df | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/7219ce65d03de2f9c780e4a1ae1532842b46e646 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/5fec624ac03ee407c625fd81956a028a0d5c0955 | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/98434944e2245b2dab4b5c96c3a2bebc537d132c | ORPH
    mips     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/b42f6394f1166875ace8a136a7673bc03c97ae8c | ORPH
    i686     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/b2c2ed7f20c5000411a6ccf77a9a358ed3c3340f | ORPH
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/cd6ddb1415125fa9408826329b92546ccfd923b6 |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/9d520a397dc3f54b57a904c49f59ef82c3f79796 |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/2a323146d6db26300bbb9a0a2fe4434def4394e4 |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ef02da358ba9c5656353bf28d35b0e2dca5d03c8 |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/8ac765d6bbaee9d29588a6619132b36d56db6fb9 |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/5f618ee95057073721bf1361c0aa82b9b4205a6b |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/5e38027d73af6f74f5642e13882eb6e1fd612138 |     
   armeb     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/deb9ad1b1f586ed0197d508f9c7a8721b3655c14 |     
   nios2     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/c9b3db5a5514d4c635104b82e3efb01253ab1549 |     
  sparc64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/5e497469203b9070e1104558769552b891fc1c0c |     
 powerpc64   |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/180bd1cb8fec5765542a8c8e88a92949d56e041e |     
   armeb     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/c1e250ceb913b325e7fd2ef89743789eeddbe5e4 |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/88a3c8b3974d9cd9c8dfcc0fc2059f3c4e4e9cd3 |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/f5b35f81bab90a488d4695b6b1dec8def8df1b1c |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/0b08871e3a58fe022c2e30a3c993e7ff5cbb7fd4 |     
  aarch64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/65ff2c19c5f5e3fc90b7a0d53a813fadc653fd86 |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/ff7fcff85c0af5ffe5f1b0c511b49841dac38245 |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/d7a35f38e3ab541c3514568e90336ff7be008bb3 |     
  riscv64    |   host-moby-buildkit-0.10.0    | NOK | http://autobuild.buildroot.net/results/51859a5b9fbb10d07b9d9fe888093f850b828ebd |     
  mips64el   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/607f68f261a63bdfb60d4a06a52fe0984961a3a0 |     
    arm      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/bcfbacc93ccaaedfe148abdbfc52ef952b6fed8e |     
 powerpc64   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/71fa575fc26a6deb0f0a53b169df7082335236c1 |     
    arm      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/273bc90c53c989b117c4fcb5c8a76c782671fcf6 |     
    arm      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/e1aa182514988fb47fdb8f9f84434810bf295aa0 |     
   armeb     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/2cbd1062a36244f3c67e30dd0f41afe8942bb1f8 |     
    sh4a     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/012dfbe2adcf37da7095bd94331165564a7754c1 |     
  powerpc    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/939d2dc1d9a6e3b8de994a0104de42567600e6cf |     
 powerpc64   |   host-python-greenlet-2.0.0   | NOK | http://autobuild.buildroot.net/results/54b648dac028149ab9e806e0e5c4712b8ad09c20 |     
    sh4      |   host-python-greenlet-2.0.0   | NOK | http://autobuild.buildroot.net/results/c0d73715b7e40f6c8868b351294aecedfea26c5e |     
    arc      |   host-python-greenlet-2.0.0   | NOK | http://autobuild.buildroot.net/results/857a4f71345addac1c931f4a98879be1850b8d8f |     
    arm      |   host-python-greenlet-2.0.0   | NOK | http://autobuild.buildroot.net/results/4144bcecfd2f5ee92b06f65524abcc202d005173 |     
  riscv32    |   host-python-greenlet-2.0.0   | NOK | http://autobuild.buildroot.net/results/07a338d36831f966d0eb7448a2a7a3a8beb2b98a |     
   s390x     |   host-python-greenlet-2.0.0   | NOK | http://autobuild.buildroot.net/results/028d7907b26fccc83b53c6719b30d49cd79b025e |     
  aarch64    |   host-python-maturin-0.14.1   | NOK | http://autobuild.buildroot.net/results/fd263248b1565332df614c8e58c602859d9fed3c |     
  sparc64    |   host-python-maturin-0.14.1   | NOK | http://autobuild.buildroot.net/results/65d1e3602077bf86898aa48bdce9b24847e9f009 |     
    i686     |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/3c4031e944ceacebb068c9d18ecd1878b7400b98 |     
  sparc64    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/775fb12fd4321ce424885c0aa8bd68478996c8ae |     
   x86_64    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/57fac6d49c2763ea344209092b085c8c0f1ada39 |     
    arm      |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/8f90db98f9c58e601a0c09afd2b3296b4d360844 |     
  sparc64    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/cca8b9fbb95e1ed1748e020792da58217d5e936a |     
   x86_64    |    intel-mediadriver-22.6.3    | NOK | http://autobuild.buildroot.net/results/fa15db52540dace758e2f01ecd210dab0095889f |     
   x86_64    |    intel-mediadriver-22.6.3    | NOK | http://autobuild.buildroot.net/results/52c8f5352b16ced4e85286950f95e1b57c564fa5 |     
    i686     |         ipmiutil-3.1.8         | NOK | http://autobuild.buildroot.net/results/f8dfc19382d733b30dd6f89f58c585f8eccd485b |     
   x86_64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/e7c14e544e37323df466dc695a1164f944ba4a46 |     
    or1k     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/8343ce1f0f3e8c5cdbcc56d91e9851f9f1efc1a3 |     
   x86_64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/13c0d81265d542b9f843afcb860b961d71869da7 |     
powerpc64le  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/285c44402b430893df53954b414ae17f3a313a27 |     
   mipsel    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/ec4460760da4c04bdc1006aa76b5a31092883c82 |     
   armeb     |          kexec-2.0.25          | NOK | http://autobuild.buildroot.net/results/1be6b14ce9ed1127f6bb762af450be56944a4303 | ORPH
    arm      |          kexec-2.0.25          | NOK | http://autobuild.buildroot.net/results/9ccd4532cc47cbc642f066926452740d3ce77d64 | ORPH
   xtensa    |            kmod-30             | NOK | http://autobuild.buildroot.net/results/b63ea028bf2cac1a7d23705eab07a22eb39ea7e9 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/19e35ae1b8da8a9f3f5d560768ebd349c2a4cb6e |     
  riscv32    |         libdnet-1.16.1         | NOK | http://autobuild.buildroot.net/results/a760cc76b8c24fca3de998e0947fc7f7d3f0f77c | ORPH
    or1k     |         libdnet-1.16.1         | NOK | http://autobuild.buildroot.net/results/d97c03ac06f4c048b3f1d2df3f9057ba0ecd2a79 | ORPH
  riscv64    |         libdnet-1.16.1         | NOK | http://autobuild.buildroot.net/results/cdf3fa470ec44aff4a735a7bfc7c2f61d7e48c20 | ORPH
   armeb     |           libev-4.33           | NOK | http://autobuild.buildroot.net/results/709518050d4801a866ab572e18929cd28b609eb0 | ORPH
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/7c0f5d1b8008f24cb98899b8ef57dec966527ebb | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/ae373df35e3e3987832440ebfc5d81da6a7c6ebf | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/c8b5dde6c991e503968f9ed739598a5edfec1f42 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/35889504d0fd8e1678c02b9c9cc86a75aa0393a0 | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/a5bb2ff234151aac12fd8fe5287363d0473cfdb8 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/38eac147d8d135d23147e8770e7280e95ae48e8a |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/d49a7dd54e2b2c90db92590def171dfcfdac96d7 |     
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/3015e2002cb3b1b11429a676e9d56f397b33708c | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/9aea97cf3a8c4e254fae37c882df25318442fcd8 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/b22f57b1ee1a73aa4b14588eb1d3863c541d00e5 | ORPH
   x86_64    |        libgtk3-3.24.35         | NOK | http://autobuild.buildroot.net/results/ba468a06a3dc8d221fccac0ea56fb0313face5d5 |     
microblazeel |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/66e082bc82dc05d45e525b5e1e189ea8114fb0af |     
 microblaze  |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/8bcb41b217ae1682e90128d684b629267fa04983 |     
 microblaze  |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/db1011472a3e79d25fe75a7287dbdaf0e93d16a5 |     
    arm      |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/18d27f7f4f0eb038cf6007f65ec0677ed05c48b3 | ORPH
    arm      |          libnss-3.85           | NOK | http://autobuild.buildroot.net/results/5ec536e443cf47f0e90dcc7e4ba12cd3f5fd46dc |     
    i686     |          libnss-3.85           | NOK | http://autobuild.buildroot.net/results/cf7b75cb5f6b2b1564d81d96cde2a2e229daf6f5 |     
   arceb     |        lighttpd-1.4.67         | NOK | http://autobuild.buildroot.net/results/f9fa932afd4e2b1faa49d6184ff634dfaafa9b5e |     
   mipsel    |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/4c97e26adb7ff72815b40c44f989398e69d55add | ORPH
    sh4a     |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/3421630759e15c4ea64609d8c125032bedd3f3ee | ORPH
   arceb     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/702c38172bfc442d7159b8037d3564b92929f61c | ORPH
    mips     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/9b90b37689ab9c538ed865658f605b0748cdaa69 | ORPH
   s390x     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/ab5fbb9bfa9c6f7b5240ffc52536629500650b61 | ORPH
  powerpc    |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/9df35f8d922aded2c8d43fff70f64a98b19fc33c | ORPH
    mips     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/d0aa44ab6b8c285e842768d620356184cb3b69d0 | ORPH
    m68k     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/fad66719623c8cdb3dab8ce5e278e704397682c8 | ORPH
   arceb     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/5113b4b567543cf045deeeac1f504840d54b3e91 | ORPH
   s390x     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/ce48fe6961affc637ca9ca4c7ce91e2deb6dd88d | ORPH
   mipsel    |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/ede01df95698937b7f58c68962c2a0fa207a0a11 | ORPH
    i686     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/1270b9d4b90a278692f2852ea5337ca7d02d7139 | ORPH
  sparc64    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/633dd47711057e550e5d8838b701f60bd815d821 | ORPH
    mips     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/7b335de95b0f441af56340af9797681d5010cee0 | ORPH
   armeb     |        lpc32xxcdl-2.11         | NOK | http://autobuild.buildroot.net/results/15b9f572e0263dcc547d09433ebb7d02f7e9b92c | ORPH
   sh4aeb    |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/7adfdf731f7fda7d22369d3aac17fb43a58809ed |     
 aarch64_be  |          luvi-2.13.0           | NOK | http://autobuild.buildroot.net/results/bdbccd4dc2a986b8c60a0e311ed41ed2002e1c5f | ORPH
    arm      |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/312abbb1be1b12a00c81a05a7b3356811fdd1882 |     
  aarch64    |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/e32b2fd1c9f1a161e391f5b5d5e185c6f8613958 |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/a455856e29e3b935cd978719efcff22700fa65ad |     
    or1k     |        mosquitto-2.0.15        | NOK | http://autobuild.buildroot.net/results/c405cb6235ffd6968fc0f24b0bbba74867816312 |     
   armeb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/adfd165bd55d067b41cb3eb3e497c2a35a3258e2 |     
  sparc64    |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/775b5c416413cdfc0ab22c1fa878559024d387b6 |     
    mips     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/18a6d32a390a65f62eb93801db2037008f095977 |     
   s390x     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/f8525c221bdbffd2faef3dc0b33094bb0dbc2408 |     
powerpc64le  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/842f51658efd638f160b3b22e8e08faf22bcbecc | ORPH
  riscv32    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/8b3f26e2c334501b85dc1fbc98ddf463d7347667 | ORPH
   nios2     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/527cdbc8cc54c8e2e1b47c6c0fd9e222cc3c9a31 | ORPH
    or1k     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/ef0e0a8acb9f0e274e9453317f66c5e30d584049 | ORPH
    arc      |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/c46081c73488e1339afc2d367c832550b06ea6f3 | ORPH
  sparc64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/51060289658731cb72efad851d6ff0d3464b1575 | ORPH
    arm      |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/ee7415570afb028c78560c40749aabfebae09b85 | ORPH
   sparc     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/3d678a8dc054488a2d173b06fa2b2e6935b61f3e | ORPH
   x86_64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/af1a07866232cbaa81c617cc3c66b448fbb22c2e | ORPH
    i586     |          ntpsec-1_2_1          | NOK | http://autobuild.buildroot.net/results/62be818e2f2eac07b4a2de6f4a8898cc4cc05b1f | ORPH
 powerpc64   |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/8877b2520e2610945c1045b02c989e8c116fd9d0 | ORPH
  sparc64    |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/1938f3e95f775536914de78598b975e0f30f4ab3 | ORPH
    arm      |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/df2394eb67fc661a24002423071a5733e97bb235 | ORPH
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/e1df97f2cc3421a4401a1b73f3014cc5b586ac03 | ORPH
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/5e7bdd489f730a91c6b2b48896ca837c7781c09c | ORPH
    i586     |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/61b03301bc36247c75e797fb294ec7f96bce6e22 |     
   armeb     |           php-8.1.12           | NOK | http://autobuild.buildroot.net/results/f8bf5042395e5040456e5e8f97cdea24c67081a1 |     
microblazeel |           php-8.1.12           | NOK | http://autobuild.buildroot.net/results/5494151515b3b7031bcf59ff227a75c2ef8e7e6a |     
    m68k     | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/1ea51a625002667b76c11887cd74aba2e1eadea6 | ORPH
   arceb     |         proftpd-1.3.6e         | NOK | http://autobuild.buildroot.net/results/6762f831f90dfd01d052d614cd17c014f7887fc3 |     
 aarch64_be  |      proxychains-ng-4.16       | NOK | http://autobuild.buildroot.net/results/1682832ee44f120ef9350a17ebcdf8fb74a3f54b | ORPH
   arceb     |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/8624e237d0db60fa5220c96e4be23e2bf4fda013 |     
   x86_64    |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/2ba72fc9837605a36ea63bbd3e6e181a40cdf360 |     
  aarch64    |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/e1d139527a1b7af221e5352e1df8fd1cfad2fa8a |     
   nios2     |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/dde603240447cdf875ee92e2f44c45a017b40d2f |     
  powerpc    |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/4e52ff6b04fcbece54636a4afbe455e74b1c600f |     
   x86_64    |   python-cryptography-38.0.3   | NOK | http://autobuild.buildroot.net/results/4cd36c7d5ac5bc8976ed083a4fe9948db7c6d114 |     
   armeb     |     python-greenlet-2.0.0      | NOK | http://autobuild.buildroot.net/results/6161dde62387513d15dc7da4bf07e5ae1b98b3ad |     
    arm      |     python-greenlet-2.0.0      | NOK | http://autobuild.buildroot.net/results/270389a72f3f70f85084b20c2a4c242e27d6f362 |     
    i686     |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/d0835ef8b909968b5477e4b81e634cfddcdc2df4 |     
   mipsel    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/5b4c85cfe05154e38c97f193fbe7841e008bd334 |     
    arm      |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/4046d75662eac76205fb35e4a152f57f21b8f383 |     
microblazeel |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/d1fbc783732f1c866e2ec89a72c46055ff27248a |     
 aarch64_be  |         qt6base-6.4.0          | NOK | http://autobuild.buildroot.net/results/8964406f2eee861dfb39af214e5f21831da7ae2e |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/05a7d62aab213f3dd78474823fa770bf6abb1f7e |     
    sh4      |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/d3d6e2e137624f7887b2c9b004f0c299e4d5c257 | ORPH
    arc      |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/e20235140373fe337c949f305508675989788056 |     
    arm      |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/f572914d5b81ca2142955754ad94b80eefd0f603 |     
   mipsel    |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/9c514b39309ea9305332c263ed6faf34f70c6018 |     
    arm      |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/d256b794b261ed8b14f45c452400897bb77c1fa0 |     
   s390x     |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/3a9fc652c2ec028aa43cc9901babf41f646023a5 |     
  sparc64    |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/354e7e3f7f475cf72c913222a83af0357308ed1d |     
microblazeel |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/a88df178f577216b901070d7f4d3e4536c223e19 |     
   xtensa    |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/a7c40c8c1421bbac399db78dac00c8f0fdbe200b |     
 aarch64_be  |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/54cdc1fb70ef83d584e60b3749f89ddf966d6370 |     
 microblaze  |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/31eb8e34d436abe400c66cc6787e069762f2fd28 |     
microblazeel |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/f96af4202af81af217822be910e2be9f4cc4d3f1 |     
   s390x     |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/1a5b2ae8e84c46b5a8c471a1edd2f2fdbd5dd8be |     
    arm      |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/7a9b8bb446faa032accff9b79b4d2ac2ea1f44d1 |     
  sparc64    |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/d43f0a746bf4d0fabbdb03aafa7a4cb3ea46c83e |     
   s390x     |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/843b371b2b9a527b1248af9854b25e012c1c8248 |     
   mipsel    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/f3222b1a94f7c4c65149bc168be71bc22de61c0f | ORPH
microblazeel |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/a2cac235afb49a05f3572593cedb76802211fada |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/09903617a3e5bb5e5ca233180b65fb35d3fd28d1 |     
powerpc64le  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/428ae6d0aef9a734608321277d43e63f1bacdacb |     
   s390x     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/7c3465f45b107afc0292ce6c010d7d8cd726c235 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/806a886534fd222110ae5f24524489a431825a84 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/e8eb377e93e361bfbffcf6332e08ba08040f6cf4 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/cfb9e368f5377fb01e50df9d5055d4f725a83617 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/df578ddf640abe0ab0af5968a3e22b88da6b0403 |     
  sparc64    |      v4l2loopback-0.12.7       | NOK | http://autobuild.buildroot.net/results/aa0b230bdd92afcc1099281a957ac8ea648c152a |     
   sparc     |      v4l2loopback-0.12.7       | NOK | http://autobuild.buildroot.net/results/83874989fe0e0277b3ac4f80904638732dcc818a |     
   mips64    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/2c71f4a26baf629efdf8d8d9da2309bdd4aacaad | ORPH
  mips64el   |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/85e625643a89fa5c4fffc5a3eac1a3ceb6f983b0 |     
  riscv32    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/e2ffbbc4308fe1f7713f134de7b8d0099b0d1608 |     
    mips     |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/0ade97569aade8debbf011aedc8a57118ee68ebb |     
   armeb     |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/576377fddcc9d55ef8ce7097030ab74f1ab3f060 |     
    i686     |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/1ac80ace07e80216b8f91103d9368e1f21d0f07e |     
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/619ff54e2fb0f0a8e468367c90aa91e88c471d24 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/11b3da2a9f622e1b331d37dfb0252de209e44ab1 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/1476db2d34788254bf718ba6628f6e0759d1d979 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/30928f4e0603263ca39c6d14d0db8e147874b4a2 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/18163a0eb59bdf8a335724cfd24e93342cade25f | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/5c40853b35252430023e13ac071f06014cedb336 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/c7fa751ece50ec77645c030a2f54d8cddf5337aa | ORPH
   armeb     |            zip-3.0             | NOK | http://autobuild.buildroot.net/results/367c04266ee38860ec3b7185e7b1e424d384cb18 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                     xterm-376 | 2 
                       frr-8.1 | 1 
            igd2-for-linux-2.1 | 1 
                nodejs-14.20.1 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/ee2a0517c3ace6411307e3af71ee5a186054cd8e |     
    arm      |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/44286182afc90e6878dfc573c964f94a1342960c |     
   mipsel    |         nodejs-14.20.1         | NOK | http://autobuild.buildroot.net/results/850b8f5e628f352bdb7d4747d75547b90a0cbe92 |     
   xtensa    |           xterm-376            | NOK | http://autobuild.buildroot.net/results/31678775a170a717bcd9ed325cd4a3eae9d4ce3a | ORPH
   xtensa    |           xterm-376            | NOK | http://autobuild.buildroot.net/results/bf345e5bff4980cd9a52c3a7ae69b5606ee127cb | ORPH


Classification of failures by reason for 2022.08.x
--------------------------------------------------

host-pahole-73383b3a39afe86... | 2 
              host-rust-1.62.0 | 2 
                elfutils-0.186 | 1 
host-spirv-llvm-translator-... | 1 
                 linux-5.17.15 | 1 
              memcached-1.6.16 | 1 
                 openal-1.22.0 | 1 
               pcsc-lite-1.9.8 | 1 
                       unknown | 1 
                    volk-2.5.1 | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/209fb84252a809da04baaf4eba17d1669dd5c7d3 | ORPH
powerpc64le  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/a3ab4d8f5f57f1102dd66e779d3c3eea275f7067 |     
    mips     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/7ec6ba55d87653d2e26bb63b5d2dbb1b15661f9f |     
   x86_64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/2f4ac5e8013d0c41a1f87e9e9e0cdd39670e0086 |     
   s390x     |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/993d6eaf6192be0f9ed23d679e04831586edb0b8 |     
    arm      | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/30ef8a2442bc03b73a05cc645aa6219f0dafc4cd | ORPH
   s390x     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/0a7de8d31ed8e03e3ffc219f098ffde4d280a56e | ORPH
   sparc     |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/73f28a26100141bb0f2864f4abac9cb4d378b2f7 | ORPH
    arm      |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/1ad72aad48da81c07245117a1aca68b0fb1da75f |     
    arm      |        pcsc-lite-1.9.8         | NOK | http://autobuild.buildroot.net/results/97d059a7ac1f6d660cfe33f371dfeb2b5a086a60 | ORPH
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/d0892bf0899710a85afd3a8cfc917df380e448c5 |     
   mipsel    |           volk-2.5.1           | NOK | http://autobuild.buildroot.net/results/f6acb7590a2dfb3bebd4b2beb30bc8234f31119a |     
    mips     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/6561ff7869111431488349a171786603d331b3d4 | ORPH



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

