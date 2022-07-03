Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E44A6C43334
	for <buildroot@archiver.kernel.org>; Sun,  3 Jul 2022 05:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31F85830DE;
	Sun,  3 Jul 2022 05:39:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31F85830DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sylpgTZTTbXI; Sun,  3 Jul 2022 05:39:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A55A4830C2;
	Sun,  3 Jul 2022 05:39:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A55A4830C2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 29F5D1BF85D
 for <buildroot@lists.busybox.net>; Sun,  3 Jul 2022 05:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01DD360B56
 for <buildroot@lists.busybox.net>; Sun,  3 Jul 2022 05:39:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01DD360B56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yhWxN0WO9dkB for <buildroot@lists.busybox.net>;
 Sun,  3 Jul 2022 05:39:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50C0C6076A
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 50C0C6076A
 for <buildroot@buildroot.org>; Sun,  3 Jul 2022 05:38:59 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E923D20002
 for <buildroot@buildroot.org>; Sun,  3 Jul 2022 05:38:56 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 03 Jul 2022 05:38:56 -0000
Message-Id: <20220703053904.01DD360B56@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1656826737; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1JRrKsB0wRmqcyJILUiLAf5XziIaTf8cf2z+hdAgKzc=;
 b=hSWshWdFGvMfYKJE4FABHMwsjRjL8+QdFUDOu2BbD2469Re8qTOx2k2n64jZEraibCPRkB
 RNlbGXsOUuy1h9zaLVfF/eZ78LvmwZWgo3Pk1BtBJPCr5LdjkYaeI1+1wIxqrexOOa/Mkc
 v5glE9YtrH5bqTAmpwidj1HJoeg9cv9iGe5Wk1B5Ch2H9MQkFCBcllHD4UeyCWNtOon4c8
 dWSo0OjL8ACYMLcZ+lKV3XO31jNev9HRcLI6sYkmqoh+LWQb9KwusgCwN1+5Q1X8xteJl0
 ETyqXKS8Squ7cNf54MLw6yvVLzPjmUGKX0ew796y4rTP+pvcok2lbjVwh91S1Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hSWshWdF
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-07-02
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

Autobuild statistics for 2022-07-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 22  |  6  |  0  | 28  |
  2022.05.x  | 22  | 20  |  0  | 42  |
    master   | 159 | 323 |  1  | 483 |

Classification of failures by reason for master
-----------------------------------------------

                libcurl-7.84.0 | 49
              alsa-utils-1.2.7 | 30
             libopenssl-1.1.1o | 14
                 uclibc-1.0.41 | 13
                iptables-1.8.8 | 11
                 linux-5.17.13 | 9 
                       unknown | 9 
glibc-2.35-96-g2c4fc8e5ca74... | 8 
                libressl-3.5.3 | 8 
                host-go-1.18.3 | 6 
                     refpolicy | 6 
                speexdsp-1.2.1 | 6 
                 zlib-ng-2.0.6 | 6 
           libfreeimage-3.18.0 | 5 
               tcpreplay-4.4.1 | 5 
                busybox-1.35.0 | 4 
                 dash-0.5.11.5 | 4 
              host-rust-1.60.0 | 4 
host-spirv-llvm-translator-... | 4 
              host-uuu-1.4.193 | 4 
                minimodem-0.24 | 4 
                   perl-5.34.1 | 4 
                       sbc-1.5 | 4 
                   uacme-1.7.1 | 4 
                  boost-1.79.0 | 3 
              jpeg-turbo-2.1.3 | 3 
                    lame-3.100 | 3 
               protobuf-3.20.1 | 3 
                   speex-1.2.1 | 3 
                       xenomai | 3 
                     aufs-util | 2 
dahdi-linux-5c840cf43838e06... | 2 
        edk2-edk2-stable202102 | 2 
  gobject-introspection-1.70.0 | 2 
       host-gcc-initial-10.3.0 | 2 
host-gdb-arc-2020.09-releas... | 2 
host-pahole-73383b3a39afe86... | 2 
               libglib2-2.70.4 | 2 
                   libnss-3.79 | 2 
              libuhttpd-3.14.1 | 2 
               libvorbis-1.3.7 | 2 
rtl8189es-39c17661136da48f8... | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
                 a10disp-0.6.1 | 1 
                  acpid-2.0.33 | 1 
                alsa-lib-1.2.7 | 1 
               apcupsd-3.14.14 | 1 
                   atftp-0.7.5 | 1 
                   audit-3.0.7 | 1 
                  bcg729-1.0.4 | 1 
             berkeleydb-5.3.28 | 1 
                  botan-2.19.1 | 1 
                  cairo-1.16.0 | 1 
                 dmalloc-5.6.5 | 1 
           docker-cli-20.10.14 | 1 
                  exempi-2.6.1 | 1 
                 fdk-aac-2.0.2 | 1 
                     file-5.41 | 1 
                     frr-8.2.2 | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubi/ubi.mk:51: /nvmedata... | 1 
                gnu-efi-3.0.10 | 1 
                       gsl-2.6 | 1 
                   gstd-0.14.0 | 1 
gummiboot-2bcd919c681c952eb... | 1 
         host-gcc-final-10.3.0 | 1 
                     host-mono | 1 
         host-protobuf-c-1.4.0 | 1 
            igh-ethercat-1.5.2 | 1 
                ipmiutil-3.1.8 | 1 
                  jack2-1.9.20 | 1 
              libgcrypt-1.10.1 | 1 
                libglvnd-1.3.2 | 1 
                 libp11-0.4.11 | 1 
           libsamplerate-0.1.9 | 1 
   libtorrent-rasterbar-1.2.15 | 1 
       linux-5.10.109-cip5-rt4 | 1 
           linux-5.10.115-cip7 | 1 
                mongodb-4.2.18 | 1 
                    musl-1.2.3 | 1 
                  mxs-bootlets | 1 
                nodejs-16.15.0 | 1 
            ocf-linux-20120127 | 1 
                openjpeg-2.5.0 | 1 
               pcsc-lite-1.9.8 | 1 
                     php-8.1.7 | 1 
                 pixman-0.40.0 | 1 
