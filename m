Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2110C43334
	for <buildroot@archiver.kernel.org>; Thu, 30 Jun 2022 05:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24D894011C;
	Thu, 30 Jun 2022 05:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24D894011C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nj07s_KAf3tb; Thu, 30 Jun 2022 05:51:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9461E40949;
	Thu, 30 Jun 2022 05:51:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9461E40949
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5FB4C1BF299
 for <buildroot@lists.busybox.net>; Thu, 30 Jun 2022 05:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45A6641B9B
 for <buildroot@lists.busybox.net>; Thu, 30 Jun 2022 05:51:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45A6641B9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fL1U2CV2TAKt for <buildroot@lists.busybox.net>;
 Thu, 30 Jun 2022 05:51:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F55341B78
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7F55341B78
 for <buildroot@buildroot.org>; Thu, 30 Jun 2022 05:51:48 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CB1991C0003
 for <buildroot@buildroot.org>; Thu, 30 Jun 2022 05:51:45 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 30 Jun 2022 05:51:45 -0000
Message-Id: <20220630055152.45A6641B9B@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1656568306; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=t1115Bp17+PoIs26jfZ0xoAq1JzpXsfUndr7hDPx14k=;
 b=DC5g8qLG8rki9dvFO/I+oONz527zB/3BJDV7YglX2iTY54oK1BBACRTes+2EpE3szTpcBO
 ZVk/DXBWNt4rn0zlE/Zo5nzh1k96FBv+HkckAECnaZFZx1yhIhl3pDFKea6hjP+AyFPcCv
 PrUbMJGCFdMqjjtipN0lnnCb6IlyWrqicq821KvmO9klncyj8pNtSW+dJ5DtsD9kK1MpMU
 35qPGyUdZ+DiujjEuSIHEfA6Fkt/5M8hkFkk+Mctq7XAeVCqdS1LE6svzzreO1I5oiBxnv
 +jD9vVkdOb3hrdCXQj2fB1xazaMlgGUF4oC27iulEWggfX+R1UwuOs+urjab6w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DC5g8qLG
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-06-29
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

Autobuild statistics for 2022-06-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 12  |  5  |  0  | 17  |
  2022.05.x  | 39  | 30  |  0  | 69  |
    master   | 184 | 265 |  0  | 449 |

Classification of failures by reason for master
-----------------------------------------------

              alsa-utils-1.2.7 | 25
                 uclibc-1.0.41 | 13
             libopenssl-1.1.1o | 12
                speexdsp-1.2.1 | 12
                 linux-5.17.13 | 9 
                   speex-1.2.1 | 9 
                busybox-1.35.0 | 8 
                       unknown | 7 
glibc-2.35-96-g2c4fc8e5ca74... | 6 
host-pahole-73383b3a39afe86... | 6 
              host-rust-1.60.0 | 6 
               protobuf-3.20.1 | 6 
                     refpolicy | 6 
               tcpreplay-4.4.1 | 6 
                host-go-1.18.3 | 5 
                iptables-1.8.8 | 5 
           libfreeimage-3.18.0 | 5 
                     frr-8.2.2 | 4 
                libressl-3.5.3 | 4 
                minimodem-0.24 | 4 
              swupdate-2022.05 | 4 
dahdi-linux-5c840cf43838e06... | 3 
                 dash-0.5.11.5 | 3 
           libsamplerate-0.1.9 | 3 
       linux-5.10.109-cip5-rt4 | 3 
                   perl-5.34.1 | 3 
                       sbc-1.5 | 3 
                 twolame-0.4.0 | 3 
                 zlib-ng-2.0.6 | 3 
                     ace-7.0.6 | 2 
                    brltty-6.4 | 2 
                    dhcp-4.4.3 | 2 
  gobject-introspection-1.70.0 | 2 
       host-gcc-initial-10.3.0 | 2 
               libglib2-2.70.4 | 2 
             libgpg-error-1.42 | 2 
               libvorbis-1.3.7 | 2 
           linux-5.10.115-cip7 | 2 
            ocf-linux-20120127 | 2 
                   uacme-1.7.1 | 2 
                       xenomai | 2 
                    zstd-1.5.2 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
                  acpid-2.0.33 | 1 
                alsa-lib-1.2.7 | 1 
bayer2rgb-neon-15feb1115b48... | 1 
             berkeleydb-5.3.28 | 1 
                  bind-9.16.27 | 1 
              dieharder-3.31.1 | 1 
               ding-libs-0.6.2 | 1 
                elfutils-0.186 | 1 
                enscript-1.6.6 | 1 
                     file-5.41 | 1 
fs/squashfs/squashfs.mk:56:... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
               gocryptfs-2.2.1 | 1 
              host-delve-1.8.0 | 1 
         host-gcc-final-11.3.0 | 1 
