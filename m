Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF42C27C76
	for <buildroot@archiver.kernel.org>; Wed, 25 Jan 2023 06:46:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBB614182D;
	Wed, 25 Jan 2023 06:46:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBB614182D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bLJhyPfzcjsx; Wed, 25 Jan 2023 06:46:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 537C94182F;
	Wed, 25 Jan 2023 06:46:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 537C94182F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3B7401BF842
 for <buildroot@lists.busybox.net>; Wed, 25 Jan 2023 06:46:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BFC64182F
 for <buildroot@lists.busybox.net>; Wed, 25 Jan 2023 06:46:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BFC64182F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wx8A6zwbofbg for <buildroot@lists.busybox.net>;
 Wed, 25 Jan 2023 06:45:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 730524182D
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 730524182D
 for <buildroot@buildroot.org>; Wed, 25 Jan 2023 06:45:57 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 99AF420002
 for <buildroot@buildroot.org>; Wed, 25 Jan 2023 06:45:53 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 25 Jan 2023 06:45:53 -0000
Message-Id: <20230125064602.0BFC64182F@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1674629153; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sW8FBFGF8WFie5nV0EbNCAWEABw2n15zhm4lWXX5SOo=;
 b=Gqfnhb1pb3RZuK/wAlwKLgsM6VLORzJwsDsGNU6yOwrwzfJMaVOJq/KANSj/1MWKcEgNya
 6XpqcrAhbUGI4FhtFSgtavwPa7AzxlCtAHuJpQNDBQPg1awog3cYoKSA6ad9tjd4YeX1RG
 MZO6DhRvNNZkudTze2BHvA/oB2oEm+mjMKEfzNtbUqYPHmuOnluZ7U45cLPMA13hVdfT8t
 p9zAIt4wm3XOqM5Htr8f8pgHVzLlK9cX5P2PhtFW+YovT+5R+2TwN1Y/9bDKHvSO0n8lFh
 EiGutVYOrWGbp/M+p8adsj8dG3ZoT9nMAQb0MElaJ6ZgW7Ti/U0LzIg2DjmaXQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Gqfnhb1p
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-01-24
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

Autobuild statistics for 2023-01-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  4  |  2  |  0  |  6  |
  2022.11.x  |  0  |  2  |  0  |  2  |
    master   | 110 | 188 |  0  | 298 |

Classification of failures by reason for master
-----------------------------------------------

               host-fwup-1.9.1 | 26
                   bash-5.2.15 | 15
                    fwup-1.9.1 | 14
                    opkg-0.4.5 | 8 
            host-binutils-2.38 | 7 
         host-sentry-cli-2.8.0 | 7 
                     xz-5.2.10 | 6 
  gobject-introspection-1.72.0 | 4 
                host-go-1.19.5 | 4 
                  jack2-1.9.21 | 4 
              libostree-2022.7 | 4 
                    pixz-1.0.7 | 4 
                  xxhash-0.8.1 | 4 
                    bat-0.19.0 | 3 
glibc-2.36-81-g4f4d7a13edfd... | 3 
              libgcrypt-1.10.1 | 3 
               libglib2-2.72.3 | 3 
                    norm-1.5.8 | 3 
           crucible-2022.05.25 | 2 
                 dmalloc-5.6.5 | 2 
                     frr-8.4.2 | 2 
                gerbera-1.10.0 | 2 
               libcap-ng-0.8.3 | 2 
             libgpg-error-1.46 | 2 
          linux-5.10.145-cip17 | 2 
                  ntp-4.2.8p15 | 2 
           python-bcrypt-4.0.1 | 2 
                    4th-3.64.1 | 1 
                  acpid-2.0.34 | 1 
                  bind-9.16.33 | 1 
  binutils-arc-2020.09-release | 1 
                bpftool-v7.1.0 | 1 
                    brltty-6.5 | 1 
                  brotli-1.0.9 | 1 
          cryptodev-linux-1.12 | 1 
             dahdi-linux-3.2.0 | 1 
                    dust-0.8.1 | 1 
                elfutils-0.186 | 1 
                   ethtool-6.1 | 1 
               fftw-quad-3.3.8 | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
           heirloom-mailx-12.5 | 1 
             host-delve-1.20.0 | 1 
         host-gcc-final-11.3.0 | 1 
       host-gcc-initial-11.3.0 | 1 
                       kmod-30 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
      libabseil-cpp-20220623.1 | 1 
                libglvnd-1.4.0 | 1 
                   libnl-3.7.0 | 1 
                   libnss-3.87 | 1 
              libsodium-1.0.18 | 1 
        ltp-testsuite-20220930 | 1 
          lttng-modules-2.13.7 | 1 
               mariadb-10.3.36 | 1 
                  matio-1.5.23 | 1 
                     mtd-2.1.5 | 1 
         mxs-bootlets-10.12.01 | 1 
                 nerdctl-1.0.0 | 1 
                   opensbi-0.9 | 1 
           optee-client-3.19.0 | 1 
                    opus-1.3.1 | 1 
                   perl-5.36.0 | 1 
          powerpc-utils-1.3.10 | 1 
    python-cryptography-39.0.0 | 1 
                  reaver-1.6.6 | 1 
