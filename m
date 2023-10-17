Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 412A6CDB474
	for <buildroot@archiver.kernel.org>; Tue, 17 Oct 2023 05:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F3E940467;
	Tue, 17 Oct 2023 05:33:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F3E940467
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gVIwoooLWKvP; Tue, 17 Oct 2023 05:33:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F072140481;
	Tue, 17 Oct 2023 05:33:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F072140481
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 892D21BF3AA
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 05:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5732440481
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 05:33:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5732440481
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tvvpeKSI8jJe for <buildroot@lists.busybox.net>;
 Tue, 17 Oct 2023 05:33:50 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 83A9F40467
 for <buildroot@buildroot.org>; Tue, 17 Oct 2023 05:33:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83A9F40467
Received: by mail.gandi.net (Postfix) with ESMTPSA id C7370FF803
 for <buildroot@buildroot.org>; Tue, 17 Oct 2023 05:33:46 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 17 Oct 2023 05:33:46 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231017053352.5732440481@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1697520826; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3QVvkmIaTM4gfC5swR3NgxYvwdNFKq5gvCt4ay1xKQY=;
 b=MenW/UbgNQ5PG1MYQZZR1M8um7SIZ2KtTA5Hh5TLPKhZClAL9W2HoapGnANcFGGBGrEf8m
 aLe2R75oLeX+8wi4U+1UNnbOr9b8GJpKi45R5zIsEyUAb8vYxHTZHJjTpUBS60UVNn6Tj3
 WxezQjVVSW0Vey465ahU7Jky/qfSYht5sMnmkkkratnGvWpNqil6Na1ML8K5sOiep5EyXw
 qxr8t/iUWfaptKDHs0QGg16+Z+y35mL005KzH2n9RgHie8VA508Gm5iX97qkOyQ3fN8G0I
 HXv+CvVlmRz6puJoqBrd9nlxCjzdhS/JCmq6aEEYZtaldk06DiiCyWhHOUdl5A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MenW/Ubg
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-10-16
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

Autobuild statistics for 2023-10-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 10  |  6  |  1  | 17  |
  2023.08.x  |  9  |  8  |  0  | 17  |
    master   | 35  | 83  |  2  | 120 |

Classification of failures by reason for master
-----------------------------------------------

                 openrc-0.43.3 | 11
                elfutils-0.189 | 5 
              gcc-final-12.3.0 | 5 
                       unknown | 5 
                   bird-2.0.12 | 4 
              host-rust-1.71.1 | 4 
                    brltty-6.5 | 3 
                   linux-6.5.7 | 3 
         spirv-tools-1.3.261.1 | 3 
               apcupsd-3.14.14 | 2 
              gcc-final-11.4.0 | 2 
         gobject-introspection | 2 
         host-gcc-final-12.3.0 | 2 
                host-go-1.21.3 | 2 
        host-sentry-cli-2.20.3 | 2 
                libselinux-3.5 | 2 
               mariadb-10.11.4 | 2 
                 samba4-4.19.1 | 2 
             strongswan-5.9.11 | 2 
                  clamav-1.0.3 | 1 
             docker-cli-24.0.6 | 1 
                 fdk-aac-2.0.2 | 1 
              gcc-final-13.2.0 | 1 
 gcc-final-arc-2020.09-release | 1 
                    gdal-3.6.2 | 1 
  gobject-introspection-1.76.1 | 1 
                   gvfs-1.48.1 | 1 
              leptonica-1.82.0 | 1 
              libarchive-3.7.2 | 1 
     linux-5.10.162-cip24-rt10 | 1 
               linux-pam-1.5.3 | 1 
          lttng-modules-2.13.7 | 1 
luajit-41fb94defa8f830ce69a... | 1 
               madplay-0.15.2b | 1 
                  motion-4.5.1 | 1 
                    ncmpc-0.47 | 1 
              open-iscsi-2.1.9 | 1 
                    qemu-8.1.1 | 1 
                      tar-1.35 | 1 
                tinifier-3.4.0 | 1 
             util-linux-2.39.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/3fda5e213e234c5e6a68993f65752581fb93402d |     
  mips64el   |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/0aeec4a3803871c053b78ddd246569db0e871e79 |     
  aarch64    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/d8de7f53ca862073775cdaaba91fc0eacedaa0d7 |     
   x86_64    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/59838c9c452a6da12f839c5fc264b8626ad2b98f |     
