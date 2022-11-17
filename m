Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D6AC4332F
	for <buildroot@archiver.kernel.org>; Thu, 17 Nov 2022 07:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BBE141830;
	Thu, 17 Nov 2022 07:42:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BBE141830
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sCu6n8igj8rQ; Thu, 17 Nov 2022 07:42:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EF1241878;
	Thu, 17 Nov 2022 07:42:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EF1241878
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 92D101BF239
 for <buildroot@lists.busybox.net>; Thu, 17 Nov 2022 07:42:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 670C64016B
 for <buildroot@lists.busybox.net>; Thu, 17 Nov 2022 07:42:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 670C64016B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZOUbRD-jPwbl for <buildroot@lists.busybox.net>;
 Thu, 17 Nov 2022 07:42:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C1C740135
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C1C740135
 for <buildroot@buildroot.org>; Thu, 17 Nov 2022 07:42:28 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1E76F240009
 for <buildroot@buildroot.org>; Thu, 17 Nov 2022 07:42:26 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 17 Nov 2022 07:42:26 -0000
Message-Id: <20221117074232.670C64016B@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1668670946; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Hsh5qQDURTOp8jwXIq28oH956paRt7YnHIrwfxQmmYs=;
 b=XHddetjRZN7cF0WjmXzmplCPaIyfc2Mq6wJ++lITtqlFqyh26D92wOyARncTjTVctMxqvZ
 3BmVsu+NAfsIDYofzKO+vI8tCz072+1YfSjOLBsmaEGuYrmVQSy0oeFtXdkUywmINlK+NB
 X4JV8/n9CFlF2TSc4Kh4+XFhuui05vZ/i8ysHhEgp8VTzsG5+OaWhXTx/ajLmyRwnXANOb
 7wnVNY9WW8cZ2larJ+RqwpT8AnMjVr05l5NDOfxjjTRvHlii14oRb6YLuQnxcwxXY3gQDm
 hcRVT4RdF4J3a2K7Lgllx6AP0CtcVOuAmzyjCUmwyIEmY/eklqu4JLgJOM+8+g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XHddetjR
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-11-16
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

Autobuild statistics for 2022-11-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  7  |  3  |  0  | 10  |
  2022.08.x  | 15  | 15  |  0  | 30  |
    master   | 166 | 165 |  2  | 333 |
     next    | 44  | 104 |  0  | 148 |

Classification of failures by reason for master
-----------------------------------------------

                   libnss-3.84 | 15
glibc-2.36-66-ga1dc0be03c9d... | 13
            host-binutils-2.38 | 10
                host-go-1.19.3 | 8 
  gobject-introspection-1.72.0 | 7 
                      xz-5.2.7 | 6 
              host-rust-1.64.0 | 5 
                 dash-0.5.11.5 | 4 
                gerbera-1.10.0 | 4 
             libgpg-error-1.45 | 4 
             lirc-tools-0.10.2 | 4 
                     efivar-38 | 3 
              host-pahole-1.24 | 3 
               libglib2-2.72.3 | 3 
                   linux-6.0.1 | 3 
                linuxptp-3.1.1 | 3 
           python-numpy-1.23.4 | 3 
        edk2-edk2-stable202102 | 2 
         gobject-introspection | 2 
                    libndp-1.8 | 2 
          linux-5.10.145-cip17 | 2 
                    musl-1.2.3 | 2 
            ocf-linux-20171122 | 2 
              open62541-v1.3.3 | 2 
rtl8723ds-76146e85847beb242... | 2 
                tealdeer-1.6.1 | 2 
                       unknown | 2 
                 wavemon-0.9.4 | 2 
                xenomai-3.0.10 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
                    bat-0.19.0 | 1 
  binutils-arc-2020.09-release | 1 
            compiler-rt-11.1.0 | 1 
          cryptodev-linux-1.12 | 1 
                 dmalloc-5.6.5 | 1 
                  exempi-2.6.1 | 1 
                     exim-4.96 | 1 
               fftw-quad-3.3.8 | 1 
             fontconfig-2.13.1 | 1 
       freeradius-client-1.1.7 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/romfs/romfs.mk:32: /home... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                gnu-efi-3.0.15 | 1 
gummiboot-2bcd919c681c952eb... | 1 
              host-delve-1.8.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
            igh-ethercat-1.5.2 | 1 
                   json-c-0.16 | 1 
               libcap-ng-0.8.3 | 1 
           libfreeimage-3.18.0 | 1 
              libgcrypt-1.10.1 | 1 
                  libsepol-3.3 | 1 
              libuhttpd-3.14.1 | 1 
                     lxc-5.0.1 | 1 
         mxs-bootlets-10.12.01 | 1 
                  nginx-1.20.1 | 1 
                  ntp-4.2.8p15 | 1 
                    opus-1.3.1 | 1 
                proftpd-1.3.6e | 1 
                      rauc-1.8 | 1 
                   rsync-3.2.7 | 1 
        s6-linux-utils-2.6.0.0 | 1 
                   sdl2-2.24.1 | 1 
                 sudo-1.9.11p2 | 1 
              traceroute-2.1.0 | 1 
           uboot-tools-2021.07 | 1 
                 uclibc-1.0.42 | 1 