ripgrep-af6b6c543b224d348a8... | 1 
        s6-linux-utils-2.6.0.0 | 1 
              traceroute-2.1.0 | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
               valgrind-3.19.0 | 1 
                 wolfssl-5.5.3 | 1 
    xserver_xorg-server-21.1.6 | 1 
                  zabbix-5.4.9 | 1 
                    zstd-1.5.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |           4th-3.64.1           | NOK | http://autobuild.buildroot.net/results/27315823d885db95de465bd616bb0dddc6a8dffa |     
  mips64el   |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/85f8c416b6a929bd18553d8fb2c2cba54ff335ba | ORPH
  powerpc    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/33ef765c49b2326f43cfe3bd9782aa1e36460c29 | ORPH
   mips64    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/48a3e228b84c98adc53ddb5a9c3a70920a97abcd | ORPH
   mips64    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/631128dbd351278d0086a1c1f949080b51dde0ea | ORPH
   arceb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/502f5e1c463501e683ab839273db33e6e9d48741 | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/b6c28220886deca350970d7388a07fd81f0e9137 | ORPH
    mips     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/1a5575013094cb078d05b085ea2dec7820e4bbe4 | ORPH
    arm      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/3324bc3815a3c2e2f324ee9d83d1fe13e867a222 | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/0cb0d4814b61127c7b14e7e96fa1285792b1e786 | ORPH
   arceb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/05400ad9f596d86819bee7bd5a7b95e3d98f2730 | ORPH
   xtensa    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/260f9ae4ad1155eda0566f15f8077c84c0429f98 | ORPH
 microblaze  |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/69bb62a88e09f394a044855171208754b8776065 | ORPH
   x86_64    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/11300616a956dcd2312fae9d92f97608d729d251 | ORPH
    arc      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/74610d3bd36544204841f717ff142cd3e347c877 | ORPH
    arc      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/b8d339fccfa55ffbff50ca0076c7697f6eedf266 | ORPH
   xtensa    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/a4859b032861aed1d203658ac8ef64cc57144cdb | ORPH
  sparc64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/e0863b5e3ffed1ce4243f047a385dadab4c65231 |     
    mips     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/e516d95de90a1f98d17892e5301db3b2570d7bdc |     
powerpc64le  |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/de42628120d132f0ab5c2edd6f6b72d7397dc810 |     
    sh4a     |          bind-9.16.33          | NOK | http://autobuild.buildroot.net/results/b388476a04be42e00e68d4ea5e99386d7ef70af1 | ORPH
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/8b9fbb4159c076bbe6ace5090869a5ca42ed87bd |     
 aarch64_be  |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.net/results/26241a0e5adf2c48878d74193d0433885ab5de56 |     
    mips     |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/daaa563aa366252557ad795a6cccdd8bd9dcd884 |     
   arceb     |          brotli-1.0.9          | NOK | http://autobuild.buildroot.net/results/fed1d13d4b6ffd00adeb18d528448051d829b6d1 |     
powerpc64le  |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/cd7e10a833457bff9d1c2d0b2870988a62affce2 |     
  aarch64    |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/55ca8750a016bc5b70b622a4c31577d99b623cb3 |     
   mips64    |      cryptodev-linux-1.12      | NOK | http://autobuild.buildroot.net/results/66bc106a149dde506e1f5d5fb8be08b97a1b6c92 | ORPH
  sparc64    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/e883207293f74756c7b6a6c961b8ef412527ee9c |     
  powerpc    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/3293b197cfd74e5b35940391abded502fda5b1ba | ORPH
  powerpc    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/c18385b3a4469b1edbea757000778cd2ef945cd3 | ORPH
  powerpc    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/6fda676902e1e0bfa023f6af5877f2176e68cb42 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/e26de934f0d15137abbf13c8d984e7312e9fd5d8 | ORPH
    arm      |          ethtool-6.1           | NOK | http://autobuild.buildroot.net/results/f5255b85b7ce2e23d7e11549f2efe2ae6ca5a0a8 |     
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/f30522b08ffa6575bf268c8b1fdb5012d78702c0 | ORPH
    arc      |           frr-8.4.2            | NOK | http://autobuild.buildroot.net/results/6b8b1a55176f0358051fb2aeaf18031f9935781e |     
   xtensa    |           frr-8.4.2            | NOK | http://autobuild.buildroot.net/results/1c9367242eede9f19ab55eb4118f81797457baa4 |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/faaaf0ac5217f37bf7ea19ec796cfb68667cdbd4 |     
   mips64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/5924de4dc9d5f5ae5e0844d0c20190bf56fd7a60 |     
   sh4eb     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/85aa9220e5b2eb85afbc4f951a3d9cf6e0f65dfc |     
 aarch64_be  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/6ddbf821185e2b6df28f78d366c6fc0cf9e303cc |     
   mips64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/f68786fc8a10a62cb623a803121b0089290ad345 |     
   nios2     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/bbde89ff6057b98d4d1859927c1a4daf0dc0d918 |     
    or1k     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/0d8ea41ba32b239c059ceb42371004e8991a8e80 |     
   sparc     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/f4c877c78343cdbf9bea803a28c36152f02a2d4b |     
  mips64el   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/24cce1b96dfdac472d3300eb3db31791217fee96 |     
   mips64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/79599d03431436c064e1803a9a25e41524c18a1a |     
   armeb     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/faa3fec04b4457c9cc69bd4b04805d5c02b7049f |     
    or1k     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/6f72fde5c654329f10990d01cbf813100eb2b0d4 |     
   x86_64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/7d8ce9e98de229d853d995863db9e651bbd3c3bc |     
 aarch64_be  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/d3e0723ed87ce51ebd928188613661b4220b4a84 |     
    or1k     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/14d363dfea10967015e25e8d604a4c33fc542479 |     
    arc      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/105c5ef432baa11427f1ff6a84ca84375ec77375 |     
    m68k     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/c6ced4e8ab6e578aeb406f3b38cfd587736004f0 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/91a25911d0c6389f541bf1671c201289418925a5 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/3e1bac84cea9321d76fcf5c63e088e91a421fc25 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/b134a283f852aabbc004972172b8a3e744aa423e |     
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/1e56c4b09f8955a5ad0484705f0eb29ed1762f8a | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/4ddf657083b19d161b9b9a605f52b1f03aeed78c | ORPH
    i686     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/b38d96d6b2be2bccca22b8596a3a3db0fa6a07f3 | ORPH
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/fd2cf0fe85a2cd9fa93e7db914ea1b7cc2957edc | ORPH
   sh4aeb    |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/0cb35f8e6334d1246a7d6605a0ea8b8bb51f96da |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/28fc2c09d9f51373d4a8fc39dc174ca5d8f345eb |     
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/604100cdfc7013181c27abaa7b29aac045916c81 |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/45161ddf0c30904dcb11fc2db4dec1208790f558 |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/d01687a069578e916d95e4dcd07f604d4e51d4e9 |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/3cdc454a6b9885cd5022971eb91352ab82a0c0f3 |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/57b6f86e3cf3f7f4687b41f1a55c356a0f471a53 |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/374d7638d655baea535a7ce0554cfddb7b5bb890 |     
  aarch64    |       host-delve-1.20.0        | NOK | http://autobuild.buildroot.net/results/daca1d1df2603a7b3338e676c5e4b1edb5b5eb57 |     
