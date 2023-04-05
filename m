Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8D0C7619A
	for <buildroot@archiver.kernel.org>; Wed,  5 Apr 2023 05:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7D0E8183D;
	Wed,  5 Apr 2023 05:31:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7D0E8183D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ptzBs45Ek3hw; Wed,  5 Apr 2023 05:31:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 812D481846;
	Wed,  5 Apr 2023 05:31:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 812D481846
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ABEE11BF3F0
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 05:31:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83F264014B
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 05:31:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83F264014B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EKWdO4X-hErJ for <buildroot@lists.busybox.net>;
 Wed,  5 Apr 2023 05:31:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 816E3400C5
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 816E3400C5
 for <buildroot@buildroot.org>; Wed,  5 Apr 2023 05:31:30 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 72AAE1BF203
 for <buildroot@buildroot.org>; Wed,  5 Apr 2023 05:31:27 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 05 Apr 2023 05:31:27 -0000
Message-Id: <20230405053134.83F264014B@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1680672687; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iyJzy8B6ZdnfjqO/L52MNDdk/hc4pnEaBTri3IONEUY=;
 b=S7HsMUAxF0TEfBgDn+DyApZ3PVGUkp/76VlfgZCZ1RZNTlOi5MrxEnGG4WVUEsl3Bp8Ijb
 iLnMPOuab51GqkW9TMhnJAL+yvVClqPWBShOMNY7IvbQY1gFIOGUAjCvDUUc49doNUaOBT
 PDWbcFyW9Qmj76zCNpUNu9hPsLLWgbBy//zVYvjLjNgv9TiHho78vpLR/bsjUDaByyeYqD
 G79vUaR22sec/UQQpgrqngxZtZBCMSOSxAPgWJasf5x93v7qIh+wmgG4tbrNU/O9HW6LR1
 GcerYSJzvM2ewVSjz9v+pPdYjucxAMfNf7CYrIhM3ExUPM+M8/6eUBfYE05pIw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=S7HsMUAx
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-04-04
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

Autobuild statistics for 2023-04-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 15  |  8  |  0  | 23  |
    master   | 115 | 98  |  1  | 214 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 8 
             bluez5_utils-5.66 | 5 
               host-qemu-7.2.0 | 5 
                elfutils-0.186 | 4 
glibc-2.36-81-g4f4d7a13edfd... | 4 
                host-go-1.19.7 | 4 
              host-rust-1.68.0 | 4 
                  linux-6.1.14 | 4 
                   perl-5.36.0 | 4 
            host-binutils-2.38 | 3 
                  acpid-2.0.34 | 2 
                 agentpp-4.6.0 | 2 
  gobject-introspection-1.72.0 | 2 
            host-binutils-2.37 | 2 
            ocf-linux-20171122 | 2 
                alsa-lib-1.2.8 | 1 
android-tools-4.2.2+git2013... | 1 
                busybox-1.36.0 | 1 
                 coreutils-9.2 | 1 
           crucible-2022.05.25 | 1 
                 dc3dd-7.2.641 | 1 
        edk2-edk2-stable202208 | 1 
              erlang-22.3.4.22 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
fs/ubi/ubi.mk:51: /home/tho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                    gdal-3.5.2 | 1 
                  gensio-2.5.5 | 1 
         gobject-introspection | 1 
            host-binutils-2.39 | 1 
host-gdb-arc-2020.09-releas... | 1 
       host-python-sip-4.19.25 | 1 
           janus-gateway-1.1.2 | 1 
           libfreeimage-3.18.0 | 1 
               libglib2-2.72.3 | 1 
                libglvnd-1.4.0 | 1 
        liblog4c-localtime-1.0 | 1 
                libressl-3.6.2 | 1 
        ltp-testsuite-20220930 | 1 
          lttng-modules-2.13.7 | 1 
                    mpv-0.35.1 | 1 
                    olsr-0.9.8 | 1 
                 openssh-9.3p1 | 1 
package/rtl8821cu/rtl8821cu... | 1 
                    parted-3.5 | 1 
               pcsc-lite-1.9.9 | 1 
            quickjs-2021-03-27 | 1 
                  reaver-1.6.6 | 1 
