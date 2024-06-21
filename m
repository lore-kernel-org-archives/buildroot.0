Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEE8C27C4F
	for <buildroot@archiver.kernel.org>; Fri, 21 Jun 2024 04:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FED261655;
	Fri, 21 Jun 2024 04:56:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cBw4G-SVRHrs; Fri, 21 Jun 2024 04:56:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1315161651
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1315161651;
	Fri, 21 Jun 2024 04:56:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 15B6E1BF5DF
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 04:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D735405D7
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 04:56:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EnjwysvK8wjl for <buildroot@lists.busybox.net>;
 Fri, 21 Jun 2024 04:56:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 60CF440245
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60CF440245
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 60CF440245
 for <buildroot@buildroot.org>; Fri, 21 Jun 2024 04:56:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4DB9B4000F
 for <buildroot@buildroot.org>; Fri, 21 Jun 2024 04:56:12 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 21 Jun 2024 04:56:12 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1718945772; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lL0aKk2A+SJRx7kBpXbLVd9up6gjHF0uIIC/A2jqWuc=;
 b=Ng6o+UvFuIw+le3CPss/OsXBrwpM734XGyoUQqkfxdTBsY95s1E0rA9PcpYLzL8BZDbaz/
 RZ4TUNBpNqdrs4CNtwormEhbt/4UFFzdblljZfjNt4MhSegJr9lmyTRA/w+h+J/LM+32Hr
 qUC+NgjD09LrHVsId9LANvX0ZlU96LzYogvyUbflh7b62qGJF11pk4x3kCqusOOAwoDQ7H
 Vg+pF1OcMyO9fOQYMC0XlR7cY/Og53m9Tmb2je6LhLxrgHDl21Vb2aTeqhPQhvOrBgBuoW
 WpvwuxEousQnHl2zzSY+iFoqy58boi+5kHg2ySl3vNLPGl9hSBA63f0xUjW20w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ng6o+UvF
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-06-20
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
Message-ID: <20240621045612.BVafUhyIZSU-71Qnsj__fuSutkkSactJV_UZinoN4uc@z>

Hello,

Autobuild statistics for 2024-06-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  | 18  |  9  |  0  | 27  |
  2024.05.x  |  3  |  7  |  0  | 10  |
    master   | 77  | 191 |  0  | 268 |

Classification of failures by reason for master
-----------------------------------------------

                    zstd-1.5.6 | 36
host-prelink-cross-a853a5d7... | 27
            host-cdrkit-1.1.11 | 16
                    mpir-3.0.0 | 7 
                elfutils-0.189 | 6 
glibc-2.39-74-g198632a05f6c... | 5 
host-android-tools-4.2.2+gi... | 5 
host-vboot-utils-bbdd62f9b0... | 5 
                libressl-3.8.4 | 5 
                fail2ban-1.0.2 | 4 
                host-odb-2.4.0 | 4 
      host-riscv-isa-sim-1.1.0 | 4 
                  bcusdk-0.0.5 | 3 
ibm-sw-tpm2-5452af422edeff7... | 3 
                  libffi-3.4.6 | 3 
                  acpid-2.0.34 | 2 
                 coreutils-9.3 | 2 
                   host-go-src | 2 
 host-softether-4.30-9700-beta | 2 
          libcamera-apps-1.2.1 | 2 
                  libsepol-3.6 | 2 
          linux-5.10.162-cip24 | 2 
                  ntpsec-1.2.3 | 2 
                       unknown | 2 
                     apr-1.7.2 | 1 
               arp-scan-1.10.0 | 1 
             berkeleydb-5.3.28 | 1 
  binutils-arc-2023.09-release | 1 
                   bird-2.0.12 | 1 
                  boost-1.83.0 | 1 
check-11970a7e112dfe243a2e6... | 1 
                 dc3dd-7.2.641 | 1 
                 dhcp-4.4.3-P1 | 1 
                    efl-1.26.3 | 1 
                  fbdump-0.4.2 | 1 
google-breakpad-f49c2f1a202... | 1 
                    gpm-1.20.7 | 1 
         host-libxcrypt-4.4.36 | 1 
                    htop-3.3.0 | 1 
                jemalloc-5.3.0 | 1 
                 libcddb-1.3.2 | 1 
               libglib2-2.76.1 | 1 
              libopenssl-3.3.1 | 1 
                 libp11-0.4.12 | 1 
                    links-2.29 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                   linux-6.9.4 | 1 
               linux-pam-1.6.1 | 1 
               mariadb-10.11.6 | 1 
                     mtd-2.2.0 | 1 
                  ntp-4.2.8p18 | 1 
                  octave-9.2.0 | 1 