wilc-driver-linux4microchip... | 1 
                 zlib-ng-2.0.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/3a55a7087564aa91c1b1a7e3f4265545f659a0a7 |     
  mips64el   | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/3d145c9df4fe55f646bb2e20fb7cc27fc1cc5be6 |     
   armeb     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/cb850d3e7fb46a70eff018e5d40e2fbc4366ecb4 |     
   arceb     |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/c07f987131f1d2b72fea802d673e97339d506c44 |     
   armeb     |       compiler-rt-11.1.0       | NOK | http://autobuild.buildroot.net/results/15e21c02cbe98dfecdc2a15361633fa5d214c1da |     
  mips64el   |      cryptodev-linux-1.12      | NOK | http://autobuild.buildroot.net/results/421c21f0a8081d8696ae17b42af85b77524fe349 | ORPH
   s390x     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/422dd6138543ee133d2664772857c20aed279be5 | ORPH
    sh4      |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/0c9087720b138dcd34bcd673151e26c1102ce12d | ORPH
 powerpc64   |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/dd0d9a1580ff4e9fd7e9264132fdc9342f56d2ac | ORPH
 microblaze  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/332fc75c7d0e54e238395486dd24221a7fe723ec | ORPH
    i686     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/be27ffce9885943141221318eccaf64add093816 | ORPH
    i686     |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/28625eaf3c75efe8200dd0b40ede9a81126a2bfe |     
   x86_64    |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/d664143f6f5755101d6ce9f3e5be05ccf52dcdfa |     
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/5159baec314508b75824e20e675d1b9830bab9ae |     
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/8e597fd16bf93e989ef811512e15f5d2212a209a |     
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/7ab14d2ed0d2a28edab68f41dbf91fd953fe7980 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/f3eb9d453ed42b4c04311219f8ffaba08620739e |     
    arm      |           exim-4.96            | NOK | http://autobuild.buildroot.net/results/b8db1a8018b4bbed4cae019d076121717bc2d4dd |     
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/87298e0740966ab854ed45254e34036ab4816553 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/7dc617ed23912479e383099e65d72262fc53ab5b | ORPH
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/ef502a4c44f8da848bbc8322163a08d6d8abf9e7 |     
 aarch64_be  | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/45dbc3dcc88b2f6e0ebe57d50d8808330a022de5 |     
  sparc64    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/d3f2c28b7847222d6048d17093f6d661e2f47963 |     
   s390x     | fs/romfs/romfs.mk:32: /home... | NOK | http://autobuild.buildroot.net/results/a8eabf19263c2864bc6ca9be6fa0d8e4401187c7 |     
    or1k     | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/9df33e8d006b4e4e7021297a6997f64405b8ea21 |     
  aarch64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/42dde3fcbbcdf4a4c3feda0be119fae0fcd828d7 |     
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/446c403f7f1174f774dd612f66d1ec9d4c5765ff |     
  riscv64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/24c39a4e358fec47ecc1c8360ddceed9a3913caf |     
  aarch64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/b5c60bab60f893359fd597b875cf9e7673887e98 |     
   s390x     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/403800902302b7bca1e7f42a7bc015b94a6a08a8 |     
 aarch64_be  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/93901d6bd13622d83e55dd27c9de32a5f42bc6d4 |     
powerpc64le  | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/7b5d3cebb05b61a29b2706ecbd2604a1b4c799c0 |     
   sh4aeb    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/4068a680b9b38b820b1a374994b4014ae04d324a |     
    mips     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/d630e770083b70db94ae72e6c5117f4f8e16f11f |     
   sh4eb     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/ade62afdf01a8033b8de191276c4cbeed87bddd0 |     
    mips     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/099ff8e00cd9ab5794e8aa5566bfaf28b4be54e6 |     
 microblaze  | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/03229cf85c3d57cc54c5b8480e4e1065dad69e3d |     
   arceb     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/babcae3d38c2600e13aeacd260a68dd2ed2c4053 |     