microblazeel |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/d6df44997ea269bb34c56349e4b1f375a376d971 |     
microblazeel |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/c67371e91093fd0ead5277297ab1e5b9136c59e4 |     
    arc      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/798898374d2474fe5d24c6ed3bcf3dd22d374920 |     
   x86_64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/4a14518ee530ec41991946d57a9a5bcdd0f85c92 |     
 powerpc64   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/4ca26f425c6aaa7a515e87ccfb5e9e9ce82c9429 |     
  aarch64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/a06713dfbbecf5eceacb43ddf4303700bf330e0c |     
  aarch64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/0fa4c00d99699a9c7e673113ea63250abe48bf5d |     
    i586     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/06580fc3236a60eb021ad62629ad5e3107fafd11 |     
 powerpc64   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/a38527018b644991f17697bc1258818e60decad1 |     
 microblaze  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/237a832d1fc7f956e93efe96884b444bfbf54bae |     
powerpc64le  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/e39ed64271a53b0d0b827ff8f69e770c2d4d7491 |     
  mips64el   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/dc161a6a9ca86dcc41695f8fcfc4448e330fc4a6 |     
    arm      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/cd04de02216d1c72b316d1acddfaaeac877273ae |     
powerpc64le  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/c3e39f565bf75060b550169cc23d75cf1c2ace7f |     
   mips64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/ff98df5e262792cabaa0ef3d6488c5d754b638e4 |     
microblazeel |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/a20e5a1f845906a098c31e123787e7e3906a2f13 |     
   sh4aeb    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/356a05e0eff9e10e9455d904363dfe5ad2415e96 |     
powerpc64le  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/804d27175e14c884a9ffa191ccc88c6fc562193e |     
   arceb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/38ec785338025438d1db06a50cc024511b373135 |     
 microblaze  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/b5378369a1cd5a37947840a49ca974109a05aab4 |     
powerpc64le  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/9c39ddd7f9120ac591440edd0dd6777310a6190c |     
  powerpc    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/22d1a8adf6a2209618dbd8bc3ba7dea024c9dd7b |     
    arm      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/34f647413f6af36f83763cc20759ffe3919447fb |     
 aarch64_be  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/58a76b63d584f6217f56d022659b888be0c7550f |     
 microblaze  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/fedd3606cb5bee2026202b9257b8933bb462ecab |     
   x86_64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/fc7b67d251ff558eea130d3ccf14d6cef89b0aa1 |     
    arm      |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/7117cbbd137686c08047463dfcf30abe6e00623d |     
    arm      |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/a44e85d5e49a2e3689af3d478917d4e2ab2d8140 |     
  aarch64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/6c5b5352951103a214eae9ea6a7060efebf8cb42 |     
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/c5c6aca0114dfc5535753e439f31e9790f1f1846 |     
    i686     |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/b96e61eb6d3cf7e7b00eb102415816b8ebb273f5 |     
  mips64el   |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/a66da3744e586850ec23863bfb1de42b8a4761e1 |     
    arc      |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/296bc711ca67152f693b4c0cebcee6b5c274b619 |     
  aarch64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/747338625332e0d2a02c4b4e41eac89791483c88 |     
 powerpc64   |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/34a3d3238cc6bfa84a99fb2cc2081cda2ee31a37 |     
   sh4eb     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/d8f2111bbeeece3f4811c3ec1dba081de6e534b5 |     
   arceb     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/a075756b44999acb7407390277c35540a32c61f5 |     
   nios2     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/d55c535b4f36f8b0d8263730929c7dc09d09abd2 |     
powerpc64le  |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/062020807165947306125dd616bd27aca239e558 |     
   s390x     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/1d214413588721a40738fe10434d249904820fc8 |     
 aarch64_be  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/d93a4d6b766151ffd95e0566367977db7c284f40 |     
  sparc64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/390f3b2ecdfdc0b615b49ba6ec23bd275b54583d |     
