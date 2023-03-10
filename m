Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9598BC6FD19
	for <buildroot@archiver.kernel.org>; Fri, 10 Mar 2023 07:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4F264011B;
	Fri, 10 Mar 2023 07:42:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4F264011B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KCx3gw8DQZWb; Fri, 10 Mar 2023 07:42:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5902340123;
	Fri, 10 Mar 2023 07:42:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5902340123
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 49A691BF37B
 for <buildroot@lists.busybox.net>; Fri, 10 Mar 2023 07:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1AA1F82165
 for <buildroot@lists.busybox.net>; Fri, 10 Mar 2023 07:42:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AA1F82165
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rT3Gk5lYX0AQ for <buildroot@lists.busybox.net>;
 Fri, 10 Mar 2023 07:42:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2609482159
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2609482159
 for <buildroot@buildroot.org>; Fri, 10 Mar 2023 07:42:25 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 02D4D100006
 for <buildroot@buildroot.org>; Fri, 10 Mar 2023 07:42:22 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 10 Mar 2023 07:42:22 -0000
Message-Id: <20230310074230.1AA1F82165@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1678434143; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QBG/8etIzht/zNapzCiEzIgfMs55vD58vPFcvOuxBEs=;
 b=BXd90DuiOXa7lFZePnIdYcTw8t3MYnAWdmh7gxS54rZheFzI7JsUhvlcaZec4xZ00k7GAs
 SR02Rb7/sJr/ixZy5fD0pvpxJfSCRsDNN6OAzLKLNDrgRGczucT9vgxZH9cEpZ4QH8wEiy
 thVZr/jw3x62L/1z4Os9shqSz3xGJFpFPj8Li4KCv806o9Zv9LQucuJARIjllJ45c6Uucf
 G7qV5YsiRXRNdnt5LSN22t736BzeU7K39LFxSUHX8Lh7TM2mXJu8tmwd3MPtvH5F44JEwF
 J1p+aMGbepwIo7jiJhepBPiVVxPigaXmWYUvAaTnxCLWvLAn1YprIET8Fem7bA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BXd90Dui
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-03-09
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

Autobuild statistics for 2023-03-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.11.x  |  7  | 13  |  0  | 20  |
    master   | 138 | 151 |  1  | 290 |
     next    | 18  | 27  |  1  | 46  |

Classification of failures by reason for master
-----------------------------------------------

host-go-bootstrap-1.4-boots... | 35
uqmi-0a19b5b77140465c29e2af... | 7 
            host-binutils-2.38 | 6 
                       unknown | 6 
glibc-2.36-81-g4f4d7a13edfd... | 5 
               libglib2-2.72.3 | 5 
  gobject-introspection-1.72.0 | 4 
           host-libzlib-1.2.13 | 4 
                elfutils-0.186 | 3 
            host-binutils-2.39 | 3 
      libabseil-cpp-20220623.1 | 3 
                  linux-6.1.14 | 3 
                     php-8.2.3 | 3 
              traceroute-2.1.0 | 3 
                     znc-1.8.2 | 3 
              host-pahole-1.24 | 2 
                       kmod-30 | 2 
             libgpg-error-1.46 | 2 
                 libnss-3.88.1 | 2 
            ocf-linux-20171122 | 2 
                    olsr-0.9.8 | 2 
                alsa-lib-1.2.8 | 1 
                  assimp-5.2.5 | 1 
                  boost-1.80.0 | 1 
                  cairo-1.16.0 | 1 
                  check-0.15.2 | 1 
                 dc3dd-7.2.641 | 1 
              dropbear-2022.83 | 1 
                   duma-2.5.15 | 1 
                    dust-0.8.1 | 1 
                  ffmpeg-4.4.3 | 1 
             fontconfig-2.13.1 | 1 
fs/cramfs/cramfs.mk:46: /tm... | 1 
fs/romfs/romfs.mk:32: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                     gmp-6.2.1 | 1 
            host-binutils-2.37 | 1 
                host-go-1.19.6 | 1 
              host-rust-1.67.0 | 1 
                  janet-1.26.0 | 1 
                jemalloc-5.3.0 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
libdill-32d0e8b733416208e04... | 1 
                 libuwsc-3.3.5 | 1 
          linux-5.10.162-cip24 | 1 
                     lxc-5.0.2 | 1 
               mariadb-10.3.36 | 1 
                mongodb-4.2.18 | 1 
       network-manager-1.40.10 | 1 
                        nodejs | 1 
                  ntpsec-1.2.2 | 1 
                 openssh-9.1p1 | 1 
package/multipath-tools/mul... | 1 
                   perl-5.36.0 | 1 
                     pv-1.6.20 | 1 
                 qt6base-6.4.2 | 1 
rtl8192eu-94bce7798bbb18de6... | 1 
rtl8821cu-69c903b75bde36293... | 1 
                    sdl-1.2.15 | 1 
                   thttpd-2.29 | 1 
           uboot-tools-2021.07 | 1 
ulog-0389d243352255f6182326... | 1 
               valgrind-3.19.0 | 1 
                 wolfssl-5.5.3 | 1 
                xenomai-3.0.10 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/751ae6009a50ff05dc1fa2f85b103e4366fec17c |     
   mipsel    |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/a5e5e4dc46e733e4c3111a65d5642bde8dcde581 | ORPH
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/2ce29d2978931ba12189120503d035a1778cba24 |     
   xtensa    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/f4bc9401d657977ba467a2a03d7dfc2a82c2aa35 |     
   s390x     |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/1625236ac7cbe2372dda589fa50e86e950471554 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/7955e5e8349c1fb19dbe223017639cd64d562a30 | ORPH
    or1k     |        dropbear-2022.83        | NOK | http://autobuild.buildroot.net/results/95b5e088358d983e08d712e86db4067e5053591b |     
    i686     |          duma-2.5.15           | NOK | http://autobuild.buildroot.net/results/c6bdbb883478b4ca3f7cb39e0920c3606594a259 | ORPH
    mips     |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/699d9ba92cc316a55513e42034672b0bf73d1c7c | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/349d17116a32617367679d084d2ff7907099dfe0 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/dab8292795e26998bc1cc644ffeeca2a484d4a7a | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/c3d2fad744007101a0bd9266bd3be7766e739618 | ORPH
    arc      |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/2857d684966e9e89ebdb60f2238e8afd34885b3a |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/c753bd47e4ba044aa417573f3d439d2955202570 | ORPH
  mips64el   | fs/cramfs/cramfs.mk:46: /tm... | NOK | http://autobuild.buildroot.net/results/148bf934918dcda22d288ede0a925171f2f06e09 |     