procrank_linux-21c30ab4514a... | 1 
          python-grpcio-1.60.0 | 1 
           python-numpy-1.25.0 | 1 
                python3-3.11.8 | 1 
rtl8189es-eb51e021b0e1b6f94... | 1 
rtl8822cs-fda6cd263e8956727... | 1 
                    rtty-8.1.0 | 1 
                s6-dns-2.3.7.1 | 1 
                 uclibc-1.0.48 | 1 
             util-linux-2.39.3 | 1 
                 wolfssl-5.7.0 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/1305a831e5a1bc62fb123042a68808219e3ae8ea | ORPH
  mips64el   |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/56b39b52cf9109621f24c4a3d947809116fbbf86 | ORPH
   x86_64    |           apr-1.7.2            | NOK | http://autobuild.buildroot.net/results/ab5a639730dda697ab7c7646dcb1828167ed8d8b |     
 microblaze  |        arp-scan-1.10.0         | NOK | http://autobuild.buildroot.net/results/4cf11acc55dbc802268a594f9de2df913fb5ba85 |     
 powerpc64   |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/00cf11586efc265a24e547a928067b11480fa6cd |     
   s390x     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/38f23fd8d17dc73b88253fb152ec1859f0fda160 |     
   s390x     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/f4460e49c1dfa10af45ea9ce1683ff2231d45a51 |     
   sh4aeb    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/58fce045cfd17cc8320fc03ae9959157a8f8263a | ORPH
    arc      |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.net/results/cfd1e8ea661b28dbd26925ee8146900040039a9c |     
  aarch64    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/3d80d6afdde43a05d6fea13a1729b40b0fecab0a |     
  mips64el   |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/e1b6616e82fa600c29936ca382a56dde42745cbc |     
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/bf73f7c4909bec36356ae97d11c1ab59a98f5d75 | ORPH
    arc      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/1c260d902c8458782fe15f51d452786cf8ef9569 | ORPH
    m68k     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/77d216083c0674e05d9dbd0f7d31d18b4199c4bf | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/af3695d495045412dfbedb52870d51b99973bdc8 | ORPH
   xtensa    |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.net/results/e154cbb99242a98fb4ea3a078d6fa92275519b33 | ORPH
 aarch64_be  |           efl-1.26.3           | NOK | http://autobuild.buildroot.net/results/755992c78b74602ef32e52f288ce5d45db3eb8d7 |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/7e8b4af94a2011e0a7c5075c220628603a0f17bc | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/4b8b2dbb9bd2f800ab4b458e5a2e1b79716f86b2 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/f7e4b76c4550fcc4460a9d3ff2eb7c13c4ea836b | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/5b98e2e39cfbdd8c05b56b72bb4a2342e4c8e180 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/c8490076a89af4f8230a89dd9a7d6c0e99fc26be | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/3f5d64f42b9f5fe1ec28c79ae3cb4a3c3c0c2abe | ORPH
    or1k     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/f336f19907eed4800360cc296ae46ecfb71b0a2c |     
   nios2     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/4d479766aeb3caec470ebdc353096e2b55a60b2b |     
  aarch64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/d2b4e14856479bc8b7f8e53b54b64c7555afab4f |     
    mips     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/2e63b8105414f6653ac25d3f1f51ef3776f37553 |     
powerpc64le  |          fbdump-0.4.2          | NOK | http://autobuild.buildroot.net/results/cccb54e88a492f04184b6fbd67cb6a18531c8f95 | ORPH
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/72f4b566176307330b4c99e36a638d123fdc97fb |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/662a2647b6da6bfab037d80c70e2ebae87f567b7 |     
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/c4a30206c7a988a754a3e8532852bc7d20cd0945 |     
    arc      | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/0a174541c69dd56d82f1a4ca2f52afd2db9e7ecf |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/301308215bd16f4ae6e48acb53e6e74474064151 |     
   mipsel    | google-breakpad-f49c2f1a202... | NOK | http://autobuild.buildroot.net/results/870170a0f34716ec06badb99da1bdf86735205b6 |     
   s390x     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/0f64ecd801efb0372834723bdaf2a3b57aa39ac7 |     
   xtensa    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/e63f87b34a9dc81a8552ec5f28429f5c9e6b5234 |     
  sparc64    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/e6b8988989ebf9bce3198612157c8640429268b1 |     
