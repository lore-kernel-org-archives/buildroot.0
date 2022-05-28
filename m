Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B58C433EF
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 04:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42F5B41979;
	Sat, 28 May 2022 04:41:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hJ_j34U7mEkM; Sat, 28 May 2022 04:41:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6194040510;
	Sat, 28 May 2022 04:41:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 427201BF267
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 04:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30F8284C8E
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 04:41:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WvUaJUgL461w for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 04:41:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0009484C85
 for <buildroot@buildroot.org>; Sat, 28 May 2022 04:41:09 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CE29F200005
 for <buildroot@buildroot.org>; Sat, 28 May 2022 04:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1653712866; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5+G7romCE1cAEFcIM2M44T7hHOmgOYKmIjcNnCIdYEM=;
 b=SZRIKXPJOUQcHk9YhsO+J7RjYh0rca8JWFQrbXZQ/Kvbu4cPj5httOZ+Y6dC0bZxIku4jg
 RWUBOP17mZFhzOkskiwkL3EojgFhO4wyeVpK68ot3UzeVw+5QifyT4V/FJQQ2eZVhd9Sw3
 Ce+QWzVC4HnsZnpu4nga+WPRmNWDxzaoyrHmDNPjkF/eT7mF7igLoB2LsywNgVNIdVKzdu
 vtd1XX8pRUM9ZWx0z8jzq5ubqPm6i2g7NJx2D9K/kAyoU75SlV7eG6bclKXRDiv9i85WvH
 cJzvFERsoBlCWgtN1ofId7dNp66lm0lyoKGXXDeAo9oDAlodFtOJLRWkrcdssA==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 28 May 2022 04:41:06 -0000
Message-Id: <20220528044112.30F8284C8E@smtp1.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-05-27
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

Autobuild statistics for 2022-05-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 14  |  4  |  0  | 18  |
    master   | 126 | 104 |  1  | 231 |

Classification of failures by reason for master
-----------------------------------------------

           optee-client-3.17.0 | 16
         host-gcc-final-10.3.0 | 14
               pipewire-0.3.51 | 4 
               protobuf-3.20.1 | 4 
              swupdate-2022.05 | 4 
             libopenssl-1.1.1o | 3 
                       unknown | 3 
                 zlib-ng-2.0.6 | 3 
              libostree-2022.3 | 2 
                libressl-3.5.2 | 2 
                libzlib-1.2.12 | 2 
                nodejs-16.15.0 | 2 
                    4th-3.64.0 | 1 
                     ace-7.0.6 | 1 
              alsa-lib-1.2.6.1 | 1 
                   audit-3.0.7 | 1 
                bitcoin-0.21.2 | 1 
                busybox-1.35.0 | 1 
                 dash-0.5.11.5 | 1 
docker-proxy-339b972b464ee3... | 1 
                   eigen-3.4.0 | 1 
                  exempi-2.6.1 | 1 
                  ffmpeg-4.4.2 | 1 
                     frr-8.2.2 | 1 
glibc-2.35-96-g2c4fc8e5ca74... | 1 
         gobject-introspection | 1 
               gocryptfs-2.2.1 | 1 
          host-gcc-final-9.4.0 | 1 
host-google-breakpad-c85eb4... | 1 
             host-gtest-1.11.0 | 1 
       host-libodb-boost-2.4.0 | 1 
            igh-ethercat-1.5.2 | 1 
ktap-23bc7a4a94bd9e4e1b8b7c... | 1 
           libfreeimage-3.18.0 | 1 
              libgcrypt-1.10.1 | 1 
             libgpg-error-1.42 | 1 
                libmdbx-0.11.7 | 1 
                  libnfc-1.8.0 | 1 
                   libnss-3.78 | 1 
                 libusb-1.0.25 | 1 
           libwebsockets-4.3.1 | 1 
            linux-fusion-9.0.3 | 1 
                     mtd-2.1.3 | 1 
            ocf-linux-20120127 | 1 
                    opus-1.3.1 | 1 
               pcsc-lite-1.9.6 | 1 
      qt5webkit-5.212.0-alpha4 | 1 
                     refpolicy | 1 
              skalibs-2.10.0.3 | 1 
    toolchain-external-bootlin | 1 
                   uacme-1.7.1 | 1 
           uboot-tools-2021.07 | 1 
                 uclibc-1.0.40 | 1 