sconeserver-8d1935919a20133... | 1 
                 uclibc-1.0.42 | 1 
               valgrind-3.19.0 | 1 
                    volk-2.5.2 | 1 
                 wolfssl-5.5.3 | 1 
                xenomai-3.0.10 | 1 
               zxing-cpp-1.4.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/5048e681ea60afe3701554bbec92d550c5502178 | ORPH
  mips64el   |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/769dfff6d407b5eab2d0334d5a9020cb2517b232 | ORPH
   armeb     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/2a9580e406d7b1b800e66cd987f9fad4ade0d5e4 |     
   nios2     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/f5d67b6956c2cbc42c4ebf249baffa3cf2b4d53b |     
    or1k     |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/9d6c13441f0a791dfdc277a4bdb4402dd15a4d09 |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/5121d483356de3939cfe2a3eb0b12379af88befb |     
   armeb     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/ac8371dba3cbe3321947cb3d1832833becd4c2a5 |     
    or1k     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/0a5b29d9e3a3989c372dae134c4b075cc7054f05 |     
    sh4      |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/ec68c14043285ea3d5712b7ccdb70e872de975c1 |     
powerpc64le  |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/63133f27841811b15265bd7b798e084845f7c6b6 |     
   mips64    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/2fd3a8837f5af016af64dcde3307e05f91bc6556 |     
    mips     |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/15d1012fde3d61ad2d3317913f22dd9f168d6035 | ORPH
   sh4aeb    |         coreutils-9.2          | NOK | http://autobuild.buildroot.net/results/33c4e8727a07539a402c694f22f12c6d02850089 | ORPH
   x86_64    |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/727a589cc43d528d4ea789d5a76429991051cf5a |     
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/c1d9c2fff55297725d529c653bf75b21b909b8da | ORPH
    i586     |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/be3b1a84a499dee8ffbec225717f6329eb1e891c |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/c41d8be05a8c6baed0ecb8eb9dc40ce79a34b949 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/976b9c43a14af7e9c87a574f799e6e00b00fba53 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/33c02b5fda1fa712ad1ec59613f2c5332ba49412 | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/4ff11c90b766976b66d97cae23e6b50d571121b4 | ORPH
    arm      |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/55265d6eca94c451dbd357b0d09b05af4833b91b |     
   mipsel    | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/b092abffc6e8a5fe5d12f03fed57ead12e76db68 |     
  mips64el   | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/1d3bc0c9552a65ffecbcd33c0022f7363444668f |     
   s390x     | fs/ubi/ubi.mk:51: /home/tho... | NOK | http://autobuild.buildroot.net/results/a6ed2bae52d45a2209427a53ffb9ddd756461dea |     
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/8c3781ecab7ad64f5541aeb11fb715acd24cfd0c |     
   arceb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/7c3e5b39025ca6456b66fb3ae7281d7ea3469820 |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/238cd9bd226d2fd5162f4ffcb135057e59f44b2b |     
 microblaze  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/69e3049b49250c3fc1aa970713a6a469c16af6e8 |     
    sh4      |           gdal-3.5.2           | NOK | http://autobuild.buildroot.net/results/ea59639c0a803cde940bc8203b905a3fc1d5175e |     
   sh4eb     |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/28cdf37c93242f909cf8ca3f7ec5eb8c27701ea9 |     
  riscv32    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/f3bd404d3c31235a159127c1c5520c03ddb14de6 |     
 powerpc64   | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/800f5c40ecc0e14b8322063437c8f7c830d88a0f |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/bde4c0da4b5a9499df8ef9567f55edd3e9a80288 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/858bff58bbc7976499e2abc2a07e3573652959b4 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/26ccfb709b22a09abfc333d445060a9561779b48 |     
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/c43a9537f1c5507c32849e18750fa4346664230d | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/0dadafb9d512a9c60706c224485314852251ffb6 | ORPH
  powerpc    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/554347e5426138ec583cf72a958deda20da6b24a |     
    or1k     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/afe54ac0b0f1bd2ee0c4acba91e2e78143ac9c6a |     
  riscv64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/c4404134417b48ec3e3dcd49cabb97fdb9132333 |     
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/0b3b66da52ca08672397663cc1d620949ab32187 |     
    sh4a     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/225a79c0f83e565a3c9919757d0271e43b7177b4 |     
 microblaze  |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/2969a8fcf62be2c2af7a898cc08975f13b76e5ba |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/5604ef29babcb9980dff4333e4e20a8c07b6a8dc | ORPH
   mips64    |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/12aeb0319c7929d1b76d48f7812d5d2d1dd92d8d |     
   s390x     |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/0386fab18f44eba8e344a1a895a73f60303fcbbe |     
   mips64    |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/f0cc7f115a925d88597ce05c2119759c2ffdc889 |     
  mips64el   |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/f3c096673690c240a4c1acc1c4c4b334a3a406fc |     
 aarch64_be  |    host-python-sip-4.19.25     | NOK | http://autobuild.buildroot.net/results/5030f2e21a3c33f8e0f28c6cc0eeb79b26f651d9 |     
  aarch64    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/2fb2a258fb84424a3a34ecd39f6d405f964579d5 |     
