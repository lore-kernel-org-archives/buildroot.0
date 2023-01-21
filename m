Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B8D6C004D4
	for <buildroot@archiver.kernel.org>; Sat, 21 Jan 2023 06:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F39740346;
	Sat, 21 Jan 2023 06:48:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F39740346
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M9-vdk3l89KZ; Sat, 21 Jan 2023 06:48:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 760584258E;
	Sat, 21 Jan 2023 06:48:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 760584258E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E32F1BF616
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 06:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA0DE82D14
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 06:48:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA0DE82D14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3gyRXL4YQuOi for <buildroot@lists.busybox.net>;
 Sat, 21 Jan 2023 06:48:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B30C82D0C
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B30C82D0C
 for <buildroot@buildroot.org>; Sat, 21 Jan 2023 06:48:07 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4E9F7FF807
 for <buildroot@buildroot.org>; Sat, 21 Jan 2023 06:48:05 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 21 Jan 2023 06:48:05 -0000
Message-Id: <20230121064811.EA0DE82D14@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1674283685; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hLeuZ8XXshCFcgQTUllfDHYizrAAIeyWVQlKaCOr+e0=;
 b=ZUsGa0mZl/Wrpbe36sce//S/5vqh7KfuYOmKMCABvDWzjakI1F3RZp10ZY6tdFcL4St3EZ
 p3gDQFJSdJbQD47nWBnsaEPEXso1AEGQ6xNFDCOv7rxmPQDLVgpy1uls2ov2qgWhhdOWMu
 7vFjk0PM4MpMVbdBVocy+TP2Q1aBmrGAmrWIMdwu3O0S9OgQt8GZHD/7tDCve1FmlgJagz
 VU74lEXy/Feyb3zghd1Y2fnMhjmYR2SEaTuS+ODC6VeY66vGHd5H/BHLeiBt2GtmZ5Z2CV
 LGEedPYeLLd45cY73KWG4BKZme4slwdtEO8jyKGNOrIAJApz6IOlpBo++TEPLA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZUsGa0mZ
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-01-20
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

Autobuild statistics for 2023-01-20
===================================

      branch |  OK | NOK | TIM | TOT |
    master   | 123 | 189 |  4  | 316 |

Classification of failures by reason for master
-----------------------------------------------

                   bash-5.2.15 | 16
                    fwup-1.9.1 | 15
               host-fwup-1.9.1 | 15
                  xxhash-0.8.1 | 8 
                   linux-6.1.5 | 6 
            host-binutils-2.37 | 5 
         host-sentry-cli-2.8.0 | 5 
                  jack2-1.9.21 | 5 
                    bat-0.19.0 | 4 
                    dust-0.8.1 | 4 
                elfutils-0.186 | 4 
                host-go-1.19.5 | 4 
              libgcrypt-1.10.1 | 4 
             libgpg-error-1.46 | 4 
                    pixz-1.0.7 | 4 
         gobject-introspection | 3 
  gobject-introspection-1.72.0 | 3 
                   gvfs-1.48.1 | 3 
              hyperfine-1.14.0 | 3 
                   libnss-3.87 | 3 
                 nerdctl-1.0.0 | 3 
                    opkg-0.4.5 | 3 
            python-bunch-1.0.1 | 3 
                     xz-5.2.10 | 3 
             dahdi-linux-3.2.0 | 2 
                   ethtool-6.1 | 2 
glibc-2.36-81-g4f4d7a13edfd... | 2 
            host-binutils-2.38 | 2 
    host-python-maturin-0.14.9 | 2 
               libglib2-2.72.3 | 2 
                   perl-5.36.0 | 2 
           python-bcrypt-4.0.1 | 2 
               acpica-20220331 | 1 
android-tools-4.2.2+git2013... | 1 
               apcupsd-3.14.14 | 1 
              asterisk-16.29.1 | 1 
  binutils-arc-2020.09-release | 1 
                  cairo-1.16.0 | 1 
               collectd-5.12.0 | 1 
                 coreutils-9.1 | 1 
                cracklib-2.9.8 | 1 
        edk2-edk2-stable202208 | 1 
                 fdk-aac-2.0.2 | 1 
                  ffmpeg-4.4.3 | 1 
               fftw-quad-3.3.8 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /tm... | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
                gerbera-1.10.0 | 1 
          gitlab-runner-15.5.0 | 1 
                     gmp-6.2.1 | 1 
                   gqrx-2.14.4 | 1 
            host-binutils-2.39 | 1 
host-gdb-arc-2020.09-releas... | 1 
               libdeflate-1.15 | 1 
           libfreeimage-3.18.0 | 1 
                     libgcrypt | 1 
              libostree-2022.7 | 1 
                libxml2-2.10.3 | 1 
                   linux-tools | 1 
               mariadb-10.3.36 | 1 
                  mender-3.4.0 | 1 
                 mesa3d-22.3.3 | 1 
                    musl-1.2.3 | 1 
                  ntp-4.2.8p15 | 1 
            ocf-linux-20171122 | 1 
                   opensbi-0.9 | 1 
                    php-8.1.14 | 1 
                     pound-2.8 | 1 
           proxychains-ng-4.16 | 1 
                  pugixml-1.13 | 1 
         python-greenlet-2.0.1 | 1 
  python-prompt-toolkit-3.0.36 | 1 
            quickjs-2021-03-27 | 1 