powerpc64le  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/e4ebe62acd10da338d4245ebae8087c253f95862 |     
   xtensa    |            kmod-30             | NOK | http://autobuild.buildroot.net/results/a23bf72da73df0a53ca13c0cd60c0a7f79292f6f |     
    i586     | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/6f15b93aace1ba11400968d2e2e1ee94c3c817e7 |     
powerpc64le  |    libabseil-cpp-20220623.1    | NOK | http://autobuild.buildroot.net/results/7c7aabf39260fa76d637869ecec6784561bf9f9b |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/10a40aed2931f6ad71c004343437d5cd3a05d4d3 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/c615d33f854ef0701e4151a2ddc6449a4597936a |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/2c27d85393ad95fc26ca16299ef79509550fb1f2 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/02d0b0580d1520989d3980c36b06616958579e04 | ORPH
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/0b9d732598ac94e781b10119f6899d158e41833c | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/e7a5d58018b200bef52e16ed845f2b78615ffb93 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/4b97335a9f1f0babb39e93ff12ab1c96461f8e47 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/21458d25c1f8413c420e1ee9abe60345ee36959d |     
   mipsel    |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/2845027edcf38c64cc1f0819f27531b67b9221d4 | ORPH
  aarch64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/43975b7f0d798ba256a20459f224aa754386a7a8 | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/ad62613e7f80024ac822a05de3803db9802d82b7 | ORPH
powerpc64le  |          libnl-3.7.0           | NOK | http://autobuild.buildroot.net/results/307719c9e589f9f06b0a420a7fccb277e09e8abc | ORPH
microblazeel |          libnss-3.87           | NOK | http://autobuild.buildroot.net/results/20f4bdd32c415070aabee20093d3bb1e4df1d09a |     
   mipsel    |        libostree-2022.7        | NOK | http://autobuild.buildroot.net/results/283b856d46456cc1d40d8828cda265c563c6aa0b |     
powerpc64le  |        libostree-2022.7        | NOK | http://autobuild.buildroot.net/results/ceb48f0c1c674c766e56493cd6d6908eb5da1a19 |     
   nios2     |        libostree-2022.7        | NOK | http://autobuild.buildroot.net/results/4538342cf21658ea4450ae5a393de3fa9dba415e |     
   nios2     |        libostree-2022.7        | NOK | http://autobuild.buildroot.net/results/1fd73cf626836e748bb6ba6b354f2360d80b66b7 |     
   arceb     |        libsodium-1.0.18        | NOK | http://autobuild.buildroot.net/results/43da742bef4a72193ce8a473bc3e7e52a9ff118f |     
    arc      |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/76243caf637523cbe13a14e12472b8cde3ef05aa | ORPH
   mipsel    |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/1464b454c36873f1f93f02874af650e9ad616d46 | ORPH
    i686     |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/1faea41924b3deb2c9ceaafc222d2fafcc536410 |     
   s390x     |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/f7eae795420932391315aa4088677dbaa91606ba |     
 aarch64_be  |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/1a068a19101dfd976ad9e86af37b934aa97f5e82 | ORPH
   nios2     |          matio-1.5.23          | NOK | http://autobuild.buildroot.net/results/c09a2159cc32494d10abfcfd93f6cf633d3b333a |     
  mips64el   |           mtd-2.1.5            | NOK | http://autobuild.buildroot.net/results/2dfa279c4fb0b441aade620af9e1e43663f342e2 |     
    arm      |     mxs-bootlets-10.12.01      | NOK | http://autobuild.buildroot.net/results/d802b76f9e7b115ba12c53bf885fe0956e3bef15 | ORPH
powerpc64le  |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/a9691f37ef7a9648ca9ebc473815b90780f8e78c |     
  sparc64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/5a60f1d2bf555ee0baf5e2ff5c187122b3a99624 | ORPH
   xtensa    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/77cc3c465d52e1c02d2973d014d886442f38a5da | ORPH
  sparc64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/42a4bec1d57394005f735a6afa75a5d1b8dcde16 | ORPH
    sh4      |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/c7edb8d4eef446aeae415692bf3f4d74d464d388 | ORPH
    sh4      |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/a4c74e75b4e0c31314e8fe69d89fc0f172f6f306 | ORPH
  riscv64    |          opensbi-0.9           | NOK | http://autobuild.buildroot.net/results/f58dc068688ae2fa16540f707322fa7b29999f28 |     
   sh4eb     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/7af8ed43c65516375fe72e37ab4a131b7e5707f3 | ORPH
  mips64el   |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/1eb96d62f2bcd31fc0c575b80e0d7bdab7f9b7c9 | ORPH
  mips64el   |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/2517cd88f9b573dc2e978d75800aacbadea70165 | ORPH
microblazeel |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/4712040a70c500ca93debc4d6d504282fe2085d8 | ORPH
   nios2     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/b58543bdf30846ba8450ea8d43860a961e735341 | ORPH
    or1k     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/9f4085795289ce911102ec3032e46c8627494d61 | ORPH
  powerpc    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/4796c5eec9c474e6fbf355bd42a74c3798177072 | ORPH
    arm      |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/9998a55867a716740571478ee0117caaece784b4 | ORPH
    or1k     |      optee-client-3.19.0       | NOK | http://autobuild.buildroot.net/results/6fdee4173d7800c4f53e610b453bfd2eb269fa42 |     
   armeb     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/a579487b957db252faabc6a073874848b3ada762 | ORPH
    arc      |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/ceca84adf125d97e9b6b6bc7efb81abaf0f75248 |     
   nios2     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/c6fc89f4c58c5f3a2e8b44b8b51522f993bd777d |     
   sparc     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/63607c7d535097231232386cdd7821011d70968a |     
  aarch64    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/49282151f3bac3fa844ecd44ee98d00bb7f39f14 |     
   armeb     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/738b43521260ef77bd50b6c185d2c07d1546f507 |     
  powerpc    |      powerpc-utils-1.3.10      | NOK | http://autobuild.buildroot.net/results/048602359583d5d2dbb3b5511bd40240d8d818fa | ORPH
 powerpc64   |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/cdb6a16c1de9a4c68300c77c74b1b65d0f1ccacd |     
  sparc64    |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/37d034a206a226580d8d324f489a86fdae037271 |     
  sparc64    |   python-cryptography-39.0.0   | NOK | http://autobuild.buildroot.net/results/b48ebabba874adc2928687afc3d3d6f5488c22c3 |     
    arc      |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/fff498cb3f5596544dfdcc133bc62e3b5105ccb9 |     