powerpc64le  |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/43de77d5edc76fba3f02bcf1f16c82a13a296c18 |     
    sh4      |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/9a3acb5d1f6c89b216b7def7dd2abd4b69e62108 |     
    sh4      |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/c288edbeb0e6463d658388cf2ac4dc06bc6a92b5 |     
  aarch64    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/5f0d16c34946e8740914829bbbc1370f63f65a5f |     
    i686     |        host-rust-1.68.0        | NOK | http://autobuild.buildroot.net/results/9a38282fe0c44ed1e2241756e6e027b4a2effbc6 |     
   x86_64    |        host-rust-1.68.0        | NOK | http://autobuild.buildroot.net/results/3643583bf880dc15fbea312c6eb6a5343765feff |     
   armeb     |        host-rust-1.68.0        | NOK | http://autobuild.buildroot.net/results/b11d44a367b210e92182457e1c71e2ff8bc2c594 |     
   x86_64    |        host-rust-1.68.0        | NOK | http://autobuild.buildroot.net/results/2d00e736dad6e5c9bbc9d9f3c5ab577d61eda18c |     
  mips64el   |      janus-gateway-1.1.2       | NOK | http://autobuild.buildroot.net/results/c7815024404b6349c7fdfac23768bc56303990a3 |     
 microblaze  |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/8e68a8f52dc3cca9a9f2e089ab2fc4205ee1b7d3 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/843ea95bb397f862a2627c31449d72e316a3c3c7 |     
   mipsel    |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/23fdd0ba5d0817ff9924255ca27d4b1866ab0f7a | ORPH
  riscv64    |     liblog4c-localtime-1.0     | NOK | http://autobuild.buildroot.net/results/741ac5e73aaabfdef94c5ff931324087749f43aa |     
   armeb     |         libressl-3.6.2         | NOK | http://autobuild.buildroot.net/results/194b9019d9c1d0651c38d53af5358ae76a22cf1c | ORPH
    mips     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/52a093287139c563af5e668874d2f7b716a3343c | ORPH
   mipsel    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/fc4bb45e5024b40da95f309e9695bb329188cadf | ORPH
   arceb     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/aaee6235789aebaff6875a19a7988a90d9b063ff | ORPH
   mipsel    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/a19fc9326b7eb9c4f24673f7fe550d6608ecfeea | ORPH
    i686     |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/2ad18a552178452d5555318a1e228a34e9de988f |     
   arceb     |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/40fabdad9505a089b5434c33a5acadb57e23e0b4 |     
   s390x     |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/384cba53611e26384a2e4b4055d42f81af67d1de |     
  riscv64    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/1decae3c54ecdaed265b902763d65cd7135e5e05 | ORPH
   mipsel    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/98b06ac46cb4f73e7dc1fdd4017c48f5e1dfb17a | ORPH
    mips     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/4f0cdbdb5e4728f7a712bd97158e3370e4fc7a96 | ORPH
    m68k     |         openssh-9.3p1          | NOK | http://autobuild.buildroot.net/results/5cde1148b26520454e506325a2b57d98f7078e9b | ORPH
    arc      | package/rtl8821cu/rtl8821cu... | NOK | http://autobuild.buildroot.net/results/585a0065ceac5d5dd85e1b9d87746509f9ebd95d |     
    arc      |           parted-3.5           | NOK | http://autobuild.buildroot.net/results/def6c5970090d974d7e9409fab35326408ab3e10 |     
    or1k     |        pcsc-lite-1.9.9         | NOK | http://autobuild.buildroot.net/results/00bf25a62ae42f3abdfe3bdded7ece821f8211b7 | ORPH
    m68k     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/df204ab7e26d0f634abe5a9653fa5a02de3cca85 |     
  mips64el   |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/03c3e5da780f8052e8e044624a268f15eb407f37 |     
    arm      |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/da19ddd2f1ca90e0ea596392d8772f85cefca94a |     
   s390x     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/7aaa0f51f367e9f31c8b5eb791c8405d694a26bf |     
   sh4aeb    |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/7186dec19fe86862a619712e2337162407003181 |     
    arc      |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/6a55b684224538b1ba53866a8dccbc9e938736bc |     
   armeb     | sconeserver-8d1935919a20133... | NOK | http://autobuild.buildroot.net/results/40e59314dafa81c92943c3584e71cb528274a35a |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/3bdec14eb70056539317e685d4d413ff9144204d |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/37b410df2f92db6712abd50ca85285191507987d |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/e81a93a3ba94aeb5ffa725953e0f4bd25db26748 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/6c2af122167b60964018a61f5cb2027fe9f7c295 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/0b61c36de38db372f437197dfdf07b57769d1131 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/4e5ac8315e885a93da2dc55f136372778115d774 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/5b79f26219ce28a8b5d55e922302e566e9a8e738 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/55c7f7b58c14a4d3818d26e16d40ccb36a68aa32 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/4f2129097edf0f73eb099469c82414b0d557d341 |     
  powerpc    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/bf32aee5423a477f23a05c75fc93a67d0105c9d6 | ORPH
  powerpc    |           volk-2.5.2           | NOK | http://autobuild.buildroot.net/results/dfb068758a5758434403341000e49271b6bac35c |     
   armeb     |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/82e6573639054d4f14fb99f754f84b5a22668891 |     
  powerpc    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/c091934a2b4a1cbaa41393486f8f38dcb6a87a74 |     
  powerpc    |        zxing-cpp-1.4.0         | NOK | http://autobuild.buildroot.net/results/8174f2eb6bbedf49dcda2991bb1b056392fd6a4b |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

              host-rust-1.67.0 | 2 
                busybox-1.36.0 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
            host-binutils-2.38 | 1 
                  linux-6.1.14 | 1 
                mpg123-1.25.15 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/91be17c201a7bbfd664240b3ccecdcc325cf8ef4 | ORPH
    arc      | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/327acbb6d9ee4b2c67c3951d1f10f2fbf8fc8e76 |     
  aarch64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/7e191c12b33344a168e6490efb7d3073d6ade8e6 |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/53ffd59db267f0ec2615a15734edadafafdbacd2 |     
    mips     |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/b2ed23dd0409edf85447d0debbd486d75ad0eb2a |     
 powerpc64   |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/0646fd5b4fa8ec03ecd3547341234648bb0036d6 |     
   mipsel    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/7b155793d75a3a8b4c56dd76330b8a6299eff6c8 | ORPH
    arm      |         mpg123-1.25.15         | NOK | http://autobuild.buildroot.net/results/5ec862ebc46b1b838cca4218bf4df7116740111a | ORPH


