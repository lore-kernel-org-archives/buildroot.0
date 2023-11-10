Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67930C4167B
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 06:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70AEA40459;
	Fri, 10 Nov 2023 06:37:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70AEA40459
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a_5nVTehHLvO; Fri, 10 Nov 2023 06:37:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FA4F40474;
	Fri, 10 Nov 2023 06:37:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FA4F40474
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7E15B1BF3A8
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 06:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4177482F80
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 06:37:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4177482F80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oPApMy4Gg7IR for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 06:37:52 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B310282F03
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 06:37:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B310282F03
Received: by mail.gandi.net (Postfix) with ESMTPSA id 814912000B
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 06:37:48 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 10 Nov 2023 06:37:48 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231110063754.4177482F80@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1699598268; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XhyaSG8OanM8F1/yz7vnjKJ1EpbYPfhUMEiIZNzE/WU=;
 b=Jno4h0xARcahmG/9avZD/trCiDByUmLdv1Y1QHXfGUesPqOFLWXZgI52JlQm6X7Cg/g0WP
 adx1ZbkAnYjo9paxDUbtPYuKQhd64o+SOQ8SYRnweJYWZPq1y2qlAlFrWOkQlO/40Zpv7/
 d+A5AgGk+ILXIYURujPMjEV2eikP0nOS6c9zW6pzKoEcNC3lkBW3r9fR9vrH/OHy0bFMt8
 G1Tp71SiwscajwAATCXIR6xCrDzuzx1AzM4uvRylniNB1wxY59Xd2M7iOOKS7kmJt+N1SY
 NQkHSbFeCB65BTuC50E5G+JMHqe9POVsp1tAuSGvYJu//h0XicWJLb2ZeeIwlA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Jno4h0xA
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-11-09
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

Autobuild statistics for 2023-11-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 12  | 10  |  0  | 22  |
  2023.08.x  | 11  |  9  |  0  | 20  |
    master   | 90  | 99  |  2  | 191 |

Classification of failures by reason for master
-----------------------------------------------

                libressl-3.8.2 | 10
              gcc-final-12.3.0 | 5 
                     linux-6.6 | 5 
                elfutils-0.189 | 4 
 Makefile:727: target-finalize | 4 
               mariadb-10.11.4 | 4 
                   bird-2.0.12 | 3 
              gcc-final-11.4.0 | 3 
  gobject-introspection-1.76.1 | 3 
              host-rust-1.71.1 | 3 
                       unknown | 3 
         gobject-introspection | 2 
                host-go-1.21.4 | 2 
        host-sentry-cli-2.20.3 | 2 
              libarchive-3.7.2 | 2 
          libcamera-apps-1.3.0 | 2 
              libostree-2023.7 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                   openrc-0.51 | 2 
                    php-8.2.12 | 2 
                    pppd-2.5.0 | 2 
          refpolicy-2.20231002 | 2 
                xenomai-3.0.10 | 2 
               apcupsd-3.14.14 | 1 
           at-spi2-core-2.48.3 | 1 
                    bat-0.23.0 | 1 
                  boost-1.83.0 | 1 
check-11970a7e112dfe243a2e6... | 1 
                 coreutils-9.3 | 1 
                    crun-1.8.4 | 1 
          cryptodev-linux-1.13 | 1 
                 dc3dd-7.2.641 | 1 
                 dhcpcd-10.0.4 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                     file-5.45 | 1 
            gdk-pixbuf-2.42.10 | 1 