microblazeel |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/757df23b799cd1a78a4d363e0310bfad8c479e31 |     
    arm      |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/6e3a2791c09fb4552a792a45e26acdb7c85dfe63 |     
   x86_64    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/4c8d8ab095634d1304107fa95fbfe3091a6fbf64 |     
   mipsel    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/29cb66913112b5b69ad76fae87379cbae3c8008f |     
 microblaze  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/461f3a2fea604fd09c4cb4ee7780993866fd46ae |     
    mips     |          clamav-1.0.3          | NOK | http://autobuild.buildroot.net/results/3851af91bfa218676be08532c97163c70655b958 |     
   x86_64    |       docker-cli-24.0.6        | NOK | http://autobuild.buildroot.net/results/c0ba9647824dd2dc811c31e7b999167f04d0be49 |     
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/c7945ee47b9a7809073f78fade5109600dac1c29 | ORPH
   nios2     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/9f33885ca57faa2d71681b6e73b17bc0fa39d4dd | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/64ea5ff7047e877cfd1d784effaa2a0a01a55216 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/c5adda4764be6acd58d00eb7156b38b5497c133c | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/e949eaeee275ce5846c8650a72354daa5cc01126 | ORPH
  powerpc    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/f480a21aaceb561728c5cd8590edf58f17c1591e |     
   armeb     |        gcc-final-11.4.0        | NOK | http://autobuild.buildroot.net/results/52028fb080cb8fd2ddef7758dd05089e9818a626 |     
   x86_64    |        gcc-final-11.4.0        | NOK | http://autobuild.buildroot.net/results/f024247de094da24a645f8b1d3aff14bca450013 |     
    arm      |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/62ee21d4fd3e167ab33b139af0e5a82ec2f956a0 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/f1c285ee1e553a8af5ddecc878edae35749770c3 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/bca5f0399a471317db808787f793867c88e70886 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/06b46b8d601459442a1d5345a19035e7fa84484c |     
  mips64el   |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/1a313e1826c9ce1081463cce6c79414f9dde0470 |     
   arceb     |        gcc-final-13.2.0        | NOK | http://autobuild.buildroot.net/results/6df2913b430bdb724c557d7371deef0a3cb84c9b |     
    arc      | gcc-final-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/02a3a5ec06ecf2ad45ef97d4904289056b2b3cb7 |     
microblazeel |           gdal-3.6.2           | NOK | http://autobuild.buildroot.net/results/876909f9fe65e346493b52514ca3547e3f62c169 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/e7db1125e2aaa132c54abb1a6aa39f3f2da95790 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/af4734507fa57dcd3d1cfbab54fc7f699a30f883 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/8e191bb18ea8450b141840946f8398587a39a372 | ORPH
   arceb     |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/c280255d220f31e50e154fd90c5fa8f58635ecaa | ORPH
    i686     |     host-gcc-final-12.3.0      | NOK | http://autobuild.buildroot.net/results/e9ad992c3207be3730d02e0138f5b681a97878c5 |     
 microblaze  |     host-gcc-final-12.3.0      | NOK | http://autobuild.buildroot.net/results/98b06bd8c86a7ae5ba9d6833d0d8a3ae4d5bfdfa |     
    i686     |         host-go-1.21.3         | NOK | http://autobuild.buildroot.net/results/0d3fb233e633c298c7da9f1a4e12bb621501541e |     
   mips64    |         host-go-1.21.3         | NOK | http://autobuild.buildroot.net/results/6157dcefa90db428fca618c75ea35135dcd3dae2 |     
    i586     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/4691f0ba915daf90874bf7b0ddfc4cc15a3e1b62 |     
   x86_64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/75e649816bff8f2ab1cd92987591d3211e690677 |     
   x86_64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/9b7ba59a8edd1ab4a218c3a3e4a122b992d19a5a |     
    mips     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/fbc64a800c40af319fb6ca3484f50d93d09d899b |     
    or1k     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/ed9d1738ff19550af1685f108c388cd0068bf49f |     
   mips64    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/7b1f3f5cd0def6705e6657711ae50a2e225b7e39 |     
    sh4      |        leptonica-1.82.0        | NOK | http://autobuild.buildroot.net/results/778b5a2d526e1d29aab7235ac2cfb8ef64dd611c |     
 powerpc64   |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/a0830f65dd1b05a9f0babd4bbfddb7da6ac046a2 |     
