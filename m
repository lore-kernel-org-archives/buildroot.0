Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4336DC4332F
	for <buildroot@archiver.kernel.org>; Tue,  8 Nov 2022 07:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE1DE410D4;
	Tue,  8 Nov 2022 07:39:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE1DE410D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z8H3Wj9E82XX; Tue,  8 Nov 2022 07:39:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D4CD409C3;
	Tue,  8 Nov 2022 07:39:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D4CD409C3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4FE9F1BF35E
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 07:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37B5C606FF
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 07:39:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37B5C606FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ViwJusAnAvyc for <buildroot@lists.busybox.net>;
 Tue,  8 Nov 2022 07:39:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47F0D606E6
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 47F0D606E6
 for <buildroot@buildroot.org>; Tue,  8 Nov 2022 07:39:42 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 344C710000A
 for <buildroot@buildroot.org>; Tue,  8 Nov 2022 07:39:39 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 08 Nov 2022 07:39:38 -0000
Message-Id: <20221108073945.37B5C606FF@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1667893179; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bxwzQZZTa9Ilc1it35QfElUSZSdlseFqqHTUeOYYT0M=;
 b=aCWSDUS+hc9SGmF3GNPRoZlCJ4+DLvuLh8eAzGzUFoBYTecmkNMYufThsovEZ83yAPO47+
 BLz/t5/hZnzacDIXrVf6BCqzeuqNtptAM1T6EmBqCgvv7HW3DOv2GaJXpDYqBGBryoGmf9
 cdG70Ypnq4chHBVRR7UHj2zFfTZIA+f7DwAhS1hLbJQBMUqtVFlX1ZOM9UgBbJFfNGCyvf
 Yz9WkuMUW39nXSXN/GOvxoQlTZ0cp7Lo+3UR3zqoMjFlobK54vDMNpNlRFHCwLTOwyhMvL
 o1laDIU7u3zN/r/uLBUdslxg3BXtv8/pxJMOjzjYYcy+naNTtQLHnX/GwmLdEg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aCWSDUS+
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-11-07
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

Autobuild statistics for 2022-11-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  7  |  1  |  0  |  8  |
  2022.08.x  |  6  |  9  |  0  | 15  |
    master   | 125 | 148 |  0  | 273 |
     next    | 46  | 81  |  2  | 129 |

Classification of failures by reason for master
-----------------------------------------------

                   libnss-3.84 | 18
         s6-linux-init-1.0.6.3 | 11
          imagemagick-7.1.0-51 | 8 
glibc-2.36-66-ga1dc0be03c9d... | 6 
                libkcapi-1.4.0 | 6 
                      xz-5.2.7 | 6 
  gobject-introspection-1.72.0 | 4 
                       unknown | 4 
                 dash-0.5.11.5 | 3 
                elfutils-0.186 | 3 
                gerbera-1.10.0 | 3 
            host-binutils-2.39 | 3 
              host-pahole-1.24 | 3 
             libgpg-error-1.45 | 3 
          linux-5.10.145-cip17 | 3 
                linuxptp-3.1.1 | 3 
             lirc-tools-0.10.2 | 3 
                     lxc-5.0.1 | 3 
              alsa-utils-1.2.8 | 2 
                 augeas-1.12.0 | 2 
                     frr-8.3.1 | 2 
google-breakpad-c85eb4a59b6... | 2 
            host-binutils-2.38 | 2 
                   linux-6.0.1 | 2 
rtl8821au-4235b0ec7d7220a63... | 2 
                    brltty-6.5 | 1 
                  check-0.15.2 | 1 
                      crun-1.5 | 1 
             ctorrent-dnh3.3.2 | 1 
                 dc3dd-7.2.641 | 1 
        edk2-edk2-stable202102 | 1 
                     efivar-38 | 1 
                  exempi-2.6.1 | 1 
               fftw-quad-3.3.8 | 1 
                flannel-0.14.0 | 1 
             fontconfig-2.13.1 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
