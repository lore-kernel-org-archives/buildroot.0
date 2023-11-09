Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1EEC4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 06:44:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 252ED40119;
	Thu,  9 Nov 2023 06:44:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 252ED40119
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W7Z4UrvGJL6y; Thu,  9 Nov 2023 06:44:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DBD840614;
	Thu,  9 Nov 2023 06:44:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DBD840614
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 79C141BF47A
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 06:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20C7140614
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 06:44:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20C7140614
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cQ_GhpCdf4uh for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 06:44:01 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5AFAC40119
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 06:44:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AFAC40119
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5CB1F1C0006
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 06:43:58 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 09 Nov 2023 06:43:58 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231109064405.20C7140614@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1699512238; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=V0C0hUaNArJTOE3v+ef7ecuSwM1EVEhK4D/LfK3uPvM=;
 b=iq1JUEAwV/oNdkxxqvIYn9PqQvWPfimswhl8LFoX88289Q5hrd3xVB0Ky6YNrg6bHi1o5q
 I6Gz3Q5ZoGohHwpJmh4kqiBpzi/iBVA6Mzd8VYlRZ55PEP4gdkikPKNL8Q1o1pg278tWQ4
 6gU/jt+lFTyY5qaNELxuGc6rajFMIMkBOfyXm0AZgnaCNESYxSqEAEM+MBkW0dZWeK1hw7
 bfOif8+Hk36uag3A9/plcLcbKUA/LFpFekPTxUyra6tb/U0JPOnjfiTWbVKGreUqIXGXRa
 iPDJacIPux+4aOkPtT9HfFuYHn5h29Dx+IHYzj7btIxFZsx6aBhnly1ewdMXKg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iq1JUEAw
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-11-08
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

Autobuild statistics for 2023-11-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 15  | 10  |  0  | 25  |
  2023.08.x  |  7  | 17  |  0  | 24  |
    master   | 96  | 84  |  3  | 183 |

Classification of failures by reason for master
-----------------------------------------------

                libressl-3.8.2 | 8 
                       unknown | 8 
                     linux-6.6 | 7 
              gcc-final-12.3.0 | 5 
              host-rust-1.71.1 | 5 
                libselinux-3.5 | 4 
         gobject-introspection | 3 
 Makefile:727: target-finalize | 3 
               mariadb-10.11.4 | 3 
check-11970a7e112dfe243a2e6... | 2 
                elfutils-0.189 | 2 
  gobject-introspection-1.76.1 | 2 
          libcamera-apps-1.3.0 | 2 
                   openrc-0.51 | 2 
                xenomai-3.0.10 | 2 
                    atop-2.9.0 | 1 
              containerd-1.7.7 | 1 
           dmraid-1.0.0.rc16-3 | 1 
              gcc-final-11.4.0 | 1 
              gcc-final-13.2.0 | 1 
glibc-2.38-27-g750a45a78390... | 1 
            host-erlang-26.0.2 | 1 
         host-gcc-final-12.3.0 | 1 
                host-go-1.21.3 | 1 
igh-ethercat-f5dc109176400f... | 1 
                   json-c-0.17 | 1 
              libarchive-3.7.2 | 1 
              libostree-2023.7 | 1 
       libzenoh-pico-0.10.0-rc | 1 
     linux-5.10.162-cip24-rt10 | 1 
            linux-fusion-9.0.3 | 1 
                    ncmpc-0.47 | 1 
                 ntpsec-1.2.2a | 1 
                   oatpp-1.3.0 | 1 
                    php-8.2.12 | 1 
                    pppd-2.5.0 | 1 
           python-bcrypt-4.0.1 | 1 
           uboot-tools-2021.07 | 1 
             util-linux-2.39.2 | 1 
                 weston-12.0.1 | 1 
               xwayland-23.1.1 | 1 
                    zeek-4.1.1 | 1 
                  zeromq-4.3.5 | 1 
               zziplib-0.13.72 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |           atop-2.9.0           | NOK | http://autobuild.buildroot.net/results/50844de8f428e176e76fc6cf7958d4862ba16b68 |     
    arc      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/67e5e7e29a9db5884d766e6907efbd4bd33166c5 | ORPH
   mipsel    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/9092c0be4fccda75f575fb86cc41f87bb3e40082 | ORPH
  riscv64    |        containerd-1.7.7        | NOK | http://autobuild.buildroot.net/results/3b0c1613dc02e0c73ebb5347dda97e151ddb3912 |     
    m68k     |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/ab7e3ac6f17761cb5f835c57a69fa1ab4e69e048 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/d31cbccd4fa8eac14182427a13287bb854b47cac | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/a8cd7d1f23de406505e2b092ae642ba6556b9e06 | ORPH
  riscv64    |        gcc-final-11.4.0        | NOK | http://autobuild.buildroot.net/results/4ee5069091364914fe2e2b9b798539f34ded6050 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/0cc1f29365d771d696d04194628e453207afa388 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/1bc427565fd46a0090de752ac4dad968903911b5 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/9285e05232ef6e5536bed68a840299e22e2c9305 |     
    m68k     |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/070a7143e802418a03bcc8cba51667051f183720 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/0e9d0c349d6db2a9a18a0ddd8704b0406f6b62df |     
 aarch64_be  |        gcc-final-13.2.0        | NOK | http://autobuild.buildroot.net/results/02fef37adb604d6fb89fd8727935939d6c9b3194 |     