powerpc64le  | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/cc13166efd5fc612b86a824e9ae6f2a32f9ba257 |     
   mipsel    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/7571515e43d8b8aca6506f8ccb1d8d1f6113549c |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/d855368ba58030c1a7ce50150abc491a5f8866a3 |     
   sh4eb     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/7df2d0648dd666dd07845614b34f59d6afba96c1 |     
    mips     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/da056c118383b622153403ef353d8b7ec80812b8 |     
   mipsel    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/182959928afae0158ed0eb6b4c0779138c83d787 |     
  mips64el   |         gnu-efi-3.0.15         | NOK | http://autobuild.buildroot.net/results/7dec1cba96d1b05513790793e897bc3016305cef |     
   armeb     |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/a66d4db1957736b6617a0e714dce3a9c1b54f3df |     
   armeb     |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/35cd372a74a633d03f1bdba4ab6523762fe8422f |     
   mipsel    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/de53720747d809b146dabe2db5b5854acc9e701f | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/db99e8991557ce099a9d5d99ac93aeab978b1a20 | ORPH
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/da945cb9c3b42528c29971635852e51059952d17 | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/4239cf093da9e2d042bf0a73c66075a73dcb5771 | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/09df7168bec039f2139e8793eacedddbf4a8270e | ORPH
   mipsel    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/39c50f238a3f9e9b4079169aef8354a2cffcdecb | ORPH
 powerpc64   |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/1ea580995278f35274055d751f71198415631ecf | ORPH
    i686     | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/43acf1d87dbdf49d1d087476baedd83cb2f5cb0e |     
    mips     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/346999d15783af58bafef1511b956f55ed550a98 |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a44503d364a29d9b882b613e2e10b10548bfb33b |     
    or1k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/00c8cab27d919dbbce6d0020f866a865aa93b0e6 |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a74cdc2dadc5bec965099c273ef5123758dcdfd3 |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/20e6729b9cee7fb0eb95f11ea5ff59b184e17e35 |     
    m68k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/79a540b61c7233afce0656b93cf5e6814d431e20 |     
    mips     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/cc08a8f66b9bcca3870eb35ec03fed0e45e37917 |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/bb1d993ce106c954ebfd71b72b1081bc2da5eaf0 |     
    i686     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/9e91ca4ec212deeb9c78967a8157ce2d7d0122d3 |     
    m68k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/b4d87613ca51d4d37a94f7e64c1468ff147c66af |     
   mips64    |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/57465226ed47e6e7bd6fa2a0cabff31859344d30 |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/9aa6b43424e3c33b4e4347ce61c30878beb7120f | ORPH
  aarch64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/0cf1e16ebbfdb55599368b1b03c1e48d9a7073d6 |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/d4b067d4c15a2bc4f78007415462b03bd1b45b2b |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/79a9487dc97985a992caabbcec9c757a84113753 |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/23590cf4eb0d206a997ed4cc7470e5b4cee220b5 |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/02a48e7ffc4898d9b9aee25a6aa1a83ab91ee906 |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/594c83999f12f20bbcb77c9dae8e2e5dc5a4fe8c |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/6da2f2fe58bc1004413ad263178e16bd6ffae6a7 |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/8d911888035f20288e1e84650a5f949d17314b42 |     
   xtensa    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/5a1089b59bd8569f2a4f1bc3eed376da6e5d2d7e |     
  aarch64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/ae106c34713c8b8c1976ff426459ffb14fc1da7c |     
 aarch64_be  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/40a5a1db4729f4587807dfb27376858057044aa4 |     