Gitlab CI results for 2023-04-04
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
 TestAarch64Pages64kGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936880  | ORPH 
  TestAarch64Pages64kMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936881  | ORPH 
TestAarch64Pages64kuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936882  | ORPH 
              TestAvocado | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936555  | ORPH 
         TestCheckPackage | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937302  |      
      TestClangCompilerRT | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936566  | ORPH 
           TestCrudiniPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936567  | ORPH 
             TestDropbear | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936571  | ORPH 
              TestDtbocfg | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936572  | ORPH 
             TestExecline | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936573  | ORPH 
                 TestExt3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936430  | ORPH 
                 TestExt4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936437  | ORPH 
...rch64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936899  | ORPH 
...tlinAarch64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936900  | ORPH 
...arch64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936901  | ORPH 
...otlinAarch64MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936903  | ORPH 
...ch64UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936904  | ORPH 
...linAarch64UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936905  | ORPH 
...h64beGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936907  | ORPH 
...inAarch64beGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936908  | ORPH 
...64beUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936909  | ORPH 
...nAarch64beUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936910  | ORPH 
...750dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936911  | ORPH 
...nArcle750dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936913  | ORPH 
...ehs38GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936914  | ORPH 
...inArclehs38GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936915  | ORPH 
...hs38UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936917  | ORPH 
...nArclehs38UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936918  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936921  | ORPH 
...mebv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936922  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936925  | ORPH 
...rmebv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936927  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936929  | ORPH 
...ebv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936933  | ORPH 
...5eabiGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936935  | ORPH 
...inArmv5eabiGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936936  | ORPH 
...v5eabiMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936940  | ORPH 
...linArmv5eabiMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936941  | ORPH 
...eabiUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936943  | ORPH 
...nArmv5eabiUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936944  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936946  | ORPH 
...Armv6eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936947  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936948  | ORPH 
...nArmv6eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936949  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936950  | ORPH 
...rmv6eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936951  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936952  | ORPH 
...Armv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936953  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936954  | ORPH 
...nArmv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936955  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936958  | ORPH 
...rmv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936960  | ORPH 
...mv7mUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936965  | ORPH 
...tlinArmv7mUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936968  | ORPH 
...8xxxUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936971  | ORPH 
...nM68k68xxxUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936976  | ORPH 
...fireUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936980  | ORPH 
...8kcoldfireUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936982  | ORPH 
...azebeGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936985  | ORPH 
...icroblazebeGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936989  | ORPH 
...lazebeMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936994  | ORPH 
...MicroblazebeMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936995  | ORPH 
...zebeUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936999  | ORPH 
...croblazebeUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937005  | ORPH 
...azeelGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937007  | ORPH 
...icroblazeelGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937012  | ORPH 
...lazeelMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937015  | ORPH 
...MicroblazeelMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937017  | ORPH 
...zeelUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937018  | ORPH 
...croblazeelUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937020  | ORPH 
...ips32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937022  | ORPH 
...otlinMips32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937023  | ORPH 
...Mips32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937029  | ORPH 
...ootlinMips32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937035  | ORPH 
...ps32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937043  | ORPH 
...tlinMips32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937048  | ORPH 
...s32elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937050  | ORPH 
...linMips32elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937051  | ORPH 
...ps32elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937054  | ORPH 
...tlinMips32elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937056  | ORPH 
...32elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937061  | ORPH 
...inMips32elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937064  | ORPH 
...2r5elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937067  | ORPH 
...nMips32r5elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937069  | ORPH 
...32r5elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937072  | ORPH 
...inMips32r5elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937074  | ORPH 
...r5elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937077  | ORPH 
...Mips32r5elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937079  | ORPH 
...2r6elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937082  | ORPH 
...nMips32r6elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937083  | ORPH 
...32r6elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937084  | ORPH 
...inMips32r6elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937085  | ORPH 
...r6elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937087  | ORPH 
...Mips32r6elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937088  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937089  | ORPH 
...Mips64eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937091  | ORPH 
...4eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937092  | ORPH 
...nMips64eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937094  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937095  | ORPH 
...ips64eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937097  | ORPH 
...64n32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937098  | ORPH 
...inMips64n32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937100  | ORPH 
...s64n32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937102  | ORPH 
...linMips64n32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937105  | ORPH 
...4n32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937106  | ORPH 
...nMips64n32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937108  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937109  | ORPH 
...ps64r6eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937111  | ORPH 
...6eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937113  | ORPH 
...ips64r6eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937115  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937117  | ORPH 
...s64r6eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937118  | ORPH 
...Nios2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937119  | ORPH 
...ootlinNios2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937121  | ORPH 
...nriscGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937122  | ORPH 
...linOpenriscGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937124  | ORPH 
...enriscMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937127  | ORPH 
...tlinOpenriscMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937128  | ORPH 
...riscUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937130  | ORPH 
...inOpenriscUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937132  | ORPH 
...440fpGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937133  | ORPH 
...owerpc440fpGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937134  | ORPH 
...c440fpMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937136  | ORPH 
...Powerpc440fpMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937138  | ORPH 
...40fpUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937139  | ORPH 
...werpc440fpUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937142  | ORPH 
...e5500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937143  | ORPH 
...erpc64e5500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937144  | ORPH 
...e6500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937146  | ORPH 
...erpc64e6500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937148  | ORPH 
...4e6500MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937149  | ORPH 
...werpc64e6500MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937150  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937151  | ORPH 
...c64lepower8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937153  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937154  | ORPH 
...pc64lepower8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937156  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937157  | ORPH 
...rpc64power8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937158  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937159  | ORPH 
...erpc64power8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937163  | ORPH 
...300c3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937165  | ORPH 
...werpce300c3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937167  | ORPH 
...e300c3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937169  | ORPH 
...owerpce300c3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937170  | ORPH 
...00c3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937172  | ORPH 
...erpce300c3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937173  | ORPH 
...500mcGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937174  | ORPH 
...werpce500mcGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937176  | ORPH 
...e500mcMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937177  | ORPH 
...owerpce500mcMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937179  | ORPH 
...00mcUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937180  | ORPH 
...erpce500mcUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937182  | ORPH 
...lp32dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937183  | ORPH 
...lp64dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937184  | ORPH 
...iscv64lp64dGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937186  | ORPH 
...4lp64dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937187  | ORPH 
...Riscv64lp64dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937188  | ORPH 
...p64dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937190  | ORPH 
...scv64lp64dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937191  | ORPH 
...0xz13GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937192  | ORPH 
...linS390xz13GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937193  | ORPH 
...Shsh4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937194  | ORPH 
...ootlinShsh4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937196  | ORPH 
...nShsh4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937199  | ORPH 
...BootlinShsh4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937201  | ORPH 
...hsh4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937204  | ORPH 
...otlinShsh4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937206  | ORPH 
...h4aebGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937209  | ORPH 
...linShsh4aebGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937211  | ORPH 
...sh4aebMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937214  | ORPH 
...tlinShsh4aebMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937216  | ORPH 
...arc64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937218  | ORPH 
...tlinSparc64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937219  | ORPH 
...rcv8UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937222  | ORPH 
...linSparcv8UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937224  | ORPH 
...X8664GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937226  | ORPH 
...ootlinX8664GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937228  | ORPH 
...nX8664MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937230  | ORPH 
...BootlinX8664MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937232  | ORPH 
...8664UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937234  | ORPH 
...otlinX8664UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937235  | ORPH 
...orei7GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937237  | ORPH 
...X8664corei7GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937238  | ORPH 
...corei7MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937239  | ORPH 
...nX8664corei7MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937240  | ORPH 
...rei7UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937241  | ORPH 
...8664corei7UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937242  | ORPH 
...664v2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937244  | ORPH 
...tlinX8664v2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937246  | ORPH 
...8664v2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937248  | ORPH 
...otlinX8664v2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937250  | ORPH 
...64v2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937253  | ORPH 
...linX8664v2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937256  | ORPH 
...664v3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937259  | ORPH 
...tlinX8664v3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937264  | ORPH 
...8664v3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937267  | ORPH 
...otlinX8664v3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937269  | ORPH 
...64v3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937271  | ORPH 
...linX8664v3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937273  | ORPH 
...664v4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937275  | ORPH 
...tlinX8664v4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937276  | ORPH 
...8664v4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937278  | ORPH 
...otlinX8664v4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937279  | ORPH 
...64v4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937280  | ORPH 
...linX8664v4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937281  | ORPH 
...core2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937282  | ORPH 
...linX86core2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937283  | ORPH 
...6core2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937284  | ORPH 
...tlinX86core2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937285  | ORPH 
...ore2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937286  | ORPH 
...inX86core2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937288  | ORPH 
...6i686GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937290  | ORPH 
...tlinX86i686GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937291  | ORPH 
...86i686MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937293  | ORPH 
...otlinX86i686MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937294  | ORPH 
...i686UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937296  | ORPH 
...linX86i686UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937298  | ORPH 
...lx60UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937299  | ORPH 
...Xtensalx60UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937301  | ORPH 
...ToolchainBuildrootMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936883  | ORPH 
...olchainBuildrootuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936884  | ORPH 
...xternalToolchainCCache | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936885  | ORPH 
...ernalToolchainCtngMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936887  | ORPH 
...rnalToolchainLinaroArm | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936889  | ORPH 
...ToolchainSourceryArmv4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936890  | ORPH 
...ToolchainSourceryArmv5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936891  | ORPH 
...ToolchainSourceryArmv7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936898  | ORPH 
     TestFileCapabilities | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936327  | ORPH 
               TestGdbArc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936575  | ORPH 
        TestGdbFullTarget | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936576  | ORPH 
