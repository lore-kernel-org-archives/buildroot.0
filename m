Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F219E748E9
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 05:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DA8D4157A;
	Sun,  1 Oct 2023 05:33:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DA8D4157A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PYYo_4AEUXDs; Sun,  1 Oct 2023 05:33:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83950416D6;
	Sun,  1 Oct 2023 05:33:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83950416D6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 546C61BF5AA
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 05:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F1AF182A17
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 05:33:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1AF182A17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NBYP-yPZhbwA for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 05:33:48 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D4DD7829FD
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 05:33:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4DD7829FD
Received: by mail.gandi.net (Postfix) with ESMTPSA id E8A9140005
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 05:33:44 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 01 Oct 2023 05:33:44 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231001053349.F1AF182A17@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1696138425; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UI/8h4MxHGP3WxYeRLDY3ehq4tBBK6X0MTTLacMHQCI=;
 b=LF8pF9vWbqOtVrgAhqiqLMhastMMOAFmtU9X62OJlQi87Wvrpg4UbtwWOQrrk7VMFXwApe
 PKviLEhI9r3QQuyhGiuzYY1fEEDfRJ+Tt40uM8J2t6qUAqkSicBI6TipImBWD2DdCH+Z/n
 qACNbn2S/hXLMfC/Ex80tUq8FKBhf0K6RluhQ+UBMT6peLSJyF7qA+uds6oDCQMZVLd++t
 OAZq6w2OCDX4mNxkwkc4eKL4PFT4UwRpuRvWxsixcwYOV86EJO7J78s7M5yPPsd5alPpCN
 7E1wEwDIADUhHL1O6QfUGoUCi7p+3q2ma0FvhzFSoxwTrlM9nbd3t0Mhi0Ey3Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LF8pF9vW
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-09-30
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

Autobuild statistics for 2023-09-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 18  | 10  |  0  | 28  |
  2023.08.x  | 24  | 15  |  0  | 39  |
    master   | 84  | 113 |  3  | 200 |

Classification of failures by reason for master
-----------------------------------------------

                 gnuplot-5.4.9 | 12
             alsa-utils-1.2.10 | 7 
              libarchive-3.7.2 | 7 
                   bird-2.0.12 | 6 
                 openrc-0.43.3 | 6 
                       unknown | 6 
               alsa-lib-1.2.10 | 5 
                host-go-1.21.1 | 5 
glibc-2.38-13-g92201f16cbcf... | 4 
check-11970a7e112dfe243a2e6... | 3 
         gobject-introspection | 3 
  gobject-introspection-1.76.1 | 3 
                  monit-5.33.0 | 3 
                  cairo-1.16.0 | 2 
              gcc-final-12.3.0 | 2 
         openfpgaloader-0.10.0 | 2 
package/putty/putty.mk:22: ... | 2 
             util-linux-2.39.2 | 2 
                xenomai-3.0.10 | 2 
                  assimp-5.2.5 | 1 
                  axel-2.17.11 | 1 
                  boost-1.83.0 | 1 
                    brltty-6.5 | 1 
                   bullet-3.21 | 1 
                  conmon-2.1.8 | 1 
                elfutils-0.189 | 1 
                 fdk-aac-2.0.2 | 1 
 glslsandbox-player-2023.04.05 | 1 
           heirloom-mailx-12.5 | 1 
            host-erlang-26.0.2 | 1 
      host-python-numpy-1.25.0 | 1 
              host-rust-1.71.1 | 1 
        host-sentry-cli-2.20.3 | 1 
              libsodium-1.0.18 | 1 
                  libva-2.20.0 | 1 
               libvorbis-1.3.7 | 1 
                libxml2-2.11.4 | 1 
          linux-5.10.162-cip24 | 1 
        ltp-testsuite-20230127 | 1 
               mariadb-10.11.4 | 1 
              memcached-1.6.21 | 1 
                     mtd-2.1.6 | 1 
              open-iscsi-2.1.9 | 1 
               openblas-0.3.24 | 1 
                python3-3.11.5 | 1 
                     squid-6.2 | 1 
             strongswan-5.9.11 | 1 
               syslog-ng-4.3.1 | 1 
ti-sgx-km-cf7f48cb30abfd5df... | 1 
                 uclibc-1.0.44 | 1 
ulog-0389d243352255f6182326... | 1 
                 wolfssl-5.6.3 | 1 
                    xen-4.14.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/60c8882d8c9ba6eb4802ad78b31be2a6c77beafa |     
    i686     |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/d85f652ede39c97ff3e4413dbd85efa535bd7e38 |     