powerpc64le  |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/9d9ef1f2b3865e60a709a8d733ae89dd64d1895c |     
   mipsel    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/c94dd925abd54361fb634d25339e715acc6fcb4a |     
  sparc64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/01eeb0758b0b3a6fa3469841b7ebca7870385bbb |     
   armeb     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/3663817e785ca6d7e182ba75ca1bd68c7e9183c2 |     
    i686     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/5cd64f4a384cf958a857b627370fa8f5ef2a4e83 |     
  sparc64    |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/07b7475d780c067d99ee5618a5fd2bb024a5b4e7 |     
    or1k     |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/6a6592931a025ae49e717c710b466da4b9590b09 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/fb05ac0cd8972a7c74e2312eab20e71cd8b3a81e |     
    or1k     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/0ec680966480a392729aed9c1105ed32bb1a5bbc |     
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/dac36a739c0245cf461aa28138024ca742956381 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/970260055520778a671891d28156a9de7dedb00a |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/5694faeb6a208f0bb6bedc1647e3c1b5282bd14b |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/ee0679deb90cc250437d0b59f1b81e7a4efce3aa |     
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/e9ab7dd0c474df642caf9a38d8442ee34f9bf5a2 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/1a4c5e5378ac07eebaeb70aabb9101cbde22855f | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/cc5480df6b3fde5b19ef80aa9073fe95809fb498 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/bfac15e4924ecac602567f8ece47997463b42c03 | ORPH
  riscv64    |           libndp-1.8           | NOK | http://autobuild.buildroot.net/results/76b5cbf498a73cd1dedfd533bfee317a896480e1 |     
  riscv64    |           libndp-1.8           | NOK | http://autobuild.buildroot.net/results/d6fe6d64df00915d7e6a0d882eeaf93efb5667bc |     
   x86_64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/6281cc9b94014cc8db8e7235b1bc02724786cb70 |     
   sh4aeb    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/e96f2dac738b099cd3e1aaf002a4332e11e73bcf |     
   nios2     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/de8e47c2f78cc7de5acde1b45376c358af1daa22 |     
    m68k     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/de3bb99b91e0c979bf9522c88901f5a1ac6b6b43 |     
   s390x     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/f56c19f9f0f3582e7ca99f8cb59a621a1837a513 |     
 microblaze  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/f3d4bc88b2549f88d74a778d5653449d546aa261 |     
   s390x     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/b1efda8923f6e09aba26d915fb2ab5d06deb4411 |     
 microblaze  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/fb33f9a8d561459f4316d8683c6ea25079fc7dd3 |     
 powerpc64   |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/aeb0d528577b148a71b99e299454b8b196b74e5f |     
    sh4a     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/c577b23eb635ccccf7303f14333ccdd89395525c |     
    arm      |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/0cc7e0afa1b2c28045d76ceeb9f282c4d1578fdd |     
    i686     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/810aa8861abbc2cf13d085e712a2fc5181fe6088 |     
 aarch64_be  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/0e8063c742e6f61ef18f681b7bfe9edac3f72e10 |     
   sh4eb     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/fda1dcb116051b3c0dc28371da98e800bf6f83d3 |     
    or1k     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/51c5f1d185812708ec89e3ce33d0a2442fbd59e2 |     
   mips64    |          libsepol-3.3          | NOK | http://autobuild.buildroot.net/results/df7e29abb3f8a31466fd3122d18bf926b49a13d9 |     
  mips64el   |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/7746eb85fc7a586262eecff73fa08588c8416e12 |     
   nios2     |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/2ace9005fe11779fb20e36351d28b0f7d190a714 | ORPH
    or1k     |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/a93d4ba60e52740df10fb204e7fdee9f6294c14f | ORPH
    m68k     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/e8b77f79c72a7ec30f7b3fab59be2f4567905339 | ORPH
   nios2     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/651a3fe2718c83a121b427ccfa8d3f9b23a322e1 | ORPH
  mips64el   |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/fdf81161b4e809561a48b5c83bddf5dd7b60c1c3 | ORPH
   arceb     |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/0f30401ec2f8a1bd1eeccc121011c25b5505c815 |     
   mipsel    |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/cc2a16521e7c23dddefd290187b735a201234097 |     
powerpc64le  |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/0ad77299f600866df889e1269868617c6f0d75ac |     
 aarch64_be  |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/845e965360ab1b8219fd0241ba4c457e7e39a2c8 | ORPH
microblazeel |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/2ec72e1b9dd9b5c907f9a57b187385485be9acd0 | ORPH
  sparc64    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/acc899bb92b8232de085aa42083898962ecb8547 | ORPH
    arm      |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/393263430b2b9c6b02f656ee49fd4382292bb496 | ORPH
 aarch64_be  |           lxc-5.0.1            | NOK | http://autobuild.buildroot.net/results/abbb73cb130d3f8f75c7f8d62dbf3dbb90ebde4e |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/df78f6aadbeaa086fb27e831c74cace4b38861e9 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/4783d9a7a28e988cc7a7be05674319effda57940 |     
    arm      |     mxs-bootlets-10.12.01      | NOK | http://autobuild.buildroot.net/results/af99de5a5fcecd72e5d2907edb8e41098dedddc7 | ORPH
    arc      |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/1fd2a89eb032c3a840e067c61cc3a0a20d5ae185 |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/ee3078218eebc6fc9f226f6a55f259a81dadc2b5 | ORPH
    or1k     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/f7b1075a5d0ae2c9fb85af30b8ce922a4b205a59 | ORPH
   s390x     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/1e1a3f0f0d4c3c9c0643f68d5788e8ff504cfaee | ORPH
   xtensa    |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/3894f1db36aeed3506851a6eab64be6675950ff7 | ORPH
   xtensa    |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/bad5aabf8eb3269665db30377edf840e66e33e0d | ORPH
   armeb     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/c6570bbe1c92166c9ea8abc02dfa2e192eefd407 | ORPH
   sparc     |         proftpd-1.3.6e         | NOK | http://autobuild.buildroot.net/results/3a6ccdd31afc515a356f9f5f28a1e4d946cc9b1d |     
   mipsel    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/cbd4108b2d6387186c04ee1a4408fdf029c14542 |     
  aarch64    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/45c6144fbef73736b199b7683f8b5998c9726bf2 |     
   x86_64    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/453264f7ab7daf916294f9cd18e1d4fe2f05071a |     
    or1k     |            rauc-1.8            | NOK | http://autobuild.buildroot.net/results/db4bd6f42415d65f794e13ead995cbe881877933 |     
   x86_64    |          rsync-3.2.7           | NOK | http://autobuild.buildroot.net/results/069da8e585da2e51bfd4f475cc12b9a134954b08 |     
  riscv32    | rtl8723ds-76146e85847beb242... | NOK | http://autobuild.buildroot.net/results/2c9367141fb18a7ae0dc12a3d283420413fef155 |     