host-gdb-arc-2020.09-releas... | 1 
                host-go-1.19.3 | 1 
            igh-ethercat-1.5.2 | 1 
               ipmitool-1_8_19 | 1 
                jemalloc-5.3.0 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
                  matio-1.5.23 | 1 
              mdio-tools-1.2.0 | 1 
              memcached-1.6.16 | 1 
                 mesa3d-22.2.2 | 1 
             netsniff-ng-0.6.8 | 1 
              open62541-v1.3.3 | 1 
                 openal-1.22.0 | 1 
                   opensbi-0.9 | 1 
                    opus-1.3.1 | 1 
                   perl-5.34.1 | 1 
                    php-8.1.12 | 1 
                ramspeed-2.6.0 | 1 
        s6-linux-utils-2.6.0.0 | 1 
                tealdeer-1.6.1 | 1 
           uboot-tools-2021.07 | 1 
               valgrind-3.19.0 | 1 
                 wolfssl-5.5.3 | 1 
               xapp_xdm-1.1.13 | 1 
               xfsprogs-5.14.2 | 1 
                    zeek-4.1.1 | 1 
                 zlib-ng-2.0.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        alsa-utils-1.2.8        | NOK | http://autobuild.buildroot.net/results/63253c79791cd936055bc5e837ccfc229243488a |     
   nios2     |        alsa-utils-1.2.8        | NOK | http://autobuild.buildroot.net/results/9b2046bb63acc090b8c92adf9a62cfa6df798940 |     
  riscv64    |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/92feaec34c343303a5b365cfca25b369fbab49ce | ORPH
  riscv64    |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/21f980eaaa17bc74288d2ee73f29bbff6923e831 | ORPH
    mips     |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/ab9f4d7cc2a00e46bbefc5887cc1fd8f02480a06 |     
 aarch64_be  |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/9bfeb345393484080677b4b74404c7c312f84eb9 | ORPH
    arc      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/63319c2abe5d627738561657ed439d1938e3f00f |     
  riscv64    |       ctorrent-dnh3.3.2        | NOK | http://autobuild.buildroot.net/results/7aadd9d6e9e92dfbe0ddf55f9294eeed93e974e9 |     
    sh4a     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/2567726ad42d43e4b184df9e2d158fcfd1d3fca2 | ORPH
powerpc64le  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/2f95a6111b33eadbac745458349f0197745198bd | ORPH
   sh4aeb    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/f8875ca8842f123a01d6fb7cfdc9f815ff4df408 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/0991a7b8c13acf68a1cf821ccba4c4d301b14fd8 | ORPH
  aarch64    |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/45a638a7cb9e89048914553cb84e554996bff870 |     
    i686     |           efivar-38            | NOK | http://autobuild.buildroot.net/results/7769f6341793234f79a3ff78477e5fdea1c155f0 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/f57071ff39cce6afe392eb2b596a57c30c539414 | ORPH
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/4c591beef6e87fa478a9a4a1cee41b7aee8281c5 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/3af5f09c2f8a3207623f7dc675dd08633c12cbcc | ORPH
  powerpc    |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/ccaa403014841e0c40a2251cb6aa6124512c9014 |     
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/154aee6fc9b3845067a854425e0bdc3aa9e72d20 | ORPH
    arm      |         flannel-0.14.0         | NOK | http://autobuild.buildroot.net/results/9fdb7de2e3218d4584c827934cbaa9e5d40f0313 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/a9109f4d9e1343952e7eb7a22594616d35edcda9 | ORPH
    arc      |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/71f505b63503cc109717d757d0197bad78f7e597 |     
    arc      |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/62c1a216f6aa194c8eca662812370f243565dfb7 |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/f4b4369ca02fba517ac94089fb458a79ce3abf32 |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/bda26b5ec37db020961810b2481f8ab1a4739109 |     
   mips64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/d62deb3c54b0256e23a447f17df47a05236f15c1 |     
microblazeel |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/83cd15f4a67dbba4be81ff5cead77e938f8bd53f |     
  riscv64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/b2d265041600e43247b5802950ae581f230ba6d0 |     
   x86_64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/3465bc5cb99221a60dfb6f6eb74ff927c27ca3b0 |     