python-argon2-cffi-bindings... | 1 
         python-automat-20.2.0 | 1 
           python-orjson-3.6.7 | 1 
rpi-userland-14b90ff9d9f031... | 1 
rtl8723ds-76146e85847beb242... | 1 
rtl8812au-aircrack-ng-37e27... | 1 
                    sdl-1.2.15 | 1 
              strongswan-5.9.5 | 1 
              swupdate-2022.05 | 1 
                   tor-0.4.7.8 | 1 
               util-linux-2.38 | 1 
               valgrind-3.19.0 | 1 
                 wavemon-0.9.4 | 1 
                xenomai-custom | 1 
                    zstd-1.5.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/3f0c3a9334f8f44d8efc0ddddaddf3c2b44abad1 |     
 aarch64_be  | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/070528d001d088eedf03860b24f6a45807cb609c |     
    arm      |         a10disp-0.6.1          | NOK | http://autobuild.buildroot.net/results/990e256e5d37243ee4ffadd0ebcf1d64575de063 |     
  mips64el   |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/37d757a212f8b728f3ef66e64cfa82c4c504b4e8 | ORPH
    m68k     |         alsa-lib-1.2.7         | NOK | http://autobuild.buildroot.net/results/44518da88c19afe3a7fec8efe977b0f5d4e53cb6 |     
   armeb     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/220e851f4128b89c34ccb0af77d8a60666096065 |     
 microblaze  |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/a77c5e56e1446747b7d2debaa0eec23697dfd261 |     
  sparc64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/e93f99175657943a3c23e9548e475b25316818a9 |     
  powerpc    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/da166c44659d96983b4f1390d1c546ea66e2c819 |     
   sparc     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/e7a07308db60f858f6efe9ea1834d0acc210d65a |     
   s390x     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/fa375a201087dafaae4c8e2366ce5b0563a6585e |     
   armeb     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/b2412cc251d364a79f6b436602673a86fb80529c |     
microblazeel |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/2875dc3c70c0f41d35eecb7421e214faf862ac70 |     
    mips     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/3cfc16a3610ce959f08be0a97660378e33c909e3 |     
    mips     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/7fcafd3bd7f8bd59e964b6f9fb53ab2ce97db553 |     
    i586     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/f6fc64f88a9a6b3e636229345c220b82a8a8a1fb |     
   arceb     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/9ccde5a04255407d283e2eafb4d7e5bf953b35b9 |     
microblazeel |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/cc74b3fe94d0a40cffe6846b93ab822367c0a3fc |     
  riscv64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/ab7a2a1e0c2227b185f4d43f1cb5f8d7011a5263 |     
 powerpc64   |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/8272afc7fe46396766b261ddff1d04c09894f0c6 |     
microblazeel |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/209e6acc1b92e44b122feb878f1736ed70513293 |     
 aarch64_be  |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/c3ee9682b3dcd76b74a82e79c64e99e5687de6d0 |     
   arceb     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/f4aa1d27cd132f9eeaa3478c8c7bd322101b5a68 |     
    arc      |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/585733a9804547181d7ae658759fc487e3c44eea |     
    or1k     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/e1befb0639471557b0c3bf3453616ab248f021c1 |     
   sh4eb     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/e1b9c704d5546f9d0a2652f30b8c6e41ee1ec111 |     
    mips     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/846839eedaddd15edd10cc8f30e2a0a02bfb1e41 |     
 powerpc64   |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/5f0aaaac43d0a771dbb4d71ce0d8936cd57a2250 |     
   nios2     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/a881a19b8e21e78977c041d42ea018f733755ca5 |     
   s390x     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/c5fc451e9914d54955384f7b7b72549b35ad4c89 |     
  aarch64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/7c532990003f977de856e4ed21796e509abc9c5b |     
   s390x     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/c2ca0e5355818a44019a1c9f35d63e94136dc337 |     
 powerpc64   |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/86df90bcfaa238a42405fe720507922f66bccccc |     
    sh4a     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/2387d054198f76c518e953b6b62f7337e94286f1 |     
microblazeel |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/ac4eec96d7dee5f2cb7d3048c3c3f5d212938bb2 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/7f452095d258ad42f9643fd5ff6b9e9c2df1d34f |     
    m68k     |          atftp-0.7.5           | NOK | http://autobuild.buildroot.net/results/4e04483ca85e3bdb5baa180a6bf54be2e0550b75 | ORPH
   armeb     |          audit-3.0.7           | NOK | http://autobuild.buildroot.net/results/0de5ec1fdf34a6b263672248d84e159b65edf30e |     