ulog-0389d243352255f6182326... | 1 
                 wavemon-0.9.4 | 1 
                wtfutil-0.41.0 | 1 
                       xenomai | 1 
                  zchunk-1.2.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |           4th-3.64.0           | NOK | http://autobuild.buildroot.net/results/1a03ddd082db8a824b4a513a54d17cd1dc5b4a02 |     
  aarch64    |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/d241f00dabd9d66aadc488ae6780fe2298b8d52f |     
    or1k     |        alsa-lib-1.2.6.1        | NOK | http://autobuild.buildroot.net/results/37372becabb8f2ada8465ce0133329dbb910b4f6 |     
   armeb     |          audit-3.0.7           | NOK | http://autobuild.buildroot.net/results/94c35e193efb5e8d632e3db05396cdbe0c1bfc9c |     
    m68k     |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/b779ae54c80dded754917a1bbf97a6ef80ed69cc |     
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/be957ea73ed1aa63c55d8221d23ab74afca9ed2a | ORPH
   sh4aeb    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/d98a8a0d176ccb6f07361fb91e873b8392938543 | ORPH
powerpc64le  | docker-proxy-339b972b464ee3... | NOK | http://autobuild.buildroot.net/results/98d3a2135f9062e0902e3fdfe403137733001386 |     
    arm      |          eigen-3.4.0           | NOK | http://autobuild.buildroot.net/results/d57dbec52074a0aa2b9700729fe936192505ab8d |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/400c3cb85ce50400bacb3bb2c85bd003c75a25f8 |     
    arm      |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/db928c9f1b3e12b2c72322b7db72b696d4094c3e |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/8669c191d9b2e01e98d93901310182bdfaf359e5 |     
    or1k     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/65afbbaf2e4ba0d06fa53b232f1657f3aef7ab93 |     
   armeb     |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/26c56ba0285c99381a4052ec209a6d0be576e4f8 |     
  riscv64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/bb4f98f4f95f3ff1969054094187853727ad442d |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/5594faa8e5d97b3865105108d0a8b5cf0029685b |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/8f3c3c31d2de77f8395c96ab361981e158ad7ec8 |     
   x86_64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/609e0920b5927d5dd1686a2592d0aaa35110b43c |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/7eec3f9a63ebfbd615a8cc36e8e4a67163556ae2 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/1d4cea5d3fc9e766d8291971617d64debf72ff0f |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/2dddc1bb8a41aeb201a189f4189acf73301b92f1 |     
 microblaze  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/66d65056a0f360576c8572937d6fbe64d7e34be6 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/be9d3981345a4f34e32198b51b469c1ecf372060 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/218fb0528b7a27d551a66cb008bb8191bc426a5c |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/bb2450a75b67fb3000124b4c057c2ec87440d76e |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/8b80e740cd13db653f788f7734f254a97aafc2e4 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/f34d3e4029293c127d2fd74018dc1ea6d155ee3d |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/5da07431104a8a44cdb39b52e432883c9a660a68 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/cf575e8b02ab936855923b1273eeafd9ed6bd662 |     
   nios2     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/6bbbc5aa7c8eabd6287870636c3e0d56856fcb42 |     
  aarch64    | host-google-breakpad-c85eb4... | NOK | http://autobuild.buildroot.net/results/f61776b48574a04ac1c71b9b9fab61872f1c9a25 |     
    arm      |       host-gtest-1.11.0        | NOK | http://autobuild.buildroot.net/results/33c077959ca0e529f9fc321d8968c2e4632837f7 |     
 microblaze  |    host-libodb-boost-2.4.0     | NOK | http://autobuild.buildroot.net/results/b7acb03dfc7c7ce27db5536d337f4d61a8cc7a4d |     
   sparc     |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/131b84d4c39206670aa30e08bd02f81f706aacf6 |     
   sparc     | ktap-23bc7a4a94bd9e4e1b8b7c... | NOK | http://autobuild.buildroot.net/results/e3db7d7259b27753d9b22203c028c2e8687f5226 |     
    i686     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/df68f51f8eb99e80f35ac2c8ddcbedd75a67531f |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/052ad9fd1babb295aeca291e7a53b4e646fd892f | ORPH
  aarch64    |       libgpg-error-1.42        | NOK | http://autobuild.buildroot.net/results/1a481e0b63e3ecef233cade155a0f5b92bd28080 | ORPH
 microblaze  |         libmdbx-0.11.7         | NOK | http://autobuild.buildroot.net/results/2c3cdabe5d7c732180cc90eccb9a1205fbe0e780 |     
    or1k     |          libnfc-1.8.0          | NOK | http://autobuild.buildroot.net/results/44bb8e2a93c7eab27db10e12b91c4507ec64587c |     
  powerpc    |          libnss-3.78           | NOK | http://autobuild.buildroot.net/results/806179156b5e4825537fe2631a5a081f217105d5 |     
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/c43c9f606a3010f0f38ad78630c757c8e5ac0cd6 |     
 aarch64_be  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/22cdacaba4f8fc1dde72ea84dbd2a44edaa07060 |     
   sh4eb     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/05e469e9de4ce5c129426f99cc5116c61a100607 |     
   x86_64    |        libostree-2022.3        | NOK | http://autobuild.buildroot.net/results/a5d41db5ee7958cc1cc698200d782fe19017d19e |     
 powerpc64   |        libostree-2022.3        | NOK | http://autobuild.buildroot.net/results/d9a7e9981ff4754bee0cbb87b4ba5d0a23b0e4de |     
    m68k     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/3e07759600cc43575ec9e785846357c6494e9354 | ORPH
   mipsel    |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/b50f74e5471bce33744e1b3d6d9f7995821ac808 | ORPH
    arm      |         libusb-1.0.25          | NOK | http://autobuild.buildroot.net/results/7b15e23392805f5109c136a5aa870ddf49f48814 |     
    arm      |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/2ae9e3249b6fcc9e6c30e7783e264fc6599e61df |     
    m68k     |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/3513b924211eb09376d9f7b9f873e76281c068c1 | ORPH
    m68k     |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/503e8ec5ae9fdeac7e13e6a57ec5b42f7e91046b | ORPH
 aarch64_be  |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/89c9be4735339eae5680a669ba55c7763c190d3d | ORPH
 aarch64_be  |           mtd-2.1.3            | NOK | http://autobuild.buildroot.net/results/eaadf7b99a064b55a50b78b23c6b762f1efcba27 |     
    arm      |         nodejs-16.15.0         | NOK | http://autobuild.buildroot.net/results/c9fe563026888c69e03e611bfa6bd408613342d3 |     
  aarch64    |         nodejs-16.15.0         | NOK | http://autobuild.buildroot.net/results/5a2b19745b59c606af3183077060cc2695bd52e2 |     
  aarch64    |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/029d16648a19708c0945d35ef13a8dac3aa3aa07 | ORPH
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/9066cc595676f69af70cd58d2985f56618fb4c4f |     
  aarch64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/8d97bd5db39efa3ac2061da835d8f8627b763a83 |     
    m68k     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/9c8a279892f12bb9da7a4e5609e4ba96aa7458da |     