microblazeel | rtl8723ds-76146e85847beb242... | NOK | http://autobuild.buildroot.net/results/e6c636348702a0a70f6964aec6c05a4b774c3e64 |     
    mips     |     s6-linux-utils-2.6.0.0     | NOK | http://autobuild.buildroot.net/results/66f7c33f58d032783f940beca79269a043221bf0 |     
    arm      |          sdl2-2.24.1           | NOK | http://autobuild.buildroot.net/results/95694a2815993dfe24f5bb186da4ed3cacde4cf7 |     
   sparc     |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/13af6cce6502628da3eb5451bc1bb43975ae8e40 | ORPH
 powerpc64   |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/49085f54b3642c15f5366817905f6dff9058540a |     
   s390x     |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/3fdcdae5f5fde3f6be006dfd4dd6bd34348c10f3 |     
  mips64el   |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/e348fa13a0c6f01640e5810c281c4fbaeb2683d5 |     
  aarch64    |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/5cffe97f1c0f0132f3a90a4d655367b54f11841f |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/0aa1de5d67340cebbbee3e90929a9e0250fd2285 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/4bd7f98da8ee9a66e1064de5ceb9a8a6a9301002 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/0467f2f18e375a26b14bd89f5d82bb6b9e8aa480 |     
  aarch64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/e4f72fd7b0453b273e6be727f4950dd2fb80cb7e | ORPH
   x86_64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/45c891c6851615d5955b14a606590e1f54237e1e | ORPH
microblazeel | wilc-driver-linux4microchip... | NOK | http://autobuild.buildroot.net/results/b17c80f305e90a134b2171feff4c3487d9140c79 |     
    sh4a     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/ff67e70355c1f0c09da47055bbac92608fb4d137 |     
    arm      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/d76bae397130db6dc7d54c5719980a42540d4f2f |     
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/886a208568ee69d6ae6513a2a0d9629df917e255 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/8142f991a63448b0a19ae92a6b02f15b710e9b7b | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/d86225baf64e503d1919eb765c300b4f6bb93c84 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/12410d7bccc23b0179f2f2200c6d0190adf1f355 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/d1875285d3770e65ef82f5677fe9dfe19a1017cd | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/d267e4906218fa842ad335a0c4d125748d0ac6d4 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/d22dee1bf6a9456288a276d60898a078e149a552 | ORPH


Classification of failures by reason for next
---------------------------------------------

                   aubio-0.4.9 | 12
                   libnss-3.84 | 8 
         s6-linux-init-1.0.6.3 | 6 
glibc-2.36-66-ga1dc0be03c9d... | 5 
                   linux-6.0.1 | 5 
                 dash-0.5.11.5 | 4 
                gerbera-1.10.0 | 3 
  gobject-introspection-1.72.0 | 3 
            host-binutils-2.38 | 3 
          imagemagick-7.1.0-51 | 3 
                  jack2-1.9.21 | 3 
                       unknown | 3 
                elfutils-0.186 | 2 
                     ace-7.0.6 | 1 
                  botan-2.19.2 | 1 
                      crun-1.5 | 1 
                  ffmpeg-4.4.3 | 1 
             fontconfig-2.13.1 | 1 
                     frr-8.3.1 | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                 fwts-22.09.00 | 1 
                  gensio-2.5.5 | 1 
             gnuradio-3.10.4.0 | 1 
gummiboot-2bcd919c681c952eb... | 1 
            host-binutils-2.39 | 1 
         host-gcc-final-11.3.0 | 1 
                host-go-1.19.3 | 1 
              host-rust-1.65.0 | 1 
host-spirv-llvm-translator-... | 1 
        kf5-kcoreaddons-5.91.0 | 1 
               libcap-ng-0.8.3 | 1 
               libdcadec-0.2.0 | 1 
              libgcrypt-1.10.1 | 1 
                libkcapi-1.4.0 | 1 
                libmad-0.15.1b | 1 
                   libnl-3.7.0 | 1 
           libsoundtouch-2.3.1 | 1 
                linuxptp-3.1.1 | 1 
                 mesa3d-22.2.2 | 1 
                numactl-2.0.16 | 1 
            ocf-linux-20171122 | 1 
              open62541-v1.3.3 | 1 
                 openal-1.22.0 | 1 
               openpgm-5-3-128 | 1 
              procps-ng-3.3.17 | 1 
                 protobuf-21.8 | 1 
           proxychains-ng-4.16 | 1 
            python-bunch-1.0.1 | 1 
            quickjs-2021-03-27 | 1 
