Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0521AC678D4
	for <buildroot@archiver.kernel.org>; Fri,  3 Mar 2023 07:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09034419A8;
	Fri,  3 Mar 2023 07:36:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09034419A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OLD1ucmEuSUP; Fri,  3 Mar 2023 07:36:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79B68419B6;
	Fri,  3 Mar 2023 07:36:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79B68419B6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0C7FA1BF3FC
 for <buildroot@lists.busybox.net>; Fri,  3 Mar 2023 07:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9775820EF
 for <buildroot@lists.busybox.net>; Fri,  3 Mar 2023 07:36:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9775820EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VQSLUyLLlv7B for <buildroot@lists.busybox.net>;
 Fri,  3 Mar 2023 07:36:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3095E820EC
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3095E820EC
 for <buildroot@buildroot.org>; Fri,  3 Mar 2023 07:36:41 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5010BE000F
 for <buildroot@buildroot.org>; Fri,  3 Mar 2023 07:36:39 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 03 Mar 2023 07:36:39 -0000
Message-Id: <20230303073645.D9775820EF@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1677828999; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xCCLkwXmTGZI5BY0JPv6+hOkQneDdg7ZcUJ/m/Xrf1M=;
 b=SKNEwHtxuL+IIFr5UD/uWMA1ISiRwdlKPP7YvpO3ayQCQi99VLa1FVam1VcH1S1gdyOqqX
 AFrqFz19u+mTs7BTb2b/LJigbDq+Uc6CjL1eQYScMCmo9iSWx0u8Mf1PUmin+t84dkPJjN
 aHIbwCRi5TVZjK4npGZXVLrFE/kL+HzsaHfJa+OcqfKd1ewCpSex0VcqgY8gf2IKzhkrhC
 H/m03yQkC2q538wN1J7MY0ilWSzyscH0Y1HfgU90/I9qSQLiv8pSDHHSDEdwxvQXlsc7Ct
 swFI30za2+kgfd2czNuerhxI7338ipU5wD0olgsKKzzlQAPPI103N+gmbFTlZw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SKNEwHtx
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-03-02
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

Autobuild statistics for 2023-03-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.11.x  |  7  | 18  |  1  | 26  |
    master   | 149 | 119 |  1  | 269 |
     next    | 16  | 23  |  1  | 40  |

Classification of failures by reason for master
-----------------------------------------------

                  linux-6.1.14 | 8 
                elfutils-0.186 | 7 
  gobject-introspection-1.72.0 | 6 
                host-go-1.19.6 | 6 
            host-binutils-2.38 | 4 
              host-pahole-1.24 | 4 
                       unknown | 4 
                 fwts-22.09.00 | 3 
                    olsr-0.9.8 | 3 
package/multipath-tools/mul... | 3 
                   perl-5.36.0 | 3 
             fontconfig-2.13.1 | 2 
glibc-2.36-81-g4f4d7a13edfd... | 2 
              host-rust-1.67.0 | 2 
        ltp-testsuite-20220930 | 2 
ulog-0389d243352255f6182326... | 2 
                     ace-7.0.6 | 1 
                  boost-1.80.0 | 1 
                bpftool-v7.1.0 | 1 
                busybox-1.36.0 | 1 
                  check-0.15.2 | 1 
                dbus-cxx-2.3.1 | 1 
        edk2-edk2-stable202208 | 1 
                 fdk-aac-2.0.2 | 1 
                  ffmpeg-4.4.3 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                    gdal-3.5.2 | 1 
                gerbera-1.10.0 | 1 
         gobject-introspection | 1 
google-breakpad-c85eb4a59b6... | 1 
                 haproxy-2.6.9 | 1 
            host-binutils-2.37 | 1 
            host-binutils-2.39 | 1 
         host-gcc-final-11.3.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
     host-moby-buildkit-0.11.2 | 1 
                  janet-1.26.0 | 1 
              jpeg-turbo-2.1.4 | 1 
           libfreeimage-3.18.0 | 1 
               libglib2-2.72.3 | 1 
                libglvnd-1.4.0 | 1 
                libmad-0.15.1b | 1 
                  libnfc-1.8.0 | 1 
                   libnl-3.7.0 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                    mpir-3.0.0 | 1 
                    musl-1.2.3 | 1 
             netsniff-ng-0.6.8 | 1 
       network-manager-1.40.10 | 1 
                  nginx-1.22.1 | 1 
            ocf-linux-20171122 | 1 
                    opus-1.3.1 | 1 
                     php-8.2.3 | 1 
                protobuf-21.12 | 1 
                    putty-0.76 | 1 
           python-bcrypt-4.0.1 | 1 
            quickjs-2021-03-27 | 1 
rtl8189es-e58bd86c9d9408c64... | 1 
                    sdl-1.2.15 | 1 
                 uclibc-1.0.42 | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
                    volk-2.5.2 | 1 
                 wolfssl-5.5.3 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/b922619c90fe46daf815f0c0c947a6c4e56eac1e | ORPH
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/f7f16d49764cde4493b4f4ec47311991dd5d9768 |     
   s390x     |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.net/results/17bbe326d37d59d6a9429adfc06fb2ece68a7df6 |     
    arm      |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/874974cb54be21bf3197781afaad22a06c53693d | ORPH
    or1k     |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/9f2a4ba006c2a36a4b342544079a944575a533da | ORPH
    or1k     |         dbus-cxx-2.3.1         | NOK | http://autobuild.buildroot.net/results/a9eec11338c4bc31a95f0a7a68a70bdbd3662a74 |     
  aarch64    |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/8ef67917f699371b654659106f3cd7dd930cbdde |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/2d513161a543318607b737f91e0b5ccfb29f0303 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/be1992ea9095bfe5df8f4877cecc479732e01d66 | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/ebb8dcd7da772ebee660e46a8e9ec0efb34f4828 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/2b8dba8365e2b7902193aa992b9d8a65ede6bd2e | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/bf31adbffabf13bb712548dffaa3eae81b559bb2 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/4778661c983d9fedecb78c7d56d9e2090bf6c857 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/7b8f8e53b54fc9bb7140f53b735bfa0178048210 | ORPH
    mips     |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/4f7234ffa54373788610cf21aa139b5b0caa90d5 |     
   mipsel    |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/510dd9fd1397ab2bc9409c734c4a690fc0c729c5 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/de031d6de22cee109c31b3ec00e310b16e3645a2 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/b5dd8eba58c4434fb364f7898717c07d9f42a1cd | ORPH
   sparc     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/3a633a4ed7651a4ed056d97294efa88fa18ae341 |     
    arc      | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/1bf70169dea63d2849951ed3b408bb0fbd52f79c |     