microblazeel | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/9dfc4ec97a5a58c57ef4b63263a132ef6625928c |     
    sh4      | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/1c489b6edcc9a554c9a4142c2075f76cba8aa3b8 |     
 powerpc64   | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/9c602ab8d77ac665d0ec5e0361df4f0aa94e9762 |     
    or1k     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/b95532ac318d6c732fed8ad5474287c1eeddc08e |     
   mipsel    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/0c093ab6c848203e504e516fa4c152512ee10087 |     
microblazeel | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/67a9a99901629926680e1c8220ef79729a036e66 |     
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/66aaada851b665a58ddc0d9233f067fea330a5d6 | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/276e8dfa38f8813656fc6c8ca611a0c37712ae5f | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/4f0c1105df2bfad98352633bc75f21cbe4afc2ca | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/c50ea135a908e5fbf52407926c4e7f111772f1f0 | ORPH
    arm      | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/0b70d0267b5bd84107da6907da32bbebc5435e9f |     
    mips     | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/aacfbf99ab8b1e78371fb6e178647745b0e770d6 |     
   xtensa    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ee54765914f435aea9b4daf7dc9a071eb9e3b3d1 |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/96409c767fd3c7593a16cda6552604e91ae071fa |     
 powerpc64   |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/8ea06372fe8f61749595dbd435c16a5c8788f74b |     
 powerpc64   |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/64e64df5f14bc2ec84d10328fbe28c0099f52f76 |     
  riscv32    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/d90ebfafb17f54a840018981590083176c4d298d |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/5813d68a15dbcad879c4d7f6276e3cbe57fd4f5c | ORPH
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/ea4fef0f3e040dc12aaf310d006e750198dc36d1 |     
microblazeel |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/dfa6f76a8228f5851f13497636b38a27218fa5af |     
  aarch64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/7c0e8f8eb0c119d6d2442ef780b95065002a91e9 |     
    or1k     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/7ccfc5db3792aa3d8c07ede2ac972dc31869c96f |     
   sparc     |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/96213b72697b817fed814664046ff222b7986c61 |     
  sparc64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/7106fe2c1e897298e36c12a023a7565ceacf8858 | ORPH
  sparc64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/bfd22eb213c7a29a0c2e7265c6457541a3332f29 | ORPH
    or1k     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/ff899e789009e9be9d74e442c62f752a99f1f29d | ORPH
  aarch64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/2783b524d348269afd23c9db1da857755aed1132 | ORPH
powerpc64le  |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/b0b0f730f57ab84e062849a8ad1136693d1c216e | ORPH
   s390x     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/c25051cef5600dc145d13f295b7bfccafa033276 | ORPH
   x86_64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/8219c19dbae9e7f0b53097fe3e8daa0ede47bb51 | ORPH
    or1k     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/67fb5126295503a6473ee50e36be4c99bca53abf | ORPH
   nios2     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/ecf72cd1ebd53f3b3b10f0a24082f9c0ab5d4d12 |     
    sh4a     |         jemalloc-5.3.0         | NOK | http://autobuild.buildroot.net/results/e959df43b322740094ff02570f9b4911ddd9843d |     
   x86_64    | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/2f4dfb551b25a29d3a463e09d57089a93e7a5592 |     
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/1438372118c57645ab3f4a2c63019dce0a9c077b | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/5a171e17719398a37a42eb93dfa20cd2ab3733b7 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/44bf20e676df030b1a1d52420e458a966b7cfee3 | ORPH
  powerpc    |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/30b031c00e54fa036f0d96167dbb21dbb77c6a5e |     
    i586     |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/2fbb9e792a5685ae868126d85faab4f9d1ab7ed4 |     
  powerpc    |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/90062b170ab2ff9a7272e5ff76808303b0e6568c |     
    or1k     |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/e1222108ce718382d9bc6c91ecf1df26cb80bd3f |     
    or1k     |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/c789d43e71e6075e297bef58d888228a89055bbc |     
   armeb     |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/483a3b4ef2e215c479d46f0331f335285435b609 |     
 aarch64_be  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/0f0c3bc8c98b220e7cd42c00082160f095a08599 |     
   mipsel    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/ced55867f4b17188dba3e11fde10ffc1a298ea16 |     
