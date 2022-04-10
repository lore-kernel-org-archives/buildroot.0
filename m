Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC208C433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 04:41:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 248CE84313;
	Sun, 10 Apr 2022 04:41:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GbhK4F-nDLnV; Sun, 10 Apr 2022 04:41:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9E4E842BC;
	Sun, 10 Apr 2022 04:41:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7BBB71BF2EA
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 04:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60A9E418AC
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 04:41:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ykjw7fYpM7PP for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 04:41:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D5F5418A8
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 04:41:47 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E78574000A
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 04:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649565705; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xdjeVd6m+LBZZ05bwXTSKWU53xspBaLFbm0nTgHDX3A=;
 b=GGdUWfPlHxsg8VzDBo/4fq/+1YZvVu/gk2C87BcbXLGEPpefmGTXgkkIYtGSzjrdJFJQrT
 CgkEeDhkXzjOaoLD5t9hB/T244A4OZ7mgHpJs3xNFD1U19Q8RpXMjHedhtUOA/DI8ykEql
 AsCbqgX11jyGh165rxUwJgCi0uiruWUFNt44+vqtr2AWwbST/NtJKDDBzjJ8mA4k+S06fl
 HI0HUiPx6dimcDhDYcx9LeLlXguaxYM8HQJuJMp+n0i5jIKP+GTl0zm1V92ucTIoTiSqf2
 hNw/sY1/EINhCaENn267erbMQqZHFc+aS0m0WfIxpzWx8zja0gO3HGSc9QDF9w==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 10 Apr 2022 04:41:44 -0000
Message-Id: <20220410044151.60A9E418AC@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-04-09
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

Autobuild statistics for 2022-04-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 31  |  5  |  0  | 36  |
    master   | 169 | 278 |  2  | 449 |

Classification of failures by reason for master
-----------------------------------------------

          host-util-linux-2.38 | 46
            host-binutils-2.32 | 38
         host-gcc-final-10.3.0 | 20
                 dhcp-4.4.2-P1 | 14
               util-linux-2.38 | 14
              fetchmail-6.4.29 | 11
host-elf2flt-7e33f28df198c4... | 8 
                 uclibc-1.0.40 | 8 
           argp-standalone-1.3 | 6 
             libopenssl-1.1.1n | 5 
         host-gcc-final-11.2.0 | 4 
                   libnss-3.76 | 4 
                libressl-3.4.3 | 4 
                 linux-5.15.30 | 4 
                    bat-0.19.0 | 3 
fs/f2fs/f2fs.mk:64: /home/a... | 3 
fs/f2fs/f2fs.mk:64: /home/a... | 3 
                 zlib-ng-2.0.6 | 3 
                arp-scan-1.9.7 | 2 
               arptables-0.0.5 | 2 
                 dash-0.5.11.5 | 2 
fs/ext2/ext2.mk:65: /home/a... | 2 
glibc-2.34-109-gd64b08d5ba7... | 2 
  gobject-introspection-1.70.0 | 2 
               libcap-ng-0.8.3 | 2 
                libkrb5-1.18.4 | 2 
                  libnspr-4.33 | 2 
           linux-5.10.104-cip3 | 2 
linux-headers-5.10.104-cip3... | 2 
         linux-headers-5.15.30 | 2 
                  netsurf-3.10 | 2 
                     refpolicy | 2 
       shadowsocks-libev-3.3.5 | 2 
                       unknown | 2 
                 wavemon-0.9.4 | 2 
                       xenomai | 2 
                  acpid-2.0.33 | 1 
               belle-sip-4.4.8 | 1 
                    bird-2.0.8 | 1 
                  botan-2.19.1 | 1 
              bubblewrap-0.6.1 | 1 
          cryptodev-linux-1.12 | 1 
        edk2-edk2-stable202102 | 1 
                elfutils-0.186 | 1 
                   expat-2.4.7 | 1 
       freeradius-client-1.1.7 | 1 
fs/ext2/ext2.mk:65: /home/a... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /home/a... | 1 
fs/f2fs/f2fs.mk:64: /home/a... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                glorytun-0.3.4 | 1 
         gobject-introspection | 1 
google-breakpad-7515ab13768... | 1 
       gst1-plugins-bad-1.20.1 | 1 