microblazeel | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/d0cb41d66d3be825137336c05f9beee43218735b |     
    m68k     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/c0e3975cc70183944ae7b35611c4c3db3ae52c21 |     
   s390x     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/09809b5bbe0b598ae1c10acd96b3b4ddda6cf1ba |     
  aarch64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/2f013ac325b31581308692556f7a11909d78c56e |     
    i486     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/74e8ee1420ba445ca00ca43d746518c9ba2f541b |     
    i686     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/011234893043029e9e24e959a7a3cdd889192d91 |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ca5d95e98b2b72b1717b3ebb5c097aa212d8da52 |     
   xtensa    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/45496617bbcef47340ca421861fdc1666fcfc7e4 |     
   sparc     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a73fcb924187ee607996a7c98690a9e23ed63d11 |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/02377f112cd464d9365965802d1f534c117eab34 |     
  riscv64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ac8e4e9309e36b05b0f748a0a9ef8506cf275295 |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/254725c5f9b6098e14598a97a95e9865fd0d816d |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/6c70e837b3a61ef6dc4e0d9e34c08312a7a807eb |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/8dfffc15bd43ba28c8d4451599168e1c9339920e |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3bb06c7765cc40f38649318c01435ff3795515fd |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/6a81a7c476de0c36c0be7a6a4c601c2f9dbba8c1 |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f899bd56ef56e1e3ee0e4ec920717db795b37b5d |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/746728645e9da192b1d99c74867013df4e08726a |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/06f6d0802d1f66a3b56195b9b9f3e9634c2f7eb1 |     
  aarch64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/aa0f97b86081797824588c0f5b4931e39802a547 |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/578e445494fa5e01860fa914e8aac0b83cd801e7 |     
