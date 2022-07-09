Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F75AC433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Jul 2022 05:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8219B84B2F;
	Sat,  9 Jul 2022 05:35:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8219B84B2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x69D6-r4zjI1; Sat,  9 Jul 2022 05:34:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 166B884B25;
	Sat,  9 Jul 2022 05:34:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 166B884B25
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D0BAE1BF5AE
 for <buildroot@lists.busybox.net>; Sat,  9 Jul 2022 05:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8966C42609
 for <buildroot@lists.busybox.net>; Sat,  9 Jul 2022 05:34:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8966C42609
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6D3JZoEt8vR9 for <buildroot@lists.busybox.net>;
 Sat,  9 Jul 2022 05:34:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65EAB4260B
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 65EAB4260B
 for <buildroot@buildroot.org>; Sat,  9 Jul 2022 05:34:52 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4D71E40003
 for <buildroot@buildroot.org>; Sat,  9 Jul 2022 05:34:49 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 09 Jul 2022 05:34:49 -0000
Message-Id: <20220709053456.8966C42609@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1657344889; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=00Vjs/vUMB85FMonkmbHef4CMpXhzVjc6xLjixl4Yp8=;
 b=ZphqL9EkFt/8HyJoqfZny9JPtzNsksxmuNB5fWa5sZP+9z115ZYrTz0TXC2rcbV6aIGu4J
 cg8XLluMhzVDxawZ4ozJ3AbJ5dycXZMzQ8oWxHGOssPo1JkduNplqlXWtBPvNSYW4X6BEs
 kfkTmcCYpKQCVe3BbY6wLmSzBq+gSsdOPrlraZW0l9ES+ePwVk+Fo9Gjpkw/XGZn+imNnK
 1uQqemeled7lAYRseHy/iZOk6ftxvkrdBZQhwv+82u3B4PcNnkJih0u1qL1CjGGLRU/+5x
 ghfVy6YkmpxWKCRsqKWjVEWuE1mLVXWBaTCTg2hwIDCi5+6Dwg4I7KxqleLBNQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZphqL9Ek
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-07-08
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

Autobuild statistics for 2022-07-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 23  |  4  |  0  | 27  |
  2022.05.x  | 30  | 32  |  1  | 63  |
    master   | 112 | 212 |  0  | 324 |

Classification of failures by reason for master
-----------------------------------------------

                libcurl-7.84.0 | 47
              alsa-utils-1.2.7 | 15
                       unknown | 15
                 linux-5.17.13 | 11
                   speex-1.2.1 | 9 
                 uclibc-1.0.41 | 6 
host-pahole-73383b3a39afe86... | 5 
           libfreeimage-3.18.0 | 5 
             libopenssl-1.1.1p | 4 
                     refpolicy | 4 
                speexdsp-1.2.1 | 4 
              swupdate-2022.05 | 4 
                busybox-1.35.0 | 3 
glibc-2.35-96-g2c4fc8e5ca74... | 3 
              host-rust-1.60.0 | 3 
               protobuf-3.20.1 | 3 
  gobject-introspection-1.70.0 | 2 
host-spirv-llvm-translator-... | 2 
              libgcrypt-1.10.1 | 2 
               libglib2-2.70.4 | 2 
                libressl-3.5.3 | 2 
                 libvpx-1.12.0 | 2 
                libzlib-1.2.12 | 2 
                       xenomai | 2 
                 zlib-ng-2.0.6 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
                     ace-7.0.6 | 1 
                  acpid-2.0.33 | 1 
afboot-stm32-3566acd582e553... | 1 
               apcupsd-3.14.14 | 1 
              asterisk-16.25.2 | 1 
                     aufs-util | 1 
                  bitwise-0.43 | 1 
                    brltty-6.4 | 1 
                  cmocka-1.1.5 | 1 
              containerd-1.6.2 | 1 
