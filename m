Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D7EC64EC7
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 07:37:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 357474181F;
	Tue, 28 Feb 2023 07:37:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 357474181F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EOfCb0Ixsnoe; Tue, 28 Feb 2023 07:37:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B0C841824;
	Tue, 28 Feb 2023 07:37:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B0C841824
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BE1D71BF3DC
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 07:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CD9741824
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 07:37:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CD9741824
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id szVXnzLc8O5q for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 07:37:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73A134181F
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 73A134181F
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 07:37:01 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4038B2000A
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 07:36:58 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 28 Feb 2023 07:36:58 -0000
Message-Id: <20230228073704.9CD9741824@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1677569818; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kiaxjs5Cgomu7t9ZV8TDXjrx65gWJuA+fJqBHaOdubU=;
 b=IxCl43JrCI00snpp38p9rxX1NoH2rnrBNWY/XpXvWZSpl9WqjpHxCnaQL7WieI+wUlymQl
 RcELdZfwKAANEVB5AdMtEedkicIC89ncLQltXfrVJrA8wnM3ZytqHdJ6tE/KDznMR+DzSn
 07iJffRmoHoKbSUu+2CHkc6TPMOpxwDaEkKwkl4rTnHd2JhZJ0nwX7/nX+jSDAJrBy7Uo+
 I8a9HBUc/eZhLC5MrvKsCGnrXwxGV9k4nb4YmLw9CSEwOu+i1iOpyzLnZ0+J1w7Bbmiuo/
 I+3DVj4aPS7BQnQYsHDYtR7Ir/ne1xURA9YZX3jsedFInCuQ4cKz3zgxT58nyw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IxCl43Jr
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-02-27
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

Autobuild statistics for 2023-02-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.11.x  | 10  |  9  |  0  | 19  |
    master   | 140 | 126 |  1  | 267 |
     next    | 12  | 17  |  0  | 29  |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.72.0 | 11
            host-binutils-2.38 | 9 
                host-go-1.19.6 | 8 
glibc-2.36-81-g4f4d7a13edfd... | 7 
                  linux-6.1.11 | 5 
host-gdb-arc-2020.09-releas... | 4 
               libglib2-2.72.3 | 4 
                busybox-1.36.0 | 3 
                gerbera-1.10.0 | 3 
              host-rust-1.67.0 | 3 
                speechd-0.11.4 | 3 
                       unknown | 3 
                    brltty-6.5 | 2 
         host-gcc-final-11.3.0 | 2 
              host-pahole-1.24 | 2 
            ocf-linux-20171122 | 2 
                     php-8.2.3 | 2 
                xenomai-3.0.10 | 2 
                  assimp-5.2.5 | 1 
                    bat-0.19.0 | 1 
                  boost-1.80.0 | 1 
                  check-0.15.2 | 1 
             dahdi-linux-3.2.0 | 1 
               ding-libs-0.6.2 | 1 
                    dust-0.8.1 | 1 
                elfutils-0.186 | 1 
       freeradius-client-1.1.7 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /tm... | 1 
fs/romfs/romfs.mk:32: /home... | 1 
fs/ubi/ubi.mk:51: /tmp/inst... | 1 
fs/ubi/ubi.mk:51: /tmp/inst... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                     gmp-6.2.1 | 1 
         gobject-introspection | 1 
            host-binutils-2.39 | 1 
                  janet-1.26.0 | 1 
jq-a17dd3248a666d01be75f6b1... | 1 
               libcap-ng-0.8.3 | 1 
           libfreeimage-3.18.0 | 1 
                libglvnd-1.4.0 | 1 
             libgpg-error-1.46 | 1 
        liblog4c-localtime-1.0 | 1 
                librsvg-2.50.7 | 1 
               libsigsegv-2.14 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
               mariadb-10.3.36 | 1 
            micropython-1.19.1 | 1 
       network-manager-1.40.10 | 1 
                nodejs-16.18.1 | 1 
                    olsr-0.9.8 | 1 