microblazeel |           aufs-util            | NOK | http://autobuild.buildroot.net/results/f035284caba5015d31bde5bd5d9e83935c5a01ee |     
   arceb     |           aufs-util            | NOK | http://autobuild.buildroot.net/results/e294754e8179e8761e1fa1721aff2a9586f5615b |     
  riscv64    |          bcg729-1.0.4          | NOK | http://autobuild.buildroot.net/results/3683807067b55e2b44a5b864eed324c8424051b0 |     
    m68k     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/eb9f8f5541007a01bb7184567a31e5aec6872d6e | ORPH
   arceb     |          boost-1.79.0          | NOK | http://autobuild.buildroot.net/results/a7feb2ed4781c2662c41644b7e05346fdf2429d2 |     
   arceb     |          boost-1.79.0          | NOK | http://autobuild.buildroot.net/results/b6d1a6b1c6cc21c5a661d58a51818b3b63ceb381 |     
    arc      |          boost-1.79.0          | NOK | http://autobuild.buildroot.net/results/2438861370313eb97d48f967324f8c813b9d659b |     
    sh4a     |          botan-2.19.1          | NOK | http://autobuild.buildroot.net/results/4abc0bc3967554afae660e23ca9c833411a344fb | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/1be4862d2773d213bf2971632e2537ed1f959e3e | ORPH
    m68k     |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/ca28888c05b9109619d4bddf2d99e34a570259cf | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/b1961ec6c673288764ac43e4e62ad103b771af73 | ORPH
    m68k     |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/f3762418a39fc15530252d83696b8ae49868259a | ORPH
    or1k     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/9f11950c78b7ca2c6ecb5ba64156afeeb8e688db |     
    mips     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/616ae60a943d9878269e36841140f4ea9d2c84bb |     
 aarch64_be  | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/b5c197d911f4ce0befeaef6d97e0ec0c25e5f3b8 |     
    sh4a     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/b83ce2c71a10223361bf00188ec6eb9bd78a161d | ORPH
  aarch64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/8318a7fa9b572e158ce8bb4975087cb039f11052 | ORPH
    sh4a     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/6ffd753995d0c27c7cf189c6b42169a8dfed21cb | ORPH
    sh4a     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/28c3d3a1b2d8b6810796d9cbcb06e74a7e18c820 | ORPH
    i686     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/47244932628c705cb0ea77d378c399c3c6e5ab33 | ORPH
   s390x     |      docker-cli-20.10.14       | NOK | http://autobuild.buildroot.net/results/504d41780530cc9ddc316ba550cba52d968882be |     
   x86_64    |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/8a48062128dae8e9c34b0273acb09ff1d265d286 |     
    i686     |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/3d174eeb1570e7d454d52e7ea58591b780bdda45 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/99a44204ded178454cdfabc8625af98c477cef27 |     
   mips64    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/6db3e820eb76c0aa0204790e8707635aa1b79b60 |     
  powerpc    |           file-5.41            | NOK | http://autobuild.buildroot.net/results/b96acdc1bb14fdb63a03659fbdf42a266f2439c9 | ORPH
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/bee1fcd9090fb99f401a0a8db8d070b34e11076b |     
  mips64el   | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/ef9c18e109e41ab791a3ff9eed93d332f43c38ea |     
   xtensa    | fs/ubi/ubi.mk:51: /nvmedata... | NOK | http://autobuild.buildroot.net/results/bc215dfc43df61a2e15aeb4a4f32aed06c68673c |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/d6385ba19ebe2e331f2c06d33cfbb3f5ca1f69d1 |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/844e8d44dc20cf291846a930239c5f343f72c621 |     
  powerpc    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/31044028eebfc2bc8ec8fd1b0307f1d7861af17e |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/3e7c4c5734e62bc7b8cc294132268f4e8272698d |     
    mips     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/e7b75a8acebba612e5aeea359f3101b0426ba148 |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/444ea6fb890446cfe3082fae11305e9854cc71a9 |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/36affb348a8539dac15a91db6b5fab9b7c790564 |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/b41b3430952e3472152ead35a02d64ec2773aeac |     
  mips64el   |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/8c269558a04b7dd7a13d28910752d74ed0afac50 |     
   s390x     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/d99e1fad5780abde8b6e923f5ef4cb7dc54d17f4 | ORPH
  sparc64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/71107006f1fa509769b7a10225ee3c482b57987f | ORPH
  powerpc    |            gsl-2.6             | NOK | http://autobuild.buildroot.net/results/ed31eec4d227b21b152c72bccad7603d53e71512 | ORPH
   sparc     |          gstd-0.14.0           | NOK | http://autobuild.buildroot.net/results/731ba8a9f5daf89d2c7220c196ade2f6e50dd6db | ORPH
    i686     | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/90838c5d574f1b727df9ab985d45cb82e91642aa |     
 microblaze  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/7e6d3e47a31d2aa9d594f0044eb478c5d7949638 |     
    arm      |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/e12d2b8beff0caaddfe0fd4b200a275e1d2dc943 |     
   armeb     |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/d88edac30e58334b81bf2bfa720bf9bf5b6c06f3 |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/b0d5bfcf23aaccdf9afa9fdc73bee2b9aca32d2f | ORPH
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/df3b71869cb537e2061d7fa1369ab73abad211fb | ORPH
powerpc64le  |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/491532d0752b190c9fce28e6630ccaa4cd1a8e95 |     
   mips64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/cbabe88779308deff9edc282574099c63bbe5093 |     
    i586     |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/e874366c6e488fa794ff8ace8f242c3aa7e2ee8c |     
   mips64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/017487133748bd6783b75a68f710dcb74ce3a45e |     