powerpc64le  | ripgrep-af6b6c543b224d348a8... | NOK | http://autobuild.buildroot.net/results/77ee8681e5d32c3c62dbd1cf508cd6712110039d |     
  mips64el   |     s6-linux-utils-2.6.0.0     | NOK | http://autobuild.buildroot.net/results/9aefa0dd2056a99275582de47fee9ba83c7d9165 |     
    mips     |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/1f974edea42b2dc5aeb56b70b5f6c8cebe95797d |     
  mips64el   | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/1569b6b02a53cb574c71fbd043ff7d0576beae66 | ORPH
  mips64el   |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/0a3fd44ab2f78843b2a29a0edeada8b0b5ed2e5e | ORPH
  mips64el   |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/23258295e48ce83af9a0c19b6cbf5c621f28a885 |     
  sparc64    |   xserver_xorg-server-21.1.6   | NOK | http://autobuild.buildroot.net/results/d361c924b80b87dab06e602de6e0c4f415be6c51 |     
  aarch64    |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/fafa1c41a3a69d0e2554c75188d05400d1f105ef | ORPH
    arm      |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/eff2db637e2d737031209ab7a0606c8316373631 | ORPH
    mips     |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/9220a72e11ff5d385428cbbf416a2df27a60d12d | ORPH
   armeb     |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/c89c3616c07701a9020ec6f436f3911ced697245 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/ee11e7473f43fd469a938dcba2d24ed2c5504139 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/70512e58a1192a2471c856a3fd0bfc596257ce26 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/d40dccf5c21f1bdd50f2931ba23229997737b8d4 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/598a931c0ef7d46ce76c6ed611f02d22adcd3bb9 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/990bfc947e9a8f2ad48a6fb97c3b8c0b312d3ba7 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/0cb281d9a64328deb8a9bd92b53572192825492e | ORPH
 powerpc64   |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/ac7d5024806a6fc06753f975970ca776623b5f27 |     
 microblaze  |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/c7c88640e30faefb5480f2311fd2a5466a94e930 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                       frr-8.1 | 1 
                mono-6.12.0.90 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/224217206cf440269379db2dbea3b62329854d41 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/7eecd03e60e908551a86bb75aaded720e1234665 |     


Classification of failures by reason for 2022.11.x
--------------------------------------------------

google-breakpad-c85eb4a59b6... | 1 
                    volk-2.5.2 | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/8552efb65d97e44a977c0217ab3aff808dd5d87c |     
    arm      |           volk-2.5.2           | NOK | http://autobuild.buildroot.net/results/7931c9c28fe1accc76083520513b739f6a3cbb80 |     


Gitlab CI results for 2023-01-24
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
 TestAarch64Pages64kGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726056  | ORPH 
  TestAarch64Pages64kMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726059  | ORPH 
TestAarch64Pages64kuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726061  | ORPH 
              TestAvocado | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725727  | ORPH 
         TestCheckPackage | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726380  |      
      TestClangCompilerRT | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725733  | ORPH 
           TestCrudiniPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725736  | ORPH 
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725738  | ORPH 
             TestDropbear | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725741  | ORPH 
              TestDtbocfg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725745  | ORPH 
             TestExecline | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725750  | ORPH 
