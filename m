Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA98EC25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 04:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A74CA40189;
	Sat,  8 Jun 2024 04:09:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h_va1PTgeEC2; Sat,  8 Jun 2024 04:09:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8D9F40199
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8D9F40199;
	Sat,  8 Jun 2024 04:09:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 87DCD1BF427
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 04:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7422F40199
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 04:09:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8nFasvJg3EhU for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 04:09:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 58B7D40189
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58B7D40189
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 58B7D40189
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 04:09:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D0D382000C
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 04:09:07 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 08 Jun 2024 04:09:07 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1717819747; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VgyP/u1Sgck++NoqxcUcjYSjS3/hvSHUZqFJ2Up+0HE=;
 b=IfiLXqAwTbgIIY7UNXUAZC6DpwRcucrMpD6JhW7JJqAbZrlKDN7JiIuBljq6KPPjA4e+/j
 Z/U1bo7EA9/C7AKSHTq3QrNk2mcXoTWFsZzDMeDFRshU4u+2DilGlZmsbl+pRijXxKii93
 0IkjkiZbyhdTBFwapeqrKTD9yAdsjRSxre/OnnjwQu1RWwR2CF0jHCQnKI6v8RBMzZ3dB8
 N6j3nDM/HcT/TmtdFulM9kFZxzDQhMzKlEuIPM/vARNJamqwpm/oSkEihe71dhQfDuG564
 QQBMpqYhtLwwpuvT+W1l7o7ZLkZeQsXBR4766QdjG4YEpWQgwMrgc+a9rNe8zQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IfiLXqAw
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-06-07
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
Message-ID: <20240608040907.b2ICdNw-Rl6YlniWh9SF8bOwE9c1Yy01QwIW37Ub03Y@z>

Hello,

Autobuild statistics for 2024-06-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  8  | 11  |  0  | 19  |
    master   | 80  | 146 |  1  | 227 |

Classification of failures by reason for master
-----------------------------------------------

host-prelink-cross-a853a5d7... | 12
ibm-sw-tpm2-5452af422edeff7... | 11
            host-cdrkit-1.1.11 | 10
                libressl-3.8.4 | 7 
                    mpir-3.0.0 | 7 
                host-odb-2.4.0 | 6 
                  ffmpeg-6.1.1 | 5 
                elfutils-0.189 | 4 
host-vboot-utils-bbdd62f9b0... | 4 
                       unknown | 4 
                 coreutils-9.3 | 3 
host-android-tools-4.2.2+gi... | 3 
        host-sentry-cli-2.20.3 | 3 
              libarchive-3.7.4 | 3 
               libglib2-2.76.1 | 3 
         python-remi-2022.7.27 | 3 
                fail2ban-1.0.2 | 2 
 host-softether-4.30-9700-beta | 2 
          libcamera-apps-1.2.1 | 2 
          linux-5.10.162-cip24 | 2 
                  linux-6.8.12 | 2 
             util-linux-2.39.3 | 2 
aer-inject-9bd5e2c7886fca72... | 1 
android-tools-4.2.2+git2013... | 1 
                     apr-1.7.2 | 1 
                apr-util-1.6.3 | 1 
           at-spi2-core-2.50.0 | 1 
                    attr-2.5.2 | 1 
                 avro-c-1.11.3 | 1 
     bandwidthd-2.0.1-auto-r11 | 1 
                  bcusdk-0.0.5 | 1 
                   bird-2.0.12 | 1 
                   botan-3.3.0 | 1 
                    brltty-6.6 | 1 
check-11970a7e112dfe243a2e6... | 1 
                  clang-15.0.3 | 1 
             containerd-1.7.14 | 1 
             dahdi-linux-3.3.0 | 1 
                dbus-cxx-2.4.0 | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
                 dc3dd-7.2.641 | 1 
                     faifa-0.1 | 1 
               freeipmi-1.6.14 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
            gdk-pixbuf-2.42.10 | 1 