microblazeel |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/00575ddb68f4639c1a07c77673f1775ec48599b3 |     
   xtensa    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/38e9df1b80b7d32ab77b3936c7c36c13a4e8d8ef |     
   x86_64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/e7502a0dd8d55eabbc036479bab49c1901aa5c6e |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/a99e07939bb9db220b7c48b19ee78ebc411beb68 |     
  aarch64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/b31980a15ebc25ef248845426abdb9afc7794a24 |     
    arc      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/ad13b8a485432ba93b9a7e7580bef37605dffc06 |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/aed7ee4edcb3c0791c3dc6cc15a82f5d6296cfac |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/079e0461bf9b264b6ba36a9b682ca705d513f14c |     
  sparc64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/3c7ef8ac4768a2c57920568d774eca69ef75914e |     
  sparc64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/469013fc4be26d34b553e85c3ec6ae3d2ec31e5c |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/e7d0afe7cd5069ede3c80def48989559c36860be |     
  riscv64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/502c371156525592a0b6591cc400f2b5b6d97c99 |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/a59a87b926bb5b47742df1819cfc7b20ea2cc08d |     
   armeb     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/8a2f2b689c9c796be97a6436bedc8ddcce55b8b5 | ORPH
    arm      |        pcsc-lite-1.9.6         | NOK | http://autobuild.buildroot.net/results/189f030a2252f17abf8b819feec0003815c66e79 | ORPH
  powerpc    |        pipewire-0.3.51         | NOK | http://autobuild.buildroot.net/results/a2c763c38a3d3f767427fd6710f89a0122ed36ff |     
    i586     |        pipewire-0.3.51         | NOK | http://autobuild.buildroot.net/results/9081b3bc8f5e842eab63a09d99a6174b2df3765e |     
   mipsel    |        pipewire-0.3.51         | NOK | http://autobuild.buildroot.net/results/374582f75713c4116ae23f972c5bc55214879502 |     
   arceb     |        pipewire-0.3.51         | NOK | http://autobuild.buildroot.net/results/36d8b98ec6fc9d3764697d54c8ab3cb6edc44e0b |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/8beb5716af6a5ea72a10afe6abd24c93fde7ce54 |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/223cc06cfa1f49f92c5edec42669aac4f5e23382 |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/66a5e4ee4cb306c54e147d37a451a4a9265bb057 |     
    sh4      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/adc7bf2f4bd6d04dd67966996c4765625aeed970 |     
  aarch64    |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/eb4f41bc6d871dfa1a029686afc1f1df768a66d5 |     
  powerpc    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/7899465c7f127f9d324ee43f2d9c589b78b0e665 |     
    or1k     |        skalibs-2.10.0.3        | NOK | http://autobuild.buildroot.net/results/c84d21dc05e84c35e7a43cd7081066b81074844b |     
  powerpc    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/29da4963eca13c178536274774fabaeb07307c51 |     
  powerpc    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/519162eb1b3f8a38ef41417e414527554f954d0a |     
  powerpc    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/d1eb748140d6fd77d175e464741a497654dc4e74 |     
    i686     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/d8f40b2e75fe19f2002e20549f9fcc134be8add5 |     
   nios2     |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/508109a99cabc0a60267bf76c2ac06d5ad086827 |     
    arc      |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/6ced3668c35e8fd1d5fdaae9d37dd59854fed5e2 |     