powerpc64le  |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/f7871d6a37345e008bf8e1bf7ea111a47d8c5d16 |     
powerpc64le  |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/72c9debd2bc3691d460500bf5f211931a4180748 |     
    arm      |           host-mono            | TIM | http://autobuild.buildroot.net/results/45c2512c6899ba010ad76b35ac58b130680321cd |     
   arceb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/6efd7fdf9d1740422dee6aae798db4d5ab2967e2 |     
  aarch64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/a47457121baf07b17308214ed54d68771c3c8d3a |     
 powerpc64   |     host-protobuf-c-1.4.0      | NOK | http://autobuild.buildroot.net/results/6d1bb58e89f313cd48371f3a3e6b829e07a5212f |     
   mipsel    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/341b65bebff069ac3cc56889e8529930149ce448 |     
  sparc64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/b98ad57410a83d6b73abcb0dd6faaa5a4d93b1ac |     
   mipsel    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/6029b5935e3d603d2bc2fe44aa1c1c1cf6408b0d |     
   armeb     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/5fa24a66b371b040c80b821a8f96c3f053cc8459 |     
    arm      | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/00c2b3804201ff7d93febebdf31b6ff58bb715e5 | ORPH
   x86_64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/057c44c9f0037d63b54db5d2a7e5e029fe4403ac | ORPH
    i686     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/ea7b17a887b41ec16e8f0441f9df804105e9b2c9 | ORPH
   x86_64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/cab0a51ea060fb83792104402802cc0498d0ae8a | ORPH
  aarch64    |        host-uuu-1.4.193        | NOK | http://autobuild.buildroot.net/results/478fa2169657f55363d7124e54e0db5f32732147 |     
microblazeel |        host-uuu-1.4.193        | NOK | http://autobuild.buildroot.net/results/13f93e225becb52feb6dabbb06c1b5b71e105d5d |     
    m68k     |        host-uuu-1.4.193        | NOK | http://autobuild.buildroot.net/results/6d87cfae4ed639fe803dc071302790ad3eaef3fb |     
   armeb     |        host-uuu-1.4.193        | NOK | http://autobuild.buildroot.net/results/23084b57fc9ea36b8b0d4ed10d40cac7c865105e |     
microblazeel |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/4cd587d9904e469e4e586a666121633d4d5e345e |     
    i686     |         ipmiutil-3.1.8         | NOK | http://autobuild.buildroot.net/results/ccf43b38a69f7664c0af43e1f5ca5fcb1637333d |     
    sh4      |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/c57682ec36388d6b36770240c6d15c798c9b80bd | ORPH
    i586     |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/7e1ad1177d8a588a25219c7f5ed21ca28cab242b | ORPH
  aarch64    |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/796bdd64b5fde66cf2473e7e73d18e71181e28be | ORPH
    mips     |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/ca0dccccca20789920e1b8a915fae669d308a2f9 | ORPH
  riscv64    |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/141c76e9f131cfdee1c124a9da515b2afedfb7d2 | ORPH
   mipsel    |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/3ad0614d277f958519553cccb29939285a360141 | ORPH
    arm      |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/d28f9c6b42b9f9b0bc647446f46d4c36d5a3e05d | ORPH
  mips64el   |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/536aa6a4f3f4bb7d5bca2e96c495f17023eae58c | ORPH
   mips64    |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/4ad030b6141563aaeacd0281ebaa3d8e3b5c64bb | ORPH
   mipsel    |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/81bc3ade76d6317c3a207b85efbca8b29fc32b87 | ORPH