glibc-2.39-5-ge0910f1d3278f... | 1 
                gnu-efi-3.0.18 | 1 
                 gnuplot-6.0.0 | 1 
         gobject-introspection | 1 
google-breakpad-f49c2f1a202... | 1 
                    gpm-1.20.7 | 1 
                host-go-1.22.4 | 1 
host-heimdal-f4faaeaba371ff... | 1 
      host-riscv-isa-sim-1.1.0 | 1 
               ipmitool-1_8_19 | 1 
                  jack2-1.9.22 | 1 
              libopenssl-3.3.1 | 1 
                librsvg-2.50.9 | 1 
         lttng-modules-2.13.10 | 1 
           mediastreamer-4.4.8 | 1 
                 mokutil-0.7.1 | 1 
                opencv3-3.4.19 | 1 
                 openssh-9.7p1 | 1 
python-unittest-xml-reporti... | 1 
                 qt6base-6.4.3 | 1 
               syslog-ng-4.7.1 | 1 
                 uclibc-1.0.48 | 1 
                 wavemon-0.9.5 | 1 
             zynaddsubfx-3.0.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/0f912f10318cee1efe5a1a95ca8c6e42dc2482a8 | ORPH
   armeb     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/dd8d1dda275ce3d624edb75c5342700009f862fd |     
   mips64    |           apr-1.7.2            | NOK | http://autobuild.buildroot.net/results/c24cbbce315b733f2b048481d74a30ca46fc433f |     
  aarch64    |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/5524bc3beecdf2279e6d97bea81aae72e13ce4f9 |     
    arm      |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.net/results/7fa862f85512812ff55dc7c4262516b25803def8 |     
 microblaze  |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/ae8d695b0c67a3d33bfa0588caeba6ace447e02d |     
   x86_64    |         avro-c-1.11.3          | NOK | http://autobuild.buildroot.net/results/00db552787e13a1c263cf82505faf9dc063f7c1a |     
   nios2     |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/af227e14d2e97ef53c8149fcf614c9d1283440a4 |     
  sparc64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/a4a195b20923e0873b4d449ef1ff2f5682ae60f5 |     
    arm      |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/ca94d7dfb306cc9ddf1a27acffefa817cedddd05 |     
   sparc     |          botan-3.3.0           | NOK | http://autobuild.buildroot.net/results/ea411e96bbdc081ed619295618ad84abd0225323 | ORPH
   mipsel    |           brltty-6.6           | NOK | http://autobuild.buildroot.net/results/73c439440db4d603d118f2d4f83dd5ea222c25f3 |     
   arceb     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/0f58e21dde16873f08b98ddce9876a61436b57ef | ORPH
  riscv32    |          clang-15.0.3          | NOK | http://autobuild.buildroot.net/results/f5949d3df5944b43644c22940f03083cc0a3e909 |     
  riscv64    |       containerd-1.7.14        | NOK | http://autobuild.buildroot.net/results/486352035693e26e646013293bd071f2c211cb1a |     
    m68k     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/2f00554411ceacbcf1a3c8adb0e5ac15f500d4cf | ORPH
    sh4      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/d1771ac6a54aa7c5de898bd292a43ecaccab1169 | ORPH
    or1k     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/99540cfd7a445b31a302f78a8981470cea8e078e | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | http://autobuild.buildroot.net/results/7e85aa037b303acca7ca151d4294a7251502fadb |     
    or1k     |         dbus-cxx-2.4.0         | NOK | http://autobuild.buildroot.net/results/151a13350f51da2431e9e52b1ebace3f9aad042c |     
   sh4aeb    | dbus-triggerd-ba3dbec805cb7... | NOK | http://autobuild.buildroot.net/results/48ee844e28889834ae915f69c13a38773422fead | ORPH
   nios2     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/f8e3634a9eda809c1e0b29851ba33aa0490edfed | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/cb2980afcedbf5852b2955600e8895bf49574979 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/02f5a8d3d9f0960339776a88de466b0e3b30b3a8 | ORPH
  mips64el   |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/9a97c3061da528274d34186b1a7fd073b3df1070 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/b342feea23972557fde48b251d96368e8e02e1ee | ORPH
 powerpc64   |           faifa-0.1            | NOK | http://autobuild.buildroot.net/results/0909cd335a188c549a3d34204486911a19533070 | ORPH