package/multipath-tools/mul... | 1 
                     pv-1.6.20 | 1 
           python-pyicu-2.10.2 | 1 
            quickjs-2021-03-27 | 1 
                 rtl_433-22.11 | 1 
                    rtty-8.1.0 | 1 
                    sdl-1.2.15 | 1 
               valgrind-3.19.0 | 1 
                 wolfssl-5.5.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/0b31c2ea3146bbe4f920f2de6ff1b583de0def62 | ORPH
   armeb     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/303a52e057dcca8afbbadc5a0aaa56b3f5ab5aaf |     
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/5ed6380225146076acdea63b7b91fd02bee729dc |     
    or1k     |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/7d3bffd18470d35d960260d31cbf4005da216228 |     
microblazeel |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/0c4ec33fe58fc251193d7eb71ffe53104de552fb |     
  mips64el   |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/504b7ea0dac9d031d638bd42340456325d6e9bc2 | ORPH
   mips64    |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/653640c27cc188020d2c1c298920cbaeadf03f92 | ORPH
   mips64    |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/f1919fa68fa571cf28a43929644c6932448fc1af | ORPH
  riscv32    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/a20472e7959611da4699bdf7b9188e12c5b17c42 | ORPH
    mips     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/45b76a2ee84a3b8efa640bc4ac3c0d8044a18e0a |     
   arceb     |        ding-libs-0.6.2         | NOK | http://autobuild.buildroot.net/results/f9eb3616c84e618e96a3ea37afce041cf7f81e04 |     
   mipsel    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/25d97014b4b135e03262db3aa6ec786450c7cbbe | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/92af2d956385b58442e0596ef32ad3eea83b3d1d | ORPH
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/318e281c6d51186b68de60396c80ae3331ca1547 |     
    sh4      | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/3a6742d4a13aaf126cc7fd9bbebff0b1b6ec47ab |     
  sparc64    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/3f85fe0e8b7d68ca1b5d4bf406daec63075c2862 |     
 aarch64_be  | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/dd0b73d20d7ee8dffa2a57c1fe84e9afac18e411 |     
   x86_64    | fs/cramfs/cramfs.mk:46: /tm... | NOK | http://autobuild.buildroot.net/results/f025d59d68fd3e7800125557c69b06fa5c85a72d |     
   mips64    | fs/romfs/romfs.mk:32: /home... | NOK | http://autobuild.buildroot.net/results/cd91373053f44842624113da575a4957695c6c16 |     
   x86_64    | fs/ubi/ubi.mk:51: /tmp/inst... | NOK | http://autobuild.buildroot.net/results/51b670ecdeeb9da060e078e52f917e75111c442f |     
   mipsel    | fs/ubi/ubi.mk:51: /tmp/inst... | NOK | http://autobuild.buildroot.net/results/24db2b3cef191980ead66afc33d7e0db18a77ff8 |     
    arc      | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/412e156fc90bfcd5ced425a471d54f1cdcce2294 |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/766c2785b1ea9257bd032903fc2a356ff91657f7 |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/2a579c74e3320f28ef9754eccdaac82e10e677e5 |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/fcf5ef5f6dcf8ac42be9b7eaa29a3ced8009d01d |     
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/c959ade5661aa9bd4f2871689259e31156a4a2fa |     
   arceb     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/61873d2cd37b847bbfd379ea2c7cf4c0e0a983f4 |     
 microblaze  | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/74f7668f770f00fda03d73ef796d04cc6a3004a4 |     
 microblaze  | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/a7388f3cbe4a3da8f0e946240f7f020230874c5f |     
   nios2     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/800537a1ef5f48d24c20aad7a9c96c56dfdc77f5 |     