dahdi-linux-5c840cf43838e06... | 1 
                 dash-0.5.11.5 | 1 
              dieharder-3.31.1 | 1 
              e2fsprogs-1.46.5 | 1 
                elfutils-0.186 | 1 
                  exempi-2.6.1 | 1 
                  ffmpeg-4.4.2 | 1 
                     file-5.41 | 1 
                flannel-0.14.0 | 1 
                     frr-8.2.2 | 1 
                gnu-efi-3.0.10 | 1 
                harfbuzz-4.4.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
                host-go-1.18.3 | 1 
           host-harfbuzz-4.4.0 | 1 
            igh-ethercat-1.5.2 | 1 
                jailhouse-0.12 | 1 
              jpeg-turbo-2.1.3 | 1 
                   json-c-0.16 | 1 
                  kexec-2.0.24 | 1 
            linux-fusion-9.0.3 | 1 
               lpc32xxcdl-2.11 | 1 
make: *** Waiting for unfin... | 1 
                    musl-1.2.3 | 1 
                  netsurf-3.10 | 1 
                nodejs-16.15.0 | 1 
                  ntp-4.2.8p15 | 1 
            ocf-linux-20120127 | 1 
                  octave-7.1.0 | 1 
              open62541-v1.2.4 | 1 
                    opus-1.3.1 | 1 
                   perl-5.34.1 | 1 
                 pixman-0.40.0 | 1 
           powerpc-utils-1.3.8 | 1 
                     pv-1.6.20 | 1 
rpi-userland-14b90ff9d9f031... | 1 
       shadowsocks-libev-3.3.5 | 1 
                   tor-0.4.7.8 | 1 
           v4l2loopback-0.12.5 | 1 
               valgrind-3.19.0 | 1 
                xenomai-custom | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/c395bcb65d30353d77e5d295f323d16bc058469e |     
 powerpc64   | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/b140e6a52b96382fd3a0fdbee115249256b7e2a1 |     
 microblaze  |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/c55de4842ebb1da1dd37cb90907daf6b45f8c4f7 |     
  mips64el   |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/7402ebb0ff343c4b8477b4022bfcc4c3b3fa604d | ORPH
    arm      | afboot-stm32-3566acd582e553... | NOK | http://autobuild.buildroot.net/results/52ecb2fdbd6dc5ed4cb258407e637f792a7a7fde |     
   sh4eb     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/e833b1f51d5d464fe9e3916caa43e53ffadc9897 |     
 aarch64_be  |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/f619dc7f39d6fa2abeca6f598e20e03c89a7a7ab |     
 powerpc64   |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/158523dd36074ecb737dbc399bcae1b8425d9452 |     
    or1k     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/89ff1b81662e8274ce991819c5a8fc5cffc286e7 |     
microblazeel |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/84ea323452e60d33a99bcef69bc9f4051eea0759 |     
   sh4aeb    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/6fa6927e2be45310d3f37580cca5ee7a07265662 |     
  mips64el   |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/8b45b6aa59522b99fb3f18048909797a8a38968e |     
  powerpc    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/408c131a5e7abbc2401b7d83112ce0dac3778ba9 |     
   s390x     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/86a5c734d993bca40c2eb373792043a71fbe7099 |     
    arm      |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/2b16576b3e23bdee1454af289786265248ac2de9 |     
    or1k     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/32073c6d5419557918a21483801dd17d8fa91e02 |     
powerpc64le  |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/bab2335bdf4feef6ed9b834a12ab72450231d69c |     
 aarch64_be  |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/3764cf2b701f58a9b6ed0ccf462dd1e9d0a6e31c |     
   sh4aeb    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/2e16a04aec2fdde6ed3d5221a2506a320c3fccf5 |     
   arceb     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/0468cbea8cda474901d5d7c5d3d6e117217e05dd |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/45bf59bd57a8f76eb1dcc4f080e66ccf094f2a20 |     
    i686     |        asterisk-16.25.2        | NOK | http://autobuild.buildroot.net/results/58e9c658c9dedc16319477f3b2b646fee96ff14f |     
   xtensa    |           aufs-util            | NOK | http://autobuild.buildroot.net/results/f16eb7452e6fbd6b29507e15c38ff99eb689aecf |     
    m68k     |          bitwise-0.43          | NOK | http://autobuild.buildroot.net/results/d4aaa8d091c12100f8f605d6497fb07134d4c3b4 |     
powerpc64le  |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/9b7353c6a2cb1d6fe0108ed53af0bf2bd6ba679f |     
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/94aee05f2ac41c3540fec3324f0cbe3e23ae7bc7 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/2886834bd6606bb8e755fd17b8975f4dc1072522 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/96c4636b95e2b0264ff26901575fe49fd428c738 | ORPH
   armeb     |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/994cf98a589e498670077638f68b91b84d54a6df |     