glibc-2.38-27-g750a45a78390... | 1 
host-go-bootstrap-stage2-1.... | 1 
               host-runc-1.1.9 | 1 
                  jansson-2.14 | 1 
               libglib2-2.76.1 | 1 
                libselinux-3.5 | 1 
              liquid-dsp-1.5.0 | 1 
                  monit-5.33.0 | 1 
            optee-client-4.0.0 | 1 
           python-numpy-1.25.0 | 1 
                    sslh-2.0.1 | 1 
             strongswan-5.9.11 | 1 
                 systemd-254.5 | 1 
                      tar-1.35 | 1 
               trace-cmd-2.9.7 | 1 
           xapp_xsetmode-1.0.0 | 1 
                    zfs-2.1.12 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/01d5a3a6057fad8ae2d68794b83343517025b5eb |     
   sparc     |      at-spi2-core-2.48.3       | NOK | http://autobuild.buildroot.net/results/d954d2531ef90714d8bf5230f561fc59d48d3fc1 |     
    i586     |           bat-0.23.0           | NOK | http://autobuild.buildroot.net/results/cf3b47acfcc71bff54734b600e405806fe00a2b2 |     
microblazeel |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/86a4d9c51d50fbd9cb8fb4b6ec5e031efe8797d4 |     
 microblaze  |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/3c4e89d9000321edb960871a7f61349462ebc71d |     
   armeb     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/612af7afad7ccf2c995b6fc4ad782d15a0452750 |     
    arc      |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/b716ace84d067b4e78e719df29adc89b4494ac3e |     
    arm      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/67f8ba2d8120e9d0e8008744089dd44e31211ec8 | ORPH
   sh4aeb    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/757a87f21805153fd9ed176947e3ac0a0f89fca6 | ORPH
   arceb     |           crun-1.8.4           | NOK | http://autobuild.buildroot.net/results/9c4488d5d26e575f39bcbaed8e0793ed1cdb8cd5 |     
    arc      |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/29b6e9eff6d2c18207179802f7eddcd5acf2a5e6 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/58e6b4c842b08b8eef603e48197cd3ff6ab9783f | ORPH
    mips     |         dhcpcd-10.0.4          | NOK | http://autobuild.buildroot.net/results/6577da610caf7c7434073f6dcd3274bf36246aa5 |     
    arm      |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/bb931017073d80e97fddb6eb86b2ddad88c6722f | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/aa5df7be783e3799d9856e96549226da779a447c | ORPH
    sh4a     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/a3d7d18d1b157dd1d4e39052ec8c0f8628a64522 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/ffc576a8c5ebf2d10fba99f312ef9a9324a1aed3 | ORPH
   arceb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/81bbaedbeeb934a55ab5ea013d499813b36ca133 | ORPH
    arm      |           file-5.45            | NOK | http://autobuild.buildroot.net/results/f4b645405ad855292c8d77b09a1c074f469bd904 | ORPH
   x86_64    |        gcc-final-11.4.0        | NOK | http://autobuild.buildroot.net/results/48df4e7b36def053599d3edf12f9a3e8ee7c9c8a |     
   x86_64    |        gcc-final-11.4.0        | NOK | http://autobuild.buildroot.net/results/afe704a328daadb17ff3f372f7b50350f9852aeb |     
   arceb     |        gcc-final-11.4.0        | NOK | http://autobuild.buildroot.net/results/ce356f085330232e0d4bbfcc0f278cd5a69fa1aa |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/7429cfbd48291aa866f6c55de9255e27136af6db |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/9cbfe4dbf69444005501d76d1bef0437d230d35d |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/9c79c68b6c074d2cadc75b305d53613b4cc116fe |     
 aarch64_be  |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/142876fc58428b6da74ef0f8b0fa2e8d29461352 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/9106812fd3c755ab2e66dae320f903894c96a7c0 |     
   sparc     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/301a16a57ae0de68301cdd6315645dd1273c6292 | ORPH
 powerpc64   | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/e13343083e26a7a27e4a442421727b0df36517ab |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/a52d84a00a7a6e28c4716ee6f7eecbe252165800 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/f00dbc373773cc80e91b7d4235b075d5a19492c8 |     
    i686     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/34d9392e680be03a740ea7485c55494fb7536ead | ORPH
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/f5c0815dca33c67f8f94f71f39c04f08df6dcfb2 | ORPH
   s390x     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/4737d64a257deadb3ee3299fdfcf36010e385e7d | ORPH
    i686     |         host-go-1.21.4         | NOK | http://autobuild.buildroot.net/results/3128e673cd58fe62a776297b389d6846eaca9758 |     
    or1k     |         host-go-1.21.4         | NOK | http://autobuild.buildroot.net/results/dd31e920b324998f9505a556b1b128e94eab21ad |     
  mips64el   | host-go-bootstrap-stage2-1.... | NOK | http://autobuild.buildroot.net/results/be5bde61588ffae324a82082962dd4eb233b2654 |     
   arceb     |        host-runc-1.1.9         | NOK | http://autobuild.buildroot.net/results/a89eacf26b8c4f8bb9cd7e385f95011e038a8d8d |     