...GdbHostOnlyAllFeatures | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936578  | ORPH 
   TestGdbHostOnlyDefault | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936579  | ORPH 
        TestGdbserverOnly | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936580  | ORPH 
        TestGetDevelopers | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047937303  | ORPH 
     TestGlibcAllTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936393  | ORPH 
...DefaultLimitedTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936396  | ORPH 
              TestGlxinfo | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936581  | ORPH 
               TestGnupg2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936582  | ORPH 
          TestGrubi386EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936301  | ORPH 
           TestGst1Python | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936583  | ORPH 
                TestHWLoc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936586  | ORPH 
              TestHighway | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936585  | ORPH 
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936588  | ORPH 
       TestInitSystemNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936513  | ORPH 
...ystemSystemdRwNetworkd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936546  | ORPH 
               TestIperf3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936587  | ORPH 
      TestIso9660Grub2EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936441  | ORPH 
 TestIso9660Grub2External | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936443  | ORPH 
...0Grub2ExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936452  | ORPH 
   TestIso9660Grub2Hybrid | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936462  | ORPH 
 TestIso9660Grub2Internal | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936471  | ORPH 
...so9660SyslinuxExternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936473  | ORPH 
...slinuxExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936476  | ORPH 
...so9660SyslinuxInternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936479  | ORPH 
                TestKexec | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936590  | ORPH 
               TestLibJXL | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936593  | ORPH 
            TestLibshdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936595  | ORPH 
                 TestLsof | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936600  | ORPH 
                  TestLua | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936605  | ORPH 
              TestLuaHttp | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936626  | ORPH 
           TestLuaInotify | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936629  | ORPH 
              TestLuaLPeg | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936597  | ORPH 
          TestLuaLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936602  | ORPH 
         TestLuaLuaArgon2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936608  | ORPH 
         TestLuaLuaAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936611  | ORPH 
           TestLuaLuaCffi | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936615  | ORPH 
        TestLuaLuaCqueues | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936616  | ORPH 
          TestLuaLuaExpat | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936649  | ORPH 
     TestLuaLuaFileSystem | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936651  | ORPH 
             TestLuaLuaGD | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936624  | ORPH 
           TestLuaLuaLdap | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936653  | ORPH 
          TestLuaLuaLyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936634  | ORPH 
          TestLuaLuaPosix | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936661  | ORPH 
           TestLuaLuaSDL2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936639  | ORPH 
            TestLuaLuaSec | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936664  | ORPH 
         TestLuaLuaSocket | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936667  | ORPH 
           TestLuaLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936620  | ORPH 
           TestLuaLuaossl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936657  | ORPH 
         TestLuaLuasyslog | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936671  | ORPH 
           TestLuaLuazlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936647  | ORPH 
             TestLuaLunix | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936631  | ORPH 
             TestLuaLzlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936677  | ORPH 
             TestLuaRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936857  | ORPH 
              TestLuaUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936643  | ORPH 
               TestLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936606  | ORPH 
           TestLuajitHttp | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936628  | ORPH 
        TestLuajitInotify | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936630  | ORPH 
           TestLuajitLPeg | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936599  | ORPH 
       TestLuajitLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936603  | ORPH 
      TestLuajitLuaArgon2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936610  | ORPH 
      TestLuajitLuaAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936613  | ORPH 
     TestLuajitLuaCqueues | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936618  | ORPH 
       TestLuajitLuaExpat | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936650  | ORPH 
  TestLuajitLuaFileSystem | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936652  | ORPH 
          TestLuajitLuaGD | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936625  | ORPH 
        TestLuajitLuaLdap | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936656  | ORPH 
       TestLuajitLuaLyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936636  | ORPH 
       TestLuajitLuaPosix | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936663  | ORPH 
        TestLuajitLuaSDL2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936641  | ORPH 
         TestLuajitLuaSec | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936665  | ORPH 
      TestLuajitLuaSocket | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936669  | ORPH 
        TestLuajitLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936622  | ORPH 
        TestLuajitLuaossl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936659  | ORPH 
      TestLuajitLuasyslog | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936673  | ORPH 
        TestLuajitLuazlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936648  | ORPH 
          TestLuajitLunix | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936632  | ORPH 
          TestLuajitRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936858  | ORPH 
       TestLuajitTurbolua | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936870  | ORPH 
           TestLuajitUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936645  | ORPH 
                 TestLuvi | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936674  | ORPH 
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936675  | ORPH 
               TestMender | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936679  | ORPH 
             TestMsrTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936680  | ORPH 
               TestMtools | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936682  | ORPH 
                 TestNcdu | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936683  | ORPH 
              TestNetdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936684  | ORPH 
          TestNodeJSBasic | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936685  | ORPH 
         TestNodeJSModule | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936687  | ORPH 
               TestOctave | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936688  | ORPH 
                  TestOla | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936690  | ORPH 
              TestOpenJdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936691  | ORPH 
         TestOpenSshGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936692  | ORPH 
        TestOpenSshuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936693  | ORPH 
                 TestOpkg | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936694  | ORPH 
             TestPerftest | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936696  | ORPH 
                 TestPerl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936698  | ORPH 
        TestPerlClassLoad | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936700  | ORPH 
         TestPerlDBDmysql | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936701  | ORPH 
     TestPerlEncodeDetect | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936703  | ORPH 
          TestPerlGDGraph | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936705  | ORPH 
       TestPerlHTMLParser | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936706  | ORPH 
