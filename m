Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E01B3C433EF
	for <buildroot@archiver.kernel.org>; Thu,  7 Apr 2022 05:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6CCBB408F9;
	Thu,  7 Apr 2022 05:29:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UW8S-i7_vxAt; Thu,  7 Apr 2022 05:29:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F3CBE4016A;
	Thu,  7 Apr 2022 05:29:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BE9961BF95E
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 05:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A25F84046D
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 05:29:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RsNebyiuORoe for <buildroot@lists.busybox.net>;
 Thu,  7 Apr 2022 05:29:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3E5E54035B
 for <buildroot@buildroot.org>; Thu,  7 Apr 2022 05:29:20 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 73BD440004
 for <buildroot@buildroot.org>; Thu,  7 Apr 2022 05:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649309358; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mo+g7+xsr6kgy9LZV7ykUKLl11NpIREBewOWIyy5has=;
 b=albq7s53QJB3nrTQClUTtzymZQcQayVhxI+Vao0n471FB/io+9xlSyTMPgpHvsVna62/wc
 L/QTSNjJFDgNnsyzrsr98pq539Y/4oaXrVo0rSNviwG7gMf8Npn+mkD8p62o2HrEoFagNQ
 cBi+88UGiO0g7nwl4lGWVNVz1S+tA7Iyj0jFma/hlO3+9M4hKiKEUYjmgh6/+DEOfDg2bi
 m/UdcC1cMbh5aksB0fF0iJ9drbuR7b63LtIBRugRI/XC41qW7XSC1Adte1T+Nd/LjpUAne
 Obv4CB5jvdjbiWQCroqnYw1BWHEGNIkcmvsiFhSrHqY6q1yaacpjgYhRy4P7Rg==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 07 Apr 2022 05:29:18 -0000
Message-Id: <20220407052923.A25F84046D@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-04-06
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

Autobuild statistics for 2022-04-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 61  | 10  |  1  | 72  |
  2022.02.x  | 19  |  8  |  2  | 29  |
    master   | 217 | 482 |  0  | 699 |

Classification of failures by reason for master
-----------------------------------------------

            host-binutils-2.32 | 53
          host-util-linux-2.38 | 34
         host-gcc-final-10.3.0 | 33
                 uclibc-1.0.40 | 30
                 dhcp-4.4.2-P1 | 20
                    git-2.31.1 | 18
host-elf2flt-7e33f28df198c4... | 18
             libopenssl-1.1.1n | 15
           argp-standalone-1.3 | 14
              fetchmail-6.4.29 | 12
toolchain-external-bootlin-... | 11
                 linux-5.15.30 | 10
                python3-3.10.2 | 8 
polkit-a2bf5c9c83b6ae46cbd5... | 7 
               util-linux-2.38 | 7 
glibc-2.34-109-gd64b08d5ba7... | 6 
          host-gcc-final-9.4.0 | 6 
         linux-headers-5.15.30 | 6 
                     refpolicy | 6 
    toolchain-external-bootlin | 6 
                 zlib-ng-2.0.6 | 6 
               arptables-0.0.5 | 5 
                libressl-3.4.3 | 5 
   linux-headers-5.10.104-cip3 | 5 
                    azmq-1.0.3 | 4 
  gobject-introspection-1.70.0 | 4 
                   perl-5.34.1 | 4 
         host-gcc-final-11.2.0 | 3 
                host-go-1.17.8 | 3 
linux-headers-5.10.104-cip3... | 3 
                    musl-1.2.2 | 3 
                  netsurf-3.10 | 3 
                       unknown | 3 
                 wavemon-0.9.4 | 3 
                     ace-7.0.6 | 2 
                  acpid-2.0.33 | 2 
atest-895b0183a89c15f5e2305... | 2 
                bitcoin-0.21.2 | 2 
                    brltty-6.4 | 2 
fs/ext2/ext2.mk:65: /nvmeda... | 2 
                   i2pd-2.40.0 | 2 
               libglib2-2.70.4 | 2 
       linux-5.10.104-cip3-rt3 | 2 
                 minizip-3.0.5 | 2 
            qpid-proton-0.35.0 | 2 
rtl8189es-2c8d44ae26485052f... | 2 
                   uacme-1.7.1 | 2 
                alsa-lib-1.2.6 | 1 
                arp-scan-1.9.7 | 1 
                      at-3.2.5 | 1 
                    bat-0.19.0 | 1 
                    belr-4.4.8 | 1 
                    bird-2.0.8 | 1 
                  cairo-1.16.0 | 1 
                       cfm-0.3 | 1 
                clamav-0.103.5 | 1 
                 dash-0.5.11.5 | 1 
              dieharder-3.31.1 | 1 
docker-proxy-55685ba49593e6... | 1 
              e2fsprogs-1.46.5 | 1 
                  exempi-2.6.1 | 1 
                   expat-2.4.7 | 1 
       freeradius-client-1.1.7 | 1 
fs/ext2/ext2.mk:65: /home/a... | 1 
fs/ext2/ext2.mk:65: /home/a... | 1 
fs/ext2/ext2.mk:65: /home/a... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /home/a... | 1 
fs/f2fs/f2fs.mk:64: /home/a... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/ubi/ubi.mk:51: /nvmedata... | 1 
fs/ubi/ubi.mk:51: /nvmedata... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
                     gmp-6.2.1 | 1 
                gnu-efi-3.0.10 | 1 
              gnuradio-3.8.2.0 | 1 
                      grep-3.7 | 1 
             gst1-libav-1.20.1 | 1 
       host-gcc-initial-10.3.0 | 1 
       host-gcc-initial-11.2.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
            igh-ethercat-1.5.2 | 1 
           intel-gmmlib-22.1.2 | 1 
                   json-c-0.15 | 1 
                    lftp-4.9.2 | 1 
               libcap-ng-0.8.3 | 1 
         libcpprestsdk-2.10.18 | 1 
libeastl-45469730d641868ce0... | 1 
              libeXosip2-5.3.0 | 1 
              libgcrypt-1.10.0 | 1 
                libkcapi-1.1.5 | 1 
                libkrb5-1.18.4 | 1 
                  libnspr-4.33 | 1 
                   libnss-3.76 | 1 
               libsigsegv-2.13 | 1 
   libtorrent-rasterbar-1.2.15 | 1 
              libuhttpd-3.14.1 | 1 
                  liburing-2.1 | 1 
               libvorbis-1.3.7 | 1 
        lttng-babeltrace-1.5.7 | 1 
                mongodb-4.2.18 | 1 
                netdata-1.21.1 | 1 
            ocf-linux-20120127 | 1 
                       opensbi | 1 
                   opensbi-0.9 | 1 
                    opus-1.3.1 | 1 
                 pixman-0.40.0 | 1 
                    pppd-2.4.9 | 1 
              pure-ftpd-1.0.50 | 1 
            python-ujson-4.2.0 | 1 
            quickjs-2021-03-27 | 1 
                  reaver-1.6.6 | 1 
rtl8723bs-11ab92d8ccd71c80f... | 1 
rtl8723bu-19b4bdc05483a1e79... | 1 
                  snort-2.9.19 | 1 
                  spice-0.15.0 | 1 
                  stunnel-5.60 | 1 
                 systemd-250.4 | 1 
                tinifier-3.4.0 | 1 
