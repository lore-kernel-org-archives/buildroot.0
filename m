Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB846C47077
	for <buildroot@archiver.kernel.org>; Thu, 18 Jan 2024 06:46:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3979C83EA9;
	Thu, 18 Jan 2024 06:46:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3979C83EA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VZ98rwu6Jqmh; Thu, 18 Jan 2024 06:46:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C8D583EC6;
	Thu, 18 Jan 2024 06:46:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C8D583EC6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0AE2E1BF3A8
 for <buildroot@lists.busybox.net>; Thu, 18 Jan 2024 06:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C372241DEE
 for <buildroot@lists.busybox.net>; Thu, 18 Jan 2024 06:46:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C372241DEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XxQGv56hkFT1 for <buildroot@lists.busybox.net>;
 Thu, 18 Jan 2024 06:46:26 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A666741D87
 for <buildroot@buildroot.org>; Thu, 18 Jan 2024 06:46:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A666741D87
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9CAA21C0008
 for <buildroot@buildroot.org>; Thu, 18 Jan 2024 06:46:22 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 18 Jan 2024 06:46:22 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20240118064627.C372241DEE@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1705560382; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cUIDuO7CCeDhQy87tsigSPV4e++MPXdJPwSYUON11P4=;
 b=UmUKgcIzxxCPYTKzbk998yiHMDuVUmVDdpC7BrzHegJ5vZwjYCmmqt/K58qZ2IiCtOTACX
 vlR+r5F7gPXKALueonkEhhRvA2OcdsaWXlE/4VlxMzrGM8a82Iff/WHqIL1ysIsL9eOlFd
 IKtWT+88WQKejlo/Il02yqVijLzeyJmuixK/7ZMxQobJF37Yry3zJ6PBqLhYlLUFJZnl2C
 EuBKH4A3ZbRfqQTOy/magBer9roO41jRIqnyWiJxNNHw2yUPGGDfGMVcGZhxzbEC87WvcC
 R7YkFMQTe9gvLc7oiaqTRoCeL0pEhNpxWwKlbpq/qDs/KyGToPg4s0nmulLe7w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UmUKgcIz
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-01-17
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

Autobuild statistics for 2024-01-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  4  |  1  |  0  |  5  |
  2023.11.x  |  2  |  4  |  0  |  6  |
    master   | 29  | 55  |  2  | 86  |

Classification of failures by reason for master
-----------------------------------------------

                libressl-3.8.2 | 5 
                 openssh-9.6p1 | 5 
                  stunnel-5.71 | 5 
                elfutils-0.189 | 4 
  gobject-introspection-1.76.1 | 3 
              libopenssl-3.2.0 | 3 
                  linux-6.6.11 | 3 
           python-numpy-1.25.0 | 3 
         gobject-introspection | 2 
                 sudo-1.9.15p5 | 2 
                       unknown | 2 
                  acpid-2.0.34 | 1 
             dahdi-linux-3.3.0 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
glibc-2.38-27-g750a45a78390... | 1 
         host-gcc-final-11.4.0 | 1 
         host-gcc-final-12.3.0 | 1 
              host-rust-1.74.1 | 1 
        host-sentry-cli-2.20.3 | 1 
               json-glib-1.8.0 | 1 
              libarchive-3.7.2 | 1 
              libtracefs-1.8.0 | 1 
          linux-5.10.162-cip24 | 1 
                nushell-0.85.0 | 1 
          python-grpcio-1.60.0 | 1 
   python-pydantic-core-2.14.5 | 1 
                python3-3.11.6 | 1 
                  rygel-0.40.2 | 1 
             sofia-sip-1.13.17 | 1 
               valgrind-3.22.0 | 1 
                 wolfssl-5.6.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/757f71cfc4ad0ece887d814222ce43ed162021f1 | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | http://autobuild.buildroot.net/results/640ca15c619caf19219940d013a071ba54fe43af |     
    mips     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/3e6c3c1b2af229ea734d3efe66042fffa6e200a7 | ORPH
    mips     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/cb5a5433740bb837901305c1b108b480e23cce5f | ORPH
   nios2     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/6e6284b146e258f7aceb236d982bd6e41e85340c | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/e290a130af336fcdf08b1123cbe232f6593f8697 | ORPH
   x86_64    | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/245beb1e25b5ae1dbcb0332e29c98642e90952b6 |     
    arc      | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/35d22c48b6cdc562f195e99e11fbdc72fb00fdb2 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/265c2db4cff388208b36f05d59e5af5051884193 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/c7786cacf16baf98dee06ac9ffbd5cd834017557 |     
   x86_64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/e1f0f4ca0e2154cc57bedd02f94fb9bf13b6756d | ORPH
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/8750c35ee1ff5fef1435c50488a9fe7150f50193 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/dae8ee433d74ff2218340abf2206044640216559 | ORPH
   mipsel    |     host-gcc-final-11.4.0      | NOK | http://autobuild.buildroot.net/results/9b9612cfa7320e548157cd00c2740bf33a0c6cfe |     
 microblaze  |     host-gcc-final-12.3.0      | NOK | http://autobuild.buildroot.net/results/ea2252917ca7c7144025e42c8539dcebe4ad607d |     
  sparc64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/415c88a2a9e5b1eaa037a55442c711080c59d486 |     
  aarch64    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/89121e1eeedd9559966c0691e59f3ae8dca8d237 |     
   arceb     |        json-glib-1.8.0         | NOK | http://autobuild.buildroot.net/results/552d9210bee98a0d039bac8e18d2a5e344d1f297 | ORPH
   mipsel    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/5765406e61d0dc3ffe8e965e50841854e17680f4 |     
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/0780a3691d1e4c677fc7a234f3b0b1f847b30b51 | ORPH
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/cfd17ed4e06c42ade5ba2e57fd0f7b87061be62e | ORPH
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/c84efdd8e92e9a7328540b56c5c27821915d2187 | ORPH
   arceb     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/f9faa3417c1fb948d2f572b84881418b4fc7a7d2 | ORPH
   mips64    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/a8239488814e6eb30ee8abf1fe679fc94eb30ad8 | ORPH
   mips64    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/ee95f92ec210e69df1259e267fd04fcb098b2c13 | ORPH
    mips     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/e3a8fd8ea426e1ead187e65a534747e32cdbf261 | ORPH