...rch64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726076  | ORPH 
...tlinAarch64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726078  | ORPH 
...arch64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726079  | ORPH 
...otlinAarch64MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726082  | ORPH 
...ch64UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726083  | ORPH 
...linAarch64UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726086  | ORPH 
...h64beGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726088  | ORPH 
...inAarch64beGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726089  | ORPH 
...64beUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726090  | ORPH 
...nAarch64beUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726092  | ORPH 
...750dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726094  | ORPH 
...nArcle750dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726101  | ORPH 
...ehs38GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726102  | ORPH 
...inArclehs38GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726104  | ORPH 
...hs38UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726105  | ORPH 
...nArclehs38UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726106  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726107  | ORPH 
...mebv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726108  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726109  | ORPH 
...rmebv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726110  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726111  | ORPH 
...ebv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726113  | ORPH 
...5eabiGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726115  | ORPH 
...inArmv5eabiGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726116  | ORPH 
...v5eabiMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726117  | ORPH 
...linArmv5eabiMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726118  | ORPH 
...eabiUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726119  | ORPH 
...nArmv5eabiUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726120  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726121  | ORPH 
...Armv6eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726122  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726123  | ORPH 
...nArmv6eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726124  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726125  | ORPH 
...rmv6eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726126  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726127  | ORPH 
...Armv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726129  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726131  | ORPH 
...nArmv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726133  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726136  | ORPH 
...rmv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726138  | ORPH 
...mv7mUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726140  | ORPH 
...tlinArmv7mUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726141  | ORPH 
...8xxxUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726142  | ORPH 
...nM68k68xxxUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726143  | ORPH 
...fireUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726144  | ORPH 
...8kcoldfireUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726145  | ORPH 
...azebeGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726147  | ORPH 
...icroblazebeGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726148  | ORPH 
...lazebeMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726149  | ORPH 
...MicroblazebeMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726150  | ORPH 
...zebeUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726151  | ORPH 
...croblazebeUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726152  | ORPH 
...azeelGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726153  | ORPH 
...icroblazeelGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726154  | ORPH 
...lazeelMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726155  | ORPH 
...MicroblazeelMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726156  | ORPH 
...zeelUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726157  | ORPH 
...croblazeelUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726158  | ORPH 
...ips32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726159  | ORPH 
...otlinMips32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726160  | ORPH 
...Mips32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726161  | ORPH 
...ootlinMips32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726162  | ORPH 
...ps32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726163  | ORPH 
...tlinMips32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726164  | ORPH 
...s32elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726165  | ORPH 
...linMips32elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726166  | ORPH 
...ps32elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726168  | ORPH 
...tlinMips32elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726170  | ORPH 
...32elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726172  | ORPH 
...inMips32elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726176  | ORPH 
...2r5elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726179  | ORPH 
...nMips32r5elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726180  | ORPH 
...32r5elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726183  | ORPH 
...inMips32r5elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726185  | ORPH 
...r5elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726187  | ORPH 
...Mips32r5elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726188  | ORPH 
...2r6elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726190  | ORPH 
...nMips32r6elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726191  | ORPH 
...32r6elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726192  | ORPH 
...inMips32r6elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726193  | ORPH 
...r6elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726194  | ORPH 
...Mips32r6elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726195  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726196  | ORPH 
...Mips64eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726197  | ORPH 
...4eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726198  | ORPH 
...nMips64eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726199  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726200  | ORPH 
...ips64eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726201  | ORPH 
...64n32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726202  | ORPH 
...inMips64n32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726203  | ORPH 
...s64n32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726204  | ORPH 
...linMips64n32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726205  | ORPH 
...4n32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726206  | ORPH 
...nMips64n32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726207  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726209  | ORPH 
...ps64r6eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726210  | ORPH 
...6eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726211  | ORPH 
...ips64r6eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726213  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726214  | ORPH 
...s64r6eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726215  | ORPH 
...Nios2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726217  | ORPH 
...ootlinNios2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726218  | ORPH 
...enriscMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726220  | ORPH 
...tlinOpenriscMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726221  | ORPH 
...riscUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726223  | ORPH 
...inOpenriscUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726224  | ORPH 
...440fpGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726225  | ORPH 
...owerpc440fpGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726226  | ORPH 
...c440fpMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726228  | ORPH 
...Powerpc440fpMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726229  | ORPH 
...40fpUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726230  | ORPH 
...werpc440fpUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726231  | ORPH 
...e5500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726232  | ORPH 
...erpc64e5500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726233  | ORPH 
...e6500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726234  | ORPH 
...erpc64e6500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726235  | ORPH 
...4e6500MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726236  | ORPH 
...werpc64e6500MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726237  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726238  | ORPH 
...c64lepower8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726239  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726241  | ORPH 
...pc64lepower8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726242  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726243  | ORPH 
...rpc64power8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726244  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726245  | ORPH 
...erpc64power8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726246  | ORPH 
...300c3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726247  | ORPH 
...werpce300c3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726248  | ORPH 
...e300c3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726250  | ORPH 
...owerpce300c3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726251  | ORPH 
...00c3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726252  | ORPH 
...erpce300c3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726254  | ORPH 
...500mcGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726257  | ORPH 
...werpce500mcGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726259  | ORPH 
...e500mcMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726262  | ORPH 
...owerpce500mcMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726264  | ORPH 
...00mcUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726266  | ORPH 
...erpce500mcUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726268  | ORPH 
...lp32dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726269  | ORPH 
...lp64dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726270  | ORPH 
...iscv64lp64dGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726271  | ORPH 
...4lp64dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726272  | ORPH 
...Riscv64lp64dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726273  | ORPH 
...p64dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726274  | ORPH 
...scv64lp64dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726275  | ORPH 
...0xz13GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726276  | ORPH 
...linS390xz13GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726277  | ORPH 
...Shsh4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726278  | ORPH 
...ootlinShsh4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726279  | ORPH 
...nShsh4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726280  | ORPH 
...BootlinShsh4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726281  | ORPH 
...hsh4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726282  | ORPH 
...otlinShsh4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726284  | ORPH 
...h4aebGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726285  | ORPH 
...linShsh4aebGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726287  | ORPH 
...sh4aebMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726288  | ORPH 
...tlinShsh4aebMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726290  | ORPH 
...arc64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726292  | ORPH 
...tlinSparc64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726294  | ORPH 
...rcv8UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726297  | ORPH 
...linSparcv8UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726299  | ORPH 
...X8664GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726302  | ORPH 
...ootlinX8664GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726304  | ORPH 
...nX8664MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726308  | ORPH 
...BootlinX8664MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726310  | ORPH 
...8664UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726314  | ORPH 
...otlinX8664UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726316  | ORPH 
...orei7GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726317  | ORPH 
...X8664corei7GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726320  | ORPH 
...corei7MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726322  | ORPH 
...nX8664corei7MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726323  | ORPH 
...rei7UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726326  | ORPH 
...8664corei7UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726327  | ORPH 
...664v2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726328  | ORPH 
...8664v2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726329  | ORPH 
...64v2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726330  | ORPH 
...664v3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726331  | ORPH 
...8664v3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726332  | ORPH 
...64v3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726333  | ORPH 
...664v4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726336  | ORPH 
...8664v4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726338  | ORPH 
...64v4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726342  | ORPH 
...core2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726344  | ORPH 
...linX86core2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726349  | ORPH 
...6core2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726351  | ORPH 
...tlinX86core2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726353  | ORPH 
...ore2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726356  | ORPH 
...inX86core2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726360  | ORPH 
...6i686GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726364  | ORPH 
...tlinX86i686GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726368  | ORPH 
...86i686MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726370  | ORPH 
...otlinX86i686MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726371  | ORPH 
...i686UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726373  | ORPH 
...linX86i686UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726376  | ORPH 
...lx60UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726377  | ORPH 
...Xtensalx60UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726378  | ORPH 
...ToolchainBuildrootMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726063  | ORPH 
...olchainBuildrootuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726064  | ORPH 
...xternalToolchainCCache | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726066  | ORPH 
...ernalToolchainCtngMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726067  | ORPH 
...rnalToolchainLinaroArm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726068  | ORPH 
...ToolchainSourceryArmv4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726071  | ORPH 
...ToolchainSourceryArmv5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726073  | ORPH 
...ToolchainSourceryArmv7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726074  | ORPH 
               TestGdbArc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725753  | ORPH 
        TestGdbFullTarget | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725756  | ORPH 