TestPerlIOSocketMulticast | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936709  | ORPH 
      TestPerlIOSocketSSL | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936710  | ORPH 
 TestPerlLWPProtocolhttps | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936713  | ORPH 
         TestPerlMailDKIM | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936715  | ORPH 
              TestPerlX10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936717  | ORPH 
        TestPerlXMLLibXML | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936718  | ORPH 
       TestPerllibwwwperl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936712  | ORPH 
              TestPhpApcu | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936720  | ORPH 
            TestPhpLuaLua | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936721  | ORPH 
         TestPhpLuaLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936722  | ORPH 
               TestPhpPam | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936724  | ORPH 
          TestPhpPeclDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936725  | ORPH 
                 TestPixz | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936727  | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936729  | ORPH 
        TestPolkitSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936730  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936734  | ORPH 
        TestProsodyLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936735  | ORPH 
              TestPyNdiff | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936831  | ORPH 
            TestPython3Py | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936737  | ORPH 
         TestPython3PyPyc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936739  | ORPH 
           TestPython3Pyc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936741  | ORPH 
         TestPythonAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936748  | ORPH 
           TestPythonAvro | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936752  | ORPH 
         TestPythonHwdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936807  | ORPH 
       TestPythonPahoMQTT | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936819  | ORPH 
     TestPythonPy3Aexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936742  | ORPH 
        TestPythonPy3Argh | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936745  | ORPH 
       TestPythonPy3Attrs | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936747  | ORPH 
    TestPythonPy3Autobahn | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936749  | ORPH 
     TestPythonPy3Automat | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936751  | ORPH 
   TestPythonPy3Bitstring | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936753  | ORPH 
       TestPythonPy3Boto3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936755  | ORPH 
    TestPythonPy3Botocore | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936757  | ORPH 
         TestPythonPy3Can | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936759  | ORPH 
        TestPythonPy3Cbor | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936761  | ORPH 
       TestPythonPy3Click | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936764  | ORPH 
   TestPythonPy3Colorzero | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936766  | ORPH 
  TestPythonPy3Constantly | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936770  | ORPH 
   TestPythonPy3Construct | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936773  | ORPH 
    TestPythonPy3Crossbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936775  | ORPH 