powerpc64le  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/73119472d041264bbad6cd3efaddc631a75ea2f8 |     
   s390x     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/725a6063bf4caea4bc73f02fe38c42eafce372a6 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/6ce13dd8e8bd5d8d02e2410da81a14aa368c9b26 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/79ce8d1acaaab878bb5a25e257437c0a8839c0ff |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/a8ac1b52209b2166e44cb092b4ee7708a8e8f4c5 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/e673560a9aeb0531413444ecdce081014ed4201d |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/7e294b40d576e01d4fba88182836207a06c6b5e8 |     
   mipsel    |        freeipmi-1.6.14         | NOK | http://autobuild.buildroot.net/results/77d2f5696b42266f51660543afbc32534ea494d4 |     
   mips64    | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/c9e0e8c090d1cfb3337e03496267127a76f39bb1 |     
microblazeel |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/a336be459f3705e8daf04ffc98964ba9eb12b169 | ORPH
   sh4aeb    | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/2fb5634bb21f89df0f439f9323272983dc95c32b |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/bed704df2fe2a1ad440d8412a4e0666a2126822e |     
    arm      |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/a7592c017e52cd7929ce688f04dc14afb8f9fd0c |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/ca86dba51653bca81830f007de166841ca52af55 |     
   mipsel    | google-breakpad-f49c2f1a202... | NOK | http://autobuild.buildroot.net/results/4bac71bca4a90658d35ee1518ba3420c21a4892c |     
 aarch64_be  |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/04d2b44493796b9ad5befd85b86d02c5a776bb16 |     
   mips64    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/1e4e36a2981de54ed0edad9a58af680fb2467296 |     
 powerpc64   | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/673c616a0496d103b08cdcea3349564a50d0de5c |     
  mips64el   | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/3c84aac0ec332ae9845d3ef5f23027f46bb1cc66 |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/7479a939e7091f8e9c83a1ecfaf41fcce7b0f355 |     
    arm      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/9714f83b480ba708a7eaacd6506482326954bf60 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/aa793c121ab2f63c5ff6e9b5a4f75e7f96c74d3f |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/0d55373b5f6c25ff47b3877b4adabfe3a7dea432 |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/4ff4d28818c8ceff4eda1d2087b20bca2e3b251d |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e813bc01d8d52ba7e82aa7bc8c36beecee1e2c76 |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/7cb7631d86ff3499167a400e01bcd039c74e146a |     
   xtensa    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ffa2f4d25cc6a064240cef8d8f1490e6f02a16e4 |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/07add772a54d5917543104d56c8bcdc1b37d37b0 |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f10d16e9c72444f4e700c60061c791741b1167c7 |     
  mips64el   |         host-go-1.22.4         | NOK | http://autobuild.buildroot.net/results/86b9e0875186e878610ea8070680c581192f890e |     
 powerpc64   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/429e73fd1863fb2b484d8f93253782273826f3ce | ORPH
   s390x     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/49785988f33ac67635c1b06b87e906031b46c694 | ORPH
   arceb     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/cf2290314d6f127b8e9ef7606e0ff453f72c38bd | ORPH
    i686     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/9d28d522dc8c17b68d9d1eadbf04abd5367c2291 | ORPH
    or1k     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/80279022d5b2b443c9f1482e7970dfd8fa87e2e0 | ORPH
  powerpc    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/14668e55d6cfaec7d3cce50167c299ddca77242a | ORPH
   s390x     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/5f53863667e6e9993d181a3eee884c9f2cbfb04e | ORPH
  powerpc    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e3d19b4d9340b85258696e9acadd4f90a8775744 | ORPH
   sh4eb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/448de606e5486227dd557540495b927940ba741c | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/7a418f109414082feae5fc537e6988f88900d325 | ORPH
   sh4eb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/feca892fb9f2098d73e6eef54215cb55b5b6376a | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b08f1edd5ab3a8fde6d39a8a739f1eb9e4ac9654 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ea61874fbc8522084f0124e3f36b1ad565e520c6 | ORPH
    m68k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/77fb8f71733a4dba881afe43c2ac126b8d0582ee | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9128a52b8dddf1573b01102c89fb4a2ccf5095fa | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/fa6dc6ff2450c5d7a4798c84745c0f0d3afe60a0 | ORPH
  mips64el   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/15864b04b3e6e556b89db3c376c544b3da4dd8ce | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a023d02d61f58064ada1e090727410ee8b3317ba | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/97c5af6f74d8b5db96881e8c2be99d01ed3ec33e | ORPH
   x86_64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/bf9ff362fef2e9d510c598e9e16b88bd2ff7ea45 |     
    arm      |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/e6f0ab2b5b0074a80ba8f4e96a6fe1dbfb1c066c |     
  sparc64    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/43f89963f3e77af9ebdb301bc9b55a71495b14b0 |     
   nios2     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/2ccd0b225a45d52e7f3c08ff8b6880a117030daf |     
 microblaze  | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/69442c476c8cef4cf08dd5c1aa997b6bc573ced8 | ORPH
    or1k     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/910cbd93097f8236313a0c43b0b217c449be4bf3 | ORPH
   mips64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/e12457064a8698b82b3e20c1efe97433268704e3 |     
 powerpc64   | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/db06248eb97cc0e507b90a954cd8ad553ff8c551 |     
   mipsel    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/6d99f0855b8ed1af84ebd76f978f8aeb5f5dcc6f |     
  mips64el   | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/18928ce8f077fb65f25cba629ed2b9c7ba5dc1b9 |     
    arm      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/20d2811b29a95a6eaba3368bc220cf109d107f2e |     
   s390x     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/cb4052e1ecdb6cb591638fc48cd7d83e821d4329 |     
   arceb     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/4ca931f101cbe417df08b9dd2980d94d84e614c0 |     
   s390x     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/9f9f98e9b047542463beae7e8ceb489fe274eb95 |     
    m68k     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/013a22a76aeb5eb516caca05988892817ad17c4a |     
   sparc     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/4f06a5170a578cce9db8ce0ff4231820820578a4 |     
   x86_64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/85d82dab0e46896e68b921ab349013cf924eab95 |     
    or1k     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/73aab8427b7a51bf33c981c9595fed1abf27ee42 |     
    arc      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/9f9b20da2afee7a753536ce317edfd73a33d0a7e |     
   sparc     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/9daea51a48f073a2178a606049ed3bb8452459d5 |     
 aarch64_be  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/c0193c6d9d9ffaef54d6819b9f954dc6516981ea |     
   arceb     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/5aa782c5859f4bbd3daf15172626a382a50578fe |     
   xtensa    |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/3dda5ea205047f5f603002da9e3c75c139bfc4a2 |     