toolchain-external-bootlin-... | 1 
toolchain-external-codescap... | 1 
tvheadend-1295dd2be863f5beb... | 1 
                    vlc-3.0.16 | 1 
                xenomai-custom | 1 
                    zstd-1.5.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/7d7aa594759d3402f02403fbac9937c86e96b75d |     
 microblaze  |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/a7ff2cb2833f3b342a8f976e8f9af5d7d8d8598a |     
   mips64    |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/aeffd254618b715e7d42b50278af6cf6d4047d8a | ORPH
   mips64    |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/70b28d50bd72446865870d151f98d7986b41b1cd | ORPH
    or1k     |         alsa-lib-1.2.6         | NOK | http://autobuild.buildroot.net/results/f05cc1b0674a4fab6243868041b0eb7592ce6c03 |     
    i486     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/851540c179300bca7d9dfc17371a76f708564062 |     
    m68k     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/f14a38addf1eaa060fa8a54f64e4b98a981eba48 |     
    mips     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/3e70cd20487049a012f350b87d8809ba9b79eec9 |     
    m68k     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/bc57f7cb1bb2cd9e1d1c513dddcb98140261ac6e |     
    m68k     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/dd2eee6dac00c7d1f070ab47186cb94092b1e52e |     
    mips     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/0f7b37960ff09bd59833b6c25d91c4f98fdff467 |     
    m68k     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/675c954429c18845df2ede2e743441f636b53922 |     
    m68k     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/6ad1d2199c2d36c2fdd29b8a95d010b751003a6b |     
    m68k     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/18a64f87fdaf8d83a4ef768afcdd2bab2b9818db |     
    i686     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/c67d0ae422b1e0309e1837872c761fcb2de80eef |     
  riscv64    |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/f0bb8a0faaaeffd88422cabf4a85e70ccee3e117 |     
    mips     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/473e389212efdc06deb83044205c2dc42c79182b |     
    mips     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/677a0c4388e7d03dd5633d88b0bea07b52e843ae |     
    m68k     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/efb2b6d91a632420fa53e5371eb75d6c29e8e370 |     
    arm      |         arp-scan-1.9.7         | NOK | http://autobuild.buildroot.net/results/5fd4d9637bb026b8a741907847ac9a6ad0dc5da5 |     
  riscv32    |        arptables-0.0.5         | NOK | http://autobuild.buildroot.net/results/d6e0efef96d1453fff3346d94fbbcc1471ed89df | ORPH
    i686     |        arptables-0.0.5         | NOK | http://autobuild.buildroot.net/results/7957b49734de1c3fbba93efed5bdfbe0ece50181 | ORPH
   armeb     |        arptables-0.0.5         | NOK | http://autobuild.buildroot.net/results/cbd95a0f1b9eacedf54a77dda397fcac743d5a59 | ORPH
    i686     |        arptables-0.0.5         | NOK | http://autobuild.buildroot.net/results/92a80b889c64778f1c3d58159a5947b244b38d83 | ORPH
   sparc     |        arptables-0.0.5         | NOK | http://autobuild.buildroot.net/results/4f73f16e0cd0f8a1d3f8402983a8c269b506be58 | ORPH
    mips     |            at-3.2.5            | NOK | http://autobuild.buildroot.net/results/81adf78fc9f07907db1f80b1be16455cf79ab06c |     
    arm      | atest-895b0183a89c15f5e2305... | NOK | http://autobuild.buildroot.net/results/8295b4440d18de2952d2a9c7e10c5116384e27f1 |     
   mips64    | atest-895b0183a89c15f5e2305... | NOK | http://autobuild.buildroot.net/results/258c7fcb5c48bd5f8ab9cd9ccffea58956a53157 |     
  sparc64    |           azmq-1.0.3           | NOK | http://autobuild.buildroot.net/results/de35ca0156d4b6f465e440ed9a3effd471f657fa |     
    i686     |           azmq-1.0.3           | NOK | http://autobuild.buildroot.net/results/90defa39c0320860d9ef2985feff1ca6f5215c12 |     
 microblaze  |           azmq-1.0.3           | NOK | http://autobuild.buildroot.net/results/6699bcc60e9a06653b729daed090093bd86240e8 |     
   s390x     |           azmq-1.0.3           | NOK | http://autobuild.buildroot.net/results/68b013454c4133304553be825366233c8e4e62c0 |     
    i586     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/c780f58012d37e538836fdb6ed796dec6d03d1ad |     
    or1k     |           belr-4.4.8           | NOK | http://autobuild.buildroot.net/results/2410de2f5ba067f36b733bf88cb5b15ec8a0ea67 |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/ef5b1c52402f4384bc556fa7069b25488b9317c6 |     
   mips64    |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/3089127f8ddfd252c754044c3acfe2d7c725203d |     
  mips64el   |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/80bccd1b4abc9a72fa1fe6dcfefdffdf72cc856b |     
 microblaze  |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/55a26a58abae06234d1621ffffb0287da29e27fd |     
   mipsel    |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/eaf7c9f9d5f363b7d12f5f10262b21cfdac5cd1c |     
    arm      |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/6269bf4424d8f3512aca93cf1af1f8272f3cef02 |     
    i686     |            cfm-0.3             | NOK | http://autobuild.buildroot.net/results/75401e47fde9f9757576b6268191e456b49b4fac |     
    i686     |         clamav-0.103.5         | NOK | http://autobuild.buildroot.net/results/a666b4e2cdc7c1526ee3e06edddddcfc7ab65222 |     
  sparc64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/d6600cf1a3a7bc1211c2b67eeb7f73a9e0d2207d | ORPH
    arc      |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/9454a29f715cb74b3524edc27bca6c9a5f3ac453 | ORPH
  mips64el   |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/484f95f7573565de60105b484957ae21474df9e8 | ORPH
  sparc64    |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/b9d8ce82f18fe9aceb573f237e2639060ccd0329 | ORPH
   xtensa    |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/63499ae4b64d8be93e53948b4f1630546d024b16 | ORPH
   arceb     |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/99075603eb01220ee028d24705e2eb49e3c134c2 | ORPH
   armeb     |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/fc1d69fb323679e864940ee43489853ad57fff40 | ORPH
microblazeel |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/3a2cac9c5ef6c5aa3ea8370f5d1390f9829467f5 | ORPH
  sparc64    |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/00d8e2eedad1834b909cb0ef55b8a3969b43dcc3 | ORPH
    arc      |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/4d5a34447451766fe209a653359e97895ceb2240 | ORPH
    mips     |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/94b82a5ab53d45a2d5bb775b9fd4de09aa72783f | ORPH
    arm      |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/41015d952790098c6bfbda04057d2e379e0a497d | ORPH
 powerpc64   |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/50e2242988af1bd99444894a20c585d5305a83a8 | ORPH
    i686     |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/da6fd904d1a6bae73b6ff89dd008de1f459bb7d7 | ORPH
  sparc64    |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/7a5cdf30881d208807976cf98960c5fe2abfed50 | ORPH
  powerpc    |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/ca9df1e86bbe923e6d766825bbe5a0d0f80bd75d | ORPH
    mips     |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/e4b01a6c35785a9fb3a622b05a5225a5fa452235 | ORPH
    mips     |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/0cc04fed5bd6bffe4ff8168551546e80b5ccb460 | ORPH
    m68k     |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/7ba6364fc3234e7f04a3fe02d6e74aba9625cdd6 | ORPH
    or1k     |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/2a404d738d1f40199442d570fec9fb455a250686 | ORPH