powerpc64le  |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/a5bf6596e3ec3bd8f38dddb40b37f06b96f0e68d |     
    arm      |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/122346075d0878a7213767a9dc8ee20160e209d3 |     
   x86_64    |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/9e829f2eae65951e981e0983e63464d56f00cfff |     
    arm      |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/2b02ad5f3aba3c8ce2846e881fed57194823c8b5 |     
  mips64el   |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/5a7355954589d9b86b3f090852fc9acd545a6a2d |     
    i686     |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/e269f862ebade30cf870d783a1006aba8fedc129 |     
    i686     |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/1ce4739fb3e866f9c5742f71fa1c0ea4959afe71 |     
 aarch64_be  |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/fbc5386940ea0e8589bdb4bf4079845fbf20fe10 |     
microblazeel |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/90824ec11ca33cc723fd389d3e6421e9dfb55231 |     
    arm      |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/5209205b9d51281b980452b53fdf8f2c2daa1894 |     
    mips     |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/1a18b928bfddf1e6fe6eb5e6a021d0bd98403bc1 | ORPH
   mips64    |          axel-2.17.11          | NOK | http://autobuild.buildroot.net/results/751551e06a9197fa4019323c3ac32bae86673d28 |     
   x86_64    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/966e309d17e93d288f2d860b9359733d0fda1e06 |     
  aarch64    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/411255a490dda19fce06e5a6303a2125b2027843 |     
  mips64el   |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/14332c62049ec7404a2d0f96c93727272a53e90a |     
 powerpc64   |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/00f697ed6a4643fff16345203da83e2c2a5c161e |     
  aarch64    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/8166935b611e55497797d7a022fe8a5e25acc804 |     
  powerpc    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/d94a8fdcbef19ed6e15d592e7dc6aeb2d0223751 |     
    arm      |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/09267144316866b16afbc4360cb974042728ed0d |     
    arm      |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/771e5da3316b0a67ad84684bb10d70efbbb0f667 |     
   nios2     |          bullet-3.21           | NOK | http://autobuild.buildroot.net/results/b913c567197ec2612f8754465917a94ac06ee5ef |     
   xtensa    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/b8692ecac0fb0c337f43b77f47293ce7ad388a6e |     
   xtensa    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/db6da1f305dcdfa13be8bcac59f163a1555eabef |     
    m68k     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/afd3b70c87cd1bec3611d6723901395b9479f755 | ORPH
    m68k     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/b2ee48134d2bcabd978c5f71d1894b8dab87d42c | ORPH
    or1k     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/b861d400c63438f02e9c4e0698d7c6eda7463d6e | ORPH
  aarch64    |          conmon-2.1.8          | NOK | http://autobuild.buildroot.net/results/de51f4d608a651e7e105df23c39577d07bd309dc |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/04f633ca983c69e316a2429d766733c7ae857b03 | ORPH
    i686     |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/6edb42893dfcdaa79f644d6b46866d0b05ccfb51 |     
   xtensa    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/cfd9f6a5e7755431b0aae685a3f8befe1cdb2063 |     
   mips64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/a2aac42eb48b025b35e85958f1e273a57645f169 |     
 powerpc64   | glibc-2.38-13-g92201f16cbcf... | NOK | http://autobuild.buildroot.net/results/b5756b9ab6754484b5c10075dc59a4249b01f8b3 |     
  riscv64    | glibc-2.38-13-g92201f16cbcf... | NOK | http://autobuild.buildroot.net/results/3b0a52d710aaf710a8a0b9a822e8cac5f405a5ed |     
    arc      | glibc-2.38-13-g92201f16cbcf... | NOK | http://autobuild.buildroot.net/results/4d8637a4da4e87c703cd3e9d5a70b5d1d1057fc4 |     
 powerpc64   | glibc-2.38-13-g92201f16cbcf... | NOK | http://autobuild.buildroot.net/results/080dec3455a221124b0fd6a1b940d0d81c1a29b7 |     
  aarch64    | glslsandbox-player-2023.04.05  | NOK | http://autobuild.buildroot.net/results/ee8e57393d168cdcaede982fa37fd1de7505e38b |     
  riscv32    |         gnuplot-5.4.9          | NOK | http://autobuild.buildroot.net/results/9fdc97c8a6dc68ae6b7ffcf24781531c5ea70e6d |     