microblazeel | fs/romfs/romfs.mk:32: /tmp/... | NOK | http://autobuild.buildroot.net/results/5ddef3363d3360f9be98663f187f6b30387e85af |     
    mips     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/9e15d4266bdcc8b2e5b0324802e7ba25dad55980 |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/73522e21f66dce40e424f28f2640d5589ad85e00 |     
   x86_64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/9282c2e3793d77bd6467bf955c48b20acd9af5e4 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/e17800669f59b541406db608dbf2d5d40aa65c6c |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/0952397a1e6da172a6f81b2be0ad98bef4cb43a2 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/cb787377ff5f09d88a9127d55ac24dd8fec970ec |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/b28761c596bcd49927e4a29af3ce5eb3b50373a5 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/ceff823fc74e56df4aef43bc7460f8ae3e913609 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/cda9e957f9c0aab84609e94c1af1a3ffce8577eb | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/2f29915bd819e50173f994b8f6db32749286fb96 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/d3af5d5d85aa63f5ac67ce7f389249f6f673016a | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/38033c3dc067d10dc0e8340c7e7cc0eced15f383 | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/1195e8a3cab8e24ed6ba83025c9a4ab0780aadc7 | ORPH
   x86_64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/5f3f9e2a25d780e4322aed3333a25f05053968c0 |     
  aarch64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/8c4cc9c69100b0047bf6d3e7ac5183de0c28ed85 |     
    m68k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/25c2b04ed1de1d72a6ebd06e7e05cf9ac049d5d7 |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/fc3a0aa923018bfdc24994d22fbc30d052682e3e |     
   nios2     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/3fc745c012167a55775021e047a33fece2016e4d |     
   nios2     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/21e8bce053df73796ff273a8ff2f5c310a6596e5 |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/bbabd56421119e44245b8738619a9b7df492dccb |     
  riscv64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/a71e130da542c042d8f5fc9f6e054b8145e61931 |     
   armeb     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/37f1e71fe40b7533ec68ea69a117a1ff440039ae |     
 microblaze  |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/3c38687205b8da2141accaec22233854bb5194eb |     
   mips64    |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/72a5f646f957e42dd966871320fb58959718b988 |     
powerpc64le  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/0e1d63a19276e1c5b0923d9e367362dec387b091 | ORPH
powerpc64le  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/7601002015e5e31c12c56a79909cbb3d0c4f669e | ORPH
    mips     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/7dca1cd41dacb18ac90eb905487edb3c5c4ef7e5 | ORPH
  mips64el   | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/9b88101694fc68d283a02cea41b770f102739e69 | ORPH
   x86_64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/3433175f1f426e74e30067174b0a8361eb322f27 | ORPH
 microblaze  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/24171cb3a34975cfe25a40a25a1716e257c00713 | ORPH
   sparc     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/c37ac6e7d603c0c0ecdbc532c601af1c25cf7aff | ORPH
    sh4a     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/fc6fcc6c29e2ef0e0e5b374a1e7735dd4aa698ec | ORPH
   s390x     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/78d6a922bb1deed4c0426d4797d70b1dd6ddc623 | ORPH
    i686     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/43565110a8226f5922203c44ac4c77b150dcf4a1 | ORPH
powerpc64le  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/1ca954a99275aee86542ef3c958bfa94f8744fce | ORPH
    i686     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/1638eac5e9afa6e04166e36f33c58e1e632acb79 | ORPH
    arc      | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/fc5282750e3522b97dbcbbd79bbebcffa1f1d25b | ORPH
   s390x     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/070d9890d971af03655838e7fd144d0287c72cbb | ORPH
   sparc     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/a3b0c973b1aec9dc0f7226c786ae7ce732868d24 | ORPH
powerpc64le  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/c28b76c03e0ceb6da5585b96da40b20a1ec7dd90 | ORPH
 powerpc64   | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/035d4afd4fb7e46f67a5d8eec4b65a97198df29d | ORPH
    arm      | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/774395c4388333253fa64e7a6a18d87324d9b0c0 | ORPH
powerpc64le  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/3195b756b3bcf7bf3d00e88debee696e574479f9 | ORPH
  sparc64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/d51835e200a1e8b0dda07a0c63711dd3418f9f5e | ORPH
powerpc64le  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/41f562b720b9f3bc14a970a0f73e6c88075df5da | ORPH
   sparc     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/e72b5e3f3c263b11f14a601d4eeec9bcbe2f4586 | ORPH
   mips64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/73102b883d20fcde446a582cb14e867149a73590 | ORPH
   s390x     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/579bc7ca7dea804296ee7e5e1ccdb9a67253f47c | ORPH
powerpc64le  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/c3272a4e3d02810a3ff85b68f2b24b99ddab5acc | ORPH
powerpc64le  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/0545aaf502e36a0ea2235a5a46f2e5e06f52fac6 | ORPH
    i586     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/67d4cdd6349087255e189919818ff992e2afa79c | ORPH
 powerpc64   | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/270ea38e18aa51875bf885e949ae92e469f3f100 | ORPH
    mips     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/f0bc16cb3354b14d668f0bdbbb60dbb54a4209cf | ORPH
   s390x     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/65ce00e39b6f92b8fc05a9512482437d553fef06 | ORPH
    mips     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/d71b565512eaf71f5385bc89365ea3295782f695 | ORPH
    arm      | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/8f648ef50a812b679c0a984969536b95b0053b32 | ORPH
  sparc64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/7f7c6faa73fa1eec9c5510b5bd98749e7a2e3252 | ORPH
 aarch64_be  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/1297e395ba85fcfc4f3253f5a3bf826aa4ea42fd | ORPH
   x86_64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/7bef214052027706c3de41b7e88aa307b318fb19 | ORPH
    sh4a     |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/e0cd7b26b80b70491001cb6593e85c172ba2d02b | ORPH
 powerpc64   |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/f608306dd7d93350759a88d62e8df7275ac2d287 | ORPH
 aarch64_be  |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/84929833230fe4b6ce2b483b06ab009e3bb4542d | ORPH