powerpc64le  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/fb753a0992b9f759f6ce10b2701f3372a1ff0138 |     
powerpc64le  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/8c210b8253af1f355b26e4d92844fa73797595bd |     
   nios2     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/84b9860d2628430ca783a4d9639532d2eafa84c7 |     
   sparc     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/276123d2b02bc5f2920cb5b88eba46af5ceedf47 |     
   mips64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/4580e4e9fa8e1b16bbb92524e1d34d39daf2e431 |     
powerpc64le  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/e740bec6fdf58f7657bb166b93d34305368b24d4 |     
    mips     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/6ebebb438959565096cd9c8b08e55f7cf7eac1a2 |     
   mips64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/857fa297da3a031e27d9dbd90a9d23a6203b0d37 |     
    mips     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/710bfbe00378f2b7d0fc8d1fad1362d876328c39 |     
  aarch64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/c9b271b34f3c8038eb1459dc4dd806da49af4f53 |     
   arceb     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/d35b68cdefe8a462a2a08ac790727057ad635664 |     
   mips64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/5fe93a8a09406dc8f325c9247f8f43e162a7199b |     
    or1k     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/02e05c95721e1175b377bc67f10d09868ba15f7a |     
    or1k     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/83b6e5f5ae06fa47527e347cbd8ba6490b6c9c01 |     
 powerpc64   |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/60662ed5a29dbfa1a527394cdb682e847ff71693 |     
   mipsel    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/19bde44904d85837f402d35c44f900d7ad3bacdf |     
   mipsel    |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/2cf2727eca3e164082e9c51ba682c2a10c0d9270 | ORPH
   nios2     |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/1239507ed892dacfe793801e125dbf70fb38e355 | ORPH
    i586     |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/a1618853604ecf3d230586e82698ded4ff8015de | ORPH
 powerpc64   |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/4b843e19c2302c6499f6a39bdfdbb4fcbd13b62b | ORPH
    or1k     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/de4238e8340be3a186c5d67a342b2c19a94dc375 | ORPH
   armeb     |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/acfa4e450be2d7d254e84e324826904fb588e2fb |     
   sparc     |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/34802349f285db98c9b47371d81c2e63e8845eb7 |     
 powerpc64   |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/3b30409c26244b90ea5b57e61c6f54f38ea3b02c |     
  riscv64    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/5145bc4743642086c55d35e44c4e7daf3bee422e | ORPH
 powerpc64   |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/13282fc899f6cbc1e75b137a79a5983fcac3d7b8 | ORPH
   mipsel    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/e14770196510a2913c4d67464af01574851698a3 | ORPH
  powerpc    |           lxc-5.0.1            | NOK | http://autobuild.buildroot.net/results/ef384d087ab7d2da2c37664f2d8f9b075a853a1f |     
   mips64    |           lxc-5.0.1            | NOK | http://autobuild.buildroot.net/results/044f95b98b0c4ebf07410a11cdcedb24842912c0 |     
   x86_64    |           lxc-5.0.1            | NOK | http://autobuild.buildroot.net/results/785b09ab291ae8de1cbf972228a943723b8ad3f5 |     
   nios2     |          matio-1.5.23          | NOK | http://autobuild.buildroot.net/results/2e0852d8594f317a476fc328400d89f743541bdb |     
    mips     |        mdio-tools-1.2.0        | NOK | http://autobuild.buildroot.net/results/c9a507757ce3a01cd08d596cb519ee9f19caf77c |     
    m68k     |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/76a2e843703bcae1ca47c4b223675f25599fd819 | ORPH
    i686     |         mesa3d-22.2.2          | NOK | http://autobuild.buildroot.net/results/b75c54d8616969750916ff12e0f67739080df368 |     
   nios2     |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/fa27f1aab6aaf4df44d0f94475258612fcd06da1 |     
   armeb     |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/51a03fe86cc4d39a9e51a88e966fe4527698999a | ORPH
    mips     |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/5044cd029d19e9cd9468605e13777359bda100a8 |     
  riscv32    |          opensbi-0.9           | NOK | http://autobuild.buildroot.net/results/d9af9b4bc1193aa05474fdb25c92395b20008cfe |     
   armeb     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/58ad938361e3ab2caf35f9e74aa5fb54931e7118 | ORPH
 aarch64_be  |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/e7d9be0f889819c08458a762cce4d58b3663b734 |     
  aarch64    |           php-8.1.12           | NOK | http://autobuild.buildroot.net/results/56f28675fd7fa2a7bd26c6b145cfd9b54d08e95a |     
   sh4eb     |         ramspeed-2.6.0         | NOK | http://autobuild.buildroot.net/results/962a8926b8973a4290e87c521cffe81a37bee483 | ORPH
    i586     | rtl8821au-4235b0ec7d7220a63... | NOK | http://autobuild.buildroot.net/results/520d4e39f60ea7408b505e4a90942e90169afb28 |     
  aarch64    | rtl8821au-4235b0ec7d7220a63... | NOK | http://autobuild.buildroot.net/results/18e155f6348ee635ac3360047d0656274640bcfe |     
  riscv32    |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/a4ca908d55b6e666ec33f30a452797cdb013c6fe |     
   mipsel    |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/5b7a0b406baed9de8ad14c6091c5d24505afc5b8 |     
 powerpc64   |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/00fb8f10402a8fa6cff673be64ad47dd974e21dd |     
   nios2     |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/fbff7ad967de100d76b5b0250fc55b509e84a225 |     
   mipsel    |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/0da04eb44d559a2f201e1bac557ca27645c3891b |     