microblazeel |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/5d1a9420174669758f121ce65d82e1cdaadab32d |     
   x86_64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/61b8ee4f12ccd9a8de3e10a186914654f23ce263 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/1aa55feb9084ae7a06a46186b52b8aad1d1550ae |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/5b1fe0affa022ab63360ca21e62899b1c1ab1d6e |     
    arc      | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/8ff20e3924e7a74bd7eec7b148723d41f4df378f |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/3e3ad96fc41f3cdf61fd3f49355be72f5364d564 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/dfd4a36489ceb2308d938fa5ab9494b2410c3d1d |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/e7991c5f723b3eb38492f76d95abfe6bc0a2a8fd |     
   arceb     | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/45b06d3f503fbb4a79085fe0d75f88e72fb28980 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/d90a301050bd3a2e41a9d0358fbb672b102da2a9 | ORPH
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/a0cb43d96adc2295f01c99a6d2664b4fd2c75d7e |     
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/55eca1317844bf086456fd4433568131a08f6648 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/d05e127654650383a257632c355bdb2c3153a43b | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/21676a787feb7615da7551d405ce21941e4c683b | ORPH
    i686     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/9f4056e998915526e7e672c41fca79c88ed5284d | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/6ed048bab1b7458351a9dab5718360548c197a9b | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/3dbcbe663e3749df3de7a79c0d6d861d98d85f60 | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/01534f2702f13e461228e16d49b117755b36e01d | ORPH
 microblaze  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/79e44d02448c9972a0da5d67c5e44c46b742544e | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/662828c78252a08a439f49094b3864d69a72840b | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/1b504d9e59b198d162c1d68f5d69903d15dd0b50 | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/8317a20de677ced230746fc3dd9b2c59e0e6e0a0 | ORPH
  riscv64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/98b0354f79bda17963b8d34f0bee943997a9c6fc |     
microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f5baf343f35647fe0f3538424b80c1112ada888b |     
    mips     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/2eaa4d369f2fadfced04e0e64fb9a9fa9cfdc61c |     
  riscv32    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/d38528872616095fc3711a00beb32b2240b54cb3 |     
microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ece3252739724b2b5194fe4d7177dabe82e7c685 |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e272b8c04b690e7b6cbefa8e544e6c04be6ad7c9 |     
    m68k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/0ad6925c7e9d04c20bb5bf30dd1dcdb2d414b4ca |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/6ba2be938f0328f55b7881422befc18e5a6bcf5c |     
microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/af5626937b105c38bb98351083cf87694da94462 |     
    or1k     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/4adf05014c19f778cae85e788c3650f7e3114125 |     