gummiboot-2bcd919c681c952eb... | 1 
          host-gcc-final-9.4.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
                host-go-1.17.8 | 1 
              jpeg-turbo-2.1.3 | 1 
                   json-c-0.15 | 1 
              libeXosip2-5.3.0 | 1 
              libgcrypt-1.10.0 | 1 
                libkcapi-1.1.5 | 1 
               libsigrok-0.5.2 | 1 
Makefile:17392: lib/libfrrz... | 1 
                    musl-1.2.2 | 1 
                  ndisc6-1.0.5 | 1 
                    ne10-1.2.1 | 1 
                openobex-1.7.2 | 1 
                 pixman-0.40.0 | 1 
              pure-ftpd-1.0.50 | 1 
                python3-3.10.2 | 1 
qt-webkit-kiosk-a7720e50f2b... | 1 
qt5webchannel-fa8b07105b5e2... | 1 
                   rsync-3.2.3 | 1 
               trousers-0.3.15 | 1 
                   uacme-1.7.1 | 1 
           wpa_supplicant-2.10 | 1 
               xfsprogs-5.14.2 | 1 
                  zabbix-5.4.9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/49face85d7f793e6e0fa3f614da952a199659dca | ORPH
    m68k     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/a682dfd1446460f4cc4e674d5197e1a5bebd4849 |     
    m68k     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/29110dab6ff7e3e9821895209e028eca0a91abad |     
    arc      |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/f7e53ec7dd210ab620733c64ec49a0c831ca1850 |     
   xtensa    |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/afc8077e94cea15baa9e1628eec430a3f9e26396 |     
  powerpc    |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/9c698ec1e35495011bf4561ebbb1f7628c48889b |     
    arm      |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/ce580166f415feaf02d8c5fdb3934ac20d98e4fb |     
    arm      |         arp-scan-1.9.7         | NOK | http://autobuild.buildroot.net/results/a6f024842f1d5a1bba6efcb67f83a215f41b0bea |     
    arm      |         arp-scan-1.9.7         | NOK | http://autobuild.buildroot.net/results/ef0c3de2ca528e62234627a44cf7af1865ea3d69 |     
   sparc     |        arptables-0.0.5         | NOK | http://autobuild.buildroot.net/results/de0a542a6444e412e6276fd984208f4b99a23942 | ORPH
  sparc64    |        arptables-0.0.5         | NOK | http://autobuild.buildroot.net/results/ac268cf55d6257fd651d0b2e4ba28ee62c255594 | ORPH
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/157202f1da32a49edf2f2820f76214f26f281b46 |     
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/466ea6b0078b487c6e62f00238027a0b99bd26fc |     
    i586     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/380bc63841ea85ebac68062d162368329d5cfa3d |     
   xtensa    |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/cc7ddc3331708311bfa1a9b46e247accd20717ea |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/b71dd843891b43e271b33fcf75eaf5081c274448 |     
    sh4      |          botan-2.19.1          | NOK | http://autobuild.buildroot.net/results/8afa8a59bf1bc32d8de1a8b0f38d13e930281bc0 | ORPH
   mipsel    |        bubblewrap-0.6.1        | NOK | http://autobuild.buildroot.net/results/23a3061cb7a50bd246a03084e02117f286e46920 |     
    or1k     |      cryptodev-linux-1.12      | NOK | http://autobuild.buildroot.net/results/a06708369c233f6e60a1a3ffd7a77a4edd932c9a | ORPH
   arceb     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/f1b2bb81c277e3091145b13c9052203772671ebc | ORPH
  powerpc    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/35f2d319f0250f9b77208acd8629955f7e8d2804 | ORPH
    arm      |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/2e45e39d737005816772f350ae064d2fb1015c5f | ORPH
    mips     |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/73adeb5200573362e0dbf6fc72b0c2844614ca26 | ORPH
    arc      |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/a997ace20af4556b67f95408a588f3c14ed16423 | ORPH
   x86_64    |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/186224316d567b47ae8c4dfe6c217e3ecec5cf15 | ORPH
   x86_64    |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/794757ee3c06a0fa9b31f5f21be2b2060937d78c | ORPH
    arc      |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/42a70179c8a40dc9edc1e203f33d0a5e14765764 | ORPH
   xtensa    |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/411da26b679b4e993f32793abc3d585cad2793a1 | ORPH
    arm      |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/3313fe683aa03ccaf1d31aaa2d2b30ef54580631 | ORPH
 powerpc64   |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/accf4e0e01b49711659f1f8ae27ec1474d4adb8a | ORPH
    arc      |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/f48032e8f8af5ee6875d7b470920fd1ff542707c | ORPH
    mips     |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/8ba49c1f66e36f764f8b7a7247a906a48008ed03 | ORPH
  riscv64    |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/09aa7ff67654e0665e907f9ba236823d5ac65cb4 | ORPH
  mips64el   |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/7caa1ce1888d531211da6bfb801b2d619997ee90 | ORPH
    arc      |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/7e009cb8e0a1fb253d4ac79c7bb703382c46ac62 | ORPH
    i586     |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/f2fe7c36f33fd4712605bbf37e886eaa508791c2 |     
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/a49e113a51f3018254a6583206d982a5221625c2 | ORPH
  riscv64    |          expat-2.4.7           | NOK | http://autobuild.buildroot.net/results/f535b7ae272bd81afdf76e7742f665dece5412fd |     
   arceb     |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/a31e7cf560c366b7ff436fca31448f57944694c2 |     
 microblaze  |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/c270b01aa96f0cd2d92edba6873f4cdfad0ce0a0 |     
   sparc     |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/7515c0a5a3438ebd10d99fb9e865d5ec25ab479f |     
   nios2     |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/ea00ea274dd55c6f4d3b31ad73d3ad4fd92f4b6c |     