powerpc64le  |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/b4730f26cbca237f82c0e85cf1df6041dba8c295 |     
    arc      | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/cd7b55c4694f29d1ebddd0e855254a3e9ffd32c6 |     
  mips64el   |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/0946f1444d9d101bcf877a244663a6647c046ea1 | ORPH
microblazeel |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/ab29d0ce6ba812cac0ecc5c5ececbd52ece1b42f |     
    or1k     |        e2fsprogs-1.46.5        | NOK | http://autobuild.buildroot.net/results/f21a25c83656ff3632faae52cbfe7f1033ada947 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/d424eae10f3711c311dd5380b718c641a2a2220a | ORPH
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/7a400ab1fedf73c7ce3fb50bd00958ac744a3a10 |     
powerpc64le  |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/9c23acfcfc02253914ccdcdb25ab87b704300f25 |     
   armeb     |           file-5.41            | NOK | http://autobuild.buildroot.net/results/a8c61e0b706b2d00ac87f20a7bf91fbaca740ce9 | ORPH
powerpc64le  |         flannel-0.14.0         | NOK | http://autobuild.buildroot.net/results/eab4ec627d7a1657bcde0f9808f09afd27bad5d0 |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/faeb0c857ace68b307b5fc26954680f3c27227a7 |     
    or1k     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/6f83191fb1b776c9e73a95114dc0cc7cfb77a216 |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/d3a9c577628b4eee049f5d7572531ba8d52c4e15 |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/4b613420d3e50f2bf380c01d25b8ce8261245e05 |     
  mips64el   |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/ba55344e5f4e690a853636e9b831ad4d3303f97f |     
   armeb     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/3864b0dab2566eb5732ef5d66166480ce04a4efb | ORPH
   nios2     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/7601449ce386d94d961582e7889ce6c50f4e0467 | ORPH
    mips     |         harfbuzz-4.4.0         | NOK | http://autobuild.buildroot.net/results/e6a4e12a7d8026b5358c5fb8732720d7ba8d7447 |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/39d811d464e8babf7caf5a3c4f5044a7da966618 | ORPH
   mips64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/6e7dbfa61703a0a5a2a5105a03c6cc9b15b83a1d |     
 aarch64_be  |      host-harfbuzz-4.4.0       | NOK | http://autobuild.buildroot.net/results/98bee53c98e217e3b94aa165b18fa60bed8591f0 |     
   sh4aeb    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/dda712d86a47d58490363361ad92f258324a2bdc |     
    i686     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/c13730784e58ac86172abe99deff82aaf6aa975e |     
   xtensa    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/a5b569cc02bb693d56aa7e5439d0153f337c96e9 |     
   mipsel    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/bb6ccd113b24314b5b95fc8b8b7af711d94f789f |     
  powerpc    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/25d69287c52426dcd863dce513ec2a082fd5d3aa |     
  sparc64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/5bba35aaad4608393569e4792733d83159d5f5c0 |     
   x86_64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/b3aa106162084cc6de49afab2f4558c81cce0c75 |     
  sparc64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/fedb7b735f7315ca8840f3ca48c038a876cd6543 |     
   armeb     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/c54df4071c6282cad12fd791daa5ac2a260e2288 | ORPH
  aarch64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/1eeeb968a5bae70b81cf3e244c82803aa3506011 | ORPH
  riscv64    |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/a83f0356be9924bedee7cb675faa265a40316064 |     
  aarch64    |         jailhouse-0.12         | NOK | http://autobuild.buildroot.net/results/c4b43d4993effb3d99c1bc2f89050c0d73f426a6 |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/23afe92be05e75ae9df72d1ac68e23d0d427a671 |     
    or1k     |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/633fb535c6e2c29091e52c7da34641b6f460d910 |     
   armeb     |          kexec-2.0.24          | NOK | http://autobuild.buildroot.net/results/1851d7a17100955a4c837d2f9f4a068a8310197e | ORPH
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/b51b60a9a8a375eae387cbdbf64e39d8a09e839d |     
   sparc     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/7e598a97f6a3cb17164f8e603919754d5130cf2c |     
   armeb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/80b907d299968551961c38aa56a3e67a89bb6b86 |     
   s390x     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/27088ab7c4137fa7681f4da4989027a6860d5128 |     
    sh4a     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/47304ceb0ba6be1264bb6c785e164eeadcc05319 |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/a1df3a3b28fc3399b48fd125ecbc231ffbedcaee |     
   mips64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/b38a6326549e699d53ba0019019b927c2e3b4fbc |     