powerpc64le  |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/28c926bd61b112f22a053acfd62bdcb65c94a4cf |     
   nios2     |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/4184eb8d696d6c456904072907a883b4ca987853 |     
 powerpc64   |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/c91d4704e87baaac2b24014f11299898934a5d1a |     
    or1k     |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/5da5c76d159dfdc35cc050da09e360ef850e7b76 |     
   mips64    |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/2396410ab59bb46edcdbc6120c3040b6a86ccdb4 |     
  mips64el   |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/abb96ec2ee1d8526902807dce27e6983b0ee72d2 |     
    arm      |     s6-linux-utils-2.6.0.0     | NOK | http://autobuild.buildroot.net/results/48894799d3e3e8c793c60730255236d73fb13d51 |     
  sparc64    |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/c4648fcaaab0aff6330b7a4424c26392cb6a258f |     
   x86_64    |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/0142453d5dac91915086a9e5f302e322931922fb |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/87f75c3672b936bd194d43e04f926d017e18b1d8 |     
   sh4eb     |            unknown             | NOK | http://autobuild.buildroot.net/results/974be5ad949c5be0ff01c4edba8b375a7d532c32 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/faec303977cae9a5a8b71ffb3ac869ff9f5b0078 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/84effb696c59c3af8d65e94be718a22bc554d107 |     
    mips     |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/ed063ac9a431826a92be859ea89618a79410159a | ORPH
    mips     |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/d7d8a540ae22cdb5f3dc1d6dc530919546e6a38f |     
  sparc64    |        xapp_xdm-1.1.13         | NOK | http://autobuild.buildroot.net/results/4e94670ea2042c5054d481274d89d0e5154a96ad |     
   armeb     |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/8a48e478f2ff12eac995a18c69cdb14c18ab6b3b | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/080f0017e758220bc660c60d8ce8b3bc830bd2e3 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/31ed3f056453ea0f67e2e79eb3a2d479836576c0 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/1e6c46d670d4390dcb1fea35a146a0ec3dda183a | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/237905e0c10dd9d7a9fa63c054e9f47f7bdccbf5 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/78eb4ae87663e8784d358cddcdda270306a7e77a | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/3c5134cfcf22e87fbb4c3f7ecbbbdb97c8167ae6 | ORPH
microblazeel |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/71064e0c04d170e941a1e189d7f0928e71c86723 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/a86adfab288f39c014c5ca55bd605c8ef4f0f06d | ORPH


Classification of failures by reason for next
---------------------------------------------

                   libnss-3.84 | 8 
            host-binutils-2.38 | 7 
                   aubio-0.4.9 | 6 