powerpc64le  |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/524d1deabce89de2667b2aa66564009d0ecb5b9e |     
  sparc64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/ed0b940c11296ea1bc3ecc48bd266348070b5673 |     
   x86_64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/8b2062152ad24e9590cbc46989820a5d9c16e91f |     
    i686     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/ad952be8a18cc4bd6deee79a974cec9198a66637 |     
microblazeel |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/bffa743776b496df4a04dd96fa5dabdebc095dea |     
   mips64    |          jansson-2.14          | NOK | http://autobuild.buildroot.net/results/0a3ef5b97a7c0413db63ba15587dc671b454b92f |     
 powerpc64   |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/a4951e278f8f432ccfacb99776429aaef0e999e8 |     
    i686     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/ba10c69aa7cb97e3aa5109f99bbd4a56cb8c3d73 |     
   sh4aeb    |      libcamera-apps-1.3.0      | NOK | http://autobuild.buildroot.net/results/f020997d103c70fae91fd8e0dc7ef787fe7a90bc |     
 aarch64_be  |      libcamera-apps-1.3.0      | NOK | http://autobuild.buildroot.net/results/2929f4fb60cbe36416b2bcda00e190304bd84860 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/a879c3dbf6329dbee11ed8d02a55521405319b73 |     
powerpc64le  |        libostree-2023.7        | NOK | http://autobuild.buildroot.net/results/d539488f647f4456b70daddcbde6876fd5a8e920 |     
 aarch64_be  |        libostree-2023.7        | NOK | http://autobuild.buildroot.net/results/ada185b6f922d43513ed37a72af32f752e50669f |     
microblazeel |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/ef0dbf76a002937f7944bb0ecdb60b6aae268705 | ORPH
  powerpc    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/b5ac9ac853012ed0db56cb75791716a639066b3a | ORPH
   s390x     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/ae14bf6988586cf3e3651d38497cfa5dcfdfc79b | ORPH
   nios2     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/95d1f597722c8036776e081aae1cd6a627831dc0 | ORPH
 powerpc64   |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/9bab41a46cdef0097014bffdf920ef10a8ff939b | ORPH
   sh4aeb    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/6f2bc0b5352c76f400690ab6f7292df023a0fa80 | ORPH
   arceb     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/5a429a0442824d1bd66121dcdbfc460b42cdb956 | ORPH
   s390x     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/f1e055fb988d7d4f4f6349da0ca268099acc963c | ORPH