microblazeel | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/0b5d0d50d0b627a48be756a9d5e9d013d3e4a14f |     
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/df154a18d7a325b4fa86d231638c9192d0391e7c |     
   sh4eb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/c5717792c7f67ce9e3bb581cc149717d2e63e673 |     
  mips64el   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/8d67a626f860b98038dea55f225b27128c1e892a |     
  mips64el   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/2a427ae1441061ada12902ab11aa12eed2c3e6c5 |     
   nios2     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/71798b2d354d410593a06dcbdf9c9a28dd7cb792 |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/95f77bcc6dd773d13f3a37fb7181c4f0b23bee63 |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/c2c21560f29055400e6f00a5bff9f25eff7d3f3a |     
  powerpc    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/e7b45408a8c611b2f797137eb7e6446fa51fa646 |     
   x86_64    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/2978659d9a50890bd705aef130bef486f40d42e7 |     
  aarch64    |         fwts-22.09.00          | NOK | http://autobuild.buildroot.net/results/8212d37666baf7d5655f83fce837bc62d89683d7 |     
   x86_64    |         fwts-22.09.00          | NOK | http://autobuild.buildroot.net/results/bc19117f71f6e2939807e7bebcbd6906bdbcf632 |     
    arm      |         fwts-22.09.00          | NOK | http://autobuild.buildroot.net/results/3389fdf74b7008c21306affd91fdd23576a8634f |     
    sh4      |           gdal-3.5.2           | NOK | http://autobuild.buildroot.net/results/73210786b5753f26be716254d1fd90fd2eb0d66a |     
    mips     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/bc5d2c081112aa1e7d068c3e84e0d685915b1f70 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/6bbdce880b7ab01b059019cb159fd929a4254cf8 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/6bdea7e111b41b257a8a01442f2a6873ee694cfe |     
   armeb     |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/0ccabe0f72a0785db55db4e4cf3864a8b4808c03 |     
 powerpc64   |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/1bd327f9ff2a182ed19cd60c7da9f179923e9daa | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/fbd4ea3e5ee8115f86032f276ff0e5421d406b4d | ORPH
microblazeel |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/098d7e2c795ba8d1e57f54c8ba92d6e6e11d4360 | ORPH
   mipsel    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/4ee6221bdd022c3ec93bbeb190ee38516ac0d1ff | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/8d3c6f9f5332504726c36e7d9e11a645f590e42d | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/e13c1d6cfce4d5135ddef7838183cd9981a16613 | ORPH
    mips     | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/f96db02eb947db14c549da488b62cecb6a0d64bc |     
 aarch64_be  |         haproxy-2.6.9          | NOK | http://autobuild.buildroot.net/results/5dded2a6401e0d9347dffe3b1523b7333c9a82bd |     
   mips64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/b0cbfd813df4d016387a5cdac60dd46d90708aa7 |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/c1fa4870ee391068e8c757291fefe909f6cce61f |     
    i686     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e3294913da88c7b962a447fc469f30b52f0e5302 |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f74fddf9b0ed8b6801f9a1f05a9fe59ba99accf6 |     
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/8b932b7c33fa7c65ef14e5d65b8045f51dba70c6 |     
   x86_64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/7887a3bb40331ae30e6460e9b7addde2c5d571eb |     
 microblaze  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/b72664e889b827cdf233ae221788c210e39776bb |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/6c40bedf49d8301605df1f5a6a240e1d640ce617 | ORPH
    sh4a     |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/469817cc5ee37ffc7ffa5ec7b508c3fb0ea6d75c |     
   mips64    |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/74b36dd8c0139b239c430eec451a92867f7fad8f |     
  mips64el   |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/f12347f92173d50dad1d12398123fffc9838a3ce |     
powerpc64le  |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/085a12d33540f6106f38e130386e7054be2e436b |     
  aarch64    |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/73811d1d472b6c109f4e13b777211b1793704071 |     
powerpc64le  |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/1c7a2947819d2a6509666cc79215f70cd3f4fc92 |     
   x86_64    |   host-moby-buildkit-0.11.2    | NOK | http://autobuild.buildroot.net/results/6a8f57de92a587b0c654523153a9f489ffcb245d |     
   sparc     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/0fdc5ab3301b3b35a9b1a9bed503b640dca35039 |     
    arm      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/9d38f59b3e95e7e139b54ae0ae9f0f956e3d773c |     
    or1k     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/cb9d1b8c5ed213d0fa49dbd1d10c78635b26320c |     
 powerpc64   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/68bf97990126d89b17868d1806f7abd93ed86668 |     
   x86_64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/d4d9e76c023d17fb10d14046fe275b46dad270a0 |     
   x86_64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/fe5f96d1b140cf9384f7dc95dcd6bda5161e63fb |     
   armeb     |          janet-1.26.0          | NOK | http://autobuild.buildroot.net/results/c42be523f9d19caec9fb34833eff1ad9788dd836 |     
    or1k     |        jpeg-turbo-2.1.4        | NOK | http://autobuild.buildroot.net/results/6a508b41f11be5be9e4402f641ea15ee2aba94e3 |     
   x86_64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/c0cc2336b00db4dde2e71c4727b46d0aee1fa092 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/524749014f02aaab226d5dbb7d93e03d579771ba |     