glibc-2.36-66-ga1dc0be03c9d... | 5 
          imagemagick-7.1.0-51 | 5 
                      crun-1.5 | 3 
            python-bunch-1.0.1 | 3 
         s6-linux-init-1.0.6.3 | 3 
              alsa-utils-1.2.8 | 2 
               apcupsd-3.14.14 | 2 
                  gensio-2.5.5 | 2 
         gobject-introspection | 2 
              host-rust-1.65.0 | 2 
              libgcrypt-1.10.1 | 2 
                   linux-6.0.1 | 2 
                   bdwgc-8.2.2 | 1 
                  botan-2.19.2 | 1 
                    brltty-6.5 | 1 
                 dash-0.5.11.5 | 1 
fs/cramfs/cramfs.mk:46: /tm... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
              fstrcmp-0.7.D001 | 1 
                 fwts-22.09.00 | 1 
                gerbera-1.10.0 | 1 
            host-binutils-2.39 | 1 
              host-pahole-1.24 | 1 
                  jack2-1.9.21 | 1 
                  kexec-2.0.25 | 1 
                libdnet-1.16.1 | 1 
                libmad-0.15.1b | 1 
      linux-5.10.145-cip17-rt7 | 1 
                    lxc-4.0.12 | 1 
              mosquitto-2.0.15 | 1 
         mxs-bootlets-10.12.01 | 1 
                    norm-1.5.8 | 1 
                   perl-5.34.1 | 1 
          perl-net-ssleay-1.85 | 1 
              procps-ng-3.3.17 | 1 
                    proj-8.1.1 | 1 
           python-numpy-1.23.4 | 1 
qt5base-2ffb7ad8a1079a0444b... | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        alsa-utils-1.2.8        | NOK | http://autobuild.buildroot.net/results/4511dcf093a2878a3bf7538c371cb8772ce37e01 |     
    arm      |        alsa-utils-1.2.8        | NOK | http://autobuild.buildroot.net/results/039463b9f6bad32d9a0a30003b55aa38458cc2d3 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/ef1bd7545b3ad9fbaf9e44d389be5f3edde5f999 |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/a0dad7450860b7ec05a127cfd21b644562bf19c1 |     
  aarch64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/56e14e285cac549ae9b44f32d5a91b82ccfb52c2 |     
  sparc64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/ae1160067a717e6d85a1e5881294e7eb952b530c |     
   mips64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/de67778f8a39771bece71b65dc1627f3df3f7fec |     
   mipsel    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/db9bbee5477db5a610740f2d08b2f3db6843cd49 |     
   mipsel    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/b0f66e20f99561eaaaecc39665116b3afb58e1ab |     
  aarch64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/213cafc1f186e5fd72dcebba79cf938e09eda353 |     
  riscv64    |          bdwgc-8.2.2           | NOK | http://autobuild.buildroot.net/results/aff76040520e1740ecb5c5f429a1f6ab3d2e7141 |     
    i686     |          botan-2.19.2          | NOK | http://autobuild.buildroot.net/results/1390110342cf086f9eea35dbf69f655eb95ea4f1 | ORPH
microblazeel |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/72146ef1e8a0d391181336279687f4d0bf5053d5 |     
   mips64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/2ae8c50513d36ac09955c93fe5eda22be54c0455 |     
  mips64el   |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/6b1eacd5c6c3b3047cb2931bd04d4fc96887c3db |     
   arceb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/04220fb83fca63a44ba8933348946342a039ea55 |     
    arc      |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/7a0786b2bf6e6de52497f2d302e2d8a23c448275 | ORPH
   x86_64    | fs/cramfs/cramfs.mk:46: /tm... | NOK | http://autobuild.buildroot.net/results/22926d77120d6aa7138069313d8cf8c533ab9ce4 |     
   armeb     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/37ced645a3dcca76d46d64a6141749f1a65d3253 |     
   s390x     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/d6e09649d41aea19162688ca0a5b823d9e552e2b |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/bea564c2453094344f4b577734f79a7cefe564c5 |     
   armeb     |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/b2b12ae8132af0fbee8d75454096f25636d97b9b |     
  aarch64    |         fwts-22.09.00          | NOK | http://autobuild.buildroot.net/results/a3705f9e711baa33fe9e270a90f4818725e67c89 |     
 powerpc64   |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/ed284edb5c678acf92621e8560f0eb2efb32f92b |     
   arceb     |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/1ba73b07f84c2977f5f19eed376083be01f8f208 |     
    arm      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/3da65db1f1aae2cb90df8314f2dde5537767ffec |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/ddcc3f2fea06faa37d6219d7053c195db01f24e6 |     