microblazeel |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/ce6c40db415abd6ac9d5e353f68fbb5db58e9b8d |     
  mips64el   |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/5bdb8aa04d9cf3c3ff008419104317326d23f1af |     
   arceb     |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/3385b17e431d9d14f7a9172afbe0a04dbb3ecebf |     
   sparc     |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/3f8639e66909b8a9adebea00ed508ea62a24d999 |     
  powerpc    |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/4b03e4ff7a7344c7eb1ce054f4009225846d95b0 |     
microblazeel |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/cbee770c9fb0479632b6069c0d5b4f98e983685f |     
    mips     |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/be989aa10509aa9c9c6277d982289263e4f5c83a |     
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/8043c5b8c941ad1ca01027ea9cfae83815abc1a1 |     
    arc      | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/f3b90aa0ce60ddc87f06b30178c59fb0b95b0447 |     
   mips64    | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/367ae96087d302e45019f4101c4d5f7d26198d30 |     
   mips64    | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/455d6452a9b82a1d1703ca0c105083cd56291bf3 |     
  riscv32    | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/d2b6278726f68e796784215e874a54378f5346d8 |     
   mips64    | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/d70c2d4dede3697c1594272a4665ed1c796ad58f |     
    arc      | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/90cb55c7d331cd348fbbf4f57a243709c689303d |     
   nios2     | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/3b448898f35192e1a8a84126ace7193dd61f8bea |     
   arceb     | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/6888fd8ca70f375f6cc439f731602e199977da23 |     
 powerpc64   | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/264fea78057c62c6b3edc43b55aef754d6553a7d |     