microblazeel |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/4dcf0ca4b53aeb0ef03f6aae756ec2787cf5d27f | ORPH
 microblaze  |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/24b31ecebba1cd06fedd7a8e9533859b5707073e | ORPH
   sh4eb     |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/432a78d6eb4283c1beeb08d7b7980a003108fd9b |     
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/b9b07a42d8dfaf47fa2cfe4d19938ecabfa926d0 | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/7f5a2d8b7dd98838fe186074328656168e9bc47f | ORPH
  powerpc    |           linux-6.6            | NOK | http://autobuild.buildroot.net/results/3dda23a8c6a2b1821cb75aa7c70c93452e51b004 | ORPH
   sh4aeb    |           linux-6.6            | NOK | http://autobuild.buildroot.net/results/508b61643384816ece08d895a92d5e8fa5b50b69 | ORPH
  powerpc    |           linux-6.6            | NOK | http://autobuild.buildroot.net/results/4da80f2abfb10f3765eb98a293cf1cee6d55cd7c | ORPH
   mips64    |           linux-6.6            | NOK | http://autobuild.buildroot.net/results/4ef8479d7369b8ac7d5c9374774b5496820f14dc | ORPH
   nios2     |           linux-6.6            | NOK | http://autobuild.buildroot.net/results/431e19d837ec2496c682316e55c908df1f271d73 | ORPH
    i686     |        liquid-dsp-1.5.0        | NOK | http://autobuild.buildroot.net/results/02c1c65a7f95412c71449b5ff237e2b2a4a68659 |     
   nios2     | Makefile:727: target-finalize  | NOK | http://autobuild.buildroot.net/results/0feeb83ae6b1b8968f0911d4573b2ec712838f90 |     
 powerpc64   | Makefile:727: target-finalize  | NOK | http://autobuild.buildroot.net/results/dfbc50bb2fd9105517b5ffcb8cd8c51720c349b4 |     
    arm      | Makefile:727: target-finalize  | NOK | http://autobuild.buildroot.net/results/51326826d81d7026b83bc68ce889160cb820c0f0 |     
powerpc64le  | Makefile:727: target-finalize  | NOK | http://autobuild.buildroot.net/results/d7e638e6a95c6ca13e733ff5f731cce95ac14175 |     
   mipsel    |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/c7944634d6ded8c708cf7754e65884f541efc4a4 | ORPH
   x86_64    |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/da95422d4eff18d601da7c69052c33db1a70e1aa | ORPH
    arc      |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/9594b553f4aa8d8169acb6600b0d30be80770da3 | ORPH
microblazeel |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/6ddbe95e3f676a7118cd19f2b5183e5bfc980dc5 | ORPH
    m68k     |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/203d6bc6878ecffe1173a6fa2e388353315c1e8c |     
   xtensa    |          openrc-0.51           | NOK | http://autobuild.buildroot.net/results/e1ac475b85cd5b2268f091f50baba308b58fcd81 |     
    arc      |          openrc-0.51           | NOK | http://autobuild.buildroot.net/results/8efc88562650cc4dad9df2effbff8ddba330a9e8 |     
    i686     |       optee-client-4.0.0       | NOK | http://autobuild.buildroot.net/results/e64e6c5b3da1022e27f616e8faf57c917e6328da |     
microblazeel |           php-8.2.12           | NOK | http://autobuild.buildroot.net/results/a460d2dc49443d7e09e3d720bbaa050b182ef26c |     
microblazeel |           php-8.2.12           | NOK | http://autobuild.buildroot.net/results/466cb279f7ab3668345ef530fe17ef70465bd0a7 |     
  sparc64    |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/5749801ea22bbbdaabdf4977460cb0c9b5d5aa42 |     
  sparc64    |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/4f4a9d34c1876e2d179d8cee30dd246fbc1ac505 |     
    i686     |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/2b2835687f68f70302599ba4b967f1a6c0bc6394 |     
  aarch64    |      refpolicy-2.20231002      | NOK | http://autobuild.buildroot.net/results/53101ad22d7083bde5639b8aec819aea5991fe86 |     
    mips     |      refpolicy-2.20231002      | NOK | http://autobuild.buildroot.net/results/a01123de9a8c1927060e7e4748666bebfc82ea44 |     
    sh4      |           sslh-2.0.1           | NOK | http://autobuild.buildroot.net/results/a0cc89a64c50c148ce654bde822b7e8573d7313a |     
  powerpc    |       strongswan-5.9.11        | NOK | http://autobuild.buildroot.net/results/c074d12bde60f94f8600206787a6426d00964108 |     
