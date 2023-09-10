Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8EF8EC8748
	for <buildroot@archiver.kernel.org>; Sun, 10 Sep 2023 06:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D941E403EC;
	Sun, 10 Sep 2023 06:33:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D941E403EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LucmzcWgVwsu; Sun, 10 Sep 2023 06:33:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8273D404B6;
	Sun, 10 Sep 2023 06:33:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8273D404B6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6DF491BF28F
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 06:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2210C404B6
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 06:33:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2210C404B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SPrpPOH8IKDx for <buildroot@lists.busybox.net>;
 Sun, 10 Sep 2023 06:33:26 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1C1AA403EC
 for <buildroot@buildroot.org>; Sun, 10 Sep 2023 06:33:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C1AA403EC
Received: by mail.gandi.net (Postfix) with ESMTPSA id E7F78FF802
 for <buildroot@buildroot.org>; Sun, 10 Sep 2023 06:33:22 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 10 Sep 2023 06:33:22 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20230910063328.2210C404B6@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1694327603; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9hH9jaOvAjQo2KWYEGtdeDtCMVf2q/YoNKr+ix5vYT0=;
 b=eYX4YQIBaYgE9T1xy1+/lhR0/YN3PNSygc1EImQ4hNVsnPDYjS+/BzSxGLJ8ROqrR6xZGF
 9WWFYRqFgyWC1uvmH2PD5kLd+a+PKyw+qQgjOmiJGv/95GFLG+Tdrw40N4BRa1LOgR95Qf
 7/o2XjlEHxH1lWFWo6GV7aqindx8uv/+sLI93JSiZcpRds6vwh9Uogv8s+pY19hdzJasV2
 lKTCDsvS6jN7qXOFjCL5AJkH70dZwnApt9xeX94TgXXdqqQwm5RADE2e5YZmFtdENC9ZNe
 6GXv0KsSHkg/J7MYcHFPnE0cx3eHqWY8U8zonjEFE8DWynWPN/G62KrLaKLyAg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eYX4YQIB
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-09-09
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

Autobuild statistics for 2023-09-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  8  |  0  |  0  |  8  |
  2023.05.x  |  6  |  5  |  0  | 11  |
  2023.08.x  |  5  |  5  |  0  | 10  |
    master   | 51  | 50  |  0  | 101 |

Classification of failures by reason for master
-----------------------------------------------

              libxcrypt-4.4.36 | 6 
                  linux-6.4.14 | 5 
                    brltty-6.5 | 3 
        host-sentry-cli-2.20.3 | 3 
                  boost-1.82.0 | 2 
check-11970a7e112dfe243a2e6... | 2 
                    crun-1.8.4 | 2 
              host-rust-1.71.1 | 2 
               apcupsd-3.14.14 | 1 
                  cairo-1.16.0 | 1 
                 coreutils-9.3 | 1 
                 dash-0.5.11.5 | 1 
  gobject-introspection-1.76.1 | 1 
             host-delve-1.20.2 | 1 
                host-go-1.21.1 | 1 
                  jack2-1.9.21 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
               libcgroup-2.0.3 | 1 
           libfreeimage-3.18.0 | 1 
                libglvnd-1.4.0 | 1 
                libxml2-2.11.4 | 1 
     linux-5.10.162-cip24-rt10 | 1 
               linux-pam-1.5.3 | 1 
              liquid-dsp-1.5.0 | 1 
                 openal-1.22.0 | 1 
                    opkg-0.4.5 | 1 
                    php-8.2.10 | 1 
                     pound-4.8 | 1 
                  reaver-1.6.6 | 1 
rtl8188eu-f4af53305cb1e9a0d... | 1 
                       unknown | 1 
                 wavemon-0.9.4 | 1 
           xtables-addons-3.22 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/b00e27137e71cd1ef69b506bafb5933b14c54929 |     
    or1k     |          boost-1.82.0          | NOK | http://autobuild.buildroot.net/results/99139040d07eda980ab8c1597ad989d83a1032da |     
    arm      |          boost-1.82.0          | NOK | http://autobuild.buildroot.net/results/7ca6cf4adc28984bd2b7c401ebff692efa1c07e0 |     