...GdbHostOnlyAllFeatures | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725758  | ORPH 
   TestGdbHostOnlyDefault | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725761  | ORPH 
        TestGdbserverOnly | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725764  | ORPH 
        TestGetDevelopers | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726382  | ORPH 
              TestGlxinfo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725766  | ORPH 
           TestGst1Python | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725768  | ORPH 
                TestHWLoc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725770  | ORPH 
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725773  | ORPH 
...ystemSystemdRoNetworkd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725713  | ORPH 
...mdRwIfupdownDbusbroker | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725716  | ORPH 
            TestLibshdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725779  | ORPH 
                  TestLua | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725788  | ORPH 
              TestLuaHttp | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725822  | ORPH 
           TestLuaInotify | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725825  | ORPH 
              TestLuaLPeg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725780  | ORPH 
          TestLuaLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725784  | ORPH 
         TestLuaLuaArgon2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725791  | ORPH 
         TestLuaLuaAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725795  | ORPH 
           TestLuaLuaCffi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725799  | ORPH 
        TestLuaLuaCqueues | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725802  | ORPH 
          TestLuaLuaExpat | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725850  | ORPH 
     TestLuaLuaFileSystem | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725853  | ORPH 
             TestLuaLuaGD | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725817  | ORPH 
           TestLuaLuaLdap | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725855  | ORPH 
          TestLuaLuaLyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725833  | ORPH 
          TestLuaLuaPosix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725860  | ORPH 
           TestLuaLuaSDL2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725838  | ORPH 
            TestLuaLuaSec | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725862  | ORPH 
         TestLuaLuaSocket | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725864  | ORPH 
           TestLuaLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725809  | ORPH 
           TestLuaLuaossl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725857  | ORPH 
         TestLuaLuasyslog | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725866  | ORPH 
           TestLuaLuazlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725848  | ORPH 
             TestLuaLunix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725829  | ORPH 
             TestLuaLzlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725872  | ORPH 
             TestLuaRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726028  | ORPH 
              TestLuaUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725845  | ORPH 
               TestLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725789  | ORPH 
           TestLuajitHttp | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725824  | ORPH 
        TestLuajitInotify | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725828  | ORPH 
           TestLuajitLPeg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725783  | ORPH 
       TestLuajitLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725786  | ORPH 
      TestLuajitLuaArgon2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725792  | ORPH 
      TestLuajitLuaAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725797  | ORPH 
     TestLuajitLuaCqueues | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725804  | ORPH 
       TestLuajitLuaExpat | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725852  | ORPH 
  TestLuajitLuaFileSystem | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725854  | ORPH 
          TestLuajitLuaGD | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725820  | ORPH 
        TestLuajitLuaLdap | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725856  | ORPH 
       TestLuajitLuaLyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725836  | ORPH 
       TestLuajitLuaPosix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725861  | ORPH 
        TestLuajitLuaSDL2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725842  | ORPH 
         TestLuajitLuaSec | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725863  | ORPH 
      TestLuajitLuaSocket | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725865  | ORPH 
        TestLuajitLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725813  | ORPH 
        TestLuajitLuaossl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725858  | ORPH 
      TestLuajitLuasyslog | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725867  | ORPH 
        TestLuajitLuazlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725849  | ORPH 
          TestLuajitLunix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725831  | ORPH 
          TestLuajitRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726029  | ORPH 
       TestLuajitTurbolua | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726042  | ORPH 
           TestLuajitUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725846  | ORPH 
                 TestLuvi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725869  | ORPH 
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725870  | ORPH 
               TestMender | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725874  | ORPH 
             TestMsrTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725875  | ORPH 
                 TestNcdu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725878  | ORPH 
              TestNetdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725880  | ORPH 
               TestOctave | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725881  | ORPH 
                  TestOla | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725882  | ORPH 
              TestOpenJdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725885  | ORPH 
         TestOpenSshGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725886  | ORPH 
        TestOpenSshuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725887  | ORPH 
                 TestOpkg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725888  | ORPH 
                 TestPerl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725889  | ORPH 
        TestPerlClassLoad | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725890  | ORPH 
         TestPerlDBDmysql | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725891  | ORPH 
     TestPerlEncodeDetect | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725892  | ORPH 
          TestPerlGDGraph | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725893  | ORPH 
       TestPerlHTMLParser | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725894  | ORPH 