powerpc64le  |         systemd-254.5          | NOK | http://autobuild.buildroot.net/results/3a5ef0a5e8c06a6f003e239a293c52bb8cca4a23 |     
   x86_64    |            tar-1.35            | NOK | http://autobuild.buildroot.net/results/c6b906081ce5b8d76a6750208b9f327e65c49642 | ORPH
    m68k     |        trace-cmd-2.9.7         | NOK | http://autobuild.buildroot.net/results/7121b41016e96f7f57ca1a6fd3fca6282a0f538d |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/477242541d09d90d46f8817681d91be82f310ada |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/6a24a4ca8af4933d5b570b92333c279e7e860162 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/3d2d408ba7c6ab2f3d7d9b02f6be305f5522d034 |     
 aarch64_be  |      xapp_xsetmode-1.0.0       | NOK | http://autobuild.buildroot.net/results/2e970ce8c5debab4e6da6436686aa9ebbeecc2dd | ORPH
   xtensa    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/6348882e74345c9669888fe18350b2a7876dd424 |     
    i586     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/e90fdb0aee67ca0e5d25ae8414a10ab537d625bb |     
  sparc64    |           zfs-2.1.12           | NOK | http://autobuild.buildroot.net/results/ebeab256101bcba38c35fd55075c414e62f92caa |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                       unknown | 2 
                   bird-2.0.12 | 1 
                  boost-1.80.0 | 1 
             fontconfig-2.13.1 | 1 
fs/erofs/erofs.mk:46: /home... | 1 
               host-go-1.20.10 | 1 
               libglib2-2.72.3 | 1 
            ocf-linux-20171122 | 1 
                    putty-0.76 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/470c3fd989bccf54ce4e08d55532f078740a2c1f |     
    arc      |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/4a2113529b2463cdcc50f4a6c83e56c7c7c1d302 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/6b42fa463292bbaa383b0613b16bacfb65a3af2b | ORPH
   s390x     | fs/erofs/erofs.mk:46: /home... | NOK | http://autobuild.buildroot.net/results/dd08e4052ee8cb6e107e7f1941e12bd407e73a36 |     
   mips64    |        host-go-1.20.10         | NOK | http://autobuild.buildroot.net/results/7ba0fd88c25271526956cbe2051a6cb1cc3d17dd |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/ff1ddfdb4b9b9a21acfbb45b29acb88a20501290 |     
 microblaze  |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/f9eed995f6a2fbee1c5cfdfb5c3e390df9fac0af |     
    i686     |           putty-0.76           | NOK | http://autobuild.buildroot.net/results/bced4ccb9a151909f80cab58d8807d1711c5c7b8 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/ce72d0a1bb1457fddbff6c72719f4dd1c5a3888d |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/26fe9b5acdf4cd80118ebc1b933844917e3c1a0d |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                       unknown | 3 
                   bird-2.0.12 | 1 
       freeradius-server-3.2.3 | 1 
glibc-2.37-45-gb4e23c75aea7... | 1 
               host-go-1.20.10 | 1 
               linux-pam-1.5.3 | 1 
                     lxc-5.0.3 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/9494285778c85c0dd3b0aa2a19cec6eeb871c373 |     
    mips     |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/bc0e0443671c86b04972b8843e727534a291fcae |     
  powerpc    | glibc-2.37-45-gb4e23c75aea7... | NOK | http://autobuild.buildroot.net/results/e3d43aac28e5fbb48be56bf466a6e2d2673581ea |     
  mips64el   |        host-go-1.20.10         | NOK | http://autobuild.buildroot.net/results/b706de645a236915752fa033ac151d3195dbeee0 |     
   sparc     |        linux-pam-1.5.3         | NOK | http://autobuild.buildroot.net/results/d74e5f5f5d985d34abfc466eea41603d27f79348 | ORPH
 aarch64_be  |           lxc-5.0.3            | NOK | http://autobuild.buildroot.net/results/7a5fd2a62c64230293fe906d94906416633cfc57 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/7636d62c9fd7c64f8975bd5c6797d7f0e33c8fda |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/cef6bca6e0cc3a81fc006da7fd10c9afd720f7b2 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/05aa1333206dcc122403279a25dee66545ef839b |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