powerpc64le  |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/e6ef457b01af2d539a70fc8069d89b2c82cc8eda | ORPH
  sparc64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/327a93d2f7d39daab2d74ec92c3aa5a6e704f6c2 |     
    i686     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/2400b01276d2d72386563e5e3beab01f55f43d4d |     
  aarch64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/cc985e02933507fb7ebd38c02a348064a54c59c5 |     
   xtensa    |          janet-1.26.0          | NOK | http://autobuild.buildroot.net/results/cefc7ee46d2735865ccd390d648b982d05b15bc8 |     
   sh4aeb    |         jemalloc-5.3.0         | NOK | http://autobuild.buildroot.net/results/5304fd5f8f68c3ffb716632020f60fcd1d2ab3b7 |     
   x86_64    |            kmod-30             | NOK | http://autobuild.buildroot.net/results/1b48ec49eac6e297e8d97cdcf7c7bc6ce6cc8f78 |     
   xtensa    |            kmod-30             | NOK | http://autobuild.buildroot.net/results/88bbbde07d955f983d71c4aaee92a75ce53494ab |     
   x86_64    | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/804532f16ce5e46286b701baa41067eb44e8d7b5 | ORPH
  mips64el   |    libabseil-cpp-20220623.1    | NOK | http://autobuild.buildroot.net/results/094936de49a3806b430c47aab5be5ea7aef44fba |     
   mips64    |    libabseil-cpp-20220623.1    | NOK | http://autobuild.buildroot.net/results/77c4a95d5118954132645e0c5315cd1102503cff |     
   mips64    |    libabseil-cpp-20220623.1    | NOK | http://autobuild.buildroot.net/results/625f2587c6bae5e2c925e848a5f78168b55f330e |     
    m68k     | libdill-32d0e8b733416208e04... | NOK | http://autobuild.buildroot.net/results/975c1fcc6688e9f60fbcb6e79d20e388c8d3a980 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/b196634c72309bdf5361edd6a6569cea8c00fe7e |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/10b4f7797fdc6eaf327abb795456baf28ea70af7 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/c7590805022771b16b5e72037567100413592264 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/51bb356a3e2e51dd094f960cb7a07c32c120ba89 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/1f3551ef7616c3f36097ac75bd0128159e7a1268 |     
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/e4413b15f04105863e7c946f776d2ee8459bcb85 | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/9e87c35e39175ea1388153a954fb85c096546ba2 | ORPH
powerpc64le  |         libnss-3.88.1          | NOK | http://autobuild.buildroot.net/results/f79d825dce073b3416a0d0b1a583e8a3371cb145 |     
    mips     |         libnss-3.88.1          | NOK | http://autobuild.buildroot.net/results/eeaac0aede8113c8add5a27f621da044b344ef60 |     
  riscv32    |         libuwsc-3.3.5          | NOK | http://autobuild.buildroot.net/results/f4a664d96051b95d69c1714f7ad78a9b9b131325 |     
  riscv64    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/59ee19fd715e7d7daf6c3d0fb2c719bf34ecbfd0 | ORPH
   mipsel    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/59b7a94817c4b2e2375a4b0f3b64816f9cced76e | ORPH
   mips64    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/b7bfe79edfc94ba62261e7fe3d71be8b173b179b | ORPH
  powerpc    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/2a2e43efe5887039e068fd260ef9447d9c12e785 | ORPH
 aarch64_be  |           lxc-5.0.2            | NOK | http://autobuild.buildroot.net/results/be48d10c153c3ab7765519e92499346d7f68f905 |     
   sparc     |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/9f9f5afe5051c3fea97a3b699f9490e10ec51806 | ORPH
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/ed23bc4b6e0b18b8f301ae4bfacba7497fcf03c3 |     
    i686     |    network-manager-1.40.10     | NOK | http://autobuild.buildroot.net/results/dc76254506531046997e8a5057e8fe9548c357fd | ORPH
  aarch64    |             nodejs             | TIM | http://autobuild.buildroot.net/results/436228cbcc441a48f55a9958d0325bd7ae010e7c |     
microblazeel |          ntpsec-1.2.2          | NOK | http://autobuild.buildroot.net/results/604a42d972f86809ba227e1cf26e7b8c3864aa03 | ORPH
   armeb     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/995b918afe68a91c2039244047bda1e6f08f3255 | ORPH
microblazeel |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/07b33039c1247c5e08587c8654e5f8162992998f | ORPH
   s390x     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/3b20edf3d9565156005273dffb81f5c39a301521 | ORPH
    i686     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/5385ab5f71ad7b9c10902f40504659502e8be2af | ORPH
  sparc64    |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/4ff7948dbc15a0e0a24919ae3769d0996c52f23d | ORPH
  powerpc    | package/multipath-tools/mul... | NOK | http://autobuild.buildroot.net/results/dadb7adef130cc30322ad77b00ef8603102aed86 |     
   arceb     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/51630b12ba8ce1307b93dcec2eaf6726b4047888 |     
 microblaze  |           php-8.2.3            | NOK | http://autobuild.buildroot.net/results/b8e6890796005cd8103615dd63d5bda51e7c8840 |     
  sparc64    |           php-8.2.3            | NOK | http://autobuild.buildroot.net/results/870773c08b95a1b01df1d353b0356ef0737ae357 |     