rtl8189es-39c17661136da48f8... | 1 
                tealdeer-1.6.1 | 1 
                 uclibc-1.0.42 | 1 
               valgrind-3.19.0 | 1 
                wtfutil-0.41.0 | 1 
                      xz-5.2.7 | 1 
                  zabbix-5.4.9 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/f95cc2b8fe0224b48fa60b0e4fbcad3af5a4a433 |     
   x86_64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/22c464a5b2ba104497072ba65c94b6a7a47909c0 |     
   sh4aeb    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/12e34c2e0e1381c330bfefbfe443a914a14e286d |     
    mips     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/5ed9fac60456866ea185b1345bce6dc0c292d4a3 |     
    sh4a     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/1f20d589fbfd80721bba115b5ddb89a21cf59371 |     
   nios2     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/85800fc7462f373fe63062f23cb69174adb5fe51 |     
    i586     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/05808e51eb0fefbc0bc3c1ba9cf4dfe8515ce6bc |     
    arm      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/d4bae272e75f64c0535e65264495b1c8f30f8bdc |     
 aarch64_be  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/193ce428e4ef38d81fea949c17b4f3a4715a9978 |     
   mipsel    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/28d0b0c5d2d58bf288f7f3b545fcbe100590b065 |     
  mips64el   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/5bb4a7fcdaf8624b92f7e1b59221ca8ec3d1018e |     
  sparc64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/cd81b01987182a029bb1d886a574e171872a56b3 |     
powerpc64le  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/b7868a0ec9e75da14e42629e7495846314ea029a |     
   x86_64    |          botan-2.19.2          | NOK | http://autobuild.buildroot.net/results/d0a192da2f2bd502b34edee3636692f25a6d51a3 | ORPH
  riscv64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/0e789f9f05a21ac951f5fa440b9c14286d5ad38d |     
    sh4      |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/17ff4704279d9f60ee537f6e1fe050c037e67b04 | ORPH
    i686     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/25e63b6d9e1ab9adeafc32e2b523defccc5fc9b7 | ORPH
   sh4aeb    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/3cb5133616e4f0fd6bc3a10b66cb16a2d36e482e | ORPH
    arc      |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/c4d1347bbdd8f61d084cb1ed8880b05d563886bb | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/0ad4aad8905e1053c1cd0df4f44e67d613de92b7 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/94cbbe1380d1f5cbc1617f663eeb34f9c47ebe9e | ORPH
   mips64    |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/cc34e5bc0b28738ea12dd1763738046bc9129f6b |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/98caf4f38b84a39c27034d3c9894771042002d66 | ORPH
   xtensa    |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/68c20aec06f8bba9a22454a2af151331ec7db4e2 |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/badc1913b46852d95c604262210e74698df063bf |     
    i686     |         fwts-22.09.00          | NOK | http://autobuild.buildroot.net/results/30db1af9232c3056ff181250f72de7fa217d913d |     
powerpc64le  |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/a73a5415c0797974e5cdedb429dcb3e3e8a9ddcd |     
microblazeel |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/e50897e40090ec444a8772592f193966d22ed7af |     
powerpc64le  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/f328881bae87150beaf0cb5e2f3b6e6f85042ce0 |     
    i586     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/86b121caa4311e0048f6bbe3f7ba5db54025618e |     
   mipsel    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/124f1c09cdad5c36589d09877fc1bd557553a041 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/11850d98fa38f9ede3076e1f9ffee4906a518cb5 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/9b7ff6df33a1caf6a02fccfef0cee2aaa740e826 |     
   arceb     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/95868270e5ac5fce74a96610dfe452a9d380ca50 |     
   mipsel    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/09c3c0bf7c635338d655e9c43fbe97d95d95e8d1 |     
    arm      |       gnuradio-3.10.4.0        | NOK | http://autobuild.buildroot.net/results/d1ed2f9bca29e80e0dc168abf07dabca1389f0df |     
 powerpc64   |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/30b76d52a31c51f5cd7b8275cbbc346de24d0bdd | ORPH
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/1dccb0d17d25653bd4a8faf854df16df1750adfb | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/6aa355606efcafc04621cc6b13c4a5c0a05dcb1d | ORPH
    i686     | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/5dc273c6e7fbd5d76ed996a7f49fbc29235a2fcd |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/757935efe90b0b41787f011ae720f35bf0ee5508 |     
powerpc64le  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/775bfe5e6865a18d984d57758c5bf9424a7894b3 |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/4bbdc53e6f1ef17456e7ae32e4012ed55458c5bb |     
   mips64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/2336048c691eafd4c0679a480a0e51316a673a93 |     