microblazeel |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/24c41890bf10f9b2c7b7e818961f061ce2a21d8f | ORPH
microblazeel |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/7156def493dab11964e215cda090ea3ef90bfc0b |     
   x86_64    | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/eb9ac03c47bf9a2f9bb048d6375467ecd517d77a |     
    or1k     |        e2fsprogs-1.46.5        | NOK | http://autobuild.buildroot.net/results/cc1ed086225d05be50dc759a46bd77087751e22d | ORPH
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/119227f1843dff416c6ad77411d87e7b491bb4c0 |     
  riscv64    |          expat-2.4.7           | NOK | http://autobuild.buildroot.net/results/303bc312d757a52ce1613da9c73125db4ab6c1dd |     
   x86_64    |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/8e439aacb6d4f0305f19451672b22a6ac2fb97dd |     
   mipsel    |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/e7edc5ecf0b0d3f647aa7ac3cd0d22dbe7487747 |     
powerpc64le  |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/fa538d9a38e5eda660dd5b03849ad6faa38b8b43 |     
   nios2     |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/2904e82779e46acd3da47639b3c2a32f61502a64 |     
 powerpc64   |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/af51add19aed6f53a6a440cf3025489b67aebf6f |     
   mipsel    |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/02edf59a4a82f5fe633523b5311aecbdc426f7c0 |     
  sparc64    |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/762954f76601397b40c5e43e4398a2834377142d |     
  powerpc    |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/6a946fefa27c827015363d8b659eef612e4abbc7 |     
 powerpc64   |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/713819f8a8cac543e8075339e5a2cdf64761758d |     
   xtensa    |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/7bfdd9223d3f8a3a9cac059713c209a32844af1b |     
    i486     |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/1b41f0ce4f3c0b5de3261fbd1c89eb246ee82808 |     
   sparc     |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/916328156fd0c269f1b099ca2b46fa147e90f60c |     
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/ccb450040047c72407f5aa109ebe1f88e38a42d8 |     
   mipsel    | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/cb4ea03f490f22f87b5e3a1af7682858306d79ad |     
  sparc64    | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/aaaadb21d8886fd8701896908113cc9fc2236bdc |     
microblazeel | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/58bbd2de9b5bf670902d82209fc70bab61cdc56f |     
 powerpc64   | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/6f31484bf46d7eec9ca81d9a5c4906ae19ec8be6 |     
    or1k     | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/fe090a6eb92306bede1fd9ffe48b35ccf11b3c58 |     
  mips64el   | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/6dee312a575517a0d7efc9ea434fe8052c090dc6 |     
powerpc64le  | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/8f061dc9ff8d27c51287c3af86891c2f6d70bb53 |     
   s390x     | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/3bdcdeae90cd0780c34ec94ec295a3f1ebb32e39 |     
 powerpc64   | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/2e6a19c4d719334ef9d5484998406bdf7b637d94 |     
microblazeel | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/43e162b7ae22c4e415a1bdf96eeb9d9312fdaf26 |     
    m68k     | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/2afa8f3778d12c4ed0ad3d7b00c9a4f0e62f4dcc |     
    m68k     | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/c263ba53bb458767f594d96dc42f7bf05d374459 |     
  riscv32    | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/005078b0f0e40f02ae9af7490d8085037724b3ff |     
   mipsel    | fs/ubi/ubi.mk:51: /nvmedata... | NOK | http://autobuild.buildroot.net/results/c5f3cc19db5aaf29b24f0631622b071d63b65371 |     
 microblaze  | fs/ubi/ubi.mk:51: /nvmedata... | NOK | http://autobuild.buildroot.net/results/d5c1b3116fa4f81de24e3dde61ebb1ac8fad6541 |     
  sparc64    | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/bd50c2306958b1c4f0460b63974b4d75c1716ad4 |     
   x86_64    |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/25b06d31c2c5137eadf31e96adbce246d2b449f3 |     
   mipsel    |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/697ce3ffa58e9770145b140ec46ac1b96ef2560e |     
  mips64el   |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/4760e1a2a245bfcd5c4875a90e417397b7146105 |     
   armeb     |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/5166a0c68887e2b5d71da1328720bc339d7d4f2d |     
   sparc     |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/d7cd24d34c10a3b5b5f4bf98b961f3ab3fc23982 |     
   sparc     |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/bb26ed1e5a9f5e3ad21a47f5de160056eaab0582 |     
    i686     |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/f1f7eefc06cbc318055da2012b254b4d52e6a60f |     
   x86_64    |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/9166facb176db36272d858b2ac18311635162bff |     
   sparc     |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/a5d8dfab1bfa85efee8a7c69f411c9de814a080a |     
    or1k     |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/7524b7793fe3616840a4d3d281c0a4b958797acd |     
    mips     |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/96c141e4db34459cee58cfbf911837f0605415da |     
  riscv64    |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/f7171b3181ae2ab7fc0833fd4811826af90d7b6a |     
    i686     |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/691e6faa5f34e38bfba543ce02569035e395106c |     
    mips     |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/de41769e043cc2f4d5feb2bb4bf11584270d60b9 |     
   arceb     |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/9db6a7e5899cf8e601575b3fd3177b4f984f647d |     