microblazeel |           php-8.2.3            | NOK | http://autobuild.buildroot.net/results/1af39b0fc75b21c49862dbaefe66871d9534a415 |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/c4bb1176c3290c1df3422de8442300e46a005ddf | ORPH
 aarch64_be  |         qt6base-6.4.2          | NOK | http://autobuild.buildroot.net/results/30dcfe29f858606300fcf8ac65d811dff7279c2f |     
powerpc64le  | rtl8192eu-94bce7798bbb18de6... | NOK | http://autobuild.buildroot.net/results/b248203c7affe183dd297075a540389a82cdae8f |     
 aarch64_be  | rtl8821cu-69c903b75bde36293... | NOK | http://autobuild.buildroot.net/results/2a8432646926b3b69383d204673c4113aae9de12 |     
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/da5d405e8992c04040144ad8d40e221db4562dc5 | ORPH
   nios2     |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/9af3fd909b9ef279d7ccd5e8666ea7b37bcdf39c | ORPH
  mips64el   |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/c22b44974477f33ddf30dde119b2ebca2ee57f5c |     
   sh4aeb    |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/415859df0b63872ab85d83ef834e08c4145ea9f1 |     
microblazeel |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/405cd0fbd666b39cd2ce3cab0e73ee785e640965 |     
    i686     |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/804853bc82f77b13f0a62cef9e765e599f772931 | ORPH
    or1k     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/5f176b7230d8dbf73ec113bd5697c450e4d99989 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/e4d140cdf24bfe42607c3ab48cb1f03ed5f3087d |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/522874c1f1d3496d808fcd2036e4de60459ad3a1 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/91c39924f3ce36d3aa00c8b3980319720e3bc4aa |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/9970b601b4d1e2b9d1574c586c84a3e5d9dab53b |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/89ee7f68bd6e61a4eb2f754ca537842dd468e4c3 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/82526a8b4dacbc5f02e5e7310c643d1b05f9025e |     
    or1k     | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/04106f178c8745b9081a71863e2072e773eb0266 | ORPH
 microblaze  | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/89a3cf5d6fdbb0d60d9eb462da05a2e29ca9c4f8 | ORPH
   s390x     | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/6333b1cd3e1d76632ad92b6d45e3b9ffe360a11c | ORPH
   mipsel    | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/55e08a1518f8dbb8fa6b867ed3576444b0890de5 | ORPH
    mips     | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/159a90e4c8df0e268e116a730930f52a72d88a31 | ORPH
  mips64el   | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/086814e243a991af87ed9a6882b198969b5875fd | ORPH
  sparc64    | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/e8d3ab623f0b41695c4fc5d00f373d6b1a8ca578 | ORPH
   mips64    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/f1f73276572159ba7f51c7d1333472b84b2814cd | ORPH
   mips64    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/b9d379757d0bb48de666f580b9bc6230d1d63c32 |     
    arm      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/5e451437c0ad41d564792886cb6ccf8dca98289a |     
   sparc     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/59703852df0b0b5d856339cfc5baf5673e1045ee |     
    or1k     |           znc-1.8.2            | NOK | http://autobuild.buildroot.net/results/c7e7a378c9a976fc224bdf3caaab777787148821 |     
    or1k     |           znc-1.8.2            | NOK | http://autobuild.buildroot.net/results/cf6adc190dc7032b8103fbeeb429d08a2a43f7ff |     
 aarch64_be  |           znc-1.8.2            | NOK | http://autobuild.buildroot.net/results/3fec5c3a21af47b5f4e8adcaf4ce1fff5070e00a |     


Classification of failures by reason for next
---------------------------------------------

                       unknown | 3 
fs/ubifs/ubifs.mk:49: /home... | 2 
glibc-2.36-81-g4f4d7a13edfd... | 2 
                host-go-1.19.6 | 2 
              host-pahole-1.24 | 2 
                     file-5.43 | 1 
fs/axfs/axfs.mk:32: /home/t... | 1 
         gobject-introspection | 1 
                 gocryptfs-2.3 | 1 
         host-libarchive-3.6.2 | 1 
              host-rust-1.67.1 | 1 
              kodi-19.5-Matrix | 1 
                 libnss-3.88.1 | 1 
             lirc-tools-0.10.2 | 1 
                  netsurf-3.10 | 1 
                    olsr-0.9.8 | 1 
           proxychains-ng-4.16 | 1 
              skalibs-2.12.0.1 | 1 
                 systemd-252.4 | 1 
                     vdr-2.6.3 | 1 
               xfsprogs-5.14.2 | 1 
                     znc-1.8.2 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |           file-5.43            | NOK | http://autobuild.buildroot.net/results/4580e0964f62bc2afd22991c575bca4b29996257 | ORPH
  mips64el   | fs/axfs/axfs.mk:32: /home/t... | NOK | http://autobuild.buildroot.net/results/9d740cb1d3f7e6fd6f65f6ef399a5e449d93618a |     
 microblaze  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/20aa6b3636a2a64efa247c27b0e0c08813b0cb07 |     
   sparc     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/9a209b9da1b12af654974ac9fece620c3344b9b4 |     
   arceb     | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/1df15d3d004f9ff03abf11008535cbc859ea5313 |     
powerpc64le  | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/4ddb7851a778c6f7aa7ba61b8b4e79ac4287c7bb |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/8e7f4efd22ee2b690358752048bdc3f76b0da08a |     
   s390x     |         gocryptfs-2.3          | NOK | http://autobuild.buildroot.net/results/96ea26d98fc2164ffc2b21e5a33602756170e055 |     
   mips64    |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/5471289d9dcdb7a14df8ee8b13ef37e01dc0cd6c |     
  mips64el   |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/0ab706fe46f6d83bd0df3f950991fad0db022724 |     
   arceb     |     host-libarchive-3.6.2      | NOK | http://autobuild.buildroot.net/results/aea66675a1275218a550dca34e11aa7a5c5f4780 |     
   sparc     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/d9dca0bbb862b2eef7d75960227f355c9ade4e26 |     
   arceb     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/e59d5a8ec8554964ed32103162d32b5aebdd79aa |     
   mipsel    |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/0591e076899f8767c256fce969e389130dc88c96 |     
  aarch64    |        kodi-19.5-Matrix        | NOK | http://autobuild.buildroot.net/results/d4770217060eb35db000ed1538148b14d961259a |     