microblazeel | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/ad0cc9365bb3ab570e3d333b574631c5aea682db |     
    m68k     | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/9befc3f6672ed64ad83013449be5253e57758606 |     
  riscv32    | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/cd13cc17ea8c413cee40782d592649f641fdb943 |     
  mips64el   | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/b72efff457ab53f738774b5372d493798c0fda50 |     
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/b47e294374612975a44e8ca40630273eb9168b8b |     
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/70fc86d7053199d58bdf083de215a17d119af62e |     
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/a75b93739e1e1cd586b3a81a9ed701cce9204b59 |     
 aarch64_be  |         glorytun-0.3.4         | NOK | http://autobuild.buildroot.net/results/a81fbfb10d9f4fed08ae94e1348aa2419ef6119e |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/c50e4292b0378e8ff60c18dd22e8ae9d14972a4f |     
    i686     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/47e7e82d74f16966b960e28b45d270ff5df16ef9 | ORPH
 powerpc64   |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/a110c7c3886d4e09e8c88cf147ea9db655a0732f | ORPH
   mipsel    | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/fadc3352c74fa37e95209c38d3de6a4f3e1017cd |     
    i586     |    gst1-plugins-bad-1.20.1     | NOK | http://autobuild.buildroot.net/results/3150d50f63c680a2add492c8124e549168b1da1b | ORPH
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/b80d2d95e11afe05b26b5db04f4811f9dd432f9e |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/04fc45bfbbd7a885b5401cb54be72644a1dd8cd4 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/5f3de9a8bfe614ae5d39667adfc7c2b73d7ab507 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/c89c0f152bfca7ecdf4ea0c653e555b0769ae0f9 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/bcabe396566dfe8732ee43d1c0b78aa425b9faa0 |     
    sh4      |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/02e6abcab31d43172e5170912d0f270a7cd760ca |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/22a753117aab4533fb6234a80ef6501b05cae75d |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/05b9aede3d96a0f3a81439d86a063d7767e33ae2 |     
    sh4a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/ba6c926050d66ff77521f63e0f7f68474f5c1597 |     
    sh4      |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/cb456a45f7aef8e6434f88c8b5e84780dc6d69a6 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/ce7cf8368b2294de6f80feec5c77dac65273dcee |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/36345fe5618bca8648c35e74be71b53ef8b1eee5 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/cd23ce4712a826e92375428e72eff84eeef145b9 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/de501e18029447738aecae43a1c845b881500043 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/aab04debb0ddefed5e052011690149d1bffc478f |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/687e354c4e61bf2b9c24e50f0cb5ca61e9ca2232 |     
    sh4      |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/11fd91cac86549bea6f52cc816783c9d30c85c74 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/2400c9d13b9e4cafcfd17d1bc847fd9c30408168 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/0d0a78710f78009bae8dba361847d50d6fd33107 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/ada94071e7a9e89d81285ae6c1cb73a46b656cf0 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/34df45d31948a8be62c15391967937b6c90be6df |     
   sh4aeb    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/4b7bd722431864c762297c016e62445c58f24f2f |     
   sh4eb     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/8d8262fc57d6f1dd5f419bdb1c4dca14053426a1 |     
    sh4a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/401a11f63457171c84c99b485a67c933dae046ad |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/8e4022c6cfa4dabdf372d3c1d41d11290293fd7c |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/9453d5bfad0d1a1ca1b18a42cdeed503c0443c21 |     
   sh4eb     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/32e12ad3e22e35ec0867051081dafebce24cbe75 |     
    sh4a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/e175ad7e9ede6f640d4649fa3a7bbe125508e720 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/9a4c78d6efec26a687adc2326208c1d3112b5bd5 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/d53eea6c496d6d871574f2835076551791f031c2 |     
   sh4eb     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/e19886b44cbc414e67632068ee19cea640efbb74 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/29928f16b3922f0e3308c0af65641484db176512 |     
    sh4      |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/bd4b5d94d836e45f5c4d10895f57ba94d42c7742 |     
   sh4aeb    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/bd80f704528a2547304b759d1ac1a3bd53fafd3c |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/dcf88acc6a3b39cc6269aaf32ce06f70746901ef |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/d2c402499cafeb300032c0bfd869319ba0e8495c |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/cb3ca287f98719283d9f6f8a2a5a1d9f0bb13da6 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/f1fb6d1291c7dc2757c5ca95c882d4232bb3a3c7 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/81856a77afab084abe3dbbfb4b801d62fd7c377b |     
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/a66bd9cd04bc86c77e42a3854dd81fa67c152a8e | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/c4ddad66146b927f68b84567bb548882640a57ee | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/c3110eb55b37b6dbcfb8aa90b811f6cf84e689a0 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/217022a239f782d6fbfe33c270aeb772d3db8a76 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/e75063d03fc267f63058a735988d56d2d0b69037 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/f926fba1e482373d6c388b9fa2f38cd28100b2d4 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/5bc407c4a9244f977733f76257e69c18603ebb23 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/8d6363eb4a0636f7968d59fcd51cd6a9271497bb | ORPH
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ff13c795da2c01f07fdf91f06a88746f3eba44c7 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/76dc44413b1d05045695a1312e80d5eb1281bda0 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/9863650daae25874169701877d0e5efcf09edd07 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/55c6dac02818da391d4ac9b7f4d6cf8cdbb8a79a |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e94252213264012b8f63bc4b3ffefd8049d48f01 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e96a089f6ff3c5819e6c231a9c71875074bef1de |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/39561a5c004c58dc282e53d6c4ca4732f04c4598 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/df6fcbc22c12aa0cf00dbb8d7f8ebb87c07d6bbf |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a1838a1a4e2e8abd435e6b30d5358889856007d8 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/10a9b36ad61e84c2ccf3470916520f8eab8daa01 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/eaea3b94572bf1fdc7d73eaa790771c070763cef |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/eeff832d6be1b9c284a84b2d3d98e3c935f1751e |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/159a12c391c7c29dda362071b564dd396a8153d3 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/1662d55949edbd21a64006c3ad21f2141642156c |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/517a764212e250beda85dedd4fc42c3c76e01f0c |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d55e7a89d208832590b466ad9175dca1197fa500 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/993552a47504fc87ed526b887ec8dc67cff2c510 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b37e793dade5e004efc3d7855aa2a724986cf574 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/3cb535cd43713512eaff84bda16dc8952eb07cfb |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/5bcc9ce89e4f076ad6ddb153955077073315cc26 |     
   nios2     |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/ab7ee8e538287dee5e6e5a6f1530dd283a97f61f |     
  riscv32    |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/1c0ff78f921355b82357f410bab2b4a49220596e |     
   s390x     |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/8ca69a4e2f97d231fb7ecc972697a7e7da777248 |     
 powerpc64   |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/099c076870813ef3f322a66ae345750351cb734a |     