microblazeel |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/001958a34ff50c20a03131f14597134fff9f14c0 |     
microblazeel |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/c78f6fc8380b86f934892e8086f402515bc55e72 |     
   sparc     |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/38df40bd7934beee5b5ea253c788d3dfb1831581 |     
  powerpc    | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/0b07904d24db7af7c6e0722c9d469cd4c46bd509 |     
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/9e8abfe61393131735c47fa2232579bd2486ff07 |     
   nios2     | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/be8aa474e1dc3615fe88789bcfc80634ad9c20de |     
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/0238bc78d3d3a900125cb7aa78256d3891274f76 |     
    mips     | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/c4eead5382cb9452644c7d1992cffac0f2dbc102 |     
   nios2     | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/9c5a7adff58c1cec39ddaef977d382643a0f3d26 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/8f5c95bd25236aac20bba383232ebd349f13ae5e | ORPH
  mips64el   |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/2a724f2bd2a861e34c08cc21ef2be19887f63f5f |     
  mips64el   |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/5da049585d9fe7d72b3ff6106d49c7e36843172f |     
   s390x     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/c541a8564f77fac287e8f27e804669b64e08a194 | ORPH
 microblaze  |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/5b4f4fd1f47ca5bf4d9dfde2305bee9367bb7322 | ORPH
   s390x     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/78e225e92d90b52e11f577933d582863daf900a4 | ORPH
   s390x     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/5d80cc469ae6365bc66c4d00232e07e436d8cf56 | ORPH
  powerpc    |            grep-3.7            | NOK | http://autobuild.buildroot.net/results/bf5b86e4c9783dabb724d8b4929633bc5a53e304 |     
  sparc64    |       gst1-libav-1.20.1        | NOK | http://autobuild.buildroot.net/results/e050bb456e3e1df1629e8647361ec4e77686c9e7 | ORPH
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/210c88280956722e474d4e6c14b2a98b93bafd67 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/8b1ebcb30dbb113b0f1751aa03ed7453e1e44057 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/9ab46170e1d4dfb93dbde57ea02afbc298649e7c |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/1cc624daa2668354bec45659e1259e9e5f92022d |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/3ef29455afab8b835a4f3e4d9dbc30c0acf6a973 |     
    sh4a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/349c936eeac7f06a8e408d742a500afa160d7fdf |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/9b5d6c90ca9998a5f8c2a99638a21600a108e7f9 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/27f7ff5fcffdd0da41e30457e5e89eb655f748c4 |     
   sh4aeb    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/1cfd8fb7343b4419159e4dd2e1ba747fb6dc74aa |     
    sh2a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/6bd0b6d9102767ca0f9e2bae74fb4f8ca2239995 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/90eddb20e78565d83160f6a51f1a2fac5847a6bf |     
   sh4eb     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/3e8ec76cbfd6c1985ee746be0f258e085bd5d465 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/60b542ad2aa3498aaf948415873652e81f377328 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/5a63bc6ac4bda69ea0961ed156ca4c2d684b8979 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/50c544a3702b8af9ec9167e92ae1c7f50777ecbf |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/1cd58e80366275e744eb05af6185c0e2359ad321 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/e7997cf9ebe493c12d14a58a80975f984c5e66d9 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/d971b14ec6bfbfa71dc97795de0521e90c51654b |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/84a4b2b437ced6fb82560caeb77049f079ece399 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/420791d5cca86daa405e53baafdf6cce1d7e8117 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/fae4fa853412148bfa3127682b9ef196dc26863e |     
    sh4a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/73a4155915e5b5775511369b74c23879c6747309 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/5efd0dfdd8581792acd34509f1bdf4ace7ccc564 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/c8d8e220fd109429ecd4a9d9b61c86fefef2ab8e |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/0bbcb4f013e5171a424c1dc43fbc86b84dad0d3c |     
    sh4a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/791dcd289f5086761ddb03cdfc377ff384fe57d6 |     
    sh4a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/f749ed64a248c850f81eb6e0864728c323ec1b1a |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/7a9c52eca1c4426371b27498fed5e4450087eea6 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/6ee574c921cc5dc545d5bb84ca1f09a798aa8251 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/00c93226f030030e113a8e7706ad6a68ed0eef5f |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/03d287f34e9c59c74c308a19662442f274fa2577 |     
    sh2a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/c694a4c80eba6c594762537af9ffa00031b11b92 |     
    sh4a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/9d881a8c949b714284d15808b4e0caf3ec55fc14 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/da1e7fe7359a02add7602b520ab69f03b6b6e5d3 |     
   sh4eb     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/618119001cf8e935834ea6dcccbd1ca92598586b |     
    sh4      |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/529f8d2712606266f83ff2426822890ec39ab430 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/0179b2dc0086a5ff743722101652bf9dd4a8382b |     
   sh4aeb    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/a3eb1ff6bf6357242ec7993db63e57d4afeccc7b |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/a966dfd529d142cba69e6c9d44582cfabb8da97a |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/55b645f7c45cb3420d887539b63762d04234a411 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/698e27a7687787f782829044ff8eb2ab3a56b7f0 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/dd94182b55772853da70a630d58d010eb35d188c |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/2cc3461adc924c3c52c4e124685fc0b32b43c11b |     
    sh4a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/d1b1dfe449f82944bd48215da3cdffd05797e2e9 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/9514d7fe091e0e6f456117470df32615824e9598 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/ed24bad39fb21a264b147cb122ed9c04b6babd8a |     
    sh2a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/af47a32403a5ec459c146ec5a7506679bd82bd7f |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/84aa18734eeed7629ea219b6b14b5493a613a1a2 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/7b2db2198cfde256e67488099c5752cc244c90a9 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/33277d4687ca9a04dbfb02c50e5755ff9e55b0b4 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/b9f71efdd8a012ad91a01c9f74a0407beaa70ee4 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/b57e36fba364b94bc0a0d6061a968dcf54ca1377 |     
   sh4eb     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/f4d52cabee61ee0f234b03c1ec1bd02e85e7bb20 |     
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/c6eeafb71693645f027f17089a22e4bebc22f7bf | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/56dcb95c1985501807c641e9050a3f65350fdced | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/ad6c7f7db7567cbb17b5ca3ac0271b04144a45ba | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/611fb2f6466e7a47331f74d72ea95d3abfe44ea3 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/556eeedf751624b96b375ae1248888c5f9f594dd | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/bb24806298c253d7ca545115baa1ff86b1a71f8b | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/b4b5dc8bf87608767a5bad24a90d5bddd0483ff8 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/3433734670f11185b6ed205883941efb3ce67799 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/21c9a866613cfa3eb14eeb10d934d05b5e4d9a36 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/109728ab260ea199b32682a3f2fd762a78e75482 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/3884d291a9860a24d88ca576efc26ea0d8ab0d71 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/654b17831723207ab54a67b773b90d9381db0092 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/288c0231abec556d77f088041d02d9c01ea11709 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/c749b6f26a2602b70b07ccc1ae5718a8269476ae | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/fbe4fc86c16c0d25bc4d588b8fe044da9e9c0f0e | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/daa609233600e8fb17c9cbbfa59a832ed8f50863 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/7964b2b1666bf8c92ff6bdb0237f99392e51f61a | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/2f02cd854a61b08873138dc123208d82922e4c8e | ORPH
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/fcf5b279d732d85bb6390e736b5a6d084f54ce7a |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/26cabe81cf46d914407a48357d2575563540991b |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/5e79ca906f3025ec5f4e6337a8d0c3b617596c76 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/0cae7bd06a5a5538e54bff66acc73d2f1d097c7c |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ae13bb91e93c73ea66a599919fe35c60c22476fe |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d5fb9d841e950bde5f04404b690644c1828bd3a6 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/bae245a41d5035efe01305182d46ca318c27178c |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/40be2e07bc540582812be7ee84880d6cb9610a8d |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/f419c24b3be54532c33df91f825b390d997d62fc |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/f0d011269342c0e0a48dec531edf82088547ca11 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/71f87d2e924db6ead3309209fa60fed355be3042 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a4d0930bc53fdb745ccb7c4df9e2fe0be0a09f80 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/917592bfdd19d05fba247bacf243f3268cec0af3 |     
  powerpc    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/5194292ed257cd42ae824967166f64891d86d8dc |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/704df976316c03bcb09bde9f04d57c909c0775b2 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/193114418860655d76caca51ff64d2c1b79a29a9 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/7982c49d8932695fa8e821728ba231e9569b1a7d |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/36c8392ae02e4b35c07bd304a05f8dde11cd9e37 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/3bf10e0d4cb452fe8f9294846839176730c66e23 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/487ce80a1e4956f9f090104c18bb0a9bea4675ec |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/bf16198083820becee63676352d64cea1f1cb5e9 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/12f46f2b6dcb50d6716a60b7f10b0ebc042d68ea |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/8b8fa231c375f2b18995d7bb0e0568e8535ac090 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/030b5adcde34b74c91e0ccc7322b27d88e80c278 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/579f200e2f35e7558fc5f36a4932b96a31b368a1 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ae92120ca14e6824336b65a9359844926d623c59 |     
  powerpc    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/9b36a0706f08830cb34fba60c12b8ae641430b0b |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ba941a830c02c3fd774d9d10a2f559cbae8cce46 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a60a7703802736ba0ff9c85f462fe8245380b2c5 |     
  powerpc    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/2bc65da4394103b0470896c94babf2cf1f2a2c83 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/5bc049260b4f7c4c3fbe48f59ccbf114c24b98c2 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/923646f44d0545635039bc940ae21ec895d33211 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/de2404ff00c0d54d790f726e9ebfda2e62cce5f8 |     
   x86_64    |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/6f02166da79bccc4d1e665c52ff956e4b8460f35 |     
    i686     |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/50956ef45303077fdde261201567d2b3e15bbda4 |     
   nios2     |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/518d62a68cef5860f4f3a616202f387dddd4f32b |     
powerpc64le  |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/28380991621d02fabd1183a5c1b57a955d0aa946 |     
   nios2     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/8333836856729655844661c01bc3f39fe7a448a6 |     
   x86_64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/1c4d52ddd6c4414a86975e3f41c26bf51c8a115b |     