microblazeel |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/af4728390794fd56c93e40928780f4e53daaa4d4 |     
    arm      |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/828f2cd9806c4e5b79203e59910892c6bf63143c |     
    mips     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/ac15a77f03aa83a441d4d72b9f72399db9092156 | ORPH
  powerpc    |          linux-6.5.7           | NOK | http://autobuild.buildroot.net/results/695e5afde2aafc84f579fae0f691bb38d8367f76 | ORPH
  powerpc    |          linux-6.5.7           | NOK | http://autobuild.buildroot.net/results/ad951232536f132b44c97807d97c81a30899e032 | ORPH
   arceb     |          linux-6.5.7           | NOK | http://autobuild.buildroot.net/results/67740aec424b64310aa46d4c5ba5cd1f9b36974c | ORPH
   sparc     |        linux-pam-1.5.3         | NOK | http://autobuild.buildroot.net/results/1bcbaf9d77747779430d75d83813948bf298224e | ORPH
 aarch64_be  |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/2084e29757cfed4b2af8c58a0599d47fd7c2a4a8 |     
  powerpc    | luajit-41fb94defa8f830ce69a... | NOK | http://autobuild.buildroot.net/results/0160be69d39563ad51cbbe05bca0e63509b123a0 |     
    arm      |        madplay-0.15.2b         | NOK | http://autobuild.buildroot.net/results/dff541d8c573247ec375e84ecc22d073e92dbb74 | ORPH
 microblaze  |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/e2d3295c590657b961b7c2cfcd302fbf806f6f0d | ORPH
microblazeel |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/715be031ebde9daeb34c7af804a20b380409a26a | ORPH
  powerpc    |          motion-4.5.1          | NOK | http://autobuild.buildroot.net/results/56aec3b2ef0b0322287f833f07fdbb344cee3b1c |     
microblazeel |           ncmpc-0.47           | NOK | http://autobuild.buildroot.net/results/87cf4a58e481e0184c815946aad0e685deb5bbad |     
 microblaze  |        open-iscsi-2.1.9        | NOK | http://autobuild.buildroot.net/results/2ae4bfd7066c8d08b7380a6742220b2cefce2bcd |     
   x86_64    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/580f71a4ad59b9342812f035dd798233b4d674a9 |     
   mips64    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/40ae25ad4f1b75dd168d01b433d90047d7d0b2cf |     
powerpc64le  |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/2ff8adc8ddf55a05ae78e4965210f01ea7a54e05 |     
  aarch64    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/67dae982d7c8ced5574b2d35f059ea2f7583629e |     
  powerpc    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/b2648e683fcde22ddb9ba5ef9d675f089d3ddcf6 |     
  sparc64    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/a77b650fd5c32e94805fa6040b92e8d1528bcb17 |     
   sh4eb     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/2306c4bbc5a559f992d556eadad66efa84bc4c5b |     
    arm      |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/e4859b313896395e47cd10053e7a0992e4fe7b86 |     
 aarch64_be  |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/7ea4545e471236ae7aaad37b82188209c30567bd |     
    or1k     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/a1f59e7971414ed39c9f2ba39ebd2f68841f6619 |     
   mipsel    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/0faf4b74ef222d5250ac81e5c89a96f62781e2d5 |     
   mipsel    |           qemu-8.1.1           | NOK | http://autobuild.buildroot.net/results/fa166a9a878fac95bfe3a36e5a2a14557738009c |     