powerpc64le  |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/9c7fb4a723313b4ad1a9ee8bfede56cae25ee3a1 |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/aa2fa43084dccda075537f1a53ca563a2762d976 | ORPH
  mips64el   |         host-go-1.17.8         | NOK | http://autobuild.buildroot.net/results/b542c8644bc9ea70be558524caeca7b475300d77 |     
 powerpc64   |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/b629f44c988dc2debc45cfb7f39e65d1bf0b24c6 | ORPH
   nios2     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/b3189ce98e00976a516a32de50a0a06353dc4496 | ORPH
    m68k     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/48bb7cf6d7b737aaa2ed6fb6806c72c152bd264d | ORPH
    arc      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/8a5b631c948972f5b435014dd1012a8dc4c77706 | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/b4d1ef3a5395040717f2d222cb700602383814d5 | ORPH
    arc      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/3a06f1e535b25983cd2daa6f9188b9081d36e623 | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/72fd6838e856d8a1fd51d0c8b08b53ac9d8b1171 | ORPH
   x86_64    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/d465ca07d76c029b3156e96dd8d1037f2b4e5a69 | ORPH
   x86_64    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/45007925d4fb155521d84bc475dc56eb6f9c6f57 | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/89bb5ccf2f5464acb5f2f2a86511e823eacc4aa0 | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/743aa0c52275fb8a4e45db8674734973858f5961 | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/8a79dd209ffde9cedef3adeccc5929a8dcedd5e5 | ORPH
   x86_64    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/8d38f29e16bbb6ea3e532094300e66098589e29b | ORPH
    arc      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/ede5a536f366621ae1b6968fd1627c1133c2b1a2 | ORPH
   mipsel    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/ae5c4bfef52764769c268014cbd6180e8658b6ae | ORPH
   x86_64    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/f8c4a9bcdfaa524401417b6ccaf75f9cf28e1b42 | ORPH
    i586     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/11af93d20d8a184f6711250a27b2f57384a80cd9 | ORPH
    arc      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/8a96b9f462bb3de94609a817774f737fc30c2cfa | ORPH
    arc      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/c0915a8adf81c050e612f892c27f01568f9a3e4d | ORPH
    m68k     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/491773d90dc2fa50a884cb6d3bcf4254e651375f | ORPH
powerpc64le  |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/559f28e780631bc26a662148b51ae595726448f9 | ORPH
  aarch64    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/dbae890608c2e45746130f66806e662707670070 | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/358b6aed4eaec4b60550d212ba5563a2f601d832 | ORPH
    or1k     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/823960451606ab53360c73e57e84ceba1927cbd5 | ORPH
  riscv64    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/e7012ad67b6bb5358ea5e6cc2e872c64ab22590c | ORPH
  aarch64    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/b87714871a80abf55ce3823d63854bef5b6c5fc4 | ORPH
    m68k     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/dc473a63b8f663933f9de75061394f5cb083019e | ORPH
   nios2     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/9a326379d854031f6ce4a1b2bf3386d5945d122f | ORPH
powerpc64le  |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/b4d2520067be446bbf719fec0e5a5374d07b45b6 | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/2b086b23beba9829f3cef274cd110c5e1707e21e | ORPH
   nios2     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/a0fb3629d9fb3e90b07e949a9ba534433313c6d5 | ORPH
   x86_64    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/8b9a100a231cb41ac351922297ac8a9d151d2118 | ORPH
   s390x     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/ae58900c55f0f5bf05333d0fe422de9c46f77190 | ORPH
   mipsel    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/c0f4c1dcbcd3a8c5e8b63d606c3b138543ff9e58 | ORPH
 powerpc64   |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/059e698f5bba9cf890cfdbbb2199a069e3cac112 | ORPH
   xtensa    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/78995439e9781a3e5c86a83334b98d076d693919 | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/fa8eda0b27a42772fa642c987490dd1cf87b4048 | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/743de1218426beb26d5cc8ba0c41ccc2a82d03c2 | ORPH