rtl8812au-aircrack-ng-e7a4a... | 1 
rtl8821cu-86cc5ceb7c28b9b99... | 1 
                 wolfssl-5.5.3 | 1 
                  zabbix-5.4.9 | 1 
                    zstd-1.5.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |        acpica-20220331         | NOK | http://autobuild.buildroot.net/results/ba8f3478df78f34fc85bd3a64b1eca0b8c2399f6 |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/20701a1b9dbff9238a457814e5be332c2facbc65 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/c61b1e2e9e52d8924f203372dee4f324f6875608 |     
   s390x     |        asterisk-16.29.1        | NOK | http://autobuild.buildroot.net/results/0d5285194af1b8d32a8fb497fb9a588bf94a341b |     
    i686     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/4ddd3e91d4f5767adaa5373754de436b0aec6d30 | ORPH
   xtensa    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/4395ed4f20b581144e909bbc0111c495922b50c8 | ORPH
   xtensa    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/7b18e1157a5403867f49c229f5ad0444ad4fb395 | ORPH
  powerpc    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/410f53d5de6173be3b965ea18c075559f23f63f3 | ORPH
   arceb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/142d9d2d926fbe5ebd5c9281790967ac5916e35d | ORPH
powerpc64le  |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/b12a43c2076d1ef3e05d868a8e4e54f395d2a7b0 | ORPH
   x86_64    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/102364a36417d021250238213d25fb7dd0f99ef8 | ORPH
  powerpc    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/5a595f79df5989b054380a443d6fc2098496d76f | ORPH
    or1k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/eeb6b740a568a651c088151c89e45ef8f2e50451 | ORPH
    arc      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/24c8fe1abe78019b3721afec633fe954057782e7 | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/1ba81cb6e8dcf9fa75da7a12f443e90d714f1bd2 | ORPH
   xtensa    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/65001fbc805b4990ca0c33108252791d7c553ecc | ORPH
   mips64    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/8253a3bb66abb3e5f216e13aea2b00cad777930a | ORPH
   arceb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/a173b16f6f0a99bd04bf346b0af774234b51e7d6 | ORPH
   xtensa    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/7305880ca4d02e7bc7173e7908b54284bc4ae955 | ORPH
    arc      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/4782899f9f075e45c378e8480da5b8b49a51a8bc | ORPH
    i686     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/f35f7adfd416b4dfe946d867ea8de99196f4e8fd |     
    i686     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/b8102fda2001bb7a36565edac4d87890aaf965e1 |     
powerpc64le  |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/f2a8dc4e9347b8024e31688ce89cdb68bda722d8 |     
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/df5553bbb6593c96bd9879548737762646372724 |     
   arceb     |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/785b68a59a95a516b5a4ba226af3ebeaa0aeb71c |     
  aarch64    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/b59096707b441a3ec7e00b1d38c6813ed07f3966 |     
    or1k     |        collectd-5.12.0         | NOK | http://autobuild.buildroot.net/results/ae11708f708524d3afde6e43844b10df78d4b057 |     
    sh4      |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/496b4eaec778c096e7e2df9f9f3eb30dac46439f | ORPH
    m68k     |         cracklib-2.9.8         | NOK | http://autobuild.buildroot.net/results/ef4d37f1b91faa8605cdc7bc3fb4931d8626751f |     
 powerpc64   |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/9f2131d1cab7b0fd656835e204cd680056d580de |     
microblazeel |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/50354ecb9dc07a005cc234b0616775a1d80adf09 |     
    i686     |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/2b7b34280a3d2d3eb1cba2e4e5a2c3bade05eb21 | ORPH
  aarch64    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/5028ccf8b2d23cda6a09b12de9d2e0502f57403a | ORPH
  sparc64    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/03d1ae9bdf284a125a71887223e49e7b77d293c3 | ORPH
    arm      |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/b987ebe774ec5edd51aec9e07d2b3e54c97225b2 | ORPH
   x86_64    |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/2663d82709c69211ac8c998d2bea08f52e5b5e48 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/20624c616243742b384b113ba7748057fb90b1bd | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/c33bc08d56c135f5fb3c092645ef0a733b635c4f | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/486ff168baf4302993c0d2a5af9aa5f07bc12b0a | ORPH
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/bf3bfe121574cac8e63a150396b1bbab23671aa1 | ORPH
microblazeel |          ethtool-6.1           | NOK | http://autobuild.buildroot.net/results/54f072b4d21ee08208c652045d64a02cb6643f67 |     
    i686     |          ethtool-6.1           | NOK | http://autobuild.buildroot.net/results/203797b2afbde62029861d37f2456f2c6237cd27 |     
  mips64el   |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/029d7fcc1c1c1cc474bbec66744b4325f04987de |     
  aarch64    |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/a7c6ddc2f41bc28c9a23e909a91b918f295948e7 |     
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/e35f459a7506cc1319920919ecaa49e1db943809 | ORPH
microblazeel | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/a19b917e1aff3c3ded47748fd90159dce95ca608 |     
   x86_64    | fs/cramfs/cramfs.mk:46: /tm... | NOK | http://autobuild.buildroot.net/results/2f3afc3d18338409f49d5ab655cabc2511b7d39e |     
  aarch64    | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/37322306ba712606a0101a770dbfca9407bbf69b |     
   nios2     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/dfbcb5a944128cf1b950b0f7d8603a1e8e4b4afb |     
   mips64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/09662d0de82077aacfddfaf9542c3fff8d8017f4 |     
  sparc64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/b631e2901ba8b4bdb85844291903d5bec09641f0 |     
microblazeel |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/9268075098d4f8a59a3acccb7457afc5f120be33 |     
    mips     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/dff2e93afe9d06c11da1d4ed8ef87851054be2fe |     
    i686     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/5d2b0752c3524a4457eba08362be5fe99f6fc907 |     
   x86_64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/1008086f27621d5762566ca712057a5e7dab61a9 |     
   x86_64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/e4464f00d251e8436a59c52b369ad0d48fa0d351 |     
   sh4aeb    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/e6100a2c596c20209cd3893bf90693e2e40f1578 |     
 aarch64_be  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/131a8802ed78d70c5c33dc59206ba163e0616dc5 |     
   xtensa    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/635db7aac48769c84b55ef7b788b096af3ec4241 |     
   nios2     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/5631b3c340829befe54c5790ea5c7af535153b2b |     
   mipsel    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/8b35e373b21d06e4e2ff6c0292dfaaa628e0509b |     
   mipsel    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/0e0b28accbfc6d0df92379c738aeb4a42b88e526 |     
   mipsel    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/b25ec1c85eb906b460274ffb21e2b33e89de17ce |     