microblazeel |         gnuplot-5.4.9          | NOK | http://autobuild.buildroot.net/results/cbbce4ce9594cbe303d76f53145b746658408584 |     
 powerpc64   |         gnuplot-5.4.9          | NOK | http://autobuild.buildroot.net/results/5676609b6331b645f2e557aca67afe4c3a087433 |     
   armeb     |         gnuplot-5.4.9          | NOK | http://autobuild.buildroot.net/results/f73073159cf295bdecae9b9988e399525c1e86ae |     
   sh4aeb    |         gnuplot-5.4.9          | NOK | http://autobuild.buildroot.net/results/9b089db8b4c538a35d47fab94e4ff3d1d75b12e6 |     
   armeb     |         gnuplot-5.4.9          | NOK | http://autobuild.buildroot.net/results/d5c23c836ca1be3759ad5ca467cfe6f0d5edd316 |     
  riscv64    |         gnuplot-5.4.9          | NOK | http://autobuild.buildroot.net/results/5a74459ed1f4ffacaccf5a257f4e31f23166dc05 |     
    arm      |         gnuplot-5.4.9          | NOK | http://autobuild.buildroot.net/results/722f4861135fb71df1133e64713d6c91b2a47e63 |     
    m68k     |         gnuplot-5.4.9          | NOK | http://autobuild.buildroot.net/results/80bbe4444b7d5ce0f0e68355af5d4fde5efd998d |     
   sh4eb     |         gnuplot-5.4.9          | NOK | http://autobuild.buildroot.net/results/28ac8cc1fe0c5e85310b9302f072423d626c32c9 |     
   arceb     |         gnuplot-5.4.9          | NOK | http://autobuild.buildroot.net/results/bc84770adab379c4d3caef6f330ff30585163fb2 |     
 powerpc64   |         gnuplot-5.4.9          | NOK | http://autobuild.buildroot.net/results/13865d5ac8d25f9f05576b88dcced8c4555595ad |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/1b13366fe156e638dc860b1c72b906e09b892d22 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/efda751cba54bceb1e862f4d6f5f492f3c0c0149 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/fa5cde5c1c8aefbe9ab6068e2a2da26b580121b5 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/9ac7e55fec685802abf9dd32e3969a2b2ed5e9eb | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/f42aa9832173029eb012ecea50e90fe087b8158a | ORPH
    sh4a     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/8414b92010a120ab7bfd0daf6f144e3070a672b6 | ORPH
   sh4aeb    |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/4c5525d1d6c3ddaa9314a17a43a46e87fff04d3f |     
   mipsel    |       host-erlang-26.0.2       | NOK | http://autobuild.buildroot.net/results/debffe3091fe2b558dfef39a3a31362fcca1e3f5 |     
   s390x     |         host-go-1.21.1         | NOK | http://autobuild.buildroot.net/results/f88051da8c1ee22a0e4b259b0b68016e38d87668 |     
  mips64el   |         host-go-1.21.1         | NOK | http://autobuild.buildroot.net/results/c788dde2a2f5cbef6e533424aca8070b28da8da1 |     
  mips64el   |         host-go-1.21.1         | NOK | http://autobuild.buildroot.net/results/7de5b2e86b876c620bf751688a98efaa19722b0e |     
    i686     |         host-go-1.21.1         | NOK | http://autobuild.buildroot.net/results/760c8760f77be47b3e5059e04a9e86d0f122a3da |     
  powerpc    |         host-go-1.21.1         | NOK | http://autobuild.buildroot.net/results/ec8eec6d966376c8893ecaa2ccdba5550a7e837d |     
    arc      |    host-python-numpy-1.25.0    | NOK | http://autobuild.buildroot.net/results/9ec82be71c908873112064792ace283049355031 |     
   armeb     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/c1688695c0cfc4035cfb4740af5476a96bd2d4dc |     
 microblaze  |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/862d802639a0532c99844c9e710d06ade05b1ceb |     
    or1k     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/043fff4b3f0daa07d52ef262ef34a5bf8694cec7 |     
 microblaze  |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/31ea570325c7ad4c88e154fa75b8546dc2c6b894 |     
   nios2     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/3cbf462a3e354c21254ca37b5bf15ae085c831d5 |     
  powerpc    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/b74a7d1a4db21f085f883623969c7b33b42e4961 |     
   mipsel    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/681193a33c256e1dc27d556cb581bbe3ff859af4 |     
    or1k     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/719630e34b55ada8cb563748602b8ff9d96457bf |     
  powerpc    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/001e1a9c5fef88d23c4aa29594398041387ba648 |     
   arceb     |        libsodium-1.0.18        | NOK | http://autobuild.buildroot.net/results/95d341126a69c7414015fdf8931f80df95d849f5 |     
    arm      |          libva-2.20.0          | NOK | http://autobuild.buildroot.net/results/9d124d900567bf3bc99a3ef850e83247121e3689 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/c6ec3c9a211821d303930b0be3c8586105fb87d9 |     
   arceb     |         libxml2-2.11.4         | NOK | http://autobuild.buildroot.net/results/3a85e69da712cf6e3a6f3baea921875b19a334a2 |     
   x86_64    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/dd1926622ade88547d408c6b40265d564c23ec78 | ORPH
   s390x     |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/f1e0785609a250bd57f36cf8d30da376a0a795ce |     
    m68k     |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/0f5ec37500fab7284c7c92e41557716772ff6da9 | ORPH
    sh4      |        memcached-1.6.21        | NOK | http://autobuild.buildroot.net/results/3fc30fbe8033cc2a53fff398f458963ac4622356 | ORPH
    mips     |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/34b553f6b71f072605c303ab8cd5921c47c20a1e |     