host-gcc-final-arc-2020.09-... | 1 
host-gdb-arc-2020.09-releas... | 1 
host-spirv-llvm-translator-... | 1 
              host-uuu-1.4.193 | 1 
                ipmiutil-3.1.8 | 1 
              jpeg-turbo-2.1.3 | 1 
                  kexec-2.0.24 | 1 
                    lame-3.100 | 1 
              libgcrypt-1.10.1 | 1 
                  libogg-1.3.5 | 1 
            lttng-tools-2.13.2 | 1 
            luaossl-20200709-0 | 1 
make: *** wait: No child pr... | 1 
                nodejs-16.15.0 | 1 
                  ntp-4.2.8p15 | 1 
                     php-8.1.7 | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
                 pixman-0.40.0 | 1 
               poppler-21.12.0 | 1 
           powerpc-utils-1.3.8 | 1 
            python-ujson-5.2.0 | 1 
                python3-3.10.4 | 1 
                  reaver-1.6.6 | 1 
rtl8723ds-76146e85847beb242... | 1 
       shadowsocks-libev-3.3.5 | 1 
                   slirp-4.7.0 | 1 
                 systemd-250.4 | 1 
toolchain-external-codescap... | 1 
                   tor-0.4.7.8 | 1 
           v4l2loopback-0.12.5 | 1 
               valgrind-3.19.0 | 1 
                 wavemon-0.9.4 | 1 
                  whois-5.5.11 | 1 
                wtfutil-0.41.0 | 1 
                xenomai-custom | 1 
               zziplib-0.13.72 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/316f4f247f02593003606249101e75d038828a8c |     
   nios2     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/aed0fa59e3bf8d5092a861ffebb77989b91e85a0 |     
microblazeel |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/7c74f55f7d5ab4da711702c3d803d9b6e331cfd4 |     
microblazeel |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/eec8f7ac5c13b07ce34d2879eba2f7383f1fb99d |     
   mips64    |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/e795f605ffacbe8d2e314931c5fd19be0155714f | ORPH
    m68k     |         alsa-lib-1.2.7         | NOK | http://autobuild.buildroot.net/results/debcc51b166e2260de40200f9e0929c6e6eda45d |     
  aarch64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/673e1156af3f0d8f984de87ba2113c180273baa1 |     
   mips64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/64dd575614ba543669d1b37f6f3c57fb11744ed3 |     
   mips64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/fda896e9ecb5b00c9092560f6c9f234ffbfedfc1 |     
microblazeel |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/21033014071b0c23603ac67107d26b8344aebef2 |     
   nios2     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/84a02a236abdf53a0ddcad79785674d6c182237d |     
   sparc     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/8afdbbecadc2df29f712feb57e814e211c351d4b |     
 microblaze  |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/33b9ef66ffe3672970f043b0b857bec853f2b5a4 |     
    or1k     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/010ff62619a9c425c0b68085a92c0698287a17ab |     
   armeb     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/35ac62059b51f00f106c625ae8a932bf2cf2c30b |     
 powerpc64   |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/50cb1888757e7465ea0bc84b8e69fbb2dccf0c33 |     
   mipsel    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/b444fdb02a096b3a698f749353920374f251ed50 |     
powerpc64le  |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/49a20243cc8d1227d0f7403b294d83b00ffa7a12 |     
  powerpc    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/0ea735b2c185af1bc3e557bf4dbfcebb87057a4b |     
   x86_64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/7e6e5dac9057d6962b4a67b6d7ee19be9fadedeb |     
   nios2     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/7905d936d96abbd6e0607189213dc66ceda7f505 |     
 aarch64_be  |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/32211180948613bb9cfc92ce635f233af5824710 |     
  riscv32    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/c6c8c3915e9ee5d6bd1db0de709fb4236f8c10ba |     
   nios2     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/55450b10cf1f5bb3228050eb86d422ddad983063 |     
   arceb     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/6dd6212e9e78a3c4c8ca9ce5f412d94be8af5334 |     
  powerpc    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/120d955fc6146df6d97f3848aa628136fd8a0747 |     
 aarch64_be  |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/bb9a503a771c1ede31d8c8e5c9ec74b21ce866a1 |     
 aarch64_be  |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/87227db2e6375bef7f736aa6c8ebbe695dc3c78a |     
    i686     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/1147968bdc246d49356352d3046a7cb5a5c275d4 |     
microblazeel |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/e070426d74a5455dbd8494b8ba48448a17a32398 |     
    arm      |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/1295dba74295a92de6814399588d35a7fdeb8386 |     
  aarch64    | bayer2rgb-neon-15feb1115b48... | NOK | http://autobuild.buildroot.net/results/c43cf13b9ed7f4d3de895079e826b8dec60264e4 |     
   sh4eb     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/8f57f10c3a7622718845ee2a4fa4b09052136b78 | ORPH
   sh4aeb    |          bind-9.16.27          | NOK | http://autobuild.buildroot.net/results/d0e4416e8ea1cc0b1393eedffdcd1225e7610539 | ORPH