powerpc64le  |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/a22735fe533148409354bf332a0c92db646edcce |     
  sparc64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/243cfa9ed036ec1d8d5f9924fe24498f7cf00d05 |     
   arceb     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/6ec9937a54c134bbda8d4286f57861932286342a |     
    i686     |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/63af7ce4e05c9ee580c73d548b28e381d0931e49 |     
    i686     |    host-gcc-initial-11.2.0     | NOK | http://autobuild.buildroot.net/results/3870c99b794d8bbc724176d4ed1608bb0fc22f51 |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/077f9684806c36ebbbb52a359f6010acb3eedcfc | ORPH
  mips64el   |         host-go-1.17.8         | NOK | http://autobuild.buildroot.net/results/5b0ed35eb393e1ad2de38cc91a706e9ce32b5812 |     
  mips64el   |         host-go-1.17.8         | NOK | http://autobuild.buildroot.net/results/d818999e9533ccde44acdfcb43cc5fac42325d37 |     
   mips64    |         host-go-1.17.8         | NOK | http://autobuild.buildroot.net/results/f5497008847eb1de8c426bf72775a9d5fb6c7653 |     
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/bafbb3daeb89800c171c622f92e8ed41fdcb3d3e | ORPH
 powerpc64   |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/2c927a009275128bf40d34ed8e0d38c6f635ed8b | ORPH
  mips64el   |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/208fb340da4ef6cf89c756bb5e0254da7d14e9fa | ORPH
   mipsel    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/a96c1ccfab64e18ba091e668d3764d72997be938 | ORPH
  mips64el   |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/e467e967c7ccd1b352f8a95ce0d60b056325d77b | ORPH
  powerpc    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/a49c7ace1b522f4a3e48c7b64061ca61ba4b2485 | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/7031a6967694007af490e556926ce1192d943a0f | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/e696bb0dc0f1b70d330ceb1ecddac578efdf01af | ORPH
  mips64el   |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/677255c4838f8f9c33b07e519660c51e0f6da644 | ORPH
  riscv32    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/8c266ae6472993ee068c00476422deda2c53f3e9 | ORPH
  powerpc    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/22e7d4ff4bbd69e5a4033de43908a3ce610ed44a | ORPH
  riscv64    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/a19cf858256b8be8c86b1012776102debb700846 | ORPH
   x86_64    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/b0dcf40b1aa45210bf910ded614a0bd3a8da86f3 | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/03234b78f965e3911301e3a109e2da17ed992716 | ORPH
  powerpc    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/cc7bbd44aab4ce0a88f8289d5dacc69a43da4d63 | ORPH
microblazeel |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/3c998c83c8215e2a80ea9675055d10742f8871cf | ORPH
    i686     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/cd70a14bff375ae90638f661cdb5f2c95fa86c30 | ORPH
  mips64el   |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/4d73240f7760fdfce2c520111890d1431a9e76f9 | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/2f9621bcc84e15f0fc3e30fa7c8011589e0d614c | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/c48f459a9746ea5380f2eb4f600f94349ad5f3de | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/c42047633312dc36918e99ff77af3293d1d2a97a | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/2bd81ffc0576265104cd4de2d9d6f1c80df33721 | ORPH
  powerpc    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/128acca75d2736cff4ab372ce6ca201b4eb6e825 | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/87d5c4a77d212d13193667f7023b7c7a836bddcc | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/8d0956d758cee49e88a39c3189f46f5117250f6a | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/99d808044ff20735bfea94ca73c0d4a9fc6fc8d0 | ORPH
  aarch64    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/bc66195507a1796c22078115a4627ca5cd30ef65 | ORPH
  riscv64    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/e6d55ba1e6ba5df9ea070035415df6485f3c692d | ORPH
  riscv64    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/6331b175b5bf8a87e7f3e18f39986914351d9f38 | ORPH
    m68k     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/3d06d7fceaa78b18d0f77be4a3b3afd9c5cd96d2 | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/263eba0f80e1a5ac74cc27d9e453aaaddc76d49c | ORPH
  nds32le    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/3dd5ef63a6f5276c2004d452c394ce00c594d823 | ORPH
    m68k     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/de110fa5c288c2e549a2ee1d7b939653b3214684 | ORPH
   nios2     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/a65a61758b5443b43d3c6e8cf5175e82c2a12776 | ORPH
   x86_64    |          i2pd-2.40.0           | NOK | http://autobuild.buildroot.net/results/9e9ee9b3ed4cff7f029e7c5f7ad6633fb96834c9 |     
microblazeel |          i2pd-2.40.0           | NOK | http://autobuild.buildroot.net/results/c3d2a066429d5f2889c2232d62e5950eb6a89311 |     
   sparc     |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/09a327ff843693ce416754b5461c353720a7baa7 |     
   x86_64    |      intel-gmmlib-22.1.2       | NOK | http://autobuild.buildroot.net/results/8cadfee0288a05676868e05d56243d866cbf051d |     
    or1k     |          json-c-0.15           | NOK | http://autobuild.buildroot.net/results/bcabecb18c476c79d554200cc86d6bf34753c8d2 |     
 microblaze  |           lftp-4.9.2           | NOK | http://autobuild.buildroot.net/results/7fd1dfd5bc750ae5a3278ca950c838ae90704b23 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/6423ecc462088b4bfd8433e43912610eee035a4d |     
  mips64el   |     libcpprestsdk-2.10.18      | NOK | http://autobuild.buildroot.net/results/974641a8a63a8ae5ccb294510f16470243e0b380 | ORPH
  powerpc    | libeastl-45469730d641868ce0... | NOK | http://autobuild.buildroot.net/results/d8d64cd1e8dc7534813699094e70c1315af961d3 |     
 microblaze  |        libeXosip2-5.3.0        | NOK | http://autobuild.buildroot.net/results/a422468c9f7af049279090cfc3ff72908dde9701 |     
    i686     |        libgcrypt-1.10.0        | NOK | http://autobuild.buildroot.net/results/e105210b21d2a711c42160e06d23c57502be48bb | ORPH
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/de8b33cff78f26f0ef47f44e63c24cafa22626e1 |     
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/e6239bfa9a990f46bcae1fa6504bee11ae861aa9 |     
   s390x     |         libkcapi-1.1.5         | NOK | http://autobuild.buildroot.net/results/f845aa6edde3a19dac6f098082c5286c96b57d04 | ORPH
   sparc     |         libkrb5-1.18.4         | NOK | http://autobuild.buildroot.net/results/336e19c798ac6c59813caa1177ba2a2712ede4b3 |     
    mips     |          libnspr-4.33          | NOK | http://autobuild.buildroot.net/results/ed5320fddda88ff5e20d1f68e35101897b4bc351 |     
 powerpc64   |          libnss-3.76           | NOK | http://autobuild.buildroot.net/results/62000289ecfb9c6f26339dd82e1fc6102c1600e9 |     
    m68k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/95ad3d07ea9f0bb3d631c7a2ff9e12c03fd94eca |     
   arceb     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/3953b8955baa9d73fbb59c0a159b8ecd790bfa21 |     
microblazeel |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/9a5e2dc0de7e381dea9b26fb7c686da1e8297bfa |     
   xtensa    |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/d8475273b22a754078fc7545d4bcec4bb3b7f35e |     
  riscv64    |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/58f895b4c881084cef14b7a6bc86c47104c5d980 |     
 microblaze  |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/323595a62e7c00378fdfd8990219b82f00300019 |     
    m68k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/f6d97a4a9334edd37c86e78fcea86c377360a035 |     