microblazeel |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/3ec4cac711750f03dda25bc356de4362a1fabdc0 | ORPH
   armeb     |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/889d95fe8a00bd3a563e124b5025263c8b9b4160 | ORPH
    or1k     |          libnfc-1.8.0          | NOK | http://autobuild.buildroot.net/results/a777446d4f190e5b8d4db406109c3e5f41408932 |     
  mips64el   |          libnl-3.7.0           | NOK | http://autobuild.buildroot.net/results/d78aca3c9002c86403f969624931dcb5cb274331 | ORPH
powerpc64le  |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/e07a60a1abd993e245132641fbb617eec1fddc86 | ORPH
  mips64el   |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/a28dd61ab277d924314cd0dd44ea6b9dad591bfa | ORPH
  mips64el   |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/3d98d8e5db4ec0ffb4476ba31ec642e8c54efe1a | ORPH
    or1k     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/94f3deddaeb66548232c7bd7fabd6745ffc6d0b5 | ORPH
microblazeel |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/c1b96603acd41c750c7d44d9871ec38f940e5853 | ORPH
    m68k     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/c12deeda04db565cb19a5eb1ba4726bbe454c733 | ORPH
    or1k     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/55381cfcc52ae0414a306158a7b3bcadb03bf01b | ORPH
   xtensa    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/b646d4e17d8b412e685031b65b4aed50553e9f5b | ORPH
 powerpc64   |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/977cc12d844e6eaed7fbcc42fb96b0ae9760b8ee | ORPH
   s390x     |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/73966294cb1feb1c546cbb62ced13cddbeccafd7 |     
 powerpc64   |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/4e928772f0d4948b9adfac3c12ff744c0e4eb16b |     
   armeb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/faad539a603f64059ee08df03c0022a7b7d4957d |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/b5b4a1bab9e86c53a9196f64f0bec1485ada5542 |     
  mips64el   |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/4e50718cc62f60ca4c86b0a8ef5180aba9d70585 |     
    or1k     |    network-manager-1.40.10     | NOK | http://autobuild.buildroot.net/results/c0ef52422fcfef409764d954d9e090d45c68e8ff | ORPH
   sh4eb     |          nginx-1.22.1          | NOK | http://autobuild.buildroot.net/results/e37939a67a7aebbaaae81fac0e48a9e2432ab0b7 |     
   s390x     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/99c454c869d9fd691b77dc8e2f41a17934007eb9 | ORPH
    i686     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/249d6071a6cc0e2831b1b3194ab57196c992cedf | ORPH
   s390x     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/779916a168943a44ad1768cabd317107ca7d5fa5 | ORPH
   sparc     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/0538554b61801bdbc19761333c8b1f45a32ad5e6 | ORPH
    arm      |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/fdedcc8f68651ec34417d609b40effbac456c80d | ORPH
    arm      | package/multipath-tools/mul... | NOK | http://autobuild.buildroot.net/results/da8175b93260df60cfca5a43c41c9fa1c1bd8e6d |     
  powerpc    | package/multipath-tools/mul... | NOK | http://autobuild.buildroot.net/results/2f94bf4f19c1e6eb8749ef96696510af2c78a87b |     
   s390x     | package/multipath-tools/mul... | NOK | http://autobuild.buildroot.net/results/39bcccdfbd1e4f23c8c5b59a5bce0dde4ce895d1 |     
    i686     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/790b476991d8b4a89a9682c42705de7085363720 |     
    m68k     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/679b691f93e526953d78d68cee17207b0985b200 |     
  mips64el   |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/3bdd2f31491eaaea24c9aebf470ebc748b96d13c |     
microblazeel |           php-8.2.3            | NOK | http://autobuild.buildroot.net/results/6b236789081a477ea6e8895c590dd3df1607af2a |     
   arceb     |         protobuf-21.12         | NOK | http://autobuild.buildroot.net/results/aa07c0b88448b1ac6221747052772d5f2faa2a23 |     
  aarch64    |           putty-0.76           | NOK | http://autobuild.buildroot.net/results/fde51608f868ed628867be4213f9e22f54ad81ba |     
   armeb     |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/c5eac1cdfc0102907dec104d431aefadcda35a18 |     
    sh4a     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/3475f90d62e0a9767cb06bcc78c9eb53e35df815 |     
 powerpc64   | rtl8189es-e58bd86c9d9408c64... | NOK | http://autobuild.buildroot.net/results/97d2d576594201ff53adb30d88bedbbebc9a38ff |     
    sh4a     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/cc3efe1946d420346f30dfd5136011e51dc3a7cf | ORPH
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/05e423c1756af313650fd667c4c40ed25251d6ac |     
  sparc64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/3b1b5b74fed60fc480818744403d8894ab8a5960 |     
powerpc64le  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/c33b72c152ff82fa251bba47872f227e7a1fcb08 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/1b07d0c425fcf3c75eec40be9025f2f9f9098ab4 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/7827c163262e03bdf5e12113abd25661e942386d |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/b1077e2d7a32a7c95d9798d69285b8d854f5fff9 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/79de6e07dca5071bf4d1a22ad798125b674dfeea |     
  mips64el   | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/ce9e2074bb8486d1ee25232b985d47475faefd63 | ORPH
  powerpc    |           volk-2.5.2           | NOK | http://autobuild.buildroot.net/results/1c6889ea3faff059904459f2f8d7a40c5e628393 |     
    mips     |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/e078c909c072f6593bdd0eff010f7bc1db8b94ae |     
    sh4      |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/cc906bc18544232e526ac5eeaad5918a9804ee76 |     


Classification of failures by reason for next
---------------------------------------------

              host-pahole-1.24 | 2 