powerpc64le  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/b2c71b2017116d67984e958d0f7cba078736313b |     
 microblaze  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/a13e15bb1b47ac6ab3cf745ef1dc35cbb5b91aac |     
  mips64el   |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/e0d90267e25f7f2628bdc1eee177c59924180a96 |     
   xtensa    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/8482a90c8d29ade4ab7c41eed06afa634c418d0b |     
   arceb     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/2cc2ee756f5bd5502ee9597e54eb8e86c6936729 | ORPH
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/c5651649ff4c376fa3d27d9be5586685b2a6981f | ORPH
   xtensa    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/aa1eb8e8a0e0fac07142c147311e67062c35b52f | ORPH
    m68k     |           crun-1.8.4           | NOK | http://autobuild.buildroot.net/results/1f9a9b879b5e780409bb3dd0f2c8a529bed44ac2 |     
  riscv64    |           crun-1.8.4           | NOK | http://autobuild.buildroot.net/results/ed82a04c27a5f041019b3ba1bfb31711e0dd6d8a |     
   xtensa    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/d65f632761342259d75bd3b6d056cd065f7421db | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/7ec6d2bbc3a77c17d4e51c70561bfb960d7aa672 | ORPH
  riscv64    |       host-delve-1.20.2        | NOK | http://autobuild.buildroot.net/results/5aa6491b2a9beffdd3520fe41f4eeb5e54181852 |     
  aarch64    |         host-go-1.21.1         | NOK | http://autobuild.buildroot.net/results/09a27376ba884f5fdf62d11f4ecf236bf40e1856 |     
   mips64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/c61e232bfd907ef7ea00d306d1fce933a2a11aa1 |     
    i686     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/77a958ecb25fbf070445039112b79089826d35b7 |     
   mips64    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/71fd51824db0531f3f971d76fc44d9dce68ae40c |     
 powerpc64   |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/3dddc0bf9c02fd8f61daac3885a45d0d8e78a2fd |     
   sh4aeb    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/f5b600dfc1a8592f0a85e208483b8350c78dfbf6 |     
    m68k     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/b7c38e9f738427d514f0a2024bf149ad1293ee7c |     
   x86_64    | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/eb92ac4bbfc2aeadf1f5808d225d93aeb9e6fa11 | ORPH
  aarch64    |        libcgroup-2.0.3         | NOK | http://autobuild.buildroot.net/results/aa397168f7625a213f3c15a9e647b26191beff4f |     
   x86_64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/4a5b6dea1d5c7ad19ccaf517bf3dea900f6ee0ca |     
  mips64el   |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/7feea792d8b49284d62b4546db20d81c598c374d | ORPH
 aarch64_be  |        libxcrypt-4.4.36        | NOK | http://autobuild.buildroot.net/results/7bd43371eeb3d23521eb861ebdd1b0b000c9ccf7 |     
  sparc64    |        libxcrypt-4.4.36        | NOK | http://autobuild.buildroot.net/results/3680cd6254392a7e6a20df451cf2e54ae96feb8c |     
   nios2     |        libxcrypt-4.4.36        | NOK | http://autobuild.buildroot.net/results/83bd970fc27de5140520a34d2b3b187ff9b3e74a |     
 powerpc64   |        libxcrypt-4.4.36        | NOK | http://autobuild.buildroot.net/results/54500026bbbae8346f474f5a08c70c48e6c80a39 |     
  aarch64    |        libxcrypt-4.4.36        | NOK | http://autobuild.buildroot.net/results/94dd2c8b96e5b92e83d7bc2e66743f8d798b0288 |     
   mipsel    |        libxcrypt-4.4.36        | NOK | http://autobuild.buildroot.net/results/871ac2ec958ea8c5f78f82e890a03f8d34fdb167 |     
    arc      |         libxml2-2.11.4         | NOK | http://autobuild.buildroot.net/results/4a3edc30ed97791c8085abc2046856f4721b05e6 |     
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/5116034a22eb58bb1f3e5d6a93abafc32284a20b | ORPH
  powerpc    |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/83dd0da0f5379c118ea020f0dea12b25c3920a15 | ORPH
   armeb     |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/827a8e832016d793fdcda4072d4545670a1b9207 | ORPH
 powerpc64   |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/e5f7ea50d73ad34a5509b5a5dc85511d4c79c154 | ORPH
  mips64el   |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/aff539fe420e23bc24f9fc355c4726d2b1264dbe | ORPH
   sparc     |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/783c6e6c31ddc3d84d22fbcb8da4e6c896194e8c | ORPH
    arm      |        linux-pam-1.5.3         | NOK | http://autobuild.buildroot.net/results/8cc7cbe2b0a4798e1865acc3b46a621a1434feae | ORPH
   sh4aeb    |        liquid-dsp-1.5.0        | NOK | http://autobuild.buildroot.net/results/74369d7c1b70266b9c612ec1769860c7d57bc113 |     
    mips     |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/c6ba95e0075ef2bec0c5c471c7ed7376ea0dd71d | ORPH
    mips     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/89135883117fef9c683661ce2ca4ce74c9cfad77 | ORPH
   armeb     |           php-8.2.10           | NOK | http://autobuild.buildroot.net/results/4d5ba4ee339adcef20a7c0b0ec36aaf261c4c87e |     
  sparc64    |           pound-4.8            | NOK | http://autobuild.buildroot.net/results/4edfffcd5d4383c57947d97139331e0bf2cb6155 | ORPH
    arc      |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/6e51827fea5190dfdb4f69add7188f77577b4a91 |     
  mips64el   | rtl8188eu-f4af53305cb1e9a0d... | NOK | http://autobuild.buildroot.net/results/f72cbb4e6b7a3545803d42109f23ab71f7b8677c |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/b6dbaa99700ecffc6f6c2af4a9be0c5626c71dc0 |     
  sparc64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/77c68c4b32e8b1792c63d0a5c18eda803f4fcd51 | ORPH
 microblaze  |      xtables-addons-3.22       | NOK | http://autobuild.buildroot.net/results/701ee950b4e431bc50b9db089a11ed5f247f53f1 | ORPH