microblazeel |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/b988c9d8ce8c5b9feace7a6a0c75c81fa385e645 |     
    i686     |      gitlab-runner-15.5.0      | NOK | http://autobuild.buildroot.net/results/e945996c6c9abd89a61b4b4fe34c5a8eee6e13ed |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/6048bbd2a333c3b4b2f744e5228a343ca3b37192 |     
powerpc64le  | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/cc3ff32e29b4c039a82b6d932b6d16f4bf3dada5 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/1b2ca26c44b01e97122f1e8cae610cb38ac5ca6f | ORPH
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/820233121f8b0e7ddfc15d4c8eced59d6c4524de |     
   armeb     |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/b75b0d4282ed8f1caeb016ef0a7efd09f1482758 |     
   armeb     |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/86e4fc3dc386636450d8613daff166a4c6241467 |     
 powerpc64   |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/dae80f47c3a911933f9daa1508214989b0c84311 | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/b72cdcaee5ac8c92de1e1899baad85bff3575acf | ORPH
    mips     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/443cac75355431165a34e312d76ce6eb4361d003 | ORPH
  sparc64    |          gqrx-2.14.4           | NOK | http://autobuild.buildroot.net/results/a56295a2e73a81b88a1b0be381447557e15e3a1d |     
    mips     |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/543aa1150a05d7545d9782b2d77e6e81d23a2930 | ORPH
    arm      |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/74b573dfac74ba7cefcd92b5473b0d99d879af88 | ORPH
   x86_64    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/8fed82070c94167bfea1a5e5ceef76d7b621a3f3 | ORPH
  powerpc    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/d92889a7f5c98e510a3dfb09c8c04664f6eba84f |     
  riscv64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/420af4bee09c0619dd98f54b7ea2bfd20131ffc7 |     
   sh4eb     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/24cae60e7416aa161d9108786b1cc1cd32fdf30d |     
powerpc64le  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/f59f893792b42c02223e6cc2bf2a87d46bb06d26 |     
    arm      |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/96e8cf3dc8bdb0ce39d8b82255b9efc692f01c6f |     
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/1a1832f71a536dc4f8afbb5e8f9f12e42129dba5 |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/5a3814d4f0cd042c5724f36f97828ffa25361ab6 |     
  mips64el   |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/b66cd649401dafdc9a8524702e4ea1a87151b31b |     
   s390x     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/3037bc5e80dbc47c10db092b9986dd03431f0885 |     
    arc      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/d29b98602837a2cda54d87afa5f5b2d9acdfa4f4 |     
 powerpc64   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/9cb71d284418cf565bc345af0952140d35867fa4 |     
    i586     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/39d2440a64ce75aa1de17b1d7016991909a9c1f1 |     
   mipsel    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/e17b85278bf7c77a246fbef28401bc6b4bde649a |     
  riscv64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/dc687bd9167a5d0e206e0d4ed9d31e1c267db2a6 |     
   x86_64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/8d5f883e55134d82baf6911175a108d08963f8ff |     
 aarch64_be  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/02e111ac0479ab6cdc8c0351dde9c8a21d85ab1d |     
    i586     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/95f3e3fadc8954ad33e54df6042d5b36e73745f1 |     
    m68k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/766aa47acbe8b30903a884f704b23106bfa0910f |     
   mips64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/47156d8609715285dc748393b0573a0cd5655447 |     
  powerpc    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/83ea8f45cc240cb53558b7b3ebdfec16a9be3fa1 |     
    arc      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/1ceafd763d5155de6a6f952dfc0cdc9154c11d8d |     
  sparc64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/ade70cb0bc72694a72607645a68833ca8a8de786 |     
    mips     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/07bac5aea19dd971ccb54d71ae10b8d28cef279f |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/43903498b68e0b4e007296f302af60dada8d732e | ORPH
  mips64el   |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/ee57476c313582701d9db9b82f5135d94a8445c1 |     
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/a1018c19ff1ff35dd66e6e335e3088a850071609 |     
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/7b8f5223c01bdc4b91c75ada6c7f18b8a443808b |     
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/641ead8964b82aa4d0a2ca51a907da3e9f6f580d |     
powerpc64le  |   host-python-maturin-0.14.9   | NOK | http://autobuild.buildroot.net/results/50bdf3cd00c34f110a02815ef21501e3c92d7f46 |     
  sparc64    |   host-python-maturin-0.14.9   | NOK | http://autobuild.buildroot.net/results/3b6f87ee38398fc3b1f0c039f9a0e125bc27af2e |     
  riscv32    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/0f7971e4c0f6b689c2af59600042da6b989fa22c |     
 microblaze  |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/45736ab80f0832f665c38f7a25c52e5fa131e486 |     
 aarch64_be  |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/b24f23b7fd671bcbe5e982abf74326681c30b3c5 |     
    i586     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/79d29ec870c357ab7ce9fb55925f9806ff6f98bd |     
   nios2     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/6e4b7003a1dee16534b184151a2115b3ad0e11e9 |     
   s390x     |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/bd7f3f7bc1b3ddc5b9326a7ab9159c5948c99fd0 | ORPH
powerpc64le  |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/f2f150d3b4f9e25de728215f08cd2947e83e212e | ORPH
  aarch64    |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/6c5e3117cd289b2210bf6d663f9e99ee33a8d586 | ORPH
 aarch64_be  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/786e0b8054f9beeb6814b9aa0118763a4ca8f035 |     