powerpc64le  |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/4bd1084ec756a67757c41f98451149d8a5efb08c |     
 powerpc64   |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/f2bcdb9496b723f8cda3c472c7b09abf16ebc817 |     
   s390x     |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/077cb82fc1cc64c782cda3fd04fce9b74754323c |     
   xtensa    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/af7d1720e6e54efabfb92307e50f0a15e0e7c3a6 |     
   mipsel    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/dd15065d3b48658a5d790198493bd833cbb7f8a6 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/dd1f1a7298c5a5b4aca480dda1da7c2bfe7971ae |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/f9a0d66432556b8c1fcb2a142c448c8d076dd597 |     
  powerpc    |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/521af8580011ce701b2e04d8a0c3817c5259d32b |     
microblazeel |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/7e27679c1746a0943292190c3bd5c74aab864d3b | ORPH
  powerpc    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/b94931e34c6f53c53a4885eb18e7face840035e5 | ORPH
  powerpc    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/034f952be620529910450e23de1ba87a64640cfd | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/52c1542b0ffef73c0791f4e85a703d6aa90243f7 | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/45fc228994b485a63aaf342fe7d06ce2e7f882e9 | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/89a21e2880e3f4c0877d25dde569655fe42796b3 | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/342828201ba01d49e03aab3e54787fdddf3668d8 | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/1180e7609a15ce5edbb138e795c78e115e297968 | ORPH
    arm      |         librsvg-2.50.9         | NOK | http://autobuild.buildroot.net/results/8a17295b99699a5f6965ca122cae4d5ab25a8dd9 |     
 aarch64_be  |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/bd7938679468d95e631c665a0bb064a30723649d | ORPH
    i686     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/cb7c83319c58702e81677109b425936be7cd017a | ORPH
    m68k     |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/a97e2818d57fc517e58867a25f9eb3d62c2fc879 | ORPH
  mips64el   |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/80fa3d0ff8b427a7970216e5dccab924d136cf5e | ORPH
  riscv32    |     lttng-modules-2.13.10      | NOK | http://autobuild.buildroot.net/results/e89d0a53abf67060c2f3aa6d38c15c40eaee6824 |     
    m68k     |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/d916771027a9082e33e5aa3c81fd17d4d1271184 | ORPH
  aarch64    |         mokutil-0.7.1          | NOK | http://autobuild.buildroot.net/results/88b549734eae4b25de1b8e1c4f04bace0a7e7418 |     
  powerpc    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/7f78ccc3cac9ab53e80b1b8fea62f6f1f075074d |     
  mips64el   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/e5549594d9077101cc6a0e95283cb839834cb4b6 |     
  powerpc    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/228a5985a5e6540a8965d432155b8f0e882da2d8 |     
   x86_64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/b6671387d8d0f9edecea8fa338b629478b0a2eb9 |     
 aarch64_be  |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/909d3085e0fe212a33c7f163972da2a312536ab9 |     
   s390x     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/4c6103b32984dc90f27d8553f04ff6be08d03941 |     
   s390x     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/95e3b2e528ebe5f8c9f09c69dfb897de9a97f630 |     
  aarch64    |         opencv3-3.4.19         | NOK | http://autobuild.buildroot.net/results/9ae3911583cccb6362f33cd82e5eaafb059fdc76 |     
  powerpc    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/84088c484ca5bce3bfc1d45d755c08b55024c442 | ORPH
 powerpc64   |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/7aa6b24a2ec5efb1c862e1a29d87afe5ae45d459 |     
  sparc64    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/d7fe152faccbb695b60c18b519492441c8ae2d92 |     
