Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F33CCD1292
	for <buildroot@archiver.kernel.org>; Thu, 11 Apr 2024 03:57:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB4614018E;
	Thu, 11 Apr 2024 03:57:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7tymRh4L1o2u; Thu, 11 Apr 2024 03:57:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C7584026F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C7584026F;
	Thu, 11 Apr 2024 03:57:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2DB6E1BF95D
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 03:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 197A94063B
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 03:57:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1SkUwwU9_2EJ for <buildroot@lists.busybox.net>;
 Thu, 11 Apr 2024 03:57:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 800D040637
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 800D040637
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 800D040637
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 03:57:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 558A5240005
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 03:57:33 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 11 Apr 2024 03:57:33 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1712807853; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fTmFj8gLnTa9sKAR+SleDYWyRTKqCmUiJhC8jGESQzE=;
 b=kGSd7usIDqnXjd2HdX3e4gKxdlh3ZCVVbgE3SBNCHVR1Bsq5sDL9QMTKf39JRGDxz5lyg2
 4XpI/iILfdxTBlrdIMxM7N+C6PO45UwukViwwBomQOJZN5MMtCuHL5KHfoJ8JyZjJ+428a
 slzQbo2+Ft5NnP/nJ28rqDhWEuYz57pgPZ0YuxZX0quj+PNG0T1seFJfodimY5mEJksluF
 K0glOUCK+wcQ0jVUN1x/nawAfDVbCFFC8owWXndhX8p25mQ1hQ72ep2VKtyQhhzzrU29gS
 py7sVky9y/B/2llkkRi8OuFMvwPO1nV8RhyaFsNXYaRsBY5DCUohxJY542SAAg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kGSd7usI
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-04-10
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
Message-ID: <20240411035733.9B-93b3ukQqJfajp0jRg4eu_rtB_wyie0A8llvIGJeg@z>

Hello,

Autobuild statistics for 2024-04-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  5  | 15  |  0  | 20  |
    master   | 71  | 82  |  5  | 158 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 10
                libressl-3.8.4 | 6 
                fail2ban-1.0.2 | 5 
           dmraid-1.0.0.rc16-3 | 4 
         gobject-introspection | 3 
               apcupsd-3.14.14 | 2 
               asterisk-20.5.2 | 2 
                 coreutils-9.3 | 2 
                elfutils-0.189 | 2 
                gnu-efi-3.0.18 | 2 
   host-flutter-sdk-bin-3.19.4 | 2 
         host-libxcrypt-4.4.36 | 2 
              libarchive-3.7.2 | 2 
          libcamera-apps-1.2.1 | 2 
                   linux-6.8.1 | 2 
                   linux-tools | 2 
ltrace-82c66409c7a93ca6ad2e... | 2 
               mariadb-10.11.6 | 2 
                    rtty-8.1.0 | 2 
                    bat-0.24.0 | 1 
                   bird-2.0.12 | 1 
                  bitcoin-26.0 | 1 
                    brltty-6.6 | 1 
             cni-plugins-1.3.0 | 1 
                    fcft-3.1.6 | 1 
                   foot-1.16.2 | 1 
            gdk-pixbuf-2.42.10 | 1 
                  gnupg2-2.4.5 | 1 
  gobject-introspection-1.76.1 | 1 
                 highway-1.1.0 | 1 
              host-rust-1.74.1 | 1 
        host-sentry-cli-2.20.3 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
               libglib2-2.76.1 | 1 
               libunwind-1.6.2 | 1 
                libvips-8.10.6 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                    nodejs-src | 1 
                    ola-0.10.9 | 1 
                 openssh-9.7p1 | 1 
                oprofile-1.4.0 | 1 
                privoxy-3.0.34 | 1 
           python-numpy-1.25.0 | 1 
         python-remi-2022.7.27 | 1 