powerpc64le  |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/759908d58fc57eaa7a4db6c788381e97ffc7d024 | ORPH
 microblaze  |        libtracefs-1.8.0        | NOK | http://autobuild.buildroot.net/results/5cdcf8149a73c23b3def62f0e98d4bf23674d31b |     
  mips64el   |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/5abec3102611432a0b1f17af9063da1e0443e5e0 | ORPH
    arc      |          linux-6.6.11          | NOK | http://autobuild.buildroot.net/results/a3683fbc508d759dbc9015c698b521d1d1b0f935 | ORPH
    arm      |          linux-6.6.11          | NOK | http://autobuild.buildroot.net/results/85af4c3cf832c29160050f82ae95b66b4a03d6e0 | ORPH
    arc      |          linux-6.6.11          | NOK | http://autobuild.buildroot.net/results/511d2bcd0093240f50002e77fbac445deb3bfd21 | ORPH
   mips64    |         nushell-0.85.0         | NOK | http://autobuild.buildroot.net/results/04ba5bf5a14580f27fafe549f7a41e8bf3c182b4 |     
 powerpc64   |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/8b9b64b9a1619412491ca301453ca88e672c6f2e | ORPH
 powerpc64   |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/ec780aed5b1c4fdf9b91f6e7be99e8d4c42efa58 | ORPH
  mips64el   |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/278e061b9b3ffcd70d8db8529858e018a9634311 | ORPH
    mips     |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/b06c1c8c10dbe262ba4edc542ae92fae4248590b | ORPH
    mips     |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/32e3ccb339f8321dd7918a18326ac962507739e5 | ORPH
  aarch64    |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/ba92613cd2b92389ace45ff341822e4aad613b40 |     
  powerpc    |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/d5e2fdaa8ab5e70b273f1692cc57c1308efdf1ef |     
    sh4a     |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/ea9c82feec5fe57215316dad4e26e57d7384f53d |     
   armeb     |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/bcc77a2abc888b0c1a9f0649e4d7a1bcdab63904 |     
   armeb     |  python-pydantic-core-2.14.5   | NOK | http://autobuild.buildroot.net/results/0926ef35ebacbd6cc30e2b57bbd57c4284d59cbb |     
   x86_64    |         python3-3.11.6         | NOK | http://autobuild.buildroot.net/results/e3e99040576a870d3bd3a5a7a3db5cc961acb3df |     
    i686     |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/f4bd3f99a36d9becef99d27bb22de777a9de1bb8 |     
 microblaze  |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/62675321e01baec4d56a4aef284b3c93df02f2ef |     
   nios2     |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/8933d155bf6c9c921f774f870fe68059a7071e96 |     
   x86_64    |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/0c6c69f78c8025f91cff3b8062ade290fc711faa |     
   armeb     |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/d25ef60c7898de8681ff19e0f8877327084e3210 |     
   x86_64    |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/b44b320e6302db23f20b9d62ed5fa38f5026af84 |     
   nios2     |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/b4d0a9571769333fd08133b7129af82473217f3d |     
    arm      |         sudo-1.9.15p5          | NOK | http://autobuild.buildroot.net/results/9cd43eaa7f9801c7aa0531ed0e5bde01ae3bc34f | ORPH
   nios2     |         sudo-1.9.15p5          | NOK | http://autobuild.buildroot.net/results/4d9ca243daebcb886d48907e6aa2b5660fc94a63 | ORPH
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/c237a586561677956405792b2cee1a5a2fe1fe9a |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/2245f8a8fb6be30b024f12c124c2e67c80e13dbe |     
   mips64    |        valgrind-3.22.0         | NOK | http://autobuild.buildroot.net/results/f163b76ec33e537644ae2a06cd7f5637b00ded79 | ORPH
   mips64    |         wolfssl-5.6.6          | NOK | http://autobuild.buildroot.net/results/cedcb3f2004bdc993c62e9f69c54cf4bae3b9cfe |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

            micropython-1.22.0 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |       micropython-1.22.0       | NOK | http://autobuild.buildroot.net/results/55df4a1d9ae9a388f0b9705617acbd2e10001122 |     


Classification of failures by reason for 2023.11.x
--------------------------------------------------

                       unknown | 2 
                libressl-3.8.2 | 1 
       libzenoh-pico-0.10.1-rc | 1 


Detail of failures for 2023.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4a     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/e08eda9b7e62c761b2bf54cd0553413b2cee6f7a | ORPH
    or1k     |    libzenoh-pico-0.10.1-rc     | NOK | http://autobuild.buildroot.net/results/d253dfc19eeddb8c39439ac678d65f0acd186307 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/a6afe34c97b6cdee6322ee0e6190f946b3965bb8 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/1e32356110f01836f52fe8c0414c9c5db0261297 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