microblazeel |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/839c73634e6b13a777adb8678f7178b90cf23d5c |     
powerpc64le  |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/b4f769e45d554ac5cde76d5e7e20701f992dbf09 |     
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/a9b782c6fc2d137e69c5cfc6f07551c6dd78691d | ORPH
    m68k     |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/abac966fa4bebae6dfd80f68438bd9568dbf7a78 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/ca2c2a6b0d57f89c1b4c4380c519835d3d5b9bdf | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/d95af88f28144f5e080f3873be0a308c1c940684 | ORPH
    m68k     |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/4ddaabc0403afb5dbbcfebf9741351329692e054 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/601d22407e84565b400d38ee2a9c94ad030c99e4 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/d71fcfc1d73e04813e01a23cb5a70e41af170404 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/1a93cca12317c0f6bf671ddd9b6f65ec6b88a4c1 | ORPH
   sparc     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/b1d0e25271ed06b3ea2e09669b6f3dd23ea8ca8b |     
   armeb     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/0edb7ab3a0b7e7440a0d9a259b270e359092b9d4 |     
 microblaze  | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/e5eb9a7a355ca444ee80f11dd1cba8dff326b9bb |     
    sh4a     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/f3c2675f8b8e31d7077ad55d3bf0a5f00e319d5c | ORPH
   sh4aeb    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/21bc8b2a06690cba983f37607b27ab134d902876 | ORPH
    sh4      |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/25b15786254c4c061259ac591ac9543286f1ee19 | ORPH
   sh4eb     |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/c417b00356bc73302b482603cfabb7c0350a5904 | ORPH
    sh4a     |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/714ab86ae38ea2be245a1f861a496c9a8ab91e31 | ORPH
microblazeel |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/b5130f18440fe3c3a0b4e1c39134810e58ff3906 |     
   arceb     |        ding-libs-0.6.2         | NOK | http://autobuild.buildroot.net/results/9f93118eb9523462c731df492240e991a5a23b4b |     
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/f36efca09aecf7d0aba69ac6e2c90475de8fda89 | ORPH
  riscv64    |         enscript-1.6.6         | NOK | http://autobuild.buildroot.net/results/19b29601dc7ed0c8980d2cde6071f2f2a242f04d | ORPH
    arm      |           file-5.41            | NOK | http://autobuild.buildroot.net/results/bd39a0f5e842035059ec4b2757e18095e32c1ee4 | ORPH
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/825423acc16c9fcdfdf15c1a31bfb889f657e336 |     
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/de41c3fbfc6a1b8c3ec1e9c27f7d3b69f7a9cfc1 |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/e4820ca4adb5372416f62ea3a958030ea659634d |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/833ac343a12bb2305eae28133df4d8ef6aef419e |     
   x86_64    | fs/squashfs/squashfs.mk:56:... | NOK | http://autobuild.buildroot.net/results/687853fe8da75240969aff5abd9ff3aa6857697c |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/37a06be66e0f2ab1cf2bb83246bd593786585ae5 |     
    or1k     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/476a07e86fe5925afd4d522198495cd36a15e405 |     
    or1k     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/281f85c135f2cc1b245fa8b634646447f393847a |     
    or1k     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/93cf9c337d43ee3cee5889c8da75469239967c28 |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/4558791e7d5d4e035fd6d373affb0d4e8583a12c |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/d2a5c2ca4fc61090cf998026b31b78162568427a |     
    or1k     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/df3d02e71c80ab90fe22e10bfd7a86323cc9b680 |     
    or1k     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/d2a881e5ed0da7d81115d2ae767fd2d2d24c944c | ORPH
microblazeel |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/f8d20fedbfa821e0604f106b1b6eb224294367db | ORPH
  riscv64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/0e70397ea6925ffd10cc0d7ac2c36ccbe8473fbd |     
    arm      |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/668663cf85cbf0b20c5947c4ba3baa6a85ced9e9 |     
   x86_64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/c72057a7e83270c4b289b71a69a84459f6de7376 |     
   arceb     | host-gcc-final-arc-2020.09-... | NOK | http://autobuild.buildroot.net/results/5c36d9975086ec0716a35e61f16bc4c53a813d1a |     
    arm      |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/0699c400c300bcdd9d795431f80efe5d9ae0c6be |     
    arm      |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/f0f987c3d08f1f46a4aa111981e087e8206e7324 |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/00788bf2a4e05e155a518c8474c195c5bf11f4fb | ORPH
   mips64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/11a0936180edac854bab07b27d4c4eec0d4a705a |     
   mips64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/d198fbd000a019f8ce23208df67da745c203dbd6 |     
    i686     |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/4a00b3495e637fa90bbf4d689af08d4e50c0665b |     