python-unittest-xml-reporti... | 1 
rtl8821au-0cab870ff635ba038... | 1 
           v4l2loopback-0.12.7 | 1 
                 wavemon-0.9.5 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/e4ca9f0c252b3e60a3d2fd6f200ca9a522532153 |     
    arm      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/93168be821e73eedf97e367677b28e26495bfb33 |     
    or1k     |        asterisk-20.5.2         | NOK | http://autobuild.buildroot.net/results/338d409c13a593e0d410082bde6856c1ca3041f0 |     
  riscv64    |        asterisk-20.5.2         | NOK | http://autobuild.buildroot.net/results/bad19039d2331ec3e39b38c1da55775f46bce98b |     
    i586     |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/ef03dcdc7986276820a9b08ef0f8a9f692075095 |     
    or1k     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/1f0599d67411d8328913f2bfdc058c7852c29ecc |     
    m68k     |          bitcoin-26.0          | NOK | http://autobuild.buildroot.net/results/9542af39f9da82d7b2dd1d6c9dc0b894108c746a |     
powerpc64le  |           brltty-6.6           | NOK | http://autobuild.buildroot.net/results/bc87087955b52d417a8920cf02a259bc3a2b6fe1 |     
  riscv64    |       cni-plugins-1.3.0        | NOK | http://autobuild.buildroot.net/results/f80252837a251564a030073cf5689efd726256b6 |     
    arm      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/328fefcab0677532ceeb7b1ccf82419547fbf1a2 | ORPH
   mipsel    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/2313323366b0dd0cac66f3fd613332ca2dd012de | ORPH
  riscv64    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/f0982a972ccf801af796b1f6aca66e05cc47ab9c | ORPH
    or1k     |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/383a00618c654dab0febc8b94713fd5853df620a | ORPH
microblazeel |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/a086b93c053214c0a3b798e80c992e08f947cb7f | ORPH
microblazeel |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/fe52ed1ef1ef54480ba13acd0ac7ffd8750dd896 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/f5799355fcfde0dc1cf8b2e0e282a28e9e7de488 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/c3e28b67e6426f354a211f6dcac6e5dd9efae36e | ORPH
   mipsel    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/7c585428a25eb1f9f98d6a59889ae0d581948633 |     
 powerpc64   |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/359f1c35a0dfe16608401ef2b5a8bbbab30e874e |     
    i686     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/1eaaebfe528553c50bd1d8fa27037d99208c136f |     
 powerpc64   |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/9493f51a6f5f79e87d137598e332316986d8881f |     
  mips64el   |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/503ce5b06e554c9f750980d546f7ab173d3a1958 |     
  aarch64    |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/905ba2f42e69dc158407c91697c5e944c25eb586 |     
   mips64    |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/f86ea23c8a29cbea4f4cb21773385717d4dc89ca |     
 microblaze  |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/a0c9e8b726ebf863586f28d3495ca3137abba681 | ORPH
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/d5743043c4ea05b38b14bc5715ddc621d5810ed1 |     
   x86_64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/bbf2387cd13f215b7f8e526052d4697401dc0df0 |     
    or1k     |          gnupg2-2.4.5          | NOK | http://autobuild.buildroot.net/results/8feb9f63821fc9cc5dd3aca7eaf0560432b5f4ea |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/30b73d4fa592dffa729991953fefb4cdb012f9be |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/b87048eddc79b61266419240ef20eefebf931aa9 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/13922688d8c99eb7673379d5ba0696c8cf7a74f9 |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/4337641b83b8256b2495cd970c39fbd96f727565 | ORPH
 powerpc64   |         highway-1.1.0          | NOK | http://autobuild.buildroot.net/results/a78ede88c1a863d62af6b12d9bfcd85a62beb1cf |     
microblazeel |  host-flutter-sdk-bin-3.19.4   | NOK | http://autobuild.buildroot.net/results/297519bb86b2955e47d19b1cd21f6e58e37f8ad8 |     
   s390x     |  host-flutter-sdk-bin-3.19.4   | NOK | http://autobuild.buildroot.net/results/2a22e1544b5e63967d94c344fb76e89f0879e0ee |     