microblazeel |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/a8b14ab09aa89b2685f4ce9276b366707e10df75 |     
 microblaze  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/8af90ef250cefb841ba7e01a2fd1d528cf01303e |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/002f6984edfb5ec29e6ef335fe8c38c9dfb324c5 | ORPH
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/1d4ae1ae6cb8fc0acd1aced5c4b604f1302564d1 | ORPH
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/7af065d52405646b8d2c748ca6a0ced7683bc726 | ORPH
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/fe03bdfa2ace6d707ad5d1071fae144d67fd073a | ORPH
    i686     |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/d85a6eeb3ca789707c0d932adaffb744f8bc1367 |     
  mips64el   |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/a54726c45255f82a97ffc77c7050f0119c4852db |     
  mips64el   |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/71fa137ecb92d4700e575594d5b6d4e5bb84d0b0 |     
    i686     |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/5d42c30dab698991fb4630e4cea23bbac73b8bde |     
   mips64    |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/6df838997647751b0aabdb9a7a8053b20b399932 |     
  mips64el   |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/0c04360fd7738d72010f75ce3d06dc20f49cda89 |     
  riscv64    |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/1eb5d8baf1315b8ed69db9d4fb304c5e6fdf3e73 |     
  aarch64    |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/62e559c3460318f5145f9cc479d75a3d128c1192 |     
   x86_64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/f42dbded483737dea00ba7befa5c0bc6a6a19368 |     
    i686     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/63f72cb4e81fe02dd35371796e611086a44a2735 |     
  sparc64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/4727cfc9f17c66171950e8667ee7ab64f8c0dceb |     
   x86_64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/f98f5ff1d568b9adaffd88597162bd240268fb48 |     
   x86_64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/46d5dc7ec4824e9b00c1b65c5db24a38a90c026c |     
    m68k     |          janet-1.26.0          | NOK | http://autobuild.buildroot.net/results/f8ffb30f68847ed022fb457aae791d44787d663f |     
    arc      | jq-a17dd3248a666d01be75f6b1... | NOK | http://autobuild.buildroot.net/results/723adb73385154f3581fa50fc3e0fa1b0884769b |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/a295eae916cf7b372215b56d9bd7b6d1d2a63d86 |     
 microblaze  |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/1a4f3b8c9ca09442d961469d84e79818237f2b94 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/0b68ad01c772e766cafac08e79c78f4f95fd9817 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/9c91808550eedc49b87bd38c407bab37f1e574a4 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/d383d4de3fc2b2b7ec297c57f0afce430a5dec1a |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/9c07c36d20f9cc21f080d6b84ffbe6bb3e2256d8 |     
   xtensa    |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/8ca4ffd1c7d53fc93878d99f8769ac65f9c1740d | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/997b56b898791b4cb2775204292c5681a85ec938 | ORPH
  riscv64    |     liblog4c-localtime-1.0     | NOK | http://autobuild.buildroot.net/results/f1f3a364f32d763e3cb15cc83ac6209c8738837a |     
    arm      |         librsvg-2.50.7         | NOK | http://autobuild.buildroot.net/results/526e6f737a4800fe1e89ff41a898956915c8569a |     
  powerpc    |        libsigsegv-2.14         | NOK | http://autobuild.buildroot.net/results/7810ac09e0294713b06a76f885c4c72b17100683 |     
    sh4a     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/829b940836dde1d44ae6c9ee22b255c05ef7d47a | ORPH
   nios2     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/700e3c152309fa7012faa072e1accc44f94116f1 | ORPH
   sh4aeb    |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/13ad9549335cfc8f33cee1687439dde766c4e947 | ORPH
   sh4aeb    |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/877178f84d52a8d3a42f1d0dd83cf7e005b2a9bf | ORPH
   mips64    |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/78d071d6fe74c73053e49f405b94972abef5ce11 | ORPH
   mips64    |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/7fd4b000759872f87dfafb958a2678f25e2e0448 | ORPH
   mipsel    |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/62eccbb3075b71423816e19eb5d3d862253eec03 | ORPH
   sparc     |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/189b534f704fdcaa7862f2d6da2f1473d2ff6612 | ORPH
  aarch64    |       micropython-1.19.1       | NOK | http://autobuild.buildroot.net/results/51c20df596b29d85914e867f5887fa5f129c89fd |     
  sparc64    |    network-manager-1.40.10     | NOK | http://autobuild.buildroot.net/results/fdbf3577392812313605b5789edc608794591bc4 | ORPH
   x86_64    |         nodejs-16.18.1         | NOK | http://autobuild.buildroot.net/results/07ff63bd149bd82a0bd1a4d0bb0d303c57c9f6f0 |     
    i686     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/ab7388d1ccc31494927ca8b97bc3f8b2c1187909 | ORPH
microblazeel |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/8e1bca2aacf2729c524abbb1ce795dbd71c5943c | ORPH
 powerpc64   |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/9b5d238c8e16f870fd39cdc97d1da025285fa352 | ORPH
   s390x     | package/multipath-tools/mul... | NOK | http://autobuild.buildroot.net/results/07855dab478627179adf0db01251445987b3e0ed |     
    or1k     |           php-8.2.3            | NOK | http://autobuild.buildroot.net/results/849c0dad1dba4ca681e97d8b971b5691a7cde784 |     
 microblaze  |           php-8.2.3            | NOK | http://autobuild.buildroot.net/results/87116d89f464003c24c5513ae76cb15888e3999e |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/496994c1dd23b57df9fd6ddb5aa1de582705473d | ORPH
   nios2     |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/7fdff57a34a298524d2b4953c8b167cd37c1944c |     
    sh4      |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/2d0e9bb746ecb3c0c3c1ba4878c98bfc4df5caca |     
   mips64    |         rtl_433-22.11          | NOK | http://autobuild.buildroot.net/results/870543fe722313ffe111723593405a77eef5aad9 |     
    arc      |           rtty-8.1.0           | NOK | http://autobuild.buildroot.net/results/d57d39d97fd83e9fe5a5936d5e8466bbbcf8600b |     
    sh4      |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/85a85d4af3d102a26783b24abf163bb3cffe9391 | ORPH
  sparc64    |         speechd-0.11.4         | NOK | http://autobuild.buildroot.net/results/40202c8aeaf4a5e288dd775f9fce1b24bdc49bb6 |     
  sparc64    |         speechd-0.11.4         | NOK | http://autobuild.buildroot.net/results/aa0579e226dfc03825c65c3f5c0ba0c10f770150 |     
 aarch64_be  |         speechd-0.11.4         | NOK | http://autobuild.buildroot.net/results/3778e4313e24a6178bc14d64989afc62f3fb4873 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/19ec82de7dd5d9beb5bff9a4940eac0f492a530c |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/597365593180b0d54912f9e378deaf463c181791 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/7882d4dea44338752ae8b662c0fd5b8d23a20977 |     
  mips64el   |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/ddec98cc29362ef24d1f8ca5ae423f34e98c00aa | ORPH
    mips     |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/bfdf24da8cf308594ace32ab7476dad993142ac8 |     
    i686     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/ee7d25b225faf85c27f92cd4191a0c5bc5644efc |     