powerpc64le  |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/05fa73450a07c8840b4fe2b4dbad918c1db44db4 |     
  mips64el   |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/1d2ff72bff86551b89a4f63852c3ca49acc2e744 |     
   nios2     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/b87101b44ac5de18c81c2dcd787d7cbddcd27409 |     
  powerpc    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/35e50e8527278631709f2f79aeb8a0294e5916e8 |     
   s390x     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/82093184fbe9e58dbab0a134d9525e603228e894 |     
   s390x     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/407e54e3c661591d614b59afbd0de6c97b260d18 |     
    mips     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/b35e224327b9a03065830af695cda02a5edc3dae |     
   xtensa    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/f46152924c60397b179bb3ca04469bd4862904a1 |     
   x86_64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/6c3d0e754136d3e0af3f45b48cb9eda1268582fc |     
   armeb     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/ecec3c9de3c80041b90e05f0fb2bb444a1982ae2 |     
    mips     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/e7de8e9d4e1706f10bb855ce94e1524e44e6b11b |     
  aarch64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/0d2ce65a1499326169e3f4ad8b609f489919160f |     
  aarch64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/3f0d13c1d73f2df9b1794056b129fe1ad2b01ac4 |     
   x86_64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/2f6292f0bad6d3321c262da62daf9becfa46bf15 |     
   x86_64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/e88b5bba258c91433bef036f0088696338c23506 | ORPH
   sh4aeb    |        host-uuu-1.4.193        | NOK | http://autobuild.buildroot.net/results/b6cec65cd790b77db90db334e1c0ea12e88a038a |     
    i586     |         ipmiutil-3.1.8         | NOK | http://autobuild.buildroot.net/results/c849a2c0f3544b8cc777636fc041d442239fae27 |     
    arm      |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/d9bdbb33cf3b83e9ae8c1b76a0c410c0766756fe | ORPH
    mips     |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/a80d78b1ac284d62e0e21dffb763eb10b0c45180 | ORPH
    sh4a     |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/3b3e8f92917997fb60018d067623e47c504dc42a | ORPH
    or1k     |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/47b9b6faecce2a40ccb72f52900b84a9d8f1e2cf | ORPH
    i686     |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/ff61eba9d699a72530b5f29f325495f1f45875e3 | ORPH
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/160dd7d26e1ea140c406138aabc51d4b21be8d54 |     
   armeb     |          kexec-2.0.24          | NOK | http://autobuild.buildroot.net/results/57d94309a71687e09b48fd40facde5063e0332bb | ORPH
    or1k     |           lame-3.100           | NOK | http://autobuild.buildroot.net/results/2124cd6ccbdee402b235a8459b9d97e79dfdbe29 |     
    i686     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/2c06a72d3c47bcd13880f3d1f146ddc3c5839741 |     
  riscv64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/8b9f1dadcf89f41364091e312fce1bdae09a960b |     
microblazeel |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/7072504129f5eafeda17b1d050e2a68e3ef6996f |     
microblazeel |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/3bb5698237ffb7cacb9d5b2dd5551512f428b663 |     
   armeb     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/22d2352ff1138bdc11a205e8c13674c9fec45136 |     
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/1f5d56da32adabc7edc88190141fa5eda193a950 | ORPH
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/2ee73627c60412cebcee8801351ef44898b487d7 |     
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/f87f55b367e60a437c092c1f3232749c21ef3b9d |     
  aarch64    |       libgpg-error-1.42        | NOK | http://autobuild.buildroot.net/results/6dc4c067b7cbd5130e588164680f723c184ba4e5 | ORPH
  aarch64    |       libgpg-error-1.42        | NOK | http://autobuild.buildroot.net/results/e8ba33405521d8ab536957580fa697fcd09b1509 | ORPH
   mips64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/380d35e14ca57c6212e645eba0012747baba8fd8 |     
   arceb     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/35fad6b60b2dbc6a0d17670247b602e03bd2d2c1 |     
   sparc     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/e311db4ebdfb0bed1ac07bb9cca51a13095a5775 |     
    or1k     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/1dab9594750a314cc43a770763142338d58a5b4a |     
   sparc     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/ab7be8f5c03e331fe2324e43285a825d9fd09b6b |     
    or1k     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/76ebf65a700174ede13b195c22b3a855ec25ead2 |     
    m68k     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/48c99a9c78319b48d1160130702f05633588f18b |     
  powerpc    |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/5862886e95b3de3a89bb8fbdf6d9fe0a18074c3f |     
   sparc     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/55b693bab9db57328163296bdf37495cc0d2880b |     
   sparc     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/e6c2a5fddd707b6eb4b4ef0578d6fc2d2f546e9d |     
 microblaze  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/005770034253146dbfd9d1ba54723ffb3ddc456d |     
 microblaze  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/d130ebcee3a83cc62bd04111611036b59284b3d4 |     
    sh4      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/59c70be3516a42867fe39b4b2300ddde72dfa56f |     
    mips     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/ccde225faa43bc280e248acad68c9303aeb6593f | ORPH
   arceb     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/a92ebf7e0670ccaa800398d027b732fe114492c8 | ORPH
   arceb     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/2f2121901e653051c7529f569946491259f9fd9f | ORPH
   x86_64    |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/b458b71fe324a52b70edbe933bcaf3a90ed177ef | ORPH
   mipsel    |      libsamplerate-0.1.9       | NOK | http://autobuild.buildroot.net/results/a7f022cdd7130b121b5f017362294d964c023316 | ORPH
 microblaze  |      libsamplerate-0.1.9       | NOK | http://autobuild.buildroot.net/results/0a5b53765cb38b8eefbed67a522540d565cbb4c8 | ORPH
   xtensa    |      libsamplerate-0.1.9       | NOK | http://autobuild.buildroot.net/results/dc2b9a03a2b5bfeb28c27a46fff49bbb7ee2cd09 | ORPH
   nios2     |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/706df9f24c371a327c9a1bf859dbb61f153d3336 |     
 microblaze  |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/feba13ae33ab0bdaa474a287d4c4b1a1a8cb38b0 |     
 powerpc64   |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/b485a211f0ed488e8a709e1b280abdd1758c1bba | ORPH
  powerpc    |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/b0e9df0b1ab5e10e36190ec1e29962aa5c1fe16d | ORPH