package/network-manager/net... | 2 
                       unknown | 2 
             containerd-1.6.16 | 1 
                elfutils-0.186 | 1 
                gerbera-1.10.0 | 1 
glibc-2.36-81-g4f4d7a13edfd... | 1 
         gobject-introspection | 1 
            host-binutils-2.39 | 1 
                host-go-1.19.6 | 1 
              host-rust-1.67.1 | 1 
              libgcrypt-1.10.1 | 1 
                libglvnd-1.4.0 | 1 
                  linux-6.1.11 | 1 
                  netsurf-3.10 | 1 
                  ntp-4.2.8p15 | 1 
            quickjs-2021-03-27 | 1 
                rdma-core-44.0 | 1 
              skalibs-2.12.0.1 | 1 
                 systemd-252.4 | 1 
                     tmux-3.3a | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |       containerd-1.6.16        | NOK | http://autobuild.buildroot.net/results/5709d2d739dfde8f6b7c1d2ac136a24a145c1f18 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/c19479d41f90a6c0cf037e74f55c45baf2a01b03 | ORPH
    sh4      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/f99be1d1292c0ff880792b0f25675608e043f3e4 |     
   arceb     | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/171213467e7a3e6452d9f64b70956bddaa81f6d3 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/e1ffb38e42af83009119675228d3d64358374927 |     
   mips64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/8e08425d28fca3ef493b78bb07140492a33bdc79 |     
    i686     |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/11a9b7eff022ffce6bbcc17d6c1c6976e1d30cdc |     
   s390x     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/dc8177b90f92f15ca2e377f216fc5b9e32ed98a1 |     
    i586     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/3c0d58edead784134c7f82c5c9aa663ce220a99b |     
   s390x     |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/a34dc7149ac1b114e0d69d38d7fb063339827abe |     
    arm      |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/3492793a822b1a1a5f8c6186d339845125f8fc04 | ORPH
    mips     |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/190a406089f151e95291b745d64f8c44d00f1d69 | ORPH
   sh4eb     |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/e51850cc6e0c21fdb99de7539a1a228cbfdbf65b | ORPH
powerpc64le  |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/f1f669061fe6eeb6c8d8cace4594176991d67880 |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/da0dd23dc2ad034fed7f5e6d716c5e04f549777e | ORPH
   s390x     | package/network-manager/net... | NOK | http://autobuild.buildroot.net/results/f7762fcb1083b0437537176930266ce5f6a36f89 |     
   nios2     | package/network-manager/net... | NOK | http://autobuild.buildroot.net/results/af2b5b7e3e1d9580b7b4faccc3d12229fceabb16 |     
 microblaze  |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/936033361667a5b104f5e331d03093adfb5788b2 |     
    m68k     |         rdma-core-44.0         | NOK | http://autobuild.buildroot.net/results/731fba262f0b7470ce907ab7b0aed9b19f5d3fcd |     
    or1k     |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/01b9dfd1691016b03bd0afd254ee27b39068fc24 |     
    arm      |         systemd-252.4          | NOK | http://autobuild.buildroot.net/results/c9c6843f28e3177f55f6efd489f2e616317bb49a |     
    mips     |           tmux-3.3a            | NOK | http://autobuild.buildroot.net/results/2668475fa63921effac8ab9c1aaefdd3a9aac3aa |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/0995b0b9790ba8fa541e0a2d1c8108b81103db61 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/380f7d6bcec7ce6409f7f039f45e10fe20b336ae |     


Classification of failures by reason for 2022.11.x
--------------------------------------------------

              host-pahole-1.24 | 5 
                  linux-6.0.19 | 3 
                elfutils-0.186 | 1 
                     frr-8.3.1 | 1 
         gobject-introspection | 1 
  gobject-introspection-1.72.0 | 1 
            host-binutils-2.38 | 1 
                host-go-1.19.5 | 1 
              host-rust-1.64.0 | 1 
rtl8192eu-1e15b6d451731bc4d... | 1 
                 systemd-250.8 | 1 
               tcf-agent-1.7.0 | 1 
                       unknown | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/ecd1c8e036880a3bf0955bf509da067595d17755 | ORPH
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/aba7b465f3edaaf4f11ad7c5e7d53b452659a02f |     
   armeb     |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/558f4fbe910b294a63275107786d9f25398a0266 |     
   mipsel    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/f6fad62fa6594e32921457c9227a95a8da8bb97b | ORPH
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f21200c02025102c2cabee52970490185e2150af |     
  mips64el   |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/a0018d356f162e14367fed1248884aedb636a1c3 |     
    mips     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/b0c7436678e4e2c01718d2b3852de866e6eb4b91 |     
    or1k     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/74f9e1086e47beacd12b853d00dadbe04b73f739 |     
   xtensa    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/c2ba4bc81533463315a247c7a1757af7e7fd53ca |     
powerpc64le  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/5e5edab55de698eaa33ba9da33b1567da77b5a1b |     
powerpc64le  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/ada45818ab49eab16574efc8a96c2f6435778e1a |     
    mips     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/88d0888297b5075c39de2d73130840ff21a06b86 |     
  powerpc    |          linux-6.0.19          | NOK | http://autobuild.buildroot.net/results/3a5621fac593ce5929018dc215cfc29a5289129e | ORPH
    sh4a     |          linux-6.0.19          | NOK | http://autobuild.buildroot.net/results/2acbbc6aebffdc2ee97cd5e0fb1ce22893038fe7 | ORPH
   nios2     |          linux-6.0.19          | NOK | http://autobuild.buildroot.net/results/3e0d324f1f5c594906c00b4e252a4c5dbfc87f9b | ORPH
 powerpc64   | rtl8192eu-1e15b6d451731bc4d... | NOK | http://autobuild.buildroot.net/results/9ed3dc4976748cb80362c6a0da86eeded1df8aee |     
   s390x     |         systemd-250.8          | NOK | http://autobuild.buildroot.net/results/8cd631680b0e6fa8eb7da46c161c3c5e8cf61a9d |     
 microblaze  |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/ccd58213b3fe2a2d150e9e470dd6ea738b35c7e9 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/a8d4f5f1be4b51ce0f2a04915bad2ac152bbd0d0 |     


