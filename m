Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FAEAC4167B
	for <buildroot@archiver.kernel.org>; Sat, 16 Dec 2023 06:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 938D560A99;
	Sat, 16 Dec 2023 06:41:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 938D560A99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IoHk8pwogzQR; Sat, 16 Dec 2023 06:41:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA0B960EC5;
	Sat, 16 Dec 2023 06:41:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA0B960EC5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 051A71BF59D
 for <buildroot@lists.busybox.net>; Sat, 16 Dec 2023 06:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C418983EF7
 for <buildroot@lists.busybox.net>; Sat, 16 Dec 2023 06:41:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C418983EF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nXCIhinclpvK for <buildroot@lists.busybox.net>;
 Sat, 16 Dec 2023 06:41:47 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0978182419
 for <buildroot@buildroot.org>; Sat, 16 Dec 2023 06:41:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0978182419
Received: by mail.gandi.net (Postfix) with ESMTPSA id 37B8160005
 for <buildroot@buildroot.org>; Sat, 16 Dec 2023 06:41:44 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 16 Dec 2023 06:41:44 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231216064148.C418983EF7@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1702708904; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dMeHq0a8lOPHQs6vGJ9mJ/kPD8lmjL7NKVcZ8XBPEh8=;
 b=N2p26bK21MSnvUYxU7heWF9XmFEmUo6GzVfQMfluVukfO4aj6Yo6TFkOhLvwvdXTNT88XI
 S/rQcORWQusxKnneUBFKFgDFKPBDgKT7Mn8U3q2xa6YqHuy0NwoX54YrCbfRLw5JwlZ5qd
 IBDHtiDExZoBnc5F2OE9aAZ5HkzxlGyVqB0yPrZq/1mEjcTSdYDVry9Zid8faB1cx+1GKF
 KbzFCGGSkSdhwxao4PpwN/aprw33I35hSbiIYqsiKPFfmc+Z2AfRVI5lpIa7Ty8KIfcKDw
 zwkp6Q17Bhvt/CX+mLmUmW+HXTXy4A181J3sFLqUIrBbOPHEiNUgXBtH89VVkg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=N2p26bK2
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-12-15
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

Autobuild statistics for 2023-12-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  2  |  3  |  0  |  5  |
  2023.08.x  |  2  |  0  |  0  |  2  |
    master   | 50  | 35  |  0  | 85  |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.76.1 | 4 
                libressl-3.8.2 | 3 
                    php-8.2.13 | 3 
        host-sentry-cli-2.20.3 | 2 
check-11970a7e112dfe243a2e6... | 1 
                 dc3dd-7.2.641 | 1 
glibc-2.38-27-g750a45a78390... | 1 
                 highway-1.0.3 | 1 
                host-go-1.21.5 | 1 
              host-rust-1.71.1 | 1 
              libarchive-3.7.2 | 1 
                 libcurl-8.5.0 | 1 
                libsoup-2.74.3 | 1 
       libzenoh-pico-0.10.0-rc | 1 
          linux-5.10.162-cip24 | 1 
        ltp-testsuite-20230929 | 1 
 Makefile:727: target-finalize | 1 
                memtest86-6.20 | 1 
                  ntp-4.2.8p17 | 1 
                nushell-0.85.0 | 1 
        python-pysensors-0.0.4 | 1 
         python-rpds-py-0.12.0 | 1 
                python3-3.11.6 | 1 
           uboot-tools-2021.07 | 1 