powerpc64le  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/d3d73961a2f8b93c680717c9185c42a0d94347a7 |     
   s390x     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/cde5506b99a8405ff7b813308dd542085f45f1c5 |     
    or1k     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/3b2229bc020d31c2be0e9bf43eaa8e21e9fc3106 |     
   mips64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/90ae4c62e88965726b3a453290e0be0f81c4a052 |     
   armeb     |        libdeflate-1.15         | NOK | http://autobuild.buildroot.net/results/fb69dd35b14ebe5a13da0566416c82fea94b8b1d |     
   mipsel    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/4c037deb36f6aff4ff60b23cf425357a7356a039 |     
   armeb     |           libgcrypt            | TIM | http://autobuild.buildroot.net/results/d315f2c22e1a8c54ab0d9b7bf03ebb5701e21433 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/75bc6ad0d486b140d6917179bb204305d5df0737 | ORPH
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/8f3ca98a915b88cc75f039d6f49e7beac2ab5a4d | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/43371312bbb28b2bbf3fbd5cd737a61c82390011 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/38d0180d45af0e3b591701c755135ef5f14f3e35 | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/6c08c384c7488d2cb1fc1256ef9a53605913391d |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/b9a2c58c095da2b6263acc2d97351dd56757ab0e |     
  aarch64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/a9b5e8d61df189e06830bf046b4309da0d91f3fa | ORPH
  aarch64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/e1dac6fb908dbe8448c9e52324b185b8b5238685 | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/763e4ae1703c235336e7db17d0fb9db47912c878 | ORPH
  aarch64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/a87370144b67b0c778838bddaa3defcf3917fab9 | ORPH
  aarch64    |          libnss-3.87           | NOK | http://autobuild.buildroot.net/results/23cad35cf3d2835ea54f0eee417400a05a7a05bb |     
 microblaze  |          libnss-3.87           | NOK | http://autobuild.buildroot.net/results/c58cd80ba055d09cbfa02d9aca9fad05a5301761 |     
   x86_64    |          libnss-3.87           | NOK | http://autobuild.buildroot.net/results/29e0c4b5fdfbcaaf4fa361983be1c39dcc3983ee |     
    mips     |        libostree-2022.7        | NOK | http://autobuild.buildroot.net/results/5719b6e7b45d861919a755eede97bb3e40c8419a |     
   x86_64    |         libxml2-2.10.3         | NOK | http://autobuild.buildroot.net/results/078f5271c388391b759d2207dd761933e16aab0c |     
    sh4a     |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/4b172d942ac6040fa1796fe3e60c4583d28686b1 | ORPH
  mips64el   |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/9bf524987ed131b6806f5c7805a4e40fb0ca257c | ORPH
  mips64el   |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/db94aa0fd534461518d0b1b18b0932128b2fe626 | ORPH
  powerpc    |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/ebbb9f34430b44d67ab6499c84a10521fd6aa472 | ORPH
    arm      |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/517dcee42466cfc5a912c86a275de32753a30b62 | ORPH
  mips64el   |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/21f61e4ae60c95d775b184a41acd1f260e5fff32 | ORPH
  mips64el   |          linux-tools           | NOK | http://autobuild.buildroot.net/results/49fdcd4131caa13de7f1fa2a1495b107ab18db3a | ORPH
   nios2     |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/458c1e2b09dc951eb565e1623d15b2fe16d7b0b0 | ORPH
   s390x     |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/212548df03ed4632db8e3f31f6466130b3861260 |     
    mips     |         mesa3d-22.3.3          | NOK | http://autobuild.buildroot.net/results/b8e7d67a1411ef414135188a8e76ac7a4f3f00d9 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/2ea487702e2518de034c131a8912cdc9a94f0674 |     
  aarch64    |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/530c5582fbf2fb6a41ffca801bda670f1b731918 |     
   x86_64    |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/453e0d961441f312534c655a15e0a3dd66cf6762 |     
powerpc64le  |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/2b52506289a6106f7c0da7b0d7b554ee0010677f |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/5918d316d395c2b0f5e62d6b7179d8239996bc80 | ORPH
    or1k     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/526162bc928cef8c0442ee6c2b679de43c1e483a | ORPH
  riscv64    |          opensbi-0.9           | NOK | http://autobuild.buildroot.net/results/cdf4ccaa523205631ccaf78c1e6bb669be71c584 |     
   nios2     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/f65ac8358eb99a2ca091fb57e80d781161b2efab | ORPH
  aarch64    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/48dfe34fb133180dd648e087f0e5d050bc5ef65e | ORPH
   x86_64    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/5ee59ba50838c4848dec10eb382e93b2786bc4c9 | ORPH
    i586     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/60b7a6243bdee7bf858788cc0e7c28de171c31dc |     
    arc      |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/684505d10a60607a7b43166848e108a5e2dd5aee |     
 microblaze  |           php-8.1.14           | NOK | http://autobuild.buildroot.net/results/e49e959abcee4efaf525616b32ae44570ba09704 |     
    arm      |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/0e60c64e78800bf6fea7b7eea15e2c85a0b1ce05 |     