Gitlab CI results for 2023-03-02
================================

Detail of defconfig failures for 2022.11.2
------------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                   qemu_m68k_q800 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857620788  |      
            qemu_ppc64le_powernv8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857620883  |      
             qemu_ppc64le_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857620888  |      
                     qemu_sh4_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857620930  |      
                         qemu_x86 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857620952  |      
                      qemu_x86_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857620948  |      
                 qemu_xtensa_lx60 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857620956  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857620961  |      


Detail of runtime-test failures for 2022.11.2
---------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
        DetectBadArchTest | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621035  | ORPH 
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857620969  | ORPH 
          TestATFVexpress | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857620973  | ORPH 
 TestAarch64Pages64kGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621692  | ORPH 
  TestAarch64Pages64kMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621696  | ORPH 
TestAarch64Pages64kuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621725  | ORPH 
                 TestAtop | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621338  | ORPH 
              TestAvocado | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621340  | ORPH 
         TestCheckPackage | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622197  |      
      TestClangCompilerRT | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621349  | ORPH 
      TestCpioDracutGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621155  | ORPH 
...ioDracutGlibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621157  | ORPH 
       TestCpioDracutMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621161  | ORPH 
...pioDracutMuslMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621163  | ORPH 
     TestCpioDracutUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621165  | ORPH 
...oDracutUclibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621180  | ORPH 
             TestCpioFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621183  | ORPH 
           TestCrudiniPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621352  | ORPH 
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621354  | ORPH 
             TestDropbear | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621355  | ORPH 
              TestDtbocfg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621357  | ORPH 
                 TestEdk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857620978  | ORPH 
             TestExecline | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621358  | ORPH 
                 TestExt2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621210  | ORPH 
               TestExt2r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621221  | ORPH 
                 TestExt3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621225  | ORPH 
                 TestExt4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621230  | ORPH 