ulog-0389d243352255f6182326... | 1 
                       unknown | 1 
               valgrind-3.22.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/f8d93f397318327273e6fd6377719fdbb5b76c42 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/48da59432045a5f8890df2cc59776d70c447e83d | ORPH
   arceb     | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/5a6d6b7d77cc5bf9b3d42b50e8b532435bda3328 |     
    i686     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/3b6b8e9657d801f65d0c11c7a047a83d4ec74d8f | ORPH
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/61a852655d107462a79693509a46cc426e3d6085 | ORPH
   s390x     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/d4f117ed4270797bfc617ebb55ae5f381bdf2834 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/580647e8dff868dd747d7eeaa645a138a022cd90 | ORPH
  aarch64    |         highway-1.0.3          | NOK | http://autobuild.buildroot.net/results/2a26988ca0417238c3a902757a569807c1ebd215 |     
  mips64el   |         host-go-1.21.5         | NOK | http://autobuild.buildroot.net/results/760456315c26b78e269b0859df77e72a2a58f08f |     
  aarch64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/01ebe680228550ad4d47b48f58ece6e1c4126045 |     
   armeb     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/d305489cac55e82750a3640b9452121b28b5a43e |     
  riscv64    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/04e48ccdfc70fb7cb1ecc060dc5203f118c74cdd |     
   nios2     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/e17153a192fdf7fb6bb65a1aa17e1b7a0e44d044 |     
 aarch64_be  |         libcurl-8.5.0          | NOK | http://autobuild.buildroot.net/results/d1e0b0b51e1b197ec7da5f6c3c3327c8d0427ee4 |     
    arm      |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/a05051305e86119770fa0063d62f39c2f62a7e91 | ORPH
   nios2     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/1cc4a4bedae314f40898eb7f1e44ae74a356f67e | ORPH
    arc      |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/9e768f5cad312268e872836e2c84325bb4de9c20 | ORPH
   sparc     |         libsoup-2.74.3         | NOK | http://autobuild.buildroot.net/results/b5656f99ef6c839e3d7ecf3dd10902c525af3ccc |     
   mips64    |    libzenoh-pico-0.10.0-rc     | NOK | http://autobuild.buildroot.net/results/20b17da2aa886a3de46250f467befed0e8eeb287 |     
    i686     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/89a19f824d8e3fb596df348108b507ddb8e12bd6 | ORPH
    i686     |     ltp-testsuite-20230929     | NOK | http://autobuild.buildroot.net/results/cf6ed6afe0e8e6e214a9d9334f84b3e78f787bc5 |     
    arm      | Makefile:727: target-finalize  | NOK | http://autobuild.buildroot.net/results/4dd1a2a7816c036752e6fea3e91fce7b18b83717 |     
    i586     |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/daa4e95d0e69d8b5b2dc48e4ac5019110e128b59 |     
    sh4      |          ntp-4.2.8p17          | NOK | http://autobuild.buildroot.net/results/175039c8aa4c0084bb569619acc1f095ec1f5d00 |     
    arm      |         nushell-0.85.0         | NOK | http://autobuild.buildroot.net/results/9b8d95d4f86d3703df3b58d22a1051ef009fd288 |     
   sh4eb     |           php-8.2.13           | NOK | http://autobuild.buildroot.net/results/22492f9185e4cd6e8a64c813b42c3f3267878578 |     
   sh4aeb    |           php-8.2.13           | NOK | http://autobuild.buildroot.net/results/ea316729e51e22cee677ec6a88adc1307c6895a1 |     
    sh4      |           php-8.2.13           | NOK | http://autobuild.buildroot.net/results/35c9f356ef217d479ec12edab1b9b123e4a4a032 |     
powerpc64le  |     python-pysensors-0.0.4     | NOK | http://autobuild.buildroot.net/results/44dad57a90f5defaf018bde710c5dd7fae243c8d |     
   mipsel    |     python-rpds-py-0.12.0      | NOK | http://autobuild.buildroot.net/results/717e7e9026ccc55fa0e688fb855b8fa78a759cae |     
   x86_64    |         python3-3.11.6         | NOK | http://autobuild.buildroot.net/results/ee77188dd8d564fda198546346396fe0c3adc03a |     
   xtensa    |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/8562d1578143f01c9fa161f028df52b814444dc2 | ORPH
    sh4a     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/4e4d4c6b318fd8538db70421e3e28aeeecfd9839 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/25397435823e09f28aa02d8cf808ec82fd7920ee |     
  mips64el   |        valgrind-3.22.0         | NOK | http://autobuild.buildroot.net/results/afb766d67871599566f8f1fa1b5aecc8853faf04 | ORPH


Classification of failures by reason for 2023.02.x
--------------------------------------------------

               host-go-1.20.12 | 2 
               host-runc-1.1.7 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        host-go-1.20.12         | NOK | http://autobuild.buildroot.net/results/8f2f9dba52232610c3d9ff657f50226490310f30 |     
    i686     |        host-go-1.20.12         | NOK | http://autobuild.buildroot.net/results/c3a4f9f73840b82fdd9596436d24ade239b9571b |     
  riscv64    |        host-runc-1.1.7         | NOK | http://autobuild.buildroot.net/results/b8171dde23b2e5bd77e179ab4410c29cc72231d8 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