powerpc64le  |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/1ab2a09be7dbb12edcc2aafc8182f8177bb19fd5 |     
  riscv64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/412434e82c38a97556102514b172adcb2d06fe53 | ORPH
   mipsel    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/481ebb48b25ab02e228de25343c5e5044a70929f | ORPH
    mips     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/2a8d3c5186669d9718543291d950d7f1db72be00 | ORPH
    arc      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/186792f94c24dcfe7aca2233d5df521d6eabe12a | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f56d25b811bf4e46ceb1f7a1abd8e2627b6f5850 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c15c2f26ecf14a588d582a5f50626f92f652388c | ORPH
    sh4      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b14a560fe28021e04e96ac29694539e1dca011c3 | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/675ae157f7bb7bb813fe32508e1b820ddf236db5 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/fc00128409eda33d8ab87602627cb946c10d5546 | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f19ed2d702c8561eda640b17a9ba38d69ed066e9 | ORPH
    i486     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c915773b4de2101f8e332a9954fe5d1db8e5e526 | ORPH
 aarch64_be  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/18a51394e8f15f92e96b74e445f41cc650da18f4 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f1ff5b031006bf64f6d8de3f45260a20a7b0e33d | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ab6c63ac19e1ee4c8b5fa9b82a6a8482051b4b2b | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0f8d119fac1a23d5bdc73ef3641a40a802f278f3 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/95d27b607d7016f60b56dfc5c3d7f34365d406a9 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/12a30828926c010222248450ffb30dc343718e11 | ORPH
    m68k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/cba630566f6d5bc3d5b5e219c787b1755fc03aae | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/953bedd0f1904bb22fb327ea1116d4d7c3cb7da2 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3197eb14409cfaf5bc3e4a5648dcf1ab7c291608 | ORPH
    m68k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0d636d7b64749272597e13f7b74552bb4bb5964a | ORPH
   mips64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f6bca3821076863cfaf65e3f8fa78b199765e2d4 | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/fa69221108428cb9bba0ab556fab3c3f80e350e8 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/85c886d94223611537339d25c80b1149a597f5df | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c6c855035e024e55733c8b088d5bc5bc0f473fab | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ceaae01bf2d0bbff3a4908afd604f94292b9901a | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/570d5bfe132687f566d429e2127a677e8d991898 | ORPH
   armeb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/2d3f51ed36300fe44bd33b64940a080a43592c92 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/985cf94c10292dbc076047babbf26bd93430f751 | ORPH
   mips64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d5d2cffe41c1dfcdc9344f4c5033c7a15e591a39 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a811a1a62f9399f1814cbbe7f0ff942aaae63d56 | ORPH
    or1k     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/04c5cb3b2ca68a38870c910e012733ab261571fc |     
  powerpc    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/174c1988c3fa4b3e84019bcf8a4217238fecede1 |     
    sh4a     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/dfaaba2c379fe9172adde4ec5b3ccc6c70db0355 |     
   mipsel    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/c1173e928cfd253fbc1f2d4ba0d60da998b4008c |     
   nios2     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/c36ef4d1cc432cc7d6f9ae38cb0fe11a76312821 | ORPH
    i586     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/07164fc18ca88f6c34928b86e35b67af2372d61a | ORPH
  powerpc    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/84b11ddd936a505b1ead4207f3aea41d37e5a8f8 |     
  powerpc    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/3e6207187e62905825a8f08306059ffe16b1d55b |     
 powerpc64   | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/a2227a3f2c6f89f25997da6a3e3ca1082880d354 |     
   mips64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/ee692414f7fb54419ed13d0d17c3604da38ed760 |     
    or1k     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/a6bc8eb6495530855b737dec8cba9ee1cfb57c5e |     
   mips64    |           htop-3.3.0           | NOK | http://autobuild.buildroot.net/results/b7aa1ff2213f7d1e35a9cae8844c4f82f7f61be5 | ORPH
    arc      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/753a79d1f989717e27f9f31c354926f38a5f7350 |     
    arc      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/445cb9bb3caabc73b8a7387dd1abd81ea7c082cb |     
 aarch64_be  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/41e45ac5f459dc7d08b8b9ca70adde89b1b9c5cf |     
  riscv64    |         jemalloc-5.3.0         | NOK | http://autobuild.buildroot.net/results/3ce1d25d56d41dba7c59b4577325133633e3a376 |     
    arc      |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/9ee1e7c98c1f060867e12c8264171ebda76353c4 |     
   x86_64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/d16b351095d68a6643828e20df0b7c146c851767 |     
   x86_64    |         libcddb-1.3.2          | NOK | http://autobuild.buildroot.net/results/97a78548d203a5227d139e982df9a9ba9e89cc5f |     
    or1k     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/cff9e2f19944be44dba7cb8e27131ca48230263e |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/7ee4b02871c2de8a9fed52ac34d5e3cf0b6669e4 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/ea538a3462aec5cf08b0731381933a53c539164f |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/bc86105b20fa629aa2850ec8b68b745a08040607 |     
microblazeel |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/041d8f97dd09d95a0c50e46ca63e8522cfec5c79 | ORPH
   s390x     |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/c9d8247c9d13cd375ede90d3a3bc1e89d66cba1e | ORPH
    arm      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/72094571e621b03012b75f9f69937226bda96f60 | ORPH
   sh4eb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/6a63128894b52b6eb804c4baf439d85780f43838 | ORPH
powerpc64le  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/c821d2731a5b8e1d9fe463fd68d00576d103c0cc | ORPH
    m68k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/1d2c7b16472261155f882c43ed7c57ccf4d48050 | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/52f511c9598d0d58382413bf4e1109cde566b7ae | ORPH
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/20462e9a3bbfbc807e8de554a918da2cb7ae9a0c |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/c0f3b1ace9ada8a22a65e055dad56c09fd55df82 |     
   mipsel    |           links-2.29           | NOK | http://autobuild.buildroot.net/results/5226953796ca1b35459d9c9180dbf2b381309c02 | ORPH
    i686     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/6618e556cc5653ad4b4bf7b17e4a1cb5699a7a1b | ORPH
    mips     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/4207304c911a0e7acefc28bab034d8f47d0de2d0 | ORPH
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/6748a00fe494ef7c5d26affd0ee401ce289df8fa | ORPH
   sparc     |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/5a4062a2e33b4345d7d3ea51c702da705917339d | ORPH
    m68k     |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.net/results/81916539a0794fe5f60bee9be7542a8656149709 | ORPH
 microblaze  |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/aa43ae526f82049601ddbbbdbb4ad142791ea233 | ORPH
  sparc64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/b89b9fb2a06ee4b67606caf2032d6d85a1ad844b |     