microblazeel |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/ae634eb05950fd0331f2f290e0a5774147c53cec |     
    arc      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/8799124595cf1d437218d717a0e8ca7f25350442 |     
    arc      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/e05957eb42ddbdc164bafe9017a3df087e8c26d2 |     
    arc      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/580cecdc5bbfcb3d32fa66dd36792748c5524c5c |     
 microblaze  |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/679a3ebdb47255bc2ed318ffce383eff6948374b |     
    arc      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/cb869b8b26bad5cb4efc3d3740d8cb010bb94a5d |     
   arceb     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/68e148c42433999945e6c77b1ef2d5326cd5851c |     
    arc      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/6ec74e38208fc1ae3a06ddb76a072ea2eaf13298 |     
 microblaze  |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/9de1ffb8d0425c36b282318ddb5ed86d5c45846e | ORPH
  powerpc    |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/7b345a725003a7658e2cd97d62ace1ac2dd9f178 | ORPH
    i686     |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/7beecd42792e0ede4fc219da43864231c1e62c58 | ORPH
   arceb     |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/8ded544d2025abcf2abc206118ddd309340c6a12 | ORPH
   sparc     |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/8ad8ff75208a4fe0bfd2cc6e53323ad89adffb17 | ORPH
  powerpc    |        libsigsegv-2.13         | NOK | http://autobuild.buildroot.net/results/deb030023688166ea8fec4627f42537e39e09868 |     
    m68k     |  libtorrent-rasterbar-1.2.15   | NOK | http://autobuild.buildroot.net/results/15b908b6012360173b11b2e53fd106bdaa8554c1 |     
   mips64    |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/5999bf0d4aec8485976e6418d9992c31d54c8622 |     
    m68k     |          liburing-2.1          | NOK | http://autobuild.buildroot.net/results/7623b1b771d4a80dbb43ccf33b4f3191f6b1fdcf |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/277e23cfcc8898abd7222f5e4a2b94087f31cf95 |     
 powerpc64   |    linux-5.10.104-cip3-rt3     | NOK | http://autobuild.buildroot.net/results/118c5820aac3f655e99ecf453affa19991c96521 | ORPH
    m68k     |    linux-5.10.104-cip3-rt3     | NOK | http://autobuild.buildroot.net/results/6212ebbfa8a6e584163cb26c6ff01673360c0aa7 | ORPH
  mips64el   |         linux-5.15.30          | NOK | http://autobuild.buildroot.net/results/b0027bf993d50330058235fff97e7e4a6f9511f3 | ORPH
   mipsel    |         linux-5.15.30          | NOK | http://autobuild.buildroot.net/results/d93ec18a5dde5aa2e991b8f5d9f6e5048cd76b07 | ORPH
   mips64    |         linux-5.15.30          | NOK | http://autobuild.buildroot.net/results/1b28a5a5895d1a50b87fa0379b2152e9b1d8aba5 | ORPH
   mipsel    |         linux-5.15.30          | NOK | http://autobuild.buildroot.net/results/ebc3344922eee382b7af8a847d44d22e3d9a475f | ORPH
  mips64el   |         linux-5.15.30          | NOK | http://autobuild.buildroot.net/results/5713c53edd13d779dd90f7f47e4787b11431bca6 | ORPH
   arceb     |         linux-5.15.30          | NOK | http://autobuild.buildroot.net/results/f512b1a1f0c38a4425af1ea84b32321ce6bb4c42 | ORPH
powerpc64le  |         linux-5.15.30          | NOK | http://autobuild.buildroot.net/results/169073983f632f41ae59ecdc8fb19ee401d03a6e | ORPH
  mips64el   |         linux-5.15.30          | NOK | http://autobuild.buildroot.net/results/795ad413abc3ab1bc91301dbacba19190a02451b | ORPH
   mipsel    |         linux-5.15.30          | NOK | http://autobuild.buildroot.net/results/f72198a7a859659d1e8ed91c1639ddc20668a9a3 | ORPH
    m68k     |         linux-5.15.30          | NOK | http://autobuild.buildroot.net/results/002699b7065704f46f220d89c9f93a53fe41f47e | ORPH
    or1k     |  linux-headers-5.10.104-cip3   | NOK | http://autobuild.buildroot.net/results/12a90789a4b1895091d542bc74ae7415a74e843b | ORPH
   xtensa    |  linux-headers-5.10.104-cip3   | NOK | http://autobuild.buildroot.net/results/e1f3b8f904453b8cdd3d71de9e40a5f4bf1fc554 | ORPH
    m68k     |  linux-headers-5.10.104-cip3   | NOK | http://autobuild.buildroot.net/results/51c66c2b921bf3c675b0e4a0ce49908b9517369f | ORPH
    sh4a     |  linux-headers-5.10.104-cip3   | NOK | http://autobuild.buildroot.net/results/c163d05fc396bd266fa364f51e50a484ab3f82ef | ORPH
   arceb     |  linux-headers-5.10.104-cip3   | NOK | http://autobuild.buildroot.net/results/9af8a8d58e4c8620426ac69a8b8fc30483fb99e7 | ORPH
   sparc     | linux-headers-5.10.104-cip3... | NOK | http://autobuild.buildroot.net/results/809ff9fb16e6c4f0a51657e8a72600c790f44c10 | ORPH
   x86_64    | linux-headers-5.10.104-cip3... | NOK | http://autobuild.buildroot.net/results/9ce97eb10a6a5f8bc52a9d7fe6072d00f7de0a3f | ORPH
 microblaze  | linux-headers-5.10.104-cip3... | NOK | http://autobuild.buildroot.net/results/11673456dca26fb192d65b765d349afdf588bced | ORPH
  riscv64    |     linux-headers-5.15.30      | NOK | http://autobuild.buildroot.net/results/898982b56c96fe55d7996668f0c4f1a3d1322896 | ORPH
   mipsel    |     linux-headers-5.15.30      | NOK | http://autobuild.buildroot.net/results/d0a67650718ebc6d04c1f0d5d672395d30f38c4f | ORPH
   mipsel    |     linux-headers-5.15.30      | NOK | http://autobuild.buildroot.net/results/e6a3f15f7b49cfa3e2e47d4edebceb6aac58add9 | ORPH
   arceb     |     linux-headers-5.15.30      | NOK | http://autobuild.buildroot.net/results/07d13ddedca2faea0fcf92bf08fa8cc84b8d7211 | ORPH
   sparc     |     linux-headers-5.15.30      | NOK | http://autobuild.buildroot.net/results/02b8d746653dcd6a8989a06b65860e6cc28a3417 | ORPH
   mipsel    |     linux-headers-5.15.30      | NOK | http://autobuild.buildroot.net/results/130cf8fb1d48b574eb537c29cda338e8fb679019 | ORPH
    i686     |     lttng-babeltrace-1.5.7     | NOK | http://autobuild.buildroot.net/results/1cb7463e8940842a566d18a9d7666a07a9c910ba |     
   s390x     |         minizip-3.0.5          | NOK | http://autobuild.buildroot.net/results/306a264bad4996eaf2cac1011caa31752a3f04bf |     
    mips     |         minizip-3.0.5          | NOK | http://autobuild.buildroot.net/results/decc72155d93ae686740ef762d34bc371320e934 |     
   x86_64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/6631b5807b78321b8c747a5f3b1f2a2ef3f54088 |     
  powerpc    |           musl-1.2.2           | NOK | http://autobuild.buildroot.net/results/1197576ed49fe67717e9d1b808dffbf2b4becfdd |     
  powerpc    |           musl-1.2.2           | NOK | http://autobuild.buildroot.net/results/56a6e8c4694424c0520ee18b4889ce43419d1f62 |     
  powerpc    |           musl-1.2.2           | NOK | http://autobuild.buildroot.net/results/04893bbdf920bd91c174ffa7c73a2f76fcb3d027 |     
    mips     |         netdata-1.21.1         | NOK | http://autobuild.buildroot.net/results/2340f62a08dd45cd263df402504ba45f677f7b62 |     
   mipsel    |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/030138f6f7cdd67e4fb3e5da06147e62e1fde4d0 |     
    mips     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/4fac1f499cd6aae46687c1dd97781f41ab9067af |     
   sparc     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/e4b55c5cd9ab5f0554e2d82802b4d690b8d27310 |     
  sparc64    |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/0bbb2cc4485318c04c8715bf6e534e60a0fec7b0 | ORPH
  riscv64    |            opensbi             | NOK | http://autobuild.buildroot.net/results/49557dbb9a99293f02f00536542e005692045e88 |     
  riscv64    |          opensbi-0.9           | NOK | http://autobuild.buildroot.net/results/259ddfda957c9c88f51166fe1c829d06fae6c20a |     
   armeb     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/3c08775308182799829a3cbe1d0670dc8e595584 | ORPH
   xtensa    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/2586afca0490314c68dff6bb4944a8e59f7605b7 |     
    or1k     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/02d71b06ecb8fbf8a884e5a1903f1c1103f10a38 |     
    arc      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/caaa60c405bf01ef17961ef739353d58b0b37fed |     
    mips     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/50657f78230d2fc7d0093107a76fbef193cab240 |     
  mips64el   |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/06abd3387e7c2581006f420433297b9a8b7a8063 |     
   mipsel    | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/82775c5efc964b8a232169d3f908b76e30c33345 |     
    or1k     | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/d3a64d7b9ceb0165d7f372fb488b76fb179f88d7 |     
    i686     | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/200052b1c7546fc78de308c8619b515a1c0b9399 |     
   mipsel    | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/5c8eb91a16bcf65630489203145d206e8152af97 |     
 powerpc64   | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/9c8872fdfea8c81d394b04c641f9195b192e921c |     
  sparc64    | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/5301f2f9ad11dc6221e371bf56b09b2cff88e1c8 |     
    arm      | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/982f233c46768a43f7454bbb7edf570c7ef5a824 |     