microblazeel |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/4e42912199fc9c82399779a3f007349c2d4bf515 |     
   nios2     | python-unittest-xml-reporti... | NOK | http://autobuild.buildroot.net/results/6fce4483d7cf39adbad66b88cfe3bdcd2ea80cf4 |     
   x86_64    |         qt6base-6.4.3          | NOK | http://autobuild.buildroot.net/results/d11ed81610f619ef1c5a11b652b88a54fcc96724 |     
  aarch64    |        syslog-ng-4.7.1         | NOK | http://autobuild.buildroot.net/results/a59f5ffe7d85f18a365a556f119c552561a7c391 |     
    or1k     |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/92208fa7de610bb5d67f80575ddfdd00194621cf |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/065c2d369223f7c3b34d92fdd429f06166dc1959 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/14dc83d105bef85baa189b2c855110703e9f8864 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/bf79eae58dd511b0a4fefbbfd1a09e1b15b10833 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/4b223024212b4a5339e4849a5f256f3128f58f12 |     
    i686     |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/82eff7db47ee20fb2dc6728645d14b5d74a0eb24 | ORPH
    i686     |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/f375ee302bec50c31308d9cecd2465e5bb43a65a | ORPH
    sh4      |         wavemon-0.9.5          | NOK | http://autobuild.buildroot.net/results/7c1d2cdca2638e55b67acd0bafe4f1b121b65d7d | ORPH
    arm      |       zynaddsubfx-3.0.6        | NOK | http://autobuild.buildroot.net/results/cc8cb5f43500555fe45df8c6a4a466853b290da4 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                 openssh-9.7p1 | 2 
               freeipmi-1.6.14 | 1 
                gnu-efi-3.0.17 | 1 