powerpc64le  |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/60db9849b01ae637139a355deb0b19bae7817bef |     
    i686     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/7fcd41047ae6c99ef8016fb2f560c5837f0e3824 |     
  aarch64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/6b412fccdb3c6f12bef3d20217040fe1d8a0db9a |     
  mips64el   |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/27fb3124c99cdb4f1b05fa7f2ec7ebe906abb982 |     
    i686     | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/7d6f703131590902cde0779e870601165fd536d5 | ORPH
  sparc64    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/04830402b25a2ba6c6363855d6bc1a6b9af29bf0 |     
  powerpc    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/51dd2321f63fcc5266dd667ed32fb5e7e11b9222 |     
 powerpc64   |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/9273d2e170da74264ac5d440ce61911e3a703ef1 |     
microblazeel |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/2351483f8276b73333ef82e6d03968fd286d1241 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/33740f02ca10f8bc3754bf0d5d9b520c451a30ab |     
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/50a41df0c09a9058b45966a54fd7baca2a36a25e | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/cf673ce8bad090585f790f68f6e8c46d26fccd5f | ORPH
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/423ff8a946566d9e0f6337a08be226f7580312a6 | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/ed24880d9f155bd63793e1686a8d6106b151bd99 | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/9e035d7818876b0d2b386b5b072834a50276043f | ORPH
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/0ade20b0b04abeb8686599b9f54d73f4509940df | ORPH
    or1k     |        libunwind-1.6.2         | NOK | http://autobuild.buildroot.net/results/b8f5e592cd8229df38eb85e90c7e0b688e81abdd | ORPH
    arc      |         libvips-8.10.6         | NOK | http://autobuild.buildroot.net/results/9ad7e87104e9b1206b96250781818cd2e29d9388 |     
microblazeel |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/1fc427f0e43c3a18e96086e8478711ffc71a4901 | ORPH
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/0962e4e220c5fd0abf5c54e4f0ce5d0ced99100b | ORPH
   arceb     |          linux-6.8.1           | NOK | http://autobuild.buildroot.net/results/cafb81a03ffa3ed025ae3c668fc2e926fd647f85 | ORPH
    sh4a     |          linux-6.8.1           | NOK | http://autobuild.buildroot.net/results/b8bcebf595df7fa6c3a967d96f7abf05c6d059a6 | ORPH
    sh4      |          linux-tools           | NOK | http://autobuild.buildroot.net/results/92d78bf9ab66604ac7cba184069424b189b28be3 | ORPH
   x86_64    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/bcb9c5561d444ee1e096a450260e36d3cffc5b38 | ORPH
  aarch64    | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.net/results/6542401ba6893faea40597a86b0bc3977e2a36bd | ORPH
   x86_64    | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.net/results/2d0a23d407ede92b685a50eee2bb1ccaa90de270 | ORPH
 microblaze  |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/336a97957fd8b59d1a4775334cc7bc85e2b7da84 | ORPH
  riscv32    |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/faa8add31f0fbb11123e89af4b7569c142fb3dd9 | ORPH
  aarch64    |           nodejs-src           | TIM | http://autobuild.buildroot.net/results/c94cbd7fc48361905a907195445eb2cf1bd82086 |     
   sparc     |           ola-0.10.9           | NOK | http://autobuild.buildroot.net/results/b81e7e485ff28bcfe76c3f2790171ae9e5e0eb3c |     
 powerpc64   |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/0fee0d702234f067e59fda1c7179c465f6be8cd0 | ORPH
  powerpc    |         oprofile-1.4.0         | NOK | http://autobuild.buildroot.net/results/48790f4cb768992a3295eda9bd92740231e8fb0b |     
  aarch64    |         privoxy-3.0.34         | NOK | http://autobuild.buildroot.net/results/b02b48301c80dc949b5d32b2aab21e1ea955bf88 |     
    i586     |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/896ed87dfc36a74e4f5c1a0d0a980c7fbf895334 |     
  aarch64    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/e8cd5dd29289381c4573e7378f1d12c00f1643d6 |     
    arc      | python-unittest-xml-reporti... | NOK | http://autobuild.buildroot.net/results/0ab0ddc6f9301f79ce1d671d3bb56336c699e503 |     