powerpc64le  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/eee3eeb8bc96b8cd570f01f5fe18cec0a2bbba33 |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/c5aca5b95d11f2a108313bfd8ff36e132af5cd80 |     
   sparc     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/ecbc6a5401f2ff7bd57f0d31b867fd34aab7391f |     
   armeb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/dad03333b0f037ef52e30e284d8c65ba8d8b00b9 |     
    mips     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/d2fcac2666172a09f3900d008fc7af8ac61607b1 |     
  riscv32    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/3e213dc99bc00928e57071552f648940a1603d86 |     
   nios2     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/b7944f91ffb088ed571325b16f194093b2691e5e |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/9a17af03a02f44e6ff2ea1de8f5f79acc9e0490b |     
    mips     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/349fcd9b5deff5d4e9c8ce59ab7698bd57d8fc52 |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/798a584abae5bf990049a995b04660947699d25e |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/effddb423616d9a5905c17965dc3501999649794 |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/a9ef4147b00f35a4fae1e27078cfaebad45fed45 |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/f2dec14ecc877edcded57897b27d8e06df042656 |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/54f51816a3ab10368102c4384dba617d7b4859a4 |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/64924e2c3d61b4b6f556c84fb824d19a89fc69da |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/27348fee4de9c83f2c5c2598dbfb45a8c8e1cc97 |     
    or1k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/14348542964f845ce79195e286cfabc99c157097 |     
    or1k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/93549b572f42f9f5e0aa58bb30bc9b161e66f0bd |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/0bab569c6b41b432b3c080a9f766f6b5fc4b65ac |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/134b78b88e478a38583ad8285736d723fced141b |     
 microblaze  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/a4a53332682235ff468976d7f5b87b7c5618fabd |     
   mipsel    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/065e007963a49835133ff19d4f1731f895958f09 |     
   armeb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/b9c78ee6263442e92bd35b6bb959bf8fe7f919fc |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/7fa71404e3ccb84f042d7c3c3d1f0a9ba72a6a17 |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/441bfe523fdcd2473a251c77a52886fa28f172c1 |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/6ebb98fa374ce59b5f265f3b1cd425a39d33a28f |     
    m68k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/c438dff8b9ba5c02f5aafbb9267c9f7dd6f70a20 |     
    sh4      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/70bca30391776d7eb65824ea1ebbb91fc78ae909 |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/b5912432458e5b0437929ba69ace9ac089111c65 |     
    or1k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/a49de5146391fda62bedcde1b8de0a9042272c4d |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/4eed016f84cd31c011a2b926f3451fbe13262dfe |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/09b95f141cfff6a059af89db4d09f7cac626405a |     
    m68k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/cce4b1bbb662ebeb351807895c35ab33922f4177 |     
   mips64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/165a44ed41f30dcf1912e4dd4510369f1372b13d |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/11066073f3a99afddd6c7380e4432a24a625d829 |     
   arceb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/c361a0d8f43964d70a65944620bdccef8e42b38b |     
 microblaze  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/f6c6d52647b5799b1d4ae745a8c450fc3ce0df2a |     
   sparc     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/ca4148d80d233745d0dac77572837001f5382e6c |     
 microblaze  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/549ac399b16c3e9fa4a6ff17ba3c5b4e22bc68be |     
 microblaze  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/3472ffc2eff4bfab28d4182a20b6f0e5e70f660a |     
   s390x     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/628e609e04f0c47110bcd39b2c7b8a70da044cce |     
    i686     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/3317a1b159135648d41be9bfbc4ca2d07a622719 |     
   x86_64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/c509c374df866229b0bddfe31439cd78556f1316 |     
    sh4      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/bc6aa1230e6c7272c5fd115dc1e0ef18c30ad717 |     
   sparc     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/d29a1b4ed8788261b29cd03331085a2925ecc1b8 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/c0e22fbf6ac97ad5304cfd574e2a406002f1747e | ORPH
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/e8f08d6c7360f1ff4d1483a0f69788f4e68e1f47 | ORPH
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/655f0060a94cc55d76493794876f7a1e0b52be16 |     
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/620dc3872066413ce862c9785a3ca003c5d39a4a |     
   xtensa    |       libopenssl-1.1.1p        | NOK | http://autobuild.buildroot.net/results/8d9221372f3104eaffc9e809751b03f509860904 |     
    m68k     |       libopenssl-1.1.1p        | NOK | http://autobuild.buildroot.net/results/e96f8805f86e9f3c4fa4d81fafc0401ec71f09f7 |     
    or1k     |       libopenssl-1.1.1p        | NOK | http://autobuild.buildroot.net/results/3c64aa766019cfa275e5b4fd55cc2d2a3db10d9c |     
   sparc     |       libopenssl-1.1.1p        | NOK | http://autobuild.buildroot.net/results/fd5f1ec37b2c72277f3a072ae141edb1a0227b14 |     
    arm      |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/512ce885e2688dc82ee6bf2f1cf8b8c48b1c2262 | ORPH
    m68k     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/2dce400bf4bb94424d681d4d719735ba68962c64 | ORPH
    mips     |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/a3524b954e53002973b423ce23b4c43ff5281ab5 |     
   mips64    |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/81d6df579e53cc80c9bcca1ef0c1f215dc35c01c |     
    m68k     |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/1c271cc9edf0a09892a0ac5d97b986c0ad311aa7 | ORPH
    m68k     |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/6f0b7b29d4245a2f35c72e4e3b2c169eac07e4cf | ORPH
   nios2     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/1f64a0c418e6d891a9160a2e369d6bbb7f98b458 | ORPH
  mips64el   |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/bb5bcf43d8516faedca3ad3a8bad430267828d24 | ORPH
    mips     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/b00f3ef4286592243ceb7cf78c030e54a737fe2d | ORPH
   s390x     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/a96b8b4292b627e463b77e6be5b4d4e30889e20b | ORPH
   nios2     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/2738257650594fb4caf12671ec95975fa423ef12 | ORPH
  mips64el   |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/3e6e150476e662eea47b9a9e2055b42ffec0b35a | ORPH
    mips     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/802970d67858aa0ed9c935a96f6b2145eb912c84 | ORPH
    mips     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/e1482b59a2448431f1d1f47e250260dfeb92e9dd | ORPH
  mips64el   |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/771ec404ca5e16c4d6e82d73e417eeaf22d029f2 | ORPH
    mips     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/6bc77ec9764e00e03fdacdb3ad5b61d51a7a1f8a | ORPH
  mips64el   |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/da197f8889dad2002afc55ba38a53b86858ff899 | ORPH
    arc      |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/90e112d1ce04f40c51b6201e8e3f0a15dc22e558 | ORPH
    arm      |        lpc32xxcdl-2.11         | NOK | http://autobuild.buildroot.net/results/439f99a49101b070b14e623305b52e8a7c8f2da6 | ORPH
    sh4      | make: *** Waiting for unfin... | NOK | http://autobuild.buildroot.net/results/c9e9259078635c2c37f12ce0d7081a4a4424c0a3 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/8e867c4278058491807c3db801623484201da9d1 |     
  mips64el   |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/38434f4ab3bb3a211364a48790770681a11161e2 |     
    i686     |         nodejs-16.15.0         | NOK | http://autobuild.buildroot.net/results/ed89f7272bf8fc398178319ac7c17a40583ff4af |     
    sh4      |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/e930e6fc1a4e897353607b2f9013e577676878f6 | ORPH
   sparc     |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/a188718d921414898181ba0b1eae9ae952cb38b3 | ORPH
 aarch64_be  |          octave-7.1.0          | NOK | http://autobuild.buildroot.net/results/f7d869d3025d2306c924239998bcb503580cf2ca |     
  riscv32    |        open62541-v1.2.4        | NOK | http://autobuild.buildroot.net/results/b41547b543000a77ce175838fc43fe000597ad15 | ORPH
   armeb     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/a9021fd4816ddb5a6949abeba1efc76ea7dbd627 | ORPH
 microblaze  |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/92e1f23fbb8f12686bf0fd85dfdc0a14f93baf72 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/a681622f5a3bf5e0e3663fa713d618f55d1d8359 |     