host-heimdal-f4faaeaba371ff... | 1 
                libressl-3.8.4 | 1 
                  linux-6.6.27 | 1 
                     lxc-5.0.3 | 1 
               mariadb-10.11.6 | 1 
   openvmtools-11.3.5-18557794 | 1 
           python-numpy-1.25.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |        freeipmi-1.6.14         | NOK | http://autobuild.buildroot.net/results/a3fff7b63a1ba284f150a841bb7bd0b016018f53 |     
   armeb     |         gnu-efi-3.0.17         | NOK | http://autobuild.buildroot.net/results/2df7aaf6db694bcab61af97ed5c0a1128aee5cd1 |     
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/4c5135df1cd40695747128b4edfd699e83868c22 | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/1ab794226d81305d394ef2e83c11a7d77e7d7c07 | ORPH
   mips64    |          linux-6.6.27          | NOK | http://autobuild.buildroot.net/results/b71afd0a21f71c159de3d674ac6599d5f7ee64a1 | ORPH
  aarch64    |           lxc-5.0.3            | NOK | http://autobuild.buildroot.net/results/559064dc4bf60206b8dc2d4e4549ce2a0cf91d92 |     
    mips     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/10029d9495ef1b8bbc7053538d198ad9d80e0464 | ORPH
   mips64    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/b0502bcabac0adefb7ef4f60a0b7a104f4c43487 | ORPH
  mips64el   |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/bb5cb6817778f6d2dfbbbdfc2477f6a010313293 | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/d7d512930ecf18b8b2b9fb2857cd86fc37f0da84 |     
 powerpc64   |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/c733bbc15a1e20a6d2be65d08b6b160c8f265759 |     


Gitlab CI results for 2024-06-07
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704229  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704239  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704249  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704258  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704336  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704428  | ORPH 
                   beagleboardx15 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704430  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704446  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704447  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704461  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704463  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704468  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704472  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704475  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704480  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704486  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704491  |      
        freescale_imx6dlsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704503  |      
          freescale_imx6dlsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704506  |      
         freescale_imx6qsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704509  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704513  |      
          freescale_imx6sxsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704516  |      
           freescale_imx7dsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704523  |      
             freescale_imx8dxlevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704528  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704537  |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704542  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704546  |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704548  |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704551  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704555  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704570  |      
                   imx6-sabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704592  |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704598  |      
                       imx6sx-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704599  |      
                        imx6ulevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704600  |      
                       imx6ulpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704607  |      
                        imx7dpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704615  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704632  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704635  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704643  |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704662  |      
                     ls1046a-frwy | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704665  |      
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704720  |      
                   mx6sx_udoo_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704728  |      
                          mx6udoo | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704729  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704767  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704773  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704779  |      
                    orangepi_lite | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704815  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704812  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704824  |      
                       pandaboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704866  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704881  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704907  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031704920  |      
               qemu_ppc64_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031705036  |      
             qemu_ppc64le_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031705045  |      
                     qemu_sh4_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031705120  |      
                   qemu_sh4eb_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/7031705126  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/7041909621  | ORPH 
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/7041909825  |      
                           rock5b | https://gitlab.com/buildroot.org/buildroot/-/jobs/7041909898  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7041909912  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7041909976  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/7041910135  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7041910336  |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/7041910384  | ORPH 
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7041910419  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7041910425  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7041910798  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7041910893  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7041910981  |      
                         uevm5432 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7041911013  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