microblazeel |           pppd-2.4.9           | NOK | http://autobuild.buildroot.net/results/9823f9e8db9ed8a47d5a1ffb777c2fe3050ce3f6 | ORPH
  powerpc    |        pure-ftpd-1.0.50        | NOK | http://autobuild.buildroot.net/results/f5d36180949278510199aa499e253780558c6ffe |     
   sparc     |       python-ujson-4.2.0       | NOK | http://autobuild.buildroot.net/results/d19c98f6a0ef6573e015e66c27cc1682a290e62e |     
  riscv32    |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/259e9f2a96453577af97a46e2d4d7f052fb53a18 |     
  sparc64    |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/5bd06867929f89ca07c60cf80ce26e47918f967d |     
  sparc64    |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/b9bc4d8075480f837ef5bbc60e35f39fc3e21c95 |     
   s390x     |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/a4fae4a947c7f51edeb3a2ee0e0ae6468804e84e |     
   mips64    |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/d4060ced883760c245ab5e75dcb960c518ffdac7 |     
   mipsel    |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/cb4bc421ee175da059ebae149cce146245a4b964 |     
  sparc64    |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/f95aaa85e419b8b87444022b6ed57f25df689a40 |     
   mips64    |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/2a390c9de45c7a33bc37454bb81fbf317b23969b |     
  mips64el   |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/e9637da4e50404ff7d894a8702e74b78bb899b09 |     
   sparc     |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/ca818df04342395eabc0654b70fa7a6c9d045733 |     
 microblaze  |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/7bb1f4c1a0d2c09ac0946d7c0df7574781add20d |     
   arceb     |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/fbb5c53f0c780a2a57dc5a7a8160d458e5cabef1 |     
    m68k     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/947a89667c537ee4c30df2d21d47d25471329e14 |     
  aarch64    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/a107a560b5dcb26b159b9cfdd3502a208d0c680b |     
microblazeel |           refpolicy            | NOK | http://autobuild.buildroot.net/results/9b9e4a8c23791042dc7e4e672db3d52493edff78 |     
 powerpc64   |           refpolicy            | NOK | http://autobuild.buildroot.net/results/38fe6a4689df0bf3287355fbbca272ed84f855d7 |     
microblazeel |           refpolicy            | NOK | http://autobuild.buildroot.net/results/3f97e9fb0795ea9113597e60d01f426e281308eb |     
  mips64el   |           refpolicy            | NOK | http://autobuild.buildroot.net/results/c28b679745cb3c7b45da74d0539b4d44c0c0d4de |     
   mipsel    | rtl8189es-2c8d44ae26485052f... | NOK | http://autobuild.buildroot.net/results/3ce8f96e7e83812f137fb96daac399070467edef |     
  riscv32    | rtl8189es-2c8d44ae26485052f... | NOK | http://autobuild.buildroot.net/results/8c0cb4d79dc10cb67b976834b481d2e0457c1b7a |     
   sparc     | rtl8723bs-11ab92d8ccd71c80f... | NOK | http://autobuild.buildroot.net/results/79714e561b3bec8e15997a7170a427211efb1b87 |     
   s390x     | rtl8723bu-19b4bdc05483a1e79... | NOK | http://autobuild.buildroot.net/results/74a6fa2346d599db7a3edde97785038cefc0b10d |     
  sparc64    |          snort-2.9.19          | NOK | http://autobuild.buildroot.net/results/47c0c8aabd81c5862b9ee6f2c8426ccf7f64f5c5 |     
   x86_64    |          spice-0.15.0          | NOK | http://autobuild.buildroot.net/results/4e0dc43c28d45176cccf573fb56ea9690192f754 |     
 microblaze  |          stunnel-5.60          | NOK | http://autobuild.buildroot.net/results/b11a989b1d52bef0028745734dee9e32bd0d5425 |     
   mips64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/47f31b36f123c4be4661f4fde2d1f7385c5d0ed5 |     
    i586     |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.net/results/feccb2c4954b6271546fdd77804b2db46d57d09c |     
   nios2     |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/359e6733f5f82661136b9b50c2854ff184547f02 |     
  sparc64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/bc837b16b43abdd7fe76f09fad985adc40d76c62 |     
   nios2     |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/e714eed164701e7b524fb5fcf78f22181114ba2d |     
  sparc64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/b3052706ecb6363c0a6507dae74673e8e77b4011 |     
  sparc64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/b3294cf8cb0933d5119149868f041902dac74e7d |     
   s390x     |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/4816bd6f5673197dbaa067bf89d0ddeb6e0fa837 |     
 aarch64_be  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/f45d15633725426ba5a0f96e6d09969a739ea2e6 | ORPH
 aarch64_be  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/fcd7480eae9eb4c10a38b276ab24288ee1ab754c | ORPH
 aarch64_be  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/b000f1c604e3b7f9da0040013be983bd935bcbf1 | ORPH
microblazeel | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/d5bd689052920f4c84a4efa16e43b1b86714e0e8 | ORPH
   armeb     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/d61167e7b91741cd368f8479103eda0624f7a8e7 | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/b9a5d8efb33829103123bc88f833cf86af49442f | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/16422e720911c8f6b5c60ca18e022a5d0e4df8d5 | ORPH
 aarch64_be  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/567f4cd00d30d8b1a06596ff3b2d974ca9e3ca47 | ORPH
 aarch64_be  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/7a7bfc995512c54d43bf8fd023190c0fb4eced56 | ORPH
 aarch64_be  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/bc86754ff5f2306d0601fe376b9002a3a2d6755d | ORPH
 microblaze  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/95663b63061cec4834061bd0e9ae11886ffddf76 | ORPH
    or1k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/31f012ea82a4265ed9e8bf4f58e6f6dedc9e7b13 | ORPH
    mips     | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/fe84e7c663df8476739956e2ef2031a66f4e4eb6 | ORPH
  nds32le    | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/cb18f6533806f3729f9718bdcc719384be375b66 |     
    mips     |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/10a855c441b8d5b37879036c6bc1c77b6c2cfd9b |     