microblazeel |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/45b664de2bfd3dd1518bd3dc1fffd6e0da1d6e39 | ORPH
 powerpc64   |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/d03681355cb871530338e813cfa1f826822f61c5 | ORPH
   mips64    |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/7399dbd7586483fd5871bb28f15f2960896eaac3 | ORPH
   mips64    |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/fb2debe1b444be56eb81d222f2233fd6cce2fbf2 | ORPH
    m68k     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/5fa614ffc0270716a0fe2309bf62ca3d21eda062 | ORPH
 powerpc64   |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/c6453406b0a323e030c0523c068a1b04c81287bb | ORPH
 powerpc64   |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/cfbedacbe70ae748874d344dc40e90352bb5a5a7 | ORPH
    mips     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/6714664d80d90ae13407b70ff209e3f986e78a61 | ORPH
 powerpc64   |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/a503ba0ae3cfc97bc84bdec846b0a504ad1fff2e | ORPH
    i586     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/da0c826dc0f2130a369a30961e4f8f2caaea2e3f | ORPH
    sh4a     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/f4b9e157bc62b46e2cc0d01604cfab3462f88681 | ORPH
  powerpc    |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/9e5133d67b60fea29ee8e5e7bedc16093a66dd56 | ORPH
  powerpc    |       lttng-tools-2.13.2       | NOK | http://autobuild.buildroot.net/results/040c7445e1c41c45932b9e7ce452b03f13a09eae |     
microblazeel |       luaossl-20200709-0       | NOK | http://autobuild.buildroot.net/results/bedc81654764f486bbd93441158f4c9007b42f81 |     
    arc      | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/7c73f41b5b9c84fe920b7cef95c0141127228f77 |     
    or1k     |         minimodem-0.24         | NOK | http://autobuild.buildroot.net/results/dea3541088767e7ff9cac2e80700217d727ef45c |     
   xtensa    |         minimodem-0.24         | NOK | http://autobuild.buildroot.net/results/22267e5079ace23e6481a1a959f7799589b08ff7 |     
  powerpc    |         minimodem-0.24         | NOK | http://autobuild.buildroot.net/results/28199b734bead225f1e2112def3cc6a5a88b835a |     
   armeb     |         minimodem-0.24         | NOK | http://autobuild.buildroot.net/results/d9efe9a13ebebf8edb0ed89198380298536e8049 |     
    arm      |         nodejs-16.15.0         | NOK | http://autobuild.buildroot.net/results/7c6db4d8f4adcb596f1c4854e3225fb3c35cb927 |     
   sh4aeb    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/06165867c3ecacfccd3463476666afc352f2fb33 | ORPH
microblazeel |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/662b19f9e0d54f2b198d022d8f271017f082d9d4 | ORPH
  riscv32    |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/b67cc736c32ddf6ec59f12ecfb263be966b49265 | ORPH
microblazeel |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/739474d20c2a9f4693adcb3ae84aa0ef22a14c6b |     
 aarch64_be  |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/cbd365049287c867e45f93b37aac7ef79d91bb8d |     
   mipsel    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/b3f51bea46f9caf6bba06607c1fa015c3a1ead21 |     
    sh4      |           php-8.1.7            | NOK | http://autobuild.buildroot.net/results/cb4baf314fab15bfbd925acdf125b10b317ec9ff |     
    arm      | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/fd73de63e4c73f9b5340a53df912970fa5627e85 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/779ee5e97ed2addfe0df9fc941561b71c43891b9 |     
   xtensa    |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/4b54add11206ca8ce4c3cda6909eefd394913bb0 |     
  powerpc    |      powerpc-utils-1.3.8       | NOK | http://autobuild.buildroot.net/results/20446eecc6dfec78b5299b73347e65b3ee835eb3 | ORPH
    m68k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/579f99445263a1d923c2105f7b4ebddb5ded2cc4 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/f2794c1ad55561dc3086d90e614c0ba6052ee359 |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/af12b591e8bceae270dd82873b0c5b60fcfd8ece |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/92f59c76059f542e0e39ee7be76ee0e6975d3f96 |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/574de508a2b492272c8b04bd5943b7ab14454842 |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/0ec4f3a9c1385c125588c9b7549162f4a1f7afad |     
    arc      |       python-ujson-5.2.0       | NOK | http://autobuild.buildroot.net/results/dc4696eb47b8cb1624fe5d474b1160b94cd9e2fb |     
   arceb     |         python3-3.10.4         | NOK | http://autobuild.buildroot.net/results/768b8992a0ed8032ff7db4f76f328492f2695131 |     
   arceb     |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/1f78ff8e77e0bd5dd4382541cea74f81fb17a553 |     
 microblaze  |           refpolicy            | NOK | http://autobuild.buildroot.net/results/d1ea34165f8ef59d2237a7b1be1786d35e6373d5 |     