microblazeel |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/be5c0443c332533e357b635dd3bbe8c968f0e3f0 |     
    or1k     |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/6aac7733043e4644ae227177eaa451763b514c58 |     
    mips     |           mtd-2.1.6            | NOK | http://autobuild.buildroot.net/results/e2e5dfbd7b19c7196cd70c36e9f061fd3ebadf98 | ORPH
 aarch64_be  |        open-iscsi-2.1.9        | NOK | http://autobuild.buildroot.net/results/14fc1c139f055b5b1eaa6e04e327863c06176a7b |     
   mips64    |        openblas-0.3.24         | NOK | http://autobuild.buildroot.net/results/fe64117e7a8fa151a4740a23b348c43cbdc9ee55 |     
    m68k     |     openfpgaloader-0.10.0      | NOK | http://autobuild.buildroot.net/results/b1b389bcdb901c0da0ad206235525fdf75be4353 |     
  mips64el   |     openfpgaloader-0.10.0      | NOK | http://autobuild.buildroot.net/results/c9017c1b3a6559c4d6efc798bd1ae0b00971a379 |     
   s390x     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/d92561fb7dbccc55a7324792bbc2482077efbdbd |     
 powerpc64   |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/45fb20ad162befeb95b4203ba19e36ada77596cf |     
 aarch64_be  |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/9f965aca6b9c091776d07fbaa068c5ccf4b662a5 |     
   armeb     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/2b79d3650e0c05121ec0e767d7488aeab56c8a01 |     
    arm      |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/7dc3f68a56b70dd77383aa7d071b73210622f119 |     
  sparc64    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/1532dc51cac409a725513154ad45082c9babe7e6 |     
  mips64el   | package/putty/putty.mk:22: ... | NOK | http://autobuild.buildroot.net/results/044fdd08d1f21137472c3ff9abe63e60acb48682 |     
 aarch64_be  | package/putty/putty.mk:22: ... | NOK | http://autobuild.buildroot.net/results/69c286a8b4b679e6e5d81c4af25de9f7cf3fe670 |     
   x86_64    |         python3-3.11.5         | NOK | http://autobuild.buildroot.net/results/d921a5b82e05c6af7a2ebc185c0cbc1ed2ab344a |     
  aarch64    |           squid-6.2            | NOK | http://autobuild.buildroot.net/results/a32711b915939de091e31a1070d925041f3f7f8a | ORPH
  sparc64    |       strongswan-5.9.11        | NOK | http://autobuild.buildroot.net/results/d617397dcbaaf4c136a2b58fb45e2c1f260d446c |     
  mips64el   |        syslog-ng-4.3.1         | NOK | http://autobuild.buildroot.net/results/dc4d60d752e579ef054915eee3d7e3e73c25929b |     
    arm      | ti-sgx-km-cf7f48cb30abfd5df... | NOK | http://autobuild.buildroot.net/results/37990b43c4f99abc8bb8a64a8797c5ad08731b13 |     
  riscv64    |         uclibc-1.0.44          | NOK | http://autobuild.buildroot.net/results/dc917cb66a680f121fa50d8ed479f9a92e656cea |     
   x86_64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/77e5ea378d3662c0fbfee100a4b56c08f4f024ba |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/2d5e385743222493628e688ec3ec841564da9024 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/4309a12fecf970f263b2fd9fb0eb13b1ab94b840 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/e6eccd6fe441832af531da1c436f2d89606ff8bf |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/c4a0bb625b0c8e0e18c1038d8b4d66962573038f |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/3d4b50a9bd8c9dc9d447899c807fd7c719ec3f03 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/a5209f05d5579ea27b05d0decda4e517ddc0c8c8 |     
   arceb     |       util-linux-2.39.2        | NOK | http://autobuild.buildroot.net/results/b9126e7f873babe357e76a6242648e329519ce15 | ORPH
    sh4      |       util-linux-2.39.2        | NOK | http://autobuild.buildroot.net/results/51bff8670623a4c0d4521ef7105875c491f1127b | ORPH
    or1k     |         wolfssl-5.6.3          | NOK | http://autobuild.buildroot.net/results/f5bbaec0449e6918ca6ae2388eda847e5723e4b3 |     
    arm      |           xen-4.14.5           | NOK | http://autobuild.buildroot.net/results/5013ca65ad5bb96651c020aeee1282c285de8f65 |     
 aarch64_be  |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/06ffe4c89f05fd7f74c0e8259689769e7644f075 |     