powerpc64le  | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/04b8fb0a9545ab6f34904192f73bf77b27831966 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/13d2d6417c13d0c864ff0bb73991b76ca7836ecf |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/9c5df6dcb3381efb52e1bf19812c731f3aee29a6 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/e0a9bfec530c1928e8150f9b475a247de619dafd |     
   x86_64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/3e16e24242cc3887d3bb0e34902146267e56ba1f | ORPH
   s390x     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/28e14493643c9efe3bf9d9b2e93e3d5a6c4cd892 | ORPH
  sparc64    |       host-erlang-26.0.2       | NOK | http://autobuild.buildroot.net/results/a6bb94912d4b229a26e06e8f9541977df6517c13 |     
  powerpc    |     host-gcc-final-12.3.0      | NOK | http://autobuild.buildroot.net/results/08ee263146ac57651a4a3b556e986ee1ad1f5524 |     
  mips64el   |         host-go-1.21.3         | NOK | http://autobuild.buildroot.net/results/5237d2c1e10f18dffdf7e823a6bdf7ec32afa2e6 |     
   armeb     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/518912c42244ad23439aa43d846419205f91c9bb |     
  sparc64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/bbd19dfc27175301314504f1934206e5bcb236a6 |     
  aarch64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/b7abc4160cd1ccd160d419e2b2ebcbf228ca5544 |     
  aarch64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/bdb56c818dd9c34b388fe537f4ac48873a42d173 |     
   mipsel    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/00328a3985a8a41ea9edaf72079cfe5405b7c198 |     
    i586     | igh-ethercat-f5dc109176400f... | NOK | http://autobuild.buildroot.net/results/0f693d0f2dce028215dab387bd9b2990ae92be88 |     
   mipsel    |          json-c-0.17           | NOK | http://autobuild.buildroot.net/results/523b35a979d59121fe4e18c38171792b06233940 |     
   armeb     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/9de88de867014d3a2500be1caa882ac02fa320e6 |     
  aarch64    |      libcamera-apps-1.3.0      | NOK | http://autobuild.buildroot.net/results/600f3049dbf9e4ea553d1031d4f1758f73c312cc |     
microblazeel |      libcamera-apps-1.3.0      | NOK | http://autobuild.buildroot.net/results/72807fd3e082218b07b28572eecdf5ba6f358ef0 |     
   mips64    |        libostree-2023.7        | NOK | http://autobuild.buildroot.net/results/b90d37873d02e4bfb3a8fab6e74479458290f40a |     
   sparc     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/4cbbfb9a746a534f2bee9c59f6fee56a1ca84a99 | ORPH
  mips64el   |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/36178c96ec0ead0cbe465190aa6129e51a95d467 | ORPH
    sh4      |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/ea54787888fe027f95d2576e972a050b98eeb12a | ORPH
    sh4a     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/e751cd50abe7ff94bc53c5de81a946a3e184916d | ORPH
    mips     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/baba63eee5ac627c1c2aa94956805ac9b730478d | ORPH
   mipsel    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/c53f4ad0bd792810c92d60aa9377191acaafb889 | ORPH
    arc      |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/0bae28ba9a17403dc42d6b956e98158295f5fb95 | ORPH
    mips     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/d5770e9d9b5c5e9a9bab60cc03ffcb5f926f5719 | ORPH
    arm      |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/21359dddf2f13a4cb3048839e035bc9a906b8ccc |     
   nios2     |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/abf3121f15d103c6b8992f9206680e1c2f7b1591 |     
    or1k     |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/84273a878f7054488f70d389885873ee669c4876 |     
  powerpc    |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/4000dcbe5e421c384813d1d3c5966cc196af11cb |     
    or1k     |    libzenoh-pico-0.10.0-rc     | NOK | http://autobuild.buildroot.net/results/624fa9be100a65cfbcf55239256e750df2aad010 |     
   nios2     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/1f9d057a6b40c0635b138540d906fef38aca8597 | ORPH
   mips64    |           linux-6.6            | NOK | http://autobuild.buildroot.net/results/0ebedd08de8f8e62e34c6c9ccd0f746340e024d8 | ORPH
    mips     |           linux-6.6            | NOK | http://autobuild.buildroot.net/results/e54dddec45070efc5c8adf3abd11cbba6e11d82f | ORPH
    arm      |           linux-6.6            | NOK | http://autobuild.buildroot.net/results/ead4644a8b7798b5b68696de7135ab9b7887f158 | ORPH
    arc      |           linux-6.6            | NOK | http://autobuild.buildroot.net/results/b9b76f414c67a684f58fe0e9f6b07acabce015c3 | ORPH
    mips     |           linux-6.6            | NOK | http://autobuild.buildroot.net/results/147aefe47155ed4f246c9924e1e09e1181332eb8 | ORPH
  mips64el   |           linux-6.6            | NOK | http://autobuild.buildroot.net/results/308291e01fd8beef15ac16b9079b3270e19f6be6 | ORPH
   mipsel    |           linux-6.6            | NOK | http://autobuild.buildroot.net/results/1025f048f2fffd25e0077f615faa3dc57ae73b35 | ORPH
  sparc64    |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/70aa40ccba186b5975863abc35ef50b93dc1acde | ORPH
    mips     | Makefile:727: target-finalize  | NOK | http://autobuild.buildroot.net/results/60b2f03d8fb8bfb9847677f8c0ea1d7e55b66544 |     
    m68k     | Makefile:727: target-finalize  | NOK | http://autobuild.buildroot.net/results/a862398c625de14cfac00dc5fba1499ba3ea90b6 |     