...rch64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621759  | ORPH 
...tlinAarch64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621762  | ORPH 
...arch64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621765  | ORPH 
...otlinAarch64MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621767  | ORPH 
...ch64UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621769  | ORPH 
...linAarch64UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621772  | ORPH 
...h64beGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621773  | ORPH 
...inAarch64beGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621774  | ORPH 
...64beUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621775  | ORPH 
...nAarch64beUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621776  | ORPH 
...750dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621780  | ORPH 
...nArcle750dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621782  | ORPH 
...ehs38GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621787  | ORPH 
...inArclehs38GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621790  | ORPH 
...hs38UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621793  | ORPH 
...nArclehs38UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621795  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621802  | ORPH 
...mebv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621806  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621809  | ORPH 
...rmebv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621812  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621816  | ORPH 
...ebv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621820  | ORPH 
...5eabiGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621821  | ORPH 
...inArmv5eabiGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621824  | ORPH 
...v5eabiMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621827  | ORPH 
...linArmv5eabiMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621829  | ORPH 
...eabiUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621833  | ORPH 
...nArmv5eabiUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621839  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621844  | ORPH 
...Armv6eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621847  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621849  | ORPH 
...nArmv6eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621851  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621852  | ORPH 
...rmv6eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621854  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621856  | ORPH 
...Armv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621858  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621860  | ORPH 
...nArmv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621862  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621865  | ORPH 
...rmv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621868  | ORPH 
...mv7mUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621870  | ORPH 
...tlinArmv7mUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621873  | ORPH 
...8xxxUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621875  | ORPH 
...nM68k68xxxUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621876  | ORPH 
...fireUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621878  | ORPH 
...8kcoldfireUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621882  | ORPH 
...azebeGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621884  | ORPH 
...icroblazebeGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621886  | ORPH 
...lazebeMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621888  | ORPH 
...MicroblazebeMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621890  | ORPH 
...zebeUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621892  | ORPH 
...croblazebeUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621893  | ORPH 
...azeelGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621894  | ORPH 
...icroblazeelGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621895  | ORPH 
...lazeelMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621896  | ORPH 
...MicroblazeelMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621897  | ORPH 
...zeelUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621899  | ORPH 
...croblazeelUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621900  | ORPH 
...ips32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621901  | ORPH 
...otlinMips32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621902  | ORPH 
...Mips32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621903  | ORPH 
...ootlinMips32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621904  | ORPH 
...ps32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621905  | ORPH 
...tlinMips32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621906  | ORPH 
...s32elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621908  | ORPH 
...linMips32elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621909  | ORPH 
...ps32elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621911  | ORPH 
...tlinMips32elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621913  | ORPH 
...32elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621915  | ORPH 
...inMips32elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621916  | ORPH 
...2r5elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621918  | ORPH 
...nMips32r5elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621920  | ORPH 
...32r5elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621921  | ORPH 
...inMips32r5elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621923  | ORPH 
...r5elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621925  | ORPH 
...Mips32r5elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621927  | ORPH 
...2r6elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621931  | ORPH 
...nMips32r6elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621934  | ORPH 
...32r6elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621936  | ORPH 
...inMips32r6elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621937  | ORPH 
...r6elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621938  | ORPH 
...Mips32r6elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621939  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621940  | ORPH 
...Mips64eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621941  | ORPH 
...4eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621942  | ORPH 
...nMips64eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621943  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621944  | ORPH 
...ips64eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621945  | ORPH 
...64n32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621946  | ORPH 
...inMips64n32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621947  | ORPH 
...s64n32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621949  | ORPH 
...linMips64n32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621951  | ORPH 
...4n32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621952  | ORPH 
...nMips64n32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621954  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621956  | ORPH 
...ps64r6eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621959  | ORPH 
...6eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621961  | ORPH 
...ips64r6eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621963  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621965  | ORPH 
...s64r6eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621967  | ORPH 
...Nios2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621969  | ORPH 
...ootlinNios2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621971  | ORPH 
...enriscMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621973  | ORPH 
...tlinOpenriscMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621976  | ORPH 
...riscUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621977  | ORPH 
...inOpenriscUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621978  | ORPH 
...440fpGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621979  | ORPH 
...owerpc440fpGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621980  | ORPH 
...c440fpMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621981  | ORPH 
...Powerpc440fpMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621982  | ORPH 
...40fpUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621983  | ORPH 
...werpc440fpUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621984  | ORPH 
...e5500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621985  | ORPH 
...erpc64e5500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621986  | ORPH 
...e6500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621988  | ORPH 
...erpc64e6500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621989  | ORPH 
...4e6500MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621991  | ORPH 
...werpc64e6500MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621993  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621996  | ORPH 
...c64lepower8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621998  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622000  | ORPH 
...pc64lepower8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622002  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622006  | ORPH 
...rpc64power8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622008  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622011  | ORPH 
...erpc64power8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622014  | ORPH 
...300c3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622015  | ORPH 
...werpce300c3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622016  | ORPH 
...e300c3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622018  | ORPH 
...owerpce300c3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622019  | ORPH 
...00c3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622021  | ORPH 
...erpce300c3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622022  | ORPH 
...500mcGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622024  | ORPH 
...werpce500mcGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622027  | ORPH 
...e500mcMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622028  | ORPH 
...owerpce500mcMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622031  | ORPH 
...00mcUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622035  | ORPH 
...erpce500mcUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622038  | ORPH 
...lp32dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622041  | ORPH 
...lp64dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622043  | ORPH 
...iscv64lp64dGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622047  | ORPH 
...4lp64dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622050  | ORPH 
...Riscv64lp64dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622054  | ORPH 
...p64dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622058  | ORPH 
...scv64lp64dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622063  | ORPH 
...0xz13GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622066  | ORPH 
...linS390xz13GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622069  | ORPH 
...Shsh4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622070  | ORPH 
...ootlinShsh4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622074  | ORPH 
...nShsh4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622076  | ORPH 
...BootlinShsh4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622078  | ORPH 
...hsh4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622083  | ORPH 
...otlinShsh4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622085  | ORPH 
...h4aebGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622087  | ORPH 
...linShsh4aebGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622089  | ORPH 
...sh4aebMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622091  | ORPH 
...tlinShsh4aebMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622094  | ORPH 
...arc64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622098  | ORPH 
...tlinSparc64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622101  | ORPH 
...rcv8UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622103  | ORPH 
...linSparcv8UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622106  | ORPH 
...X8664GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622110  | ORPH 
...ootlinX8664GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622114  | ORPH 
...nX8664MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622118  | ORPH 
...BootlinX8664MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622123  | ORPH 
...8664UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622126  | ORPH 
...otlinX8664UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622129  | ORPH 
...orei7GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622131  | ORPH 
...X8664corei7GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622133  | ORPH 
...corei7MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622134  | ORPH 
...nX8664corei7MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622136  | ORPH 
...rei7UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622137  | ORPH 
...8664corei7UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622139  | ORPH 
...664v2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622140  | ORPH 
...8664v2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622142  | ORPH 
...64v2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622144  | ORPH 
...664v3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622146  | ORPH 
...8664v3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622148  | ORPH 
...64v3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622151  | ORPH 
...664v4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622153  | ORPH 
...8664v4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622158  | ORPH 
...64v4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622161  | ORPH 
...core2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622165  | ORPH 
...linX86core2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622167  | ORPH 
...6core2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622170  | ORPH 
...tlinX86core2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622175  | ORPH 
...ore2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622178  | ORPH 
...inX86core2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622180  | ORPH 
...6i686GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622182  | ORPH 
...tlinX86i686GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622186  | ORPH 
...86i686MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622187  | ORPH 
...otlinX86i686MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622188  | ORPH 
...i686UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622189  | ORPH 
...linX86i686UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622190  | ORPH 
...lx60UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622193  | ORPH 
...Xtensalx60UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622195  | ORPH 
...ToolchainBuildrootMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621741  | ORPH 
...olchainBuildrootuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621743  | ORPH 
...xternalToolchainCCache | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621745  | ORPH 
...ernalToolchainCtngMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621748  | ORPH 
...rnalToolchainLinaroArm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621750  | ORPH 
...ToolchainSourceryArmv4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621752  | ORPH 
...ToolchainSourceryArmv5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621755  | ORPH 
...ToolchainSourceryArmv7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621757  | ORPH 
                 TestF2FS | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621232  | ORPH 
     TestFileCapabilities | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621039  | ORPH 
       TestFortifyConserv | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621041  | ORPH 
          TestFortifyNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621044  | ORPH 
               TestGdbArc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621360  | ORPH 
        TestGdbFullTarget | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621362  | ORPH 
...GdbHostOnlyAllFeatures | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621363  | ORPH 
   TestGdbHostOnlyDefault | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621364  | ORPH 
        TestGdbserverOnly | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621366  | ORPH 
        TestGetDevelopers | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857622200  | ORPH 
              TestGitHash | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621135  | ORPH 
               TestGitHub | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621141  | ORPH 
               TestGitLab | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621144  | ORPH 
              TestGitRefs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621137  | ORPH 
     TestGlibcAllTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621113  | ORPH 
...DefaultLimitedTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621116  | ORPH 
              TestGlxinfo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621368  | ORPH 
       TestGrubAArch64EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857620982  | ORPH 
         TestGrubX8664EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857620988  | ORPH 
         TestGrubi386BIOS | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857620993  | ORPH 
          TestGrubi386EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621000  | ORPH 
           TestGst1Python | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621370  | ORPH 
                TestHWLoc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621371  | ORPH 
        TestHostBmapTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621343  | ORPH 
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621374  | ORPH 
  TestInitSystemBusyboxRo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621281  | ORPH 