microblazeel |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/4a2764527775427a466679a1fd2cbcc2555f20f9 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/4c0b384544cf866fa7a3596f8aa762c348528284 |     
  riscv32    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/0bcc51560e9e4f27996077064cba7de7269f4985 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/ab50c4a8c59f203c13d7898f1b513bf38e6e27dc |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/4bfd9433c257cbb6b5edf2b0e1ecf3e8def17c55 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/95627d8425d097d3391bff4fd543fc2bd085b3d5 |     
   mipsel    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/3fdb63dab1d39cdaf22c0bc43bad7a82c451f23e |     
powerpc64le  |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/6358bff6bdf8c9b246596e7cbb9cc7392ff53c2b |     
 microblaze  |            xenomai             | NOK | http://autobuild.buildroot.net/results/fe3e0b29f6a81b5827886873f16b9280e0d07fc1 |     
    arm      |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/e8404b6d1499eca5577fdd9a925f9fca364c9816 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/f4964e74b173e7b677faf6accd1b4c02606dfc58 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/a6d778c773c030cabd5db773af8f94228d1ccbcc | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/86071edbdaa9c167f5f5cb4fca09eaffc5cfe003 | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

package/pcre2/pcre2.mk:33: ... | 2 
           host-libselinux-3.3 | 1 
              pcre2-legal-info | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/3a8395101b02c65257aa5c451763f11639a390cd |     
  riscv32    | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/6156a020d3479fb251e259e41c5af1be0fe65a43 |     
  aarch64    | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/8e64f958f27d1b56cc1229741adf2643dec2987c |     
  powerpc    |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/32fc0d56ebd67a9dc55b8a9827eadba430eb0863 | ORPH


Gitlab CI results for 2022-05-27
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                amarula_a64_relic | https://gitlab.com/buildroot.org/buildroot/-/jobs/2508551352  |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/2508551388  |      
                      bananapi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2508551399  |      
                 bananapi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2508551401  |      
                 bananapi_m2_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2508551402  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/2508551406  |      
                     csky_gx6605s | https://gitlab.com/buildroot.org/buildroot/-/jobs/2508551423  |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/2508551446  |      
            friendlyarm_nanopi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2508551457  | ORPH 
       friendlyarm_nanopi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2508551458  | ORPH 
           friendlyarm_nanopi_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/2508551463  |      
     friendlyarm_nanopi_neo_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2508551465  |      
            friendlyarm_nanopi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2508551466  |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/2508551468  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/2508551488  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/2508551489  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/2508551496  |      
                    licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/2508551503  |      
        minnowboard_max-graphical | https://gitlab.com/buildroot.org/buildroot/-/jobs/2508551524  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2508551563  |      
                    orangepi_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2508551568  | ORPH 
                     orangepi_win | https://gitlab.com/buildroot.org/buildroot/-/jobs/2508551572  |      
         qemu_arm_versatile_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/2508551585  |      
             qemu_arm_vexpress_tz | https://gitlab.com/buildroot.org/buildroot/-/jobs/2508551587  |      
                qemu_m68k_mcf5208 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2508551588  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/2508551630  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/2508551637  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