powerpc64le  |      powerpc-utils-1.3.8       | NOK | http://autobuild.buildroot.net/results/d28385894bd55d0d0741ddada7318269d0c521f2 | ORPH
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/c1a0f4348447d79c48918c08c2f825e7f544d402 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/43f536e46c538d234ef0cc97c4f8880f090a659a |     
    sh4      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/8990238383a7e98493887e60d02163003c2de583 |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/84c8382f6a20414eda4f0d962a67d789850ea22b | ORPH
    arm      |           refpolicy            | NOK | http://autobuild.buildroot.net/results/cf9cf5123eb5c100da1921e6ff8e365e084db0ad |     
   nios2     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/86f4cd2e7c68b78cea59ea191d768508a8fa1376 |     
   mipsel    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/69be8765c5e7d61b8617420b0050fa8ddd9f1c65 |     
   arceb     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/4f066d6d8517c641bd18218b219fca3bff772504 |     
    arm      | rpi-userland-14b90ff9d9f031... | NOK | http://autobuild.buildroot.net/results/e1472cca2290934bd9e5be4be7040efbaddb83d6 |     
  aarch64    |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/2f75cfd928700af1e458866cd719f54f5e8c88bd |     
    i686     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/0c0675f9debecc6f6f8cb2df20942d5832fc16a3 | ORPH
 aarch64_be  |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/9347448c07843ab77dfa55ce651a99218f112a5a | ORPH
    m68k     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/a2ca5c2afd5af700ba91514aa9bd4500c999f44a | ORPH
  sparc64    |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/ff3b9fd7170e8c4afe4cd0580cc31a62e3d97d3c | ORPH
   sparc     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/dc9cdd53f9f2645ff8fbc972dad9e3dd3fa146d3 | ORPH
    sh4      |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/c244a592455e63dee86775e059befeb532efb41d | ORPH
    i586     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/8a2cad1cfdd5cf5138dc37f51d88a558e343b687 | ORPH
    or1k     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/caf1afa3ed0cd700d96be6ba2b123af92042ef5f | ORPH
   mips64    |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/67c7d7811ddb075b48efd612d99d99bfb5d5f0e6 | ORPH
   x86_64    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/71a156c39b8a99a9d4433f7deae990f48234616e | ORPH
   s390x     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/a62d27cc8ddab501cf296d8c0c0f75febc9cdc9f | ORPH
 powerpc64   |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/5191e88e5e01485266d2ab597d74722047b2b76d | ORPH
    m68k     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/4605ed8224638d4f492bacfe7389ec4cd8fd450d | ORPH
   sparc     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/32ebc5026d72262b728445e66f4743400c6d00c3 |     
    arc      |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/29b6ed397641cd9aee81c9a556bb856e973c0f3a |     
  powerpc    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/d26905b6745eec56d49bf8b5d708546d8b89e1ec |     
    arm      |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/e67a39e6c56ee567d2ae9c90b8b05128be3a591f |     