microblazeel |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/8138d76a43ce7a0aa583fc07880cd9ac689d6c6e | ORPH
   xtensa    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/de34bffbf462f7d8ce046792eb3679a53dba6b22 | ORPH
    i586     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/7e1347effff3208bf4554a28cd3b99a8e2ff0de4 | ORPH
    arc      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/d470a83e027c8b29877182bdea88430e706d0718 | ORPH
  aarch64    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/ed1be76b0bb4af0ce9491cd87f634344c22fed35 | ORPH
   nios2     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/ab8a35c8c4d9752d2b486e27886f0dd30c1cdec7 | ORPH
   x86_64    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/c09cbd48acb90e779157f12d3192fc90f9e9beb0 | ORPH
   mipsel    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/194ef447269bdf348ae622c1f8d1460ebdfa6f07 | ORPH
    or1k     |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/b819b0ef3bf4fc620051e4b736bef5de2954ba52 |     
    or1k     |          json-c-0.15           | NOK | http://autobuild.buildroot.net/results/006332add9c23689c51985453890fa8805a6d861 |     
    arm      |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/99ab4278ac8e75738b29a418fabf9213e43dc00f |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/a58b1fa362cb48b6d2203a9ab16543e0e6784e53 |     
    mips     |        libeXosip2-5.3.0        | NOK | http://autobuild.buildroot.net/results/2f1b97aec267f4ccd4a69f9abdc5e1f9a6181579 |     
    i686     |        libgcrypt-1.10.0        | NOK | http://autobuild.buildroot.net/results/d0ecab6c2e181324dcbf2ebf996fbfe38901698f | ORPH
   s390x     |         libkcapi-1.1.5         | NOK | http://autobuild.buildroot.net/results/2668865d97f1c098c5ac63729abc878bcacbf8ac | ORPH
   xtensa    |         libkrb5-1.18.4         | NOK | http://autobuild.buildroot.net/results/e19cb68e03eb464395414b6b6b809d3768ccbb3c |     
    i686     |         libkrb5-1.18.4         | NOK | http://autobuild.buildroot.net/results/b5fd5169d844051f138b2e023d366f798f0c1fc2 |     
  mips64el   |          libnspr-4.33          | NOK | http://autobuild.buildroot.net/results/61743bf5ad9ddc69786ae854ed4ab58c59f64dd0 |     
  mips64el   |          libnspr-4.33          | NOK | http://autobuild.buildroot.net/results/5c3d85587efe980098a150593799ebe0d8859435 |     
 microblaze  |          libnss-3.76           | NOK | http://autobuild.buildroot.net/results/dcfa8e979821a74aada3296c83dd81c524c6a08d |     
powerpc64le  |          libnss-3.76           | NOK | http://autobuild.buildroot.net/results/c16bbc94e6dc23891ab68f78b616f349e1a1384e |     
 powerpc64   |          libnss-3.76           | NOK | http://autobuild.buildroot.net/results/0f1d70d4e971eba109db4a56383e05629f7475f9 |     
 powerpc64   |          libnss-3.76           | NOK | http://autobuild.buildroot.net/results/ac84d3516bebbc10af45b53e303f1699f7854f82 |     
microblazeel |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/480fe3835d792bf9092c5d88c9dad888a3f85281 |     
   sparc     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/cfb62f156f3f71ecf13bb0f83941ea9682108b3d |     