microblazeel | rtl8821au-0cab870ff635ba038... | NOK | http://autobuild.buildroot.net/results/b85334d87a59deff4122de8814e9ba8133094176 |     
    arm      |           rtty-8.1.0           | NOK | http://autobuild.buildroot.net/results/92c8d42b45d48dede8de4b93cd490a05039283bf |     
    or1k     |           rtty-8.1.0           | NOK | http://autobuild.buildroot.net/results/089281cfaf3f3aafbff88ddec044c1eb9ce35145 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/60388980c03c4166dce77fa608b4b338d3e60fc9 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/858d21d1151786c4a6f6d019724e7438ce8ef8ee |     
microblazeel |            unknown             | TIM | http://autobuild.buildroot.net/results/6cacea870a017796a0f810cc558e082ddca04c08 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/2458efd6e7780c1dc87fcf12ec3bbaf99bfb546f |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/c41ec2d1c62b3a8765428bc09aa2af96e94d3d2f |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/77208ecd2d0bf8abad5748cdc1e04e4cdd04e526 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/a3cab71f8852765bcd9f5f94c37be559d21e0d96 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/86396dfb182a7e9b4722a93dc4121bd4f9420c49 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/a8029f7d60fb1b65aac0733e64f98e8ab4c15c13 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/3d16e0fe51a52c37b40e8ca7a290dd1189339b05 |     
  riscv32    |      v4l2loopback-0.12.7       | NOK | http://autobuild.buildroot.net/results/b12b7252000ca03c7ff04e1abbbb74076b1d9570 |     
 powerpc64   |         wavemon-0.9.5          | NOK | http://autobuild.buildroot.net/results/63f8f803c9bddbaace71035a0590f9a8a83df463 | ORPH
   s390x     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/142ec8b05532f478461f62f643beb78b513082ea |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

               apcupsd-3.14.14 | 3 
                  linux-6.6.22 | 2 
dmenu-wayland-a380201dff5bf... | 1 
                    fcft-3.1.6 | 1 
google-breakpad-f49c2f1a202... | 1 
host-heimdal-f4faaeaba371ff... | 1 
          libcamera-apps-1.2.1 | 1 
              libcamera-v0.2.0 | 1 
                libressl-3.8.2 | 1 
ulog-0389d243352255f6182326... | 1 
                       unknown | 1 
                    volk-3.0.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/668fec8e815b6be9129866ff76712b316d2cfb4c |     
   x86_64    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/6fed899b176ca5d12095cadff3bcf0537e6cc1d9 |     
   s390x     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/939ab60f45ae59c92af46ea972c94af94104507d |     
    m68k     | dmenu-wayland-a380201dff5bf... | NOK | http://autobuild.buildroot.net/results/26b7c4602778c54637f41c5e60b3fb19ff58751e |     
  aarch64    |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/d62ea7c1220492102d698e9d2715572e682c83ff |     
    mips     | google-breakpad-f49c2f1a202... | NOK | http://autobuild.buildroot.net/results/a218769b0e07a6c5b034ae3b1817657b34c6540f |     
microblazeel | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/50b3aa298155370db7a621468f51690282a73634 | ORPH
powerpc64le  |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/0a80e113749ebf716d0e559072dac1c7410433a2 |     
    or1k     |        libcamera-v0.2.0        | NOK | http://autobuild.buildroot.net/results/b5961bb10ad09bb3f4eeed13613486c8c6fa03a3 |     
   sh4aeb    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/19a99f7cc77ba90b617fe0bf10bfede13967a534 | ORPH
  mips64el   |          linux-6.6.22          | NOK | http://autobuild.buildroot.net/results/6fb92c00e6d03c829a362d190e7beaf1b62adb80 | ORPH
  riscv64    |          linux-6.6.22          | NOK | http://autobuild.buildroot.net/results/fffd859da54ec5c403546a1f38327e6d54dd4b21 | ORPH
   mipsel    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/701d7ae975a34ef8a731ac8b8b52836736788f8d |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/7b586aac562f1602eb8585efb17257275c7c9c13 |     
  powerpc    |           volk-3.0.0           | NOK | http://autobuild.buildroot.net/results/6a9b64545617272285987ecc63a9828749f5cce9 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