microblazeel |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/5578b383c1719432c4c4b03b752254b6a64b4aaa | ORPH
    m68k     |          jack2-1.9.20          | NOK | http://autobuild.buildroot.net/results/9ced9ec0996202e2a6d4bbbde1155900d4686f68 |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/66e48193b341cad08f4356f35ba9c251b4a4af78 |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/d35ad5ca82eb409669d707d2ebfefe67355dd86d |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/e7163ab53e62efa38ab1c82c9356d7c0696e38f1 |     
    m68k     |           lame-3.100           | NOK | http://autobuild.buildroot.net/results/1c2fc98420e5d74f10f3fdf9e6864a5172ccf33a |     
  mips64el   |           lame-3.100           | NOK | http://autobuild.buildroot.net/results/1bc802ade6dccd88062261ef9a8a63c735e36c4e |     
    m68k     |           lame-3.100           | NOK | http://autobuild.buildroot.net/results/fbd2dcebf17f37245d3e30e457c1ddf3ec06d202 |     
    mips     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/dc4d782aded7952401e69750f670b89657a364a4 |     
    sh4a     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/30989a10fdbdbbaa7749d5701b7982bb95ab5d37 |     
   nios2     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/9b95bb89c05689d63b4ae1fc7449b1d01a8db776 |     
    mips     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/55951dd70d8b0e1dfd97f14b5b9f821c7fc984e9 |     
   armeb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/78777113a6694d3e1cb152b267fc73bb4d986607 |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/87bcb57f761d1df1fcda6585ef954f8f652aa9d8 |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/f99e2a9a83e02f7137f52cc951b1490ea168a0ee |     
    or1k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/b3beb60d74ca6a742169e9d3164a4fe693c87d90 |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/d175ad18e1f28d8bd6129e67b7169c8692da4b44 |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/f37427bd3e7845a94909554edafb8436f2b7e844 |     
   mips64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/4e03f4d576ac96e9122431e0fc2901827a9febcb |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/5f63a6cbd3eaf1abf65b0dc6818219ff7589598e |     
    or1k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/98a2cad43948008202e26afa89cc8061cc10f488 |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/0c499b9102d24c1ce826d863a74de8d99e9afa00 |     
  powerpc    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/2314ccc32358fe8cb91fe57ab10a34c759dfe6ae |     
  powerpc    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/76fae4449ea6200d54baa3aac70dea3f5a25efd6 |     
   nios2     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/b59e57ac8a30df0c8fe200126cf1d7ec4a0d0dc9 |     
   xtensa    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/3a3b2cdc68d93217b0754f29b69b22a699999680 |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/2b173e1f3d73e94d2d3bfb7ae0d4e712d0623956 |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/540908f75c43591cf75fc86e538a875fcb903959 |     
   mipsel    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/c331ebdbdbf64b534ad7b133777df76ab6f9636b |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/3bca16d110bc3a488202bfc1013f4f3ee63f0f62 |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/b9f1d3715cc6f4f9cdebf2346985f33a5cbd165b |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/3b9fbf035ff2f38aa675aeeb6c5ab290f9d981b5 |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/9b135e6b50ee7120a4c21057c275e72a439f780e |     
    mips     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/0e7abc5902d9dc90154b6d3debd283a82b51ec49 |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/b833a88940a28d3c762956d4fc698702b6d509e7 |     
   s390x     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/510ec56833b674c90d2ce9c02e487e168131054e |     
   armeb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/0a833fd7c3993ac1481830d26bb97787d381af6d |     
    or1k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/5dc11411a250d737dc42d1d775186d86a46779f3 |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/f98a799d7c38c844f644e06ffdb088e70d23355c |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/f252afec11fa6b52fb51f91d1ee2c0a2763be6d4 |     
   mips64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/582db7bb5aeb32a82dc53f31500cf2f36668f5c6 |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/3f34c28cf51114197f364f36671f499877b2dd2d |     
   nios2     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/d5dc302ce2c29dcd363b33d1bb7a043cb76f63f6 |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/8576a2a875fc1519dade6df1090c71d131c47aef |     
   nios2     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/24bb667fefeae5c3f59d7bade487bdef9020443c |     
   mipsel    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/eb64ee94155d3958d01d7c14ce9b7d1986afbb1f |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/50150e8d3650e7c485d9930c3d81b881311a84e5 |     
   s390x     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/bdfe5831e34e4adeca111bb8bcdd1341ba7bf4af |     
    sh4      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/bc5d81568c6f0cbf76b03b45449a52070454af66 |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/00c9f78d48eadacf1afbb82c738472cec7ab22f6 |     
   mipsel    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/3b443642008b491abb323f8a2dd2c372cf0d630c |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/97d54fdd10e1be6697e760b873f385e45b1f8ae8 |     
    sh4      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/50be51c667a8d7ff1a27771b78084d5208f7b4b2 |     
    or1k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/dad897fff9f2d58a6c36a461d149dcc63b6dc788 |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/b37eee363aea744a67a5ae67e1ba0d108e96d9f3 |     
   s390x     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/c5500a4a51ae9a29e87240d6e730d7a51e9f5abb |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/4a0eb89fa9731ce4b72a25cda0c468d7c452ff29 |     
   sparc     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/ac2349fc8e86550f7e7520e92b128e74ea36f800 |     
    arm      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/39320457951cd2fda066bd3e347e24fbd2d2d4d0 |     
  mips64el   |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/11ad1fbf332c06207d5fa62724082f5aa46edd39 |     
   nios2     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/aee14104b8b3b5e36c71b91a072e88b3d0e3b1e4 |     
   nios2     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/9db0268f6177403fd29503f18ae8d1882f31953b |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/2a6952bb9c685d968f0c8508b588b3a67f0797c8 | ORPH
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/aee04d89ff4318612b14453f46aa4a13d18dca4a |     
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/41712b843a8952385ee8aa450b0f14a13a45b23c |     
    i686     |         libglvnd-1.3.2         | NOK | http://autobuild.buildroot.net/results/d64c238fcda29f477bf310b52b3bd576d8a492d8 | ORPH
   armeb     |          libnss-3.79           | NOK | http://autobuild.buildroot.net/results/9f7e258532061694eec90f69d55b10667f5b0577 |     
    or1k     |          libnss-3.79           | NOK | http://autobuild.buildroot.net/results/d84ba3041bb120cdf6cdd0bfb06c62903f485673 |     
 microblaze  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/16a9c4807fa6e9a03991f566aac8af5f8ac3f8c7 |     
microblazeel |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/75ee19076fa204ddf93dc494b15b6fbb7347a064 |     
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/2e83df6a1a724a07970279e99e39a0077695f0f3 |     
   arceb     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/5fbb8f3c98fe305cfcf08962affb8ce8799ecd4f |     
  powerpc    |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/392d492d7fbd05acaa45574cd165a2d0c78a30f3 |     
    or1k     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/0401b5773110c2a46526afb0de8b39bf578e4f20 |     
 microblaze  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/4903ae6ee0590a0b97c58071505b0796d8d5073e |     
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/f774aee6dd501bfc8dffacea7653c05acb41f5b5 |     
   sparc     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/f9eed88565a2df56a03d95b47ad77a355ca1887c |     
   sh4eb     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/e94e7185bb0eff06a042980e4877ead15cf6c785 |     
 aarch64_be  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/d4ee0804d9156b295b377046cc61dfea8ec8926e |     
   sparc     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/cbcf04b71c46f4d2d5e92fa8b602adee7ea8311f |     