microblazeel |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/e0eaef44d81bfd9451ecece50f29090a876886a3 |     
    arm      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/7888d68e0795c9e7ac8881b5bc1ad3f7a985ff57 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/480b95fd3f1e8a8089635b8f33d4ab6f3ba31f28 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/2558985915188fa074942e8784bfd47df17d5556 |     
    arm      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/ddb370c413f1544e3f1a23b9a3ed29029bf81bd5 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/d03f1c76a97b05599788c15f83e883468161e509 |     
    arc      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/7e164cf2eb93658bcb5bc33abfc72cd5ebc19522 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/cdca62d2a2d096ec79c25ac5792575a77de09806 |     
    arm      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/15715d4977f4bd78f6d702dae4f83a9494d9d393 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/0a19afe5dfa48682d7984f62a11611a191ff7128 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/49209398871ef7578816a5d2193992367e3e14d1 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/a70907fb62ad8a4b4ecd2ee418eab2598d70c595 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/47af6e548a222ce4053fa50bf05d634040462bb4 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/c5df50639167f1996cad4488a78732870fea12fd |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/f7f34fb9135dd1c176a5582b0db30554cebce765 |     
    arc      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/13b3db1da451a98a3cf5a66936b531db3eb7cee0 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/b83efdd5b9de644941af1cd3a618186afe7472ed |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/4c9cb8b40faff26350f3897f85c8e85a21c404ab |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/239e9d2e3036b44f4086a2eacf90ae8c0a262afe |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/962033cd50f34752b63179651346770968d968e3 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/c51bab11c28e40645798a90f78ece35c0be06d48 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/31c6f41ab4aa6d4adebf791459aee1c3f6eb598d |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/b5a3a45213a1af20d1370cb4e934068757eb2b24 |     
  riscv64    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/a1c50ea7fe96141bd1ace4f8841faaacf2e7bc49 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/53cc2afc3b60c033f3162aa319c3ec4ebb97e5b0 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/0dc7574362b9d50a7e717f63af9a453d80b60b87 |     
    arm      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/1614ad4291f02e8c28e7acabc6dea2763672f0d4 |     
    arc      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/78ddb225fab10c7a5814b6b8ec44088f4aac8ce5 |     
    arm      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/ae0b660aa480626abe1b6370ea25934b959ac015 |     
   arceb     |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/02ce10be87ec96570f0e05a2deed83663bf29c0b |     
    arc      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/65ffa8d02cc1f7670086f753e10a967ac09d8e6f |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/7d1b0f003a92ebc1ef2d44aa6e417d38dc2eebde |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/8eda5ffb99670bbb2bcd1ee33d782e4171734d39 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/f204b722de2d389ce610aa8c6a6376e688c171b8 |     
powerpc64le  |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/8d8369104e539789ce28b571ceba9a00839dd396 | ORPH
  aarch64    |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/d02865333e2e35c32ca924b3b03cafa29694b4d3 | ORPH
  aarch64    |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/86c506d496980e0bd293f80ebc77301c81af3224 | ORPH
   sparc     |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/480030468be1c70d8b5fd333632efe6bace508fd | ORPH
powerpc64le  |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/044a2ddba2ac9b3570df19a121c50345ffc5e9b1 | ORPH
microblazeel |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/6e7b650db8ee5306ee4ff985b7cb783d5359dccb | ORPH
    arm      |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/63e6c30e8eedac32ed5964a7035874a2565f2364 | ORPH
  sparc64    |           vlc-3.0.16           | NOK | http://autobuild.buildroot.net/results/19ea83cec987c6fcb86f36b540e07e0290e44c9c |     
   nios2     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/d00da0cbeff8cb8468344d1401be7ecc6a2578ef |     
  aarch64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/24f5e749eab63683eecd6df8cabaabb72548868b |     
  riscv64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/ad4710acb762d65bd3c7fc03e43d07f76c64718e |     
 microblaze  |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/e2d8742df0f1968039728adcd16c347cae1c0509 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/5354257265e108d061d6738d9623b7df7250918b | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/1290cdd87ba860f63497142f90486d5c470b625c | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/3598d054519ce794c05ca8c7318af903498f49d9 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/226c3ecf28413fd187a5b076a881ec27bf10e7fa | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/45499dcfcdaaf5832b98726d67996b181bc3ff6f | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/e1bfef473004cb7ad42fc9fec15da13c19ff342b | ORPH
microblazeel |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/ae129206a20d14d427bed0b5fbf344919d2336b4 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

monkey-f54856ce250c4e257354... | 3 
        host-sentry-cli-1.57.0 | 2 
  binutils-arc-2020.09-release | 1 
                 mesa3d-20.3.5 | 1 
               trousers-0.3.15 | 1 
                       unknown | 1 
                  xvisor-0.3.0 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/2691b5b5bd1debea985890e130a85f5aec62933b |     
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/68603ee7cef2ce4cf9c44e549ce46ba8e144e26d |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/cf6a258608ca4d43bc61e775af7450f60eae6ac3 |     
    mips     |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/99802e54540dff932ce893b6eb8c2207fe32d490 |     
  powerpc    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/00294fbfb5d408fe1b4ba5f05247cc2b46993d3e |     
   x86_64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/106421ea13612acc3bdc5ac0a99b8e2c7539354d |     
  aarch64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/a34c9b6ec71d1817aca346dc3a1d470db3114aa7 |     
  riscv32    |        trousers-0.3.15         | NOK | http://autobuild.buildroot.net/results/b1626119cd3aea413802380edcec045223b6a17a |     
  riscv32    |            unknown             | TIM | http://autobuild.buildroot.net/results/dce7be02b848c29f6d1ac769fa2abbdf33be01c5 |     
   x86_64    |          xvisor-0.3.0          | NOK | http://autobuild.buildroot.net/results/c0b86dd4deba394ab973ea68bcb3998c8b7ab9dd |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/b0c815b615c45481538e7a5638686b12b5e7dffa |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                 dhcp-4.4.2-P1 | 2 
                       mongodb | 2 
                 wavemon-0.9.4 | 2 
                    bat-0.19.0 | 1 
                  exempi-2.6.1 | 1 
                  nginx-1.20.1 | 1 
qt-webkit-kiosk-a7720e50f2b... | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/451ed4ab22be21be767223dc2c0abb57228751ac |     
   x86_64    |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/028cb42cfba28e7979d2b685fc6b57df7cb1d055 | ORPH
   mipsel    |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/4d51589f57fc59969ad0c694b889f8ac2de3b82e | ORPH
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/822fa3536fc152a2c4b60d826af5503a0e97714a |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/b6258178abc00a9f7fdfd85d41267a670bf22854 |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/7151095b1102ec75bd0100afcd25716ed3441384 |     
  riscv32    |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/58d7c80a20e8d7318a7347b95124610740fbed8d |     
  aarch64    | qt-webkit-kiosk-a7720e50f2b... | NOK | http://autobuild.buildroot.net/results/5850566469bd1e99c01fd984dc0742650fd9e7f8 |     
    arc      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/e5ffa0a39f654a98dda55fedb77ca4b82e4eadbb |     
    arc      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/1ea9c2e43dd3a73ce11cdef3665d4693f2377d73 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