powerpc64le  |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/fa63a9e5f3a4d2038730b90f831a15f7108dbe26 |     
   x86_64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/72fdd16f55a6b8a86f94535e5ebe74526802c712 |     
   mips64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/f1bb88f868239a46e9acc94ea7f2b77cf4a7c860 |     
   mipsel    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/fac9b396fd24b270f0cf8a7ed307d227f584a104 |     
    arc      |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/319298b1af994ebdcb0c864e0ca8e2cf7c17c6e9 |     
  mips64el   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/3aeafb3502262a3c8fd7b4ad08fe73906203e436 |     
  riscv64    |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/38723276673103020ffc0d719e96dbd431487a5a |     
   xtensa    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/4e741774b1c62214617b8924160fba2f3bb36724 |     
   xtensa    |          ntpsec-1.2.3          | NOK | http://autobuild.buildroot.net/results/cdee30e6b12f3c67e9a2cfeda0eb323c41fc8960 | ORPH
microblazeel |          ntpsec-1.2.3          | NOK | http://autobuild.buildroot.net/results/9f92c19250b429fd3c5266e8c9dfa954ffe0522d | ORPH
powerpc64le  |          octave-9.2.0          | NOK | http://autobuild.buildroot.net/results/474308c635374f648cc8c87a7735c1d3f809f4ee |     
    arm      | procrank_linux-21c30ab4514a... | NOK | http://autobuild.buildroot.net/results/64754c7fb0070873967bc5d152b2d7fb7ea96755 | ORPH
    i686     |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/433e751c5cc0145b7ec1a3a58e31d0696056fbc0 |     
  aarch64    |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/ee06db9f90ad5c33eed892629c4ba624de54063d |     
   x86_64    |         python3-3.11.8         | NOK | http://autobuild.buildroot.net/results/40a521304ab208137b5268b79449633e76d2df8b |     
  riscv64    | rtl8189es-eb51e021b0e1b6f94... | NOK | http://autobuild.buildroot.net/results/2a28f788c98f4f9a6f28b5f466d94e50b2b4dc10 |     
 powerpc64   | rtl8822cs-fda6cd263e8956727... | NOK | http://autobuild.buildroot.net/results/91a655ed448980da3036ff1ffc370d1d2aa02a03 |     
    i686     |           rtty-8.1.0           | NOK | http://autobuild.buildroot.net/results/79de0789b545f038742afce4ee3a1ec59c908cfd |     
    arm      |         s6-dns-2.3.7.1         | NOK | http://autobuild.buildroot.net/results/41197223c9fb5ac1c79c51818711c6cd0b9bc6e9 |     
    i686     |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/6d6b609a574410586eb416f6d8704ac84fd234d7 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/6b5197e1b359fa0f1581fba6d91f48be9f5f0e96 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/0442bd9b82c790ec1f85c14f865c49a8be20087c |     
    arc      |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/ae8bcd37f402a6ed52712976a827865423dd5b72 | ORPH
   mips64    |         wolfssl-5.7.0          | NOK | http://autobuild.buildroot.net/results/5f90c81e744fbd9412e71dc82b119ae372a994ed |     
    arm      |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/f7394f5d8a82635a21608909466ede2a17af9a09 |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/4c7559c2ca184b96d8bc22924ba43ca8adc37642 |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/d5d44e5678d127304f555e5ceec73c75680f954e |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/82e5aeb35dd8e4dc293e31fdd0db5df5a869ba6b |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/14cfe5370a5ea8a951e749f091574006bf180ebd |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/6514c9e8dd4913f068a830f68bc1379068c52720 |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/d1ada316a6b1c4acc27370048950711d0f394f6e |     
 microblaze  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/9bf293b45463c4152093626da8a11a4cb666ab61 |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/dd6dd367cb3af0fef3a4ee9745267d0d6530ca73 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/39b55a4e0b98a0d14435a5b9950105657775dd42 |     
   armeb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/17ccc4756807bce8712c594ab3c1e10f67dbc25f |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/ea080dd0005e22fb121dab9e69b4d1d0f98f6842 |     
    i686     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/741162592388babf6c4026698cdb7efa4870a9c0 |     
  riscv64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/f3016b8749bd2b28880e9211ef42ecafd3c821f4 |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/9725977f55dd5fead79bcc483460b7a0f52dc1e0 |     
   s390x     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/14e35d98748649cfb844c525a5a21e0bb9f23fd8 |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/c865f9cd303480c661026389d6fb74c87a77aba5 |     
   armeb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/e69b7ca0e449f76ff2da3ec868536100f4bc74db |     
   sparc     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/9cc22eb506fbf179de1fa27e1378e3d4c75de600 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/3c9a97dd5265047116f2b18bb11b6d2392a55e74 |     
  mips64el   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/24970316102b4134caa17250cdf8f23055c04d47 |     
  mips64el   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/a4bb558e5471cf415a7d3efa7d70ea5e5849f2fe |     
    or1k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/0f28167d734ddd92f3341609ccc8733460fb0793 |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/57e734f6c7f12c6038777e6b2dd34a5a9bf64aad |     
   arceb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/f01a44b0bfec96389b155779b741dec5c653bbd3 |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/8b0747ad506e3236d0c92fe53fc55d35ac91f130 |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/9047bfd3ee953c6c9f5fc6118197d4684e0f6655 |     
    m68k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/fc3a7b4b284432a2d507da73937729ba857ba122 |     
   sparc     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/d4e6538f05a3d1392f0ffd81b67b965de5ff38df |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/35635f92b709b26ec67480248d4e69ffea6b34c7 |     
    i686     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/6acf73b072433339b94cd81181455fd66993a9d5 |     
 powerpc64   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/49e4d06e0622b6ad4ea4656ab11b49b70e063aa4 |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/4002f22a137dd2e1e193fd2e3245b0db1bc05344 |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/a9cc5a1a0a52ec6f446571ca1f195e5f8982c37c |     
 aarch64_be  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/efdf3693e79dd6392788a5c9e163f9a386f4b49f |     
  mips64el   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/238e1697a4335113d4ce11a9c5c0e73b09860d4c |     
  powerpc    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/4be5ba74362ca8d060587a4533c89798f7c3fce2 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                gnu-efi-3.0.17 | 1 
          libcamera-apps-1.2.1 | 1 
                 libv4l-1.24.1 | 1 
                  linux-6.6.32 | 1 
                  ntpsec-1.2.3 | 1 
                 openal-1.22.0 | 1 
                    proj-9.3.0 | 1 
          python-grpcio-1.60.0 | 1 
                       unknown | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         gnu-efi-3.0.17         | NOK | http://autobuild.buildroot.net/results/d9796c134a159a53f9de7302553b03b7fc619235 |     
   sparc     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/ddb08402fc0677a519e2c14138d79fa6476a5ada |     
