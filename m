Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB034E7D0D4
	for <buildroot@archiver.kernel.org>; Fri, 22 Sep 2023 06:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 199F761088;
	Fri, 22 Sep 2023 06:48:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 199F761088
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S8_5A3eXRbck; Fri, 22 Sep 2023 06:48:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39B2C61068;
	Fri, 22 Sep 2023 06:48:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39B2C61068
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DDE061BF290
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 06:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A00A6409FC
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 06:48:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A00A6409FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h7U6J0jJmve0 for <buildroot@lists.busybox.net>;
 Fri, 22 Sep 2023 06:48:19 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AADC04018E
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 06:48:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AADC04018E
Received: by mail.gandi.net (Postfix) with ESMTPSA id D3522E0012
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 06:48:15 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 22 Sep 2023 06:48:15 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20230922064820.A00A6409FC@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1695365295; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wLjj71Sr/RKaozGCX6tcAqPYDRIa0A4xp3i/WSsN9Nc=;
 b=YxDybPHbSE+nCzxC0tGzoaSMUiTdLZIj1gq3a8C7NLOaJmkTL/Py5/bbUrBGX+dTHRe8eR
 DD2MDWDEF3mqWtH/TzS8r0gW6zuC68dEG/Ly4T4jp+5Fn4Pvyb+KF2575G71G9/w0cdAqp
 GWU+KoRml+lV3ORunMsD8UaHMj+35BXWiDmUcqCwr87QGxnF0RRHsC4wzJWhoBDoCOiR/V
 Qj4XqpuhN7zfo0tDmN3t8lq4oktSpmNZXG/2xwa7TFgujXj4StJr1OwtMT2FKeDVFk7PpA
 t0kLVFDXMsowID+p/PTppIjrFJ+l6JT5Y9uJwt0qOiWaRP2tdmT811hMWjrG5Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YxDybPHb
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-09-21
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

Autobuild statistics for 2023-09-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  2  |  5  |  0  |  7  |
  2023.05.x  |  2  |  5  |  0  |  7  |
  2023.08.x  |  5  |  1  |  0  |  6  |
    master   | 39  | 24  |  0  | 63  |

Classification of failures by reason for master
-----------------------------------------------

                host-go-1.21.1 | 2 
                  linux-6.4.14 | 2 
                       unknown | 2 
                xenomai-3.0.10 | 2 
                    brltty-6.5 | 1 
                busybox-1.36.1 | 1 
                      ell-0.57 | 1 
                 erlang-26.0.2 | 1 
              fstrcmp-0.7.D001 | 1 
glibc-2.37-2-g9f8513dc64119... | 1 
  gobject-introspection-1.76.1 | 1 
         host-gcc-final-13.2.0 | 1 
        host-sentry-cli-2.20.3 | 1 
                libglvnd-1.4.0 | 1 
        ltp-testsuite-20230127 | 1 
               mariadb-10.11.4 | 1 
               openblas-0.3.24 | 1 
                  reaver-1.6.6 | 1 
             stress-ng-0.15.07 | 1 
                 wolfssl-5.6.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/fbb230a0b8c82b7803680505216de9119e35b72a |     
  riscv32    |         busybox-1.36.1         | NOK | http://autobuild.buildroot.net/results/149e7f5eca638ebd1055eb5d2c235ace5af48c90 | ORPH
   sh4aeb    |            ell-0.57            | NOK | http://autobuild.buildroot.net/results/9375229a0f8a1bbbf36bdaff43e0f8f544ee78a4 | ORPH
  aarch64    |         erlang-26.0.2          | NOK | http://autobuild.buildroot.net/results/1367ef5c316288c0a58c65e7f55cd88b729f1f6d |     
  powerpc    |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/7821f500e2911b5a1b0b4fac5bd55569c3489d18 |     
 powerpc64   | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/298ee7d65b6f418431cd1161f2b985d28244a59e |     
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/bd069df957e90a8e59ac4b29fda4d36460f1f098 | ORPH
microblazeel |     host-gcc-final-13.2.0      | NOK | http://autobuild.buildroot.net/results/d78ba77cf7f1dac682f0d6bb460f27f4a32427ba |     
    i686     |         host-go-1.21.1         | NOK | http://autobuild.buildroot.net/results/3533a9796d920dd4a59143a5c55e82ecacd74ed7 |     
   mips64    |         host-go-1.21.1         | NOK | http://autobuild.buildroot.net/results/f91130bd8df99d383d72d06b358d8b73a2d4012a |     
powerpc64le  |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/eb2aa9f5c4eae7f63f7a761af799b908463905bc |     
    arm      |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/fa0c5568a66e73e43e3eb4dc6d6fead6011a8ea6 | ORPH
    mips     |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/642e943bc49da876f4784090fdc3605f92bd476f | ORPH
    m68k     |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/05309509d72abae3bad93186eab533e69ee63062 | ORPH
   x86_64    |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/6fe953a989a83da67e7ec228ab1668998928ad11 |     
   mips64    |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/c292d7afa7b405ee92ffb8bb51af75db662dba52 | ORPH
    i686     |        openblas-0.3.24         | NOK | http://autobuild.buildroot.net/results/e46bf0ac78a73304aa3cb38c0b6583906f2221d4 |     
   arceb     |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/4adad9466f5792396b020ca48630e8e4349a6f19 |     
  mips64el   |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/e4f4f1547fb67cb84e5a21f790b5f8a0d9456d38 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/a97796d887c8942cc7fbaf0f2c4d6c9df56e3a41 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/6c7c38f84b5bf9f19aad2f904b781aa024b1ea64 |     
   mips64    |         wolfssl-5.6.3          | NOK | http://autobuild.buildroot.net/results/860978ffc68a181defe26cf642a3b0fb20848320 |     
    arm      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/7ea6b70604807be783380d94d157bafadbd95bcb |     
 powerpc64   |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/ea46344218562c2154acd9037085202e79de9713 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                    brltty-6.5 | 1 
              host-rust-1.67.1 | 1 
     linux-5.10.162-cip24-rt10 | 1 
              open62541-v1.3.4 | 1 
                  xvisor-0.3.1 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/b52ba34c077886edebdd5d34453ccfa2a3815c7c |     
  sparc64    |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/40c9227cdf60299fd9665386eab7f2f1544acf6c |     
  sparc64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/e28b1bc1d26d6935dc44f79b6a475fedf20b2e92 | ORPH
  riscv32    |        open62541-v1.3.4        | NOK | http://autobuild.buildroot.net/results/342a320eefc3f00867e014319598b89d8867be7e | ORPH
   x86_64    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/7c3af6de7b33759ef663225fba2a77c7db5987c5 |     


Classification of failures by reason for 2023.05.x
--------------------------------------------------

               host-go-1.19.13 | 2 
                       unknown | 2 
           python-orjson-3.8.4 | 1 


Detail of failures for 2023.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        host-go-1.19.13         | NOK | http://autobuild.buildroot.net/results/e277d635cf3133746ef561d05b8c01a024f884e7 |     
   mips64    |        host-go-1.19.13         | NOK | http://autobuild.buildroot.net/results/1a4ecf86d7e2dff4f6e96fc5e9834edb439bf198 |     
    mips     |      python-orjson-3.8.4       | NOK | http://autobuild.buildroot.net/results/90728d98f6ca9e816ee0b2193fc66b3097c1d612 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/1860a9ce55d0dfa18a9311d434cc72a169d2be06 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/684a5037217dd66d4f3a7e2641ddce94dfc3d165 |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

              host-rust-1.71.1 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/118344491f6addeea4de5e2ef5ac1c0476df2268 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