powerpc64le  | Makefile:727: target-finalize  | NOK | http://autobuild.buildroot.net/results/ebe2041a29527d2c56bd3a185cc217aabe2295e7 |     
    i686     |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/fb97d7bfe643c00612f4dd509c382a70d7fc53f2 | ORPH
    sh4a     |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/cafffb6ad03865b8c60804a38bb99554318c4d1c | ORPH
 microblaze  |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/6b5c8ecaeb9f03a28a3e42bb952c1b92e6f3ec6c | ORPH
  sparc64    |           ncmpc-0.47           | NOK | http://autobuild.buildroot.net/results/7baaacc8dedb906f99697c5dfd31112f35cdf821 |     
    m68k     |         ntpsec-1.2.2a          | NOK | http://autobuild.buildroot.net/results/d4a899c0c6da6fffb4d056f0b7998c37f77b3730 | ORPH
microblazeel |          oatpp-1.3.0           | NOK | http://autobuild.buildroot.net/results/c5fadd9df562de34e5be4f759078f5f843d3b715 |     
    arc      |          openrc-0.51           | NOK | http://autobuild.buildroot.net/results/7f9cb6c7e6ac79685283488816cfa3f3258d7b7c |     
    arc      |          openrc-0.51           | NOK | http://autobuild.buildroot.net/results/88d86cdd3b649e3249f8527a0cb861a89efabf28 |     
 microblaze  |           php-8.2.12           | NOK | http://autobuild.buildroot.net/results/1f0c9cc25b4696816c47a7e2fa57f081711d5a3c |     
   sparc     |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/3395b669b97ee5456a49938ac6567f6c941eddef |     
   armeb     |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/6bb75405d5dd67e7bd7f1c2241aee7fa31da1f2a |     
 powerpc64   |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/39b56990e81063babef370a0361a4bbef62de2b4 | ORPH
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/7efca9b8a79ec300fb1a42aa2ea57bf1066f26e7 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/11520bc6ebb2dff35b0c6b9e8a1436385da4f110 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/81efab0ceb683c147b2dd47de9ac8bd6ce24e37d |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/8d23262530dcbabdcd984c789c3f8c5b1a613fa6 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/f3bc3e1357bc07a07695ea08116d9ffc6e62faf3 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/122d488ade331b4972d9837894c68119f9bbef24 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/b0fde2d2cb3f5fb4065fe5a90eb0878f2805f60a |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/da3025348c079f66a761d39d4574784c977e3ce1 |     
    arm      |       util-linux-2.39.2        | NOK | http://autobuild.buildroot.net/results/f278c955bb2d4e175800ff97a5c59d4e3eb3b209 | ORPH
   mips64    |         weston-12.0.1          | NOK | http://autobuild.buildroot.net/results/7311bbd22552d67bd9379930bced7d1664b37567 |     
    or1k     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/46b86f45bcc3444fb2094400a038a26208d45903 |     
    arm      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/4cdb28b6f41b953931ea391ecc16195be79f49da |     
   mipsel    |        xwayland-23.1.1         | NOK | http://autobuild.buildroot.net/results/651e1bcb0170766cae9b793b4fd649c14017f65a |     
    m68k     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/b969f9b00cdfdc24daffdafaaffeae81c8c8fc23 |     