microblazeel |         libv4l-1.24.1          | NOK | http://autobuild.buildroot.net/results/6761b18967ff4ab4daea35356bf231a7859a3b81 |     
    mips     |          linux-6.6.32          | NOK | http://autobuild.buildroot.net/results/b29759eed2ac7825bd1da1c6d06383588d85663f | ORPH
   xtensa    |          ntpsec-1.2.3          | NOK | http://autobuild.buildroot.net/results/091a44736702fb150d69739d0ac6d327b29970e0 | ORPH
  mips64el   |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/27842af8494f77d290f4dff2e0fb114fa1ee2d20 | ORPH
  sparc64    |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/2958bd780f8b0a394c72ba2bdadbff3db3c22203 |     
   x86_64    |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/dacad0c2062fc82c10f56b37df1f62885e4cffb8 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/c5de9ece301572ee638b6b65806af18402ac87f9 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

check-11970a7e112dfe243a2e6... | 1 
glibc-2.39-5-ge0910f1d3278f... | 1 
ibm-sw-tpm2-5452af422edeff7... | 1 
                  linux-6.8.12 | 1 
                 openal-1.22.0 | 1 
                       unknown | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/48eb1ff88462d6584af9b905cdd28b076b09ce31 | ORPH
 powerpc64   | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/0e86cb2959f91a59658273d28eaaa982b600bf1a |     
   xtensa    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/60c262fa3972a6f5130d2085ef4a508050aa2d43 |     
    i586     |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/a593dfcdee2102bcf855dcc154069ce4b455ee41 | ORPH
    mips     |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/efd40d409330f5ff45541b71cefdc10fcca6146c | ORPH
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/224bd6a31bc2af23c0cb8c67a53a7cb7527bd979 |     
    arc      |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/042361d83f6575bd1583903ce8ba638bbbdd8f8a |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