microblazeel | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/b6575711563947280a28c0d51f78c7dfb54e671c |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/14886c1a6499e4f680b1711413a91f1e328d6a5d |     
 microblaze  | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/2574b659d2cda251f71826b1bd8a15505c413254 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/ba83e4c0f4f69ea2275dc51e2dd0c8ab5c82c009 |     
   armeb     |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/2e5c4c6653623d08fc06ab4dfdde9656a5a93e9b |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/99f95cfc7506eec58066a28ee6e1fed2dec88739 |     
  riscv32    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/1cf3771fc6486ad83d49f01f42c66604f50366a0 |     
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a98a0adc75c00f4d5c56bfdd58effcfa05cd24da |     
powerpc64le  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/c79761a3a76feb43fc905722efa62758682704c4 |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/5b6ea49dea36d13b1e3cf67eae343745af18bf5c |     
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/8f65406e1b977cdf5733e78a25e2fd6a80c5ce89 |     
   nios2     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/0432a4c5942c6dcb5d1986e8c6521c7df6a46d65 |     
   xtensa    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e3c4fd4dc6df6c0faed56711e641addf86d78574 |     
    i686     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/74802c74afb8146a7ed9ce01dd196fe5c0ed9548 |     
    sh4      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/da8c4ded669bc38ae2b191b39a83b3429ea5490e |     
   x86_64    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/c3c421d14c0c64953c64b05ba51a10d48cbd39dd |     
   armeb     |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/45b27deaf04fad1bf6c07b0c1615c5ea31a5df7e |     
    i686     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/513cd38002250aad6a2000607aa06315427b747b | ORPH
 powerpc64   |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/4ccb6e89155b87d5e4cc790f79e3e55570ce6b7c | ORPH
  sparc64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/c74e5f61ebb5f1327af02b3d7b4a4ac09475c2d2 | ORPH
   s390x     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/431c6ce32aeb2f22fafffb106dce4ac118169694 | ORPH
   s390x     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/d904010b9755e81652c15d61c4f14fd327095c46 | ORPH
  sparc64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/22b6d802bdb58c8d31fb226a254afe038f219bc0 |     
   armeb     |          kexec-2.0.25          | NOK | http://autobuild.buildroot.net/results/34598ef922fb318e1061cf1d4acd3e62b2b72ec2 | ORPH
 aarch64_be  |         libdnet-1.16.1         | NOK | http://autobuild.buildroot.net/results/99ee1ffb7786d5c0a60ef226626d7bc3ca968a2d | ORPH
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/32fe7a53651bb681486f1cddbc8d15148306dfb0 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/4b144d6cec5b8c0cf9f3afcc2baa2faa42aded69 | ORPH
    arm      |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/63b192dbca9ab19468b042cd3a3886db70844387 | ORPH
powerpc64le  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/d941448f348d12c23c7b917f43852bcba4cce092 |     
powerpc64le  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/d0fc409a13436348a0b08763dbebad8329c41555 |     
   mips64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/8be91a67c54827aca480eed601609aabf5eaf262 |     
   arceb     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/7b32865b52aee37eb6a552a1c69c5d8cb2320b00 |     
    m68k     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/6ab02ae1a3b9f8992d360a6aeb1405cfdac92dc9 |     
   arceb     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/fd5c766b29dfef4a9b930e5c0c08c287db335880 |     
   s390x     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/9f153eafd0c5d9c69f4a6ea84fbcba59868f8bca |     