powerpc64le  |         libnss-3.88.1          | NOK | http://autobuild.buildroot.net/results/597b8b1a45d613b4f6fe6efa0ed877b9a6c933de |     
   sh4aeb    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/e258291c14c9b914f460cc02f31e0bab9a9601a2 | ORPH
   mipsel    |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/6b25e92e245bea8a3cdeb39bb1583f6bd3c5362b |     
    arm      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/b17330a8ae54a3e146499491538eb69f3576e246 | ORPH
  aarch64    |      proxychains-ng-4.16       | NOK | http://autobuild.buildroot.net/results/8afdb1a6cd0f67d8565281799eae4ddc45f3b00f | ORPH
    or1k     |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/c4ac6ab3d2e2cee7ca1ca139099b03c1ad691cb5 |     
    mips     |         systemd-252.4          | NOK | http://autobuild.buildroot.net/results/63a58d6a7cfec3908ca5f025e4851789baa5aa30 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/d14be8579979cc2e8397f04495dc68bc12a2a665 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/123d683f269b76db94d371e4296ab64ecbcd6163 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/e4814c6ec3d9097c82775a1eae6f0bed45df7966 |     
   sparc     |           vdr-2.6.3            | NOK | http://autobuild.buildroot.net/results/359950f8cd563b6787eee1483f8f592655b4ac69 |     
   mips64    |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/75ac9069d709c2208270274cf7a84b16ba340694 | ORPH
  sparc64    |           znc-1.8.2            | NOK | http://autobuild.buildroot.net/results/702aa9301ad80cf5a25f9da64371695d127825fd |     


Classification of failures by reason for 2022.11.x
--------------------------------------------------

              host-pahole-1.24 | 2 
                     file-5.43 | 1 
                gerbera-1.10.0 | 1 
  gobject-introspection-1.72.0 | 1 
            host-binutils-2.38 | 1 
              host-rust-1.64.0 | 1 
                   json-c-0.16 | 1 
                  linux-6.0.19 | 1 
on2-8170-modules-73b08061d3... | 1 
                       unknown | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
                    zstd-1.5.2 | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |           file-5.43            | NOK | http://autobuild.buildroot.net/results/560e2473b307de334f32581aaa53820250a8b48e | ORPH
 aarch64_be  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/bb324355fc63c92f70264c048e1ca1411739aeda |     
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/a7c5b19b376437496a4b4cecab7e35c30cade732 | ORPH
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/395af738a7a67c807b71f10a9d852367830733de |     
    or1k     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/9179de3578687e9207e5678219c88a8512b2ebca |     
 microblaze  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/1c621ae25b71e656a7e983af787a8536acbeea32 |     
   armeb     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/001857e5c2d5fc4962910095fdcd739311b7a71c |     
  riscv64    |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/bb0a63f83fa34feae142ec3494610edde631c5b1 |     
microblazeel |          linux-6.0.19          | NOK | http://autobuild.buildroot.net/results/91f0e56d4bdf0815f7999013c98c4290400ec852 | ORPH
   armeb     | on2-8170-modules-73b08061d3... | NOK | http://autobuild.buildroot.net/results/779d7344d0340369aa3f18e8d9ac185f2480f8f0 | ORPH
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/83cd4cdc3a164ff1443394b3d5cf19a79e06558d |     
    mips     | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/646f72287bbd997e8a2975d33d779902bdf491ed | ORPH
microblazeel |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/ec308b4e579b7c615ef3e17209fd3050a644d4b1 |     


Gitlab CI results for 2023-03-09
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
 TestAarch64Pages64kGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389495  | ORPH 
  TestAarch64Pages64kMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389497  | ORPH 
TestAarch64Pages64kuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389501  | ORPH 
         TestCheckPackage | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897390084  |      
      TestClangCompilerRT | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897388980  | ORPH 
             TestCpioFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897388869  | ORPH 
           TestCrudiniPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897388981  | ORPH 
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897388983  | ORPH 
             TestDropbear | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897388986  | ORPH 
             TestExecline | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897388992  | ORPH 
               TestExt2r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897388871  | ORPH 