TestPythonPy3Cryptography | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936777  | ORPH 
    TestPythonPy3DBusFast | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936781  | ORPH 
    TestPythonPy3DBusNext | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936783  | ORPH 
  TestPythonPy3Dicttoxml2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936784  | ORPH 
      TestPythonPy3Distro | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936786  | ORPH 
      TestPythonPy3Django | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936789  | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936790  | ORPH 
       TestPythonPy3Flask | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936791  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936794  | ORPH 
         TestPythonPy3Git | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936796  | ORPH 
      TestPythonPy3Gitdb2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936798  | ORPH 
       TestPythonPy3GnuPG | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936800  | ORPH 
     TestPythonPy3Gobject | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936802  | ORPH 
    TestPythonPy3Gpiozero | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936805  | ORPH 
        TestPythonPy3Hkdf | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936806  | ORPH 
 TestPythonPy3Incremental | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936809  | ORPH 
    TestPythonPy3Iptables | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936810  | ORPH 
    TestPythonPy3Jmespath | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936812  | ORPH 
    TestPythonPy3Libftdi1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936591  | ORPH 
...PythonPy3MagicWormhole | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936814  | ORPH 
       TestPythonPy3Munch | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936817  | ORPH 
     TestPythonPy3Passlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936821  | ORPH 
     TestPythonPy3Pexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936823  | ORPH 
      TestPythonPy3PyAlsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936824  | ORPH 
      TestPythonPy3Pynacl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936828  | ORPH 
      TestPythonPy3Pytest | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936832  | ORPH 