powerpc64le  |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/82abc2e9592746d352caf4b903ad913fb7d4fc09 |     
   sh4eb     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/8560679fccc98691dcd44978f3123801a4035610 |     
   armeb     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/43a01453a2a135cb9298ae8c128e29fd86333b96 |     
  mips64el   |           pound-2.8            | NOK | http://autobuild.buildroot.net/results/4d3da1c9fde53e77b20009dc9bdfff0c314da2a6 |     
  aarch64    |      proxychains-ng-4.16       | NOK | http://autobuild.buildroot.net/results/01387929183fcef176196d07b70753d8801a3b73 | ORPH
  sparc64    |          pugixml-1.13          | NOK | http://autobuild.buildroot.net/results/e595ba7c79e0540f40c9fe9275cd5b000304d3e1 |     
  sparc64    |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/314cc5edbb1fb99892c9dc63a4848f96c5a456cb |     
 powerpc64   |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/2a880f99726d5c9cf6f8c2ff0d242e97cf4f2282 |     
    or1k     |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/bf3de63ea6fafc23c666d4fbe5273b6265a9eee7 |     
   armeb     |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/5e77b094bca6e28e212c1cebf219ff7cb92018b6 |     
   nios2     |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/cbb67a12f7aaf09d4b57f16b1627ceb0ceab1312 |     
    i686     |     python-greenlet-2.0.1      | NOK | http://autobuild.buildroot.net/results/e62f2367c4a4880e13350e4aafd3312b9199c45d |     
    i586     |  python-prompt-toolkit-3.0.36  | NOK | http://autobuild.buildroot.net/results/d6edbac2b51b432fb5cd0eea04e0bc2757799943 |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/d3fe0876f4c5660ef694994ee5b7f36702858477 |     
  riscv32    | rtl8812au-aircrack-ng-e7a4a... | NOK | http://autobuild.buildroot.net/results/19a5224b122526adf0893a847a7f4dc152d0454b |     
   arceb     | rtl8821cu-86cc5ceb7c28b9b99... | NOK | http://autobuild.buildroot.net/results/99e26e74db157b2df7e6da0e8eecb141dff9a308 |     
  mips64el   |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/eb48178d84ee76511cfd9713deebd5c4da55f522 |     
    arc      |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/ffbd49a14cb2f70e5e2a93c0637d806c5f7114b8 | ORPH
 aarch64_be  |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/0c5e12224966a03aa980daddde2a1088dbd60e63 | ORPH
   mipsel    |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/6fdd8ead71d20a25426f142dff8a5bd7a410be7c | ORPH
   mips64    |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/9440859a1aac56a5967e1796496f5c850b0cdfbb | ORPH
   mips64    |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/38e5bf6cb961d0d93c404df6acf5c65dad8cde24 | ORPH
    mips     |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/7e8527f18c8aca8b21f32b0029fb3af8cf3ca4fc | ORPH
microblazeel |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/9ab95a972c5611f3359d6f9bad2073baedcaae4d | ORPH
    mips     |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/53754de47fc4b033a5bd7c88de4a86b842feca90 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/ad7a8c007221b154ed9653402a0cb5f910bcf797 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/ac5610bdfc94e9d91ccfa22dc5ed52597ced86fc | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/680359ad6f8ec3301482602e3302046c7f6238ec | ORPH
  sparc64    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/f2cd904d56b39f2a2884b2edb3167f7f0fd6323b |     
microblazeel |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/47ea3cd32089dfa999442933cb3e62d899fc90ec |     


Gitlab CI results for 2023-01-20
================================

Detail of defconfig failures for 2022.02.9
------------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
         qemu_arm_versatile_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492473  | ORPH 
                qemu_m68k_mcf5208 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492491  |      
                 qemu_xtensa_lx60 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492602  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492604  |      


Detail of runtime-test failures for 2022.02.9
---------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
        DetectBadArchTest | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492627  | ORPH 
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492605  | ORPH 
          TestATFVexpress | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492606  | ORPH 
                 TestAtop | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492717  | ORPH 
         TestCheckPackage | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493240  |      
           TestCrudiniPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492721  | ORPH 
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492723  | ORPH 
             TestDropbear | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492724  | ORPH 
              TestDtbocfg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492725  | ORPH 
                 TestEdk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492611  | ORPH 
             TestExecline | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492726  | ORPH 
                 TestExt2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492673  | ORPH 
               TestExt2r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492677  | ORPH 
                 TestExt3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492678  | ORPH 
                 TestExt4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492679  | ORPH 