microblazeel |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/2eb98519767781f7f3be88fbb22680d9b53bdcc3 |     
    m68k     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/14645e139687fe2685c32b1ceddfa9e800db11bd |     
    or1k     |         libp11-0.4.11          | NOK | http://autobuild.buildroot.net/results/e503dc032beccd3b05ade82e77097e2ddd541d65 | ORPH
    mips     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/be8da7c5e7323dbf81554f92ab72d49a74acd0fc | ORPH
    m68k     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/5a085be993ff9f2f621d10677f8727404c19aba6 | ORPH
   sparc     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/0070ee7eb6839c7639ee76498707a4819491fda6 | ORPH
   sh4eb     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/6982d52cc81e2b6d59588e714efee7786f3aa85c | ORPH
  mips64el   |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/c352d5098375ffa2cbb8e2360adfb3bd93010f06 | ORPH
    i686     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/d5c5c4919b2b5e2253478721aaec56d5fe2bec05 | ORPH
    arc      |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/40e384affe19d2ed3b9c7c2846f0c51489fa7fe3 | ORPH
   sparc     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/edd826b639342120eecd9858ce79f6e5c334248c | ORPH
    i686     |      libsamplerate-0.1.9       | NOK | http://autobuild.buildroot.net/results/f058e60eeda5a630381c2af56cc7bc125a836a81 | ORPH
    m68k     |  libtorrent-rasterbar-1.2.15   | NOK | http://autobuild.buildroot.net/results/25589e03ee4bc0d0d8bde07eefd8c45d8bc0d7f9 |     
  mips64el   |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/5c1dccabc94cd98c4d37e5aaade7815bb9344239 |     
   mips64    |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/37653694165e21b5cce7f51bad1845fadc0fff15 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/03093b9f7d0f3e5c1efb653b7b76f8034bf22776 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/a4590514ded4bd89de8d985562646e4c965fbb6d |     
    arc      |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/9267c9a85cf1c38d1bc7d090959a087c01aa32e0 | ORPH
powerpc64le  |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/f14882af067197a26b6c95eed1cd20afced09230 | ORPH
   mipsel    |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/a5f460c75f8f3c4bfa9214c48ad819675587c2b7 | ORPH
  mips64el   |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/5dd521860ab0403a16d761ae446cd5e877e01fb5 | ORPH
  mips64el   |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/224993193dcf83386e5a1a22bf169c82eb420101 | ORPH
   nios2     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/6fdbd3ea0339f17f921e61f400efbe6e77dbcdf5 | ORPH
 aarch64_be  |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/6bd304b792606c859f97dd3d3b3d21c7073dc8fc | ORPH
 aarch64_be  |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/9b42603ff30f9867f9e44563250cdc930170a49d | ORPH
powerpc64le  |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/b3180dfe0f61f93dd76fcb86a2f7c550eabe1702 | ORPH
    arc      |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/7436a4c934d59c5b425dbd3855206fff50fc1efe | ORPH
    sh4a     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/386ce5e86c30ea7df6f6b6f7c93d0a6284733698 | ORPH
powerpc64le  |         minimodem-0.24         | NOK | http://autobuild.buildroot.net/results/3e6b84eab1a65db0c41f1a052a09e4af725d3710 |     
    i686     |         minimodem-0.24         | NOK | http://autobuild.buildroot.net/results/e8c1e28bcbaa465f0f6cc29857e96f6cfe91bbac |     
  powerpc    |         minimodem-0.24         | NOK | http://autobuild.buildroot.net/results/8ea53fafc96f926c66d7476bed03e99f00d17df3 |     
   x86_64    |         minimodem-0.24         | NOK | http://autobuild.buildroot.net/results/b15e60fcc2fb4774aa366f825cc61c81d8e3c78a |     
   x86_64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/6d3c6d709d2e81bac6abe30e7f5ab18b1bd37273 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/97c6c4bd683e6c7022a62343888dfa8b9d3bab04 |     
    arm      |          mxs-bootlets          | NOK | http://autobuild.buildroot.net/results/7b54c7423342dfea5563de288033d0e4c8d44084 |     
   x86_64    |         nodejs-16.15.0         | NOK | http://autobuild.buildroot.net/results/a0fc68c7e57c3167cc5ce6d4245dd00249c0602a |     
 microblaze  |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/ee7496f102efb427215a3a4ec7dd8977cc353e48 | ORPH
    i686     |         openjpeg-2.5.0         | NOK | http://autobuild.buildroot.net/results/ee2074d998d1f155f49e148e01934156875e48dd |     
    or1k     |        pcsc-lite-1.9.8         | NOK | http://autobuild.buildroot.net/results/c81acef228941ebcee6a4b4e614ca7dc8e1e8ea5 | ORPH
   arceb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/b41a71901ad6b466288ababfb35897cf9f8193b6 |     
 aarch64_be  |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/945cf8f3d1277e12b8f134a6eb33db65a69ea81d |     
microblazeel |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/1fe3a633a85f13c34c28cc959d2aff3f14b05d05 |     
  mips64el   |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/c558c9262efabbf1a1dfc7aa6a056e0faff0682e |     
    arc      |           php-8.1.7            | NOK | http://autobuild.buildroot.net/results/b88ed87955cc8d6c6ebfe4484a43b9a825ec3e26 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/4981139612d0a12349184aa3aa8677db272ff3d2 |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/71b9b62e48053a06b6ebbc2f13ccf916321ca85e |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/48cdcf66a458a75e9b96c2756304bfa97fd0e78d |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/03fe70796aee7937106963cb0a8d6d46ce95f7fc |     
  aarch64    | python-argon2-cffi-bindings... | NOK | http://autobuild.buildroot.net/results/a3c5208224cc7825152d9a27b64fd82fb000a259 |     
   mipsel    |     python-automat-20.2.0      | NOK | http://autobuild.buildroot.net/results/a4a52da24032222860ad6abe89bf66839cc2e812 |     
   x86_64    |      python-orjson-3.6.7       | NOK | http://autobuild.buildroot.net/results/ed191e253474b600baee4b33c341dce622b24777 |     
    arc      |           refpolicy            | NOK | http://autobuild.buildroot.net/results/d0f1a99ec4be06d68360cefe3477b3032bfb2326 |     
    or1k     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/67a44ae57e82c5666457df0eae61ff7ed5923287 |     
   mips64    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/8bced0b718c4bd02a137bfec32be5987590b6401 |     
 powerpc64   |           refpolicy            | NOK | http://autobuild.buildroot.net/results/7b70c4fcc113be7fc094476aee86a1a96398e0fe |     
   sh4aeb    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/b56348e342a8bbdde328c3b4f68ffc81d9a5fb5b |     
 aarch64_be  |           refpolicy            | NOK | http://autobuild.buildroot.net/results/6e9b5acdcc623c26101f72662d4a5aea461de4b5 |     
    arm      | rpi-userland-14b90ff9d9f031... | NOK | http://autobuild.buildroot.net/results/fcfa4a8441db53e280be174e9c7bf6beacbf7156 |     
   xtensa    | rtl8189es-39c17661136da48f8... | NOK | http://autobuild.buildroot.net/results/dba54a221cc2a0198365a11057343566ae9e77c1 |     