microblazeel |           refpolicy            | NOK | http://autobuild.buildroot.net/results/3c0d3b761829a834286d369b1959d9582b9115dc |     
    mips     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/bca3234b74742afb9726c5f00884b54110ca446a |     
 aarch64_be  |           refpolicy            | NOK | http://autobuild.buildroot.net/results/d91e5e55eaca71ea40c31d14b26495a242a2de3d |     
  mips64el   |           refpolicy            | NOK | http://autobuild.buildroot.net/results/ccce7028f9fd0293845ece551edcf4f079617c70 |     
   sh4eb     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/282139f8ae54caa314cc490fdea43e34b81f732d |     
   armeb     | rtl8723ds-76146e85847beb242... | NOK | http://autobuild.buildroot.net/results/2f47e6e396cea13862a104caa2afe23bf231ef18 |     
   sparc     |            sbc-1.5             | NOK | http://autobuild.buildroot.net/results/f7796fc86bfd93d2dbb9e482ff9874ca80c63ad7 |     
   mipsel    |            sbc-1.5             | NOK | http://autobuild.buildroot.net/results/c144e4bff32c27da845925339ded47f75f8d7fdf |     
 aarch64_be  |            sbc-1.5             | NOK | http://autobuild.buildroot.net/results/6fb2392078bb5aedd9ae25261d1f256250fb62ca |     
