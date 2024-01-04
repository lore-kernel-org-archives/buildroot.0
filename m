Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A37AC47073
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 07:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0F2460BB4;
	Thu,  4 Jan 2024 07:02:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0F2460BB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PjFsVzf22RXj; Thu,  4 Jan 2024 07:02:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1699960B42;
	Thu,  4 Jan 2024 07:02:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1699960B42
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EC43D1BF3DF
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 07:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9A294008A
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 07:02:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9A294008A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O-NELW_jhhKo for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 07:02:55 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3295F4006C
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 07:02:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3295F4006C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 956BE6000A
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 07:02:52 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 04 Jan 2024 07:02:52 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20240104070256.B9A294008A@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1704351772; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2rEKv1I8vqETc9dwfrYuuE2kwMNq3UbxojmSjLKsKug=;
 b=iS1fd3tI/iEEcELPlKxra+AsLFuP1hiqfgd98uWo8x+Lu2G6R+c04Nt44i6cNdu/mbqlmy
 KGEn3bkwNZzZ/RxikswI7zWxdAW46csZoN1Za2MH4ygfr5sJf4com8D5lculfVnqzep/rI
 9OYW4pNFM9amSoxUfDgUdPHGdtXnjC4NgEYGcTCc7Yq0guV43o73t2IauHE+ZPWtZnV9A7
 uXEXW3ggEMYmEtcdXkfYqQKfBRfj7BB4AnoEVXMMvPQ3IKVRg68H7fmWIlBC9crvHsClvl
 vk3v80rqvYbIwqrPcKHbr4fTdO6guVUeyKUykGIzLn58IQf70LfGIW3XNC4wcA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iS1fd3tI
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-01-03
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

Autobuild statistics for 2024-01-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  3  |  0  |  0  |  3  |
  2023.08.x  |  6  |  2  |  0  |  8  |
    master   | 12  | 22  |  0  | 34  |

Classification of failures by reason for master
-----------------------------------------------

                   linux-6.6.8 | 3 
                       unknown | 3 
                host-go-1.21.5 | 2 
                libressl-3.8.2 | 2 
           dmraid-1.0.0.rc16-3 | 1 
                   duma-2.5.21 | 1 
                     exim-4.97 | 1 
                    fcft-3.1.6 | 1 
              fluent-bit-2.1.7 | 1 
  gobject-introspection-1.76.1 | 1 
              host-rust-1.74.1 | 1 
             ksmbd-tools-3.5.1 | 1 
                libselinux-3.5 | 1 
                    php-8.2.14 | 1 
                    pppd-2.5.0 | 1 
        python-pysensors-0.0.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/ad35a47ee65bf4d7d01b1329a79d95e3bc1cae76 | ORPH
   x86_64    |          duma-2.5.21           | NOK | http://autobuild.buildroot.net/results/0a064fa963eaccfc6d2c31004ece052369c0e0f8 | ORPH
    sh4      |           exim-4.97            | NOK | http://autobuild.buildroot.net/results/e2efb00e26eb20480006a461c7a2991c2211aa09 |     
   arceb     |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/3ae458a1b4b529b98e2ea3b7f9fbeb40e3306f96 |     
    sh4      |        fluent-bit-2.1.7        | NOK | http://autobuild.buildroot.net/results/9dbd7b3a165e8647b1fc2a70f66043940639ef27 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/69cb7d688c0927ffafd91d68273594f90bb83b71 | ORPH
   mips64    |         host-go-1.21.5         | NOK | http://autobuild.buildroot.net/results/91177b6914f78ce1bee5bdb4b65d8207e3ca6143 |     
  mips64el   |         host-go-1.21.5         | NOK | http://autobuild.buildroot.net/results/f215f0aeaaf57d295ea7683df942e54f6c58c237 |     
    i686     |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/4db1af86289242add46ec4fceeead15b5e0ce620 |     
   sparc     |       ksmbd-tools-3.5.1        | NOK | http://autobuild.buildroot.net/results/bffb443a8460db3163561f95eb443749a8e5e3d5 |     
powerpc64le  |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/556ddc76d1f70e1f514df6e98465158dae8a6460 | ORPH
   sparc     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/3c254009e5764368ee65b7d4a45aad5e7bf8f083 | ORPH
   sh4aeb    |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/5424727e734fb0afd0b40cd7490361607276f8d9 |     
  aarch64    |          linux-6.6.8           | NOK | http://autobuild.buildroot.net/results/e7ef380b4032f36ac3ba81d218e8e3a008267e12 | ORPH
   arceb     |          linux-6.6.8           | NOK | http://autobuild.buildroot.net/results/1457ad321ef09551c9c42b24583277440ecde439 | ORPH
   arceb     |          linux-6.6.8           | NOK | http://autobuild.buildroot.net/results/67489192b018332d7802dfb60f11206d6fc8d881 | ORPH
    or1k     |           php-8.2.14           | NOK | http://autobuild.buildroot.net/results/d9dca99d5e1c177c8a91438ac483f3824652dbcf |     
  sparc64    |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/b048708bd703db6b94013457d65fcfc93af2b204 |     
  aarch64    |     python-pysensors-0.0.4     | NOK | http://autobuild.buildroot.net/results/0c63bbdccc9fcdff349c8ee2775c999e65347e32 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/06cd52634f01b4de8364e227e1ded2d898e1d04e |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/a93552fb8b4d7817b1a1d6e55f0e4fb629f27edd |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/77718a477044c0d914a862224a2664c5213ef1b9 |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

glibc-2.37-45-gb4e23c75aea7... | 1 
              host-rust-1.71.1 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  | glibc-2.37-45-gb4e23c75aea7... | NOK | http://autobuild.buildroot.net/results/21950a5c3f5fb2073610fef5b5e75550e3f31f3f |     
    mips     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/57a689511f52931c1579566bb9d86462f3808d7a |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