...rch64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492992  | ORPH 
...tlinAarch64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492993  | ORPH 
...arch64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492994  | ORPH 
...otlinAarch64MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492996  | ORPH 
...ch64UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492997  | ORPH 
...linAarch64UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492998  | ORPH 
...h64beGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492999  | ORPH 
...inAarch64beGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493000  | ORPH 
...64beUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493001  | ORPH 
...nAarch64beUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493002  | ORPH 
...750dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493003  | ORPH 
...nArcle750dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493004  | ORPH 
...ehs38GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493005  | ORPH 
...inArclehs38GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493006  | ORPH 
...hs38UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493007  | ORPH 
...nArclehs38UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493008  | ORPH 
...5eabiGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493010  | ORPH 
...inArmv5eabiGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493013  | ORPH 
...v5eabiMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493015  | ORPH 
...linArmv5eabiMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493017  | ORPH 
...eabiUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493020  | ORPH 
...nArmv5eabiUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493022  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493024  | ORPH 
...Armv6eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493026  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493029  | ORPH 
...nArmv6eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493031  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493032  | ORPH 
...rmv6eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493035  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493037  | ORPH 
...Armv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493038  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493039  | ORPH 
...nArmv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493040  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493041  | ORPH 
...rmv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493042  | ORPH 
...mv7mUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493043  | ORPH 
...tlinArmv7mUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493044  | ORPH 
...8xxxUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493045  | ORPH 
...nM68k68xxxUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493046  | ORPH 
...fireUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493047  | ORPH 
...8kcoldfireUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493048  | ORPH 
...azebeGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493049  | ORPH 
...icroblazebeGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493050  | ORPH 
...lazebeMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493051  | ORPH 
...MicroblazebeMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493052  | ORPH 
...zebeUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493053  | ORPH 
...croblazebeUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493054  | ORPH 
...azeelGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493055  | ORPH 
...icroblazeelGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493056  | ORPH 
...lazeelMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493057  | ORPH 
...MicroblazeelMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493058  | ORPH 
...zeelUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493059  | ORPH 
...croblazeelUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493060  | ORPH 
...ips32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493061  | ORPH 
...otlinMips32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493062  | ORPH 
...Mips32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493063  | ORPH 
...ootlinMips32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493064  | ORPH 
...ps32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493065  | ORPH 
...tlinMips32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493067  | ORPH 
...s32elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493069  | ORPH 
...linMips32elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493072  | ORPH 
...ps32elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493075  | ORPH 
...tlinMips32elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493076  | ORPH 
...32elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493079  | ORPH 
...inMips32elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493081  | ORPH 
...2r5elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493083  | ORPH 
...nMips32r5elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493084  | ORPH 
...32r5elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493086  | ORPH 
...inMips32r5elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493088  | ORPH 
...r5elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493090  | ORPH 
...Mips32r5elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493092  | ORPH 
...2r6elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493093  | ORPH 
...nMips32r6elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493095  | ORPH 
...32r6elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493096  | ORPH 
...inMips32r6elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493098  | ORPH 
...r6elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493100  | ORPH 
...Mips32r6elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493102  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493103  | ORPH 
...Mips64eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493104  | ORPH 
...4eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493106  | ORPH 
...nMips64eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493108  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493110  | ORPH 
...ips64eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493112  | ORPH 
...64n32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493113  | ORPH 
...inMips64n32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493115  | ORPH 
...s64n32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493116  | ORPH 
...linMips64n32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493117  | ORPH 
...4n32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493118  | ORPH 
...nMips64n32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493119  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493120  | ORPH 
...ps64r6eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493121  | ORPH 
...6eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493122  | ORPH 
...ips64r6eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493123  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493124  | ORPH 
...s64r6eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493126  | ORPH 
...Nios2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493127  | ORPH 
...ootlinNios2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493129  | ORPH 
...enriscMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493132  | ORPH 
...tlinOpenriscMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493134  | ORPH 
...riscUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493136  | ORPH 
...inOpenriscUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493137  | ORPH 
...440fpGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493138  | ORPH 
...owerpc440fpGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493139  | ORPH 
...c440fpMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493140  | ORPH 
...Powerpc440fpMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493141  | ORPH 
...40fpUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493142  | ORPH 
...werpc440fpUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493143  | ORPH 
...e5500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493145  | ORPH 
...erpc64e5500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493146  | ORPH 
...e6500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493147  | ORPH 
...erpc64e6500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493149  | ORPH 
...4e6500MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493150  | ORPH 
...werpc64e6500MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493152  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493153  | ORPH 
...c64lepower8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493154  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493156  | ORPH 
...pc64lepower8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493158  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493159  | ORPH 
...rpc64power8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493161  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493163  | ORPH 
...erpc64power8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493165  | ORPH 
...300c3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493167  | ORPH 
...werpce300c3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493169  | ORPH 
...e300c3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493171  | ORPH 
...owerpce300c3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493172  | ORPH 
...00c3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493174  | ORPH 
...erpce300c3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493175  | ORPH 
...500mcGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493176  | ORPH 
...werpce500mcGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493177  | ORPH 
...e500mcMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493178  | ORPH 
...owerpce500mcMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493179  | ORPH 
...00mcUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493180  | ORPH 
...erpce500mcUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493181  | ORPH 
...lp32dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493182  | ORPH 
...lp64dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493183  | ORPH 
...iscv64lp64dGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493184  | ORPH 
...4lp64dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493185  | ORPH 
...Riscv64lp64dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493186  | ORPH 
...p64dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493187  | ORPH 
...scv64lp64dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493188  | ORPH 
...Shsh4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493189  | ORPH 
...ootlinShsh4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493190  | ORPH 
...nShsh4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493191  | ORPH 
...BootlinShsh4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493192  | ORPH 
...hsh4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493193  | ORPH 
...otlinShsh4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493194  | ORPH 
...h4aebGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493195  | ORPH 
...linShsh4aebGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493196  | ORPH 
...sh4aebMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493197  | ORPH 
...tlinShsh4aebMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493198  | ORPH 
...arc64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493199  | ORPH 
...tlinSparc64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493200  | ORPH 
...rcv8UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493201  | ORPH 
...linSparcv8UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493202  | ORPH 
...X8664GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493203  | ORPH 
...ootlinX8664GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493204  | ORPH 
...nX8664MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493205  | ORPH 
...BootlinX8664MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493206  | ORPH 
...8664UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493207  | ORPH 
...otlinX8664UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493208  | ORPH 
...orei7GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493210  | ORPH 
...X8664corei7GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493211  | ORPH 
...corei7MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493212  | ORPH 
...nX8664corei7MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493213  | ORPH 
...rei7UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493214  | ORPH 
...8664corei7UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493215  | ORPH 
...664v2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493216  | ORPH 
...8664v2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493217  | ORPH 
...64v2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493218  | ORPH 
...664v3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493219  | ORPH 
...8664v3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493220  | ORPH 
...64v3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493221  | ORPH 
...664v4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493222  | ORPH 
...8664v4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493223  | ORPH 
...64v4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493224  | ORPH 
...core2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493225  | ORPH 
...linX86core2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493226  | ORPH 
...6core2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493227  | ORPH 
...tlinX86core2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493228  | ORPH 
...ore2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493230  | ORPH 
...inX86core2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493231  | ORPH 
...6i686GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493232  | ORPH 
...tlinX86i686GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493233  | ORPH 
...86i686MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493234  | ORPH 
...otlinX86i686MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493235  | ORPH 
...i686UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493236  | ORPH 
...linX86i686UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493237  | ORPH 
...lx60UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493238  | ORPH 
...Xtensalx60UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627493239  | ORPH 
...ToolchainBuildrootMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492984  | ORPH 
...olchainBuildrootuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492985  | ORPH 
...xternalToolchainCCache | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492986  | ORPH 
...ernalToolchainCtngMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492987  | ORPH 
...rnalToolchainLinaroArm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492988  | ORPH 
...ToolchainSourceryArmv4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492989  | ORPH 
...ToolchainSourceryArmv5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492990  | ORPH 
...ToolchainSourceryArmv7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492991  | ORPH 
                 TestF2FS | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492681  | ORPH 
     TestFileCapabilities | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492631  | ORPH 
       TestFortifyConserv | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492639  | ORPH 
          TestFortifyNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492640  | ORPH 
               TestGdbArc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492727  | ORPH 
        TestGdbFullTarget | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492728  | ORPH 
  TestGdbHostGdbTarget11x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492729  | ORPH 
   TestGdbHostGdbTarget9x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492730  | ORPH 
  TestGdbHostGdbserver11x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492731  | ORPH 
   TestGdbHostGdbserver9x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492732  | ORPH 
       TestGdbHostOnly11x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492734  | ORPH 
        TestGdbHostOnly9x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492735  | ORPH 
