Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81072C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 06:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E74F64091C;
	Sun,  3 Dec 2023 06:35:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E74F64091C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O_r8cwGBVIqZ; Sun,  3 Dec 2023 06:35:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15E854091F;
	Sun,  3 Dec 2023 06:35:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15E854091F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7C8901BF293
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 06:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3063D4091F
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 06:35:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3063D4091F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id adxj84OsM4Hk for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 06:35:36 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 520CB4091C
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 06:35:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 520CB4091C
Received: by mail.gandi.net (Postfix) with ESMTPSA id AE8921C000A
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 06:35:32 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 03 Dec 2023 06:35:32 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231203063538.3063D4091F@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1701585332; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MWc3vwYsc521dYcN1+2GRNXegdaFG3X4YPNpkv33ZkQ=;
 b=FifPMDjw7om8lYLOIj2nXWZFPECMLrox61VSJyj50EfoQTJkf34Yc+g/9kmNUNpX4j2yMp
 irsc9+No+PgNyk+NWAzFK3o/I3f/2JowQw4vOudk/HgnajF9OgYiIPk9EkZ9bm06Qq6bO8
 UgSyOfvWEzJcVm5lYJdzr18nuVsFxxPKsGwLSO6cmH974KJ9YJDFWfjV3P0wO/sGJYyEWV
 l0w/N6dksIB3tr5kxB728fuK6xtsKP3oMGujusKturAwRdHzNr4440ByLiOSZ58pUiAi53
 ulVkhi60vOkOXjRLCCBgEBeleLlYhcwYjP8X0ttNll6su8kaNbcxBtcEwzoRwg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FifPMDjw
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-12-02
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

Autobuild statistics for 2023-12-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  1  |  1  |  0  |  2  |
  2023.08.x  |  1  |  4  |  0  |  5  |
    master   | 36  | 27  |  0  | 63  |

Classification of failures by reason for master
-----------------------------------------------

                libressl-3.8.2 | 4 
  gobject-introspection-1.76.1 | 2 
              libarchive-3.7.2 | 2 
                   linux-6.6.3 | 2 
                     file-5.45 | 1 
glibc-2.38-27-g750a45a78390... | 1 
         host-gcc-final-11.4.0 | 1 
                host-go-1.21.4 | 1 
        host-sentry-cli-2.20.3 | 1 
              libostree-2023.7 | 1 
                libselinux-3.5 | 1 
     linux-5.10.162-cip24-rt10 | 1 
 Makefile:727: target-finalize | 1 
               mariadb-10.11.4 | 1 
               openblas-0.3.24 | 1 
                 opencv4-4.8.1 | 1 
                    putty-0.79 | 1 
    python-cryptography-39.0.2 | 1 
         python-rpds-py-0.12.0 | 1 
ulog-0389d243352255f6182326... | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |           file-5.45            | NOK | http://autobuild.buildroot.net/results/3bd70d6b7e53c64e7557b78921e36c7a14415f64 | ORPH
powerpc64le  | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/f9a334c26f650d7e3f33a69c0052610b8f9196c1 |     
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/be0a13374ca8254f86f66a7cf5d77d1337d112ee | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/f4ff296a2c9ebea878968d40279a3d49bbddc675 | ORPH
microblazeel |     host-gcc-final-11.4.0      | NOK | http://autobuild.buildroot.net/results/ea18efb20bbe30235aa4372ff2a9ba00406d2a9a |     
    i686     |         host-go-1.21.4         | NOK | http://autobuild.buildroot.net/results/55c5e5f018558f5ba1735accdb5d59bcde639198 |     
   xtensa    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/01fd67e979a40b009959aff0a5c3662fd4fe9745 |     
    arm      |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/24ab79d41239a3bddbb7b51fe1e8284f6137e5be |     
    mips     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/c337d4a28a28bd1f9549c2589de9cb6675c26c47 |     
  mips64el   |        libostree-2023.7        | NOK | http://autobuild.buildroot.net/results/38470213c86091d14c59716cddcccd555f875705 |     
   arceb     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/04b10b84937b53d7d5c6d8ef2607761e6d23bcf9 | ORPH
   mips64    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/00910279d264adf99560ea32f2c71a487e7e45b2 | ORPH
   arceb     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/95cf74948062fc5c9f1c30c3bb57fc6bc5b6e5e7 | ORPH
    arc      |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/0df11d44970a17300c9fff62d07ec793590af974 | ORPH
   mipsel    |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/ac76103b4f4bf06ccb3f8c279767d80cb87a2da8 |     
   nios2     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/c3ab887377fb208586204b828088564153e79fc4 | ORPH
   nios2     |          linux-6.6.3           | NOK | http://autobuild.buildroot.net/results/989b531004a01a9ecaa7a104c0232f21b1682b32 | ORPH
  mips64el   |          linux-6.6.3           | NOK | http://autobuild.buildroot.net/results/8d37333df7ad8da766960408f3c534cbfa27edcb | ORPH
  mips64el   | Makefile:727: target-finalize  | NOK | http://autobuild.buildroot.net/results/8aa78332738e8fd1d5c8ae5ca78820146b26459d |     
powerpc64le  |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/9cb577195aa939289102116df5a2eac03f0d5017 | ORPH
   mips64    |        openblas-0.3.24         | NOK | http://autobuild.buildroot.net/results/f2886f57b874d0a0d75f774422ba70aed7d6d520 |     
   armeb     |         opencv4-4.8.1          | NOK | http://autobuild.buildroot.net/results/87cdc604123c8ec34ee82bf11c40b96c8bc95ad0 |     
   armeb     |           putty-0.79           | NOK | http://autobuild.buildroot.net/results/d6d06b5aa0df070c3880399e044fb3cd3a830aec |     
   armeb     |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/39458087470211eba56e3d93d49c106f5c52b763 |     
   mipsel    |     python-rpds-py-0.12.0      | NOK | http://autobuild.buildroot.net/results/06c5d2bba21d9dfcc12d79e25d9160de2470ccd5 |     
 powerpc64   | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/dffc80d0e826e2160b1c9c810c37f5431ca0e9b5 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/500c58c193fdef1dccaee6ad1e71959de299fc4b |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

host-gcc-final-arc-2020.09-... | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     | host-gcc-final-arc-2020.09-... | NOK | http://autobuild.buildroot.net/results/e7715f7b2c846f569a4004e8f69a202678af709f |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                elfutils-0.189 | 1 
                  linux-6.4.16 | 1 
                tpm2-tss-3.2.2 | 1 
                 wolfssl-5.6.4 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/6ffbbb81161aaf646e6257c887e7506a6c9ff653 | ORPH
   x86_64    |          linux-6.4.16          | NOK | http://autobuild.buildroot.net/results/db4408663519873ac7747ef40e83cfdd4f726990 | ORPH
   s390x     |         tpm2-tss-3.2.2         | NOK | http://autobuild.buildroot.net/results/019b248d250b5843907078b32872b8e7bcf3f550 | ORPH
  mips64el   |         wolfssl-5.6.4          | NOK | http://autobuild.buildroot.net/results/327d08a35a68a338a85bfd3cad9571232beb04d5 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