...InitSystemBusyboxRoNet | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621285  | ORPH 
  TestInitSystemBusyboxRw | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621288  | ORPH 
...InitSystemBusyboxRwNet | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621290  | ORPH 
       TestInitSystemNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621292  | ORPH 
...InitSystemOpenrcRoFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621293  | ORPH 
...InitSystemOpenrcRwFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621296  | ORPH 
...nitSystemSystemdRoFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621298  | ORPH 
...ystemSystemdRoIfupdown | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621301  | ORPH 
...mdRoIfupdownDbusbroker | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621304  | ORPH 
...IfupdownDbusbrokerDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621308  | ORPH 
...ystemSystemdRoNetworkd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621310  | ORPH 
...nitSystemSystemdRwFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621313  | ORPH 
...ystemSystemdRwIfupdown | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621317  | ORPH 
...mdRwIfupdownDbusbroker | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621320  | ORPH 
...IfupdownDbusbrokerDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621325  | ORPH 
...ystemSystemdRwNetworkd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621327  | ORPH 
      TestIso9660Grub2EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621236  | ORPH 
 TestIso9660Grub2External | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621240  | ORPH 
...0Grub2ExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621243  | ORPH 
   TestIso9660Grub2Hybrid | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621245  | ORPH 
 TestIso9660Grub2Internal | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621249  | ORPH 
...so9660SyslinuxExternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621252  | ORPH 
...slinuxExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621255  | ORPH 
...so9660SyslinuxInternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621259  | ORPH 
                TestJffs2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621261  | ORPH 
            TestLibshdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621379  | ORPH 
                  TestLua | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621392  | ORPH 
              TestLuaHttp | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621421  | ORPH 
           TestLuaInotify | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621425  | ORPH 
              TestLuaLPeg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621382  | ORPH 
          TestLuaLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621387  | ORPH 
         TestLuaLuaArgon2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621398  | ORPH 
         TestLuaLuaAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621405  | ORPH 
           TestLuaLuaCffi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621412  | ORPH 
        TestLuaLuaCqueues | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621413  | ORPH 
          TestLuaLuaExpat | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621456  | ORPH 
     TestLuaLuaFileSystem | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621462  | ORPH 
             TestLuaLuaGD | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621419  | ORPH 
           TestLuaLuaLdap | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621469  | ORPH 
          TestLuaLuaLyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621435  | ORPH 
          TestLuaLuaPosix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621473  | ORPH 
           TestLuaLuaSDL2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621439  | ORPH 
            TestLuaLuaSec | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621477  | ORPH 
         TestLuaLuaSocket | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621480  | ORPH 
           TestLuaLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621417  | ORPH 
           TestLuaLuaossl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621471  | ORPH 
         TestLuaLuasyslog | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621482  | ORPH 
           TestLuaLuazlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621450  | ORPH 
             TestLuaLunix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621430  | ORPH 
             TestLuaLzlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621489  | ORPH 
             TestLuaRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621657  | ORPH 
              TestLuaUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621444  | ORPH 
               TestLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621395  | ORPH 
           TestLuajitHttp | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621423  | ORPH 
        TestLuajitInotify | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621428  | ORPH 
           TestLuajitLPeg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621384  | ORPH 
       TestLuajitLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621389  | ORPH 
      TestLuajitLuaArgon2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621402  | ORPH 
      TestLuajitLuaAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621408  | ORPH 
     TestLuajitLuaCqueues | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621416  | ORPH 
       TestLuajitLuaExpat | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621460  | ORPH 
  TestLuajitLuaFileSystem | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621466  | ORPH 
          TestLuajitLuaGD | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621420  | ORPH 
        TestLuajitLuaLdap | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621470  | ORPH 
       TestLuajitLuaLyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621437  | ORPH 
       TestLuajitLuaPosix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621475  | ORPH 
        TestLuajitLuaSDL2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621441  | ORPH 
         TestLuajitLuaSec | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621478  | ORPH 
      TestLuajitLuaSocket | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621481  | ORPH 
        TestLuajitLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621418  | ORPH 
        TestLuajitLuaossl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621472  | ORPH 
      TestLuajitLuasyslog | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621484  | ORPH 
        TestLuajitLuazlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621453  | ORPH 
          TestLuajitLunix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621433  | ORPH 
          TestLuajitRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621658  | ORPH 
       TestLuajitTurbolua | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621673  | ORPH 
           TestLuajitUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621447  | ORPH 
                 TestLuvi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621486  | ORPH 
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621487  | ORPH 
               TestMender | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621490  | ORPH 
             TestMsrTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621492  | ORPH 
              TestNetdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621494  | ORPH 
           TestNoTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621126  | ORPH 
                  TestOci | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621265  | ORPH 
               TestOctave | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621496  | ORPH 
                  TestOla | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621498  | ORPH 
              TestOpenJdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621500  | ORPH 
         TestOpenSshGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621501  | ORPH 
        TestOpenSshuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621504  | ORPH 
                 TestOpkg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621506  | ORPH 
                 TestPerl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621509  | ORPH 
        TestPerlClassLoad | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621513  | ORPH 
         TestPerlDBDmysql | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621515  | ORPH 
     TestPerlEncodeDetect | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621518  | ORPH 
          TestPerlGDGraph | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621519  | ORPH 
       TestPerlHTMLParser | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621520  | ORPH 