microblazeel | rtl8189es-39c17661136da48f8... | NOK | http://autobuild.buildroot.net/results/3a5e9cc74a5479220a5d399e0cc91bf276432759 |     
   armeb     | rtl8723ds-76146e85847beb242... | NOK | http://autobuild.buildroot.net/results/60d30790d31538aae01745963d3a4027916076ed |     
  sparc64    | rtl8812au-aircrack-ng-37e27... | NOK | http://autobuild.buildroot.net/results/63e828ba936deea14a317266cecedb222e94da7d |     
    i686     |            sbc-1.5             | NOK | http://autobuild.buildroot.net/results/94e9e44580312b241df8433f8125cf66b2e2a231 |     
   mipsel    |            sbc-1.5             | NOK | http://autobuild.buildroot.net/results/a563ed6fd3ba2b0d03b39e76968232d383bf8a8d |     
   sh4aeb    |            sbc-1.5             | NOK | http://autobuild.buildroot.net/results/ebae61d7c1c32ef09552dc15927bc625ca5d9537 |     
   mipsel    |            sbc-1.5             | NOK | http://autobuild.buildroot.net/results/089667bc45f50a432deab429eabde61c156fb8dc |     
   sh4aeb    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/f52f7ca4645f5f13c1582fa2e89ec08d55829417 | ORPH
   xtensa    |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/5fc06047b5d1fbfa2e48565fd78a5297f46fc87f | ORPH
powerpc64le  |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/2fd789ade262f6b3e47922019cf4518db26568f6 | ORPH
  powerpc    |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/bbd1c5a8cb994c0e3fd3c76e19f9629f2f4be1bc | ORPH
    arm      |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/e444e38334be73d64895ddc4a12f784f058f70c7 | ORPH
  mips64el   |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/e4c8c1a50104f15d18ffac65684f40635ba6629a | ORPH
   nios2     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/7a479024ccba39ba62624a5e10216c24539617c9 | ORPH
   sparc     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/f0993e15fbf64456897d74b0209c4156eda94115 | ORPH
  aarch64    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/6d72698576eae6e18a088ceca62e0279e423f3f6 | ORPH
  aarch64    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/d50768ec6b36d4ed228ba8241f4b249e377f0c00 | ORPH
powerpc64le  |        strongswan-5.9.5        | NOK | http://autobuild.buildroot.net/results/9fe27ce489341ae027045fff10126d8c63abb375 |     
   mipsel    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/7ba9012c0a61c47c96b5fecc82425c94b55ba6a7 |     
    i686     |        tcpreplay-4.4.1         | NOK | http://autobuild.buildroot.net/results/00f492a715ba32973e0c04d6b3cd93886c3dbce1 | ORPH
    i686     |        tcpreplay-4.4.1         | NOK | http://autobuild.buildroot.net/results/8b90b482bfc9bd75e77f2cd510a529e9c9d0a58f | ORPH
    i686     |        tcpreplay-4.4.1         | NOK | http://autobuild.buildroot.net/results/0f93249df9ded9130a9e452f792650e758bcd7c3 | ORPH
   mipsel    |        tcpreplay-4.4.1         | NOK | http://autobuild.buildroot.net/results/581f2df0a003194956c4d831525a8706cb98885c | ORPH
   mipsel    |        tcpreplay-4.4.1         | NOK | http://autobuild.buildroot.net/results/bcfe8d051aaef26dfd4cf525c2482e703f7adfdf | ORPH
    i686     |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/d71586b0d00bebffc66e1b36f381023655f786b2 |     
 powerpc64   |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/e013260a5c02a5050a39edb69bfd0e4f43e9db36 |     
   armeb     |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/1f3209588da517c852f67e6b67f8213310df5f94 |     
   nios2     |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/855057920bba6af73e6862ee671903d031ab5873 |     
   x86_64    |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/e9981298db47dea9a57df57f365b51a45c8aa4d3 |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/23d5370ccedb6484bd0cce2f5d3ec1cbaf1001d1 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/bf247834bfe88282f21b81ef7890aa421c3c6a6b |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/d164f0b51c9796a7dd1b6551d9a219678903af3a |     
    arm      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/c1fdd3a1f11a448e301790119af17699217410b4 |     
    arc      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/a69da8702466ba98c2babf2924d372dde6b0497c |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/e72cded166e43925531f0b24bcf988939f6c6549 |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/50763a8ffba348f78167890f9237336c4367a90b |     
    arc      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/cfe56fdff234422406e15e26b3ff07fee6f39fc5 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/68dc3616115280c0afb99c05a21341d889e22dfa |     
   armeb     |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/8ee4938ea99b9744217a32d37f40c49fc18b2d0b |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/1c1ecd1d57fb621866a10c8216615fe31b72e9ad |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/af2881fdc82186a5009b6217ac4f4ac427333655 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/00c6eb4c91d76b12e6d6128783045aa8ba47ca87 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/0a6c3b652096584541e934dd26704221531fe770 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/cbeb184339171fa6d44838258fe70a9d02b86800 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/22861e93601af5430e05385622499aefb8c40526 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/dcdd303c9b8274b41f02a1e6fcfcf4228ce3a49e |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/55d808ec7c03797fc75ddc1fc2980cd40dd46799 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/ce881a42f135afec2d01e6f37815f6f5a8e3958c |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/899221fe734110da2a6a2f744ca592e68b54c425 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/ed91b8712f5fde3a8eb205bdb8b1299e11169976 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/0bd788037889f2e58787e7364b15692bed62fcdd |     
    m68k     |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/12bd3d9a97e909de47dd2d073c5e4bf155311f6e | ORPH
   mips64    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/93310bf93e1a20c76c807daa968d5056e2954e9c | ORPH
   s390x     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/322f64dab6a1a4b8f28fbb405cd0e3137c2df795 |     
 powerpc64   |            xenomai             | NOK | http://autobuild.buildroot.net/results/f3d5e7adf314bc2a8ab0a2ba78b30924a319277b |     
 aarch64_be  |            xenomai             | NOK | http://autobuild.buildroot.net/results/e521c61b11d2ecfa696f335f5f01e72ff380f43c |     
    i686     |            xenomai             | NOK | http://autobuild.buildroot.net/results/75f88143ab7493490fcfd29eed7bd1b2f1d06295 |     
  aarch64    |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/54138b7194fd208d85b7c9af2f0b6aca4e7f7032 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/edd89d73cc5850e0c363a54cdcabc417d3323e73 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/fc7ba680e058e67eba7f1e35035d194a28fa6d83 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/81d0458a07701654138e9c995118917bdf462eb9 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/b76989c54d1b79446ebaeae130f98536a3972c94 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/03cc55738fe849a44a881ee1040ceb54a8a3bc05 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/701648a918fc3d24e7f91d9899f35b0b9c71bdcb | ORPH