TestPerlIOSocketMulticast | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725895  | ORPH 
      TestPerlIOSocketSSL | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725896  | ORPH 
 TestPerlLWPProtocolhttps | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725899  | ORPH 
         TestPerlMailDKIM | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725903  | ORPH 
              TestPerlX10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725904  | ORPH 
        TestPerlXMLLibXML | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725906  | ORPH 
       TestPerllibwwwperl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725898  | ORPH 
              TestPhpApcu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725907  | ORPH 
            TestPhpLuaLua | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725908  | ORPH 
         TestPhpLuaLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725910  | ORPH 
               TestPhpPam | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725911  | ORPH 
          TestPhpPeclDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725912  | ORPH 
                 TestPixz | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725913  | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725915  | ORPH 
        TestPolkitSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725918  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725919  | ORPH 
        TestProsodyLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725920  | ORPH 
              TestPyNdiff | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726008  | ORPH 
            TestPython3Py | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725921  | ORPH 
         TestPython3PyPyc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725922  | ORPH 
           TestPython3Pyc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725923  | ORPH 
         TestPythonAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725931  | ORPH 
           TestPythonAvro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725936  | ORPH 
       TestPythonPahoMQTT | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725993  | ORPH 
     TestPythonPy3Aexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725926  | ORPH 
        TestPythonPy3Argh | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725929  | ORPH 
       TestPythonPy3Attrs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725930  | ORPH 
    TestPythonPy3Autobahn | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725933  | ORPH 
     TestPythonPy3Automat | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725935  | ORPH 
   TestPythonPy3Bitstring | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725937  | ORPH 
       TestPythonPy3Boto3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725939  | ORPH 
    TestPythonPy3Botocore | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725940  | ORPH 
         TestPythonPy3Can | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725942  | ORPH 
        TestPythonPy3Cbor | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725944  | ORPH 
       TestPythonPy3Click | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725945  | ORPH 
   TestPythonPy3Colorzero | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725946  | ORPH 
  TestPythonPy3Constantly | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725948  | ORPH 
   TestPythonPy3Construct | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725949  | ORPH 
    TestPythonPy3Crossbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725952  | ORPH 
TestPythonPy3Cryptography | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725953  | ORPH 
    TestPythonPy3DBusFast | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725955  | ORPH 
    TestPythonPy3DBusNext | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725957  | ORPH 
  TestPythonPy3Dicttoxml2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725958  | ORPH 
      TestPythonPy3Distro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725959  | ORPH 
      TestPythonPy3Django | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725960  | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725962  | ORPH 
       TestPythonPy3Flask | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725964  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725966  | ORPH 
         TestPythonPy3Git | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725967  | ORPH 
      TestPythonPy3Gitdb2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725969  | ORPH 
       TestPythonPy3GnuPG | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725973  | ORPH 
     TestPythonPy3Gobject | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725976  | ORPH 
    TestPythonPy3Gpiozero | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725980  | ORPH 
 TestPythonPy3Incremental | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725984  | ORPH 
    TestPythonPy3Iptables | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725986  | ORPH 
    TestPythonPy3Jmespath | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725988  | ORPH 
    TestPythonPy3Libftdi1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725775  | ORPH 
       TestPythonPy3Munch | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725991  | ORPH 
     TestPythonPy3Passlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725998  | ORPH 
     TestPythonPy3Pexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725999  | ORPH 
      TestPythonPy3PyAlsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726002  | ORPH 
      TestPythonPy3Pynacl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726007  | ORPH 
      TestPythonPy3Pytest | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726009  | ORPH 
...PythonPy3PytestAsyncio | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726010  | ORPH 
      TestPythonPy3Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726011  | ORPH 
      TestPythonPy3Qrcode | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726012  | ORPH 
         TestPythonPy3RSA | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726014  | ORPH 
     TestPythonPy3RpiGpio | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726013  | ORPH 
  TestPythonPy3S3transfer | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726016  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726017  | ORPH 
...thonPy3ServiceIdentity | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726018  | ORPH 
      TestPythonPy3Smmap2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726019  | ORPH 
        TestPythonPy3Treq | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726020  | ORPH 
     TestPythonPy3Twisted | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726021  | ORPH 
       TestPythonPy3Txaio | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726022  | ORPH 
    TestPythonPy3Txtorcon | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726024  | ORPH 
      TestPythonPy3Ubjson | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726025  | ORPH 
...y3UnitTestXmlReporting | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726026  | ORPH 
       TestPythonPy3rtoml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726015  | ORPH 
         TestPythonPybind | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726005  | ORPH 
                TestRedis | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726027  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726030  | ORPH 
              TestRustBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726031  | ORPH 
                   TestS6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726032  | ORPH 
         TestS6Networking | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726034  | ORPH 
      TestS6PortableUtils | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726035  | ORPH 
                 TestS6Rc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726036  | ORPH 
 TestSquashfsMaxBlocksize | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642725693  | ORPH 
                 TestSudo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726037  | ORPH 
             TestSyslogNg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726038  | ORPH 
                 TestTmux | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726040  | ORPH 
TestUbootOpensslPkgConfig | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726044  | ORPH 
                   TestZ3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726046  | ORPH 
             TestZerofree | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726049  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726051  | ORPH 
              TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726053  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3642726054  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