...GdbHostOnlyAllFeatures | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492740  | ORPH 
   TestGdbHostOnlyDefault | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492741  | ORPH 
        TestGdbserverOnly | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492743  | ORPH 
              TestGitHash | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492663  | ORPH 
               TestGitHub | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492667  | ORPH 
               TestGitLab | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492668  | ORPH 
              TestGitRefs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492665  | ORPH 
     TestGlibcAllTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492655  | ORPH 
...DefaultLimitedTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492658  | ORPH 
              TestGlxinfo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492745  | ORPH 
           TestGst1Python | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492747  | ORPH 
        TestHostBmapTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492718  | ORPH 
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492749  | ORPH 
  TestInitSystemBusyboxRo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492702  | ORPH 
...InitSystemBusyboxRoNet | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492703  | ORPH 
  TestInitSystemBusyboxRw | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492704  | ORPH 
...InitSystemBusyboxRwNet | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492705  | ORPH 
       TestInitSystemNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492706  | ORPH 
...InitSystemOpenrcRoFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492707  | ORPH 
...InitSystemOpenrcRwFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492708  | ORPH 
...nitSystemSystemdRoFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492709  | ORPH 
...ystemSystemdRoIfupdown | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492710  | ORPH 
...ystemSystemdRoNetworkd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492711  | ORPH 
...nitSystemSystemdRwFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492712  | ORPH 
...ystemSystemdRwIfupdown | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492713  | ORPH 
...ystemSystemdRwNetworkd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492714  | ORPH 
      TestIso9660Grub2EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492682  | ORPH 
 TestIso9660Grub2External | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492683  | ORPH 
...0Grub2ExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492685  | ORPH 
   TestIso9660Grub2Hybrid | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492686  | ORPH 
 TestIso9660Grub2Internal | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492687  | ORPH 
...so9660SyslinuxExternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492688  | ORPH 
...slinuxExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492692  | ORPH 
...so9660SyslinuxInternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492695  | ORPH 
                TestJffs2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492696  | ORPH 
            TestLibshdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492753  | ORPH 
                  TestLua | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492763  | ORPH 
              TestLuaHttp | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492788  | ORPH 
           TestLuaInotify | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492792  | ORPH 
              TestLuaLPeg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492758  | ORPH 
          TestLuaLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492761  | ORPH 
         TestLuaLuaArgon2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492769  | ORPH 
         TestLuaLuaAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492772  | ORPH 
           TestLuaLuaCffi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492777  | ORPH 
        TestLuaLuaCqueues | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492779  | ORPH 
          TestLuaLuaExpat | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492815  | ORPH 
     TestLuaLuaFileSystem | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492818  | ORPH 
             TestLuaLuaGD | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492785  | ORPH 
           TestLuaLuaLdap | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492820  | ORPH 
          TestLuaLuaLyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492799  | ORPH 
          TestLuaLuaPosix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492825  | ORPH 
           TestLuaLuaSDL2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492804  | ORPH 
            TestLuaLuaSec | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492828  | ORPH 
         TestLuaLuaSocket | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492831  | ORPH 
           TestLuaLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492783  | ORPH 
           TestLuaLuaossl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492822  | ORPH 
         TestLuaLuasyslog | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492834  | ORPH 
           TestLuaLuazlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492812  | ORPH 
             TestLuaLunix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492796  | ORPH 
             TestLuaLzlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492841  | ORPH 
             TestLuaRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492965  | ORPH 
              TestLuaUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492807  | ORPH 
               TestLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492766  | ORPH 
           TestLuajitHttp | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492789  | ORPH 
        TestLuajitInotify | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492794  | ORPH 
           TestLuajitLPeg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492759  | ORPH 
       TestLuajitLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492762  | ORPH 
      TestLuajitLuaArgon2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492770  | ORPH 
      TestLuajitLuaAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492774  | ORPH 
     TestLuajitLuaCqueues | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492781  | ORPH 
       TestLuajitLuaExpat | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492817  | ORPH 
  TestLuajitLuaFileSystem | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492819  | ORPH 
          TestLuajitLuaGD | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492786  | ORPH 
        TestLuajitLuaLdap | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492821  | ORPH 
       TestLuajitLuaLyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492801  | ORPH 
       TestLuajitLuaPosix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492827  | ORPH 
        TestLuajitLuaSDL2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492805  | ORPH 
         TestLuajitLuaSec | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492829  | ORPH 
      TestLuajitLuaSocket | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492833  | ORPH 
        TestLuajitLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492784  | ORPH 
        TestLuajitLuaossl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492824  | ORPH 
      TestLuajitLuasyslog | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492837  | ORPH 
        TestLuajitLuazlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492814  | ORPH 
          TestLuajitLunix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492798  | ORPH 
          TestLuajitRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492967  | ORPH 
       TestLuajitTurbolua | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492980  | ORPH 
           TestLuajitUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492811  | ORPH 
                 TestLuvi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492838  | ORPH 
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492840  | ORPH 
               TestMender | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492843  | ORPH 
              TestNetdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492845  | ORPH 
           TestNoTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492659  | ORPH 
                  TestOci | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492697  | ORPH 
              TestOpenJdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492846  | ORPH 
         TestOpenSshGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492848  | ORPH 
        TestOpenSshuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492850  | ORPH 
                 TestOpkg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492852  | ORPH 
                 TestPerl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492853  | ORPH 
        TestPerlClassLoad | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492856  | ORPH 
         TestPerlDBDmysql | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492857  | ORPH 
     TestPerlEncodeDetect | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492859  | ORPH 
          TestPerlGDGraph | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492861  | ORPH 
       TestPerlHTMLParser | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492862  | ORPH 