microblazeel |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/8a4327b4d59db48c6e68351ffadc672033171d42 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

           libfreeimage-3.18.0 | 3 
android-tools-4.2.2+git2013... | 1 
                 uclibc-1.0.41 | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/d5f2687a52173fb1b9fa372382b4533cd77ac0f3 |     
   sparc     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/faa83fcca713520c86fed34e2118a4a1516e4116 |     
    arm      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/26a1ef3cc82205298f8d6fa6849e33f950ad851b |     
  aarch64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/2388f404b330cd269e2dc0c794a287ed7e729fe7 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/a251d28a31b10293414d7a114df398ce344d7efc |     
  powerpc    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/604a4df625c8a39249265c1be01ea32f1cfc763f |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

           libfreeimage-3.18.0 | 2 
              swupdate-2022.05 | 2 
                 uclibc-1.0.41 | 2 
                cryptopp-8.6.0 | 1 
host-pahole-73383b3a39afe86... | 1 
              jpeg-turbo-2.1.3 | 1 
                 linux-5.17.13 | 1 
          lttng-modules-2.13.1 | 1 
                  mender-3.1.0 | 1 
                nodejs-16.15.0 | 1 
rpi-userland-14b90ff9d9f031... | 1 
              traceroute-2.1.0 | 1 
                   uacme-1.7.1 | 1 
                       unknown | 1 
                       xenomai | 1 
                  zabbix-5.4.9 | 1 
                 zlib-ng-2.0.6 | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |         cryptopp-8.6.0         | NOK | http://autobuild.buildroot.net/results/7cde511fdc486a72afa7d95d4bdcf713b1fcd51e |     
    or1k     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/ad3509f51afbb7d08a161ea5f72509e6c864f712 |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/c818ae2b4234e70101dcf3245919c78f3e8441a1 |     
    arm      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/6ce953077b45b188df8d57d86b805e6a1ba5d43e |     
   mipsel    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/7946ce68a19de179713afa63833eec78f060907b |     
   s390x     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/f111d30508a48111ac27fbaefcda48cc7b0caeed | ORPH
   arceb     |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/09b1edbfce313cc42d4be927e71b9757d7998d24 |     
   x86_64    |          mender-3.1.0          | NOK | http://autobuild.buildroot.net/results/45a86322e09eedb584bebc264d59753527cdde25 |     
   x86_64    |         nodejs-16.15.0         | NOK | http://autobuild.buildroot.net/results/2b9b232c69daa2cd0d137abe3cad596ff00178d4 |     
    arm      | rpi-userland-14b90ff9d9f031... | NOK | http://autobuild.buildroot.net/results/721ffbcd8973d4a9971f45bde736832f7c737231 |     
  powerpc    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/f042b5faaa2452867c79b8644876073515e8527d |     
  mips64el   |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/101cc620be56ead6b07a7a63b54b2f082230cbb0 |     
    m68k     |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/8d6968cc69e7e29ca4eea3ed9f82bf59cc9a7d80 |     
   mipsel    |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/1b229c4820528f808cc69185794cdc88bf291ff9 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/ca66fb5cdbf565b98989d2db3e67bf2ddbceb129 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/fee3e9386fbc910b27a9bf0f36fa6d20a56d758e |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/672c31162ba68dda7eb70da6ab35dde6858f4a5a |     
    sh4a     |            xenomai             | NOK | http://autobuild.buildroot.net/results/c007dba02d89c3937548d1c87606c214927e7df2 |     
  sparc64    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/3352823c42870de5fd5a7449ee6db84cbe78dd7b |     
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/29ee1ea448296ff20a53b3b76bf81a34658aa42f | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