Classification of failures by reason for 2023.05.x
--------------------------------------------------

                 coreutils-9.3 | 1 
               host-go-1.19.12 | 1 
                  linux-6.3.13 | 1 
                xenomai-3.0.10 | 1 
               zxing-cpp-1.4.0 | 1 


Detail of failures for 2023.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/768e8e3cd3f24eef207bf1ebbaa721290c6a02b8 | ORPH
   mipsel    |        host-go-1.19.12         | NOK | http://autobuild.buildroot.net/results/ea81cbb3acf2d48488b67622be8e46331131fec1 |     
    m68k     |          linux-6.3.13          | NOK | http://autobuild.buildroot.net/results/c04ca5469ed7eb962b9ac7187973298106475ac0 | ORPH
  mips64el   |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/0edb10f1939b0c6eedb07d02f3baf1398af0dc16 |     
   mipsel    |        zxing-cpp-1.4.0         | NOK | http://autobuild.buildroot.net/results/7a6e5db2f747fb4d1e052c2b56d9c8f7d0d4fd64 |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

              host-rust-1.71.1 | 1 
               pipewire-0.3.74 | 1 
                       unknown | 1 
             util-linux-2.39.1 | 1 
               zxing-cpp-2.1.0 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/8ac12cbb7edd0981ae98834d763b8e89108d6492 |     
   nios2     |        pipewire-0.3.74         | NOK | http://autobuild.buildroot.net/results/9f199c86728bf83e8283247c217cf36ac1ffcd2b |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/70a8ba0d1b7798c0a5c09930e1b487911f53c656 |     
   xtensa    |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/e039409f51e21161f90c209dc8e8341d80295684 | ORPH
   mipsel    |        zxing-cpp-2.1.0         | NOK | http://autobuild.buildroot.net/results/0daa4245675cfb6d90f0bb76fc25e05943a81290 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