microblazeel |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/cea95a2e06c9e8b242214bb9329c4b481b3296ed |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                   bird-2.0.12 | 3 
                elfutils-0.186 | 1 
            host-binutils-2.38 | 1 
host-heimdal-f4faaeaba371ff... | 1 
                  linux-6.1.55 | 1 
                    olsr-0.9.8 | 1 
                    php-8.2.10 | 1 
           v4l2loopback-0.12.7 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/b5adacbec01c91e6acef7bc93ed46cb56c00ca8b |     
   sparc     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/b9b3246278b28c336f8a7c66e7e19529c22f6f8b |     
powerpc64le  |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/bebeede133f63282aa353ea24e5b1364521460f9 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/3705ace7f539c77d89ecbc03607ada615fbe81a7 | ORPH
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/eb891763e79a7bd8e064297bf731a1859e4143c7 |     
    arm      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/d4a039d1836ca4a65606eaeb32bb238d38a314da | ORPH
    arc      |          linux-6.1.55          | NOK | http://autobuild.buildroot.net/results/3b76b599f6bc1dfdfddea7b135ac3c7438ee0f07 | ORPH
    arm      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/b7ad320f312fd8afa4b5766791a66503fa17b2fe | ORPH
microblazeel |           php-8.2.10           | NOK | http://autobuild.buildroot.net/results/ace52f7f8438c0476f9818ba195928ba2d2f4c7d |     
  sparc64    |      v4l2loopback-0.12.7       | NOK | http://autobuild.buildroot.net/results/99aa1035b50c7cf394686cd8df8be3d7ad0f76a5 |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                       unknown | 2 
             util-linux-2.39.1 | 2 
                   bird-2.0.12 | 1 
check-11970a7e112dfe243a2e6... | 1 
                host-go-1.20.8 | 1 
               host-runc-1.1.7 | 1 
              host-rust-1.71.1 | 1 
                libglvnd-1.4.0 | 1 
mmc-utils-d4c2910981ff99b98... | 1 
                     pound-4.8 | 1 
             stress-ng-0.15.07 | 1 
                 wavemon-0.9.4 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/04a85adcca1196a1a8fc363832b870355d931735 |     
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/bf8e02a5db02efe64274fe496dbe5df33c2c7a97 | ORPH
    arm      |         host-go-1.20.8         | NOK | http://autobuild.buildroot.net/results/2fb89151bd46aba3587e6c48bbc3fec7c58c6058 |     
microblazeel |        host-runc-1.1.7         | NOK | http://autobuild.buildroot.net/results/b81e0ba2879dddde05613b495473b06dea55419a |     
  aarch64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/61c0ccee854963a229a8bbb8fb8dbb0b96d57e18 |     
    m68k     |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/947270a5617dacce2428320cd0d18573ae800072 | ORPH
    arm      | mmc-utils-d4c2910981ff99b98... | NOK | http://autobuild.buildroot.net/results/d6695c8ad6e1bdc3617fc9ad54fd8626611fee53 |     
 powerpc64   |           pound-4.8            | NOK | http://autobuild.buildroot.net/results/1228052039b0269477e22a8797b9d48228f0e783 | ORPH
    m68k     |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/a023a44164aadee56975bf0fadd1b2011ecef34a |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/863a17fb329debeaa86872ac7a7343316fc57148 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/6ef3a5f3420ad56480c09fd97cc0df7fb7b9218f |     
    arm      |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/fd495fa9d920e04cb967f47afeefbf20c7101d6a | ORPH
    arm      |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/24f8baeefe1afe4f3a8552349e367fd702577dfb | ORPH
 powerpc64   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/cf52e87e0751ce1ee04ba0588fb227a26181180d | ORPH
   xtensa    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/b1f102ca421f45b7eee6a2f3c50032fc23733448 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