microblazeel |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/2705339d727ba2d6909eb72b7662a3da6c0fc2da |     
   arceb     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/6cb582cabc7540b182d33b5e198539b29390c560 |     
    arm      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/b78c1fe536c84dead78ae754b715b67a8c39d122 |     
    arc      |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/6f882e845d2a131230b02efd1a507640a5fa5c52 | ORPH
   arceb     |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/95282921cf481f03cd1cb987bc69315490f0a65a | ORPH
   arceb     |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/e7ce3517d1947b7e1e638b60fbf25dcfda8543a7 | ORPH
    i686     |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/83fe37963dacdd6b5c33ed9a38eec99351585ee0 | ORPH
   mipsel    |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/cd4a2c847e77204913aa9b2b7cf43a2a7e2d69f6 |     
    arm      |      linux-5.10.104-cip3       | NOK | http://autobuild.buildroot.net/results/d284b55b409a7b3a31a8eb6cb6dcb1c54996c6b9 | ORPH
    m68k     |      linux-5.10.104-cip3       | NOK | http://autobuild.buildroot.net/results/6ac17600f73f20eb56959da4880841606773f9a8 | ORPH
   mipsel    |         linux-5.15.30          | NOK | http://autobuild.buildroot.net/results/f90f071728a0abd975c21bbccce0f3b88ebc1573 | ORPH
  mips64el   |         linux-5.15.30          | NOK | http://autobuild.buildroot.net/results/8087d5638522065474617bdd6404f5175e91de4c | ORPH
  sparc64    |         linux-5.15.30          | NOK | http://autobuild.buildroot.net/results/630dc607a2d2ca77173409b37f311b178496e424 | ORPH
    m68k     |         linux-5.15.30          | NOK | http://autobuild.buildroot.net/results/406320cf446bc71df88a5fd6680490af17568151 | ORPH
   sparc     | linux-headers-5.10.104-cip3... | NOK | http://autobuild.buildroot.net/results/685bd1dff4decb2fd12f707e29f3a1196269279a | ORPH
   x86_64    | linux-headers-5.10.104-cip3... | NOK | http://autobuild.buildroot.net/results/49b027ef523a712ff48c389a088d87b15f7acf97 | ORPH
   nios2     |     linux-headers-5.15.30      | NOK | http://autobuild.buildroot.net/results/304b5d53a5bb16acebc8eacbedee7a73919b03d3 | ORPH
  powerpc    |     linux-headers-5.15.30      | NOK | http://autobuild.buildroot.net/results/66bc563fc149442ec0ad720e02fae99beeac57c7 | ORPH
   xtensa    | Makefile:17392: lib/libfrrz... | TIM | http://autobuild.buildroot.net/results/d34fd28e2e716d9ebcad9f4cc7cb89613e3a956f |     
  powerpc    |           musl-1.2.2           | NOK | http://autobuild.buildroot.net/results/95c700147a2dbb077c7111d8d32271ab3982f566 |     
    arm      |          ndisc6-1.0.5          | NOK | http://autobuild.buildroot.net/results/1046736e59542a5091a1811ad07e17c1cd13ca3e | ORPH
  aarch64    |           ne10-1.2.1           | NOK | http://autobuild.buildroot.net/results/ecde6e3b88c45cdf5118a7ccb0291147eeaf5d78 |     
   sparc     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/3d620b56d8bd0d0de254b549fbcb6e36c55f9fbb |     
   arceb     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/2690b732df00562262459745451abf0aad69b25b |     
   sparc     |         openobex-1.7.2         | NOK | http://autobuild.buildroot.net/results/a10ea992c1837114a43c050fb78bc9e9704f9181 |     
   mips64    |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/7e906174fb2236e4e6a5bcb905dc23a2761d75dd |     
microblazeel |        pure-ftpd-1.0.50        | NOK | http://autobuild.buildroot.net/results/67aaca4e10135a5444db963b429d1ac5c41db536 |     
  riscv32    |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/54706bc6e907904c567e68d837f6c1e2ff51c516 |     
    i586     | qt-webkit-kiosk-a7720e50f2b... | NOK | http://autobuild.buildroot.net/results/55295d2ea8fe15d0a915111a8a3de05155e84716 |     
  mips64el   | qt5webchannel-fa8b07105b5e2... | NOK | http://autobuild.buildroot.net/results/9069620ee1cfbc6b30ad7d0b8cda64370dc1001c |     
   mipsel    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/2c6bdb187c4c8155c728d6feea131c3a1f62677e |     
   sparc     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/85390ce61855dc34e4b05381acd758a0bc492513 |     
    i686     |          rsync-3.2.3           | NOK | http://autobuild.buildroot.net/results/f54a9f4e04276ba492a15ab689881c6e4a304d6c | ORPH
  mips64el   |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/1cb5a66a6de283d79bc3b71fc5536a9c9488eae8 |     
   mipsel    |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/c463fe21a8f37ac74218dcf27968218cec028a03 |     
    i486     |        trousers-0.3.15         | NOK | http://autobuild.buildroot.net/results/d71af3912882c95b0a23e81cd23fb663d6f35c53 |     