microblazeel |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/b6c86698f2f069c32b9c15eceb26e2ae7d252a4e |     
microblazeel |          slirp-4.7.0           | NOK | http://autobuild.buildroot.net/results/55c8bc4ccb438f4443916f8d03f3d82be10208c3 |     
    sh4a     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/561849ddd203a2d75f38b08eb3bd7c53609ed6e7 | ORPH
 powerpc64   |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/b3ad3206b0802aa0b7540f8ae404e4c3b6f1cd1d | ORPH
    mips     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/1de9a7af52c738846e8ed17447b83a7f00a3238a | ORPH
 aarch64_be  |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/3145c9edfd13842b88bfb455af1c8611d488a1d8 | ORPH
   xtensa    |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/29e9dbe61349d412f668361e5b2544d022271c9e | ORPH
    i686     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/939c1ca19e3cecd0c844303eb03cb0387731728a | ORPH
    mips     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/8320691595e406757e62405c3a01926389b42f0a | ORPH
    i686     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/a3232bd1b1fcf5cc80960602773a175d43c1d571 | ORPH
 powerpc64   |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/47b62ff699f71876974f3e9fbfd54dba2fa69e67 | ORPH
    m68k     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/77d50e59cf48425c265c72f6b36ebf30b5ac4c1c | ORPH
   armeb     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/2cc392bc8ea5c728e796c0b983ec5ec209388ed3 | ORPH
  sparc64    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/50e41366e3ba9f3a44a4d48d8644cc86e2fd0747 | ORPH
   sh4eb     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/1431921d2e86d125ae47f31e36c97b8fa83799a2 | ORPH
   sparc     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/fd5cc191407f0e2fbf528d8bd472076a49c53ee9 | ORPH
   nios2     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/77ed979479d2179fd3d77ece785bf99fb80c14be | ORPH
  aarch64    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/d2948913f1d7b3394b72aa242142525b960eeb8f | ORPH
  riscv32    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/7767c54b959bb219e34095e04c7ce9df9cdd672f | ORPH
   s390x     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/73628d98b9dab0ed85e5326b2352fcb47d61a368 | ORPH
    or1k     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/b2e0fa7e6075fa2eb0f27f30f7af62b902e62387 | ORPH
 powerpc64   |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/91a84af6a32c6c7c2cf1bc86794de5e41a210369 | ORPH
   arceb     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/2532d4ed39bd5eb2fa9bac78f2d46f6ed5f7d533 | ORPH
    mips     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/146e9d5a3ecaa18a4ea160ec2cae2a7fe7469141 |     
 aarch64_be  |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/00feadd1e4c78cb08eafda7e8fe6f87188910299 |     
    arc      |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/fcccbe5a486b173769952e698ae19ed927dc55c4 |     
   xtensa    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/f5ef60365d658b97ea7cbf95af1079e982761fd9 |     
   nios2     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/e4fe5010c35846e6230e7dea3238e76b7f48bb74 |     
 microblaze  |        tcpreplay-4.4.1         | NOK | http://autobuild.buildroot.net/results/be2d80019c9d50288d8b903a3c60ed1280237fd7 | ORPH
    arc      |        tcpreplay-4.4.1         | NOK | http://autobuild.buildroot.net/results/fcf54e9afdd2a99d54ce27f240206cd33b7cb6a8 | ORPH
    arc      |        tcpreplay-4.4.1         | NOK | http://autobuild.buildroot.net/results/8154994076e8b3ab6d7c668a8e9aa6d3a67263b3 | ORPH
  powerpc    |        tcpreplay-4.4.1         | NOK | http://autobuild.buildroot.net/results/e47940b5b158395329c0132bb1bbea429c4dc249 | ORPH
    mips     |        tcpreplay-4.4.1         | NOK | http://autobuild.buildroot.net/results/784638897eb6746ec657a90d64dfa7d034fe4ae5 | ORPH
   sparc     |        tcpreplay-4.4.1         | NOK | http://autobuild.buildroot.net/results/97fce796ba6677ae5ee0763ed9a176a7551b7c24 | ORPH
   mipsel    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/f77607d656b8206ddd1c6b0549196b28ed8271a1 | ORPH
   xtensa    |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/61f139b29a06426ac440bc9fc546650444297227 |     
  mips64el   |         twolame-0.4.0          | NOK | http://autobuild.buildroot.net/results/8e26afcd41d61c45451190926557f12c42ff9514 | ORPH
   arceb     |         twolame-0.4.0          | NOK | http://autobuild.buildroot.net/results/360bbe4ff39c4869f7532a6c4fec8832914dfbde | ORPH
    m68k     |         twolame-0.4.0          | NOK | http://autobuild.buildroot.net/results/2e38c5dc535bcd845a72418917e854b7f64303ec | ORPH
   sh4aeb    |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/8d764aa7d0c6546137ab03343f0e9e3265a7ab51 |     
    arm      |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/5ba9eda1594dd3344618231285afdcd209d2e547 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/4ace77f4d1d1042d209353f5b056f99b15ac7eac |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/ded693b9fb94380039217ea1a2121fd4544a3612 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/4c9d8e2cc907e6811d822742ba6a1b9763ddf69c |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/3bb9f1686471a3e00168ac16d85f7706be850647 |     
   armeb     |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/62b1e9ef43cfb31596863ee0e78ef744e86e53bf |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/018f34f094e629616d75d795d2913f32bb3db7e3 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/b3935954e6705bebe180f8903234a90b1b670460 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/e4136277c40ec4b819c670181e690d06eb688b92 |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/d25bed33aae4144ab9baf56e896995a9c689f99a |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/bc7429a06bd31e4c0ea62acdf0c6fabc650b0c83 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/3cc044e59a7de30a7f58c95b126f47842bf7e9f5 |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/a746c9914eb6bdf0e5176ad3dc098bf939c6d66f |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/2caa96e20ee042ced7260aa38b58b87dda10f18c |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/1772e56418ce218a9c745912d60c572512054c8c |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/9422b8b1a5c221767da4303bb158f8e81bb2e252 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/ba09ed73dcf0d6ceaf49d360bcde4d2fed68412e |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/74b19a13261b13e3b25793d6c8572a22686482fb |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/de892d0e35c71383210de6bec5e9a71f04196152 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/5a06f29ec6fb2cf3dc03a9c13fa5691fe2b6fb04 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/c90a78b8935234caf2d3f7247b9500c806c4657f |     
    arc      |      v4l2loopback-0.12.5       | NOK | http://autobuild.buildroot.net/results/2554169d00a152866ef7b101d9f5bd114704ca9a |     
  powerpc    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/8a71be3545cdf52417cbe7f5475a043180b8cbfc | ORPH
   x86_64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/e906eeb01b3fc7dd6670e25d875c3235fc70bb1e |     
    arc      |          whois-5.5.11          | NOK | http://autobuild.buildroot.net/results/a9d1c9076345d94ac2f9a4008b8563c5a34f655e |     
  aarch64    |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/e904fca4bdae85244f374fe1085a7a34801cb262 |     
 microblaze  |            xenomai             | NOK | http://autobuild.buildroot.net/results/90c5f023a4032d19cd6466bd75314064ae45dbbb |     
   s390x     |            xenomai             | NOK | http://autobuild.buildroot.net/results/13a1eeeed777c12ca5fda9df4d6b88cbb03b0dd3 |     
   xtensa    |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/8cfe45056405f942ed9a8b558afb1d7a15a1b597 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/914e3d932bb0c5bcf195d4736b05134bae021e29 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/cfa27aa609392a1585ff04809fa4e71f9d6d2d49 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/7a00a2d74ad3f59c20140f652a373357b810e5f1 | ORPH
 microblaze  |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/d394a1c50e7f000d67513d73a524c63d808a4f89 |     
 microblaze  |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/55fbfc0111a146738efa309fbbb8d3692c2ab979 |     
 aarch64_be  |        zziplib-0.13.72         | NOK | http://autobuild.buildroot.net/results/57674d224b3bfa018833f9f656ad767b3323587d |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                 uclibc-1.0.41 | 2 
           libfreeimage-3.18.0 | 1 