TestPerlIOSocketMulticast | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621521  | ORPH 
      TestPerlIOSocketSSL | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621522  | ORPH 
 TestPerlLWPProtocolhttps | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621524  | ORPH 
         TestPerlMailDKIM | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621525  | ORPH 
              TestPerlX10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621526  | ORPH 
        TestPerlXMLLibXML | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621527  | ORPH 
       TestPerllibwwwperl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621523  | ORPH 
              TestPhpApcu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621528  | ORPH 
            TestPhpLuaLua | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621529  | ORPH 
         TestPhpLuaLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621530  | ORPH 
               TestPhpPam | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621532  | ORPH 
          TestPhpPeclDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621534  | ORPH 
                 TestPixz | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621536  | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621538  | ORPH 
        TestPolkitSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621540  | ORPH 
          TestPostScripts | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621060  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621542  | ORPH 
        TestProsodyLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621543  | ORPH 
         TestPy3BmapTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621347  | ORPH 
              TestPyNdiff | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621621  | ORPH 
            TestPython3Py | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621545  | ORPH 
         TestPython3PyPyc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621548  | ORPH 
           TestPython3Pyc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621550  | ORPH 
         TestPythonAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621559  | ORPH 
           TestPythonAvro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621565  | ORPH 
       TestPythonPahoMQTT | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621613  | ORPH 
     TestPythonPy3Aexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621552  | ORPH 
        TestPythonPy3Argh | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621554  | ORPH 
       TestPythonPy3Attrs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621558  | ORPH 
    TestPythonPy3Autobahn | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621561  | ORPH 
     TestPythonPy3Automat | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621563  | ORPH 
   TestPythonPy3Bitstring | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621566  | ORPH 
       TestPythonPy3Boto3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621567  | ORPH 
    TestPythonPy3Botocore | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621568  | ORPH 
         TestPythonPy3Can | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621569  | ORPH 
        TestPythonPy3Cbor | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621570  | ORPH 
       TestPythonPy3Click | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621571  | ORPH 
   TestPythonPy3Colorzero | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621573  | ORPH 
  TestPythonPy3Constantly | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621574  | ORPH 
   TestPythonPy3Construct | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621575  | ORPH 
    TestPythonPy3Crossbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621578  | ORPH 
TestPythonPy3Cryptography | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621580  | ORPH 
    TestPythonPy3DBusNext | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621582  | ORPH 
      TestPythonPy3Distro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621585  | ORPH 
      TestPythonPy3Django | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621588  | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621590  | ORPH 
       TestPythonPy3Flask | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621593  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621596  | ORPH 
         TestPythonPy3Git | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621599  | ORPH 
      TestPythonPy3Gitdb2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621602  | ORPH 
       TestPythonPy3GnuPG | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621606  | ORPH 
     TestPythonPy3Gobject | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621608  | ORPH 
    TestPythonPy3Gpiozero | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621609  | ORPH 
 TestPythonPy3Incremental | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621610  | ORPH 
    TestPythonPy3Iptables | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621611  | ORPH 
    TestPythonPy3Jmespath | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621612  | ORPH 
    TestPythonPy3Libftdi1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621376  | ORPH 
     TestPythonPy3Passlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621614  | ORPH 
     TestPythonPy3Pexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621615  | ORPH 
      TestPythonPy3PyAlsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621617  | ORPH 
      TestPythonPy3Pynacl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621619  | ORPH 
      TestPythonPy3Pytest | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621622  | ORPH 
...PythonPy3PytestAsyncio | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621623  | ORPH 
      TestPythonPy3Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621624  | ORPH 
      TestPythonPy3Qrcode | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621626  | ORPH 
         TestPythonPy3RSA | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621631  | ORPH 
     TestPythonPy3RpiGpio | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621628  | ORPH 
  TestPythonPy3S3transfer | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621637  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621639  | ORPH 
...thonPy3ServiceIdentity | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621641  | ORPH 
      TestPythonPy3Smmap2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621643  | ORPH 
        TestPythonPy3Treq | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621645  | ORPH 
     TestPythonPy3Twisted | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621647  | ORPH 
       TestPythonPy3Txaio | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621649  | ORPH 
    TestPythonPy3Txtorcon | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621652  | ORPH 
      TestPythonPy3Ubjson | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621654  | ORPH 
...y3UnitTestXmlReporting | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621655  | ORPH 
       TestPythonPy3rtoml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621634  | ORPH 
         TestPythonPybind | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621618  | ORPH 
                TestRedis | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621656  | ORPH 
                TestRelro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621047  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621049  | ORPH 
         TestRootPassword | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621085  | ORPH 
        TestRootfsOverlay | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621091  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621659  | ORPH 
              TestRustBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621660  | ORPH 
                   TestS6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621662  | ORPH 
         TestS6Networking | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621663  | ORPH 
      TestS6PortableUtils | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621664  | ORPH 
                 TestS6Rc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621665  | ORPH 
                  TestSCP | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621147  | ORPH 
     TestSELinuxCustomGit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621094  | ORPH 
  TestSELinuxExtraModules | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621097  | ORPH 
...ELinuxExtraModulesDirs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621102  | ORPH 
       TestSELinuxPackage | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621106  | ORPH 
   TestSELinuxSystemdExt4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621333  | ORPH 
...SELinuxSystemdSquashfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621334  | ORPH 
                 TestSFTP | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621151  | ORPH 
             TestSquashfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621266  | ORPH 
 TestSquashfsMaxBlocksize | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621269  | ORPH 
 TestSquashfsMinBlocksize | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621271  | ORPH 
              TestSspNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621052  | ORPH 
            TestSspStrong | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621056  | ORPH 
                 TestSudo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621667  | ORPH 
       TestSysLinuxX86EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621005  | ORPH 
TestSysLinuxX86LegacyBios | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621011  | ORPH 
    TestSysLinuxX86_64EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621017  | ORPH 
...sLinuxX86_64LegacyBios | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621030  | ORPH 
             TestSyslogNg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621669  | ORPH 
                 TestTmux | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621671  | ORPH 
                  TestUbi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621275  | ORPH 
TestUbootOpensslPkgConfig | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621675  | ORPH 
               TestYaffs2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621279  | ORPH 
             TestZerofree | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621677  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621680  | ORPH 
              TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621684  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3857621689  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