powerpc64le  |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/241207bdd7c97eb23edb738e8cba2d87e56664b3 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/a329fcba1bc62a36d54b2e3afd4539d67d0addc8 |     
    arc      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/33f27a1b1a427e0dfb6af0b95536ee5dc34ee7b3 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/48c6b0b257a5138f56fb9b977e0c2b78e23d004c |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/95588b9b3e293999d0d5e17b43be115f850d75fb |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/cc80a044ba538dc534eb7050b12c72c619e5b6a2 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/2e2f04645c0e3b34b2284b4ff3dce8b8dc45632c |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/e6b4e48823f2c273b75c5a2d9642eddf69267acf |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/acd389ddda3f750f0b0891404e08386b46f53b2b |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/99e6e1e482f03a90c886993dfbf1cbac4ed23e70 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/1e6edb3b5d84898cb39e651fde43cdd32eadaca7 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/464be8f11417ea89c98c45dcc1794fa1dd65a7f9 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/3ac77358a1eabad43ad8146a39c9239d01442560 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/ffca9d0c81f87d644e0bdf562704638414d3b2e2 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/b2fedb046e421018cede5fff6aca1f69b8fb2745 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/0614da42f705d6b78e0515ceb7c684ffc205d604 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/9aac73fed0179deb2d05549fd1357c8a14f56f7e |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/3d7be62d7e8d52a11363a1a97e53f2cd8f865b2d |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/e95473801c90973b472270a018b739d3c4772875 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/77cb195db095cff1be8fdf489256f108b2e8d359 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/29554d694838398bae1d428c155b78d15b4ce7cb |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/0e8d214804772a9ee558419f12959b84e5a44496 |     
   s390x     |      v4l2loopback-0.12.5       | NOK | http://autobuild.buildroot.net/results/4e10c0795e2003cf956a7ee128ebf93617de6708 |     
   mips64    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/a5bdb23ff8b9781d945da37dc5377ed51f8fc754 | ORPH
  sparc64    |            xenomai             | NOK | http://autobuild.buildroot.net/results/aea451d264a35f07eb442a8b5961c6b9e97dcebb |     
   nios2     |            xenomai             | NOK | http://autobuild.buildroot.net/results/e8e2824220f57a84c89ade67351134818e4ba9fc |     
    or1k     |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/0bb7c14ad51115d3b367c6ff23c501055a7b1725 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/2370c89b24078e4648cd3c65a9326925f2068e91 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/8af965f2f9ab293e725e1275e57c5693b884dbb6 | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                       frr-8.1 | 1 