rpi-userland-14b90ff9d9f031... | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/959be41fea4102e0ab95de4fc6f07c90fd329d20 |     
    arm      | rpi-userland-14b90ff9d9f031... | NOK | http://autobuild.buildroot.net/results/417cdbecf6fbb2e2e600fb6156341dd5c59af39e |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/fffd128668cf2b05e43df76ba07f649bc1067ef8 |     
    arc      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/79cd2519f2523f689ec990c85adb250fc6360059 |     
   mipsel    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/993cfe056694928908e236f48854f8b571cf328a |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

                 uclibc-1.0.41 | 3 
                host-go-1.18.3 | 2 
              host-rust-1.60.0 | 2 
           libfreeimage-3.18.0 | 2 
                mongodb-4.2.18 | 2 
/home/buildroot/autobuild/i... | 1 
                 a10disp-0.6.1 | 1 
                    bat-0.19.0 | 1 
              containerd-1.6.2 | 1 
           docker-cli-20.10.14 | 1 
glibc-2.35-96-g2c4fc8e5ca74... | 1 
               gocryptfs-2.2.1 | 1 
         host-gcc-final-11.3.0 | 1 
             libopenssl-1.1.1o | 1 
           libvncserver-0.9.13 | 1 
           libwebsockets-4.3.1 | 1 
        ltp-testsuite-20220121 | 1 
               luasyslog-2.2.1 | 1 
                 mesa3d-21.3.8 | 1 
             netsniff-ng-0.6.8 | 1 
                  sudo-1.9.8p2 | 1 
              swupdate-2022.05 | 1 
ulog-0389d243352255f6182326... | 1 
                    zstd-1.5.2 | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/cbc56efe9c3dcaa77d037f5b40473621991823da |     
    arm      |         a10disp-0.6.1          | NOK | http://autobuild.buildroot.net/results/423e9d69b0891309301977537a4474e5bb69ab6a |     
    i586     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/4b656da3c4acf7938ab90b8fe34c5595d0adb560 |     
  aarch64    |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/177c5e7a2a8c849289d11eaad8805a99f84b594b |     
powerpc64le  |      docker-cli-20.10.14       | NOK | http://autobuild.buildroot.net/results/eaf8308fe06af41695b9dec338c5be896e5f3189 |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/412c5818be62900e333f37551cf2ae4c55d24db2 |     
powerpc64le  |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/44f4e63addceff2ad2cffb6003283905aea47e10 |     
microblazeel |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/e9efd1db72c6ca4afcaf9e8ccf8c49cc25679724 |     
   mips64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/21d876ba16f009df80c909d8f75cfffe0ab80299 |     
powerpc64le  |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/6ce89ad34cf702de8d8d2138e2b612a958a418ba |     
   x86_64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/5f4d6645fc12e2d00728f3997fff839316aec471 |     
   armeb     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/d61e3bc65914844dd5b0146949226a0d81580edf |     
    sh4a     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/876dbb2e8cf14736e96333b0686276509f460c93 |     
  riscv64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/1a9db6c3812fb3549e5c7c25507f3e51075ed933 |     
    or1k     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/5dc039cd59413d5b97a02b63fedb64b91ad72113 |     
    or1k     |      libvncserver-0.9.13       | NOK | http://autobuild.buildroot.net/results/5199b2f3f683022ece321c4177f5e66ed0bbbf89 | ORPH
   arceb     |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/c8779025c08d4e75d983ea00febc89da8fcb272c |     
  mips64el   |     ltp-testsuite-20220121     | NOK | http://autobuild.buildroot.net/results/196fd0a3af471461452036d28386b9fc389e3ad1 |     
    i686     |        luasyslog-2.2.1         | NOK | http://autobuild.buildroot.net/results/15d0199ac9011596c3be77bfbd35d605a1817e50 |     
    arm      |         mesa3d-21.3.8          | NOK | http://autobuild.buildroot.net/results/d0f8a2b9dbfd19fca19f744f30ddfbad6cf6f168 |     
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/281f7002add2873e0d89627c7f474a42b3b0df5c |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/545d30318cd1b7d11bfcd71f5394279e93a79229 |     
   mips64    |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/b04b0bc0651493060930b58db930585f267036e2 |     
   armeb     |          sudo-1.9.8p2          | NOK | http://autobuild.buildroot.net/results/b77fd41a164f2a45a04448c786a021ae4d286580 | ORPH
  riscv64    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/bd12ea4e368b0f258f99b467d47b027ba832fb42 |     
    arc      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/526ece86bda731208b0ec4b54af93033fd9bb54c |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/a01d89f7e6ca4bedd1bf26042b398a8e6e5cb0a9 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/aeee2eb43777d8a9a91203721bec9a070cd2eb5e |     
   x86_64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/4382b9d0ea17c9102917a39e03719a498f13a528 |     
microblazeel |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/fb04b6a59f53ff3528e291b5121cacb38cfc4916 |     



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