...PythonPy3PytestAsyncio | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936834  | ORPH 
      TestPythonPy3Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936836  | ORPH 
      TestPythonPy3Qrcode | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936837  | ORPH 
         TestPythonPy3RSA | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936840  | ORPH 
     TestPythonPy3RpiGpio | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936838  | ORPH 
  TestPythonPy3S3transfer | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936842  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936843  | ORPH 
...thonPy3ServiceIdentity | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936844  | ORPH 
      TestPythonPy3Smmap2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936846  | ORPH 
      TestPythonPy3Spake2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936847  | ORPH 
        TestPythonPy3Treq | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936849  | ORPH 
     TestPythonPy3Twisted | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936850  | ORPH 
       TestPythonPy3Txaio | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936851  | ORPH 
    TestPythonPy3Txtorcon | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936852  | ORPH 
      TestPythonPy3Ubjson | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936853  | ORPH 
...y3UnitTestXmlReporting | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936854  | ORPH 
       TestPythonPy3rtoml | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936841  | ORPH 
         TestPythonPybind | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936826  | ORPH 
             TestRdmaCore | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936855  | ORPH 
                TestRedis | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936856  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936859  | ORPH 
              TestRustBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936861  | ORPH 
                   TestS6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936862  | ORPH 
         TestS6Networking | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936863  | ORPH 
      TestS6PortableUtils | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936864  | ORPH 
                 TestS6Rc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936865  | ORPH 
             TestStressNG | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936866  | ORPH 
                 TestSudo | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936867  | ORPH 
             TestSyslogNg | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936868  | ORPH 
                 TestTmux | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936869  | ORPH 
TestUbootOpensslPkgConfig | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936872  | ORPH 
                   TestZ3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936874  | ORPH 
             TestZerofree | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936875  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936876  | ORPH 
              TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936877  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4047936878  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