microblazeel |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/e8863c2d4e6ce66ce18e44d4d05ccc5650fb99e6 |     


Classification of failures by reason for next
---------------------------------------------

                       unknown | 5 
              host-rust-1.67.1 | 2 
             flare-engine-1.14 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
            host-binutils-2.39 | 1 
              host-pahole-1.24 | 1 
           python-numpy-1.23.5 | 1 
            quickjs-2021-03-27 | 1 
                    sdl-1.2.15 | 1 
             uccp420wlan-6.9.1 | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
               xfsprogs-5.14.2 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |       flare-engine-1.14        | NOK | http://autobuild.buildroot.net/results/2b9bb464fec978742039c3d39a1b28a407cc4899 |     
   arceb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/675c89e453080b12d8f21de69328388cd92829d5 |     
   mips64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/e900eb185ea8bd4da3ede894c307f2a4283296c4 |     
    mips     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/ca35da5847f83496ee1822d54d879952275870d2 |     
   armeb     |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/03855d38f05bf7db4fb4ee4a15419ecdb3ed844c |     
powerpc64le  |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/b7f2e18fc0d38963bb2370e031ecbb1a127c2abb |     
   mipsel    |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/08570937efb670d6e07d8fb3041d12a8a500e83d |     
    sh4      |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/6d5a75eba935645c3583eed984ae11509a93ae4f |     
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/1e4a65f104f753323ec866cdc71f76201507f7d0 | ORPH
powerpc64le  |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/c7b0770de372320993b1c0904d3cc09c5999b827 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/8cd8ef2f8c3a1e0c0043796ba86a87ccf075a9c8 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/4605b1715abf2631dd16b33fe559601c01dcc0f7 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/15b1f1a265670171d3c43637d3301b99569b56dd |     
    sh4a     |            unknown             | NOK | http://autobuild.buildroot.net/results/c416118f7e31a00f9be7d37bc5d130f88d2df9b9 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/e4025ce4a1649cf22ec52304aac4f5aa41963c5b |     
   mipsel    | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/0783e6cdccf42974aacba7ca8af8cff08415e6b9 | ORPH
   nios2     |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/fc9fd74d1316691542f88db0b4c5f0d6ccbad332 | ORPH


Classification of failures by reason for 2022.11.x
--------------------------------------------------

               libglib2-2.72.3 | 3 
            cppcms-2.0.0-beta2 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
  gobject-introspection-1.72.0 | 1 
                host-go-1.19.5 | 1 
              host-pahole-1.24 | 1 
                python3-3.10.8 | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |       cppcms-2.0.0-beta2       | NOK | http://autobuild.buildroot.net/results/9f172c94e40f8589f35d6ed3cfc6904d70029533 | ORPH
   sh4eb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/79c29bc148bf0f5230cc1588523d8a101f08ecc5 |     
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/0df44b17065fe16401596b00a6a41bd86cdde9bb | ORPH
  mips64el   |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/f2369ddf4f5ca88deda282f617993101da3affc4 |     
   xtensa    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/b7b5b9664385738676164afd686e294bd1ec06ca |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/6e5a41de985484468b9b0c7393f1d43eb520a6d7 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/308376d18371c3ac240bff588268f78d9286eeb5 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/f7fc989bd14d17808524f71a2d226eef469ad43b |     
   x86_64    |         python3-3.10.8         | NOK | http://autobuild.buildroot.net/results/4c1ae2654aaae264457264c2491aeedf331b5ae8 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