powerpc64le  |          zeromq-4.3.5          | NOK | http://autobuild.buildroot.net/results/06c5e6efa5f1293466821ba288e688fcfb7b8126 |     
    m68k     |        zziplib-0.13.72         | NOK | http://autobuild.buildroot.net/results/010d6f45b98f632f993652a4257e39ae2280738a |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                  linux-6.1.60 | 3 
  gobject-introspection-1.72.0 | 2 
            host-binutils-2.38 | 1 
               host-go-1.20.10 | 1 
               host-runc-1.1.7 | 1 
                   perl-5.36.0 | 1 
   python-pycryptodomex-3.16.0 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/c2b934afc307cde196ddca6b65185810accaae52 | ORPH
microblazeel |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/34241924b9cc05ba06cc2e96b20cbfbb0e4d1a3d | ORPH
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/1b7d32d569ca32b3792cc5ce1188990e0449bca9 |     
  mips64el   |        host-go-1.20.10         | NOK | http://autobuild.buildroot.net/results/1012fe5b841853c99bdcf4f1f1039559717ae17a |     
  aarch64    |        host-runc-1.1.7         | NOK | http://autobuild.buildroot.net/results/b2950ebb7627dc6bc79bef793214d99bdcb6028e |     
  powerpc    |          linux-6.1.60          | NOK | http://autobuild.buildroot.net/results/f74d642ebfeacf925cced538f4171d45fbc04413 | ORPH
   mipsel    |          linux-6.1.60          | NOK | http://autobuild.buildroot.net/results/bb9da1f4767586397a98fca28b4ed442802b5542 | ORPH
   arceb     |          linux-6.1.60          | NOK | http://autobuild.buildroot.net/results/f192184cadc7b19fba035ef1414e24a58d162e9f | ORPH
    arc      |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/f97a4ff7a7270b8d73b0b53e369c9c148d6df845 |     
    arm      |  python-pycryptodomex-3.16.0   | NOK | http://autobuild.buildroot.net/results/843064cc5b5e6bcf4e58bc0a04c6dd7edac25a1c |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                       unknown | 4 
        util-linux-libs-2.39.1 | 2 
                   bird-2.0.12 | 1 
check-11970a7e112dfe243a2e6... | 1 
           dmraid-1.0.0.rc16-3 | 1 
             host-delve-1.20.2 | 1 
     host-moby-buildkit-0.11.6 | 1 
              host-rust-1.71.1 | 1 
                 libcurl-8.4.0 | 1 
               libglib2-2.76.1 | 1 
          linux-5.10.162-cip24 | 1 
              liquid-dsp-1.5.0 | 1 
             util-linux-2.39.1 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/98aa5f12851aebeda923a35b2b508cdfcc3165e1 |     
   arceb     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/276f34feedd26b37a7f463e74d0248f06ecefe7e | ORPH
   sh4aeb    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/6d57d7b869e923e7753afa0084eed4e97740f954 | ORPH
  riscv64    |       host-delve-1.20.2        | NOK | http://autobuild.buildroot.net/results/2430b3abd0cbd7126495967e195c24325e167a36 |     
  riscv64    |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/db027ab0f3237073b5a93201b133c29b056c5c17 |     
powerpc64le  |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/b774675992b83dda32fa61859a4b06280624620e |     
  riscv64    |         libcurl-8.4.0          | NOK | http://autobuild.buildroot.net/results/4fc80df10950412e83d4d70926e55f963dc56954 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/084c894f067afc5af2c4209f941e50f9e0dd015e |     
  powerpc    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/f48d0314476e04e8a82c3dd56d96cc8ca17c0e9f | ORPH
    i686     |        liquid-dsp-1.5.0        | NOK | http://autobuild.buildroot.net/results/b18e3984da826c5e257fcf8940f4ac5ff9a9f60f |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/29290c613fd62f20f5b7b154d2d02001f3ca7917 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/728b8de0d5426422146cbedff2ebf71c49d4cd85 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/d969dd8545b8d97d8c8c17b4d967c0f8d3d172dd |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/1be3a8282634cd827c9ad57c774a912bffb4ab6a |     
    arm      |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/a69dd9d5d02ed9260623c7b1e0e242624b78bc5f | ORPH
   mips64    |     util-linux-libs-2.39.1     | NOK | http://autobuild.buildroot.net/results/8372412a0001ff5abbacbcdc5043f3f5e5ae339d | ORPH
   x86_64    |     util-linux-libs-2.39.1     | NOK | http://autobuild.buildroot.net/results/ebac1adbed61b3be6c5c7c31039503c82fbaeae2 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