google-breakpad-7515ab13768... | 1 
           libfreeimage-3.18.0 | 1 
                nodejs-14.18.3 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/81c1f5dfa6291a29fd6733f42e01a5f3b136e437 |     
   mipsel    | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/0656d52677b7e66106fcd86cd8e672548bdefc24 |     
  mips64el   |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/83e102833feee6debe156e3331c77baf715a9264 |     
   x86_64    |         nodejs-14.18.3         | NOK | http://autobuild.buildroot.net/results/21bf62044abb79f488a4b3c7222fe9f3d513dae3 |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

                host-go-1.18.3 | 3 
host-pahole-73383b3a39afe86... | 3 
                 uclibc-1.0.41 | 3 
                     frr-8.2.2 | 2 
                mongodb-4.2.18 | 2 
                       unknown | 2 
                busybox-1.35.0 | 1 
dahdi-linux-5c840cf43838e06... | 1 
                flannel-0.14.0 | 1 
         host-gcc-final-10.3.0 | 1 
              host-rust-1.60.0 | 1 
           libfreeimage-3.18.0 | 1 
                     libgcrypt | 1 
             libopenssl-1.1.1o | 1 
            ocf-linux-20120127 | 1 
                   perl-5.34.1 | 1 
               protobuf-3.20.1 | 1 
           python-orjson-3.6.7 | 1 
qt5wayland-ce2caf493a1343fb... | 1 
rpi-userland-14b90ff9d9f031... | 1 
       shadowsocks-libev-3.3.5 | 1 
toolchain-external-bootlin-... | 1 
                   tor-0.4.7.7 | 1 
                wtfutil-0.41.0 | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/50d79ed1285e5784f1da68ebc125def3abfb12a6 | ORPH
 powerpc64   | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/99ed72e9074b6a3b2cdd6f1be4357cefd07872e2 |     
    i586     |         flannel-0.14.0         | NOK | http://autobuild.buildroot.net/results/8200c1b873188f2222c81fa8491c5f809b839c12 |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/a124acd845f7f6b56db8560554da08eee72b2d86 |     
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/8180afd74d9bc383484652c7c4266be23154690d |     
  powerpc    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/80f9a17e82892763cc2627357312eaceabd6a4c4 |     
    i686     |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/617ce5014e4c2c244c195fd0aa20c692cca7fc32 |     
    i586     |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/aefe01c9a279b6f866332563763a0744790f242c |     
powerpc64le  |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/5cd892e94ad118c78987e4b83ed0d0446105a988 |     
   sparc     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/db9bd7a1ed88dcee205d110a2a9a7f043d7f15eb |     
   arceb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/9770197cbdd722a4a6aec5e051a2d87404e9292f |     
  powerpc    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/04db3b835b0b31fe0d395cf0ac269af8078973f4 |     
   armeb     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/56b44a563d0575a3d6e678d27d47b2cc6cf60c49 |     
  powerpc    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/73b1c2b2c9fe911e659757da00b86a03e12cce71 |     
   armeb     |           libgcrypt            | TIM | http://autobuild.buildroot.net/results/e1610466ef31dedd38817401f26e2dda3f191335 |     
    m68k     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/64db0bfa03ec9fc4b86de3ca6d0a1cbf5789c934 |     
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/3fea2762a97ff0bac9a3401b75d7932a0f785781 |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/4566e82a9a7d90f6a3102b32d251f2243ede3dc5 |     
  sparc64    |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/d3cc7bd15a4422024fedb6820c5be2cfebab29c3 | ORPH