...rch64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389536  | ORPH 
...tlinAarch64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389538  | ORPH 
...arch64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389539  | ORPH 
...otlinAarch64MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389540  | ORPH 
...ch64UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389541  | ORPH 
...linAarch64UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389543  | ORPH 
...h64beGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389545  | ORPH 
...inAarch64beGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389547  | ORPH 
...64beUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389548  | ORPH 
...nAarch64beUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389550  | ORPH 
...750dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389552  | ORPH 
...nArcle750dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389555  | ORPH 
...ehs38GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389557  | ORPH 
...inArclehs38GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389560  | ORPH 
...hs38UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389562  | ORPH 
...nArclehs38UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389565  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389569  | ORPH 
...mebv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389572  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389575  | ORPH 
...rmebv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389578  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389582  | ORPH 
...ebv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389588  | ORPH 
...5eabiGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389590  | ORPH 
...inArmv5eabiGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389593  | ORPH 
...v5eabiMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389595  | ORPH 
...linArmv5eabiMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389598  | ORPH 
...eabiUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389600  | ORPH 
...nArmv5eabiUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389602  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389604  | ORPH 
...Armv6eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389606  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389608  | ORPH 
...nArmv6eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389609  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389610  | ORPH 
...rmv6eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389611  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389612  | ORPH 
...Armv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389613  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389615  | ORPH 
...nArmv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389616  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389617  | ORPH 
...rmv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389618  | ORPH 
...mv7mUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389619  | ORPH 
...tlinArmv7mUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389620  | ORPH 
...8xxxUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389621  | ORPH 
...nM68k68xxxUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389623  | ORPH 
...fireUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389626  | ORPH 
...8kcoldfireUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389630  | ORPH 
...azebeGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389634  | ORPH 
...icroblazebeGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389640  | ORPH 
...lazebeMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389644  | ORPH 
...MicroblazebeMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389650  | ORPH 
...zebeUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389654  | ORPH 
...croblazebeUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389656  | ORPH 
...azeelGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389658  | ORPH 
...icroblazeelGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389661  | ORPH 
...lazeelMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389664  | ORPH 
...MicroblazeelMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389667  | ORPH 
...zeelUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389669  | ORPH 
...croblazeelUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389670  | ORPH 
...ips32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389673  | ORPH 
...otlinMips32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389675  | ORPH 
...Mips32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389679  | ORPH 
...ootlinMips32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389681  | ORPH 
...ps32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389682  | ORPH 
...tlinMips32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389683  | ORPH 
...s32elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389685  | ORPH 
...linMips32elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389686  | ORPH 
...ps32elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389691  | ORPH 
...tlinMips32elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389695  | ORPH 
...32elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389699  | ORPH 
...inMips32elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389702  | ORPH 
...2r5elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389704  | ORPH 
...nMips32r5elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389708  | ORPH 
...32r5elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389710  | ORPH 
...inMips32r5elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389713  | ORPH 
...r5elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389718  | ORPH 
...Mips32r5elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389719  | ORPH 
...2r6elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389720  | ORPH 
...nMips32r6elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389722  | ORPH 
...32r6elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389725  | ORPH 
...inMips32r6elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389726  | ORPH 
...r6elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389731  | ORPH 
...Mips32r6elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389734  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389737  | ORPH 
...Mips64eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389743  | ORPH 
...4eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389748  | ORPH 
...nMips64eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389754  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389761  | ORPH 
...ips64eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389767  | ORPH 
...64n32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389771  | ORPH 
...inMips64n32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389775  | ORPH 
...s64n32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389778  | ORPH 
...linMips64n32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389783  | ORPH 
...4n32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389787  | ORPH 
...nMips64n32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389789  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389791  | ORPH 
...ps64r6eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389793  | ORPH 
...6eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389795  | ORPH 
...ips64r6eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389797  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389798  | ORPH 
...s64r6eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389799  | ORPH 
...Nios2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389801  | ORPH 
...ootlinNios2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389804  | ORPH 
...nriscGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389808  | ORPH 
...linOpenriscGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389810  | ORPH 
...enriscMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389813  | ORPH 
...tlinOpenriscMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389816  | ORPH 
...riscUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389820  | ORPH 
...inOpenriscUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389827  | ORPH 
...440fpGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389830  | ORPH 
...owerpc440fpGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389832  | ORPH 
...c440fpMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389833  | ORPH 
...Powerpc440fpMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389834  | ORPH 
...40fpUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389836  | ORPH 
...werpc440fpUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389841  | ORPH 
...e5500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389849  | ORPH 
...erpc64e5500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389855  | ORPH 
...e6500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389861  | ORPH 
...erpc64e6500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389863  | ORPH 
...4e6500MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389865  | ORPH 
...werpc64e6500MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389867  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389868  | ORPH 
...c64lepower8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389870  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389872  | ORPH 
...pc64lepower8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389874  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389878  | ORPH 
...rpc64power8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389882  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389884  | ORPH 
...erpc64power8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389888  | ORPH 
...300c3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389892  | ORPH 
...werpce300c3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389899  | ORPH 
...e300c3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389906  | ORPH 
...owerpce300c3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389910  | ORPH 
...00c3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389915  | ORPH 
...erpce300c3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389916  | ORPH 
...500mcGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389918  | ORPH 
...werpce500mcGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389920  | ORPH 
...e500mcMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389922  | ORPH 
...owerpce500mcMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389924  | ORPH 
...00mcUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389927  | ORPH 
...erpce500mcUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389929  | ORPH 
...lp32dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389930  | ORPH 
...lp64dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389933  | ORPH 
...iscv64lp64dGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389935  | ORPH 
...4lp64dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389937  | ORPH 
...Riscv64lp64dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389940  | ORPH 
...p64dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389942  | ORPH 
...scv64lp64dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389945  | ORPH 
...0xz13GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389952  | ORPH 
...linS390xz13GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389953  | ORPH 
...Shsh4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389956  | ORPH 
...ootlinShsh4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389962  | ORPH 
...nShsh4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389966  | ORPH 
...BootlinShsh4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389970  | ORPH 
...hsh4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389974  | ORPH 
...otlinShsh4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389978  | ORPH 
...h4aebGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389981  | ORPH 
...linShsh4aebGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389984  | ORPH 
...sh4aebMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389985  | ORPH 
...tlinShsh4aebMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389987  | ORPH 
...arc64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389989  | ORPH 
...tlinSparc64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389990  | ORPH 
...rcv8UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389991  | ORPH 
...linSparcv8UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389992  | ORPH 
...X8664GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389993  | ORPH 
...ootlinX8664GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389995  | ORPH 
...nX8664MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389997  | ORPH 
...BootlinX8664MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389998  | ORPH 
...8664UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897390000  | ORPH 
...otlinX8664UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897390001  | ORPH 
...orei7GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897390003  | ORPH 
...X8664corei7GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897390007  | ORPH 
...corei7MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897390009  | ORPH 
...nX8664corei7MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897390013  | ORPH 
...rei7UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897390016  | ORPH 
...8664corei7UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897390017  | ORPH 
...664v2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897390019  | ORPH 
...tlinX8664v2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897390021  | ORPH 
...8664v2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897390023  | ORPH 
...otlinX8664v2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897390025  | ORPH 
...64v2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897390027  | ORPH 
...linX8664v2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897390030  | ORPH 
...664v3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897390033  | ORPH 
...tlinX8664v3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897390036  | ORPH 
...8664v3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897390039  | ORPH 
...otlinX8664v3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897390041  | ORPH 
...64v3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897390043  | ORPH 
...linX8664v3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897390045  | ORPH 
...664v4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897390046  | ORPH 
...tlinX8664v4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897390048  | ORPH 
...8664v4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897390049  | ORPH 
...otlinX8664v4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897390050  | ORPH 
...64v4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897390051  | ORPH 
...linX8664v4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897390053  | ORPH 
...core2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897390054  | ORPH 
...linX86core2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897390055  | ORPH 
...6core2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897390057  | ORPH 
...tlinX86core2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897390058  | ORPH 
...ore2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897390060  | ORPH 
...inX86core2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897390061  | ORPH 
...6i686GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897390062  | ORPH 
...tlinX86i686GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897390064  | ORPH 
...86i686MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897390065  | ORPH 
...otlinX86i686MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897390066  | ORPH 
...i686UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897390069  | ORPH 
...linX86i686UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897390072  | ORPH 
...lx60UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897390076  | ORPH 
...Xtensalx60UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897390078  | ORPH 
...ToolchainBuildrootMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389506  | ORPH 
...olchainBuildrootuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389509  | ORPH 
...xternalToolchainCCache | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389513  | ORPH 
...ernalToolchainCtngMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389518  | ORPH 
...rnalToolchainLinaroArm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389522  | ORPH 
...ToolchainSourceryArmv4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389528  | ORPH 
...ToolchainSourceryArmv5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389532  | ORPH 
...ToolchainSourceryArmv7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389534  | ORPH 
     TestFileCapabilities | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897388790  | ORPH 
               TestGdbArc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897388996  | ORPH 
        TestGdbFullTarget | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389000  | ORPH 