microblazeel |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/251345912b3ce52859e61030b64ab1cb5599b560 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/b16fa4dabd4e6d9e5f26b2f382e294dcee22a696 |     
   arceb     |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/f06b0631dca4c56c478a5b016f5cabed8a0f2760 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/8407c8303c5c2d989815ef15912bd9c21eed91dd |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/51af28d16f58b3a0b9b7f5dbcfbf270c1c93b4d9 |     
  riscv64    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/392e1b7b7f9680b0505717ed9abca85b2479f298 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/cc1bdcf5645cb2e1d984f4ae53607b9bb153fb97 |     
   arceb     |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/bf0964bf333dafe0f28c0388926ffb1770fc29b4 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/2d98827bedcae9638f0824cd0ad48352c82fa9f9 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/92d998f8c2fe76a67dcb1693f681cda56e8c488d |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/f30b8ef68b71ad7f6107a8ce1083973d34be0096 |     
    or1k     |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/30fd221d87125490d5fb251b8d1670349b982b4c | ORPH
  aarch64    |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/467181e53ec4c535d0311d3ce40acf89e06e628e | ORPH
    arm      |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/6b60b3a29e4dd5b977ac16e9be1100532f36b47e | ORPH
   x86_64    |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/fd599f7c272d8f01db7bca3211ff47cadae8a7f4 | ORPH
  powerpc    |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/41993caa532ed7b0e52e9dd32321c8fdfe1a5e8a | ORPH
 microblaze  |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/cdb6964958f342f67a2f715789fd540ecbfc3e2a | ORPH
  powerpc    |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/b2007457003b0ac4720c577b62e832bea43f4efb | ORPH
   x86_64    |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/906407545ed951399e3b921bdc7983cb022bd451 | ORPH
    i586     |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/643d43a5c8af1023ab1821bd1752e8bcaea14d3e | ORPH
   mipsel    |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/86d6e48d6213e6987827b450ea94444ce174733f | ORPH
    i586     |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/810dddbf20dba34a680148c4e6507bcdf26b52b4 | ORPH
  aarch64    |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/fbf3664db13aa65bf7a8c51f877109be02ae2def | ORPH
   x86_64    |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/c23856f2bec4fab690e102249b90f7924ef78399 | ORPH
    or1k     |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/a97fde58d13b536a6ebba176d78ad50526a59689 | ORPH
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/c6e3e919d774617133effc94004136dd503eb73c |     
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/0ba3d78d46f941316d6dfecc159817e468dab961 |     
   xtensa    |      wpa_supplicant-2.10       | NOK | http://autobuild.buildroot.net/results/cf1b665ca46c21c4d0ca4a401674ffc31b569280 |     
   mipsel    |            xenomai             | NOK | http://autobuild.buildroot.net/results/ee3400671967f31cc397b65b8eca0915639f016a |     
   nios2     |            xenomai             | NOK | http://autobuild.buildroot.net/results/875aa21698c5fa6951d2a563def1c8161565dcbe |     
   mipsel    |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/815e6d6af26a264b4b3e82a03bf6e117a92aa297 | ORPH
 powerpc64   |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/74dc27e0fed4a361a9df7f2b046615831a340ad1 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/f86809391cc8741d818f207c16363becbe36059e | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/a641e05596b747c6b5737f794afca1333f67c5f5 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/bc29e973900fd9486fbf97479db8828ddb79a665 | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                 dhcp-4.4.2-P1 | 2 
                  ffmpeg-4.4.1 | 1 
   libtorrent-rasterbar-1.2.15 | 1 
                    vlc-3.0.16 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/1ab5ce09ecb074a9943add6f1b5d2d32c82becd7 | ORPH
  sparc64    |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/88356dc95f305e49c5a3a5fd23de9e106253c7a5 | ORPH
    arm      |          ffmpeg-4.4.1          | NOK | http://autobuild.buildroot.net/results/bd7fffbf9708c5f911bb573522a3a52d438a36b6 |     
    arm      |  libtorrent-rasterbar-1.2.15   | NOK | http://autobuild.buildroot.net/results/05084f8081c08418cc2bd86f146516b98d56cb74 |     
   xtensa    |           vlc-3.0.16           | NOK | http://autobuild.buildroot.net/results/1f7db27cd90f478d96c4c2af84f68897dcd7e32f |     



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