microblazeel |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/bfb920086a7f4f543fac821bed9cc03a239ab3e8 |     
    sh4      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/1cc9a1fd91f8ff574a04701a005eff24aa5e21da |     
   x86_64    |      python-orjson-3.6.7       | NOK | http://autobuild.buildroot.net/results/e7ea4c75b0df79b5d665bd512c9d9dad7e53a630 |     
  aarch64    | qt5wayland-ce2caf493a1343fb... | NOK | http://autobuild.buildroot.net/results/4022eca57729c70976702411efef7227f5e461d4 |     
    arm      | rpi-userland-14b90ff9d9f031... | NOK | http://autobuild.buildroot.net/results/f7031e12e07610795397ff43f2afaac77984fa44 |     
 microblaze  |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/a45d08783e3ccc1868889c5395d8e3509bff6f08 |     
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/0d9826c874982cebc65edb59605f840de1873379 | ORPH
  mips64el   |          tor-0.4.7.7           | NOK | http://autobuild.buildroot.net/results/5774d0c8e84750cc20be134431fc57070f8a2c04 |     
    arc      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/293f4d6976da8573276697133cb63a666fbad1cf |     
    arm      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/11ea20e3ce6c718c009e4c934d339909341635aa |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/a9dcae1ba3aafa957dbcd00f249c93cb67b51719 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/5668d7346f8bcaa3ab394dd07dc5784ba47e81bc |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/5df804d644e27cd3025bb0fa0d48cb9db1804c8b |     
powerpc64le  |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/afbeb75f2abdb01f69b8af934a19de14c2d3187e |     


Gitlab CI results for 2022-07-08
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                amarula_a64_relic | https://gitlab.com/buildroot.org/buildroot/-/jobs/2689195811  |      
                         arm_juno | https://gitlab.com/buildroot.org/buildroot/-/jobs/2689195825  |      
                aspeed_ast2500evb | https://gitlab.com/buildroot.org/buildroot/-/jobs/2689195831  |      
                      bananapi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2689195871  |      
                 bananapi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2689195873  |      
                 bananapi_m2_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2689195874  |      
                     bananapi_m64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2689195878  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/2689195879  |      
                     csky_gx6605s | https://gitlab.com/buildroot.org/buildroot/-/jobs/2689195904  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/2689195932  |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/2689195934  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/2689195940  |      
           friendlyarm_nanopi_a64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2689195951  |      
            friendlyarm_nanopi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2689195952  | ORPH 
       friendlyarm_nanopi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2689195955  | ORPH 
           friendlyarm_nanopi_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/2689195962  |      
          friendlyarm_nanopi_neo2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2689195958  |      
     friendlyarm_nanopi_neo_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2689195963  |      
            friendlyarm_nanopi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2689195965  |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/2689195968  |      
                  grinn_liteboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/2689195972  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/2689195987  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/2689195988  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/2689195992  |      
                    licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/2689195996  |      
        minnowboard_max-graphical | https://gitlab.com/buildroot.org/buildroot/-/jobs/2689196008  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2689196029  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2689196059  |      
                     orangepi_pc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2689196062  |      
                    orangepi_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2689196069  | ORPH 
                   orangepi_prime | https://gitlab.com/buildroot.org/buildroot/-/jobs/2689196071  |      
                     orangepi_win | https://gitlab.com/buildroot.org/buildroot/-/jobs/2689196076  |      
               orangepi_zero_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2689196081  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2689196088  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/2689196090  |      
                qemu_m68k_mcf5208 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2689196099  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/2689196144  |      
                     raspberrypi3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2689196149  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/2689196150  |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/2689196190  |      
                        wandboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/2689196207  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/2689196209  |      
                      zynq_qmtech | https://gitlab.com/buildroot.org/buildroot/-/jobs/2689196211  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2689196212  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/2689196213  |      
                zynqmp_kria_kv260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2689196214  |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2689196215  |      



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