...GdbHostOnlyAllFeatures | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389004  | ORPH 
   TestGdbHostOnlyDefault | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389007  | ORPH 
        TestGdbserverOnly | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389008  | ORPH 
        TestGetDevelopers | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897390086  | ORPH 
     TestGlibcAllTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897388834  | ORPH 
...DefaultLimitedTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897388835  | ORPH 
              TestGlxinfo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389010  | ORPH 
               TestGnupg2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389012  | ORPH 
           TestGst1Python | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389015  | ORPH 
                TestHWLoc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389019  | ORPH 
              TestHighway | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389016  | ORPH 
        TestHostBmapTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897388974  | ORPH 
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389022  | ORPH 
      TestIso9660Grub2EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897388875  | ORPH 
 TestIso9660Grub2External | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897388876  | ORPH 
...0Grub2ExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897388877  | ORPH 
   TestIso9660Grub2Hybrid | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897388880  | ORPH 
 TestIso9660Grub2Internal | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897388882  | ORPH 
...so9660SyslinuxExternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897388884  | ORPH 
...slinuxExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897388886  | ORPH 
...so9660SyslinuxInternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897388888  | ORPH 
               TestLibJXL | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389027  | ORPH 
            TestLibshdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389030  | ORPH 
                  TestLua | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389036  | ORPH 
              TestLuaHttp | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389067  | ORPH 
           TestLuaInotify | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389073  | ORPH 
              TestLuaLPeg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389032  | ORPH 
          TestLuaLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389034  | ORPH 
         TestLuaLuaArgon2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389039  | ORPH 
         TestLuaLuaAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389042  | ORPH 
           TestLuaLuaCffi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389046  | ORPH 
        TestLuaLuaCqueues | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389047  | ORPH 
          TestLuaLuaExpat | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389095  | ORPH 
     TestLuaLuaFileSystem | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389097  | ORPH 
             TestLuaLuaGD | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389058  | ORPH 
           TestLuaLuaLdap | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389099  | ORPH 
          TestLuaLuaLyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389083  | ORPH 
          TestLuaLuaPosix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389107  | ORPH 
           TestLuaLuaSDL2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389087  | ORPH 
            TestLuaLuaSec | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389113  | ORPH 
         TestLuaLuaSocket | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389120  | ORPH 
           TestLuaLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389052  | ORPH 
           TestLuaLuaossl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389102  | ORPH 
         TestLuaLuasyslog | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389124  | ORPH 
           TestLuaLuazlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389093  | ORPH 
             TestLuaLunix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389078  | ORPH 
             TestLuaLzlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389133  | ORPH 
             TestLuaRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389467  | ORPH 
              TestLuaUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389091  | ORPH 
               TestLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389038  | ORPH 
           TestLuajitHttp | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389069  | ORPH 
        TestLuajitInotify | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389076  | ORPH 
           TestLuajitLPeg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389033  | ORPH 
       TestLuajitLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389035  | ORPH 
      TestLuajitLuaArgon2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389041  | ORPH 
      TestLuajitLuaAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389044  | ORPH 
     TestLuajitLuaCqueues | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389050  | ORPH 
       TestLuajitLuaExpat | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389096  | ORPH 
  TestLuajitLuaFileSystem | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389098  | ORPH 
          TestLuajitLuaGD | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389063  | ORPH 
        TestLuajitLuaLdap | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389101  | ORPH 
       TestLuajitLuaLyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389085  | ORPH 
       TestLuajitLuaPosix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389109  | ORPH 
        TestLuajitLuaSDL2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389089  | ORPH 
         TestLuajitLuaSec | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389117  | ORPH 
      TestLuajitLuaSocket | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389121  | ORPH 
        TestLuajitLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389054  | ORPH 
        TestLuajitLuaossl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389105  | ORPH 
      TestLuajitLuasyslog | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389125  | ORPH 
        TestLuajitLuazlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389094  | ORPH 
          TestLuajitLunix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389081  | ORPH 
          TestLuajitRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389468  | ORPH 
       TestLuajitTurbolua | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389482  | ORPH 
           TestLuajitUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389092  | ORPH 
                 TestLuvi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389127  | ORPH 
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389131  | ORPH 
               TestMender | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389136  | ORPH 
             TestMsrTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389138  | ORPH 
                 TestNcdu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389140  | ORPH 
              TestNetdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389142  | ORPH 
          TestNodeJSBasic | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389144  | ORPH 
         TestNodeJSModule | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389147  | ORPH 
               TestOctave | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389149  | ORPH 
                  TestOla | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389151  | ORPH 
              TestOpenJdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389152  | ORPH 
         TestOpenSshGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389154  | ORPH 
        TestOpenSshuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389155  | ORPH 
                 TestOpkg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389156  | ORPH 
             TestPerftest | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389157  | ORPH 
                 TestPerl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389158  | ORPH 
        TestPerlClassLoad | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389159  | ORPH 
         TestPerlDBDmysql | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389160  | ORPH 
     TestPerlEncodeDetect | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389161  | ORPH 
          TestPerlGDGraph | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389162  | ORPH 
       TestPerlHTMLParser | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389165  | ORPH 