microblazeel |         samba4-4.19.1          | NOK | http://autobuild.buildroot.net/results/c1fbfdab11c0521b8199f6a661987eb6076c84d2 |     
 powerpc64   |         samba4-4.19.1          | NOK | http://autobuild.buildroot.net/results/9dceaab730cfb10a653b7a38b22b24e839fbd311 |     
  mips64el   |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/7c3c98639f0b61eaa7dd520000f7c4af785fb241 | ORPH
   sh4eb     |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/82ac9fcc6659c7843fa8e2bd1e94527b1d73991f | ORPH
    or1k     |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/8ad415066e3ccaf0cbc1d94bb5115a889951818a | ORPH
  riscv64    |       strongswan-5.9.11        | NOK | http://autobuild.buildroot.net/results/7b09a93d27029657a79c4ca27a6d79821f3454cd |     
   s390x     |       strongswan-5.9.11        | NOK | http://autobuild.buildroot.net/results/2e68e9c21341d92f09840a53eeac2200aee73174 |     
    i486     |            tar-1.35            | NOK | http://autobuild.buildroot.net/results/9574cc2b4811510d58f9aff0a949638f61e3d783 | ORPH
  aarch64    |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.net/results/a12a84e6b574ec10be515fa04ddbf7c686f7c917 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/1f59f3081c04c3f539d47c3e65e48b45843afff1 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/a5bdaf8c3e8b3ed5bff58acb245fad490c3e3c43 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/73abca98636a96b783a83dc69f2190a680d24696 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/3851fc3d539bba052966639646cd52e2d0cdf66d |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/89d14521cbc5f8954b19222269b00578e5bab4af |     
   nios2     |       util-linux-2.39.2        | NOK | http://autobuild.buildroot.net/results/f8a86a7932a200dba1fd5dde58914bf826be6f32 | ORPH


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                   bird-2.0.12 | 1 
                elfutils-0.186 | 1 
         host-gcc-final-10.4.0 | 1 
               libglib2-2.72.3 | 1 
               mariadb-10.3.36 | 1 
   openvmtools-11.3.5-18557794 | 1 
                        sqlite | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/7ee3e6d39e8f0939b57dab8042e47a51abe1d240 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/e2aea1a3530c410e340eb9ae5fc5ffd6b2c6aba7 | ORPH
microblazeel |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/b94428018943cd20e0e5c13b4d47172fbb4552fa |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/dfb0dce56caeb794e04b3cbbae9c4c2e9f51a698 |     
microblazeel |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/34d4c61a08e9c98875c92f8141946ec553b3c6de | ORPH
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/5e21f66ca542c828bb19877130b0e57dc516d5e4 |     
    m68k     |             sqlite             | TIM | http://autobuild.buildroot.net/results/3c49d293cf020bec5b5145f530d4fd23295ff657 |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                       unknown | 2 
check-11970a7e112dfe243a2e6... | 1 
                 coreutils-9.3 | 1 
                elfutils-0.189 | 1 
               host-go-1.20.10 | 1 
                  linux-6.4.16 | 1 
               trace-cmd-2.9.7 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/676541d6100fd6752d1b843590e1066f674f29e3 | ORPH
  powerpc    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/fd47e40e80af13bb8bd1b5f81b5ada14a1e873dd | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/31142b1c00616425c5a21d5d2a226d804895c319 | ORPH
    i686     |        host-go-1.20.10         | NOK | http://autobuild.buildroot.net/results/cfd88606bc5794651a99507de7d13b1fb753b19d |     
microblazeel |          linux-6.4.16          | NOK | http://autobuild.buildroot.net/results/79c0b6fa6716a3aa24837c6cc112e42029fff5ef | ORPH
  aarch64    |        trace-cmd-2.9.7         | NOK | http://autobuild.buildroot.net/results/5425bc3c9e5d1f17d2ac3df5dd4c4ba8d48f9d5c |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/3fc36af4e952c445ff88db30ff6ee1d9bf54cecc |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/baa63fe7b9e3a6c24508a9f32261dce386fb990f |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