TestPerlIOSocketMulticast | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492865  | ORPH 
      TestPerlIOSocketSSL | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492866  | ORPH 
 TestPerlLWPProtocolhttps | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492870  | ORPH 
         TestPerlMailDKIM | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492872  | ORPH 
              TestPerlX10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492873  | ORPH 
        TestPerlXMLLibXML | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492876  | ORPH 
       TestPerllibwwwperl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492869  | ORPH 
              TestPhpApcu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492878  | ORPH 
            TestPhpLuaLua | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492881  | ORPH 
         TestPhpLuaLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492883  | ORPH 
               TestPhpPam | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492888  | ORPH 
          TestPhpPeclDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492889  | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492891  | ORPH 
        TestPolkitSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492893  | ORPH 
          TestPostScripts | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492646  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492894  | ORPH 
        TestProsodyLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492895  | ORPH 
         TestPy3BmapTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492720  | ORPH 
              TestPyNdiff | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492949  | ORPH 
              TestPython3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492896  | ORPH 
         TestPythonAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492902  | ORPH 
           TestPythonAvro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492908  | ORPH 
     TestPythonPy3Aexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492897  | ORPH 
        TestPythonPy3Argh | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492899  | ORPH 
       TestPythonPy3Attrs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492900  | ORPH 
    TestPythonPy3Autobahn | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492904  | ORPH 
     TestPythonPy3Automat | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492905  | ORPH 
   TestPythonPy3Bitstring | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492909  | ORPH 
       TestPythonPy3Boto3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492911  | ORPH 
    TestPythonPy3Botocore | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492912  | ORPH 
         TestPythonPy3Can | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492914  | ORPH 
        TestPythonPy3Cbor | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492917  | ORPH 
       TestPythonPy3Click | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492920  | ORPH 
   TestPythonPy3Colorzero | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492921  | ORPH 
  TestPythonPy3Constantly | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492924  | ORPH 
    TestPythonPy3Crossbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492926  | ORPH 
TestPythonPy3Cryptography | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492928  | ORPH 
    TestPythonPy3DBusNext | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492929  | ORPH 
      TestPythonPy3Distro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492930  | ORPH 
      TestPythonPy3Django | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492931  | ORPH 
       TestPythonPy3Flask | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492933  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492935  | ORPH 
         TestPythonPy3Git | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492936  | ORPH 
      TestPythonPy3Gitdb2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492938  | ORPH 
       TestPythonPy3GnuPG | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492939  | ORPH 
     TestPythonPy3Gobject | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492940  | ORPH 
    TestPythonPy3Gpiozero | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492941  | ORPH 
 TestPythonPy3Incremental | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492943  | ORPH 
    TestPythonPy3Iptables | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492944  | ORPH 
    TestPythonPy3Libftdi1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492751  | ORPH 
     TestPythonPy3Passlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492945  | ORPH 
     TestPythonPy3Pexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492946  | ORPH 
      TestPythonPy3Pynacl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492948  | ORPH 
      TestPythonPy3Pytest | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492950  | ORPH 
...PythonPy3PytestAsyncio | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492951  | ORPH 
      TestPythonPy3Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492952  | ORPH 
         TestPythonPy3RSA | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492954  | ORPH 
     TestPythonPy3RpiGpio | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492953  | ORPH 
...thonPy3ServiceIdentity | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492955  | ORPH 
      TestPythonPy3Smmap2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492956  | ORPH 
        TestPythonPy3Treq | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492957  | ORPH 
     TestPythonPy3Twisted | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492958  | ORPH 
       TestPythonPy3Txaio | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492959  | ORPH 
    TestPythonPy3Txtorcon | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492960  | ORPH 
      TestPythonPy3Ubjson | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492961  | ORPH 
...y3UnitTestXmlReporting | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492962  | ORPH 
         TestPythonPybind | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492947  | ORPH 
                TestRedis | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492963  | ORPH 
                TestRelro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492641  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492642  | ORPH 
         TestRootPassword | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492647  | ORPH 
        TestRootfsOverlay | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492648  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492968  | ORPH 
              TestRustBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492969  | ORPH 
                   TestS6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492971  | ORPH 
         TestS6Networking | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492973  | ORPH 
      TestS6PortableUtils | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492974  | ORPH 
                 TestS6Rc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492975  | ORPH 
                  TestSCP | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492669  | ORPH 
     TestSELinuxCustomGit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492650  | ORPH 
  TestSELinuxExtraModules | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492651  | ORPH 
...ELinuxExtraModulesDirs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492652  | ORPH 
       TestSELinuxPackage | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492653  | ORPH 
   TestSELinuxSystemdExt4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492715  | ORPH 
...SELinuxSystemdSquashfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492716  | ORPH 
                 TestSFTP | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492671  | ORPH 
             TestSquashfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492698  | ORPH 
              TestSspNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492644  | ORPH 
            TestSspStrong | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492645  | ORPH 
                 TestSudo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492977  | ORPH 
       TestSysLinuxX86EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492616  | ORPH 
TestSysLinuxX86LegacyBios | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492619  | ORPH 
    TestSysLinuxX86_64EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492621  | ORPH 
...sLinuxX86_64LegacyBios | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492623  | ORPH 
             TestSyslogNg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492978  | ORPH 
                 TestTmux | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492979  | ORPH 
                  TestUbi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492700  | ORPH 
TestUbootOpensslPkgConfig | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492981  | ORPH 
               TestYaffs2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492701  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492982  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3627492983  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