microblazeel |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/e2de649e8a1dde7453ef817e8ae1cf4e4891745f |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/38770189bdb88d0b130f2e3cbc70085108fd27a2 |     
   s390x     |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/e2c590ec2c9704ed76f12a3859e06a3072410fe5 |     
   armeb     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/6b11378a477f14a0eeb5df28ce3c949e1203eb34 | ORPH
   s390x     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/85bc896d96969f7997372054077a37cc18cd50c1 | ORPH
   mips64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/ceae8e2a0eeed23bb60ac08d507a957dc54b656d | ORPH
   s390x     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/5c3cd619bf894d794368bb256566afa734c2a1ae | ORPH
   xtensa    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/3b773285d4deb31a3b03c388a33f01f4c7c9908b |     
   nios2     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/a0bebce95f5eb26356d205561aa6d6a88394a267 |     
   mipsel    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/13f2773322149a954b7e0a5f8a4dda54cf0d508c |     
  mips64el   |     kf5-kcoreaddons-5.91.0     | NOK | http://autobuild.buildroot.net/results/585f35fe4622b6ae9923a604fbd2b5efd3472625 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/3ea53b3d60f02b3f709904892f0a0b25da221859 |     
    arm      |        libdcadec-0.2.0         | NOK | http://autobuild.buildroot.net/results/b6ea26f5e44e4b5693b996404ef199991abb7c90 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/e70d7e3292e72329f2e136ce5fc315f9d674270b | ORPH
   xtensa    |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/4627b0168d0438c68e1bcfd257d8c5df6575307c |     
   armeb     |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/dd3bbb31151e920c2e8806690c06fb93848ca183 | ORPH
  aarch64    |          libnl-3.7.0           | NOK | http://autobuild.buildroot.net/results/b53ee7eac77e3df9c704f515ff32a364541699ac | ORPH
powerpc64le  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/d97ad699d0ee5c877ef26ea169767614a7e0076f |     
    or1k     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/04261cd1be5ab248ac5a53f79e60a72e370b1843 |     
   mipsel    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/df8dbdcc6524e47062a8073338673c71b4f6b456 |     
   s390x     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/0bf279a2fb7b21b40c6741659fba9db44b31ae71 |     
   arceb     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/1af739b049a02afcd68dcdf06a92c2081005d989 |     
   sparc     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/4550d6d9c9f6150730c10a0273e176bc3523fe2f |     
   sparc     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/05acad2de797688d817ec27df6e6e478c3051668 |     
 aarch64_be  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/817fed6ce9c78321acb430c6b8f62fbd2aa53df7 |     
  riscv64    |      libsoundtouch-2.3.1       | NOK | http://autobuild.buildroot.net/results/bf44a8acac161941a66bbd713cb85dece7c43932 |     
   mips64    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/a5a9389fcffa554313696d54d0b792c10e4b2061 | ORPH
  powerpc    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/f988fe3dfa784120844fcede6f6acec02be43928 | ORPH
   s390x     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/451bb27ac6899e43353aeada32089f5c2cea1fcc | ORPH
    mips     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/3c9902d807c789f4b2cb5ec29fbc29686743b268 | ORPH
   mipsel    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/2b901fdc8b1c01f63762acc4c36d77595f4d9377 | ORPH