TestPerlIOSocketMulticast | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389167  | ORPH 
      TestPerlIOSocketSSL | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389169  | ORPH 
 TestPerlLWPProtocolhttps | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389177  | ORPH 
         TestPerlMailDKIM | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389181  | ORPH 
              TestPerlX10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389186  | ORPH 
        TestPerlXMLLibXML | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389192  | ORPH 
       TestPerllibwwwperl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389173  | ORPH 
              TestPhpApcu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389199  | ORPH 
            TestPhpLuaLua | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389203  | ORPH 
         TestPhpLuaLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389204  | ORPH 
               TestPhpPam | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389206  | ORPH 
          TestPhpPeclDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389207  | ORPH 
                 TestPixz | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389209  | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389211  | ORPH 
        TestPolkitSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389215  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389217  | ORPH 
        TestProsodyLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389221  | ORPH 
              TestPyNdiff | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389422  | ORPH 
            TestPython3Py | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389223  | ORPH 
         TestPython3PyPyc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389229  | ORPH 
           TestPython3Pyc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389239  | ORPH 
         TestPythonAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389274  | ORPH 
           TestPythonAvro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389300  | ORPH 
       TestPythonPahoMQTT | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389413  | ORPH 
     TestPythonPy3Aexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389245  | ORPH 
        TestPythonPy3Argh | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389256  | ORPH 
       TestPythonPy3Attrs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389262  | ORPH 
    TestPythonPy3Autobahn | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389283  | ORPH 
     TestPythonPy3Automat | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389293  | ORPH 
   TestPythonPy3Bitstring | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389304  | ORPH 
       TestPythonPy3Boto3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389309  | ORPH 
    TestPythonPy3Botocore | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389313  | ORPH 
         TestPythonPy3Can | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389315  | ORPH 
        TestPythonPy3Cbor | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389320  | ORPH 
       TestPythonPy3Click | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389323  | ORPH 
   TestPythonPy3Colorzero | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389326  | ORPH 
  TestPythonPy3Constantly | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389331  | ORPH 
   TestPythonPy3Construct | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389335  | ORPH 
    TestPythonPy3Crossbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389340  | ORPH 
TestPythonPy3Cryptography | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389344  | ORPH 
    TestPythonPy3DBusFast | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389348  | ORPH 
    TestPythonPy3DBusNext | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389352  | ORPH 
  TestPythonPy3Dicttoxml2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389356  | ORPH 
      TestPythonPy3Distro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389359  | ORPH 
      TestPythonPy3Django | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389363  | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389366  | ORPH 
       TestPythonPy3Flask | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389370  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389373  | ORPH 
         TestPythonPy3Git | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389377  | ORPH 
      TestPythonPy3Gitdb2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389384  | ORPH 
       TestPythonPy3GnuPG | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389387  | ORPH 
     TestPythonPy3Gobject | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389392  | ORPH 
    TestPythonPy3Gpiozero | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389396  | ORPH 
        TestPythonPy3Hkdf | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389400  | ORPH 
 TestPythonPy3Incremental | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389403  | ORPH 
    TestPythonPy3Iptables | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389406  | ORPH 
    TestPythonPy3Jmespath | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389409  | ORPH 
    TestPythonPy3Libftdi1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389025  | ORPH 
...PythonPy3MagicWormhole | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389411  | ORPH 
       TestPythonPy3Munch | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389412  | ORPH 
     TestPythonPy3Passlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389414  | ORPH 
     TestPythonPy3Pexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389416  | ORPH 
      TestPythonPy3PyAlsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389417  | ORPH 
      TestPythonPy3Pynacl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389419  | ORPH 
      TestPythonPy3Pytest | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389425  | ORPH 
...PythonPy3PytestAsyncio | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389427  | ORPH 
      TestPythonPy3Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389429  | ORPH 
      TestPythonPy3Qrcode | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389433  | ORPH 
         TestPythonPy3RSA | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389438  | ORPH 
     TestPythonPy3RpiGpio | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389436  | ORPH 
  TestPythonPy3S3transfer | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389443  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389445  | ORPH 
...thonPy3ServiceIdentity | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389448  | ORPH 
      TestPythonPy3Smmap2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389450  | ORPH 
      TestPythonPy3Spake2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389453  | ORPH 
        TestPythonPy3Treq | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389455  | ORPH 
     TestPythonPy3Twisted | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389458  | ORPH 
       TestPythonPy3Txaio | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389460  | ORPH 
    TestPythonPy3Txtorcon | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389461  | ORPH 
      TestPythonPy3Ubjson | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389462  | ORPH 
...y3UnitTestXmlReporting | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389463  | ORPH 
       TestPythonPy3rtoml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389441  | ORPH 
         TestPythonPybind | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389418  | ORPH 
             TestRdmaCore | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389464  | ORPH 
                TestRedis | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389465  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389471  | ORPH 
              TestRustBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389473  | ORPH 
                   TestS6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389474  | ORPH 
         TestS6Networking | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389475  | ORPH 
      TestS6PortableUtils | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389476  | ORPH 
                 TestS6Rc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389478  | ORPH 
 TestSquashfsMinBlocksize | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897388906  | ORPH 
                 TestSudo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389479  | ORPH 
             TestSyslogNg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389480  | ORPH 
                 TestTmux | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389481  | ORPH 
                  TestUbi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897388909  | ORPH 
TestUbootOpensslPkgConfig | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389484  | ORPH 
                   TestZ3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389486  | ORPH 
             TestZerofree | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389488  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389489  | ORPH 
              TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389491  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3897389493  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