powerpc64le  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/b742929f43feac1ba56fa4b01662f838090e5950 |     
microblazeel |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/2582a7302d1000ad31d223cc1902d34f0c0ca181 | ORPH
   nios2     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/b61e0156c5c825ba5680e797af7fcda6796aaf99 | ORPH
   s390x     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/f1db3b81d3eb0340a2fc7719fbe50a8db72ea351 | ORPH
   s390x     |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/416f13fa523026177f1234ce4029e137789d9b8a |     
    or1k     |        mosquitto-2.0.15        | NOK | http://autobuild.buildroot.net/results/8dcb881cdfaae0828bcd69550dcbde41a8352d8b |     
    arm      |     mxs-bootlets-10.12.01      | NOK | http://autobuild.buildroot.net/results/393cccb050fdac4623e8c72b08b1a006b6b14a80 | ORPH
    mips     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/2cd824688f6ace6f40d9e05b35a654510c8f2eae | ORPH
   arceb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/08abd62bdb558ff63bcc65647a6957350c2b5c53 |     
   s390x     |      perl-net-ssleay-1.85      | NOK | http://autobuild.buildroot.net/results/cc2645b64f65ddea6a2a688bdb3b7253ea67fc75 |     
   s390x     |        procps-ng-3.3.17        | NOK | http://autobuild.buildroot.net/results/535512a039bd25886088ecf9759e0e8fd89c56d8 | ORPH
    or1k     |           proj-8.1.1           | NOK | http://autobuild.buildroot.net/results/a10c9ecd983c49fd7862700cedf7673182b7bec2 |     
  aarch64    |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/59b7434beb070f7f8350cd774e8434f2bf44ea41 |     
  sparc64    |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/2e1fab2d09c59d5b3c7cded41a83946cfe68d073 |     
    or1k     |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/6048bfa8a419530c424c8bc9675acf927708885c |     
    mips     |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/e7dadf001863c420c38988114b3d39625b4267b8 |     
    i686     | qt5base-2ffb7ad8a1079a0444b... | NOK | http://autobuild.buildroot.net/results/0a4a03779c0ab9501ed005ad3379588697a175f1 |     
    arm      |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/03da99faa7c3cfbb933082e39f21f9d5f9141e18 |     
   arceb     |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/60246061bc6f5b85eba9e4a943eebac58236e293 |     
  riscv64    |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/c77fca44c2ac60a4e28d2e021f3c5a55c89d8497 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/a5815d2aa9bf8d30777a4b665e00a0fd26e21511 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

            igd2-for-linux-2.1 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/bfe915d8e230de5db7990c878cde85fba7ef4281 |     


Classification of failures by reason for 2022.08.x
--------------------------------------------------

                  check-0.15.2 | 1 
                 dash-0.5.11.5 | 1 
google-breakpad-c85eb4a59b6... | 1 
host-pahole-73383b3a39afe86... | 1 
            igd2-for-linux-2.1 | 1 
          imagemagick-7.1.0-51 | 1 
        ltp-testsuite-20220527 | 1 
                       unknown | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/4138ce18e38030a7dd66c34c01e9cad0ef366760 | ORPH
  sparc64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/a79b8c47736a3e2d328d81dab3e509786bb36578 | ORPH
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/0c22db0890a0b8fcfee70053fa76edff79536456 |     
   sh4aeb    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/caba0740b8b3187055cdcd79e26dfd2ba80b9e53 |     
    arc      |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/7d8bbd01c7ea3d781227def58ae6832063f16f69 |     
    arm      |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/88013e45c2dc43bbeb8f25d358960229c520c3b5 | ORPH
    i686     |     ltp-testsuite-20220527     | NOK | http://autobuild.buildroot.net/results/0f60cce1efd54e37e307354cdaf1c13d7056512e |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/ef53975c543927b5452c3fe3f8e3957fea273230 |     
  riscv64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/bca91e4012074675e5313b501c991964bab40c0e |     


Gitlab CI results for 2022-11-07
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
...ioDracutGlibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3282261236  | ORPH 
...pioDracutMuslMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3282261239  | ORPH 
...oDracutUclibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3282261241  | ORPH 
...lx60UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3282261963  | ORPH 
...Xtensalx60UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3282261966  | ORPH 
     TestGlibcAllTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3282261222  | ORPH 
           TestLuaLuaCffi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3282261365  | ORPH 
             TestLuaLzlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3282261450  | ORPH 
       TestLuajitLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3282261348  | ORPH 
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3282261449  | ORPH 
...ELinuxExtraModulesDirs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3282261220  | ORPH 



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