microblazeel |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/4ebc161e3a5a8570f764d7584b34261e8418b5ae |     
  powerpc    |         mesa3d-22.2.2          | NOK | http://autobuild.buildroot.net/results/2d6e2ca800d7f257b06c02b1e04f3910eb793f06 |     
   sparc     |         numactl-2.0.16         | NOK | http://autobuild.buildroot.net/results/8375d1bb87e7a4fdc5759e3c2b3f5bc4d126fd5b |     
 aarch64_be  |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/c95854659103fb82db465faa115fa227d4f1d60d | ORPH
   s390x     |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/50ac1860b1c0637a13e941b47b7f815b9336fd59 | ORPH
  mips64el   |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/2462e4872d370207057ebe1bb66f5854a43d50d5 |     
   mips64    |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/24e3bf71b3760c57a6e57ebd184151ed13e175b7 |     
  sparc64    |        procps-ng-3.3.17        | NOK | http://autobuild.buildroot.net/results/5637f438960515f90f836e2e5427624fd310517b | ORPH
    arc      |         protobuf-21.8          | NOK | http://autobuild.buildroot.net/results/00f70f1e4279a229eda1cf4e7150d80e2b75d96b |     
  aarch64    |      proxychains-ng-4.16       | NOK | http://autobuild.buildroot.net/results/be126d4ee9781093d494714ace911ba6324fed01 | ORPH
   sparc     |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/9c6554b9e54382972c035dc878e0266f6f86ac1b |     
    sh4a     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/deb47c95e2f4d6d3ba0ced4fdbab45a1b6a0aa0c |     
  sparc64    | rtl8189es-39c17661136da48f8... | NOK | http://autobuild.buildroot.net/results/ba7ef413874138a572bb285e0096d75e0cd346a4 |     
   sparc     |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/e0fb2f0cb251ad1f561cc9c8310079c85e1261ff |     
    mips     |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/2cb655c632a78bdf1e348df01777769abb525b73 |     
 powerpc64   |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/568f73c35e10208d3f006198b8e5ba3292cf00af |     
   nios2     |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/f605876b75e02eebd0bb6f5130128996c911d73b |     
 powerpc64   |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/ba18bad85fbffc940d958fc2af2bc3e5066bb070 |     
 powerpc64   |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/1a6d78f8636392caa9dc279cc16834c79bc14356 |     
  sparc64    |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/9149e03619a687ee88e018756004d392bd67937f |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/7922d51e13931c3edfc7959e9093e32d528a58c2 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/427788aefc0f2f3a7385601ee04d2a9b86e8652a |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/c8758ee686e1488dfc91c9129190ba80cc1011b2 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/ade5e57b740a00bff5727ec07fba9e3aa5f10879 |     
  mips64el   |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/e8200837c0a3617be78e31afed35b18f8279294a | ORPH
   x86_64    |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/3d20a30888ba11519ea107ea7f67bd2eb43aa8aa |     
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/a8d4ac25cd4acd0a36d25f0a2ef34677b87a3678 | ORPH
    i686     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/03395b7a0db14ab869c82dd6cd01df14fa098445 |     
  sparc64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/529554e5af0cfc78adae77ece73177fa6323f1a0 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

             containerd-1.5.13 | 1 
                       frr-8.1 | 1 
            igd2-for-linux-2.1 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |       containerd-1.5.13        | NOK | http://autobuild.buildroot.net/results/a13f4bcca440aebf2e7e21000dbc2ffcdf741c22 |     
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/340469f665f893e9283695d1fdaa541ad4964073 |     
    arm      |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/5220e6a4c3baab2682797e0c36b0f1909742fc60 |     


Classification of failures by reason for 2022.08.x
--------------------------------------------------

                elfutils-0.186 | 2 
                gerbera-1.10.0 | 2 
              alsa-lib-1.2.7.2 | 1 
                     exim-4.96 | 1 
                host-go-1.18.8 | 1 
host-spirv-llvm-translator-... | 1 
               libdeflate-1.12 | 1 
               libglib2-2.72.3 | 1 
              open62541-v1.3.2 | 1 
            python-ujson-5.2.0 | 1 
                  scrypt-1.3.1 | 1 
              strongswan-5.9.8 | 1 
                 uclibc-1.0.42 | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |        alsa-lib-1.2.7.2        | NOK | http://autobuild.buildroot.net/results/f71a1ef8938faa1f11f1b83a39b673619deeb4bb |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/1d61c7bf45a36f212ca5eb1f7c956b0117e38ea7 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/89ff84523169b0ba846526633456ecdc9553d072 | ORPH
   armeb     |           exim-4.96            | NOK | http://autobuild.buildroot.net/results/dff2c32bc74fcb16ecc681f405a6a9c0e70c0199 |     
    arc      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/d90e2988e9ccc2a147d2899d8eb140fdefa5b2cf |     
  mips64el   |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/b70b2133b617155504776dae923f899f10d5733e |     
powerpc64le  |         host-go-1.18.8         | NOK | http://autobuild.buildroot.net/results/04f2a7865c44bf66704572d160cb0435176c4864 |     
  aarch64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/6485a9306bbe4c6e6321362ed4cc0f6ee55740bc | ORPH
  aarch64    |        libdeflate-1.12         | NOK | http://autobuild.buildroot.net/results/a1f0a4fdff88be67a2ee9df0a7c46ac9748e9a4f |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/191dc1318ad0609e4bea4de5a05f56e07d346c43 |     
   armeb     |        open62541-v1.3.2        | NOK | http://autobuild.buildroot.net/results/f81a1283f2a5ee7fcaaea3dbc8c7ec76c947b5c7 | ORPH
 microblaze  |       python-ujson-5.2.0       | NOK | http://autobuild.buildroot.net/results/ac15064a8001890bee214d3011a4d52c80597623 |     
   arceb     |          scrypt-1.3.1          | NOK | http://autobuild.buildroot.net/results/74fa58e01b0306a6a88f0feceac5eb14a88e2154 |     
    arm      |        strongswan-5.9.8        | NOK | http://autobuild.buildroot.net/results/c5102233caedef4e34711d8c09e7d96c55c96bf6 |     
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/b37aaa38117a60a8d671912a2338305c3a9d1576 |     



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

